Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp383759wrg;
        Mon, 20 May 2019 09:39:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqztWEJU2ZMO0Ws4p8PYOgEhT5CLe11cBLQWP4XJ431oykBnjkM1cK6e98X9qJFjr866d1wG
X-Received: by 2002:a50:b7bc:: with SMTP id h57mr60870932ede.77.1558370348713;
        Mon, 20 May 2019 09:39:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558370348; cv=none;
        d=google.com; s=arc-20160816;
        b=NLs4D3NH4GmjrVAF1sh5xifksvmwlFCs9XmCaffvYmz3Jxy9aRYNxvd+lsD3ZJ6+Qs
         8SocUONg0lQHwJyMDxoRAfTzZaX5cTk8Awxn7vJ2YhiUQcAAwW3RQDwvNDEj1ss+6lyY
         E9J8VabxT5g41+GzwHnVhidnO0IWdDQ27TNwrrLj+1cf4nSo0sgbdBlZgcn8RZ+VYTJA
         ox65tgCAuWSrDkyoNKllIU/hMtYUPIWrdA7WUJWnX+Vwp2MvYcrygVp5DE7GTiZ2zAZF
         7nS/jJ4ZsJmbgo2hpOopIhMak74IBexN4AqN3qqakc4b2UFp7rfNw2H/Cl8H0BNVvFM1
         cwCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=YCN4s6HR1/KrVRGNw0XQMaeLQvxAhrw3P2htQwH2UHU=;
        b=N2YOFCTjcATKol6bFlQb/FI3J00bzueXPvwaL5/Ho/6fKZdK+z2Mmjw5ieUiVEmbyF
         PmTV/gI88LHW5Q75XRh+Dn65dsaZUEPHDnTNvSR5InBCcwYto2o+mgNKgGySjS4hmkty
         t9f4sQ+zRqpancgtfJI6NCEEBRP25ClzhNdiC1venp7r0Bfhsa73VTcVmbuqJ1loC5km
         aPkn1DHf932Li0n3UcRPOgtdZOMydUBr1iQNphEO1T8wPyIhl8rGktvFrmmnsRG3uGmL
         BXtwzrtI0LefriXzIEzeWCtrn1s7yr5jfhjA98DyKzW6kz1922SW/9K7lbwSbGqaSFMC
         QhSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=k6P9zfQw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i18si2564376edg.379.2019.05.20.09.39.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 May 2019 09:39:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=k6P9zfQw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:38374 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hSlJb-0002bg-NB
	for alex.bennee@linaro.org; Mon, 20 May 2019 12:39:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42711)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hSl9B-00031a-KQ
	for qemu-arm@nongnu.org; Mon, 20 May 2019 12:28:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hSl98-0001FZ-15
	for qemu-arm@nongnu.org; Mon, 20 May 2019 12:28:19 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34325)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hSl94-0001Cq-1G
	for qemu-arm@nongnu.org; Mon, 20 May 2019 12:28:15 -0400
Received: by mail-wr1-x431.google.com with SMTP id f8so8932362wrt.1
	for <qemu-arm@nongnu.org>; Mon, 20 May 2019 09:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YCN4s6HR1/KrVRGNw0XQMaeLQvxAhrw3P2htQwH2UHU=;
	b=k6P9zfQwkL1iVZPWGReO2YjJyl870GuwmSwY29w+vQaqh7mRdMQCaWEDzXXMruCiBP
	5hPNL8fZm4mKEf/HGLmEcBB6rcEa6WLTfQZ4NyLFmyzeepTfc3LaDnfos/4KXKCvJJ9t
	JI1JQlagCbLvYatWqvcYnAQGkWhoCiQzNpk3Gy/htwnQ2oKssV+qrjLmkQR2zcPNYdyN
	THqkkn0Fy/0HRIkRN47GzbaGoOib+zChZn3bT2f3nm51tQISdo5wKkRHd46hpHUCXLOR
	lUYPVXHyut5i/l9pwVCmklGRbZhE3IWufmmm2wquSF0G9nO8ix7T1P5WmQuQZQNluewl
	zxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YCN4s6HR1/KrVRGNw0XQMaeLQvxAhrw3P2htQwH2UHU=;
	b=Ji5BUAyt2gT5hybjR0ntdWSSKFfq4uws0uH+fXMJl3cZeS9BqPlQM6hDNApSm4Pg+h
	SC+cKnC51sahXqoPPkWGz9SAfbaDNbqswwtDQyqZsxFXPTUe9eJUPy4j/Exe4QE5KKHb
	lwTRH1PGRkcPNhL+P54rTGhNbMh+PZeWRglAiCn9MF+2CTrrnKbGHLkScJbWWCvj/Ing
	l3V+RNQwyF9m+Kw4X+uP0lGNs1vIQjObJ4CBs4L8XfnnrFKy5962TyCDnzw3+G4fggzi
	1uxHAAKOO6IM43BW4xpqd6ylbhMuREnEYwYLTwa3YbWb0lG7U0LoS1WBfKxyEHT5Fwde
	8opA==
X-Gm-Message-State: APjAAAWBmNBySwZg13CaVwWrIM9N2xjHJ5IyZ6iXkpLeH5DVG6pfHtbZ
	7s+FLvZLFdBKx88kQzD9Tv1wctyODUc=
X-Received: by 2002:a5d:400b:: with SMTP id n11mr45584711wrp.123.1558369692446;
	Mon, 20 May 2019 09:28:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id x2sm5830394wrs.39.2019.05.20.09.28.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 09:28:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 20 May 2019 17:28:05 +0100
Message-Id: <20190520162809.2677-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::431
Subject: [Qemu-arm] [PATCH 0/4] hw/intc/arm_gicv3: Four simple bugfixes
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o+f82zGYIl30

This patchset fixes four bugs in our implementation of the GICv3.
They're all fairly small fixes, largely typo/cut-n-paste errors...

thanks
-- PMM

Peter Maydell (4):
  hw/intc/arm_gicv3: Fix decoding of ID register range
  hw/intc/arm_gicv3: GICD_TYPER.SecurityExtn is RAZ if GICD_CTLR.DS == 1
  hw/intc/arm_gicv3: Fix write of ICH_VMCR_EL2.{VBPR0,VBPR1}
  hw/intc/arm_gicv3: Fix writes to ICC_CTLR_EL3

 hw/intc/arm_gicv3_cpuif.c  |  6 +++---
 hw/intc/arm_gicv3_dist.c   | 10 ++++++++--
 hw/intc/arm_gicv3_redist.c |  2 +-
 3 files changed, 12 insertions(+), 6 deletions(-)

-- 
2.20.1

