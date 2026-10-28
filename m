Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9D4606A320
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Oct 2026 11:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nvQqRq+w
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xM1Uw-0007Gz-3l; Wed, 28 Oct 2026 07:07:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xM1Ur-0007Gd-Ao
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 07:07:11 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xM1Uo-0001Kl-3x
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 07:07:08 -0400
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-563a0462094so265792b6e.1
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 04:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793185624; x=1793790424; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=HJejtr/3eRL/l22r9vqPt9cJkW1gl1rsWFtYSIu2rT0=;
 b=nvQqRq+wMkW/cjanDurdScA8zdJoWzkJqHVKxWmQ5yWmax1SAknncNe+RqVKK08WvO
 bk+UR2NlPSbD6WQsDhJ7PVIbCKUEHjlPfwwn9JERrRglxz+OyRoithSuYEgYysNLEKSi
 lmzq2QHPsuzpNt1VfmCdOH+Onnu9H8q+Ofbkw0sEq3EldWo8FJ5uH//rERRrLWQ8BqHG
 U2Np7pNBiSKfjXQeTR1YQ53kNZz3vvI7T6Dbec6MKQty+IdPbvRcKlKt/O194b5EhiSp
 mUU1t5NiZDYNYbWa6MueeX6S8yqNqIN0exSe61o++Sioy6mfmkdofqKQpRzvB67rVTk9
 JiCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793185624; x=1793790424;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=HJejtr/3eRL/l22r9vqPt9cJkW1gl1rsWFtYSIu2rT0=;
 b=Lhon4udqnwR67AMTlDX/iYizTuh9Z8KlyJO2JGNaVxUISr46IoRqDxXMxRuYXawhou
 doWTf6hgifK4bnOaZBFaUcPFvbr0QX/+AB+RrsGT13Vqpi1ykPZnSTPl8nfMpVwwrOUp
 nm+Zrq5fh86l2jQrI5I0ol8Yg5oSscZ9UwvzMcYWjxSwW5Kld+SVquPB6N9XoNxKy6cc
 8w6f3znaanvmy/V7+wX0Q6iWtkQobe7tnbkhafPMqakTbjEFJdmr5fgoLNuNL2o+lTms
 KREHF6T8x9INpxMUMt/uyybikiKvKL8QaoFszQPnQoc9EzalXDagoFbZ3FVweMvvMakc
 SCvA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwZGMNkfijnxni31aoU8tzAZkUKmAJkq51Y7PdJ0Gkftn7+Xw7zYfslBTy1xBHNo0cUgV6CmoZMaA==@nongnu.org
X-Gm-Message-State: AFq9FYJqHTlfj5qumC7ZtoMCqcv2AGD+HuJKcnAngo6Av+87/LUYyhvJ
 GSQ6LZe265j4gTHkjX+qZ+YBO7j+fC56IPi/UVoIBBMsmvxf4aPtUPemEM27PhDmTXw=
X-Gm-Gg: AYBFou3Sz2pztqWG4fwTfq15N2UECLqloiTxt8vIXnmTJ6khObEjMoT/OXnGLsG5+N9
 voIzNxz26cEId4j+HIfioTrcpLrRxYmNMD1R/YUa6nFa71QripRexS4TmUA5s8teAqWclZjuEpw
 shoWbIbZ35bxB0GK1X+aVlL+VJYW1UZmTe11AxvCnmuovDE2hBHBBrTxQerusNxHEo1F7Ad5nSC
 vSwq+R9Eqq4RT+62bPYrYjUNZmzcrCZHUU989Vq41W4oUbJ410y4AMUHsb+i14pALKL/b47H7Id
 1jebynWQ7qjwTjgTWP9+kmBwwBOxiw46sGRUeLtEmyljKCgOkOKCfzXBKC5TCrzPB1p/vBhaVgx
 Cf9nHC/1kHKY1lQTfB7mTPqTie/i9aLyLe6LdbQe5nHtwByaekAxTIPq533frdIGlPWGqJcWIVq
 d6s1grBm8RA/RJlWSn8p8ms6Ewa4WDUPqtYKW7VwpVgtoobXk1VRB5DWLBzJb95EfKUy6SWCh4O
 eV0sgocf1cyxKFOXZ5SF3FHwwppH8tyRJ9uWM/lNv9HmuXp5pWtlIPeJwv6uaROWJui+hEZRYQU
 EH1zmr5Llm7Dk3ArpmTWMYU6H0CC9VXnN5ElUiftsHw2
X-Received: by 2002:a05:6808:14c5:b0:4c3:6c2:4f29 with SMTP id
 5614622812f47-563821820e6mr1125075b6e.16.1793185623724; 
 Wed, 28 Oct 2026 04:07:03 -0700 (PDT)
Received: from [192.168.129.53] ([50.233.235.3])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a8b788a09csm2193636fac.10.2026.10.28.04.07.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 04:07:03 -0700 (PDT)
Message-ID: <36b2a947-c00b-4ea2-805b-d755303f0923@linaro.org>
Date: Wed, 28 Oct 2026 06:07:01 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: For linux-user, prioritize PC misalignment
 fault over insn abort
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20261026140942.2768950-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20261026140942.2768950-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/26/26 09:09, Peter Maydell wrote:
> The Arm architecture requires that for PC alignment fault exceptions
> take precedence over Instruction Abort exceptions.  We get this wrong
> for linux-user mode, because QEMU detects the lack of any backing
> memory via probe_access_internal(), and calls
> arm_cpu_record_sigsegv(), which always reports either a Translation
> or Permission fault:
> 
> #3  0x0000649548976b94 in arm_deliver_fault (cpu=0x649555ce5920, addr=1, access_type=MMU_INST_FETCH, mmu_idx=0, fi=0x7fff87e4c940)
>      at ../../target/arm/tcg/tlb_helper.c:274
> #4  0x0000649548976d69 in arm_cpu_record_sigsegv (cs=0x649555ce5920, addr=1, access_type=MMU_INST_FETCH, maperr=true, ra=0)
>      at ../../target/arm/tcg/tlb_helper.c:421
> #5  0x0000649548c97650 in cpu_loop_exit_sigsegv (cpu=0x649555ce5920, addr=1, access_type=MMU_INST_FETCH, maperr=true, ra=0)
>      at ../../linux-user/signal.c:761
> #6  0x00006495488f8235 in probe_access_internal (env=0x649555ce99a0, addr=1, fault_size=1, access_type=MMU_INST_FETCH, nonfault=false, ra=0)
>      at ../../accel/tcg/user-exec.c:790
> #7  0x00006495488f850d in get_page_addr_code_hostp (env=0x649555ce99a0, addr=1, hostp=0x7fff87e4ca70) at ../../accel/tcg/user-exec.c:828
> #8  0x00006495488e5433 in get_page_addr_code (env=0x649555ce99a0, addr=1) at ../../accel/tcg/internal-common.h:116
> #9  0x00006495488e56bd in tb_htable_lookup (cpu=0x649555ce5920, s=...) at ../../accel/tcg/cpu-exec.c:206
> #10 0x00006495488e58c8 in tb_lookup (cpu=0x649555ce5920, s=...) at ../../accel/tcg/cpu-exec.c:251
> #11 0x00006495488e5d2a in helper_lookup_tb_ptr (env=0x649555ce99a0) at ../../accel/tcg/cpu-exec.c:398
> #12 0x00007d973c000270 in code_gen_buffer ()
> 
> Make arm_cpu_record_sigsegv() report a PC alignment fault for
> MMU_INST_FETCH accesses to non-4-aligned addresses for A64 and A32,
> matching the logic used in arm_cpu_tlb_fill_align() for system
> emulation.  (Unaligned PC faults can't happen for Thumb.) This is
> then passed to the guest binary as SIGBUS rather than SIGSEGV.
> 
> (The Fixes tag is for the commit that introduced this function, but
> the bug was also present in the previous implementation.  It's an odd
> corner case so it's not worth the effort to try to backport the fix
> beyond that.)
> 
> Cc:qemu-stable@nongnu.org
> Fixes: 9b12b6b44250c2 ("target/arm: Implement arm_cpu_record_sigsegv")
> Resolves:https://gitlab.com/qemu-project/qemu/-/work_items/4699
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/tlb_helper.c | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

