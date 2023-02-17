Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp128631ejb;
        Fri, 17 Feb 2023 12:15:12 -0800 (PST)
X-Google-Smtp-Source: AK7set8MZnNtb+ltPzpC1qlTmC3TkOyAjmK261zn5AOyaaZo00aKMoSOK3a8HY/QIGSKh4zZftOT
X-Received: by 2002:a5d:48d0:0:b0:2c4:503:7afc with SMTP id p16-20020a5d48d0000000b002c405037afcmr947539wrs.7.1676664912372;
        Fri, 17 Feb 2023 12:15:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676664912; cv=none;
        d=google.com; s=arc-20160816;
        b=VHmkUjOBsYrScYfWwPwz/uHfJXAtn6aSYpRMmdGDL833OTVCka6OEXGk8/OZxZLtos
         SaduSvsLMU/HwruTp7ETaavbshS4f7x2Lr5db+97vGAzm6Bx2+U+PyFj8wGZp6xd4rIO
         2Jx70uBig39k7UYj6ni11RgpXwmcW28H2AGL+LUaq1UkpqS5BTdHLS8PD9GuwUAbZ8Ch
         qupjOVZlLsVlPpVimVSCdZGEmcLPv47oXRBTJzYEkRLLUcP0LLmEvdtr1dv7b7Yi/3Q1
         j52rJEluXGNeufYPQU4qTrwV20uTp/Mb8+PLvcEVV5BaY/wKscBw3thJxilRBtn07QJb
         7Kaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=P2wIshjuiSQLiuLTFO2x8NqskzvrsEhNu8VusTOC9K4=;
        b=tzQPru1U4ySbd5d449h/Si721yu2QOV6haLY27vOobup0UvIOKtaUnPOctIkB8F9g4
         doVu2fHBKAo7OTd2qWuaIDql8uZZwqN86eetqJn6G+EJcPqnZTNiY0ggOtsPS9b6zgcp
         33Bbp0VczNV8qbHwFUPXuPy9AHzKSWNHh/Um+OY/NDiUkVskrV/lzryFft64Wb+jRgC1
         cTRhRJCpyQL+LTeEJSzk//o8EUCCnkLNlC3qbEYUchbtYPxaC4Roe7NBitcJJWWWR+9U
         MDPIvaXX+zaRrv9h/wC7b0GLafqfqr9UpmaR0hsvhtziy/6Wv4mnV2MfzO2Fruj8KSAA
         z1aQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=RdLVTKrh;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id a8-20020a5d4d48000000b002c554a8a76csi5461259wru.773.2023.02.17.12.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 12:15:12 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=RdLVTKrh;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0316C20FBD;
	Fri, 17 Feb 2023 20:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676664912; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P2wIshjuiSQLiuLTFO2x8NqskzvrsEhNu8VusTOC9K4=;
	b=RdLVTKrh9r/UC2x+2JlT0D27ID7MNQaL9tefkSDJOQG8bKFEUlOu+rShC5fBI5CwYJJqXJ
	LG9OozjZtAwsI0Lh1UKIK37gnCk4cBp0s4mrXTkJeOzkGjyEA2S0Jug4wGtzRRNkPvd1kk
	Gzq5NNdbp44w9RHbAeBK8zESjUYP38o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676664912;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P2wIshjuiSQLiuLTFO2x8NqskzvrsEhNu8VusTOC9K4=;
	b=dt2z0SVaf6c7GLEEoHurt7p8ENTPkf9Sg0uWuV5Y9gblNPimw6Ta40+ZDxY43qiUzQNVUa
	fPK013Tt2K2IEzDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A67A5138E3;
	Fri, 17 Feb 2023 20:15:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GOauG0zg72MwIAAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 17 Feb 2023 20:15:08 +0000
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
Subject: [PATCH v6 22/29] tests/qtest: arm-cpu-features: Match tests to required accelerators
Date: Fri, 17 Feb 2023 17:11:43 -0300
Message-Id: <20230217201150.22032-23-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230217201150.22032-1-farosas@suse.de>
References: <20230217201150.22032-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: hbe7PI7VkFRL

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
