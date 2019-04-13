Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp390250wrx;
        Sat, 13 Apr 2019 00:08:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxs3hNT/X7kiTw1ovoP6VQKnj2AieG+SGHbjblq0CwWEQ3vNYooPGuB3SuzWyDDQZxDVFeY
X-Received: by 2002:a1c:7a03:: with SMTP id v3mr14803380wmc.58.1555139289291;
        Sat, 13 Apr 2019 00:08:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555139289; cv=none;
        d=google.com; s=arc-20160816;
        b=Rvg31rkjzY6i+oLJ/MPrF6GNZsdqyEEyygxV+Zsgcy2dAt1m8qMIAR6fhXg1Pdi1GI
         /R4RP3733804hZUeUmHrvJ1wi+PYVdQS4+OMbMpgYgbQcFR3IHU0gjAhFRz6QvkMyMgo
         5nwB1sDx+8eN45AXoWW2r8dmKEHmYn8xqH+AZxMrnvALXe7Qd7vAyaKyGfr/0ygpNANh
         JOVdzg6jtHlju1QpqNp5W65UDWlf6mpgyNr2l0PmECUSsQ01sDrmD5cExbRyxFiVcpZk
         lkwUkZs2aPSe4ka65rHxZ8WGp9yVrt8QLBI7ueV45zJNSjZvJIx16tHAg4NfLZYDxzW4
         o/hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=k8oI1rFy3E518WcT6RKAmVFWvu5AL2jlh6i6AvLckA8=;
        b=uPhknBSmmlqbwJqkpZ6q8hJB4YC5TV7LsfxFXjxpzL0OTHS9kb480qZDviXCwqvC28
         RVTQvixbjlUQ22ZIm4lLwUbhrg213Q0eQQ0iQ6OudedUd5e6vOw7mSNo2v3kSsStI1F1
         J5gK+yUAMmF39WInF6+CqX96axJlxqa3N6qnD16KWJdxQ0/ryJS535OD1voguaaCnkxE
         dmtKkA5N48ol5H4KAG0sd1HwOym40tvY3qsEaGHXG5+J1mbK34eyVrsTqhJghnTyd1Uu
         x7pW74c37x8jShq73JpFF04TmlO/Ndm0E9cW5M5Jdcb+alz/+Ic7+aItOS/uy1+4QB/Z
         gVmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BnbTQl3f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w7si28789519wrs.314.2019.04.13.00.08.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 13 Apr 2019 00:08:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BnbTQl3f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:47794 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hFClk-0003OP-B6
	for alex.bennee@linaro.org; Sat, 13 Apr 2019 03:08:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54493)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hFClY-0003Nc-QB
	for qemu-arm@nongnu.org; Sat, 13 Apr 2019 03:07:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hFClX-0004Kv-S2
	for qemu-arm@nongnu.org; Sat, 13 Apr 2019 03:07:56 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:40573)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hFClW-0004K6-TU
	for qemu-arm@nongnu.org; Sat, 13 Apr 2019 03:07:55 -0400
Received: by mail-pg1-x52b.google.com with SMTP id d31so6219360pgl.7
	for <qemu-arm@nongnu.org>; Sat, 13 Apr 2019 00:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=k8oI1rFy3E518WcT6RKAmVFWvu5AL2jlh6i6AvLckA8=;
	b=BnbTQl3fPWg+RSTy2OfF/4IG85cIIP3yI9nICmj1uSSsWNocOMVV0r6pSfZryxMpmh
	gAO6iMB7JF5OpMIdn0w+1mr34Aqb8IN67U+JEiz3G/eQuPSaDZgAWBdnqj/YyauqbI8h
	9o0th2vK5aHIl4+2oGejlyjeiYEoSo30E7yZqg1ZMfhTr4BHpAWvSXg/TLHfmBLzK0tv
	VEDG8qj1DlrLhJ71LppbxMZCbSE2KsrapbCfUyvAMn4clVymsLHE8K1WHRe/UU55cCt0
	Er8wWToEZ0uKXIZqHcZcMZ4p2dUd3q9gtL7qkVUyBBPMHOhkrUWsyxbOgBb14eyjmlnI
	Eh/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=k8oI1rFy3E518WcT6RKAmVFWvu5AL2jlh6i6AvLckA8=;
	b=gAc5azU+QWgYL0abmXIobKV7iSofLvmhOkrBqh6rC5y3sejZZEEVskTikznuEr4dAl
	tIer+49XtHeTutBk+sulWmO7g/wFX5BOglW8y4AyUsZdtop4uota9yesR+LxEhWczqqe
	K3ORQBvf/4GqeeEay7SyLcPIteCF59Kafu6Wx7D7Fs9oMI6YieenJi+50ATkRaHl8DsJ
	kQxm44kCXuyPrZgxtD2sDMuCXNbMrtmg7d85JcfWOjfVwZVZRYuO8eq2xYb9Bn7qEhXf
	hkFQA/BtVLS/XrAt7BxMC2DC1wMEXTefWs2kG7I6ArkB2S4Cr0dHnmMezS2YSmOWJHmP
	WRsQ==
X-Gm-Message-State: APjAAAUp1DtWnxoe/6W6YdOVoREkzYDiLJi3zM5lXpgP6eWTsNnfShUL
	SOPilvkoi+skdGVKjCUe0aHXOQ==
X-Received: by 2002:a63:195f:: with SMTP id 31mr58273279pgz.116.1555139273200; 
	Sat, 13 Apr 2019 00:07:53 -0700 (PDT)
Received: from [172.20.98.58] (rrcs-173-197-98-123.west.biz.rr.com.
	[173.197.98.123]) by smtp.gmail.com with ESMTPSA id
	q5sm12946064pff.97.2019.04.13.00.07.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 13 Apr 2019 00:07:52 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190411153942.4533-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <53930e87-3bb1-fdd5-a8fe-8603c0adecc2@linaro.org>
Date: Fri, 12 Apr 2019 21:07:48 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190411153942.4533-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::52b
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target/arm: Implement NSACR
 gating of floating point
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NobG5B6Ef/uZ

On 4/11/19 5:39 AM, Peter Maydell wrote:
> +static uint64_t cptr_el2_read(CPUARMState *env, const ARMCPRegInfo *ri)
> +{
> +    /*
> +     * For A-profile AArch32 EL3, if NSACR.CP10
> +     * is 0 then HCPTR.{TCP11,TCP10} ignore writes and read as 1.
> +     */
> +    uint64_t value = env->cp15.cptr_el[2];
> +
> +    if (arm_feature(env, ARM_FEATURE_EL3) && !arm_el_is_aa64(env, 3) &&
> +        !arm_is_secure(env) && !extract32(env->cp15.nsacr, 10, 1)) {
> +        value &= ~(0x3 << 10);

Read as 1, and yet you're clearing the value?  Cut-n-paste error from CPACR?
Surely better to do nothing on read, but set on write (to either HCPTR or NSACR).

> +static uint64_t cpacr_read(CPUARMState *env, const ARMCPRegInfo *ri)
> +{
> +    /*
> +     * For A-profile AArch32 EL3 (but not M-profile secure mode), if NSACR.CP10
> +     * is 0 then CPACR.{CP11,CP10} ignore writes and read as 0b00.
> +     */
> +    uint64_t value = env->cp15.cpacr_el1;
> +
> +    if (arm_feature(env, ARM_FEATURE_EL3) && !arm_el_is_aa64(env, 3) &&
> +        !arm_is_secure(env) && !extract32(env->cp15.nsacr, 10, 1)) {
> +        value &= ~(0xf << 20);
> +    }

This one does do the right thing, but better to clear the bits on write to
NSACR.  This lets you avoid the change to fp_exception_el, and the missing
change to sve_exception_el.


r~
