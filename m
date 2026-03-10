Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD7CEB106D
	for <qemu-arm@archiver.kernel.org>; Tue, 10 Mar 2026 15:18:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzynq-0007qF-7N; Tue, 10 Mar 2026 11:15:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vzynk-0007PM-Fk
 for qemu-arm@nongnu.org; Tue, 10 Mar 2026 11:15:16 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vzynh-0000Tj-JR
 for qemu-arm@nongnu.org; Tue, 10 Mar 2026 11:15:15 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-439c56e822eso7531555f8f.2
 for <qemu-arm@nongnu.org>; Tue, 10 Mar 2026 08:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773155712; x=1773760512; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O+WVwlwWedTKo5OWofmUZp1jp/fRrcugU2rLEnPb50c=;
 b=XwxNeBlapUzZ6KykvqRNxbIIVRFMsMaz606xBwe23FcUFsWA9I1d8Ff8JGRaK17l07
 qNwrgi/bUCiGyEYKanTiVP5ca6kjOXtLTB0gGzvR5vDVlx/ov8kP2kzKulGVNAXICdNY
 rAT4BpDKHQ+zOVK3bFOCu3kxkgWKUVXySF+MRW2YpZvGj2+7K+5SKSpGpCOsQKpzBFt2
 bHLaNXe/nt5uyQbLMDadqv4hnG3/sQfRcWhBD1HJporxUsz3eO4xQtH4sDP7eVDkli8P
 /mViPztEsOqiDk1zlt6/aSdBXLGS5B9FkwuaorAbx2OzOLPV9GA+s0z85CdxsDplfx8C
 xIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773155712; x=1773760512;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=O+WVwlwWedTKo5OWofmUZp1jp/fRrcugU2rLEnPb50c=;
 b=UKkOusNXmWfKdRymkDcQt0zmPhBvPbJ6dI11VmTTcRIpr8rlLNWFvVZHhN+BV+zfQW
 0EmF9OWUK2ZTMYGGdilCzq4HO8wL1PScuYmVmjQdRst2W2QWAn8GuoTQfQC7HwHArilH
 nZ5EaItrnwOwXnRHKu3fjh7xp/2UTviuBRTiGRmX62YB2RnziN9bhK9Athsyo80bJ9TX
 9kb3yr5N7rRx8xJrIVQnXg+kgdSqwMyLAqUgVvDY948S3SQ6gkJUI0R79jQi65cTIzoS
 6Z8P9o16Lwooqkl0XkYtN7k2GFTH0fxdun8xeT9QNJvc2aqiJyaWevzGp7ZPhlfqng07
 1LfQ==
X-Gm-Message-State: AOJu0YwoIk+OmgmiK53mQp6J+hVz0zLv77LiosOxpKXvwOaH3BOehVFx
 U4Rxs65+SDqIdlf+JGMdgiF51zmWuehCUNKT3EITTXKFcHgPn5N0buJz7XMtBhn90EDoMcSutyY
 9pF8Y
X-Gm-Gg: ATEYQzxnJKy38lEvh7Plhew7LuYVa0k/bjUHbCCp+gnGa7XzVfZIq7J4QDW5YbfC+Xn
 5ogFUdJ9vvlLydsFlq62T4O3lLVLM+Ly4nGnq6dOJRWMU1DdiPZiNu5SYeRZD6E7qi7H5Ty0fKh
 wGiMOuGM4cHLRujORYParNUVrZKehqvR4+Xf3VwlFhB6789piwx/N2kFkJVt3+JgyL0vR2k5vLq
 3btCRep0qrPPAjGFLvnKFL4hHdGmq/JiokTnpIppOaDFoOClCUeIc8KUMsg2qy0YwULIVte/LhZ
 l+7qsfRebwRbhnbpJsDmaOFu/D+dgDDSzDXfGvrIxhdqza6TgwR+XKkF/AKqo/gFdfJFgid3Pb8
 qeV+sN9omKWkhNuKSM6kSRMGaUsfk/UkqI42CeR6XpARDuBswQmVT+8jfFr86IdlQ/SF4QiNwu0
 gJr5UggMxmWR3aGkQ8lU7gr8zDbNzUH6Da/ZMHAU5AXp1q3DwG8tE0sf2E9MdKhXge0nQr8939n
 ShHiEU9o5UCePcRGw4vvmEnm+qxv5W9yMeM0Ryckw==
X-Received: by 2002:a05:600c:4e45:b0:485:4100:1eee with SMTP id
 5b1f17b1804b1-485410020ffmr75077065e9.24.1773155711470; 
 Tue, 10 Mar 2026 08:15:11 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4853588758fsm127303185e9.4.2026.03.10.08.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 08:15:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
Subject: [PATCH 2/2] tests/qtest/arm-cpu-features: Use g_strdup_printf()
 instead of char arrays
Date: Tue, 10 Mar 2026 15:15:07 +0000
Message-ID: <20260310151507.2973843-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310151507.2973843-1-peter.maydell@linaro.org>
References: <20260310151507.2973843-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Older versions of gcc with -Wformat-overflow=2 don't like the usage of
fixed size char arrays in this test; gcc 7.5.0 (SUSE Linux) says:

../tests/qtest/arm-cpu-features.c: In function ‘test_query_cpu_model_expansion_kvm’:
../tests/qtest/arm-cpu-features.c:578:35: error: ‘%u’ directive writing
between 1 and 10 bytes into a region of size 5
[-Werror=format-overflow=]

These can't actually happen because of the limited size of the values
being substituted in.  However rather than require readers to check
whether the arrays really have been declared large enough, we prefer
to use g_strdup_printf() for this kind of string work.

Reported-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/arm-cpu-features.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index eb8ddebffb..5444e4d40b 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -519,7 +519,6 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
         bool kvm_supports_pmu;
         bool kvm_supports_steal_time;
         bool kvm_supports_sve;
-        char max_name[8], name[8];
         uint32_t max_vq, vq;
         uint64_t vls;
         QDict *resp;
@@ -573,9 +572,12 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
         }
 
         if (kvm_supports_sve) {
+            g_autofree const char *max_name = NULL;
+            g_autofree const char *name = NULL;
+
             g_assert(vls != 0);
             max_vq = 64 - __builtin_clzll(vls);
-            sprintf(max_name, "sve%u", max_vq * 128);
+            max_name = g_strdup_printf("sve%u", max_vq * 128);
 
             /* Enabling a supported length is of course fine. */
             assert_sve_vls(qts, "host", vls, "{ %s: true }", max_name);
@@ -583,6 +585,9 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
             /* Get the next supported length smaller than max-vq. */
             vq = 64 - __builtin_clzll(vls & ~BIT_ULL(max_vq - 1));
             if (vq) {
+                g_autofree const char *name2 =
+                    g_strdup_printf("sve%u", vq * 128);
+
                 /*
                  * We have at least one length smaller than max-vq,
                  * so we can disable max-vq.
@@ -595,11 +600,10 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
                  * unless all larger, supported vector lengths are also
                  * disabled.
                  */
-                sprintf(name, "sve%u", vq * 128);
-                error = g_strdup_printf("cannot disable %s", name);
+                error = g_strdup_printf("cannot disable %s", name2);
                 assert_error(qts, "host", error,
                              "{ %s: true, %s: false }",
-                             max_name, name);
+                             max_name, name2);
                 g_free(error);
             }
 
@@ -608,7 +612,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
              * we need at least one vector length enabled.
              */
             vq = __builtin_ffsll(vls);
-            sprintf(name, "sve%u", vq * 128);
+            name = g_strdup_printf(name, "sve%u", vq * 128);
             error = g_strdup_printf("cannot disable %s", name);
             assert_error(qts, "host", error, "{ %s: false }", name);
             g_free(error);
@@ -620,9 +624,11 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
                 }
             }
             if (vq <= SVE_MAX_VQ) {
-                sprintf(name, "sve%u", vq * 128);
-                error = g_strdup_printf("cannot enable %s", name);
-                assert_error(qts, "host", error, "{ %s: true }", name);
+                g_autofree const char *name2 =
+                    g_strdup_printf("sve%u", vq * 128);
+
+                error = g_strdup_printf("cannot enable %s", name2);
+                assert_error(qts, "host", error, "{ %s: true }", name2);
                 g_free(error);
             }
         } else {
-- 
2.43.0


