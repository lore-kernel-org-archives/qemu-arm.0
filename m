Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp4855822ejc;
        Thu, 12 Jan 2023 07:16:22 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsytDS4l38CrdZpCJEFaJuwhR+l/5Xmm/gy3ewMNpMeVnvq/3tbRolKtfcZRkVxD8JD8h3W
X-Received: by 2002:a05:690c:a9b:b0:4da:7054:b7dc with SMTP id ci27-20020a05690c0a9b00b004da7054b7dcmr1647819ywb.21.1673536581778;
        Thu, 12 Jan 2023 07:16:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673536581; cv=none;
        d=google.com; s=arc-20160816;
        b=ys++M+7GjtCpipygVAz81HqvYgqQxUjcmcSpYh7LJdT3uK6lv21Vq8k4rb2hujD/M7
         KOaUnrQS+UCuA2x4rM3Yz2tD1kTeetJ1X5HV1cQqYjc0vILdZHhrZBNNIOndYC0txqVV
         pPRw5RmCyOtk/WkQEvi+qp2dhDURTmzqe3ZL9cFCcq/GshWvDia7+rDhOCmtv/cWzusG
         gVlj4JeL4p30L5+iRpf2eU5OLhqCfF6THH31N6UaT0FvanAmNIWdW/7y7QxvHv5qVCZF
         NiYjymRnGpxkFOrDBkl07+RwCSvZ3gj3meUQxGhM9n+4k+CsHk+A7rq5nhkqSbDJjZ26
         lIsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=sWN8rSLzVQeG+uFfub0gBrNQWZ8Wb/3TIwFhlooTImo=;
        b=gJ562lSWLgQCbdcDDyYlhyJLbfrcgFCgCUI7xAl3NDMSzbdkXHCfApuPYi099YbGBT
         l3AAM8c7ixoJtdCAuK6vkgfkeDhpCE0qeEJG1jHEHJHLj2oedFdCK8QnUcM8tZzqNhiP
         gQMf/M4VpMcQVkumm+AiKzRNaYPl6tnthPXCHE5KOHqrOW//ri3IDWXklhKCNVrkMdfJ
         Pqsv3bgSC52U3PuWg7I92Xql2S1DebOE0SGCB3VCdahecNCzgDOu6/nkBret0eQLg5G0
         Fi3EILB2XmGehEoCSELNLknxbzFUxkuz5SP6nikbwxWEzenmb4Er5JYjrkKWSdu3ceJn
         vn9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ts+JItkN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q7-20020a37f707000000b006f4db55e8a8si9864436qkj.62.2023.01.12.07.16.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Jan 2023 07:16:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ts+JItkN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pFz88-0005aR-Ez; Thu, 12 Jan 2023 10:04:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFz82-0005U2-2O
 for qemu-arm@nongnu.org; Thu, 12 Jan 2023 10:04:31 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFz7w-0007Ut-VV
 for qemu-arm@nongnu.org; Thu, 12 Jan 2023 10:04:28 -0500
Received: by mail-wr1-x42f.google.com with SMTP id t5so13965256wrq.1
 for <qemu-arm@nongnu.org>; Thu, 12 Jan 2023 07:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sWN8rSLzVQeG+uFfub0gBrNQWZ8Wb/3TIwFhlooTImo=;
 b=Ts+JItkNlw+OyFPxjg6tcHWV3keT/z7WpyJxh+wmsd+PTUUVP9WQjCcn3tVbr/eWqW
 0PEVL95OYBTupQGrVljC0zsqkbwC0OZrIc3JgW3hUD6SWJpYH8dgSxb7qJnuIWdd+GZU
 gVnEBTPFo9gxTEMBXdAj4Tn/aIQpiOUE9djeuP4i51KXeA8aSdpkPK7l2YorMeUCl6oa
 4S7bK65OFW+k6NDanqJAJELnJqgLA6UHYEwfXwPTWpsjsGO8Ip5gdjG1+i5gxWrATqAN
 Ch4FGOqwgyUYme/19b+16B/1X6J7W/o9y8Qj+PAVtxlPpHeqbG/HmMmIn393G3PAkR5p
 Xa9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sWN8rSLzVQeG+uFfub0gBrNQWZ8Wb/3TIwFhlooTImo=;
 b=Aiannni9Cnz6z5S5s0cYEcw7cCqe8OqSyNr1MH42M+HsFjdj1OsKhYAUWvkdirUMXo
 tAgqMre+TC8jOzvOcr2hFWd7WVU6PA6KpUTTfE1/b0kl+XlEy3wxQ02A5BOkJl1AoFCi
 RJ+so6mCINGzycP5kenjYsgICN+J4B93RTu0mxlYJBrxrDbUz4sBgBdGwL8dZ6Ho7Jcd
 j/kczr2lD4v013YQg7Rp6T/gcJ4nRg3z0hFxry9wfaSFmEadODYSC5I68/9aODccNnrJ
 0fewXuSG1zcOmlkwbNyALpwzKEnE/Ad01rVAsX/SZvziT+wK7V/1Q9GfNMotKoP8GqZp
 V8sw==
X-Gm-Message-State: AFqh2kr1A5LICHnpO5teMWYgmByqnau7cqAm76K6I6wTbtMCw14/Y43z
 ruppgh6yoAzWXKw9YYxWNuVagA==
X-Received: by 2002:a5d:46d0:0:b0:294:381e:1c7d with SMTP id
 g16-20020a5d46d0000000b00294381e1c7dmr25104120wrs.8.1673535858832; 
 Thu, 12 Jan 2023 07:04:18 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i6-20020adfe486000000b002423dc3b1a9sm16328836wrm.52.2023.01.12.07.04.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 07:04:18 -0800 (PST)
Message-ID: <e879c284-5021-2f63-0269-5e0b09bc31a7@linaro.org>
Date: Thu, 12 Jan 2023 16:04:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v6 28/33] hw/isa/piix3: Merge hw/isa/piix4.c
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
References: <20230109172347.1830-1-shentey@gmail.com>
 <20230109172347.1830-29-shentey@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230109172347.1830-29-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: c6Yv1+r46kzq

On 9/1/23 18:23, Bernhard Beschow wrote:
> Now that the PIIX3 and PIIX4 device models are sufficiently consolidated,
> their implementations can be merged into one file for further
> consolidation.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Message-Id: <20221022150508.26830-37-shentey@gmail.com>
> ---
>   hw/isa/{piix3.c => piix.c} | 158 ++++++++++++++++++++
>   hw/isa/piix4.c             | 285 -------------------------------------
>   MAINTAINERS                |   6 +-
>   hw/i386/Kconfig            |   2 +-
>   hw/isa/Kconfig             |  12 +-
>   hw/isa/meson.build         |   3 +-
>   hw/mips/Kconfig            |   2 +-
>   7 files changed, 165 insertions(+), 303 deletions(-)
>   rename hw/isa/{piix3.c => piix.c} (75%)
>   delete mode 100644 hw/isa/piix4.c

> +static void piix4_realize(PCIDevice *dev, Error **errp)
> +{
> +    PIIXState *s = PIIX_PCI_DEVICE(dev);
> +    PCIBus *pci_bus = pci_get_bus(dev);
> +    ISABus *isa_bus;
> +
> +    isa_bus = isa_bus_new(DEVICE(dev), pci_address_space(dev),
> +                          pci_address_space_io(dev), errp);
> +    if (!isa_bus) {
> +        return;
> +    }
> +
> +    memory_region_init_io(&s->rcr_mem, OBJECT(dev), &rcr_ops, s,
> +                          "reset-control", 1);
> +    memory_region_add_subregion_overlap(pci_address_space_io(dev),
> +                                        PIIX_RCR_IOPORT, &s->rcr_mem, 1);
> +
> +    /* initialize i8259 pic */
> +    if (!qdev_realize(DEVICE(&s->pic), NULL, errp)) {
> +        return;
> +    }
> +
> +    /* initialize ISA irqs */
> +    isa_bus_irqs(isa_bus, s->pic.in_irqs);
> +
> +    /* initialize pit */
> +    i8254_pit_init(isa_bus, 0x40, 0, NULL);
> +
> +    /* DMA */
> +    i8257_dma_init(isa_bus, 0);
> +
> +    /* RTC */
> +    qdev_prop_set_int32(DEVICE(&s->rtc), "base_year", 2000);
> +    if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
> +        return;
> +    }
> +    s->rtc.irq = qdev_get_gpio_in(DEVICE(&s->pic), s->rtc.isairq);

Pre-existing; it seems this difference with PIIX3 can be removed
because already taken care by calling isa_connect_gpio_out() in 
mc146818_rtc_init()?

ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq 
intercept_irq)
{
     DeviceState *dev;
     ISADevice *isadev;
     RTCState *s;

     isadev = isa_new(TYPE_MC146818_RTC);
     dev = DEVICE(isadev);
     s = MC146818_RTC(isadev);
     qdev_prop_set_int32(dev, "base_year", base_year);
     isa_realize_and_unref(isadev, bus, &error_fatal);
     if (intercept_irq) {
         qdev_connect_gpio_out(dev, 0, intercept_irq);
     } else {
         isa_connect_gpio_out(isadev, 0, s->isairq);

Having:

void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, unsigned isairq)
{
     qemu_irq irq = isa_get_irq(isadev, isairq);
     qdev_connect_gpio_out(DEVICE(isadev), gpioirq, irq);
}

What do you think?
