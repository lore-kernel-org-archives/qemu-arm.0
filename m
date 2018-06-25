Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3672814wrq;
        Mon, 25 Jun 2018 04:10:00 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcL9gmvVTKOh35wxmg7rlfytr4VjZh17YGj0txVzmNqokyDPs8d/ELF4p4/JWkARnFZtKHX
X-Received: by 2002:a0c:b3d5:: with SMTP id b21-v6mr10395866qvf.80.1529925000913;
        Mon, 25 Jun 2018 04:10:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529925000; cv=none;
        d=google.com; s=arc-20160816;
        b=be47DlRj6H8SSzr4RKXtx/vBcGugpx8H6HgkfWOXoZ8Lzm/M0KX6v2ZyY+l7zETISj
         F3mYWNwL9BSagBaSrlrc/gOG8g5G0dLsW+FEA8B/0fGuba6ArMBoZwniNX4HCiV4Idpy
         XNWWs/8bQwOWHW81SnBHCoz9bckFn/PBn4TQPOLtvPtc/s5Q++x9o2DcBiGa/cnHj2D/
         glgQP1VMQH/rt6Vf/5Zqync+wA5gTC6W161uNjG3MTkKroatiO6PF7ynjlJsQrxBPjGo
         m4a1Mzfkzyu5SakBQ/awUoHhareqBbtUfDhluWSB97I60I4A8bD3RW/kETuKnu5tS/ie
         8Img==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=fmJwCA0n+2tlSymFS4qG7ex8l7G42dXskV8v/XlAzBI=;
        b=bIpaFRTzmgKPgmU3nABc5ebhb7jgWAMsbCbyW6SuUhk+Jva9/tLTD2WzV5ujJYW3o0
         /NAMTJUF0vAFOtrjufptmZ2oZ5cSxsnWpOOm0F15wMXx1cOza3o+uYeJnweI0dyA6FDn
         wCpuG8MGgPkJD+HtWosbVWLILCMDUZGEfGubWroppKRWQny2EGpBzc9rYeJXqLSMJ3Ex
         fCRmGYtuJvNAfVIJefXCj8w7L/iS31A7oMahXubQO9wnmT68flntpZeQ/WmxgG+rAUwE
         Z6bRMd9iF/5CicLhDHNGqQtQLtVvInkvuAn10GsefekKfYVmZure1E9EzOKHx15Yfc5z
         296w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Cgo87+B/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v17-v6si6766735qkg.372.2018.06.25.04.10.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jun 2018 04:10:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Cgo87+B/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45475 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXPNg-0007tu-Cr
	for alex.bennee@linaro.org; Mon, 25 Jun 2018 07:10:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53840)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fXPLT-0006jg-3p
	for qemu-devel@nongnu.org; Mon, 25 Jun 2018 07:07:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fXPLS-0003Vc-39
	for qemu-devel@nongnu.org; Mon, 25 Jun 2018 07:07:43 -0400
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:40814)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fXPLM-0003UT-Lp; Mon, 25 Jun 2018 07:07:36 -0400
Received: by mail-pg0-x243.google.com with SMTP id w8-v6so5906499pgp.7;
	Mon, 25 Jun 2018 04:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fmJwCA0n+2tlSymFS4qG7ex8l7G42dXskV8v/XlAzBI=;
	b=Cgo87+B/1q/GrBnpLKWVqUYQEeF7soVfFsulxSExF/YCKuLLi07XldbmfgM40SEs97
	/LYEWwjcxqDAqWA4fqUhWZ9V5YXDVOM+K0PSXESGBbKzb+d9L/aWd1vWdvJkVTGasp0M
	dhZdTu6PGdjdLhdj8LCr4a3wEZWESA5uN3lTJQLFcuxZPowdu1o+ZPGB7fh0v7T9hUmt
	9dOhOIO5g1MXO++7kbuwplj0bsHPHGGnxgmgW8Lra7QS8kG7iKMqPGR8mmpb+uDxL199
	7r/BFh7woX7EswvGNagDrHD72e9KuMI8UvnUQr05Rn3G9xQENhS2nKIyjBsUWODA/WCD
	xxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=fmJwCA0n+2tlSymFS4qG7ex8l7G42dXskV8v/XlAzBI=;
	b=uJ266cTPS7nSYIR+kywYvgrHacdSGxAWquS9UnT6o0+phgpsMv7C00/yL5Tds3w/Cw
	bdO9p4y10UN4JOQKfsJXAR162yViazxAwNRK+Pqp8iR7ddptnar0q2v0FO9gR+zP1jHT
	9PVbrm3V4fPxujsbVrdYqGB0RwrWvJa/WM8Pvw+B+RlTiJQbAbUBRGWVDTKjuF78+Dz7
	rdb3+u4ADN3LOFc0QBakYP94pE5N+Hlukbw47EFu7audMa1uMuPog/3ilKczzCuxsdi1
	zPAA04/K2HPx8VjHgI/bQy9OA0AOln+cje0r0byCyZ2FDlLfdokEv+7Fc1FWCONUmjqm
	fATA==
X-Gm-Message-State: APt69E3bvw2cqSE/1zL4M9uP3E1p+eEwhSBDKVNDrePrVhVfu7HHYoYm
	O2TGPeS2H3KxHBEp0RQflib1Ul+i
X-Received: by 2002:a62:701:: with SMTP id
	b1-v6mr12641476pfd.252.1529924855328; 
	Mon, 25 Jun 2018 04:07:35 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.19])
	by smtp.gmail.com with ESMTPSA id
	g10-v6sm21250360pfi.148.2018.06.25.04.07.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 25 Jun 2018 04:07:34 -0700 (PDT)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Mon, 25 Jun 2018 20:37:28 +0930
From: Joel Stanley <joel@jms.id.au>
To: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jun 2018 20:37:21 +0930
Message-Id: <20180625110721.22485-1-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-devel] [PATCH] MAINTAINERS: Add ASPEED BMCs
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OBvrnBnULtRR

This adds Cedric as the maintainer, with Andrew and I as reviewers, for
the ASPEED boards and the peripherals we use.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2874ddce6097..14bcf2ed3e3d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -644,6 +644,17 @@ M: Subbaraya Sundeep <sundeep.lkml@gmail.com>
 S: Maintained
 F: hw/arm/msf2-som.c
 
+ASPEED BMCs
+M: Cédric Le Goater <clg@kaod.org>
+R: Andrew Jeffery <andrew@aj.id.au>
+R: Joel Stanley <joel@jms.id.au>
+L: qemu-arm@nongnu.org
+S: Maintained
+F: hw/*/*aspeed*
+F: include/*/*aspeed*
+F: hw/net/ftgmac100.c
+F: include/hw/net/ftgmac100.h
+
 CRIS Machines
 -------------
 Axis Dev88
-- 
2.17.1

