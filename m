Received: by 10.223.134.117 with SMTP id 50csp11157121wrw;
        Tue, 2 Jan 2018 11:37:47 -0800 (PST)
X-Google-Smtp-Source: ACJfBovGSKWL3UtXgupwv+LMsR0iXkhpL+/8fZzCiZn6oIrdpTye0uPmuWz0ZTlOu6uaVY7RYy2L
X-Received: by 10.13.221.133 with SMTP id g127mr33037542ywe.125.1514921867770;
        Tue, 02 Jan 2018 11:37:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514921867; cv=none;
        d=google.com; s=arc-20160816;
        b=KhWJeappOTo9uKKXHnPwwQ6u3NpZT8UUZgjTrGeKBdZ8DmPTgAAZYIr6jfrnU0ZQHl
         gTo6U2PrN+apfScV8pgI9f6rg7i06hp8r4V7bW7gJDQB9xFF8a3uDZi1bidh80JlrKi5
         h9j503oBt7Eg1a/hgcCnpCiHDRcVqLaKRAA+NoLkQSZPbRzZUUySJQQ+1b1tl5VEOVJJ
         Dgmqd8rvFnZzLmNHKRSg2YbCJ6BjJYjc++ctGHcWskLG0XBLeCq5zY01Dr2N21dyU+NR
         z2D2piw26+P71L9t+K1lpkDkHDBGxOVU+j2sL2RwG02YoY5nDkhlXCB6wr8D9IF40fIa
         oc6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=x1TD8ZolnFGtM7EOfO+lZDFccAh3SliRrpT64GGj/b8=;
        b=pDNB4NoeqHIq2R6jW0mxIlJRV62v8MXdvrhQfO4bfbQACH1zHAJHWt+/jKFfwRADoI
         GGNvbHGS83fsJKTo2pOS2WSvp+2fOL8CayD0+yXarBktATU7etiwRR7JKosza0APHzCW
         f9IrHGVLezzpvh6w7XLV84Sl9B6F5tAfP6T1KoTNJnxVF6S7sE5m8oitsYFrDPK1VRi0
         6JAB8iQN8HwsidBCT+nP9TlXQ5Ryet0dSx9CjIMPDR8k3pKn8cWhsM0vz3YXWy71YxHH
         +GAs0N2IA852rpd7t148Of4fi23VBFJS1y6H7PZVXwunbudDy4XhgyCv1AmjiqZjO3ZM
         5gIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UuUg7b7Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b30si2561032ybj.206.2018.01.02.11.37.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Jan 2018 11:37:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UuUg7b7Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52912 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWSNf-0003wV-5a
	for alex.bennee@linaro.org; Tue, 02 Jan 2018 14:37:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58479)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eWSMZ-0003Dz-CI
	for qemu-arm@nongnu.org; Tue, 02 Jan 2018 14:36:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eWSMW-0000G4-6e
	for qemu-arm@nongnu.org; Tue, 02 Jan 2018 14:36:39 -0500
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:40888)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eWSMW-0000FG-1I; Tue, 02 Jan 2018 14:36:36 -0500
Received: by mail-pf0-x241.google.com with SMTP id v26so26019638pfl.7;
	Tue, 02 Jan 2018 11:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=x1TD8ZolnFGtM7EOfO+lZDFccAh3SliRrpT64GGj/b8=;
	b=UuUg7b7QJH9WxvbBKeCMuhm6H1j+giszsYBOQ+Sn3dJVrwz7/Hv9UebdNkRDhvzgz8
	YONGa1wpnZE6UJxSOCttKY3hY1d+QfO4O+Q+Frd3f8aqR4xXz3nU5IS9w9u/40RCFuf2
	xGy88MohV4zETycU3Vp9UBgBuFeTfixXwz1bMcOyC3FgtMIta/bW393GikZDNWAylhD+
	HUB6Mdu6Cl+yXJ3keIfapBgMGzDm+/iVBZlgJWTpJHUiUJGW289uiLMMhh4l3ztCsyiU
	1o9iOQSWcu9Gtv7dl8H/3dTY4/b1XqcGWL/ms14+pyP1Q56gqfffLRK/pPJD/MaA1Om8
	54CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=x1TD8ZolnFGtM7EOfO+lZDFccAh3SliRrpT64GGj/b8=;
	b=r5znPlWYrWFoRRFsaUIIUsWLZq5bPm8LQ5aVRpRmRnpFPWbP5sm+9kj481otCAIDmg
	eZTppU+auIRBHAX9vtRxEVCSX4wtK9XeYO/8iy6vAyIEZtMZO1XQHq++9TEEebvsfHkP
	8KVaEkw64b0rl9ZoPmgNuWtT3iQGELO8Lti+9UU5xSzetYVu0QhR8quCuHrScMj6l9qh
	vydeP+eYM06M4c9sMZXtpeYD/GYSBlxwcOjEEQ34/Rg9HPeAe4LHV+pYioSsUbhg6Bz9
	vB5ZipfaRyx5PtKhdYpesa1CZXKI3Js8N62QWws3rrNxbq606Zhdu2aqR1cWln3v1i6w
	QowA==
X-Gm-Message-State: AKGB3mK11vNCX96kyfeawDSWuQnwUpg0k1UbmxVXVXvTjwgXf2BgUU0Z
	2NCvcaUpB/O+u9PxfTEQr8dgpR4srz4=
X-Received: by 10.98.137.14 with SMTP id v14mr46800481pfd.10.1514921794249;
	Tue, 02 Jan 2018 11:36:34 -0800 (PST)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	g9sm97905951pfk.0.2018.01.02.11.36.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 02 Jan 2018 11:36:33 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Tue,  2 Jan 2018 11:36:11 -0800
Message-Id: <20180102193622.27215-1-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-arm] [PATCH v3 00/11] i.MX FEC changes
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
X-TUID: AiGgUYs8N6ly

Hi everyone,

This patchset is v3 of a spin-off from original i.MX7 support submission
found here [1], containing all of the patchest that are more or less
agreed upon and are ready (hopefully!) for inclusion.

Changes since [v2]:

	- All SD related patches are dropped from this series (to be
          re-submitted once Philippe's work lands upstream). Note that
          "Implement write method of ACMD12ERRSTS register" has been
          incorporated into Philippe's submission

	- Collected Reviewed-by for patch 2 from Philippe

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

[v2] https://lists.gnu.org/archive/html/qemu-arm/2017-12/msg00175.html
[v1] https://lists.gnu.org/archive/html/qemu-arm/2017-12/msg00085.html
[1]  https://lists.gnu.org/archive/html/qemu-arm/2017-11/msg00045.html


Andrey Smirnov (11):
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

 hw/arm/fsl-imx6.c          |   1 +
 hw/net/imx_fec.c           | 210 +++++++++++++++++++++++++++++++++++----------
 include/hw/arm/fsl-imx25.h |   1 -
 include/hw/net/imx_fec.h   |  27 +++++-
 4 files changed, 188 insertions(+), 51 deletions(-)

-- 
2.14.3

