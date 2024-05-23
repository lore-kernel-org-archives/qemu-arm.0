Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp955581ejb;
        Thu, 23 May 2024 03:11:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWVH6c8ItFWr9vtELcXsadCBcymRNM6e6M8PMYxlANga4YIY0cvoa8ahIlkMWsSKbPSuSh7085Ozj3GCaLxC3nJsEbnsgQX
X-Google-Smtp-Source: AGHT+IHnXjyQzRZ4rYN6lDVJXI6xJXit5yMuFlODLykNdenMdv4dJSZogdYWLcc1Ru0f+7cX3zgF
X-Received: by 2002:a05:6214:5f05:b0:6a8:ef64:8323 with SMTP id 6a1803df08f44-6ab7f35859bmr42903846d6.16.1716459062881;
        Thu, 23 May 2024 03:11:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716459062; cv=none;
        d=google.com; s=arc-20160816;
        b=ChBdnSArU6DvQwP3559ABUuZlsPTNDQZ8U0juhDLsPKmXSIx44WdhrqMXp70zrBunw
         Bf/jDiCdpkDXn+G1I0pSNqQYjjzes1Mm02L0o/fCINCrBQKb2aPzcQwzD0mTWOwl/+KO
         hi+iWY5TMUsCJeAU+T9AiaztswUCuFbVNdW5cDmD9Z7OidZbs2f3uCaLrPwGywLjlumG
         TF/kcNu3CJOevxXmjwe0u35P+9NuHxK2qZjabGn1hKbUo2S7CuCiY2gSX7aJ3sQ/Sa+l
         oA05vjPTNsmTAGsKB4Chcd9/+iOpk+XGeNHUc4bpNLmFXsOWrVyXOdBVtTzqsLZmHirn
         Kt8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=c3pe79/NgUnaZihhZ1R1O0Y/eSsp+DC4yaVPYL0vedU=;
        fh=VYJtUneGOZB50yAioZdOtrc0FzqVFHAnzEUW6646I2I=;
        b=TWXSmKMenPNBNWDuGzOZQ3W2nzlW1raZuZa0DGinV2H7+F4iXeB9b6rUZ1fHeIx3kN
         U7EEwv63Ek9EOME2ucLjQD1hzlRbiQ5S4I73tz9ySwZiotwNrgT683pejJDBe9mNAND0
         AnXSOrnZSadQqAHRuaFCITaz3xKgdQAYd6aj3aUA01FrokzS8vi26//DIrBgvBpJK+af
         q5yRZK8/rpDh2oAyL2MuRQ7mz2A/JVYU/KajzJTte3/A5/ZiE1o66S4BuVEV4shZs7dF
         lx4L7FGsPvQ3qCyR09T+nPP/ddneime0q9lok5tqHWZSi9OnXQYV2VrPLYEZbOUUCK/P
         2l1Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R9Wg6W2b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6a9854f3693si7753916d6.476.2024.05.23.03.11.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2024 03:11:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R9Wg6W2b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sA5PC-0003Eh-9F; Thu, 23 May 2024 06:10:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA5PB-0003EX-Dy
 for qemu-arm@nongnu.org; Thu, 23 May 2024 06:10:37 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA5P8-0005vm-1R
 for qemu-arm@nongnu.org; Thu, 23 May 2024 06:10:36 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a5a2c05006aso582307166b.0
 for <qemu-arm@nongnu.org>; Thu, 23 May 2024 03:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716459031; x=1717063831; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=c3pe79/NgUnaZihhZ1R1O0Y/eSsp+DC4yaVPYL0vedU=;
 b=R9Wg6W2bIOyOILy8QlixkyviM4EG+fZ1qG9S/YSEifmIPn4YhATmNjAvkGxdXQDAsN
 Z98dNNBbbX4ZKBFTKuv65cYOBioXLxHk+vuNI3ohyLwx0pNjnBiqBEmXalGicHmpVIoa
 YC1Ibc9yC3PQzAGYWdJlZOEh3gHJNElywPQNexe2CTfxf0ll7LFX2CBYXhyus64xcU7O
 7e5kNpEcpUs/jbUQMOsl8JuVS8PtvkshtJ6DlkqU2czzzltYsMKMDRMoKIFngYzUDPA3
 XQL+z5soILmJdmu7izaUS81drjbzNHXYRozty3BVFW3wdilIri8VEZBYlbc6x9V8aij0
 IcmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716459031; x=1717063831;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c3pe79/NgUnaZihhZ1R1O0Y/eSsp+DC4yaVPYL0vedU=;
 b=niYty/CuVHzg9eELzRe0xZUjYeOIt+aE3zubC/JRt+j/1kXs2VetqN3w0AHDeAlkt7
 QJN447FvH6DsjrTkhPe8d2ve5b4QRHYj8Gj7lmoLTrzjxbXUJQ/MZaOwq8l1WcMEQDWk
 +jycHC35XK6jW9q2u7nCAfFqjCG3wsUEfVoPbyXOwxokYxhklTSMmlSQMqROLN66xdKL
 MZYO8w7ngtP7VOjiflf2naK/xiriVdBLp2CoxT4Ehd+6/KTlqfaJcsfS2nVueq9UeRUY
 QQ45J9vbUm6Z5d62/d0KekosU8EmO1NvMkpLwEus9ZWSWo9vn36nqN8xwr+C5n3KatkF
 h2vQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrjPshDbqenQ40f52hr3y+K3C/tTBaq9XSv69ZgDQdFcjXrKTk4Hioq+7cMrnFOer7ADB6AwyeIrpy9VtmUiGmdVLN
X-Gm-Message-State: AOJu0Yw8/cXfI2hBGCu6qAAFrZDQRitnnrpWcMVhKn+tJFVEQg/nq0c0
 FhU36g2h7hXdCJg+ognEf1ld6HsNAxtRJYt6lHTlj/ge7LsphbjdhP3gckEHnL/4fynxT3MT9AH
 xWJGltnETfbh6ZnqrdBCUPbuEgaavjVOg3042ng==
X-Received: by 2002:a50:d6cd:0:b0:571:bb79:51aa with SMTP id
 4fb4d7f45d1cf-57832c5df1dmr4089004a12.39.1716459030843; Thu, 23 May 2024
 03:10:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240506010403.6204-1-richard.henderson@linaro.org>
 <20240506010403.6204-8-richard.henderson@linaro.org>
In-Reply-To: <20240506010403.6204-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 May 2024 11:10:19 +0100
Message-ID: <CAFEAcA8adnMTVEciS34dO4psnxyfc=+GJUuashNuT0YpK0DV+Q@mail.gmail.com>
Subject: Re: [PATCH 07/57] target/arm: Convert Cryptographic 2-register SHA512
 to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Ml3gGQ7mGu2o

On Mon, 6 May 2024 at 02:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/a64.decode      |  5 ++++
>  target/arm/tcg/translate-a64.c | 50 ++--------------------------------
>  2 files changed, 8 insertions(+), 47 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
