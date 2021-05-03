Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3006906lfg;
        Mon, 3 May 2021 14:11:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVINL0MFEVi0M0mEiePAQRaeNg0xV2S12RdLwS8zfMW3eM1/WhL7ZRrc9cQbhbG+FqdRMI
X-Received: by 2002:a17:907:765b:: with SMTP id kj27mr18427437ejc.537.1620076262562;
        Mon, 03 May 2021 14:11:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620076262; cv=none;
        d=google.com; s=arc-20160816;
        b=MVf4l/ify0xuAooRwnejOuRLu/2qAY2PWsCGR1CclG5F1AZiCQ3GQP5/V0J8cKPDlV
         LQLbreefzhY4q/LQcf5rRQN5s5ZxwkJ7f+3gv7vPR6Iff6OaIagSzOMo79zyTJ598o+2
         A1uqO8fW44nywJS28tSxxgLN+fC3FfvkZsKbV+okv53GtSqbN2BQOgrkYvUDiX9DO0KP
         6nkW2aJcMxAoKhdPkCUrJH/0jserr1VMzKkj9f/UgVqtz24kTBoroQ/9WYeTpJvpSiQG
         t0EiKbox/K2U5DgS2hpSbHYGvgu11PGrMeKh1UqORa8ynod9bJiPJRtyB2sXX4/Lr7kk
         HqTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JLhAw7XD7qIOrjXaghuSYUyF7i2GShMvrYawRB6AMVs=;
        b=oFe4zLgIan2i4pUD10qYgS2+gt2IILpLBfhjHc+gORuR2eyhIarTSsO7S2izBam8ym
         xiImLgHeat2Un4f7lvMLZeaAWwvdEBtshq8RiP25oNOOZwqKTWKLdSstMobxXqSGS0MG
         5Tj20l6FKOKhgledK4Fv4pG+jE4L11r90UrMA7uMMyntizTR3fsigJN2VF1KektfdaP+
         B3ZK8exgmKf2p85ddt/yRx/2z48FseKKnPvlrcc4osB6Xz8WpBOwc4BDYXR6V5bQOthh
         74KGy7m4872XsbQR80HwtcnN3lcaZXjASz6Dgo6g1Yb8iRe6jaSGJq14V+1j4FZPSUAz
         rOHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F5FXOlmP;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ay9si9503995edb.462.2021.05.03.14.11.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 May 2021 14:11:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F5FXOlmP;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620076261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JLhAw7XD7qIOrjXaghuSYUyF7i2GShMvrYawRB6AMVs=;
	b=F5FXOlmPK2fgT6VLjCs1MRfWS5JKZUfiileU/oNvFT1HQj3+TCZL14mxAqkMQNeRQtqf5E
	a/wrsSDQ8eDSUgQtttlMtf4ZfKrnipmndioCtSYauo8v40Fg4thPlBARzIFHwi75ba8c1p
	5UkVgN8yCI1F4o0lAxS+IrWw29Rv91c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-7wu5KTQ2Nu6FcNQHT288Dw-1; Mon, 03 May 2021 17:11:00 -0400
X-MC-Unique: 7wu5KTQ2Nu6FcNQHT288Dw-1
Received: by mail-wr1-f70.google.com with SMTP id 91-20020adf94640000b029010b019075afso4631178wrq.17
        for <alex.bennee@linaro.org>; Mon, 03 May 2021 14:10:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JLhAw7XD7qIOrjXaghuSYUyF7i2GShMvrYawRB6AMVs=;
        b=lMqTWm0PDzUU24sjwpEJEYkFozlc9PJ084dRKovWSWBLAFBgqbrSQy9+HncnJ3XfAb
         5gm48JBbfLdqK9fLn17YY1IvpoEZy6yLVFDRpPVsckLVyu/keGw6SiRNJaf6R/Z+egaX
         uLwbHDRQACWrcRy/kGaah701LTJJxCvY0crnv2FGKz4a5v5FNidiCjIPhA0ue7k9tEVc
         LqcG+LrxpQamRW3L1b2gD0xeOIWcS5cBQGsfZTJsmcby0MHwJoF66z6TXFe1lZ3J1IaK
         UgQ8lHtee4wa5K8TelhXOnLfrtjjln7rm2fi6adR4rZJ9vzwKXw3m1pUHxMr9gabokA7
         RXcQ==
X-Gm-Message-State: AOAM5326vNsBNv66mbN04b5FzrKzjHy/YnJ+Xobh4IJVxlLG9ids1W0w
	aJ0bZhdttBer3HfY0dUnWlmaocjq5brhcVmCQ+yOcTERZvhER1wJpSD45Cvbsv6Xv5ACZsCbRHX
	LVk+/gOUni4gtS3Ab
X-Received: by 2002:a05:600c:4a19:: with SMTP id c25mr23190383wmp.94.1620076258844;
        Mon, 03 May 2021 14:10:58 -0700 (PDT)
X-Received: by 2002:a05:600c:4a19:: with SMTP id c25mr23190359wmp.94.1620076258718;
        Mon, 03 May 2021 14:10:58 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
        by smtp.gmail.com with ESMTPSA id c2sm743435wmr.22.2021.05.03.14.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 14:10:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Andrew Jones <drjones@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v6 07/12] qtest/arm-cpu-features: Use generic qtest_has_accel() to check for TCG
Date: Mon,  3 May 2021 23:10:15 +0200
Message-Id: <20210503211020.894589-8-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210503211020.894589-1-philmd@redhat.com>
References: <20210503211020.894589-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: VrYosjwiWso8

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
