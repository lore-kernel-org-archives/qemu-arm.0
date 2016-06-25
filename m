Received: by 10.25.21.96 with SMTP id l93csp314792lfi;
        Sat, 25 Jun 2016 05:21:05 -0700 (PDT)
X-Received: by 10.55.184.5 with SMTP id i5mr11208604qkf.33.1466857265474;
        Sat, 25 Jun 2016 05:21:05 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o34si8878780qtd.10.2016.06.25.05.21.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 25 Jun 2016 05:21:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49756 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bGma7-0001d8-Pf
	for alex.bennee@linaro.org; Sat, 25 Jun 2016 08:21:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47906)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bGma4-0001ck-KQ
	for qemu-arm@nongnu.org; Sat, 25 Jun 2016 08:21:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bGma0-0007Zt-J8
	for qemu-arm@nongnu.org; Sat, 25 Jun 2016 08:21:00 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:36334)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bGma0-0007Yr-8x; Sat, 25 Jun 2016 08:20:56 -0400
Received: by mail-lf0-x242.google.com with SMTP id a2so24330103lfe.3;
	Sat, 25 Jun 2016 05:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=GQOitPdw0MQzmbVzx+N+A9BhxDL9LmvJaZ6eBIwAT+c=;
	b=sTXFKXeRf1j612XD/LXKc1TnP8l9mN/jTwRU6kiI3pzyDik1+wO/Qo90uobkJtaeqZ
	R3Tnsq5W8so4Eokj8OE/HVXb17p7WrCLZzUHBjpDafMAbN+8ogPzhd44eUVUiHHJIFcC
	aeNARUrrluoOFjl5xE5/wcEDjYCdEpvZe+MJ09zDPuN5oR+i0F9WuYR4mD8Pr4CSm8Bt
	Ls4ftTFPRoiQgMEPVtqApAFL1z8qlgtIyNsZejyqhzAg0jLfnbQ4vVCaC/knq6VOtLJ3
	ahA4VcWfI7gMLannoTGiqFALzDRGeCnrUZoL5RAenAr4Z7oJqEs3+4iJtGtsP1/8Uf+S
	dvPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=GQOitPdw0MQzmbVzx+N+A9BhxDL9LmvJaZ6eBIwAT+c=;
	b=QzaY0TNGZyGJmxjbmvhyaqRbfLelXHmJPUvS5IrQ/Yg0JAePkEvXLaMvcc28fH6EQD
	SACh6D9rm8CoGsXQGPvY7aar0zm58NsStJE+M6JqbDV/5C+k81a9+Xcus7evTGr/Mz81
	oyM7pkc/IyQGMHcqYEQ8eb1aiY48fw5abCZtspjjYjl1bn+h1KkHsclB7cyo/WMgKCbh
	CRXWbckElziQj/Z6Q8Ms9y/I1/B7wYoZO5qHOqqOnJTaaSHHbMArI7a+i9KM+OwzgOSF
	9XGQGjZZ2Mv667DiI94SL+fj68w4F+vHmOVdc2AshTtuzIDsD+tV4Ar9rLDQLqr0SnpB
	4akw==
X-Gm-Message-State: ALyK8tL1G5ty9SvUwqaD7j2QJITEQsW+eOgzS9/PMQa3GhacSnZt4ibFP9UfYnToSnWhbg==
X-Received: by 10.25.206.210 with SMTP id e201mr2283942lfg.138.1466857254941; 
	Sat, 25 Jun 2016 05:20:54 -0700 (PDT)
Received: from [192.168.1.145] (ppp109-252-52-30.pppoe.spdop.ru.
	[109.252.52.30]) by smtp.googlemail.com with ESMTPSA id
	l79sm1662133lfi.40.2016.06.25.05.20.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 25 Jun 2016 05:20:54 -0700 (PDT)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org
References: <20160624202934.702-1-digetx@gmail.com>
	<d0f7648b-81e9-c4d9-d9d4-87e06422b441@ilande.co.uk>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a6cc2add-14fc-a05f-d440-e00d2029cb4e@gmail.com>
Date: Sat, 25 Jun 2016 15:20:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <d0f7648b-81e9-c4d9-d9d4-87e06422b441@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/ptimer: Don't wrap around
 counter for expired timer that uses tick handler
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hphjf2L6jI59

On 25.06.2016 13:04, Mark Cave-Ayland wrote:
> On 24/06/16 21:29, Dmitry Osipenko wrote:
> 
>> Software should see timer counter wrap around only after IRQ being triggered.
>> Change returned counter value to "1" for the expired timer and avoid returning
>> wrapped around counter value in periodic mode for the timer that has bottom-half
>> handler setup, assuming it is IRQ handler.
>>
>> This fixes regression introduced by the commit 5a50307 ("hw/ptimer: Perform
>> counter wrap around if timer already expired") on SPARC emulated machine as
>> reported by Mark Cave-Ayland.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  hw/core/ptimer.c | 8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
>> index 7f89001..620ac2e 100644
>> --- a/hw/core/ptimer.c
>> +++ b/hw/core/ptimer.c
>> @@ -98,10 +98,10 @@ uint64_t ptimer_get_count(ptimer_state *s)
>>          bool oneshot = (s->enabled == 2);
>>
>>          /* Figure out the current counter value.  */
>> -        if (expired && (oneshot || use_icount)) {
>> +        if (expired && (oneshot || use_icount || s->bh != NULL)) {
>>              /* Prevent timer underflowing if it should already have
>>                 triggered.  */
>> -            counter = 0;
>> +            counter = 1;
>>          } else {
>>              uint64_t rem;
>>              uint64_t div;
>> @@ -148,7 +148,9 @@ uint64_t ptimer_get_count(ptimer_state *s)
>>
>>              if (expired && counter != 0) {
>>                  /* Wrap around periodic counter.  */
>> -                counter = s->limit - (counter - 1) % s->limit;
>> +                counter = s->delta = s->limit - (counter - 1) % s->limit;
>> +                /* Re-arm timer according to the wrapped around value.  */
>> +                ptimer_reload(s);
>>              }
>>          }
>>      } else {
>>
> 
> Hi Dmitry,
> 
> Thanks for the patch, however I am unable to apply this to git master with git
> am or directly using patch:
> 
> $ patch -p1 < timer.eml
> (Stripping trailing CRs from patch.)
> patching file hw/core/ptimer.c
> Hunk #1 FAILED at 98.
> Hunk #2 succeeded at 143 (offset -5 lines).
> 1 out of 2 hunks FAILED -- saving rejects to file hw/core/ptimer.c.rej
> 
> Does it need to be rebased before it can be applied?
> 
> 
> ATB,
> 
> Mark.
> 

Yes, but it's my overlook. I made it on top of tainted branch, will send V2.
Sorry and thanks for trying it and letting me know.

-- 
Dmitry
