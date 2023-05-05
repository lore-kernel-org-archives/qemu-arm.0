Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp318703ejq;
        Fri, 5 May 2023 03:37:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5njmV9N27QRjUJ+SwjGIZy8Ty600l7zx03mvGLiHjIzRxvwP2KWgLo/HfMlxDu8VeNRU9j
X-Received: by 2002:a05:6214:491:b0:616:7977:2460 with SMTP id pt17-20020a056214049100b0061679772460mr1291087qvb.24.1683283066947;
        Fri, 05 May 2023 03:37:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683283066; cv=none;
        d=google.com; s=arc-20160816;
        b=lqYUJ1vpL1E0quNDTkBv22bx7IpFQUwnnmt2qnYjr5yuvSQ2Nk+WJnxrZ2a7jkOFwY
         Vom1hKBCdY6rcKCObRr3MDKn/XX2oE7eaDhnZDdEnGRwHJ4qNtFivL33e0PLZcz7al0T
         G42MosmV6+acfCDDwvWSEqH00kNglq7Z31FChhF2QQHOMhMO+FZhxxWh/dfQnwFm01t1
         JfU8HH4UjjTWnwdnEKNNWyoHM1aj/Xw+EVeVAhoOH025Q/jgJ+QCdquxEO3yV6LA3qS/
         TskNy10SnaVrqjCBfpsOTRm+TcIBOWbtRVmPnmDNhGOkxiHkg5KQhavlg2/uS2uM3dTa
         qrCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=lQFl/hfaokX6bWVDMMA0Liw7xdcfO7yVzbh3vEMN0ng=;
        b=qgx6f4W3uK13EjdQqWSm2o2dX8bLzqy1YjramOvcT+9ZPfPxnvGsneLP7sqPlbWwvG
         AdSmM3zc5qCQAS/cLJOPKx1hhOUEI7lX9hL0TBFokcv1vosiGb/NExac6RBHnvMMcfPR
         hK+dXraM6K+uXuIL+dBWYRNbVk6FALp0/Grciz83EU0t8QAPhqR9TFNLhFiDUQO0y7BY
         7Hh6v7vfJ4FxcJaUEX5kQcFPl9crPMbra32QE+c2oc9RAXlzzqP/EDVL+Ju7ID1SIdt9
         aeoLP10dsALaG+Ih2rU+F4RjyWTK2twcPTYoxVurAA2ejcOySMm34CQZjvn3IZswkuMp
         ObIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CnicNmAC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kc19-20020a056214411300b005ef8094003dsi501734qvb.17.2023.05.05.03.37.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 03:37:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CnicNmAC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pusol-0004pb-PK; Fri, 05 May 2023 06:37:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pusok-0004oP-9t
 for qemu-arm@nongnu.org; Fri, 05 May 2023 06:37:38 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pusoh-0004ul-OQ
 for qemu-arm@nongnu.org; Fri, 05 May 2023 06:37:38 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-50bcb00a4c2so2511914a12.1
 for <qemu-arm@nongnu.org>; Fri, 05 May 2023 03:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683283054; x=1685875054;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lQFl/hfaokX6bWVDMMA0Liw7xdcfO7yVzbh3vEMN0ng=;
 b=CnicNmACePipY/HbiiDXqJ8853Y5kSFJHKLX4nKx1qOAJOqFqg/lnT/seHgegVy1e5
 K12LgtMNLz0TVxtvBKOzPhEMesZ4I+O7/2x0fshrVcBBgTKuW+7QsKsEEcHEohpbao/3
 pA7a+2iBWNirE8rIhTDO6qJo6PgPjbKxbJCchEU4fyoxZh43pwXnJjjZ1dGfB6Z9ifHu
 oetUgFhCtYBg5Zv4yfCfJPzA4AKxbIjg7uK45LuR9uHrJyJs6jCN6HLJXqSj3hG4o/VP
 RTJE+xgeKjLPmdfUO4V8grddcg0fxGOYW7b3kstIwIO1TeJEbpyPXJRxNliAzjQaK64r
 5v8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683283054; x=1685875054;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lQFl/hfaokX6bWVDMMA0Liw7xdcfO7yVzbh3vEMN0ng=;
 b=ZBOSVW25yj83jH/Ro4ydSASTDrHLV6KuTNg+vcCuynkPkQr22Ubg2NSZ9es7Ka6mkx
 TXnBYRzWxoxvWlaWPswlSRyAHMC+zi9a3upFhZUdXz6PB5FGEq6QR+Av8n7aXFFkhqwK
 7+ZNz/6/DhhmNoEhX/0VPulBEzZB+rKBJ7zUo2KWCF7tINPHx/YpRt1sO13WfmlpZzJt
 aLOrIHhfRP+eXkun5GyioQMpRvqK9I/L/TN5R7uSDC2kdi8zrTe2E/C25f/FG7nbuXUX
 IeUJycHnyvtBtaiDNPSIZ3OasmbsnVjLRR/GbpLQEmmq7XRQ7SPfB/ka5AWpbxq9rVCC
 Qy8A==
X-Gm-Message-State: AC+VfDxjNgB3DHzITJSQJvUKVtTRxIhF9Q+iHYYO9glvKhvqPPquyjGk
 zEWq8URaXDmx5qYRlqexupkP3cpMgHoErnWStOaoag==
X-Received: by 2002:aa7:dbc8:0:b0:50b:d305:3788 with SMTP id
 v8-20020aa7dbc8000000b0050bd3053788mr798666edt.11.1683283053934; Fri, 05 May
 2023 03:37:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-16-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 11:37:23 +0100
Message-ID: <CAFEAcA-qe+5+eDdjFUxrOqE4URwsBYdN7Q1_BLbAusGDnaudGw@mail.gmail.com>
Subject: Re: [PATCH v4 15/57] accel/tcg: Use have_atomic16 in
 ldst_atomicity.c.inc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
X-TUID: M0/xJkztI3GF

On Wed, 3 May 2023 at 08:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Hosts using Intel and AMD AVX cpus are quite common.
> Add fast paths through ldst_atomicity using this.
>
> Only enable with CONFIG_INT128; some older clang versions do not
> support __int128_t, and the inline assembly won't work on structures.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/ldst_atomicity.c.inc | 76 +++++++++++++++++++++++++++-------
>  1 file changed, 60 insertions(+), 16 deletions(-)

Inline x86 asm in a bit of generic code seems rather awkward.
Ideally the compiler should be doing this for us; failing
that can we at least abstract out the operations to a
set of functions that we can provide (or not provide)
implementations of?

-- PMM
