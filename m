Received: by 10.223.159.74 with SMTP id f10csp5778479wrg;
        Wed, 13 Dec 2017 18:00:56 -0800 (PST)
X-Google-Smtp-Source: ACJfBotLuOylxU1d//j2ADwm97shqnNA0azRwc6bBhapI0BZoaNBCBE8ROs6dbdFl714kN5LjD31
X-Received: by 10.129.82.79 with SMTP id g76mr3191316ywb.94.1513216856759;
        Wed, 13 Dec 2017 18:00:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513216856; cv=none;
        d=google.com; s=arc-20160816;
        b=mYeu01VB62YTSJb8zmYhJsJkHI2zVlRFZkfV4rhBYCQ0gygFMf01vudhaIpPRETt6+
         zb89IgrWbxQ4PoKLxLYAprCQsdY+9s643ANV8N2+egWK4NJjnArG/tJ6sqkKUONDO3em
         o+rFST8CaF64g1wco2bE05e7Q75VJl3DNDIUe49pGUjVHRE+nDdioIF5Mg+vq88IkEYq
         CEIxYi85vj22YdJFOUrxFx/PLjrRzKU+y9EHWUuH6p+NdU4fHlQLY1GCLXsDM9oaJ8Rd
         G2l91LuqlAruFy9mscquFNv3mmfnOsSuVm7LgBm79GqxYxldbbQidvBFEL9pWvpvalqL
         9wJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=Fna7omB50fU4nqtkCwgu6R6aCBOiLuxwMovAwEwh8dA=;
        b=VmubvJcLornvs+agGcK3DXv/sKKX0rXLoRdIBFtJX+NSSmSYTcStxEboTAJMYN5rkX
         Cb1w2hYF71ZQT7KeRJMoP8Qm5QBjq1MFudb0lXXcHUNqTjxkVmsfKPUPIEind89hrzON
         PUyN4yJbLiAHRpPpf3g9njpVluScjqOGre5220Zb5eVyOWrPYIsl/Fsur7N/MmsDc744
         Y/aoJgqwQOPIZ7DQPGLePRFehZk13hJIg0BSgwhnCzJ0u6y/vQePe5lamiLoMv8SkeE/
         3NrjawvpUZCBWftDrYPlxubgvIkq1F9T5ZlWai65t5s1HJ5ZwJQosxye7sfa/fYmxjIT
         OUmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OBYbIkEk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u9si628283ywe.375.2017.12.13.18.00.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Dec 2017 18:00:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OBYbIkEk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38723 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePIpU-0005hl-6h
	for alex.bennee@linaro.org; Wed, 13 Dec 2017 21:00:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53318)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePIpF-0005fl-SL
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 21:00:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePIpF-0003Mq-7c
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 21:00:41 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:38230)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePIpB-0003JV-1D; Wed, 13 Dec 2017 21:00:37 -0500
Received: by mail-qk0-x243.google.com with SMTP id z203so4504273qkb.5;
	Wed, 13 Dec 2017 18:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Fna7omB50fU4nqtkCwgu6R6aCBOiLuxwMovAwEwh8dA=;
	b=OBYbIkEk1/H8tsWV0pCLDYECBIWypbMcAzN2KlJOWiVmfALRWG8H/KZ1C5AtTmTV3V
	rMwOHzVnjd6puTaz1gY/ecyxKU1Y7djp+k4duuomP6uUc5kw7HjM8NCxe/tDnnxxi6FW
	oTjzsrpJvYm8v3DRZZ4tXnj7oxyweUJyOkiBCeIZ9QurHUfzTkC3vHJl/FS1CF2df/Jv
	hNufm4eHDUGc5eFMJdWFEVrS/bGM6wsSRf/DA+j/sNG0tMcmRIO2PZ2fT+QwYeSCgFFk
	zSmKlOTDaRotH00bMFTG23Gdkqt4mw3/oNp+eoZP3E1EgEiElAgbmxpac+sn5TrzgUpK
	FHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=Fna7omB50fU4nqtkCwgu6R6aCBOiLuxwMovAwEwh8dA=;
	b=hFeNcxN/0YjVrss2ZQt0yrBogNWdtXl4ZLJ5MQ8aJ3N3FBsuoT0qjvwdh3QNz2ykIL
	Ev6rSkTY6ri1UmSEedzFUHu34wF8Zp+EtZQng2SVgnPCCWK+Lmx97GHNOvutiiMSlhTN
	vz6XYjBLtkW9+rpieOosmWQsdqDwAPFrz9UMhKuN1EUUU55jjvmlaiLxrWTk1utAmoHB
	WfNvbaWhBEkwcrZlhzpof8VQyYIPfAwlNb9meX6btqZpXDCC24TyKSZXxXYLadH3QHQ5
	rBhxfHnjAFWfV8xGuOYnxkRMRuxudWKa8C/S5psDPmAP+JiyOpMfpiZ9k1OddmomgoiL
	Cc8A==
X-Gm-Message-State: AKGB3mKVt0JADa8BsA2QMD+gG8I17QhMKKMa6To8d/lzCPI2UAK3F9Kf
	a/1xokRBF2lwOGNhwA58t3k=
X-Received: by 10.55.19.206 with SMTP id 75mr12882309qkt.33.1513216836356;
	Wed, 13 Dec 2017 18:00:36 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	n39sm1938120qtn.95.2017.12.13.18.00.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Dec 2017 18:00:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	=?UTF-8?q?Gr=C3=A9gory=20Estrade?= <gregory.estrade@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Wed, 13 Dec 2017 23:00:17 -0300
Message-Id: <20171214020025.4004-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-arm] [PATCH 0/8] SDHCI: add a qtest and fix few issues
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
Cc: Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SBcOcjB9fzUj

This series adds a qtest for the SD Host Controller Interface.

To keep it simple, for each device using a SDHCI IP we ask the the capabilities
it supports, and verify with the public datashits availables.

So far the QEMU devices only implement the v2 and v3 Specs.

This exposes few inconsistencies, we fix them.

Regards,

Phil.

Based-on: 20171213232025.24503-27-f4bug@amsat.org
          (SDCard housekeeping)

Philippe Mathieu-Daudé (8):
  sdhci: add a "sd-spec-version" property
  sdhci: some ARM boards do support SD_HOST_SPECv3_VERS
  sdhci: add qtest to check the SD Spec version
  sdhci: fix CAPAB/MAXCURR registers, both are 64bit and read-only
  sdhci: add check_capab_readonly() qtest
  sdhci: add a check_capab_baseclock() qtest
  sdhci: add a check_capab_sdma() qtest
  sdhci: add a check_capab_v3() qtest

 include/hw/sd/sdhci.h        |  14 +++-
 hw/sd/sdhci-internal.h       |   4 +-
 hw/arm/bcm2835_peripherals.c |   7 ++
 hw/arm/fsl-imx6.c            |   6 ++
 hw/arm/xilinx_zynq.c         |   2 +
 hw/sd/sdhci.c                |  30 +++++++--
 tests/sdhci-test.c           | 152 +++++++++++++++++++++++++++++++++++++++++++
 tests/Makefile.include       |   1 +
 8 files changed, 206 insertions(+), 10 deletions(-)
 create mode 100644 tests/sdhci-test.c

-- 
2.15.1

