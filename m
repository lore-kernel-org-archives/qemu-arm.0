Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5826BC98328
	for <qemu-arm@archiver.kernel.org>; Sat, 26 Sep 2026 07:09:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xAMPd-0002DC-T4; Sat, 26 Sep 2026 03:01:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMPZ-0002Cn-Rr
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:01:31 -0400
Received: from mail-dy2-x0e.google.com ([2607:f8b0:4864:36::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMPW-0000QI-Q8
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:01:28 -0400
Received: by mail-dy2-x0e.google.com with SMTP id
 5a478bee46e88-34182b58d00so863339eec.2
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 00:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790406085; x=1791010885; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NOaZ4jAlSCyjxqIHA0N9ZQnaaf/7JpAiIPWzPNATCyQ=;
 b=OjDkGNDRfr4qRhQ/+OQ4tI0J9Ehp6K+V4ATjgrfnqEZQswPrEgdCE96KFFfF+/pZji
 KJCsga8sWuRkkZvlM/yDP8XjHvUZD2d2Tg3S2obJ2QUrBXd/Cv+47Nl/5pceDqXkai38
 Qnu4FUnFWJTfCxPMMO7MCi0VIASFD5dq1VLCj/2MPbin0l7gYzdbMBahLDRTSDIPsIMA
 bUr79HecSQtjeMEqHI41VJHHHRVjsMcbLPiv5orDezZZUJkwSR0p1axD1TjE50PebV05
 YOrx/RuaUQTWlBa1SuBPF6XzcMYSCWcQOwgN0ZHcEc4OtNit4rD43gej/YkcZ4agnoN6
 zLZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790406085; x=1791010885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=NOaZ4jAlSCyjxqIHA0N9ZQnaaf/7JpAiIPWzPNATCyQ=;
 b=X06RuMwRXkuNqGiaFPDi9AnCNuWwkdHuUdrGlV0aVr3edigw+GTvdwYVS4r8do5JwA
 t3vgsvqW93W8CFek+u/GgKeo78hhQuXa1dA52SVfWPzgni/s6FhqL6mtmj+KcRe4Ax3f
 joKHjMBprJm6abA2QlyheMyF3343RiVtQ8csAZKAFLLlgFjHbCMeFmu9+BgmLztS7JGg
 Rf0kT5vlKc7GeizyxjIO/iI5BO278Al44JaIzc7l2iLf7/jimBrueCAlBv+yeQSy1q6d
 mLMVzK7dASqvMygogEYzeJoS1c69mY74F4/QaYXTpGVUmEjRTGl4R/LBrv/6SiTQO98f
 NJqA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxeHhvr5mO9PCipAlXtLNq2odJdyEAWk6p8fv34KExdut819OACGMtmzdK6ZVps9EHUp5O1k3Tz/A==@nongnu.org
X-Gm-Message-State: AFuF++kjzKfNCzuCsaPsUFjKI7Gsj04ZhL51cemH64zeZSTOOs9uuPge
 wMpkzWClEk3d1oeMOdeRCuuRl/2duwGCORIOM/7j8oz4QlURzIb6L9KC0zWU8dP4
X-Gm-Gg: AYBFou2eeUNRmKSTY35j0ZSEsmNOYrjKq1ZRMLA+Sza7bamAJT4WaXsgmH0+o2e4Hoi
 8kAVq3JWNluo9xv53TjTkgxzJ5f5EsZYuHsg2VL4NaVUtddNtHVvjxS3uhwbmW6jDdekKBesGYH
 g6Cln89s6fWBIzAV1eWEP4wXZ9gZHy99PLV/rRzakHk3kBbYbyn/mzHnZjoSsRhpmVSdJ4wRfvJ
 p2ToHz9XFBabarUAE9WJIMGVDTYMac2JytPD853J95+SWj2h5SPraQGLeI/A5yi8RBZ1Pn+Brtg
 W2hk7nM2CYIFNXkOUFwwwHR5ttaloPp2bE1LNK5MYFptPSy3qC8N9JUdYQ+LYGv3lc6BeGJVI6c
 6qImTLtPpdllsXt8ahDyTn2w4vVFit9d19+Pw8u6sVvgt3MCSRRf3yL5UXuQVWVI+ypYZLmrqLz
 rDYGbEB/xhpyHP+iPukyMxTSJfHmlceIy2Zr1biSVvBmeh9efI9e0q2Eiq+qltWqBeGsu3tx4rs
 RuMzhtacmIa7HwVVWtsL2MyFt0RqYTa
X-Received: by 2002:a05:7300:a986:b0:328:7033:9b8c with SMTP id
 5a478bee46e88-342711ac458mr3353958eec.6.1790406085251; 
 Sat, 26 Sep 2026 00:01:25 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34145c166cfsm10615141eec.28.2026.09.26.00.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 00:01:24 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH v4 05/55] vl: parse early options before target-info init
Date: Sat, 26 Sep 2026 15:00:04 +0800
Message-ID: <20260926070057.1234-6-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260926070057.1234-1-luoyonggang@gmail.com>
References: <20260926070057.1234-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::e;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x0e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Move the first argv pass ahead of MODULE_INIT_TARGET_INFO so later
target-info selection can use command-line options before QOM init.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 system/vl.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/system/vl.c b/system/vl.c
index 468a9fc247a..3efa4968a20 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -2912,16 +2912,6 @@ void qemu_init(int argc, char **argv)
     error_init(argv[0]);
     qemu_init_exec_dir(argv[0]);
 
-    os_setup_limits();
-
-    module_call_init(MODULE_INIT_TARGET_INFO);
-    target_info_qom_set_target();
-
-    module_init_info(qemu_modinfo);
-    module_allow_arch(target_name());
-
-    qemu_init_subsystems();
-
     /* first pass of option parsing */
     optind = 1;
     while (optind < argc) {
@@ -2940,6 +2930,16 @@ void qemu_init(int argc, char **argv)
         }
     }
 
+    os_setup_limits();
+
+    module_call_init(MODULE_INIT_TARGET_INFO);
+    target_info_qom_set_target();
+
+    module_init_info(qemu_modinfo);
+    module_allow_arch(target_name());
+
+    qemu_init_subsystems();
+
     machine_opts_dict = qdict_new();
     if (userconfig) {
         qemu_read_default_config_file(&error_fatal);
-- 
2.52.0.windows.1


