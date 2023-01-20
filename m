Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1303404ejc;
        Fri, 20 Jan 2023 10:50:47 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtg0GYELGRFDlV57SUKFVBWGbO+Z3hzmuFs6sPz5i9O/i2zM9t8732vx92mAdm+K+tS17In
X-Received: by 2002:aa7:c989:0:b0:49d:9bd8:624b with SMTP id c9-20020aa7c989000000b0049d9bd8624bmr16289806edt.20.1674240647563;
        Fri, 20 Jan 2023 10:50:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674240647; cv=none;
        d=google.com; s=arc-20160816;
        b=qtOXiehn4L6rG9j3uOZA9Wm69uYoDoaeRm8QtjVStIw0adMgdk4wW0amN3r97tp5yf
         MVV7u8XR3oiT9mYq0YTNxFip+Nhe/4cv5UmS3WE5Wp4dXTMg7wholi9U9mMJoKVNI1aF
         4HN4tonWN7jV5JhcQMRmLxUxBuU24kDSPkpqo2TbIl0KNL5EyzAgtHrRKb5/Nu5WVcVX
         7c2UufERxg7+lutydLJ9zk0/14ZptRKkCg9kbDNQJgID1kJBH8atzAP7EWEn6uVCUPo0
         +2qQJMazQfk9Qocyf6oExbiaosFz+fE6phh+mr/y7EtkSZxK7lREjn7L583qvLuG6hcc
         dHoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=P2wIshjuiSQLiuLTFO2x8NqskzvrsEhNu8VusTOC9K4=;
        b=SzSK0S32/bBQn78PlHU3PIs6mSFD6ijAFejw2ae5KpSNa7YaBELExn2ph6/2CiCST1
         Rial5ZXYn8ynAFbdhaU/7e92j6fPKtPBVsr3hJk8mxLrEFgYgvd1hExcn+UpHsZHLK0f
         iV7ewJU6mhItg7ZMi8Zw99yczsQdCQ2vhdSj00/JpwrijQaZO9ErKpQWi9WL4U9rZ/FI
         g23nOraUOVKWj77ErTJTcjU4CjzWY03G8KdSB+j3x6udUDVVFqNM61QFvzk98BaZHhzQ
         3K9FwRLNiO4tqy4oJVoUhCVyU54etU0V5VDzRztBWwYzw4DgGtoYMiHbEHTKML6rmNst
         Y78w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=NUCbVEXZ;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=eRAP8yth;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id y19-20020a056402441300b004698188a1b9si50090048eda.557.2023.01.20.10.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:50:47 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=NUCbVEXZ;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=eRAP8yth;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 29E245FC21;
	Fri, 20 Jan 2023 18:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674240647; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P2wIshjuiSQLiuLTFO2x8NqskzvrsEhNu8VusTOC9K4=;
	b=NUCbVEXZiSXNmjxmOt86TKpNMYjLuKlXj0Zs1vNDZRGG8bqpq2+V66UOtP7ppbECx/jYCd
	fuIpyJ+W1i7yC6xLXKW4xWWTvWR1lL9C3nmk9TdmXWjfmvyx30koMKpvVlBpqK1yew4D0I
	rLT+5JSJOBWCr8owF8fZFt5Mpa73HDQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674240647;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P2wIshjuiSQLiuLTFO2x8NqskzvrsEhNu8VusTOC9K4=;
	b=eRAP8ythCXbE6mRMi0z/JEN9qvyf3RB5UAhJo+wYAU2mESj7wHyqYm2Qdrl+kyV0ZfSAjP
	3YS09LBW1Usj81AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 962AF1390C;
	Fri, 20 Jan 2023 18:50:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id eGKMFoPiymNSbQAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 20 Jan 2023 18:50:43 +0000
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
Subject: [RFC PATCH v5 4/9] tests/qtest: arm-cpu-features: Match tests to required accelerators
Date: Fri, 20 Jan 2023 15:48:20 -0300
Message-Id: <20230120184825.31626-5-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230120184825.31626-1-farosas@suse.de>
References: <20230120184825.31626-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: E9hQyR+8pc4r

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
