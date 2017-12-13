Received: by 10.223.159.74 with SMTP id f10csp5487739wrg;
        Wed, 13 Dec 2017 11:59:31 -0800 (PST)
X-Google-Smtp-Source: ACJfBos1kSKVOJ6UqpEImJ2SnYby21hCh8txj33RFpKLHfCmguLVavWw+XWwt1GH3plo2KUzcQVj
X-Received: by 10.129.114.215 with SMTP id n206mr2528255ywc.360.1513195171639;
        Wed, 13 Dec 2017 11:59:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513195171; cv=none;
        d=google.com; s=arc-20160816;
        b=ywotzRqDx23ihSyMoZbRXlxm+uedK910XsWyndamF83jT7WmWkgrEzokN53O42syAY
         GnlFOa4rsze+HDXARXkGULQsqtyKoRy/hl+fRjapQSm06acKAdRKIy/gwkXE303Uu2Ay
         ucY31ra2GYCZqxR21f6rPQOg9yV3jovYuSsaOQ2Qwlc/Gwbr1OwUspC+dWW4VSyepBIp
         l9wiTHTeKcjc3bEM4WnkVmJWpS5lUtGSMIAWKOqvrcvTv/gxU35aYX9G45H5S4c2BQdv
         JwXj6zNBh9kImFLJLliUXveulUJQP+X8zUL9M5w8LmB8TfMudFRmb3EB2wI8gx1/IWn6
         AASA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=8bJX5t8LAZCg8JxAtf0yLCuiLQ2OGKvjSNRWCr79OEM=;
        b=l3kIHN5Rx+sj3QdzKosbOwALg+VCmvwOeiLDyqm16gczCJK7FMVNawJMlclEXJBZ5H
         e95/MEm264zTSEZP+38Q1qk3d8SzTUKuepJXvkuMlUsk+Te8gvxQEeD4Jc53107ZlNVH
         CERnZ8yGiaiaMNv/k3Y+q2sNVidKOTKQJgcBHWowcImVgMyJBKw9vs94KOnzL3eL1UMw
         1fuR+pzWMmUkuEAOC1mhkj5VDjD8yKFwEm8vYuRzFjzyosY/eO//bOxXOL5DvjbRQgxw
         /QunyZVBmnaXYhnIVWJhZ6Ijosto6oYu1er3CPyfF2b1ITL56Jfv5IawIe4q7B8DbC3q
         VCqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=N3iNiNNw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g11si508054ybm.503.2017.12.13.11.59.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Dec 2017 11:59:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=N3iNiNNw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37338 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePDBj-0002cD-4E
	for alex.bennee@linaro.org; Wed, 13 Dec 2017 14:59:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57548)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePDBW-0002ad-VI
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 14:59:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePDBW-0005OY-6P
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 14:59:19 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:38557)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePDBP-0005LF-Oz; Wed, 13 Dec 2017 14:59:11 -0500
Received: by mail-qk0-x243.google.com with SMTP id z203so3512762qkb.5;
	Wed, 13 Dec 2017 11:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8bJX5t8LAZCg8JxAtf0yLCuiLQ2OGKvjSNRWCr79OEM=;
	b=N3iNiNNwDNRAOwzMTIWo11NiH+TfCvMYk9EoJwyQQfBJEIBPw1W/1QOyhbiJeecj9K
	MxlqoVH9AIrFC6C1jJIbS4ejO7Z3LTH1d+1vCdIw8sYUeVJ28rvjkgGCCtMNsITAyc0x
	CqyOn7mfGRax5EesgQWyY3gFCmM1VPQDjT6aKfo3sFh+3vpsJrJQJXIuZ257KYRTLqAP
	JrYP7Iwt8ltDmtu4WFnSzO2CB/oaVFjEgd3ZWuMz0zPvxhXNgHsfuGg9zcw0ubU3WYoV
	RjNkdaynVLMczgkQwARDhJL83X4FFziKyTd3gPRFAmsg0xQD8TR5fDi7zX6C92nZEHAC
	eEbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=8bJX5t8LAZCg8JxAtf0yLCuiLQ2OGKvjSNRWCr79OEM=;
	b=SowdWLeIhyyU9HOA9NgQuVj4wyN/bftXeaEIuC43SsgDCgiLQ73psfmclv1Xf+CcXY
	4xQ0YQKdUr4Ox9NYhMCl9Wmlsqz5jnB2f33k6eaKy8+7lh4cuVKuPfwNGneYzK8F/kL4
	va7CYwY5cnHPUV3QDu02i0O/jI9dcvZNfwpraIM5Sx9ABBApBbLHp3770uSMnq6lxTOy
	XYiBiIcdyEw7U4Xmw73wxtXklrU6+C7NMfCqU6hWeCi/fwSArk4RrAjRCbxoEswRNh6x
	x+oyaSvvq3ZMiagsx01Uip8rXtYlHCqrUqgzaoQc/EbYR40bohISfTHNhWAq5PyJFKbK
	UTHQ==
X-Gm-Message-State: AKGB3mLSiLtv1eWRcXgaB7T9gANRWzofoY25Cb9+DHPuWpPz7yj8G+7u
	Dg7PwtN1dq/1ZQzTRi41/t8=
X-Received: by 10.55.191.135 with SMTP id p129mr12671037qkf.211.1513195150124; 
	Wed, 13 Dec 2017 11:59:10 -0800 (PST)
Received: from x1.local ([138.117.48.211])
	by smtp.gmail.com with ESMTPSA id o5sm1518876qtc.72.2017.12.13.11.59.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Dec 2017 11:59:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 13 Dec 2017 16:58:38 -0300
Message-Id: <20171213195852.30439-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-arm] [PATCH 00/14] SDHCI housekeeping
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
Cc: Fam Zheng <famz@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Sai Pavan Boddu <saipava@xilinx.com>,
	qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1l3nU+kPFnx4

Hi,

This series refactor the SDHCI codebase to ease further development/series.

- 1: we restrict part of "sd/sd.h" into local "sd-internal.h",
- 2-5,13: we somehow beautiful the code, no logical changes,
- 6-9: we refactor the common sysbus/pci qdev code,
- 10-12: we add plenty of trace events which will result useful later,
- 14: we finally expose a "dma-memory" property.

Regards,

Phil.

Based-on: 20171213051736.17755-5-f4bug@amsat.org
          (Trivial changes in "registerfields.h")

Philippe Mathieu-Daudé (14):
  sd: split "sd-internal.h" of "hw/sd/sd.h"
  sdhci: clean up includes
  sdhci: use the ldst_le_dma API
  sdhci: use deposit64()
  sdhci: move MASK_TRNMOD with other SDHC_TRN* defines in "sd-internal.h"
  sdhci: refactor same sysbus/pci properties into a common one
  sdhci: refactor common sysbus/pci realize() into sdhci_realizefn()
  sdhci: refactor common sysbus/pci class_init() into sdhci_class_init()
  sdhci: refactor common sysbus/pci unrealize() into sdhci_unrealizefn()
  sdhci: use qemu_log_mask(UNIMP) instead of fprintf()
  sdhci: convert the DPRINT() calls into trace events
  sdhci: add a trace event for the LED control
  sdhci: add sdhci_init_capareg() to initialize the CAPAB register
  sdhci: add a "dma-memory" property

 include/hw/sd/sd.h        |  95 ++-----------------
 include/hw/sd/sdhci.h     |   6 +-
 hw/sd/sd-internal.h       | 119 +++++++++++++++++++++++
 hw/sd/sdhci-internal.h    |   5 +-
 hw/sd/core.c              |   3 +-
 hw/sd/milkymist-memcard.c |   2 +-
 hw/sd/omap_mmc.c          |   1 +
 hw/sd/pl181.c             |   2 +-
 hw/sd/pxa2xx_mmci.c       |   1 +
 hw/sd/sd.c                |   6 +-
 hw/sd/sdhci.c             | 235 ++++++++++++++++++++++++----------------------
 hw/sd/ssi-sd.c            |   2 +-
 hw/sd/trace-events        |  15 +++
 13 files changed, 276 insertions(+), 216 deletions(-)
 create mode 100644 hw/sd/sd-internal.h

-- 
2.15.1

