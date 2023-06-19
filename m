Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2884407ejt;
        Mon, 19 Jun 2023 08:59:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ47V3sFa8JLAtmk2Ma+eHIbkwiZAi/dVKXZYJO8+tg/1LU3ehnLco18OhpYj8rJdaP1Y2sq
X-Received: by 2002:a05:622a:1baa:b0:3fb:587f:a3f9 with SMTP id bp42-20020a05622a1baa00b003fb587fa3f9mr10670662qtb.6.1687190344786;
        Mon, 19 Jun 2023 08:59:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687190344; cv=none;
        d=google.com; s=arc-20160816;
        b=NlQcJ4T7rrbsBdYxG5HIyuyEfhEdwMiUf7ifxAQI0yj4YQiJA8GrwfRkOvzkCVkeqU
         PFNvTZVIgPVj0Sdl3bgJj9xs1as7pL7fqGk4Ez9BgAWZDgnVlIo5q51/wqz0Imfrd5+l
         h0yFqHTtVo1egYmXgNAQH36FHuV3G0YNYD9AAT2aweoHsQlfoS7KvLIy5jdMfGwQ0NTO
         U72+6kozpCoBdW14feCP+AtRQ8I4MLuuuP6aUaivfH8EJ0OOpnPJo9HZkYXD28IH/KsP
         phIwNOOz147Fsk28hQgev0/S8hT+zECY0PRdFUapzMnr3Cs2X1YGfmQGBXxqUx80rMWP
         LJrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5IE6VdCy+5nyPiT3uM2mrtltEREsU9D2CPU1cG0RS/U=;
        b=Q1SCCnkdMx9wEeIjsQftciQuXiEYD8RCB9sKN7kTd14nuC0sAiUSehdjpFlDGl2sJY
         dDC8v1Qj7hWiv8TTWSTBQLyoWGIq2TVrfASLzb1rTXbtXeCARMaGKd5RZTNhcVBQrqck
         UyhgdaY5tlFGWmmMOn5ENQARRkl64Zrt0qRbuY1pgFHxpCbTWNVhO50gy79FrPPwgq4l
         DMtr+1l72IK2ZVbs4Kt6bs6Vq+hwfzgoZ2fif575qOxX0+jN1g7wP7fj529VW6U7xmcV
         4WsVL9WNU4TB78yrOTBzqkVPaBbGhj0i2cxq2joSi6CS7/NXQ3KJWJro/lQM9nPPNXNj
         6lEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="LjDi/tnb";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o16-20020a05622a139000b003fdecc72a28si19926qtk.354.2023.06.19.08.59.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 08:59:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="LjDi/tnb";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qBHGM-0001fZ-SV; Mon, 19 Jun 2023 11:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBHFs-0000em-Dc
 for qemu-devel@nongnu.org; Mon, 19 Jun 2023 11:57:27 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBHFp-0005GU-OQ
 for qemu-devel@nongnu.org; Mon, 19 Jun 2023 11:57:24 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9889429a89eso247433866b.1
 for <qemu-devel@nongnu.org>; Mon, 19 Jun 2023 08:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687190240; x=1689782240;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5IE6VdCy+5nyPiT3uM2mrtltEREsU9D2CPU1cG0RS/U=;
 b=LjDi/tnbrgKi561HfPOOcXrLW6YTtLVCJRMxh3FLLzR01EF79MHh9lbB9oGiy2W1l2
 bdrpmQ1z7LblIZ/VJsyrOjpD7ZythfzaFx0x/ZhLgkli++pGzyLBYjtd2OvimrTYQzsw
 2o+ULByta4/h9kmoeZM5UP5fKSigC+lAwNaYrMcwGG7Q12e/jr4pgDV9uDZtoy59Nm22
 EgeF+VDCxKTLPUeL2ja1optHkCsM7d3RR6DhjsnUp4/Sv9WKDLXlmGQ5XquKfuMaFbdm
 rGDOmyUFCMWh7kN5AnBxy2KIK3iB8nOLYxldqtEW1QBgtFF0iijV6r3puFzezspJlbO3
 pHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687190240; x=1689782240;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5IE6VdCy+5nyPiT3uM2mrtltEREsU9D2CPU1cG0RS/U=;
 b=c6a/920UbdIYWfuGq3trFkno6WSpGEkUV7WEkmrsXVUH8JE1yrxz/8ucBri3LHD2gU
 Zde7n+/MAxf0HVeNmo1MurvNU8yaGeO2eNZ/EO3gMECa75tArW0BcPvASWoDDAVBCECI
 OJziugipPVHuECZqcvduu35a4JQ6NR9RgjVW8VXHymhTNYyqmwgvVo/kLRNauEGVRdDh
 rA/tKXZZW06CudR/+hZTl9jxlfbfEJh4OKoZR+FA2GFTZjrPhxrkEjdZ65Yx+eGNcKe0
 5KqgVQmo1UtOZoezjftrJcbxHJpf+hrXp5xlGOEJFiC6PEhhigpoHq76aDP+3msD8Dky
 bGXQ==
X-Gm-Message-State: AC+VfDzqZVuWPY9k9uhjCj94fo+FBrqry5/6CwWJTjVhx7Ejgu/Vz+cs
 ThZzc27AgEsTAY5OZgyR+yrkkiUAbc9HBLX19PT89g==
X-Received: by 2002:a17:907:84b:b0:94e:4285:390c with SMTP id
 ww11-20020a170907084b00b0094e4285390cmr8126108ejb.10.1687190239921; 
 Mon, 19 Jun 2023 08:57:19 -0700 (PDT)
Received: from m1x-phil.lan (sar95-h02-176-184-10-225.dsl.sta.abo.bbox.fr.
 [176.184.10.225]) by smtp.gmail.com with ESMTPSA id
 z19-20020a170906815300b009871b3f961asm3949863ejw.58.2023.06.19.08.57.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Jun 2023 08:57:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 29/34] target/arm/tcg: Extract M-profile definitions to
 'helper-m.h.inc'
Date: Mon, 19 Jun 2023 17:55:05 +0200
Message-Id: <20230619155510.80991-17-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230619155510.80991-1-philmd@linaro.org>
References: <20230619154302.80350-1-philmd@linaro.org>
 <20230619155510.80991-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PU6p9f95Gquk

helper.h is used by all units, but not all require the
M-profile definitions. Move them to a new header; the next
commit will remove it from the common helper.h.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/helper.h           | 17 ++---------------
 target/arm/tcg/helper-m.h.inc | 23 +++++++++++++++++++++++
 2 files changed, 25 insertions(+), 15 deletions(-)
 create mode 100644 target/arm/tcg/helper-m.h.inc

diff --git a/target/arm/helper.h b/target/arm/helper.h
index aae2a38407..70ae3513e5 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -62,21 +62,6 @@ DEF_HELPER_3(cpsr_write, void, env, i32, i32)
 DEF_HELPER_2(cpsr_write_eret, void, env, i32)
 DEF_HELPER_1(cpsr_read, i32, env)
 
-DEF_HELPER_3(v7m_msr, void, env, i32, i32)
-DEF_HELPER_2(v7m_mrs, i32, env, i32)
-
-DEF_HELPER_2(v7m_bxns, void, env, i32)
-DEF_HELPER_2(v7m_blxns, void, env, i32)
-
-DEF_HELPER_3(v7m_tt, i32, env, i32, i32)
-
-DEF_HELPER_1(v7m_preserve_fp_state, void, env)
-
-DEF_HELPER_2(v7m_vlstm, void, env, i32)
-DEF_HELPER_2(v7m_vlldm, void, env, i32)
-
-DEF_HELPER_2(v8m_stackcheck, void, env, i32)
-
 DEF_HELPER_FLAGS_2(check_bxj_trap, TCG_CALL_NO_WG, void, env, i32)
 
 DEF_HELPER_4(access_check_cp_reg, cptr, env, i32, i32, i32)
@@ -110,3 +95,5 @@ DEF_HELPER_3(ror_cc, i32, env, i32, i32)
 
 DEF_HELPER_FLAGS_3(crc32, TCG_CALL_NO_RWG_SE, i32, i32, i32, i32)
 DEF_HELPER_FLAGS_3(crc32c, TCG_CALL_NO_RWG_SE, i32, i32, i32, i32)
+
+#include "tcg/helper-m.h.inc"
diff --git a/target/arm/tcg/helper-m.h.inc b/target/arm/tcg/helper-m.h.inc
new file mode 100644
index 0000000000..122311b6d0
--- /dev/null
+++ b/target/arm/tcg/helper-m.h.inc
@@ -0,0 +1,23 @@
+/*
+ * ARM M-profile helper definitions
+ *
+ * Copyright (c) 2007 CodeSourcery.
+ * Written by Paul Brook
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+DEF_HELPER_3(v7m_msr, void, env, i32, i32)
+DEF_HELPER_2(v7m_mrs, i32, env, i32)
+
+DEF_HELPER_2(v7m_bxns, void, env, i32)
+DEF_HELPER_2(v7m_blxns, void, env, i32)
+
+DEF_HELPER_3(v7m_tt, i32, env, i32, i32)
+
+DEF_HELPER_1(v7m_preserve_fp_state, void, env)
+
+DEF_HELPER_2(v7m_vlstm, void, env, i32)
+DEF_HELPER_2(v7m_vlldm, void, env, i32)
+
+DEF_HELPER_2(v8m_stackcheck, void, env, i32)
-- 
2.38.1

