Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp968832ejb;
        Thu, 23 May 2024 03:41:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXQWBhKi7U/5xXDdULx0KtXBXyIHCUwo5bk1YN5RY0xYRy/VOLIiJYzhUhYhXQYSsaWtAteRIXZjy8IQAOr0T4w+mj6NYWV
X-Google-Smtp-Source: AGHT+IEWMKysfrhAvQ7PRZvVivU8xcUdop3F0SZcVoIBWg5Yc+G6TrhUNXbsCcyvl8K/tFUcG0lR
X-Received: by 2002:a05:620a:2902:b0:790:77d4:5e7a with SMTP id af79cd13be357-794a0963a11mr323385685a.20.1716460880111;
        Thu, 23 May 2024 03:41:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716460880; cv=none;
        d=google.com; s=arc-20160816;
        b=DkFXK0XjvhKsrwIO8/1S7QTiuJhWqC+q1RUKPQERDCe2jOoXKi7iKvkORALNdRynSY
         1MFBVC+mPmPxQieYTk7HNjVGVHRSdb8ff5VU6+ds4xraWd3tng7+fp1i6Oy9V65pzVr0
         2JLiG3c+lgfech7uPYn8/K2ZwZ62WitYKpfFXz9H0gGIDzogrUrJvA/ML6mH8Ccf83Fy
         XEN0ZFntNljb7MrHkhajcea6KXuAsQvTifuKrPLaqDWx5aXTjcOFpYvWj9Pxtgsx3M+s
         x+Ty05OzwURvODm4fGWV1h0AlgCHWOqA5lIrCMUEgwCUbfrLYcGbn/+1uNYLWoYaD2kQ
         TQDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=+dPJa0TCgok+810qPb2xUJAjsfW/V6jy5fSIXRbjRA0=;
        fh=TuHAY29+9lNXuaKfRJLUnueVQDrbvQKZcoZuaVNSRl8=;
        b=Po4DJqO2Ko3IfodlHNe690tnwldzl/CIvyq8QEq1HASRCE/TnEYxSeZBdH/3XRxHu0
         mGlaYreb6WMEpF7EXikue5Zu2gBQ5YDGMm5oDYzkO3fjMWkgfMSaCYpVHRL5rvUaiFBt
         GReR6tnRa5ypTpbCp3Q25Ts8A3G4L97up+YOP1l3NUZ5etmzAxOnTfcf4PiobF93i71f
         0UiWQjKqyPNN76dWoW1q5+j1x5ddE71Rdr+MwOrLk0B0sirqJwIQSDDJkoco63Ofh/gc
         zei2pb50yWVzXKSumfg6bD4uPNOkSImG0rFanjicX8Xt39G5Zfk5+O6FKkD22nDRS1bx
         m91Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HskVJnJd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43df567098esi62862391cf.318.2024.05.23.03.41.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2024 03:41:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HskVJnJd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sA5sm-0003Qd-Gj; Thu, 23 May 2024 06:41:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA5sc-0003LG-4q
 for qemu-arm@nongnu.org; Thu, 23 May 2024 06:41:03 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA5sa-0003ZS-7j
 for qemu-arm@nongnu.org; Thu, 23 May 2024 06:41:01 -0400
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-51f0b6b682fso8178430e87.1
 for <qemu-arm@nongnu.org>; Thu, 23 May 2024 03:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716460858; x=1717065658; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+dPJa0TCgok+810qPb2xUJAjsfW/V6jy5fSIXRbjRA0=;
 b=HskVJnJd1KC5PiK3aa/T1tQ3vYJmbrM/Rvkln0yI+Dj9aWmLo3WR2Df0bhL/9eP7TV
 UEH7JKn60ABu/oSHSCLMlHw5f98l2v5XfXtZcLLWmXdqE1tyE3RS3n45KF9TdKUqXqVl
 BpUZ59cQ4CSl5rjG0fj+Z3374BSucG6/3nBPlWHLf5TA+pxIWJnaIeJl+5ldFO23e+Kx
 EPzgkx6HUIvE52M1i/bne6WwPfXDL09rzbI9rr+9a43auFgmeXh7/nvq9//TK5Yo+SMN
 fCohT6HIlzjulO0b5aK246obVTg1tVWSgSjwBO4lZNVT8zZDn8QIH9BuAnqo55N72l3b
 VA1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716460858; x=1717065658;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+dPJa0TCgok+810qPb2xUJAjsfW/V6jy5fSIXRbjRA0=;
 b=KfDSzVsavFbC+QLpUMPWq2hwBa/2IADzYIZEB+G6eJFQctBWew6yQ6OtnQuMp6xZeL
 fUwxcJ4MRRd94+I01/e5SMzNhwL3drPbwqLWitDy5bvH6HgxqBb4j90WVj53yseCz1qa
 P9lzxe54NHvFihT4jmAhe5UzWyvk9ddZfkrxcfh+HbVzAL+nXTygavr9fVVm5ceB+873
 ospxgfcSOCszjXHGV9k7OinbPHNPVLy3kESmzFx1AqvNg+TzbRE52GGde4tTpEyXFYsu
 uCxHvCfAewKL9u/9D4nRpsFzEnzE4aer5nG75ubCbIyJAQzVu+oX7L50w5GoR64df/Ia
 z4rA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKHLNTQ+UXM1xcmCrhCAzUIRlE/afJ3q3WK1zWzjY6o2r/kgEJlNGLpwxGRdjdWoUt2TeMVEm4JuIgp5gqAtzee0QF
X-Gm-Message-State: AOJu0YxEx0cIZkdV20x4vHX7DBMdeaACmVLTLMlzMU2ECkpzjVdGpe98
 kyY7+5yUY4FOLpIb1rdQAPt2iRBN3UHFczqA/cKLjd3mBUfmvxgpFaE+SZzt8kJLPg6/HRaWUXS
 pj9fN/oN1jjEUUNnFsI2cagQnpLuBDkSY+ypyYQ==
X-Received: by 2002:ac2:41d6:0:b0:522:34a9:a7e7 with SMTP id
 2adb3069b0e04-526bf26813emr3825015e87.22.1716460857924; Thu, 23 May 2024
 03:40:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240506010403.6204-1-richard.henderson@linaro.org>
 <20240506010403.6204-11-richard.henderson@linaro.org>
In-Reply-To: <20240506010403.6204-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 May 2024 11:40:46 +0100
Message-ID: <CAFEAcA_p3c-NJs-JeKM4fL-Ry=B4CkO=VAB8=DuShVoXC27tnA@mail.gmail.com>
Subject: Re: [PATCH 10/57] target/arm: Convert XAR to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x129.google.com
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
X-TUID: DXBJxsMNcGnN

On Mon, 6 May 2024 at 02:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/a64.decode      |  4 ++++
>  target/arm/tcg/translate-a64.c | 43 +++++++++++-----------------------
>  2 files changed, 18 insertions(+), 29 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
