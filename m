Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1707945lfu;
        Thu, 28 Apr 2022 05:56:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVC/xmDofTLixrGfHeX2kGBXMBDL1KsR+TDEoj1TlYPiXX28jd/LxmTmY47Yc/i/5R6Xgz
X-Received: by 2002:a05:622a:1181:b0:2f3:6ced:cafb with SMTP id m1-20020a05622a118100b002f36cedcafbmr12676842qtk.305.1651150601735;
        Thu, 28 Apr 2022 05:56:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651150601; cv=none;
        d=google.com; s=arc-20160816;
        b=A7PhZvbQTrxCvQbP/eezKIrGNm08sJTAegAdIYMsTs14pPh6WOxRI0RRj0GNQc4coz
         35PmCWBJA26Cn0Lo37Lu/Vmzz1ltPFsdms+xoE6kHJdIwCj+txqzlugIKCi5+r/OuPy6
         s5Rex6C++WR+DLMG1OimlFD58g2tWcRBGi2VCk6CkIVGzO/aGmZF1T21sjN+NwkM3Z9q
         0yvUuurlxnoLH0kk0BCAJ4MowI/ftsAC+P+dZIglhgiqStAPie2zypYbO8gDXhmAnwc4
         BEN5b+5JSdjoqT841jTDEzphVITwHwixr1eE7UX61oZ63dAKyve6CNOhb6mcd6WjIsx9
         ybAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eZDV6ma1eYefpVj/w7G4fwGabiA/6CKg5rkn0ky9OYk=;
        b=xb4ZEF1VhBtWK0D6xkbd6kq9gIZm+Qto58ZXc21ua4use/Z9UCKzLi8XWbFMEI34yC
         +RWyiFvkSJ4ASyASbbAMKVAIQGaLcZmsVTGWyJSYWhdc1Hf9N95cf4ewQHWmi8+dNny+
         HOBbuNfDDTvvF4War+g5OfFwOAjHQyrsSWBwFtrvAEisMcn/Vn7Eh+BoJPVTg2umeJp1
         nTu4dox8UxO5U8XBMvkQ7Q2SJshN0lKpjABbqfvdUAyp2Ic4EpTLi6RYdE7t4s9Rg5+S
         Md80kk+rvQAWHArzC58WaBCAigB910UBhDDUlMLyqkNAtpIC3mNXVXYaQuKWsNe5rxSB
         NbVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HwEg0yXf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f2-20020a05622a104200b002ee12b20720si1899797qte.12.2022.04.28.05.56.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 05:56:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HwEg0yXf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk3hJ-0005hO-8n
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 08:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk3h7-0005gP-JY
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 08:56:29 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:43741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk3h5-0002Kx-Tc
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 08:56:29 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id g28so8821651ybj.10
 for <qemu-arm@nongnu.org>; Thu, 28 Apr 2022 05:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eZDV6ma1eYefpVj/w7G4fwGabiA/6CKg5rkn0ky9OYk=;
 b=HwEg0yXft+qtFX8XYLero0Cj6t0YI4HLsNVWcMy8ZzG8wqqvGmM1Es1UgiRGQsjp/X
 lXewRB9zguYCdjjhqAQsHJIalgD5TuXh89CrIc8+TklqgnpnsWRCcAEGdtAb9OnOuG9S
 ooyr4tf2DP7/VH3/CjelSQisVPO0Ik7ZxRFB1bQZrj22l+e+o3nuRC6gdqsXrsn1HYVY
 T3GYzRpBL3aFqiwRMKb5aielyjilc4o4Fa1fygEaHco3XQ09mGNi//l3cq2qauhdXqgO
 5xyrPPJVYYGfb3seBLRtLJJLfz9gBzEsD+9WZZeSiWXBl4MmE4cl38R0DC6RXTmYdTuh
 pH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eZDV6ma1eYefpVj/w7G4fwGabiA/6CKg5rkn0ky9OYk=;
 b=po/KkcbjjuO9nWK5uJ9qyGgBYNljj13ZNRt1JRParG/ALZaAz4dHEyo925HCg4/Dcb
 b648B26GM5v6OmSNC3Qj2TURGmeea/mlJ4T0DYCu9swzO3JVhIcf+AkTaLPAtoFkDpxp
 CEo/mDT+B8PjNBit/X+2BCo6mKhdUpZbJ1tkVqzuFDQMQsiaqE98aRQo8xSI5AfONy+i
 G3L63xu+AV7Z1zO8szDauoh1H/y1L1Kf39/9njaacrbXLsfXwZvei8GCjyvenB8GlCKw
 6GTD0LmQOCUc6JdDP2jEtp8twWNevHPLnPRxeYasocVuzadfDFf9vuZJljPX90iPe6Z1
 QCvw==
X-Gm-Message-State: AOAM531/mvflKkOna9Jz3VVjnqsbpbelJNneiMx1GbGOAhh9FmjADvbf
 LI/UZtr7NQtzFGaqtvz7utru+PdGa74uT7wWwJgFmQ==
X-Received: by 2002:a25:40c4:0:b0:645:88a3:eb8b with SMTP id
 n187-20020a2540c4000000b0064588a3eb8bmr28754744yba.193.1651150586781; Thu, 28
 Apr 2022 05:56:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220427042312.294300-1-richard.henderson@linaro.org>
In-Reply-To: <20220427042312.294300-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 13:56:15 +0100
Message-ID: <CAFEAcA-636wFtzEF56y8PcjcZy2J9RuNaw1nHMQ4Nsn_55ndCw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Enable SCTLR_EL1.BT0 for aarch64-linux-user
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fNFapSavGTgS

On Wed, 27 Apr 2022 at 05:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This controls whether the PACI{A,B}SP instructions trap with BTYPE=3
> (indirect branch from register other than x16/x17).  The linux kernel
> sets this in bti_enable().
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/998
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> --- a/tests/tcg/aarch64/Makefile.target
> +++ b/tests/tcg/aarch64/Makefile.target
> @@ -26,11 +26,11 @@ run-plugin-pauth-%: QEMU_OPTS += -cpu max
>  endif
>
>  # BTI Tests
> -# bti-1 tests the elf notes, so we require special compiler support.
> +# bti-1 test the elf notes, so we require special compiler support.

Did you intend to edit this comment line ?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
