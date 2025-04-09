Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp7603117njd;
        Wed, 9 Apr 2025 03:04:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXORSHF3cizIhJ7sQpOD7xMvNQ6xFUXg7nk+hGDnzzgslFDd/JqyNseumBWH6AJXhLHlo+bfwACoUPIzg==@linaro.org
X-Google-Smtp-Source: AGHT+IE+Plu6tcS8QkKBmoSRvf+B6GiZ3ePmuMpC6g/6syPamrnDbzAxJi5gH7LR3iK2vSggzxuM
X-Received: by 2002:a05:6214:1d0d:b0:6d4:1425:6d2d with SMTP id 6a1803df08f44-6f0dbc75b30mr33457066d6.43.1744193054779;
        Wed, 09 Apr 2025 03:04:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744193054; cv=none;
        d=google.com; s=arc-20240605;
        b=clNWxLsJrEXriR8WLuUmYI2fIQ4LbrStJV+/UDmG4zdGRrCaqaojcHLELEwqNFE8is
         69IBcxnTnxXocx+YMc9D1QuhrsaBLroU8pkSL8e4sd18n6yeeXHepTHs04hrXqsKE2mA
         h5iH+ZFEjdSCwxFWUYNHbuT2VOKYAItX8NDNNNrDelJovTXaV8uNKNeuAlZkUMGGzEK7
         KJnh150uqx9oulDE7yv60GzGQ2HdImIP5obFUzGWP8un9k0h4dxR6bJtPGcIIYIt6/Ke
         aT0t551Eu1t/VGhOBIM5A3FcdsxQAConQp2CH8m+F0IbvdbJJeoZJDy/w++/BZ52/BzD
         r4bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Dw315Da7d5QI0VoNITXAWjuFYk49Uk2WaLRFs+KXVD4=;
        fh=9slMQvAVAaDbZF94sUZsatNqTIKawFKtbOHuc7HAk0w=;
        b=gZH3w5U2T4C4b5VRN5fU+ftQZEGIG/pcIsxsZsgBYMqbRPwn1V+mu0h2vDOw/xq/jA
         eIu2HUcqTinUSn9FgJucY4sLZmC1CuhZK98Wn0AqgoG4vP1QJpBV83PoC46Y97d4Exwt
         qexc25Mny/6VeLQrE6KZU02h+gX5+V+tvB9nkqkMW9Y5+H2LlRRQ40yvmMJQcfHIsGB2
         LZK3hwX9vePLFlW2vPp/LQ1R6hn4Cy6XvXyA6hJxoDm9myhZEx/sHfGhAkFI8Pe0b6Mw
         C3ppAPLXDurgTOO/PlY5V+2mGNKlNs9k5wKo/hcd1vdpw3jZpAISLxsQssHg0MrkhmAs
         gG8Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f0de970db8si7431386d6.107.2025.04.09.03.04.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Apr 2025 03:04:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u2SFH-00078t-Oa; Wed, 09 Apr 2025 06:01:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u2SFA-00072g-U5; Wed, 09 Apr 2025 06:01:18 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u2SF9-0006jO-Dl; Wed, 09 Apr 2025 06:01:16 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 9 Apr
 2025 18:00:42 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 9 Apr 2025 18:00:42 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <nabihestefan@google.com>
Subject: [PATCH v1 9/9] docs/system/arm/aspeed: Support vbootrom for AST2700
Date: Wed, 9 Apr 2025 18:00:37 +0800
Message-ID: <20250409100039.2391847-10-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409100039.2391847-1-jamin_lin@aspeedtech.com>
References: <20250409100039.2391847-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZKYZsqY8xYIe

Using the vbootrom image instead of manually loading boot components with
-device loader. The boot ROM binary is now passed via the -bios option,
using the image located in pc-bios/ast27x0_bootrom.bin.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 docs/system/arm/aspeed.rst | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 97fd6a0e7f..dfa8e6b4c6 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -250,24 +250,14 @@ under Linux), use :
 Booting the ast2700-evb machine
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
-Boot the AST2700 machine from the flash image, use an MTD drive :
+Boot the AST2700 machine using a flash image, with an MTD drive and
+the virtual boot ROM :
 
 .. code-block:: bash
 
-  IMGDIR=ast2700-default
-  UBOOT_SIZE=$(stat --format=%s -L ${IMGDIR}/u-boot-nodtb.bin)
-
   $ qemu-system-aarch64 -M ast2700-evb \
-       -device loader,force-raw=on,addr=0x400000000,file=${IMGDIR}/u-boot-nodtb.bin \
-       -device loader,force-raw=on,addr=$((0x400000000 + ${UBOOT_SIZE})),file=${IMGDIR}/u-boot.dtb \
-       -device loader,force-raw=on,addr=0x430000000,file=${IMGDIR}/bl31.bin \
-       -device loader,force-raw=on,addr=0x430080000,file=${IMGDIR}/optee/tee-raw.bin \
-       -device loader,cpu-num=0,addr=0x430000000 \
-       -device loader,cpu-num=1,addr=0x430000000 \
-       -device loader,cpu-num=2,addr=0x430000000 \
-       -device loader,cpu-num=3,addr=0x430000000 \
-       -smp 4 \
-       -drive file=${IMGDIR}/image-bmc,format=raw,if=mtd \
+       -bios ast27x0_bootrom.bin \
+       -drive file=image-bmc,format=raw,if=mtd \
        -nographic
 
 Aspeed minibmc family boards (``ast1030-evb``)
-- 
2.43.0

