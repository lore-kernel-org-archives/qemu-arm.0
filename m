Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 078F1CA0FFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 16:15:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNvD-0003kl-H5; Sat, 30 Aug 2025 11:55:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usEMH-00062O-9q
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:42:37 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usEMF-0004CP-GK
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:42:36 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-76e6cbb991aso2645843b3a.1
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 22:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756532554; x=1757137354; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PIk54x6Ar31mjPJaW9KswvmHAxIEFie35EtC6Q/lqj0=;
 b=KZXb1zhBos//Hn1SnBszabRkiodqVt/TiSdh6PDD7BOZKzm/dswKtj/Fgu/xTB4cRc
 F30sCKckFupaHBELjrlkNm0uca6slwLzMOjSny/mhdYH4Mrw62CyEzQsyNU44ozvPIF+
 pj6Oo4NgL25DC+wrpL1bHIHGQtHAMQyHGTwfaiamChtIuL/wGwzmybEHWVEVe0kHvL+y
 /WwT94Gk/o0WFcgsSKDlQ4bC5UmDUcnnAp21H5z95v4tCkbN+P59D1FTsQmoXBlLpSx2
 +XT3MJ1oeJv6HapX1oX78jOPL4UKPrP/vKb6eNClBakiGrPQh3woFV/D7ymN7T6F5h1U
 bz+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756532554; x=1757137354;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PIk54x6Ar31mjPJaW9KswvmHAxIEFie35EtC6Q/lqj0=;
 b=wv6B+fqzwPr8ZJSSGcKpuSOzCPGB0swndUK5V3RA+UHiBq9KBAOtZt8P5VWdoRjQeE
 0ylBYYhO+pRN5ZhC1lHCS2kXmXSPz6v9kvpVJPnFuuCssKBYwcXuSE9n2HUHtBFyqB4u
 NJdTPYieBSCNsQlNfOXcNGQ/+nuH5Qv0C634JR/uuHx5xdHorCNgluF01tMKoHNmEUPP
 iSzPsSUGPs4nLxbHKI38SCIeZ1wy7qzqbM+HPuYps7jY77Dt1gvvfZcIRigcGosRTfXt
 qPDN3HwEVga3KpNR2T/+rQkyu61nJQCAV6vABxy1VXr+rjo9UaAjfNuv6tW4NBy1FqNF
 4IjQ==
X-Gm-Message-State: AOJu0YxjkP9GWIGh+XM3uCkxeZqPX5LkW6qr/+DO0suXB1B+zCA8YRm0
 +VvsbGnLbyzy6C1qjfKc+oyZ5rN44f+2y7mWqnRg9eyd2Ihpnz984+BYttiBgRYLSdxP1EkoFUK
 VrJWL2G8=
X-Gm-Gg: ASbGncvP8TPJtfj++UMwVRimz19yW1KOXDjtwB5ZIo2vF3MJVbAb5hrPd1P/20UQ/Eq
 e17P6L3+xjzJvL9zz1kTt+zxxOe+/WMVVBfBiZh6fp96aYV6XTvfqwfdmrSvvGUG0gFP5EQnSZj
 hORWzfGZSogOFCdJLMNzJtz4dwjOyltNG3E5mfUCzLu6iGinyJw7bjhrNrN68t2zFNvqN0abZsW
 llC47WYQpEEWkR4lfgwg08niv1pHx+UnwTNAN4kmALQJGHB5kEiwJ/m+Cc5fdYXg/zCmeHsErRW
 jNTxhM/VfRTSDRko3ONtYo5RVxJgCewalfOVGldr6SxhAbu2T4xBDykeXOVVZ4awuTSLeXnzhyN
 ek+7X4hDbAcaGBpuHGMspsdACaCFde6YyFFSPBMhILic+2SKIoOQ7Wn47Xk3lfESV5PD45eA=
X-Google-Smtp-Source: AGHT+IFwLShPo84AJ42TVIS9IMXs0ioGTW0/ctsVQWEEiBBHzL9E+gcd+n2N0OMR9AgzPH+f9sHsiw==
X-Received: by 2002:a05:6a20:a11e:b0:243:cff1:3c98 with SMTP id
 adf61e73a8af0-243d6dd4e1cmr1556907637.4.1756532553937; 
 Fri, 29 Aug 2025 22:42:33 -0700 (PDT)
Received: from stoup.. (122-150-204-48.dyn.ip.vocus.au. [122.150.204.48])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4d96829a66sm2435905a12.6.2025.08.29.22.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 22:42:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 21/84] target/arm: Do not migrate env->exception
Date: Sat, 30 Aug 2025 15:40:25 +1000
Message-ID: <20250830054128.448363-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830054128.448363-1-richard.henderson@linaro.org>
References: <20250830054128.448363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

These are not architectural state, only placeholders
between identifying the exception and delivering it.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/machine.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/machine.c b/target/arm/machine.c
index 6986915bee..8dbeca2867 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -1085,9 +1085,9 @@ const VMStateDescription vmstate_arm_cpu = {
         VMSTATE_UINT64(env.exclusive_val, ARMCPU),
         VMSTATE_UINT64(env.exclusive_high, ARMCPU),
         VMSTATE_UNUSED(sizeof(uint64_t)),
-        VMSTATE_UINT32(env.exception.syndrome, ARMCPU),
-        VMSTATE_UINT32(env.exception.fsr, ARMCPU),
-        VMSTATE_UINT64(env.exception.vaddress, ARMCPU),
+        VMSTATE_UNUSED(sizeof(uint32_t)),
+        VMSTATE_UNUSED(sizeof(uint32_t)),
+        VMSTATE_UNUSED(sizeof(uint64_t)),
         VMSTATE_TIMER_PTR(gt_timer[GTIMER_PHYS], ARMCPU),
         VMSTATE_TIMER_PTR(gt_timer[GTIMER_VIRT], ARMCPU),
         {
-- 
2.43.0


