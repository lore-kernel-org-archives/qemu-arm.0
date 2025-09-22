Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76FA8CAC592
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 18:53:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0lbg-0004id-Gk; Mon, 22 Sep 2025 14:49:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lbZ-0004e1-5V
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:49:41 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lbU-00043z-BF
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:49:40 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-77da29413acso5013693b3a.1
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758566972; x=1759171772; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=usu7YBpSCdSYku4HM9JrcfIZ8CuetQgTTrUpbI5sQ3I=;
 b=IKTx84AMUs0JouFXSYG0rhGgtmzF77MBB603x5QcLkjCYqepetsfxV+PXA12p514H+
 FxZQ2FkCe5xjTQ6QRm4KKs5zbSIjVQE/OXJpjJ5mjo9/vgHEqCrRGkWdJHg5SwVZZ5xh
 ArLowqMEvh/1RVBwU76TpUGCJht7sCvVNmTajSm8ydXEqNuOCgQ/iksfueclEWMzQ0Mw
 TTFHHdAUaufwnoV02zEUp2EIHd0Ut3o97pltaa178ZwfZgUAZnph2Z7LSPJuz2eJ6y7j
 KMSyF9H72wzjvFkdW9tHLPiNhVfBm/Hdfn/VDRApKPf19Orra6HjY1suTxiH4ib9PMcc
 GCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758566972; x=1759171772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=usu7YBpSCdSYku4HM9JrcfIZ8CuetQgTTrUpbI5sQ3I=;
 b=dOhBakYrhMcV2pu1tVCAOxKmb+xCOpHL2gnGeBahL0LnQgPua76FwBw4mChqcqgVi3
 YreT4ie1WzRFZUUk6neDeZhfZyhMQMqzvRVkTDJb+d0rnnNQ6LVyE0wAodA2smbJrW42
 PxzApXCtfMod/AepyOoS8DQDWAJHNXmthJm62+DNbmY/TO+/oQPxhLj5i/xvesUGqo7K
 xI3G2ZEBjmaZFy4HFnBakRpvetYgVM/mzti8igjiP7fikqpWeGP5eVuLTiqBrzEax/P1
 7FQM0SW12x9nlMr68uW01GPeWNC9iss0LZq4DgZtTSTsrtAWwnywEEbSTrQCoxvRdo8t
 RYsQ==
X-Gm-Message-State: AOJu0YzVogpJ831Fkrmz/2wcOnS70qtStKpwJTbCpqs7E4d21kn/aSaF
 0coqy03O6Zu4hSxDpoiWo3PifSlw7BPB+TXNqVkqJMokU4qa0GdDiXeEmQqHBzT4O6jTDH5d/3G
 QZxM3
X-Gm-Gg: ASbGnctFVRYtH/ajgeRjQVGbcJ4aWmU8ymefXVzJMa/oZHlX3rQyiNPRZs4pIaxsfmI
 sWo3AoNaAycdXN9YnX0NT+YOjHrXJfhL/cDOC5pRfyrkqTmHmFQyiWUi4BhXJgQyeajLkOGS1ZN
 HkC81lZem6qbC3NS3xH44oDi19x37VQEPgrPMzr6TTVvsxD7IfGKdzwuzZwe8XV9JvNNBTYDw/M
 LWD6ZEZbzHuzZEdabPdbUzW8jcdwbdl8dCNoukwvVkF84WTI1fLpvTrlqvEZ5GQtBPeIKmbXMXZ
 GL7QTIxPBKx+LWq4mufHvKZ2mJD5QbmyRqs1gaI0t5XtarEuH4VTygf59T9aiXDY8G8UOytH4uE
 V4Vi2OeIVe/Q0RLPcF1LSnmjD8Qwg
X-Google-Smtp-Source: AGHT+IETVvMsCDlXvsd46szIOmlOkgvLZTrqXe3kGWBLJdkSm7XCSuaUvwXqPt0UkqMcz7IyDeJ//w==
X-Received: by 2002:a05:6a00:139d:b0:772:fc2:be71 with SMTP id
 d2e1a72fcca58-77e4e8ab212mr15129226b3a.20.1758566971768; 
 Mon, 22 Sep 2025 11:49:31 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77e5fe6de75sm10583861b3a.19.2025.09.22.11.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:49:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 04/76] target/arm: Force HPD for stage2 translations
Date: Mon, 22 Sep 2025 11:48:12 -0700
Message-ID: <20250922184924.2754205-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Stage2 translations do not have hierarchial permissions.
Setting HPD means we can eliminate an extra check against
regime_is_stage2.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c |  7 +++++--
 target/arm/ptw.c    | 24 +++++++++++++-----------
 2 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c0b499946c..f64543dc78 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9383,8 +9383,11 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         tsz = extract32(tcr, 0, 6);
         gran = tg0_to_gran_size(extract32(tcr, 14, 2));
         if (stage2) {
-            /* VTCR_EL2 */
-            hpd = false;
+            /*
+             * Stage2 does not have hierarchical permissions.
+             * Thus disabling them makes things easier during ptw.
+             */
+            hpd = true;
         } else {
             hpd = extract32(tcr, 24, 1);
         }
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 6344971fa6..ebb260d54d 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1471,8 +1471,12 @@ static ARMVAParameters aa32_va_parameters(CPUARMState *env, uint32_t va,
         }
         tsz = sextract32(tcr, 0, 4) + 8;
         select = 0;
-        hpd = false;
         epd = false;
+        /*
+         * Stage2 does not have hierarchical permissions.
+         * Thus disabling them makes things easier during ptw.
+         */
+        hpd = true;
     } else if (el == 2) {
         /* HTCR */
         tsz = extract32(tcr, 0, 3);
@@ -1978,16 +1982,14 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
      * except NSTable (which we have already handled).
      */
     attrs = new_descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(50, 14));
-    if (!regime_is_stage2(mmu_idx)) {
-        if (!param.hpd) {
-            attrs |= extract64(tableattrs, 0, 2) << 53;     /* XN, PXN */
-            /*
-             * The sense of AP[1] vs APTable[0] is reversed, as APTable[0] == 1
-             * means "force PL1 access only", which means forcing AP[1] to 0.
-             */
-            attrs &= ~(extract64(tableattrs, 2, 1) << 6); /* !APT[0] => AP[1] */
-            attrs |= extract32(tableattrs, 3, 1) << 7;    /* APT[1] => AP[2] */
-        }
+    if (!param.hpd) {
+        attrs |= extract64(tableattrs, 0, 2) << 53;     /* XN, PXN */
+        /*
+         * The sense of AP[1] vs APTable[0] is reversed, as APTable[0] == 1
+         * means "force PL1 access only", which means forcing AP[1] to 0.
+         */
+        attrs &= ~(extract64(tableattrs, 2, 1) << 6); /* !APT[0] => AP[1] */
+        attrs |= extract32(tableattrs, 3, 1) << 7;    /* APT[1] => AP[2] */
     }
 
     ap = extract32(attrs, 6, 2);
-- 
2.43.0


