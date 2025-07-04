Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1263410dyc;
        Fri, 4 Jul 2025 07:45:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWxhgucCJb88N6k14uy1CC3JGTLPuxB5AAdP66A9GFKGM7EwqYnPWfSIDEZ9mtlLirO5ZBZ3wjO169GKg==@linaro.org
X-Google-Smtp-Source: AGHT+IHscKche/W+zGGrphX2yu9zBwcrc0Y763yw1VKe3m2040w0/DeY/5P6RjJDWmW5NoDA3sGA
X-Received: by 2002:a05:6122:926:b0:531:39a3:e94a with SMTP id 71dfb90a1353d-5347e6d6248mr1758128e0c.7.1751640316057;
        Fri, 04 Jul 2025 07:45:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751640316; cv=none;
        d=google.com; s=arc-20240605;
        b=RmWHzNy9vm8N1+VXDfZ52M976yqvPvaIeKza4gDtCxgSGbIBICMuGZCcFTJNGTBwEW
         hKru1yBNV8Ri5Sxol2kmSIiABlyCyfEyM3X3WhBuOiVfBDCRiWOU4OIxzgp01xK4oJ/H
         C0fgnOW3qwzAE/HK5r6kTmxo9fvQj+23Vd7Zzyj0Ergl+7I3FHaJCqCpvEKWKjvMVHgB
         CS8PlWUfpb7puuLvTj3lPO0KhrO/tJBzEeTgGGCVu5dGQSHYWOP9kQfj+IY0Tb/kNL8m
         28m6jJpSnQSOlr8vauH6/kOl9jbNofWli5OIGwGZ7UbFVB+3qsz4xUpupxaUBdjq/AOT
         WMtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=XvElrBv4S3LZZQGTL4BtOGuUOsWbtLOuW+muuK2sDsE=;
        fh=CrP5UUJTUnxqgvCeNxuys17Xrcl4yf4jJj/9nOl+vUM=;
        b=i8ynaR/TzLTzQwYrCMdDiS1iE0Qohq8u3Yd7In6UOhNrItELfJ33ZbCqTLNG7V7sjp
         VDknO8fVl8aaPcZhCDAUndoArUg0fL/PeeqEn3C+eUAsXhC/DJNBeZIeFgVRdSPDK0Dp
         01jcwWjyNEPjANWYMDDXtPXQwvI8+/qybKG34u8PzKsoczVBNZnqDND4+prYZd5Frvb9
         EczrnqMgZINQT7ydYBR4nrPWYNADw4pwMgxQwl1g+NwcCSaitbvke9U77kbhODAjmx2O
         6PvF4gzRF++JkT55bdZRX8NgcrtiWy3k8KG5fT+0Yq//E5oJ/FMnYeR8uX7v/iYhierw
         y+zA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OMWIllw7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-534790fd2d5si707282e0c.156.2025.07.04.07.45.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:45:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OMWIllw7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhT4-0000nk-DH; Fri, 04 Jul 2025 10:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXhO0-0008QP-6E
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:27:33 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXhNy-0000iH-IB
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:27:31 -0400
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-e812c817de0so761440276.0
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639249; x=1752244049; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XvElrBv4S3LZZQGTL4BtOGuUOsWbtLOuW+muuK2sDsE=;
 b=OMWIllw7pCm8DxtgTx8ujpD3KwcPH+00H/YjCkzC/pVSaSf71UEg2SMiUt+9ap071L
 JQY3aFB4JEU7UoGAkZUXP+Iw/oksmoWcL50ct34sd75NBTXEMUj3TdgHHFY1IdeSyapO
 EAwHPfbGnT9+YjUXpM2hR3Sdm93fHlK6aMJBraf2IgoPJ0S4G3mSCTCUBU49fMTJJprQ
 mitZXYJ9z7Is/YV6ksHGmDrfkW1wj20NCvNMeFr6jozxg5YToFN0L52GTlN5mibxq7Yn
 YdReXBxVIcCuTqmVBDQ/E0F6vi6M85JXZnI6EvARCzfWs0j8L1QksIR0M6Gw3lNhcxF1
 qCBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639249; x=1752244049;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XvElrBv4S3LZZQGTL4BtOGuUOsWbtLOuW+muuK2sDsE=;
 b=tmFvCrRuGNdEOKC2yyWzaBvRRTUXx3tLvmgiHxmDut7CVP+m7HmsKnoOcSm0R2gpOu
 8+7nQFqK+wIrMCLg+MwqJv6SVW5CSR7vdWWfG5Jv6ktJjTWUmhkB8A+ohFNcERYaD7gb
 pPwjM51SiZhSfZdlgwZ4wjQ0eBYC3/AdPjVpXOVGW6aKaRSLfe3hDWS7i/4HJuIvzgco
 Z0/P+zoIq1eBTbwaBz/eF775TLQfBQu87DXVrgRiuAc+T1jAkztbLF97wmXbEjzoCXb3
 DgR20E5IQyCAngnMrNLwi72NE3ZH6jIYB4zIVdEAp3W4niJ6XOiHdbGoN22DbofYXTFh
 3mLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXa6QpOI+bavybzTTcy3dEQmvCn6G3oLGfL4ASvBnLbKKUK/+3ZwpXf480GWEvtglE55uzgqRIggw==@nongnu.org
X-Gm-Message-State: AOJu0Yx+oTC59IKMkv7TfrU0trwlyCVYFaT02cY3qJjStnby/d5pYyk2
 fuyVrd7v1uHRIiHHa/vaOFRVNoQidSrgQJEZ6Db9Kmc5c65gN2OZNKQwUGUCI4u8zFDciAm0tBH
 jpRM/2trNISJZhukauQ3oFBplcNVYrwfISVvtf4pi4A==
X-Gm-Gg: ASbGnctB3B+xIXK/2S6Nw/bW3IzFMk1nE8KNaI2CYwk20nnw3BbSqH/vYN4lfnbnaVq
 tfONDFPF3akxbZahZ5qfpPQCe5s7jI4miBBQhxvmS3ec8FqNZAAumLSxAVT8gXxxTFxzokfIzcH
 joxBHNBTy6EpYFkDwUXFhP9TA871kizoQMmY0tqqozv5X7
X-Received: by 2002:a05:690c:6611:b0:714:349:583d with SMTP id
 00721157ae682-7166b5db42emr24805037b3.8.1751639249247; Fri, 04 Jul 2025
 07:27:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
 <20250704142112.1018902-60-richard.henderson@linaro.org>
In-Reply-To: <20250704142112.1018902-60-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Jul 2025 15:27:17 +0100
X-Gm-Features: Ac12FXzRGJNlPmPLQGfHEoj7p8j-oGJHSalPxr_BfdCdxktt_0Jn0hDwKX0HzfY
Message-ID: <CAFEAcA9SBty4fj+gY7XaULs+kRHm2VVkFpAPkYt31+gPJ8ophw@mail.gmail.com>
Subject: Re: [PATCH v4 059/108] target/arm: Implement SME2 SQCVT, UQCVT, SQCVTU
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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
X-TUID: haVqWMqu+aKZ

On Fri, 4 Jul 2025 at 15:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-sme.h    |  20 ++++++
>  target/arm/tcg/sme_helper.c    | 116 +++++++++++++++++++++++++++++++++
>  target/arm/tcg/translate-sme.c |  35 ++++++++++
>  target/arm/tcg/sme.decode      |  22 +++++++
>  4 files changed, 193 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
