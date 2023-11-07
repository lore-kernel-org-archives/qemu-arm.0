Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp274716ejv;
        Tue, 7 Nov 2023 04:28:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElJP6jEhN8HgXTMvVDIIxkG+h6kxl4GphkOBHBgg3CPN/LOpTIKK4dDENx8gB816wA/fOT
X-Received: by 2002:a05:622a:c7:b0:410:9089:6b74 with SMTP id p7-20020a05622a00c700b0041090896b74mr36208020qtw.15.1699360128187;
        Tue, 07 Nov 2023 04:28:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699360128; cv=none;
        d=google.com; s=arc-20160816;
        b=LtEyXi8goH2+ApsrKj2ldXtqxuAcrEeAMQcq8cxGawg2nlusq/1sp1p7oJHYlfp5Bo
         qvq4l6Q8h2q+gjWX3p3VL/HtNk3QNl/mgSSOUdPbxDJABqb+OUvyoGTlxGxl13nAg1Ej
         djs6Syg2R11dlCR9NSGj8WZyAF3mKfQ73u+hUFbJfIzXtDVil7BHORVOMhkcoyy3J/XU
         bqyCBqDg8yUW8wRJtM3lAjA2iriPP65fAvlc1FQzgec16+WpqQL2ASespccArbyqNl+i
         PG7uqJ1Uv1TVm2TchToTyXkS9Y8nKDxamFixEP2I0+BBryEUS3RiCGrgCFK7GA9r57Jt
         kL9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=g4cBhoinmiIEOsb8jCdcceaN6JxCpOf4XdeJF400+y0=;
        fh=zqCJK/GNKinD327RpwX+nzDujFsGQ+TAosBHb+QbdKo=;
        b=ozW25YgippsZg6Vsi16Kk2YJQlJsHA/vX8cROr33yDxuYJpTWfxWDUEmBt5wI4vUwr
         sOP+rlE/BJXi6peY5LVN1IPChjboNv+g6CFn70/q7TOQK/xF6OCgqyJxQBpyA4U82oKB
         F9s4HHXY23bhHrsdWdvRu0QRnIAzIWyc0ymX4f25mKOD/jTefWpzdKtgiS+uO7hy3cTH
         jMYoHgVuIsw3O5/3XgnuO/GIDWO6U82DBPU6DV5OvfsZlKSmthq8ELk7y2UsSE5/Ep+T
         J6AHl1VSTsfdf2GiaxFLdvtBiGNF+lalBTOzAvbEyc1ebG8VdfQKXeBY0itKnHoAbudB
         qNpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hXsEyFg6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e21-20020ac84e55000000b004180387dcc0si6706537qtw.605.2023.11.07.04.28.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Nov 2023 04:28:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hXsEyFg6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r0L9y-0006om-ER; Tue, 07 Nov 2023 07:26:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0L9P-00067G-G4
 for qemu-arm@nongnu.org; Tue, 07 Nov 2023 07:25:54 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0L90-0004vS-Uk
 for qemu-arm@nongnu.org; Tue, 07 Nov 2023 07:25:43 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-32f70391608so2843019f8f.2
 for <qemu-arm@nongnu.org>; Tue, 07 Nov 2023 04:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699359921; x=1699964721; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g4cBhoinmiIEOsb8jCdcceaN6JxCpOf4XdeJF400+y0=;
 b=hXsEyFg6eqEJIcw44ySSreJrmPVDQXSDoL50JWIkZd62bWCUWTZIGNxHtVexR2D9Io
 JeywT/gO5swBPzaPeI/PTypY8278J376Jvx0sZexilBE/BBdfG0co35HLZu8SQVS6EEm
 cW9jjk0Rne6uFZZKHddK88xgMpAmYnsZWIkJMTkEpflR9SUKiHYz9MtuJWLZpsgpG1wU
 9XlY9Vsq6xEjACXepCNhKdF25dnSsSbMtKDB65TPGCM4kbdJRIhVbyIL0Nlud8PW21XE
 4nRueoVsCV/UabaQ0obCT7FW41aHeM8XtoFKLkrUpCXJbQ6G2GiKFXssct5MKcgQoVhJ
 zHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699359921; x=1699964721;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g4cBhoinmiIEOsb8jCdcceaN6JxCpOf4XdeJF400+y0=;
 b=NfDvKsGVfjz7XfLxYzKFPyK5PdCiTRVrGM4X64PHIcd2yQJcP097BUWbZUBIo5l/dh
 hhsP7/WIvwRN5amtY8WEEGXg6R5a0PdsyMgA1lpKRKOsYYi2+Cv65qHNWll0BNQ6RDqK
 zoGJ5K1SFPLhlApdL+apUZakwHOqAkI6X5Pf2o5UTxyHqawawx4WUBRuDsP967eKzeqB
 7STh6dsTsw7HIOZvBq4RCaxjyjyoKyOpQuTBnqKPv+8C0hAKwjVH4rHackuT8omplYTh
 0HI7iSNbq+sn8aJZZ52c7/B1Z4gyJHC+tcQT9jbj/DZXMC9ZwiKl9n7xQrGH1FAOQOm5
 6GUg==
X-Gm-Message-State: AOJu0YzT/gq4TA86mV0eLa+zaz1BAoWNM9/59fRMYXhGUEr0T7H5KNur
 KJIEchsRnwXQqE88wS38kG7KbA==
X-Received: by 2002:a5d:588f:0:b0:32f:7e1d:f039 with SMTP id
 n15-20020a5d588f000000b0032f7e1df039mr23964336wrf.46.1699359921327; 
 Tue, 07 Nov 2023 04:25:21 -0800 (PST)
Received: from m1x-phil.lan ([176.187.216.69])
 by smtp.gmail.com with ESMTPSA id
 k4-20020a5d6d44000000b0032dc1fc84f2sm2241399wri.46.2023.11.07.04.25.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Nov 2023 04:25:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 41/75] target/ppc: Move powerpc_input_t definition to 'cpu.h'
Date: Tue,  7 Nov 2023 13:24:31 +0100
Message-ID: <20231107122442.58674-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231107122442.58674-1-philmd@linaro.org>
References: <20231107122442.58674-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
X-TUID: yNaUvICuD+cd

The powerpc_input_t definition is only used by target/ppc/, no need
to expose it. Restrict it by moving it to "target/ppc/cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20231013125630.95116-8-philmd@linaro.org>
---
 target/ppc/cpu-qom.h | 21 ---------------------
 target/ppc/cpu.h     | 20 ++++++++++++++++++++
 2 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index c35374e15f..0241609efe 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -35,27 +35,6 @@ OBJECT_DECLARE_CPU_TYPE(PowerPCCPU, PowerPCCPUClass, POWERPC_CPU)
 
 #define TYPE_HOST_POWERPC_CPU POWERPC_CPU_TYPE_NAME("host")
 
-/*****************************************************************************/
-/* Input pins model                                                          */
-typedef enum powerpc_input_t powerpc_input_t;
-enum powerpc_input_t {
-    PPC_FLAGS_INPUT_UNKNOWN = 0,
-    /* PowerPC 6xx bus                  */
-    PPC_FLAGS_INPUT_6xx,
-    /* BookE bus                        */
-    PPC_FLAGS_INPUT_BookE,
-    /* PowerPC 405 bus                  */
-    PPC_FLAGS_INPUT_405,
-    /* PowerPC 970 bus                  */
-    PPC_FLAGS_INPUT_970,
-    /* PowerPC POWER7 bus               */
-    PPC_FLAGS_INPUT_POWER7,
-    /* PowerPC POWER9 bus               */
-    PPC_FLAGS_INPUT_POWER9,
-    /* Freescale RCPU bus               */
-    PPC_FLAGS_INPUT_RCPU,
-};
-
 #ifndef CONFIG_USER_ONLY
 typedef struct PPCTimebase {
     uint64_t guest_timebase;
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index d859c45a2e..f8101ffa29 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -261,6 +261,26 @@ static inline bool mmu_is_64bit(powerpc_mmu_t mmu_model)
     return mmu_model & POWERPC_MMU_64;
 }
 
+/*****************************************************************************/
+/* Input pins model                                                          */
+typedef enum powerpc_input_t {
+    PPC_FLAGS_INPUT_UNKNOWN = 0,
+    /* PowerPC 6xx bus                  */
+    PPC_FLAGS_INPUT_6xx,
+    /* BookE bus                        */
+    PPC_FLAGS_INPUT_BookE,
+    /* PowerPC 405 bus                  */
+    PPC_FLAGS_INPUT_405,
+    /* PowerPC 970 bus                  */
+    PPC_FLAGS_INPUT_970,
+    /* PowerPC POWER7 bus               */
+    PPC_FLAGS_INPUT_POWER7,
+    /* PowerPC POWER9 bus               */
+    PPC_FLAGS_INPUT_POWER9,
+    /* Freescale RCPU bus               */
+    PPC_FLAGS_INPUT_RCPU,
+} powerpc_input_t;
+
 #define PPC_INPUT(env) ((env)->bus_model)
 
 /*****************************************************************************/
-- 
2.41.0

