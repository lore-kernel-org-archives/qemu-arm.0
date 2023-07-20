Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp7956982eje;
        Thu, 20 Jul 2023 09:40:50 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFuRJNmMX+gqn2c6Cr7yFFIE+zhDgxT60/eSWNIQ8lmXAoEibC2KIPD2mXcSC8ptwblcNot
X-Received: by 2002:a05:620a:4487:b0:765:a6a5:e9fe with SMTP id x7-20020a05620a448700b00765a6a5e9femr9259158qkp.44.1689871250598;
        Thu, 20 Jul 2023 09:40:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689871250; cv=none;
        d=google.com; s=arc-20160816;
        b=G81oks8+yNnPSZcMZ/elLpOkriUyWCcbmOJYYaNBHgqsKUsIFw7yRB3nl08sO/hTzk
         4nnSGlb0NOg7POBK/Tc1kiSYbLMBG/l9DMpNd1KazQDiIVsI9OABAmVSt+UBYgWUOury
         W/kBGe/8IMY/pz00NfcMUYpsu2OyPEM30YH0vbQYlTFyHd+1TBn+JVm/EmPUFMbicHnL
         uKCXlIU9QaJ5gozISnUjJd3k/+1XQBxueLCT1bQ5pIOMZm37PnxHyf19/jEOwqGwk3mz
         QbtW1JWzxp33L8sTJWKJBHDTvJ7DX3Ty2wlen291uU79BvJnvaxWBnBLmYZ6P8+88PBX
         56Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=PO4Fi4YWodYZUA5UitbRNAl4v58seTuH9vn83Yaei7I=;
        fh=CEa3UdY0L+UQ/2T/5R8rkDkdq4jlW1F1hWJjDNQD42w=;
        b=Iv4TMN5vCmzTv5rnVIgMA/8NY2/rI3LsYZEySBT1mLQCr9SYXsWgM5O7kJfxnUr72A
         WWrLjaYrBF2WV/E8oHpxCT7HNUCkhQ/51hSjjC0kaOoYW8PekJq6KT8QAhsHnFC3o9gv
         yROSZdt9b43cNftI5QLPt/zc3NoTMF5YRZEnpIXNf4X25EQ/H0B4mtaAdXOi6Z+eU6eB
         Y1WO4vcfq4aR5EmAJtIwvlaV06hJ/UuezsdXqfUPfpEfnk7+rcL2B+5idcIHIeDd/oTe
         8BxtvCrRB8T9gAYctw2lFQb2DBRWL93PCNnFAeSFg5QQAvryfnY2fzjCnRoXYE5HCjMC
         p2yA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Skie1lD5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id br9-20020a05620a460900b007680f98f35csi416031qkb.320.2023.07.20.09.40.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jul 2023 09:40:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Skie1lD5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qMWhe-0000d6-Jd; Thu, 20 Jul 2023 12:40:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qMWha-0000bl-EY
 for qemu-arm@nongnu.org; Thu, 20 Jul 2023 12:40:31 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qMWhI-0008AM-Hg
 for qemu-arm@nongnu.org; Thu, 20 Jul 2023 12:40:18 -0400
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4fcd615d7d6so1571742e87.3
 for <qemu-arm@nongnu.org>; Thu, 20 Jul 2023 09:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689871207; x=1690476007;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PO4Fi4YWodYZUA5UitbRNAl4v58seTuH9vn83Yaei7I=;
 b=Skie1lD5tVlVC/CSKUqp15zXsg3wGKgBtFTa0G5Ur5Y6e012hIn0IoFBiJH8dAXGdC
 o3LJYvyT8cLCAm1LH2fqJy2yltE9FWp7F6LqqE4L2A1Ieqc/Z6dtlpLa+x2061fCR4ST
 Ur06jLANWy7FzdmlWZaMMtznJfT6f4RagqCR3nHtckpzlLTqG0fEiQ6KP2Uu5Liey27s
 yi2LODhzFt1JsoofwxR2WcmnwpCu4s7r3BKawODaUaTiB3EsuNuHyJUavbzFgV9ctOn8
 DXd5ezvksII03i0S77TO5xLNNFNQ03hvhZL4VV9eS0JMsDtMlbaeBfZSC6I3BFxFGc5B
 /Hzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689871207; x=1690476007;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PO4Fi4YWodYZUA5UitbRNAl4v58seTuH9vn83Yaei7I=;
 b=CZMfsUaGlUQh8ka+OZvJPDOKiuodVS1sT+tPQ3jTjdyDTl/4L0hhUT3BQ2LPGgsQ80
 Y5d5D+/WwFteMvm79ZPA8ImR+8RYSyVwfxe/q8ey8RoQNPtNuyf8VjZRBNgA883SiV8K
 QmUSMhX4QxcoD9taeQ9AiG0DDZ3Rw5vfgUxlN9ds2InrDKfMFwzOQivZW+U2T84HOeJ9
 mLr656ACfzmR4PdLXlsBNcbyKFVxkDtDQKfdlUrHrD7eFUYc3yCje/9kIS7iTrEyLTbU
 bfjhqT8+uu6VDmVh9XdGwXN36W8z/3RGmEY0UkUE+meRq36c48WndWGJDgnlHDUWpnUi
 4Ngw==
X-Gm-Message-State: ABy/qLaY2JQvr8FVPsvLpe4artQu4Zc8Nywo93ZKq7/Rccmjk+CR9AOX
 tHwsWe2hpbWQHN4Jd+1BJjeFYDl5EWiYGOYbvMvq2A==
X-Received: by 2002:a19:7418:0:b0:4f7:3ee8:eede with SMTP id
 v24-20020a197418000000b004f73ee8eedemr2441017lfe.61.1689871207299; Thu, 20
 Jul 2023 09:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230719153018.1456180-2-jean-philippe@linaro.org>
 <20230719153018.1456180-5-jean-philippe@linaro.org>
In-Reply-To: <20230719153018.1456180-5-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Jul 2023 17:39:56 +0100
Message-ID: <CAFEAcA8e_-r6b4iaeDUv64iydFe7iAb4Y0eObyO4tUYizcYLVA@mail.gmail.com>
Subject: Re: [PATCH 3/5] target/arm: Skip granule protection checks for AT
 instructions
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: zcZNoFFWCP49

On Wed, 19 Jul 2023 at 16:56, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> GPC checks are not performed on the output address for AT instructions,
> as stated by ARM DDI 0487J in D8.12.2:
>
>   When populating PAR_EL1 with the result of an address translation
>   instruction, granule protection checks are not performed on the final
>   output address of a successful translation.
>
> Rename get_phys_addr_with_secure(), since it's only used to handle AT
> instructions.
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
> This incidentally fixes a problem with AT S1E1 instructions which can
> output an IPA and should definitely not cause a GPC.
> ---
>  target/arm/internals.h | 25 ++++++++++++++-----------
>  target/arm/helper.c    |  8 ++++++--
>  target/arm/ptw.c       | 11 ++++++-----
>  3 files changed, 26 insertions(+), 18 deletions(-)
>
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 0f01bc32a8..fc90c364f7 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1190,12 +1190,11 @@ typedef struct GetPhysAddrResult {
>  } GetPhysAddrResult;
>
>  /**
> - * get_phys_addr_with_secure: get the physical address for a virtual address
> + * get_phys_addr: get the physical address for a virtual address
>   * @env: CPUARMState
>   * @address: virtual address to get physical address for
>   * @access_type: 0 for read, 1 for write, 2 for execute
>   * @mmu_idx: MMU index indicating required translation regime
> - * @is_secure: security state for the access
>   * @result: set on translation success.
>   * @fi: set to fault info if the translation fails
>   *
> @@ -1212,26 +1211,30 @@ typedef struct GetPhysAddrResult {
>   *  * for PSMAv5 based systems we don't bother to return a full FSR format
>   *    value.
>   */
> -bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
> -                               MMUAccessType access_type,
> -                               ARMMMUIdx mmu_idx, bool is_secure,
> -                               GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
> +bool get_phys_addr(CPUARMState *env, target_ulong address,
> +                   MMUAccessType access_type, ARMMMUIdx mmu_idx,
> +                   GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
>      __attribute__((nonnull));


What is going on in this bit of the patch ? We already
have a prototype for get_phys_addr() with a doc comment.
Is this git's diff-output producing something silly
for a change that is not logically touching get_phys_addr()'s
prototype and comment at all?

>  /**
> - * get_phys_addr: get the physical address for a virtual address
> + * get_phys_addr_with_secure_nogpc: get the physical address for a virtual
> + *                                  address
>   * @env: CPUARMState
>   * @address: virtual address to get physical address for
>   * @access_type: 0 for read, 1 for write, 2 for execute
>   * @mmu_idx: MMU index indicating required translation regime
> + * @is_secure: security state for the access
>   * @result: set on translation success.
>   * @fi: set to fault info if the translation fails
>   *
> - * Similarly, but use the security regime of @mmu_idx.
> + * Similar to get_phys_addr, but use the given security regime and don't perform
> + * a Granule Protection Check on the resulting address.
>   */
> -bool get_phys_addr(CPUARMState *env, target_ulong address,
> -                   MMUAccessType access_type, ARMMMUIdx mmu_idx,
> -                   GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
> +bool get_phys_addr_with_secure_nogpc(CPUARMState *env, target_ulong address,
> +                                     MMUAccessType access_type,
> +                                     ARMMMUIdx mmu_idx, bool is_secure,
> +                                     GetPhysAddrResult *result,
> +                                     ARMMMUFaultInfo *fi)
>      __attribute__((nonnull));

thanks
-- PMM
