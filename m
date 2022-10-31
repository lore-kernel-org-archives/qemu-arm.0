Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp933864ejc;
        Mon, 31 Oct 2022 05:39:53 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4rkCnYUAa4mr63J8e4aDMyhTx6ydUo+VTgD7WVQXtvaotbxuOIWlOUSlIjKnjFGbI+V++a
X-Received: by 2002:a05:620a:40cd:b0:6da:7a25:5920 with SMTP id g13-20020a05620a40cd00b006da7a255920mr8639648qko.721.1667219993226;
        Mon, 31 Oct 2022 05:39:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667219993; cv=none;
        d=google.com; s=arc-20160816;
        b=wnj/NtZMIxiaDO1whvJGjX0bt/zGzCqrBMmFJ5EtJsL1nh39y1qGnGvWnUv/YD058v
         eh2SljpE3i3rmf3Lo2ySbx0Wq/vmh27rSbAFVvNecg9xiHMeeYdSiIwjGkolDYJ5HjwV
         tNsDRk6D4/iF+/WP1WB+Q1D3WZnbjZjWZTqdTxzv4G7ipdpIziI6RN26hN0dwroimkDr
         2uxd8vvPXA2G7UoKQr9j+0e646ossRKRzLW4umO6JczQ0J/mt5hL82eXHZwDw16D1Jk/
         NkqPCG4mGTwNLGjKCHoTpdF+ZY9OQAT5Bzqd20SVouIuPCND6SIZsbyNW5zcQhnw+dhZ
         KnTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Y78+Ekch7keM8llYX9QtCqWp5w7Z7Q2XQS5jAe96i1Q=;
        b=ckIomiyAERTBMlEeI2KX8bEFmDNv7HKkOHd4a7ecJQO776Yc396xx00CGlt4kmE/Iu
         7VfOXVzTDOIe6TbsxkJFZ1aZmP0rojCOP9iPNsVL9HowyL9Qp8mgHG5Kv0SORGSqeF71
         SKFJlVK3Bb9g8KJuTAdHqzZjksp9otwHC/LbYIlhVBcCTAqse2d9PinlS5Nn0k/D2o43
         mgsDJURkYOKpHaLJu60NlHQCqtFi63DRpOTI/NHmwsSM0G7EcO2YYj726ClAM8FJpJvA
         2kD0uPg0J7mFAXM7iCH+vvnF3QRKtq/M+3USG/nPOPzTo0NeA2LG6yCyxGOMcL1QwwGH
         lNNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=S9Fsg3Mn;
       spf=pass (google.com: domain of qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i20-20020ac87654000000b003a5069bdc63si3694849qtr.86.2022.10.31.05.39.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 05:39:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=S9Fsg3Mn;
       spf=pass (google.com: domain of qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opU4r-0007UG-T6; Mon, 31 Oct 2022 08:39:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opU4p-00078g-QA
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 08:39:39 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opU4n-0006Lg-Et
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 08:39:39 -0400
Received: by mail-pl1-x634.google.com with SMTP id p21so6752157plr.7
 for <qemu-arm@nongnu.org>; Mon, 31 Oct 2022 05:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y78+Ekch7keM8llYX9QtCqWp5w7Z7Q2XQS5jAe96i1Q=;
 b=S9Fsg3MnthGap1YZzA1+ZVmi+aAc5DFDGiKzE5mEEYnn0cP+nrwqjEcW9JsFcBKrt6
 8W0xxyrq5MekFsiuflbaj5kN81BAPlQ5Np0Eru6vLdyXB+4TQ2NGeB7ZPUngVOjfRimY
 95fLkKgAkxlsD2JDv8cUWJDThDaNb7C2wq+PNPaEYl5JSpvoWCscfLihLaf94HdEEARg
 BxySYQ0rWxqtkU+ZFegX1JcS6lz92siWQqIupyllnr2Of79Zi8kOMM5pcWfjJkIcLI94
 LKiqBCYy/qFSf9SNgv8LJLBqDgoBB75oU082IggRiFziX3ZTJT5Ha55o2dvadtzEU8Qw
 vVyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y78+Ekch7keM8llYX9QtCqWp5w7Z7Q2XQS5jAe96i1Q=;
 b=DcJApJmgninElfBLEaGyb8l/yDe+82kbplhXT4NoFmouudmsxHqJr/t0jyuK0tdu08
 Ys7vDqN6779wjpVPySRQobG9Zc/q2FlduhYb0r9L4id1elaKKb8b7rYH77BYwFR/biaK
 3EP5wpIzh41spJoOoR+VNnxlVXCXtR1HtxJWHHkZInY5PM38zdYVID4pboNzMc6HtMBK
 WENi6VMCdNNtlW8Kb42TkLzC9czh9WlUOsF2WyMWbslBb6BvvdnIBg88OmYiIhHXh0OG
 BejzMv+M+i1FGVipjQPhG5SGYv3+MjavCcHaDYrih4ZPScBJUB4FWN6rjBwFNVC+qB5I
 zjdw==
X-Gm-Message-State: ACrzQf0QF04xvytklnPTQI4YHw4yAO1h2eqRKcDRrzR0cMf24tVass8D
 6qGOgMFMEVNnbvdgA5+K272biQ==
X-Received: by 2002:a17:902:b20a:b0:178:6f5b:f903 with SMTP id
 t10-20020a170902b20a00b001786f5bf903mr14411897plr.39.1667219976028; 
 Mon, 31 Oct 2022 05:39:36 -0700 (PDT)
Received: from ?IPV6:2400:4050:c360:8200:8ae8:3c4:c0da:7419?
 ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 h1-20020a17090a054100b00212d4c50647sm4044681pjf.36.2022.10.31.05.39.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 05:39:35 -0700 (PDT)
Message-ID: <7d0dbb38-a8fd-2ae8-47ac-1e5d98ef77fc@daynix.com>
Date: Mon, 31 Oct 2022 21:39:29 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v5 02/17] pci: Allow to omit errp for pci_add_capability
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
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
 <2d49657a-67d0-5d58-b646-23a4e30abc02@linaro.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <2d49657a-67d0-5d58-b646-23a4e30abc02@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::634;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org
X-TUID: Kzvydo5XjqRV



On 2022/10/29 7:35, Philippe Mathieu-Daudé wrote:
> On 28/10/22 14:26, Akihiko Odaki wrote:
>> pci_add_capability appears most PCI devices. Its error handling required
>> lots of code, and led to inconsistent behaviors such as:
>> - passing error_abort
>> - passing error_fatal
>> - asserting the returned value
>> - propagating the error to the caller
>> - skipping the rest of the function
>> - just ignoring
>>
>> The code generating errors in pci_add_capability had a comment which
>> says:
>>> Verify that capabilities don't overlap.  Note: device assignment
>>> depends on this check to verify that the device is not broken.
>>> Should never trigger for emulated devices, but it's helpful for
>>> debugging these.
>>
>> Indeed vfio has some code that passes capability offsets and sizes from
>> a physical device, but it explicitly pays attention so that the
>> capabilities never overlap. Therefore, we can always assert that
>> capabilities never overlap when pci_add_capability is called, resolving
>> these inconsistencies.
>>
>> Such an implementation of pci_add_capability will not have errp
>> parameter. However, there are so many callers of pci_add_capability
>> that it does not make sense to amend all of them at once to match
>> with the new signature. Instead, this change will allow callers of
>> pci_add_capability to omit errp as the first step.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   hw/pci/pci.c         |  8 ++++----
>>   include/hw/pci/pci.h | 13 ++++++++++---
>>   2 files changed, 14 insertions(+), 7 deletions(-)
> 
>> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
>> index b54b6ef88f..51fd106f16 100644
>> --- a/include/hw/pci/pci.h
>> +++ b/include/hw/pci/pci.h
>> @@ -2,6 +2,7 @@
>>   #define QEMU_PCI_H
>>   #include "exec/memory.h"
>> +#include "qapi/error.h"
>>   #include "sysemu/dma.h"
>>   /* PCI includes legacy ISA access.  */
>> @@ -390,9 +391,15 @@ void pci_register_vga(PCIDevice *pci_dev, 
>> MemoryRegion *mem,
>>   void pci_unregister_vga(PCIDevice *pci_dev);
>>   pcibus_t pci_get_bar_addr(PCIDevice *pci_dev, int region_num);
>> -int pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
>> -                       uint8_t offset, uint8_t size,
>> -                       Error **errp);
>> +int pci_add_capability_legacy(PCIDevice *pdev, uint8_t cap_id,
>> +                              uint8_t offset, uint8_t size,
>> +                              Error **errp);
>> +
>> +#define PCI_ADD_CAPABILITY_VA(pdev, cap_id, offset, size, errp, ...) \
>> +    pci_add_capability_legacy(pdev, cap_id, offset, size, errp)
>> +
>> +#define pci_add_capability(...) \
>> +    PCI_ADD_CAPABILITY_VA(__VA_ARGS__, &error_abort)
> Do we really need PCI_ADD_CAPABILITY_VA?
> 
>    #define pci_add_capability(...) \
>         pci_add_capability_legacy(__VA_ARGS__, &error_abort)
> 

When errp is specified by the caller, the last argument, &error_abort 
becomes extra and the compiler complains about that. 
PCI_ADD_CAPABILITY_VA is a temporary dirty hack to ignore the extra 
argument.

Regards,
Akihiko Odaki
