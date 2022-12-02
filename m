Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1248266ejx;
        Fri, 2 Dec 2022 04:26:20 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6G4BjdfA6XEvGoV0ktA/RPZzgYsrcKjzn1UyV3Twwc4tWykGKGB+7w2iMnK80oozm2cUcJ
X-Received: by 2002:a37:bd01:0:b0:6ec:53ab:90ee with SMTP id n1-20020a37bd01000000b006ec53ab90eemr65001364qkf.415.1669983980124;
        Fri, 02 Dec 2022 04:26:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669983980; cv=none;
        d=google.com; s=arc-20160816;
        b=WuQLO0zCQ8uoWBRxi9w52vTlKm0ainAe6Ncg4KsPS3cJnF6Xpn2jMNw9K4hqGHVYz6
         uJGy7c5yyBA4IbvXuvtUrnu8BIz0L/DUkloUzDQygNl30tqZMkrWW8WQZ9N9U4c24PYT
         ICBNt2IVLAB1PkFK4mkrfJ7EbNTD283XBp/QNilwco/EaelYSAzF3JbPYnBl09cEPQgn
         fupdJUr90PxlOh21TIB2rUoKU+vpDdkux6/j74hyOIc6TgbSHLfge4rUWu3qBqnifw6e
         OEl5fzNbm/4OC1aXTvfW1hx3OOz45ZwOiY7hdpStr5lOyX3AX2yJZB+6C7MELZ3c7eR3
         6VkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:subject:from:references:cc:to
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=DKYgmLMvch4czlAYGEg7apgs2lUtKUmzPUUeulSUXnA=;
        b=hwVQ+7m7qQR3ReOTsjKDj/1ogoOV2qVNIC1K5RrSygby993a19+uLbmIiPqgTyo1sM
         zHHmrMUQDjAOL345Hbhz4mqt+4weu/TyUqFu7u7lYgrrEgs4JdCGPQknXQROjkOcNyOc
         OgWrL39DCkWrrso2bL/ttk+NMvylgfa1nXukANgOdY/MfYz2vgJG2Tyb9+kg707VfglE
         aI6bHJsDlLeDVUMavA+dl91h6+dAPATsIYfW5AC03j8Vav+hMF8qnENhcWXLFFPDs/OK
         7DHtwjXzMGaLjm11d3r2pHrJQwB4uKQEHJKc25pwD2qxar6Mojegi+I7j+FGhpvShFzV
         quPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MLzhe1tg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m11-20020a0562141bcb00b004c6de1679b6si3889905qvc.93.2022.12.02.04.26.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Dec 2022 04:26:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MLzhe1tg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p156r-0007HD-2k; Fri, 02 Dec 2022 07:25:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p156k-0007Ed-Ls
 for qemu-arm@nongnu.org; Fri, 02 Dec 2022 07:25:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p156h-0000UF-R9
 for qemu-arm@nongnu.org; Fri, 02 Dec 2022 07:25:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669983930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DKYgmLMvch4czlAYGEg7apgs2lUtKUmzPUUeulSUXnA=;
 b=MLzhe1tgtD2N8j5RhSekq4/7CrR0joHmijZkcWIlFgg4PtuMRgsvBtPmamwHTYDFs+BdX7
 bPx/UoVAsCHPY1qz7+ul18WJI4UXFvmb60Khq6RPhDKU0QwB14kFZmxCcX1FtWOAYgueLX
 ETtXCNWY5gxLEjC8mH4JE8FZbgJhO38=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-626-a8uP2TvjPKOabtQepAtk7g-1; Fri, 02 Dec 2022 07:25:29 -0500
X-MC-Unique: a8uP2TvjPKOabtQepAtk7g-1
Received: by mail-wr1-f69.google.com with SMTP id
 l9-20020adfa389000000b00241f907e102so1024602wrb.8
 for <qemu-arm@nongnu.org>; Fri, 02 Dec 2022 04:25:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DKYgmLMvch4czlAYGEg7apgs2lUtKUmzPUUeulSUXnA=;
 b=jo1lO1IXc/W6pySA3+I/KV/UwzUKLoYsdXoa9Amz9DVa1bf32tcZmNybjHpLQA3I3k
 zM/ybOklcr1p6Q9+Qeum/ZYKxIH+pVFgMg+5Mg6UsOzgmyc4DgQk1oYYh6XXZ/R/gMAK
 qmfan5dbxXQIIYyMiK+dtINqrqrHsDScaED+OUldWVIKq5klMr/mwTj7yo7YXXD3n6DN
 MsFB/I4KhHyTmPMkvhG7dCx3KOws2Onz8wgfPi7rwcABmPZjVkU366DyhOUMd4YNog5i
 Plv0MdtImyem5ahGYvUKkJ3/1Nr7Cyht8FenJKI5wJIAZMQtTR7Zpi3L26sPHxoJ/pBf
 dJ7w==
X-Gm-Message-State: ANoB5plQVoDPA1CYCwQwz0Zi+zR+yfDg2xWaOx2E88VsBuPPH4eVOUVO
 lS+U51BlZ4X/KBTvduT5qu0yIk+5UQxSU3xhB8KetxljUpYxoWY/w7nDrRBvbHGXpRaFDfKkGol
 XtzR/LKE7MfFq
X-Received: by 2002:a05:600c:15c5:b0:3d0:7909:c363 with SMTP id
 v5-20020a05600c15c500b003d07909c363mr6876001wmf.122.1669983928295; 
 Fri, 02 Dec 2022 04:25:28 -0800 (PST)
X-Received: by 2002:a05:600c:15c5:b0:3d0:7909:c363 with SMTP id
 v5-20020a05600c15c500b003d07909c363mr6875988wmf.122.1669983928033; 
 Fri, 02 Dec 2022 04:25:28 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-178-86.web.vodafone.de.
 [109.43.178.86]) by smtp.gmail.com with ESMTPSA id
 p33-20020a05600c1da100b003d070e45574sm8878791wms.11.2022.12.02.04.25.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Dec 2022 04:25:27 -0800 (PST)
Message-ID: <95226bbe-9658-660c-12bb-dbf82b28dbd5@redhat.com>
Date: Fri, 2 Dec 2022 13:25:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20221130111559.52150-1-thuth@redhat.com>
 <CAFEAcA-hneP0SLUTW=_maTztra9gYnKgPeXevDcVu3jZZnDObA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH for-8.0] hw/misc: Move some arm-related files from
 specific_ss into softmmu_ss
In-Reply-To: <CAFEAcA-hneP0SLUTW=_maTztra9gYnKgPeXevDcVu3jZZnDObA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.258, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0D6a3iPjdzXe

On 01/12/2022 12.55, Peter Maydell wrote:
> On Wed, 30 Nov 2022 at 11:16, Thomas Huth <thuth@redhat.com> wrote:
>>
>> By removing #include "kvm-consts.h" from arm-powerctl.h (seems not to
>> be required there) and adjusting the header includes in some files, we
>> can move them from specific_ss into softmmu_ss, so that they only need
>> to be compiled once and not for qemu-system-arm and qemu-system-aarch64
>> individually.
> 
>> --- a/target/arm/arm-powerctl.h
>> +++ b/target/arm/arm-powerctl.h
>> @@ -11,8 +11,6 @@
>>   #ifndef QEMU_ARM_POWERCTL_H
>>   #define QEMU_ARM_POWERCTL_H
>>
>> -#include "kvm-consts.h"
>> -
>>   #define QEMU_ARM_POWERCTL_RET_SUCCESS QEMU_PSCI_RET_SUCCESS
>>   #define QEMU_ARM_POWERCTL_INVALID_PARAM QEMU_PSCI_RET_INVALID_PARAMS
>>   #define QEMU_ARM_POWERCTL_ALREADY_ON QEMU_PSCI_RET_ALREADY_ON
> 
> kvm-consts.h is where QEMU_PSCI_RET_SUCCESS etc are defined.
> So while the #include isn't strictly needed for compilation to work
> because arm-powerctl.h only creates the #define and doesn't use it,
> it does mean that any source file that uses the QEMU_ARM_POWERCTL_*
> now needs to include kvm-consts.h somehow itself. (Usually this is
> going to happen implicitly via target/arm/cpu.h, I think.)
> 
> I guess this is worth living with for the benefit of not
> compiling things twice. It could probably be untangled a little
> by e.g. moving the PSCI constants into their own header rather
> than defining them in kvm-consts.h, but I'm not sure if it's
> worth the effort right now.

Hmm, do we really need these QEMU_ARM_POWERCTL* redefinitions?
They seem hardly to be used outside of the arm-powerctl.[ch]
files:

$ grep -r  QEMU_ARM_POWERCTL * | grep -v target/arm/arm-powerctl
hw/misc/allwinner-cpucfg.c:    if (ret != QEMU_ARM_POWERCTL_RET_SUCCESS) {
target/arm/hvf/hvf.c:    assert(ret == QEMU_ARM_POWERCTL_RET_SUCCESS);
target/arm/psci.c:    assert(ret == QEMU_ARM_POWERCTL_RET_SUCCESS);

... so maybe we could rather change those spots to use the QEMU_PSCI_*
constants instead? ... or since they basically only check for success,
we could maybe use "if (ret) ..." and "assert(!ret)" there?

  Thomas

