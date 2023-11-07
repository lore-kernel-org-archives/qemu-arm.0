Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp274264ejv;
        Tue, 7 Nov 2023 04:27:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGdoOQ59i+MDep4grW+kR9Nw2GlkhkpiVB60XLAkVsH/c+gTs/rSrqqHH45oxt614zRppg
X-Received: by 2002:a05:6830:410b:b0:6b9:bd9d:e333 with SMTP id w11-20020a056830410b00b006b9bd9de333mr37960203ott.3.1699360071426;
        Tue, 07 Nov 2023 04:27:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699360071; cv=none;
        d=google.com; s=arc-20160816;
        b=CPhw2pmPdTaxk5NqJNP9c5wNhTdXvApKqaOlaPYrUIPGJzdvv5/K71F84FsqK1IHX1
         su/1XxfB894OHRIIUQwaGIvpt0KOncrNs/Pqi1CekhYO/o6/qmP2/qdYNwluK1RXiKOF
         rxZvH19nji9j14JDBk/z/vo42IaR9z+JiCnXupqrK/UEzfOFsbL7n5dTVkTaaxael/Gl
         cnWMEV25reuDUXX+N4Cd+jt4K0ZyLnFgZhcuH/tfjf7KMkb0BxiIOsys3hlJn4+KLL41
         r4rjoi3wTdCYabiqOsjH98VS3ephJb6l+U90RGtncNV1f/N/IfQr9gCPRFVpFXBFgZtL
         AuvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UxnI5l2WrvXzGWFNPDGJXP6PFry6juDuplDEP4dg9mo=;
        fh=zqCJK/GNKinD327RpwX+nzDujFsGQ+TAosBHb+QbdKo=;
        b=V+Bjwg1TaVPZUTl0xobUKHsaxNzDAxZCdMT7AL0OA15gVrDlzlm1rffn2qsDXiWsC9
         DZ1libIdty4B0jHz3/MVYYc3ulCfwuaH6RH7wKU6B7OMRfl045o4VG6a56q8LWlmUmly
         3vX5vKOzJoqzoCmvX43BCWHsU4NI4s4hZABOGIyR5+E1CeixajgGTYrdUvJMM0tcSyxf
         UlhlOTgyivCs+j5uda2Nik3t+UQ1g0aCOZE8Us09XgloO/+lWo8w9fjYPMza5hSBPR4N
         VKJqsHKyhCK8L21FfKzTuNfWQFccj0Dr7jmkSrqTyuabk5KWgfzWb1rer6Eh0SDSWY72
         2TCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uvFaXAlb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a17-20020a05622a065100b00419a6207c03si6811380qtb.81.2023.11.07.04.27.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Nov 2023 04:27:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uvFaXAlb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r0L9P-00067L-Jc; Tue, 07 Nov 2023 07:25:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0L9H-00061o-Ro
 for qemu-arm@nongnu.org; Tue, 07 Nov 2023 07:25:39 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0L8q-0004sl-Ah
 for qemu-arm@nongnu.org; Tue, 07 Nov 2023 07:25:39 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40853c639abso40939335e9.0
 for <qemu-arm@nongnu.org>; Tue, 07 Nov 2023 04:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699359909; x=1699964709; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UxnI5l2WrvXzGWFNPDGJXP6PFry6juDuplDEP4dg9mo=;
 b=uvFaXAlbTD379AqDpzf2RuvSSg/B3IUDqFXxKNUMDaHwUKROqW5G6RBHIJF8Y6pY6u
 RwsXoJflvDktMUYpGZX1aocKFVVG8f9gsxt8covcgQ6XwzP019l2482uQ2Giwbm4d26Q
 ej4joL7l23BIcufuSkxaHM6RES0l1pBVr8vxK9jrcsuQzWvodFKip4EsmexvOppsuZZw
 +PFoSiXZV3pJE8DahoR+V/QBvdDnkNR0T3s/RSuoz8E+n7flkzUuYmNIchxQWCHTqks5
 3TNdTDrh4H0kTuphjqY+qkfenlVbU2ZpSp3G97Ts8IIH3qvlc8iZAtEZ0vjOZ3MNMIpJ
 tSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699359909; x=1699964709;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UxnI5l2WrvXzGWFNPDGJXP6PFry6juDuplDEP4dg9mo=;
 b=rromh+eto8IKZMgKy/6qDAlFv3ds/U/qjasBIKP7wRw4sAxVioxmuOI1WFQdSDWI4S
 F/ntvemXHB5yFnn4ri5CTJ/us9rQQnoxB5xwhuYfm8ZxuxKolpJRv0tzeIlsg9PKIYKH
 IN3jBzk5gztdjdQnvh8fL1FLs1P6JmsQ5+3GsdUEwUPGU+Gx7NLedTx/ALZiYdmw6cIA
 5jQsKhHaPTeDqrmoEwPGOebE5cVdgEaFIvmAny+7BKKn3+iBFN80BVS68bRz2PtC+tBq
 ahK3erTOcHbZ+GCU0ZWmWndMbhBdRoVEMk+TarbYpy+lVsXYVvTSWDOPctrKAkFxVwpC
 QMrA==
X-Gm-Message-State: AOJu0YzjHrkTIQoBih26P0UJSfhNuavx5zAKq33feQzFx2oUsgp2MCLL
 K3JflgOXNFO7ZNDn68gEdKy62Q==
X-Received: by 2002:adf:f1d0:0:b0:32d:84e8:eef2 with SMTP id
 z16-20020adff1d0000000b0032d84e8eef2mr22297913wro.33.1699359908952; 
 Tue, 07 Nov 2023 04:25:08 -0800 (PST)
Received: from m1x-phil.lan ([176.187.216.69])
 by smtp.gmail.com with ESMTPSA id
 t11-20020a5d49cb000000b003248a490e3asm2215974wrs.39.2023.11.07.04.25.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Nov 2023 04:25:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 39/75] target/ppc: Move powerpc_excp_t definition to 'cpu.h'
Date: Tue,  7 Nov 2023 13:24:29 +0100
Message-ID: <20231107122442.58674-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231107122442.58674-1-philmd@linaro.org>
References: <20231107122442.58674-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: SNdoM5tfvwni

The powerpc_excp_t definition is only used by target/ppc/, no need
to expose it. Restrict it by moving it to "target/ppc/cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20231013125630.95116-6-philmd@linaro.org>
---
 target/ppc/cpu-qom.h | 29 -----------------------------
 target/ppc/cpu.h     | 27 +++++++++++++++++++++++++++
 2 files changed, 27 insertions(+), 29 deletions(-)

diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 65a640470f..acc5f1a1dc 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -78,35 +78,6 @@ static inline bool mmu_is_64bit(powerpc_mmu_t mmu_model)
     return mmu_model & POWERPC_MMU_64;
 }
 
-/*****************************************************************************/
-/* Exception model                                                           */
-typedef enum powerpc_excp_t powerpc_excp_t;
-enum powerpc_excp_t {
-    POWERPC_EXCP_UNKNOWN   = 0,
-    /* Standard PowerPC exception model */
-    POWERPC_EXCP_STD,
-    /* PowerPC 40x exception model      */
-    POWERPC_EXCP_40x,
-    /* PowerPC 603/604/G2 exception model */
-    POWERPC_EXCP_6xx,
-    /* PowerPC 7xx exception model      */
-    POWERPC_EXCP_7xx,
-    /* PowerPC 74xx exception model     */
-    POWERPC_EXCP_74xx,
-    /* BookE exception model            */
-    POWERPC_EXCP_BOOKE,
-    /* PowerPC 970 exception model      */
-    POWERPC_EXCP_970,
-    /* POWER7 exception model           */
-    POWERPC_EXCP_POWER7,
-    /* POWER8 exception model           */
-    POWERPC_EXCP_POWER8,
-    /* POWER9 exception model           */
-    POWERPC_EXCP_POWER9,
-    /* POWER10 exception model           */
-    POWERPC_EXCP_POWER10,
-};
-
 /*****************************************************************************/
 /* Input pins model                                                          */
 typedef enum powerpc_input_t powerpc_input_t;
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 55330d9319..94a804a605 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -192,6 +192,33 @@ enum {
     POWERPC_EXCP_TRAP          = 0x40,
 };
 
+/* Exception model                                                           */
+typedef enum powerpc_excp_t {
+    POWERPC_EXCP_UNKNOWN   = 0,
+    /* Standard PowerPC exception model */
+    POWERPC_EXCP_STD,
+    /* PowerPC 40x exception model      */
+    POWERPC_EXCP_40x,
+    /* PowerPC 603/604/G2 exception model */
+    POWERPC_EXCP_6xx,
+    /* PowerPC 7xx exception model      */
+    POWERPC_EXCP_7xx,
+    /* PowerPC 74xx exception model     */
+    POWERPC_EXCP_74xx,
+    /* BookE exception model            */
+    POWERPC_EXCP_BOOKE,
+    /* PowerPC 970 exception model      */
+    POWERPC_EXCP_970,
+    /* POWER7 exception model           */
+    POWERPC_EXCP_POWER7,
+    /* POWER8 exception model           */
+    POWERPC_EXCP_POWER8,
+    /* POWER9 exception model           */
+    POWERPC_EXCP_POWER9,
+    /* POWER10 exception model           */
+    POWERPC_EXCP_POWER10,
+} powerpc_excp_t;
+
 #define PPC_INPUT(env) ((env)->bus_model)
 
 /*****************************************************************************/
-- 
2.41.0

