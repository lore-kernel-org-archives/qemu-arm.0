Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4173418njb;
        Wed, 11 Dec 2024 08:11:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUNt3rKXmLbsi+JYEoCWRF9LG+02jtKKq6oKp80HffxXFyLeLh9F5PBXh3ZNRzdgT8QkH/neAiDhsKKNw==@linaro.org
X-Google-Smtp-Source: AGHT+IG1i/Hqoipy9x5iAZbSxV7sJHohcS/sLY6nKxR5ycDxcn9a+7G3CDISkJvvWWd41zZJBnyG
X-Received: by 2002:a05:6122:1acc:b0:516:240b:58ff with SMTP id 71dfb90a1353d-518a3ab5820mr3957364e0c.5.1733933472282;
        Wed, 11 Dec 2024 08:11:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733933472; cv=none;
        d=google.com; s=arc-20240605;
        b=eUN+PlpIsd3kX6KiovkIXK277Xx3pqsGIR4wzcG3AVtC8+36Ji+ACW93rxFKpMKo4p
         f2uG4k7kXNwaLYh1dAYP+1FQwT1cfdRRVwoTuQx3UKBNi73n8TZ1SuEWUpSjsBChyJIi
         wJ8YC3u9Fbi33Dt834KNHAv/tt7xDdqG5p8jO9Rj7UTo1JteisQmf+BpC2ZkvWDXVnNL
         96EL17lKQMYrulRhh4Q+EyJTURgK32YYi+RatY3B71vKW1K/+B7Kkrh+onlWMbloKPl6
         SQCflb7yzEb34UWgPCAnFmv6bwT9ap+K3dtWINYCu/of0cMPKaK+axzdlw/uQljyOIWQ
         hrEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ri/rJcY2OsF3Um/lTb90olwlZF8mOOn/4u8PAnArNJo=;
        fh=CB2+Gh/yVC8UvwtwheOfbZyfpMj0POzchFD3OX2/uq0=;
        b=RqpTSkGSDNOmsq0qRFHJFq4lCc30RG5HxnJVyG0ZLqRiG3yzdKtelaVlaLcKpBt8+G
         lensPY8q9mNMGP88tKIvTPvnSqryaU8+I9tzsIj7VmsEbAozRfecz6sQAQ7BlT6aksBr
         5mMcVcE4qFQYx7bmOh+nXNYr7cdOpv65m993SYAMNqEIV9zE2/g5dxKgy0SU51ZwpisH
         v3nErN1JpnKBfC83uhoW7z4b3LBVzIgsqx5xlAinLvJKUpn5250QW0yVQTluScHlAsqd
         kCdHwzlCMHYISHQSF7BUfN50kbMk9jetuNXZNckqjDGvHffN2mpsAc0z2sr6hELdzTzQ
         wubg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f2KBmxvF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-51750f8b5c9si1772304e0c.120.2024.12.11.08.11.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:11:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f2KBmxvF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLPIp-00069V-Uh; Wed, 11 Dec 2024 11:11:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tLPIe-00060x-0i
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:10:58 -0500
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tLPIb-00062D-Qx
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:10:54 -0500
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-e3c8c5a3e9dso1084550276.2
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 08:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733933452; x=1734538252; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ri/rJcY2OsF3Um/lTb90olwlZF8mOOn/4u8PAnArNJo=;
 b=f2KBmxvFNHhzf1/QPew8l3Hw9nWrbIL+3iJoHNapKgAkg1QLrluluFDN0mfpoE9WLt
 bhDV//cHRpHhbQqGUtiYfgTB70hV+q8x3VHjKEBoq8Otfq7sOShyPnh4qfqLXB4dykxF
 k+ksTC4EycNTqBmhVcW5IGf/DbOo8ld2xWq0H2VMZFvmHm2uAsqkj3DPAFO33VThDNd+
 dHCrkgdRnBxcoS6tpneTtdCRG+qIN29N6uBmV8Jv6pfvCfMXD33HJdVZ3u6iHD7+3mYa
 uc9ntlMcrHaJjbq3Jdi5E4CflffosyRh6Zdn3cZbR3goDJ1LtLfiTqsD0VFJS0+JLyjv
 NgLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733933452; x=1734538252;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ri/rJcY2OsF3Um/lTb90olwlZF8mOOn/4u8PAnArNJo=;
 b=SrNLzLbiqbAr6avZEZeS1ePRnRDJOpWXNFSSuGkSsoNqB/IXqyl+J4ApQoNxo9UtxJ
 nP9JjEIHv51nvn1loPi87/AKshnrAPUO9Ui/pLkh38acIzPXzxkaM4Zgy5c2QfpjOKuP
 0AlbdJDqyuQ5kSuj1hTJ7uXQajd43LTlIjyMOMLyngztsBFE50fDclPMNe27ckZGhRD4
 973pWYiV+scXvS5gfLCmb7SL7o9f234zKkox49w/PLm6C0alg178C0Assm3+1Xj6vUOp
 kVlugZH7z5Bs7Xv1ZUgg7ov48oAIBnvqBCwc1ae/3P38bCxt1Zi8NOOgSI4g/3Yx0B9W
 FHfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWB4PqIA/DtnbS2sUD1VMQsUKezSg7AVTENKZJLbXmK+KDwHpbt9c6ARriNtLI3jiOibbvS1vqkCw==@nongnu.org
X-Gm-Message-State: AOJu0YwHctVdd1UZkU0+V2XMLWIUiE4x7HrXzRQST0zQ3tBDuem9SFIN
 mOGo81mJyUertR5gxUSSkDmTBRqYJy91FDhJ33eiOIYl9MsimgfMFpOvmhZ8fpg4CA5UXHLy8xK
 BRNarThIjQhvcfazl9ssip4ra8oei57IVv0OmkfEJoJ8Vsi78
X-Gm-Gg: ASbGnct7v425s7BT0r8DXR11doWAe37v0GIiW6EUiOzbXNKRCFu95Sj3vKc91B+AG/t
 EX71hpu3vyzpD7PaOUMLYtjDLGzc7KL3cP0Y+
X-Received: by 2002:a05:6902:20c2:b0:e38:87bf:8e65 with SMTP id
 3f1490d57ef6-e3c8e221f33mr3782069276.0.1733933451704; Wed, 11 Dec 2024
 08:10:51 -0800 (PST)
MIME-Version: 1.0
References: <20241210161733.1830573-1-richard.henderson@linaro.org>
 <20241210161733.1830573-69-richard.henderson@linaro.org>
In-Reply-To: <20241210161733.1830573-69-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Dec 2024 16:10:40 +0000
Message-ID: <CAFEAcA9ZvNbFXoYA8nqX2Pd-BxePaF6zxFL2z=4f=w4APsMiXQ@mail.gmail.com>
Subject: Re: [PATCH v2 68/69] target/arm: Convert URECPE and URSQRTE to
 decodetree
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
X-TUID: HU+WvzYxN2O3

On Tue, 10 Dec 2024 at 16:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Remove handle_2misc_reciprocal as these were the last
> insns decoded by that function.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
