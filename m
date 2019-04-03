Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp2495151wrx;
        Wed, 3 Apr 2019 00:31:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy8GKyVXgGC/jQzyTB2VWms6EEI42I7EaDL1lrCSrk05A6OTYjoiFVWOBvq9cV6GQTQjLHP
X-Received: by 2002:a81:2c6:: with SMTP id 189mr63879772ywc.225.1554276682360;
        Wed, 03 Apr 2019 00:31:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554276682; cv=none;
        d=google.com; s=arc-20160816;
        b=F1FVAR++9Icd1ImRN8kN841KpsYSKFAjiTcJy5wgyOci5Nz5/ydEE5HssxU1fqHyZb
         LC+MnvBiMBuO+cRFZqasn1YpHTaRHkKeKycaKvSNqGeBmzzyDc8y6/3I1iG8ufjFmPVf
         ZKuJxZGwLPeP2qR3nTEi89oX5rRN10WFPChnPnEMTcQPb5soSrLMIzv4iPTEzp/pQlCY
         +pk02oVZK75YFiG8LbmYZ8O0JqzELlYIrB4li9vM5yqjmpikpWbkNvGweFrsvibDfWHm
         CxKtS5lYPhwVRUtaQ2q7Bk0E8ststfypHWmTgLElnwyEmnuLpPhbXyfj8M7axoY15UsU
         BYRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=f1j9FjCFliwLQFYBfAy2R+96v3Jj4LeDoLXSJlfyO8k=;
        b=xtl2zcTHHTZ8JhQiXo5GNftwOzNUrIquHlEtDxFTK3bW6g3WnO4x/WL2hM/qqsk2m+
         u2v0MoF+BXa/JFcGGEjEBSMVw97S6pHa5JaqqbvgTuCMuEa0rnqUEnzBlUQlDOz/F/aD
         mlAO+wQtMl7y/zL38cQhp0RVMOiCFJ19YS8JdpaHJbsa6pQczToh4GB89l9b/P8sLYJs
         Yg5UxaFmyZtuPy59OjL4rKg0yeUfZ/cG/xxHoOPM9yZEJ5ZaIALf8C2l4q+0pGsF8/T0
         TDiOH/9cUfcaA5nDJtlK5OfTibM0p1N3WrkQseAdLo0/OT51iIXrblDS50HWzWVZ2gDu
         AkJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tiCIBjUl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q81si9666797ywb.216.2019.04.03.00.31.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Apr 2019 00:31:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tiCIBjUl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:32829 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hBaMj-0005yG-Mz
	for alex.bennee@linaro.org; Wed, 03 Apr 2019 03:31:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57337)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hBaMU-0005xZ-LN
	for qemu-arm@nongnu.org; Wed, 03 Apr 2019 03:31:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hBaMT-0001ZV-Lg
	for qemu-arm@nongnu.org; Wed, 03 Apr 2019 03:31:06 -0400
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:42572)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hBaMS-0001XE-UA
	for qemu-arm@nongnu.org; Wed, 03 Apr 2019 03:31:05 -0400
Received: by mail-io1-xd43.google.com with SMTP id c4so13209855ioh.9
	for <qemu-arm@nongnu.org>; Wed, 03 Apr 2019 00:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=f1j9FjCFliwLQFYBfAy2R+96v3Jj4LeDoLXSJlfyO8k=;
	b=tiCIBjUlBaIiBuVfVbbyY1m5F+CsEWBgR5MXCSTr9+z9WaoctuhkMMN5D09BCJpsiM
	j1//f/oDuvEmsg4kkdpRutGTsTgxgwmMY4Hs/4pZ9kumuBnd5XvrlP58SQ8ZvKP50lmL
	MoRnoPJfH5/NjIaIphloi+p+53auXoDHv/COfBeedH0LzkW6U14id5tRfbeb+CSZta9o
	A3jL2/1xwB62M29Txx7J6DpI/kI40J+IgCHPagAYscFMvaq4n+R20Ifno+7RE+QQcKIt
	pCmgnIBMslglm6r6AIdh8mTpZz0YdN7DpMac5kGNwer/wxjC24FE3e7OKngRhiXmMyiF
	y8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=f1j9FjCFliwLQFYBfAy2R+96v3Jj4LeDoLXSJlfyO8k=;
	b=U6jaiXgtEALyzBvArpQFlsfdmf56003DYfp+1O9zu51uAWg9g5E5WIFTY9+c+//upO
	pI32msXSre54up/bmK9MxxtZTx64LdWvxspIws84BvXBcjuCgajk7bn77+2BCNTAPbpL
	EL1rYR1Yu8C0atXnZjVXS5KI9UUNoxARrZ1XxMQpFXPgcVixPu1dYqOUoNf0EgK1+z1D
	LnCymKiCCRkZjtzGQBuh6RtLrUGuMD7CDwjWPpVFZrXCY1HjxczZCaGrVia6RpKCiUHC
	xjhc4IZDhy2DTGUPgfwD2iAxKmNSvl5ycDFhcZbbr7djX2p6Yk0ahb09Kl/vzqJ9fyCi
	V4ag==
X-Gm-Message-State: APjAAAWx4ZZr+jP0Xb6MTYQrt/WgL7GW2daZ8ciEixfgcei7c4h4MZmR
	oEfGVMSv7dB4eTpihWLowRWaamG98oe8Yg==
X-Received: by 2002:a6b:790c:: with SMTP id i12mr36958352iop.265.1554276663385;
	Wed, 03 Apr 2019 00:31:03 -0700 (PDT)
Received: from [10.71.7.255] ([147.50.13.10]) by smtp.gmail.com with ESMTPSA id
	j10sm7843715itj.32.2019.04.03.00.31.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Apr 2019 00:31:02 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190403034358.21999-1-richard.henderson@linaro.org>
	<20190403034358.21999-5-richard.henderson@linaro.org>
	<CAFEAcA_c+RSOmxHcoNueRtAoQAZZCfeSt-4F2GFe=BhSg_1jXg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <863b0e29-2eef-319a-10a0-1648259d8d4d@linaro.org>
Date: Wed, 3 Apr 2019 14:30:58 +0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_c+RSOmxHcoNueRtAoQAZZCfeSt-4F2GFe=BhSg_1jXg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::d43
Subject: Re: [Qemu-arm] [PATCH 04/26] target/arm: Convert to
 CPUClass::tlb_fill
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
X-TUID: To41QrQHW4oO

On 4/3/19 12:14 PM, Peter Maydell wrote:
> On Wed, 3 Apr 2019 at 10:44, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> 
>> +bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>> +                      MMUAccessType access_type, int mmu_idx,
>> +                      bool probe, uintptr_t retaddr)
>> +{
>> +    ARMCPU *cpu = ARM_CPU(cs);
>> +
>> +#ifdef CONFIG_USER_ONLY
>> +    cpu->env.exception.vaddress = address;
>> +    if (access_type == MMU_INST_FETCH) {
>> +        cs->exception_index = EXCP_PREFETCH_ABORT;
>> +    } else {
>> +        cs->exception_index = EXCP_DATA_ABORT;
>> +    }
>> +    cpu_loop_exit_restore(cs, retaddr);
>> +#else
>> +    hwaddr phys_addr;
>> +    target_ulong page_size;
>> +    int prot, ret;
>> +    MemTxAttrs attrs = {};
>> +    ARMMMUFaultInfo fi = {};
>> +
>> +    /*
>> +     * Walk the page table and (if the mapping exists) add the page
>> +     * to the TLB. Return false on success, or true on failure. Populate
>> +     * fsr with ARM DFSR/IFSR fault register format value on failure.
>> +     */
> 
> This comment about what we return doesn't seem to match what
> the code is doing.

Bah.  The perils of copying comments while changing the function signature.


r~
