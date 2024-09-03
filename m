Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1355395njf;
        Tue, 3 Sep 2024 01:36:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX9QSkFDIzJVWND9ufj86rwL0IdBxaJmy6fk7JwgSif9/6HM5J+vbmS9ZdeX9gM+yQ0WWSY9V33+MfJMQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE4f2unq+meyPl/TmvdVJb2pJ/4OcpJ4dyrjg5xCQaM0f0EsDdI2EIhcblRfX8X6pXxOsVQ
X-Received: by 2002:a05:622a:5514:b0:444:ff16:9ffd with SMTP id d75a77b69052e-4570ec426e0mr179181651cf.25.1725352577771;
        Tue, 03 Sep 2024 01:36:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725352577; cv=none;
        d=google.com; s=arc-20160816;
        b=JrMIhjM3xa+hU3kAgkkT98WmV4KiWURtA05fky6r8R+ks2UXBEhDwtlBL1VWNVerVW
         v7dxstdow9BAIN7sIuRgQZkkKBJm+pp17CZhCuLJEQbeh8YIAfoG3EBipuM/EZJDKkic
         ZS63+yQiu84rQivHZeZhzKKLDhVEfD//lku5Do2J64agjDqvxweb+xoQCDLFL4tNidcm
         GQiqmLnU9pbCh9CJhOCi04+iJx6NQ/ngHA9074Uj3YXtasO9oxbQYuPC0t3hdvmyy1/h
         zRWuwI+tsVk8KozHx9UdB0H9+IWDc11/MeYQKedXPhR+O87CnuyUj4r9MdFSq4NjOkbP
         lnyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=1zgMGeXHUftZeaJZPf3a2QKT8uKLjzwDIoxE25CbDQs=;
        fh=FCtYWwOtEgMeIuI7wG7f687kK1NW14MjWu/nT+chD9o=;
        b=jmKi3plvKEFpZquJ/kQ2ZtsI2Qs7yc/5zLRpG+oO99vHTq5oavVRAPaMg5fwBRapqO
         Wz2olv00hcv6kh7drFCBgkSBcaEjfNRXUhwVYKcft1cn0F4SW++iv7dSSc/LtCf2KAGL
         kvAWGFIDwc8tZnqIo4Yi5nwRbzBB9ebG05v5uhEBPVVOBdOBdtdshu8bK8I5tt30+IvJ
         Zq9ylkwUHF4JSflwHMfy0hQvoYiJ3TTanNRT7QAABjSzGG51F1/cLBlDj6qCC0KrwOxN
         aGHjobhpqkhuAni7nghbEpp9eKLbDt/5ou2KaxhrXGwrhSpLHcco53+G0Fm42sEmtay5
         opRQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45682c86991si122731601cf.27.2024.09.03.01.36.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 01:36:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1slP0n-0002jG-LN; Tue, 03 Sep 2024 04:35:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1slP0l-0002Za-6L; Tue, 03 Sep 2024 04:35:39 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1slP0i-00084x-T5; Tue, 03 Sep 2024 04:35:38 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 3 Sep
 2024 16:35:28 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 3 Sep 2024 16:35:28 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, "Wainer dos
 Santos Moschetta" <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC
 here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v3 00/11] support I2C for AST2700
Date: Tue, 3 Sep 2024 16:35:17 +0800
Message-ID: <20240903083528.2182190-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lq9u9GMGf9y5

v1:
- support I2C for AST2700

v2:
- fix review issues and add reviewer suggestion
- update avocado test case for AST2700 I2C
- support i2c bus pool

v3:
- update commit messages and commit title
- update API to get the device irq

Jamin Lin (11):
  hw/i2c/aspeed: Support discontinuous register memory region of I2C bus
  hw/i2c/aspeed: Introduce a new bus pool buffer attribute in
    AspeedI2Cbus
  hw/i2c/aspeed: Support discontinuous poll buffer memory region of I2C
    bus
  hw/i2c/aspeed: Introduce a new dma_dram_offset attribute in
    AspeedI2Cbus
  hw/i2c/aspeed: Add AST2700 support
  hw/i2c/aspeed: Add support for Tx/Rx buffer 64 bit addresses
  hw/i2c/aspeed: Add support for 64 bit addresses
  aspeed/soc: Introduce a new API to get the device irq
  aspeed/soc: Support I2C for AST2700
  aspeed: Add tmp105 in i2c bus 0 for AST2700
  machine_aspeed.py: Update to test I2C for AST2700

 hw/arm/aspeed.c                 |  10 ++
 hw/arm/aspeed_ast27x0.c         |  45 +++++
 hw/i2c/aspeed_i2c.c             | 310 ++++++++++++++++++++++++++++----
 include/hw/i2c/aspeed_i2c.h     |  28 ++-
 tests/avocado/machine_aspeed.py |  16 ++
 5 files changed, 362 insertions(+), 47 deletions(-)

-- 
2.34.1

