Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp920247ejc;
        Fri, 20 Jan 2023 00:25:58 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsty722lEUleWwra0hhLJ0Tq3ueMj8G+lnBuz+HEHh+Jqk3IuOw3aecU6krZgJHF395+B1a
X-Received: by 2002:a05:6214:4111:b0:4b6:ac11:a8ba with SMTP id kc17-20020a056214411100b004b6ac11a8bamr24003451qvb.22.1674203158549;
        Fri, 20 Jan 2023 00:25:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674203158; cv=none;
        d=google.com; s=arc-20160816;
        b=fY54ohD4jdzqSNFjWoZ64EoZg1ws5kvA2wcS6pn6DXEXMfV3kUPK3wwDcus4f1QYAr
         L2bVGmrTWZTbjhLsTMTEzceQdJPirrq2+hQB3yfBGJewTtGboIAiwBLcVIgrN2128fbO
         KuynnyD3Gma8qp6zzDT7UqcYmOOX4GFIvEfufnOV1x3VguPJeCIK0O5bK7pnJ5uugj3V
         RJxz1r7r3k5yocPQYp2raziEQuXTdgbf8xSsMSZpSPHk+7g/jxu6o9y5IoRKZ/A1IrrM
         jq2pSD9TU7fv2mFp3vi5h6oPN6wTJBvVzY2ytoVmvyapEuLppbhZptvSobMcFsQg+pfD
         d7Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZIdBPotAEeCeaU6kILE+ldJwz4Si4KaekjZjTSfk694=;
        b=l4UgSkbjpzHw9lweretbbY9m5dQV3SAnAOzP3EecpUfLHGieA81p5ZTo1H9X9O86UE
         uTrRp8T5Rihp+hx7+bsmgMGOoIsSGOpWmAR8rdXBmtpitvgX1TXQkrf19dQjE9WXn8VF
         tHYCIjKoiHkNU3AUXIJjX+yW1nsT83wrI9hd0rO07vb4fnDstKhrYWlzfQQZixBvql1l
         ghTU/Op5X+0Ufpm6iI2ZAMIcosMCAw9CKecISKXRKKhErlQsuiNVmHWHEfPcArBJE9y4
         PLFNGa1uesE4LjlLURG29Ppig0FUKxpz+rB4KtfdKzZSBfoo2m/7/1tFLtyls3V0NDe5
         lBQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sHvxXtKK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id om26-20020a0562143d9a00b005355f3044dbsi1395314qvb.85.2023.01.20.00.25.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Jan 2023 00:25:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sHvxXtKK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pImhb-0005VY-Ev; Fri, 20 Jan 2023 03:24:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImhW-0005NF-Og
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 03:24:42 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImhV-0004eq-2F
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 03:24:42 -0500
Received: by mail-wm1-x32c.google.com with SMTP id l8so3383547wms.3
 for <qemu-arm@nongnu.org>; Fri, 20 Jan 2023 00:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZIdBPotAEeCeaU6kILE+ldJwz4Si4KaekjZjTSfk694=;
 b=sHvxXtKKINDL5U6Fdhmg7M/qsjYAQGf7jqQBR9ve+9ggFVkRejHOhRUwvWa1s0Q5fx
 +g8BJsZ3n/aQOGSDk3KKxYaov7iqSrSb5nHxix93hueSgapMFY7RArUk2lMxlJQ+azAg
 nggVngL6RMipESmiyLR3BmJ7CYRz5qOZZiGcIE0DIPUvQUDHdIb9QyWPJdURibsk+hOI
 SJmGbuLeJTfg2gmxWxlnqiqd81UcfV3aFXKvHb6qA+/xgQHPoZTlW5JQ9pnNldiawUIL
 4fPBBInWldoqtoBuvL9DvmCgRTP4Pr+YXuymCBo8ls95IoW6MYwjDdgq2BG9nnSo+O4y
 SZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZIdBPotAEeCeaU6kILE+ldJwz4Si4KaekjZjTSfk694=;
 b=kBL2atzvEIP5GcNW8pUuSzFCqfrh2koX8oeUm0Nt0gIMRQTG1SFXzh4NTvsZY2BP+L
 JyDcq1Kg5iaewfu6S6N3wHCXz9szIIawYfavErcdCua37BAUPiVMLREaGrVP66wFsKXN
 6e+3HOO2eoQyozluAk4jE/nhOIATemRE+FH3TiR+8p7A0ysxSQ15KVH8sprIIsTZyfeW
 nAeimtx+7RPsROiHUQ8WLSd5dAgzkU0tPKxUlAnVEdYL3xh3BHez9V/RMqu9F1li3GqF
 hZcbXGU5ysaGzX0Wym3+N4gJG1DzgkQhxqvJucu+5trsaYdjmkzvDEYGXnwrLavxnmH5
 CmLA==
X-Gm-Message-State: AFqh2kqbQ+a7EEdITJS+MUtH5YTPlbBdS9xATfbPJA33lux4veWnmjM9
 NzvD61Hc+yWEyzf5OuAakWlQow==
X-Received: by 2002:a05:600c:a29e:b0:3d9:ee01:ae5b with SMTP id
 hu30-20020a05600ca29e00b003d9ee01ae5bmr13156308wmb.12.1674203078971; 
 Fri, 20 Jan 2023 00:24:38 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o28-20020a05600c511c00b003dab40f9eafsm1611013wms.35.2023.01.20.00.24.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Jan 2023 00:24:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 11/11] tests/qtest/migration-test: Only use available
 accelerators
Date: Fri, 20 Jan 2023 09:23:41 +0100
Message-Id: <20230120082341.59913-12-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230120082341.59913-1-philmd@linaro.org>
References: <20230120082341.59913-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
X-TUID: XljTjhVkkltv

For example, avoid when TCG is disabled:

  $ make check-qtest-aarch64
  ...
  20/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/migration-test
  qemu-system-aarch64: -accel tcg: invalid accelerator tcg

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/qtest/migration-test.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index e7786bcbc5..b0eaddbf5a 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -45,6 +45,8 @@
 
 unsigned start_address;
 unsigned end_address;
+static bool has_tcg;
+static bool has_kvm;
 static bool uffd_feature_thread_id;
 
 /*
@@ -603,13 +605,16 @@ static int test_migrate_start(QTestState **from, QTestState **to,
     got_stop = false;
 
     cmd_common = g_string_new("");
-    /* KVM first */
-    if (args->use_dirty_ring) {
-        g_string_append(cmd_common, "-accel kvm,dirty-ring-size=4096 ");
-    } else {
-        g_string_append(cmd_common, "-accel kvm ");
+    if (has_kvm) { /* KVM first */
+        if (args->use_dirty_ring) {
+            g_string_append(cmd_common, "-accel kvm,dirty-ring-size=4096 ");
+        } else {
+            g_string_append(cmd_common, "-accel kvm ");
+        }
+    }
+    if (has_tcg) {
+        g_string_append(cmd_common, "-accel tcg ");
     }
-    g_string_append(cmd_common, "-accel tcg ");
 
     bootpath = g_strdup_printf("%s/bootsect", tmpfs);
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
@@ -2460,12 +2465,14 @@ static bool kvm_dirty_ring_supported(void)
 
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

