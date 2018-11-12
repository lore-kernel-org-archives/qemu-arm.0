Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp3194168wrw;
        Mon, 12 Nov 2018 06:35:02 -0800 (PST)
X-Google-Smtp-Source: AJdET5dx6u7uuGNrFNMw7tiucr0Nh5pDCsghT12M7TrLSv8rWPuPzUdGCSwD3NDRpt4aDSgqZ8xa
X-Received: by 2002:aed:3622:: with SMTP id e31mr1128904qtb.5.1542033302708;
        Mon, 12 Nov 2018 06:35:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542033302; cv=none;
        d=google.com; s=arc-20160816;
        b=EDxLMGp1UKp/OMPZ5P1A9qK84VpJwv1CwI0nENbsJhN/Z1aEcL179a46SsXC4F8moy
         Ld2+Lnh7cbSMPvItsr1FnjZUgKxQUps+jCF1lpCJFeTANC/b3lJBZO6VQeFCrqxyI+2F
         BJhHhiYrQxGLSs35dMJ4Y4lKWJaSyotKkQZHMmAhewzCz69Ua8TK4lkEZHKPjIbUaV+o
         BQxEIraloGIHj8KLMWhO5lvBWWcQMle/R/e2/NdsSSYrxQSg3Qy74nx2OmWI9sTP5+fg
         +JzB535aO7f/SdhdjZUOQsZFFbGAgJo1DXHn0+6GYhR25B/EFGTRahj+xRhH+05EyDyp
         Zdww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=ke4qAW7KjOXbaSf6fmggYllIJS2io9+6pnMmoOsoQUI=;
        b=CIwVrleYKbYK0qlvwdEZVYkmG8csceutLuA+HwEYSn9xrBxVdPJsyyTejm0BJuHRuV
         aFJTVbuP4hIv0TP8xWJ4a2Wgow1lniBfMlcU7HYyH08B8c5mmtOrt5OTbX9Ac6pBobq0
         43Jqaly+cKOxEeRCKEjapL0pSa573AoEjaXvDLiIOJvy33b1v6wxMnx1ApvgWysuw95q
         PdM7ciBziCyfYyUwjYQwvn0oxDRoDIOaDhn5miK3bo+SlzmzW9x3z4m0meqLiLQnG8e5
         XMCbDnTZnIbP8i5NSZ0z0n3AfbeGAIUOcuCtnyKQxKrowCa5oXr2ImfIVAX0acu5z4f2
         ODpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BvcVh9Xn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s17si8574182qkl.40.2018.11.12.06.35.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Nov 2018 06:35:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BvcVh9Xn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48920 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMDIr-00059x-Mp
	for alex.bennee@linaro.org; Mon, 12 Nov 2018 09:35:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39083)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gMDIf-00058v-LG
	for qemu-arm@nongnu.org; Mon, 12 Nov 2018 09:34:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gMDIe-0005Rx-In
	for qemu-arm@nongnu.org; Mon, 12 Nov 2018 09:34:49 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:35414)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gMDIe-0005QQ-EF
	for qemu-arm@nongnu.org; Mon, 12 Nov 2018 09:34:48 -0500
Received: by mail-oi1-x244.google.com with SMTP id v198-v6so7323270oif.2
	for <qemu-arm@nongnu.org>; Mon, 12 Nov 2018 06:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ke4qAW7KjOXbaSf6fmggYllIJS2io9+6pnMmoOsoQUI=;
	b=BvcVh9XnOdlmXNmblY1o9mORgO+cUgMyMLTxdgd/OIFoR4AQs9YeRrx78sSPlNiuOp
	qSiHMBNrP2oAivHJfwkJhwzA2hxisupPtdzsXNdck2eXSbWXzWK0+s0VmRTIgDuc+NI2
	GtIaLUislbW/7bfKVJWs8To0hqO+tUF5o0yio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ke4qAW7KjOXbaSf6fmggYllIJS2io9+6pnMmoOsoQUI=;
	b=lSICXt1ZSJ7zMILk18TUSCaM3hUzCbQUvRSguxgioXJK0F4gNBzT2LioFjRaxn+WwG
	zouOyxw680R8EYmBpcUx8kG/WKgVrUcSYT/DwSiAQn93F3C03WqJbb/jrxeWL3DpWcC3
	D7mqEac3eX+vkLqdltTYnkr1+GCqeoK+L/CRPPS5GSSxhhyRuco1DNZxqtyJFKd1sjdz
	GmQO++25KQ0xaTBfOrvweKMpC21th8aOmKqnbtTsLug4otp3MWQdVZMpSJpAB1AWqjMH
	dR9o3vxuq30r74rnRu7fotQ1QqJeKGQaid3RRW4HfQaFTCnYEoTsHQp4PoTTmDddK/JE
	5MXw==
X-Gm-Message-State: AGRZ1gLM9tn71pI9Pi5GsIuCSZm+PeObVM9OEaf4InZ6JxQwe9XE1j+s
	O/unN4KxTOB061lvWFaAU+KdGTB8Tgiv22adDpKhsw==
X-Received: by 2002:aca:1c6:: with SMTP id 189-v6mr654204oib.325.1542033278723;
	Mon, 12 Nov 2018 06:34:38 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Mon, 12 Nov 2018 06:34:18
	-0800 (PST)
In-Reply-To: <6ace0700-23b9-d004-a5d9-6ab1bdb90835@linaro.org>
References: <20181108175246.13416-1-richard.henderson@linaro.org>
	<20181108175246.13416-3-richard.henderson@linaro.org>
	<CAFEAcA_WJMAsHWx+OTO+j0eTsHodpXkyxLv6cAdXxgjsCmTYhw@mail.gmail.com>
	<6ace0700-23b9-d004-a5d9-6ab1bdb90835@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Nov 2018 14:34:18 +0000
Message-ID: <CAFEAcA-3yT-Tw_Q6fiioyxTF8oEJ0r+ZTKdYCg4inYgtdwcxRA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [PATCH v3 2/5] target/arm: Fill in ARMISARegisters
 for kvm64
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Yk/KSkr6T3tM

On 12 November 2018 at 14:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 11/12/18 12:37 PM, Peter Maydell wrote:
>> On 8 November 2018 at 17:52, Richard Henderson
>> <richard.henderson@linaro.org> wrote:
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>
>>>      /* Old kernels may not know about the PREFERRED_TARGET ioctl: however
>>>       * we know these will only support creating one kind of guest CPU,
>>>       * which is its preferred CPU type. Fortunately these old kernels
>>> @@ -474,8 +497,71 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>>>      ahcf->target = init.target;
>>>      ahcf->dtb_compatible = "arm,arm-v8";
>>>
>>> +    err = read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64pfr0,
>>> +                         ARM64_SYS_REG(3, 0, 0, 4, 0));
>>> +    if (unlikely(err < 0)) {
>>> +        /*
>>> +         * Before v4.15, the kernel only exposed a limited number of system
>>> +         * registers, not including any of the interesting AArch64 ID regs.
>>> +         * For the most part we could leave these fields as zero with minimal
>>> +         * effect, since this does not affect the values seen by the guest.
>>
>> These older kernels do implement reading of id_isar0 through
>> id_isar5, though -- we could read and use those values rather than
>> leaving them zero.
>
> But without id_aa64pfr0, we don't know if id_isar0 et al have UNKNOWN values
> due to aa32 mode not being present.  E.g. run a 4.8 kernel on a thunderx1 cpu.

Good point, which makes things kind of awkward.

>>> +        ahcf->isar.id_aa64pfr0 = 0x00000011; /* EL1&0, AArch64 only */
>>> +        err = 0;
>>
>> Doesn't this code path leave everything except id_aa64pfr0 as
>> zero, thus leaving us with the "could cause problems down the
>> line" situation ?
>
> The other id_aa64* register fields are all extensions to v8.0, so they should
> be zero.  I am of course assuming that AdvSIMD is present, otherwise qemu
> itself probably have failed before now.

You don't set the id_isar* to say "AdvSIMD present" (or "VFP present"), though.
So if we in a later commit change target/arm/machine.c:vfp_needed() to
check an id_isar* field instead of ARM_FEATURE_VFP then we'll break
migration for these old kernel versions. That was the kind of thing I was
hoping we could avoid having to remember for the future...

thanks
-- PMM
