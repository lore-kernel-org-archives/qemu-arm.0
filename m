Received: by 10.25.159.19 with SMTP id i19csp278971lfe;
        Mon, 11 Jan 2016 19:58:16 -0800 (PST)
X-Received: by 10.66.102.73 with SMTP id fm9mr132891667pab.32.1452571096620;
        Mon, 11 Jan 2016 19:58:16 -0800 (PST)
Return-Path: <crosthwaitepeter@gmail.com>
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com. [2607:f8b0:400e:c00::244])
        by mx.google.com with ESMTPS id o81si32995879pfi.9.2016.01.11.19.58.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Jan 2016 19:58:16 -0800 (PST)
Received-SPF: pass (google.com: domain of crosthwaitepeter@gmail.com designates 2607:f8b0:400e:c00::244 as permitted sender) client-ip=2607:f8b0:400e:c00::244;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of crosthwaitepeter@gmail.com designates 2607:f8b0:400e:c00::244 as permitted sender) smtp.mailfrom=crosthwaitepeter@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-pf0-x244.google.com with SMTP id 65so4330522pff.2;
        Mon, 11 Jan 2016 19:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=RwBvDxcK2B86ldbi9zp+hwA8VwudIHDKQJ6KXaXrMYU=;
        b=YvaAQvpGgzIVCXyEZeL0LL0llmkT04Lzy8G8mdMw09+fHBgveB6gUVoGVQb0/mWo48
         E5meqoMyesPFu+r5YIBEEO6NCDwDIsmIKiBdo1m87EDiF4qUU33o1TTJTjlfPbZX7W1S
         JkAtP5910bOtqL/Ft6MhG1h1m5Qa0ocU9mWGO3EwXbaWT56DkEdG6xr7jcKkTKlJHR2+
         IU0zUTWFq8gRVDjopelPwg/QgM2kfqa+GRkUr2SyVRLMgsa3eeOK3D4lD2QEsZ2w4/Ab
         aiavWQ7l51Cwtk7WkG2Byx0itsxulhRglkzomO+gRY/O2D++55a3vepA7tArbOtQhvgy
         gEYw==
X-Received: by 10.98.69.93 with SMTP id s90mr30782778pfa.77.1452571096059;
        Mon, 11 Jan 2016 19:58:16 -0800 (PST)
Return-Path: <crosthwaitepeter@gmail.com>
Received: from pcrost-box (c-73-70-184-119.hsd1.ca.comcast.net. [73.70.184.119])
        by smtp.gmail.com with ESMTPSA id l14sm26403332pfb.73.2016.01.11.19.58.14
        (version=TLSv1/SSLv3 cipher=OTHER);
        Mon, 11 Jan 2016 19:58:15 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Mon, 11 Jan 2016 19:58:12 -0800
To: Eric Auger <eric.auger@linaro.org>
Cc: eric.auger@st.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	peter.maydell@linaro.org, david@gibson.dropbear.id.au,
	alex.williamson@redhat.com, alex.bennee@linaro.org,
	thuth@redhat.com, crosthwaitepeter@gmail.com, patches@linaro.org,
	christoffer.dall@linaro.org, pbonzini@redhat.com,
	b.reynal@virtualopensystems.com, suravee.suthikulpanit@amd.com,
	thomas.lendacky@amd.com
Subject: Re: [PATCH v4 4/8] device_tree: qemu_fdt_getprop converted to use
 the error API
Message-ID: <20160112035812.GE3308@pcrost-box>
References: <1452245525-3886-1-git-send-email-eric.auger@linaro.org>
 <1452245525-3886-5-git-send-email-eric.auger@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1452245525-3886-5-git-send-email-eric.auger@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TUID: wTKSYiIxB4Ir

On Fri, Jan 08, 2016 at 09:32:01AM +0000, Eric Auger wrote:
> Current qemu_fdt_getprop exits if the property is not found. It is
> sometimes needed to read an optional property, in which case we do
> not wish to exit but simply returns a null value.
> 
> This patch converts qemu_fdt_getprop to accept an Error **, and existing
> users are converted to pass &error_fatal. This preserves the existing
> behaviour. Then to use the API with your optional semantic a null
> parameter can be conveyed.
> 
> Signed-off-by: Eric Auger <eric.auger@linaro.org>

Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

> 
> ---
> 
> v1 -> v2:
> - add a doc comment in the header file
> 
> RFC -> v1:
> - get rid of qemu_fdt_getprop_optional and implement Peter's suggestion
>   that consists in using the error API
> 
> Signed-off-by: Eric Auger <eric.auger@linaro.org>
> ---
>  device_tree.c                | 11 ++++++-----
>  include/sysemu/device_tree.h | 15 ++++++++++++++-
>  2 files changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/device_tree.c b/device_tree.c
> index 8441e01..6ecc9da 100644
> --- a/device_tree.c
> +++ b/device_tree.c
> @@ -321,18 +321,18 @@ int qemu_fdt_setprop_string(void *fdt, const char *node_path,
>  }
>  
>  const void *qemu_fdt_getprop(void *fdt, const char *node_path,
> -                             const char *property, int *lenp)
> +                             const char *property, int *lenp, Error **errp)
>  {
>      int len;
>      const void *r;
> +
>      if (!lenp) {
>          lenp = &len;
>      }
>      r = fdt_getprop(fdt, findnode_nofail(fdt, node_path), property, lenp);
>      if (!r) {
> -        error_report("%s: Couldn't get %s/%s: %s", __func__,
> -                     node_path, property, fdt_strerror(*lenp));
> -        exit(1);
> +        error_setg(errp, "%s: Couldn't get %s/%s: %s", __func__,
> +                  node_path, property, fdt_strerror(*lenp));
>      }
>      return r;
>  }
> @@ -341,7 +341,8 @@ uint32_t qemu_fdt_getprop_cell(void *fdt, const char *node_path,
>                                 const char *property)
>  {
>      int len;
> -    const uint32_t *p = qemu_fdt_getprop(fdt, node_path, property, &len);
> +    const uint32_t *p = qemu_fdt_getprop(fdt, node_path, property, &len,
> +                                         &error_fatal);
>      if (len != 4) {
>          error_report("%s: %s/%s not 4 bytes long (not a cell?)",
>                       __func__, node_path, property);
> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
> index 269cb1c..4d7cbb9 100644
> --- a/include/sysemu/device_tree.h
> +++ b/include/sysemu/device_tree.h
> @@ -45,8 +45,21 @@ int qemu_fdt_setprop_string(void *fdt, const char *node_path,
>  int qemu_fdt_setprop_phandle(void *fdt, const char *node_path,
>                               const char *property,
>                               const char *target_node_path);
> +/**
> + * qemu_fdt_getprop: retrieve the value of a given property
> + * @fdt: pointer to the device tree blob
> + * @node_path: node path
> + * @property: name of the property to find
> + * @lenp: fdt error if any or length of the property on success
> + * @errp: handle to an error object
> + *
> + * returns a pointer to the property on success and NULL on failure
> + * in case errp is set to &error_fatal, the function auto-asserts
> + * on error (legacy behavior)
> + */
>  const void *qemu_fdt_getprop(void *fdt, const char *node_path,
> -                             const char *property, int *lenp);
> +                             const char *property, int *lenp,
> +                             Error **errp);
>  uint32_t qemu_fdt_getprop_cell(void *fdt, const char *node_path,
>                                 const char *property);
>  uint32_t qemu_fdt_get_phandle(void *fdt, const char *path);
> -- 
> 1.9.1
> 
