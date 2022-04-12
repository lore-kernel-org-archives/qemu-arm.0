Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp2011586lfq;
        Mon, 11 Apr 2022 17:51:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2ipFNd7so//n/ISoRTYBJv/ti/RfE9PaiFOe1mIEKXPmsIGJkmstb3lex0phezBsEh3iO
X-Received: by 2002:a5b:c52:0:b0:641:3ba2:8a87 with SMTP id d18-20020a5b0c52000000b006413ba28a87mr6725325ybr.89.1649724669320;
        Mon, 11 Apr 2022 17:51:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649724669; cv=none;
        d=google.com; s=arc-20160816;
        b=cRPfjMLJ3DCDSb81WKo9/41ugLr4FaN0rQL8fs22gOD55TPsSJqssbdM1xaWlEyaK/
         GkI32Mk1LAPiReRc0Ux3tan7JPCibeILIf3UUiWbRJ2AhYOl3QkJR6lWOm0bMe0urs6y
         Bxfannfm4lLqUQnGvnmYjo9rhRd4lYpcI14x+FE9vePuEd0pd0DlouUORMxAMZukXoYv
         MAIl1Ka0vY6Ix0Qmr/8sZPhxFdWvRSdTnQkaCz5L2rHKVsqCQcGmYm1C0hbRtPJQV+pL
         bBd8H1FFc+jT1zaOwNrfNyRFbkAaUalTSIVeMUhyzmBYn6ajohzkaYOrBeymWDz4kAHZ
         pl9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=T/yvSxxK5KUGQ/GUB85StZPpHbnwQifk0lCtMvXSxOk=;
        b=oyt7Z/NZokZPuTM3SI4EH6Tzorjq5SZ0HkfXv+lo2WreJUDG8TdGCgmezQ1DQxzPQd
         7re2kIQtxr0tXdt5U70N7NmwpKGd2EoRZCmADgchQfSmwHK4/ZVttHkJ7BonyrvIkovI
         2HqNAWIW4Vr6bA8slFakStLwY2RNjiGs7dZLaP3Xzj0lbCL3U8VZqvVMobQtG+b8ECsy
         8+6NTMdVhh87jN9aNdMQUlRkJ5lu4G5J1DXmCv9EW3kBzO3Z9uMy9bHezqvw5RreeuZF
         qyRrKMuwcuPmZuwivy5Nh9yXBnvb4Gm6sf24CQ6CgmdvKX2D5ri3HH3YQ2s6Nd4CAqFK
         m2Iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IqTYOljp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t66-20020a0dea45000000b002ebf591030asi4407696ywe.127.2022.04.11.17.51.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 17:51:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IqTYOljp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ne4kO-0003G9-M7
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 20:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4TX-0001uf-EM
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 20:33:50 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:53839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4TU-0001rN-QP
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 20:33:43 -0400
Received: by mail-pj1-x1029.google.com with SMTP id bx5so16757279pjb.3
 for <qemu-arm@nongnu.org>; Mon, 11 Apr 2022 17:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T/yvSxxK5KUGQ/GUB85StZPpHbnwQifk0lCtMvXSxOk=;
 b=IqTYOljpLcLx600eEcM+SBXVNMKLMTeLJ5LCHJrVFaUzv4+27whshnUcjijCTzHnXm
 lliGMWE6IbABrtZIl1fTRskQtDNh3VOPrATnYgJ5L6VkVYU+UvQB5xVxeBZnDsIkMRAg
 rTYU6aHt39Gpx0mmsFyO4IXcG1jnI9eUI+YzXdh2e25K1lFM+NgzTyWXaP6CZtQNojaw
 Eszs8auULG0Jh6CObAJrlLYylgmVCRjlY42OWTc8GGzMf3y1p0SoSID9p0lfZFFDveBs
 bEDCnoKib+rl82ZsXmrAwtPvby+K/3Rw9bCU794jWsrqNzCoH9q7zY9oEjFqlVeS/TQq
 ZqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T/yvSxxK5KUGQ/GUB85StZPpHbnwQifk0lCtMvXSxOk=;
 b=tYYhIQV/QGrbBNMDIwDEUnBXMhIVOD9nutZuniZ1QA//BUwQ4GEL7wrZtzYaf0mOE8
 hhpR3h45cL6Ixo76yDGqHgV3R03WSzrFzv4Wkv+u+XlBYmjHd+nwiNReWXAMPM00CKpv
 qmmD5meEIoMLQv6MY+HzQR1fLsedanVgr2ck5zZcrnF2MdhyqG+Zgpy9L7XezTpMWVOu
 jYG4aGzncF9W0fWAjtk45VddWYcem6WDrJjwsQck0wCOQd0U1brmjODx/0/Yw//Ls4U7
 Lwj0oYLDguI9V6eaq54I1TInoIWId6j5P2x0XwRX4zSPGkUo4EKAFY9gam7D9DgOK18c
 7z2w==
X-Gm-Message-State: AOAM530kifLDA8ZO/49XJJqDN4QMZIYwLTUuW+yLNuOK27AEg1bz1kP0
 6AzJEjVE1bZgd8h+uQ1VwC16pQ==
X-Received: by 2002:a17:903:11c7:b0:154:b936:d1d4 with SMTP id
 q7-20020a17090311c700b00154b936d1d4mr35073116plh.78.1649723619571; 
 Mon, 11 Apr 2022 17:33:39 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 g15-20020a056a0023cf00b004e17e11cb17sm38346669pfc.111.2022.04.11.17.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 17:33:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/24] target/arm: Enable SCR and HCR bits for RAS
Date: Mon, 11 Apr 2022 17:33:15 -0700
Message-Id: <20220412003326.588530-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412003326.588530-1-richard.henderson@linaro.org>
References: <20220412003326.588530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
X-TUID: Oql2TlW+s3Vi

Enable writes to the TERR and TEA bits when RAS is enabled.
These bits are otherwise RES0.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b066a86f04..aa05a15e5c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1765,6 +1765,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         }
         valid_mask &= ~SCR_NET;
 
+        if (cpu_isar_feature(aa64_ras, cpu)) {
+            valid_mask |= SCR_TERR;
+        }
         if (cpu_isar_feature(aa64_lor, cpu)) {
             valid_mask |= SCR_TLOR;
         }
@@ -1779,6 +1782,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         }
     } else {
         valid_mask &= ~(SCR_RW | SCR_ST);
+        if (cpu_isar_feature(aa32_ras, cpu)) {
+            valid_mask |= SCR_TERR;
+        }
     }
 
     if (!arm_feature(env, ARM_FEATURE_EL2)) {
@@ -5289,6 +5295,9 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
         if (cpu_isar_feature(aa64_vh, cpu)) {
             valid_mask |= HCR_E2H;
         }
+        if (cpu_isar_feature(aa64_ras, cpu)) {
+            valid_mask |= HCR_TERR | HCR_TEA;
+        }
         if (cpu_isar_feature(aa64_lor, cpu)) {
             valid_mask |= HCR_TLOR;
         }
-- 
2.25.1

