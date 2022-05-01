Received: by 2002:a05:6512:2248:0:0:0:0 with SMTP id i8csp470150lfu;
        Sat, 30 Apr 2022 23:06:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKb/ijCefaYRY/7YwZJHF67Isfzxh101Psq/GFebCu6mDtfpD0U50MbtQJXbXigfZYXy7p
X-Received: by 2002:a05:620a:4442:b0:69f:72f7:b4bf with SMTP id w2-20020a05620a444200b0069f72f7b4bfmr4821301qkp.693.1651385216776;
        Sat, 30 Apr 2022 23:06:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651385216; cv=none;
        d=google.com; s=arc-20160816;
        b=j5CAPZ2JeTvi4owAMMKhGiX6uUe6qE4nsuNmzawnD2bk3q16avw4yivNRMcV1H/t9W
         iCD8aSyo+WCeFAquMQIbLvbnAFfDHu3/g93VzoSITf64Oq0v38EpMjIXOywsGP4p4iTq
         GktFPaDUxFCVAJCI7DqP1ck1O2NZwn5XmpST+JOlQuer5S9XiAvGb9BAQ5XkqgLk9+BB
         cRIFzsSpduub9Wem4EbSMl6lJXt0ub9XDsS0Tk+q/ZAbQb8S3oiUkFkJYs7XEW+ZkL0b
         R2VpcucuAVmGNWkE9QPJODBZIxBjuaeqHuHZP9YV6/xF0Dlgk+cP7yvpZeHUUZAbUKlB
         aVVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=q2ExgRJeW51vJ/LQ9D7kCX+GyJ0sPJY/PZJuyp2uAOM=;
        b=M+KBrKBXF/shyN5eCXyO8KfoI4uJuqQtZ5VtDw0ZrbjlQakQUM2zlx7ivAMXCprewL
         PIMQ1vKT7mPUi7rUufQYjRZ0YDpC+WF6FUgO3RtA10Mh8GmvYcfVnKnjnrSbRmXDJxOo
         7Bt2BJB7ShAzgtQ7A2EDbOqCFVcp0a+VsS4grq1F3N5ySVrTLBXS1/PHkKsHWi9/HR3E
         NOjXm58vlRKxU0C9VLpncwy10iaeVY365J8WasJNN1DziAsOBSEjABvQIxZJ6BCB1G5D
         cNqeVOk4L8troPn3Z9Gdfg5dHRAGmLABYShJvOr6crmETIFjjuYAQd2JFjpDt2SCgrlk
         1zZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cF7Ik4j1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a10-20020a056214130a00b00446562ab5a8si4165357qvv.590.2022.04.30.23.06.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Apr 2022 23:06:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cF7Ik4j1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nl2jP-0004TB-UU
	for alex.bennee@linaro.org; Sun, 01 May 2022 02:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2To-0006t5-Dr
 for qemu-arm@nongnu.org; Sun, 01 May 2022 01:50:57 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:35796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tl-0001HY-HJ
 for qemu-arm@nongnu.org; Sun, 01 May 2022 01:50:48 -0400
Received: by mail-pl1-x62d.google.com with SMTP id d15so10293964plh.2
 for <qemu-arm@nongnu.org>; Sat, 30 Apr 2022 22:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q2ExgRJeW51vJ/LQ9D7kCX+GyJ0sPJY/PZJuyp2uAOM=;
 b=cF7Ik4j1QClewU0d3USpi9rFwhvj7mid+0aJBmWrnyQS5cqrLqb/rjWgWFmlulc+OD
 PwQao7NCZYcf0JNFT1YXuwKKPpBhGha/2AaSyGHEKaeDovGBeHPBf+xGeRlbZrs45OnG
 MSP86MiQFKp8P3iB2bLfuzdtwUDCMkhHB0aNLqyA3IFkVGTrMi8/XXk8rc884GTHfELq
 bDB9JaH7DoCDlHcNfgS+EPturReN3FwN5pEBVBdD/HNVTNkOq5Eo5MK+gjx8zyzfqgLO
 fjoX20WNw36TdvJx/nFd8tQYSmmXJYv6ACNNN+NaJ/DcODhzK+8LXDFrfvrX9Jl/vMlk
 GobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q2ExgRJeW51vJ/LQ9D7kCX+GyJ0sPJY/PZJuyp2uAOM=;
 b=GGatfeqxhmvmhKxvHhceMvmWFN6Vu8DpLpUinx36Epq3W58xgqxLS6nsXcPIergbTL
 2MwdNNrvN0OASJSRENHaLuLsLGLnuKjIZfa7JQYcjSFx04HPPL7xq2yL6zfOulgy8lSQ
 f/AibkBupOvK0qmMhQlfG6r/PmbUajnclUoGUhrKxzIP41Ua46zrMQ9HOX5bFAALi13T
 8nObm1nzVSk/K5aTZGfs6O8Oo6fzCnmGS2d+KkKns2MiYnjhZaECH+ItGLMff0nG738u
 LkQ/nmhROPTmVkTrXJ/swTFPqy6DU67kvDr1LqC7JDemyuZPJNeFGCH/fFbhWKMXc3OV
 Wkcg==
X-Gm-Message-State: AOAM532rxe6vC0kLm8r/veRN/eW25MZMTNEGEBGZqz569MOP/Tj0xEvh
 3817EV92mIQrjhkFLz1zvGXrGFxpEXELTA==
X-Received: by 2002:a17:90a:784b:b0:1db:dfe6:5d54 with SMTP id
 y11-20020a17090a784b00b001dbdfe65d54mr6973732pjl.112.1651384243486; 
 Sat, 30 Apr 2022 22:50:43 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:50:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 14/45] target/arm: Consolidate cpreg updates in
 add_cpreg_to_hashtable
Date: Sat, 30 Apr 2022 22:49:56 -0700
Message-Id: <20220501055028.646596-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q3oSQ0AXYJFd

Put most of the value writeback to the same place,
and improve the comment that goes with them.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 118422d672..b2887d63b6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8543,10 +8543,19 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
     *r2 = *r;
     r2->name = memcpy(r2 + 1, name, name_len);
 
-    /* Reset the secure state to the specific incoming state.  This is
-     * necessary as the register may have been defined with both states.
+    /*
+     * Update fields to match the instantiation, overwiting wildcards
+     * such as CP_ANY, ARM_CP_STATE_BOTH, or ARM_CP_SECSTATE_BOTH.
      */
+    r2->cp = cp;
+    r2->crm = crm;
+    r2->opc1 = opc1;
+    r2->opc2 = opc2;
+    r2->state = state;
     r2->secure = secstate;
+    if (opaque) {
+        r2->opaque = opaque;
+    }
 
     if (r->bank_fieldoffsets[0] && r->bank_fieldoffsets[1]) {
         /* Register is banked (using both entries in array).
@@ -8587,20 +8596,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
 #endif
         }
     }
-    if (opaque) {
-        r2->opaque = opaque;
-    }
-    /* reginfo passed to helpers is correct for the actual access,
-     * and is never ARM_CP_STATE_BOTH:
-     */
-    r2->state = state;
-    /* Make sure reginfo passed to helpers for wildcarded regs
-     * has the correct crm/opc1/opc2 for this reg, not CP_ANY:
-     */
-    r2->cp = cp;
-    r2->crm = crm;
-    r2->opc1 = opc1;
-    r2->opc2 = opc2;
+
     /* By convention, for wildcarded registers only the first
      * entry is used for migration; the others are marked as
      * ALIAS so we don't try to transfer the register
-- 
2.34.1

