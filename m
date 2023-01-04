Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp8321102ejb;
        Wed, 4 Jan 2023 14:30:52 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvP33UHkL20L25LrDLfvmsS9A3p5mltoMx2Uuo/9lGvNG4A4Ko+J7KSTlHHHdslHH2EDOu+
X-Received: by 2002:a05:6214:2f07:b0:531:c964:481b with SMTP id od7-20020a0562142f0700b00531c964481bmr18164035qvb.9.1672871452092;
        Wed, 04 Jan 2023 14:30:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672871452; cv=none;
        d=google.com; s=arc-20160816;
        b=tCVl4G4rKywqYBWAhAXBa6/2sKmOeu8xzPnyFAYO4CblZzcM9IvUypv0yOxlkWxh6w
         ujWpJ+djHkBPMphLJLGNzC0oyUo91b/5supFhDrEhGXXZsb/+g8RKL/USqf37zycmHVa
         9UzeIDqUwjURW7mA9aJo2Ed3zfv0bz+pwE7E9bfPkbnPgxOFwLDCA5FfSoIciHyzx8GO
         GDKnDevz/GroE4RJFCtEwd/M9lmxtjfZvWndacX7Ql/iDS9Yq8yoW5vNVuFRNHo60bWh
         s3gg1urIvEYiDo5hW94Y8NVJ755lP/M2etgdXR8MoX2iljCzj3URgGqCiwKk7+D4pmsy
         pOOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/hYs50GwFMyuZfrImrAOFNvNLwGPKhd/4T6LtSg8+5M=;
        b=JktepkdNm0+qC3cE5QOiepLBHvUpwSZ2KOsM0MV3c5aPedqppONnpwBFka1JtekkNK
         k2XUVfeLtUhz2eBVNLXtE0RNrn2YqPWb6e8rFXFogDusQr6OknVzMztwk5fgHUIc7z3L
         yHR0zxXfZVZSf+AZXUoQukgZ/7quXkSPGT7Vwkm8o6DSluHCefJ17S/eAThqBFhD7QbE
         70lpN2sPQcyepi2Kt9QqbqpcySj8AoVnz2OSnqy+WPVP3D3NN3VpbYAi2RsRo2ELZcih
         jXhpX/8p4BnosScO9MKqYdrp95ujBRsTUUAJtHxCJdNGfpJczgfwCAhNw0Hlf9Bgt+Bn
         EwjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qz7J1Aaz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u1-20020ae9d801000000b006b941547704si17220282qkf.292.2023.01.04.14.30.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Jan 2023 14:30:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qz7J1Aaz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pDBvY-0002GQ-HE; Wed, 04 Jan 2023 17:08:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBuU-0001u6-85
 for qemu-arm@nongnu.org; Wed, 04 Jan 2023 17:07:08 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBuP-0006vH-UN
 for qemu-arm@nongnu.org; Wed, 04 Jan 2023 17:06:56 -0500
Received: by mail-ej1-x636.google.com with SMTP id gh17so86065508ejb.6
 for <qemu-arm@nongnu.org>; Wed, 04 Jan 2023 14:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/hYs50GwFMyuZfrImrAOFNvNLwGPKhd/4T6LtSg8+5M=;
 b=Qz7J1AazlyA7TkFmTghpBG/6vJrDSWHKbTwtiuGnzqK7ApC9+o8bNw/7/IJHgXWR3i
 YCLat9y+G6p6U4z1Kpg2pjsXWAofMcNf3VPViZbRDRonu5xtJoH7vehTtKxZ0iysg2TV
 51nDPAhZ369/CvCFhA1wrvQLQfHE9hyi5sctpKzmJYmKPNY96QunXQUKqfNlp57ltjBX
 04W3bCtp83zOPi5x/zPahdwrU1muZojnmnjz7kMhBE1Hlc9YWFGeqdUQcSxcY8J47jdI
 nJRQ55pvpqcBB3BqRDsxXwLv5GE5q6uWw1t37TvG/snnGG2Wc7Z7otNQf7Em3zPKfU+D
 xp9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/hYs50GwFMyuZfrImrAOFNvNLwGPKhd/4T6LtSg8+5M=;
 b=nVc7vGDKsnpd8g/tCtIdO8r0Kb3qPAfM8/KmicvTD0a1r+8P+zpC3vILwcAHEwAtVI
 mBbnne8wKs/KI/+bNXPD0fKTqd0c1SPOiSDUzniAP+5UFV/NpRAwPQaB0rIr5pVhKmb9
 abRrNT51p8AxiA0L0zHSR+xaLXo3o9ev1Hb1F9d9zqppBSevzSClYnaNzNFIRjlLqgLd
 z/GjQH1ETDc4pyUwzqgCsAgsseE4K8MPzBZWzEWKKfDU+0ldlNUueXyIBKREYmqonEgd
 VcapMdAiM4eIF3ZfvehY+rTWMkt3EnIyRhrTmRssn55XiNQIvbEpXjjA1g85Bqs/0Jm0
 El6A==
X-Gm-Message-State: AFqh2kpHg51RGjgtVbiqSzuqtoQYomMAk/mLIt9JijLTIUUgnKmWTL+f
 WGX3E+ohzXvFJkpyB/HLig2bwQ==
X-Received: by 2002:a17:907:908b:b0:846:cdd9:d28 with SMTP id
 ge11-20020a170907908b00b00846cdd90d28mr32353056ejb.30.1672870011907; 
 Wed, 04 Jan 2023 14:06:51 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 hb1-20020a170906b88100b0078d9b967962sm15694423ejb.65.2023.01.04.14.06.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Jan 2023 14:06:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>, Antony Pavlov <antonynpavlov@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Mark Burton <mburton@qti.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Leif Lindholm <quic_llindhol@quicinc.com>, Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH 14/20] hw/block: Remove unused pflash_cfi01_register()
Date: Wed,  4 Jan 2023 23:04:43 +0100
Message-Id: <20230104220449.41337-15-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104220449.41337-1-philmd@linaro.org>
References: <20230104220449.41337-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pLEErSBAHjct

We converted all caller of pflash_cfi01_register() by open
coding a call to pflash_cfi01_create() followed by an explicit
call to sysbus_mmio_map(); we can now remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/block/pflash_cfi01.c  | 19 -------------------
 include/hw/block/flash.h |  9 ---------
 2 files changed, 28 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 6a8f9e6319..9df79b102b 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -981,25 +981,6 @@ DeviceState *pflash_cfi01_create(const char *name,
     return dev;
 }
 
-PFlashCFI01 *pflash_cfi01_register(hwaddr base,
-                                   const char *name,
-                                   hwaddr size,
-                                   BlockBackend *blk,
-                                   uint32_t sector_len,
-                                   int bank_width,
-                                   uint16_t id0, uint16_t id1,
-                                   uint16_t id2, uint16_t id3,
-                                   int be)
-{
-    DeviceState *dev;
-
-    dev = pflash_cfi01_create(name, size, blk, sector_len, bank_width,
-                              id0, id1, id2, id3, be);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
-
-    return PFLASH_CFI01(dev);
-}
-
 BlockBackend *pflash_cfi01_get_blk(DeviceState *dev)
 {
     PFlashCFI01 *fl = PFLASH_CFI01(dev);
diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
index 40ba857f69..858c0a1b6e 100644
--- a/include/hw/block/flash.h
+++ b/include/hw/block/flash.h
@@ -24,15 +24,6 @@ DeviceState *pflash_cfi01_create(const char *name,
                                  uint16_t id0, uint16_t id1,
                                  uint16_t id2, uint16_t id3,
                                  int be);
-PFlashCFI01 *pflash_cfi01_register(hwaddr base,
-                                   const char *name,
-                                   hwaddr size,
-                                   BlockBackend *blk,
-                                   uint32_t sector_len,
-                                   int width,
-                                   uint16_t id0, uint16_t id1,
-                                   uint16_t id2, uint16_t id3,
-                                   int be);
 BlockBackend *pflash_cfi01_get_blk(DeviceState *dev);
 MemoryRegion *pflash_cfi01_get_memory(DeviceState *dev);
 void pflash_cfi01_legacy_drive(DeviceState *dev, DriveInfo *dinfo);
-- 
2.38.1

