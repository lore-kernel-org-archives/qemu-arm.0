Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp5616020lfm;
        Wed, 26 May 2021 10:05:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFEA+PIgE0rkmaGItkIO6ErafFfS01Nv5YWoGlg4P/6dLhmLJvdDFMztxaetVk/HMbQnCS
X-Received: by 2002:a17:907:c04:: with SMTP id ga4mr22994109ejc.83.1622048744783;
        Wed, 26 May 2021 10:05:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622048744; cv=none;
        d=google.com; s=arc-20160816;
        b=Oxk27bPAaWim9DxegY9haPJAaKv1eXYkApb5Y7MkCbjKhX5jDD/2fJzvL1S7zceIPF
         A0R0iWfMS0fiIHfkgEHEn4v6KMkGBndnXgwnAVDL3ZilHHQQbm1u7YB3cFnK2s07yvDr
         WllvMpiDEn15bBqOYG1h/ww6ZOCECe5aRhPB6vSzs5hcnTZGilZWixx/W9bWt7WyyGp1
         A7uxEKGCA31XUPB73QFnDy/zftzouXYPoIYNiQY1eod0VEyJ3QXM/QrXVd3jwoq7I2/i
         1nry5Uc6WAAqjSoBfNHQo+cWgKQDCtQ4LuU6Wli+pAwItxF4Rro3B/C2Sud4E3/WeEng
         Xj0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JLhAw7XD7qIOrjXaghuSYUyF7i2GShMvrYawRB6AMVs=;
        b=yk7Qh1szOvioTAlnOOQY2OYf0k3MBUfZzi9A1SUJ8fHU4W0i7KcRxQnQVHUMKpoioO
         bwINkotT8JzKvt0tkM8xu9cgxfMutUvTWC5UIiZEoXOuMG186hBKj+BfwPt5Fx35mpVT
         J7qs8NQyvpWash35qwRohcAsSVgDfOAyYiuTO9E5J2/fwZZPPM6NPwhd+l3Uqszwo9Je
         CYZ9oplPuiGTuXOvPztbbYSe3CsS8WpwuS57knjRyecSujvQBMHkusZtdWPBJOJ9o79S
         2SD3IXS8IyWG0UVJPuZlKuL2PflDtOBqCz4jJI6/YZBtfqZpi5ns0bbwQgesGcgiGDAt
         dg0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BMTHVOGd;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id w10si17005241edd.545.2021.05.26.10.05.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 May 2021 10:05:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BMTHVOGd;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622048743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JLhAw7XD7qIOrjXaghuSYUyF7i2GShMvrYawRB6AMVs=;
	b=BMTHVOGdEtZFOv3JNg1E0fbTqztlcM+VLsbrmeRGFIYacyHeBoOq96qVcSPjTlJYQmJKxS
	ZyTzo8R27/gbobSD6VRag4FgwgAR71IWI/HxNDerpM4/kloKQKl8k/i6BLTba+AR11dP/H
	bWQPujFmZsygcZ5L06I/8LKNGyKVXrc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-W5h8XPKMOmmoXQIXcC5BFw-1; Wed, 26 May 2021 13:05:41 -0400
X-MC-Unique: W5h8XPKMOmmoXQIXcC5BFw-1
Received: by mail-wm1-f70.google.com with SMTP id o126-20020a1c28840000b0290149b8f27c99so631108wmo.2
        for <alex.bennee@linaro.org>; Wed, 26 May 2021 10:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JLhAw7XD7qIOrjXaghuSYUyF7i2GShMvrYawRB6AMVs=;
        b=Hb/pgfkoLL7n6ZBEY6okxF9FCafnEdcmvuFksPVq9IlCOG6WuUi20jJK2+AhwVl8th
         NtuGGFas0A0HCQMRhtJxqYXvxr4eZHu99c0CDn5atcXOOcVUTxZOQhxTkygYbubWslGH
         7nUP1YTakqQ0V6yxDufJB7EiUDr6N93hVATXwIicA5+ng26L7Lrrs/bftOaM0Pzbjlm/
         TTBF2k9ZGLsB+iLzwcR8Bul6lU+btsMUIN2IDpai0KjjHLeK1NW7MjZTf858njjKBs69
         yLObCsAzAfm7N989Gj7xn4aayCkpQWsYl8JrnzMFWTWXI4AuEywajTd4Qf/tpUKpwPmT
         t2zA==
X-Gm-Message-State: AOAM533CNm4lFsHKblc+lKfZDxYIQs5CQMN6unNbl7/prFN98ZP9IALr
	5Dw3NF0esXJ3JScumcA//EjpuYDwz06Kj+BhG5avI78ZEoR45Jwd45FBujSXN3yMkpgM5/jJNzp
	kKylNT8m5P2vdXkdn
X-Received: by 2002:a1c:5982:: with SMTP id n124mr29729657wmb.33.1622048740140;
        Wed, 26 May 2021 10:05:40 -0700 (PDT)
X-Received: by 2002:a1c:5982:: with SMTP id n124mr29729628wmb.33.1622048739958;
        Wed, 26 May 2021 10:05:39 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (64.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.64])
        by smtp.gmail.com with ESMTPSA id z188sm15793094wme.38.2021.05.26.10.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 10:05:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Andrew Jones <drjones@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v8 07/12] qtest/arm-cpu-features: Use generic qtest_has_accel() to check for TCG
Date: Wed, 26 May 2021 19:04:27 +0200
Message-Id: <20210526170432.343588-8-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210526170432.343588-1-philmd@redhat.com>
References: <20210526170432.343588-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: gtY9KKAuMxfD

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
