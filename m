Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp1338542wrw;
        Sat, 10 Nov 2018 11:26:30 -0800 (PST)
X-Google-Smtp-Source: AJdET5fWBh2KRzatoYU9VeOkHThbnsCaGIWeqwYtC8D+TD7ZwHFclxd9fHkPmwwXwIUJdq0M+hwO
X-Received: by 2002:a0c:920c:: with SMTP id a12mr13694088qva.190.1541877990715;
        Sat, 10 Nov 2018 11:26:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541877990; cv=none;
        d=google.com; s=arc-20160816;
        b=DC8vUKQRxyXLHNOdjf4r21p9BlifkcHJmmFkcWlqAN6oVdpFxZzSt/d8A7aqrelAAr
         jeZqICPqIyBRGhmj3u8XYELzo9wwu5CNeIcdD+XRkDjcQAay8Ep1at0qrs8qtnope46y
         AX7299t015nP5VY4TlG+WiqFmyiWU2l9X8vCJrs89GI/4NivxVJrKWnVasNduKmbJyVi
         7djtfDUFx2WFp2rBWZLACLRYl6heE0LIrlrW+vnd+IMOxlFDb3E2DzSQvQEw1fYnU1bM
         Dgs8b5kmgwlST6p5D/sp1T7eUXNfJVwmgLuoHEQo1zZpoyFuuZpcWa5j8/4TuN5ewG1Y
         cu8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature;
        bh=BmuL6TEsqCG6Nyhv4OIvaFvDAlwhvc2WOoSlebFLCYc=;
        b=hCCpsgAdmiE63cyCUkpS3zmanixtVqZKonaBeyKKjXf+iNPjy5RgkUDYaSr+e+aP18
         OcaXy2h5sv3+JfuY5DMu8n1weUQ0E/JVASDwpTrt0MfBMViSv6JQviQ3mCWMmbjz0BRY
         rHcRP3EoK/DqsCbqclznhFMZplE/Z+vX6kWkrQJNU+c2gnMK25WRAmBUl4lkJNvsGsC+
         6PoqJH4fuopo8MoHQmy/wfNm44vpg9AhYc5sG8TU0vxAoEKH/C/Yk8UNMSno2FPspvgf
         CTk+/ATJHSWULIKzcxWcioGWeIhgtm3l/1sHAljz+iEkV7Hm9UZpa0drgk2tu4brZxUt
         bZzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Cb24HtQ4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o63si2380704qka.164.2018.11.10.11.26.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 10 Nov 2018 11:26:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Cb24HtQ4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39703 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gLYtq-0001t8-6F
	for alex.bennee@linaro.org; Sat, 10 Nov 2018 14:26:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41172)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gLYtd-0001ro-1G
	for qemu-arm@nongnu.org; Sat, 10 Nov 2018 14:26:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gLYtb-0001eI-Ti
	for qemu-arm@nongnu.org; Sat, 10 Nov 2018 14:26:16 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:38455)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gLYtV-0000Mv-Lm; Sat, 10 Nov 2018 14:26:09 -0500
Received: by mail-wr1-x441.google.com with SMTP id e3-v6so5240154wrs.5;
	Sat, 10 Nov 2018 11:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=BmuL6TEsqCG6Nyhv4OIvaFvDAlwhvc2WOoSlebFLCYc=;
	b=Cb24HtQ4UgtnNotwgG/dEKtme6/i244nTpr51aMHxSNIIaX2aTY7jD3JC6t6KerSGL
	7OhDC14BSQXl5BWoe8NkEZrt6PtDzao75NOIrqwqchNLQzjnHAQXIkyPV13Z+K7wEbKF
	njDruGPIhNxYV5xhr/C+fMUFZMVqRND8fwlK6RnHupIQOh58RVVbU5mw6KF/rx/NPBWC
	XxvTwDOtpm489Ui/YToLSXNbTfu05auQiozqSpKaCZQgRU/Lsdo6rci5XveE77Iy4j3n
	TRDay3jjipGlcaAAsYtVpnGjMPRSlmEFvnBT+jT6S5/wBHIlFBZ7Z/S7np/nl9V/Ssqi
	r/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=BmuL6TEsqCG6Nyhv4OIvaFvDAlwhvc2WOoSlebFLCYc=;
	b=hryH/jNaLcnDQCbyx2zboT6tFNr77IanyvB2rRAHwyf7T07/JceNaTCSEmRd7V8Nc2
	AK6C17hhXiRbQhAe98vPIAsCdjob034yCeulC5ioDsqAM0D38qllfJY9e05BFEYKT1Is
	cZqauhSaS2ObIbdEfJJbLJNGnrpdMqZ9/hGFN0l30rPmlX0as4+sIXNNCNxzEkRlRrgq
	tPxD2ANPSKi+R1d96GRUhcvCCiwVOhOkLmp8RG/TG0+ucviDKHpZ7h3QvTGiu1HSMw7J
	E93LegGpWnyPB+6i90PtBWHuino99eJZwWXVWQDSYXMfnqZPhJn9FDQzC+WfyRiqbaOz
	ALwQ==
X-Gm-Message-State: AGRZ1gKLEmMOFwp1TA+26sFlqAkSkrfBAEOcwhdwHM4EzdVMryXdodbq
	0B4lqJtbURvJIV/jPwb7DGc=
X-Received: by 2002:a5d:53cd:: with SMTP id
	a13-v6mr11677575wrw.71.1541877968543; 
	Sat, 10 Nov 2018 11:26:08 -0800 (PST)
Received: from [192.168.1.38] (2.red-83-59-163.dynamicip.rima-tde.net.
	[83.59.163.2]) by smtp.gmail.com with ESMTPSA id
	z8-v6sm12807452wrr.94.2018.11.10.11.26.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 10 Nov 2018 11:26:07 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
References: <20181109173553.22341-1-peter.maydell@linaro.org>
	<20181109173553.22341-2-peter.maydell@linaro.org>
	<CAFEAcA8pbw-D_9P3RYGMZbFXBFD6PzFNgrVLEb_RYQ11YuFdOQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Autocrypt: addr=f4bug@amsat.org; prefer-encrypt=mutual; keydata=
	mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
	u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
	HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
	YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
	ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
	dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
	ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
	Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
	HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
	Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
	YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQJVBBMBAgA/AhsPBgsJ
	CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPqr514SkXIh3P1rsuPjLCzercDeBQJbkphvBQkm
	loU1AAoJEOPjLCzercDeTLIP/3pzTBotxvkddIREaw2j/6RoxN1lj5hnCx/XHGF7QxAlO4uV
	7eB6hcZxAqlt4AyNX5jcsSxNMfVNGnZ+u4ni6VdRRLUOw/QPXKGV8siK2E1zOG1GwZSCJ5zb
	ol7gpXNnOG/+ZXDfvkfSNnpim0ahNIPX8WAaZ/qN7I1qsPGupK2JrlCot561TfIOT7KNZFAZ
	m66Hf8MeNr8HQtn+oDk6j7g6WuIYZiqvF1MladikIZXndDMCsopXsjOikMXtoVuC/df7BlwS
	UaM+DT47onbIfXOtsWQGd2dJhu07Kxphqlz1Uh3YA7IHsFzZkX+S9waPBEzC8YB39dkZKA2E
	XbObk/ZTtCBLb39KTN2L7bv3Agm6wYO/hw3DQJQV3/07vW1EJd4fglQB5IY2A3eQ/ZSuRVm1
	E1GyFszjLXKUQIKx1938zoLrUDDdWQH7bhhSvG7JWk1BKmJrIXDTDx1tvTOW2pYZuO1PNx+p
	EhJraVuu3jtSbEfH+uPeoWtJtqSRkz1fLqp+dbha24ldPeKw4ija/YTviOem5baUlf/iNgS+
	a0s0eoRiJFrGZFCKLGKgZYoJe1rccQR6JKKd8JpoaIQuzptcHZD4+qn8W8FUlkNWGfpTQrsN
	iPLZt2EFOFkbjoZ2EoEByCs9nZ8ro91+lq7QfH9RFcldKLZfPEWwHPrchQ42
Message-ID: <5d8b596c-50f8-f637-f73a-8a5cb56ac908@amsat.org>
Date: Sat, 10 Nov 2018 20:26:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8pbw-D_9P3RYGMZbFXBFD6PzFNgrVLEb_RYQ11YuFdOQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: Re: [Qemu-arm] [PATCH 1/2] target/arm: Hyp mode R14 is shared with
 User and System
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
Cc: Adam Lackorzynski <adam.lackorzynski@kernkonzept.com>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M6CNHwqqJvnm

On 11/9/18 7:15 PM, Peter Maydell wrote:
> On 9 November 2018 at 17:35, Peter Maydell <peter.maydell@linaro.org> wrote:
>> Hyp mode is an exception to the general rule that each AArch32
>> mode has its own r13, r14 and SPSR -- it has a banked r13 and
>> SPSR but shares its r14 with User and System mode. We were
>> incorrectly implementing it as banked, which meant that on
>> entry to Hyp mode r14 was 0 rather than the USR/SYS r14.
>>
>> We provide a new function r14_bank_number() which is like
>> the existing bank_number() but provides the index into
>> env->banked_r14[]; bank_number() provides the index to use
>> for env->banked_r13[] and env->banked_cpsr[].
>>
>> All the points in the code that were using bank_number()
>> to index into env->banked_r14[] are updated for consintency:
>>  * switch_mode() -- this is the only place where we fix
>>    an actual bug
>>  * aarch64_sync_32_to_64() and aarch64_sync_64_to_32():
>>    no behavioural change as we already special-cased Hyp R14
>>  * kvm32.c: no behavioural change since the guest can't ever
>>    be in Hyp mode, but conceptually the right thing to do
>>  * msr_banked()/mrs_banked(): we can never get to the case
>>    that accesses banked_r14[] with tgtmode == ARM_CPU_MODE_HYP,
>>    so no behavioural change
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  target/arm/internals.h | 16 ++++++++++++++++
>>  target/arm/helper.c    | 29 +++++++++++++++--------------
>>  target/arm/kvm32.c     |  4 ++--
>>  target/arm/op_helper.c |  2 +-
>>  4 files changed, 34 insertions(+), 17 deletions(-)
> 
> Rats, this bit accidentally didn't make it into this patch:
> 
> diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
> index 2b62c53f5b5..eb6fb82fb81 100644
> --- a/target/arm/op_helper.c
> +++ b/target/arm/op_helper.c
> @@ -725,7 +725,7 @@ uint32_t HELPER(mrs_banked)(CPUARMState *env,
> uint32_t tgtmode, uint32_t regno)
>      case 13:
>          return env->banked_r13[bank_number(tgtmode)];
>      case 14:
> -        return env->banked_r14[bank_number(tgtmode)];
> +        return env->banked_r14[r14_bank_number(tgtmode)];
>      case 8 ... 12:
>          switch (tgtmode) {
>          case ARM_CPU_MODE_USR:
> 
> 
> (it's one of the "no behavioural change" bits).

With this hunk:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Thanks for the detailed patch description,

Phil.

> thanks
> -- PMM
> 
