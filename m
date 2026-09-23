Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E02C982FA
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Sep 2026 13:21:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9MtY-0001wL-9c; Wed, 23 Sep 2026 09:20:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9MrI-0000BH-Jn
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 09:18:10 -0400
Received: from mail-dl2-x10.google.com ([2607:f8b0:4864:38::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9MrF-0006sC-PM
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 09:18:00 -0400
Received: by mail-dl2-x10.google.com with SMTP id
 a92af1059eb24-142dce6e237so674464c88.3
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 06:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790169476; x=1790774276; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=sKNecRa3tzG6HeYVTRQDuQ00e5AIYSJOroCNurGi9rk=;
 b=Nh7UGweVMK4Q24qKEB+jlxH3ioXSR1cYoSdkEXvHlOrQHWk1FiblvCh0f78Wz8DeVm
 VqsnEShxca/46/lm96kt4KR9Y84yGp6UjOBCJBn3Ik37pbXdCLG3uwsW1b+z1S6iA/Zq
 QACQTSxotYf8cVeVYwmtN5RtrxbpHfLf7ra9dh4n/YcUzOnsJF2Lw6vvnvSFr8BO7Jda
 eRukweiPKT20gAWQM1Pp4fLbKFQbq1TgTP1pqG8Va5x2jP8MiClsgYkX5EZSen6DNE/o
 dGeTr6nm+kaJhNJpODhFkEs5wuKfSuIetJXvjpnxA6tjuSpVwQP+vAGtY+WWmAsCNHBX
 m4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790169476; x=1790774276;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=sKNecRa3tzG6HeYVTRQDuQ00e5AIYSJOroCNurGi9rk=;
 b=M4VM65KtcB02VwBvsuevxzL2PuGY5hcpmXGQ1kAR2czmAHCkkhrjr/AmAPbCEjXpXs
 JEo+tLJjHKalQG4bP8BJ9WEAswtYeGyPaj++e5J0ev8CBULIfq7tETB4wGYYGHCgJuo1
 9q9uOLBD/2jnzicVSpDFUJTpSlaW51c6Z3p1Jppl7/HB3vJ6ELWz987uqbgeTlCTQE/3
 mhisnTpLKAmVjdDYtjEfSVKOSz6bN8qiXw2ZyQKb+YyIqq0xeJV46OpO0QgooDLl9WFr
 K9h222m2gbGhLZW+Y6/16TCojdyI+VVN+z6jG4iDeK4b0/ThphwrQzX3DLOJOqepGRMm
 w68w==
X-Forwarded-Encrypted: i=1;
 AKwUvByB6ujGfhm9KHWzsDnSfWnxy1t1vCfAbOgtBBP0/51KENK743I7TYFS8fsW17D2vOLOzUcXowyHIg==@nongnu.org
X-Gm-Message-State: AFuF++mNGBPSYWU3HuEF/fUNWdNgtDqP3rB4hu/hjHdLWBWKsgZE3z3h
 qpaBNv25/H73MX94Lo9MMm+tSGqIwRSCmfAsiMjozb1/eS3YN8yHC90o
X-Gm-Gg: AYBFou31cIt0lcwVZJHbnbedIXZsEDUcHnTRTQC6C4SFoTT6vgc10KAMh6wB8X3RCEF
 lBvD3Eg9f6g71b9O1aX4sF/XZtNj3XuCo8mbF93kdH+ZLGwg7Y05ilXY9fmAdEbpqMexx+7+BLo
 zlZl3E78xyby/b/ZEKjsKq8NBikwF0F4J85nnFRUgZsapdLp4KfH9WPHzk5GrCfLzntHdIoL7aJ
 MCQ38j+EM1W6REWS6lmT1Fx4/cpWRaZzfawViMNoI/LplY9aGRuJ2NekO4dVV23S+i2jl3K6/0A
 S2NE9nVI17hmTta/omghdXoAf2s8DSJX6H/H2/5/to9ntwRXmJb1QDaBZevek03MO2KJXNBAzK9
 MiCRQX9c1p7F0gEeDk0xzFxJf70cZCdpgW/wFviejY5yCyjH/fvuLon9Q/kMiKsx/VQGg9lQjXS
 QawB8zGtQ2rSXtOllzOxHxt/WRqZ7QjMZZ0z5DOkplgOnCxr1PzZb5cx+1s+sDtpj4tXzxIEpv9
 M9SQKhIkIWgnb5eK8qV6EcH3597aHA=
X-Received: by 2002:a05:7301:db0c:b0:33b:96b8:3818 with SMTP id
 5a478bee46e88-33e8ddbe14cmr1954620eec.32.1790169475447; 
 Wed, 23 Sep 2026 06:17:55 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:17:52 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, xen-devel@lists.xenproject.org,
 Chao Liu <chao.liu@processmission.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Peter Xu <peterx@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Fabiano Rosas <farosas@suse.de>, Xianglai Li <lixianglai@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bibo Mao <maobibo@loongson.cn>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 David Hildenbrand <david@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 kvm@vger.kernel.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Song Gao <17746591750@163.com>, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Brian Cain <brian.cain@oss.qualcomm.com>
Subject: [PATCH v3 007/114] vl: parse early options before target-info init
Date: Wed, 23 Sep 2026 21:14:41 +0800
Message-ID: <20260923131635.1894-8-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:38::10;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
index 0d52c5d0a46..dc883de8274 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -2910,16 +2910,6 @@ void qemu_init(int argc, char **argv)
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
@@ -2938,6 +2928,16 @@ void qemu_init(int argc, char **argv)
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


