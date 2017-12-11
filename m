Received: by 10.223.159.74 with SMTP id f10csp3052949wrg;
        Mon, 11 Dec 2017 13:31:33 -0800 (PST)
X-Google-Smtp-Source: ACJfBotInhKwql3e2aZhK3E4QWNW2NVrb0OrPzroxSvhkDzfbQc1OsKVZlbhThWUAmRalrwGXQC5
X-Received: by 10.37.136.7 with SMTP id c7mr1426292ybl.171.1513027893183;
        Mon, 11 Dec 2017 13:31:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513027893; cv=none;
        d=google.com; s=arc-20160816;
        b=xLARD4e2sGq4URKLBFtadEWp5S0bXgXWLMRx/T2AJLLGqlTM2WENUm4wUiHykz2JYx
         /OJvx151uspoVGBTuabebze/1J8ruY2bY3Z/l14NCK4Y6KRdMi1ZGjwfe12owxcRCg92
         0qsn888LH3CvJduWcKx6q4ocLDSp2VfcoYxui3xPHHgmn5eXwgDZ3epgi6SgK4nSoSoI
         TNIpYl83mv2i3iAi6XhPjkZfa0yuC7F/bJuFTfr0efN/p0Pp5fsiYQJM240Pn0pbaLHE
         0Ts/uR/WQrr1zfp+LOHyTi9iYheFdQg0WlfvxE1Dk7ZGPZM/qcYyGWL3+Ltse0NtrQdV
         Iilw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=p7PFMMN175C0GBG9ooC/ej06BlRh14N+3DNyNw9rdOI=;
        b=hkozxhKQaY+0LUO4TGOD2sCTc8juwOG0S5EFRaySiWS+PLfqa6aV6Tfps/rNByqQLl
         sQ+3ae2ojxqbQbO0g3DMOZyz8v+BJ4o+vTKseuruDK/snpkgJSNZmw83F/SOtcMQofXF
         NNcFEpbnGYTNKi4t/3qMfWAD+Mhpq/FyefzeRkIKZ/Bhp8mQd5XCNGJvlg/RDL6wKIIr
         ghVA803sUdECIM7Unx9DrWZx/P2x8rVJpvrXU5EYDU9V5Sf4XR7CKTeXKyTBfdicMTRU
         39ZWLEZ1fvlU2j6eX5+Fp6FyUA6n+UmlEMb1tHEx/sjqsTUMhHJ27UA8yuzjqLXUuwrD
         oTcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RUoLh8nk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w65si3202052ybe.535.2017.12.11.13.31.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Dec 2017 13:31:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RUoLh8nk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55533 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOVfg-00010J-Hm
	for alex.bennee@linaro.org; Mon, 11 Dec 2017 16:31:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35670)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eOVf4-0000iL-RA
	for qemu-arm@nongnu.org; Mon, 11 Dec 2017 16:30:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eOVez-0003tL-QS
	for qemu-arm@nongnu.org; Mon, 11 Dec 2017 16:30:54 -0500
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:39138)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eOVez-0003qR-Jy; Mon, 11 Dec 2017 16:30:49 -0500
Received: by mail-pf0-x242.google.com with SMTP id l24so12535534pfj.6;
	Mon, 11 Dec 2017 13:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=p7PFMMN175C0GBG9ooC/ej06BlRh14N+3DNyNw9rdOI=;
	b=RUoLh8nk/HFGTh45F/mDj5J1msSsXXtnj0xfzH7Qnteii6tmUSnvPv2UlErs+F1FMz
	cv2DyTVmMw5v8E9rqPJx2XIp+GmXHqmdgX0W5ppMffD1JPlZx3Ccbuyor+lcXhakTFfR
	hRKUDTpK3YD7LW8UbJ8lTXap/KhV5qDQMN0wGN8vnRYZmIoz6bauOZSQLwLTWeHChe4n
	NCw9nChSIVYlgpkcl0Z32xwDQRPHaLgwhN06KF0ksj3sCTJ/lGN4FDZMnTOG1rKNIqim
	DCjShJhiVJKRRTSzip+grYaMYnSPyuHI/aVMRhzT9CG3HaRoJMY7UnEABHKH3v3fia93
	Lwvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=p7PFMMN175C0GBG9ooC/ej06BlRh14N+3DNyNw9rdOI=;
	b=DiXhSnob487W6Unzq5XDFNhNbBH109z2Gv394Wyl/IKzuIrnHdbEVIXDMM5nUKgYk5
	OJLLWY49cxeTEVyTHBBJzNjGVTuzAkCSxbOvNcCALpRcwPMMWX/ql6+TK6DFPVmnOYE8
	6Y7M9rW4wKyy39BXMvygjeFWJh7/sEUlsF+RZrcZDbjeVmhJdMKpP5z3CId/rwL+h6NF
	lT15Tj9i5tqQjkJazKfEk0DOu7y6Im82U5aKwyW3TCNPxQu6JvKSTR2eWSkEbUcHZ6Nc
	woeNxa2EKVF4+Yqh7v8xYP5Fdr4DbGg84KVNVPIYufEwzFEMKMb83dFkU/Gsedbhf/sq
	lMaw==
X-Gm-Message-State: AKGB3mIWtDBlggBGC6c7MVDW0nqm48zzWkTmGe2V7wodVAYN/lJm6kcK
	TeK4Z+GBIIwcZ50Im9d9yPEjuTHR
X-Received: by 10.84.128.77 with SMTP id 71mr1628475pla.197.1513027847874;
	Mon, 11 Dec 2017 13:30:47 -0800 (PST)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	q10sm25359690pgc.84.2017.12.11.13.30.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Dec 2017 13:30:47 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 11 Dec 2017 13:29:54 -0800
Message-Id: <20171211213007.7353-1-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-arm] [PATCH 00/13] i.MX FEC and SD changes
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
X-TUID: jT32ReTDP6DS

Hi everyone,

This patchset is a spin-off from original i.MX7 support submission
found here [1], containing all of the patchest that are more or less
agreed upon and are ready (hopefully!) for inclusion.

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

[1] https://lists.gnu.org/archive/html/qemu-arm/2017-11/msg00045.html


Andrey Smirnov (13):
  imx_fec: Do not link to netdev
  imx_fec: Refactor imx_eth_enable_rx()
  imx_fec: Change queue flushing heuristicsw
  imx_fec: Move Tx frame buffer away from the stack
  imx_fec: Use ENET_FTRL to determine truncation length
  imx_fec: Use MIN instead of explicit ternary operator
  imx_fec: Emulate SHIFT16 in ENETx_RACC
  imx_fec: Add support for multiple Tx DMA rings
  imx_fec: Use correct length for packet size
  imx_fec: Fix a typo in imx_enet_receive()
  imx_fec: Reserve full FSL_IMX25_FEC_SIZE page for the register file
  sdhci: Add i.MX specific subtype of SDHCI
  sdhci: Implement write method of ACMD12ERRSTS register

 hw/arm/fsl-imx6.c          |   1 +
 hw/net/imx_fec.c           | 210 ++++++++++++++++++++++++++++++++---------
 hw/sd/sdhci-internal.h     |  19 ++++
 hw/sd/sdhci.c              | 231 ++++++++++++++++++++++++++++++++++++++++++++-
 include/hw/arm/fsl-imx25.h |   1 -
 include/hw/net/imx_fec.h   |  27 +++++-
 include/hw/sd/sdhci.h      |   8 ++
 7 files changed, 444 insertions(+), 53 deletions(-)

-- 
2.14.3

