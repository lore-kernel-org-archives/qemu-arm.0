Received: by 10.28.71.27 with SMTP id u27csp869829wma;
        Fri, 19 Jan 2018 07:26:55 -0800 (PST)
X-Google-Smtp-Source: ACJfBov7ohiVhOj1PDmkWU5f+s43OP0hp26VEp0+gmyTLIChRCe9LzTvzNF+gi1HPO01Ok5b1CkB
X-Received: by 10.129.109.133 with SMTP id i127mr9477815ywc.444.1516375615306;
        Fri, 19 Jan 2018 07:26:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516375615; cv=none;
        d=google.com; s=arc-20160816;
        b=hb8405rpG0mgzVNIv9tIwob3sd2zZC/13XAh6Ooy89SE5N5DK6fqZ/YSqRDyfgwGkH
         VbcPZxkQ/VX2Uv1R2eSbGoR9UGAdZAi8owmpzniA06TXF8FIm/KXvvUP+M0UjleZmUhI
         d0Kbn/CyzSrGhUgRS6s3D7A4xXcFPB46vvMaUPETDSmB8xm52uVT+sCx3syxG9449uYP
         K0MEwa4Ht4ne8cGibLsZ/mKueU0vun0464s/jMr1cjiF9lW28d1VZdefjEUyubOpdWYs
         PbGtc3607Xo9JtCLxk0q3uqhke/vLz/Tu90vNoJ294iaOfY5+AHkKrTch1Cu70GeVp13
         bYfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=d7Z2GTZqInYVAx0LZjxlzwigERvAoia7CLIXHSpelWk=;
        b=SxUeMhN2riNUj7OT0Q59tWO08F/TbbPPvNizfzIcjP27m5nt8xZIe13L17xHPJZ/tr
         sPmKoJKx4QwH++dbKgvQcAgC/xSE3W+PM6SulBRTssk6LDHMX0By/R2Gkw8CQsoZCWCv
         ASC3nuQ1JndDKx1HTOlufIIM1maWJuo2e/UdslwB8tmFMheeGv2UQoT7UZHO5SsLnwy6
         yH4K4tD3GnVaILIDOF/97GedEufxAwOO9B15oPsT9Qgbj1ZRp2L2j8pgA0M0eWhKQii0
         1MRTvF3aA7HLDaHELUBjLb6HGJ+7kSga4ehcdwL7DS0tidrJGe0ieG//pLPzT1n839UF
         VEgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=3YWHIfWh;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=pnjtwPnJ;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=pnjtwPnJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=greensocs.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m12si635347ybk.746.2018.01.19.07.26.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Jan 2018 07:26:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=3YWHIfWh;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=pnjtwPnJ;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=pnjtwPnJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=greensocs.com
Received: from localhost ([::1]:55403 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecYZC-0001qr-QX
	for alex.bennee@linaro.org; Fri, 19 Jan 2018 10:26:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47029)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1ecY7U-0002mz-76
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 09:58:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1ecY7Q-0003ji-AX
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 09:58:16 -0500
Received: from greensocs.com ([193.104.36.180]:39274)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1ecY7P-0003iI-W9; Fri, 19 Jan 2018 09:58:12 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id B2091319FD3;
	Fri, 19 Jan 2018 15:58:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1516373882;
	bh=592Ng7gZdi0szyiygvvxKnrzp/fpzdTujv8RK8I1cT0=;
	h=From:To:Cc:Subject:Date;
	b=3YWHIfWhQCOyOMLgyJQmz+glGZsw+g8/wE20L/hOeLV8fqMOw5+qqYt4/PbR9JZcM
	rLirTbgCwiVEHPC3ASZG8TI5H9UyJ2kx4YSNMqBHRZA1ip/HDJXMoL1AZZuz8mYUYT
	HEgclpd5jQoROPE6TgB7tpAP12+1GlaRcE8txWkw=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=pnjtwPnJ;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=pnjtwPnJ
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QjG1Ayaxzliv; Fri, 19 Jan 2018 15:57:59 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 77FAE65A14; Fri, 19 Jan 2018 15:57:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1516373879;
	bh=592Ng7gZdi0szyiygvvxKnrzp/fpzdTujv8RK8I1cT0=;
	h=From:To:Cc:Subject:Date;
	b=pnjtwPnJT+atuGNSs1UFgwvU258qlk3zdr3+uL+97TJnO0pu4j9IBqsOUinloESDD
	tpTbIfMQY9q+e2PyrWefLE6h/pJ99ost5CNzmDp5z2qpI601kAif1x9O2dzl6kNIbS
	3cqOdxN2LCrCGBa14wxj8GdAy/d7DUqI4KQntocA=
Received: from michell-laptop.hive.antfield.fr (tima-dhcp-h14.imag.fr
	[147.171.132.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 240AD5E2E5;
	Fri, 19 Jan 2018 15:57:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1516373879;
	bh=592Ng7gZdi0szyiygvvxKnrzp/fpzdTujv8RK8I1cT0=;
	h=From:To:Cc:Subject:Date;
	b=pnjtwPnJT+atuGNSs1UFgwvU258qlk3zdr3+uL+97TJnO0pu4j9IBqsOUinloESDD
	tpTbIfMQY9q+e2PyrWefLE6h/pJ99ost5CNzmDp5z2qpI601kAif1x9O2dzl6kNIbS
	3cqOdxN2LCrCGBa14wxj8GdAy/d7DUqI4KQntocA=
From: luc.michel@greensocs.com
To: qemu-devel@nongnu.org
Date: Fri, 19 Jan 2018 15:57:51 +0100
Message-Id: <20180119145756.7629-1-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.16.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
X-Mailman-Approved-At: Fri, 19 Jan 2018 10:23:16 -0500
Subject: [Qemu-arm] [PATCH 0/4] arm_gic: Various fixes
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Luc MICHEL <luc.michel@git.antfield.fr>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m5jjrdtq1FUN

From: Luc MICHEL <luc.michel@git.antfield.fr>

Hi,

Here is a patch set for issues I found in the GIC. I found those by
writing unitary tests for the GIC, and compared the result against
real hardware (a Zynq UltraScale+ board with a GICv2).

The first patch prevents the GIC from signaling an IRQ that is in the
"active and pending" state. I encountered this bug in a test where I
split end of interrupt and interrupt deactivation. The GIC was
re-signaling the IRQ after priority drop if it was raised again, while
it has not been deactivated yet (and thus was in the "active and
pending" state).

The second patch returns a correct "Idle priority" value when reading
C_RPR if there is no active interrupt.

The last two patches fix issues around the Binary Point Register (the
group priority computation of group 1 IRQs when C_CTRL.CBPR is 0, and
the non-secure view of C_BPR when C_CTRL.CBPR is 1).

Luc MICHEL (4):
  hw/intc/arm_gic: Prevent the GIC from signaling an IRQ when it's
    "active and pending"
  hw/intc/arm_gic: Fix C_RPR value on idle priority
  hw/intc/arm_gic: Fix group priority computation for group 1 IRQs
  hw/intc/arm_gic: Fix the NS view of C_BPR when C_CTRL.CBPR is 1

 hw/intc/arm_gic.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

-- 
2.16.0

