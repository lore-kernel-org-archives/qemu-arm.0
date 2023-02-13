Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp547473ejb;
        Mon, 13 Feb 2023 12:32:59 -0800 (PST)
X-Google-Smtp-Source: AK7set/8UP2AWgXbWX6cfQNtdY+RW2dgWRrJEcXKan4gr/da4tHxW34rHFad0elaEXbibF9nfMaV
X-Received: by 2002:a5d:6791:0:b0:2bf:963a:f266 with SMTP id v17-20020a5d6791000000b002bf963af266mr20854593wru.27.1676320379236;
        Mon, 13 Feb 2023 12:32:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676320379; cv=none;
        d=google.com; s=arc-20160816;
        b=B4EsgxmBn2Dt374Sen4tqfLqitkKjMzBfaDHMe2VDyPEYwkKM4zoHBclATzqlwIVVT
         4CxyeNm7fwr/SDJIH5pmc/WCRsr3Et8qzEnywxCQxjY/KuKyoJMO8Id8bXSCrLXq7HTg
         CTFCDxIrq+wy2b4fT1hPZQgC8mA77pkI9vqiHXN7BQ0U67b6pis3XTz6szBGkJLa7vsI
         Kt2Jqx0LIqN0WeG3ZwVyosg/NsIuR6F4dSkFHrPw2k/hSpMnIYzLk1cNPCBa3pP19g/9
         fmqp8bZAalBhpy5z70EG3DVzw6FrWSVRoNTBkS+t/GcYdn//0YhB80s7GuMjSsz3aXhh
         JpDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=P2wIshjuiSQLiuLTFO2x8NqskzvrsEhNu8VusTOC9K4=;
        b=OXybtKctkSZVIQobJxjLMrlUsvGQJPXpCXSuCujrQ0h8DBK/QUXflugl5WN3Q+f32c
         otLubsr9+J/ra2C6JxnHWVZyVeZsbLNBKlKtKbYb1SqlvOn4EO5iiZelHXT2OaoKtKcs
         mhEt+BK4l6l7xf/2BEpgIDBdVetO7IDnBSJgnTZJaHN3EDO0uCIjVUbXsztvkEcjWlGH
         bUq2mWLL5YQ1S0BqMmPIwzUrg/XjRBD5NuvLkcEmEIVQTjbb8/tHX06FawC/XRjGaRFG
         dE1UoK2+97sQeKiNthV9Lwvm3j3wsWZfJgjgg3bZLztx1QrNkdES0lsxhY20z6gCPJvl
         0MzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=P8LA1Q6m;
       dkim=neutral (no key) header.i=@suse.de header.b=l76pd1Hi;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id f18-20020a5d50d2000000b002c3e41013ddsi10777640wrt.922.2023.02.13.12.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 12:32:59 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=P8LA1Q6m;
       dkim=neutral (no key) header.i=@suse.de header.b=l76pd1Hi;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D5FB122353;
	Mon, 13 Feb 2023 20:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676320378; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P2wIshjuiSQLiuLTFO2x8NqskzvrsEhNu8VusTOC9K4=;
	b=P8LA1Q6muj4rsV3jZTokEZoOjTgfgXRDFSj6teA/FTPaFgQAtm/YS0q1uerqv7w2sL6QG3
	Lg1gXiu6BQst8VSvZD86uxvwM3MtXkQm+o3Gq7WYHB8H4WfRHIGkKeCGZoFIJYRyFwXMuW
	+zorDIy19qzH8AeqPrIeT3n7u53PvOs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676320378;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P2wIshjuiSQLiuLTFO2x8NqskzvrsEhNu8VusTOC9K4=;
	b=l76pd1HiXD1/GmcqpxvwSYvUAUUwFaCoYGCbnLjLsSdKJjuGuDGjjFDmsaThu7RdMeATVX
	ovnrL8NE6aq2dXCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5F0C71391B;
	Mon, 13 Feb 2023 20:32:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id IOCCCXee6mOVMwAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 13 Feb 2023 20:32:55 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alexander Graf <agraf@csgraf.de>,
	Cornelia Huck <cohuck@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH RESEND v5 23/28] tests/qtest: arm-cpu-features: Match tests to required accelerators
Date: Mon, 13 Feb 2023 17:29:22 -0300
Message-Id: <20230213202927.28992-24-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230213202927.28992-1-farosas@suse.de>
References: <20230213202927.28992-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: U/vv1MvBKW/g

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/arm-cpu-features.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 4ff2014bea..1555b0bab8 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -21,7 +21,7 @@
 #define SVE_MAX_VQ 16
 
 #define MACHINE     "-machine virt,gic-version=max -accel tcg "
-#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm -accel tcg "
+#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm "
 #define QUERY_HEAD  "{ 'execute': 'query-cpu-model-expansion', " \
                     "  'arguments': { 'type': 'full', "
 #define QUERY_TAIL  "}}"
@@ -613,31 +613,39 @@ int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
 
-    qtest_add_data_func("/arm/query-cpu-model-expansion",
-                        NULL, test_query_cpu_model_expansion);
+    if (qtest_has_accel("tcg")) {
+        qtest_add_data_func("/arm/query-cpu-model-expansion",
+                            NULL, test_query_cpu_model_expansion);
+    }
+
+    if (!g_str_equal(qtest_get_arch(), "aarch64")) {
+        goto out;
+    }
 
     /*
      * For now we only run KVM specific tests with AArch64 QEMU in
      * order avoid attempting to run an AArch32 QEMU with KVM on
      * AArch64 hosts. That won't work and isn't easy to detect.
      */
-    if (g_str_equal(qtest_get_arch(), "aarch64") && qtest_has_accel("kvm")) {
+    if (qtest_has_accel("kvm")) {
         /*
          * This tests target the 'host' CPU type, so register it only if
          * KVM is available.
          */
         qtest_add_data_func("/arm/kvm/query-cpu-model-expansion",
                             NULL, test_query_cpu_model_expansion_kvm);
+
+        qtest_add_data_func("/arm/kvm/query-cpu-model-expansion/sve-off",
+                            NULL, sve_tests_sve_off_kvm);
     }
 
-    if (g_str_equal(qtest_get_arch(), "aarch64")) {
+    if (qtest_has_accel("tcg")) {
         qtest_add_data_func("/arm/max/query-cpu-model-expansion/sve-max-vq-8",
                             NULL, sve_tests_sve_max_vq_8);
         qtest_add_data_func("/arm/max/query-cpu-model-expansion/sve-off",
                             NULL, sve_tests_sve_off);
-        qtest_add_data_func("/arm/kvm/query-cpu-model-expansion/sve-off",
-                            NULL, sve_tests_sve_off_kvm);
     }
 
+out:
     return g_test_run();
 }
-- 
2.35.3
