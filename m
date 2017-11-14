Received: by 10.223.150.237 with SMTP id u100csp3539348wrb;
        Tue, 14 Nov 2017 04:20:46 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYo4om8xN99tnDPNq7VY62unevaXZOMxtsTUk6J+KgSDPMrgRbA1PL8sITOFqeOMefwreih
X-Received: by 10.129.197.72 with SMTP id o8mr8332575ywj.164.1510662046786;
        Tue, 14 Nov 2017 04:20:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510662046; cv=none;
        d=google.com; s=arc-20160816;
        b=V81hZBoWDe9GU3c0Z7fWj0f9CYywqqKC+OviVYlyBAG8yTZn1XnE59vr7z+Fecr2fY
         eLzRYAzgcH6+exc+jITO9oPf+XXLanVhSdwY9ICe44qhChpybbkJWXwTiuaISfgRuMi+
         DPxtAHBHxWMe1zkU+DABUdEA+FrMR85w4ygTSRkvB96DHTeGDdQxU1bXF1VY8uwJrB0K
         ipeO2W4iTP5TEiyKaORcTT0RgMtUXsVJUcoGYseK0jOyHANH8la2cyj+x61GXGcraoV9
         rykiH1y+gQ6wYZUwcVCLQpWAO9wZYPzcpus/U4Se3TVaf2iZQO1fEVwLc2GBKT0y70/Q
         JtOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=P9fuo2SjsH+Rf5FFCxFFGIb1idNLCikX3ZIdoG3Wg8k=;
        b=ivj2OjdPlr0Xaphqwl08bEPWyDPMFqBYqAw46kE7WV2/XxC0V+IjI+8Sk4DqkTxHVy
         oHnCk6xMLM7XwM5FfatpA9kEYgd9H3vdckd9OQlG4Pz1Rlycw2/OFapCUpakewSKNxt1
         rf76WSeITynLjETeN7Wv7eRxm2bo0JniRdwljbh4EmjDWKtBgUh+A5tEa8v4HnPyYT3l
         pHH8b5IyhEQJkEhUg+BWq2Er0Sj7kK/QrRsgyEf54o7eOJ3mUuHA9HCQ5mbfivqqtxNs
         z++HY2iMKxczk9zCBaUyBX3u4ar8D/b8m2AWnk5y5vL+Ol76+vSiMzUnjPBOaaMTfdBg
         7Rcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HWzKlX/B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s63si4091842yba.592.2017.11.14.04.20.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Nov 2017 04:20:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HWzKlX/B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59168 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eEaCs-0001oi-6F
	for alex.bennee@linaro.org; Tue, 14 Nov 2017 07:20:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54336)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1eEaCg-0001oS-KL
	for qemu-arm@nongnu.org; Tue, 14 Nov 2017 07:20:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1eEaCc-0007RN-7H
	for qemu-arm@nongnu.org; Tue, 14 Nov 2017 07:20:34 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:52716)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1eEaCb-0007Qt-V3; Tue, 14 Nov 2017 07:20:30 -0500
Received: by mail-pg0-x241.google.com with SMTP id j16so9701294pgn.9;
	Tue, 14 Nov 2017 04:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=P9fuo2SjsH+Rf5FFCxFFGIb1idNLCikX3ZIdoG3Wg8k=;
	b=HWzKlX/BsJj+99Q1EbbOgGCI1HvWra0rBslNbuzwD5aHxrrOuUfJFbRiDeoR2n+HW9
	gLUxtaa9nGtc+gw7tNUYk/fmS7T/yinuSEUs+eOr7yFrO2gB6mfxIa6HtNrWxS6G7BJE
	JdxDQ9h4NTl6w7Ohldqh/n4DZWlsGiPjUhFNbvK501l/+HGnGwBF1Ogkm0fMiHqUPVEs
	J2kKHI/GjKwPxkWfyBZ7EzvWk8RA796iudQcngbv13wt5yUZFUF3tumYt0ZQ4m/JtpwF
	iBcOWk4ysy39gAYbSWF5aIU/gEOg0RtSJ/pqWPMECdgF5BYhP25nXGWaxGNTSao29ESW
	t7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=P9fuo2SjsH+Rf5FFCxFFGIb1idNLCikX3ZIdoG3Wg8k=;
	b=em1Jc9erm1J1HeSvjHwC78fIm7aotBBxt/dZtT/VV4ftz8uRpGAYfFBUq1vTjAaMo3
	45PNyp2FFt9D8lMb6YKSY0OCm54G4VL6LnLfkyAlZqz+uvXMfpn1jKj5eLnsVROWJ3Ly
	p8FjEFzQGU3iOWYQM8VDGbwOEE3ffrq00114OfDtNxCCDJUnSIofWrEWJN5yzxqmCgxT
	UsZ3BztTGez7+q9JynyAZngZkgBD9HNQMAG4gexQB29xOtMN/cuNYhZOOrp7/OmAakuz
	oiz3ffzRUkI2BchnEP0flAhMIVsp9U7ByOQ+DCiowbkErkzqrGxPeAEXwPpMOY/giqvl
	WyZA==
X-Gm-Message-State: AJaThX5i2Q2xaT8JDPZgj57zRx6jrSd8XUjtvpGhTaC7r9Wg2HCvchNh
	+cgsXsTfOrBwLCcVLoi0FHA=
X-Received: by 10.99.47.6 with SMTP id v6mr11919404pgv.452.1510662028848;
	Tue, 14 Nov 2017 04:20:28 -0800 (PST)
Received: from aurora.jms.id.au ([45.124.203.19])
	by smtp.gmail.com with ESMTPSA id
	125sm36335592pff.14.2017.11.14.04.20.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 14 Nov 2017 04:20:27 -0800 (PST)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Tue, 14 Nov 2017 22:50:19 +1030
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Nov 2017 22:50:18 +1030
Message-Id: <20171114122018.12204-1-joel@jms.id.au>
X-Mailer: git-send-email 2.14.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [PATCH v3] hw/arm/aspeed: Unlock SCU when running kernel
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C1tm2dA3awPB

The ASPEED hardware contains a lock register for the SCU that disables
any writes to the SCU when it is locked. The machine comes up with the
lock enabled, but on all known hardware u-boot will unlock it and leave
it unlocked when loading the kernel.

This means the kernel expects the SCU to be unlocked. When booting from
an emulated ROM the normal u-boot unlock path is executed. Things don't
go well when booting using the -kernel command line, as u-boot does not
run first.

Change behaviour so that when a kernel is passed to the machine, set the
reset value of the SCU to be unlocked.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v3:
 - remove unused member from AspeedBoardConfig
v2:
 - use the correct value for the key
 - rename it ASPEED_SCU_PROT_KEY
---
 hw/arm/aspeed.c              | 9 +++++++++
 hw/arm/aspeed_soc.c          | 2 ++
 hw/misc/aspeed_scu.c         | 5 +++--
 include/hw/misc/aspeed_scu.h | 3 +++
 4 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index ab895ad490af..7088c907bd23 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -186,6 +186,15 @@ static void aspeed_board_init(MachineState *machine,
                             &error_abort);
     object_property_set_int(OBJECT(&bmc->soc), cfg->num_cs, "num-cs",
                             &error_abort);
+    if (machine->kernel_filename) {
+        /*
+         * When booting with a -kernel command line there is no u-boot
+         * that runs to unlock the SCU. In this case set the default to
+         * be unlocked as the kernel expects
+         */
+        object_property_set_int(OBJECT(&bmc->soc), ASPEED_SCU_PROT_KEY,
+                                "hw-prot-key", &error_abort);
+    }
     object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
                              &error_abort);
 
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 5aa3d2ddd9cd..c83b7e207b86 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -154,6 +154,8 @@ static void aspeed_soc_init(Object *obj)
                               "hw-strap1", &error_abort);
     object_property_add_alias(obj, "hw-strap2", OBJECT(&s->scu),
                               "hw-strap2", &error_abort);
+    object_property_add_alias(obj, "hw-prot-key", OBJECT(&s->scu),
+                              "hw-prot-key", &error_abort);
 
     object_initialize(&s->fmc, sizeof(s->fmc), sc->info->fmc_typename);
     object_property_add_child(obj, "fmc", OBJECT(&s->fmc), NULL);
diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 95022d3607ad..74537ce9755d 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -85,7 +85,6 @@
 #define BMC_REV              TO_REG(0x19C)
 #define BMC_DEV_ID           TO_REG(0x1A4)
 
-#define PROT_KEY_UNLOCK 0x1688A8A8
 #define SCU_IO_REGION_SIZE 0x1000
 
 static const uint32_t ast2400_a0_resets[ASPEED_SCU_NR_REGS] = {
@@ -192,7 +191,7 @@ static void aspeed_scu_write(void *opaque, hwaddr offset, uint64_t data,
     }
 
     if (reg > PROT_KEY && reg < CPU2_BASE_SEG1 &&
-            s->regs[PROT_KEY] != PROT_KEY_UNLOCK) {
+            s->regs[PROT_KEY] != ASPEED_SCU_PROT_KEY) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: SCU is locked!\n", __func__);
         return;
     }
@@ -246,6 +245,7 @@ static void aspeed_scu_reset(DeviceState *dev)
     s->regs[SILICON_REV] = s->silicon_rev;
     s->regs[HW_STRAP1] = s->hw_strap1;
     s->regs[HW_STRAP2] = s->hw_strap2;
+    s->regs[PROT_KEY] = s->hw_prot_key;
 }
 
 static uint32_t aspeed_silicon_revs[] = {
@@ -299,6 +299,7 @@ static Property aspeed_scu_properties[] = {
     DEFINE_PROP_UINT32("silicon-rev", AspeedSCUState, silicon_rev, 0),
     DEFINE_PROP_UINT32("hw-strap1", AspeedSCUState, hw_strap1, 0),
     DEFINE_PROP_UINT32("hw-strap2", AspeedSCUState, hw_strap2, 0),
+    DEFINE_PROP_UINT32("hw-prot-key", AspeedSCUState, hw_prot_key, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
index bd4ac013f997..d70cc0aeca61 100644
--- a/include/hw/misc/aspeed_scu.h
+++ b/include/hw/misc/aspeed_scu.h
@@ -29,6 +29,7 @@ typedef struct AspeedSCUState {
     uint32_t silicon_rev;
     uint32_t hw_strap1;
     uint32_t hw_strap2;
+    uint32_t hw_prot_key;
 } AspeedSCUState;
 
 #define AST2400_A0_SILICON_REV   0x02000303U
@@ -38,6 +39,8 @@ typedef struct AspeedSCUState {
 
 extern bool is_supported_silicon_rev(uint32_t silicon_rev);
 
+#define ASPEED_SCU_PROT_KEY      0x1688A8A8
+
 /*
  * Extracted from Aspeed SDK v00.03.21. Fixes and extra definitions
  * were added.
-- 
2.14.1

