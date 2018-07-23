Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp5156306wru;
        Sun, 22 Jul 2018 18:46:09 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpc1ZhWUjNzeuPyRg0Gjc9DMa5cspyFyJgmJBFxRdUmUbyexcUY/vVKbEAkeFN59wteF9Rhl
X-Received: by 2002:a37:8643:: with SMTP id i64-v6mr10136859qkd.194.1532310368865;
        Sun, 22 Jul 2018 18:46:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532310368; cv=none;
        d=google.com; s=arc-20160816;
        b=yfMIK2W50Jf7VktESGBs19ESgenimZBXq23cjqYzFyaZKtoqMvKcqoZL7ppXLd7Vn4
         YhBYj4mMEcNBglXt8h9xrNVvOkISKShN4XjErJ1K+KUl3mY78E6IPifirZQLEVSG8aWL
         ievrnamLW5itSMIlxGQ8RgDkcbC3UZViyM+Fk8VGufwKO4WWinuoEWvE1ratfeaXWeTw
         ACe4E4kfQWA5wkANEn3Sv0OBDcBvrp8j/Nc6GJV7Bo5vhN3kvDpuKdEbBTHrLuMaPW5E
         ysDJsfVbn1Y9MLHR8KrcbLezlOSsGWEV7/JxqUK2IVPf7iLs3pjeNJKchElZp8/hN3cY
         /dXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:references:to:from
         :dkim-signature:arc-authentication-results;
        bh=+KIy+OsR9ENNn/72U7ktRsejpWx/Yw16Li8HtftMKwA=;
        b=i9vgFLWY/sI/nFa8022r1HyzgIfF0GVslvy7DDcaZXs2mwHz4ecPSaWACrLaBhrsJX
         3aBRLkto+qNGbTwP7qYahvXCsFmBmGPBpheeNAx6KULVvOn5dY7RGenEN/c4kpePc0q3
         cqXfAtg0kaUytMX227FEy32J36fw/CKaGth7PMoEWzo7+ae8u7R8tG2QnUDW/KR6lsYD
         UAmgK0VABDC8CrO3AR+2OboWgzEqRC2gDatyBpoK+VlxYR9F9ZqB87q64dv6lP9gwrBp
         W+Ccuq3iX/N5RJEpPiprtQ84Xc3m9Opc3XZ+aXY3kE1M+L+CErby7p9TlmmyM5xKSbB+
         ZC4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HwhmabOQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h13-v6si1000991qtj.136.2018.07.22.18.46.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 22 Jul 2018 18:46:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HwhmabOQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59611 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fhPvM-0000vK-9T
	for alex.bennee@linaro.org; Sun, 22 Jul 2018 21:46:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51126)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fhPvD-0000v5-CL
	for qemu-arm@nongnu.org; Sun, 22 Jul 2018 21:46:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fhPvC-0004Pt-CY
	for qemu-arm@nongnu.org; Sun, 22 Jul 2018 21:45:59 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:35399)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fhPvC-0004PC-4S
	for qemu-arm@nongnu.org; Sun, 22 Jul 2018 21:45:58 -0400
Received: by mail-pg1-x542.google.com with SMTP id e6-v6so11038928pgv.2
	for <qemu-arm@nongnu.org>; Sun, 22 Jul 2018 18:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:from:to:references:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=+KIy+OsR9ENNn/72U7ktRsejpWx/Yw16Li8HtftMKwA=;
	b=HwhmabOQppI3/Lml7A/5djrUsvidl+ZemBvnknClwf86dwRVLrdai9MH26OJErRQyq
	bs5Xqb8eAyVmuVKUMXDQpSMc6Uy/WDiM0diyQSZJubvhl3uIrWD7ezrKpd8A1x9L24RG
	y2qN6b5CAEMI0jeCbQlQngxe3wiPYoM+rXEGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:references:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=+KIy+OsR9ENNn/72U7ktRsejpWx/Yw16Li8HtftMKwA=;
	b=tvPJgqeyMEiokqMu0fvgVeDYkN/+joylEUxXXI+q78cVVvmlaO3/RkjNXx+rjlLyGg
	uwSK/1dG8pWfldHAGhOMELclzAzea7/lePZnJ/sVkO0uV7zH9YlPI8UzewwXR8OYEfAL
	wAMa6LtpZH/JpCiSLW3ygUWKkceyZfntdoKEigHdK0KDP8xwER+WYG/sCitzPh9Lr/QK
	CCMDvBL/AJLR7CtdDRApauQqFQzpK7+EH2alKzreF6f01M5Vg2YbKroYXaQ5hjwhseV9
	0dzQr9qseEINn21d5yTipj8GsyjouYyKhqTnayhlZcuOOSqZ4/joxep/Xqr4y18+z7m+
	SG3g==
X-Gm-Message-State: AOUpUlHZk2DeonwdJUHmKCgKTbZ1HDonQYiW1RC1sjFRnRK8J/cwQH9I
	cVfru9mJKlbgELUE/0+X0DOyUg==
X-Received: by 2002:a62:a649:: with SMTP id
	t70-v6mr11291204pfe.149.1532310356824; 
	Sun, 22 Jul 2018 18:45:56 -0700 (PDT)
Received: from cloudburst.twiddle.net ([2601:1c0:6100:a92d::e452])
	by smtp.gmail.com with ESMTPSA id
	f126-v6sm11023457pgc.88.2018.07.22.18.45.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 22 Jul 2018 18:45:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
References: <CAHmME9q8b0Nss8b7DEoGgqoCK4dEvasQN64QWx6Hio+N92wuSg@mail.gmail.com>
	<CAHmME9qX22YP9qrHErc43Z+LUi=ichqzG+OdXqjhJv4ZrKDmWQ@mail.gmail.com>
	<CAHmME9qMASSt2K4vACJTMiGNTt09upRhNFxL_y2KF1G3N1LB2g@mail.gmail.com>
	<b20edb3f-055a-c531-da70-d20a20137ad4@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <49659899-1c8c-f8a6-4356-07e6c6fb728d@linaro.org>
Date: Sun, 22 Jul 2018 18:45:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <b20edb3f-055a-c531-da70-d20a20137ad4@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-arm] [Qemu-devel] ARM64 STR Instruction Crash Regression
 in TCG
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
X-TUID: KhSN0wNGt7fa

On 07/22/2018 02:31 PM, Richard Henderson wrote:
> On 07/22/2018 01:47 PM, Jason A. Donenfeld wrote:
>> Hello,
>>
>> Gcc 7.3 compiles bash's array_flush's dual assignment using:
>>
>> STP             X20, X20, [X20,#0x10]
>>
>> But gcc 8.1 compiles it as:
>>
>> STR             Q0, [X20,#0x10]
>>
>> Real processors seem okay, and qemu 2.11 seems okay. But qemu 2.12
>> results in a segfaulting process. I'm pretty sure this is a TCG bug.
>>
>> In the attached tarball, please find kernel and run.sh. Calling
>> ./run.sh will start the kernel with the bad bash executable that tries
>> to execute `config=({1..100000})` and crashes. Also included in there
>> is the actual crashing bash binary, in case you'd like to disassemble
>> a little bit.
> 
> Interesting.  The test passes on master with --enable-debug, but fails when
> qemu is compiled with optimization...
> 
> I'll dig a bit deeper.

The failing sequence is

0x0045ba44:  4e080e80  dup      v0.2d, x20
0x0045ba48:  90000340  adrp     x0, #0x4c3000
0x0045ba4c:  91098003  add      x3, x0, #0x260
0x0045ba50:  92800001  movn     x1, #0
0x0045ba54:  f9413002  ldr      x2, [x0, #0x260]
0x0045ba58:  3d800680  str      q0, [x20, #0x10]
...

OP after optimization and liveness analysis:
 ld_i32 tmp0,env,$0xffffffffffffffdc              dead: 1
 movi_i32 tmp1,$0x0
 brcond_i32 tmp0,tmp1,lt,$L0                      dead: 0 1

 ---- 000000000045ba44 0000000000000000 0000000000000000
 dup_vec v128,e64,tmp2,x20
 st_vec v128,e8,tmp2,env,$0x8c0                   dead: 0

...

 ---- 000000000045ba58 0000000000000000 0000000000000000
 movi_i64 tmp4,$0x10
 add_i64 tmp3,x20,tmp4                            dead: 1 2
 ld_i64 tmp4,env,$0x8c0
 movi_i64 tmp6,$0x8
 add_i64 tmp5,tmp3,tmp6                           dead: 2
 qemu_st_i64 tmp4,tmp3,leq,0                      dead: 0 1
 ld_i64 tmp4,env,$0x8c8                           dead: 1
 qemu_st_i64 tmp4,tmp5,leq,0                      dead: 0 1
...

0x7fffcd2e678c:  vmovq    0xe0(%r14), %xmm0
0x7fffcd2e6795:  vpbroadcastq %xmm0, %xmm1
0x7fffcd2e679a:  vmovdqu  %xmm1, 0x8c0(%r14)
...
0x7fffcd2c0e78:  vmovq    %xmm0, %r12
0x7fffcd2c0e7d:  addq     $0x10, %r12


The guest x20 is loaded in to xmm0 for the dup at 0x45ba44, and was reused for
the store at 0x45ba58.  However, if the load at 0x45ba54 misses the TLB, then
we will have a function call, which can clobber xmm0.

With -O0, it just so happens that the function call does not clobber xmm0; with
optimization enabled, the compiler's different code generation does clobber xmm0.

Fix by properly considering xmm registers to be call-clobbered.  At which point
the saved value is evicted from xmm0 naturally.  Patch posted separately.


r~
