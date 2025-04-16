Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3088097njc;
        Tue, 15 Apr 2025 20:45:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWrTdvkM4lzLcEEKkUQYgv5LbT8tMJsmrdkNnhHOnBHjPXWCbaxhOq4xKlvzNwt4Bimk3o+icY02NRQsg==@linaro.org
X-Google-Smtp-Source: AGHT+IEOZGmnSc1tBjOHj15wOnQWe8GJ+1PQtFSrDdluFZsvAbjd1/hLW+psC1a2TPrAWxpHC/I+
X-Received: by 2002:a05:6214:19ed:b0:6e6:591b:fa62 with SMTP id 6a1803df08f44-6f2b2f1f178mr4863966d6.5.1744775153044;
        Tue, 15 Apr 2025 20:45:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744775153; cv=none;
        d=google.com; s=arc-20240605;
        b=FcXfEHC+26U7Er8jksxrCctaHl5uZMdFUu0uTX2B9Ljti3bVx5hKp7tv5ubZvE6Y+W
         grZ2zZmMRK5GeKsEyraVJYTElumUiKEmA74bCFQh9+06eVZlcP+gZ0QgwiiQTmzRiK+/
         dZ6Y4WVbNUF6rhEH0n8JujE6GUGHpdlhMff0nZLCWvX7kOODAKFboVvjOw21R67+POcf
         E1Pq0tVnlMdV9kchZgivbCKqLQZFEo/KvGyenaMhEeF0Vp4sW+dpIXJFhF6opI6GRxzg
         0gUwDHPRNPZStKzB7LzD2Qitk07Q02dLL5Xn6UNExOSog5lYeQV91XzL2EDp51xOtSL6
         fSlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=/6CIfwqd+mAh28MpgrTUxfuHmylHmxrhkIO1ou3lsYQ=;
        fh=9slMQvAVAaDbZF94sUZsatNqTIKawFKtbOHuc7HAk0w=;
        b=eNCg9uzaaXl7y6AYgoJhPyrT+JHC4rbWnNROBy85lFI4/qse/PCPkW2ycvfCpaZVeI
         UmIsjzUd8Yse8RekaftJMChXy9j7SQy+mNMsDn4BrAuPWYsUCjGajY/B9ckiIZPBg9T8
         tdRnKfjV1Cd7oXd3lL/Zkv7BWN+gSl8DfZJ+bA6naDeCneaAjZdEz6S3Lx1jiE1+tJPZ
         Qn7z7KrWo15+66+ILCAxIzmQt9lkNPC+d8EHM74vCzRUNDxKKtRs8UjA7PkT2+wzLm64
         Zb+v+azhyunXUPq4qkILGfyQAvpwCw8CDOsW5WAbF/Wuy8PqJwV2kbNIBKj5hb+BR/Et
         lpuA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f0de9dcf73si144227766d6.245.2025.04.15.20.45.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Apr 2025 20:45:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u4tha-00029A-2L; Tue, 15 Apr 2025 23:44:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u4thQ-00026p-FT; Tue, 15 Apr 2025 23:44:32 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u4thO-00071l-BM; Tue, 15 Apr 2025 23:44:31 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 16 Apr
 2025 11:43:30 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 16 Apr 2025 11:43:30 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <nabihestefan@google.com>
Subject: [PATCH v3 10/10] docs/system/arm/aspeed: Support vbootrom for AST2700
Date: Wed, 16 Apr 2025 11:43:25 +0800
Message-ID: <20250416034327.315714-11-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416034327.315714-1-jamin_lin@aspeedtech.com>
References: <20250416034327.315714-1-jamin_lin@aspeedtech.com>
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
X-TUID: B8YqxnJlD7rL

Using the vbootrom image support and the boot ROM binary is
now passed via the -bios option, using the image located in
pc-bios/ast27x0_bootrom.bin.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
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

