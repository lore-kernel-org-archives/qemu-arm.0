Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD2AC98304
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Sep 2026 20:43:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9ToN-0006Wr-Oa; Wed, 23 Sep 2026 16:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x9ToI-0006T2-Rw
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 16:43:24 -0400
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x9ToG-0005uT-Lf
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 16:43:22 -0400
Received: by mail-pj2-x10.google.com with SMTP id
 d9443c01a7336-2d747f066d8so4663595ad.1
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 13:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790196199; x=1790800999; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=iyzhEMBBzMvhA0XBPE9gikrEaYd0EZoc57vRVprWaas=;
 b=HuCeyf7niuuHc3b2i8hWVU++/JgTQQQGoO36Ke+Kk+ICmYgb1ewJfEgyoLVK9bbKJ8
 Toeg35ceeH69cQoWlPYidm5ajqcjXactGhHqBcwo9eQ6I780kU4uzwsIW6jc7QO8jotY
 eIp5zEvs3AtJpBGSp+CbdotixygYTB0jfz93988maw+BWB+6aQDYo39y7xRTx+KmrmOC
 Z1xWsLH/Ru65/hg9s4HNdgHutJ6bRL2zMbLK2Se3KGZYPXAMqLDLGWIrPc5rNB6VI4rr
 xvZjKEfsQaeM1Rv9eA8AZfX4lzkuJ18S1blVdkqopJCL4oE4ASuy543yYhBAc4Y+cYJK
 bPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790196199; x=1790800999;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=iyzhEMBBzMvhA0XBPE9gikrEaYd0EZoc57vRVprWaas=;
 b=RFeSVzamJcDNI4lASAPfsouSGzD2zgwYXIWWVmqxMdFvqEJ0ytby5NRAHZ2QoxwiwL
 x3dfAirTJAUT7P6GydQJ19fANEurcx3CbpkJP1LFWVigNJjbPxuGEKlYmqyBUQVWHQqw
 CRnkYYapHOMKqOD1ngDggZDR2eCcbL2eE4Ph5Ypk5OtM2UtukNNtPaQl/ek2qcYDm3jA
 Wfpqh84Pa9l72C8RjwJf4RMg06p/pnXP0+Zp7p67KciGTZYPy23DAnXwgx9DjQaTzsQo
 S5WkML9m3ps9szPJhv3+Jzpu1bne5s7RkO2RgWGj0A5LWb2CSd27vuFFwI25wBVo3gHs
 nHpA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwzvf0mwR3S5bjS0ySGWepyQGyQlhGwPCBCKvgdBeQ2LFdPKnNHIZF2r0hLeFPvw72HmGOr77WIlw==@nongnu.org
X-Gm-Message-State: AFuF++kdw1eDAiJbA8wWXDRm/NxBBY/U5HFdKvIcLHYhrhi49mi7HV/7
 S5CJ+4oNGAjmEZdIfbgf0gl1j6LCBeVCVcC6IGg4hyrX1nL3rC/u+VkUFdwpQiqVNSM=
X-Gm-Gg: AYBFou1SBCiAag2MTLlH2ttjwfmq44WzPiUt+SGxqOY2tGeXAMXOSMzA+BWQtGujcW+
 9wW5d/3r8ygYFQ8GM4WbELIVhEROooJ5/nfGcN2zgcXyivGPdnBtwGdW5GdPTfk73eHFTXRvzPK
 Z81PBUc4qiKMDf21zb9evfbCxRC//b5tU74C6BmV3lfXLrDDI4cdut6jAH2BuJgAD41/pyZqVLi
 Odse5QYYvUW55vHdWauwBe00QxyOdCNjdlTy/eaBctXEJAvQKomjb03jKyxKMbeISIXMmdG/uYA
 O+VnzR9XjeJJdMxG//GcJEljg23W24Gk1+dQTHQ54QqLS4q28Y0iSCdSfVJSskFbCI/lkRLQ5E4
 K9ThA8pvhDexz6NKYSZxExVVH0zYB2A36cFFKR6EYmK9t8GhFEjQDIlePYhnvGEM1BMjH0tsU7P
 SBCh/xEkfcyZGfgS7NQK9zigc20EqZ3k038HeQ5LsCP1Afa69e4cvBr1VIykm3LARv+wCmwIC3r
 lOTeAQFv/60jPyJ+AFxTMXOXKApOeu0oJ6Z7AG2
X-Received: by 2002:a17:903:2cd:b0:2dd:c100:2518 with SMTP id
 d9443c01a7336-2df7e28ad18mr1509905ad.33.1790196198789; 
 Wed, 23 Sep 2026 13:43:18 -0700 (PDT)
Received: from [192.168.0.4] (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2df6a5a4a72sm16422785ad.17.2026.09.23.13.43.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2026 13:43:18 -0700 (PDT)
Message-ID: <85cfb9a1-11dd-4a0b-9a01-892479c74ae5@linaro.org>
Date: Wed, 23 Sep 2026 13:43:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] target/arm: Don't assume secure-banked registers are
 migrated by 64-bit regs
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Tao Ding <dingtao0430@163.com>
References: <20260907130223.3148989-1-peter.maydell@linaro.org>
 <20260907130223.3148989-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260907130223.3148989-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::10;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 9/7/26 06:02, Peter Maydell wrote:
> In add_cpreg_to_hashtable() we have some code that automatically
> marks the secure version of an AArch32 banked cpreg as ARM_CP_ALIAS
> under two conditions:
> 
>   1) If the register has both 32-bit and 64-bit instances then we can
>      count on the 64-bit instance taking care of the non-secure bank.
> 
>   2) If ARMv8 is enabled then we can count on a 64-bit version taking
>      care of the secure bank.  This requires that separate 32 and
>      64-bit definitions are provided.
> 
> Item 1 is correct: if the ARMCPRegInfo has ARM_CP_STATE_BOTH then we
> will always add it as an AA32 entry (which then splits into an S
> entry with bank_fieldoffsets[0] and an NS entry with
> bank_fieldoffsets[1]) and as an AA64 entry (which uses
> bank_fieldoffsets[1]), so the AA64 entry will always be present to
> cover the NS banked AA32 entry.
> 
> Item 2 is not correct: the idea was that because typically AArch32
> Secure banked registers are (non-architecturally) mapped to EL3
> AArch64 registers, the AArch64 EL3 register would handle things
> (and that we would be adding the AArch64 register to the hashtable
> even if the CPU didn't have AArch64).
> 
> However, this fails in several cases:
>   (a) registers like CSSELR, where there is only a CSSELR_EL1, and
>       no _EL3 version. CSSELR_S's underlying state isn't migrated
>   (b) registers like TPIDRURW, where the secure banked register
>       isn't mapped to any AArch64 register, so the state isn't
>       migrated
>   (c) IFAR_S and DFAR_S are odd special cases, because they map to
>       AArch32 HIFAR and HDFAR, which in turn map to AArch64 FAR_EL2.
>       If the CPU doesn't have EL2, we don't register FAR_EL2 and
>       the IFAR_S and DFAR_S registers don't get migrated.
> 
> More generally, the architecture dropped the concept of documenting
> secure AArch32 registers as being "non-architecturally mapped" to EL3
> AArch64 registers and relegated it to an implementation detail, which
> is why TPIDRURW and friends got mishandled.
> 
> It also conflates "has 64-bit registers" with "is ARMv8", which is
> wrong for the qemu-system-arm "max" type and for any AArch64 CPU
> started with "aarch64=off".
> 
> Instead of marking the S-banked register as an alias if
> ARM_FEATURE_V8, don't put it into the hashtable at all if
> ARM_FEATURE_AARCH64 is present.
> 
> There are not all that many banked registers, and they're easy to
> find by searching for regdefs that set bank_fieldoffsets:
>   DACR, IFAR, DFAR, IFSR, DFSR, CSSELR, MAIR0, MAIR1,
>   TPIDRURW, TPIDRURO, TPIDRPRW, TTBR0, TTBR1, TTBCR, TTBCR2,
>   PAR, VBAR, SCTLR
> 
> None of these do complicated things on reset, so having both an
> AArch64 view and an AArch32 view reset the same register state to the
> same value and migrate the same data twice is harmless.  This is
> better than sometimes not migrating or resetting it at all.
> 
> This changes the set of cpregs we will try to migrate for CPUs with
> ARM_FEATURE_V8 but not ARM_FEATURE_AARCH64, and is a migration break
> there.  However, the only such CPUs are the qemu-system-aarch32 "max"
> CPU and AArch64 CPUs with "aarch64=off".
> 
> In an ideal world we would also not bother putting the S cpreg into
> the hashtable if the CPU is AArch32 without EL3 (i.e.  it doesn't
> implement Secure state at all), because nothing will ever look up the
> S version of the register (access_secure_reg() always returns false).
> But that would be a migration compat break for those CPUs.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 35 +++++++++++++++++++++++++----------
>   1 file changed, 25 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

