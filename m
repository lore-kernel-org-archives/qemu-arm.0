Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1164695wrm;
        Thu, 17 Oct 2019 09:14:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzzeI/DzKIoKae69DoDAnZnW90st8YfkV4QDWa2fJcrD8ik7tussilAg0Sjioa6vPNvGR0m
X-Received: by 2002:ac8:1b45:: with SMTP id p5mr4379865qtk.330.1571328863803;
        Thu, 17 Oct 2019 09:14:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571328863; cv=none;
        d=google.com; s=arc-20160816;
        b=xvFMFUcA4lqj+PTFbX5rahWPQOUzFuMHWT8RGpph//aQ5IXJM6P4mmAbxrSy7VjQII
         Sik+bEjyE+RHaCmPZ3TCyKM3rRuZJOheBieG2Yg4OSR9UO2RW0cL8mdh9EO9CpRysIWl
         gAteCmSlD171B5pNfg2nxPdPP3Q8OwryVqL0gdi/MT8XZ/XpK+JlTa1zYTyYbAK6tS/X
         VIAbHbQfbC9/z5+Cajxa+s8961vcT/pd5QXvBxzflDedafMGyQo9f5n7BRZAQ5cmZQt1
         b6ycVwYPJdbDOaTTa85vD1yQGwuYBVgV73RhEe2wnU+69vEw7EY2bBG3nHlrCtl5fonX
         Jt7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=CZ7a8A2AU81t/4PW8QyJlQa0y74sar0jsBqAubk98V0=;
        b=Bg3oTU51rTXORuEesst6NXHvL5EpcSkSPZ+nFlSohw5GYtYj8nkb3YRahas0NR72ZN
         ITHgolbCSiPGve98gg6lTJkZDWykr6OBPMMGlj6jU0ymnwlhodXez6CishS8cAlHoCP9
         E6VA4PAhkYZCQyTTnafhysb+GBSnRzt3+f//AsBD5i3QXkznlGGcbHRCluFhAHD93mWm
         X8h28IrVVweqzhdaVlM0XmAn7irmKgtsTgRNlAWya9NS2pUy2wFA/UZVRTQQ3CWKTqmV
         5RwzfyQ3jQVv+i+yQKTbuNxpipS/k7QD5s7HWNVA3a62Fqr7y15jX9dGLD05gjgQKidd
         FxOg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i66si2649093qke.269.2019.10.17.09.14.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 09:14:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iL8Pu-00021N-RT
	for alex.bennee@linaro.org; Thu, 17 Oct 2019 12:14:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57055)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iL7ez-0000C1-UZ
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 11:25:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iL7ey-0001Ni-Pz
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 11:25:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34612)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iL7ey-0001NR-IS
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 11:25:52 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8B4E72A09A0
 for <qemu-devel@nongnu.org>; Thu, 17 Oct 2019 15:25:51 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id a15so1141885wrr.0
 for <qemu-devel@nongnu.org>; Thu, 17 Oct 2019 08:25:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kc89g+xjnJFjyDrAPHC023QzxGX9+hkBzdICbIM0Jdw=;
 b=qAAKj673GOcws6t7hwBjfoKLT60US1CY/ZakZwa1y0S86Jss8KBbYKQbZrSL+MKcuL
 JgoHlz2PFcpyNHZeObqxgoNMTtcf4TSb9Xn1TI7cGzgnyoMw+TgyjnqB2Fta1lJa4ed/
 gQWi1XZul8nqnMXKC0o5xQKiHOxDayz2irvdFYyHGpkEiP3i12Wnisv3zqbmJ7m8HWvn
 jlN2JzPXNfwSwqg5JbUpv+NQZ/ME0fhHYxICsSlTwRy7Vfrucw9DktIskBubgnr4LMQX
 qoGv664UBGwV4MyeUoMSS8g6/STVSjMfD8/hOasaEESQVhHvSc17E0xluQ3YH+mWdtdw
 +2Vw==
X-Gm-Message-State: APjAAAVwt6C0KV8d90A9j7jbiPYyJnC2rqWoJNTWXLckFd43pqehBQZ+
 65Eax/7uuOcu3Xkr8aVURpiNkm96oEGvYcp+AHr7RpfshBWx2LrmLcXAnO2hp94g+BSWXOSoyot
 Ok+Nn4Z1XaG3YRcg=
X-Received: by 2002:a7b:c251:: with SMTP id b17mr3401108wmj.133.1571325950282; 
 Thu, 17 Oct 2019 08:25:50 -0700 (PDT)
X-Received: by 2002:a7b:c251:: with SMTP id b17mr3401082wmj.133.1571325949944; 
 Thu, 17 Oct 2019 08:25:49 -0700 (PDT)
Received: from [192.168.50.32] (243.red-88-26-246.staticip.rima-tde.net.
 [88.26.246.243])
 by smtp.gmail.com with ESMTPSA id t83sm3835914wmt.18.2019.10.17.08.25.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Oct 2019 08:25:49 -0700 (PDT)
Subject: Re: [PATCH 3/3] hw/dma/xilinx_axidma.c: Switch to transaction-based
 ptimer API
To: Peter Maydell <peter.maydell@linaro.org>
References: <20191017132122.4402-1-peter.maydell@linaro.org>
 <20191017132122.4402-4-peter.maydell@linaro.org>
 <d9e7dd55-01e5-d852-bbab-84f5209abb6f@redhat.com>
 <CAFEAcA_zz=SYwD=iDgwVZcvPF4seZW9qdvfGKfmK_UaaUDF7Vg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e87fb5b4-9c97-fe6d-af4f-8fef1bc0bced@redhat.com>
Date: Thu, 17 Oct 2019 17:25:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_zz=SYwD=iDgwVZcvPF4seZW9qdvfGKfmK_UaaUDF7Vg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fCaiPT90+n7G

On 10/17/19 5:06 PM, Peter Maydell wrote:
> On Thu, 17 Oct 2019 at 16:01, Philippe Mathieu-Daud=C3=A9 <philmd@redha=
t.com> wrote:
>>
>> Hi Peter,
>>
>> On 10/17/19 3:21 PM, Peter Maydell wrote:
>>> Switch the xilinx_axidma code away from bottom-half based ptimers to
>>> the new transaction-based ptimer API.  This just requires adding
>>> begin/commit calls around the various places that modify the ptimer
>>> state, and using the new ptimer_init() function to create the timer.
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>>    hw/dma/xilinx_axidma.c | 9 +++++----
>>>    1 file changed, 5 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
>>> index e035d1f7504..fb3a978e282 100644
>>> --- a/hw/dma/xilinx_axidma.c
>>> +++ b/hw/dma/xilinx_axidma.c
>>> @@ -31,7 +31,6 @@
>>>    #include "hw/ptimer.h"
>>>    #include "hw/qdev-properties.h"
>>>    #include "qemu/log.h"
>>> -#include "qemu/main-loop.h"
>>>    #include "qemu/module.h"
>>>
>>>    #include "hw/stream.h"
>>> @@ -104,7 +103,6 @@ enum {
>>>    };
>>>
>>>    struct Stream {
>>> -    QEMUBH *bh;
>>>        ptimer_state *ptimer;
>>>        qemu_irq irq;
>>>
>>> @@ -242,6 +240,7 @@ static void stream_complete(struct Stream *s)
>>>        unsigned int comp_delay;
>>>
>>>        /* Start the delayed timer.  */
>>> +    ptimer_transaction_begin(s->ptimer);
>>>        comp_delay =3D s->regs[R_DMACR] >> 24;
>>>        if (comp_delay) {
>>>            ptimer_stop(s->ptimer);
>>> @@ -255,6 +254,7 @@ static void stream_complete(struct Stream *s)
>>>            s->regs[R_DMASR] |=3D DMASR_IOC_IRQ;
>>>            stream_reload_complete_cnt(s);
>>>        }
>>> +    ptimer_transaction_commit(s->ptimer);
>>
>> I'd restrict the transaction here within the if() statement:
>>
>> -- >8 --
>> @@ -244,9 +244,11 @@ static void stream_complete(struct Stream *s)
>>        /* Start the delayed timer.  */
>>        comp_delay =3D s->regs[R_DMACR] >> 24;
>>        if (comp_delay) {
>> +        ptimer_transaction_begin(s->ptimer);
>>            ptimer_stop(s->ptimer);
>>            ptimer_set_count(s->ptimer, comp_delay);
>>            ptimer_run(s->ptimer, 1);
>> +        ptimer_transaction_commit(s->ptimer);
>>        }
>>
>>        s->complete_cnt--;
>=20
> The timer_hit callback function itself writes to
> s->complete_cnt, so we don't want to allow it to
> be called (via the commit()) before stream_complete()
> is done with changing that state.

Indeed we have timer_hit() -> stream_reload_complete_cnt() which uses=20
s->complete_cnt.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
