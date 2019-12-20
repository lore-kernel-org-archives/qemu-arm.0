Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp3663364lff;
        Fri, 20 Dec 2019 06:15:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqyhi0uERKyXVOdxzATwE7PN8I78ffY4Z0n2KJOGKvW6076a2REx3NtS8eAWNyFUAeD/yZAG
X-Received: by 2002:a05:6808:102:: with SMTP id b2mr3902844oie.127.1576851355776;
        Fri, 20 Dec 2019 06:15:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576851355; cv=none;
        d=google.com; s=arc-20160816;
        b=X0PYpthaVmetilvRAO4fku7SQ3N9AFJqt5wTeb3DBLsvgNIbXYGM/yzZ/wuLpk3olq
         nfZ+FhaF/D0gBPUYUCDaLbNEbyhVXWZPWMU+FJ3blLfarNb0VdsK1+jwa7XO//iQQvUL
         vsRhKOpxjgLnla9ZhvDJ8C73TqD0dAxlKhxuq08dBcbwC/S68AMjxxbflM6iwA5DII/Z
         pHHPQk5ChKe9GEKNmYy7qgWUJiU7Ri6HHY/gGC6gw9ivf3sYOGcw5ikc+dh9RlVNackv
         S2dN/VuJIxUkRqtM7h4VFwZbQvU0bR2FLzEB7eQrfYeh1TuUtSro371YpoXZuyGvbRfR
         gq1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=JPml0c14UA3M9kPV1/8ipUnhYnGMjkdpgHWN7/Rfr7Q=;
        b=Avi/DysqmNwZnQBDb9sGnFpvGPgmu9rUp9ZXncv3vddC+pqdReUvXrKs9Kbt9A+BnG
         CnnKwRc1AkD9ATyxU+RTtfs9/hPPwNHaZdoTAmIdgNUTzR0pU9xxLQfhmLYdQ4rVvqoE
         Q4jB2Q0G71cy/LDfj12agTyfV/jdRIzlxZVKhjFUJVFnDxLrJ4TwFBQB4oa/tNqrbTTX
         rCint5c5xOH3IRD9gQb7iMqZ3/DBpq8qGjMMD7acR82vFZNtsy+2w03b1g1ZE04zxvfk
         q7u1fxPsRsh3Ysr2e1YsJDJy3Vj314ZdTdTZTMUz3wZXff3mGeELUTzSuHNpENsmv/8h
         Fskw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q124si4459605oig.228.2019.12.20.06.15.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Dec 2019 06:15:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iiJ4M-0005nk-DX
	for alex.bennee@linaro.org; Fri, 20 Dec 2019 09:15:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60195)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Jeff.Kubascik@dornerworks.com>) id 1iiIiw-00063R-Le
 for qemu-arm@nongnu.org; Fri, 20 Dec 2019 08:53:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Jeff.Kubascik@dornerworks.com>) id 1iiIiv-0004U2-65
 for qemu-arm@nongnu.org; Fri, 20 Dec 2019 08:53:46 -0500
Received: from mail.dornerworks.com ([12.207.209.150]:48884
 helo=webmail.dornerworks.com) by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <Jeff.Kubascik@dornerworks.com>)
 id 1iiIir-0004BF-9x; Fri, 20 Dec 2019 08:53:41 -0500
Subject: Re: [PATCH] target/arm: fix IL bit for data abort exceptions
To: Peter Maydell <peter.maydell@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>
References: <20191217210230.99559-1-jeff.kubascik@dornerworks.com>
 <7a274247-e593-5828-73f8-2042971e8633@linaro.org>
 <CAFEAcA8Egy=Jkw8yKSumkeX=+Qxi8bPy-0fJjopHR6gCmz3FLQ@mail.gmail.com>
From: Jeff Kubascik <jeff.kubascik@dornerworks.com>
Message-ID: <e8daa5c4-ba9a-a6dc-1037-7eec6335ad0b@dornerworks.com>
Date: Fri, 20 Dec 2019 08:54:30 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8Egy=Jkw8yKSumkeX=+Qxi8bPy-0fJjopHR6gCmz3FLQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [99.18.96.11]
X-ClientProxiedBy: Mcbain.dw.local (172.27.1.45) To Mcbain.dw.local
 (172.27.1.45)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 12.207.209.150
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
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xIJFAz/5Gbf1

On 12/19/2019 7:43 AM, Peter Maydell wrote:
> On Wed, 18 Dec 2019 at 01:03, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 12/17/19 11:02 AM, Jeff Kubascik wrote:
>>> diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
>>> index 5feb312941..e63f8bda29 100644
>>> --- a/target/arm/tlb_helper.c
>>> +++ b/target/arm/tlb_helper.c
>>> @@ -44,7 +44,7 @@ static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
>>>          syn = syn_data_abort_with_iss(same_el,
>>>                                        0, 0, 0, 0, 0,
>>>                                        ea, 0, s1ptw, is_write, fsc,
>>> -                                      false);
>>> +                                      true);
>>>          /* Merge the runtime syndrome with the template syndrome.  */
>>>          syn |= template_syn;
>>
>> This doesn't look correct.  Surely the IL bit should come from template_syn?
> 
> Yes. In translate.c we put it into the syndrome information by
> passing true/false to syn_data_abort_with_iss() depending on
> whether the issinfo passed in to disas_set_da_iss() has the
> ISSIs16Bit flag set.
> 
> I think this is a regression introduced in commit 46beb58efbb8a2a32
> when we converted the Thumb decoder over to decodetree. Before that
> 16 bit Thumb insns were in a different place in the old decoder and
> the 16-bit Thumb path passed ISSIs16Bit in with its issflags.
> (We should cc: qemu-stable@nongnu.org on the fix for this.)

The problem here was syn_data_abort_with_iss would return syn with the IL bit
set, which carries through when it gets or'd with template_syn. I had to change
the is_16bit argument to true so that it clear the IL bit.

>>> diff --git a/target/arm/translate.c b/target/arm/translate.c
>>> index 2b6c1f91bf..300480f1b7 100644
>>> --- a/target/arm/translate.c
>>> +++ b/target/arm/translate.c
>>> @@ -8555,7 +8555,7 @@ static ISSInfo make_issinfo(DisasContext *s, int rd, bool p, bool w)
>>>
>>>      /* ISS not valid if writeback */
>>>      if (p && !w) {
>>> -        ret = rd;
>>> +        ret = rd | (s->is_16bit ? ISSIs16Bit : 0);
>>>      } else {
>>>          ret = ISSInvalid;
>>>      }
> 
> Rather than setting an is_16bit flag, we could just use
> "dc->base.pc_next - dc->pc_curr == 2", couldn't we?
> 
> thanks
> -- PMM
> 

Sincerely,
Jeff Kubascik
