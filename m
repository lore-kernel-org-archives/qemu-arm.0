Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp266243lfk;
        Tue, 16 Nov 2021 23:02:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+d14UqdD6FgHX49W0MkEMmjSNpa/G7gY57Rk+iPAg4PhjYXh2uw9jGtZYCWO5rbGRzgmW
X-Received: by 2002:a05:6122:16a3:: with SMTP id 35mr84433780vkl.11.1637132544726;
        Tue, 16 Nov 2021 23:02:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637132544; cv=none;
        d=google.com; s=arc-20160816;
        b=WNgNMbCbfGBdf+1oLDwTkY2t9e1CRFI5dwI0dfgPWIU42JfXx3DTtg5QP6gAqoTY7H
         2smdXNqJMIYplyRt/NiHVJ+MsHk6buOvpYjSgFau4V/LOcevhcyvfC6mRdlMd3hMZvaz
         7NxQFOObNlw3TAZs8Z+Q2/cbpwEHBNvg76Uit8U04tC2Asfc6DKFqCreKolIt++Dzeaz
         WtL2+t+B579Z/5x2M9aEvSB4wk/WjPLt8LmBwuZera8H8sqceZGPUxhxfxDIYH5b2PoO
         VMwEofxOY/7ztoHSSoSVUenuBoYbhkzAkHUbIfHNEB69dij1HQnyEet4Q7ZFSlDmO7kH
         1bnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=SnefBrylWy8QEKCC1c48fL6Ne7IkZGFtlVNbY45TI+w=;
        b=QOH3x4uED0PxI/QVdMrPL50PI6mpTj4hIGV/y8QTCQsLp10V9xhj4yjquuJW7+9OgM
         PgDeZExHooT/WBLRJoD9n7c7TtYVF0m7CpKsMwDeFhmSzVo7TriJh5y1fmWb699NKbor
         205w8vzeUsXb6WXoWCUP3cBxBkPWz9CYarbqKlbdHVR9uGoNQmtTzU1dJUUxTJ/oI/3r
         oecKxEV9xhvNpN9Aj4Wqc+pNSgiMmDoxR4SXR+htfNy1v8sCrKe7GF/nAzA5q/LCWo1s
         Iq9C2Fr0ylI1JQijIcg3fP//Bgl5h2Zp7C19J3ZwyLFTWLd02YRwg7OaKqd8zO4Sgj6o
         BMoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b="lnv/aa94";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 94si21135624uas.46.2021.11.16.23.02.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Nov 2021 23:02:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b="lnv/aa94";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mnExc-0000BB-07
	for alex.bennee@linaro.org; Wed, 17 Nov 2021 02:02:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mnEtb-0004wC-9G; Wed, 17 Nov 2021 01:58:15 -0500
Received: from [2607:f8b0:4864:20::435] (port=34652
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mnEtX-0005bC-PD; Wed, 17 Nov 2021 01:58:15 -0500
Received: by mail-pf1-x435.google.com with SMTP id r130so1780497pfc.1;
 Tue, 16 Nov 2021 22:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SnefBrylWy8QEKCC1c48fL6Ne7IkZGFtlVNbY45TI+w=;
 b=lnv/aa94No7ZzBhe6/kPVopKD9ueGhvP+5sHNuc6qIRU3/5U9MyZe+BXRPQroab5XI
 aqkeoZR3fvTfopcWdlw5TXC6VSPOCM7xi+s812Och+l1Hr1Ux9DTwZkDhXyQsWBPcxHR
 EZz0CMvVJputaYZfLBX3Lssg/7NMD/tYD+j2N1vj483OaTNakhi4TI3ig5OJOVrMaOnI
 Nt0UoMl6anAfFhBd64Uvr22RBYrnGWdJORWAoLnvQW1hbSlH6PGLyzDvkdFMqKMFfiSg
 gxWjN2+h//7Tz/DTTKxyY+3RM7+E+HXN3cznElYDsmYnvY49KTTAIxMJrBNhJNRGXVFb
 J5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SnefBrylWy8QEKCC1c48fL6Ne7IkZGFtlVNbY45TI+w=;
 b=hUvBFfXPBUFbM59EWlmeNAXxoRgwCoDiB6969N0IAXoyJve/52rdzgLGpA9i3/9kOZ
 TZJ5n0TwfGW7BCQyQis/2npAWUDpEj647Pg2kzqeoFCZwLXgva6vfIBbmLGTnKSozYSy
 CZNVfS0x4ThEziJbgPM7OFuOB7RWO4UdscLE+6YQiX54J1nN1PgyWQytAp+anU5CmrPo
 usSurQmxrRid24qGcqA8gJt+NcsCxduAB+rh3ceymyqFYyvYoQYu00kBSqkcHLeEWbdx
 BvGO1tj7rj40uUcnv8zYXapDdd+D+mjNvMpzCbeGTxAP9c1H7UWy/Y8Gp1UVjQzHifSF
 Uu7A==
X-Gm-Message-State: AOAM530WltRUcky7HCEJV0MK85qqO9gS5eKvCJ5M4+xH//zdzH+y37+p
 U7Q711uInrMDXYawAb5U9ZiIZZriryz+9RNx
X-Received: by 2002:a62:7802:0:b0:49f:d21e:1dc9 with SMTP id
 t2-20020a627802000000b0049fd21e1dc9mr45816508pfc.18.1637132290107; 
 Tue, 16 Nov 2021 22:58:10 -0800 (PST)
Received: from voyager.guest.fluxperth.local
 (210-10-213-150.per.static-ipl.aapt.com.au. [210.10.213.150])
 by smtp.gmail.com with ESMTPSA id d13sm21914618pfu.196.2021.11.16.22.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 22:58:09 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 3/4] docs: aspeed: Give an example of booting a kernel
Date: Wed, 17 Nov 2021 14:57:51 +0800
Message-Id: <20211117065752.330632-4-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211117065752.330632-1-joel@jms.id.au>
References: <20211117065752.330632-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=joel.stan@gmail.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xhboU31g+DD6

A common use case for the ASPEED machine is to boot a Linux kernel.
Provide a full example command line.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 docs/system/arm/aspeed.rst | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index b87697fcf0b1..6aafd611e9a5 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -78,9 +78,9 @@ Missing devices
 Boot options
 ------------
 
-The Aspeed machines can be started using the ``-kernel`` option to
-load a Linux kernel or from a firmware. Images can be downloaded from
-the OpenBMC jenkins :
+The Aspeed machines can be started using the ``-kernel`` and ``-dtb`` options
+to load a Linux kernel or from a firmware. Images can be downloaded from the
+OpenBMC jenkins :
 
    https://jenkins.openbmc.org/job/ci-openbmc/lastSuccessfulBuild/
 
@@ -88,6 +88,15 @@ or directly from the OpenBMC GitHub release repository :
 
    https://github.com/openbmc/openbmc/releases
 
+To boot a kernel directly from a Linux build tree:
+
+.. code-block:: bash
+
+  $ qemu-system-arm -M ast2600-evb -nographic \
+        -kernel arch/arm/boot/zImage \
+        -dtb arch/arm/boot/dts/aspeed-ast2600-evb.dtb \
+        -initrd rootfs.cpio
+
 The image should be attached as an MTD drive. Run :
 
 .. code-block:: bash
-- 
2.33.0

