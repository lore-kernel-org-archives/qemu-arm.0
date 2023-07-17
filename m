Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp5720059eje;
        Mon, 17 Jul 2023 07:00:29 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFw0kIt7fLE9mM0DokV3VQzULLNFvwG1KRbkSgqDGcCnQyCk5NV2GE5rOPEx/FjVWgbv09f
X-Received: by 2002:a0c:e2cd:0:b0:636:d181:46ec with SMTP id t13-20020a0ce2cd000000b00636d18146ecmr10813720qvl.32.1689602429426;
        Mon, 17 Jul 2023 07:00:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689602429; cv=none;
        d=google.com; s=arc-20160816;
        b=fXXbOTJ8A5vCrLsGjA9gt3YM1u6FMf+zbfRAuePEy6NWp1k2NWz2pvm4CyO0VqQHBk
         RHnUjjmKr2knvOn1py/cC36Y+bZWeJbrv/+xmjbpnIcBah0HA6mUkhyRIL3Vr+JPV/Qt
         Mi+laPDnPJwrZ1u3H5P684TOpYDNBfFZJfHBGptLElWNspRN4MljnScT1jRmDyy5Y9tz
         sIeRWdJSq0ZvH6LyDAT0MmTnosVET4d690vMjVStNP4TX9E9xF6DlpnvMQSzejccAV/Y
         OqOSe/AQikppZ/jOa4Liechk1sgXGK7fmMQWNpsLiSphz7XJTyCHR3D9nldvaMA8G2gS
         6KTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=0NCHkA3hYOAqoAx3UvlKxfIjR02hnQlaQNfRDJaJ0MQ=;
        fh=9rEEmpi44VMyltv8p9oe97T3tr76jx0thzZYls1b+54=;
        b=SRc888qZhSmktZTplNn8/z3xlqH+3eG/mHPJ0qThV0wNc3r3e2Jy3q/08PMiJWedpZ
         bX3J/41tJRWNV0PXGn/j4PwmcwZOo4xchGU/5e1Bl/x9cy1G9xNh2hme6X1sZNEXu9Hw
         VdERB1GdKXwb3CHS1JPAK/YrlBDcB3pevi6ID33mLuoLfVoaApc9vYs4FltzIEXtRuMP
         zZNhZNGtKxOlZd7Zrg31ksAzJo82hStEDZcGTIoj2pbH1Q6IZNrZ361LH+LAWtpxqvdU
         czCDxMSaU/qpjp1DBwiOl+WZy3jR231fp/EkiAeDLc1DeM7ceCaUYBmyRIQGT8jYo2Q+
         4Iyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="OkBSMFe/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b17-20020a0c9b11000000b006367dfd12dfsi7988763qve.233.2023.07.17.07.00.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jul 2023 07:00:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="OkBSMFe/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qLOlu-0001bW-4T; Mon, 17 Jul 2023 10:00:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1qLOlr-0001bE-BF
 for qemu-arm@nongnu.org; Mon, 17 Jul 2023 10:00:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1qLOlp-0005Kr-FW
 for qemu-arm@nongnu.org; Mon, 17 Jul 2023 10:00:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689602412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0NCHkA3hYOAqoAx3UvlKxfIjR02hnQlaQNfRDJaJ0MQ=;
 b=OkBSMFe//VTwMPTkWx6C+kyU+uZGRv/7AOOH3NmxCikv3TXKZIZiVPGSH4rVtYXOeFr7UN
 lCGbRnYjPT2goOBKKabQ6wgcrH5LjUZxXAvH+Urlc4ZSyAzJSNrDvZS17druRtkNRcUFvF
 VRjdYIgrCVM2WwtESM1NYjlMf83RAUk=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-119-r_tLIjIJOGiKuxLM7KQeaQ-1; Mon, 17 Jul 2023 10:00:11 -0400
X-MC-Unique: r_tLIjIJOGiKuxLM7KQeaQ-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2b698377ed7so40924761fa.3
 for <qemu-arm@nongnu.org>; Mon, 17 Jul 2023 07:00:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689602409; x=1692194409;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0NCHkA3hYOAqoAx3UvlKxfIjR02hnQlaQNfRDJaJ0MQ=;
 b=id8IUllVnhIS1AW1Z+PSEIpam/0V59VbrrUE5nmM/UCzPMKC3AeeIEO3O/l3vVDkmO
 pk0akKHi1kFsAazRXpOquwoErxqCRlYglzKQl+SrVNrqpy+b0Sg1AL7rJ0W8szVQxzhc
 HCgnypBW6VbNJ2ouMV+STdfhBModKZK+tBFP+DOZ7g0K4M0QZ3hbU02v8Ap94z2B+qfu
 MuAok+g1bT+2JFUE3wY2v7nuHnWJpAoLQhYkyvn7BagSHpgwFrfko7bX5qYGaR7DJ1G+
 5Vsb/IgnjPxWxjNv+KhGo67JLboGOeopDXyq0WEjA77X0Hg3cTrM5qnvouxKMfFy08PR
 3GaA==
X-Gm-Message-State: ABy/qLbRrQMvnSoLEDss4XjiL5jNUqabFXX+Cns2i5NRL0IQw6Q90D3K
 6dcMpjrzDv+IIz46J90d/kTDsfCKEgrMW3RT7w7HMBQ88IkgbKG/vjMmsf6lHyzxwnHvpvs6o5d
 7RqpTR5JQZ3O/
X-Received: by 2002:a2e:9d93:0:b0:2b6:eb8c:af06 with SMTP id
 c19-20020a2e9d93000000b002b6eb8caf06mr8510912ljj.8.1689602409183; 
 Mon, 17 Jul 2023 07:00:09 -0700 (PDT)
X-Received: by 2002:a2e:9d93:0:b0:2b6:eb8c:af06 with SMTP id
 c19-20020a2e9d93000000b002b6eb8caf06mr8510891ljj.8.1689602408774; 
 Mon, 17 Jul 2023 07:00:08 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 mj7-20020a170906af8700b0098963eb0c3dsm9214666ejb.26.2023.07.17.07.00.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 07:00:08 -0700 (PDT)
Date: Mon, 17 Jul 2023 16:00:07 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Joelle van Dyne <j@getutm.app>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:Virt)
Subject: Re: [PATCH v2 07/11] hw/arm/virt: add plug handler for TPM on SysBus
Message-ID: <20230717160007.67bb67df@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230714070931.23476-8-j@getutm.app>
References: <20230714070931.23476-1-j@getutm.app>
 <20230714070931.23476-8-j@getutm.app>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: y3RlnX8fdHvv

On Fri, 14 Jul 2023 00:09:23 -0700
Joelle van Dyne <j@getutm.app> wrote:

> TPM needs to know its own base address in order to generate its DSDT
> device entry.
> 
> Signed-off-by: Joelle van Dyne <j@getutm.app>
> ---
>  hw/arm/virt.c | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 7d9dbc2663..432148ef47 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2732,6 +2732,37 @@ static void virt_memory_plug(HotplugHandler *hotplug_dev,
>                           dev, &error_abort);
>  }
>  
> +#ifdef CONFIG_TPM

ifdefs are not really welcome, usually we use stubs instead
see stubs/virtio-md-pci.c or hw/display/acpi-vga-stub.c as an example.

> +static void virt_tpm_plug(VirtMachineState *vms, TPMIf *tpmif)
> +{
> +    PlatformBusDevice *pbus = PLATFORM_BUS_DEVICE(vms->platform_bus_dev);
> +    hwaddr pbus_base = vms->memmap[VIRT_PLATFORM_BUS].base;
> +    SysBusDevice *sbdev = SYS_BUS_DEVICE(tpmif);
> +    MemoryRegion *sbdev_mr;
> +    hwaddr tpm_base;
> +    uint64_t tpm_size;
> +
> +    if (!sbdev || !object_dynamic_cast(OBJECT(sbdev), TYPE_SYS_BUS_DEVICE)) {
it seems object_dynamic_cast() can deal with NULL object,  perhaps drop !sbdev part

> +        return;
> +    }
> +
> +    tpm_base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
> +    assert(tpm_base != -1);
> +
> +    tpm_base += pbus_base;
> +
> +    sbdev_mr = sysbus_mmio_get_region(sbdev, 0);
> +    tpm_size = memory_region_size(sbdev_mr);
> +

> +    if (object_property_find(OBJECT(sbdev), "baseaddr")) {
> +        object_property_set_uint(OBJECT(sbdev), "baseaddr", tpm_base, NULL);
> +    }
> +    if (object_property_find(OBJECT(sbdev), "size")) {
> +        object_property_set_uint(OBJECT(sbdev), "size", tpm_size, NULL);
> +    }
why both properties wrapped into conditions?
Also can addr/size be wrong and cause property setter fail?
(if yes then you'd need to s/, NULL, &error_abort/)


> +}
> +#endif
> +
>  static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>                                              DeviceState *dev, Error **errp)
>  {
> @@ -2803,6 +2834,12 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
>          vms->virtio_iommu_bdf = pci_get_bdf(pdev);
>          create_virtio_iommu_dt_bindings(vms);
>      }
> +
> +#ifdef CONFIG_TPM
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_TPM_IF)) {
> +        virt_tpm_plug(vms, TPM_IF(dev));
> +    }
> +#endif
>  }
>  
>  static void virt_dimm_unplug_request(HotplugHandler *hotplug_dev,

