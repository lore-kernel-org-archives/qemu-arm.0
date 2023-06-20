Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp243763ejt;
        Tue, 20 Jun 2023 05:45:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7xX1v7CyIRKySvC4VhbsVnxks1hWHJlEthX3Xt7HaLPqnFKHLAdeInPtY0JxHoQQmkLtQw
X-Received: by 2002:a05:6214:f01:b0:625:87e4:1689 with SMTP id gw1-20020a0562140f0100b0062587e41689mr16495432qvb.20.1687265104800;
        Tue, 20 Jun 2023 05:45:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687265104; cv=none;
        d=google.com; s=arc-20160816;
        b=DbBecyXF0B4zoN6skS5uqAsPeGyycoNa3GMzlNwjNVAJt8wPwLLR4k4bQ7EduoMZ72
         teffj7l/RFcaceqKll8kXvfCFYYRFpMAklF3mYcCUzXWunbvosNrcHUNnqt1iZiFOzPt
         L6b5RVYBg85wVABpds+7zYdCKw65Yfm0PwoEjP4eNgvx7avVv4ELa1DC+bI5SLfJiPDs
         vXvJs3RSWSI6VJ13Uuo4d/uTkL78BPdmXkwq78hCca70IUtURozXZgy7upPVNikHn4cT
         qyRtiJbDjrazKaSBozHAnUerEawAX3PzE7HrX63VXZCHdoLh2VQNm84JOw0yQhwzlZP+
         nifA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=irb1bcAxmLRSQxKZzPVrWrEt6VHF66cR7h47zynBB3Q=;
        b=lZFAfgd4yeP5mOz082iK659FL0kMSK+daV6R1EGbRpa6Ro0Dv+IG4rdwnq3DZxyKYk
         LPqCxANVwIjX0h9MJH5f71DYGnBiGF2i9ubphPPE002p+jGK/RB/Is8OigjsAziinvAE
         ypEQhurkDrhFfkIviytGnvJSHJ/WLkhg3jfoJ6BINJQEjbcLMK3ztZs7gqGiHN9eP6Ao
         Oz2E9RRusZz1TU3U1BZ0RxIp/v/I3cDQDz7joy5HerV1zNIIFNgBxYt8Azh9WG31NtD+
         ipgFeV9TOzWBQrrCfJWSiNs+WrV+TwfyHEItOXQmCR5MwdhFKtUb+naZmgmuxqUiF233
         G2vw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YFdzNeRD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s10-20020a0562140caa00b0062377b26dddsi783024qvs.572.2023.06.20.05.45.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 05:45:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YFdzNeRD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qBaig-0001PH-Hj; Tue, 20 Jun 2023 08:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBaif-0001Ow-9Y
 for qemu-devel@nongnu.org; Tue, 20 Jun 2023 08:44:25 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBaid-0001pm-Jr
 for qemu-devel@nongnu.org; Tue, 20 Jun 2023 08:44:25 -0400
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f7677a94d1so6185219e87.0
 for <qemu-devel@nongnu.org>; Tue, 20 Jun 2023 05:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687265061; x=1689857061;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=irb1bcAxmLRSQxKZzPVrWrEt6VHF66cR7h47zynBB3Q=;
 b=YFdzNeRDTZgG1Lbc6DOUDqd2n6ALfm7VnoGy9gqpYAY82BZIDpDtj6HW1Y5cJ6eAQi
 6TGSXBhxGuSuoPKue8Zox/17Mg5sTAmPoDQuXh6VhB0wa51RUIIVsch89aj9wGz/IO7F
 HVc8Py8Hj02FLg2OeBkaMm4y1AWX2ru9ANZrLkAyDOQCf5WsKPOyLTFrHl4uRvP99TjL
 EIbVtRJkXuttBayJETITuEfag2eoIZ2FTjaTonP9et3oCV3r/3EJhpVVrs2hgoLY4HQ5
 UlOdcY9FHVwWdlkeCt5ftyqEEnPSR9boWS94pHzlXOtMJRKDleTPTNkKyqTw3mO6IItZ
 LF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687265061; x=1689857061;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=irb1bcAxmLRSQxKZzPVrWrEt6VHF66cR7h47zynBB3Q=;
 b=CJKF+2/q9WueSzcfmqEToiFOQzH99WgvzqC/eVCfCh1d75luaKyefdE13oIpZXHXgB
 rzWnF2M+SvucqYf32TkFUgLRtA8sLGD9CM4nYh1NaU8CbfVPHjH8r/ZBwC0YuJXvp1dW
 xFowVRu2STxMugOdIIke8pFBYmanc9qih1sm/FNFSQQlfuFnN8OzR0LtPfPtWgiCeMr6
 tGAeJvrV7kKyf2Dj31Fjt/kQ08lzTEq7anv56Ls6KW409lALJfWugTJ+W8OJANj9B921
 FUkMgVsMNJG8tuQgDvHzYcT4qgxydSCztA/fxgqlhsGExugSpK3Dc61eVs+h8qawiqjf
 n2fA==
X-Gm-Message-State: AC+VfDyLu4f9uCWYhecfrJPk2wV5ylCBOS01u4MvoLzZluj3n5eZrhw/
 Gu8Dj/HC8mfLnfwZ1riwce/LamZsqgw9NyJGJbFflYSP
X-Received: by 2002:ac2:5b05:0:b0:4f6:2b29:b446 with SMTP id
 v5-20020ac25b05000000b004f62b29b446mr7236929lfn.21.1687265061542; 
 Tue, 20 Jun 2023 05:44:21 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 w9-20020aa7dcc9000000b0051a313a66e8sm1142541edu.45.2023.06.20.05.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 05:44:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 01/20] target/arm: Add isar_feature_aa64_rme
Date: Tue, 20 Jun 2023 14:43:59 +0200
Message-Id: <20230620124418.805717-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620124418.805717-1-richard.henderson@linaro.org>
References: <20230620124418.805717-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: celnYmv3HfVy

Add the missing field for ID_AA64PFR0, and the predicate.
Disable it if EL3 is forced off by the board or command-line.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 6 ++++++
 target/arm/cpu.c | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index af0119addf..c84ec2752f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2195,6 +2195,7 @@ FIELD(ID_AA64PFR0, SEL2, 36, 4)
 FIELD(ID_AA64PFR0, MPAM, 40, 4)
 FIELD(ID_AA64PFR0, AMU, 44, 4)
 FIELD(ID_AA64PFR0, DIT, 48, 4)
+FIELD(ID_AA64PFR0, RME, 52, 4)
 FIELD(ID_AA64PFR0, CSV2, 56, 4)
 FIELD(ID_AA64PFR0, CSV3, 60, 4)
 
@@ -3814,6 +3815,11 @@ static inline bool isar_feature_aa64_sel2(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, SEL2) != 0;
 }
 
+static inline bool isar_feature_aa64_rme(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, RME) != 0;
+}
+
 static inline bool isar_feature_aa64_vh(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, VH) != 0;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 353fc48567..842e1b53ee 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1989,6 +1989,10 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         cpu->isar.id_dfr0 = FIELD_DP32(cpu->isar.id_dfr0, ID_DFR0, COPSDBG, 0);
         cpu->isar.id_aa64pfr0 = FIELD_DP64(cpu->isar.id_aa64pfr0,
                                            ID_AA64PFR0, EL3, 0);
+
+        /* Disable the realm management extension, which requires EL3. */
+        cpu->isar.id_aa64pfr0 = FIELD_DP64(cpu->isar.id_aa64pfr0,
+                                           ID_AA64PFR0, RME, 0);
     }
 
     if (!cpu->has_el2) {
-- 
2.34.1

