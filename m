Received: by 2002:a05:6512:2248:0:0:0:0 with SMTP id i8csp486534lfu;
        Sat, 30 Apr 2022 23:58:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxE7Q8SnOnQxLcMR9Ye2zD+d8t9EfwPX65fjevxki17yryiZSEN4raP6/+8MhaN30rbQ3O/
X-Received: by 2002:ae9:eb8d:0:b0:69f:c005:265d with SMTP id b135-20020ae9eb8d000000b0069fc005265dmr4668514qkg.764.1651388326476;
        Sat, 30 Apr 2022 23:58:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651388326; cv=none;
        d=google.com; s=arc-20160816;
        b=iIzM5cW8qUdsGQOPG6oC0StvYDA8ciVwtKuAiU6JxwMcR+1kibtanp4Q4pPtPXJfoO
         1IVGxLrH8Es8Jm12/f+/E63gLZgJwgSXtsNQ3YgZZZE16+Wr7iStAxrDqBE7u1aeIZ+m
         kDgk+9h/EV6jSEq+Igw2rFHeX2acU9nUcC16By2Op9IeJjCs/toCk3cCvZ9cLhsx927k
         gvnTdDtLhwSLxEXkyjYIQiWiPpVkOl/D0D7288p0LYmlCSoV8iSR4iw3Gf+Rwp1UKRyH
         +bRbCwTNJ6h8pC8zyW7mXsJelLT99Pi4OmER+2LEEbNHY22huA+Ys7wwL0wEw91l1p72
         Aa3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=43XuEEQaBW24fA/OpN/C0G+r/QXfL2oSSQvbYI2NnFc=;
        b=VSvMYbwy6pKuey3kqTS+14PHRSft3ALu0X/dGJzlG1R0aU6VgCVrr1vRzAou574d/0
         Blvu4WNihxEEbeZmJ6ZvpMWv/gypvpMNr+mw5PmanssFwEvBU03YJEuC6g0c+VQoU0vN
         PTTmz/uUzKs6Wzq7uqegV64Cb9TxME4kF3SL/99TXXoCkWw/eKxgtAZyIDd3ZbTbaBL5
         1LDVTkpo8Ry+/rD4AnOlcaJJAfxy5APIi+CGkEVN6Hbg4gEXjVJA69x9vmgyq1i4LFQ9
         tGljGCtYwEXIho91Nf7MZJfwLH/84Fcpz8gDW8VXu4Jl6DDyMyaotkiaNZBoqI5C8HNK
         +Bbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Dp1EyG8B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a19-20020a05622a02d300b002f368c7dc14si235478qtx.719.2022.04.30.23.58.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Apr 2022 23:58:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Dp1EyG8B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nl3XZ-0007nb-Vq
	for alex.bennee@linaro.org; Sun, 01 May 2022 02:58:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2XA-0001Cc-A3
 for qemu-arm@nongnu.org; Sun, 01 May 2022 01:54:17 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:37605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2X5-0001lq-Q9
 for qemu-arm@nongnu.org; Sun, 01 May 2022 01:54:14 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 t11-20020a17090ad50b00b001d95bf21996so13758832pju.2
 for <qemu-arm@nongnu.org>; Sat, 30 Apr 2022 22:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=43XuEEQaBW24fA/OpN/C0G+r/QXfL2oSSQvbYI2NnFc=;
 b=Dp1EyG8Bw7vAGIJeggffnOJMdkd15qSMriDMrKVG2swELp/f/VtJVqsu4sj3DfWdAW
 0LiUDXc0esBLl+HTotaiGSUwwtljWb96m3JYuSv1ereA92F1H6s/X3A5Dv5DtNtkR4cR
 kKpjK1U4GbVu4IFVco/p15RLH9La9oqcpYXXZfsuQ8LdpfWcy/u2+1GqSHyeN4JxUd1b
 Fg3q5m7eeuF2Slfqqyug/GksT6n6EbOuL3Y/X7dw3s2QPQDR6k1S4aFWfhYPXYk7jwEx
 lFunEZCWl4sCpagPt9Kj68QQkm+3BSzR4STCufyOUJiuknFNJlozO0EUDWKEm8qcRzIp
 xAKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=43XuEEQaBW24fA/OpN/C0G+r/QXfL2oSSQvbYI2NnFc=;
 b=sbTopkCEPaA/tFvE6YrRRJnk9/MzBDBvpD8ktyBJxk42sn5GUnjid3FkSXeeuSA6ma
 ut8DjWuEZN2u3WDtbv4hEsdKXUStU2HV2JHzn3yw6W03Eu+GItF2rTKDOI/J/LOpQErG
 CA1Ou1p+vJIWHK7CyJCesIqUq0EksnjgASG9HGArTWvv8iuXdH8DqnSnb/cqKrvDCSi+
 BibYZoL6xPLixel3CLzWYnk6BmLSPVMjj/kpal76RevBqGUS5hxhMGfCMafRPhaoh9Wq
 yHTSNS7/F50QzdsdRam8UAccFqRsPBB37G2Z3VpF8U5Q4rfwkLy1WDyvTc3DHHdOsHX2
 dzvA==
X-Gm-Message-State: AOAM532Am8WUpzZVUSy6ZP3+yA8JiplzQuLXXRO43NmWlUGl4RIUs/XS
 jA0zYRi8Brh4sZNBiezo2H2XdA==
X-Received: by 2002:a17:90b:38c5:b0:1da:4d99:6951 with SMTP id
 nn5-20020a17090b38c500b001da4d996951mr7018770pjb.243.1651384450605; 
 Sat, 30 Apr 2022 22:54:10 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 u63-20020a626042000000b005082a7fd144sm2341507pfb.3.2022.04.30.22.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:54:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 42/45] target/arm: Enable FEAT_CSV3 for -cpu max
Date: Sat, 30 Apr 2022 22:50:24 -0700
Message-Id: <20220501055028.646596-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fHBaTX8h8m0X

This extension concerns cache speculation, which TCG does
not implement.  Thus we can trivially enable this feature.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 target/arm/cpu_tcg.c          | 1 +
 3 files changed, 3 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 9765ee3eaf..48522b8e1c 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -16,6 +16,7 @@ the following architecture extensions:
 - FEAT_CSV2_1p1 (Cache speculation variant 2, version 1.1)
 - FEAT_CSV2_1p2 (Cache speculation variant 2, version 1.2)
 - FEAT_CSV2_2 (Cache speculation variant 2, version 2)
+- FEAT_CSV3 (Cache speculation variant 3)
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
 - FEAT_Debugv8p2 (Debug changes for v8.2)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 07b44a62be..40f77defb5 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -749,6 +749,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
     t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
     t = FIELD_DP64(t, ID_AA64PFR0, CSV2, 2);      /* FEAT_CSV2_2 */
+    t = FIELD_DP64(t, ID_AA64PFR0, CSV3, 1);      /* FEAT_CSV3 */
     cpu->isar.id_aa64pfr0 = t;
 
     t = cpu->isar.id_aa64pfr1;
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 762b961707..ea4eccddc3 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -74,6 +74,7 @@ void aa32_max_features(ARMCPU *cpu)
     cpu->isar.id_pfr0 = t;
 
     t = cpu->isar.id_pfr2;
+    t = FIELD_DP32(t, ID_PFR2, CSV3, 1);          /* FEAT_CSV3 */
     t = FIELD_DP32(t, ID_PFR2, SSBS, 1);          /* FEAT_SSBS */
     cpu->isar.id_pfr2 = t;
 
-- 
2.34.1

