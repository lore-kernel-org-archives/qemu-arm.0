Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35BDCCA476
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Oct 2025 09:55:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v64PX-0000Kq-Nk; Tue, 07 Oct 2025 05:55:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v64PW-0000Ja-Hq
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 05:55:10 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v64PU-0003oM-Uh
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 05:55:10 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-63bcfcb800aso3250086d50.0
 for <qemu-arm@nongnu.org>; Tue, 07 Oct 2025 02:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759830908; x=1760435708; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rCIvTZGGGTDqzmDo1tWcfqGgWXa3PVzNi04H2DduP7g=;
 b=ABGJbpROkNsgJR547+7XwhXLUf8VZaJW83oWLsu5LwRhOToqTh5V4J48joKqd2JBOg
 TzSqlm5bOQk9RcZkSikY+T3DjVU9G3B6MCqD2KI9vjI93maaCL+FmkcroJJNYAA/BVgK
 ueN7AzDY432Enuag+7QeA+JLDRu4pSXLmbs6LHLSIauCeFotCqTc0TX0UlPnrxQXQSnH
 0SWiLM9g33TpROAeKLeew3PYOpVXBq+k5P22WGIZ9eacYJS9aiLYodxHEJO0CLxeJajW
 37w4QrZ/4EDHlUVzRURDSOUgULAQb3+hiKx2PNE7MGxkRYC7czeH3IHgworMPYUPk3Em
 XGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759830908; x=1760435708;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rCIvTZGGGTDqzmDo1tWcfqGgWXa3PVzNi04H2DduP7g=;
 b=KZvvj6RocVi8e+LAlDspNYTwmdh2VVjWbE6ThuG8GA7SDIwUN6Z/TJJdrZRIS9Ik6o
 H/ZrcgHMoMGSgCr5P/swdyg/hDbiL13Cq3GZS5VeOUg451Ft0I2gOz341eK8vJQE6YqZ
 xX5VpyjQ95Tvo9nmm8wpcMB7JffrtGihD3/41Sni17CMKlthjgM7AHA7L0Ph1ddBAwOM
 QSlPr9kjZ3dJZ3pExhJHA36wGmp+fLBop7z1M1UbeScDDMETxvkPbj5ZFys2LpEcDKqU
 DWCng0gtmAOUs8laEIWYrfsAyiU0oMN3ttPJ2J/9A3KKFJzbIVnT/3C1FcUhejLNcEwL
 mdbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnxKaIMffjbbDcvAkLahzS79VNa+UzlfZc2uv6bYM/skiOdh3TvfmrjV1TsZaz1Qt7HAQQ6iDclw==@nongnu.org
X-Gm-Message-State: AOJu0Yy7OeA6nuskwsyEwiAMtHK85+jIL3YMdcjlXA4buc70Jj58ntpA
 Ta6aSL9JnsToc56upCAorlkJ/ufq3I1P1Mfm1NHvp/jEVm9VTpooiUAITlR5XD1UUZYZJFSN488
 5VqYq8x/gyfd6eEMhGV0tbagY0AKL+rHMSUg5ssNdoA==
X-Gm-Gg: ASbGnctu5RVCRG/lmumBQCzHzoK5g/l5qBzXtRTQgvDYGoMzTmL/1oIFw9JE3svKndB
 oAvjgDyvjzxt5h+k+IEKA6SZWoISHoUkLeZayhDFpRPD2ExOkrhLirtwP4ycKhz1bcZJ34nQ3uw
 gg1sEs9AQ8n7S/QJLzplMiXTCyXZV0x2thPUAC9T/hsx4FN83V89XGmhV58n2ty/pZiCx4WHW9x
 yZ/0OrqE1YYpBYGvFHOBDsxucF8CnXbAFWsJQreu8WYOSQ=
X-Google-Smtp-Source: AGHT+IESDk5ZPp4UAdQuLEt5Uno382eWPQYMajQ8ytcaRfUTj+tCMf0ivEYmH/2zS2hy9AGyevo85f+5A7z+etLh/i8=
X-Received: by 2002:a05:690e:ec8:b0:633:a260:14a1 with SMTP id
 956f58d0204a3-63b9a07c6b6mr12020483d50.18.1759830907412; Tue, 07 Oct 2025
 02:55:07 -0700 (PDT)
MIME-Version: 1.0
References: <20251003170800.997167-1-richard.henderson@linaro.org>
 <20251003170800.997167-35-richard.henderson@linaro.org>
In-Reply-To: <20251003170800.997167-35-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Oct 2025 10:54:56 +0100
X-Gm-Features: AS18NWD_-HpjFXl_4LKhUYfMysKMFdgnj3jisOUCBe_jibOEOfpFbkh-YEpuWXE
Message-ID: <CAFEAcA_vn2hLx=PzEW3z8-BFZoq75Hs04FLyPD_zsrmfAyvyPQ@mail.gmail.com>
Subject: Re: [PATCH v6 34/73] target/arm: Make helper_exception_return
 system-only
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 3 Oct 2025 at 18:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-a64.h    | 5 ++++-
>  target/arm/tcg/helper-a64.c    | 2 ++
>  target/arm/tcg/translate-a64.c | 8 ++++++++
>  3 files changed, 14 insertions(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

