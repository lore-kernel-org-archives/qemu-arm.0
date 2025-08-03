Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FDAC87FD2
	for <qemu-arm@archiver.kernel.org>; Sun,  3 Aug 2025 01:42:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiNio-0007N9-DA; Sat, 02 Aug 2025 21:41:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiNie-0007Et-SX
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 21:41:01 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiNic-0004eq-K8
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 21:41:00 -0400
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-e8e2b50f8f1so1983365276.0
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 18:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754185257; x=1754790057; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u2hpklU5tW/phoAllBqiTzLMcPLur7eE9PCzi++QuJw=;
 b=gzak6Knywdbg4T1yL8tGvC2GW5LKbZRahOJlu+UW91pFjd5PJuYnDfM/s6CTUihuYU
 sbDZAuXSNhYXwTIdB4ATfbM5RjFMLLLck/ozlDn8eghbNSvMwX8w2pPaXI0DG9hG4LXh
 O87/xVAdVEJYECKj8EF7poqeuq2CrHEF9c/hPSY6/WfHlRtJRSQOk9bWpxe71PQwg7/z
 NPUl8zf48bWNhzAzp9dplef7oXwlNgEkUh80uyhRNG1/V9ztsFZ8yGFxjI1qzmyT3HaM
 aV/5wgXA3XX0LFMem45jfDJanscEfXVOMasNk87+zVtMlJDNjER3SmGYrPx8R75RRMvG
 Wvhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754185257; x=1754790057;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u2hpklU5tW/phoAllBqiTzLMcPLur7eE9PCzi++QuJw=;
 b=kai+odWc/7uzPnvqLqemW0RxGosdiUqTMNQ3cTglJ30qWzyYSXVZ7UzOrq5L0CClKk
 0pz0qDUZC+xeT5ctFuZX0UsF3JSz+jBEXCjlS+deq1Jg8MEy33AGYl87kfHoU1Fjv43Z
 /Kua2dC0PXI79ZamTdmyMVjwkUHTVPSvOOTsObG04orZytj2+oDDq/hKGkdzAC1nUJl7
 iFnxRRyWZABwBOIB0DRRiq1Qf78hKfkRm4Ci2xVFxCnSfEqlb1G988iTO2xmF90ARKxW
 0zfoR7ftOgqOeqZ42tSLT52dgxztQT1uLWuvQ5hlVlqUY7FnDfIc/p2xlPN7TBmpsSe5
 tWzQ==
X-Gm-Message-State: AOJu0YwESItyY73ZgIcOcyGExRsN+C9dSIOQqhLONrwpr75bRLMZPMBy
 fgLdzsnv90TP7GV30bj1dJJUl0FccSiV7k8Ds+rF8SXt9gLfYa5qryA+XFVRTtnQrCskOc0A8Zu
 msiSaJFc=
X-Gm-Gg: ASbGncuva1VFT+aU3IpO+ZF6LsQAhM1YMYwTZKoJFWXGbNcq5wO2UGC8OxzOGj6GPYs
 xZ2oYLpwQU3obI0nvL2xmi7fXE+de5Tn+H6Hx7QX9wbNEI53SJuCEsxF7pYg42wvcvxfGyO4ZxB
 nqgtBaJxmiSpcDx+Rkg4Zk0/mLxsWU+Ug2JUWm3rhkJ2iDaZy+FUVS11yKNIRVlCl1ub/MgC7nl
 bSqLkh4hx5xPVQktHJN0lUAGkb1qOJcsGWlhr4q5uHErfvqfU0AZopDFccpcQ+kpx0sKVykv0EN
 CNM4PyX+6BrS5VRDLjmaFgRe+sYvyNb3G9AcX8Hpv/gqHZ6kNtn57Io08UofYT53KrlxEHQRrt7
 /p+iIT2TuKogpeEsF6Rngs9fCiw2iNc5mcpofuaV+f02xZ8nlT6M6
X-Google-Smtp-Source: AGHT+IEJbzn7EGFWYapr3XdJmlLJQUUzbaqk31iERqxt71/eY3qCnRBmk6YK7fYnflCRq8m4MJzbLg==
X-Received: by 2002:a05:690c:f8b:b0:710:f1da:1b5f with SMTP id
 00721157ae682-71b7f0a34a3mr66702407b3.34.1754185257501; 
 Sat, 02 Aug 2025 18:40:57 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-71b5a6031a1sm18753227b3.86.2025.08.02.18.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 18:40:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 07/11] target/arm: Add feature predicate for FEAT_CMPBR
Date: Sun,  3 Aug 2025 11:40:15 +1000
Message-ID: <20250803014019.416797-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250803014019.416797-1-richard.henderson@linaro.org>
References: <20250803014019.416797-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=richard.henderson@linaro.org; helo=mail-yb1-xb32.google.com
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
 target/arm/cpu-features.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index f12c5c8be7..744199b776 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -609,6 +609,11 @@ static inline bool isar_feature_aa64_cssc(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64ISAR2, CSSC) != 0;
 }
 
+static inline bool isar_feature_aa64_cmpbr(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR2, CSSC) >= 2;
+}
+
 static inline bool isar_feature_aa64_lut(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64ISAR2, LUT);
-- 
2.43.0


