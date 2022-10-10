Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp2425800ocg;
        Mon, 10 Oct 2022 06:19:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6snTj7WlHXd1U8Az1zFBWC0Sh4k4fyL7oh9dVbBV3jgceuT1aSRQ0q58MKaRKp4NtCOtfx
X-Received: by 2002:a05:620a:1e5:b0:6ed:1061:5c6b with SMTP id x5-20020a05620a01e500b006ed10615c6bmr2796681qkn.34.1665407963417;
        Mon, 10 Oct 2022 06:19:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665407963; cv=none;
        d=google.com; s=arc-20160816;
        b=vDfNo4u1+jssFDkGHL8pm2skrrV/gUrX8/c6Y2EN3pEmfgbPmo2YWg7axE3xQ5vnwY
         n1hQjwZ11ZedArz0+5A66/PpDiCUUmK6J8g5P1YA1sl8JZFmkCzPb50pS/cjJTNlYncL
         pYzHi2sgGeZ+MLsyO9rGjLMQfzGU2lBXo+loHORqVwX7Hw6FSbKgMzbkcEFwcOPkXjJn
         nG7TvjribZSqGJOn5o2VYe+IPIZzxBHvt07fD4mMPiJ+4uZfLCEFC2NFRKXv8PmE0jVy
         I827u81Vy2Ut1RAWNxfAIw/9iU6mQrdJcLXCInUrOvCiKtGK7tj95ra37m1nKq5rDeXN
         EV+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=VNmKvjs0yhbDrxDv/9vSERVwwBL+HckugvIkF9wNoCs=;
        b=jVqF4Jcpe8ddm4fHDB1yI8dc6Y+k5Fo3/GFanO5mUCelGHICmwX8W6NhdKN1s4jTML
         z3sPWm5Uav+MCDB0f7XGsIAOFDiNcTW25DOIBRBXhWK2QbyUC606lCzzJelEnrYppOkG
         Fum3W0tFfAq5Ddd8gjVi3V38KnFDhoXBa1YPNtuock1MJRq57/M8rZ3mr37iC+K4zJZU
         5MgfvYrF1/oaDRWVngb+/P2s6UbA8AUsjgpY/mYGflZ4xuctr1Sxv38wkYkkMku66szb
         cCO3TJwzcz/97vVD8BNjZPPfdw1ESqJJjSSwfhQYWtGxSZKdc0QCaSjBWTPDf1mcFYkX
         /+IA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tJotEwSF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r3-20020ad45763000000b004b170b49a52si4725773qvx.494.2022.10.10.06.19.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Oct 2022 06:19:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tJotEwSF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ohsgl-0002Ue-01
	for alex.bennee@linaro.org; Mon, 10 Oct 2022 09:19:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohsgN-0002R5-Q0
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 09:19:00 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:44558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohsgM-0002lz-56
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 09:18:59 -0400
Received: by mail-pl1-x634.google.com with SMTP id x6so10342207pll.11
 for <qemu-arm@nongnu.org>; Mon, 10 Oct 2022 06:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VNmKvjs0yhbDrxDv/9vSERVwwBL+HckugvIkF9wNoCs=;
 b=tJotEwSFaCixPBFon/KrfbbAQJicbe+1NhHNKHjpagEW2wE8VRWybt6HCko3pAJCtJ
 NKF+uwfG0CXueB/4hWAEx0QsA7IHmfGyZT4yEKuppI8AA0eTzluImD506R9SzadRt1R2
 CTkV51Wrn9I8d2AOw6H9u3wRWoQzqVAY/sicei2VSlMqILAnu9XPYhfocH132QucNwaG
 ExC8cODWhisgFyjBKRaMKydaLWrJcbk2WHBcaeVUQHpDRTAVCcKanpIMkqmL6GrOGvFn
 S0mxgojkmeseJ9yUmDk2Ku34DIwQ8X//JHOKV8ahWNpmNVeB6RFODgkuog3Sh3hb/ILF
 aPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VNmKvjs0yhbDrxDv/9vSERVwwBL+HckugvIkF9wNoCs=;
 b=l+msjaYd+mVhwoNfF1juXj4hbJ36vpLUMsJ15IFH+gAirPEva3kNLR7ydIheK28Avx
 8MGFy+DkAm4Z/w0tZAtJrs0v4yfARMX5gAxcHDOjqd2Slu0nqPW8Uj0RZz1hWguftsTC
 3Uh1TfGKyiwShcsFGbGF7zMV5ohjE57wKTlepkW6HAgtZhX8X75TxyvrbG3kNAfAV+8x
 8aQyfJ6HQVKs6RpwRZB/e9+4nUPmsYIzmvjzijcJwhtIJZJHqKC9NIcqB0h73REBrLpI
 sYktzqzuiMHz6olL4USUhIZMoZO1cYhUzByOIbTaxeuuyOmfT+HMHEdm9uhC/rHgJOvJ
 sFBQ==
X-Gm-Message-State: ACrzQf0j8BPxZa/E50/LkHoQdZIudvX+Gi5OUQFBEryv/NTqNVXqV8Lv
 k933Lzk/HctnCizTMzryrkMlOxdnbzYbGEw2rpmWXg==
X-Received: by 2002:a17:902:7c97:b0:17f:5abf:9450 with SMTP id
 y23-20020a1709027c9700b0017f5abf9450mr18639223pll.19.1665407936585; Mon, 10
 Oct 2022 06:18:56 -0700 (PDT)
MIME-Version: 1.0
References: <20221003145641.1921467-1-jerome.forissier@linaro.org>
 <CAFEAcA9bWzD5gKyHGOsz+8KCH1ykgU6sx2soDTVKiTHEa0D7KA@mail.gmail.com>
In-Reply-To: <CAFEAcA9bWzD5gKyHGOsz+8KCH1ykgU6sx2soDTVKiTHEa0D7KA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Oct 2022 14:18:45 +0100
Message-ID: <CAFEAcA_Bg=sC_aA_1PMZ4wrP-RfDYTAtP7m2QN4Jv1agdca9tw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/boot: set CPTR_EL3.ESM and SCR_EL3.EnTP2 when
 booting Linux with EL3
To: Jerome Forissier <jerome.forissier@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x634.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k6eRR4nTqmTx

On Mon, 10 Oct 2022 at 14:16, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 3 Oct 2022 at 15:57, Jerome Forissier
> <jerome.forissier@linaro.org> wrote:
> >
> > According to the Linux kernel booting.rst [1], CPTR_EL3.ESM and
> > SCR_EL3.EnTP2 must be initialized to 1 when EL3 is present and FEAT_SME
> > is advertised. This has to be taken care of when QEMU boots directly
> > into the kernel (i.e., "-M virt,secure=on -cpu max -kernel Image").
> >
> > Cc: qemu-stable@nongnu.org
> > Fixes: 78cb9776662a ("target/arm: Enable SME for -cpu max")
> > Link: [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/arm64/booting.rst?h=v6.0#n321
>
> Ooh, that detailed set of control bit requirements is new
> since I last read that doc -- we should probably go through
> and cross-check that we're setting them all correctly.
>
> > Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
> > ---
> >  hw/arm/boot.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> > index ada2717f76..ee3858b673 100644
> > --- a/hw/arm/boot.c
> > +++ b/hw/arm/boot.c
> > @@ -763,6 +763,10 @@ static void do_cpu_reset(void *opaque)
> >                      if (cpu_isar_feature(aa64_sve, cpu)) {
> >                          env->cp15.cptr_el[3] |= R_CPTR_EL3_EZ_MASK;
> >                      }
> > +                    if (cpu_isar_feature(aa64_sme, cpu)) {
> > +                        env->cp15.cptr_el[3] |= R_CPTR_EL3_ESM_MASK;
> > +                        env->cp15.scr_el3 |= SCR_ENTP2;
> > +                    }
>
> The doc also says that we (as fake EL3) should be setting
> SMCR_EL3.LEN to the same value for all CPUs. Currently we do
> do that, but it's always the reset value of 0. Richard: does
> that have any odd effects (I have a feeling it clamps the
> VL to the minimum supported value)? Should we be setting
> SMCR_EL3.LEN to the max supported value here ?

In any case, this patch is right as far as it goes and
obviously improves the current situation, and it puts
SME into the same place as SVE, so I'll take this into
target-arm.next.

-- PMM
