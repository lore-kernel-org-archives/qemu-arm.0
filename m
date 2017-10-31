Received: by 10.223.161.27 with SMTP id o27csp3865193wro;
        Tue, 31 Oct 2017 08:47:05 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+QKqhY1hGwpkmSAIqmffqktKUfBt9OelLEt1xcMcAEriWN5yJyTbmDBqluCmLI4ZG/TkFWd
X-Received: by 10.129.47.10 with SMTP id v10mr1518160ywv.332.1509464825853;
        Tue, 31 Oct 2017 08:47:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509464825; cv=none;
        d=google.com; s=arc-20160816;
        b=mPugDzcHb6bGIjt/Dq7wxYiHOF+ujeCLvGT6l/T3f7h5ChcFSKRBYcg9rCjsMu9CP3
         7zaK7KFRRyNVjTIgm+MytpKUOSrantEm2bYSf1AZkA01E/mymcldpxZQonfLqlFWIHts
         dF1h8nhXo1i2YGng/0hfqdKM8T5k1Lek05OmDcTxz1GAUoGRrBREyN83EDXtZmb0GD2d
         wq+443PdU/rghmwK6BwOHIneu+r7guTSTGrfRZ4yfetHKGnjNeaSLCOs2rLzh9cywGJY
         EcN56+6MrUJ8KedqrEI6Ju8OwH07ubb/NsonqkPKCVDSnlC9mwVTsV6kwAyX1KIgjNte
         Goyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from:arc-authentication-results;
        bh=2W3aRvDM0CCXsyy6mbDlZ8aNonyF8DxiPkryjJm+YX8=;
        b=IE/QQO0Zxnr6CYXKRd3WW7k3Q7wJJ7AFIXH0/rslJ3T23WBS79YXTAZWgoI2RN+Kyj
         jFwziBELGmiI9stv5twMn7pqOB6HV2+gSsT/5OPrsmiVdsr9J3MFCZV041hq4V+zoPd1
         aNCs1rpxzIc0KgcPMsunq3jD0paI5TDY/XIEhchb2e3AEBwX8mBuIi9olSLz5YPHwBUp
         gc5dmvSlZ8+BGEEmv8t0B9trUUpa53SmwMeOlHaT5hSGRn2MPncLWM0JgWe+UJYDKYZ3
         x75FawYCSoH9w+JEK1MX5dVEwHvDyoAu1NfWT8BbvdmyB7QIRfurVvEzKuOh8tg8P4LS
         T6OA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x67si476388ybh.444.2017.10.31.08.47.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Oct 2017 08:47:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46276 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e9Ykr-0002Ga-9f
	for alex.bennee@linaro.org; Tue, 31 Oct 2017 11:47:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46809)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Michael.Nawrocki@gtri.gatech.edu>)
	id 1e9YjS-0001TB-LO
	for qemu-devel@nongnu.org; Tue, 31 Oct 2017 11:45:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Michael.Nawrocki@gtri.gatech.edu>)
	id 1e9YjP-0007QU-J1
	for qemu-devel@nongnu.org; Tue, 31 Oct 2017 11:45:38 -0400
Received: from relay2.gtri.gatech.edu ([130.207.199.168]:52289)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Michael.Nawrocki@gtri.gatech.edu>)
	id 1e9YjP-0007P6-Em
	for qemu-devel@nongnu.org; Tue, 31 Oct 2017 11:45:35 -0400
X-ASG-Debug-ID: 1509464733-0768e41b30561b30001-jgbH7p
Received: from jekyll.core.gtri.org (jekyll.core.gtri.org [10.41.1.48]) by
	relay2.gtri.gatech.edu with ESMTP id zne1CpSGWAc8IOA7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128
	verify=NO); Tue, 31 Oct 2017 11:45:33 -0400 (EDT)
X-Barracuda-Envelope-From: Michael.Nawrocki@gtri.gatech.edu
Received: from tybee.core.gtri.org (10.41.1.49) by jekyll.core.gtri.org
	(10.41.1.48) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1034.26;
	Tue, 31 Oct 2017 11:45:33 -0400
Received: from tia-mxn-d01.ctisl.gtri.org (130.207.205.130) by
	tybee.core.gtri.org (10.41.1.49) with Microsoft SMTP Server
	(version=TLS1_2, 
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1034.26;
	Tue, 31 Oct 2017 11:45:32 -0400
From: Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>
To: <qemu-devel@nongnu.org>, <qemu-block@nongnu.org>, <qemu-arm@nongnu.org>,
	<qemu-ppc@nongnu.org>
Date: Tue, 31 Oct 2017 11:44:05 -0400
X-ASG-Orig-Subj: [PATCH 0/2] Add 8-byte wide AMD flash support,
	partial interleaving
Message-ID: <20171031154407.4184-1-michael.nawrocki@gtri.gatech.edu>
X-Mailer: git-send-email 2.14.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [130.207.205.130]
X-ClientProxiedBy: apatlisdmfe4.core.gtri.org (10.41.47.104) To
	tybee.core.gtri.org (10.41.1.49)
X-Barracuda-Connect: jekyll.core.gtri.org[10.41.1.48]
X-Barracuda-Start-Time: 1509464733
X-Barracuda-Encrypted: ECDHE-RSA-AES128-SHA256
X-Barracuda-URL: https://130.207.199.168:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at gtri.gatech.edu
X-Barracuda-Scan-Msg-Size: 973
X-Barracuda-BRTS-Status: 1
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=1000.0
	QUARANTINE_LEVEL=1000.0 KILL_LEVEL=1000.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.44359
	Rule breakdown below
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 130.207.199.168
Subject: [Qemu-devel] [PATCH 0/2] Add 8-byte wide AMD flash support,
 partial interleaving
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
Cc: kwolf@redhat.com, Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>,
	magnus.damm@gmail.com, alistair.francis@xilinx.com,
	michael@walle.cc, jan.kiszka@web.de, edgar.iglesias@gmail.com,
	mreitz@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bpTLB+wkewE9

This patch set does a few things. First, it switches the AMD CFI flash MMIO
operations from the old MMIO API to the new one. Second, it enables 8-byte
wide flash arrays. Finally, it supports rudimentary interleaving of notional
flash "chips". It is expected that commands will be sent to all "chips"
simultaneously. See the example in the second patch for more details. This
behavior is used by drivers for the PPMC7400 PowerPC evaluation board.

Mike Nawrocki (2):
  Add 8-byte access to AMD CFI devices
  Add support for flash interleaving of AMD chips

 hw/arm/digic_boards.c    |   2 +-
 hw/arm/musicpal.c        |   4 +-
 hw/arm/xilinx_zynq.c     |   2 +-
 hw/block/pflash_cfi02.c  | 210 ++++++++++++++++++++++++++---------------------
 hw/lm32/lm32_boards.c    |   4 +-
 hw/ppc/ppc405_boards.c   |  15 ++--
 hw/sh4/r2d.c             |   2 +-
 include/hw/block/flash.h |   1 +
 8 files changed, 132 insertions(+), 108 deletions(-)

-- 
2.14.2

