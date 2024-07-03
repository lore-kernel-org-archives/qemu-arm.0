Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp2440593njm;
        Wed, 3 Jul 2024 01:17:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXutnxSOzNBqTovpvWxSRNGNl7sO4EhtnE0KrtBbtMYbldpruWbEnxyr/5QW2lQ2+grQlANubDmfZVoF4tju91l6fFqkD1+
X-Google-Smtp-Source: AGHT+IGM9RVv0WQtY4RMRzaZMH9JVGS7ja/o3jZYpCoVQ1I2ASVUYVSaVOWNdjl63Ni7PGeO8CbS
X-Received: by 2002:a05:622a:8f:b0:446:6053:e47e with SMTP id d75a77b69052e-44662dd593bmr139780621cf.23.1719994669235;
        Wed, 03 Jul 2024 01:17:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719994669; cv=none;
        d=google.com; s=arc-20160816;
        b=BmVOI7I+Syv2dlqf6qMh/qQ+ZyWPXiBvNSChTBBK64qbPfHr8M6B1xpWLEttZzcx6q
         gpwylWP/+RFVSisLJTyTxhWpmw+lEg8c3/6E7Gofij9808PhZ8IZz/AWwP1SpvInM/9K
         wpVzGdGn8PLtADDWghdsHE/be3SfEFT4FlE2islgFZWoU6/TH2ZMqH8Tir28p2HjspEF
         GeRQvTonqkMp9cW5LeYP3ov8DNALdwNmiJssfSrbRWBbVQHhSzaXaCKkqfmOqN/5Wb44
         IbVrFoH6TZ8RNqMVL7q8y8DdarZSYUCAF0n4tz3O0gRMVEGCGZ/7fL6sqICZ3stj3TdA
         lhQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=3jtWfDvP2VLz5vpbgmpZ8F+1QWeD8XGnzI5OayaCRos=;
        fh=Vva0SnTfFpZ62XWQNW5X4TL2jFj5cBikmg9Gp1PrOrY=;
        b=nfUvCUvBzcHc7BIbKsraDLzSG9CkKpNckXuiCZDIyIRbE2+EeyEI/+/19SlIYwVwAo
         J+k0kJQxqBoKnpuhKUQcHbh2/ZqKUaaSAJUSirDb24lCi2PdxzqF8AyboqVA8OflIdn7
         dGmZgoUtAVeQqoQUufZC4UHo2imuop+xqVgar38Q5Dlm0ySz48Bj7S9fBNULR4Je59RH
         p0tnsHcRrHWq82V8kWvCD7HsxcB/8/g/+c9ulNMpQt/Tb/4gcL5W19DArCDe9As+A5DO
         Zvf39eFIDvG70+ICIjBT//mvGcBZzCj4Va155sGueQgZeZGHXi9l8dHNMqx5qix3Y/hI
         UVbQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-446514a1172si114513341cf.450.2024.07.03.01.17.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jul 2024 01:17:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sOvAh-0003HY-1H; Wed, 03 Jul 2024 04:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sOvAU-0003CJ-11; Wed, 03 Jul 2024 04:16:55 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sOvAP-00011G-AU; Wed, 03 Jul 2024 04:16:45 -0400
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Wed, 3 Jul
 2024 16:16:25 +0800
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX02.aspeed.com
 (192.168.0.25) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 3 Jul
 2024 16:16:24 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 3 Jul 2024 16:16:24 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, "Kevin
 Wolf" <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, Jason Wang
 <jasowang@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, "Wainer dos
 Santos Moschetta" <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC
 here" <qemu-devel@nongnu.org>, "open list:Block layer core"
 <qemu-block@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v2 0/5] support AST2700 network
Date: Wed, 3 Jul 2024 16:16:18 +0800
Message-ID: <20240703081623.2740862-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: Fail (TWMBX02.aspeed.com: domain of jamin_lin@aspeedtech.com
 does not designate 192.168.10.10 as permitted sender)
 receiver=TWMBX02.aspeed.com; client-ip=192.168.10.10;
 helo=localhost.localdomain;
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 9kf1c6D6NWio

change from v1:
- ftgmac100
 - fix coding style
 - support 64 bits dma dram address for AST2700

change from v2:
- ftgmac100: update memory region size to 0x200.
- ftgmac100: introduce a new class(ftgmac100_high),
    class attribute and memop handlers, for FTGMAC100_*_HIGH regs read/write.
- aspeed_ast27x0: update network model to ftgmac100_high to support
  64 bits dram address DMA.
- m25p80: support quad mode for w25q01jvq

Jamin Lin (5):
  hw/net:ftgmac100: update memory region size to 0x200
  hw/net:ftgmac100: support 64 bits dma dram address for AST2700
  aspeed/soc: update to ftgmac100_high model for AST2700
  hw/block: m25p80: support quad mode for w25q01jvq
  test/avocado/machine_aspeed.py: update to test network for AST2700

 hw/arm/aspeed_ast27x0.c         |   3 +-
 hw/block/m25p80.c               |  16 ++++
 hw/net/ftgmac100.c              | 158 +++++++++++++++++++++++++++-----
 include/hw/net/ftgmac100.h      |  24 +++--
 tests/avocado/machine_aspeed.py |  13 +--
 5 files changed, 178 insertions(+), 36 deletions(-)

-- 
2.34.1

