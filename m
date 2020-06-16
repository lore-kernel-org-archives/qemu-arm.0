Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2366729lfm;
        Tue, 16 Jun 2020 00:06:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCZUfWdZ0yE2Ump3QIGZ2C+96LxLfmi/Nsw3N8IFbGZuM5XNVzt5YwAGDHCrZmtHx9sY5U
X-Received: by 2002:a25:ef42:: with SMTP id w2mr2211683ybm.50.1592291173532;
        Tue, 16 Jun 2020 00:06:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592291173; cv=none;
        d=google.com; s=arc-20160816;
        b=bcS4/xTbiga8GUsTPHscHis5YBWTw+HtkBte7wdA33xBITvS/UV/oy+gvCQ3o5MsLW
         WYb2Tx7Mrcre75T1aj65fT0ctErU20lHBX+4ic3gjHEYXEmZzYRNkadl1HIVcHesJ8wV
         ewlRzFPIHp/G7CYIsK3GPf4Y41lUzUzDbjyxJ8LZWi+9O4dqhuSvvIPDWEXeuU5jY5oe
         P3Nr0EjKlKblvc1VYKou7Xbvc6EpGH+bHVLQT8q2kedYu09/8tAig3zYrACHqQXOPRtw
         VstnAusQZMGx9k+186t23FIl1eKhm1FdoKlX9MdNEwMXLQ6Lc4jvDCp+qJ95lFoduekC
         ejvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:date:message-id:from
         :references:to:subject;
        bh=+/k2RsKD3etQsPjbOhOAhPAzLo2XtuYLqjwSfU6B/uY=;
        b=BSmMM1T7gwMumEGq7E83zyG3YcFvf+IHzD0qOuMYTrqYQdBZJKuJgf7SS8x3jt2VP3
         F8paOGd46HIiFw6rBjrSIGo6ckyAfNpUSIx9zxziV4m7UuuCPDVupRjtUZty62VY5u34
         yO0R6tFDJBWNTFNLg5PwVZBUPNhgH0zsc94tKT+7CSuxQ4o+Mr4XlAoAkqsLzrAp+NpQ
         LVA9CQnCQ74ksh40xIKl33hw4PKYeGi565nNSehpAjQ98uK1IxWPDRkEyy7SDrPGXR5Q
         TiUb9BvrGNQPlEqQ+h0otB+58Nupnfost9Fga5X/3wyPWKEB0DTOGwSGygfplwJdm0zY
         e+8g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v131si14994111ybv.418.2020.06.16.00.06.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 00:06:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jl5fg-0007Od-RX
	for alex.bennee@linaro.org; Tue, 16 Jun 2020 03:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vav@sysgo.com>)
 id 1jl5eb-0005ei-M8; Tue, 16 Jun 2020 03:05:05 -0400
Received: from mail.sysgo.com ([176.9.12.79]:42146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vav@sysgo.com>)
 id 1jl5eX-00008r-OE; Tue, 16 Jun 2020 03:05:03 -0400
Subject: Re: [PATCH] hw/timer/a9gtimer: Clear pending interrupt, after the
 clear of Event flag
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200610084551.28222-1-vav@sysgo.com>
 <CAFEAcA9uF01LnFy6o4Yy=aeuy9ixyGWZFVGtR66ah3w1458O5g@mail.gmail.com>
From: =?UTF-8?Q?V=c3=a1clav_Vanc?= <vav@sysgo.com>
Message-ID: <583c6e8e-fe52-881d-1a61-f02ce7b16d23@sysgo.com>
Date: Tue, 16 Jun 2020 09:04:57 +0200
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9uF01LnFy6o4Yy=aeuy9ixyGWZFVGtR66ah3w1458O5g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=176.9.12.79; envelope-from=vav@sysgo.com;
 helo=mail.sysgo.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 03:04:58
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "open list:ARM cores" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U88r1JrANs/B

On 6/15/20 1:04 PM, Peter Maydell wrote:
> On Wed, 10 Jun 2020 at 09:47, Vaclav Vanc <vav@sysgo.com> wrote:
>>
>> A9 Global Timer is used with Edge triggered interrupts (This is true
>> at least for Zynq and i.MX6 processors).
>> When Event Flag is cleared in Interrupt Status Register and new interrupt
>> was supposed to be scheduled, interrupt request is never cleared.
>> Since interrupt in GIC is configured as Edge triggered, new interrupts
>> are not registered (because interrupt is stuck at pending and GIC thinks
>> it was already serviced). As a result interrupts from timer does not work
>> anymore.
>>
>> Note: This happens only when interrupt was not serviced before the next
>> interrupt is suppose to be scheduled. This happens for example during
>> the increased load of the host system.
>>
>> Interrupt is now always cleared when Event Flag is cleared.
>> This is in accordance to A9 Global Timer documentation.
>>
>> Signed-off-by: Vaclav Vanc <vav@sysgo.com>
>> ---
>>   hw/timer/a9gtimer.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/hw/timer/a9gtimer.c b/hw/timer/a9gtimer.c
>> index 7233068a37..732889105e 100644
>> --- a/hw/timer/a9gtimer.c
>> +++ b/hw/timer/a9gtimer.c
>> @@ -206,6 +206,9 @@ static void a9_gtimer_write(void *opaque, hwaddr addr, uint64_t value,
>>       case R_INTERRUPT_STATUS:
>>           a9_gtimer_update(s, false);
>>           gtb->status &= ~value;
>> +        if (gtb->status == 0) {
>> +            qemu_set_irq(gtb->irq, 0);
>> +        }
>>           break;
> 
> Hi; thanks for this patch. I can see the situation you're trying to address,
> but I can't find anything in the docs that convinces me that this change
> is the right way to fix it.
> 
Hi, thanks for reviewing the patch.

> The problem we have is that the a9_gtimer_update() function (which is
> going to get called after this code at the end of the a9_gtimer_write()
> function) updates the gtb->status bit based on whether the timer has
> currently passed the compare value. So effectively we do the "has the
> count gone past the compare value" check not only when the timer expires
> but also at every register write. My best guess is that the real hardware
> only does an expiry-check when it does a counter value update. If that's
> the case then in the situation you outline the guest clearing the event
> flag should mean that the interrupt is not re-asserted until the counter
> next increments past the compare value (ie not for a little while) whereas
> with your patch it will be instantly re-asserted.

We must distinguish between two cases:
1, Auto-increment is disabled.
I just run some test on SABRE Lite (i.MX6) board.
I had auto-increment disabled, I verified, that GIC is configured for 
Edge interrupts. Once count went past the compare value I got the 
interrupt. I did not touch Timer registers, just signal EOI to GIC and 
surprisingly, I got a another interrupt. If I stopped the timer 
interrupts stopped coming (Status was still set to 1).

 From this behavior I assume, that every time the Timer is incremented 
(and Timer value is past the compare value) an EDGE interrupt (that 
means actual X->0->1 transition) is asserted. This is really interesting 
from HW point of view. This would mean, that a9_gtimer_update function 
should generate the pulse and not level on compare event.

2, Auto-increment is enabled.
This is actually what the patch was aiming for.
First call of a9_gtimer_update will potentially update the compare 
value, then the interrupt and event flag is de-asserted. Second call of 
a9_gtimer_update will just update the timer (or re-assert the interrupt 
if the Timer hit the compare value in the meantime, which is fine).

Let me know I you want me to run some more tests.

> 
> (Unfortunately the A9 TRM is not clear on the behaviour here. It would
> probably be possible to write some test code to check the real h/w
> behaviour.)
>  > thanks
> -- PMM
> 

Best Regards,
Ing. Václav Vanc
Project Engineer

SYSGO s.r.o.
Embedding Innovations
Research and Development Center Prague
Zeleny pruh 1560/99 I CZ-14000 Praha 4
Phone: +420 222138 828, +49 6136 9948 828
Fax: +420 244911174
E-mail: vaclav.vanc@sysgo.com
_________________________________________________________________________________

Web: https://www.sysgo.com
Blog: https://www.sysgo.com/blog
Events: https://www.sysgo.com/events
Newsletter: https://www.sysgo.com/newsletter
_________________________________________________________________________________

Handelsregister/Commercial Registry: HRB Mainz 90 HRB 48884
Geschäftsführung/Managing Directors: Etienne Butery (CEO), Kai Sablotny 
(COO)
USt-Id-Nr./VAT-Id-No.: DE 149062328

The protection of your personal data is important to us. Under the 
following link you can see the information in accordance with article 13 
GDPR: https://www.sysgo.com/privacy_policy
