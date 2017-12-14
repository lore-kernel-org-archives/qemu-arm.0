Received: by 10.223.159.74 with SMTP id f10csp6406599wrg;
        Thu, 14 Dec 2017 06:53:43 -0800 (PST)
X-Google-Smtp-Source: ACJfBotHntkuM8jIAetXauqWwJukbqs7xS8qINtZfcWWRaSWpZqR0ckcBmTuRhKmuz77s6HhInED
X-Received: by 10.37.90.87 with SMTP id o84mr4430817ybb.2.1513263223347;
        Thu, 14 Dec 2017 06:53:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513263223; cv=none;
        d=google.com; s=arc-20160816;
        b=qAPK/V/U+QC6tP2+ndmNlZHXxlo5k9WnKi2BC3nmv7evs03OorOCDm0QpMvPYTmH1b
         XWPAPluNIDyyg3H7+TCHZ8750aUWSn1x01el8mzpGgmf37nzB9CJ4hrqNoltNB2U6cc6
         OrcT6nXCJf/fyFS3MKK7C03Lm7MStRTB2EWOd1hcWEM3oG6RXGyAccv59glIGrSpgi95
         vPSZOmfOuSH3njocWzkE36S4RWuHlLjTHpI5zapmOhaiLkfx2kSxJAaLvgj5UAr0eE3y
         e2261tthQz2O7KR0CguCbaPUhExj+XjDdIe+NEXUgt5JbQE49XqyhT5stI41p7qcsubk
         owXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=80KWrglx/i0Ob5YBo6zKsh3+I8r/Op38IIo1QsnH8cQ=;
        b=sQfhh0pTxs77qG+FwaMr7bG5Th8LmpvJs+5TShxQ1K2P50eJBegs11sPA/gy4p5cov
         qKqA/qPvhStHcYNWS7ygKuzqT75qMKOYH0udqVQut0Fyf3mBiTqi8NWdxhFrNNEXRwpf
         h2Cd1SQSLsfIsEWTZtpzTUQasV44FRQ3FpOrj4ceK4KJkpMeApIq6JtTPILfWDp9gFgX
         3GomMQcmOtzt22s7baTVNRohx6MEs7UVESiY8fcVnG0zmoxzUYxB4RYONGtDNq1GUix5
         Empyss8j5vNli0YP1nPY6NJQ8h0+ZrEnhUk0076nvGSwNbyQndB5ASAjZZzz9NITFUwu
         BbDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=InfjdY6r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d2si832623ywd.627.2017.12.14.06.53.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 06:53:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=InfjdY6r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41359 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePUtK-0001O2-Mb
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 09:53:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55082)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePUt4-0001MU-5s
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 09:53:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePUsy-0000BY-Hw
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 09:53:26 -0500
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:46702)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ePUsy-0000Aa-B7; Thu, 14 Dec 2017 09:53:20 -0500
Received: by mail-pf0-x244.google.com with SMTP id c204so3752227pfc.13;
	Thu, 14 Dec 2017 06:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=80KWrglx/i0Ob5YBo6zKsh3+I8r/Op38IIo1QsnH8cQ=;
	b=InfjdY6ruMbbp65b/ZR0nWXbhpAtTZlAiv6Q+LvlDavRNDpWDVSETwT/5Rhj4JdHy/
	vqqUQPah6Rmo0Ophx5lYvJ5RofGFfs+5ct48N5lFZK+utmK8qGJeHpcmCL4JJu9/m00+
	gP2jaDxE1nU8mLMPgz93JraJYmNuhJ9jHJTfLIa5kv3urBd1pLILO0xuRDZK6Ofjo+i1
	Bgr+OuSr7ZKRtEW9JUQTwhOfzrDb+TxLPcONKIkA8g+XGgiYgLfveFhuDjGsblflAy1F
	Fp0fUiLmcgshT4NtY3C8Qi7p/OB4R6HRaL1eNITbo2KIKLCSwyEQ58nzQ/DmBMaojQRF
	xhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=80KWrglx/i0Ob5YBo6zKsh3+I8r/Op38IIo1QsnH8cQ=;
	b=A8YRbOAwu4ey/HEvnb6bhKtitNOtUOw852t2+B1P38/L9b4biTEf51UvdmtPWmDaRw
	kpM0TmQcfXq/CArMna6OjQsuBQe54hdmSHqF/c9glYthNbQk0Ntsc6cFpaVcXAcxzLKl
	eAkjewLK6PaXGSlH2IJbhGmX3Ne4Xw1kP9RP6bN4UMmiqMIDU43itF09KQuR95gcssEn
	Sq7FgxIhwXt8k1UwehG7tLH5Oc5XTiZ1XVzFJBZLFnOwS6XuVwFyG+F395ixX0xDaUPT
	ySvUEu1PyWzbgh3iqSZZjDhMDEZbpEq4wOYVvxXj3h1xoC02OSO1E31TJ2uodeT1xmL6
	CQiQ==
X-Gm-Message-State: AKGB3mJukDpvbHr8Ks9yUJTi956lX2zyXbSOEYyxQChpdkhkR0fnGtyH
	XmOovYbZHI0A5eeSJyJzvkXkPA1R
X-Received: by 10.98.62.221 with SMTP id y90mr9847727pfj.71.1513263198019;
	Thu, 14 Dec 2017 06:53:18 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96])
	by smtp.gmail.com with ESMTPSA id e7sm8757439pfj.44.2017.12.14.06.53.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Dec 2017 06:53:17 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Thu, 14 Dec 2017 06:52:40 -0800
Message-Id: <20171214145255.31545-1-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: [Qemu-arm] [PATCH v2 00/15] i.MX FEC and SD changes
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8Lz9isLMF2Rk

Hi everyone,

This patchset is v2 of a spin-off from original i.MX7 support submission
found here [1], containing all of the patchest that are more or less
agreed upon and are ready (hopefully!) for inclusion.

Changes since [v1]:

	- Collected Reviewed-by tags from Peter

	- Implemented forgotten feedback from Peter for
	  "sdhci: Add i.MX specific subtype of SDHCI"

	- "imx_fec: Move Tx frame buffer away from the stack" sent out
          properly (fingers crossed)

	- Added trivial patch to swith i.MX6 over to TYPE_IMX_USDHC

	- Added "sd: Check for READ_MULTIPLE_BLOCK size limit
          violation first" to address a small problem I was seeing
          when tesiting SD against latest vanilla kernel

Changes since [1]:

	- Rx buffer in FEC was moved from stack to heap to allow
          worry-free expansion to 16K limit.

 	- Added more comments explaining rather convoluted bit-moving
          in eSHDC emuation code

	- Triple Tx ring DMA "VMState" code was changed to follow
          Peter's recommendations (avoiding the need to incrememnt the
          version_id)

	- FSL_IMX25_FEC_SIZE is used as a size of FEC's register file

	- Removed leftover code from "imx_fec: Change queue flushing
          heuristics"

[v1] https://lists.gnu.org/archive/html/qemu-arm/2017-12/msg00085.html
[1]  https://lists.gnu.org/archive/html/qemu-arm/2017-11/msg00045.html


Andrey Smirnov (15):
  imx_fec: Do not link to netdev
  imx_fec: Refactor imx_eth_enable_rx()
  imx_fec: Change queue flushing heuristics
  imx_fec: Move Tx frame buffer away from the stack
  imx_fec: Use ENET_FTRL to determine truncation length
  imx_fec: Use MIN instead of explicit ternary operator
  imx_fec: Emulate SHIFT16 in ENETx_RACC
  imx_fec: Add support for multiple Tx DMA rings
  imx_fec: Use correct length for packet size
  imx_fec: Fix a typo in imx_enet_receive()
  imx_fec: Reserve full FSL_IMX25_FEC_SIZE page for the register file
  sdhci: Add i.MX specific subtype of SDHCI
  hw: i.MX: Convert i.MX6 to use TYPE_IMX_USDHC
  sd: Check for READ_MULTIPLE_BLOCK size limit violation first
  sdhci: Implement write method of ACMD12ERRSTS register

 hw/arm/fsl-imx6.c          |   3 +-
 hw/net/imx_fec.c           | 210 ++++++++++++++++++++++++++++++++---------
 hw/sd/sd.c                 |  16 ++--
 hw/sd/sdhci-internal.h     |  19 ++++
 hw/sd/sdhci.c              | 231 ++++++++++++++++++++++++++++++++++++++++++++-
 include/hw/arm/fsl-imx25.h |   1 -
 include/hw/net/imx_fec.h   |  27 +++++-
 include/hw/sd/sdhci.h      |  14 +++
 8 files changed, 461 insertions(+), 60 deletions(-)

-- 
2.14.3

