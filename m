Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2379019njk;
        Mon, 27 Jan 2025 03:57:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVMbP6pxotkARPO4XuR3YkrH4Mjx8/HCardbnkwB58SuNqEuIkTn0TUzkAGTNVJfWyZtRo8QO+SqkEFpg==@linaro.org
X-Google-Smtp-Source: AGHT+IHXVUmaaI2J4/YohTTUFPiQcUuauQMSgGVjtxg9Xif/WJMGJzs3gr+Hq432z4BDs0kai2OM
X-Received: by 2002:a05:620a:2a13:b0:7b6:d8aa:7ef9 with SMTP id af79cd13be357-7be6320c0f9mr6287790685a.32.1737979022100;
        Mon, 27 Jan 2025 03:57:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737979022; cv=none;
        d=google.com; s=arc-20240605;
        b=MyzYU8XMv2vnFMK2BhfxwAcjWhvYaBJ2jtMWQW2jf7I6KK9hVn650fup8GacDwmri6
         8krabU0ao7tv/BOk1aTDfqL2KEADlu+FNfp5y0FzkYXuCdv+6ZzieQ1vvl4lp/ysYBZW
         fR89cyKQq2uGyETBCgwKaexmHNuKEJwFLvAnnX/mu2kOxRxZrNY5M5dZJXTuEclHH/S6
         rfCpYbGWRv6CshCoa/2kepNNm9AMqM7I8q+LOy2OHJ3fnsz3AO7ri46mubwp32U4C0TN
         toLKFoCpWMoTRUtmWJ0eVK/ygx9yopAJcclLMbV/dQTEA643GlPFki6ytIFQPbcDF3j6
         wt7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TmODB2YqiSgFfw6mNPswT7QwXij2cXKU42PdskrrlVY=;
        fh=UT36gCECAOtEsgOrSReymFda56t2Gj969DHeMwsi3As=;
        b=MtlahHebqX01xhr0jxgHdJEr58Srszz7rLCmPy+D6A9uKDm/NQrMAXqF2N5eCrUDTq
         1wjV/EcupEVzDo5v1IOI8/ROFwS9z6TpzplO7ewsn/aTbVkXx9Epm8ax/BeiRNXzJb0n
         tQlAYwwwkVzjXcGpUZ7ITzckgQK/eyCGkmpBPFVkRpabE7s2P4LUPHleZSyNn1ykPVfd
         Tyxxtwsi9k4bQBv1HaAZQOqg5S6X9c2SiZaTgX/GTuQX4kYMPuZhG/S+d24yr144zV/5
         JV0udezug+29Dc5q5C+Ci0eKIuEkVlnkP5f5UjRtFpcAtiw9P9T8diRQN14ANNkr6fr+
         P91g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nJopVp7G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9af12940si944556685a.585.2025.01.27.03.57.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 03:57:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nJopVp7G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcNhY-0006Sb-3B; Mon, 27 Jan 2025 06:54:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcNhW-0006RD-OY
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 06:54:46 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcNhU-0006s5-Ae
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 06:54:46 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-436202dd7f6so50090415e9.0
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 03:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737978883; x=1738583683; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TmODB2YqiSgFfw6mNPswT7QwXij2cXKU42PdskrrlVY=;
 b=nJopVp7Gc8ludZpwD4BxQ8sutpItSjeKSfdjYi4I2VHJwGoQ4u1Ct49QRT/n+gmGsP
 ffjHeURqxJ9tnKSbixhvGytXMbcXrZkqEnzQbvaypw+1r+D98yZDQFTVGBm/ziFh5jKE
 RiGyAG7Or77NCuTCIcRqwW3chaZUuBc0NhFj7fR0VETYNi7qUwuVUL+02UIykKyKc1Kc
 jq35ZAw1Ibq9Zpn3RlYKeVun/Xlw7OEQZlOM4546xCffwgDwfToA+f192+mpQYEx35Ek
 j7VLQuQGjYaamu6NuQodAnY51MuK/CqaP9D+628ja3glAeliPS2aW+IYUVir1QEbkufD
 jFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737978883; x=1738583683;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TmODB2YqiSgFfw6mNPswT7QwXij2cXKU42PdskrrlVY=;
 b=M+B3vLjQkq6q3WtYuLr36EcjapnWn981Q8pgGBbeBCpt381Hz2H+mmrvGurCU3Y8yD
 K4QBfgznsAHg5KBQ5/BcGAfuwmrKOvWe+LdC1u9IpdMNOV/dbZf2gOM6tB3MecgNPu01
 HeyM3wmWe283M2lDrC0SyKb8NE2sIe96bOmCfjrdMy1oNf4ZYBqhzX1HGaNg4yGK2dc8
 /ovUDr0U6tnNDePFgLW1F90MCqvQA82EUhGGZgJAsS6u/BwYPtAPsBE0aUzaL1DGPuMw
 PWkYhz7tC7lek9/3J1uUHDXql5nhJyLIRJvFchngiktiluO1ZvSDthUavvI/gffvxTHm
 O9eQ==
X-Gm-Message-State: AOJu0YxSKBaiQvWfxLZ5rT8VVocmG3aP1d0tjjM8J1pRq5mL+r0OHlOy
 QYxqHG52Dv2r2kfQNK5w52m3XFg6adTVUYZgIt/2IrQ+WBH4BqBwtNTzEgWKL3s=
X-Gm-Gg: ASbGncuTqAxqyCnmRVeRgX0FXekXEvdU+Z80nag4wh9ASJj0ETtplhS1xhA1j0AYp19
 xT0sofVxXGUSAkialVqKPJFKmAIntZ6sxWQc22EagftFv/9JVF28QgJoVtUGqdYMNIATeND4Z+2
 rVP8bkNCce1x2foy5vnhDF2HaZt5XBJmqRpv4lIC17jlqbGR9ik8P3jeGIBFueq6YdsQyOzRbi+
 vnkKrqcQ7THO/OlILvoRroVD0N+B5I/Ffkj/x/FbGBNKhMPhfW48YAyRpr/IYSR4DJuynUXjIDS
 grWzp0FR7BWRdQiTGSdJHjPbkzz9azA1czTfsDXhR90YcOcpD+41CEA=
X-Received: by 2002:a05:6000:1849:b0:38a:8888:c0b6 with SMTP id
 ffacd0b85a97d-38bf57bfcf5mr42398725f8f.51.1737978882716; 
 Mon, 27 Jan 2025 03:54:42 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a17d6f8sm10684291f8f.28.2025.01.27.03.54.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Jan 2025 03:54:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 03/10] target/arm: Set disassemble_info::endian value in
 disas_set_info()
Date: Mon, 27 Jan 2025 12:54:19 +0100
Message-ID: <20250127115426.51355-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250127115426.51355-1-philmd@linaro.org>
References: <20250127115426.51355-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: kgPfyHQVuQ2W

Have the CPUClass::disas_set_info() callback set the
disassemble_info::endian field.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index f9fdf708653..9de8c799c77 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1220,6 +1220,8 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info *info)
 #else
         info->endian = BFD_ENDIAN_BIG;
 #endif
+    } else {
+        info->endian = BFD_ENDIAN_LITTLE;
     }
     info->flags &= ~INSN_ARM_BE32;
 #ifndef CONFIG_USER_ONLY
-- 
2.47.1

