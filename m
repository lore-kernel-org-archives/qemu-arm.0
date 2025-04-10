Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp8125176njd;
        Wed, 9 Apr 2025 19:40:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX0LgIsRhGWNIjSDyFqqMsb8X+K7MfsI9noCT/7ji/+GijGKHmJNjWjMMFZ3dhXJKJMq+dUt/6rhJp+UQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE9yX1BtD9I+x2ywmu/k3nAR4sEpI5edeqv8afp3hRl97qBGS8+twucpWIAWq1mik/AGH+Y
X-Received: by 2002:ad4:5dc9:0:b0:6e8:9bcd:bba6 with SMTP id 6a1803df08f44-6f0e59ff873mr20246996d6.7.1744252803667;
        Wed, 09 Apr 2025 19:40:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744252803; cv=none;
        d=google.com; s=arc-20240605;
        b=eh5xfxmafwnYmINRKDLEo/nMGsdz81FTrC7epVPYFEN7v1VoG+kRhbdIt8lqXYklxJ
         Td3+RAXjljOUQAbxVBViBTFU2txHQsPTjDfbpY3NSNzYbRnYPGXs9C6XDldDv6v8Yuuu
         FhtZeOPF0lmBAgrNS6mMrdOvSb634eZbqmjoWp3e5ynakt/9B4guiG/ZhYT8/Z3h9rHQ
         IPrYO9qXN8whvDzEjERT/bw8s/AmTE5Cfxzo4f7tvlLfIPthVVJJEoyQmkk6tF7DwWPs
         4yAzml/b95up1DCm1JsTZeMuvwsiMPGVTs3eVTSFtp539pNV3XKwHujDSNiV+s1Qu2/3
         NcTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Dw315Da7d5QI0VoNITXAWjuFYk49Uk2WaLRFs+KXVD4=;
        fh=9slMQvAVAaDbZF94sUZsatNqTIKawFKtbOHuc7HAk0w=;
        b=MJyKu34Yk0sU3I7LdS6ANo2H4tfV1AURYopgQxfAP6DuGHX1s9wcrJMGW/rRP+a4Ab
         TS0EliH2HgUi3eM2dj6F2gisjvcsT2NHKnaHbuq+Ut/uEMfX5ullXK9igyvwTNs0d8fv
         rA42VcrU3cH4O1djqH+Jgw6MZvmVCibk1+5awj79nXQSdTO+Eoj3KcJxeXYkg05i5IE/
         B5j3sEszBbYVuZRz61GjT7F/Pjo2bGbGDRV/GTBVCEDXn0rQ8xfwAIzyOZAsWZdsS5bc
         nlwfaGj90Pjeu50lTGiyhSfd71u094FUIaIps73H/XBxNZFi0iWDjN2UFD+FJMDTJL1P
         yrGQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f0de9dc7bdsi21825186d6.223.2025.04.09.19.40.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Apr 2025 19:40:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u2hpU-0001rm-AX; Wed, 09 Apr 2025 22:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u2hpR-0001qY-Gb; Wed, 09 Apr 2025 22:39:45 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u2hpN-0003Ay-0K; Wed, 09 Apr 2025 22:39:45 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 10 Apr
 2025 10:38:59 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 10 Apr 2025 10:38:59 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <nabihestefan@google.com>
Subject: [PATCH v2 10/10] docs/system/arm/aspeed: Support vbootrom for AST2700
Date: Thu, 10 Apr 2025 10:38:54 +0800
Message-ID: <20250410023856.500258-11-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250410023856.500258-1-jamin_lin@aspeedtech.com>
References: <20250410023856.500258-1-jamin_lin@aspeedtech.com>
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
X-TUID: Qr1BoH7m9haI

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

