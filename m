Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp389500ejc;
        Thu, 19 Jan 2023 07:00:06 -0800 (PST)
X-Google-Smtp-Source: AMrXdXscHtQkrmN1cmUCyIlw1sjqHBANHWeUG+p8CAAT7V/jfrOcVvJgEzheDoZwFuAVp2q/v7cl
X-Received: by 2002:ac8:4d02:0:b0:3b4:63d8:bcbb with SMTP id w2-20020ac84d02000000b003b463d8bcbbmr15364420qtv.28.1674140406260;
        Thu, 19 Jan 2023 07:00:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674140406; cv=none;
        d=google.com; s=arc-20160816;
        b=dlbegm09cx4sL0zG7N5uLFtjDCFEzXq/MI/UugmRJ5uKoxWc+sL7tZc8c0UEf8YUSa
         HY441AK7oosy+2u2OrWw34dK9CytVXQGwnPOH4iorOLDga4v8bM2+js1wPLV/iZNHJtH
         +fmJ+VcrWJxzR6VJAqN1aGZ8pwyqwRyWlSBCc5uBhyxJ5VNiM6WMkMt29HLHkhQ6XPCW
         WodA7sD8agtCy1UXmF34AKfmB9qgrzF606T9SW4xTIwxSR+jytXVHGm8m0Osaftl0bkV
         zACprFZSbswGTdJuoivFUvdE7aWb6HltLmsMopSBmMEN/go1utfNP9H6fb1RlMLpB9C+
         +Nhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rDyw5jGUguYP19whij1cKtwFdUxKXvk9EDw1Rxg7JLU=;
        b=sv6Tx+Wak2MqU2FLcteKBpUu/FsFoww5KKGwl22ExxX/SB4VcG7SFwOVk2nVFrpZz8
         2ptFYSOs5BxHYJtsuGSEVSxFuleNT1wk1jaNeKHDGtvB5dZHay8/CELVl0hwaqOJFM3z
         Hfcuy6xe0RqDgU3iuNtvKpO1tRdmvRJunF6kL40385lCpM4W9dUB6jyyE2xycq6uMDYB
         3Z1KiaVkn5XPfzaIKK2Hsgbqc5+PcPZEb/IN0/T49TKhbg+DRKNVjZSF74dAXpR8p/Nh
         w/yJRb98H+n6Dk5XnASdCP2+Y8DMs5cUxvIozBYGLNgN5hk2MNRCF1/LMFLPaCpkfDpg
         bZ8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zx625sje;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl12-20020a05622a244c00b003ac2beee9cdsi4218105qtb.166.2023.01.19.07.00.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 07:00:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zx625sje;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIWOJ-0008Uo-ER; Thu, 19 Jan 2023 09:59:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWOI-0008QN-5Q
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 09:59:46 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWOG-0003gm-I0
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 09:59:45 -0500
Received: by mail-wm1-x336.google.com with SMTP id m15so1750006wms.4
 for <qemu-arm@nongnu.org>; Thu, 19 Jan 2023 06:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rDyw5jGUguYP19whij1cKtwFdUxKXvk9EDw1Rxg7JLU=;
 b=zx625sjetE/+G4xs3sYp9MwIfdMcxC1aARl39RwoEN/uciBhGKTKsV4TY2RJUDwmJD
 J5ON7BC6hSt7aZPX9qDrs2R+uCHOzGiSbourlj1maxlOE8iAdufYGeYAevZIauAuluRO
 7c4AlzQ1BDuQM+XAe9FY8wIqkcYFuQ92J5hBs7uP5+wiryzn2tkIc8BTeTnPClelUQ7Q
 /RsUkV0shJfRgwt7Cv90YT1WSTUWz+36/ZvdDsBQzueAU6PXwoutYk7DQ2D8kMwm3k93
 Y89th4YaXUKSr2jJ/eEpHwneNRbJgsfeiUoEDfNfXNVewzQM8EyqTwjnIAPI55876nlD
 W9zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rDyw5jGUguYP19whij1cKtwFdUxKXvk9EDw1Rxg7JLU=;
 b=NmoQjPmw85tnXTzt7XNzm3WFp0MQ7QE5r9YeezYPh3isusm+L/fM4WgM0PEcv358XJ
 +loNbo2N0M2Qd0DvKuOlx5wE2CNGBwTOnroGBACdhy+ndjNcjc4D2OBTygUnolrY5Xu7
 sUrYzu3TxAc35ko/80OxjMS3pG/qCpwd4LQU15rH3ksrsl7S+2T5TxfwddAP3+CZfFla
 IfjCecGE+u8hskhLYSzjQ64jH33R95ePFRw0dT1C3P4SnpjJBMhJhl9fEa2cay3YfR1z
 n8UC6p0IqSMSuc3o7RzihUuCEXcHqBhwBg4cmH6pvHsjeyx35rmg5+3+U+yMYXMxv80a
 fJtA==
X-Gm-Message-State: AFqh2kpKGkUY3BzFZeYY9De/bzmY9x4gv2YeV6e6U7QrhRIZjj6SJ0an
 QZIQ5lcXDcMxPreGb0OaurTd0w==
X-Received: by 2002:a05:600c:3b13:b0:3db:26b8:5023 with SMTP id
 m19-20020a05600c3b1300b003db26b85023mr1648284wms.10.1674140383093; 
 Thu, 19 Jan 2023 06:59:43 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a05600c0a4200b003daf6e3bc2fsm7009111wmq.1.2023.01.19.06.59.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Jan 2023 06:59:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 11/11] tests/qtest/migration-test: Only use available
 accelerators
Date: Thu, 19 Jan 2023 15:58:38 +0100
Message-Id: <20230119145838.41835-12-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230119145838.41835-1-philmd@linaro.org>
References: <20230119145838.41835-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BWzltGl13fhJ

For example, avoid when TCG is disabled:

  $ make check-qtest-aarch64
  ...
  20/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/migration-test
  qemu-system-aarch64: -accel tcg: invalid accelerator tcg

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/migration-test.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index a930964268..17783d7334 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -45,6 +45,8 @@
 
 unsigned start_address;
 unsigned end_address;
+static bool has_tcg;
+static bool has_kvm;
 static bool uffd_feature_thread_id;
 
 /*
@@ -603,9 +605,14 @@ static int test_migrate_start(QTestState **from, QTestState **to,
     got_stop = false;
 
     cmd_common = g_string_new("");
-    g_string_append_printf(cmd_common, "-accel kvm%s ",
-                           args->use_dirty_ring ? ",dirty-ring-size=4096" : "");
-    g_string_append(cmd_common, "-accel tcg ");
+    if (has_kvm) { /* KVM first */
+        g_string_append_printf(cmd_common, "-accel kvm%s ",
+                               args->use_dirty_ring
+                               ? ",dirty-ring-size=4096" : "");
+    }
+    if (has_tcg) {
+        g_string_append(cmd_common, "-accel tcg ");
+    }
 
     bootpath = g_strdup_printf("%s/bootsect", tmpfs);
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
@@ -2457,12 +2464,14 @@ static bool kvm_dirty_ring_supported(void)
 
 int main(int argc, char **argv)
 {
-    const bool has_kvm = qtest_has_accel("kvm");
     const bool has_uffd = ufd_version_check();
     const char *arch = qtest_get_arch();
     g_autoptr(GError) err = NULL;
     int ret;
 
+    has_tcg = qtest_has_accel("tcg");
+    has_kvm = qtest_has_accel("kvm");
+
     g_test_init(&argc, &argv, NULL);
 
     /*
-- 
2.38.1

