Received: by 10.25.205.13 with SMTP id d13csp10448071lfg;
        Fri, 6 Jan 2017 10:55:35 -0800 (PST)
X-Received: by 10.55.138.4 with SMTP id m4mr85853140qkd.70.1483728935621;
        Fri, 06 Jan 2017 10:55:35 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 21si6595589qkf.16.2017.01.06.10.55.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Jan 2017 10:55:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54525 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cPZfo-0000P3-Uf
	for alex.bennee@linaro.org; Fri, 06 Jan 2017 13:55:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33106)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1cPZaU-0004fn-O6
	for qemu-devel@nongnu.org; Fri, 06 Jan 2017 13:50:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1cPZaT-0006d6-UA
	for qemu-devel@nongnu.org; Fri, 06 Jan 2017 13:50:02 -0500
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:33529)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mar.krzeminski@gmail.com>)
	id 1cPZaT-0006cf-Nf; Fri, 06 Jan 2017 13:50:01 -0500
Received: by mail-lf0-x241.google.com with SMTP id k62so3957521lfg.0;
	Fri, 06 Jan 2017 10:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=G/6OSibMLY2LMuzz0xP9z9yc6aTkLWEJgLH9vOKVzx4=;
	b=oISg8CbcrN30/YHD2mMupdJUFSILCeeUMHfWWzyM4oOQEzqo16HLLdsctNObpA8a9A
	BEo9sbe0mA8TH0fXzxMql+dUkdNoBHB99wrmtPu/fxQa2ve9AAbRFan9wz3ht4+OHRJq
	AkHmQLkzqCTGPkGb8eFh1ySjbxhRr7jhH1cN7fPQtzSb0M5zMpuObVXWFBQwrk4RlCqO
	OnNuo441PBmPZybG60v1bWhhM4QM4nIc4+qs2b4/rodaIdM9lkMxEzxM3Ja5yA9btnKA
	nhX3BfLm9hdkf/WRLPd5uczZkS71L6rqDvqvtOQmiRV+/wP7HSOJKp8yNQygGGMRgvdn
	nX8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=G/6OSibMLY2LMuzz0xP9z9yc6aTkLWEJgLH9vOKVzx4=;
	b=ElS8+vgU9iBQYnF6NuRLMxK/zZilNKjJog0aKnr5MwBiBK+2AZFJ0WmrYLbV6Sx1a6
	j++NwXHPoO4e+oc5uzMIcaoOzNo4cGenUYiX8VNvZ107oaC9AE/3OO1S+0nluaK1Hktp
	qC+s4CVJ7/V/jkAOqdBt2RNW5iTgmbjRTw/6A2KR2rJnzGFJ8FDOHGhcYKEMA9sMjv0j
	K0jjrZe+vKQEsIJL5zMR5yjkZdCVXo0OozUgBcktIwtKuD8FX8pVRKEihYhBxwC9oyP6
	5vxZuhqJ0teBH+pKF3vViScZUXy5ApMnHqSy8Jwfd1Gb/oY1egB9er1rvSOsA1goARG1
	RfhQ==
X-Gm-Message-State: AIkVDXJKHXTKiEf1aGDdWlJpPT1+LOTOkjLW14y1rKzZhTc3cq4lymkaZO1q8kOGzYVaSA==
X-Received: by 10.46.76.2 with SMTP id z2mr29702670lja.32.1483728600378;
	Fri, 06 Jan 2017 10:50:00 -0800 (PST)
Received: from localhost.localdomain (89-78-94-50.dynamic.chello.pl.
	[89.78.94.50]) by smtp.gmail.com with ESMTPSA id
	f42sm19448777lji.2.2017.01.06.10.49.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Jan 2017 10:49:59 -0800 (PST)
From: Marcin Krzeminski <mar.krzeminski@gmail.com>
To: qemu-devel@nongnu.org,
	edgar.iglesias@xilinx.com
Date: Fri,  6 Jan 2017 19:49:48 +0100
Message-Id: <20170106184948.3422-4-mar.krzeminski@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170106184948.3422-1-mar.krzeminski@gmail.com>
References: <20170106184948.3422-1-mar.krzeminski@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::241
Subject: [Qemu-devel] [PATCH v2 3/3] block: m25p80: Improve 1GiB Micron
 flash definition
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kqziLCFK8aU5

n25q00 and mt25q01 devices share the same JEDEC ID. The difference
between those two devices is number of dies and one bit in extended
JEDEC bytes. This commit adds proper entry for both devices by
introduction the number of dies and and new 25q00 entries.

Signed-off-by: Marcin Krzeminski <mar.krzeminski@gmail.com>
---
 hw/block/m25p80.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index b065ddc..15ec0fd 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -242,8 +242,10 @@ static const FlashPartInfo known_devices[] = {
     { INFO("n25q128",     0x20ba18,      0,  64 << 10, 256, 0) },
     { INFO("n25q256a",    0x20ba19,      0,  64 << 10, 512, ER_4K) },
     { INFO("n25q512a",    0x20ba20,      0,  64 << 10, 1024, ER_4K) },
-    { INFO("mt25ql01g",   0x20ba21,      0,  64 << 10, 2048, ER_4K) },
-    { INFO("mt25qu01g",   0x20bb21,      0,  64 << 10, 2048, ER_4K) },
+    { INFO_STACKED("n25q00",    0x20ba21, 0x1000, 64 << 10, 2048, ER_4K, 4) },
+    { INFO_STACKED("n25q00a",   0x20bb21, 0x1000, 64 << 10, 2048, ER_4K, 4) },
+    { INFO_STACKED("mt25ql01g", 0x20ba21, 0x1040, 64 << 10, 2048, ER_4K, 2) },
+    { INFO_STACKED("mt25qu01g", 0x20bb21, 0x1040, 64 << 10, 2048, ER_4K, 2) },
 
     /* Spansion -- single (large) sector size only, at least
      * for the chips listed here (without boot sectors).
-- 
2.9.3

