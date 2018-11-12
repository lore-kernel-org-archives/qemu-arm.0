Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp3171517wrw;
        Mon, 12 Nov 2018 06:14:17 -0800 (PST)
X-Google-Smtp-Source: AJdET5d3JysmzKoVMp9RINejpjH3oJ2lP04dkgWPHEOjlFz8r8MSdV4ae7/Dku560OJaom5m0AVr
X-Received: by 2002:aed:3a69:: with SMTP id n96mr1070882qte.246.1542032057664;
        Mon, 12 Nov 2018 06:14:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542032057; cv=none;
        d=google.com; s=arc-20160816;
        b=O/HQV2g5s8zQT/bwpguCNod32A+k8XVViJT5pv/9bkaWYxEmh0bR1pHF/NnbNMC9va
         TR7/HCPKp19NWfdykkHIHxR9wT7LJxW3Wp3XVc5ySIh8Lu2GwWBn4hdp0eRC59ENfeaU
         i42X8ywdepvey9yKcHB44ANIKuINITBnTzeJoE8cgWRigkq284Ny3+cAknbjV8++NkW/
         arvVT+WJzjfrt2JC9huTVj00p7wj0NS8cERbPfHBDAgM/8Vuu+tzJf32u7u61ZT2js+P
         tFneygvMwxLtpjsGRgIKn1L48dHMyq0oF/5RPpb1wRkQkJrKgYkhatka4nDNY7DO2IiW
         dOxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=kJXjzpG60Ac2B3l9I/9w42om4/OI3Dd82Hl+Ji+eE24=;
        b=Pp+NlxN5mzixK4Sd2W6cUS7oLbuPUfnJWdrEblMNIdssMLKZxW2RNUkVvo4V+9hty0
         n2pIcmGHLQ0U0aVf6SI0UtL1ihGPS8m7LHi91dDUYoYevBXBL7K1C1Dod4OxyhJCbvXT
         mO00qtQSkJQ6OlcuXwue4IGD56k94YiqeW/bfJvkV1NEuIwR8rL4GY5xqkquSHBqlG4u
         H/InUZOaMi2o3RZikO5haOgLveAvAXX+doq9H+boB9bVDYKilLVi6fI+piLvo1EoYEoK
         ZTE9gsEubuZ5zhdlp9nPdi+GiJzC6zLNhbUIkbTktU4OmfjW/qhJjqLiaMzA+LN4Fmzx
         y5NA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YtGpXA1p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y3si444044qvj.17.2018.11.12.06.14.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Nov 2018 06:14:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YtGpXA1p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48855 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMCym-0007TP-Mj
	for alex.bennee@linaro.org; Mon, 12 Nov 2018 09:14:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60881)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gMCud-0002dj-5s
	for qemu-arm@nongnu.org; Mon, 12 Nov 2018 09:10:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gMCuX-0007eG-6Z
	for qemu-arm@nongnu.org; Mon, 12 Nov 2018 09:09:59 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:33418)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gMCuW-0007dX-QZ
	for qemu-arm@nongnu.org; Mon, 12 Nov 2018 09:09:53 -0500
Received: by mail-wm1-x341.google.com with SMTP id f19-v6so8977744wmb.0
	for <qemu-arm@nongnu.org>; Mon, 12 Nov 2018 06:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=kJXjzpG60Ac2B3l9I/9w42om4/OI3Dd82Hl+Ji+eE24=;
	b=YtGpXA1pgfj9CAsWXaSGOsATTUhrzf3UnMzwSN5LCvZWHvRdG5WLgR0CSOGcCSTSs4
	uEHFn/yhFFpUr+bdaSO+nBG1pkK1VJgzSP2y8pcN+rd53WHE9btMj4KK2FxJOzjPO19f
	8uSMcfgotldz5Qdw6yeNXsa65uCyVH04jQZC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=kJXjzpG60Ac2B3l9I/9w42om4/OI3Dd82Hl+Ji+eE24=;
	b=GdPjHQMbnIqm530gLUBI6kcgRcRP0ncUNxogb+wPAdwaisXHZj8VoY/h9x9jjBIc52
	yDbzkQmnlY9r28eYeb/9h2yPTVr2C7fxkawMkfLHTj+8QkCCp+mAEeZrr9DgeilLEJLR
	zgpK+uOYKYddeq7NQJVYhwvTlHhn2+1ps/+Zw7Hw1zQgGJbZyZ/VUDx9Zm8O6zOpcC7I
	NQRwNlBLK3ZNVuJ1Ifgb+lE0Q5ziwUw85OTJ9O/BTnbnuExOVLPRyK0ph0DHuDQjTh7M
	u7ZT+NOu3m8LENSz6KxVAg7Jq8J26SLdgCDuh155W8HajPZGZpacPgyuzvBxnwVwiyHY
	7Dzw==
X-Gm-Message-State: AGRZ1gIz2TKJe8D22WTavS2hDWS0cz7E1o4Np1+UHqraMAIqvvGkr6JO
	b2C7k9lEgVQVtUTZJPp6SuGCpnCjAZ2h8g==
X-Received: by 2002:a7b:cb86:: with SMTP id m6-v6mr7515259wmi.77.1542031790849;
	Mon, 12 Nov 2018 06:09:50 -0800 (PST)
Received: from cloudburst.twiddle.net
	(178.red-213-99-154.dynamicip.rima-tde.net. [213.99.154.178])
	by smtp.gmail.com with ESMTPSA id
	z3-v6sm7898977wma.6.2018.11.12.06.09.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Nov 2018 06:09:50 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20181108175246.13416-1-richard.henderson@linaro.org>
	<20181108175246.13416-3-richard.henderson@linaro.org>
	<CAFEAcA_WJMAsHWx+OTO+j0eTsHodpXkyxLv6cAdXxgjsCmTYhw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <6ace0700-23b9-d004-a5d9-6ab1bdb90835@linaro.org>
Date: Mon, 12 Nov 2018 15:09:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_WJMAsHWx+OTO+j0eTsHodpXkyxLv6cAdXxgjsCmTYhw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
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
X-TUID: mRUkrmn3vbiw

On 11/12/18 12:37 PM, Peter Maydell wrote:
> On 8 November 2018 at 17:52, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
> 
>>      /* Old kernels may not know about the PREFERRED_TARGET ioctl: however
>>       * we know these will only support creating one kind of guest CPU,
>>       * which is its preferred CPU type. Fortunately these old kernels
>> @@ -474,8 +497,71 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>>      ahcf->target = init.target;
>>      ahcf->dtb_compatible = "arm,arm-v8";
>>
>> +    err = read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64pfr0,
>> +                         ARM64_SYS_REG(3, 0, 0, 4, 0));
>> +    if (unlikely(err < 0)) {
>> +        /*
>> +         * Before v4.15, the kernel only exposed a limited number of system
>> +         * registers, not including any of the interesting AArch64 ID regs.
>> +         * For the most part we could leave these fields as zero with minimal
>> +         * effect, since this does not affect the values seen by the guest.
> 
> These older kernels do implement reading of id_isar0 through
> id_isar5, though -- we could read and use those values rather than
> leaving them zero.

But without id_aa64pfr0, we don't know if id_isar0 et al have UNKNOWN values
due to aa32 mode not being present.  E.g. run a 4.8 kernel on a thunderx1 cpu.

>> +        ahcf->isar.id_aa64pfr0 = 0x00000011; /* EL1&0, AArch64 only */
>> +        err = 0;
> 
> Doesn't this code path leave everything except id_aa64pfr0 as
> zero, thus leaving us with the "could cause problems down the
> line" situation ?

The other id_aa64* register fields are all extensions to v8.0, so they should
be zero.  I am of course assuming that AdvSIMD is present, otherwise qemu
itself probably have failed before now.


r~
