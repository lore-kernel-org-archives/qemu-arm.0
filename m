Received: by 10.182.158.201 with SMTP id ww9csp269642obb;
        Wed, 6 Jan 2016 16:20:49 -0800 (PST)
X-Received: by 10.194.85.165 with SMTP id i5mr123213058wjz.173.1452126049531;
        Wed, 06 Jan 2016 16:20:49 -0800 (PST)
Return-Path: <crosthwaitepeter@gmail.com>
Received: from mail-wm0-x235.google.com (mail-wm0-x235.google.com. [2a00:1450:400c:c09::235])
        by mx.google.com with ESMTPS id dh5si163016535wjc.151.2016.01.06.16.20.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Jan 2016 16:20:49 -0800 (PST)
Received-SPF: pass (google.com: domain of crosthwaitepeter@gmail.com designates 2a00:1450:400c:c09::235 as permitted sender) client-ip=2a00:1450:400c:c09::235;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of crosthwaitepeter@gmail.com designates 2a00:1450:400c:c09::235 as permitted sender) smtp.mailfrom=crosthwaitepeter@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-wm0-x235.google.com with SMTP id f206so99394006wmf.0;
        Wed, 06 Jan 2016 16:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=fpjjxUSwD52xeYlhIEwL1cvIjUmVr6SpVcY9Nm+s+LU=;
        b=cctzAAYgv3h0uExAbg7ExXsGKjeDTMuQ9/PTf20cF92/167m4B4eYbenItasCsNiFc
         so/Kh+OGEQxTQIM1ohBl6GwIVPeFXW2a6zh9k4Mi74tlk8s72pbA1/bjpRSg9aLZ2jMN
         FSUz/g1cUcmx1/zV821sWHLG532zxJeO5kcn0oju13aP2/nxVau8do8wKuf0MfG3447c
         ezvO5oAjJskEcIQ6ApndPbNRa9ZX9SG0X6q4jBW1mxsAKUKJ6JoCwWFTOUwWtT3sV1YD
         kC9croytwR8/g9lbeVwEmRlVDt7AeD2zfK/5bHjoP9gumuGMjuesQMU7RjJ1HsJMA+Ji
         JuFw==
MIME-Version: 1.0
X-Received: by 10.28.218.75 with SMTP id r72mr12306768wmg.59.1452126048996;
 Wed, 06 Jan 2016 16:20:48 -0800 (PST)
Received: by 10.28.91.143 with HTTP; Wed, 6 Jan 2016 16:20:48 -0800 (PST)
In-Reply-To: <1452093205-30167-5-git-send-email-eric.auger@linaro.org>
References: <1452093205-30167-1-git-send-email-eric.auger@linaro.org>
	<1452093205-30167-5-git-send-email-eric.auger@linaro.org>
Date: Wed, 6 Jan 2016 16:20:48 -0800
Message-ID: <CAPokK=qiRjZa4SsTHhT-jfv3CxS7uvKJBgJPDjScwp72ASAHsg@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] device_tree: qemu_fdt_getprop converted to use the
 error API
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Eric Auger <eric.auger@linaro.org>
Cc: eric.auger@st.com, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Peter Maydell <peter.maydell@linaro.org>, David Gibson <david@gibson.dropbear.id.au>, 
	Alex Williamson <alex.williamson@redhat.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	thuth@redhat.com, Patch Tracking <patches@linaro.org>, 
	Christoffer Dall <christoffer.dall@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	b.reynal@virtualopensystems.com, suravee.suthikulpanit@amd.com, 
	thomas.lendacky@amd.com
Content-Type: text/plain; charset=UTF-8
X-TUID: nzXIOTrT5xdA

On Wed, Jan 6, 2016 at 7:13 AM, Eric Auger <eric.auger@linaro.org> wrote:
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

The _cell variant is now inconsistent with the regular _getprop. Can
we convert them both together and fix the clients to error_fatal?
(there are only 4 of them).

This would become the standard error_propagate pattern.

>      if (len != 4) {
>          error_report("%s: %s/%s not 4 bytes long (not a cell?)",
>                       __func__, node_path, property);

And this would also convert to error_setg.

Regards,
Peter

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
