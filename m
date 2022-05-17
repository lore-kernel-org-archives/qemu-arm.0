Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp2460832lfj;
        Mon, 16 May 2022 23:00:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwpx7bz1SGvAi/We/S87ZkjdJ5ut66E6cWam1+jmyYlBvOTPvjtTvdzvqfA+yrjsaCJvtw
X-Received: by 2002:a05:620a:370a:b0:6a0:1476:145b with SMTP id de10-20020a05620a370a00b006a01476145bmr14932846qkb.648.1652767241304;
        Mon, 16 May 2022 23:00:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652767241; cv=none;
        d=google.com; s=arc-20160816;
        b=N5Ur5FabElEP3NNKtq3VKbgooV1I1yAcNiqZuRS4OKjz2ESlY0eRQavLK0zujWLBnU
         RiBli89W0mE2TbVKZJwfuDYkQjVmyUr+cZQonErlAS3+m5g54mB3bAi0pjSPXR/FCOps
         ngNTdG4JGDZ2c0dzsxFufGCfD84Q0yzKF3aFuFMR0JzS3cfBAMLSJxf352E9qIyQ7Uhc
         qPksgwoRQNPE3QaizlSCMvpS0hYfagjWoJNywKgQxYDRdq4b9echXdnGlJnll6YRQ99x
         5KOgSyTQDVSwEPpLGcg5qJJ67jbVCAeSnX1ALvs16LKBtkxs6v83RtW/ZG3m2G71j4Ig
         oLyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9CQLR9+ZabdVBvj8yT9hoESiXzPxfvDoRGYhKlSAaF0=;
        b=lqPn4S3RaFwZ4c/LafJBj1OB4CnEqY3Tt4zy5HFfCotuYjPd+37o2ZjUXo6R90jPrr
         Op3/LEG/A39+QmLaiGl0b0hqP+ik7n1RO92yc1G5IBdn7y1gCYBds7PEpiEBn5UyWJVa
         vD+5n4GAUefaFEaRFQMZ1gxEayYb5GvtM0+DTyD26MAEQLiAKTqwuq8iRcIX6Wg7jR75
         7BC7DaDcD/u51gFAxQ5Go1JSwqxREsBXwx1kXNTFHreDYs/+48Arnwvn8cfjBMHrqA+P
         xgR04zFhwsC4baDLQ5ui6wyz6tkC34a3IOIC9Bu5WUBZMs8pLKmYAI51hFiSjz8V9DtA
         Byug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ig4e2ZOl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n2-20020a05622a11c200b002ebc43eb023si7971848qtk.122.2022.05.16.23.00.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 May 2022 23:00:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ig4e2ZOl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nqqG8-0000lf-I6
	for alex.bennee@linaro.org; Tue, 17 May 2022 02:00:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqq4o-0000Tm-SF
 for qemu-arm@nongnu.org; Tue, 17 May 2022 01:49:02 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:43859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqq4l-0007nj-N6
 for qemu-arm@nongnu.org; Tue, 17 May 2022 01:48:58 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 l7-20020a17090aaa8700b001dd1a5b9965so1331695pjq.2
 for <qemu-arm@nongnu.org>; Mon, 16 May 2022 22:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9CQLR9+ZabdVBvj8yT9hoESiXzPxfvDoRGYhKlSAaF0=;
 b=Ig4e2ZOlV6l6B/eekA8p2Y3WC7jOcp2Oi7+b0x8DuFvXpkFdWnbyciWeXw9ciEuL6W
 /XRl5XYEEaf36eqOY4Esw8pYTXuPcwzmi/wcv061oLLZhbHwFR+YCHA8JUJV/8koZdqv
 G0hqF4bKmEoGUC6hxGFiZOd3qJMxv8yXDDQTw2YWipv0Sw//+EwBoabhQm5R6QjPrLQL
 Yy+LLZGugDk+vDyCu0dCTSdeYLRJP0s9CwI4oL77bbp+uHhgkvrg/JW0zq9xnUFz19Tn
 l6lK+qwS/E3WXFWqBTtc22J1Z/0i8BWXVywCFSrdQtog3dpsFeERw0mN6j8F2Ox60wRF
 rT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9CQLR9+ZabdVBvj8yT9hoESiXzPxfvDoRGYhKlSAaF0=;
 b=OX22JaHk/Wvl17KM/f9+siGPIp7Br4iyjto1lCqL+XpPXb9R6sxijZ82NN+4Iw6gkM
 vdgbjlHvkkBkESVFRy7bsQQrlEIaK0aI+adpLs9/2guxZwOSMWSllI2QqIG9qri88uiZ
 oWHL2b0xOTVEV2CSwwlDNg8QJp662VfKGQglRC83PbcoQP5cITcJn5U06gFuYBv66Jl4
 Jr8TSfw36Wgoe4LOsFMYau8pqsAfITea1hftVrlnqt+xsDX7dRRnROCjwjQBrZ7Lm/Cl
 SJkl4osHhLYNWIc1SMz0HZrZgUytfbL//74Bj9mbAF8ODwvZxQJ4rANzvXqrfeHjCRls
 OA1Q==
X-Gm-Message-State: AOAM531EfZVpBnN1KC6RnOHFaDAAaHiGvK/R5EpEck9hpg+dND6bYKQo
 5UFEFSIxNPosJtmdhgYANQycvQ==
X-Received: by 2002:a17:902:700b:b0:15f:a51a:cdeb with SMTP id
 y11-20020a170902700b00b0015fa51acdebmr20570976plk.137.1652766534418; 
 Mon, 16 May 2022 22:48:54 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 b12-20020a170902d88c00b0015e8d4eb1fasm8146670plz.68.2022.05.16.22.48.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 22:48:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 3/7] target/arm: Do not use aarch64_sve_zcr_get_valid_len
 in reset
Date: Mon, 16 May 2022 22:48:46 -0700
Message-Id: <20220517054850.177016-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220517054850.177016-1-richard.henderson@linaro.org>
References: <20220517054850.177016-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
X-TUID: GmPjpNLgqRfu

We don't need to constrain the value set in zcr_el[1],
because it will be done by sve_zcr_len_for_el.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d2bd74c2ed..0621944167 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -208,8 +208,7 @@ static void arm_cpu_reset(DeviceState *dev)
                                          CPACR_EL1, ZEN, 3);
         /* with reasonable vector length */
         if (cpu_isar_feature(aa64_sve, cpu)) {
-            env->vfp.zcr_el[1] =
-                aarch64_sve_zcr_get_valid_len(cpu, cpu->sve_default_vq - 1);
+            env->vfp.zcr_el[1] = cpu->sve_default_vq - 1;
         }
         /*
          * Enable 48-bit address space (TODO: take reserved_va into account).
-- 
2.34.1

