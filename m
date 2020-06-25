Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1126909lfm;
        Thu, 25 Jun 2020 03:02:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkSY9/VHPWqBOBiD3/NI9fbJuopoEO/yGYqRLWpc5WQnFp3MMcRcmb+3KZhNJNSjRz7lkn
X-Received: by 2002:a5b:b49:: with SMTP id b9mr46694037ybr.343.1593079351483;
        Thu, 25 Jun 2020 03:02:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593079351; cv=none;
        d=google.com; s=arc-20160816;
        b=SKD7PJrxP94s1HFTR+YppS4L+7EreMrpf0deL02XUW0RdK+Dyg03NIeBk1Mdee7qYW
         6+MFobKBq5/Ng6XJDYFJvs78PpOq+npr6rKxW23AQe6D2y4OfXKli1rDRmd+jZ+OrrUV
         AA0woGlWH6g1rA5vafNtb8k9ED7Mzsih3cGDmMkxBksNpCi9B8dcFBZlUcxjC/DLBHWM
         bBLOH8pHCR/oWUGXDoayGJ3pirQANNkxta4XAvIm9lmh4pzZeeDbkMqHN/uq8a+KBC1A
         vJmEHNdQawOAIGa/bjDbdbzedKebKMxxAAxNTmzNFmaoutpRZa3G7xV0udyZfTREVHsG
         vabg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QDHmhdyLqCIt8cj5fl5kE0ahQW/35hOFRU/Hkf8e9gE=;
        b=H2s1k79UoJAU1T57jE0bUSHRm9zU6qjA+qpVs2QNa4IjfR126A/dNKpXfFN5fb4/tW
         idUKM4/QE7qdd3Zxa3Y+FlNiKZq1nai1Sa7RkFb6jjn6XSCYpbmprrDQ8ZnIet+QZhf2
         G2e651oTArdIywETQckSsEf/nSlyag/V0EbcWy7q3MJq/+ZWFO4MvlDRXwHrj1Z3kswW
         aoQxlHemAru0V/YOj9R2emHmOQw0DT9KTxMWhg1s3IJ6deYQu7gACujBv43A0jaiDaFa
         cSZVj7M1HkJvBSA3F3K1fCaHvFWL0Gj+3ZHZceguazjZDHycMKDGnxsCMTOLAzE7SMte
         OgSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VkaXzJxB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x4si21912330ybo.293.2020.06.25.03.02.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 03:02:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VkaXzJxB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joOiE-0005sO-S5
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 06:02:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joOhA-0004n8-UT
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 06:01:25 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:34770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joOh5-00016J-Jq
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 06:01:24 -0400
Received: by mail-ot1-x343.google.com with SMTP id n5so4738945otj.1
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 03:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QDHmhdyLqCIt8cj5fl5kE0ahQW/35hOFRU/Hkf8e9gE=;
 b=VkaXzJxB4n0UW91ebEBkoVJOgOllQu0k++WW6Espo9Vhl9B7F1HPA723vuxHs7JbtM
 4tk7j6WjtQzYMHZiysRRt3VE/BtcVqPjrQNJw70E6MKuJ65082yqFt79sq1x8ej/l2sI
 lWnTSLnfky3v2bxI9fTSDMbYe6LiKpNK0ebG+rOm2MiHNjddNK+X034Zojo8QXVTBIgh
 K+g9BE2M42jCL3Z0AbFVxHEcc4jw7Fer68iHAkmU5U1hjrTxvIPYyzRru5ZrohxPT4UZ
 HmgMGSRs+6MzNiwEBvrdPiE6kIM7nHKXT0ZFf3cER4ZJTuctheNL6FvvnlruInPNRTJR
 ouDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QDHmhdyLqCIt8cj5fl5kE0ahQW/35hOFRU/Hkf8e9gE=;
 b=QZ5pp20G5CZOOmlVqw39zM4eOySjc+dKXYCmGElszNA1Pk5EOAuuiyNl3jMO7kELpU
 f3jokzL+2A0ZzEigL+YmCyF8f+Ioi30ijTmb/qs99fULLIzNI63IQXTbMC2CXNRpjCKM
 f5Dy5VUkxHHzhJ55xgtZTI8J2hdRpsyIhNLOZCOmHXxOeYhOZhfcCpQ+FyfIrsc8r83L
 u/YyyD2o4fkO2wAr3NZG9zo+WBa41Nte1cjLydimZ85pKVSW1H0J7CNdK8KRrzwe327b
 QyHdkz8R/DU4gqE/1czfdOmqCd5eRkeY1PRwWzRCAO4RBzGBIOnLAzxC5ye4XwNBsJR5
 +Plw==
X-Gm-Message-State: AOAM530XGSPMvAxZIvdeL4E3grQOtSzETXltGWPvWVDZnPVjuDTQCXnA
 xzzBw+o7PJJMmUkQtgVkGhaxIAXeSInplVSbaDoviw==
X-Received: by 2002:a4a:221a:: with SMTP id f26mr26811882ooa.69.1593079278026; 
 Thu, 25 Jun 2020 03:01:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200624132625.27453-1-eric.auger@redhat.com>
 <20200624132625.27453-6-eric.auger@redhat.com>
In-Reply-To: <20200624132625.27453-6-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 11:01:06 +0100
Message-ID: <CAFEAcA_gDTuW_13a6MgC1XBMtR1XMkxAY39iUWRePp2U6Ow6XA@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] hw/arm/virt: Let the virtio-iommu bypass MSIs
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 bbhushan2@marvell.com, Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7nAB7lYqQfE7

On Wed, 24 Jun 2020 at 14:27, Eric Auger <eric.auger@redhat.com> wrote:
>
> At the moment the virtio-iommu translates MSI transactions.
> This behavior is inherited from ARM SMMU. The virt machine
> code knows where the guest MSI doorbells are so we can easily
> declare those regions as VIRTIO_IOMMU_RESV_MEM_T_MSI. With that
> setting the guest will not map MSIs through the IOMMU and those
> transactions will be simply bypassed.
>
> Depending on which MSI controller is in use (ITS or GICV2M),
> we declare either:
> - the ITS interrupt translation space (ITS_base + 0x10000),
>   containing the GITS_TRANSLATOR or
> - The GICV2M single frame, containing the MSI_SETSP_NS register.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>

>  static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>                                              DeviceState *dev, Error **errp)
>  {
> +    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
> +
>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
>          virt_memory_pre_plug(hotplug_dev, dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
> +        /* we declare a VIRTIO_IOMMU_RESV_MEM_T_MSI region */
> +
> +        if (vms->msi_controller == VIRT_MSI_CTRL_ITS) {
> +            /* GITS_TRANSLATER page */
> +            qdev_prop_set_uint32(dev, "len-reserved-regions", 1);
> +            qdev_prop_set_string(dev, "reserved-regions[0]",
> +                                 "0x8090000:0x809FFFF:1");
> +        } else if (vms->msi_controller == VIRT_MSI_CTRL_GICV2M) {
> +            /* MSI_SETSPI_NS page */
> +            qdev_prop_set_uint32(dev, "len-reserved-regions", 1);
> +            qdev_prop_set_string(dev, "reserved-regions[0]",
> +                                 "0x8020000:0x8020FFF:1");

This hardcodes addresses and lengths that are in the
base_memmap[] array for VIRT_GIC_ITS and VIRT_GIC_V2M,
so it's setting up a bear trap if we ever decide to
move those. Could we construct the string from the
base_memmap[] array entry values instead, please ?

thanks
-- PMM
