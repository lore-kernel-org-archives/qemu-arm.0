Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp281312lfb;
        Wed, 5 Jan 2022 06:49:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwioVPc0kYnjsgcOWmhPmg5RBDVyhpKLwHnLVR+mqaMbZlq5cOIUnPDFsH0inIYYs6szCQy
X-Received: by 2002:ac8:574d:: with SMTP id 13mr49259115qtx.88.1641394158092;
        Wed, 05 Jan 2022 06:49:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641394158; cv=none;
        d=google.com; s=arc-20160816;
        b=rf+kIQCotMdzp6/IlUm8+sH0UfwIBmLl7MF+TsaP3+Kt+nlOF31K8SfYQRtZadiwKf
         O01vIrZfAZQFKoSp0I3I08fNWsU2wTQA0qAw5CzDtU6BDsp3Z2MZazE1kEu1YTY5oe36
         jG4bGucnaj3fQ/T8T92aT5NegnBN8Z2SQK+7QBW/seyHeseraiCaNzc+Zi84iIbglTtZ
         9BBI08tHapBEM6o4/2QkyB8EapTl7RHXlbj2pfA3mtBvpERUVwc3/LV3PLNpQv89CEI/
         ZCPtfmyObY7FGh7I/TUpXSyWD/7iR7wHoSluXia5kr4SZ5ckBhVpgyc3N5PHBupqPNfk
         99Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=7ysqLclNJzMut443f5x8/Ue0sG0SeYUxnh0PmY3i8bI=;
        b=0kZ0R3RhtBKEbjZiscBV8KRL/25xnMSWPbO7gieRz25WaPN8ZSuQnOOgTJHvGTSfnv
         uUpkl8o+MBw3nGNPDkjRhu75OVnWHRHHuXT/KysNLF2YUvi1OVhR/NOWH0/zeXpcpuwO
         VZmDeVZpHKZ6xEIMP7nMJiuluBDR4v9Vei/nbmgZo7dYVORt+tcUVBl4RUHoEDnylqKF
         rP6HW765I4XAt9vYEZfyLpLQuI5r3DR3bfvV/wQQSL5UZWAz0+K5g+Fyiep0CCb1ydLS
         pweG+rcz27CdYVq7zeRf9KIqhANnA+w97ZepfDmYaxMsBaURpoyT2Gl6INI693mu4PA4
         cqzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Is7EorHQ;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id r3si22710923qvc.72.2022.01.05.06.49.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jan 2022 06:49:18 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Is7EorHQ;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1641394157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7ysqLclNJzMut443f5x8/Ue0sG0SeYUxnh0PmY3i8bI=;
	b=Is7EorHQGFo7Jgho/ljXUkUabssGo3BBe41/4/sxAsELaoTGH1Xp/hC/5bQ3Scb8xuJjwj
	mJasQS1/Ot+vonqZwYdszSZAIM2tJrYpTxobmvtdm07lm1U8ZG35TGZc3Dz3E9mmqDtfkc
	IGNPa8x/FrQSsEtLE3IjBH/dfJ2/rHM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-341-W4-P9DhdOkqAdmSWZ0shnA-1; Wed, 05 Jan 2022 09:49:16 -0500
X-MC-Unique: W4-P9DhdOkqAdmSWZ0shnA-1
Received: by mail-wm1-f69.google.com with SMTP id k40-20020a05600c1ca800b00345bf554707so765865wms.4
        for <alex.bennee@linaro.org>; Wed, 05 Jan 2022 06:49:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=7ysqLclNJzMut443f5x8/Ue0sG0SeYUxnh0PmY3i8bI=;
        b=RnJJX3gFC3bHIocoAhY8W2C7iteFNLVLhYA0nXJajb+r+ko4J0F/+Tond7tFdocWwt
         wVBBhWXk8uS8urv8bBNdNQBv+ZqcdyB3zQkiHuxD1lvrVfST1kMcY95ZyKOkc7DtwACP
         yW4up82hTDwO1/MS9rqynMxvxi0TI2V25AlwqsYd0UDKEDakUIIHtRqt/gblNmjxQF6t
         ewIBNrJUpECPO2Fae38toRtWXFw0Qe382N0JkOt/LgxCM8Lx17FjUCgyi1xhR4KmyeK0
         VfkujQR7bB13mi8HUJNm9SBRy6xErsn3PwWhmi85M+LgDapQcL6zuahkPFLeBbowa6Hu
         IBcg==
X-Gm-Message-State: AOAM530oUTQbVkBnN+YAXyLFEN9JYvEzMqPXzC2M2T6n3jpKnqBO9Eu9
	3G1x43es2wsmeWGmwWKBOyc9lFUrkI/UEOmv6uuqSMUPVpjw33XkK7SnW4zree0fVST82+o5jJ+
	q8xWbKWISEknJ5LqPC6V+M++NPpN6HoT4rgLyqziUFesB5DL20GCohUuyVntL1cAOwHM=
X-Received: by 2002:a5d:4343:: with SMTP id u3mr22236378wrr.504.1641394155444;
        Wed, 05 Jan 2022 06:49:15 -0800 (PST)
X-Received: by 2002:a5d:4343:: with SMTP id u3mr22236342wrr.504.1641394155134;
        Wed, 05 Jan 2022 06:49:15 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from gator (nat-pool-brq-u.redhat.com. [213.175.37.12])
        by smtp.gmail.com with ESMTPSA id d5sm19208611wrs.61.2022.01.05.06.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 06:49:14 -0800 (PST)
Date: Wed, 5 Jan 2022 15:49:13 +0100
From: Andrew Jones <drjones@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, fam@euphon.net,
	Peter Maydell <peter.maydell@linaro.org>, berrange@redhat.com,
	Heinrich Schuchardt <xypron.glpk@gmx.de>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, f4bug@amsat.org,
	Jerome Forissier <jerome@forissier.org>, stefanha@redhat.com,
	crosa@redhat.com, pbonzini@redhat.com,
	"open list:Virt" <qemu-arm@nongnu.org>, aurelien@aurel32.net
Subject: Re: [PATCH v1 21/34] hw/arm: add control knob to disable kaslr_seed
 via DTB
Message-ID: <20220105144913.2nitpxzmdyucgr7g@gator>
References: <20220105135009.1584676-1-alex.bennee@linaro.org>
 <20220105135009.1584676-22-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20220105135009.1584676-22-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: TfRdgel40wsH

On Wed, Jan 05, 2022 at 01:49:56PM +0000, Alex Bennée wrote:
> Generally a guest needs an external source of randomness to properly
> enable things like address space randomisation. However in a trusted
> boot environment where the firmware will cryptographically verify
> components having random data in the DTB will cause verification to
> fail. Add a control knob so we can prevent this being added to the
> system DTB.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Tested-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> Acked-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> Acked-by: Jerome Forissier <jerome@forissier.org>
> Message-Id: <20211215120926.1696302-1-alex.bennee@linaro.org>
> ---
>  docs/system/arm/virt.rst |  7 +++++++
>  include/hw/arm/virt.h    |  1 +
>  hw/arm/virt.c            | 32 ++++++++++++++++++++++++++++++--
>  3 files changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
> index 850787495b..c86a4808df 100644
> --- a/docs/system/arm/virt.rst
> +++ b/docs/system/arm/virt.rst
> @@ -121,6 +121,13 @@ ras
>    Set ``on``/``off`` to enable/disable reporting host memory errors to a guest
>    using ACPI and guest external abort exceptions. The default is off.
>  
> +kaslr-dtb-seed
> +  Set ``on``/``off`` to pass a random seed via the guest dtb to use for features
> +  like address space randomisation. The default is ``on``. You will want
> +  to disable it if your trusted boot chain will verify the DTB it is
> +  passed. It would be the responsibility of the firmware to come up
> +  with a seed and pass it on if it wants to.
> +
>  Linux guest kernel configuration
>  """"""""""""""""""""""""""""""""
>  
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index dc6b66ffc8..acd0665fe7 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -148,6 +148,7 @@ struct VirtMachineState {
>      bool virt;
>      bool ras;
>      bool mte;
> +    bool kaslr_dtb_seed;
>      OnOffAuto acpi;
>      VirtGICType gic_version;
>      VirtIOMMUType iommu;
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 6bce595aba..1781e47c76 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -247,11 +247,15 @@ static void create_fdt(VirtMachineState *vms)
>  
>      /* /chosen must exist for load_dtb to fill in necessary properties later */
>      qemu_fdt_add_subnode(fdt, "/chosen");
> -    create_kaslr_seed(ms, "/chosen");
> +    if (vms->kaslr_dtb_seed) {
> +        create_kaslr_seed(ms, "/chosen");
> +    }
>  
>      if (vms->secure) {
>          qemu_fdt_add_subnode(fdt, "/secure-chosen");
> -        create_kaslr_seed(ms, "/secure-chosen");
> +        if (vms->kaslr_dtb_seed) {
> +            create_kaslr_seed(ms, "/secure-chosen");
> +        }
>      }
>  
>      /* Clock node, for the benefit of the UART. The kernel device tree
> @@ -2235,6 +2239,20 @@ static void virt_set_its(Object *obj, bool value, Error **errp)
>      vms->its = value;
>  }
>  
> +static bool virt_get_kaslr_dtb_seed(Object *obj, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    return vms->kaslr_dtb_seed;
> +}
> +
> +static void virt_set_kaslr_dtb_seed(Object *obj, bool value, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    vms->kaslr_dtb_seed = value;
> +}
> +
>  static char *virt_get_oem_id(Object *obj, Error **errp)
>  {
>      VirtMachineState *vms = VIRT_MACHINE(obj);
> @@ -2764,6 +2782,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>                                            "Set on/off to enable/disable "
>                                            "ITS instantiation");
>  
> +    object_class_property_add_bool(oc, "kaslr-dtb-seed",
> +                                   virt_get_kaslr_dtb_seed,
> +                                   virt_set_kaslr_dtb_seed);
> +    object_class_property_set_description(oc, "kaslr-dtb-seed",
> +                                          "Set off to disable passing of kaslr "
> +                                          "dtb node to guest");
> +
>      object_class_property_add_str(oc, "x-oem-id",
>                                    virt_get_oem_id,
>                                    virt_set_oem_id);
> @@ -2828,6 +2853,9 @@ static void virt_instance_init(Object *obj)
>      /* MTE is disabled by default.  */
>      vms->mte = false;
>  
> +    /* Supply a kaslr-seed by default */
> +    vms->kaslr_dtb_seed = true;
> +
>      vms->irqmap = a15irqmap;
>  
>      virt_flash_create(vms);
> -- 
> 2.30.2
> 
>

Reviewed-by: Andrew Jones <drjones@redhat.com>
