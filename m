Received: by 10.25.205.13 with SMTP id d13csp11030849lfg;
        Sun, 8 Jan 2017 00:41:06 -0800 (PST)
X-Received: by 10.55.27.65 with SMTP id b62mr85931980qkb.202.1483864866848;
        Sun, 08 Jan 2017 00:41:06 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 123si3790420qkj.221.2017.01.08.00.41.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 08 Jan 2017 00:41:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60684 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cQ92G-0005bG-Av
	for alex.bennee@linaro.org; Sun, 08 Jan 2017 03:41:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58988)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1cQ90O-0004Yf-Lo
	for qemu-devel@nongnu.org; Sun, 08 Jan 2017 03:39:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1cQ90N-0000OI-M8
	for qemu-devel@nongnu.org; Sun, 08 Jan 2017 03:39:08 -0500
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:36293)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mar.krzeminski@gmail.com>)
	id 1cQ90N-0000O4-F5; Sun, 08 Jan 2017 03:39:07 -0500
Received: by mail-lf0-x242.google.com with SMTP id j75so9240846lfe.3;
	Sun, 08 Jan 2017 00:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uKrv6IJkAokl20DdT/6dR9iFfLJXTaIrneIHl77MBHE=;
	b=Resj59ySHSjlxMHu/OyxZYnOizvJL6dgXI+3GXkXAeUHjxI8AcFQCjVbASSHNmRRno
	+VjyC37hR2qpAo6T2AJRh2ujoQtaQa2PyGWjFRlq/c+FgCk4jdo5UpQ9i8L6PUrfvGM5
	pjj/APgw6LEsBoTvvrozqZKuEUfwLDZWx3/xGjOhWiHaan5aCKJY7b1EcyddiY6nnvd/
	E2INix+UFSPkO85GtxB5BVCVYMorfsbloZ/kOGsKThqdiO9y007ITN6QbGHYstPtTQq/
	1174XR91dgjw7xErczagij1UvnxiXhpwbk5CwiXGI9pckad7mNM6KAuawSb7f1ag8J3k
	xyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uKrv6IJkAokl20DdT/6dR9iFfLJXTaIrneIHl77MBHE=;
	b=fUzjG7PSuOmuPMfURwJONx6YYbIh41DsBSOOPbQ4OmzhQV7MHTsyf0nwEABcEidRTP
	El/9OzAnsW/yWc1tI8XkpS+jF0XNTteD6vKC4HQT8sOhOT7IseHV71es8wTnmwwlU8J3
	fTVcaNafDxkqyxg2iKJjDHa54bj0dH5GyoWTdt1BVWrQheqIFrRLaNQeyydLgszYJHc4
	GkwsR+NIU6T78Dq32Dm5MSzMOlxWPVmGsNY5MFo7ssyN9X9GNQZzfnizUOfhSkbFtjA+
	ZFcbXtzdeGiEapr2tvProCpr+qtVcFMEmlRg5PWDZkoAGo/9cfzPxMwe5hDhOj1+JGXU
	nAWw==
X-Gm-Message-State: AIkVDXJvgssvhy9ALn+V3BhWC5+KSG2pGNPubPLcCTrg2GREHnJ3+tWF5i/3kmX71uYYqA==
X-Received: by 10.25.154.142 with SMTP id c136mr28706489lfe.71.1483864745907; 
	Sun, 08 Jan 2017 00:39:05 -0800 (PST)
Received: from localhost.localdomain (89-78-94-50.dynamic.chello.pl.
	[89.78.94.50])
	by smtp.gmail.com with ESMTPSA id 1sm18532752ljv.40.2017.01.08.00.39.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 08 Jan 2017 00:39:05 -0800 (PST)
From: Marcin Krzeminski <mar.krzeminski@gmail.com>
To: qemu-devel@nongnu.org,
	edgar.iglesias@xilinx.com
Date: Sun,  8 Jan 2017 09:38:54 +0100
Message-Id: <20170108083854.5006-4-mar.krzeminski@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170108083854.5006-1-mar.krzeminski@gmail.com>
References: <20170108083854.5006-1-mar.krzeminski@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::242
Subject: [Qemu-devel] [PATCH v3 3/3] block: m25p80: Improve 1GiB Micron
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, clg@kaod.org,
	mar.krzeminski@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SkNUMyFyJHRk

n25q00 and mt25q01 devices share the same JEDEC ID. The difference
between those two devices is number of dies and one bit in extended
JEDEC bytes. This commit adds proper entry for both devices by
introduction the number of dies and and new 25q00 entries.

Signed-off-by: Marcin Krzeminski <mar.krzeminski@gmail.com>
---
 hw/block/m25p80.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index a9b025b..fb5cef3 100644
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

