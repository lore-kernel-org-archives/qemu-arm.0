Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1265576dyc;
        Fri, 4 Jul 2025 07:49:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVf41GCVorD3qfS2r7N4BpO02F8aBgIVdlblvJjqbjoVZzd+wlqyPYei7hW64vB37uyd+Pl8+ONnBFxDA==@linaro.org
X-Google-Smtp-Source: AGHT+IEtWil2bSqw6Uxv0HnkZVD7LDzrbqo3QRggug48TGWb0ByvlMA8Yv5IU7HlkyQkGLainBiE
X-Received: by 2002:ac8:6f0b:0:b0:477:1ee1:23d9 with SMTP id d75a77b69052e-4a9964e9c6emr43862121cf.20.1751640553238;
        Fri, 04 Jul 2025 07:49:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751640553; cv=none;
        d=google.com; s=arc-20240605;
        b=iQWTthAkkbUjADwB8I2la81MapNx69pxOAQZKs7tKzrfo6LPDr4vMD2TXjZsTUg4Nb
         IUqLyGSwujAXi5GncV4dT4UUE/WtuvD5WbXTCPE0AoBWPzF/q/vcIWajyuQZeVhA49yw
         l4w2fGeUq+v++RoiqgHzlOiysbX5vANv4WZhyzQMfmYQ+gc5dl+UYxfQYJv1CSFu2+hZ
         QRYa3JCOkb205Q62y2JjbFksJxhOMBMfz3ZC+6vDncpZeV/cd3XNew100NaxtzYeuKMR
         C9OJQ1Rucdcywl9ev4byWEWKryY/M3WxWzXzAlp0u1cbeG6Mp7nEp6jLoQf0BFSx2m/g
         H1/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=uxquwJ1KQj2ltiSQsA4aR/Z5LpXg/Wxv82in7rMxKLg=;
        fh=jJvM+DV4Heq6ZaRiEnGLMGBQnVGhEdQrt0IJO+tcUGs=;
        b=ASX839WnhsLJ9hpIP0/2FdYarYuida5DI4Au4aE4iHHCL3WJlcngo0GOg4X+HYMDw4
         FHWShbbgxsf54S92FIOEPJJZtHedFIyxNT+qaCGmpC1RYEavy64pHh9qrkLv9lQk3UIQ
         v1SF2mldcp0kp0ypjb014pwlLi9q731LKO5wR4QEY78Z9J0iagIIaGGGtTCXEpVIVFm0
         x+95B8nSXIkj2DcYigkvYsgjf/nzHVDyuYLUb+dIcnrfs/diLjqPjo7dui5eEgvepBJI
         mKx0tMLB3TGxH1SQOB3SoOqiaOjiYNxnFaQ4v4iRkC4Qq1EU4xE4OkjVGwQZDKbCQ+DR
         AEuA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LlABUHQS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a994ab3ff0si20254541cf.286.2025.07.04.07.49.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:49:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LlABUHQS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhaj-0008PW-UW; Fri, 04 Jul 2025 10:40:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXhYf-0002Fy-6R
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:38:38 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXhYd-0003pq-3t
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:38:32 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-712be7e034cso8396247b3.0
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639910; x=1752244710; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uxquwJ1KQj2ltiSQsA4aR/Z5LpXg/Wxv82in7rMxKLg=;
 b=LlABUHQSPP1TtVGYCGjpmhKRRCZ5KurD2sIJtCU0P/fg8Au976q+MkdPMy5L/7SND8
 jaqppBE4ReIeXjQXKEWHHzqRVBCGSrxmU478crIahQuCNECu4TdB7qySYNM9ryK1co6p
 B2Nqch/rzUAVZwqAesU5AvPvf9TlT+D2EsvRJRA4a2v1iKyE+hi4z6bTtI/w4ROZ3cHC
 cualhIAPibKyHrHafXLbNV2DakH7XEc6rWjVFsvX9wi0wsigc8J/lwN2J5MNGut4VCVW
 L6FlTxEFrT/vrmhH3MXWDCfwJujTWyNYoKmNb3rem+XuVYJAkV4ul7TGxwuwit6tlUUF
 QDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639910; x=1752244710;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uxquwJ1KQj2ltiSQsA4aR/Z5LpXg/Wxv82in7rMxKLg=;
 b=Kj04utNsbdE3lRHlEnhZBZtoz2lzAP/PHhMyfK21Ubj5GuFqeuYopC3wnF7tK4aSCB
 BOHVKnn+hKTHidgswCdV7zZWRt5ZQN9TilSB0UQ8N/gC9MAK96q1ZrRecvNyfS9+yCO3
 SMNG0GkRk6RZ4rmLn+tcO7q/WgcZQXEfrVXfyliuIoGMJI1Q19FU1kNrQkiNEiJOZSKH
 wvBK7vCWxyRy/bxGa3VGRQGTFNp4zEcY9fp6gOr5ksmOhff+tnirIVRThx4j8mZSemTj
 WslLG1hJFFNHcsa717edB8JHnK0I4xmidyaOlP6AahHy7EBKrvPRrh6pdb+lJF2TzvsW
 an4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsW8K/m10h9GkcBhGKO8SujN+wKr4U8knyfBLZ7egvnRnVf4tKiaWWudI4mzyXzdAptw+8xq4WNQ==@nongnu.org
X-Gm-Message-State: AOJu0YyXMsFKkSk4Z24BI4YwFO1QqofPZCbkyBr/9HAFL9AkPV3JQJca
 qGb03SH+m6HqG/VF5K/Xyvig1gx1UIR/viXp1R29xnp4cQ1nof1uCVUuRlBFfl4HCKvOqejF7qM
 07+Pk5tgqx9/DWZUtL+8xhAPGye/xLubtR9UtawgAEA==
X-Gm-Gg: ASbGnctOTEvpSek6GpjopDLXVFNKiDxhbNDlumMTadms00BC/pmMjQejwusQipETJOH
 uOdwmvJrkAuOpKpK25NIHYRzPOcDl0CPE2LhJ8U9rD0yufULPkv9WrxmK68W2/7J1lDpZmu6arv
 czpM16WGwozXQcU4LR0jZtt38uOA/yEN5uZpDxf2Iedl6N
X-Received: by 2002:a05:690c:6e0c:b0:716:4ae0:7bf3 with SMTP id
 00721157ae682-71668d01382mr33148137b3.5.1751639909449; Fri, 04 Jul 2025
 07:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
 <20250704142112.1018902-71-richard.henderson@linaro.org>
In-Reply-To: <20250704142112.1018902-71-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Jul 2025 15:38:16 +0100
X-Gm-Features: Ac12FXzsky8qIaJb2F8v95msaZoBTYWt1jv9jz5k7wUepDsSVpo-kE_raq_xIt8
Message-ID: <CAFEAcA_sSpR2E9um-hgudy6jaPGfvPpSELCWAOorbYCnizYiUg@mail.gmail.com>
Subject: Re: [PATCH v4 070/108] target/arm: Introduce pred_count_test
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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
X-TUID: P1R0cWux1zhU

On Fri, 4 Jul 2025 at 15:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For WHILE, we have the count of enabled predicates, so we don't
> need to search to compute the PredTest result.  Reuse the logic
> that will shortly be required for counted predicates.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/sve_helper.c | 81 +++++++++++++++++++++----------------

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
