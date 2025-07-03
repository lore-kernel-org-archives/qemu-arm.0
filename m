Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp505821dyc;
        Thu, 3 Jul 2025 05:39:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX8eD98N/XzBtM2OSPIBnkztbkeemfwgSvhUyzRMcrjubh5eTdY/bdpNW8v/1DZLlOvkoJ+gD2vieYpWQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEsbjg5znWDhfUbHnoTnbvxGED7Gz3ml3fpuVNVvGjujlT6Eja4AnPD5fqhWU6ykTqtfxfT
X-Received: by 2002:a05:6214:4ec6:b0:702:bd47:c83b with SMTP id 6a1803df08f44-702bd47c846mr33355236d6.45.1751546347015;
        Thu, 03 Jul 2025 05:39:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751546347; cv=none;
        d=google.com; s=arc-20240605;
        b=CS/pd0yiTP2Y6J/u1o83OzYuFA8Lwl8CInimFbqvBmJU/JT0s4mQGwjaAUJ63RLvsC
         7kdJa7eHcnqhMIJ7pFol7+oko7uAFjSGHyKOqLajZFXItqxKtM1j3y0O7hZPQf2i7W9b
         MsqI0WM08VAIAjeLMLYjunHX+o+ePOs39mIj9scTL0L4Mf4CeVLVmy5XWCx5MuEQHUUB
         v5qbXObvVrSbHfWBvYwTJBu4LV7sQ1ALMTuHSf4+UhGjrwy1LJlzT++oqzQ1VXStkiGp
         Wm3cmT3MK3NPhTq9lHxxUnazsENz2qrmvT5sUGbDfQL7pEYjgDHgAEHESRTuNXgJZviB
         eT4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=z5jqVKQsFLT9WcE5/7ho5RaxJcwKPxiv59/Ip/X0fLg=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=j93o3HrxJSpH5UiE6ROpyarTIsfMhMQWKXcecTXil5aLrpdtFhhyG8YYFuJsZmezm3
         voTicAfvBShvtm32Zhd0gLyuw0j/yBJ8NiXWbUa9ZTTyF4YPApgPRYPf8ItHd1+eANZN
         3qB7xRYiLM5cOfG6R5nMG7TTrDeKX0OYmTn021mSJnq2pdYfrFEwMOM0XfjlPsXELuV8
         uazyvWf1d35maPdO76MaOjBCDTYhlB8pJ1yXbvCZJG2gz2FtOT8i5uEjwUf2ysAgJvNa
         kFmmB50aqxIt9BstfMOIlqNIuj70JT8tOI+gIG4OA51FRgHY/Hbrs91PryI45rki+tL7
         o+xA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OEymGMNP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd77354d70si167902016d6.223.2025.07.03.05.39.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 05:39:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OEymGMNP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uXJDB-0000Fp-SB; Thu, 03 Jul 2025 08:38:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXJCq-0008IH-RN
 for qemu-devel@nongnu.org; Thu, 03 Jul 2025 08:38:26 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXJCn-0000Fj-LB
 for qemu-devel@nongnu.org; Thu, 03 Jul 2025 08:38:24 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-714078015edso59990817b3.2
 for <qemu-devel@nongnu.org>; Thu, 03 Jul 2025 05:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751546299; x=1752151099; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=z5jqVKQsFLT9WcE5/7ho5RaxJcwKPxiv59/Ip/X0fLg=;
 b=OEymGMNPiRN9oxQM4Spwtk/eSjGTWZCnY3yDGDVeL7a2hOzEqksVfuFrVzLp8ioFZX
 KcgPBiZ9/FBQHZwan9Smu1IacNoi3ZLs7AZldcluBEkSIhdpFJcdzh/VIQTZDFGSKKyb
 u/awlDOJZnu8wyiUTwGY/+8yiUhtIeNMo+csgWXZhDsjjRJzGuuMFe8UCEk5VTUaNvvh
 Yr5LRPaQfipPiV9de53VfGTdwuqMlHz+OqOC0yZjCiQbOkTl0sEj2xyC+t9xSXbGH9f3
 hcr+1dSgSIB1Mwfx3CZqW/zCz/4nhc/WyEqYm+J6FBoVrZprFK84d/VsiX9Lu9tfUKeI
 Z90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751546299; x=1752151099;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z5jqVKQsFLT9WcE5/7ho5RaxJcwKPxiv59/Ip/X0fLg=;
 b=jSHUaJWtcRWYPkyDqHO9G1+csZbg34XxeUoUs5PeCUm0bMwYaOB5skOkPRZaXoCoqT
 7VBYmrfNMyCw5DmU1RKSuczymdaPou6npZTOCCdKaeqVLvwEyiU29kMvGqZl5pCTyM+N
 WiQd3WFZLY7DC0erasAmkYSKDVZ9nesQQD3LZ3euUMgGtGxoE7/GOIBqDy+kChzBwdit
 GeMGHspq8xDS/llJAYJYin+Pqc75CbgTFD7Td1RwYyK4HMbxvoPak6V+bPdXTmmlkWp8
 B9FfXbphp2nhN5UlENbMFIynYjvgYlKVOldRfLK5EQiLhhz7CZJ7yuoh4SSg/ageqMlr
 n99w==
X-Gm-Message-State: AOJu0Yx3xPYDd4FEEUYH/0RLBdQVJEbYK4hzCCva2aq5L1ASZmSNJPei
 rZE5aSRLxJ4d6EdOyJ19+lUXBozaUYuU1/QadYcHhtbU3BmXdz4M2zqH8Zs8yosHr6W/ikUQZSi
 jAWkyEpshIwbou4ItHXB/hd5S1V7Xn8hBwKZ4RGad6w==
X-Gm-Gg: ASbGncuC4DcpDgfMDNvKw2jhMXiGBlG0vTzlG8Y8rxbNYgM/dBTmrjLt64pYlQDMdW/
 M2ZiNMzcv0yqoSH0sRiVaOCYoGqtouu58YNs6PzpM+ie/jbTksE7Q21m7TBqUQAD66B1l5g01W2
 GLHtFoy2up0DERlWoCm+KkmSlnyGuYuKf6UdFunHkKw6Rb
X-Received: by 2002:a05:690c:9b03:b0:712:e333:d3a6 with SMTP id
 00721157ae682-7164d3f1544mr97438437b3.19.1751546298972; Thu, 03 Jul 2025
 05:38:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-89-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-89-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 13:38:06 +0100
X-Gm-Features: Ac12FXzi_wYkZcS-ImlFBFiwz8A2Y5Xqyo8PlLv3nDTfxFdDf2N-18fcNVh16r4
Message-ID: <CAFEAcA8jd4CTgJCByw4ZDf_f0OoVVtqSuF-+mvoJrEb5zGeewA@mail.gmail.com>
Subject: Re: [PATCH v3 88/97] target/arm: Implement MOVAZ for SME2p1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Ff6hxhLcFWLQ

On Wed, 2 Jul 2025 at 13:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-sme.h    |  6 ++++
>  target/arm/tcg/sme_helper.c    | 60 ++++++++++++++++++++++++++++++++++
>  target/arm/tcg/translate-sme.c | 46 +++++++++++++++++++-------
>  target/arm/tcg/sme.decode      | 36 ++++++++++++++++++++
>  4 files changed, 137 insertions(+), 11 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
