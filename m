Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp511691njk;
        Wed, 16 Apr 2025 20:13:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUadpDuK/G3JojJft30rgP9i3JPlRqpMWlo2i17Vppg3KA9EEbQDhNz5g3hJB4ui3uCkUZMOKU7Ee8c6w==@linaro.org
X-Google-Smtp-Source: AGHT+IGjMYmiovh/l6h3K1rdLaW5joMJBoPv1+fCKV319KV97E2JcYebopHbU4VWZ0lhhS9z9Baq
X-Received: by 2002:a05:622a:206:b0:476:6215:eb08 with SMTP id d75a77b69052e-47ad80b4f60mr62077811cf.22.1744859632348;
        Wed, 16 Apr 2025 20:13:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744859632; cv=none;
        d=google.com; s=arc-20240605;
        b=dgIiNki/mCchz7P6qrDnGepdgGH3dWAechB8pPLDXko4xbOlWkDsKoN1jMpxDA/QE2
         4FH9Fe6FsbrYu8x4u4r8Cf5gSuCj39DJfC0CfzFqU2OyEAdiRlEWAVjkFyQWYdVeEx7o
         /sJ1UIRjxWKqlw6WKlzAqehZWggv1ssDmXde9utlllTUT67mPyzIYHtGN3CSqpAu+gVL
         SiXivhYwLHFbaRyTiWTcKs5I9tAcBVIB1CL/GxkThkKXV1tR4TLVqabx6G6PoxnqPUXr
         Gbx9s26LyHS6Xi2r+XdeaxPmiABV/BvK5Cqu6/RkrfjAtSYOIV8hZxtyEuB5q/kKGQN2
         jBLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=68mIN1Ba++d+8hEQSFZIi0sknA38lg+ZW2aly5w7hDw=;
        fh=9slMQvAVAaDbZF94sUZsatNqTIKawFKtbOHuc7HAk0w=;
        b=S0oN1fng1nLaOm+7oAO9KuVb3tEZWVrVdHJdX06czI3FzufA9esC9scboL/ZLXVoWf
         EBpO0D+KGGV2+1OF01U2vlRliLx9oZcJYAod5q0BfQnMzD21enhcSlGEyiDpHyGiCHTC
         /9x2iHPGS0d7mZ5c9FVdXwqzun2Mfdt4f0L2tgD43O2f/x2c621J2kVj5v4fbiNb8V9w
         S0CHxu5LeepkT7a7gJzuPyYArYn5XDQAMlt5bjOM1Vu1uMV/p+8Ps1EH1mSggjFVf9ll
         rlEJ1cdOWDfzkUAj7M9VqmTpJeIEWM0msZbqmWCH4ihT3lCW7Vxb4FEvixWlgrciCRzE
         DT8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4796ee10f91si153838201cf.624.2025.04.16.20.13.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Apr 2025 20:13:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u5FgU-0001i3-Hr; Wed, 16 Apr 2025 23:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u5FgE-0001KY-UI; Wed, 16 Apr 2025 23:12:47 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u5FgD-0000cO-8Q; Wed, 16 Apr 2025 23:12:46 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 17 Apr
 2025 11:12:13 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 17 Apr 2025 11:12:13 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <nabihestefan@google.com>
Subject: [PATCH v4 10/10] docs/system/arm/aspeed: Support vbootrom for AST2700
Date: Thu, 17 Apr 2025 11:12:07 +0800
Message-ID: <20250417031209.2647703-11-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417031209.2647703-1-jamin_lin@aspeedtech.com>
References: <20250417031209.2647703-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: Uq22XJlqxH5Q

Using the vbootrom image support and the boot ROM binary is
now passed via the -bios option, using the image located in
pc-bios/ast27x0_bootrom.bin.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Nabih Estefan <nabihestefan@google.com>
---
 docs/system/arm/aspeed.rst | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 97fd6a0e7f..c87a2cf796 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -250,7 +250,14 @@ under Linux), use :
 Booting the ast2700-evb machine
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
-Boot the AST2700 machine from the flash image, use an MTD drive :
+Boot the AST2700 machine from the flash image.
+
+There are two supported methods for booting the AST2700 machine with a flash image:
+
+Manual boot using ``-device loader``:
+
+It causes all 4 CPU cores to start execution from address ``0x430000000``, which
+corresponds to the BL31 image load address.
 
 .. code-block:: bash
 
@@ -270,6 +277,26 @@ Boot the AST2700 machine from the flash image, use an MTD drive :
        -drive file=${IMGDIR}/image-bmc,format=raw,if=mtd \
        -nographic
 
+Boot using a virtual boot ROM (``-bios``):
+
+If users do not specify the ``-bios option``, QEMU will attempt to load the
+default vbootrom image ``ast27x0_bootrom.bin`` from either the current working
+directory or the ``pc-bios`` directory within the QEMU source tree.
+
+.. code-block:: bash
+
+  $ qemu-system-aarch64 -M ast2700-evb \
+      -drive file=image-bmc,format=raw,if=mtd \
+      -nographic
+
+The ``-bios`` option allows users to specify a custom path for the vbootrom
+image to be loaded during boot. This will load the vbootrom image from the
+specified path in the ${HOME} directory.
+
+.. code-block:: bash
+
+  -bios ${HOME}/ast27x0_bootrom.bin
+
 Aspeed minibmc family boards (``ast1030-evb``)
 ==================================================================
 
-- 
2.43.0

