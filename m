Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531E7D65C56
	for <qemu-arm@archiver.kernel.org>; Wed, 17 Dec 2025 14:34:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vVsaW-0001wY-AH; Wed, 17 Dec 2025 09:33:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vVsZg-0001aO-Vf
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 09:32:24 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vVsZd-00074v-Gb
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 09:32:18 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4779ce2a624so61374715e9.2
 for <qemu-arm@nongnu.org>; Wed, 17 Dec 2025 06:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765981936; x=1766586736; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XUbyBOmogDSj3+4c56O0TI6S8LRQ6OyrdzdZ0KcvzLg=;
 b=YsqxErFsQ27g95sS63o1nCH5F4ShIdelRUrNx3JyyvRZx039r08rLRJzUOUqaWR4n0
 EQgxATXGWqhIwZqnGuyBIKIBOdEuQeoGcWvvSg1suRZPtxwKU1npFn7wZk7jOHntB9qx
 3/ZyUBAnAIZsgBVgKTJNVa4PURea9Bel4szdQ6bGJD8RpKvJjFJmdqqHHxthtWWPlaC0
 ZmA8zOKCHeDdON3OV0EJOG08sLkld0r6byz0xNpLGfR6RDnBrgjTBaCRB47/v9pbiNMQ
 WU3YrNSGxkysdkLaxha2QdmE3h6QsUWSUvTgz5zBcaU2CAydUnSBpebh/8BU94NysWAh
 S6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765981936; x=1766586736;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XUbyBOmogDSj3+4c56O0TI6S8LRQ6OyrdzdZ0KcvzLg=;
 b=jIcMU6GPgNEUoZfkWzyTTXq60Pho/t6fRRk0+qSST0Uvr/AMVujbW1Fk1Xdu8ofzoF
 UbiWkXdhsldkx6Dt5ZpiAgMu5ezGUxbVNPC9XXQWYlu8YA+ag+cVif/BLBpSgvy66Hhv
 oDbE7UhUKUjeCyXw4IjV6WomaStJGs2oWVInQzUrwLrGpa9O0sG4069HOldVa7oYLRuB
 Es99UZhCn7c6NK/x0NGf0IpoObzETm1I3AFbKr5K7QuGS1UH0BQJsYy/gfoP8EvG7FuO
 2b/108/6ulc+S2WhbDWnq4geGxlwc7ECZJLVnRBLaD1dVDh79DAsx2ROayqlzMg9kAst
 b8jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlc/4msyglMZF1zSEjsXzRrU0ZtESHgSMpMXDnuVIkuoI4iZvrHZeV2PYiRg9hr7IKYU4mer4c/g==@nongnu.org
X-Gm-Message-State: AOJu0Yzv6qDBrMzsjLQk1Ecm044xv3BaR4MkxZ86AqqMaND0WuVTSwnB
 RsqNy37cKbLD2LyUFhsW6Ttw23XIXMQ718fXEm/Tl6C5dz4U8426aFAkiyzVda5YaFE=
X-Gm-Gg: AY/fxX5LL4YGRWq/by5qG/uNko+7jVHfmOxId9UlFqXSftyCT96TufsgSucIXYAsQBi
 e8Vx5bVs4zkvwB00yc6g84IHkaV3OsMkblClIWvt19uwK7hgculr0rymEgBHBPKi1sE7BqaHReF
 MU316uU/2TcMZjd15nqZ9m2x/RBBqSrOQ70AyOik/i4iS2ZYJIyEnpgY+OZgF78P+EROe+MINKi
 UbUG83BL08rlzpvZuaEV35NJjfogv277qGipj4QMlJsMBED7KcdNYSGe/+JS6w+C5PSFzDGWo/B
 2WpJ0qgXKYo/KCS0GccNsEX8VQbTYBKXRcD5dfKvFv0a/gv/Zkf+wj/7BZh0SMrhu+npTyXXBCe
 TIaaCTIsj3DJ4Sxd2wbZAvzSbVykmZP9kqvqrFgpGEvJKC3MKlGV2OOnnWZqP8PpwJUVhySQ5RM
 M+FUtPnSOXKTBWa4+Od55oF7gMOQYAp+u6lHaki4f5w6+uquO3HxEhEkSz0jjD
X-Google-Smtp-Source: AGHT+IG1Sq0CNmTwPcwxmZQwoHtUbY7reyVlCsgJ98GdeAMI7tHBSUVhBVE1wrLWSIs8t3uhywPwkg==
X-Received: by 2002:a05:600c:1c1a:b0:477:5c58:3d42 with SMTP id
 5b1f17b1804b1-47bda747ed7mr54588085e9.10.1765981935987; 
 Wed, 17 Dec 2025 06:32:15 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47bdc1edd26sm40175975e9.13.2025.12.17.06.32.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 17 Dec 2025 06:32:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@kernel.org>, Peter Xu <peterx@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
Subject: [PATCH 03/14] hw/arm: Update bootloader generated with '-kernel'
 using stl_phys()
Date: Wed, 17 Dec 2025 15:31:39 +0100
Message-ID: <20251217143150.94463-4-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251217143150.94463-1-philmd@linaro.org>
References: <20251217143150.94463-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

When the MemTxAttrs value is not specified and no MemTxResult
provided, address_space_ld/st() is equivalent to the simpler
ld/st_phys() API variant. Use the latter.

The _notdirty() variant is supposed to /not/ mark the updated
CODE page as dirty, to not re-translate it. However this code
is only used with the '-kernel' CLI option after the machine
is created and /before/ the vCPUs run, and *only* during the
first (cold) reset; not during following (hot) resets. The
optimisation is totally not justified, since we haven't
translated any guest code yet. Replace by the normal stl_phys()
helper.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/aspeed.c | 3 +--
 hw/arm/boot.c   | 6 ++----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 3a5071a3841..8ce82f1f622 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -77,8 +77,7 @@ static void aspeed_reset_secondary(ARMCPU *cpu,
     CPUState *cs = CPU(cpu);
 
     /* info->smp_bootreg_addr */
-    address_space_stl_notdirty(as, AST_SMP_MBOX_FIELD_GOSIGN, 0,
-                               MEMTXATTRS_UNSPECIFIED, NULL);
+    stl_phys(as, AST_SMP_MBOX_FIELD_GOSIGN, 0);
     cpu_set_pc(cs, info->smp_loader_start);
 }
 
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index b91660208f5..5ca9c8db5cc 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -266,8 +266,7 @@ static void default_reset_secondary(ARMCPU *cpu,
     AddressSpace *as = arm_boot_address_space(cpu, info);
     CPUState *cs = CPU(cpu);
 
-    address_space_stl_notdirty(as, info->smp_bootreg_addr,
-                               0, MEMTXATTRS_UNSPECIFIED, NULL);
+    stl_phys(as, info->smp_bootreg_addr, 0);
     cpu_set_pc(cs, info->smp_loader_start);
 }
 
@@ -277,8 +276,7 @@ static inline bool have_dtb(const struct arm_boot_info *info)
 }
 
 #define WRITE_WORD(p, value) do { \
-    address_space_stl_notdirty(as, p, value, \
-                               MEMTXATTRS_UNSPECIFIED, NULL);  \
+    stl_phys(as, p, value);       \
     p += 4;                       \
 } while (0)
 
-- 
2.52.0


