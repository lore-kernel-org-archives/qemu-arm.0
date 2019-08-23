Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp968267wrs;
        Fri, 23 Aug 2019 12:24:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy7Z6jnC+jbwnIDzB3cbCp/UqiUk7kjDG1+Yihc94TzsOvDLoM8Id+/2AxDYmIii+i6oU3p
X-Received: by 2002:aa7:c64c:: with SMTP id z12mr2846519edr.146.1566588265830;
        Fri, 23 Aug 2019 12:24:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566588265; cv=none;
        d=google.com; s=arc-20160816;
        b=rVbs9TdK+KxyK7Bgc1SZ5ArsR7joObzdLkaxEJnxSh4b2aWeAii46ahaH0SIm658nD
         CDTNyO2SOtM7qK1agRbaOC58QSU6TEEP+vo72/Eqee0DWKmhk8Z/hottMJ4h3xmDeHTN
         q1ckLsO7DOFNzDev+6u2+YCPwEzO5vRKi1jUhFSoreym4jk2uw5Y3Nd1IvHsATnqwyEH
         FuGNUt6pIUrdsxIIQ5g92QkDHTc1Kmkl4DdqTLxFYJ2sCoWfgNhOPmRH3ERjvWEtcIdh
         wPetpDdSd1M6nb1hJ9+ODk0yBhhCgPESx8CJbBiIyHPg4Pn/X7mqte+yLib/SRp5KDef
         RUXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=fqKVgCrrl1coUoGBn+QQbDgKTh/OkRVk7HtY9chPadk=;
        b=QbUPG7YNbLmC4tAJgBc+fEZXit59tYSWU+BBnSpBS/JrvfUouptnuBYsurLi1nUrVZ
         8VhxcsVezYMSfELrmSyN1XZyl1ttEjip27L0c6+cSwq7AGBIxR+MB9CnC8JOqvbXvS1N
         +7PN7+BpsYQJFgS+0uj8RfHzuHzOwf8Z2kR2xTyEueKB5bn1DQbuOHwYkd4ERm8+hoUV
         Vq7kDVaLJLWcOKcSUPbYARcNAKt5OSZ1vLNduWI7mgmIBR1W5omX5iSRqze7dzEeMepn
         7j8+0xVkZPPgZIAyPGGFnCq/WfD5swez97w2LvtlTVWLkAQ6rU0b3YKqJAmXzuU81RIA
         rATg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s3si2449258edm.335.2019.08.23.12.24.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 12:24:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:33356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1FAe-0000vj-07
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 15:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43317)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1i1EhX-0003tY-3o
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 14:54:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1i1EhV-0003UR-Eq
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 14:54:19 -0400
Received: from nsstlmta01p.bpe.bigpond.com ([203.38.21.1]:50842)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1i1EhR-0003Og-6N; Fri, 23 Aug 2019 14:54:14 -0400
Received: from smtp.telstra.com ([10.10.24.4])
 by nsstlfep01p-svc.bpe.nexus.telstra.com.au with ESMTP id
 <20190823185408.KAEC21386.nsstlfep01p-svc.bpe.nexus.telstra.com.au@smtp.telstra.com>;
 Sat, 24 Aug 2019 04:54:08 +1000
X-RG-Spam: Unknown
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeduvddrudegkedguddvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfupfevtfgpvffgnffuvffttedpqfgfvfenuceurghilhhouhhtmecugedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvohhnhicupfhguhihvghnuceothhonhihrdhnghhuhigvnhessghtrdgtohhmqeenucfkphepheekrddujeefrdelkedrieeknecurfgrrhgrmhephhgvlhhopegusgiirdhtvghlshhtrhgrrdgtohhmrdgruhdpihhnvghtpeehkedrudejfedrleekrdeikedpmhgrihhlfhhrohhmpeeothhonhihrdhnghhuhigvnhessghtrdgtohhmqedprhgtphhtthhopeeorghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgvqedprhgtphhtthhopeeorghnughrvgifsegrjhdrihgurdgruheqpdhrtghpthhtohepoegrthgrrhegqhgvmhhusehgmhgrihhlrdgtohhmqedprhgtphhtthhopeeotghhohhuthgvrghusegruggrtghorhgvrdgtohhmqedprhgtphhtthhopeeotghlgheskhgrohgurdhorhhgqedprhgtphhtthhopeeovggughgrrhdrihhglhgvshhirghssehgmhgrihhlrdgtohhmqedprhgtphhtthhopeeofhhrvgguvghrihgtrdhkohhnrhgrugesrggurggtohhrvgdrtghomheqpdhrtghpthhtohepoehjohgvlhesjhhmshdrihgurdgruheq
 pdhrtghpthhtohepoehmihgthhgrvghlseifrghllhgvrdgttgeqpdhrtghpthhtohepoehmshhtsehrvgguhhgrthdrtghomheqpdhrtghpthhtohepoehpsghonhiiihhnihesrhgvughhrghtrdgtohhmqedprhgtphhtthhopeeophgvthgvrhdrtghhuhgssgesnhhitghtrgdrtghomhdrrghuqedprhgtphhtthhopeeophgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgqedprhgtphhtthhopeeoqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgheqpdhrtghpthhtohepoehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgqedprhgtphhtthhopeeoshhunhguvggvphdrlhhkmhhlsehgmhgrihhlrdgtohhmqedprhgtphhtthhopeeothhonhihrdhnghhuhigvnhessghtrdgtohhmqeenucevlhhushhtvghrufhiiigvpedutd
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-RG-VS-CLASS: clean
X-Authentication-Info: Submitted using ID tony.nguyen.git@bigpond.com
Received: from dbz.telstra.com.au (58.173.98.68) by smtp.telstra.com (5.8.335)
 (authenticated as tony.nguyen.git@bigpond.com)
 id 5D3692920C8C21E3; Sat, 24 Aug 2019 04:54:07 +1000
From: Tony Nguyen <tony.nguyen@bt.com>
To: qemu-devel@nongnu.org
Date: Sat, 24 Aug 2019 04:56:37 +1000
Message-Id: <6c4515574804b699e3a35fe3590453178fef039b.1566467963.git.tony.nguyen@bt.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1566467963.git.tony.nguyen@bt.com>
References: <cover.1566467963.git.tony.nguyen@bt.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 203.38.21.1
Subject: [Qemu-arm] [Qemu-devel] [RFC PATCH 16/17] hw/timer: Declare device
 little or big endian
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Tony Nguyen <tony.nguyen@bt.com>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
 Michael Walle <michael@walle.cc>, Fabien Chouteau <chouteau@adacore.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E0snyVD3hJQO

For each device declared with DEVICE_NATIVE_ENDIAN, find the set of
targets from the set of target/hw/*/device.o.

If the set of targets are all little or all big endian, re-declare
the device endianness as DEVICE_LITTLE_ENDIAN or DEVICE_BIG_ENDIAN
respectively.

This *naive* deduction may result in genuinely native endian devices
being incorrectly declared as little or big endian, but should not
introduce regressions for current targets.

These devices should be re-declared as DEVICE_NATIVE_ENDIAN if 1) it
has a new target with an opposite endian or 2) someone informed knows
better =)

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 hw/timer/a9gtimer.c         | 4 ++--
 hw/timer/arm_mptimer.c      | 4 ++--
 hw/timer/arm_timer.c        | 4 ++--
 hw/timer/armv7m_systick.c   | 2 +-
 hw/timer/aspeed_rtc.c       | 2 +-
 hw/timer/cadence_ttc.c      | 2 +-
 hw/timer/grlib_gptimer.c    | 2 +-
 hw/timer/hpet.c             | 2 +-
 hw/timer/imx_epit.c         | 2 +-
 hw/timer/imx_gpt.c          | 2 +-
 hw/timer/lm32_timer.c       | 2 +-
 hw/timer/milkymist-sysctl.c | 2 +-
 hw/timer/mss-timer.c        | 2 +-
 hw/timer/pl031.c            | 2 +-
 hw/timer/stm32f2xx_timer.c  | 2 +-
 hw/timer/sun4v-rtc.c        | 2 +-
 16 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/hw/timer/a9gtimer.c b/hw/timer/a9gtimer.c
index 75f1867174..ffdc78f383 100644
--- a/hw/timer/a9gtimer.c
+++ b/hw/timer/a9gtimer.c
@@ -258,7 +258,7 @@ static const MemoryRegionOps a9_gtimer_this_ops = {
         .min_access_size = 4,
         .max_access_size = 4,
     },
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static const MemoryRegionOps a9_gtimer_ops = {
@@ -268,7 +268,7 @@ static const MemoryRegionOps a9_gtimer_ops = {
         .min_access_size = 4,
         .max_access_size = 4,
     },
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static void a9_gtimer_reset(DeviceState *dev)
diff --git a/hw/timer/arm_mptimer.c b/hw/timer/arm_mptimer.c
index 983e61847e..bf6295add1 100644
--- a/hw/timer/arm_mptimer.c
+++ b/hw/timer/arm_mptimer.c
@@ -194,7 +194,7 @@ static const MemoryRegionOps arm_thistimer_ops = {
         .min_access_size = 4,
         .max_access_size = 4,
     },
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static const MemoryRegionOps timerblock_ops = {
@@ -204,7 +204,7 @@ static const MemoryRegionOps timerblock_ops = {
         .min_access_size = 4,
         .max_access_size = 4,
     },
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static void timerblock_reset(TimerBlock *tb)
diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index c2e6211188..f95c897d05 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -267,7 +267,7 @@ static void sp804_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps sp804_ops = {
     .read = sp804_read,
     .write = sp804_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static const VMStateDescription vmstate_sp804 = {
@@ -348,7 +348,7 @@ static void icp_pit_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps icp_pit_ops = {
     .read = icp_pit_read,
     .write = icp_pit_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static void icp_pit_init(Object *obj)
diff --git a/hw/timer/armv7m_systick.c b/hw/timer/armv7m_systick.c
index 85d122dbcb..b8003e2962 100644
--- a/hw/timer/armv7m_systick.c
+++ b/hw/timer/armv7m_systick.c
@@ -193,7 +193,7 @@ static MemTxResult systick_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps systick_ops = {
     .read_with_attrs = systick_read,
     .write_with_attrs = systick_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
     .valid.min_access_size = 4,
     .valid.max_access_size = 4,
 };
diff --git a/hw/timer/aspeed_rtc.c b/hw/timer/aspeed_rtc.c
index 5313017353..e3bd196dc0 100644
--- a/hw/timer/aspeed_rtc.c
+++ b/hw/timer/aspeed_rtc.c
@@ -131,7 +131,7 @@ static void aspeed_rtc_reset(DeviceState *d)
 static const MemoryRegionOps aspeed_rtc_ops = {
     .read = aspeed_rtc_read,
     .write = aspeed_rtc_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static const VMStateDescription vmstate_aspeed_rtc = {
diff --git a/hw/timer/cadence_ttc.c b/hw/timer/cadence_ttc.c
index 5e3128c1e3..6155d0055f 100644
--- a/hw/timer/cadence_ttc.c
+++ b/hw/timer/cadence_ttc.c
@@ -391,7 +391,7 @@ static void cadence_ttc_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps cadence_ttc_ops = {
     .read = cadence_ttc_read,
     .write = cadence_ttc_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static void cadence_timer_reset(CadenceTimerState *s)
diff --git a/hw/timer/grlib_gptimer.c b/hw/timer/grlib_gptimer.c
index 32dbf870d4..df84735197 100644
--- a/hw/timer/grlib_gptimer.c
+++ b/hw/timer/grlib_gptimer.c
@@ -315,7 +315,7 @@ static void grlib_gptimer_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps grlib_gptimer_ops = {
     .read = grlib_gptimer_read,
     .write = grlib_gptimer_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_BIG_ENDIAN,
     .valid = {
         .min_access_size = 4,
         .max_access_size = 4,
diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index 1ddae4e7d7..380abeb709 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -676,7 +676,7 @@ static const MemoryRegionOps hpet_ram_ops = {
         .min_access_size = 4,
         .max_access_size = 4,
     },
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static void hpet_reset(DeviceState *d)
diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index f54e059910..7e605d29c7 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -284,7 +284,7 @@ static void imx_epit_cmp(void *opaque)
 static const MemoryRegionOps imx_epit_ops = {
     .read = imx_epit_read,
     .write = imx_epit_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static const VMStateDescription vmstate_imx_timer_epit = {
diff --git a/hw/timer/imx_gpt.c b/hw/timer/imx_gpt.c
index 49a441f451..27bacdb758 100644
--- a/hw/timer/imx_gpt.c
+++ b/hw/timer/imx_gpt.c
@@ -476,7 +476,7 @@ static void imx_gpt_timeout(void *opaque)
 static const MemoryRegionOps imx_gpt_ops = {
     .read = imx_gpt_read,
     .write = imx_gpt_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 
diff --git a/hw/timer/lm32_timer.c b/hw/timer/lm32_timer.c
index ac3edaff4f..4c0d3275e7 100644
--- a/hw/timer/lm32_timer.c
+++ b/hw/timer/lm32_timer.c
@@ -146,7 +146,7 @@ static void timer_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps timer_ops = {
     .read = timer_read,
     .write = timer_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_BIG_ENDIAN,
     .valid = {
         .min_access_size = 4,
         .max_access_size = 4,
diff --git a/hw/timer/milkymist-sysctl.c b/hw/timer/milkymist-sysctl.c
index 958350767a..cb117f944e 100644
--- a/hw/timer/milkymist-sysctl.c
+++ b/hw/timer/milkymist-sysctl.c
@@ -223,7 +223,7 @@ static const MemoryRegionOps sysctl_mmio_ops = {
         .min_access_size = 4,
         .max_access_size = 4,
     },
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_BIG_ENDIAN,
 };
 
 static void timer0_hit(void *opaque)
diff --git a/hw/timer/mss-timer.c b/hw/timer/mss-timer.c
index 45f1cf42f9..b9edb39837 100644
--- a/hw/timer/mss-timer.c
+++ b/hw/timer/mss-timer.c
@@ -200,7 +200,7 @@ timer_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps timer_ops = {
     .read = timer_read,
     .write = timer_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
     .valid = {
         .min_access_size = 1,
         .max_access_size = 4
diff --git a/hw/timer/pl031.c b/hw/timer/pl031.c
index 2b3e261006..7ac2a0ca37 100644
--- a/hw/timer/pl031.c
+++ b/hw/timer/pl031.c
@@ -178,7 +178,7 @@ static void pl031_write(void * opaque, hwaddr offset,
 static const MemoryRegionOps pl031_ops = {
     .read = pl031_read,
     .write = pl031_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static void pl031_init(Object *obj)
diff --git a/hw/timer/stm32f2xx_timer.c b/hw/timer/stm32f2xx_timer.c
index edc557a4b9..88ae286b14 100644
--- a/hw/timer/stm32f2xx_timer.c
+++ b/hw/timer/stm32f2xx_timer.c
@@ -268,7 +268,7 @@ static void stm32f2xx_timer_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps stm32f2xx_timer_ops = {
     .read = stm32f2xx_timer_read,
     .write = stm32f2xx_timer_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static const VMStateDescription vmstate_stm32f2xx_timer = {
diff --git a/hw/timer/sun4v-rtc.c b/hw/timer/sun4v-rtc.c
index 54272a822f..0e831c91b1 100644
--- a/hw/timer/sun4v-rtc.c
+++ b/hw/timer/sun4v-rtc.c
@@ -47,7 +47,7 @@ static void sun4v_rtc_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps sun4v_rtc_ops = {
     .read = sun4v_rtc_read,
     .write = sun4v_rtc_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_BIG_ENDIAN,
 };
 
 void sun4v_rtc_init(hwaddr addr)
-- 
2.23.0

