Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp957740wrq;
        Wed, 6 Jun 2018 08:22:18 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKZ1xxchTLr2cfezsXOoWvFtW8RkT7phmiIxjZHIaExD5jVpYlh78BTq6KvEn98IHpy7lvA
X-Received: by 2002:a37:c846:: with SMTP id c67-v6mr2853748qkj.296.1528298538252;
        Wed, 06 Jun 2018 08:22:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528298538; cv=none;
        d=google.com; s=arc-20160816;
        b=I/GEulPxJWAyHQCpoVxls/0eNAVnzr/v7v4Fi9KftciHnV07vCKP1mP6lRc61sSZWU
         EEDXtP8by4GHDyPmn1mA237AVLb33QV3A8Tpr4X7eifVQ4RVDPpiLkBlT3b29o2R1qgp
         STS3y0XKIpAhFrMaerJcoV7D9n7+m45gH9j0k+ihzEVZJDlkBFR19XRA7Eg6j8g2qEAk
         GF01G+WG2fHFxIRA95ephDnuPNFaC8BCJsW7Kv4ToCfdysKqe/vW5H8BXlmOOsdi/H+n
         z2spsM+975WG8ijkUm3WMlpLHqfrYNgJmg4UId1M+F7rBU89NIwUl8SIDq2Dz3csggnF
         5eYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=WmXrDEjSrbWiSs20Taaf/u9ygPS4zQsPt3kiHlH+Tqc=;
        b=APalVWb6bKKR1/ZwTx3A0R+l87DxLO0gzRBZny8bcDK0CZk1kvNDfVv0iDnSXNfBLw
         n48fDml6uYaDyVaf68OQXxQPL7L43PzyI0ODCuLqn+vAToYQkXUb0bgEuOvELmszMPTQ
         tc2sODo54u9maEm8b796Z6+fdq2mxEIZnBYaF0rucUL7KGHovaLxgWveHybJF1p57JlQ
         xnq58nfA77oFLKc5v+SJlP0flXtYpKVoXUSYR8cYefCyCKYRJX1J1hCnzm9bYxLvGxgp
         Jcd6HyB8wRklWzbO64lyKaZAvXpvdXfG1zatewvH5cEyMPaVAGcqDNpOcv/163kNptXa
         UIOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ezLloFJw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c13-v6si3262800qkm.302.2018.06.06.08.22.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jun 2018 08:22:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ezLloFJw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53061 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQaGP-0004Wz-Ip
	for alex.bennee@linaro.org; Wed, 06 Jun 2018 11:22:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39128)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaFt-0004Wd-Ue
	for qemu-devel@nongnu.org; Wed, 06 Jun 2018 11:21:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaFp-0003Y9-UZ
	for qemu-devel@nongnu.org; Wed, 06 Jun 2018 11:21:45 -0400
Received: from mail-qt0-x232.google.com ([2607:f8b0:400d:c0d::232]:44484)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaFp-0003Xp-PQ; Wed, 06 Jun 2018 11:21:41 -0400
Received: by mail-qt0-x232.google.com with SMTP id l33-v6so6720786qta.11;
	Wed, 06 Jun 2018 08:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WmXrDEjSrbWiSs20Taaf/u9ygPS4zQsPt3kiHlH+Tqc=;
	b=ezLloFJwo4z+oz8Kn9K+9T8w6kYZuYP5IQslActaHogsaYc5/xy8IM5CMEUrCBzeHD
	ufMTBh4iTB1RHL/vvCnxhV+1k06hVMZDn9QlYnwmpjZq0B+DzRkUCabDPcV66vQcKev6
	LCpXTqSTbOzj/lTHqYjPBqH8TW7KOV8T36sbdL6G7NkX/weSNfOGY8QN/fQma3Cvs0pI
	BdqYBVx4CrgJCay1nqt/R1hQOAtuowjuKnvMgQf4YRsrJHEPEbJPQHaZ2iLq/O0RZo+w
	5xBBaAQ67GgvjJsECI7v6OVpEuvfgTPwI7ncWVjakkIwrDuKOUmzeMuq71+3qMWsROSw
	y6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=WmXrDEjSrbWiSs20Taaf/u9ygPS4zQsPt3kiHlH+Tqc=;
	b=CRp3oOlyF1WtmlbnIznMJqnH+FBWdqzSG9jDMB7V0b6wVD4rjx//Ijb2MakA/9nL7w
	yPcxZe7t4Aq0H4Y/9WrZKcf/4Wp8iFxA/m0s0vb1RtiZaW7WB/80N84bnYYoZog9a9nH
	bp9fKzwIMA3b6tOrSTih9Bl+fQKNizi92MP54989+UoUk/NpAM1c/tw8A2Po+fwuOyEB
	/XuqVu/dLHnoyl7xOXbYHGksyrCMgsMA/LDjKbv7FTzJ+K32O7sSGjASsvX1jepz+Qml
	gugWcjINA2rjpWKjoaHPUnrkSjX6azQZ4m3ga3/cFAPUF44Fy1ITqTEJFJYjyTSFbDvc
	6pHw==
X-Gm-Message-State: APt69E2qw4JWwIMGkby+4Rw/hX0WmOXbeFQj/ewoy4Bp5rCbCdlP7oEg
	o4ou6sdU4zl9CwjVq3xe8Yc=
X-Received: by 2002:ac8:2d6c:: with SMTP id
	o41-v6mr3219115qta.107.1528298501211; 
	Wed, 06 Jun 2018 08:21:41 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	i8-v6sm38756255qtb.11.2018.06.06.08.21.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 08:21:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
	Max Filippov <jcmvbkbc@gmail.com>, Michael Clark <mjc@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
	Paul Burton <paul.burton@mips.com>, Yongbok Kim <yongbok.kim@mips.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Antony Pavlov <antonynpavlov@gmail.com>
Date: Wed,  6 Jun 2018 12:21:17 -0300
Message-Id: <20180606152128.449-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::232
Subject: [Qemu-devel] [PATCH 00/11] misc: Add trailing '\n' to qemu_log()
 calls
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 40qLw41qrZim

Nothing very exciting here.
I sometimes miss to notice some trace events, running with -d unimp,trace...
then using 'grep ^...'. This is only due to a missing '\n' :)

Philippe Mathieu-Daudé (11):
  hw/sd/milkymist-memcard: Add trailing '\n' to qemu_log() call
  hw/digic: Add trailing '\n' to qemu_log() calls
  xilinx-dp: Add trailing '\n' to qemu_log() call
  ppc/pnv: Add trailing '\n' to qemu_log() calls
  hw/core/register: Add trailing '\n' to qemu_log() call
  hw/mips/boston: Add trailing '\n' to qemu_log() calls
  stellaris: Add trailing '\n' to qemu_log() calls
  target/arm: Add trailing '\n' to qemu_log() calls
  target/m68k: Add trailing '\n' to qemu_log() call
  RISC-V: Add trailing '\n' to qemu_log() calls
  RFC target/xtensa: Add trailing '\n' to qemu_log() calls

 hw/arm/stellaris.c        | 11 ++++++-----
 hw/char/digic-uart.c      |  4 ++--
 hw/core/register.c        |  2 +-
 hw/display/xlnx_dp.c      |  4 +++-
 hw/mips/boston.c          |  8 ++++----
 hw/ppc/pnv_core.c         |  4 ++--
 hw/sd/milkymist-memcard.c |  2 +-
 hw/timer/digic-timer.c    |  4 ++--
 target/arm/helper.c       |  4 ++--
 target/m68k/translate.c   |  2 +-
 target/riscv/op_helper.c  |  6 ++++--
 target/xtensa/translate.c |  6 +++---
 12 files changed, 31 insertions(+), 26 deletions(-)

-- 
2.17.1

