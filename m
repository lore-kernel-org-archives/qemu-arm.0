Received: by 10.223.172.38 with SMTP id v35csp3338264wrc;
        Fri, 22 Sep 2017 10:14:05 -0700 (PDT)
X-Received: by 10.237.62.59 with SMTP id l56mr8891649qtf.261.1506100445007;
        Fri, 22 Sep 2017 10:14:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506100445; cv=none;
        d=google.com; s=arc-20160816;
        b=YCWjgfmXCyw5dahFWGSlwcyCFaIsq5U3dTD7DioVarYyZP631K9eLIUG6/fj19jNWJ
         tD1qgPdm2nu8Voxur6NFS8n8j2sDU0WzNC0l68s/oon5IfNI8m1SGORHzIkFC/V2pv/G
         39koa14XQdd55UNJNuRpxWAew8vHsUwnGtmcTZvqIlNggFIFtvv+xYS3+2zKXtxfxQyF
         L7aXe8iVXjRyIWSus2+2WsmxlWBUvwD5Pi+5gBPF7je/+MreFYwMkyjg5EqH7Ojtnpv6
         v6BSclwX5IaAzqdVhJ1QQHUFPwJfBorFKnZaFv29vsRiNG/ZY6GhYIT9pX5ALkEj/cpW
         x0Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=HFwOjg6YR/R6xJ5Mu0xtDj0n4+kQctxlilxZAMp0zL0=;
        b=WvmetW57W60H14qWczjltVZt6zD+laSRsziTwP6JjrMqg5EZbLWZoM84+UnDbeJz/+
         w3G8F+H0ZMHAY+PukSYAR4oAQ2pItbF/f/Pz989gWzGe52UVB6PzTeRRbcFXglaSscah
         IGERI2iouoBM8Ms0xMN/rxBwypcUAGLb5xYI2Bm3a8v8kIRbp66WHX+45q4utFNUXMu3
         8qNKge70aWsMZDj/IFVBkfqL1/vAXJb9+KCxzN0ZPKQgFQ60WGKKDhasni0oyBTGa8tu
         mEeIMpppk3iJkCNoqhqEebc3iQ4Z6DUPIJcZ70WgdToOKYckS8R6mqrbb+WT1PUB77C2
         z6Ug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vY1Eilr5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t2si227250qkf.128.2017.09.22.10.14.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Sep 2017 10:14:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vY1Eilr5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60280 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dvRWc-0003Rq-IH
	for alex.bennee@linaro.org; Fri, 22 Sep 2017 13:14:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59355)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvRWM-00039v-RD
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 13:13:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvRWL-0003RF-U4
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 13:13:46 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:37390)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvRWH-0003L5-IY; Fri, 22 Sep 2017 13:13:41 -0400
Received: by mail-qt0-x243.google.com with SMTP id u48so1044838qtc.4;
	Fri, 22 Sep 2017 10:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HFwOjg6YR/R6xJ5Mu0xtDj0n4+kQctxlilxZAMp0zL0=;
	b=vY1Eilr5lguqaVdsXVKVfbX4s0k306AAlEhrJGYXtobOt0ZSsTdnJTJcO3zw5YlrDK
	lv8a1OcUv0HQ4IbcfFLTvUrbWuSFSsboW4CTaaUlfj94PHBmrtH/X5uNENjbDq31RK7H
	dqq2n81cHQ4fz+UfmWdq7pJkOFk4St8InSb107ys5TPO5EXX7HF3S/sJ2oAtKjnq8pqD
	WXsnNRos5ph5SCwcgLICRUW4b3nYax6h7BDth7m2O3n3FCGK4Pxpcp57Rph1L+CUbCTf
	0L9BhmBOCvlcjH/CU+aeviHBXKvttkRfIeY6FL3Xp4pGVFAgYXcSNlnb/5fCSXcSOA6s
	7byQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=HFwOjg6YR/R6xJ5Mu0xtDj0n4+kQctxlilxZAMp0zL0=;
	b=E2aW6elBmPyVpsPHyKhuyBBMGGXxeNorm4cVRY1Iw5SXwWrQ13z+In8cfRGvCr5Pl8
	Gn079+yA4O5vX2Lz2/Ab4g58dXTwKg5/yi8skKHSUG1CetUdkRhUq9a2x0GWIUAxe1gK
	RukHkLCwNx0HKWLypA4MVlw6OCCcD9Oz9+JiQbJlcEz23wZmkYlt0r/sCJ22prDOnnTB
	RSAbSlLWMjamEVCb/Eu6xevykZ/WcdcLEUnxPopXTtWo3lkkPJ6bPgOr4bhXRDFicx+f
	AvCghDWG4HjpgIxwkeTYrNBrbgNNprH1zPg1EeYZtEty5zgOdnOkEH0RPVCWzmgFJN5x
	HArQ==
X-Gm-Message-State: AHPjjUhJJizKv+Y4c8hXSjf4KWhBdB4/KVPliBD9+qRatB1CVr/vxPDt
	Zrr4nqE6zACLGzZO1WfJ5jU=
X-Google-Smtp-Source: AOwi7QBrTYCYJBMpbQDuhjPd59ZtaBZQVoKHtwR5NJIYfhqd3aQoG7z00sUEjJDEJwYoWxCMhXoSSg==
X-Received: by 10.200.9.115 with SMTP id z48mr9357031qth.141.1506100418650;
	Fri, 22 Sep 2017 10:13:38 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id f69sm238468qke.27.2017.09.22.10.13.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 10:13:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Grant Likely <grant.likely@arm.com>, Jason Wang <jasowang@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 22 Sep 2017 14:13:16 -0300
Message-Id: <20170922171323.10348-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-arm] [PATCH v5 0/7] Generalize MDIO framework
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
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MGylT96mkfcT

Hi,

I have a follow up series using multiples PHY on the MDIO bus based on this
series.

Regards,

Phil.

Grant's previous work:
http://lists.nongnu.org/archive/html/qemu-devel/2013-02/msg00257.html

"There is more work to be done, particularly in moving to the common GPIO api,
 but that work can be done as a follow on patch series."

Grant Likely (7):
  hw/mdio: Generalize etraxfs MDIO bitbanging emulation
  hw/mdio: Add PHY register definition
  hw/mdio: Generalize phy initialization routine
  hw/mdio: Mask out read-only bits.
  hw/mdio: Refactor bitbanging state machine
  hw/mdio: Add VMState support
  hw/mdio: Use bitbang core for smc91c111 network device

 include/hw/net/mdio.h   | 124 +++++++++++++++++++++
 hw/net/etraxfs_eth.c    | 291 +-----------------------------------------------
 hw/net/mdio.c           | 280 ++++++++++++++++++++++++++++++++++++++++++++++
 hw/net/smc91c111.c      |  27 ++++-
 hw/net/xilinx_axienet.c | 189 +------------------------------
 hw/net/Makefile.objs    |   2 +
 6 files changed, 438 insertions(+), 475 deletions(-)
 create mode 100644 include/hw/net/mdio.h
 create mode 100644 hw/net/mdio.c

-- 
2.14.1

