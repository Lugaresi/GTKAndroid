#include <glib.h>

/**
 * g_ptr_array_copy:
 * @array: #GPtrArray to duplicate
 * @func: (nullable): a copy function used to copy every element in the array
 * @user_data: user data passed to the copy function @func, or %NULL
 *
 * Makes a full (deep) copy of a #GPtrArray.
 *
 * @func, as a #GCopyFunc, takes two arguments, the data to be copied
 * and a @user_data pointer. On common processor architectures, it's safe to
 * pass %NULL as @user_data if the copy function takes only one argument. You
 * may get compiler warnings from this though if compiling with GCC’s
 * `-Wcast-function-type` warning.
 *
 * If @func is %NULL, then only the pointers (and not what they are
 * pointing to) are copied to the new #GPtrArray.
 *
 * Returns: (transfer full): a deep copy of the initial #GPtrArray.
 *
 * Since: 2.62
 **/
GPtrArray *
g_ptr_array_copy (GPtrArray *array,
                  GCopyFunc  func,
                  gpointer   user_data)
{
  gsize i;
  GPtrArray *new_array;

  g_return_val_if_fail (array != NULL, NULL);

  new_array = g_ptr_array_sized_new (array->len);
  if (func != NULL)
    {
      for (i = 0; i < array->len; i++)
        new_array->pdata[i] = func (array->pdata[i], user_data);
    }
  else
    {
      memcpy (new_array->pdata, array->pdata,
              array->len * sizeof (*array->pdata));
    }

  return new_array;
}