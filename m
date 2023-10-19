Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp810062ejb;
        Thu, 19 Oct 2023 14:41:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfqpeenamp6x77qgu10XC2XDJLIBUiT+toVFXlI6UON5DJAo1VVficA08EeWdjxLOSghkb
X-Received: by 2002:a9d:6a4d:0:b0:6cd:7f60:7791 with SMTP id h13-20020a9d6a4d000000b006cd7f607791mr12134otn.37.1697751664070;
        Thu, 19 Oct 2023 14:41:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697751664; cv=none;
        d=google.com; s=arc-20160816;
        b=oX6yb5l+YoCmUTy/PfyonthNxynS4dYD3yDwXQKVQ9HU6yMxG4ZY8BNNpTM/Dff+mw
         b9cMc/EKrikPWdHBhxSY7lOu+XFdkI2nMArllzT2bOxsOlJJ8gM7Kz3uIuyGnISpTiOF
         tLgD6rBbOWvjsDhkzDMdrze2y5zbHg1kYTMVyqg71wAz5OJW3sEDNeV4evhjaIS3+N+L
         YcapanGy2V8glsKOCqWQGp/fy14nykUTPn3DrdnyNcHdXbNc9UKrr1gqcyBhen7zdot8
         pvcHj4Cab14So48E6/97zQ9A5GHwIOSGzJQDNndInujQo1M1ZbEU9pitf9fZUGTsr1So
         DD8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=rbmDuYpvV88iKNjkf/AlL0vQESOVZTA9WYJH0rHE3Qs=;
        fh=/vOZnPXxCPPsuJbarjGE7d+dXktyplxTMeGPtGGEcEI=;
        b=I9SBRW1pipJkmbM2VPnhsn0uPMdwT9FLUsuWgtoZKJonakTd/GueVyyGJ5g2nyOEQT
         PVDgyyc3fCNCTW76Rhz0N5IJS2ZslNzZJHozNP2wXibHjYpcII2g9UX0LBFXco8jkydL
         cSDS9QOLm9kYoQXmOOqyOAdDvIXPOMAo1iq3mi0D46IEoQPpG7rRJf9R6kMzHWuIs7OQ
         9dP4zZX6nZrOgJ984SYo9aEjFsQin/RokrAPQuzLwmePHTxWSfDrzsQ5fRdNOFPTM/A/
         572v5v+yJt8NuH0F4e3prxgwnzsRa5N7vovY2EDYyc1x4qriD9Sf9lcgDuR8/ZwKD6z8
         E3sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P3YEnKlE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cp18-20020ad44af2000000b0066d0bd0bbcesi374328qvb.420.2023.10.19.14.41.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 14:41:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P3YEnKlE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtakY-0003cC-7A; Thu, 19 Oct 2023 17:40:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtakW-0003ap-KW
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:40:12 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtakT-0000A2-Gy
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:40:12 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-53ed4688b9fso145115a12.0
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 14:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697751607; x=1698356407; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rbmDuYpvV88iKNjkf/AlL0vQESOVZTA9WYJH0rHE3Qs=;
 b=P3YEnKlEgBOYYnKFSNxEDfaNSMB1VgPgnVcAF50a5PyajiJ5wukXknXY+eGfPqf59P
 fHRQ+43SmTuUK1YHgdZsSs8e485v7G16TOKK/5RCQqOfz/RYehv5d4tw9G22/eozBBw5
 ZPQWgoWN1k6y9X47TC6iWUUVlxsYEj7cncnasi7x9N3LXiUKoCigj8o9vmoVeIWRolg4
 VvuiJePE7lEudiVVzA39APnZ2TnjFPjGgvVMQiJ97Kqp1JL4CbLEePJeYBGtGyPjg/ec
 n+Wg5Tm4u4lYnQRV6e3N7ZlFNzu19uwppW1VM0mp9C77N3aukdCkEr+IlpjIsn+naP7w
 W9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697751607; x=1698356407;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rbmDuYpvV88iKNjkf/AlL0vQESOVZTA9WYJH0rHE3Qs=;
 b=R+xnuTKogB9AtML7NAEp03ay0ppBAwZ4OpfAIRUHu1L9Nm+wWxFMSLmscf/mFZc8qS
 JGjQTwU/Tp+DFQt/+9Q8bq/p7b2xxVkz5njcJZjn1TiC54gSCdWdjnt2bwf7oQhvhF5B
 30wJnU9WcStxFSE4BT2eebpFlNXilS/ASNLk8L1sOlI04OoUAI0QNgNoeYYj3w6c5ITp
 5YxenSVDEVUQ52vDNVcRvHxEdPaNbTju9TX3dCJw9zlZ9VxJXMIFHdWdxh0MFP1CtGoP
 OFuZMJ0o+xvTVKwvbpcnaIXqN3nQNfSvAZO2MxX5kPI6sSoMR317+uG/ayc9Cm9f4eyM
 7rPg==
X-Gm-Message-State: AOJu0Yx2hZR3BcsqgugItwwKTDaowyBbGvN8Bk8mqrziB9vNDs24Tzk9
 GnI+t9LQtETQCMhoCDzQOHw59A==
X-Received: by 2002:a50:d719:0:b0:53e:1815:ed0f with SMTP id
 t25-20020a50d719000000b0053e1815ed0fmr106515edi.31.1697751607172; 
 Thu, 19 Oct 2023 14:40:07 -0700 (PDT)
Received: from [192.168.69.115] (176-131-216-177.abo.bbox.fr.
 [176.131.216.177]) by smtp.gmail.com with ESMTPSA id
 g2-20020a50d5c2000000b0053e36dd75dfsm268482edj.35.2023.10.19.14.40.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Oct 2023 14:40:06 -0700 (PDT)
Message-ID: <1e0f77e0-5a93-28f7-8c7b-819366c3c5e0@linaro.org>
Date: Thu, 19 Oct 2023 23:40:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v2 00/12] hw: Strengthen SysBus & QBus API
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Huacai Chen <chenhuacai@kernel.org>, Beniamino Galvani
 <b.galvani@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Farman <farman@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Sergio Lopez <slp@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
References: <20231019071611.98885-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231019071611.98885-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
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
X-TUID: fYJtA8D0CQYL

On 19/10/23 09:15, Philippe Mathieu-Daudé wrote:

> Philippe Mathieu-Daudé (12):
>    hw/i386/amd_iommu: Do not use SysBus API to map local MMIO region
>    hw/i386/intel_iommu: Do not use SysBus API to map local MMIO region
>    hw/misc/allwinner-dramc: Move sysbus_mmio_map call from init ->
>      realize
>    hw/misc/allwinner-dramc: Do not use SysBus API to map local MMIO
>      region
>    hw/pci-host/bonito: Do not use SysBus API to map local MMIO region
>    hw/acpi: Realize ACPI_GED sysbus device before accessing it
>    hw/arm/virt: Realize ARM_GICV2M sysbus device before accessing it
>    hw/isa: Realize ISA BUS sysbus device before accessing it
>    hw/s390x/css-bridge: Realize sysbus device before accessing it

Patches 1-9 queued to hw-misc.
