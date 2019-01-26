Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1689682wrt;
        Sat, 26 Jan 2019 12:00:59 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4WgGpT2b+XWDvdtXfihFmwrvIk9GA4j5VZeoK2L8qAQRAed5DFXZYxTto6Psiv60rWlwmO
X-Received: by 2002:a1c:7706:: with SMTP id t6mr10679746wmi.57.1548532859351;
        Sat, 26 Jan 2019 12:00:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548532859; cv=none;
        d=google.com; s=arc-20160816;
        b=wDdV0vu+j7zjFTxPhtolTY0ZGtFu6VlRNEIgbSoFb/MVnoSVDLOFKoo1AJXb/52MRa
         hYXRSVnXYA9V+5cjfDS0hDUyQtea3yt8kxU4QhDkWKBcNPWnhcev+l4QWWLJ3KSjDjss
         MINhOjkN0Y5o4oxNvmsmzlRrJZYe2uQx6+zDX8az0dA1ptgREAmCEVK1dAdhiKGPR5y2
         AWUlsIbku8boChIkJFYyWwdfs9CtVzvbWCe5W7MswaxW0LwSoKn63Nx0tGChKOmjFmi2
         ffxBUn+J7byNXznJ09PuFHhYiRlPalm6d2xtUseFaYKG14Dez2EQg9Gm0NSzB2U8peYQ
         wmkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=6/eBkrWEIJQ0rdlE/AbYnvAH96oI4rr9h+wG8aWzcrA=;
        b=w+8j+03WKt4m53bpQQ9TmAnLyEUikfECtDrLU+mwF4REqtw0d8dg26z2VQR1cniBiL
         4ydv/H2bxJodSdCSsPYDMIuQz7xAK4akIVvUT2amfJvrZ7inTaHb1LrSMcdvxg3QTD6C
         LiEsRs+JBEjw8+gbkKvK2icOzBDj9gRF66X5/1pCtKpZwi4PKBM3cyhKdoXMtag3oNpz
         cAsOjZfXjk5M9ySq9zFBfAftB3CgdA7nL4diAxpClBcjqFmvb2Eolkg6weHME3V4VeX8
         YLYFSiYY80aPe/Zg3Ltcsw9YrELSc7Hj8tgXdbHuFtRxjF5mBTroeEU1nNQC9NP/L5jY
         h3pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DD69ZWRM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v130si44060068wme.185.2019.01.26.12.00.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 26 Jan 2019 12:00:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DD69ZWRM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:35087 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gnU8Q-0002SJ-Dt
	for alex.bennee@linaro.org; Sat, 26 Jan 2019 15:00:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47034)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gnU8D-0002Ru-SY
	for qemu-arm@nongnu.org; Sat, 26 Jan 2019 15:00:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gnU8C-0008UT-S0
	for qemu-arm@nongnu.org; Sat, 26 Jan 2019 15:00:45 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:35535)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gnU8C-0008Rh-Lh
	for qemu-arm@nongnu.org; Sat, 26 Jan 2019 15:00:44 -0500
Received: by mail-ot1-x341.google.com with SMTP id 81so11560348otj.2
	for <qemu-arm@nongnu.org>; Sat, 26 Jan 2019 12:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=6/eBkrWEIJQ0rdlE/AbYnvAH96oI4rr9h+wG8aWzcrA=;
	b=DD69ZWRMecuBQl3bvNeTwLZFVGKf9G2+UvxaXSUP+Y9RFhEDvmx3rCwdJbjs43kUJ3
	XLmvETYvBn9IXdiM9QzjK4pZGgSgLHzUqPbnr4vd8+UQtL2KGFnyvDKehkDqIW9yY0SM
	j20oWAIuV/45Mfep/e+SuY0TjsNHk2vwHaPeY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=6/eBkrWEIJQ0rdlE/AbYnvAH96oI4rr9h+wG8aWzcrA=;
	b=UI9w0jpAMlrmb6v9L5Za0j180xnFz0XyCmBKJHTGHwHviV3SzqFSXz6t1DkTx0Gueh
	WnEgEJpVxAqGaITtBZ0qnrDcO8jnilMWFboJh3BDjawON/Q835ExF2ic0V8qmMkZVmsh
	3ITF55IJwLI+tEKFW9ZyZ4XQbqb+zB1ZlcTLra7Q6wYMXTIBIizCxLe2o2DOufRzvHPs
	jFXE70Q3XJrUXFulmrmLIbK5D21dKFG5/ppQCSMwAazZm5ooU+kumg9Kk6M7czuOOGIf
	E11T1e5RBdTM6D3q4vneP82mY0XdrUftWRF+AQN3VyN0gCaroy/s0YCR83/2C4nw9Hr+
	/vSQ==
X-Gm-Message-State: AJcUukcxOuYvt4cTm5cXm1oNohtV/DhH/oySfbi4SlvKcwRiXNwY7pA4
	a4ZrAGXoE/K6pMrk65dCf2YyDrnKQn8=
X-Received: by 2002:a9d:263:: with SMTP id 90mr12771829otb.164.1548532842474; 
	Sat, 26 Jan 2019 12:00:42 -0800 (PST)
Received: from cloudburst.twiddle.net
	([2607:fb90:1cde:8186:85be:7b0b:ff08:989e])
	by smtp.gmail.com with ESMTPSA id
	187sm3055849oic.12.2019.01.26.12.00.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Jan 2019 12:00:41 -0800 (PST)
To: =?UTF-8?Q?R=c3=a9mi_Denis-Courmont?= <remi@remlab.net>, qemu-arm@nongnu.org
References: <1648289.tQCHxfjYn9@basile.remlab.net>
	<20190125214926.3204-1-remi@remlab.net>
	<02a680e1-c20c-2ecb-2926-6250fddf9e76@linaro.org>
	<1738864.GFcTaivyIR@basile.remlab.net>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <50c441e3-84da-01a8-c1c6-d76a64412cc6@linaro.org>
Date: Sat, 26 Jan 2019 12:00:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1738864.GFcTaivyIR@basile.remlab.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/3] target/arm: fix AArch64
 virtual address space size
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vE2CfYyDZ0ZS

On 1/25/19 10:36 PM, Rémi Denis-Courmont wrote:
> 	Hi,
> 
> Le lauantaina 26. tammikuuta 2019, 1.29.27 EET Richard Henderson a écrit :
>> On 1/25/19 1:49 PM, Rémi Denis-Courmont wrote:
>>> From: Remi Denis-Courmont <remi.denis.courmont@huawei.com>
>>>
>>> Since QEMU does not support the ARMv8.2-LVA, Large Virtual Address,
>>> extension (yet), the VA address space is signed 48-bits. User mode can
>>> only handle the positive half of the address space, so that makes a
>>> limit of 47 bits.
>>>
>>> (With LVA, it would be 52 and 51 bits respectively.)
>>>
>>> The incorrectly large address space conflicts with PAuth instructions,
>>> which bits 48-54 and 56-63 for the pointer authentication code. This
>>> also conflicts with (as yet unsupported by QEMU) data tagging and with
>>> the ARMv8.5-MTE extension.
>>>
>>> Signed-off-by: Remi Denis-Courmont <remi.denis.courmont@huawei.com>
>>> ---
>>>
>>>  target/arm/cpu.h | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>>> index ff81db420d..2ccd04b8f7 100644
>>> --- a/target/arm/cpu.h
>>> +++ b/target/arm/cpu.h
>>> @@ -2503,7 +2503,7 @@ bool write_cpustate_to_list(ARMCPU *cpu);
>>>
>>>  #if defined(TARGET_AARCH64)
>>>  #  define TARGET_PHYS_ADDR_SPACE_BITS 48
>>>
>>> -#  define TARGET_VIRT_ADDR_SPACE_BITS 64
>>> +#  define TARGET_VIRT_ADDR_SPACE_BITS 47
>>>
>>>  #else
>>>  #  define TARGET_PHYS_ADDR_SPACE_BITS 40
>>>  #  define TARGET_VIRT_ADDR_SPACE_BITS 32
>>
>> This doesn't really conflict, as this doesn't affect much besides the sizing
>> of the PageDesc for page_find.
> 
> Uh, that value controls the range of target virtual addresses user mode maps 
> to host virtual addresses. Without this patch, AFAICT, there are no 
> guarantees, only chance, that emulated system calls such as mmap() will not 
> allocate architecturally invalid addresses.

Well, that's the theory, yes.

On the plus side, the host platform that virtually everyone uses, x86_64, also
uses a 48-bit virtual address space, so there's no chance of such an invalid
address.

On the minus side, the code within target_mmap is not sufficient to ensure that
mmap will not produce invalid addresses.

See 76393642ae6, where I extended target/alpha TARGET_VIRT_ADDR_SPACE_BITS to
63 to work around exactly this problem.  To wit: target_mmap loops forever
asking the kernel for an address below 2**40, which the kernel refused to provide.

So changing this value for target/arm runs the risk of causing
aarch64-linux-user to fail on a ppc64/s390x/sparc64 host.  For all of the tens
of people around the world that care about such a configuration.


r~
