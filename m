Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id b82sm4086935wmf.9.2015.11.25.07.38.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2015 07:38:49 -0800 (PST)
Received: from zen.linaro.local (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 888963E0146;
	Wed, 25 Nov 2015 15:38:48 +0000 (GMT)
References: <1447946528-1533-1-git-send-email-eric.auger@linaro.org> <1447946528-1533-3-git-send-email-eric.auger@linaro.org>
User-agent: mu4e 0.9.15; emacs 24.5.50.4
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Eric Auger <eric.auger@linaro.org>
Cc: eric.auger@st.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.williamson@redhat.com, peter.maydell@linaro.org, thomas.lendacky@amd.com, b.reynal@virtualopensystems.com, patches@linaro.org, suravee.suthikulpanit@amd.com, pbonzini@redhat.com, christoffer.dall@linaro.org
Subject: Re: [Qemu-devel] [RESEND RFC 2/6] device_tree: introduce load_device_tree_from_sysfs
In-reply-to: <1447946528-1533-3-git-send-email-eric.auger@linaro.org>
Date: Wed, 25 Nov 2015 15:38:48 +0000
Message-ID: <874mgaytpz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: sl0RFkw6lJ9N


Eric Auger <eric.auger@linaro.org> writes:

> This function returns the host device tree blob from sysfs
> (/sys/firmware/devicetree/base).
>
> This has a runtime dependency on the dtc binary. This functionality
> is useful for platform device passthrough where the host device tree
> needs to be parsed to feed information into the guest device tree.
>
> Signed-off-by: Eric Auger <eric.auger@linaro.org>
> ---
>  device_tree.c                | 40 ++++++++++++++++++++++++++++++++++++++++
>  include/sysemu/device_tree.h |  1 +
>  2 files changed, 41 insertions(+)
>
> diff --git a/device_tree.c b/device_tree.c
> index a9f5f8e..58a5329 100644
> --- a/device_tree.c
> +++ b/device_tree.c
> @@ -117,6 +117,46 @@ fail:
>      return NULL;
>  }
>
> +/**
> + * load_device_tree_from_sysfs
> + *
> + * extract the dt blob from host sysfs
> + * this has a runtime dependency on the dtc binary
> + */
> +void *load_device_tree_from_sysfs(void)
> +{
> +    char cmd[] = "dtc -I fs -O dtb /sys/firmware/devicetree/base";
> +    FILE *pipe;
> +    void *fdt;
> +    int ret, actual_dt_size;
> +
> +    pipe = popen(cmd, "r");
> +    if (!pipe) {
> +        error_report("%s: Error when executing dtc", __func__);
> +        return NULL;
> +    }
> +    fdt = g_malloc0(FDT_MAX_SIZE);
> +    actual_dt_size = fread(fdt, 1, FDT_MAX_SIZE, pipe);
> +    pclose(pipe);

I think this looks OK but I'm wary of anything that calls out to a
external script. However it seems the other popen() case is for
migration and that looks as though it will get removed by the IO Channel
framework stuff.

There may be millage in using g_spawn_sync() as it will return you an
automatically sized buffer.

> +
> +    if (actual_dt_size == 0) {
> +        error_report("%s: could not copy host device tree in memory: %m",
> +                     __func__);
> +        goto fail;
> +    }
> +    ret = fdt_check_header(fdt);
> +    if (ret) {
> +        error_report("%s: Host dt file loaded into memory is invalid: %s",
> +                     __func__, fdt_strerror(ret));
> +        goto fail;
> +    }
> +    return fdt;
> +
> +fail:
> +    g_free(fdt);
> +    return NULL;
> +}
> +
>  static int findnode_nofail(void *fdt, const char *node_path)
>  {
>      int offset;
> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
> index 359e143..307e53d 100644
> --- a/include/sysemu/device_tree.h
> +++ b/include/sysemu/device_tree.h
> @@ -16,6 +16,7 @@
>
>  void *create_device_tree(int *sizep);
>  void *load_device_tree(const char *filename_path, int *sizep);
> +void *load_device_tree_from_sysfs(void);
>
>  int qemu_fdt_setprop(void *fdt, const char *node_path,
>                       const char *property, const void *val, int size);


--
Alex Bennée
