Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1904274wru;
        Thu, 16 Aug 2018 07:14:24 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPxBIFTI9lfIKiarZb3Ew8ScgKJ8GA4ww5BfsM3fXoDfZvPd9hANVANibjtIxYtMg3mq2aFS
X-Received: by 2002:a37:c04f:: with SMTP id o76-v6mr1785001qki.315.1534428864727;
        Thu, 16 Aug 2018 07:14:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534428864; cv=none;
        d=google.com; s=arc-20160816;
        b=JNLAbiwF1AMv1FipXj9KVXHm7d3AbpkeyRwpn1LjDDh7mUqsLdvUA7xvC/PYZi4AU/
         kXso1c5riBl64Y0I1y2Ls263ujiEMf2jHwwvssOX7O6PTr1z7oQhavQViryF+wbSckqp
         X/wIb7VXuw4smjt8anTI+l8ZnzIVge7Qi/fyKxxD/mmE95+1hGQFyK6Cgdbcd1LZH32a
         sFKY9g8xaM/8QqifPBjmINGAFZOy+pCavYzGu6IHsjI5idWIwGBfbbvv9tI/sWguHW+K
         NyCHOe2UX8cuQJMCGVLB838I3o1FMwTBShcK9Pr5vLcVz2Lj+Wi6OJV13wR0esd4xPK8
         jsqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=+73vl9CWuFiPHCEQERVKpNqMNigL2Kf9uOFE8y6jZEw=;
        b=d0hgdoCqUgsCR72stIZNqu8d7O/7KE8UX53Xp2oS1wOidil0nT0uP8dfYwJYGZ30Pa
         osQr+NNKDAAF0jxtD9+ul2YT+SIp/YmCiDDVxt7az+0n1k/Vb0AZXgOLES3oMkYSbp9o
         QbH5yRWzDJLs4D+Gip369ScVZt++8EzbRbE+rSASD9YOk9G9uTiYAj6hPq+5fTgpMnGT
         J602kVSbldkjXTy7VDodWRGgaSToAh5TaLv1l/XSxOZ1XbR1R8CZMqFq/Zt8wy25Bu2J
         P4HwjaSWrpjZ3U0fRzLgtrkAkWjIfdgV3DEXR1LsoypQDiclzvti65V2QHnJ8iCkB+hF
         avxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eN+c2pYe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 34-v6si19751582qtz.273.2018.08.16.07.14.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Aug 2018 07:14:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eN+c2pYe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55908 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqJ2e-0006kN-45
	for alex.bennee@linaro.org; Thu, 16 Aug 2018 10:14:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42479)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fqJ1k-0006Qn-Ac
	for qemu-devel@nongnu.org; Thu, 16 Aug 2018 10:13:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fqJ1d-0004Ef-AM
	for qemu-devel@nongnu.org; Thu, 16 Aug 2018 10:13:28 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:36239)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fqJ1d-0004DZ-1P; Thu, 16 Aug 2018 10:13:21 -0400
Received: by mail-pg1-x542.google.com with SMTP id h12-v6so2141151pgs.3;
	Thu, 16 Aug 2018 07:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=+73vl9CWuFiPHCEQERVKpNqMNigL2Kf9uOFE8y6jZEw=;
	b=eN+c2pYeRN+4Wnqavy+YLpBd0laK6BII/8vCAyODvU/IGyMFXwON0KIdg2ewuhkRg6
	zEQzB+sg1cJGAHKeuaEKTJNjQets9sCTlTfMHgEhkyIuD0DIIbpBqBwuNSdXJgRk1Ukb
	qbEWh7r3ECyBPmyIcIUny8zJ9LEI05tTIQabzffzWXChVYSDsRPjAnIcu9xuSgvEil9M
	abdu6FyatL0e75QRAji7St+yDNEhH9vBzCIZ5kuYtWgmRZaiTm/s2qHfz9F0T72G5akZ
	blseZwhyGEkLa8/q4uMopbVsTL2xs4iuADnnvGw5VfmWWmkO9eIXtXAPZ+rEE6RnhPp8
	GvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=+73vl9CWuFiPHCEQERVKpNqMNigL2Kf9uOFE8y6jZEw=;
	b=e9IzlTsuufrKd1xKJ074v0NG4hd5l0tpZRFbOoHmstU4543DWtGTRcT89fXzbLcQ/L
	HxCPAWa/K2K3nKkP4U1mTeUYnixZVvP9z3GK+xcffB7VI/dl6oVsn8JuA4IUed4W2Dnf
	3j0e31AA4Qtj7ScAW5stLjRrWdBt/18d+m+3F7OLePKId6hsgJl5SRcfJRZfkERpR84b
	cdGW4grpYtvCra6l2PCE/eovzfLzUDZ8QlXstJO23e8FZXB9TBXqvr2lYczccuypc5hG
	sC4hALirFdluoq0fee15ZBRq8Pq5phG/ewdMLNUgSsVzyBC64bLJ89ALnKbX1qKYF8dF
	WI+w==
X-Gm-Message-State: AOUpUlHqxiDEIAhv9nhGZ3b/xeTodWf2FMZuYCGGcdA2zjqLrzNtdFWS
	V4hSmiPpUL7uPjm4+mJG428=
X-Received: by 2002:a63:2b89:: with SMTP id
	r131-v6mr28695823pgr.39.1534428799781; 
	Thu, 16 Aug 2018 07:13:19 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.18])
	by smtp.gmail.com with ESMTPSA id
	s14-v6sm67381137pfj.105.2018.08.16.07.13.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Aug 2018 07:13:18 -0700 (PDT)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Thu, 16 Aug 2018 23:43:11 +0930
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Aug 2018 23:43:00 +0930
Message-Id: <20180816141303.20518-1-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-devel] [PATCH v5 0/3] arm: Add nRF51 SoC and micro:bit machine
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Jim Mussared <jim.mussared@gmail.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qzN0ub4VCwDr

v5: Change back to ARMv7M from ARMMProfile
v4: Fix number of IRQs
v3: Rebase on Stefan's cortex-m0 series
v2: Addresses review from Peter and Stefan

Based-on: 20180814162739.11814-1-stefanha@redhat.com

This short series implements a minimal definition of the Nordic
Semiconductor nRF51, a Cortex-M0 ARM SoC, and the BBC micro:bit, a
machine that will use this SoC.

This work will serve as the base for our Google Summer of Code and
Outreachy interns who will work on implementing a number of features on
top of this base.

I've tested this with a microbit micropython firmware, and checked that
it starts running by looking at it with gdb.

I chose to keep the nrf51 and the microbit seperate, to not confuse the
peripherals that are on the microbit but are not part of the nrf51, and
vice versa.


Joel Stanley (3):
  MAINTAINERS: Add NRF51 entry
  arm: Add Nordic Semiconductor nRF51 SoC
  arm: Add BBC micro:bit machine

 MAINTAINERS                     |   8 +++
 default-configs/arm-softmmu.mak |   1 +
 hw/arm/Makefile.objs            |   1 +
 hw/arm/microbit.c               |  54 +++++++++++++++
 hw/arm/nrf51_soc.c              | 119 ++++++++++++++++++++++++++++++++
 include/hw/arm/nrf51_soc.h      |  42 +++++++++++
 6 files changed, 225 insertions(+)
 create mode 100644 hw/arm/microbit.c
 create mode 100644 hw/arm/nrf51_soc.c
 create mode 100644 include/hw/arm/nrf51_soc.h

-- 
2.17.1

