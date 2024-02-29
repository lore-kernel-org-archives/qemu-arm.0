Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp374459eja;
        Thu, 29 Feb 2024 05:13:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWP2Z0bBwn1GyM80BD/CJ7SPri8nNEA5mP+qfbgw7UTj3EiuV2PvYLm1ZHGgWIEiAT/csfAGXeOHQcPrgAyTPDMHEx0dSkc
X-Google-Smtp-Source: AGHT+IHsIBOdWUdO3cse+CoYMjO5ZTlMBzWfnqSv/vGDtH6WkRiA1sKGZfPx9RR3zAuWrQmr+W+7
X-Received: by 2002:a05:620a:d94:b0:787:b5e6:ff4f with SMTP id q20-20020a05620a0d9400b00787b5e6ff4fmr2663987qkl.36.1709212423904;
        Thu, 29 Feb 2024 05:13:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709212423; cv=none;
        d=google.com; s=arc-20160816;
        b=T7a0q2rX+lDB+BYmWrcQmra2QIf5FXh54rWPeAtmMIE9ssBIerGHyByScjjRLCbnAZ
         3iWIyH+TRiAStqDWqyIxSl0Oa/ZN4ljjO2qEz/RWjj4/g95CU7df6GRXazVvIqO84/FB
         fX4QtNEaA5CRyFvPVryIL9V7eLvTUtnxyVyyONLBHkM8bIVYIdbSMbF2Wm1Ej7JBsUFR
         ce4pyBYXZayJe+ka0DqQ5B/ux/KBcceK6zuLZMu4QaWhJDYcl6HSHlPzOlKit/az3e44
         5ssD4QKo2QmayPHzwGPCtZK8AWLTTnVikpVvNTEU+yLTUfASTHoszDnxWFu81qjqr3hd
         3R3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=0GjIQjLlJlEeH8Mil4/bxwhJi2XfZg9OI6hYIR2ksqY=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=bqKQEYDZ0dlZwMPvHX6uu6kMRqaPUQrMAczeBiiTFaDF5niv7IhZFddMLydn/4yvz/
         Ms1QxUp4ekGcTF//u9sOeqRHr3xJX9uxC1yBpUBtF/myQhIqEd+kaNQAMLs44J1e2Wu3
         q+472qKgx1cFiY2dT/OIrXF7+V4ojubdRndQIzJPKoxoTlTVe6G1lRMWgQuOK+tHUmTY
         zL29xoX9A0tKmcKnM0gy980+toildsYvxB02k/lsjAOtSLkVtFr3hAVUgejA/E6fs0Cf
         4GGfSZAHf5sBfpjWW8Kf1EYUZ32GowIDv+cWK4blzMTPHCAz2d6uoUHTO4a6e3uvExVz
         Qo2g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d20-20020ac85454000000b0042e6cf9adffsi1276783qtq.609.2024.02.29.05.13.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Feb 2024 05:13:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rfgDE-0006Ld-PP; Thu, 29 Feb 2024 08:12:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfgCd-0005ef-L7; Thu, 29 Feb 2024 08:11:59 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfgCb-0002eG-Hd; Thu, 29 Feb 2024 08:11:59 -0500
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Tls4r5BJzz1h0w6;
 Thu, 29 Feb 2024 21:09:32 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 7D6A8140390;
 Thu, 29 Feb 2024 21:11:48 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 29 Feb
 2024 21:11:47 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v5 09/22] target/arm: Handle PSTATE.ALLINT on taking an
 exception
Date: Thu, 29 Feb 2024 13:10:26 +0000
Message-ID: <20240229131039.1868904-10-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240229131039.1868904-1-ruanjinjie@huawei.com>
References: <20240229131039.1868904-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=ruanjinjie@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: b/NiqAoAKeB9

Set or clear PSTATE.ALLINT on taking an exception to ELx according to the
SCTLR_ELx.SPINTMASK bit.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v3:
- Add Reviewed-by.
---
 target/arm/helper.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ac44498537..b796dbdf21 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11539,6 +11539,15 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
         }
     }
 
+    if (cpu_isar_feature(aa64_nmi, cpu) &&
+        (env->cp15.sctlr_el[new_el] & SCTLR_NMI)) {
+        if (!(env->cp15.sctlr_el[new_el] & SCTLR_SPINTMASK)) {
+            new_mode |= PSTATE_ALLINT;
+        } else {
+            new_mode &= ~PSTATE_ALLINT;
+        }
+    }
+
     pstate_write(env, PSTATE_DAIF | new_mode);
     env->aarch64 = true;
     aarch64_restore_sp(env, new_el);
-- 
2.34.1

