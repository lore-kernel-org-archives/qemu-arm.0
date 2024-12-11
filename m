Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4204503njb;
        Wed, 11 Dec 2024 08:54:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVRpOh0Cg4FFBz6qNyUgFOfsbOV0p1iGyP1EIWh/CPzyNoHccRPaxqXpxkQZt4z6PrHstvTQ01pK4sE+w==@linaro.org
X-Google-Smtp-Source: AGHT+IHsYHOChLiXks6QSEZN3t/b1HncWT5jtAIXi2hgOoQYAUCP+AI8DZAORVS6xwu5/3+IVPBQ
X-Received: by 2002:a05:6102:2ad4:b0:4b0:c214:fbd6 with SMTP id ada2fe7eead31-4b2478e4fffmr187409137.23.1733936098495;
        Wed, 11 Dec 2024 08:54:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733936098; cv=none;
        d=google.com; s=arc-20240605;
        b=WptEVxKrDqjPxVLg+WvgFERBrzaSODJcCd/x8T9h8rNyRq/a6OSeUFODxoDS8v0ydl
         RZL9q/HWFSQ93AY4ev+vFov2sHNpiDjnMbhspMrDqCQUlDAJdYVU5BF9Wp4qz7+nJGwT
         kV1Qpirds23uS6mYXoLurxTMqhRONvLhklxL3vy2j8SELOnAuJVLwaUr636YoOO7X7fH
         oQwBnX8vLh1n4eR9qNlKuPt6Fdx0QBxDjF0/KY9KY4XOPPkq4H7mNe1AcAtAjwMJ80/+
         X44T2tTOYx+nTtyo96+ud5MAnuAaNye5+UYrLp8bNIGSIP8GKubiLoVBvH7uhTzoD27p
         JkjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=r1US8HCbPSTdlPt7AiAeBmc22Ii1leBluTUaRfuCUB8=;
        fh=idEYhDeF5AdhZwfN2duOylWkxIfUpFBvOeNorBFf8M0=;
        b=NMMhS05X7k5EK6qZDrxwWrR75XpmO/fX0CfRiqTb6I5po3QN2X6vrwljldAe4Iyj6C
         vEFxoDhCRruzH8GQWfODFNMOS5UZM+z+VDi/TZa4byep+yqBqdPRLA9h37Xh6ThJcYgL
         CnL9lIirj46y5VzIVjR3wQUk2M7m3w4B8AN2+uN/RR9kk7vsRJes/E1Zuotwqk6T+zAr
         6manmUO1eXwDsdBmZtjzyQkb62JRtQcX4gY69E+1xRGfHStVJ37JiSGgSbwpl1+cK6Zk
         55iboeqdSKUwzeoNg5lSNcR66LTaCe2eR0FXyPm6WGxQEn10dOYJ21Dc3gVSSO1ZMHEq
         8EFg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CEKPUKwo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4afdedde653si2277657137.212.2024.12.11.08.54.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:54:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CEKPUKwo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLPDD-00015X-Et; Wed, 11 Dec 2024 11:05:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tLPDC-00012R-8N
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:05:18 -0500
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tLPDA-0005EF-Tj
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:05:17 -0500
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-e38938a55e7so6543747276.2
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 08:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733933116; x=1734537916; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=r1US8HCbPSTdlPt7AiAeBmc22Ii1leBluTUaRfuCUB8=;
 b=CEKPUKwoCi65uG3EyPKki0tqgnbQ5lp6jKQxJnIFb69vceBjz5whHE7+n8ebE8Qu03
 AZfj7uv+ItGlZw6o/bPSbOUHelZCG+PwOs2jv5HVtLY/jWLMROOWIiX4PjWV7karqDP3
 i4KE6P5UiMhCXotB6GWJuAQvVloehsL+lrb2LF5XxaGcW2xclOIw5Dn8t76yyrl4/8lW
 kDRAzaqHHqnw/WZjBuXTgXnrC42qdDIT9ib6uz7vnLkS3GAlUQTo8h8um305hTWE6JpM
 IFdJKXSY0fRhPR/E3SbJUkIuxtG2zsfgCl6b7Pp2UVvSBeREUHS4PkCSUbfiFc01sb5B
 IQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733933116; x=1734537916;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r1US8HCbPSTdlPt7AiAeBmc22Ii1leBluTUaRfuCUB8=;
 b=Vcj6E5S3zsaolifdR136fRGG5GwVnQPFz4Q6ZRyDuFpkLlgnzVq+Jcw7NMmqtzCljL
 DpzKfizL+B8o/9qykn6YgCU1pmENrmtbSi5ZsBAOFbJjwkTdZkbD07sPSYCnusJyHSfe
 KPGDthe8GrS98hccAoiMJOWVS3Fe1VIl86/2FtKWiAIqxbJCUQnMi0cY1BizAoc670Yl
 AQriQO1ggs1doFJ/5aLU+ORwnipbWku2atM3sPlgNRKWIC2ZrFAiTc4xL1UqW3M51Txf
 akPQvAPRARsRz3ClLjhNjjRpdosZ7NiLYDlP2RB/Df4K6czl3R6HkVCGgpiLTajAl9HV
 gCtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPIUZChsmstKvTF36WAjDaZ9OFxqkT5B8rL8tqVxXzx9m8euOmw6yb9j6KWJ8M++47duH0ZAl7pg==@nongnu.org
X-Gm-Message-State: AOJu0YyXWpYRW8xOGwEoLT62tAk9IRvFiMvRo365PbPbtrVsJ5b6oD7u
 J1IaAnSWcIVtyV5wNKNCuxKCzknUNvf5wFAEvVrYuUjYtrD39YeQYKtf5rVbw6yE/46rfSfH3BP
 +MuEFiGAyi6qMoAjGt/OAdDjr0O8gkOd+Pd2l15z014r8g5Kl
X-Gm-Gg: ASbGncvtBubz4AVi4ChbToLRnkHoUHitPFqvRHRoK/VFql+/+ARxx4zUMXm5kKYr15V
 AOlHKBYoXQg3HjTQCg1D+0Ay+ZNTt7PO0sTKW
X-Received: by 2002:a05:6902:210e:b0:e39:6c6a:f2de with SMTP id
 3f1490d57ef6-e3ca057c844mr349466276.47.1733933115734; Wed, 11 Dec 2024
 08:05:15 -0800 (PST)
MIME-Version: 1.0
References: <20241210161733.1830573-1-richard.henderson@linaro.org>
 <20241210161733.1830573-61-richard.henderson@linaro.org>
In-Reply-To: <20241210161733.1830573-61-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Dec 2024 16:05:04 +0000
Message-ID: <CAFEAcA9=CsKJ8JtMO8ocvmL6odk0eCRwQwm9V+LAOa0nRphB7Q@mail.gmail.com>
Subject: Re: [PATCH v2 60/69] target/arm: Convert [US]CVTF (vector,
 fixed-point) scalar to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: zyu3bsJAyXPV

On Tue, 10 Dec 2024 at 16:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Remove disas_simd_scalar_shift_imm as these were the
> last insns decoded by that function.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
