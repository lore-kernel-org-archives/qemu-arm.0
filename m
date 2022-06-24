Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp445475lft;
        Fri, 24 Jun 2022 09:27:01 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tVPQEEXcDmtgPxy1ZCnYJPRx3ixCyTC3SYbNgUKmSxxUteoHrI1I5hVFGVfFcLaTGiDjZl
X-Received: by 2002:a05:620a:4116:b0:6a6:fd52:19dd with SMTP id j22-20020a05620a411600b006a6fd5219ddmr14610qko.4.1656088021760;
        Fri, 24 Jun 2022 09:27:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656088021; cv=none;
        d=google.com; s=arc-20160816;
        b=M1jQLMQgM/35dMG+4ZctLorxPsMMMdPVhJK0GGssjL2BBFlEgMNgij7D9GOp1MWUYc
         uuAkhUkVfnAhkjqwy07s5afYB6zPbnwtUOBiaPABPw9sAJfuoFzKYfQMJIxJ0P5nIZSA
         khFWyjrJ0D/ihk0ZojneYnpTYb9Lca5sefgBnDbDRyaE0cNxdIrsOp3Ay9VQESxPeo2L
         vZoJrtGknlRyVHRaQX6YByv+Ne0VGakOnljCi4/rYa+WNVTcZNfuJHjk44kKtSUqPJXy
         6tm3ROXmbLpEHd4KRvtitQ7ZFvib9U5DU0hl2fJqmPRuISQhY9E1rvA0p2XrJZlO0vBQ
         obiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Hzo5s5E41Fv0KHhXhiynqGOtoIeIIyCWgRBQaPBNRdI=;
        b=XADSXyrzSCB4JXiU5uPChv7q7beYlUVEg+1sdXek89IWDQ0aPFDC/eTxRrKlsM+iNP
         y/C1bdBqXLncnqeNxrossi/iATA7OVaYKjDfF8mlYIXLFrKoFdx+JsLEAJXvDRI/9UZy
         fuvjDaikpPgRmmEUGiWnr/sGMXG0ZXupOP447HmuTMhKY2g/s1DxB+Lx81XLIPQCWEzk
         s2E54EZRATuqGhAtwE+rTw3KpUwpRGOnHlaBHggMiLyNK7YvAixeBpR4DTnJNXDUy1vU
         W23+791LBDFhGtLrU/ag3Ho85g7tGdQZ8JkPWFRITUxImpDMoKd660uxXGxFXXpN4E+A
         p5zw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qZ6sjZ01;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j12-20020a05622a038c00b003177813528csi2290094qtx.559.2022.06.24.09.27.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 09:27:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qZ6sjZ01;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4m97-00070R-97
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 12:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4m8a-0006xF-FI
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 12:26:28 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:33483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4m8Y-0007qZ-S2
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 12:26:28 -0400
Received: by mail-yb1-xb36.google.com with SMTP id h187so3138847ybg.0
 for <qemu-arm@nongnu.org>; Fri, 24 Jun 2022 09:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Hzo5s5E41Fv0KHhXhiynqGOtoIeIIyCWgRBQaPBNRdI=;
 b=qZ6sjZ01SgiB/61qlpZgYVwF4BxHOCq2HI4tYnyPKgupM9Yk6bSqXJKuyWAXOqql6j
 kp/YUMtWnbrMpMtfk1I44y0QWrJjCBRQyxSYDKPP3Yil2N1HE0xLT+ghivKb2jrLNPxv
 0qGo/bDzmg2TS1ZwjcbjWn1FBNOK10b5S3iSZvN2ppli08kHz+1kUJ9pPSb2ektEtaYH
 C4jCxSGVliXVtp5yFuhsERZRDYw6X6KhWbdR1uoWHwpAFp7ayUBZl3StCMCRtEJ3+gJp
 3IGU0n5nHeGWb3vOKu7TyRxJVtxoGgU/bj9bKOGWabE9v/t2KGlAhonRmbFHZGXNPJ4b
 eJjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hzo5s5E41Fv0KHhXhiynqGOtoIeIIyCWgRBQaPBNRdI=;
 b=e+DDQkF+WpNDBTyk7IIP169GbJIkYTeT8r8mMADtYrp2FK+jPLAdt+dCisF2vL/K6r
 ZqRWlugxcW811JhbaTJkDhC+zi3YjvD0R1CQAJlIXaqyywSw1sfXeru3ojenk8SVP1et
 JykwEWCk5A+Sh88NbOgtwpF7MM6dcjGxDVUAG9wbVtiBVuFsEYERpKYucHYMK13A12a+
 IC6mnXDuD5gMsixveHoR+Q5AvHtncLV4nE4sY8SUqbctInLUYhBH9X5OdbM0XgZGxH32
 o7XUVM170i6Zh90jmytCsV8+/KOz2mZ1KdwopwDOnLpqkPJCK6NgcuBSwLs9kxYss0Bv
 FERA==
X-Gm-Message-State: AJIora94Ww3RRURyOVA6H1U15ZUlOw9pgOXnpkXBr+XrAFrNTzvmXrvs
 1GMghZoqni3rhVSm/T4s0DD1oUgBG9tz9/TEjaxHuw==
X-Received: by 2002:a25:810a:0:b0:669:9f30:7f1e with SMTP id
 o10-20020a25810a000000b006699f307f1emr13023171ybk.479.1656087985804; Fri, 24
 Jun 2022 09:26:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220619001541.131672-1-richard.henderson@linaro.org>
 <20220619001541.131672-2-richard.henderson@linaro.org>
In-Reply-To: <20220619001541.131672-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 17:25:48 +0100
Message-ID: <CAFEAcA_cp9iSK+V2VV0cDXAz0rRtkEGOWiYF-33eDgv++C3P+Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/arm: Extend arm_pamax to more than aarch64
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PfThqsJkYm50

On Sun, 19 Jun 2022 at 01:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Move the code from hw/arm/virt.c that is supposed
> to handle v7 into the one function.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  hw/arm/virt.c    | 10 +---------
>  target/arm/ptw.c | 24 ++++++++++++++++--------

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
