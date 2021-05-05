Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp272453lfg;
        Wed, 5 May 2021 05:58:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWhHg0J46gJdQj74kXjBKTyDDSKIkapgo6G4ZceixroNTBx8aOlAcvK/0xlp6V+IVZIT/O
X-Received: by 2002:a05:6402:57:: with SMTP id f23mr31799239edu.323.1620219525424;
        Wed, 05 May 2021 05:58:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620219525; cv=none;
        d=google.com; s=arc-20160816;
        b=ZY6LdSziH+rR10iVdshOog0hEbXuM1sGICm/OXautnh9RgYBvF18w4/lR1p+1dxvqG
         AapDDNKtoAs+2jdmoeC6u7ofpFt6uymf91ld+PNZgos7gLuCTW+/eAdk3vm16IgwWzH1
         KXaoVhQe5AWy1Vv01TNs6RmqvxiRrdYU4TMNke3VBqVt54oZS4Hy4y5Gy9Ro1sWnoTn9
         +g+VlpSKVclobXBnIJllY4V1rWJCd7tbzQyOBXFU62Z1bbNg7njMMXiMgSL7nMzxN/4E
         0iunQKQTrJ1GCB47z0Xnwr8O6C5fbWZzAbGgW57xwmA/PI5qQ+X0XOjnD8nGUrq73k2U
         RN7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JLhAw7XD7qIOrjXaghuSYUyF7i2GShMvrYawRB6AMVs=;
        b=JIGQ6otWays8yJuLiefvBUmJXjPq1NDHIYMnP6PDLAdRCKUkGH6tzfWP0J801qdPaW
         tHO+Sal4iFM9DNEiE1yGgh5Df03VHxIY++UgxTU/hNA/X0/qgYEizr+WnVSTv5/+TDJf
         SMKBnYZpWc4rGuPzRk4AvO1uVrMULADxxliPAtkgwFElOJQw8IcYaS7V6LwUKeCtFjMq
         Xw5BpiNtGEQHb+VaDZ95AUTCdObAy+e1/fof8xgvi5luy2BOyuHzElNnsQHW0rcnR1ST
         8eE8QY3GdR8uj1mykjcoHl0QwHaaj8I2ivm7Qo17/tW9IHpeKpafr20k5FFN56tCdRs5
         SF9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=evCaIk8A;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id c7si14285061edv.323.2021.05.05.05.58.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 May 2021 05:58:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=evCaIk8A;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620219524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JLhAw7XD7qIOrjXaghuSYUyF7i2GShMvrYawRB6AMVs=;
	b=evCaIk8ADb1YVnta9R+cHvKmPefRYvHc1Kqt1KwzdP0KxbQrHYlc2wLd2/G3Qqxu5TFduQ
	bPvG750gciu5c6w7C2LVRPHEi1FZ5ydlKUlC1yXs4dV8yLQcSukDVSJyrNIq8goBjeyFyl
	i6HmYYKM4ycWqp0dNVNx1Ykp+tflaDg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-CSuSQ2zhODynpfXCpNlG8w-1; Wed, 05 May 2021 08:58:43 -0400
X-MC-Unique: CSuSQ2zhODynpfXCpNlG8w-1
Received: by mail-wr1-f71.google.com with SMTP id i102-20020adf90ef0000b029010dfcfc46c0so682252wri.1
        for <alex.bennee@linaro.org>; Wed, 05 May 2021 05:58:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JLhAw7XD7qIOrjXaghuSYUyF7i2GShMvrYawRB6AMVs=;
        b=FcvOcSVGIN7ExURdPXSZkCn8QecEc1VSh3GbnY/jhx02AdrydYSqeBMFGdLsy5QGWI
         zxXeKW9BsVy6Q1u6ThasuNOLLX+Ug9cTui+79okRu8IZnCH3+ZtQyAgVCrOx98nuxtyJ
         uK+sfHW0PQv3yfynn8BaHjZd17wGibrJQ8gS0YaxvZyXnQNzmKmo6OL1YZ9my7VKh849
         mtz7BupyFh3QCFcn5sON1/JX28W/DopVY3z+b1FHuZDFRFgiZQHiXuuJIYeyv6RfcY7H
         OeF7HBak/G+UbpDyERcPSac3odtVJp5Ov3f/6FDhdQFB9k5+TnOFyL9qnNDGjo3K+Wz1
         Cw5A==
X-Gm-Message-State: AOAM530XMFqvAr4YyoSrJgolcNKGmPp8Igm6HiLV2gPwcoKQoyWdCx0T
	znAySEKzEoqZn8sBCGu/zzdMqku1b0T1S6Pe2lm1kDZGTBvV7+YdR8BySMmoOxE93G2GPxKMAMT
	Qfo2c1W71QgbBivPX
X-Received: by 2002:adf:d215:: with SMTP id j21mr39288721wrh.251.1620219522108;
        Wed, 05 May 2021 05:58:42 -0700 (PDT)
X-Received: by 2002:adf:d215:: with SMTP id j21mr39288699wrh.251.1620219521951;
        Wed, 05 May 2021 05:58:41 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
        by smtp.gmail.com with ESMTPSA id b8sm20053235wrx.15.2021.05.05.05.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 05:58:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Andrew Jones <drjones@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH v7 07/12] qtest/arm-cpu-features: Use generic qtest_has_accel() to check for TCG
Date: Wed,  5 May 2021 14:58:01 +0200
Message-Id: <20210505125806.1263441-8-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210505125806.1263441-1-philmd@redhat.com>
References: <20210505125806.1263441-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +vUZhk/GIcwV

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
