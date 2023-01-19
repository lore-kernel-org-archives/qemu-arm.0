Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp345624ejc;
        Thu, 19 Jan 2023 05:56:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXssdRiAXfK4OiAxl7IWcb+8TgOh9iKFKyDhdfsbo1uKEVB6/JY0T44bukfMjgVUh8tZr2h0
X-Received: by 2002:a5d:5a96:0:b0:2bd:fedc:38fb with SMTP id bp22-20020a5d5a96000000b002bdfedc38fbmr10427802wrb.3.1674136605778;
        Thu, 19 Jan 2023 05:56:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674136605; cv=none;
        d=google.com; s=arc-20160816;
        b=Ss4ejA6rUksx7D/VlCxAlkS4UYsHWepHAepmomw0lmhaWedMvbwaKQ4hrzbWO6ujcs
         ygc5ewmtOUIOc2ThHRMEiM/Odc1kXd0zX6PsHm1mj7m1gARHEKqPjimqme1e7mnRFRcQ
         AJf7QMQHWyhf0Gx2+JJ5TTz6Y8tSSnbbaFBSmHdq7QBJXd/QkIjpf1ZqyxnmiBQwSAmD
         KPCQVVCWnWkw1aB9NlxNPJI4L+jfnIB1bt2h9S5btCM5igT9SG0xAfvJL3unnroL1sdr
         bgNfvSbkadOlsaF2IwdrVvibpDrf2Bw3SjYY8mXt9a0JOiosg5Xt147C+TxCMZ4bj1PN
         SGtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=Kxw6TKsC9kiV5b4c5UCL6Qn2d2CdJeDlo8i5iP+EEIc=;
        b=bgUtrxNM0AgHD4lPT3BjNdYPtptVuzOWdpZExU7LiDBeH+A4mrmI8h5JaHq0VlQh7B
         bE7r2goN/wVQz+wc/6vfmiCNtIfEQufKduQBKQGA/VaAmcIOv9T/KgKqY/H6KNYSTy9E
         ayRakUd62XhDLsquB3Xz0qoMFSuAnbuFjSeFFaGmPC8BpUsQsr5IW0xpZztBlPjYTUaU
         osq1mrwnDbwnVw+MKLjaDgx0gFgxe/VYNzzt6ZleXj9YbBTyY4BlqcAjq4DL9LpWsdas
         mcrR7gSSuBgrm3oj79TRnwUkmYd4R+AX7Yr7YZIoaiLVadQrh1sGHIO4I2YTntk4Drf3
         CsOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=jsTLzQek;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=rNCU1wPF;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id f15-20020a5d64cf000000b00268cb84a022si38822091wri.136.2023.01.19.05.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 05:56:45 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=jsTLzQek;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=rNCU1wPF;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5F30D5CE73;
	Thu, 19 Jan 2023 13:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674136605; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kxw6TKsC9kiV5b4c5UCL6Qn2d2CdJeDlo8i5iP+EEIc=;
	b=jsTLzQekYnBCWELT6ZEMxrmCEQ4zoqpWVOZWqS9124UV2qKhEFIs0DBxo8+Klzp5vwBM2d
	MIvkVvFxMjZWoNWfeWoWDG/9hNNpDExE2kLs4/Z0PFr/AxzimyOvWRcDXe7Besg7I0P+9D
	B9Dp47F2KEGlOEePcmJ+ApB3lzbfG3U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674136605;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kxw6TKsC9kiV5b4c5UCL6Qn2d2CdJeDlo8i5iP+EEIc=;
	b=rNCU1wPFGDw7zl/eyqDQ+hVbT9dxWu+EebmuunernFzSlnfUVWXpMSXqxM0/QfBYFJ9YVX
	MWmBAtWI3O/17NAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D8EE0134F5;
	Thu, 19 Jan 2023 13:56:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id sLkPJxlMyWOCFAAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 19 Jan 2023 13:56:41 +0000
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
Subject: [RFC PATCH v4 04/15] tests/qtest: arm-cpu-features: Match tests to required accelerators
Date: Thu, 19 Jan 2023 10:54:13 -0300
Message-Id: <20230119135424.5417-5-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230119135424.5417-1-farosas@suse.de>
References: <20230119135424.5417-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: jz3d1zY2CT6C

Signed-off-by: Fabiano Rosas <farosas@suse.de>
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
