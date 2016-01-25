Received: by 10.25.159.19 with SMTP id i19csp1277445lfe;
        Mon, 25 Jan 2016 06:26:39 -0800 (PST)
X-Received: by 10.31.162.200 with SMTP id l191mr11304913vke.69.1453731999873;
        Mon, 25 Jan 2016 06:26:39 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x236.google.com (mail-vk0-x236.google.com. [2607:f8b0:400c:c05::236])
        by mx.google.com with ESMTPS id o196si18287976vkd.63.2016.01.25.06.26.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Jan 2016 06:26:39 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::236 as permitted sender) client-ip=2607:f8b0:400c:c05::236;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::236 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-vk0-x236.google.com with SMTP id k1so74367527vkb.2
        for <alex.bennee@linaro.org>; Mon, 25 Jan 2016 06:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=loTJi25A3t90lQ9oQYmmACa8vsOeDVLM+Rjb9IElHBk=;
        b=YquTUoglQXhsFebEl1zIPd8PYW61mZ3LFWLcxZDd9gLMJlfGvciPajlifjkXiYxCJT
         Wb19Yj2PF4CE7RBhb1x4CZo8UxtzZIBTO09KoL3l54C1Hd2rfc+13PvSHd2whpuPKErW
         t+boQxzf9LomYlPxbPr8Vc9CwsMKTL8EdhUCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=loTJi25A3t90lQ9oQYmmACa8vsOeDVLM+Rjb9IElHBk=;
        b=NIX6f4KYYTyjYbw63qwtI5Ab7X6XjLvYdnaIycu5xSuU+ApBpeGznIbRcmTwKPMr+7
         N2MZNievGMfm4UmZS3K0QA13oJ2LKXa0HRQZEwDNvASrB7qynYJHJl9xmd5o9zJdyQPd
         nIIP3m+2NJS7Ukf9BD68r+1eSeNe8fFJAKQ9fWPyBWFQW8kukUXkqgIjl6zwFblyK1KW
         gyQaLZSkI4i+dUInPzKtMN9clmA5dkPJ896QogMVzlpall231jgGsNKKNSVWCTT4eL3u
         c1F0ONiXUVvQiDQQsZBqY3RJW6cccdmFVCvNMaXhNvTHxFUPvF8cjRbKosdIc2gxBFMd
         9r1w==
X-Gm-Message-State: AG10YOT1UHQCtI2LPZdhIiGefoUqdrCUab91H1jd80VxMhzY79MisfEv4x8lCrP/HOcxed0y9jIOdLDglCSY2eM7IiA=
X-Received: by 10.31.52.147 with SMTP id b141mr10807910vka.82.1453731999506;
 Mon, 25 Jan 2016 06:26:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Mon, 25 Jan 2016 06:26:20 -0800 (PST)
In-Reply-To: <1453130204-655-4-git-send-email-eric.auger@linaro.org>
References: <1453130204-655-1-git-send-email-eric.auger@linaro.org> <1453130204-655-4-git-send-email-eric.auger@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jan 2016 14:26:20 +0000
Message-ID: <CAFEAcA8xCQ2XaYvFXLFK8S89vWaBmoExmDq42WQzj3QOw86Ayg@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] device_tree: introduce qemu_fdt_node_path
To: Eric Auger <eric.auger@linaro.org>
Cc: eric.auger@st.com, QEMU Developers <qemu-devel@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, David Gibson <david@gibson.dropbear.id.au>, 
	Alex Williamson <alex.williamson@redhat.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Peter Crosthwaite <crosthwaitepeter@gmail.com>, 
	Patch Tracking <patches@linaro.org>, Christoffer Dall <christoffer.dall@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Baptiste Reynal <b.reynal@virtualopensystems.com>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, thomas.lendacky@amd.com
Content-Type: text/plain; charset=UTF-8
X-TUID: catfeExrK/Gb

On 18 January 2016 at 15:16, Eric Auger <eric.auger@linaro.org> wrote:
> This new helper routine returns a NULL terminated array of
> node paths matching a node name and a compat string.
>
> Signed-off-by: Eric Auger <eric.auger@linaro.org>
>
> ---
>
> v4 -> v5:
> - support the case where several nodes exist, ie.
>   return an array of node paths. Also add Error **
>   parameter
>
> v1 -> v2:
> - move doc comment in header file
> - do not use a fixed size buffer
> - break on errors in while loop
> - use strcmp instead of strncmp
>
> RFC -> v1:
> - improve error handling according to Alex' comments
> ---
>  device_tree.c                | 49 ++++++++++++++++++++++++++++++++++++++++++++
>  include/sysemu/device_tree.h | 14 +++++++++++++
>  2 files changed, 63 insertions(+)
>
> diff --git a/device_tree.c b/device_tree.c
> index b262c2d..3c88a37 100644
> --- a/device_tree.c
> +++ b/device_tree.c
> @@ -231,6 +231,55 @@ static int findnode_nofail(void *fdt, const char *node_path)
>      return offset;
>  }
>
> +char **qemu_fdt_node_path(void *fdt, const char *name, char *compat,
> +                          Error **errp)
> +{
> +    int offset, len, ret;
> +    const char *iter_name;
> +    unsigned int path_len = 16, n = 0;
> +    GSList *path_list = NULL, *iter;
> +    char **path_array;
> +
> +    offset = fdt_node_offset_by_compatible(fdt, -1, compat);
> +
> +    while (offset >= 0) {
> +        iter_name = fdt_get_name(fdt, offset, &len);
> +        if (!iter_name) {
> +            offset = len;
> +            break;
> +        }
> +        if (!strcmp(iter_name, name)) {
> +            char *path;
> +
> +            path = g_malloc(path_len);
> +            while ((ret = fdt_get_path(fdt, offset, path, path_len))
> +                  == -FDT_ERR_NOSPACE) {
> +                path_len += 16;
> +                path = g_realloc(path, path_len);
> +            }
> +            path_list = g_slist_prepend(path_list, path);
> +            n++;
> +        }
> +        offset = fdt_node_offset_by_compatible(fdt, offset, compat);
> +    }
> +
> +    if (offset < 0 && offset != -FDT_ERR_NOTFOUND) {
> +        error_setg(errp, "%s: abort parsing dt for %s/%s: %s",
> +                   __func__, name, compat, fdt_strerror(offset));

Needs to bail out (freeing memory).

> +    }
> +
> +    path_array = g_new(char *, n + 1);
> +    path_array[n--] = NULL;

0, or '\0'. NULL is a pointer, not the NUL character. (This is a
style issue, not a correctness one.)

> +
> +    for (iter = path_list; iter; iter = iter->next) {
> +        path_array[n--] = iter->data;
> +    }
> +
> +    g_slist_free(path_list);
> +
> +    return path_array;
> +}
> +
>  int qemu_fdt_setprop(void *fdt, const char *node_path,
>                       const char *property, const void *val, int size)
>  {
> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
> index fdf25a4..436b5dd 100644
> --- a/include/sysemu/device_tree.h
> +++ b/include/sysemu/device_tree.h
> @@ -20,6 +20,20 @@ void *load_device_tree(const char *filename_path, int *sizep);
>  void *load_device_tree_from_sysfs(void);
>  #endif
>
> +/**
> + * qemu_fdt_node_path: return the paths of nodes matching a given
> + * name and compat string
> + * @fdt: pointer to the dt blob
> + * @name: node name
> + * @compat: compatibility string
> + * @errp: handle to an error object
> + *
> + * returns a newly allocated NULL-terminated array of node paths.

Should say what we return on error (NULL ?)

> + * Use g_strfreev() to free it.
> + */
> +char **qemu_fdt_node_path(void *fdt, const char *name, char *compat,
> +                          Error **errp);
> +
>  int qemu_fdt_setprop(void *fdt, const char *node_path,
>                       const char *property, const void *val, int size);
>  int qemu_fdt_setprop_cell(void *fdt, const char *node_path,
> --
> 1.9.1
>

thanks
-- PMM
