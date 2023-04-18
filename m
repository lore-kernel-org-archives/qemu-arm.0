Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2442412ejm;
        Tue, 18 Apr 2023 04:30:51 -0700 (PDT)
X-Google-Smtp-Source: AKy350avCrtKnfeCpwAmupud2c+evsVCLl492mNTF2m3S4nW/9HAvnzk/iiLWdTglmxnBMuabeTJ
X-Received: by 2002:ac8:7f01:0:b0:3e6:45e7:f170 with SMTP id f1-20020ac87f01000000b003e645e7f170mr25433109qtk.50.1681817451669;
        Tue, 18 Apr 2023 04:30:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681817451; cv=none;
        d=google.com; s=arc-20160816;
        b=ghxiSfg/d0b9HP6npnzd2daPPyQIXciF1n3OaHROpOM8htVoaWykdyhn3ikPChDiF0
         4/SBa1lqfo6JZ6eha3/jKay/PIEo0cPsVS0YhVtHkchcHPB6Bz7DR1bnBmXD2x20m9IE
         I65RCg+Nw6DNGoW1A23riP5FeFvx+tXe2DamqfLHZFfc1FCZwYoKw18AcZq/WFpNjlod
         yylH9SCbSazyAC0cuFYSXbBMzzvPA2hdXwVVnWxFlZD2ph5xlkcRW5asHDi371WA6NR3
         Hp9gkQ+OFJKK3MDOaoPUwDZihEhPcQvP9d95/grOKuQ1uKFvT0uHA9UalhlUJFAnEAUr
         jLgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=XchKrNC7MDnASk5zAguAUjVvYixzm90kzpWHwgue84o=;
        b=YPdjyWJHcNuZMkjl2NBO+rRxEIQHSM7KQW6fUBlkvrD/yuE4KDwmODp2nru69O5QWs
         N3Oc1fOecFH7Cju6AaEnb9NTy17Y/YK8GVMuotjjcpObUs6jCQF45o1Ca8kUsfwbWW5y
         GShMylgKqjsKvslTUnEGuxVQJMW+Aqkw1uMwnLIN70cA1C+iIv5/iNGIEUWTok/lOupF
         DbQLUFhBmmMz5hWdOH3eJxQylRC55dw3IqTIMqCtTBVFmjue3nOzjGPAJH1WpTMOBmAE
         1ckomTgIUL4mdRMOO5AuuebqeAPGlyf0uq4DKIAxY1fDb8ppvTX9hYvsUWAtK5XOhQQ1
         NWKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iCHYYDnu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r142-20020a374494000000b0074a1d2a1719si6852520qka.434.2023.04.18.04.30.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Apr 2023 04:30:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iCHYYDnu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pojXh-0000B8-Vr; Tue, 18 Apr 2023 07:30:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pojXg-0000Aq-Hh
 for qemu-arm@nongnu.org; Tue, 18 Apr 2023 07:30:36 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pojXe-0000Jj-VN
 for qemu-arm@nongnu.org; Tue, 18 Apr 2023 07:30:36 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-50506ac462bso3930700a12.3
 for <qemu-arm@nongnu.org>; Tue, 18 Apr 2023 04:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681817433; x=1684409433;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XchKrNC7MDnASk5zAguAUjVvYixzm90kzpWHwgue84o=;
 b=iCHYYDnuS7NOqctB5QKdVNAtEjPpbzk7GnC1/7hMiSlBCLtj6Depq1hAuCT4TlCRi5
 15j+t1QLMZroQOWI9F9gffhR015W+/RwxNOHea9uPBRcXXFGEWYuGmtiNZo7DZ/T4M8A
 bAeO7MYevr6lFOM2ToD4J3GTt+0NzrjSB9s7hv5jA41GLfGz1+D9v9esiKpd6rFuQNi2
 8fHMuTp0E6e4xo0cAOPZuapzE+4aPkTeT6Y2LiIZqr7raUouSDRkYtCCBGI8LpmzW1Zo
 gGRXv0tuimWDlr5ExBcVXmuUUTh3PqvPPvisL83QwJA4r+VKnXRN7te7/lB8u+R1uQl+
 /3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681817433; x=1684409433;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XchKrNC7MDnASk5zAguAUjVvYixzm90kzpWHwgue84o=;
 b=Fl+Gy33pitu5ywcl7LvPgTOHwlEUJ10dyaoCP6Zp3LKQc6LCMt4cBMItM7oSPCss0N
 zqP3cKNLegnGgatPVU+SKiRyQQpQjJ/OnTsIrYtAqF5hz1GgFc1+oZ7IKyyFyD9NdLJV
 HaKkntRVbD1rIcKj7vEHO6nbNNxgW06cb5kxWZrbM+AvE49gC/6sLw5XKXeqNDPHSuAH
 U3dv8KnPcPKZozpEJw7oYVQtu5DRlXqXjLjgUYSdi6UL/+iZqh627jFobDI0+mMjmYrK
 TkHpa4EcXTc/RKFuHV25Uj/NyMCUuJSwUAP46NoZ02tUJrHDhTxfdLIgL2wfF6qPdkGD
 JBFw==
X-Gm-Message-State: AAQBX9fS/xF26Y1JWsdfEv1Gwvq4QIWcjnkqhTdKXT0g5cAWQVn26z2/
 lx18fnxtr2lOxqxl/3/ZxcZ+gc8E1ko6Bd2AJXG1+A==
X-Received: by 2002:a50:9e4d:0:b0:506:7dbc:39a0 with SMTP id
 z71-20020a509e4d000000b005067dbc39a0mr1035132ede.6.1681817433204; Tue, 18 Apr
 2023 04:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230414160413.549801-1-peter.maydell@linaro.org>
 <20230414160413.549801-3-peter.maydell@linaro.org>
 <836a4c35-9e1d-c067-cb2f-76ea93ccd53a@linaro.org>
In-Reply-To: <836a4c35-9e1d-c067-cb2f-76ea93ccd53a@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Apr 2023 12:30:22 +0100
Message-ID: <CAFEAcA8EOrEs=ivv+skKy+e40BiiD9qDP-KFakfgk1E=y89NVA@mail.gmail.com>
Subject: Re: [PATCH 2/3] target/arm: Set ptw->out_secure correctly for stage 2
 translations
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
X-TUID: 6q2p2YoZeX01

On Tue, 18 Apr 2023 at 12:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/14/23 18:04, Peter Maydell wrote:
> > +        /* Check if page table walk is to secure or non-secure PA space. */
> > +        ptw->out_secure = (is_secure
> > +                           && !(pte_secure
> > +                                ? env->cp15.vstcr_el2 & VSTCR_SW
> > +                                : env->cp15.vtcr_el2 & VTCR_NSW));
> > +    } else {
> > +        /* Regime is physical */
> > +        ptw->out_secure = pte_secure;
>
> Is that last comment really correct?  I think it could still be stage1 of 2.

I borrowed the comment from earlier in the function, in the ptw->in_debug
branch of the code, which has the same

   if (regime_is_stage2(s2_mmu_idx)) {
      ...stuff...
   } else {
      /* Regime is physical */
   }

structure as this one does after this patch. If s2_mmu_idx isn't
a stage 2 index and it's not one of the Phys indexes, what is it ?

-- PMM
