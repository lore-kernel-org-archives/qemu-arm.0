Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id lx4sm27998287wjb.5.2015.11.26.05.13.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2015 05:13:25 -0800 (PST)
Received: from zen.linaro.local (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id A68DC3E0146;
	Thu, 26 Nov 2015 13:13:24 +0000 (GMT)
References: <1447946528-1533-1-git-send-email-eric.auger@linaro.org> <1447946528-1533-5-git-send-email-eric.auger@linaro.org>
User-agent: mu4e 0.9.15; emacs 24.5.50.4
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Eric Auger <eric.auger@linaro.org>
Cc: eric.auger@st.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.williamson@redhat.com, peter.maydell@linaro.org, thomas.lendacky@amd.com, b.reynal@virtualopensystems.com, patches@linaro.org, suravee.suthikulpanit@amd.com, pbonzini@redhat.com, christoffer.dall@linaro.org
Subject: Re: [Qemu-devel] [RESEND RFC 4/6] device_tree: introduce qemu_fdt_getprop_optional
In-reply-to: <1447946528-1533-5-git-send-email-eric.auger@linaro.org>
Date: Thu, 26 Nov 2015 13:13:24 +0000
Message-ID: <87y4dkc39n.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: /6Nx7nJHp6iP


Eric Auger <eric.auger@linaro.org> writes:

> Current qemu_fdt_getprop exits if the property is not found. It is
> sometimes needed to read an optional property, in which case we do
> not wish to exit but simply returns a null value.
>
> This is what this new qemu_fdt_getprop_optional function does.
>
> Signed-off-by: Eric Auger <eric.auger@linaro.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

> ---
>  device_tree.c                | 17 +++++++++++++++++
>  include/sysemu/device_tree.h |  2 ++
>  2 files changed, 19 insertions(+)
>
> diff --git a/device_tree.c b/device_tree.c
> index f184e3c..a318683 100644
> --- a/device_tree.c
> +++ b/device_tree.c
> @@ -280,6 +280,23 @@ const void *qemu_fdt_getprop(void *fdt, const char *node_path,
>      return r;
>  }
>
> +const void *qemu_fdt_getprop_optional(void *fdt, const char *node_path,
> +                             const char *property, bool optional, int *lenp)
> +{
> +    int len;
> +    const void *r;
> +    if (!lenp) {
> +        lenp = &len;
> +    }
> +    r = fdt_getprop(fdt, findnode_nofail(fdt, node_path), property, lenp);
> +    if (!r && !optional) {
> +        error_report("%s: Couldn't get %s/%s: %s", __func__,
> +                     node_path, property, fdt_strerror(*lenp));
> +        exit(1);
> +    }
> +    return r;
> +}
> +
>  uint32_t qemu_fdt_getprop_cell(void *fdt, const char *node_path,
>                                 const char *property)
>  {
> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
> index f9e6e6e..10cbe8e 100644
> --- a/include/sysemu/device_tree.h
> +++ b/include/sysemu/device_tree.h
> @@ -34,6 +34,8 @@ int qemu_fdt_setprop_phandle(void *fdt, const char *node_path,
>                               const char *target_node_path);
>  const void *qemu_fdt_getprop(void *fdt, const char *node_path,
>                               const char *property, int *lenp);
> +const void *qemu_fdt_getprop_optional(void *fdt, const char *node_path,
> +                             const char *property, bool optional, int *lenp);
>  uint32_t qemu_fdt_getprop_cell(void *fdt, const char *node_path,
>                                 const char *property);
>  uint32_t qemu_fdt_get_phandle(void *fdt, const char *path);


--
Alex Bennée
