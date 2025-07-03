Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp401545dyc;
        Thu, 3 Jul 2025 02:09:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUtFmH5zXIeqCKAbLYKOeAOBb3+DYdgkksPjzyLpLVk3EhX+PzHg77W9PVVlEe+553Ona0LCfaNPqWzYg==@linaro.org
X-Google-Smtp-Source: AGHT+IFANMXlD+PjNNsrPl8NwlO+Q4kcyavdIC7VMBn/YXdvRCLNtPL37aaf9wPijYg8PPYWFTxw
X-Received: by 2002:a05:6214:4486:b0:6f8:f1a5:e6a4 with SMTP id 6a1803df08f44-702b1bab0camr105393536d6.22.1751533773693;
        Thu, 03 Jul 2025 02:09:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751533773; cv=none;
        d=google.com; s=arc-20240605;
        b=ADFBVNY1Qix9209/59a/1XrrQy320D57SId0gNBzGbMF+I/UMikxj6EQBkVqdG05w0
         ncmUojEO2CWnRI7nq0aqY6NLRHOJOJJnYLhXlyCkwEkDXytWbPGDGl0H2nR6LX9+OcNg
         kfkqytIQ56ghVDuO7Y7wCZuIVUz465iT67OaEfgyT7/UO/QRjCSaw2gBiEFlCYpvmkmn
         QyIhXyCKXtVharhvS+hVWJrEflsR7rzPx6ZYk1Q+KpArnbgd83ZI65U4snOag47hLh7N
         qyIP/DbT863lXJ4bK9j0d5C40WJPsW6yqOAEtaeqD6ZGvkJUI+0BpKichardcgcGCtky
         J6+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=wz0yTYttiw5SfPbbLkMOcZ7w7E8uJtXqifW6IrGf/7U=;
        fh=OUfcaC2TayYnLtRgKOKKVxKXWqv1fkzA0OEkOIKupE8=;
        b=NZmDDtKXLqeyMF/0QSfOrhJRv9Uesy86pzYpeFeEUJLZnazLyVzmnZBdgfWo40Tgfy
         B0cORYnfXAbxbCif6e4LUWgpu8f/JP70FE/KGoz+OyDmtEcqw/O9itvnAU8Gw4iZBLNb
         GPJrhXaI76xq+HF5t8FJwrLCVuKVXB6suggYNJ/iM+BGexj1R8wrrzdVSvu9BQpgF8Yw
         U2HCYb5Hr3VpXT8CuoHAXXVkVOeK3xWQcsIeYrfeVd8lwnNDptpO/fGG/LTu4mBa7/Av
         hMs8X5Oa9RMUvRB5Drt4TB/f8Rt5asQbB/01iQY2pr/IpKoPxYusZnpzXGlqVzFnKYnA
         MNEQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zg3Ur8yV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd772843ebsi171670606d6.46.2025.07.03.02.09.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 02:09:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zg3Ur8yV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXFwX-0006ey-T1; Thu, 03 Jul 2025 05:09:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXFwV-0006dt-HV
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 05:09:19 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXFwU-0000hY-23
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 05:09:19 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-70e3c6b88dbso57561237b3.0
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 02:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751533757; x=1752138557; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wz0yTYttiw5SfPbbLkMOcZ7w7E8uJtXqifW6IrGf/7U=;
 b=zg3Ur8yV29mfQ9vlPTMzm5K6MbP9RUkgN7jxPoMbzDIzc5i+OZCgwnSuOQwY7do+k3
 KRZHI9/bmPsYomnzu3JxFYc/Psav+IeDgwj5EX3GJCBSyPUwx5AKSicQrhiSZUx+/cVy
 1hsNB06S6k/k9WXLZ/sUbLk2gbZTK+S6IFVSVD+bnGk6SMxEy6voMANmcFkRF0KgBP5g
 Kiq25N5Z7k1YnUUEWCgkwrKKNW7V77z9zgho7NU3V653yuY82o4yRCb/CDS4A5SNAubk
 QEpoXgT1cD6gDWmPBT+eo0fxF33bK0QwX/kXb5sj4LdghZOwXUAkuWET3RgXiHiq/nQW
 nihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751533757; x=1752138557;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wz0yTYttiw5SfPbbLkMOcZ7w7E8uJtXqifW6IrGf/7U=;
 b=YT7uer3KeiIdbclVvYAGV//kmoYC8eNjIhJGaB7W6V+h4SSqcpL+cp0pOkamwOtCiG
 mICXr8lWMiPt/j7RBRmwojYvnidaiqvp6rQz87HiRph7d9GbmZWUsc0uCsZv8zs4BbEt
 uXi8/ZAHPRLaI0d7etGaFpxhwz5BG3X6UCrgJunpw9WtbaVIwIH4GePTF4QV7UJ5meXt
 4Urs+1qWdFjughP1wCXsFA/u0+wOnR5CeKrHhfT0U8JiMPE0/73rxPJOSbe9IdTEA17H
 isbZ4w79ldvTe19z7sOcvdJZBzbUXIlmLB7c0TB6pdZ2TtRMGJBdlNTGiSc6TooklBod
 xVBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKAC/40L8P/95tjDQ+/+ApsFqtRHe+jsyKxLQ5C/Vm8yNbqbEoEsv8yZ/EBdXMAydZK4+SUkv0XQ==@nongnu.org
X-Gm-Message-State: AOJu0YzbVxH5ZZ5mLB+r0SIOfkhGaT6N8LnUkUutFDkCiZInzUzuW499
 0tc6NvLZJAVeeRnAEwJjOSac02KTekamNe9FEmj+bxvRfIuC2FpTrFcda6vQXqTPQbXoNDlvb+t
 At6h4zA2cx4VDtA0Fr85nb4hWK92C1YkIt5UXAv8c+hAB1RIJQ4ur
X-Gm-Gg: ASbGncvcr4XO1wRO6K5OI/ByYZVXQhWFrTgFFosfRbfDqibpHCkoj8RccXE8POXGrSX
 F1rexiZa5KbQIwWDIXr6HT1VwU/8d7u0+bUa2047FW+OXGQ1Euw0QrQ0mrweD641gMI3x+6NVPM
 No4HNNvp3x5qAjGVdPp5jkLCSLnG9IpV/IecaiqygRK5sn
X-Received: by 2002:a05:690c:6d0c:b0:70f:9fcd:34f1 with SMTP id
 00721157ae682-7164d529e09mr81371457b3.25.1751533756994; Thu, 03 Jul 2025
 02:09:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250702122213.758588-1-richard.henderson@linaro.org>
 <20250702122213.758588-8-richard.henderson@linaro.org>
In-Reply-To: <20250702122213.758588-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 10:09:05 +0100
X-Gm-Features: Ac12FXzI2NETAyF6zjOTDSNmLu8HUdviAS2HQM4Vwh2MNVHKTTivIRNwIj7GIlE
Message-ID: <CAFEAcA8WvtJtDfQWAXP+uzgBsNSJLFqjz6hotNzXgy+bOr0T3A@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] target/arm: Fix PSEL size operands to
 tcg_gen_gvec_ands
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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
X-TUID: d7rXGskveIdE

On Wed, 2 Jul 2025 at 13:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Gvec only operates on size 8 and multiples of 16.
> Predicates may be any multiple of 2.
> Round up the size using the appropriate function.
>
> Cc: qemu-stable@nongnu.org
> Fixes: 598ab0b24c0 ("target/arm: Implement PSEL")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-sve.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
> index a0de5b488d..8403034a0e 100644
> --- a/target/arm/tcg/translate-sve.c
> +++ b/target/arm/tcg/translate-sve.c
> @@ -7291,6 +7291,7 @@ static bool trans_PSEL(DisasContext *s, arg_psel *a)
>      tcg_gen_neg_i64(tmp, tmp);
>
>      /* Apply to either copy the source, or write zeros. */
> +    pl = size_for_gvec(pl);
>      tcg_gen_gvec_ands(MO_64, pred_full_reg_offset(s, a->pd),
>                        pred_full_reg_offset(s, a->pn), tmp, pl, pl);
>      return true;
> --
> 2.43.0

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
