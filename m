Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4836971lft;
        Wed, 6 Jul 2022 09:15:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1su9rqYLaz+U+VpADmWmrh43QwXgCYuLDefmzPCCtP9DB/QRyUdbMH3FZXJuR4ZHPlOcOln
X-Received: by 2002:a67:e1cc:0:b0:357:1ea6:3d6f with SMTP id p12-20020a67e1cc000000b003571ea63d6fmr1028216vsl.0.1657124149707;
        Wed, 06 Jul 2022 09:15:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657124149; cv=none;
        d=google.com; s=arc-20160816;
        b=odj9MYLz3ErTe4ddwvn9WOWwE7FI6zOy9CmqCLD+8ZEfMjaWThN/EqSTA54UmeGc+Z
         PxrFv3MMeadMGZBJDmsqeJtgHxMyQs2HppgKnypi1usWgUFu6g+nxh+6mB8oXkwlvZK+
         VRrZcuTkfBKZK0NFWL/4qqzFQQdMPZ6DDsEL+M6DUteoIKZXsGusTOrf4t4mn4EE+aXo
         te37gqbWnRh6f8KdnF+tBrEe0VTvbKqrbEAhUabPApO8Ohs2Eu8lNWf3yi4YQnHr8wVM
         RzSF1gMm87cRRhVHPZhj7Ix8zRQOS8FTnDVq0SwQSnIBFQgOIojCzi0ijt0OmHWwAoyk
         CVLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=1QiRp8xYTq1uMWZ3QebVTEqDd0ExmJAt2sYepQc/mh8=;
        b=1If8C7jPGMKqDMuDULwHtBMVM5/QrEHtdaY8CHycRuoWU0KG2c5LHWK+/B85mxlihz
         JKqH8aZWGPc/dE2SU1C/0Hkv0P1B8R819gvJdgwNfHfXCmkZINDSHaXHBkDpc4i0NhuN
         jDnexyTOsMwn9sFURUzplRalrQSFS/b+0ilYV+9+KOY1OZE5/nzXiWsX0ZXP7W4dJJSw
         uh3Rird40YG6RN+OYblGTcY1zcGcO4Eqy0edBCJCuS78YlXlaOa9D/xj1bGMs3PS5tCB
         UOEnR1iP0meMSih1r7FZLkw6ulbiTSlA2dys9DXXXwk50YL5xfxez1pNTazhZm8KElwG
         XBOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jLMGmAht;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p22-20020a67f356000000b003544a247987si9602903vsm.205.2022.07.06.09.15.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jul 2022 09:15:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jLMGmAht;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o97gr-0005cH-0v
	for alex.bennee@linaro.org; Wed, 06 Jul 2022 12:15:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o97gU-0005RU-6i
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 12:15:26 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:44762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o97gR-0001UR-OZ
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 12:15:25 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id i7so28116422ybe.11
 for <qemu-arm@nongnu.org>; Wed, 06 Jul 2022 09:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1QiRp8xYTq1uMWZ3QebVTEqDd0ExmJAt2sYepQc/mh8=;
 b=jLMGmAht4ZUhHv4vbDTeiqgoDHWw2+xgQW08iBArgg4N1teGx+k/2jZCmabEEzBtiC
 BKoesisF7Hm4NGPMewJdqdTqoE1OpWbt0ccXwunUpkXCpGMQLeoYKLKRUVmy4UYHBa5i
 ChpkL5Cv2pkASVCVzbdAY49LashhshVVD8weP1K/q1RDxsH0zjXj7MjTx+D2xxUO9ptc
 Lsf89wNdT184X2U6NaxUr6R/BUQH9r4usdKZFg6ARwhvD4Fvr0wh45IIrUuW8Nj+aUFG
 mPhXsKrBRLdzQ9zgHqDALmJ43t5rJhY/zYdfihLtdhQq8qHsgGhM7iFjLxuzsSgNkoKh
 46wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1QiRp8xYTq1uMWZ3QebVTEqDd0ExmJAt2sYepQc/mh8=;
 b=szJ2DtMF579RIJwK/HeqMwbUEtDtGw4lgQSr8D3kPBvcX0iBD3t6Ab/1md1xFP5ayK
 uW7sfqQ0z9NZBKrIrb6zuj7JFvN69l6O85xlFL7LuYXcRUoKilL7y2i9taIY0/rwq2SZ
 ek6OeKV6dZ8BoeCQcDPxb7MIpve0tc98tNtEup2KwLmRfwxocrE+Dbs3IpMeexyVAqGf
 7eDp6v5WZrJ4jeDCEuEum/s0malcyskLaI7O6vzqTxKrGW6S6flFPWTYZGl1TYtfjJBU
 Qsb4lBnt6/e2/aQS9L/0TWVVL/pCMfAPy3bXU0HMgDby0rllzO8DRcia9PhYOpVbFIAo
 ZOng==
X-Gm-Message-State: AJIora/VOUn5GoNQjdpto0sycfdDhRAECjUcztwMDt6OUt8cVgKrpUf0
 R9dOe4GXDxZ7IaisQADOBJB+enOzZKDep2msA8YEtO5CSf0=
X-Received: by 2002:a25:500e:0:b0:66e:4c27:6223 with SMTP id
 e14-20020a25500e000000b0066e4c276223mr17958580ybb.85.1657124118497; Wed, 06
 Jul 2022 09:15:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
 <20220706082411.1664825-4-richard.henderson@linaro.org>
In-Reply-To: <20220706082411.1664825-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 6 Jul 2022 17:14:40 +0100
Message-ID: <CAFEAcA-i9dTtizSOEt5r3G-Mggu6YqYHsXCz=y+Ki1=kkWRNVg@mail.gmail.com>
Subject: Re: [PATCH v5 03/45] target/arm: Trap non-streaming usage when
 Streaming SVE is active
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zWyxJL62ZbZ+

On Wed, 6 Jul 2022 at 09:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This new behaviour is in the ARM pseudocode function
> AArch64.CheckFPAdvSIMDEnabled, which applies to AArch32
> via AArch32.CheckAdvSIMDOrFPEnabled when the EL to which
> the trap would be delivered is in AArch64 mode.
>
> Given that ARMv9 drops support for AArch32 outside EL0, the trap EL
> detection ought to be trivially true, but the pseudocode still contains
> a number of conditions, and QEMU has not yet committed to dropping A32
> support for EL[12] when v9 features are present.
>
> Since the computation of SME_TRAP_NONSTREAMING is necessarily different
> for the two modes, we might as well preserve bits within TBFLAG_ANY and
> allocate separate bits within TBFLAG_A32 and TBFLAG_A64 instead.
>
> Note that DDI0616A.a has typos for bits [22:21] of LD1RO in the table
> of instructions illegal in streaming mode.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
