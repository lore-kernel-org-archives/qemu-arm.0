Received: by 10.223.134.117 with SMTP id 50csp12237349wrw;
        Wed, 3 Jan 2018 10:36:59 -0800 (PST)
X-Google-Smtp-Source: ACJfBosh+P5S26tGRUxxw40lGX0nxPJle3IcdY4uOHrfTlKlw4L/1LAtVDk5WRORMnwpo9jUb3bO
X-Received: by 10.129.168.193 with SMTP id f184mr2151204ywh.511.1515004619354;
        Wed, 03 Jan 2018 10:36:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515004619; cv=none;
        d=google.com; s=arc-20160816;
        b=JnTDBmUHjsgPdEHi5wc8rn2dcQL4lEt2rI41gjBes/Vjmpy4zCcKjiof7bUf4ZXJGm
         2cCAlf/JI12bism5Lfwra9bmGjBJ5SEWlXs/K7+8pvpJtOAtK9yL7BWKyhZ95VkM/zSg
         fATE+n8Z0v68OFTvBVOWABR340yW4FbnTccEyseqszFuckF4MMIuc/AkOXci5AEvy+Mc
         OIXfj54miFpq8h9kPzzaM8axKg0gkSGreZ2tKhatlXFF8tUKdTCIHwwAkxiP4dRU9YGK
         tT89x6g7H0MUs444RugSQkM2HD2lsNHyk3lce+ScWLIXJgD5zsU6LbkTQMmQT9Vz1EV3
         vdpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=KLSH73+PhrTDeU5qHRVEPzwUQ7axdsLgk+Caal09PE0=;
        b=lhUKs9J2gIz7UFeBxRF8yPSkRQqPcMTBPXslg+hofM2BUvOf6A1+3qje4iJtCKcTSV
         M7iaQ0eWQYLP5HBOFWXJDyUb5/5X/CGZpcCODYCBWOLs6nTPg4FUile9qZ+XMScinRwM
         TaLSya5w9o9odxuTV6BzYwV7T0rSRy6nHl7Ps+pREyMD4wMVUaIf9dN293yW8AwJttCx
         oCqkqHIZKPAYq1x3QHJ0kwepPujghh85qUjRgTBImHxz/8khdWKbzu65LB72OK+b1Uzv
         wKs+4Eo0kJvRx/B5Ag2uOqp7qXc/ujL5eB1HptDzY415LIfmMfnubny6zt+gKGKURaZ+
         ueiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ql/k5R9v;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v141si319712ybe.339.2018.01.03.10.36.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Jan 2018 10:36:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ql/k5R9v;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60775 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWnuM-0004jb-P1
	for alex.bennee@linaro.org; Wed, 03 Jan 2018 13:36:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33868)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWnsO-0003GF-3p
	for qemu-devel@nongnu.org; Wed, 03 Jan 2018 13:34:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWnsN-0007Qw-8i
	for qemu-devel@nongnu.org; Wed, 03 Jan 2018 13:34:56 -0500
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:37371)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWnsN-0007Qj-3t; Wed, 03 Jan 2018 13:34:55 -0500
Received: by mail-qt0-x243.google.com with SMTP id f2so3221999qtj.4;
	Wed, 03 Jan 2018 10:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=KLSH73+PhrTDeU5qHRVEPzwUQ7axdsLgk+Caal09PE0=;
	b=ql/k5R9vD8iI3TzIwn5PLz8WAyOsZzOfeGwBNVrBDUMalHSPH4AmaxIHAD1uXimqUz
	kaSgyUd7brVksurb2vvPOlAnBMo/hGQezglb8jjpe4T2+0axy+By+VtM/FGxXbwUZGET
	kucsARcC3oiLIAARact2i1YtKhQXsa3QtICsfcEJy9sb8UBPrVDPWItaal2i3fdb/l/D
	ps9ODqmiex4fjBcIPHEVj8EVtQrW0B/ye+TraQx9VXBtK9Szp/kcMOlelnDRxWo90pBI
	/cOpwIhKJa4TvxjC1FtkKkvJYwHXt7WQFDt1MOQiZUS0TRn4NfolR2Xvibo4vtKDt+Yl
	hPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=KLSH73+PhrTDeU5qHRVEPzwUQ7axdsLgk+Caal09PE0=;
	b=n8c0uqbL8j2ohB6Cud/M1NeucROlm3qhqoY6AwnkXVYnW+nZLfZrxIcwVjsMx/gH1l
	3f6RtPHhDUJMhfg0ve/I7WM5k3LdM8EHGHqQ256nUG2MtRnEu1M+HdepCZxMChTwRduA
	oAOHpok2HUeFJ01bLfY9t8jEsN0vQlsGq6ik0gQv+LuhCALBveDIzyEr+bZOlSE9x2dG
	tpBN/phpv8H0nFFEzrJ4SLZJPKN7Lt2/dDZRk8+qGrM2+soqRl+CZMCCO7Nrdbv338/2
	UqmLbfkqwM4T8HFj7g28aXUvKDKEpOm/mFx78qQcWBTrnZMLJngVm+AdEvS/wvsZVb23
	qvRA==
X-Gm-Message-State: AKGB3mLTUiD3sbm+HPMPI+pjUhD66OzaiKpivpBjHjWcri4f2jA85v8a
	gb/2xKDYXOlfhYQEIf6edNc=
X-Received: by 10.237.48.193 with SMTP id 59mr3053463qtf.45.1515004494664;
	Wed, 03 Jan 2018 10:34:54 -0800 (PST)
Received: from x1.lan ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id 185sm992854qkd.1.2018.01.03.10.34.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Jan 2018 10:34:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Wed,  3 Jan 2018 15:34:03 -0300
Message-Id: <20180103183418.23730-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180103183418.23730-1-f4bug@amsat.org>
References: <20180103183418.23730-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-devel] [PATCH v4 10/25] hw/arm/exynos4210: implement SDHCI
 Spec v2
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
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lNF3csZbmSqc

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/exynos4210.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index e8e1d81e62..0e6acac784 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -75,7 +75,6 @@
 #define EXYNOS4210_INT_COMBINER_BASE_ADDR   0x10448000
 
 /* SD/MMC host controllers */
-#define EXYNOS4210_SDHCI_CAPABILITIES       0x05E80080
 #define EXYNOS4210_SDHCI_BASE_ADDR          0x12510000
 #define EXYNOS4210_SDHCI_ADDR(n)            (EXYNOS4210_SDHCI_BASE_ADDR + \
                                                 0x00010000 * (n))
@@ -377,8 +376,18 @@ Exynos4210State *exynos4210_init(MemoryRegion *system_mem)
         BlockBackend *blk;
         DriveInfo *di;
 
+        /* Compatible with:
+         * - SD Host Controller Specification Version 2.0
+         * - SDIO Specification Version 2.0
+         * - MMC Specification Version 4.3
+         *
+         * - SDMA
+         * - ADMA
+         */
         dev = qdev_create(NULL, TYPE_SYSBUS_SDHCI);
-        qdev_prop_set_uint32(dev, "capareg", EXYNOS4210_SDHCI_CAPABILITIES);
+        qdev_prop_set_uint8(dev, "sd-spec-version", 2);
+        qdev_prop_set_bit(dev, "suspend", true);
+        qdev_prop_set_bit(dev, "1v8", true);
         qdev_init_nofail(dev);
 
         busdev = SYS_BUS_DEVICE(dev);
-- 
2.15.1

