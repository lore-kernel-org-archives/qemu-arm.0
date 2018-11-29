Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2552987wrt;
        Thu, 29 Nov 2018 08:39:30 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Un8EerIhmLcDZqx6AiknuZQA3W8TNQpnkDTy4iWZlYouR3rnrhy8TVuuShGj3AAeRDpOLq
X-Received: by 2002:a25:7bc3:: with SMTP id w186-v6mr1957189ybc.18.1543509570730;
        Thu, 29 Nov 2018 08:39:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543509570; cv=none;
        d=google.com; s=arc-20160816;
        b=IQ7z4wUjs0PZMHlcPZ0gPp2tK4Ct/pec34uQqffdEfuyibzKMvW4BeDgUIKuNohDUH
         br6vu/FG7qp8RdeEe/zdWT9idgXeUrI/aJ7/9/B2o9Fv3GCs5l2gZOlriDTfdiRNbf6g
         9bS69ZGS/uMTITvzTUCsm7Q2veZKEVXlTplAsqOCrtFwhoXIdh9W4RDls0apaLJ4E5V3
         LkxQXe2SVubLM0EAGGe9EulciGFxeiPCrDRzocNoq+2AUbhSFNnU5byxph1B3y8/Nl+e
         kV9Ac4uSWdXMsDGoZYE0EMO46jVajgO4YfKT/Q2WiLyDxQDU5rJadFvON6gl2HCUrFRA
         /6Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature;
        bh=YyTAzRmStxGsPV70TlxpA+Dw7+Mlr40jRCad/3fGb3k=;
        b=SBohSaMLmSVquiShBfyw2H0wYBBCvOdkv/vRp2CJUw3WbUWvnx7M5xYD03xXQoQ5fG
         iuxJFFCZXmRtXrrii82P3EBxspIyCvVxH/APvdVCtuGIYt84d1Q3AXDO6h0i55NK/L3j
         7QJ2NAAEdMi5vrA2H/sziprASgosawu0StsPw9yfVJqQiMWi3s+NyqwyMy7d3TppTfZg
         aswPfy7/4yqr9pDXYmaT9TjPQZa1qKvfusDiYW5LF2tP7hTk/xP7RE1MFsKXtIhnVmjh
         mNHuA6wT9/L0Lm5QUoiVBR/prkrW3OWFqvJEn0uu6iJ+nzd3VzBiT/PlwRgDciZdVIcj
         O6Jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DLFH0dkM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s126-v6si1531773yba.267.2018.11.29.08.39.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Nov 2018 08:39:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DLFH0dkM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55169 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSPLd-0008IT-OY
	for alex.bennee@linaro.org; Thu, 29 Nov 2018 11:39:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37046)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gSPJI-0006pv-Oq
	for qemu-devel@nongnu.org; Thu, 29 Nov 2018 11:37:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gSPJD-0007Ez-N9
	for qemu-devel@nongnu.org; Thu, 29 Nov 2018 11:37:04 -0500
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:41452)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1gSPJD-0007CX-Fd; Thu, 29 Nov 2018 11:36:59 -0500
Received: by mail-lf1-x132.google.com with SMTP id c16so1917565lfj.8;
	Thu, 29 Nov 2018 08:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=YyTAzRmStxGsPV70TlxpA+Dw7+Mlr40jRCad/3fGb3k=;
	b=DLFH0dkMe6VdsPkgd/FUz8XXLgsfvQV6Qbzse79D4N0iS9ZDk/9IMAotGRAPqGR/jP
	HEhEID7SA20nucPxeOQarp2r3cybmkTLMnDjG5jefVDb+H9Azus0oCxtI4yF/piNRFMv
	eA1bQoCgxwSIjSOFuX4H1jb5O6sQmGG45h698sRmjLi3BXdli8Ll6PCd1mqZJZx7Y8NA
	wul5wpanf31t1hVA3nEMfBe+6InyJygcYGrfdCACqfKuti70UmEp8xT8FnukACmMIwvF
	PlT+IbC1gyR2siU9L3bWeR/31VUbFHegMwiAv/9ruk4vOOQXEYghMG0iCsDEjJhLk+HG
	3HRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YyTAzRmStxGsPV70TlxpA+Dw7+Mlr40jRCad/3fGb3k=;
	b=jvzb4pjaWvxKFzA1gVUODC0L5I9+iA8G8e88UtNXMkH+IskOmhIhDS+iFiU2g1glXh
	YboL2Arm4gboNpkELINiknk6HRWq+xKK3DON5qlB9rwzWgtFtKaqd9mC+ulkLoNm4KjF
	64d5xAmitAIxg3RJY8ATU+y77Vnq0yAmvgCP3Q+/KzG5ag236Fk59VS8i2vyX3/G+zka
	U3wWhmxtIHl2plh+2uMDHEXuh39r56pEcJ/Qebxy77zvCATzED7LGmCfuUEx6Zsi4a+G
	M1U2CSilh2WWlbMqo5bn6Af8ghOXIOXcW9jqtlfpsVVDtq0IBLGCha0ZS9E6tegqzFuC
	sxgw==
X-Gm-Message-State: AA+aEWbzU1WjjjwvoVssjykPFggOzmS2a4Su8wRTsJneGVR3qwccKdfi
	6BnroU+ISK8kGEmS458A+jhupEAz
X-Received: by 2002:a19:2d16:: with SMTP id k22mr1436236lfj.12.1543509417461; 
	Thu, 29 Nov 2018 08:36:57 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	b128sm382758lfe.91.2018.11.29.08.36.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 29 Nov 2018 08:36:56 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Thu, 29 Nov 2018 17:36:51 +0100
Message-Id: <20181129163655.20370-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::132
Subject: [Qemu-devel] [PATCH v1 0/4] hw/arm: versal: Correct number of IRQs
 in GIC setup
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	frederic.konrad@adacore.com, muhammad_bilal@mentor.com,
	philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QkPumzLuWSHl

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

The Versal GIC has 192 IRQs not 256 as we previously had setup.
This series fixes the setup and moves the virtio-mmio nodes
to use other reserved interrupts.

Since we don't have 32 reserved lines, we also reduce the number of
virtio-mmio regions to 8 (we do have some more lines free but let's
leave some for future use).

Cheers,
Edgar

Edgar E. Iglesias (4):
  hw/arm: versal: Remove bogus virtio-mmio creation
  hw/arm: versal: Reduce number of virtio-mmio instances
  hw/arm: versal: Use IRQs 111 - 118 for virtio-mmio
  hw/arm: versal: Correct the nr of IRQs to 192

 hw/arm/xlnx-versal-virt.c    | 7 +++----
 include/hw/arm/xlnx-versal.h | 8 ++++----
 2 files changed, 7 insertions(+), 8 deletions(-)

-- 
2.17.1

