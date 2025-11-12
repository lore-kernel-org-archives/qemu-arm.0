Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5CF0CCFA1A
	for <qemu-arm@archiver.kernel.org>; Wed, 12 Nov 2025 00:52:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vIz55-0004R2-O6; Tue, 11 Nov 2025 19:51:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1vIz52-0004OX-Or
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 19:51:24 -0500
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1vIz51-0005p1-Cn
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 19:51:24 -0500
Received: by mail-qv1-xf2c.google.com with SMTP id
 6a1803df08f44-882451b353fso1844216d6.1
 for <qemu-arm@nongnu.org>; Tue, 11 Nov 2025 16:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762908682; x=1763513482; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CaohwLtIR7C9243DMpjNQ1vbzBgBz3c5xAC0e8E0Q+0=;
 b=CEgWIjNkVsVgpAojw07FM1Yh5cdq5ET05ul1GlNQT/lz6xHqsXvKCC/Va71iOz0N1B
 JkntsRunPQvKirMFNO0sRFNNE3xKeKPHj/NXE93zqe9nGJit2MiLogNuU3pJZ70SoQ+5
 RkZmXO4BVDo23Vg92GGkovt+pdfRWU7nm8FJLuDIzsOIA4+iX9/ijkeIr81v6E+8G4t/
 F2qpuSy7xIjpP/gs/w3JAXltsfBWoOZiHopGOJfb3zFis7UnhZTJxtH0HOvwXu3gXlB/
 yZ15Dg20sQ0/VWguNxgY8NMcaAKYNCa7jmMvCpxziYNKwrfMtnj8p0/I6QuStMbrGlUj
 kB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762908682; x=1763513482;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CaohwLtIR7C9243DMpjNQ1vbzBgBz3c5xAC0e8E0Q+0=;
 b=uQ2Pkj/Hqs2fpTItjZeFEmCiBgGaM2OG9P9xlUcUXBSAyox39vmGycHHi72Wg1nBGw
 40Exp/YJGjioV4AkXnXdpXITAGnI1k4TgK90P6EwAjb4xc+137TAiuCxWknweXVz46Qn
 333Xkqkkl5NuttyEqSbPhGYljctFZKemVXgCtMeJbFy1wYJqy6ZjEEgNaiv18HXwGW3E
 rYFd5rIJfp3U/1erNChXGH2QmPoKYow61rMjWUrzC3D6FIY9YYSpVTrbrNW4Nf7P9SjK
 jA/GbVy90vVdnvGNt2DqaoKHpyAFp1NJzN1HZvpCobcZ2NkFvPebpKIM2XSJfGhhC/i3
 afqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXCa8Aiif66919OwPcYFlnuoB6aILBP2wYVl/XaGgp/iD+tSiP7EgvyGai+jI84upCOL+Hmc48lw==@nongnu.org
X-Gm-Message-State: AOJu0YwMCmlbgYI3Olr7eB8Yc4xTcjEaDmRNIC1okDEqJiJ/JKn+YPQl
 /2ZcTalrDz3K8cM3ud078Wpa+garqQ0en4iZKyeH59dY5MihHRH3h70cyudYVZtF
X-Gm-Gg: ASbGnctYUjcN8JCXeOdUyZ+Xkbqv8aU2/DJNDaDB+i4z7yAlejfzhvZFaa+R1XNEZkf
 wB39YxqQIs/kCkFe9JH2JfN9gabBCmE4tyce9vHDpFtUVsMe2ZvypA1sxaCJQ4QwdeoG2reyr/l
 SBvMUvLYDaItWmmQ/vM0W1hCnarM+EGJl+qnOvWotMEZFtEa2VAz+lg68rQg8/eSh53qXXCuOYv
 U2j5sshL+EOlnV0G8tFPm0QZlfDLxMhqJuX22/+YUl6NuPlfUvDuyRnFOz3PmpbFdT79QXw5nkX
 sAkFfhvL22GhKusLp/WkElNrrTWrPTJ4jn+4FTKYJ6k9qFQ2lv86vf0KpU1xT+UEHdA8COZI45w
 u0Oq/TPnEfaMlsaRBRUvO8/O+zLYBEpbvOdx8HL+OMICabVhRckH/YLyRMRCOR6vGwSd821pq7w
 Nej6yJTxiT
X-Google-Smtp-Source: AGHT+IF+iQ2O/bPV8bzxfq2n7/AJoDexY+2jxkQwYFmiEtInhWya4OGn7/fLuEKgyLuWPYTyEA8u7w==
X-Received: by 2002:ad4:5aae:0:b0:882:49b3:c696 with SMTP id
 6a1803df08f44-88271a1145emr19627776d6.50.1762908681800; 
 Tue, 11 Nov 2025 16:51:21 -0800 (PST)
Received: from [10.0.0.22] ([185.213.193.149])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8823892a79fsm81445096d6.4.2025.11.11.16.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 16:51:21 -0800 (PST)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Tue, 11 Nov 2025 19:50:53 -0500
Subject: [PATCH RFC 4/5] target/arm: add FEAT_MTE_STORE_ONLY logic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-feat-mte4-v1-4-72ef5cf276f9@gmail.com>
References: <20251111-feat-mte4-v1-0-72ef5cf276f9@gmail.com>
In-Reply-To: <20251111-feat-mte4-v1-0-72ef5cf276f9@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org, 
 Gabriel Brookman <brookmangabriel@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762908676; l=1406;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=yvgh0EMVT0ltvLWA+q61dbTURKT5fEJL48Kbo0rzv/c=;
 b=Kdv1k+wkfEJeapVX/a2Nintjqzq2Mrx8gjbxU6/lwZPigtn5Tki8JOSTHHSblyJE+Js2qB2/d
 01WgRerU9qCDZtFMgUUQOUCmG+dOCMGCcZctDyrpWKn9YZpS2bAt7M3
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=brookmangabriel@gmail.com; helo=mail-qv1-xf2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

This feature automatically succeeds tag checks on load instructions when
the appropriate SCTLR_TCSO register for the current exception level is
set.

Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
---
 target/arm/tcg/mte_helper.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index bb48fe359b..3f7e89f436 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -865,8 +865,30 @@ static int mte_probe_int(CPUARMState *env, uint32_t desc, uint64_t ptr,
     return 0;
 }
 
+static bool mte_store_only_active(CPUARMState *env)
+{
+    int el = arm_current_el(env);
+    if (el) {
+        if (SCTLR_TSCO & env->cp15.sctlr_el[el]) {
+            return true;
+        }
+    } else {
+        if ((HCR_E2H & env->cp15.hcr_el2) &&
+            (SCTLR_TSCO0 & env->cp15.sctlr_el[2])) {
+            return true;
+        } else if (SCTLR_TSCO0 & env->cp15.sctlr_el[1]) {
+            return true;
+        }
+    }
+    return false;
+}
+
 uint64_t mte_check(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra)
 {
+    if (!FIELD_EX32(desc, MTEDESC, WRITE) && mte_store_only_active(env)) {
+        return useronly_clean_ptr(ptr);
+    }
+
     uint64_t fault;
     int ret = mte_probe_int(env, desc, ptr, ra, &fault);
 

-- 
2.51.2


