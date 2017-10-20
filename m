Received: by 10.223.197.9 with SMTP id q9csp7714473wrf;
        Fri, 20 Oct 2017 02:31:13 -0700 (PDT)
X-Received: by 10.55.197.20 with SMTP id p20mr5952336qki.229.1508491873200;
        Fri, 20 Oct 2017 02:31:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508491873; cv=none;
        d=google.com; s=arc-20160816;
        b=CKfGE+WU1ca5eThLfk/AjXijhzUbsiBpuuSPIjBJA6A2yfj+z/4Z6KLanNveugjEOY
         M2XqQla49Wc7m5HXgeD9DKiji3cVqaxXn/c788+ii45Jx8HMGHGWeOp8de0VyC3PD/jg
         CdmN3IgrhXbWqb2SKCR1ObpYf/zZKxHBIEpLaek0gSRc50Y/TU+C36MpK+lTfVCdatXP
         seVnzGjVSxWqzCDoJ6j4Hhhi2x+xOAn1Tr+E1Sc2wJC2rZSco/zYeEhHZfKUWtFrMddN
         /2et8mqqeetlKM52RqKsDif32YsL0UClJUwjCOas6VjWmxkFkBCxkoVE616nYRjmYxaY
         DF6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=atUdRbHQWuQY408/C/i2XN+BRZ/j93znfim+zSolH90=;
        b=k9iTc7rxsd2ty1MCtF7lpUzllk0chdXZpP1HUjI0Z8F0+C4d6EmcOR0BP8RIIK+OZI
         lQMqCKai+RNQKgrN2x6Q+PJVFSsv/0PGPSepgTaO9CzL1qN7i0jPPehu8uHKmLbrPvVE
         33kUWvrZfDpWZr3yb+JgTWZLW1cpi1vNlT7h5e3BJXbJM6AkXF1uAZEbcjRFsYedTg4j
         TKjDmsgeMrdTzo2h74aQZMRBxak7rMPmQ73yvxB2/xFAm+b8Q1DJtglJtzby/CaMIGwr
         RnQ3aSdZLpjcHR0s77Spg00lKHg69AAHcQdudMLLFmF0zOQx9dFuMG5Goih88yk+r/kn
         bEuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KBVAy/Of;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e2si441475qtb.197.2017.10.20.02.31.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Oct 2017 02:31:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KBVAy/Of;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52797 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5Te2-00012K-RD
	for alex.bennee@linaro.org; Fri, 20 Oct 2017 05:31:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56526)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e5Tdl-0000yO-1F
	for qemu-arm@nongnu.org; Fri, 20 Oct 2017 05:30:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e5Tdk-00015K-6W
	for qemu-arm@nongnu.org; Fri, 20 Oct 2017 05:30:53 -0400
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:51952)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e5Tdj-00014m-Vt
	for qemu-arm@nongnu.org; Fri, 20 Oct 2017 05:30:52 -0400
Received: by mail-wr0-x244.google.com with SMTP id j14so10807108wre.8
	for <qemu-arm@nongnu.org>; Fri, 20 Oct 2017 02:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=atUdRbHQWuQY408/C/i2XN+BRZ/j93znfim+zSolH90=;
	b=KBVAy/Ofe2TqAR617QdPZL8LQumkq/9U8pt4dPqttAcb7MoZcSLIv2d1Mtji7ciRsn
	p6jrwEwcng5VkvPtj1u9KAti92shF3y/FxEsxt0EeHQlHLMTkRCYkfcaxC1X3AlG+h4v
	as1gmp9CjmRdwa97koYspfyO0RbtOWUUCS+3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=atUdRbHQWuQY408/C/i2XN+BRZ/j93znfim+zSolH90=;
	b=Bg3g5tlXfg8QdAOXetRbzdh5x+/tNjf4Q9e/g4adxWndPbbfX6kpEg2sa96u0MJMZP
	tW3GPZrp3MPti/bg8cajhrMPffl7TR7p4d7cw/GEjvrBlrnwOsmEG42fTfw+rnKe3FlF
	31HQChtRf4WwXhSuRlzHzpti/PWZK7oxkEC+daOMvbIb28YXdYJX/Q1H6zBUnH6J6JBF
	KgsBVuHR18KFhHQ6mwOIUWjvtfWM1DYT59/o7ULzOgI8vVUIZXqBNr7wUlPXQaQNmIjS
	LLlocCWMJQMzVuIfSab7njFWjP7FwWMDOYiy5FpjSfLT+n0SxlKCTzqWmKtRdCGZlZZa
	96Kw==
X-Gm-Message-State: AMCzsaUW6vjhVLgLHiqb9ISDOTsUyDiBX5IGMrpgOuxsmI+6NaCalCYs
	FDTSTbJlQc5eG1Q/Dee9xN5N7R4ySKgPcs7YQEfftg==
X-Google-Smtp-Source: ABhQp+RJCegddEwRh1Pq8Eam9sUruHwaKAks6d+NnvLso3JFw1x3DWHCFhfqWSAm/F96wQNqE5oLfXBFe2ahhCxS0KA=
X-Received: by 10.223.155.209 with SMTP id e17mr3873266wrc.194.1508491850886; 
	Fri, 20 Oct 2017 02:30:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Fri, 20 Oct 2017 02:30:30 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.10.1710191354020.27209@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1710181439060.27209@sstabellini-ThinkPad-X260>
	<CAFEAcA_v=UsQ4hfn2oVLt3MPU3yJUnHLfzZHrdkstQ0VVgSDbw@mail.gmail.com>
	<alpine.DEB.2.10.1710191354020.27209@sstabellini-ThinkPad-X260>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Oct 2017 10:30:30 +0100
Message-ID: <CAFEAcA8uH1+V4uYsA=XuuxHOLKvLyZ56ieAaS5K9QNoLYspOsQ@mail.gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
Subject: Re: [Qemu-arm] [PATCH] fix WFI/WFE length in syndrome register
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Julien Grall <julien.grall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ev6UhZRldKZi

On 19 October 2017 at 21:56, Stefano Stabellini <sstabellini@kernel.org> wrote:
> On Thu, 19 Oct 2017, Peter Maydell wrote:
>> On 18 October 2017 at 23:03, Stefano Stabellini <sstabellini@kernel.org> wrote:
>> > WFI/E are 4 bytes long: set ARM_EL_IL_SHIFT in the syndrome.
>> >
>> > Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
>> >
>> > diff --git a/target/arm/internals.h b/target/arm/internals.h
>> > index 1f6efef..cf8c966 100644
>> > --- a/target/arm/internals.h
>> > +++ b/target/arm/internals.h
>> > @@ -398,6 +398,7 @@ static inline uint32_t syn_breakpoint(int same_el)
>> >  static inline uint32_t syn_wfx(int cv, int cond, int ti)
>> >  {
>> >      return (EC_WFX_TRAP << ARM_EL_EC_SHIFT) |
>> > +           (1 << ARM_EL_IL_SHIFT) |
>> >             (cv << 24) | (cond << 20) | ti;
>> >  }
>>
>> Hmm. What we do now is definitely wrong, but WFI and WFE can be 2 bytes:
>> there is a T1 Thumb encoding that is 2 bytes.
>>
>> HELPER(wfi) doesn't get that right, though:
>>     if (target_el) {
>>         env->pc -= 4;
>>         raise_exception(env, EXCP_UDEF, syn_wfx(1, 0xe, 0), target_el);
>>     }
>>
>> So I think that HELPER(wfi) needs to be passed an extra
>> parameter is_16bit, which it can then use both in its adjustment
>> of env->pc and to pass as an extra parameter to syn_wfx(),
>> which is then syn_wfx(int cv, int cond, int ti, bool is_16bit).
>>
>> (In theory HELPER(wfe) should also be passed is_16bit, but
>> since it doesn't currently ever raise an exception it
>> doesn't matter.)
>
> Wouldn't it be better to just check on env->thumb like
> HELPER(cpsr_write_eret) for example?

> diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
> index 3914145..ea16c9a 100644
> --- a/target/arm/op_helper.c
> +++ b/target/arm/op_helper.c
> @@ -476,8 +476,8 @@ void HELPER(wfi)(CPUARMState *env)
>      }
>
>      if (target_el) {
> -        env->pc -= 4;
> -        raise_exception(env, EXCP_UDEF, syn_wfx(1, 0xe, 0), target_el);
> +        env->pc -= env->thumb ? 2 : 4;
> +        raise_exception(env, EXCP_UDEF, syn_wfx(1, 0xe, 0, env->thumb), target_el);
>      }
>
>      cs->exception_index = EXCP_HLT;

This doesn't work, because there is also a 32 bit Thumb
encoding of WFI. env->thumb says "we are in thumb mode",
which isn't the same as "this insn is 16 bits".

thanks
-- PMM
