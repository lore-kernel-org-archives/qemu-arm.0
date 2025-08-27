Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BA0CA0FF9
	for <qemu-arm@archiver.kernel.org>; Wed, 27 Aug 2025 01:20:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ur4hE-0000Ue-LL; Tue, 26 Aug 2025 21:11:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4h6-0008Q4-FT
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:11:20 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4gu-0008T9-TI
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:11:20 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-76e2ea933b7so415259b3a.1
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 18:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756257064; x=1756861864; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HYdBuYvsIPMlk0kxekxMRYHsj1oPaTkk54lWPS2yoN4=;
 b=i7vzb6724Q2Ej48OEqwKDSDeiuXFms7j1QDK+QFLsomD6Xd0AuaOG7H4IvEevoUmWp
 GSE0W5rdFHPCGpRzFRqZXcjYoATZI/VE9UzGzd6dVHr8KUWCvnhw2mBeRT3acuVqb16k
 LkRvC58k5zaALINAOUaOPFytFGq11AD2sgEd/rB1hXuKb7QiVAlQJ+TLxN90a30WJCGL
 FGqpa6FAJ88XSdcaqHeMwp0CmepfNQGttz2O5VYrkNqg6F1qhRcLdbYpNQA/3O3yviJj
 pbMr740GmLZlvPysWtuB9D5prwWoopqvgjtgbhoeQ3u8cBk8PmLGIdPdBdEkCdUe1IyX
 vh3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756257064; x=1756861864;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HYdBuYvsIPMlk0kxekxMRYHsj1oPaTkk54lWPS2yoN4=;
 b=RBlx3iddMQ6kTHHzGD3rFW+Dku/xjWtaQVjrEMb4RxteX3p0UNArMgGZBIFS6x1VQR
 Be8YvffpZqF+nD7MT/sTu6ToegHDr048YBFbqHr4+lMgfjZ554VCl72LL4xkXY+btnjw
 dykcQ3kpw185awnvOqA4kdnuhrkVjnPAqQhNG/JZQgLIeONXLOt5YISJamLNhH1XgX9/
 cr41h2KfKa4Oawdcq6v7a+u+EUHvbinZzv1/OgjbffVuJRaYxBDP/8xLpHIp2kFq4rb8
 xmPmGo2lTyMDAr9BsT/c8wdmkVS1b/yMbt/PGMJ/ftXS53iY3Xc4xK06VN1+xbxb9Ywx
 F95w==
X-Gm-Message-State: AOJu0YyvTUeFLrgH8qPr/FwhD1NQP54+gCEYeimV/eKkQppitewZ3Z1d
 91a8WaPFPGp4HHyTA8GmaG7WjZ7VlQzgms+oVqhA3H/4EnOuD4gt0QR90+BnPrlzdfHPiljbOAq
 ePyVv2yU=
X-Gm-Gg: ASbGncseBeQJoVS+kBmMxWsR9C1kxVNV450ApqaiqqE7V9i5mUrL6Jw/HcNM+5l0dDn
 mbiENfjfsLt+tV5UhAO4tnflcX1Id7GAbV7iLEIa+GfyET9Rxb6OcdrfyzSvZPBTvm9tvsXPSL5
 S0pAm6Qd/T/sJsE5shZfsAOlD/qGNGDeT3CtdhJbbMlwaLIh/Q0JB7W5zTESN+ImvBFNifA4yXy
 Pl8VzyIcP+vGzJq8ooLt7Bn5/56vbcRJxTxWq9ugnF+ITKl/QyG0ZQQXylJEPKgAsDBpKw4BMpK
 rviTiw2673U1owlEV2VON1TxOLKViKBH+SdhVZfP7amsHX7362anyTBmLs1bexurSdy4ZWuWHwS
 dX36uNu0AUxEp5zH6cO97/Cs8gnKTgGsRBz6n
X-Google-Smtp-Source: AGHT+IFT+5lrvtZLewMFE8TaSH9r6KTFZKCENWbNIUByMhcFD7EvGPi5G1LVFCkEJdUNAzRRMyCmPg==
X-Received: by 2002:a05:6a00:14c5:b0:771:e5f3:8840 with SMTP id
 d2e1a72fcca58-771fc293139mr4834209b3a.13.1756257063977; 
 Tue, 26 Aug 2025 18:11:03 -0700 (PDT)
Received: from stoup.. ([144.6.121.55]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-771f2b2d2bfsm4348408b3a.93.2025.08.26.18.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 18:11:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 37/61] target/arm: Implement isar tests for FEAT_SYSREG128,
 FEAT_SYSINSTR128
Date: Wed, 27 Aug 2025 11:04:28 +1000
Message-ID: <20250827010453.4059782-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827010453.4059782-1-richard.henderson@linaro.org>
References: <20250827010453.4059782-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-features.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 5876162428..7a0e515aeb 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -599,6 +599,16 @@ static inline bool isar_feature_aa64_mops(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64ISAR2, MOPS);
 }
 
+static inline bool isar_feature_aa64_sysreg128(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR2, SYSREG_128) != 0;
+}
+
+static inline bool isar_feature_aa64_sysinstr128(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR2, SYSINSTR_128) != 0;
+}
+
 static inline bool isar_feature_aa64_rpres(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64ISAR2, RPRES);
-- 
2.43.0


