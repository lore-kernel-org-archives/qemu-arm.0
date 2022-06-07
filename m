Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1989753lfb;
        Tue, 7 Jun 2022 03:38:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQQi+8V/Hr3X+EVJttYqtSnWWPr4Kmy2EBmgc1k3oiv0KI4tDT7foz8dyNXE+hsdtH+GaD
X-Received: by 2002:ac8:5f91:0:b0:304:df67:c780 with SMTP id j17-20020ac85f91000000b00304df67c780mr16751950qta.248.1654598288601;
        Tue, 07 Jun 2022 03:38:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654598288; cv=none;
        d=google.com; s=arc-20160816;
        b=kDdWFW1xCOBE0pCs1VKtl3x0ajix4wlxqzbocy4cKyX0F5DqQZaxzF5t7DwI8IUBGw
         DxOuuU7axwlxlkZwGsxir14DhHLzV7raX8xEeP6duKYqdsfVzEEZPSVpkGNp8rhLsirO
         2GG1vUYLsy2dPwQDlDEiJ8hgpCvPtMsNDA1gaYYG97CXRk+GTjraQGQvotaho7xm9QmY
         Z+mHahnm1C5B138Jm3NQcGQ+go7nt04DazYeS0Czy7ijnJWFm/ZowTLjxb/fzL8ckxje
         1lWtAO9eBT/ZqNtWj8w+rWaN0Rq293NI1//W1RgF2819+wj7Pnz0chxdR4epd7vdjFki
         gQgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=xKPkSuaMTC1QzseC4RAHpOTME66w3EOJq7/qpIixFxc=;
        b=X/zYAwQQNTaKpAgZk/lS9+wgAsvSX78Z9CeWlcJRyCLI9PbACPP4jjoRIpOMH4LKEf
         4LGJb1thsylC/pxJnsvcmz5oH4lQD9X4YMHIq9NMHoCzAiBQrJUgjgj+ruhUpn6eckYp
         rD/cwdOs/94rTT2TL6Bo1c/KbniY5rN/P3eI5GSMq/UtiSVHzqrsi0JVM00XH9i9Oym3
         sN4BynNJnI5K5MScZyV04mLJ/cNyaEsGCUc02RrPPh3L+dFd/4fzzv27YW29Pl7Wq9TG
         y26DfvTxHFQdzHSdolmNdTvt4juX1gUN96HHnx0QKAIAqWNcAYD4mis5vaQj5NT4H8Au
         qPtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DBDI1W2C;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o3-20020a05622a008300b002f908a26b1fsi9653106qtw.343.2022.06.07.03.38.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 03:38:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DBDI1W2C;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyWbA-0003bp-0b
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 06:38:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyW4E-0000J9-PL
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 06:04:09 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:47059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyW41-000686-9M
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 06:04:06 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id r82so30226880ybc.13
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 03:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xKPkSuaMTC1QzseC4RAHpOTME66w3EOJq7/qpIixFxc=;
 b=DBDI1W2C1wY8Vl+EVT96K+jwzt2uTCQytzuBCs4pDWBry0xww/dFTRYTPAS/og/qvj
 WciEMQaRwt5k5nXCTzx+lV+TdNzSBR9RatNcQXTuht3dTrMC8YFrK+6yQq2Rkef953vX
 72itnlVG8uvQ8kTlNy3diRbGNkHV47RRLY6PpVS/3SIDrUUaeIGW1z8giGGa8xAekD3u
 AlGJLKjqmhuhq7ubMPw7bUgghE3h4VhAouHGUKZEGGChqvs47yemR3GvS+PGgtsWY2Hm
 vrjWgC5mQ3WY3j6z+fHReOtoqOI4BjkZhnFkoXKJ7HHnYfsp61dJk6e9hGSmH8WJzR2Q
 3CkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xKPkSuaMTC1QzseC4RAHpOTME66w3EOJq7/qpIixFxc=;
 b=qCxfgXQWpR1daFMCxK3+nhNH2N6dnYXijNbb/9AB9i4YCvfUHe1JW1bxU//prgUQ/Z
 PAksUp83VuatoihdV7jPXF/5SAc9vf8ZzNdw/Ir7Rm2i/LKXDDEl0bbw995pOVOu7/Ui
 cy9xZh1F7Ev8ZONOLW8Gg9Hp3GPRhO6SWDHBDSySEXaB2ckwobqCfT7nPxvo6/rKEeE+
 5GlKfKj7Lev1zlQh8BwlJoW33M+YykBsOe+McW2KxCokeMNfCYxirDrUvTrco+RJ447o
 tkAidyVSCjz4uNuZ2KW/Y/Q80owJdrFA+xmAIJYHCpVP8baWMnbse84qf/GJgyIo0Ge0
 EHhA==
X-Gm-Message-State: AOAM532OxuNO8sYy+eJ5qz8J7GVvp6UiNTDLthWR+e3NaAmEDa1eJcNW
 4BlHmhEm91p6BDlG4NVFMp8O0E3o/Zit0PY8ld+G8w==
X-Received: by 2002:a05:6902:728:b0:663:5591:aa2c with SMTP id
 l8-20020a056902072800b006635591aa2cmr14580497ybt.288.1654596231698; Tue, 07
 Jun 2022 03:03:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-42-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-42-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Jun 2022 11:03:41 +0100
Message-ID: <CAFEAcA8fKsmQLqeNOJYiJ+dDTLWLnfTXiVO+wMt4OR2+ixzodw@mail.gmail.com>
Subject: Re: [PATCH 41/71] target/arm: Add infrastructure for disas_sme
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5o07y/jpuLNL

On Thu, 2 Jun 2022 at 23:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This includes the build rules for the decoder, and the
> new file for translation, but excludes any instructions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> @@ -14814,7 +14814,12 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>      }
>
>      switch (extract32(insn, 25, 4)) {
> -    case 0x0: case 0x1: case 0x3: /* UNALLOCATED */
> +    case 0x0:
> +        if (!disas_sme(s, insn)) {
> +            unallocated_encoding(s);
> +        }
> +        break;
> +    case 0x1: case 0x3: /* UNALLOCATED */
>          unallocated_encoding(s);
>          break;
>      case 0x2:

This is grabbing slightly more of the encoding space than it should
according to the Arm ARM Table C4-1 "Main encoding table": SME
encodings require bit 31 == 1 (unlike SVE where bit 31 is not decoded
at this level).

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
