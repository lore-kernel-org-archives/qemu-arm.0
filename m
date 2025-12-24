Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20482E776C1
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Dec 2025 15:16:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vYQak-0003zo-VE; Wed, 24 Dec 2025 10:15:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vYQaQ-00039K-H1
 for qemu-arm@nongnu.org; Wed, 24 Dec 2025 10:15:40 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vYQaM-0003M3-Vt
 for qemu-arm@nongnu.org; Wed, 24 Dec 2025 10:15:37 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-477a219dbcaso49756035e9.3
 for <qemu-arm@nongnu.org>; Wed, 24 Dec 2025 07:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766589332; x=1767194132; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2STsbh54189qE+1o4laR9gYQuE676566ttls3ZWds+w=;
 b=C2i+Lu1/lY2l8ogeiQpxwXpWNImyZL5KyamCnrfqss6OcAfRGD/uaYMeFMzjPkFTIL
 0XybxnQ4by1IgNOB3dAzqrK0ZLVKd97OejqAFDoa6W9hlCYGwIKng1oL1lEyUcALyC88
 yaAbP7pav/6nUKfWgGA+EgyKiUIwQQl+5Z4ThyaRo1+rWekHLo1sf+yyVuJDqZsCQECl
 CJN8+BBwnQRIqA0+pYny+4V0QhQmbYO13rDSEoOJD5b/mJO0j1G9x3taaRngumuoWcBg
 KEvhYpiX9YYwY7eFhg6lXjE8Rie0F9xBUSRnm9UVG4VwUhEH70X6iGBRssX0ysMMFFb9
 TC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766589332; x=1767194132;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2STsbh54189qE+1o4laR9gYQuE676566ttls3ZWds+w=;
 b=S0wilCEfjK56fc7XkvKDRz99tdr36p7JbOfqpxHbtSUrdx2SYZXaWQotYofSd6xDoz
 gRoeSlhNoUt+ge2PX9Zmvn7a4AlZAbSkSzqaZVhGcXDDEMPpTsa1p7KN26sHffKDOkiG
 VLJVa0JKfARrblQDuj82638jcgNFQjbD9s07IaIouTfQhMpKvi39+rirtgKL+8dR+n2g
 bGeKJAk1yt7FlGcUbojted7bvPNT29nDzszMx0Geo4AwTiaO1UsDdViWIsAGi84qP1Qn
 IJmVd04y2hUrE9z2zh8Gd+2bqUII9skmPKjNVf31HOA1uYtPlECS6c3wsfSkUTTBfl28
 CeFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXp8EtkWvJ4u28kTQA2cLPdtuyWwDaH7drki1Ksv0DhgAa0h51rqxGKIBNu+dy+DBGZF0NkUwp+fA==@nongnu.org
X-Gm-Message-State: AOJu0YwTIa2BK12SWh5zkxtXs9AccDLewOqOETBkLii7Mh6tF+5Emg/b
 Zv0Mpq8YBM8bIRNd2d5bofOuPjOtxAmOnQtq7sRtklWB796Ht8n8gAhmkm+QGIpyjoA=
X-Gm-Gg: AY/fxX7JFykrtDJjCdanxMsLCIXJ89gi7T1L7/9GouYbHAdVv4DL/dA8YK94dCxDlzb
 Qsxe4cRwYmYncAVzPcT/uKWeqN102Wlf4QXmWZ5Nt3KaZW4K5/1eRqaykmfR4tY8XD2xY/IUihW
 1IbG035jI2ssg3zd4Tz6iJXgfYkdZiiTzZEH/eq7i6t4op/mUKfa466czX35KDtRv/AGVa7rJwP
 Te6S+fIESh9AxBnEnrgH0DB+ttxf2Qlhv3D9NNQh8ZXX3vbd7Jx9azziZw336Jvo78CP90koToR
 EU+8OUDPnstX7FvpM1rp2CtgEVz63GcjDKGJ4FS5f9BWi0Ph6rm/WgkqEHtloGBWRrFDxFgNMdc
 Axj1txZkamnwcV+OcMiyUD2Zsja3MO3sIy7cOXjaaUomdewL79tyOh02nAJb8b3SAHcREfvywp6
 h6yx6ZW/BQ+Sr36JNsj5TD1hAe+V0feTeFhpKehw9vqXLNyCLnyeYbJTI=
X-Google-Smtp-Source: AGHT+IEvgoodsu6aqePYO/wwRACAfiF8+aQZuVYdSTZPgyXTech4Vmn7J/UyE82A49aABPsyHEOu8Q==
X-Received: by 2002:a05:600c:3b0e:b0:477:b0b9:3129 with SMTP id
 5b1f17b1804b1-47d1955b7d1mr180064125e9.3.1766589332150; 
 Wed, 24 Dec 2025 07:15:32 -0800 (PST)
Received: from localhost.localdomain (188.171.88.92.rev.sfr.net.
 [92.88.171.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be3a33c1csm152422545e9.1.2025.12.24.07.15.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 24 Dec 2025 07:15:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Weiwei Li <liwei1518@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Anton Johansson <anjo@rev.ng>, David Hildenbrand <david@kernel.org>,
 qemu-riscv@nongnu.org, Steven Lee <steven_lee@aspeedtech.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Troy Lee <leetroy@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Zhao Liu <zhao1.liu@intel.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Alistair Francis <alistair.francis@wdc.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 9/9] configs/targets: Mark targets not using legacy
 ldst_phys() API
Date: Wed, 24 Dec 2025 16:13:50 +0100
Message-ID: <20251224151351.86733-10-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224151351.86733-1-philmd@linaro.org>
References: <20251224151351.86733-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

These targets were only using the legacy ldst_phys() API
via the virtio load/store helpers, which got cleaned up.

Mark them not using the legacy ldst_phys() API to avoid
further use, allowing to eventually remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 configs/targets/mips-softmmu.mak     | 1 +
 configs/targets/mips64-softmmu.mak   | 1 +
 configs/targets/mips64el-softmmu.mak | 1 +
 configs/targets/mipsel-softmmu.mak   | 1 +
 configs/targets/or1k-softmmu.mak     | 1 +
 configs/targets/riscv32-softmmu.mak  | 1 +
 configs/targets/riscv64-softmmu.mak  | 1 +
 configs/targets/sh4-softmmu.mak      | 1 +
 configs/targets/sh4eb-softmmu.mak    | 1 +
 configs/targets/sparc64-softmmu.mak  | 1 +
 configs/targets/xtensa-softmmu.mak   | 1 +
 configs/targets/xtensaeb-softmmu.mak | 1 +
 12 files changed, 12 insertions(+)

diff --git a/configs/targets/mips-softmmu.mak b/configs/targets/mips-softmmu.mak
index c9588066b8d..95397af9442 100644
--- a/configs/targets/mips-softmmu.mak
+++ b/configs/targets/mips-softmmu.mak
@@ -1,3 +1,4 @@
 TARGET_ARCH=mips
 TARGET_BIG_ENDIAN=y
 TARGET_LONG_BITS=32
+TARGET_NOT_USING_LEGACY_LDST_PHYS_API=y
diff --git a/configs/targets/mips64-softmmu.mak b/configs/targets/mips64-softmmu.mak
index 7202655fcac..f9cc41b9ed4 100644
--- a/configs/targets/mips64-softmmu.mak
+++ b/configs/targets/mips64-softmmu.mak
@@ -2,3 +2,4 @@ TARGET_ARCH=mips64
 TARGET_BASE_ARCH=mips
 TARGET_BIG_ENDIAN=y
 TARGET_LONG_BITS=64
+TARGET_NOT_USING_LEGACY_LDST_PHYS_API=y
diff --git a/configs/targets/mips64el-softmmu.mak b/configs/targets/mips64el-softmmu.mak
index 3ebeadb29ea..4e7dedc5f30 100644
--- a/configs/targets/mips64el-softmmu.mak
+++ b/configs/targets/mips64el-softmmu.mak
@@ -1,3 +1,4 @@
 TARGET_ARCH=mips64
 TARGET_BASE_ARCH=mips
 TARGET_LONG_BITS=64
+TARGET_NOT_USING_LEGACY_LDST_PHYS_API=y
diff --git a/configs/targets/mipsel-softmmu.mak b/configs/targets/mipsel-softmmu.mak
index 90e09bdc3e5..b0fba8a9d0a 100644
--- a/configs/targets/mipsel-softmmu.mak
+++ b/configs/targets/mipsel-softmmu.mak
@@ -1,2 +1,3 @@
 TARGET_ARCH=mips
 TARGET_LONG_BITS=32
+TARGET_NOT_USING_LEGACY_LDST_PHYS_API=y
diff --git a/configs/targets/or1k-softmmu.mak b/configs/targets/or1k-softmmu.mak
index 0e47d9878b0..89f81b75bf7 100644
--- a/configs/targets/or1k-softmmu.mak
+++ b/configs/targets/or1k-softmmu.mak
@@ -3,3 +3,4 @@ TARGET_BIG_ENDIAN=y
 # needed by boot.c and all boards
 TARGET_NEED_FDT=y
 TARGET_LONG_BITS=32
+TARGET_NOT_USING_LEGACY_LDST_PHYS_API=y
diff --git a/configs/targets/riscv32-softmmu.mak b/configs/targets/riscv32-softmmu.mak
index db55275b868..7476e596082 100644
--- a/configs/targets/riscv32-softmmu.mak
+++ b/configs/targets/riscv32-softmmu.mak
@@ -4,3 +4,4 @@ TARGET_XML_FILES= gdb-xml/riscv-32bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xm
 # needed by boot.c
 TARGET_NEED_FDT=y
 TARGET_LONG_BITS=32
+TARGET_NOT_USING_LEGACY_LDST_PHYS_API=y
diff --git a/configs/targets/riscv64-softmmu.mak b/configs/targets/riscv64-softmmu.mak
index 2bdd4a62cd2..f836f08c5b9 100644
--- a/configs/targets/riscv64-softmmu.mak
+++ b/configs/targets/riscv64-softmmu.mak
@@ -5,3 +5,4 @@ TARGET_XML_FILES= gdb-xml/riscv-64bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xm
 # needed by boot.c
 TARGET_NEED_FDT=y
 TARGET_LONG_BITS=64
+TARGET_NOT_USING_LEGACY_LDST_PHYS_API=y
diff --git a/configs/targets/sh4-softmmu.mak b/configs/targets/sh4-softmmu.mak
index 787d349b501..e0b51f8108d 100644
--- a/configs/targets/sh4-softmmu.mak
+++ b/configs/targets/sh4-softmmu.mak
@@ -1,2 +1,3 @@
 TARGET_ARCH=sh4
 TARGET_LONG_BITS=32
+TARGET_NOT_USING_LEGACY_LDST_PHYS_API=y
diff --git a/configs/targets/sh4eb-softmmu.mak b/configs/targets/sh4eb-softmmu.mak
index cdea2c61c58..7850dac8191 100644
--- a/configs/targets/sh4eb-softmmu.mak
+++ b/configs/targets/sh4eb-softmmu.mak
@@ -1,3 +1,4 @@
 TARGET_ARCH=sh4
 TARGET_BIG_ENDIAN=y
 TARGET_LONG_BITS=32
+TARGET_NOT_USING_LEGACY_LDST_PHYS_API=y
diff --git a/configs/targets/sparc64-softmmu.mak b/configs/targets/sparc64-softmmu.mak
index d9d51d21e59..8ee6d057682 100644
--- a/configs/targets/sparc64-softmmu.mak
+++ b/configs/targets/sparc64-softmmu.mak
@@ -3,3 +3,4 @@ TARGET_BASE_ARCH=sparc
 TARGET_BIG_ENDIAN=y
 TARGET_XML_FILES=gdb-xml/sparc64-core.xml
 TARGET_LONG_BITS=64
+TARGET_NOT_USING_LEGACY_LDST_PHYS_API=y
diff --git a/configs/targets/xtensa-softmmu.mak b/configs/targets/xtensa-softmmu.mak
index 2a9797338a6..6aad751e2ba 100644
--- a/configs/targets/xtensa-softmmu.mak
+++ b/configs/targets/xtensa-softmmu.mak
@@ -1,2 +1,3 @@
 TARGET_ARCH=xtensa
 TARGET_LONG_BITS=32
+TARGET_NOT_USING_LEGACY_LDST_PHYS_API=y
diff --git a/configs/targets/xtensaeb-softmmu.mak b/configs/targets/xtensaeb-softmmu.mak
index 5204729af8b..537407e11ae 100644
--- a/configs/targets/xtensaeb-softmmu.mak
+++ b/configs/targets/xtensaeb-softmmu.mak
@@ -1,3 +1,4 @@
 TARGET_ARCH=xtensa
 TARGET_BIG_ENDIAN=y
 TARGET_LONG_BITS=32
+TARGET_NOT_USING_LEGACY_LDST_PHYS_API=y
-- 
2.52.0


