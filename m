Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp7949686eje;
        Thu, 20 Jul 2023 09:29:11 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGJEPkofludn17yfeIzIix7GlR0rnVEWVE0900SQbwVX0JcyF7Wvv/WUfaSr0/AoPhiGrU7
X-Received: by 2002:a05:622a:1b89:b0:403:a5b4:b6df with SMTP id bp9-20020a05622a1b8900b00403a5b4b6dfmr22836479qtb.55.1689870551383;
        Thu, 20 Jul 2023 09:29:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689870551; cv=none;
        d=google.com; s=arc-20160816;
        b=d2pGLVrZUJmqNCYdRxsfpEcHjZbgqdmycXoyKg+aIY9noxsJLaGys32o23q3VpISUj
         whUJ/2yGxKm5XHvkNwQuiACkge0WzM09l1G74swHXhSKK14ECyo0kCO8Kkp/0J/nGf1G
         q56XdNgM0TxXj+z0x2VIoGO5PdOX1AZGre6UNCASSUZIhAfMrc/+kNl1OtI/YKXFjfNi
         DoMjXIe8ZbbPnqjfkY3MBmz8pOD4O8ct9+zSuBWiIkbjgDQEBDE1MIJo7RWJb3iP8McZ
         HJjXUTr4ITHop46P2beY/LY/9kBQYHHDtcVV4+IS5BZMMyoyCRxQQ4eNmfZolHNyU4ja
         3UoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=NmG4z32DKSrMHBIzEuBhLqUfjW/cR/ysKSc5rHDmPNM=;
        fh=CEa3UdY0L+UQ/2T/5R8rkDkdq4jlW1F1hWJjDNQD42w=;
        b=oGNzeRzGTUSax64hLNpqED9LyuwdpRzPKD7noJ1D4I4w5dBrSELFnK/vV8871nDEUA
         pWnXuXKJqUQ0JKqqYv4RO7+JmtA+Ruqjwv73gjfAsVyTjfRB6iz/Ng3izVvvYdYI3Dzp
         9QV/45lxZJmU7KmRhwdzVEUTZJ10VZMP9F+oDKndpyG4YgL7xFs0hTceeBJ9e4tCrCdb
         rclVwFNVKc37jMONIRm8kT2wIt87QOZ3XWDWEZmvBim9nF3SBlusz1MkKeXSbjOUaNJM
         oNG7F+N0+UGbGr33e15e8+gkItnvoLc8iutJscrABD+ZnP9oFKzO7uopQai0YCEvohUC
         BBqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Tn9hholp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c22-20020ac87dd6000000b004009a75d84esi484032qte.241.2023.07.20.09.29.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jul 2023 09:29:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Tn9hholp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qMWVy-0004K5-Kc; Thu, 20 Jul 2023 12:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qMWVy-0004Jw-0c
 for qemu-arm@nongnu.org; Thu, 20 Jul 2023 12:28:30 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qMWVw-0003f6-Cv
 for qemu-arm@nongnu.org; Thu, 20 Jul 2023 12:28:29 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-51e56749750so1372399a12.0
 for <qemu-arm@nongnu.org>; Thu, 20 Jul 2023 09:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689870506; x=1690475306;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NmG4z32DKSrMHBIzEuBhLqUfjW/cR/ysKSc5rHDmPNM=;
 b=Tn9hholpY9DmEQbrqfqM3sSiTQiYYKHo3vLEYM3gsrUifodYq3/ncVgUCeOyP2jAr0
 010LZdTRIjNheTCY4r4Fuw4OaCAiR60+YI2dEiDVtuf+LPg3xn1nElBTBvrpPWfcEDPm
 HbpSDA9mfYG5vechdR8lZIcY5X33J1vEmJ8kFNqjmDDHyDhiiAojBYhniUlYI7RuiOtV
 jo2mih1E6Zbr82dMAYUwcd5IuQnZZZ0tr/Hdz+jdd1AVZoQU12k4Ry2zrBPoYGDifxHK
 y6sysGa7C7sElFRWecdB5vRsWhfTttzz++EOVPmbdvlGeJrOJIdurPsyBAzo9AMkms4D
 4bBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689870506; x=1690475306;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NmG4z32DKSrMHBIzEuBhLqUfjW/cR/ysKSc5rHDmPNM=;
 b=LZVZejLMXaC8bxlyJTgWmWCWzDkPa7l7F9gmwN34m+sehoqVHBzzLiOr8tOwd6Nyy+
 eWHPx0jMrtzBe2+z1PNnFXvF7Nka6KXc0bDGcxt3wyLxz6Z/Oz147wzGlN/9IxJDRW5E
 JbXI+1jSbkC18V023s5jVQ99Yb/iZfHjwngHcSG4c3PHx3ECLUsz593KtMHgDtzp0rZA
 t+KJiGDOr2jdaav2z9w9jPYCypiI4JRQo0TeF+R59wJ/8CwWANBwqqHyzGMNfGFBS97v
 pp9Ox50PSNezPeal58r5AEXyblcNzxeoCbtaISewo+dxrIkXMNH5ZP00XLBp4IB8oriZ
 lpuw==
X-Gm-Message-State: ABy/qLar/oPdpm3kDEgnYV0i9+55ojKgYMB9Na+6HFlz0eCQGoKjmHj4
 JBo8mVQ8fMZgFSjWWK9gTog0Y5/GGvLONGpoC1aErg==
X-Received: by 2002:aa7:d54e:0:b0:521:d770:4753 with SMTP id
 u14-20020aa7d54e000000b00521d7704753mr2145797edr.13.1689870506685; Thu, 20
 Jul 2023 09:28:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230719153018.1456180-2-jean-philippe@linaro.org>
 <20230719153018.1456180-3-jean-philippe@linaro.org>
In-Reply-To: <20230719153018.1456180-3-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Jul 2023 17:28:15 +0100
Message-ID: <CAFEAcA-qPRSrLievcUZsCJQ3MO0AzdfrkMM6gs+PHK-mZq51fw@mail.gmail.com>
Subject: Re: [PATCH 1/5] target/arm/ptw: Load stage-2 tables from realm
 physical space
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cN6KHgrecgN/

On Wed, 19 Jul 2023 at 16:56, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> In realm state, stage-2 translation tables are fetched from the realm
> physical address space (R_PGRQD).
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  target/arm/ptw.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index d1de934702..6318e13b98 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -164,7 +164,11 @@ static ARMMMUIdx ptw_idx_for_stage_2(CPUARMState *env, ARMMMUIdx stage2idx)
>       * an NS stage 1+2 lookup while the NS bit is 0.)
>       */
>      if (!arm_is_secure_below_el3(env) || !arm_el_is_aa64(env, 3)) {
> -        return ARMMMUIdx_Phys_NS;
> +        if (arm_security_space_below_el3(env) == ARMSS_Realm) {
> +            return ARMMMUIdx_Phys_Realm;
> +        } else {
> +            return ARMMMUIdx_Phys_NS;
> +        }
>      }
>      if (stage2idx == ARMMMUIdx_Stage2_S) {
>          s2walk_secure = !(env->cp15.vstcr_el2 & VSTCR_SW);

This isn't wrong, but arm_is_secure_below_el3()
calls arm_security_space_below_el3(), so we kinda
duplicate work there. I think we should instead have:

    if (!arm_el_is_aa64(env, 3)) {
        return ARMMMUIdx_Phys_NS;
    }

    switch (arm_security_space_below_el3(env)) {
    case ARMSS_NonSecure:
        return ARMMUIdx_Phys_NS;
    case ARMSS_Realm:
        return ARMMMUIdx_Phys_Realm;
    case ARMSS_Secure:
        [existing code to look at the SW/NSW bits]
        return s2walk_secure ? ...;
    default:
        g_assert_not_reached();
    }

The comment above the function also needs tweaking
to say "SCR_EL3.NS or SCR_EL3.NSE bits" (we do already
do the TLB flush in scr_write).

thanks
-- PMM
