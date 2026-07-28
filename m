Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06E7C54F4C
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 15:38:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wojsA-0002nK-PO; Tue, 28 Jul 2026 11:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wojs8-0002ma-9n
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 11:37:37 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wojs6-0002RL-Mj
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 11:37:35 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-c1f5208b38dso344528666b.0
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 08:37:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785253052; cv=none;
 d=google.com; s=arc-20260327;
 b=MEiCewl6c0sAXI8TI+Z4mN7qIunAI0sC4FlrrOqkxTM5CxlqmtnP9cza3ChMp9U/JA
 Wa2FJT6wGqVsnHPLO3vBdyz+B+TZmfjHiE80WhcVtQZmMDDlTKu1LFat0BOizAVEvPXa
 WS5rsJMv7bG4n5tV277FHVkjeYpIYpPoXRqhPt7bMBY8hkHd3Geh88YoXoP+vA8FDz/u
 0t511JwXreKBuY/OPnySQZJ0gk1rSlFtE+tZ/BNietw2RxWMpkc/DOEEdY56ar3Ejk+1
 Ex6H0S326XyF3cSPbmeJuChZdJYLJj+F4y0So8DMmIG+QDdlvY7NjqOdkY6kMkKrTL+Y
 Zfbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=zSTdcJA9g4HhT9G0/MZLWhXuhZr307IuCjIHZ90jeIw=;
 fh=fJwMwDlDWvm7DmMuv7fQWdVlQrWw4dd/gEs3pbh8sIQ=;
 b=pSHuAqCBPJdk+F8PGsZ6I391bW/MYZTGCG7n+rTh0ZGXXtgsYHI4zBBiSmwt7hD/c0
 BXJ38WOeiXyuuCWVjDhf3N1ObTyqiqpGhKan7CQ7H3ACwNM9aPkn8AEb681suz8l+k4c
 Zl8kUWEzxYiHV5+MKlworzwTWrgXVwuCLfFahjQrFe+ojmmyWF9KREruVZ/I1wby8Bqi
 9v/KP+iwoqbEa1dxx2MZXOuMeHF5Iz24aEh6ycMvBo5JT/dy3sD88AP3tNApvuGrRoK7
 8ao8bx9uJhEfTVkjuyD/bSRQnDCdRaa7GcW9/xQBe5Zw6FV180Tdj7r56DV2v79OQv6G
 jhDg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785253052; x=1785857852; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=zSTdcJA9g4HhT9G0/MZLWhXuhZr307IuCjIHZ90jeIw=;
 b=GeKzmaDrgj8kWqRi7WDG2Gi7v6Zx3py/NNGfqNIm9n+eyc41jReUFj2afZZde8uFCA
 VyLdrqrHVDaYuCUJxQYIzikshMZ9F1aUCjVEcXo12ClXe4fnscbc4DdlG4dMVK7EgSdg
 Qcd42j6wUqZUca4Dv6biux4xtVbi6lJO/44HkSWelULSGK+u4brJXOG0xmrfb0CQlXiR
 ZD5Lk8Glxdm25IKjFdA8/G784NULXQqqfq2fc3PVi+KQDlDpovI2CbwqAHzQGWPp8Qep
 DeZSp4mioQmFxSsn8U55+snG6hNcrxvCKkLevTeznQOfTYpxvTXukwlYO+Qx4b5S7QdD
 hfOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785253052; x=1785857852;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=zSTdcJA9g4HhT9G0/MZLWhXuhZr307IuCjIHZ90jeIw=;
 b=T5d4kztUfhNsjysoOwptkTo0qNBSNUXg5pEwVztU+nG/JCT+/5HUS25vXbNTepcWmP
 VSKEckTh82O2TELSZsE8Nkw+RxFmg0RwCdfVnBUmzO5xfHtkjVhlFjWIbE2eKiOaUjsE
 C3Dl3Y2HLpmrdMDAUVuhOaKi0ayzKmK+yB7KoxyHTTA3yzJiGfVGelhCEYWk4Tna1a8Y
 SYbOEZRyoiv+JUoJns4ecNBgt4zSexaSu0YZkGcohGHvfv0gS5zuckJAW0Um01PlKzf8
 JMKEGwSQmC91h4k3LLbRkcBChuN4zi8oLXOA0fXWYV1cJKdzG17OS/zUwRfGFIidvdXa
 h8BQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rok6jdVbJv9CCI+KKW3He15LBZwQkEwviExo3yHhh6ioeLTLCuRYw7rH7kNFIxiQ7cXOD0RPlaWVA==@nongnu.org
X-Gm-Message-State: AOJu0YwkQGrTCQA72GiE7hSs20yG/kDhK4LEvbZVIpR1SnrYbqvUP+mt
 2ToBvcDLFesM8himjQdTk68gylpFv8ncdSeBtuFK0OBog7KW/PwcYgdPVqC0ZAzmHnyhDlgtbMf
 4tXL9AUlaK8chp2wNf//zeZeHVXyrgomUOzzUBiLQMQ==
X-Gm-Gg: AR+sD13zwfA5V2iZPTcZGzI3nXrTPAghf93Zn9MijSd/602ACf4Ur6KYZOJCFS7lgwy
 XCuZdx3KSUSgeOxuA8zfG0x4eb6A89nljHwf0V9B3B0xrItB9JNKwaYcogHiAOJK7S029II3vQO
 YziDI6hBvheQwb+6a0O2tFoR3mQC/e52xG8Le8Mmtp1i+SueL7PWSczW6EHFWJqV44N+KfN0EBa
 RBJWrAy5HR+k5Delyt0sxQWiEMBUDHHD8WlZPgwaBzcYfDEBdX5G3NoFcphH5oVETDX3NqP/xi6
 zUvTK32eAkOsGCjuwEYK+yq5a8UqNc2wSZfrgIXjtCyQPQ==
X-Received: by 2002:a17:907:97c1:b0:c19:5b6c:945 with SMTP id
 a640c23a62f3a-c1f71d3dd86mr154421566b.18.1785253051734; Tue, 28 Jul 2026
 08:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260721184656.530230-1-richard.henderson@linaro.org>
 <20260721184656.530230-15-richard.henderson@linaro.org>
In-Reply-To: <20260721184656.530230-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 16:37:19 +0100
X-Gm-Features: AUfX_mzYFdh6fT3FOs9AFpT5G0u4R60-lewgZrwcYQyFEbgo5dATiZ5PVf-euM4
Message-ID: <CAFEAcA__Qh1KWcuZ9vZTFr7CgFwfP69QGZYntOutKqEh0YK4sQ@mail.gmail.com>
Subject: Re: [PATCH 14/20] target/arm: Implement and enable FEAT_SSVE_BitPerm
 for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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

On Tue, 21 Jul 2026 at 19:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-features.h      |  5 +++++
>  linux-user/aarch64/elfload.c   |  1 +
>  target/arm/tcg/cpu64.c         |  1 +
>  target/arm/tcg/translate-sve.c | 12 ++++++------
>  docs/system/arm/emulation.rst  |  1 +
>  5 files changed, 14 insertions(+), 6 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

