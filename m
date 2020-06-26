Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp47711lfm;
        Thu, 25 Jun 2020 20:32:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5rTwKgKSbjDdsi/M10u+zNDWUKnTfzm6FUBwBDWP2e6MM8WtzcIj+kjQKivMJmnJ8lXYO
X-Received: by 2002:a25:df0b:: with SMTP id w11mr1713762ybg.449.1593142336681;
        Thu, 25 Jun 2020 20:32:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593142336; cv=none;
        d=google.com; s=arc-20160816;
        b=NrVhoYhAAM7WGA2kGXoXWx1G3q95/ZsNFPTPFsLwBPJlAoO3xDLP83xzX3eovHpM4+
         BsevkDk3jKTZ93tJ3VXF6o3QUE8prWVuizsZcGDnZ16NmXKPhUXejcOuicJKtO6bgdpP
         k3ebOjyu1LWk4mlalN83UTZ2UGIj6GKmoxHohLyS87GT7ZqsuzwwittgSvxgq5stCU/4
         x63ORhw9OH1Y99fp26A3H9XKiXkLBk3aG4L8Bi5qQDTVxSvDGc74a9BW28UZk0TDx38T
         Im5c8Qa68EYP6eejcdkD0rVM5lIDJwmkvtB8X13QBcrQplgWNETFGxdelnF6nJGHGqU/
         Sbtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=UZWgT5KzsbdnnIQS6h1nh35owoxC0Bf2W5wbwlUKiR4=;
        b=EUc9BBgRZFdpy+ZE+2MJbyQkVn6n/2kZFizUEdnXWy54j+M9aSDHvbYQMM1exU5FEu
         WT5k6NkyIFYNhsnWw6nSvP4H/SP2mQL00p01GugfE5SNDlLlFujzl705BGcc1mwdSFAP
         g08sfAUmjfFUGb2/42Tg/1vooLzn53miQUxIwklp0m5WaHtDwdvEkVjNsljK9EhfEdQP
         X5ncIQdpnHHJ1LPJRHXPC5VFiKv66Abp98RykfJmYEjLd7ihGFY0ijwlgQtfAVsYTamH
         Nbn/WlxTbbyda2HkUnbncyJVkGZHx394UGbyIdwFAn7tB9Yx8O8u5MNhrOwJzrM1pVUf
         RSCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=umlJJTd8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f67si25293163ybi.238.2020.06.25.20.32.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 20:32:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=umlJJTd8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jof67-0008Ca-Pl
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 23:32:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof5j-0007gA-W9
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:31:52 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:35958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof5i-0001hU-Gb
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:31:51 -0400
Received: by mail-pf1-x443.google.com with SMTP id 207so3866204pfu.3
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 20:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UZWgT5KzsbdnnIQS6h1nh35owoxC0Bf2W5wbwlUKiR4=;
 b=umlJJTd80Zwe+YUzQlau5Iu6kwFEOCcslmhxU/MxyCJwjb9dBAMEYRyfZyld4F9CzB
 IP1jUasoKi7T6uyI3bJ3i4FpTSkC/fj4IDNMdWM8oR5fgymCahj/ebfpKTOQjNp4FALJ
 aWAdoJye91pQctFbRIq7Lx3Nx8K4zut9sNtyV2rrckswz1kgE2WMVEjuptlDmYaxxFq1
 rwDAT3guU4GHQSOdH7N0d6ZvvOsxVCp9Te/jyxD2mYNTBZbgNmhFGN+dgS4TKY6w8Pvh
 hMIY/UDpKv+q02Ed2rfFlAuERPz2QcLFLAumXWdRQ5vy2LwZRG8nOamolYaQrsB3rWPK
 bvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UZWgT5KzsbdnnIQS6h1nh35owoxC0Bf2W5wbwlUKiR4=;
 b=E2AxwDmswdxS86iILOquXB18kpseqKMkNIb4lVNHJwoE+mTsWyLUNRL2bEyiOvh7Ui
 MqnfVULecgYUV7Glh0AGFThTJU/M8zb/aHiaZMS/qpjOF36pr+44RsrkNSBhY30OvDZF
 E6AdUHyvW/aSU6ZwXY8qumqOGyCE5KuXcMX/FKlQ1oyrNeyUu/ZKbnK8NRhPiMSxKbFh
 eECR2UI9gk2RM3hkdaMfqNhEmhwyRicCqOQZ8c+p2tMmVahcqLcsD8fEyIbpis2CZOHJ
 VSHa722TQ2gGWYBoJJf8ImWE2bAdaIJgcMqgNTfNn0M0F5gsQ/w5VNt9ZE5xHmB5Ry9S
 7xNg==
X-Gm-Message-State: AOAM5315757KQbsfZWujbj4tUbFr/li2WJ9qgcHMn1DBrkPxdO+9hJ6B
 1JgPj6gLL3mCmVTP+6HkQA3yeA==
X-Received: by 2002:a63:7cf:: with SMTP id 198mr894357pgh.309.1593142309227;
 Thu, 25 Jun 2020 20:31:49 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id y27sm1605256pgc.56.2020.06.25.20.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 20:31:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 02/46] target/arm: Improve masking of SCR RES0 bits
Date: Thu, 25 Jun 2020 20:31:00 -0700
Message-Id: <20200626033144.790098-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200626033144.790098-1-richard.henderson@linaro.org>
References: <20200626033144.790098-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W2//XQRexQft

Protect reads of aa64 id registers with ARM_CP_STATE_AA64.
Use this as a simpler test than arm_el_is_aa64, since EL3
cannot change mode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 972a766730..a29f0a28d8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2011,9 +2011,16 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     uint32_t valid_mask = 0x3fff;
     ARMCPU *cpu = env_archcpu(env);
 
-    if (arm_el_is_aa64(env, 3)) {
+    if (ri->state == ARM_CP_STATE_AA64) {
         value |= SCR_FW | SCR_AW;   /* these two bits are RES1.  */
         valid_mask &= ~SCR_NET;
+
+        if (cpu_isar_feature(aa64_lor, cpu)) {
+            valid_mask |= SCR_TLOR;
+        }
+        if (cpu_isar_feature(aa64_pauth, cpu)) {
+            valid_mask |= SCR_API | SCR_APK;
+        }
     } else {
         valid_mask &= ~(SCR_RW | SCR_ST);
     }
@@ -2032,12 +2039,6 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
             valid_mask &= ~SCR_SMD;
         }
     }
-    if (cpu_isar_feature(aa64_lor, cpu)) {
-        valid_mask |= SCR_TLOR;
-    }
-    if (cpu_isar_feature(aa64_pauth, cpu)) {
-        valid_mask |= SCR_API | SCR_APK;
-    }
 
     /* Clear all-context RES0 bits.  */
     value &= valid_mask;
-- 
2.25.1

