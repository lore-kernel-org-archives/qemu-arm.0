Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp646247lft;
        Mon, 20 Jun 2022 12:32:00 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tvHG7hCUMCb8xcw5lpRe5Wi8oArmiVQhQnSTVn2+/qOJAC5mNumrJXk+Ru7FI56HRpsXQi
X-Received: by 2002:a05:6214:5282:b0:443:e161:ef4a with SMTP id kj2-20020a056214528200b00443e161ef4amr19865593qvb.23.1655753520500;
        Mon, 20 Jun 2022 12:32:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655753520; cv=none;
        d=google.com; s=arc-20160816;
        b=WTsol41ysYOU/7ODgWaNYeybWkaYOH/Ae4xqVALksyajWFP+zs1Ya4W031DLZtxb1q
         dwtGToJ8O/EevJ4J0NHah1hJt0p+I/yrjNokmRbfmeja/CYw22dCLxSVozp+PCQccg75
         1dWVDA2L77nXYTWB1UaWqU2ELWOQKsvdUgKA27khjfz1LOr8T/aHD0LVVd3V1W5ushS2
         9mBAIkn0y812mWO/6nq4Kxooj5j5w9AeovOEDgE4JlGyntsDCI24P6Rp9DLlNiIAe/Z8
         9iEB0hq1PlJ5Z4Y3kxHGkgSGuND7prAQbskvytjEQWIkf6n/wZv6vBk5KmY7u73BCYBx
         BWOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=KYfGsZEVBS73MpAaV1Bx4flt5VYnxWRlggymPMEzy+4=;
        b=q5DgfzaiJ83yG8DmHdZc00YrwCDTPwp3cESm4o7XtCv6sSgJJzNWaOxOxBL1hsvb5p
         XddFqesj2wecdCeCuK21HkHZ5IhNw8aTKCLJcYLRzwOABMasFFwsepEpEhQUGfDDeOpF
         gbYxhm8WxDz4So3b0P75YAwTDNtYYPHcUkXUvKCp9L4q/mQoQHek15O7vTjbnPBGZCdb
         7QeVwLT9v4gZtM7fI1RNpFKWYwXTmluKJXUfbjSPR/rZ74/c2MTWvfNscxsanufbpZAl
         EtOB3MdNPGYNvMGPOtB3xysPZmbv+cfaRO0X1+t1SJkUSEeGMq9YBA7e51d4kjLuT1xc
         2EQw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w4-20020ac87e84000000b00304def15cb0si7496088qtj.221.2022.06.20.12.32.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jun 2022 12:32:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3N7v-0003IJ-Vw
	for alex.bennee@linaro.org; Mon, 20 Jun 2022 15:32:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1o3Mz3-0003xJ-9z; Mon, 20 Jun 2022 15:22:53 -0400
Received: from mail.csgraf.de ([85.25.223.15]:58856 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1o3Mz1-0007O3-CO; Mon, 20 Jun 2022 15:22:48 -0400
Received: from localhost.localdomain
 (dynamic-077-007-106-140.77.7.pool.telefonica.de [77.7.106.140])
 by csgraf.de (Postfix) with ESMTPSA id 9D9146080263;
 Mon, 20 Jun 2022 21:22:43 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 1/2] accel: Introduce current_accel_name()
Date: Mon, 20 Jun 2022 21:22:41 +0200
Message-Id: <20220620192242.70573-1-agraf@csgraf.de>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WQkAkNQDfCR1

We need to fetch the name of the current accelerator in flexible error
messages more going forward. Let's create a helper that gives it to us
without casting in the target code.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 accel/accel-common.c | 8 ++++++++
 include/qemu/accel.h | 1 +
 softmmu/vl.c         | 3 +--
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/accel/accel-common.c b/accel/accel-common.c
index 7b8ec7e0f7..50035bda55 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -49,6 +49,14 @@ AccelClass *accel_find(const char *opt_name)
     return ac;
 }
 
+/* Return the name of the current accelerator */
+const char *current_accel_name(void)
+{
+    AccelClass *ac = ACCEL_GET_CLASS(current_accel());
+
+    return ac->name;
+}
+
 static void accel_init_cpu_int_aux(ObjectClass *klass, void *opaque)
 {
     CPUClass *cc = CPU_CLASS(klass);
diff --git a/include/qemu/accel.h b/include/qemu/accel.h
index 4f4c283f6f..be56da1b99 100644
--- a/include/qemu/accel.h
+++ b/include/qemu/accel.h
@@ -68,6 +68,7 @@ typedef struct AccelClass {
 
 AccelClass *accel_find(const char *opt_name);
 AccelState *current_accel(void);
+const char *current_accel_name(void);
 
 void accel_init_interfaces(AccelClass *ac);
 
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 54e920ada1..3dca5936c7 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2271,8 +2271,7 @@ static void configure_accelerators(const char *progname)
     }
 
     if (init_failed && !qtest_chrdev) {
-        AccelClass *ac = ACCEL_GET_CLASS(current_accel());
-        error_report("falling back to %s", ac->name);
+        error_report("falling back to %s", current_accel_name());
     }
 
     if (icount_enabled() && !tcg_enabled()) {
-- 
2.32.1 (Apple Git-133)

