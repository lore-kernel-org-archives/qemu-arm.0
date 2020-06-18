Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1808005lfm;
        Thu, 18 Jun 2020 09:34:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyup6jHgLsPTGrRJt6iaD1ZpedHiaHs805te/bGqe92Q5m2otGoKYFBKmlXZRzNwggG+2Z7
X-Received: by 2002:a25:7cc4:: with SMTP id x187mr7833561ybc.245.1592498081726;
        Thu, 18 Jun 2020 09:34:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592498081; cv=none;
        d=google.com; s=arc-20160816;
        b=opfa4bLeJPcZi154gxghG4lGPA50zpQ97hohnPYhv//MhRKUm+B/5WnwHs0mvMKSjt
         yP9j/OQx/twyDjG2Ek27PHKlH7cQResaXUBs6oSgS+2+Jgd1De7Ooh/gNenxT/HjFf1j
         LEBZVECciHHnLWukdmNAg8nv0jQcgcMNTZasfrmWAcy6ArowpDPXpFMaeVWIE4oKtPaL
         5sdxwxAObLGIecEYzhZB4gLKnwvFQ+kwtHxXsC6ZxYQXGv0FxEO/r/i9oZXFXCkyJ4ry
         2OoirjGzKIIi4MSWwE1iOHDNEBKz3Zcfrut9ti+WswVpsHcpv9BPFMgXTbfse9rxuvlA
         H87w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ogH/hvJ4K6TDa3sOy+CkgXcU7PCbCLfZUwjFwrQp3aw=;
        b=b2l6rrTmKuB3BundHwIOFW/bYKaT+FJtog49VyCWx9BkyxU7m3tOs03AJzHa6KCevC
         x0xlzZTCG7mdM3qk0noEwkcpgT0AvzIkjZIz44R2eQYBff2LgEHGVCYn/x7Lg62Fjh88
         A8QG/HAXDXVkHUdisnlq4EFHeP08vuOPXAAU409WclcdcA8x9FDthPAcgxrN2RfRsrLY
         zeWVovMlfckAHGwB7OBpU1dJwgdEGWg7KL3PMw9eCIG1hZ7POBnFNVzBMCavI9BtsP0D
         QnK/JkTaqjO3r08F7rQoCzR15zBfJVnt4IiQwpLe1hJGh7/h82IpvyEB2H4rq9h2+N/g
         KYJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=q3QlcluY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h27si3019642ybj.396.2020.06.18.09.34.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jun 2020 09:34:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=q3QlcluY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlxUv-0001dT-5O
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 12:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlxUl-0001dC-J4
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 12:34:31 -0400
Received: from mail-oo1-xc41.google.com ([2607:f8b0:4864:20::c41]:45646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlxUj-0002tS-87
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 12:34:31 -0400
Received: by mail-oo1-xc41.google.com with SMTP id k7so1293093ooo.12
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2020 09:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ogH/hvJ4K6TDa3sOy+CkgXcU7PCbCLfZUwjFwrQp3aw=;
 b=q3QlcluYwYzCBZ8iLJuaa7EkhUbOXvF1Zxsu9sBg6MdLfSYcxhMKn7QewfQh5N303i
 L+0uPo/ordiI6U62X/NZJiclZP42XCI1sezsrXh/1PvbDhLoxj1Kh9ra8gWw4i+mtLMj
 fc3m750SJk7d8CDaGgitIudi7X2T5wV+6GrVLXa+U6V2j1f9guWcSHHGQL2Ubpo/ZNKu
 7eX+sMABGUT49M5Q4Uwn9npbl5lOmkzUuJUt5TxNq6d0onu+vZjXHeRqHwWcA/NIWTbA
 hU3/4SJ1565o3/lw/rfxWnahJdyKzP/PhBDXgYP3/4rBMXlXJ8nkDnHtv7Fz9IEe5dL7
 L/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ogH/hvJ4K6TDa3sOy+CkgXcU7PCbCLfZUwjFwrQp3aw=;
 b=HTr0eoWWhC8fCRbOUy0Qesg+AM8rkHY+FILZMUg+q9on7hn8/PMhUGClF1r8cd1PUN
 q2nEkn51g8dro2yn36mL83Ia9/O22mcTZBbAR0RvqhGXuPULhT5WaqX6HLTuzi7WauYJ
 M3o3HaFiHnZrBqGCCVZi5RR5+Gc/MEZjtGF15Tdn7SAoYMMYLTKyyH67TVMkdU6nykf/
 VV7udx6kDdMn/F2QSyk4sPbuIMpFVsIb+pjTuflVM5viAFWCjF3u0Q0pph/SCznq0sV3
 VxgCYDEtUCpOt/vUdGX5mZYb6j2XEv/x2iS+ct78GpB3NesCxxmN+yqtcxBahlPB8lpW
 RHPg==
X-Gm-Message-State: AOAM530puftmEWDStYcXMRYmmBKV8i5hKtilpXctzibsmLFaB3HCTGiX
 SAjU61fsU87HRFGeOcafBCkcHU2CxuObQXhN9DVNCg==
X-Received: by 2002:a4a:a20b:: with SMTP id m11mr4869907ool.20.1592498067866; 
 Thu, 18 Jun 2020 09:34:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-24-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jun 2020 17:34:16 +0100
Message-ID: <CAFEAcA8xYTkxY__pT_yG=6VL4Ku7=nqc5okML9OD3B1XxL_VFA@mail.gmail.com>
Subject: Re: [PATCH v7 23/42] target/arm: Add gen_mte_check1
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c41;
 envelope-from=peter.maydell@linaro.org; helo=mail-oo1-xc41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DOFrV/ksZS8k

On Wed, 3 Jun 2020 at 02:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Replace existing uses of check_data_tbi in translate-a64.c that
> perform a single logical memory access.  Leave the helper blank
> for now to reduce the patch size.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index c4f86c69ba..9f8ae99cc0 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -204,20 +204,20 @@ static void gen_a64_set_pc(DisasContext *s, TCGv_i64 src)
>  }
>
>  /*
> - * Return a "clean" address for ADDR according to TBID.
> - * This is always a fresh temporary, as we need to be able to
> - * increment this independently of a dirty write-back address.
> + * Handle MTE and/or TBI.
> + *
> + * For TBI, ideally, we would do nothing.  Proper behaviour on fault is
> + * for the tag to be present in the FAR_ELx register.  But for user-only
> + * mode, we do not have a TLB with which to implement this, so we must
> + * remote the top byte now.

"remove".

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
