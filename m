Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2599164wru;
        Thu, 9 Aug 2018 20:38:14 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPw3ZJq99KEytE/pJyLCeu7dmNondAVfWTnUtPYmN+DHE0tUNMpr4xS8Eqx3/N3sTmwXdUqr
X-Received: by 2002:a0c:95fa:: with SMTP id t55-v6mr4269813qvt.246.1533872294338;
        Thu, 09 Aug 2018 20:38:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533872294; cv=none;
        d=google.com; s=arc-20160816;
        b=OwkfI2+JxbRFsChxMJx5j2Zpd/88vNyrczps4RzLODhloqlVsx/dW9cqQbEf85/Fwq
         ESz5jpO5BMMkJLYCNv/sa1oIjnnv399uBbkfb87+2rHts2mynQ63ihailmRL8TkLiivF
         SxJUPrPBiKjMUg6jjqNHALgAfJSZdZ9latTp2itwiLkJX6017oh9oKKSTYphvr9Lf5V+
         hzgk0zlvCFgRGHjNbm9jyMczI00xEWLuhoz/uoHb0YI8yD98OpIrDB6dB3Dp1qhxZnpA
         bTDhiUkzi+2420LAoelrPn6xaMNcz+IuZ8eDBHmrvtS039sb2AIKdmb/f3yD0PbFynA7
         Wbpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=/f27VVr4HTRz2Ve/czqk1mtZbnvV80tfM++iN3R/Djg=;
        b=emYmFYViZfxARoynIRd84FuLlfyt7m1pPJ8pYlSifmw0RC/DqzznCs133LQpPKRwjx
         ZmkIUqukUg62rBC9b48auqxIrWbMU/+py+RD4ug/j+2sZvf9ywAwrxAqGwFUx0Xji6PX
         OOatf44EdjbfX58k8kLl62jj4p3ZUu0KfgLAREoMirvMn6JBVVO9THIm9iRcu7pWNVn9
         h9b/ZKlc8wsmTg054oJSm7TXlVNa0ra9DduZQc7Y2oMI/09sZiJxLfik7phZLb8+ZqVJ
         EEyOk62ffxxAfoRxBDoVEJDa7FMeSGUJmINWvnJzXbavd6MEG+wZ1tS9Fk+3ojLaCmk8
         aXMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=s1nJ+fNa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f15-v6si7429439qth.269.2018.08.09.20.38.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Aug 2018 20:38:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=s1nJ+fNa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54100 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fnyFh-0006RV-Jr
	for alex.bennee@linaro.org; Thu, 09 Aug 2018 23:38:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51146)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fnyFY-0006RJ-Cb
	for qemu-arm@nongnu.org; Thu, 09 Aug 2018 23:38:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fnyFV-0003co-8t
	for qemu-arm@nongnu.org; Thu, 09 Aug 2018 23:38:04 -0400
Received: from mail-ua1-x941.google.com ([2607:f8b0:4864:20::941]:33353)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fnyFV-0003cY-3y; Thu, 09 Aug 2018 23:38:01 -0400
Received: by mail-ua1-x941.google.com with SMTP id i4-v6so501784uak.0;
	Thu, 09 Aug 2018 20:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=/f27VVr4HTRz2Ve/czqk1mtZbnvV80tfM++iN3R/Djg=;
	b=s1nJ+fNa59WTu2Ee+ATXJ0cDDqIm0dgOGuPfffi6EEBcDb8BBjUq8f9tFbRNHfuap+
	UZrLWKAcLMZ4OSBeRY0cIKi9AeP940H66ml84a9pJxoXfSHXUlUxbO1mzR1mouHtGUG9
	l85Sk0kAuwYERDOkV0Y3cg5LBFX0Y5g+TKrgzBdTbndYRb6zXFa/Grq+srt9o2vSgHj8
	aJlIuHVGgsQWNjBPUBrMijBUmVkVQYQxut9wbX62D+HatpdMkpbRzsLxOi8yQ+LJj4f+
	Lem+gbWwnQ37OTViszI36nNZLRiSa2847HGpLEBSwIEWws+CTiEJZ4jv1w0r8MwxsAu8
	NHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=/f27VVr4HTRz2Ve/czqk1mtZbnvV80tfM++iN3R/Djg=;
	b=sZ18GhbsIZueFBdX8BWC4bafWFXs/zaslxq3wQoiUuiSrhdCXGLnYrpjdL6ND1skq5
	jGB6HnR6CWpNL9h3tFhikOx4G9Kzd3dzNOvoAhzzXxnkMGTlt1Mf7ulUWyyqn/O4YEBa
	OI9BB5Wu5Sj7aev/8xd/Iftz5a1ZDoTFe8SJ68ZZPp7apfCIR30b3sERUA/Rx3vleowc
	lP+09JKm0HGoiO6peVWl9y0H81cDxWxMDQlYd0NxU9fRxju6xbF1HspMgppFOX2G7MD9
	1YyW4s34eTlRQ/jak24sINqV+X76BB5ZisoIm5xlJWseTuy89blnmw3ptnodEDIK+IZB
	brEQ==
X-Gm-Message-State: AOUpUlEARRKGEbHYegtiC/QrU5xVBbMHv/U1wjnL4Kg4vUJVl+cQewm7
	TGxdCdMZ8U4Xi6oInC9fXeU=
X-Received: by 2002:ab0:1724:: with SMTP id j36-v6mr3274165uaf.0.1533872280388;
	Thu, 09 Aug 2018 20:38:00 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	d203-v6sm2527245vke.39.2018.08.09.20.37.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Aug 2018 20:37:59 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180725085944.11856-1-stefanha@redhat.com>
	<20180725085944.11856-5-stefanha@redhat.com>
	<829318c8-9921-b856-e2bb-86583f43a8e7@amsat.org>
	<CAFEAcA-YQ1yE0jc2CgTvvPipNjMC=7SkKQcKHV5-vgPwEBFHSQ@mail.gmail.com>
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
	YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQI+BBMBAgAoBQI3aGSw
	AhsPBQkmUJgABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDj4yws3q3A3nS+EACxKosO
	3DZdwdVPXLVvSAA5y3Ohr2ByWN06RlVEkKWkOxm0lQ96LxBOZ03mDC+He/36DHaP+fujPBTz
	XjTXygWWZUtk0flDWR1w0a4yhX/JHfL5yloMZrxifCwouf2Sv9Yd6D46pzMeGsq8aCvbZYSf
	lDi3KXsVHc+jbmRwxtzJxz7366dsTC1tOJmjVSxc8bE55pHnPFOT1KKM9fxGWZFYx0UqAL/1
	NkrOKP5eXdJ51EhQa5pjivJw6dQlfWMQURG4o4e2+aLe4TkS2FI0r6nTgmoDmTT74u35NzZW
	Q3xjqcfqUX52+0drwlta22guNDbcJ4J+/I6FBF1C7CoSysBiIrldZQ6cJZ19st3jb7NHAoNk
	DcUt5I3gt4EpaiijWEEYAhw1/NSagm9bfn9veBqzVHNQrz76NZMiy2kP2vAxKOvo1XVlcEl0
	8MQ+IAUvYcLvU6yHRB4da7ts+ufqriNI5WBpvoLPRRa0wFDTj0nX/CfWFX9UkTwHA6/SWlhE
	hHau4xrpzFENwF5UDFtMkleo/u5Ipv7q8wYNs5JBpSXGmm4oSV9BbW0gp28D8fY4GGv1+6Dz
	BNDeuIdPf2NX0X55uyphpB0J4d70uNszAWXr7VqGOBbGrHcNHeT62BvoRd8bUQhaEyiJwOyC
	Ny4YIWW+I8W2wXkW+vSrZfEro2GZjQ==
Message-ID: <5bec224b-79df-c7ec-be22-38cf53236e00@amsat.org>
Date: Fri, 10 Aug 2018 00:37:53 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-YQ1yE0jc2CgTvvPipNjMC=7SkKQcKHV5-vgPwEBFHSQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::941
Subject: Re: [Qemu-arm] [PATCH v3 4/7] target/arm: add "cortex-m0" CPU model
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
Cc: Jim Mussared <jim@groklearning.com>,
	=?UTF-8?Q?Steffen_G=c3=b6rtz?= <mail@steffen-goertz.de>,
	Liviu Ionescu <ilg@livius.net>, Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>,
	Su Hang <suhang16@mails.ucas.ac.cn>, Joel Stanley <joel@jms.id.au>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Julia Suvorova <jusual@mail.ru>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o9aR78XWEqrf

On 07/30/2018 02:51 PM, Peter Maydell wrote:
> On 27 July 2018 at 06:26, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> Hi Stefan,
>>
>> On 07/25/2018 05:59 AM, Stefan Hajnoczi wrote:
>>> Define a "cortex-m0" ARMv6-M CPU model.
>>>
>>> Most of the register reset values set by other CPU models are not
>>> relevant for the cut-down ARMv6-M architecture.
>>>
>>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>>> ---
>>>  target/arm/cpu.c | 11 +++++++++++
>>>  1 file changed, 11 insertions(+)
>>>
>>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>>> index 3848ef46aa..7e477c0d23 100644
>>> --- a/target/arm/cpu.c
>>> +++ b/target/arm/cpu.c
>>> @@ -1255,6 +1255,15 @@ static void arm11mpcore_initfn(Object *obj)
>>>      cpu->reset_auxcr = 1;
>>>  }
>>>
>>> +static void cortex_m0_initfn(Object *obj)
>>> +{
>>> +    ARMCPU *cpu = ARM_CPU(obj);
>>> +    set_feature(&cpu->env, ARM_FEATURE_V6);
>>> +    set_feature(&cpu->env, ARM_FEATURE_M);
>>
>> What about ARM_FEATURE_THUMB2 (T32)?
> 
> No, the M0 doesn't have Thumb2. It has Thumb1 plus a tiny set
> of 32-bit instructions (which we deal with specially in translate.c).

Oh I thought it as Thumb2, ok.

> 
> (As it happens we generally can't get to the checks on the THUMB2
> feature for a v6M core, so I think but have not checked thoroughly
> that it would make no difference to QEMU's behaviour whether the
> feature bit was set or not.)
> 
>> Peter: Since the M0 (optionally?) supports 32x32 multiply, should this
>> cpu use the ARM_FEATURE_THUMB_DSP feature? Else this might trigger an
>> 'Undefined Instruction' in disas_thumb2_insn().
> 
> ARM_FEATURE_THUMB_DSP only enables checks in disas_thumb2_insn()
> (and 32x32->32 multiply is not one of the insns it gates).
> The only insns in that function that a v6M core can execute are
> msr, mrs, dsb, dmb, isb and bl, none of which are affected by that
> feature switch.

Yes.

> 
>> And what about optional ARM_FEATURE_PMSA?
>> Oh this would be cortex_m0plus_initfn() for "cortex-m0-plus", ok.
> 
> Yep, plain M0 has no MPU (and so we're postponing the work
> of implementing the v6M PMSA, which IIRC isn't quite the
> same as the v7M one).

Thanks for your detailed explanations :)

Regards,

Phil.
