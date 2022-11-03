Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp488997ejx;
        Thu, 3 Nov 2022 03:13:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7743a6lpvrKGOkxU5xfWU7wXXMAtSm/ASGbgoKCHUcsUj5vvY6You8gjdggHuXn6H7XJvs
X-Received: by 2002:a05:620a:14b5:b0:6fa:2e5c:fad3 with SMTP id x21-20020a05620a14b500b006fa2e5cfad3mr15148438qkj.452.1667470401353;
        Thu, 03 Nov 2022 03:13:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667470401; cv=none;
        d=google.com; s=arc-20160816;
        b=yfMUMBLVw5J8cvEam0xq+DpIdne52pZQ3QcBSzS3U34shNPnrF1t6tjnCNDatwdQzS
         wVX3x+IByYTLaPHnHa94gABfgdju2FaxyWv1A9x3lRZpQLlLe7ujFlAg7nWbB8ShQFn0
         jkM+ViFGZfK6TW+jo8AceIUWbTKxD9ykKuwAQpdtQ2IVkmDPvD9qpKjeRWF5dkTNyf3X
         IjgizY/EjwN0YAqUndTXrYPMo8SdNq9wjOtzzHGD5I+Q4gmPxfz3Hznp7E5vLKXUJ8iO
         R9FRYhSUdDjK8EtC4qrC2sSV5thXEsDr+XY65ckX2P2i8xVT0hwo/hp/h3j84ZPKyDI+
         ZvPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=gEg9zF/vGvXXz6wIbjIU9pMd54nmTK+K0RBmRm7neXY=;
        b=qJm+xyPxu2a0VBOVsnFJ2PhqkxXUXu9jS4FFSzXZwF3wYJrb7r1dAddNrXerDLZVYv
         CTgz/pGd6EvvqAeth2dWp2NrUrIKU/mshq9vB6i7IhdsPnL8okytrLx+XZaxRtS2Ymmr
         B3p4MgZAZl2Miq0AN8kRRF2JXgS5NqL6hXdUdZer55I+GD6hTGJ1N8bINxNSpWds6+AN
         sCKX4RIt8yyQCzKjN9SX2cdmI1J4YkJIiDq3hkVclc1z7ppqx41R+vJa2mCAXFZFNsuf
         USG0qbOsIvolBkup0u2VLqdIz1GH+VXIsBcN0b3LOTx/bjyDEIKOCCRzg3wwNR/g2ptR
         a2aQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HWLURrtR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d9-20020ac85449000000b0039cc8b04405si234169qtq.210.2022.11.03.03.13.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Nov 2022 03:13:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HWLURrtR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oqXDU-0002Pj-5X; Thu, 03 Nov 2022 06:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oqXDT-0002PR-58
 for qemu-arm@nongnu.org; Thu, 03 Nov 2022 06:12:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oqXDR-0001S8-AF
 for qemu-arm@nongnu.org; Thu, 03 Nov 2022 06:12:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667470371;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gEg9zF/vGvXXz6wIbjIU9pMd54nmTK+K0RBmRm7neXY=;
 b=HWLURrtRalzTof/wiGOAJMD1GTypdv9BW1fqyDCx0I9SKBp8egqFdavJuI2BCP5v02msTu
 p1acEP+Oe9OZeK/4R0hKbk5hQ7XAFbEZd+RkSP2qH0lkTTM7Qe4olKN9rlHSTaCgOfefVb
 C+v0jaHvy43kC6W1/SQpzA32+ged6KI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-621-5Dw1yJXjMMqlTXy4UU0NuA-1; Thu, 03 Nov 2022 06:12:50 -0400
X-MC-Unique: 5Dw1yJXjMMqlTXy4UU0NuA-1
Received: by mail-wm1-f71.google.com with SMTP id
 m34-20020a05600c3b2200b003cf549cb32bso2412481wms.1
 for <qemu-arm@nongnu.org>; Thu, 03 Nov 2022 03:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gEg9zF/vGvXXz6wIbjIU9pMd54nmTK+K0RBmRm7neXY=;
 b=OFpY1UV0aUAkmv6PNdqLD3it1dJ9OuNXkqPXXA8QqxIz/zYHogebZMfshVEKODAgUM
 z1Eb71xbOAbusSoLwjSMWx5osZCnjBH900QFPXXCIItzL4Qw/RvPjDjzPRCuW+lgGJzN
 R6gI5vqOk8DLiQXtHtmmYUiLyeaWo77j9ImU8fq10vW7xgzBRxl/vAEFrRMf6JiCPC7q
 2Knz3lrDQIK+M1b91mt4wMj3gDfzivrFSrbmM5kJ++oJAjycI6Cc2rDChVSOO8CRrool
 8Y51az/1mWi/bwq9yJmR+KIwLu5+tSRcv2QRH9OBui0F22/M8SrKkv4/ZTDaqhPJtUcY
 4tcA==
X-Gm-Message-State: ACrzQf1K6sbED7IKqDF8Fp2gxO/CGV8wq6gPgDRz5R6E/bVcOgKx8enU
 TyoBMfvkcl0dxyT299PHpfULcN50qAupxi0oJ6tfsAsBTC5ZVxcLQWhHJOlfNPSir4y4Z7IBqkI
 nKI4wZHjydAx0
X-Received: by 2002:a05:600c:5d3:b0:3cf:6bbf:9ee3 with SMTP id
 p19-20020a05600c05d300b003cf6bbf9ee3mr15060617wmd.15.1667470367097; 
 Thu, 03 Nov 2022 03:12:47 -0700 (PDT)
X-Received: by 2002:a05:600c:5d3:b0:3cf:6bbf:9ee3 with SMTP id
 p19-20020a05600c05d300b003cf6bbf9ee3mr15060590wmd.15.1667470366812; 
 Thu, 03 Nov 2022 03:12:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a05600c1c0200b003c6c3fb3cf6sm971024wms.18.2022.11.03.03.12.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 03:12:46 -0700 (PDT)
Message-ID: <fc877215-61dc-8c9a-fb0e-5ffa000cef07@redhat.com>
Date: Thu, 3 Nov 2022 11:12:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v7 7/7] hw/arm/virt: Add properties to disable high memory
 regions
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, cohuck@redhat.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org, zhenyzha@redhat.com,
 shan.gavin@gmail.com
References: <20221029224307.138822-1-gshan@redhat.com>
 <20221029224307.138822-8-gshan@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20221029224307.138822-8-gshan@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xTRtTqsBMDYz

Hi Gavin,
On 10/30/22 00:43, Gavin Shan wrote:
> The 3 high memory regions are usually enabled by default, but they may
> be not used. For example, VIRT_HIGH_GIC_REDIST2 isn't needed by GICv2.
> This leads to waste in the PA space.
>
> Add properties ("highmem-redists", "highmem-ecam", "highmem-mmio") to
> allow users selectively disable them if needed. After that, the high
> memory region for GICv3 or GICv4 redistributor can be disabled by user,
> the number of maximal supported CPUs needs to be calculated based on
> 'vms->highmem_redists'. The follow-up error message is also improved
> to indicate if the high memory region for GICv3 and GICv4 has been
> enabled or not.
>
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  docs/system/arm/virt.rst | 13 +++++++
>  hw/arm/virt.c            | 75 ++++++++++++++++++++++++++++++++++++++--
>  2 files changed, 86 insertions(+), 2 deletions(-)
>
> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
> index 4454706392..188a4f211f 100644
> --- a/docs/system/arm/virt.rst
> +++ b/docs/system/arm/virt.rst
> @@ -98,6 +98,19 @@ compact-highmem
>    Set ``on``/``off`` to enable/disable the compact layout for high memory regions.
>    The default is ``on`` for machine types later than ``virt-7.2``.
>  
> +highmem-redists
> +  Set ``on``/``off`` to enable/disable the high memory region for GICv3 or
> +  GICv4 redistributor. The default is ``on``. Setting this to ``off`` will
> +  limit the maximum number of CPUs when GICv3 or GICv4 is used.
> +
> +highmem-ecam
> +  Set ``on``/``off`` to enable/disable the high memory region for PCI ECAM.
> +  The default is ``on`` for machine types later than ``virt-3.0``.
> +
> +highmem-mmio
> +  Set ``on``/``off`` to enable/disable the high memory region for PCI MMIO.
> +  The default is ``on``.
> +
>  gic-version
>    Specify the version of the Generic Interrupt Controller (GIC) to provide.
>    Valid values are:
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 020a95cfa2..65cff7add1 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2095,14 +2095,20 @@ static void machvirt_init(MachineState *machine)
>      if (vms->gic_version == VIRT_GIC_VERSION_2) {
>          virt_max_cpus = GIC_NCPU;
>      } else {
> -        virt_max_cpus = virt_redist_capacity(vms, VIRT_GIC_REDIST) +
> -            virt_redist_capacity(vms, VIRT_HIGH_GIC_REDIST2);
> +        virt_max_cpus = virt_redist_capacity(vms, VIRT_GIC_REDIST);
> +        if (vms->highmem_redists) {
> +            virt_max_cpus += virt_redist_capacity(vms, VIRT_HIGH_GIC_REDIST2);
> +        }
>      }
>  
>      if (max_cpus > virt_max_cpus) {
>          error_report("Number of SMP CPUs requested (%d) exceeds max CPUs "
>                       "supported by machine 'mach-virt' (%d)",
>                       max_cpus, virt_max_cpus);
> +        if (vms->gic_version != VIRT_GIC_VERSION_2 && !vms->highmem_redists) {
> +            error_printf("Try 'highmem-redists=on' for more CPUs\n");
> +        }
> +
>          exit(1);
>      }
>  
> @@ -2371,6 +2377,49 @@ static void virt_set_compact_highmem(Object *obj, bool value, Error **errp)
>      vms->highmem_compact = value;
>  }
>  
> +static bool virt_get_highmem_redists(Object *obj, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    return vms->highmem_redists;
> +}
> +
> +static void virt_set_highmem_redists(Object *obj, bool value, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    vms->highmem_redists = value;
> +}
> +
> +static bool virt_get_highmem_ecam(Object *obj, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    return vms->highmem_ecam;
> +}
> +
> +static void virt_set_highmem_ecam(Object *obj, bool value, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    vms->highmem_ecam = value;
> +}
> +
> +static bool virt_get_highmem_mmio(Object *obj, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    return vms->highmem_mmio;
> +}
> +
> +static void virt_set_highmem_mmio(Object *obj, bool value, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    vms->highmem_mmio = value;
> +}
> +
> +
>  static bool virt_get_its(Object *obj, Error **errp)
>  {
>      VirtMachineState *vms = VIRT_MACHINE(obj);
> @@ -2996,6 +3045,28 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>                                            "Set on/off to enable/disable compact "
>                                            "layout for high memory regions");
>  
> +    object_class_property_add_bool(oc, "highmem-redists",
> +                                   virt_get_highmem_redists,
> +                                   virt_set_highmem_redists);
> +    object_class_property_set_description(oc, "highmem-redists",
> +                                          "Set on/off to enable/disable high "
> +                                          "memory region for GICv3 or GICv4 "
> +                                          "redistributor");
> +
> +    object_class_property_add_bool(oc, "highmem-ecam",
> +                                   virt_get_highmem_ecam,
> +                                   virt_set_highmem_ecam);
> +    object_class_property_set_description(oc, "highmem-ecam",
> +                                          "Set on/off to enable/disable high "
> +                                          "memory region for PCI ECAM");
> +
> +    object_class_property_add_bool(oc, "highmem-mmio",
> +                                   virt_get_highmem_mmio,
> +                                   virt_set_highmem_mmio);
> +    object_class_property_set_description(oc, "highmem-mmio",
> +                                          "Set on/off to enable/disable high "
> +                                          "memory region for PCI MMIO");
> +
>      object_class_property_add_str(oc, "gic-version", virt_get_gic_version,
>                                    virt_set_gic_version);
>      object_class_property_set_description(oc, "gic-version",

