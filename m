Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1373846lfg;
        Sat, 1 May 2021 15:37:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBFSC/gRNPx/YkcwTxm0MQ501AzcqoPLgGr0oQ3if3qDcRNfyV95ifqL6KdgGbNefWH6eQ
X-Received: by 2002:a17:907:7629:: with SMTP id jy9mr10601320ejc.34.1619908638946;
        Sat, 01 May 2021 15:37:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619908638; cv=none;
        d=google.com; s=arc-20160816;
        b=kueSvUJMLIbkZgvhRpyhh4RHkpVx7dFyYomPyRRr+LML5Tm8h5brTs6TrHPW8mfSwo
         Ycb1agTC8oSVbcbU3G+uY9SvD0tjPvvEAfO4Sw5WF9OrMML/8U09EONwZ5OWmUlBqx16
         s+Ujy9p8REhMZuXfWxPM2ynXeTGVAMmmjGhcxNq82SbfRob2ht1qPqwiLnWjYBkCcNa0
         IfdylZoRIzZ0FB471OKzmIpulKFURF6piNl1LBhB3jU3yeuUnem2Bh/OBhff4XkmcVO+
         szSGucgvTSy+/7IlfzTZnySY9oX+Bj9dMs8sEz/P5OF37iK3Dtg64kS56N4liG8XCp9E
         lrLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JLhAw7XD7qIOrjXaghuSYUyF7i2GShMvrYawRB6AMVs=;
        b=TOxqW9a7BJpuxBBItr8m+CqPcLWtlSceUNo5aCfLS2aoWaJKUaRagce6ugGWT8HB9t
         DkgfxPGXr+Cxlyozc0yjYkVKp+zYUEztgOiN/YABgHgwv2nvMwXO9vj8vQZVbcW/z5Vf
         O2rc+OBqHAKm0V12d6x67DEm5soSDKARwdk1i/kpMG9uWBXqX2GYAuZsVQC2qx0kRk30
         favDClvkQ//lIfTEXAEyEBzWHwvnTeJuVt4RPDWkZqi5IkUKstWNluSwJEtBjgHwWWSY
         T4YC2WugbSakiezhC49T+RDfRgnTKAO8eEX2MuIDMcQePTolvaj0FBaoKlFtwu9FPgcf
         xpfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Kes9IhcA;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id gv3si7401988ejc.220.2021.05.01.15.37.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 May 2021 15:37:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Kes9IhcA;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619908637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JLhAw7XD7qIOrjXaghuSYUyF7i2GShMvrYawRB6AMVs=;
	b=Kes9IhcAMri53EjkEFfkJQwONdUrJnm6FUaQ7RrFrhjhh2v1l14jqQTZFcWtkIjCslvA93
	GDZypI/Li29kAEM+WuIwOBf0kf2K2CI4y1OLRlKzTNfyd//iAVcZ44Jdbuo+nDLIPAoEpQ
	JpBCUbukm/gb/kW/GpstByi9mLu3bvc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-LkuZpd-jO6KFOmU-DFm-XQ-1; Sat, 01 May 2021 18:37:16 -0400
X-MC-Unique: LkuZpd-jO6KFOmU-DFm-XQ-1
Received: by mail-wr1-f70.google.com with SMTP id 4-20020adf91840000b029010d9c088599so1296311wri.10
        for <alex.bennee@linaro.org>; Sat, 01 May 2021 15:37:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JLhAw7XD7qIOrjXaghuSYUyF7i2GShMvrYawRB6AMVs=;
        b=YZpInX2sHe/9e0RQzHyK0zroz1TPMjDF0FGlJLMeFoln6S1Wt074YfIjRjajYyqkF6
         UYTCFrSGujLGy/AKAxwzZxoSRFjjkG5yzDQe2SYMo7U2CYX0K8bhJlHIfdT0mNxXgCKK
         22nzK2gXO2nbGzsnd1SF3YdRcXtzeJQnqjkOen/ooq6nMHsodGFXp+mgetvoQQ9wibDH
         oe8OKA7fBfLRtXKZpiOCzumNswKCourQmGNWgm9uEEWD+G+P4QaJEYHYMyj2JbN0bbKp
         Hap2nAGGtZgzmYnfkj5vD0EEh+lvDbE+a3EKXTh3UgSxEHHLE5n0eIqMauvF3xVAR9nX
         0N3Q==
X-Gm-Message-State: AOAM53122zNRpCBO6Qv3DaYJDOxGJnLrFl+bd3Pwmkjs2TL+PLwUWrXs
	Fz9NMUvhsgRwVf5EtyQ3YsxBiLUVSXhBOiwnGQyUOEACY1yocDUqfCnrN0ONiy19/cdDlAsuO+P
	BiJOEojI34eMU4WKl
X-Received: by 2002:adf:e0c8:: with SMTP id m8mr16218266wri.349.1619908635183;
        Sat, 01 May 2021 15:37:15 -0700 (PDT)
X-Received: by 2002:adf:e0c8:: with SMTP id m8mr16218244wri.349.1619908635070;
        Sat, 01 May 2021 15:37:15 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
        by smtp.gmail.com with ESMTPSA id g10sm15134871wmq.25.2021.05.01.15.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 15:37:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Andrew Jones <drjones@redhat.com>,
	qemu-arm@nongnu.org,
	Eric Blake <eblake@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v5 07/10] qtest/arm-cpu-features: Use generic qtest_has_accel() to check for TCG
Date: Sun,  2 May 2021 00:36:35 +0200
Message-Id: <20210501223638.510712-8-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210501223638.510712-1-philmd@redhat.com>
References: <20210501223638.510712-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Mw/9j2GlOxH3

Now than we can probe if the TCG accelerator is available
at runtime with a QMP command, only run these tests if TCG
is built into the QEMU binary.

Suggested-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/arm-cpu-features.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index b1d406542f7..0d9145dd168 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -20,7 +20,7 @@
  */
 #define SVE_MAX_VQ 16
 
-#define MACHINE     "-machine virt,gic-version=max -accel tcg "
+#define MACHINE_TCG "-machine virt,gic-version=max -accel tcg "
 #define MACHINE_KVM "-machine virt,gic-version=max -accel kvm "
 #define QUERY_HEAD  "{ 'execute': 'query-cpu-model-expansion', " \
                     "  'arguments': { 'type': 'full', "
@@ -337,7 +337,7 @@ static void sve_tests_sve_max_vq_8(const void *data)
 {
     QTestState *qts;
 
-    qts = qtest_init(MACHINE "-cpu max,sve-max-vq=8");
+    qts = qtest_init(MACHINE_TCG "-cpu max,sve-max-vq=8");
 
     assert_sve_vls(qts, "max", BIT_ULL(8) - 1, NULL);
 
@@ -372,7 +372,7 @@ static void sve_tests_sve_off(const void *data)
 {
     QTestState *qts;
 
-    qts = qtest_init(MACHINE "-cpu max,sve=off");
+    qts = qtest_init(MACHINE_TCG "-cpu max,sve=off");
 
     /* SVE is off, so the map should be empty. */
     assert_sve_vls(qts, "max", 0, NULL);
@@ -428,7 +428,7 @@ static void test_query_cpu_model_expansion(const void *data)
 {
     QTestState *qts;
 
-    qts = qtest_init(MACHINE "-cpu max");
+    qts = qtest_init(MACHINE_TCG "-cpu max");
 
     /* Test common query-cpu-model-expansion input validation */
     assert_type_full(qts);
@@ -593,8 +593,10 @@ int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
 
-    qtest_add_data_func("/arm/query-cpu-model-expansion",
-                        NULL, test_query_cpu_model_expansion);
+    if (qtest_has_accel("tcg")) {
+        qtest_add_data_func("/arm/query-cpu-model-expansion",
+                            NULL, test_query_cpu_model_expansion);
+    }
 
     /*
      * For now we only run KVM specific tests with AArch64 QEMU in
@@ -608,7 +610,7 @@ int main(int argc, char **argv)
                             NULL, sve_tests_sve_off_kvm);
     }
 
-    if (g_str_equal(qtest_get_arch(), "aarch64")) {
+    if (g_str_equal(qtest_get_arch(), "aarch64") && qtest_has_accel("tcg")) {
         qtest_add_data_func("/arm/max/query-cpu-model-expansion/sve-max-vq-8",
                             NULL, sve_tests_sve_max_vq_8);
         qtest_add_data_func("/arm/max/query-cpu-model-expansion/sve-off",
-- 
2.26.3
