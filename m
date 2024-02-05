Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1011861ejb;
        Mon, 5 Feb 2024 01:20:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3mMk6Ej/44dSjLxK6rRhxWd1NiN+LthjEM15R4xOyMj1tobSahm8acEZ3BezdKaiBWWjF
X-Received: by 2002:a25:6f83:0:b0:dbf:487b:1fe7 with SMTP id k125-20020a256f83000000b00dbf487b1fe7mr9953535ybc.17.1707124842185;
        Mon, 05 Feb 2024 01:20:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707124842; cv=none;
        d=google.com; s=arc-20160816;
        b=MbJvI3pLuniwpqSRwV416YE4dfV3oZluJUvDOV8JF7Jxh6/0MWWWHh+h0tf6K8pWvN
         O/Q1Hce1eXpb+zpRTGir9V2wOuAfUWH64C6paNA3EUpBqidHpeB5VK5Nbyhb8GV3tikY
         p2Ls5Tn5wBIeZxyca/GJiZSqmJpseVpQt6Xx+Bgb8ULGmOQcJwdmVPFIjOcAwQq6x+wQ
         FfnNS2rafmZkMHvgCewDqVBfzRojIUb0zWktFjlkgdqjIzSgRqz22ugNNGQgb3CQa6DA
         8drlXN1Gz5LNuBsw43k0A72DPA6qxGQNbRzIqytQn7/BiG0LPFaCiS1AgGqO567YkaNa
         oeOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Vmv2YEd+26f9zeLtnzX3HoWkiWceRVHY1ixy4/fPVNA=;
        fh=lCdSQPq1THnwS5kN1CKnQkPpjOieD2PHmsNl1XseA3k=;
        b=R6I0GNCM6sMcztiegkdUF0X0CrKgMhvLIWu6KFgjsmRPnuDUyWHRfKaGl2Oq8z2++g
         JdKyPKbkJYU7MEIKiRHqMOc6H0dqRuBwnAVINYmo7J7KGjCv3mV/MyYJx6PHTvWjFnB+
         PwUFyUmJMl3pRjLIMOFP+c4x+r1Xnt5H2lgyAmaWtGr/YzUJsNIA6UbzvIozVdCGH56B
         1s7yomtUflEf1LJaoQrIObeUBuJhzoHi6yP/EUENsPkl+APwdJkACiXFcwP3ktb7lPxf
         5sNlnkpYnEvj3FDDg9XXgdDOX3anRx3HKU2k5kA70Ja2hB5x3ZdWxk1jyDSl0sfgQ5N6
         1e9w==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
X-Forwarded-Encrypted: i=0; AJvYcCVVLErFYphC8FadvmvVqZ55Mi6Q+LR2UU4coeXC66VX1w2KHK/NR1F/KNYT6nkXRLQ+b576OIuXY8uQ9uq0n8gXabE7CYp+
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j10-20020a05620a410a00b007856bff5703si5049190qko.656.2024.02.05.01.20.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Feb 2024 01:20:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rWv9S-0004He-VE; Mon, 05 Feb 2024 04:20:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1rWv9R-0004HB-JI; Mon, 05 Feb 2024 04:20:29 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX02.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1rWv9D-0008Gf-Aj; Mon, 05 Feb 2024 04:20:29 -0500
Received: from TWMBX02.aspeed.com (192.168.0.25) by TWMBX02.aspeed.com
 (192.168.0.25) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 5 Feb
 2024 17:14:17 +0800
Received: from twmbx02.aspeed.com (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 5 Feb 2024 17:14:17 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <jamin_lin@aspeedtech.com>
Subject: [PATCH v0 2/2] aspeed: fix hardcode boot address 0
Date: Mon, 5 Feb 2024 17:14:14 +0800
Message-ID: <20240205091415.935686-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240205091415.935686-1-jamin_lin@aspeedtech.com>
References: <20240205091415.935686-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: Fail (TWMBX02.aspeed.com: domain of jamin_lin@aspeedtech.com
 does not designate 192.168.10.10 as permitted sender)
 receiver=TWMBX02.aspeed.com; client-ip=192.168.10.10;
 helo=twmbx02.aspeed.com;
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX02.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: itASnWpgsaMh

In the previous design of QEMU model for ASPEED SOCs, it set the boot
address at 0 which was the hardcode setting for ast10x0, ast2600,
ast2500 and ast2400.

According to the design of ast2700, it has bootmcu which is used for
executing SPL and initialize DRAM, then, CPUs(cortex-a35)
execute u-boot, kernel and rofs. QEMU will only support CPU(coretax-a35)
parts and the boot address is "0x400000000" for ast2700.
Therefore, fixed hardcode boot address 0.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 218b81298e..82a92e8142 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -289,12 +289,14 @@ static void aspeed_install_boot_rom(AspeedMachineState *bmc, BlockBackend *blk,
                                     uint64_t rom_size)
 {
     AspeedSoCState *soc = bmc->soc;
+    AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(soc);
 
     memory_region_init_rom(&bmc->boot_rom, NULL, "aspeed.boot_rom", rom_size,
                            &error_abort);
     memory_region_add_subregion_overlap(&soc->spi_boot_container, 0,
                                         &bmc->boot_rom, 1);
-    write_boot_rom(blk, ASPEED_SOC_SPI_BOOT_ADDR, rom_size, &error_abort);
+    write_boot_rom(blk, sc->memmap[ASPEED_DEV_SPI_BOOT],
+                   rom_size, &error_abort);
 }
 
 void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
-- 
2.34.1

