Received: by 10.223.197.9 with SMTP id q9csp6918955wrf;
        Thu, 19 Oct 2017 08:13:43 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+TAIA9uPr1pRltVqJV0tkPbV+6qpkMSxr8FnREBxnW1YCc6y0ETR+4N/j9g8qkSzUnL0y8f
X-Received: by 10.200.4.169 with SMTP id s41mr2614188qtg.212.1508426022963;
        Thu, 19 Oct 2017 08:13:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508426022; cv=none;
        d=google.com; s=arc-20160816;
        b=cMgEOnWjR50s22h1buQ24YDmQItsTBKUB06SIuWyZGEVPYsv85NHyc437RNsy78ZS1
         A3Rx6Uz2CT8kUhlZA+dH6PAdIyg0hSijK+TuWDvN2c+a8QBYyY22o6STFBrxY22uRJEa
         Q9a3FflpH/rQDUyuQ1sCzLKyqhl8x64vLM7G+GCut6FUiLU1/f7YZvy403+gte01TkqX
         8PjNlWa5OuUi6iX2/BFhINMeYNRDOqAux6JGfpgyJvWNitb0+z8gE+jQihG2ABPJ3da9
         EJ3DU2DFDokcTU79jdzRJi/6q7SB9jZX+zG3YHs0G/vDyav6Pn8bvCpZmJx4x1vya+b4
         ynuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=w9ygHE4cSCl1612UtZXSrX4LkHkDvsPHf1fvbNXEqp4=;
        b=P1fjLjivZ3W9Fvc4C9kuLKzpF1+chZNFGtOBaePbgIAWMm1vxkAptzOg7Jj2tTTs7a
         FnWPxJsmjFQ471i3lZ2x3KcQV0z1WWHpxHtUVeviQ0mSnGXUVHRBPfqrJ/egD7C+eKAV
         L9RyrVbSq5+uR7rrOt7NsgUI2AdRRjLrxXyxKNMmyVJEqPCp5oj4acOLY+NIH2WqTBR8
         1goxLQ/4nWGEx/GiQylku/9IZEE/D/MWgwYWTLB40kil81v2F0cHYe8bRaNHrjZF9kUx
         aAvwm8rd3bEleCLWkWo7O0+JiHPJvEATGDNx1wdKVEUMhTgguqvvJEINpmr1xL1EVWYN
         y4pw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s6si1265942qkc.452.2017.10.19.08.13.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 08:13:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49631 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5CVw-0001Fu-Jp
	for alex.bennee@linaro.org; Thu, 19 Oct 2017 11:13:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35151)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e5CVX-00019l-En
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 11:13:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e5CVR-00018V-Eg
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 11:13:15 -0400
Received: from 2.mo5.mail-out.ovh.net ([178.33.109.111]:42511)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1e5CVR-00017y-7F
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 11:13:09 -0400
Received: from player786.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 01377146137
	for <qemu-arm@nongnu.org>; Thu, 19 Oct 2017 17:13:07 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
	[90.76.52.173]) (Authenticated sender: clg@kaod.org)
	by player786.ha.ovh.net (Postfix) with ESMTPSA id C026F80095;
	Thu, 19 Oct 2017 17:13:00 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Oct 2017 17:12:42 +0200
Message-Id: <20171019151249.13663-2-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171019151249.13663-1-clg@kaod.org>
References: <20171019151249.13663-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 13907960074966502161
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrudekgdekjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.33.109.111
Subject: [Qemu-arm] [PATCH v5 1/8] aspeed: use a ROM memory region to catch
 invalid writes
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mHl0PUAloAkH

Some legacy firmwares access unimplemented addresses on the Aspeed SoC
(old U-Boot code using variables in the bss when it shouldn't do).
Let's use a ROM memory region to catch the invalid writes and support
new boards without using the 'ignore_memory_transaction_failures'
flag.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---

 Changes since v4 :

 - use a ROM memory region

=20
 hw/arm/aspeed.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index ab895ad490af..d88a8b5120b6 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -166,6 +166,23 @@ static void aspeed_board_init_flashes(AspeedSMCState=
 *s, const char *flashtype,
     }
 }
=20
+/*
+ * This is to track invalid writes done in the ROM by some legacy
+ * firmwares
+ */
+static void boot_rom_write(void *opaque, hwaddr offset, uint64_t value,
+                           unsigned size)
+{
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "%s: 0x%" HWADDR_PRIx " <- 0x%" PRIx64 " [%u]\n",
+                  __func__, offset, value, size);
+}
+
+static const MemoryRegionOps boot_rom_ops =3D {
+    .write =3D boot_rom_write,
+    .endianness =3D DEVICE_NATIVE_ENDIAN,
+};
+
 static void aspeed_board_init(MachineState *machine,
                               const AspeedBoardConfig *cfg)
 {
@@ -216,8 +233,9 @@ static void aspeed_board_init(MachineState *machine,
          * SoC and 128MB for the AST2500 SoC, which is twice as big as
          * needed by the flash modules of the Aspeed machines.
          */
-        memory_region_init_rom_nomigrate(boot_rom, OBJECT(bmc), "aspeed.=
boot_rom",
-                               fl->size, &error_abort);
+        memory_region_init_rom_device(boot_rom, OBJECT(bmc), &boot_rom_o=
ps,
+                                      NULL, "aspeed.boot_rom", fl->size,
+                                      &error_abort);
         memory_region_add_subregion(get_system_memory(), FIRMWARE_ADDR,
                                     boot_rom);
         write_boot_rom(drive0, FIRMWARE_ADDR, fl->size, &error_abort);
--=20
2.13.6

