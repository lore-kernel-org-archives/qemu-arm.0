Received: by 10.25.159.19 with SMTP id i19csp279089lfe;
        Mon, 11 Jan 2016 19:58:45 -0800 (PST)
X-Received: by 10.98.8.132 with SMTP id 4mr31481231pfi.51.1452571125662;
        Mon, 11 Jan 2016 19:58:45 -0800 (PST)
Return-Path: <crosthwaitepeter@gmail.com>
Received: from mail-pa0-x241.google.com (mail-pa0-x241.google.com. [2607:f8b0:400e:c03::241])
        by mx.google.com with ESMTPS id c10si44681419pat.36.2016.01.11.19.58.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Jan 2016 19:58:45 -0800 (PST)
Received-SPF: pass (google.com: domain of crosthwaitepeter@gmail.com designates 2607:f8b0:400e:c03::241 as permitted sender) client-ip=2607:f8b0:400e:c03::241;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of crosthwaitepeter@gmail.com designates 2607:f8b0:400e:c03::241 as permitted sender) smtp.mailfrom=crosthwaitepeter@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-pa0-x241.google.com with SMTP id gi1so32636739pac.2;
        Mon, 11 Jan 2016 19:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=tG1PnXhj65x3SlVQw8RxX+ItVSamhzGNM7ePP7mqqHU=;
        b=KSAxo+W03vn1ei0P0u+mtL8/NMVVQ6JS08vDgJKze+M1D5UNrB1FHgkDR9c2Ctn//A
         wLkPj2mEPmkQ2KTgxSeAgr0DHdFMlKJtAkZqmjWYTnj2bpJRG405kh5YnPXRAaepFTbz
         uvVWDXL/Csta7H3oqSYtnYEHKJK9/kB7Bv4nGLmwNr18J2LrDherevtO4izrQklCHttG
         P+tZvS2Ic9e5DFOcMPa6D0xe1Xt9gs4CC82Tetrk+jnDqYXw99ajrQgDj/aYzsEPjBQa
         KHt4PxbJbBiC4eUxCAlpaPRBRVoIg7cBrqc+k6ea62T2fa1zw6j4MOHnyFo5JsS2y5WR
         zKuA==
X-Received: by 10.66.156.226 with SMTP id wh2mr184828875pab.95.1452571124737;
        Mon, 11 Jan 2016 19:58:44 -0800 (PST)
Return-Path: <crosthwaitepeter@gmail.com>
Received: from pcrost-box (c-73-70-184-119.hsd1.ca.comcast.net. [73.70.184.119])
        by smtp.gmail.com with ESMTPSA id cq4sm73123344pad.28.2016.01.11.19.58.42
        (version=TLSv1/SSLv3 cipher=OTHER);
        Mon, 11 Jan 2016 19:58:43 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Mon, 11 Jan 2016 19:58:40 -0800
To: Eric Auger <eric.auger@linaro.org>
Cc: eric.auger@st.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	peter.maydell@linaro.org, david@gibson.dropbear.id.au,
	alex.williamson@redhat.com, alex.bennee@linaro.org,
	thuth@redhat.com, crosthwaitepeter@gmail.com, patches@linaro.org,
	christoffer.dall@linaro.org, pbonzini@redhat.com,
	b.reynal@virtualopensystems.com, suravee.suthikulpanit@amd.com,
	thomas.lendacky@amd.com
Subject: Re: [PATCH v4 5/8] device_tree: qemu_fdt_getprop_cell converted to
 use the error API
Message-ID: <20160112035840.GF3308@pcrost-box>
References: <1452245525-3886-1-git-send-email-eric.auger@linaro.org>
 <1452245525-3886-6-git-send-email-eric.auger@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1452245525-3886-6-git-send-email-eric.auger@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TUID: n5lXEcow3FNw

On Fri, Jan 08, 2016 at 09:32:02AM +0000, Eric Auger wrote:
> This patch aligns the prototype with qemu_fdt_getprop. The caller
> can choose whether the function self-asserts on error (passing
> &error_fatal as Error ** argument, corresponding to the legacy behavior),
> or behaves differently such as simply output a message.
> 
> In this later case the caller can use the new lenp parameter to interpret
> the error if any.
> 
> Signed-off-by: Eric Auger <eric.auger@linaro.org>
> 
> ---
> 
> v3 : creation
> ---
>  device_tree.c                | 21 ++++++++++++++-------
>  hw/arm/boot.c                |  6 ++++--
>  hw/arm/vexpress.c            |  6 ++++--
>  include/sysemu/device_tree.h | 16 +++++++++++++++-
>  4 files changed, 37 insertions(+), 12 deletions(-)
> 
> diff --git a/device_tree.c b/device_tree.c
> index 6ecc9da..0e837bf 100644
> --- a/device_tree.c
> +++ b/device_tree.c
> @@ -338,15 +338,22 @@ const void *qemu_fdt_getprop(void *fdt, const char *node_path,
>  }
>  
>  uint32_t qemu_fdt_getprop_cell(void *fdt, const char *node_path,
> -                               const char *property)
> +                               const char *property, int *lenp, Error **errp)
>  {
>      int len;
> -    const uint32_t *p = qemu_fdt_getprop(fdt, node_path, property, &len,
> -                                         &error_fatal);
> -    if (len != 4) {
> -        error_report("%s: %s/%s not 4 bytes long (not a cell?)",
> -                     __func__, node_path, property);
> -        exit(1);
> +    const uint32_t *p;
> +
> +    if (!lenp) {
> +        lenp = &len;
> +    }
> +    p = qemu_fdt_getprop(fdt, node_path, property, lenp, errp);
> +    if (!p) {
> +        return 0;
> +    } else if (*lenp != 4) {
> +        error_setg(errp, "%s: %s/%s not 4 bytes long (not a cell?)",
> +                   __func__, node_path, property);
> +        *lenp = -EINVAL;
> +        return 0;
>      }
>      return be32_to_cpu(*p);
>  }
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 75f69bf..541b74c 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -386,8 +386,10 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>          return 0;
>      }
>  
> -    acells = qemu_fdt_getprop_cell(fdt, "/", "#address-cells");
> -    scells = qemu_fdt_getprop_cell(fdt, "/", "#size-cells");
> +    acells = qemu_fdt_getprop_cell(fdt, "/", "#address-cells",
> +                                   NULL, &error_fatal);
> +    scells = qemu_fdt_getprop_cell(fdt, "/", "#size-cells",
> +                                   NULL, &error_fatal);
>      if (acells == 0 || scells == 0) {
>          fprintf(stderr, "dtb file invalid (#address-cells or #size-cells 0)\n");
>          goto fail;
> diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
> index 058abbd..ffe42be 100644
> --- a/hw/arm/vexpress.c
> +++ b/hw/arm/vexpress.c
> @@ -482,8 +482,10 @@ static void vexpress_modify_dtb(const struct arm_boot_info *info, void *fdt)
>      uint32_t acells, scells, intc;
>      const VEDBoardInfo *daughterboard = (const VEDBoardInfo *)info;
>  
> -    acells = qemu_fdt_getprop_cell(fdt, "/", "#address-cells");
> -    scells = qemu_fdt_getprop_cell(fdt, "/", "#size-cells");
> +    acells = qemu_fdt_getprop_cell(fdt, "/", "#address-cells",
> +                                   NULL, &error_fatal);
> +    scells = qemu_fdt_getprop_cell(fdt, "/", "#size-cells",
> +                                   NULL, &error_fatal);
>      intc = find_int_controller(fdt);
>      if (!intc) {
>          /* Not fatal, we just won't provide virtio. This will
> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
> index 4d7cbb9..5aa750b 100644
> --- a/include/sysemu/device_tree.h
> +++ b/include/sysemu/device_tree.h
> @@ -60,8 +60,22 @@ int qemu_fdt_setprop_phandle(void *fdt, const char *node_path,
>  const void *qemu_fdt_getprop(void *fdt, const char *node_path,
>                               const char *property, int *lenp,
>                               Error **errp);
> +/**
> + * qemu_fdt_getprop_cell: retrieve the value of a given 4 byte property
> + * @fdt: pointer to the device tree blob
> + * @node_path: node path
> + * @property: name of the property to find
> + * @lenp: fdt error if any or -EINVAL if the property size is different from
> + *        4 bytes, or 4 (expected length of the property) upon success.
> + * @errp: handle to an error object
> + *
> + * returns the property value on success
> + * in case errp is set to &error_fatal, the function auto-asserts
> + * on error (legacy behavior)

Avoid re-documenting the semantics of the Error API, as this comment
may silently go stale with a patch to the Error API. The function now simply
accepts an Error ** and that implies the behaviour of error_fatal. With very
few callers there is not much of a legacy to document and it is not a user
visible legacy anyway.

Otherwise:

Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

Regards,
Peter

> + */
>  uint32_t qemu_fdt_getprop_cell(void *fdt, const char *node_path,
> -                               const char *property);
> +                               const char *property, int *lenp,
> +                               Error **errp);
>  uint32_t qemu_fdt_get_phandle(void *fdt, const char *path);
>  uint32_t qemu_fdt_alloc_phandle(void *fdt);
>  int qemu_fdt_nop_node(void *fdt, const char *node_path);
> -- 
> 1.9.1
> 
