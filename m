Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3916573wru;
        Tue, 7 Aug 2018 00:58:58 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeV3qhKn3/VwsUIdUGFQfZObxk61WH9NPgW8TbDy/XJme6kYGD2ijPZgshw85hZWMTW9AoS
X-Received: by 2002:ac8:2d3a:: with SMTP id n55-v6mr17628260qta.220.1533628738256;
        Tue, 07 Aug 2018 00:58:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533628738; cv=none;
        d=google.com; s=arc-20160816;
        b=D3NfIP45PFvtui89L1YZzFu9ic0colA5L8gnk/uxDfwldwzj3GTPIgZ+8F2gwOHXbZ
         zEn7ViIHO8UUEnyjPzkVWSwcTCNl6nwRlyt83qKYWLPsQgbnNrfenzhLaRuH8YN8gfwD
         xInXsbA4mfqjizOSE1JNqkNsFQeatBxLOXxH5dm2y5+nHS8/ZT30FnsWUG4rUW+mjzTK
         qZ5maBhKz/CoE0yHOQD0NAkUlGZmseKJFK5/QyYvHl3G4/K5Cfegp/ETapWtSJHv5pA3
         x9Smm++XXtfdAVqqysNw1sYgms5lj5rklYCF+vatNp9i21IPHoGcrl98Z2uZSNuHiDnT
         l0Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=SBBr+2QFo4lDT8xlNJTzO+Id2utX2pJW4S/v1I9pHbU=;
        b=K9mgkdRRiQ/AsTdWtzK5mzCHWWBezSIqHX/EAfOY9RPtde1ABxWRnu66+2JJQ/FVWH
         rWjX891gmMnd5dPaNjWc0JA+ATmAbrNTLG1ZE2DQjGl+Czopt7Sg8BJWvRnFayomqFEt
         /cp2QxxcjWoV9f+4SIACCo3sLdHQN68t6Lw1ak7egpTpsebY5mSHqvM8I7ZUZ4DYS6Qt
         qPQ3RPhCswkrYOkLzkY44k0Ruln4m560Il8iX4Hih65YxLV5iFq5QxOx8oYzXsjoKXVB
         aQqngmoCtrQVawkVXVmvnTZ2xqUIBxG+ml3NeKSOLzynx+CKA/1kCSCzD2ZbIeYgSnqC
         UXjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=THNI6DW+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m38-v6si666721qtb.84.2018.08.07.00.58.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Aug 2018 00:58:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=THNI6DW+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37803 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fmwtN-0002oH-N3
	for alex.bennee@linaro.org; Tue, 07 Aug 2018 03:58:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60745)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fmwt3-0002m7-2X
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 03:58:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fmwt1-0005ad-B0
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 03:58:37 -0400
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:37619)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fmwt1-0005aC-50; Tue, 07 Aug 2018 03:58:35 -0400
Received: by mail-pl0-x243.google.com with SMTP id d5-v6so6783996pll.4;
	Tue, 07 Aug 2018 00:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SBBr+2QFo4lDT8xlNJTzO+Id2utX2pJW4S/v1I9pHbU=;
	b=THNI6DW+E2zggu0rxmhQ5+KS61Aoyvujj7lkMguUKtDQTc+Y/nki92f4U4d5rp558U
	qqVysxUqoQv72z4k2KsVcJ2v8LWwy+CP/UEssn7GwxiSpvHqx775TZWDBWf0FWBz2EKC
	KqRodvSCwhCNlP0hzWXfZgaMEwVzwcdHWQAZtHXwUASJtY4Angxt5929n1uXmh+DNfxT
	B80FtZqDkHY/UMg71JWkNq5X65rkyE7jSmwHBZE4L2oB6WAJvU7C82EyCwOuZKPhCw2C
	ZTF08nICFAauQVGLXfvtFLzSSN6tBc+n5ud7mB4nGs+QwrMoK0CHERCzrfn0tDDqrbx9
	Xvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=SBBr+2QFo4lDT8xlNJTzO+Id2utX2pJW4S/v1I9pHbU=;
	b=Uf1heWzT6P5rux13DWVbXer+VNx6hSCDg8urf+HFJCZJGFLqX9FvmPy6mLOFZH+J36
	Q0ifq3y+kqKj3+yTYUEYxdlYPsw40dY48Sl36HXA0rHs0oXX4OW8QxooBdombrr+b8GZ
	3RrXokBN9Vuo0pjqrJpX5tntaXJhrDz1jkqFQyg9DmUANaLbG46jhR22Qjx/h6gQ18HN
	fVGDDfHLKP9RCMckOhw12Xl1ycXFH2/FxaoP//vjvcuGrUNb3/SvQLFXvOIQ8u3F163V
	+Kb7mP5MkNRK0fFT9hMXXpZQkAzBSd9FNpiJDtZ6zW8ubdTtO5uXnbFPBSDqyd8WvzVQ
	HcqA==
X-Gm-Message-State: AOUpUlHMh5FTaPdh41l/ECM8WGS2Vh5F4kiXTKmwoosQ8fa0795K+6sQ
	BvQEiRwsZDK7KpsHL2Npg4UkKptd
X-Received: by 2002:a17:902:e005:: with SMTP id
	ca5-v6mr16848285plb.224.1533628714139; 
	Tue, 07 Aug 2018 00:58:34 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.18])
	by smtp.gmail.com with ESMTPSA id
	d191-v6sm1458902pfg.172.2018.08.07.00.58.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 07 Aug 2018 00:58:33 -0700 (PDT)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Tue, 07 Aug 2018 17:28:27 +0930
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Date: Tue,  7 Aug 2018 17:27:54 +0930
Message-Id: <20180807075757.7242-5-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180807075757.7242-1-joel@jms.id.au>
References: <20180807075757.7242-1-joel@jms.id.au>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: [Qemu-arm] [PATCH 4/7] aspeed_sdmc: Init status alwlays idle
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
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g8AQxsGl1BjB

The ast2500 SDRAM training routine busy waits on the 'init cycle busy
state' bit in DDR PHY Control/Status register #1 (MCR60).

This ensures the bit always reads zero, and allows training to
complete with upstream u-boot on the ast2500-evb.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/misc/aspeed_sdmc.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index 9ece545c4ffa..522e01ef8c0d 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -23,6 +23,10 @@
 /* Configuration Register */
 #define R_CONF            (0x04 / 4)
 
+/* Control/Status Register #1 (ast2500) */
+#define R_STATUS1         (0x60 / 4)
+#define   PHY_BUSY_STATE      BIT(0)
+
 /*
  * Configuration register Ox4 (for Aspeed AST2400 SOC)
  *
@@ -137,6 +141,17 @@ static void aspeed_sdmc_write(void *opaque, hwaddr addr, uint64_t data,
             g_assert_not_reached();
         }
     }
+    if (s->silicon_rev == AST2500_A0_SILICON_REV ||
+            s->silicon_rev == AST2500_A1_SILICON_REV) {
+        switch (addr) {
+        case R_STATUS1:
+            /* Will never return 'busy' */
+            data &= ~PHY_BUSY_STATE;
+            break;
+        default:
+            break;
+        }
+    }
 
     s->regs[addr] = data;
 }
-- 
2.17.1

