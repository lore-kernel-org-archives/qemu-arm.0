Received: by 10.223.134.117 with SMTP id 50csp12109835wrw;
        Wed, 3 Jan 2018 08:24:39 -0800 (PST)
X-Google-Smtp-Source: ACJfBosLWaUEr2fUWCzvmMS5WCYP1dgz9yFMVG31RM5bAItch9cvIp0O7S7VQjWcyD4S5vlno6JD
X-Received: by 10.37.195.66 with SMTP id t63mr1864438ybf.30.1514996679731;
        Wed, 03 Jan 2018 08:24:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514996679; cv=none;
        d=google.com; s=arc-20160816;
        b=j5RbO5RYvR7tBTQhSSZcA+gHbHbmok9ljg44CTnaL3wGA9NUYoGtfZM+KJ48AVEWZ6
         HI7Zx5O/cJL+ZaB0Z3I/tksCB9AWwsefTNjLawQYgtMFTpqRuWYRZvDHWzqsBdZmlhON
         kKfVLIOs+z7ynf139B8oC/3D04pSTNBfzM+Vn5SDKWO7KVaF6vZ2L1BxwZt1X0t8uZTc
         z2GFXTTLpDtnhgLpASChe3xdQ7Lb6ho5k+9LCvEo5IBvZeGuDkQyPiERetd84R30s8cX
         sugbtgi1GzuVA75zteujNZHAZZxPdM1WXVTVi2jnsIpOJz68r8i/vOb92HbLak9QP/h6
         6ZOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=vzXWfr9vOOuV3llM6xcKlxquTOj7ZSgDs846JfYpQ38=;
        b=E6F3OgG2q7rWIwYj/ZNwO0WLWGNZc6takMKCC/XQ4v31L6P3iKKSk4ledi8TcDxLvv
         w9KIGj3Sg5x7N4eYmTFpKKVTIjRtfxd02UJKBuF6dunITw3e8ky4HeBL0hU8MoK88zeP
         9ikyZPjyNIzz4/DBNnSaNxOrqt4lL4MtEaNCjyuBaBcKmy9rHIwHogplh99kfEZ4/vtq
         ApJ2qAqwEHmaaTX2x3wbAtqRy06LBjuzkIVmt5D6NzDewxlxMV6JyRNRXSMBypZEuAPq
         vvwJ/mkk+gCuzYDNJuDsGN9Xdw35RXDNkbduUj84mzpyQjEbWy0F47qX57Kr7gj431Qi
         W3sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=onCH/wvm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t83si287495ywb.129.2018.01.03.08.24.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Jan 2018 08:24:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=onCH/wvm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57059 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWlqJ-00042L-3L
	for alex.bennee@linaro.org; Wed, 03 Jan 2018 11:24:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44041)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWlps-000429-C2
	for qemu-devel@nongnu.org; Wed, 03 Jan 2018 11:24:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWlpp-0004vu-97
	for qemu-devel@nongnu.org; Wed, 03 Jan 2018 11:24:12 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:37599)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWlpp-0004va-53; Wed, 03 Jan 2018 11:24:09 -0500
Received: by mail-qk0-x244.google.com with SMTP id p13so2165001qke.4;
	Wed, 03 Jan 2018 08:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vzXWfr9vOOuV3llM6xcKlxquTOj7ZSgDs846JfYpQ38=;
	b=onCH/wvmowih39+yBYTnSp//pN4BO2olgY9apc6i2HfyX3b3KrvHgnwVvBihcqb75A
	Nz2pYqRtUewhHeyN0Q8FZjOAQFSjFfndphZ+E9jXvgY7KxgDqc3AClcRG+7RbFcrxJ0X
	Z/7PaO4kyYjaC1DCyQxtzsUGxbiD1E1AQKZleY+bIswu9JxyfER2IDCjdwBuawsg8oYp
	I/DTQWUfK3iwOUFRRm7FDUpgmiadwUTyAGRgvM+UBRf6Mdy6D5AKBF4NEokCXJJ5nPtY
	Ulu5SYngRL5WAaR9b6YTbvd467Bqi9XLZ86JDFPeOXO71P3pXV1EkNcmf2zDsABGR+0i
	WSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=vzXWfr9vOOuV3llM6xcKlxquTOj7ZSgDs846JfYpQ38=;
	b=AHbqKDgwo7gs+JPTxS41xYs9A0AEFt4lpRPPI1DD15RmblQKbM+UfEW7u6ggL3jB44
	ly9+mmpxQCxcjWJum97mzHE5zM6QUubJCHRLrz2MsAIbSr9b4DYNHZtb093KthOblPO5
	U4WPElhmlTnu6gASgaE8opMNLkD5eSaXyDwty7F0V4YQ6zqS2CAImo/YwYU4Judl3x/2
	W+lFJv5qD6QbdDWZqsd/JAN/AsoWclqeiH/GYuWZY4PdJPFQe6oD+I8MIeYQ8yEd8ukn
	R39dYIO/q0DdCyr0vaOHhtHY5+XzU519Q/ke8s2wnwPfidCbtuENOtvjCkKFZImdMIl5
	WIRg==
X-Gm-Message-State: AKGB3mI1BLQrZOo4tFj629x3Pl8dUAhF2/luftpD3dCqnMRF10l8rqEN
	fwYLcUP38eowB7/x6RZ9giA=
X-Received: by 10.55.50.198 with SMTP id y189mr2105868qky.255.1514996648631;
	Wed, 03 Jan 2018 08:24:08 -0800 (PST)
Received: from x1.lan ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id 102sm839393qkx.85.2018.01.03.08.24.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Jan 2018 08:24:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
	Andrzej Zaborowski <balrogg@gmail.com>
Date: Wed,  3 Jan 2018 13:23:54 -0300
Message-Id: <20180103162400.10396-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-devel] [PATCH 0/6] SDHCI: convert legacy devices to the SDBus
 API
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
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O/OTAEh0tXsg

Hi,

This series convert 3 devices using the legacy SDCard API to the SDBus API:
- milkymist-mmc
- pl181
- ssi-sd

Then move the legacy API to a separate header "sdcard_legacy.h".

Now the OMAP MMC is the last device using the legacy API, but need to get
QOM'ified first.

Regards,

Phil.

Philippe Mathieu-Daudé (6):
  hw/sd/milkymist-memcard: use qemu_log_mask()
  hw/sd/milkymist-memcard: split realize() out of SysBusDevice init()
  hw/sd/milkymist-memcard: expose a SDBus and connect the SDCard to it
  hw/sd/pl181: expose a SDBus and connect the SDCard to it
  hw/sd/ssi-sd: expose a SDBus and connect the SDCard to it
  hw/sd: move sdcard legacy API to "hw/sd/sdcard_legacy.h"

 include/hw/sd/sd.h            | 17 ----------
 include/hw/sd/sdcard_legacy.h | 51 ++++++++++++++++++++++++++++++
 hw/sd/milkymist-memcard.c     | 72 ++++++++++++++++++++++++++-----------------
 hw/sd/omap_mmc.c              |  2 +-
 hw/sd/pl181.c                 | 28 ++++++++++++-----
 hw/sd/sd.c                    |  1 +
 hw/sd/ssi-sd.c                | 27 +++++++++++-----
 7 files changed, 137 insertions(+), 61 deletions(-)
 create mode 100644 include/hw/sd/sdcard_legacy.h

-- 
2.15.1

