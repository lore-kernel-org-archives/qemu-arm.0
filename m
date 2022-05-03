Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1516748lfj;
        Tue, 3 May 2022 09:08:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7lq7gtRibGq5G6VzPInNOYamHMmJLIgMY/MFAXtd38rXutmR26OtPn9WC5mlXFUNBZ5jz
X-Received: by 2002:a05:620a:e88:b0:69f:9e4a:9e74 with SMTP id w8-20020a05620a0e8800b0069f9e4a9e74mr12772122qkm.341.1651594099089;
        Tue, 03 May 2022 09:08:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651594099; cv=none;
        d=google.com; s=arc-20160816;
        b=DoPxj0tYiltK09720h8exPE1K9cHkZNSbQd9gwU8JFQFc5xaRE3/IDB5EW5tmqF9xf
         hC6pB0sUiDgOBovewQEY2VLfdBFvkZTObfzCJ6YLnYGpIRvemTUDBhAEq6f8vPS/l9hS
         c6mUhJUEFjv4ROtfIuzxBc8Wsqx3GI7nU4tXtxltYpijuTvaQMxIONZlxGIS56Hl+8Ve
         4heBi77D1T+zL3SY0JUAH1VGeLw53PHPhJ/iZ5eI0AWgdEfbvsAifkikvHLgcL6efM6L
         t/tAd/us+Dy4JTD1cQFKP4gfjoWrvCBzjq8tgysyXZua1kavZeAq7XkpOP8exAGTawcC
         PA9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=7RkeTIKrefgq+De9VEvrMvcOWMITWIDxKbdSvxqMq7U=;
        b=IWxcnhEdarAOtlRfQMUJzcfiPGdM+kxYeP9xd8Qs4UFGhDMgcc1t0PhL7mWaI9sfkd
         w/QR1psaiiSETGTZkveW46qkiRoCuLQRhksNGJuODQrdfTvfqIfrjl/jU6Qb/Joi17Ft
         S2hnhEJwCbe1oja4M5sKEutPUAhSQyQaxLyQPwQzOHAF0R0Bkfxur0HlRNvzvaJ2Nl4w
         yrhIhqq4cao4V+1c2rhZ9o/hHMxH1mLy/io29PWR48yBTCix9pcDsVFzpkzRngxSIzP0
         E7zMxeVmCLbQeBjHoVXYYJDT0jNKbksdoDyaCFqfQVwaR99QqYK5MZF/MD2k2v6rVSIU
         NoXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b4zDUAh8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l18-20020ae9f012000000b0069fcf8dd83esi2858234qkg.686.2022.05.03.09.08.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 May 2022 09:08:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b4zDUAh8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nlv4U-0002US-GH
	for alex.bennee@linaro.org; Tue, 03 May 2022 12:08:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nluwH-0004jk-4o
 for qemu-arm@nongnu.org; Tue, 03 May 2022 11:59:49 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:38780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nluwF-0001pH-M9
 for qemu-arm@nongnu.org; Tue, 03 May 2022 11:59:48 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id m128so31849283ybm.5
 for <qemu-arm@nongnu.org>; Tue, 03 May 2022 08:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7RkeTIKrefgq+De9VEvrMvcOWMITWIDxKbdSvxqMq7U=;
 b=b4zDUAh8S6Nu6pZs7Rixo8lngzw5iTkiNaMkeTcz+yw385hEK0ASw0KPWwubXaGjE4
 eHOk7+2U+LMUW9/HIK6hBOdCqPjC+31KyQHZnrrxxDZjMqOFUZrQWu7sSXbWhrjU7eRv
 FDg7UnRzFlWOwRVk18EmW6DqnztGT+8EUSbR5P57Z4y1X+mnVe4cbExm6tDrgrdOWLNj
 R831yrmISc9qlfApr2yuiPulP6lxBRwRsCQ1nQwLJlXiWxEizoX8t//B9HqYFXWta3SQ
 lV8ztbYJ7KPYpiiQCCNBvG2xynwga+dPKD3mH/f0TeTC75sM5QWxPiT9WV9WilFhqSmD
 jwWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7RkeTIKrefgq+De9VEvrMvcOWMITWIDxKbdSvxqMq7U=;
 b=RY8P7PgJRhuXbIL1W29Ou7xrqv7sLPitcwb+E5bJykrkzuxhuxXrCQRHKiO/n5nraY
 EpoT5UiJVEZMwaJYpll6Gh9d9EdAesQpHsUn7dfiLYseweRfsaV+y7DVVDuZwtfrbT2l
 9DFSnttvfvsiyG1uDp/t3xvEFHnsyVkFv68nycIS0BVpq8Q+QtVty4vmXrJS6MzggTS/
 udwYlPrvrA8SIymQxPE31DrhkKWJZx4GtikIdM8LRzE+Dte8tw+shzLCSioAubYJyv+7
 xbSquzimncaWTkDMF0wUq2+V+JLV7mv3ZwUnyPPwal1/wmsxT+orfGiO2Hl8i5HrQR64
 rSkg==
X-Gm-Message-State: AOAM530Y/31MMW95WfflA+v+aC6xVI/zlO3H8rbrV8Xi6bUQxXRe13fl
 c2y9CHjcNghwoMiKhqRKc4EcyThXaKSPy3UAAZ2qug==
X-Received: by 2002:a25:2fc2:0:b0:647:dcee:b2dd with SMTP id
 v185-20020a252fc2000000b00647dceeb2ddmr13836812ybv.288.1651593586619; Tue, 03
 May 2022 08:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220501055028.646596-1-richard.henderson@linaro.org>
 <20220501055028.646596-11-richard.henderson@linaro.org>
In-Reply-To: <20220501055028.646596-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2022 16:59:35 +0100
Message-ID: <CAFEAcA_ktw_dR+KH_9h-7X1LqNpdHO_sCjoCuxSc-ps7ERDSWQ@mail.gmail.com>
Subject: Re: [PATCH v4 10/45] target/arm: Drop always-true test in
 define_arm_vh_e2h_redirects_aliases
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U656YAU8gwEN

On Sun, 1 May 2022 at 07:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The new_key field is always non-zero -- drop the if.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

> @@ -5933,19 +5935,16 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
>          g_assert(src_reg->opaque == NULL);
>
>          /* Create alias before redirection so we dup the right data. */
> -        if (a->new_key) {
> -            ARMCPRegInfo *new_reg = g_memdup(src_reg, sizeof(ARMCPRegInfo));
> -            uint32_t *new_key = g_memdup(&a->new_key, sizeof(uint32_t));
> -            bool ok;
> +        new_reg = g_memdup(src_reg, sizeof(ARMCPRegInfo));
> +        new_key = g_memdup(&a->new_key, sizeof(uint32_t));
>
> -            new_reg->name = a->new_name;
> -            new_reg->type |= ARM_CP_ALIAS;
> -            /* Remove PL1/PL0 access, leaving PL2/PL3 R/W in place.  */
> -            new_reg->access &= PL2_RW | PL3_RW;
> +        new_reg->name = a->new_name;
> +        new_reg->type |= ARM_CP_ALIAS;
> +        /* Remove PL1/PL0 access, leaving PL2/PL3 R/W in place.  */
> +        new_reg->access &= PL2_RW;

This has lost the "| PL3_RW" somehow.

>
> -            ok = g_hash_table_insert(cpu->cp_regs, new_key, new_reg);
> -            g_assert(ok);
> -        }
> +        ok = g_hash_table_insert(cpu->cp_regs, new_key, new_reg);
> +        g_assert(ok);

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
