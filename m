Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2051102ejf;
        Mon, 26 Feb 2024 05:26:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVwNecasxecFC+br2/u8atv7yZA2x6GLb5RYppPtGw6ZtywRDqa7Mjl+3pLR9ijyNQZmDJJ9yDPA9AJc+NjTK5esQd3wTxZ
X-Google-Smtp-Source: AGHT+IG6Udz66v0+5brZ2GJG4JJRqEVXsKQ461g2bhi0rz632RdbZZJ6X7uEmkCj73tf2mwQzzpL
X-Received: by 2002:a25:9012:0:b0:dcf:464d:8ec3 with SMTP id s18-20020a259012000000b00dcf464d8ec3mr4159109ybl.3.1708953977911;
        Mon, 26 Feb 2024 05:26:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708953977; cv=none;
        d=google.com; s=arc-20160816;
        b=iEQdffgIGG52DWEZY/Kv0Whr/xYiKUYD5lyeDh1bDooo+ZzMO3EBTsgSyXoY2Z++/Q
         ehUxk8mVDpYaX/58rRahrl1bGO7wvLV7UGBK48c1p6dyrqnmUZiC9zV+1OybZEeH3PlP
         EBH7cc2EXupwleWHGLnuQ/Zzww+w1mJ+NDI4vqr/YPCrU11zHfVg70EI4064mez5RGnB
         wvin4bnT7pNJ3c66VLZUkmsiPhy58xxQMTMKfAKi4phkngJPN/8xxZTLwjMkjSKCroT6
         yTlslKhsNu+R8pSebyenM7JlfQARoMZo6ccYqQrES5hCkg9BBPS7vtQEQdkVpcfhl6YA
         ydrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=M0pSgwdUsCu4IZL3guvtFpnGMwtBnvo50lTuekTfo38=;
        fh=ln5oJcdK29z4ccodaKLOtL0mZ0cURU5YDbQkdp5Af6k=;
        b=wbnS0HnafFWdi26H7bwbmSF1WKYmcnv3Uh6iAI7dbKig02vrKZTFwmjvCnjKhrPXCp
         MYjbUdUdcTHP+ZfkGM//OZU0AOoWp7AV26jgRFelnWW2j7JIlR3Tcx9gvolvvIVl71qe
         QzOITj7oA/1Db0KP1fvPZjzdi9NEqO7OhcwZ6MlHsk0SHBtT8IlEls6a9CXbVEgP8CVk
         HFOq14DzKXlT5UUfBXGAhNM7o7I5LcTqfI/maTIYN5CRGXNIMjQlA9sK9MVQSnwSaf2f
         N3ac1a+llzgMdzN6xsb8iYF3ytMMJ9x2BZp82Ka+utmq6l1xosJej0loxjb1W4n9gEPr
         8RAQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wMzgd0aZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h24-20020ac846d8000000b0042e7a34d286si3858340qto.672.2024.02.26.05.26.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 05:26:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wMzgd0aZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1reazd-0000Ov-B2; Mon, 26 Feb 2024 08:26:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reazZ-0000Cp-Rt
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 08:26:02 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reazX-0001u6-RY
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 08:26:01 -0500
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a3566c0309fso314615466b.1
 for <qemu-arm@nongnu.org>; Mon, 26 Feb 2024 05:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708953957; x=1709558757; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M0pSgwdUsCu4IZL3guvtFpnGMwtBnvo50lTuekTfo38=;
 b=wMzgd0aZaBgQYgs5UiUy5r3+Tp4cUgypdqwlMsZBzOQ7jbuSIqASKQYGOsyHQW5AY1
 eOK1OWLRKEHQ4spP35rd/mRIR2PBTEd/u/nUkwaSivq3wrue+cQID1AhRp8wBEYOoOJf
 kPOCKiJuGmlwV8IZ9NVx9/kZ1TyyklVhc81NK32hKhP4Qweo1Slf++VA7D87K1ZFcnQ7
 Npn9ssEgbEXdliPU8o2b3Zig3o7c7VFQq21OeonH8e/cyoXrmikQV4/WWIuhiXfpCE+r
 Spxnblsyf5Y3sI6fOaVGxjJsbxtMFUXSRtXvDpMa7icl9xNiZ/dUnbUYE96RiVnTd745
 RJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708953957; x=1709558757;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M0pSgwdUsCu4IZL3guvtFpnGMwtBnvo50lTuekTfo38=;
 b=GwZAKfMZmDyucavWBUB59FjCz8U4J/PxMYZg1v9szNWWMh3+ubfPXwxrnv0HJgSEIu
 VgFGX4v3jEW1gKjIWhXi2cBYWAFMTDC2c3rH0KUMqxFoYglrJVzEY05q5LTrqLS0LPRm
 OLfrzox+6dh1TL5Uhx6LjpOCgoGJnSv8VCGBxdIrYv3uhNBjwQCH5SUSE/ELirHoIB1p
 2HCt6JmZmgyG0aB71EujEHDtoUs1bRf5Gm/82l/LBH8DTzXW6tpi04Oew7LGIXyBQxdq
 Qx3pdy30tnCBqAD8irVuLdO7HaP9i9R0UL9sNt0prnblAMXRGZTWZ44MaVv6WrRDbDBE
 ZsKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLfZgk05S8X+JXyw83TylQwMZyQ7NtbLpyL2nyqaV52/DLcG38INRCbiz0E28TEgNxR37W8DJKh74Rgd7liiPE9Bxy
X-Gm-Message-State: AOJu0YyIOGoSBfIXp6uYslUFJ4fAwqE8D9tJ1g3mHVnPHQAGUAiCYz8p
 3XSe6jUsfwdyyG9uNKYiyPG+Z2L2MJfsTuivByHrjRvJ5hzOh20dLSIg9PcFaoU=
X-Received: by 2002:a17:906:c28d:b0:a3f:c115:3ac8 with SMTP id
 r13-20020a170906c28d00b00a3fc1153ac8mr4713854ejz.43.1708953957572; 
 Mon, 26 Feb 2024 05:25:57 -0800 (PST)
Received: from [192.168.69.100] ([176.176.164.69])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a17090612cf00b00a3f480154a3sm2415265ejb.65.2024.02.26.05.25.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 05:25:57 -0800 (PST)
Message-ID: <2860d4d6-4b5c-4867-a7f5-99e9fa6c53db@linaro.org>
Date: Mon, 26 Feb 2024 14:25:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 13/41] Add BCM2838 PCIE Root Complex
Content-Language: en-US
To: Sergey Kambalin <serg.oker@gmail.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Sergey Kambalin <sergey.kambalin@auriga.com>
References: <20240226000259.2752893-1-sergey.kambalin@auriga.com>
 <20240226000259.2752893-14-sergey.kambalin@auriga.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240226000259.2752893-14-sergey.kambalin@auriga.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: kVncOR8G1cSb

Hi Sergey,

On 26/2/24 01:02, Sergey Kambalin wrote:
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>   hw/arm/bcm2838_pcie.c         | 82 +++++++++++++++++++++++++++++++++++
>   hw/arm/meson.build            |  5 ++-
>   include/hw/arm/bcm2838_pcie.h | 53 ++++++++++++++++++++++
>   3 files changed, 139 insertions(+), 1 deletion(-)
>   create mode 100644 hw/arm/bcm2838_pcie.c
>   create mode 100644 include/hw/arm/bcm2838_pcie.h


> +static void bcm2838_pcie_root_init(Object *obj)
> +{
> +    PCIBridge *br = PCI_BRIDGE(obj);
> +    br->bus_name = "pcie.1";

Shouldn't we set the bridge name using pci_bridge_map_irq()?

> +}
> +
> +static void bcm2838_pcie_root_class_init(ObjectClass *class, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(class);
> +    PCIDeviceClass *k = PCI_DEVICE_CLASS(class);
> +    ResettableClass *rc = RESETTABLE_CLASS(class);
> +    PCIERootPortClass *rpc = PCIE_ROOT_PORT_CLASS(class);
> +
> +    dc->desc = "BCM2711 PCIe Bridge";
> +    /*
> +     * PCI-facing part of the host bridge, not usable without the host-facing
> +     * part, which can't be device_add'ed.

This is the host-facing part; you add the PCI-facing one in
the next patch.

> +     */
> +
> +    resettable_class_set_parent_phases(rc, NULL,
> +                                       bcm2838_pcie_root_port_reset_hold,
> +                                       NULL, &rpc->parent_phases);
> +
> +    dc->user_creatable = false;
> +    k->vendor_id = BCM2838_PCIE_VENDOR_ID;
> +    k->device_id = BCM2838_PCIE_DEVICE_ID;
> +    k->revision = BCM2838_PCIE_REVISION;
> +
> +    rpc->exp_offset = BCM2838_PCIE_EXP_CAP_OFFSET;
> +    rpc->aer_offset = BCM2838_PCIE_AER_CAP_OFFSET;
> +}
> +
> +static const TypeInfo bcm2838_pcie_root_info = {
> +    .name = TYPE_BCM2838_PCIE_ROOT,
> +    .parent = TYPE_PCIE_ROOT_PORT,
> +    .instance_size = sizeof(BCM2838PcieRootState),
> +    .instance_init = bcm2838_pcie_root_init,
> +    .class_init = bcm2838_pcie_root_class_init,
> +};
> +
> +static void bcm2838_pcie_register(void)
> +{
> +    type_register_static(&bcm2838_pcie_root_info);
> +}

Please use the DEFINE_TYPES() if you have to respin.

