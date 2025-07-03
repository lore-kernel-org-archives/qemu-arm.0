Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp511874dyc;
        Thu, 3 Jul 2025 05:50:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXjlkATgptLjqg+XXuJUKUnOh9twMWVkImvFkGEU7ZHCz0CejohQGhJQxG/wONX+lnptNWtHvd0vk0Saw==@linaro.org
X-Google-Smtp-Source: AGHT+IFFOHp/O8BWj0XUqr75lvpfSyzyqvVBCnxwUEbRrfjcLb2KfDSVlnyLFhWk++hNLiDFpglP
X-Received: by 2002:ac8:5794:0:b0:4a6:b603:c37e with SMTP id d75a77b69052e-4a987bd7e34mr59686771cf.2.1751547055210;
        Thu, 03 Jul 2025 05:50:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751547055; cv=none;
        d=google.com; s=arc-20240605;
        b=SqfrQ3eW0L5sLvEZi5YcQk1rM2qYPJM6dA+llL7Qh91vuUPPlAhXwAmHDiSf4BFZ5P
         Fb/04jhNB4BvoszNkhEU7w6hvnucVgRrYFBXm22q7idhTS9yIdY6mnpM8EZAAUxmqj9L
         1hh0VjNNwSapRf9KZ+L6OHzjP+Uw9z8u9R+LWelm3iSidv8JoGLutBjV4+vECkn6LdOT
         mSgq878MwkIDY6INjIk+R6tB/8qGCxlvq9irzQUqcS32bPYlhnCLnXjUu+qLBS44YyzT
         j8SMNaEWbo65RhQAf1dQhb3liyk6rqyb4RjGw+4+oXtW3+cQW+qlkgKXU+q2gVNF/Xav
         8vKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=JOrJCOIUmEfP2olDRNnMPHIJRSmlp6Zlg1mW5NE6H3U=;
        fh=261ir0UpnXbcio6C7VLY6Etv43ZsZk8g6mhn/s9hB+I=;
        b=NvCZmPyJ+xcZW9GNTd4aNbvOsjlepVo73JC1IK2waEawe2jYeh9UPLGGAykWeaVrMI
         Mo5n/vTHqaPcl1+fd6EMO/JukP4nQqNJ6YS32nktc0/C1UwMs1tVNPuLHMtKwEx4o9+O
         Fky9ZnAMwih3wuFLSbX223LbAy7HkT7Ci5Mi+L+n/QxR4DV1Ysn9HJWOgKxM9FXQKd3x
         baWp+35iTxrpmyvHRwmMGWCKmAkwSapFV+zlTjUm3+CCLRMXtXqI8zbvNNvjcqMEwWkD
         IkrGh6x+fUXUvC+bQKuC+mOS874cYQgiRzmHniLJsRdqhfqCQEwXHQUDHmOBKIeP9Tcf
         yvNQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="g/5+PhCm";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc12baa4si154938861cf.158.2025.07.03.05.50.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 05:50:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="g/5+PhCm";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXJLS-0005JC-Vh; Thu, 03 Jul 2025 08:47:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXJKv-00051a-6l
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:46:52 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXJKn-0006Ix-S2
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:46:44 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-70e5e6ab7b8so74905807b3.1
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 05:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751546794; x=1752151594; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JOrJCOIUmEfP2olDRNnMPHIJRSmlp6Zlg1mW5NE6H3U=;
 b=g/5+PhCm1TzSR0MJ1VTQe4x14GBQ0x3Ba5Y8PK/Oi4pGk2rEky+YiHnF9HHWyo1n9m
 yo5wlTk627UAvDzKNqZkbVYKSJtVxq4sBdBNaVYY2jbfyMFT68QuKuGr0BiG5L9nB6iJ
 Sg+uI4FLUE1FR90AenALnJtjqN/WO2XUDIdmxifMnDiGR/+ya3PqlBqszdTUaVrVzc8e
 UJfsOTgH7WS/IzQISNaNfpb6YisjUsQh2NHrrco+whP49ElJ1xYXjrqLqiMINdbX+h/f
 umnCDdhYjg54o7HjiBaEJ1Bz+Krfxe8FIJUc2ybhNTzq2+Zte3RvKwC2HRbGA8mlcsZe
 61QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751546794; x=1752151594;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JOrJCOIUmEfP2olDRNnMPHIJRSmlp6Zlg1mW5NE6H3U=;
 b=n1skri/4Ui9A8XCGkxzixFSjSiSJ9TKwofrOs96/ipqD3suza6AVIE66GilbsA71qq
 f8EPWZx/qW6c8G/G5tP9dxDBK1rZvcjauzuB/jLHtzeVBnE4n0AbaKW0T9TQ3nf1pK70
 G48AmU4ttBQLPhEbHoz7pGnDBcZ3l2IxjKXjIdLd5MZRJ5TvSrtB4yZZG/0Qk76JhXo3
 yHyhH98zaY3FoImpSi/HJI5eFGTptnYUzBQ58hc+x83I7bq1KBM27hx5YaqQJQkWprKL
 uNub+LlVYD6bwRqBd8mGKWHMZXpLElWeTCJml+tY0A0D7KZBTrX7fPklpnEN0CIIgqP0
 mxZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXt2oExw5IDP3AbfdjkdGcty4kAo5FfDFENAn3dy+G9UySQLEMDr9ewVvDO4EgGiR8cbj1mEo6EVg==@nongnu.org
X-Gm-Message-State: AOJu0YwVc1ayaDCK5f8QKfYWYdsVr4K5cbKt8HbSlRIbYhc/0d8Ld/N9
 q6mkzd5W7Mv4YPZ9UanX+GM6+1W/wCroNJy6Midpnab7sDFEXIjUTIJsy37SBxVjM6kkoyfRTUs
 YasMhyJ0LtPbcix6cT+vnad/h9q298Ab1E0eVEIHFbg==
X-Gm-Gg: ASbGncvHZAF1gSfKUo6h1z+kM1jaWjgP9+HsOOnZNaPtuVzPlWKiGfeXbcruf2Wd868
 JHuSQCF6z/zJ8LfNzWOArhn9H4nKupcclwWEtuHFXAgjtuULyRSFUcLOxwBjcxKFR71GE64k1GA
 mgiLdX2Hzlvd+xLHB/hZHZ6SL/0R3tUA2BBNMdBAzGRiuXRsfdcvE2ki8=
X-Received: by 2002:a05:690c:692:b0:712:d70b:45e2 with SMTP id
 00721157ae682-7165a32017bmr43067677b3.6.1751546794246; Thu, 03 Jul 2025
 05:46:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-96-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-96-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 13:46:22 +0100
X-Gm-Features: Ac12FXw4WirIZaBkfODPplx9uKHRpMjDzmXVdom_D86T3DVnye7DIPBNkXik0Ig
Message-ID: <CAFEAcA8CjHXd8D8V4vWyvprBG+xGDOgRmMkWJ0eR4jDHqD-3pQ@mail.gmail.com>
Subject: Re: [PATCH v3 95/97] target/arm: Enable FEAT_SME2p1 on -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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
X-TUID: ayZVzFSPY4Mt

On Wed, 2 Jul 2025 at 13:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/cpu64.c        | 10 ++++++++--
>  docs/system/arm/emulation.rst |  6 ++++++
>  2 files changed, 14 insertions(+), 2 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
