Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp2449885njc;
        Mon, 18 Nov 2024 01:07:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXv+BaQ8vE/VWCvh6H07TPw9lrLfxMKXLvI5VQxxVSnPSPh8by4q26g47a++LtHmJGpkphH8iLi4M9Ajw==@linaro.org
X-Google-Smtp-Source: AGHT+IETgu2hXztbXArIEpvKSfcoivYrDwev7rpIz8owuUHTs0mISSdn7zCfIo5J97mWlVZ7Nbcr
X-Received: by 2002:a05:620a:4006:b0:7af:cd2f:fc00 with SMTP id af79cd13be357-7b3622c90d4mr1767304185a.27.1731920867367;
        Mon, 18 Nov 2024 01:07:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731920867; cv=none;
        d=google.com; s=arc-20240605;
        b=USYYJkXzhTRh4YJO6OVaMGFzGBOxAhS9JZa3xFIQ2+xUEJda0KZrYrmCDAPzaPwQlI
         mROkGJFkCeF+bQg3MbBhTKVfrrc2j4H6fstInYLR1Ex+1PxqQQkevQarPI3uoaXkQQP+
         3GKaiwrwBCQLOxtdDtO12H6+g9BciJEJfFrhKvLdFhANxpFqPgmQacNBt91SCrmXeusz
         omcP7Fe+D7cTME0Wthg4Je8qWzTMHvDjkJPChQ7DjR3ybp2VwfUU8MqfhmuXOVawVV3E
         5Um8tDvWIUtpjz/5Tr10kutLpSF8+RmbLOnQTtVZ2X4yTkwXox/5qb4t6x3g6SFhWkp6
         CjgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=DMEvXMTLZihxgHtCgp1xwUhel2LFnhiFqaEseM0PGiI=;
        fh=OHuPrGXU82giss3ES9S0oflYwJlLGMKYvTU1ut+5hIo=;
        b=VK0u7JM1IuEUS8E1aZRuI4ZUk+PMFd1fbCJW9NH5tJ9IdwtEfRDwUFDNDp4G19OeiN
         Bm9zCVVPvikjR82Sh8Wepej5SHXNd642n/ZueDvLmyy4PcNjvdR6e7Y7VrWIFNgZs63A
         ZJ4d7u9j4NQDmWLNurzrXt0FenvNbdmGzengz0ppLa+ZVYDMWEIRXVk0D/1v0zaH/59p
         6zhSq4Fwp3ZAzm/8UE5KsIVOdRoEbvqLvnqEVs41NYFZNaUJYpdLKMTSD7fI4pJpeP9D
         ORLPoCqYocI3GiPtJ6fh9Ntq9BwWtulc2x5ZEkLkQAzGWxkuKS8j7IMPwfXP0wsqRhBK
         EkVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gpGcSe2c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b35ca28c17si1023810985a.258.2024.11.18.01.07.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2024 01:07:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gpGcSe2c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tCxjP-0001Ji-7R; Mon, 18 Nov 2024 04:07:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tCxiv-0001IF-3d
 for qemu-arm@nongnu.org; Mon, 18 Nov 2024 04:07:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tCxiq-00080a-H0
 for qemu-arm@nongnu.org; Mon, 18 Nov 2024 04:07:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731920822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DMEvXMTLZihxgHtCgp1xwUhel2LFnhiFqaEseM0PGiI=;
 b=gpGcSe2cH4XgxAzqN/x/eqs6B5Js0swDtbQIngIVRi4i9MZRBGFUTG6iAhycQHd+Dhk6Jw
 H0MTwP3OmROmn1O9btIG1t2xzXAI0oTI+l3AbJCf5fqqkGo/admRG+wXHCgg/iiIaVx/+4
 KKxxx7PmmKEE4N8+ux3w/mnL14ntP0Q=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-76-027C0W-aPAWKCtl3bYEM5A-1; Mon,
 18 Nov 2024 04:06:59 -0500
X-MC-Unique: 027C0W-aPAWKCtl3bYEM5A-1
X-Mimecast-MFC-AGG-ID: 027C0W-aPAWKCtl3bYEM5A
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D25CD1955BCF; Mon, 18 Nov 2024 09:06:55 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.9])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 332571956089; Mon, 18 Nov 2024 09:06:50 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Jan=20L=C3=BCbbe?= <jlu@pengutronix.de>,
 Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH] docs: aspeed: Reorganize the "Boot options" section
Date: Mon, 18 Nov 2024 10:06:48 +0100
Message-ID: <20241118090648.187720-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: hRhGGZetLL0S

Add subsubsections for possible boot methods and introduce a new
section on eMMC boot support for the ast2600-evb and rainier-emmc
machines, boot partitions assumptions and limitations.

Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 docs/system/arm/aspeed.rst | 99 +++++++++++++++++++++++++++++++++-----
 1 file changed, 86 insertions(+), 13 deletions(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index cd02832a1cda..ab66ea6268fc 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -104,6 +104,9 @@ or directly from the ASPEED Forked OpenBMC GitHub release repository :
 
    https://github.com/AspeedTech-BMC/openbmc/releases
 
+Booting from a kernel image
+^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
 To boot a kernel directly from a Linux build tree:
 
 .. code-block:: bash
@@ -113,16 +116,10 @@ To boot a kernel directly from a Linux build tree:
         -dtb arch/arm/boot/dts/aspeed-ast2600-evb.dtb \
         -initrd rootfs.cpio
 
-To boot the machine from the flash image, use an MTD drive :
-
-.. code-block:: bash
-
-  $ qemu-system-arm -M romulus-bmc -nic user \
-	-drive file=obmc-phosphor-image-romulus.static.mtd,format=raw,if=mtd -nographic
+Booting from a flash image
+^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
-Options specific to Aspeed machines are :
-
- * ``boot-emmc`` to set or unset boot from eMMC (AST2600).
+The machine options specific to Aspeed to boot from a flash image are :
 
  * ``execute-in-place`` which emulates the boot from the CE0 flash
    device by using the FMC controller to load the instructions, and
@@ -133,10 +130,12 @@ Options specific to Aspeed machines are :
 
  * ``spi-model`` to change the default SPI Flash model.
 
- * ``bmc-console`` to change the default console device. Most of the
-   machines use the ``UART5`` device for a boot console, which is
-   mapped on ``/dev/ttyS4`` under Linux, but it is not always the
-   case.
+To boot the machine from the flash image, use an MTD drive :
+
+.. code-block:: bash
+
+  $ qemu-system-arm -M romulus-bmc -nic user \
+	-drive file=obmc-phosphor-image-romulus.static.mtd,format=raw,if=mtd -nographic
 
 To use other flash models, for instance a different FMC chip and a
 bigger (64M) SPI for the ``ast2500-evb`` machine, run :
@@ -168,6 +167,78 @@ In that case, the machine boots fetching instructions from the FMC0
 device. It is slower to start but closer to what HW does. Using the
 machine option ``execute-in-place`` has a similar effect.
 
+Booting from an eMMC image
+^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The machine options specific to Aspeed machines to boot from an eMMC
+image are :
+
+ * ``boot-emmc`` to set or unset boot from eMMC (AST2600).
+
+Only the ``ast2600-evb`` and ``rainier-emmc`` machines have support to
+boot from an eMMC device. In this case, the machine assumes that the
+eMMC image includes special boot partitions. Such an image can be
+built this way :
+
+.. code-block:: bash
+
+   $ dd if=/dev/zero of=mmc-bootarea.img count=2 bs=1M
+   $ dd if=u-boot-spl.bin of=mmc-bootarea.img conv=notrunc
+   $ dd if=u-boot.bin of=mmc-bootarea.img conv=notrunc count=64 bs=1K
+   $ cat mmc-bootarea.img obmc-phosphor-image.wic > mmc.img
+   $ truncate --size 16GB mmc.img
+
+Boot the machine ``rainier-emmc`` with :
+
+.. code-block:: bash
+
+   $ qemu-system-arm -M rainier-bmc \
+         -drive file=mmc.img,format=raw,if=sd,index=2 \
+         -nographic
+
+The ``boot-emmc`` option can be set or unset, to change the default
+boot mode of machine: SPI or eMMC. This can be useful to boot the
+``ast2600-evb`` machine from an eMMC device (default being SPI) or to
+boot the ``rainier-bmc`` machine from a flash device (default being
+eMMC).
+
+As an example, here is how to to boot the ``rainier-bmc`` machine from
+the flash device with ``boot-emmc=false`` and let the machine use an
+eMMC image :
+
+.. code-block:: bash
+
+   $ qemu-system-arm -M rainier-bmc,boot-emmc=false \
+        -drive file=flash.img,format=raw,if=mtd \
+        -drive file=mmc.img,format=raw,if=sd,index=2 \
+        -nographic
+
+It should be noted that in this case the eMMC device must not have
+boot partitions, otherwise the contents will not be accessible to the
+machine.  This limitation is due to the use of the ``-drive``
+interface.
+
+Ideally, one should be able to define the eMMC device and the
+associated backend directly on the command line, such as :
+
+.. code-block:: bash
+
+   -blockdev node-name=emmc0,driver=file,filename=mmc.img \
+   -device emmc,bus=sdhci-bus.2,drive=emmc0,boot-partition-size=1048576,boot-config=8
+
+This is not yet supported (as of QEMU-10.0). Work is needed to
+refactor the sdhci bus model.
+
+Other booting options
+^^^^^^^^^^^^^^^^^^^^^
+
+Other machine options specific to Aspeed machines are :
+
+ * ``bmc-console`` to change the default console device. Most of the
+   machines use the ``UART5`` device for a boot console, which is
+   mapped on ``/dev/ttyS4`` under Linux, but it is not always the
+   case.
+
 To change the boot console and use device ``UART3`` (``/dev/ttyS2``
 under Linux), use :
 
@@ -175,6 +246,8 @@ under Linux), use :
 
   -M ast2500-evb,bmc-console=uart3
 
+Booting the ast2700-evb machine
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 Boot the AST2700 machine from the flash image, use an MTD drive :
 
-- 
2.47.0

