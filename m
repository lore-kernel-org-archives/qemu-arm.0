Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E3FC982DD
	for <qemu-arm@archiver.kernel.org>; Fri, 18 Sep 2026 11:40:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x7WxG-0000Xz-0n; Fri, 18 Sep 2026 07:40:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1x7WxA-0000Wf-AZ
 for qemu-arm@nongnu.org; Fri, 18 Sep 2026 07:40:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1x7Wx8-0001t6-FU
 for qemu-arm@nongnu.org; Fri, 18 Sep 2026 07:40:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1789731625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=25/usmhwYv9RzdhvH+4Pmb2C2DxCeoy0YmGdWnXznT4=;
 b=Odj+wpSH9gO8ozb3BH1vUQO99unugRIPUeSwLzWgSOwTo+BYSmwaaOy0KROdIWOyN9PT0v
 /glpKnbgO/9FMlJO1OKcECE7+wMM7NtBItXJAHjejX4V3wdMvEnXAj+kcLMNOlMpv2WYUT
 osw5peGHiS7wZRKNfvVpbpp0vaog6rs=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-503-muLTLx86P9yBa7HIUk1m9w-1; Fri, 18 Sep 2026 07:40:24 -0400
X-MC-Unique: muLTLx86P9yBa7HIUk1m9w-1
X-Mimecast-MFC-AGG-ID: muLTLx86P9yBa7HIUk1m9w_1789731624
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93a01d1d1b6so96092085a.1
 for <qemu-arm@nongnu.org>; Fri, 18 Sep 2026 04:40:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789731624; x=1790336424;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=25/usmhwYv9RzdhvH+4Pmb2C2DxCeoy0YmGdWnXznT4=;
 b=o4Zu/2WsCrWc0Qs0n088044vLLUKsJ9UOYjb0L1fZqFp2dHiT8bX/8qmfDXpMpiw1i
 4dtM6p+JPmwSz6Za/6f3sEyIdQoShbk+vFUr8MulPYMix3JSmqoOjvX5bI0vtQJVUSzu
 fp54BCsgqy9lN/+mVLwGefLfszUgdZWQJrEV8cNR0lYcZag5Q6FnvpTVJgxxZZUR0nrh
 Yxqu4Be/KlbfncIe7xuR53TyyOCUu1DoEcIRkK7P6cuKXeWtP7L0IEzAqTSF4mTradqo
 QIkdZqbjV8+mqHN7f4XElOonQizVjmHIvMxX4ZbFJ30QUESR+9MxBMHnn4K27GzDg3Jo
 j01g==
X-Forwarded-Encrypted: i=1;
 AKwUvBzJWZfC4IQQ3AHmQYHrTFwOz+2OIoISBDmz3+RKQcgKUEaxVJYnQQb72AlKF9V+gmqaty85ukdbkQ==@nongnu.org
X-Gm-Message-State: AFuF++kvY/K9Mr8pC8z+eEGAJerDSbNoGc7sdjmSF5+cm2FYM9KKHz/s
 XFHKFSfFCKDa2C3yYqW6/oXLkpCzbXAfmwKqpn7HWHURfANEbA4+GCuU4n2Y4cZ4hdFI7BsmnMx
 Xj0NN0ZJRBnPpRy5qe4eGmivYOiEh69NiZXevbExK9irmUR9nmwIbuw==
X-Gm-Gg: AYBFou1Z5sP5s2QaomF/CaJKPpKGLjvJpBJsP7cM/AaIKSvRPRq0H3OqdIyiDS99wbZ
 Olbt3GjWyhQIuNZvmQR8IsFK1rlLyfEwSI8/5h7Q1aNpaXj/TaussJAb3I9rf8M8go9V4Q/nMPP
 t8jjPzz30XZ9xKF+sbs+df1pI3HQjD3oQJC3kwrq9uSfKNgM7p3wJUUZ5FoXOlV8zu1qisGLukn
 3pwQS6tx9eeqCmX5h06HXCmbFD+JUD+Zwrs1VoSjOXt8p9cNE4E/2enbSbvpTn9SaMtKcGex8Xt
 XwMPLIek6eA53/5pX6ybwHWuEQbE7WZ5bs1rMkqGTrSD3dYcOmnOsWWEm085xscRfz+ZcjoHH2S
 WZSvnU/v3x92YTypa+lCfsWdUVS8FOF33VfFRE0YAG/mKw/3ERfDimQtxp9o=
X-Received: by 2002:a05:620a:268d:b0:934:ab73:ac53 with SMTP id
 af79cd13be357-93bdc475a1fmr265021685a.0.1789731623996; 
 Fri, 18 Sep 2026 04:40:23 -0700 (PDT)
X-Received: by 2002:a05:620a:268d:b0:934:ab73:ac53 with SMTP id
 af79cd13be357-93bdc475a1fmr265017885a.0.1789731623454; 
 Fri, 18 Sep 2026 04:40:23 -0700 (PDT)
Received: from localhost
 (bras-vprn-aurron9134w-lp130-03-174-91-117-74.dsl.bell.ca. [174.91.117.74])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93be0ead31asm116851585a.25.2026.09.18.04.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 04:40:22 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org
Subject: [PULL 07/11] arm/aspeed: Drop ASPEED_RAM_SIZE
Date: Fri, 18 Sep 2026 07:39:22 -0400
Message-ID: <20260918113926.831204-8-peterx@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918113926.831204-1-peterx@redhat.com>
References: <20260918113926.831204-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sGqk0GaKOZWyDJ_GympdTJkamQRUrhaKUu6e4ciNgEE_1789731624
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
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

QEMU has switched to 64bit-only hosts for all system/user emulations.  It's
not needed anymore.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Link: https://lore.kernel.org/r/20260818172012.3052821-8-peterx@redhat.com
Cc: "Cédric Le Goater" <clg@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Steven Lee <steven_lee@aspeedtech.com>
Cc: Troy Lee <leetroy@gmail.com>
Cc: Jamin Lin <jamin_lin@aspeedtech.com>
Cc: Kane Chen <kane_chen@aspeedtech.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Joel Stanley <joel@jms.id.au>
Cc: qemu-arm@nongnu.org
[peterx: fix aspeed_ast2600_sanmiguel.c, recently added in b6bcec6c2]
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/hw/arm/aspeed.h           | 7 -------
 hw/arm/aspeed_ast2600_anacapa.c   | 2 +-
 hw/arm/aspeed_ast2600_bletchley.c | 2 +-
 hw/arm/aspeed_ast2600_catalina.c  | 2 +-
 hw/arm/aspeed_ast2600_fby35.c     | 2 +-
 hw/arm/aspeed_ast2600_fuji.c      | 2 +-
 hw/arm/aspeed_ast2600_gb200nvl.c  | 2 +-
 hw/arm/aspeed_ast2600_sanmiguel.c | 2 +-
 8 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
index 54f0d7643d..989d39528e 100644
--- a/include/hw/arm/aspeed.h
+++ b/include/hw/arm/aspeed.h
@@ -26,13 +26,6 @@ DECLARE_OBJ_CHECKERS(AspeedMachineState, AspeedMachineClass,
 #define ASPEED_MAC2_ON   (1 << 2)
 #define ASPEED_MAC3_ON   (1 << 3)
 
-/* On 32-bit hosts, lower RAM to 1G because of the 2047 MB limit */
-#if HOST_LONG_BITS == 32
-#define ASPEED_RAM_SIZE(sz) MIN((sz), 1 * GiB)
-#else
-#define ASPEED_RAM_SIZE(sz) (sz)
-#endif
-
 struct AspeedMachineState {
     MachineState parent_obj;
 
diff --git a/hw/arm/aspeed_ast2600_anacapa.c b/hw/arm/aspeed_ast2600_anacapa.c
index 697be58b0e..25578db589 100644
--- a/hw/arm/aspeed_ast2600_anacapa.c
+++ b/hw/arm/aspeed_ast2600_anacapa.c
@@ -17,7 +17,7 @@
 
 #define ANACAPA_BMC_HW_STRAP1 0x00002002
 #define ANACAPA_BMC_HW_STRAP2 0x00000000
-#define ANACAPA_BMC_RAM_SIZE ASPEED_RAM_SIZE(2 * GiB)
+#define ANACAPA_BMC_RAM_SIZE (2 * GiB)
 
 /*
  * "Anacapa HPM (MB)" FRU data. Generated with frugen.
diff --git a/hw/arm/aspeed_ast2600_bletchley.c b/hw/arm/aspeed_ast2600_bletchley.c
index 2822f6bdf5..6fa606c047 100644
--- a/hw/arm/aspeed_ast2600_bletchley.c
+++ b/hw/arm/aspeed_ast2600_bletchley.c
@@ -17,7 +17,7 @@
 /* Bletchley hardware value */
 #define BLETCHLEY_BMC_HW_STRAP1 0x00002000
 #define BLETCHLEY_BMC_HW_STRAP2 0x00000801
-#define BLETCHLEY_BMC_RAM_SIZE ASPEED_RAM_SIZE(2 * GiB)
+#define BLETCHLEY_BMC_RAM_SIZE (2 * GiB)
 
 static void bletchley_bmc_i2c_init(AspeedMachineState *bmc)
 {
diff --git a/hw/arm/aspeed_ast2600_catalina.c b/hw/arm/aspeed_ast2600_catalina.c
index ad2953dfea..4f2b396f6f 100644
--- a/hw/arm/aspeed_ast2600_catalina.c
+++ b/hw/arm/aspeed_ast2600_catalina.c
@@ -19,7 +19,7 @@
 /* Catalina hardware value */
 #define CATALINA_BMC_HW_STRAP1 0x00002002
 #define CATALINA_BMC_HW_STRAP2 0x00000800
-#define CATALINA_BMC_RAM_SIZE ASPEED_RAM_SIZE(2 * GiB)
+#define CATALINA_BMC_RAM_SIZE (2 * GiB)
 
 #define TYPE_TMP421 "tmp421"
 #define TYPE_DS1338 "ds1338"
diff --git a/hw/arm/aspeed_ast2600_fby35.c b/hw/arm/aspeed_ast2600_fby35.c
index 65d98fafec..28c9c143d8 100644
--- a/hw/arm/aspeed_ast2600_fby35.c
+++ b/hw/arm/aspeed_ast2600_fby35.c
@@ -16,7 +16,7 @@
 
 #define TYPE_LM75 TYPE_TMP105
 #define TYPE_TMP421 "tmp421"
-#define FBY35_BMC_RAM_SIZE ASPEED_RAM_SIZE(2 * GiB)
+#define FBY35_BMC_RAM_SIZE (2 * GiB)
 
 static const uint8_t fby35_nic_fruid[] = {
     0x01, 0x00, 0x00, 0x01, 0x0f, 0x20, 0x00, 0xcf, 0x01, 0x0e, 0x19, 0xd7,
diff --git a/hw/arm/aspeed_ast2600_fuji.c b/hw/arm/aspeed_ast2600_fuji.c
index dae0239387..08d809b2fd 100644
--- a/hw/arm/aspeed_ast2600_fuji.c
+++ b/hw/arm/aspeed_ast2600_fuji.c
@@ -19,7 +19,7 @@
 /* Fuji hardware value */
 #define FUJI_BMC_HW_STRAP1    0x00000000
 #define FUJI_BMC_HW_STRAP2    0x00000000
-#define FUJI_BMC_RAM_SIZE ASPEED_RAM_SIZE(2 * GiB)
+#define FUJI_BMC_RAM_SIZE (2 * GiB)
 
 static void get_pca9548_channels(I2CBus *bus, uint8_t mux_addr,
                                  I2CBus **channels)
diff --git a/hw/arm/aspeed_ast2600_gb200nvl.c b/hw/arm/aspeed_ast2600_gb200nvl.c
index 311feb8202..c9c0b6cb6e 100644
--- a/hw/arm/aspeed_ast2600_gb200nvl.c
+++ b/hw/arm/aspeed_ast2600_gb200nvl.c
@@ -15,7 +15,7 @@
 /* GB200NVL hardware value */
 #define GB200NVL_BMC_HW_STRAP1 0x000000C0
 #define GB200NVL_BMC_HW_STRAP2 0x00000003
-#define GB200NVL_BMC_RAM_SIZE ASPEED_RAM_SIZE(1 * GiB)
+#define GB200NVL_BMC_RAM_SIZE (1 * GiB)
 
 static const uint8_t gb200nvl_bmc_fruid[] = {
     0x01, 0x00, 0x00, 0x01, 0x0b, 0x00, 0x00, 0xf3, 0x01, 0x0a, 0x19, 0x1f,
diff --git a/hw/arm/aspeed_ast2600_sanmiguel.c b/hw/arm/aspeed_ast2600_sanmiguel.c
index 599ef1701f..345a9c9416 100644
--- a/hw/arm/aspeed_ast2600_sanmiguel.c
+++ b/hw/arm/aspeed_ast2600_sanmiguel.c
@@ -18,7 +18,7 @@
 /* SanMiguel hardware values */
 #define SANMIGUEL_BMC_HW_STRAP1 0x00002002
 #define SANMIGUEL_BMC_HW_STRAP2 0x00000000
-#define SANMIGUEL_BMC_RAM_SIZE ASPEED_RAM_SIZE(2 * GiB)
+#define SANMIGUEL_BMC_RAM_SIZE (2 * GiB)
 
 #define TYPE_DS1338 "ds1338"
 
-- 
2.55.0


