Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3365529wrx;
        Mon, 15 Apr 2019 18:39:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyVcyCLS4XjKup9YyQdD8F5Q3oQ3u3bmzOcV6RnmcQZ3I+ptOqceWxDl8mCZAR947FWN1wB
X-Received: by 2002:a1c:6502:: with SMTP id z2mr23131276wmb.119.1555378790707;
        Mon, 15 Apr 2019 18:39:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555378790; cv=none;
        d=google.com; s=arc-20160816;
        b=ZtzmtBMF4f8RW55IJ1xVVK13nBJnLUtX39tENqeiG14GGEdDbGKgBzov+eXG/8H7wL
         D2q612N9G/X9Uqd0OicX0A1yI7MFrttL0Gg3dEBqIl9rueUzYg05tYEAEDvsCZGROosb
         IEEwaIv2XW3orOk+oSB9AfICzjUb+vQaHHkzcjNv+zzSs5Uy8LIhLDGF1PyYUZxmnFX9
         VJxSQkLPHGU5V5PyDoT91BfuOXcG7z68LIDWHHGbztGwX3CE9fyzuB8Lu+bBw5G10Yn8
         LP7zusSr5SS5apZwCkmGtQzWkpCB7Ttwwc8/9bLO8CVbbcZ+IekayFDBGRy/LoNONJh+
         8kxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=O1HanAiLIqZLGe6dUHaYDaXwNAIovuSElTmnSBYnjqU=;
        b=yss6lYqbasSYvwV/3/7Ao75owPDYhzXE4kJjjchxk009dpbnp1XP2RUhxft8LXkxox
         SsWt202HIOsskOFEgQbKKc52MxhDYKLOhyBEWCl04xCm54pc1rf2msTYguKCXIxjlmfZ
         eDNtB3NiTtw/1GkRV74hHkQ3LEXTxQjuMBzPkAZbUISCLFZqCepagu+nQrJWQ1uay+IU
         ZijMrG+hOfvyIAMxrDYtim0hQjGSNMc0v9CawXXY3ytORVm+QLq4lPUryAjoL3iO1emx
         VvQIzvfSPEtyN2G0sZkQL8y+1a2FPU6DaISJwmgEFWaXP6yMDebOCSoNLxkRhnM7ujmx
         pOqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qatKxeMe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b11si34663027wrm.63.2019.04.15.18.39.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Apr 2019 18:39:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qatKxeMe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:57776 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGD4f-0006SB-Oe
	for alex.bennee@linaro.org; Mon, 15 Apr 2019 21:39:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43953)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1hGD4P-0006Re-6n
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 21:39:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1hGD4O-0007mR-8Z
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 21:39:33 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:44407)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1hGD4O-0007lo-0n; Mon, 15 Apr 2019 21:39:32 -0400
Received: by mail-pl1-x644.google.com with SMTP id g12so9453628pll.11;
	Mon, 15 Apr 2019 18:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=O1HanAiLIqZLGe6dUHaYDaXwNAIovuSElTmnSBYnjqU=;
	b=qatKxeMepdaue45AXG1TGC4deoutbX1dSZxfkmSfc8MryYWqgX90iZNTWrwxN68S+R
	5kD7ulvOLDrnVzVisOq4wdyRhcqNVKJEu2NBoTJ0/gefOJ072q2B9ls8a472iY9PdQgS
	BEgBCwxJeJ71ALSp+NzuIoFakpAGaQS4Y4oYcwGflgEujM33yWxBHZR5qqo+fKZnL3vv
	1lcWDNybKp9IxrZI8J+Ulx5RbE4r7sJVVx7AHbBIkmsaTCp85gHD8Kg9hS6T4VbUD8Aj
	rNht8DjBeASzqFk86s2AA/M6pETCb+lf95UG6RxBPmZpSgANmEmxcQJDjQZiPBGVPWAc
	L7vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=O1HanAiLIqZLGe6dUHaYDaXwNAIovuSElTmnSBYnjqU=;
	b=ORrJJRuETFjNyiab6jEGWCueBCxJbtHO7rKH/N0TxyWqgbVkhkBDPzvMqke0nYk7Mk
	0XgExollwpvydtBCxibG5bncMbZHGdvYNDSmkhAxa+4vy9snuSwjAQvsENiT+IIhPYoR
	36a5o1G7HVfUBQlsiDamzo8RVhh3yjvE0no9nFjgqCFFNX0QlBDONTmNDy2if2JUVmmh
	/z7ln5tiC3i4NtnitxXbZHbyoX5+gbbOiC3tfJMybiEoQBArySeva+I+LhfP8bYGIV0e
	cfr4MqKPUHlUR/7ayfH4SOSvjVKuSBlQY5U6yU4FX9n80gT12FVYZrfHyrolyJDZ6vja
	L2tw==
X-Gm-Message-State: APjAAAWFk56LByGf5gMfQVMxPpXJr0UAe4NG2cS+GEF/VBrAM021p2JJ
	B/A9llP+P5gTXIcZzZ+kzdYtki6F
X-Received: by 2002:a17:902:b489:: with SMTP id
	y9mr70733381plr.17.1555378769108; 
	Mon, 15 Apr 2019 18:39:29 -0700 (PDT)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	v20sm74710362pfn.116.2019.04.15.18.39.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Apr 2019 18:39:28 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 15 Apr 2019 18:38:57 -0700
Message-Id: <20190416013902.4941-1-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-arm] [PATCH 0/5] Various i.MX7 fixes
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	"Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O31HQkNpSWev

Everyone:

I recently revisited my i.MX7 work and this series contains all of the
fixes I had to make to get it to work with latest (5.1-rc1) Linux
kernel again as well as fixes for genuine bugs that I somehow missed
during original submission ("pci: designware" patches). Hopefully each
patch is self-explanatory.

Feedback is welcome!

Thanks,
Andrey Smirnov

Andrey Smirnov (5):
  i.mx7d: Add no-op/unimplemented APBH DMA module
  i.mx7d: Add no-op/unimplemented PCIE PHY IP block
  pci: designware: Update MSI mapping unconditionally
  pci: designware: Update MSI mapping when MSI address changes
  i.mx7d: pci: Update PCI IRQ mapping to match HW

 include/hw/arm/fsl-imx7.h | 14 ++++++++++----
 hw/arm/fsl-imx7.c         | 11 +++++++++++
 hw/pci-host/designware.c  | 18 ++++++++----------
 3 files changed, 29 insertions(+), 14 deletions(-)

-- 
2.20.1

