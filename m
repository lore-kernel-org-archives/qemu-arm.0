Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp251000lfa;
        Wed, 2 Jun 2021 05:26:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUUHwwuN6n6rpZCmvFv1k6GuwxcfbUcwn3AEXIgtkwhI8Hol91+/7PZ7Y0WMUWEXYfwkNM
X-Received: by 2002:a05:6402:34d2:: with SMTP id w18mr38296191edc.358.1622636774653;
        Wed, 02 Jun 2021 05:26:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622636774; cv=none;
        d=google.com; s=arc-20160816;
        b=rAWEhwt2gpvknUbr7akleNuE0nIVnDbGG2+iZ2g0Q4lQaKzSud/lN0yGZqAmdtoQRO
         2YNXafdbn/nQGKVgHykSIvoJaCEJwf7XdNB3pxCoYwhsvBuoJYSj2KL/9SZPQs4K/Elb
         +2hFRPHn1LWoYRvbUgSzSztIpk3KJmJ65sAa4pVbR2muCB/hHUP+PpObs7drODL9E8nm
         3kNdC9AegUs9TQOLnX/Wkstxt763jr7xku6t+nd3Djqjn/IIX9L1cfdAonSJcY//6JGQ
         9nTYqewVGy20BCCfbZDnQwgKggyf2WYXNfoD/sH8SeCFo3ucC2GuFpH7hcp92Y7mV2ym
         h0zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:subject:from:dkim-signature;
        bh=orI2mfz/xyYk0Hga3CuMNy8vdWlBV3ihOX24VrQ1K58=;
        b=bEBbSUKZNmGGYiKaSv93XrpnFkYmSkMqZBC98TkvW3vjVv1inx7NWKYZrZ9UAtwErL
         VkzGHTWiYSoooPkDOXxYWt++dXp0CV1pwy3hNXWtq2+QD6ftwh4ZgEGJP9n2JQ4Igfvk
         Zjf7DbNR8oZ7jx7p6SS3DEEl/CNKseSfTaiy3mv3YLE55L8Za1RipQgN8S7bEc668rJ3
         e7l3P5RJVyZg6sxlyC2oxI2xwMXeETrwO8nuR8O7sb4MW5/TqRSrOtpzrYs5BLxpQbfn
         qvKfJ2jJhmtu6NesxLIKPPYSrStVByY35U8ioXnmlkTy44s58gPvwLD1ma+k/Mwwv7tB
         EdlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="auP/g8jL";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k3si1973938edi.75.2021.06.02.05.26.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jun 2021 05:26:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="auP/g8jL";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1loPwr-0008Ev-Ji
	for alex.bennee@linaro.org; Wed, 02 Jun 2021 08:26:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1loPwd-0008Bi-V1
 for qemu-arm@nongnu.org; Wed, 02 Jun 2021 08:25:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1loPwc-00013D-6Q
 for qemu-arm@nongnu.org; Wed, 02 Jun 2021 08:25:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622636757;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=orI2mfz/xyYk0Hga3CuMNy8vdWlBV3ihOX24VrQ1K58=;
 b=auP/g8jLlaVCNPXE1hlmYXjMMejz//Hb3QBMMtUk3BDWnmEXN1S/UfowmiXOFViFizxD4S
 RnNVP8bLalamX4OqemRZ8oKRcNEK1pbuF7UHnvy/rN72TjkHX7RzkZn96T//h7AQ+jpr++
 PN2q4DrtqPchfz5QuKOhLwRDSWBra7w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-2-M1Z6_BNZSP6PCvBdDYBw-1; Wed, 02 Jun 2021 08:25:54 -0400
X-MC-Unique: 2-M1Z6_BNZSP6PCvBdDYBw-1
Received: by mail-wr1-f69.google.com with SMTP id
 i102-20020adf90ef0000b029010dfcfc46c0so961321wri.1
 for <qemu-arm@nongnu.org>; Wed, 02 Jun 2021 05:25:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:reply-to:to:cc:references
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=orI2mfz/xyYk0Hga3CuMNy8vdWlBV3ihOX24VrQ1K58=;
 b=shnVnQKTtJ8IYzt+ER401S+tG4Tv/5klAojpfOqLnrYc7yqcGN9kof/KhyC0yeuXcJ
 ZI8ZAllUSYxl03WK2hFvlbs914k4qbsuceOLzvR7JZQ510RnavoQwlSjTNIVA+myI7p3
 Wv80dSCtxczWRbd/2m+89d4l/hg99eHORxVRNUwTeS1Sc2bMGt7rSmyJx2trLro9IxnB
 HsIq+pZ6LCpL48hLXFSizkj/CeLQyBDjeSt+jnwJYos2yRCCHfX7tCOQe4x5ie3PkKhk
 /BcwV0dN+ky390Cno1Mm4j0foBPaGUixu2FT47RioY03zh2mvyNoLMzUGtwlf+H26Eh1
 pxtw==
X-Gm-Message-State: AOAM533kpenV63VLaOPv7NKZ2kY7MnIieDp0G77p7DXqVeGbhtQ2aIFA
 w294r/Amw4Apc4WNVankKElbNjzhsK/B/w+mUwEygbYbHDlHbiSMoFLnFr4nIyUZniQ/hKYpuE+
 NRItbxXkbwrTO
X-Received: by 2002:a7b:ce8a:: with SMTP id q10mr18757212wmj.184.1622636752852; 
 Wed, 02 Jun 2021 05:25:52 -0700 (PDT)
X-Received: by 2002:a7b:ce8a:: with SMTP id q10mr18757189wmj.184.1622636752661; 
 Wed, 02 Jun 2021 05:25:52 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id f20sm2955456wmh.41.2021.06.02.05.25.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 05:25:52 -0700 (PDT)
From: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v4 3/8] hw/arm/virt: Add a machine option to bypass iommu
 for primary bus
To: Wang Xingang <wangxingang5@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, shannon.zhaosl@gmail.com, imammedo@redhat.com,
 mst@redhat.com, marcel.apfelbaum@gmail.com, peter.maydell@linaro.org,
 ehabkost@redhat.com, richard.henderson@linaro.org, pbonzini@redhat.com
References: <1621914605-14724-1-git-send-email-wangxingang5@huawei.com>
 <1621914605-14724-4-git-send-email-wangxingang5@huawei.com>
Message-ID: <b1f26e3a-d678-aa50-4e82-71c76c9775b8@redhat.com>
Date: Wed, 2 Jun 2021 14:25:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1621914605-14724-4-git-send-email-wangxingang5@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Cc: xieyingtai@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pv4ZMgS/LJvv

Hi Xingang,

On 5/25/21 5:50 AM, Wang Xingang wrote:
> From: Xingang Wang <wangxingang5@huawei.com>
>
> This add a bypass_iommu option for arm virt machine,
> the option can be used in this manner:
> qemu -machine virt,iommu=smmuv3,bypass_iommu=true
This still looks confusing to me. On one hand we say that for the virt
machine the iommu is set to smmuv3 and we say bypass_iommu=true on the
virt machine option line
It is not straightforward that the bypass_iommu only relates to devices
plugged onto the "default" root bus.

At least the name of the property should reflect that I think

> Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
> ---
>  hw/arm/virt.c         | 26 ++++++++++++++++++++++++++
>  include/hw/arm/virt.h |  1 +
>  2 files changed, 27 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 840758666d..49d8a801ed 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1364,6 +1364,7 @@ static void create_pcie(VirtMachineState *vms)
>      }
>  
>      pci = PCI_HOST_BRIDGE(dev);
> +    pci->bypass_iommu = vms->bypass_iommu;
>      vms->bus = pci->bus;
>      if (vms->bus) {
>          for (i = 0; i < nb_nics; i++) {
> @@ -2319,6 +2320,21 @@ static void virt_set_iommu(Object *obj, const char *value, Error **errp)
>      }
>  }
>  
> +static bool virt_get_bypass_iommu(Object *obj, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    return vms->bypass_iommu;
> +}
> +
> +static void virt_set_bypass_iommu(Object *obj, bool value,
> +                                              Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    vms->bypass_iommu = value;
> +}
> +
>  static CpuInstanceProperties
>  virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
>  {
> @@ -2656,6 +2672,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>                                            "Set the IOMMU type. "
>                                            "Valid values are none and smmuv3");
>  
> +    object_class_property_add_bool(oc, "bypass_iommu",
> +                                   virt_get_bypass_iommu,
> +                                   virt_set_bypass_iommu);
> +    object_class_property_set_description(oc, "bypass_iommu",
> +                                          "Set on/off to enable/disable "
> +                                          "bypass_iommu for primary bus");
> +
>      object_class_property_add_bool(oc, "ras", virt_get_ras,
>                                     virt_set_ras);
>      object_class_property_set_description(oc, "ras",
> @@ -2723,6 +2746,9 @@ static void virt_instance_init(Object *obj)
>      /* Default disallows iommu instantiation */
>      vms->iommu = VIRT_IOMMU_NONE;
>  
> +    /* The primary bus is attached to iommu by default */
> +    vms->bypass_iommu = false;
I don't fully master the PCI topology but I think you should clarify
which primary bus we talk about. AFAIU PXB's bus also is a primary bus.

Thanks

Eric
> +
>      /* Default disallows RAS instantiation */
>      vms->ras = false;
>  
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 921416f918..82bceadb82 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -147,6 +147,7 @@ struct VirtMachineState {
>      OnOffAuto acpi;
>      VirtGICType gic_version;
>      VirtIOMMUType iommu;
> +    bool bypass_iommu;
>      VirtMSIControllerType msi_controller;
>      uint16_t virtio_iommu_bdf;
>      struct arm_boot_info bootinfo;

