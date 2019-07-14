Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3117106wrv;
        Sun, 14 Jul 2019 09:01:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxDO1hMXcqTVw2E/N3Jzb9lV8GUtQI8qk/bkmPLO0JP6vb3yIUTrolDK7Qt8ZJop9P2Yv79
X-Received: by 2002:aa7:d30d:: with SMTP id p13mr19148810edq.292.1563120082436;
        Sun, 14 Jul 2019 09:01:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563120082; cv=none;
        d=google.com; s=arc-20160816;
        b=ZjbpEuR1jCiO0h2qn0eLgHdwUebRuYeU6kMTqZM1Ae+LV7D/dCedN+JEOmxvaj6xEu
         mAKTE4Sxj4ASuAL3pRZcvVdtyT7NF0yVFgSEvnaHR7IeYrHtDwSFvcj0VsXe4ffbi0l7
         uMW4/+ZeWtd+eAQlEaEbC53ZPKa4IEOPCftA6/CaNWnILDkSYIviF7FDgJOnJ2begu95
         CKi5FzcpnK+0X9FREpieLvfLKf4wwxCa/AuB62vyyQUb17fy+wImWDBZbJgrWnOvEDF8
         SWUEiSNqw0g4zEhEpSQa3w59W+ZCzP++h5xQUX6BGg+4zIH8d+GF2FatwqebOe12KPEO
         v0jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=Tu0CKk/DaGf8dbDBBxibhOQehNaT7jFlyBh2+tX3JCY=;
        b=ex78kz8k/Z+DB1W7MSiIWf+ES+j9J4Uai1ZtIxjYnKKgzkWtm8nelwwUrAMEtJ4ecb
         WpIeleUbA7eQbzdSahgXFy1DGb3acU1HgUFv2LkEETUZpx9MnHibPkrVo+PbMy3DG7HZ
         c/QrL8APjZ3lNKaygGjbdUqzPLsyDvsyqvm09yK+yTpmw7FOuOE6YFygI0g1YWANeHnH
         JgI8qFcRzatCnab/VF2Mr7CqqrvfDJO3Gkk/B0H5gNt31qMrXj+c1A0jQKwTh2hy6jZA
         SuXayZQS0HRXIWdTEAzVidESN3ItRSvWoYPYejTYIqTwbeKQ20DydRSvojyMNAJVc/XP
         D0Wg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i3si8637008ede.180.2019.07.14.09.01.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 14 Jul 2019 09:01:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hmgwD-0003hI-HM
	for alex.bennee@linaro.org; Sun, 14 Jul 2019 12:01:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43078)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hmgwA-0003h7-Kn
 for qemu-arm@nongnu.org; Sun, 14 Jul 2019 12:01:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hmgw9-0004S3-MN
 for qemu-arm@nongnu.org; Sun, 14 Jul 2019 12:01:18 -0400
Received: from mail-wr1-f47.google.com ([209.85.221.47]:37073)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hmgw9-0004R2-Gg
 for qemu-arm@nongnu.org; Sun, 14 Jul 2019 12:01:17 -0400
Received: by mail-wr1-f47.google.com with SMTP id n9so14578346wrr.4
 for <qemu-arm@nongnu.org>; Sun, 14 Jul 2019 09:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Tu0CKk/DaGf8dbDBBxibhOQehNaT7jFlyBh2+tX3JCY=;
 b=pHgNAiapb0mfrxj3dKHmOZd3aEsDiNo6s8i82vLulR/oYHcfzhvPkt8OeX+0rxXyx4
 Y6T6UJsqCJ53uJEu0xCbvouksrD+ZSoNwAKnltl89QbFaht6bzFA2vlieuyOdwPb37mD
 vrU950Zd52LOCy4OxJjs6qbnEmMSszmmnhsDrB9Is/k4aidUwME7l922o2sccOBHHc/B
 uSIKxqHr1ZE5ctkmG/OWYKt6zfhy3YYyRe1Mc4CwRLDIU+aux3bcz1Res4f0Za7RYGn/
 qGL5VsQ5B1VSMFm8LoyQJ1uuiEg2x9HvDX9HgXObmA03yheSN43cPSxcxjptEdEWajl3
 j7Ww==
X-Gm-Message-State: APjAAAUJPoqrNAQ/o0bKWXDgyT7A5FeG4oCroNa/8hnLUjo5xY3jByNV
 15dWkBRmUlRfjL89o6JryBWmbg==
X-Received: by 2002:a5d:66c5:: with SMTP id k5mr24551840wrw.304.1563120075572; 
 Sun, 14 Jul 2019 09:01:15 -0700 (PDT)
Received: from [192.168.1.37] (62.red-83-42-61.dynamicip.rima-tde.net.
 [83.42.61.62])
 by smtp.gmail.com with ESMTPSA id l17sm1895100wrr.94.2019.07.14.09.01.14
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Sun, 14 Jul 2019 09:01:14 -0700 (PDT)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20190712133928.21394-1-philmd@redhat.com>
 <20190712133928.21394-3-philmd@redhat.com>
 <64a41af4-e635-06e3-05a2-d2cddaf02af0@redhat.com>
 <de30351b-6747-b976-16c5-c587b51f2b7a@redhat.com>
 <e2a6cb5d-b840-117f-728c-b5b1bf4c18d6@redhat.com>
 <49b41c61-fce7-3b5f-980a-20007125de9f@redhat.com>
 <993dbb9e-6813-e927-fd69-d16015ea1fc2@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <8dc2d98e-fd69-b1d5-3d60-c5457e7b363b@redhat.com>
Date: Sun, 14 Jul 2019 18:01:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <993dbb9e-6813-e927-fd69-d16015ea1fc2@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.47
Subject: Re: [Qemu-arm] [PATCH-for-4.1 2/7] hw/usb: Bluetooth HCI USB
 depends on USB & BLUETOOTH
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
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Miroslav Rezanina <mrezanin@redhat.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y37ZfaZtgT9L

Hi Paolo,

On 7/12/19 7:31 PM, Paolo Bonzini wrote:
> On 12/07/19 18:45, Philippe Mathieu-Daudé wrote:
>> On 7/12/19 4:58 PM, Paolo Bonzini wrote:
>>> The other is whether we want to enable USB_BLUETOOTH by default.  I
>>> wouldn't have any problem there, but if we disable it basically no one
>>> would ship/use it and we might as well delete the whole thing.
>>
>> The only user is the ARM Nokia N-series board, so if we set default=n,
>> the Bluetooth subsystem will be only be selected on arm-softmmu (and
>> aarch64-softmmu).

Using (1):

+    default y if BLUETOOTH
     depends on USB
+    select BLUETOOTH

I get:

    KconfigDataError: cycle found including BLUETOOTH

This works but doesn't follow kconfig.rst (2):

+    default y if BLUETOOTH
     depends on USB

This works (kconfig.rst compliant, 3):

+    default n
     depends on USB
+    select BLUETOOTH

Are you OK with (2) or you prefer (3)?

>>
>> This seems a sane cleanup. If another board wants to use the bluetooth
>> code, it should probably move it out of the orphan status.
> 
> Fair! ;)
> 
> Paolo
> 
