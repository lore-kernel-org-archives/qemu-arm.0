Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp2716383wrq;
        Thu, 24 Oct 2019 11:22:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwlr1YxuQSEqK3nAQAM9bGZ7HZxW7JX5DVz/VbyPiHmHT9ypIhGajnwMUX48+3d+vFff6mk
X-Received: by 2002:aa7:c48c:: with SMTP id m12mr11263765edq.152.1571941322499;
        Thu, 24 Oct 2019 11:22:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571941322; cv=none;
        d=google.com; s=arc-20160816;
        b=KR5ATCZpmFP8SF/89TdaSs1YkeIFecwIwx1sSBcWJeLzWgRV/k+gmfw0Oe6Gtbk/cF
         oA1D5ihtoVUF62USEI29sZOjweCMnVG5xSLyxCm45vZFDGjR61k0aW1OUouZadKOd5S5
         JgAVq08Ov9Gg/9xfJAArTQyTUgahcporMGsAaaImBaY8fuucyy7IaZOuFdfLIlzb/K3t
         qqGTe7jTMsxqPMC0ZQxYKeY9Q+1gmuTp6VfCpBqHuK7q1228R40za5LjvLG1qIIsyeZX
         6prMuNvnp1SYGGiYWa6kNoz9C6aeGXw4fu3pVwn2im47kD6FfsnAK0FUjxyQ4G3IMBjD
         qNHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=mXFdS/3p9xMAfIMdCUjckKJmQWTGgqMccmDEYlu9j2E=;
        b=r7QJtMNi6AAGG8OeCpUlc16P8QFDASA7QIyFUan0b4ofpEXsJlG/4qmZ1w1Xx9O9lc
         PfHfZUy59mKktHTGZkfcHbghVoxidvbUBDKO//BoxFJPVCdjj47l5J+dbxm1p3g288qt
         uBrZl+UBMUS0OK3FxQg1diZCsotZ64+BbJWzr/OHJjHcXDR9Pl8+mmZvZ09P8age7BFL
         /7P5b4AbS3bY1Nloyfo3s4TeAiY1cfIlfhYz99Ku6A7LWNB7gpZ7oTFifsMtIctL+HPi
         JcGz2p9hS0lTObyDVt0W/U496C2Y95ZpBplzV/84ijUsOhB4YqqVAxPPw8GXp/1E/2rn
         xOFA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u10si1134314ejt.282.2019.10.24.11.22.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Oct 2019 11:22:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNhkG-0002Xf-Lp
	for alex.bennee@linaro.org; Thu, 24 Oct 2019 14:22:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44662)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iNhKR-0003ov-3U
 for qemu-arm@nongnu.org; Thu, 24 Oct 2019 13:55:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iNhKO-0008GP-Jq
 for qemu-arm@nongnu.org; Thu, 24 Oct 2019 13:55:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42190)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iNhKN-0008FS-QK
 for qemu-arm@nongnu.org; Thu, 24 Oct 2019 13:55:16 -0400
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C2375C049E17
 for <qemu-arm@nongnu.org>; Thu, 24 Oct 2019 17:55:14 +0000 (UTC)
Received: by mail-wm1-f69.google.com with SMTP id z5so1573487wma.5
 for <qemu-arm@nongnu.org>; Thu, 24 Oct 2019 10:55:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6v+fctnKVl/6fYka3XIVf9fH1YaHhqzuYR56MyK9A60=;
 b=D0RvuPEqeJFlu0bnEg0M+QIxpeTmiozEA2mamJliyp6phExAhbNidrRAsNUCtDeG7X
 f0iBqKLbklIa2b31MoOGaJl909Fl/Bg4lcZIiv+0G1VcFr0ZWyQtnu+tbdbJOvfQNo/Y
 QE8Qti6KrkmlGt0I8t8P+wWd7KeVlyw/8IX+5CtOV2IhmmjrEJVoMBiDFDsqN23HP1ys
 WFeIYXrLMvlhSylGDsH5sC9QJR6ZmC5DdJXYsxEWgEHtfPb35MvZfcm0ivM8CSgmoflb
 gBv/XwAfQmWGIH+LzXixWB1sUG5ECzkfw8UbQK/uhVfvP9zPIOds/umPaYFWZZgDnccL
 Aetg==
X-Gm-Message-State: APjAAAVWSAI5ocUJp0q1QTS4Yh7ZHJXiVmEuz1plmhWrXfdA+ZKnHlTa
 FVhlkzmZu9YWLXQevqpElEHcP3yO5nQMvF46KlO/e0ng2thgEyhFQdZUkr7l7dSr9yVZGmCK4mE
 HQKlE4gRkIAV5
X-Received: by 2002:adf:8481:: with SMTP id 1mr5363900wrg.189.1571939713299;
 Thu, 24 Oct 2019 10:55:13 -0700 (PDT)
X-Received: by 2002:adf:8481:: with SMTP id 1mr5363848wrg.189.1571939712934;
 Thu, 24 Oct 2019 10:55:12 -0700 (PDT)
Received: from [192.168.1.115] (129.red-83-57-174.dynamicip.rima-tde.net.
 [83.57.174.129])
 by smtp.gmail.com with ESMTPSA id s13sm2892518wmc.28.2019.10.24.10.55.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Oct 2019 10:55:12 -0700 (PDT)
Subject: Re: [PATCH v2 00/14] hw: Split RTC devices from hw/timer/ to hw/rtc/
To: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20191003230404.19384-1-philmd@redhat.com>
 <CAFEAcA-rmPuKQyv8d-u-1UAMhy6yGAcF3csVDcvYVXMosZysYw@mail.gmail.com>
 <839e9cb5-6fc2-a2b2-df12-abf9dbf6dcdd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <04b0db79-dfb3-9f28-b649-459214728556@redhat.com>
Date: Thu, 24 Oct 2019 19:55:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <839e9cb5-6fc2-a2b2-df12-abf9dbf6dcdd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goat?= =?UTF-8?Q?er?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Andrew Jeffery <andrew@aj.id.au>, QEMU Trivial <qemu-trivial@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TjwydvvGijwr

On 10/24/19 7:36 PM, Laurent Vivier wrote:
> On 24/10/2019 17:51, Peter Maydell wrote:
>> On Fri, 4 Oct 2019 at 00:04, Philippe Mathieu-Daud=C3=A9 <philmd@redha=
t.com> wrote:
>>>
>>> Since v1: https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg03=
334.html
>>> - addressed review comments (described in patches 3 and 4)
>>> - added R-b/A-b tags
>>>
>>> Whole series now reviewed.
>>
>> for the arm parts:
>> Acked-by: Peter Maydell <peter.maydell@linaro.org>
>>
>=20
> I'm going to queue this series in qemu-trivial queue, so I guess your
> Acked-by is for patches 2, 10 and 11?

ARM: 2, 7-11, 13-14:

   hw: Move PL031 device from hw/timer/ to hw/rtc/ subdirectory
   hw: Move TWL92230 device from hw/timer/ to hw/rtc/ subdirectory
   hw: Move DS1338 device from hw/timer/ to hw/rtc/ subdirectory
   hw: Move Xilinx ZynqMP RTC from hw/timer/ to hw/rtc/ subdirectory
   hw: Move Exynos4210 RTC from hw/timer/ to hw/rtc/ subdirectory
   hw: Move Aspeed RTC from hw/timer/ to hw/rtc/ subdirectory
   hw/rtc/xlnx-zynqmp-rtc: Remove unused "ptimer.h" include
   hw/rtc/aspeed_rtc: Remove unused includes

PPC: 3-5

   hw: Move MC146818 device from hw/timer/ to hw/rtc/ subdirectory
   hw: Move M48T59 device from hw/timer/ to hw/rtc/ subdirectory
   hw: Move M41T80 device from hw/timer/ to hw/rtc/ subdirectory

SPARC: 6

   hw: Move sun4v hypervisor RTC from hw/timer/ to hw/rtc/ subdirectory
