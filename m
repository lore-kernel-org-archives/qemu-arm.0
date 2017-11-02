Received: by 10.223.161.27 with SMTP id o27csp1573268wro;
        Wed, 1 Nov 2017 20:32:30 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+QdCnakcp2/4141cIGHLJ9Hxctf6rR5fc+WTiYQy3MwPSTWvuG8NgpU+1Vx5o8W9E0v/jJs
X-Received: by 10.37.7.193 with SMTP id 184mr1378463ybh.413.1509593550161;
        Wed, 01 Nov 2017 20:32:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509593550; cv=none;
        d=google.com; s=arc-20160816;
        b=XgKvk2Ab+GZd1vcIekbWZDkLAKudkdnbZXC6i9xL5RukvWHW4U+thivPbiQLHuPchP
         MfgZxBBTRoTGB4EkRPAvXVqgCyMSgvYY06l5qEqPJHfY3Li+hdQj0OntsrGhKsAv0Y/j
         sFWz4k3HlBhQw8qZDS+dZq4yp2TspJXtpKOFs8rlH1sqeMBPdb+qbKZxda4b/8t70bSB
         CaGcyJHhqSo1mZzhLLMq0m+c3Ogp+lJU1oBks0YcanPT6NBR75zzBUAiweTQBPepM1Ld
         urCYtvkXY+bsQOdBXGwfDCyLdEcREXSTBfV2ysyzHeKh1ozEi7AvU7XKPKpkLMcCHQMx
         NmVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=VIn995Wm5IAUN8Zop0qd40mtSU6Lfamu9rm1CsgE9PE=;
        b=emsRG7m7U2cQjEClaIRiivadXJ7t0AAureRGtvB/j3UtJAKSLEqruSgFTuqS3aFy+8
         oXek69xX6Cd3XkUjDwOOQ3cIJebrJH+FLSYWWsKCMAWTNhzsg8mEhyIiHa7AWrNmZ6it
         mYUmXJECwXzJfT6MgDqO5UPtgVkKPIw4/ogeTEv2ZwLaMYPcIk0Tyv6abhQoPmcdTCnf
         rLancIsqi4kOxWxWREBQl3olrh7FPILuVNdLsCxE3pBQ/sNfmsfFlGTKgCizVR9Vqqse
         mpEJXESUwQJsqhp9aHy4RuYIdwwFIyqQ0Qsgo9irD6zA8p+L1ymrA5MXNtKFEOumy7cb
         9t8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lLYYk/Qk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e69si502683ybb.713.2017.11.01.20.32.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Nov 2017 20:32:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lLYYk/Qk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58516 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eA6F3-0007Nt-LI
	for alex.bennee@linaro.org; Wed, 01 Nov 2017 23:32:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60919)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eA6Eo-0007H7-8b
	for qemu-arm@nongnu.org; Wed, 01 Nov 2017 23:32:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eA6En-0006P9-2A
	for qemu-arm@nongnu.org; Wed, 01 Nov 2017 23:32:14 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:47557)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eA6Eh-0006NI-IM; Wed, 01 Nov 2017 23:32:07 -0400
Received: by mail-qt0-x244.google.com with SMTP id z50so5137789qtj.4;
	Wed, 01 Nov 2017 20:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=VIn995Wm5IAUN8Zop0qd40mtSU6Lfamu9rm1CsgE9PE=;
	b=lLYYk/QkxnTtJbKL5MIyJc4vVhNy+smhFVelsj3Mu47AZVlzO6BV/XImsNgKY6DXdX
	JurksRhNX6FMT7ucbIL9Mmskik6JINu1FPaWy1wd6vyZjidYF+PeGT38SguRyfCHaj5F
	mu4u5qGLnz/wdrF2gaJ1s3zEiKUnVl/7g9044fXIEdOvj8hylhfOFcqyG3tLeoEPFxvZ
	qDvZ+B57lU9cvCdJo9FTr3AhYHxNecahMfiNyjQOaJXAX2cl12WMJh6RzLXZ/Y9GRfQq
	BQoQhW4DDpNSPfGM6zdybBxMW19YPocsHTsYIpMUxh30PBPhMcbzuiqPJn00gyR7DMus
	QKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=VIn995Wm5IAUN8Zop0qd40mtSU6Lfamu9rm1CsgE9PE=;
	b=uZ0oDBBGTYJ1iOXhN/tdwhkjVd0MLnJSLY7ltCHxNVdHcsST2BmfliA2OLxDhtYiVv
	7suhcB86vguuRqreBMdp2xh4leEKlqe6k6GMdNEfVM5sANuhqsl/jACEHUvv23nNQhw/
	23moGd7UtjEwUscMT8PP1txu5RRV5pvQRvpEwwArE5biwBX8JVwBcH3cdYfSD5mOfwMS
	FRCoEbXh4yj7CjD+8bKdhSi6ixWh1SIbi/ClHL1eQ82a+m3Gg/FkTqc5De6o4TBWhfXL
	tux9GpW21XH84XHtup52jDJ4XMk0e6PY98b9KXK1tyIsGteMjU+PXcnbnXFrQ4MNyvzn
	D9qg==
X-Gm-Message-State: AMCzsaWoCb+4XO5YLgdcEUWrViV6ECxp771u/inHpLbODcUUEt1KFzCw
	ae5cxfvw3veGkMFgOL+dLdIQzY9f
X-Received: by 10.200.53.200 with SMTP id l8mr3247701qtb.49.1509593526840;
	Wed, 01 Nov 2017 20:32:06 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id s5sm1458286qkc.70.2017.11.01.20.32.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Nov 2017 20:32:06 -0700 (PDT)
To: Domen Puncer Kugler <domen@cba.si>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Konrad Frederic <fred.konrad@greensocs.com>
References: <CAB1b2sgGrJbpC5vDMJ2D2kPms_4cGmyfMjpcww4nj6rfNZaF9Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <70579e6d-0fb2-c6d8-9541-0eea53272db2@amsat.org>
Date: Thu, 2 Nov 2017 00:31:57 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAB1b2sgGrJbpC5vDMJ2D2kPms_4cGmyfMjpcww4nj6rfNZaF9Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-arm] 
 =?utf-8?q?=5BQemu-trivial=5D_=5BPATCH=5D_hw/timer/arm?=
 =?utf-8?q?v7m=5Fsystick=3A_Fix_default_system=5Fclock=5Fscale=2E_Resolves?=
 =?utf-8?q?_SIGFPE_divide_by_zero=2E=EF=BF=BC?=
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q4+6WkW6PZdL

Hi Domen,

Please have a look at the Contribute/SubmitAPatch guidelines for QEMU,
in particular about CC'ing the maintainers so your patch won't get lost:

https://wiki.qemu.org/Contribute/SubmitAPatch#CC_the_relevant_maintainer

$ ./scripts/get_maintainer.pl -f hw/timer/armv7m_systick.c
Peter Maydell <peter.maydell@linaro.org> (maintainer:ARM cores)
qemu-arm@nongnu.org (open list:ARM cores)

^ Cc'ing them how.

On 11/01/2017 05:59 PM, Domen Puncer Kugler wrote:
> Fix default system_clock_scale. Resolves SIGFPE divide by zero.
> 
> Netduino platform code does not provide a way to set
> system_clock_scale, so it remains 0.
> This causes a divide by zero, when emulated code asks systick for
> current timer value:
>     (s->tick - (t + 1)) / systick_scale(s)) + 1;
> Patch fixes this by providing a default value.

See the thread around this reply:
http://lists.nongnu.org/archive/html/qemu-devel/2017-06/msg06678.html

> 
> Also replaces a magic number an with already defined constant:
>     #define SYSTICK_SCALE 1000ULL
> 
> 
> Signed-off-by: Domen Puncer Kugler <domen@cba.si>
> ---
> 
> diff --git a/hw/timer/armv7m_systick.c b/hw/timer/armv7m_systick.c
> index df8d2804b3..651f8030a8 100644
> --- a/hw/timer/armv7m_systick.c
> +++ b/hw/timer/armv7m_systick.c
> @@ -25,15 +25,15 @@
>  #define SYSTICK_CLKSOURCE (1 << 2)
>  #define SYSTICK_COUNTFLAG (1 << 16)
> 
> -int system_clock_scale;
> +uint64_t system_clock_scale = SYSTICK_SCALE;
> 
>  /* Conversion factor from qemu timer to SysTick frequencies.  */
> -static inline int64_t systick_scale(SysTickState *s)
> +static inline uint64_t systick_scale(SysTickState *s)
>  {
>      if (s->control & SYSTICK_CLKSOURCE) {
>          return system_clock_scale;
>      } else {
> -        return 1000;
> +        return SYSTICK_SCALE;
>      }
>  }
> 

Regards,

Phil.
