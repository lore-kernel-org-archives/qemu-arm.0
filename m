Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1613393ejn;
        Fri, 28 Oct 2022 15:36:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7VGcutwwQQ+eOF9EnUKd/E8quL5pzDTAjKErB5MOBCQPoCrt29Z/J5B5qtYB3imn0K9EqX
X-Received: by 2002:a37:6c02:0:b0:6fa:b76:723a with SMTP id h2-20020a376c02000000b006fa0b76723amr1219199qkc.277.1666996583834;
        Fri, 28 Oct 2022 15:36:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666996583; cv=none;
        d=google.com; s=arc-20160816;
        b=vCbnFkfa50jSoXsRMRa5iVCGVzjOY5btYzIURW1zDZGN95/ZMrUhheBBMTIGHuBhsK
         yxoCyZnVGdQNluiLhIKqI2MHd0F9WUOogm0+Qy65u3f5E1FkE8vFatOUrnWnB0JGt3Rn
         ZIpT57h3fZ/9hnYAqp7tCKi/xc4dM305Cn2yfiyxaFiBDOxrba6+ks+udSeweddO+4GN
         MYUaYID/HydRg5bJJCRMRbqQD6d7aN6tyKrT5fC7b9WEcMT3VlakHNFfjW7pyKEGAHkE
         me4vSZPGpcSbPibH3AT+B5in2GZ8BWv5Fk2WkdUkT6vz/m9t+XuHqj6VPyiYU+SpFthl
         Cvwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=dMHuzZOle9sbJ27011SFv5HHUtj5M9vidZqH47LXNNk=;
        b=q+3hS4/LKv0y9gT4Cnmr66f03nq7YIuY2iLg/wrZJdvQSRgFXu6xawBpFT/kRL/JaT
         ll4RrZuvGRtVvJqbWmo3Ro/rMDLzLFObavH033UfmA3ngPg7SL+EZuasdDc+PNlOcUiI
         mNFdfH7KSNDXnnoOAGZnPkLTPs+wU2t9ZLURQ4mBt/E2yPo+bG9A4zKgfiJ75H99J9UD
         n7xf8AOgwUsrZok0zY/zhkVHO0gTlW8rIZUZxh9kf4kJYx8tMh4tcWNd0E14n4g8wZBx
         alSd46Ru7tjLcEy49BO6rdmqLbCvZ6s4IKtHZ/538UPU/PL4clPhHkjZPwrlzquhDsAO
         mQmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PX7JknSR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c1-20020ac81e81000000b0034306280fe4si3697734qtm.196.2022.10.28.15.36.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Oct 2022 15:36:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PX7JknSR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ooXx5-0003N5-4o; Fri, 28 Oct 2022 18:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooXx3-0003Ml-Eb
 for qemu-arm@nongnu.org; Fri, 28 Oct 2022 18:35:45 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooXx1-0007VB-LV
 for qemu-arm@nongnu.org; Fri, 28 Oct 2022 18:35:45 -0400
Received: by mail-wr1-x42b.google.com with SMTP id h9so8363974wrt.0
 for <qemu-arm@nongnu.org>; Fri, 28 Oct 2022 15:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dMHuzZOle9sbJ27011SFv5HHUtj5M9vidZqH47LXNNk=;
 b=PX7JknSRjW+oYpE4sGKEbxaT/s9QS0fgd7g2VWJI+mjTOlZHQvoftqmnNHNt8EjlmO
 +d2yu1WhOEjj8EW3vDRo8iUvffFTn4AwV9VCnoFAekalBsqNgDw1v2i7FqKpgdd0LRBS
 bnjQDKSlwypCFkaaT9lIY2u/kTIp97PGEh7LKhPsiuyN3glzHna1MNSoDJ4RjLVH2pcn
 ZxOCV9kTMWFAxMoFPJye0uPWq8ZlE+6gamB5GMYadbb513KPPjCq2OWSvt5d64vXW06H
 bu8UNQXcrQtc4T6iVOuPl8zO+sSdUXOPoUjvd2RErEIV5j6PlIuh3FFJCxU5nyTrsHlM
 S6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dMHuzZOle9sbJ27011SFv5HHUtj5M9vidZqH47LXNNk=;
 b=pOZyowmLVjn7cJEmj64KqLPqQKo5GP1QXBG24RQQb3guQr/xdmCYPeUtWXTH2Ru0Ue
 WCFD/vJuXSaxHHqsk8/O3DU9hJPSJy1+CMt10dF51IDmGbMgWeTseW0/ZcVRSHvmylF8
 5TT9E+rWI9M9+pj1eifA5VrjGGizlDMvR5FGFW9eM/2P80WbOo9SoWLkvnzf4T/QBblN
 W/DoK9C518Lqu58sV5CZD3nLgebB0TMfkcUQLqnhtiHLBjiRf5TOs9NOj57qWpLgUMyP
 orig4/yiRroZ1RQZf6O3C7v/e+tEY5TsqCfBpoCFZY78rT57u6E+lTgap+x+SvPna/iQ
 xcCw==
X-Gm-Message-State: ACrzQf1ZY/fUwP++B1Khsz6OurQEoidUCrCisBiTZID2ACx9DZi0/uNU
 AKqa8XQuwsN/ZvZuSakqC0sy8g==
X-Received: by 2002:adf:d0c7:0:b0:236:78b8:942a with SMTP id
 z7-20020adfd0c7000000b0023678b8942amr822065wrh.348.1666996541549; 
 Fri, 28 Oct 2022 15:35:41 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e30-20020a5d595e000000b002366d1cc198sm4493337wri.41.2022.10.28.15.35.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 15:35:40 -0700 (PDT)
Message-ID: <2d49657a-67d0-5d58-b646-23a4e30abc02@linaro.org>
Date: Sat, 29 Oct 2022 00:35:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v5 02/17] pci: Allow to omit errp for pci_add_capability
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang
 <jasowang@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>
References: <20221028122629.3269-1-akihiko.odaki@daynix.com>
 <20221028122629.3269-3-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221028122629.3269-3-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uXOVjZ7zPWWL

On 28/10/22 14:26, Akihiko Odaki wrote:
> pci_add_capability appears most PCI devices. Its error handling required
> lots of code, and led to inconsistent behaviors such as:
> - passing error_abort
> - passing error_fatal
> - asserting the returned value
> - propagating the error to the caller
> - skipping the rest of the function
> - just ignoring
> 
> The code generating errors in pci_add_capability had a comment which
> says:
>> Verify that capabilities don't overlap.  Note: device assignment
>> depends on this check to verify that the device is not broken.
>> Should never trigger for emulated devices, but it's helpful for
>> debugging these.
> 
> Indeed vfio has some code that passes capability offsets and sizes from
> a physical device, but it explicitly pays attention so that the
> capabilities never overlap. Therefore, we can always assert that
> capabilities never overlap when pci_add_capability is called, resolving
> these inconsistencies.
> 
> Such an implementation of pci_add_capability will not have errp
> parameter. However, there are so many callers of pci_add_capability
> that it does not make sense to amend all of them at once to match
> with the new signature. Instead, this change will allow callers of
> pci_add_capability to omit errp as the first step.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   hw/pci/pci.c         |  8 ++++----
>   include/hw/pci/pci.h | 13 ++++++++++---
>   2 files changed, 14 insertions(+), 7 deletions(-)

> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index b54b6ef88f..51fd106f16 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -2,6 +2,7 @@
>   #define QEMU_PCI_H
>   
>   #include "exec/memory.h"
> +#include "qapi/error.h"
>   #include "sysemu/dma.h"
>   
>   /* PCI includes legacy ISA access.  */
> @@ -390,9 +391,15 @@ void pci_register_vga(PCIDevice *pci_dev, MemoryRegion *mem,
>   void pci_unregister_vga(PCIDevice *pci_dev);
>   pcibus_t pci_get_bar_addr(PCIDevice *pci_dev, int region_num);
>   
> -int pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
> -                       uint8_t offset, uint8_t size,
> -                       Error **errp);
> +int pci_add_capability_legacy(PCIDevice *pdev, uint8_t cap_id,
> +                              uint8_t offset, uint8_t size,
> +                              Error **errp);
> +
> +#define PCI_ADD_CAPABILITY_VA(pdev, cap_id, offset, size, errp, ...) \
> +    pci_add_capability_legacy(pdev, cap_id, offset, size, errp)
> +
> +#define pci_add_capability(...) \
> +    PCI_ADD_CAPABILITY_VA(__VA_ARGS__, &error_abort)
Do we really need PCI_ADD_CAPABILITY_VA?

   #define pci_add_capability(...) \
        pci_add_capability_legacy(__VA_ARGS__, &error_abort)

