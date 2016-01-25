Received: by 10.25.159.19 with SMTP id i19csp1266146lfe;
        Mon, 25 Jan 2016 06:05:57 -0800 (PST)
X-Received: by 10.31.174.23 with SMTP id x23mr9830886vke.136.1453730757404;
        Mon, 25 Jan 2016 06:05:57 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x233.google.com (mail-vk0-x233.google.com. [2607:f8b0:400c:c05::233])
        by mx.google.com with ESMTPS id g85si18154265vki.98.2016.01.25.06.05.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Jan 2016 06:05:57 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::233 as permitted sender) client-ip=2607:f8b0:400c:c05::233;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::233 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-vk0-x233.google.com with SMTP id k1so74029595vkb.2
        for <alex.bennee@linaro.org>; Mon, 25 Jan 2016 06:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=U97tVcFNhBiraj4SRDxAf3uyE7mg2+6NiFsQyxghNh4=;
        b=BAl9UvEt4wWC/FoiZmioVWp4Ld+lSepxGHdmeMQw5Bz/sfHMOjp0eR6mEGYC/vo+Hv
         weT06r/aIvziwOacxWd+rAbDRUAw7XQfJ7VBZhJ+VTm0T3kZmNRsGbEBNekNbJiSZWUv
         K6FM6cU9O86+oLkBlU55GXMmCfvVtZ42kZzIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=U97tVcFNhBiraj4SRDxAf3uyE7mg2+6NiFsQyxghNh4=;
        b=DqMENcid457iHsbVDEczK8rB3xlRIWmTxguE4PnEnRY44F3aVAlxhSQnoUHbUn3Bo0
         HRkX35gp4eqxacK8mrFr/HBVjna93HAZh6dLzn6A/pLrnIRwmLVAvQbg/4vGdBh/RBgM
         sEfjyV4MlCzmqKKS/IJE64kcd61E2JaugfmDAofOpo1jyLxAurymCkVw5ylT+zXPqYW9
         SB01L84cYQjMBK2LXfxr7vlmATb9LByqU4XnpHLPcK/mLzJucLoj0kvPDOY2dQNVeVdB
         LMgVs0uOOVChA04crJGCSkIMaw7ABfqEqnXbPl8KBUQNASlvUxIT16xYIRVq/q/vndyQ
         eggA==
X-Gm-Message-State: AG10YOQsN5Y91nxNtV5dqz/7GiHaz6I9SOUBJVvP2tuWQs2vEZRTIUfGN7jmXZz2193NNG4HdGCxDmTWp4SpAvgOpRA=
X-Received: by 10.31.0.136 with SMTP id 130mr9677945vka.139.1453730757046;
 Mon, 25 Jan 2016 06:05:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Mon, 25 Jan 2016 06:05:37 -0800 (PST)
In-Reply-To: <1453130204-655-7-git-send-email-eric.auger@linaro.org>
References: <1453130204-655-1-git-send-email-eric.auger@linaro.org> <1453130204-655-7-git-send-email-eric.auger@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jan 2016 14:05:37 +0000
Message-ID: <CAFEAcA9ZximjpaZ_rSdfM1JRyhW9dz1DZfcRRqQR+03heSPg2A@mail.gmail.com>
Subject: Re: [PATCH v5 6/8] hw/arm/sysbus-fdt: helpers for clock node generation
To: Eric Auger <eric.auger@linaro.org>
Cc: eric.auger@st.com, QEMU Developers <qemu-devel@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, David Gibson <david@gibson.dropbear.id.au>, 
	Alex Williamson <alex.williamson@redhat.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Peter Crosthwaite <crosthwaitepeter@gmail.com>, 
	Patch Tracking <patches@linaro.org>, Christoffer Dall <christoffer.dall@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Baptiste Reynal <b.reynal@virtualopensystems.com>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, thomas.lendacky@amd.com
Content-Type: text/plain; charset=UTF-8
X-TUID: i168Q0hoXOFn

On 18 January 2016 at 15:16, Eric Auger <eric.auger@linaro.org> wrote:
> Some passthrough'ed devices depend on clock nodes. Those need to be
> generated in the guest device tree. This patch introduces some helpers
> to build a clock node from information retrieved in the host device tree.
>
> - copy_properties_from_host copies properties from a host device tree
>   node to a guest device tree node
> - fdt_build_clock_node builds a guest clock node and checks the host
>   fellow clock is a fixed one.
>
> fdt_build_clock_node will become static as soon as it gets used. A
> dummy pre-declaration is needed for compilation of this patch.
>
> Signed-off-by: Eric Auger <eric.auger@linaro.org>

> +
> +/**
> + * copy_properties_from_host
> + *
> + * copies properties listed in an array from host device tree to
> + * guest device tree. If a non optional property is not found, the
> + * function self-asserts. An optional property is ignored if not found

This is just "asserts", not "self-asserts".

> + * in the host device tree.
> + * @props: array of HostProperty to copy
> + * @nb_props: number of properties in the array
> + * @host_dt: host device tree blob
> + * @guest_dt: guest device tree blob
> + * @node_path: host dt node path where the property is supposed to be
> +              found
> + * @nodename: guest node name the properties should be added to
> + */

> +/**
> + * fdt_build_clock_node
> + *
> + * Build a guest clock node, used as a dependency from a passthrough'ed
> + * device. Most information are retrieved from the host clock node.
> + * Also check the host clock is a fixed one.
> + *
> + * @host_fdt: host device tree blob from which info are retrieved
> + * @guest_fdt: guest device tree blob where the clock node is added
> + * @host_phandle: phandle of the clock in host device tree
> + * @guest_phandle: phandle to assign to the guest node
> + */
> +void fdt_build_clock_node(void *host_fdt, void *guest_fdt,
> +                         uint32_t host_phandle,
> +                         uint32_t guest_phandle);
> +void fdt_build_clock_node(void *host_fdt, void *guest_fdt,
> +                         uint32_t host_phandle,
> +                         uint32_t guest_phandle)
> +{
> +    char *node_path = NULL;
> +    char *nodename;
> +    const void *r;
> +    int ret, node_offset, prop_len, path_len = 16;
> +
> +    node_offset = fdt_node_offset_by_phandle(host_fdt, host_phandle);
> +    if (node_offset <= 0) {
> +        error_setg(&error_fatal,
> +                   "not able to locate clock handle %d in host device tree",
> +                   host_phandle);

Don't we want to return here, rather than continuing with the
rest of the function? ("goto err;" with an err: label before
the g_free() at the bottom of the function probably best since
some of the error paths need to free that.)

> +    }
> +    node_path = g_malloc(path_len);
> +    while ((ret = fdt_get_path(host_fdt, node_offset, node_path, path_len))
> +            == -FDT_ERR_NOSPACE) {
> +        path_len += 16;
> +        node_path = g_realloc(node_path, path_len);
> +    }
> +    if (ret < 0) {
> +        error_setg(&error_fatal,
> +                   "not able to retrieve node path for clock handle %d",
> +                   host_phandle);
> +    }
> +
> +    r = qemu_fdt_getprop(host_fdt, node_path, "compatible", &prop_len,
> +                         &error_fatal);
> +    if (strcmp(r, "fixed-clock")) {
> +        error_setg(&error_fatal,
> +                   "clock handle %d is not a fixed clock", host_phandle);
> +    }
> +
> +    nodename = strrchr(node_path, '/');
> +    qemu_fdt_add_subnode(guest_fdt, nodename);
> +
> +    copy_properties_from_host(clock_copied_properties,
> +                              ARRAY_SIZE(clock_copied_properties),
> +                              host_fdt, guest_fdt,
> +                              node_path, nodename);
> +
> +    qemu_fdt_setprop_cell(guest_fdt, nodename, "phandle", guest_phandle);
> +
> +    g_free(node_path);
> +}
> +
>  /* Device Specific Code */

thanks
-- PMM
