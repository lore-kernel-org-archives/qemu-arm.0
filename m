Received: by 10.223.150.237 with SMTP id u100csp2418411wrb;
        Thu, 9 Nov 2017 04:04:41 -0800 (PST)
X-Google-Smtp-Source: ABhQp+Tb3sS1DlEt+rcaQKnxhS/mVZDFv5mID8Ukq1WiW04FEwxpl6a/cEgenJInU8OcWTyBqRnZ
X-Received: by 10.129.108.203 with SMTP id h194mr145026ywc.348.1510229081232;
        Thu, 09 Nov 2017 04:04:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510229081; cv=none;
        d=google.com; s=arc-20160816;
        b=MqcF1qv9Rvc2DXoCVMJkIEILpWLY5flQL7Md76/uMWYr4dMfH3i7UPvLYMz0llxyjL
         ak2It2y8uPro6EEz1UP+1E720OfPqyCNx5hg20RTFH4+alK9/i4EMG5u/sPf8djvkr28
         WbYUBH+n8SZ1wve/InyaJsl32FkX9gN9rYs+NmHhhN2H+6x+qyctbdmIOV/ymHNpttSN
         BufGA6shsO8CDrzfPNxIz6QCbKtELsO+kVlWt0UtkRVKwe8vijnM4vcvLWFsb2B0exrL
         Rul7/gcrGN75r2V1LqPEHWJZf9lw3B3qSkF1L3iWQwZdyRmf9gcjuIEc8/ypvXvW2eV2
         Vgeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=PYfSYSqAbL6li02R1AMgOwzryBOgd2Xh+tOe4bhTjuc=;
        b=QJbQKpj4OeYQJ4yjMjgHnA+oCFmxtlsMBCqbRJ450YOkGKOkbgNr+5qhiJsFr/zaPT
         kOSYs1o/sDy1TlCDqT40/2aMG+QIClIgJo/VJ9SbZUwawIi2w9Fj+ofFIc8xpilSY/AY
         P35CO+mo8nvLwsmUw5xrsu0WZSIvuNasKa09NSL9OtdIVycaU4q8813UXyn217OvWS6L
         c1xp1WXWG3ECGTqgQyD6jjYGSuhoRPzOQq1p+g870cGwEJzR4hkcPvWZ/GLVHg8NBJgV
         8K+VtKrXwz94GtFTEH2rPjjrsi6U3xkFH6/Q4Ch5vWNxYSk7j0lJ7dEtA6berIjW1IIQ
         awRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eC/qQD1R;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q205si514715ybq.787.2017.11.09.04.04.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Nov 2017 04:04:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eC/qQD1R;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36401 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eClZY-0006bO-Nz
	for alex.bennee@linaro.org; Thu, 09 Nov 2017 07:04:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49718)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1eClY7-0005uz-EQ
	for qemu-devel@nongnu.org; Thu, 09 Nov 2017 07:03:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1eClY1-0005vg-KP
	for qemu-devel@nongnu.org; Thu, 09 Nov 2017 07:03:11 -0500
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:55348)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1eClY1-0005vT-DO; Thu, 09 Nov 2017 07:03:05 -0500
Received: by mail-pf0-x241.google.com with SMTP id 17so4091949pfn.12;
	Thu, 09 Nov 2017 04:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=PYfSYSqAbL6li02R1AMgOwzryBOgd2Xh+tOe4bhTjuc=;
	b=eC/qQD1RoKmDqHOWmV6gZ41C19pzUOBESc/7Jht5yelXLamwGraTn7EVNIvEVfiDO8
	wjcs4Pql+WPHOF7gbmvZtsMaj/7pNjKDZ5TKr9Rz0ojUaPpe/ZiZuhrpM+fWilpezvJ7
	oDw+avRoXFE3bMCIVwvdECRTlXJYZ9tSxD9U7jz5XqTibgEn6DS/n50pbrIgp2dVLdbp
	LzSpUCubfn3WClXDW0LaZrOb5uWiPiUBS8/qQaktCOgivWicoh/lqOJl/obtIbI0y7Mo
	yQa0QBRViREurke/huXOtXoxNXrB1488Q67IjQvIi3PqqhGpZh4/AQqtyivPx3mRYjGq
	SxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=PYfSYSqAbL6li02R1AMgOwzryBOgd2Xh+tOe4bhTjuc=;
	b=E5s87QC9HDbqPP0OPhUjcdeZ2MDQyiYrnLf6vkp7snxjsBSRFoZiZmbw/ZHC3OH1ox
	UgL0U1htZBigSXIC7Q1t5EOE0C9YpKwUhjaT+FwGZKtvyD6jj30VicC2FQdR69Gs974o
	SvFZ3FE4LxHGX5/vSgH2g044FvsILBtGBRTF5l4MBjuysFBXpF5QjnrpAGQlFthZrtcA
	afaJVPrzAcaTD8eyMweK3CwnmGW4C1iEHeZRNqOEWxnOe0Et5RHFQ13aA8vaePOW8icU
	RNUs5gc5MAk9P39bl6+x7MLAfE/QhzoThaJ6wa4yL4btMjfSk5vEuI0RSUxDCiOynzUY
	kv2Q==
X-Gm-Message-State: AJaThX6wOyTaPDACjmGYngA88unTnY/GPlYM17AuY6ozIwN8C+mQ+Klw
	jGWgQkGPl7H0BGVShtazIUETPw==
X-Received: by 10.98.196.93 with SMTP id y90mr282505pff.34.1510228983504;
	Thu, 09 Nov 2017 04:03:03 -0800 (PST)
Received: from localhost.localdomain ([183.82.198.40])
	by smtp.gmail.com with ESMTPSA id
	j12sm14130684pfe.160.2017.11.09.04.03.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 09 Nov 2017 04:03:03 -0800 (PST)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Thu,  9 Nov 2017 17:32:51 +0530
Message-Id: <1510228971-6005-1-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-devel] [Qemu devel PATCH] MAINTAINERS: Add entries for
 Smartfusion2
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	f4bug@amsat.org, alistair23@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZEKeXKcFygbe

add voluntarily myself as maintainer for Smartfusion2

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
---
 MAINTAINERS | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0cd4d02..dae08bd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -564,6 +564,23 @@ M: Alistair Francis <alistair@alistair23.me>
 S: Maintained
 F: hw/arm/netduino2.c
 
+MSF2 SoC
+M: Subbaraya Sundeep <sundeep.lkml@gmail.com>
+S: Maintained
+F: hw/arm/msf2-soc.c
+F: hw/misc/msf2-sysreg.c
+F: hw/timer/mss-timer.c
+F: hw/ssi/mss-spi.c
+F: include/hw/arm/msf2-soc.h
+F: include/hw/misc/msf2-sysreg.h
+F: include/hw/timer/mss-timer.h
+F: include/hw/ssi/mss-spi.h
+
+MSF2 SOM board
+M: Subbaraya Sundeep <sundeep.lkml@gmail.com>
+S: Maintained
+F: hw/arm/msf2-som.c
+
 CRIS Machines
 -------------
 Axis Dev88
-- 
2.5.0

