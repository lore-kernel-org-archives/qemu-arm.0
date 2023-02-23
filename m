Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp904062ejc;
        Thu, 23 Feb 2023 08:50:39 -0800 (PST)
X-Google-Smtp-Source: AK7set9ZLRHRhgVFY+5YHEm26baDQKmAT749M7EfDlZ05VB/PYRoarG77fuUSS6DgBVF/S0FQcc/
X-Received: by 2002:a05:6214:4112:b0:56f:d8:dbb4 with SMTP id kc18-20020a056214411200b0056f00d8dbb4mr26378950qvb.2.1677171039120;
        Thu, 23 Feb 2023 08:50:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677171039; cv=none;
        d=google.com; s=arc-20160816;
        b=uOjVNIqur1TJG0uPACua3JAU8aHb54wU3r8xj9pqz/jS1BmPJVXndEuE+IQea/ReCc
         yc+uGbQlmL9f+/tYcbKQG17hPRaLdNk7ucTtyOn9t9YLJ98YOPoMxgeefK4+x92tJ2sZ
         oLmbovYXy6dTQrlSPTSOndb0SttpT0P1ZqF+W2p28+b0W6d2rXQIYK46BaECyWMdOYU/
         Y26B/9c1pfQ6ok5puFrBQ38poK41n9Zbna5gQ0iOxfye7f0gfUopjHQVLsmB0bOYIP1g
         VDer3GAbRkfzRhxvKvtg3nLgjmMmv2I5Dr9icdFrpXMzv5hqvbMcS+edDqa3p/RFVo6D
         SAzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=FN4yR6P6JwjbPuePogjYQjwTaGhiPmWqCQYCVzrg4QI=;
        b=JWr85rXTKAEZtrLpY5CB2g05nNFDH53yxanAPUAQ1oEqeQdMNdr4JJLnKiobKUaHKr
         Jmsbu3P3fVgDEXaWMEkKSqsDPgQtfUgv0o7lTkS3gktDXx+QafmFhvBldqGcxmTB4qhX
         vIL+mlea5N3jVjPEc4aq1Hu4inl3dg+offu5s4pNO3jTVQTZLK3KKR7QETAxzohey/OB
         vLPSxhfBU1B7UyN0yTvLMYk9jW6E6G0R+6DqT+S38sYwAHk+MzluGKxq7Gdjwuvub4hC
         ItClQQce0t+R+4HAUKY3ujSoJ3lIRrsLu4vjfxs61fe2+lhqySc85Q5Ke4ZXKTygEF+6
         FPMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nN/f942w";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z2-20020a0cf242000000b0056f2ba3d7c6si3535773qvl.33.2023.02.23.08.50.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 08:50:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nN/f942w";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVEnB-0003iz-Eb; Thu, 23 Feb 2023 11:50:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVEn8-0003hB-SP
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 11:49:58 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVEn6-0005Nl-VO
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 11:49:58 -0500
Received: by mail-pl1-x62e.google.com with SMTP id bh1so13681734plb.11
 for <qemu-arm@nongnu.org>; Thu, 23 Feb 2023 08:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FN4yR6P6JwjbPuePogjYQjwTaGhiPmWqCQYCVzrg4QI=;
 b=nN/f942wZ3WZMU8B3U3L/1mvaOg0uDq7WbDqR4j3nDoPDMU8e7vjdsE2wMKyxu0hXG
 uNYaZkaU2OazX/Bf9oQlsCtMp33J1HVWaMx/RhhoYy5aDzaSe42+dWTlH38urIzeZ3Tv
 R72N+LkP1GdfYeWSNwXAhhZ3VO21+JHMLXeg4NH9ZIfw778yO1KF8yQVHgDpJspZ8Hhb
 giPDs740XUDw3yoRjgxXkt/uTLgY5dcYfiLeAIfH//6YPjseo67WcNuKJLadIoXykujh
 0LwOCcx9SkjSp63wIXz5msyhzlAxrgOBQN7mWKpi1AYn20qtru6Lg+zIIjeZpoQeKLBg
 oFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FN4yR6P6JwjbPuePogjYQjwTaGhiPmWqCQYCVzrg4QI=;
 b=mssNny3QHattivTxSpgGcB5r2wOCpuJ1nlPwDTX2NM9k9r1xJuK2YjNeaqo4xa/sFV
 GOlwYdsw3RjMOuVZxR0jZwBcl+WjH1c3ScYAFtdu3bK/ytALAlPDqY2yf4UFYDN9yzyl
 WXTBUAwXmKuDX069zzn7Y+uaLnyL2YzNDw+J+neLeGliAQU+gJ2tlVe9XAnXJ0q/6sOT
 K5fiyLj/AtTRqVCJ+I9kQr/Y/gn58UxrMATMy0Ib6sxoGRLJT0cHZoDJyz6zI9hdWw+M
 pNDshwAzXhDKO8IES3GpsfW+CImyp7pPW0UnQlO26ogGZRgG6emItJYiPJUrJKHa2Vwy
 uxFw==
X-Gm-Message-State: AO0yUKXC5lH5YpYLOFN2PzhTeeOFozEgZxHiDtn4zqlNt2KXiD9sQrXF
 JjjoAlLcwiuzsS/1geK11IdyNwib+yRTSucqDci6nw==
X-Received: by 2002:a17:90b:4d04:b0:237:50b6:984c with SMTP id
 mw4-20020a17090b4d0400b0023750b6984cmr1285811pjb.137.1677170995026; Thu, 23
 Feb 2023 08:49:55 -0800 (PST)
MIME-Version: 1.0
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-17-richard.henderson@linaro.org>
In-Reply-To: <20230216030854.1212208-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 16:49:43 +0000
Message-ID: <CAFEAcA_6_Om4hGBB5=pFVRzOiE-PndYU9TAFGRj1s7=s9-C0qQ@mail.gmail.com>
Subject: Re: [PATCH v1 16/19] target/arm: Relax ordered/atomic alignment
 checks for LSE2
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62e.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vqbgyDIDCqdR

On Thu, 16 Feb 2023 at 03:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> FEAT_LSE2 only requires that atomic operations not cross a
> 16-byte boundary.  Ordered operations may be completely
> unaligned if SCTLR.nAA is set.
>
> Because this alignment check is so special, do it by hand.
> Make sure not to keep TCG temps live across the branch.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


> +static void check_lse2_align(DisasContext *s, int rn, int imm,
> +                             bool is_write, MemOp mop)
> +{
> +    TCGv_i32 tmp;
> +    TCGv_i64 addr;
> +    TCGLabel *over_label;
> +    MMUAccessType type;
> +    int mmu_idx;
> +
> +    tmp = tcg_temp_new_i32();
> +    tcg_gen_extrl_i64_i32(tmp, cpu_reg_sp(s, rn));
> +    tcg_gen_addi_i32(tmp, tmp, imm & 15);
> +    tcg_gen_andi_i32(tmp, tmp, 15);
> +    tcg_gen_addi_i32(tmp, tmp, memop_size(mop));
> +
> +    over_label = gen_new_label();
> +    tcg_gen_brcond_i32(TCG_COND_LEU, tmp, tcg_constant_i32(16), over_label);

This brcond ends the basic block and destroys the content
of TCG temporaries, which is bad because some of the
callsites have set some of those up before calling this
function (eg gen_compare_and_swap() has called cpu_reg()
which might have created and initialized a temporary
for xZR).

Using a brcond anywhere other than directly in a top level
function where you can see it and work around this awkward
property seems rather fragile.

(Ideally there would be a variant of brcond that didn't
trash temporaries, because almost all the time that is
an annoying hazard rather than a useful property.)

> +    tcg_temp_free_i32(tmp);
> +
> +    addr = tcg_temp_new_i64();
> +    tcg_gen_addi_i64(addr, cpu_reg_sp(s, rn), imm);
> +
> +    type = is_write ? MMU_DATA_STORE : MMU_DATA_LOAD,
> +    mmu_idx = get_mem_index(s);
> +    gen_helper_unaligned_access(cpu_env, addr, tcg_constant_i32(type),
> +                                tcg_constant_i32(mmu_idx));
> +    tcg_temp_free_i64(addr);
> +
> +    gen_set_label(over_label);
> +
> +}

thanks
-- PMM
