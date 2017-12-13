Received: by 10.223.159.74 with SMTP id f10csp5305145wrg;
        Wed, 13 Dec 2017 08:52:36 -0800 (PST)
X-Google-Smtp-Source: ACJfBovfpkznjpA/lP1abot9tx6WLamvbZ76Sard53djToar2Bm/im1F63cJyVUDLP4VFfdB3Rh3
X-Received: by 10.129.56.137 with SMTP id f131mr2216765ywa.139.1513183956536;
        Wed, 13 Dec 2017 08:52:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513183956; cv=none;
        d=google.com; s=arc-20160816;
        b=vB+jg21KVyaxJkXRD0vpVWNDw7HASccq6ltnnJ5VPg4JcZ6E5lZgTqBfyitRmGmTGP
         TZx/TwkW/Vt2/0Rtr4zDqxlCRrFJhj8mXHyWqr/eLwZLbOwFmc3uABbZ6DrjSh9nhAnc
         3ZYURgiAoagtmk/VQ2mcM7OZEax2wRySdwFW1A3HpBteJb1UlXueRZ0+sOxToG1SfvD+
         /AwkkrSF+qOOEsyV1e/8sVS5L7FugLt/7J+TlbgXzRNXvUjFjfXELmhKTGG2xf7g34cx
         CKiA2BcjuUVTYajomK51d6VGHvSVNcjtBs9uOZR/J6VbhH8XQNWIMgRmWnv1HAkgXdsC
         2BcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=atr9yCp/Md5RszuVdOdNq/gI9r5SqrZ3jgZqOg15ioc=;
        b=tAamkzs0uMdoqVLlFSDEZuktjjIGcX6HrC3yKEozQYx8nYY2u44AmVOTo6gFu3AXv8
         oxmAO37HvsZZrazEMierADe+yq6M6YBGDx+tnZsqCimlrg+s8j4Dwu1QXm2pM0LrHIfp
         XxRlV3G3U9AMLnoVG0a0NIiwH0tAE0wnIX5uYAc76s6qwiLc4i+qWrd/JFeMAAyDH3il
         mN+D9UycAgZApVKKG5QoW5h5bKv+/qk6YbYNM3gkunFbn5MDVX5cCiUTPnwrkazKReBh
         u1gCkvb+c3+n9gwHU1YrUtzAO2vfb7YKAabXSEY0IsOG7u6N6RZrU6oRA9IYSDB7IwXv
         FbAA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p3si407257ybk.772.2017.12.13.08.52.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Dec 2017 08:52:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36307 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePAGp-0002Km-VM
	for alex.bennee@linaro.org; Wed, 13 Dec 2017 11:52:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59360)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ePAGg-0002Ir-57
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 11:52:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ePAGf-0004Gn-FN
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 11:52:26 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:39072)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1ePAGf-0004Ee-8h; Wed, 13 Dec 2017 11:52:25 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ePAGc-0007OC-Qj; Wed, 13 Dec 2017 16:52:22 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed, 13 Dec 2017 16:52:19 +0000
Message-Id: <1513183941-24300-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 0/2] GICv2 & GICv3: RAZ/WI reserved addresses
 rather than aborting
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Laszlo Ersek <lersek@redhat.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YzgLLofQnFup

The GICv2 and GICv3 specifications say that reserved register
addresses should RAZ/WI.  This means we need to return MEMTX_OK, not
MEMTX_ERROR, because now that we support generating external aborts
the latter will cause an abort on new board models.

In particular, at least some versions of UEFI try to
access a reserved address in the GICv3 redistributor
(at SGI_base + 0x184) and fail to boot on the virt board
without this.

thanks
-- PMM

Peter Maydell (2):
  hw/intc/arm_gicv3: Make reserved register addresses RAZ/WI
  hw/intc/arm_gic: reserved register addresses are RAZ/WI

 hw/intc/arm_gic.c              |  5 +++--
 hw/intc/arm_gicv3_dist.c       | 13 +++++++++++++
 hw/intc/arm_gicv3_its_common.c |  8 +++-----
 hw/intc/arm_gicv3_redist.c     | 13 +++++++++++++
 4 files changed, 32 insertions(+), 7 deletions(-)

-- 
2.7.4

