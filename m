Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 143sm2415112wmv.18.2015.11.26.04.06.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2015 04:06:14 -0800 (PST)
Received: from zen.linaro.local (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id E1D013E0146;
	Thu, 26 Nov 2015 12:06:13 +0000 (GMT)
References: <1447946528-1533-1-git-send-email-eric.auger@linaro.org> <1447946528-1533-4-git-send-email-eric.auger@linaro.org>
User-agent: mu4e 0.9.15; emacs 24.5.50.4
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Eric Auger <eric.auger@linaro.org>
Cc: eric.auger@st.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.williamson@redhat.com, peter.maydell@linaro.org, thomas.lendacky@amd.com, b.reynal@virtualopensystems.com, patches@linaro.org, suravee.suthikulpanit@amd.com, pbonzini@redhat.com, christoffer.dall@linaro.org
Subject: Re: [Qemu-devel] [RESEND RFC 3/6] device_tree: introduce qemu_fdt_node_path
In-reply-to: <1447946528-1533-4-git-send-email-eric.auger@linaro.org>
Date: Thu, 26 Nov 2015 12:06:13 +0000
Message-ID: <8737vtyngq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: WGKIbmM0t1Wx


Eric Auger <eric.auger@linaro.org> writes:

> This new helper routine returns the node path of a device
> referred to by its name and compat string.
>
> Signed-off-by: Eric Auger <eric.auger@linaro.org>
> ---
>  device_tree.c                | 40 ++++++++++++++++++++++++++++++++++++++++
>  include/sysemu/device_tree.h |  3 +++
>  2 files changed, 43 insertions(+)
>
> diff --git a/device_tree.c b/device_tree.c
> index 58a5329..f184e3c 100644
> --- a/device_tree.c
> +++ b/device_tree.c
> @@ -171,6 +171,46 @@ static int findnode_nofail(void *fdt, const char *node_path)
>      return offset;
>  }
>
> +/**
> + * qemu_fdt_node_path
> + *
> + * return the node path of a device, referred to by its node name
> + * and its compat string
> + * fdt: pointer to the dt blob
> + * name: name of the device
> + * compat: compatibility string of the device
> + *
> + * returns the node path
> + */
> +int qemu_fdt_node_path(void *fdt, const char *name, char *compat,
> +                       char **node_path)
> +{
> +    int offset = 0, len;
> +    const char *iter_name;
> +    char path[256];
> +    int ret;
> +
> +    *node_path = NULL;
> +    while (1) {
> +        offset = fdt_node_offset_by_compatible(fdt, offset, compat);
> +        if (offset == -FDT_ERR_NOTFOUND) {

Is this not the only error code fdt_node_offset_by_compatible() won't
return?

> +            break;
> +        }
> +        iter_name = fdt_get_name(fdt, offset, &len);
> +        if (!strncmp(iter_name, name, len)) {

is it possible for fdt_get_name to fail here and give you NULL and -len?

> +            goto found;
> +        }
> +    }
> +    return offset;
> +
> +found:
> +    ret = fdt_get_path(fdt, offset, path, 256);
> +    if (!ret) {
> +        *node_path = g_strdup(path);
> +    }
> +    return ret;
> +}
> +
>  int qemu_fdt_setprop(void *fdt, const char *node_path,
>                       const char *property, const void *val, int size)
>  {
> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
> index 307e53d..f9e6e6e 100644
> --- a/include/sysemu/device_tree.h
> +++ b/include/sysemu/device_tree.h
> @@ -18,6 +18,9 @@ void *create_device_tree(int *sizep);
>  void *load_device_tree(const char *filename_path, int *sizep);
>  void *load_device_tree_from_sysfs(void);
>
> +int qemu_fdt_node_path(void *fdt, const char *name, char *compat,
> +                       char **node_path);
> +
>  int qemu_fdt_setprop(void *fdt, const char *node_path,
>                       const char *property, const void *val, int size);
>  int qemu_fdt_setprop_cell(void *fdt, const char *node_path,


--
Alex Bennée
