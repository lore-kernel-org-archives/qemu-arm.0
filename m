Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp4912491wrq;
        Tue, 19 Jun 2018 02:33:08 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKItOLwxplrOWl5zxItt+ktiB7YFtwkyhc3deqIW1FNHoPqipvvRl8PfqDHLQfw8uDhzjnGq
X-Received: by 2002:ac8:2506:: with SMTP id 6-v6mr14754022qtm.9.1529400788083;
        Tue, 19 Jun 2018 02:33:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529400788; cv=none;
        d=google.com; s=arc-20160816;
        b=hLCi7wFuiA+sUVnhL8Qo6kfcJjbvNlLu7JV3lAbI7iUKAeN+Akha6yeeM5njTp3hSk
         mqjoHLWvuxZ8IFmYlC07goNyZH8sBXYRi1eFxB8/iMnJqIF0qMaqMH5ifOUglq89NQAq
         /NZSJxVAULL8M/VC7J0ml2drY4NB6oabC+o32lnIpH/g6rJ88+WsHzNmwa3f/B6MU+o3
         CDQFxcgRpDkqAMwzFRrt0O5Qr0ai5+5F97sAGGfET03BrsL4hVyTz0fyAfKdSOzyNC4D
         WL9zvVuwOqFBiEh4ucfjLcIjDQEZFihgxqeO3NBrJY7YnS3leG2DH/PvJ4E3yQKV6CK9
         QZmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=uiZhdkFakIH+BeBsqQSlmr4G+8GDLHtBW/ENL2MlOC0=;
        b=zz8n8gSsTnd6qJi119SdlhziqmcKjQzW+vSxPGeUUvA1Yv4HzoWdU1RTFkS8R4hCTV
         5/N3uRfIUdipAP/OtX18wZNcSKzd2XFxnv3hS6sF0inusKOIbeS1ptxLY59pQLVY4EmW
         jfRWQTxmraDeAkBBKBan9DEEwocg3nFIRHIUS+rPVIoKyq4RsbZ0peXvMtnySdDLW4Cy
         H4ALEcy45C0AdIOycVbq16MR+fVY6dnkdaE0RMaqXIr+F1tFFyd68Yz6EzQKFdzxD9PS
         vbOMNoZUbm3WeU/ShQHO+QlZhuYbES6mpgXKgE5aILYvgdmo2wuCKasQXY2P+H5lhwdR
         VHng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=iAxecnCd;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=wKkCH88N;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=wKkCH88N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d14-v6si7577214qvl.202.2018.06.19.02.33.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jun 2018 02:33:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=iAxecnCd;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=wKkCH88N;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=wKkCH88N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40263 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVD0d-0006Nw-EZ
	for alex.bennee@linaro.org; Tue, 19 Jun 2018 05:33:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38105)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fVCzG-0005Pj-6I
	for qemu-arm@nongnu.org; Tue, 19 Jun 2018 05:31:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fVCzB-0006GA-5s
	for qemu-arm@nongnu.org; Tue, 19 Jun 2018 05:31:42 -0400
Received: from greensocs.com ([193.104.36.180]:42315)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fVCzA-0006Fe-QN; Tue, 19 Jun 2018 05:31:37 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 05D3D44B873;
	Tue, 19 Jun 2018 11:31:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1529400688;
	bh=0saQ4Q0wniGNec2GgKxuLIqMsyfI+58IBwnw7NWSfaM=;
	h=From:To:Cc:Subject:Date;
	b=iAxecnCdNzcpUper5Kjhds12JkYvgOyyA+8zgOo5rlHcAMoKVBtR/XO6zbk6VbxDS
	rEXHwI0blX60wWLyZtp1NgX8Ls2g7WIQVckXUSHkcoXpiA19Toyy+aUAWklCReQhEU
	aGxOq8yEtTBRuQCT6QnuaIgWTIZ9ydqn+MVOa2LQ=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=wKkCH88N;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=wKkCH88N
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O54IXrk14i_c; Tue, 19 Jun 2018 11:31:27 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 329DB44B867; Tue, 19 Jun 2018 11:31:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1529400687;
	bh=0saQ4Q0wniGNec2GgKxuLIqMsyfI+58IBwnw7NWSfaM=;
	h=From:To:Cc:Subject:Date;
	b=wKkCH88N4ph38ZTx6aMbXfYkN9iefVrEwto1jsKs5F0UB+yQP38wyR7fMMQ55xM4W
	dW3NHAOb6OadkemdE93npDPcTb0drIiycdOIPo0PxW4IgTaA4LOqa6jFINHWCRQB/d
	xrlNdEN9DlfYHHA6xzQJ058l90n8Zm3hP8gZRj8A=
Received: from michell-laptop.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id C874E44B864;
	Tue, 19 Jun 2018 11:31:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1529400687;
	bh=0saQ4Q0wniGNec2GgKxuLIqMsyfI+58IBwnw7NWSfaM=;
	h=From:To:Cc:Subject:Date;
	b=wKkCH88N4ph38ZTx6aMbXfYkN9iefVrEwto1jsKs5F0UB+yQP38wyR7fMMQ55xM4W
	dW3NHAOb6OadkemdE93npDPcTb0drIiycdOIPo0PxW4IgTaA4LOqa6jFINHWCRQB/d
	xrlNdEN9DlfYHHA6xzQJ058l90n8Zm3hP8gZRj8A=
From: luc.michel@greensocs.com
To: qemu-devel@nongnu.org
Date: Tue, 19 Jun 2018 11:31:17 +0200
Message-Id: <20180619093124.24011-1-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v2 0/7] arm_gic: add virtualization extensions
 support
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
Cc: Peter Maydell <peter.maydell@linaro.org>, mark.burton@greensocs.com,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Luc MICHEL <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eahldkj9YFV5

From: Luc MICHEL <luc.michel@greensocs.com>

This patch series add support for the virtualization extensions in the
ARM GICv2 interrupt controller.

The first two commits do some refactoring to prepare for the
implementation. Commits 3 and 4 are the actual implementation. The last
commit updates the ZynqMP implementation to support virtualization.

The current state allows to boot Xen (tested with 4.8 and 4.10) with
Linux Dom0 guest properly.

I also tested in SMP. It does not work directly because Xen expects to
find CPU IDs in the GIC ITARGETSR0 register. This behavior is not
documented in the GICv2 specification, and is not implemented in QEMU.
By hacking this register, I was able to get the whole thing to boot in
SMP properly. This hack is not part of those patches though.

I also tested migration, it works fine AFAIK. I had to add the HYP and
SEC timers in the ARM CPU VMState though (Xen uses the HYP one) (not
part of those patches).

I want to thanks the Xilinx's QEMU team who sponsored this work for
their collaboration.

v2:
  - Add VMSTATE_UINT16_SUB_ARRAY to vmstate.h
  - Keep backward compatibility on the GIC VMState by storing vCPUs
    state in the virt VMState subsection.
  - Use h_apr to store APR value for vCPUs, instead of increasing apr 2D
    array. This adds a little complexity to the implementation (a bunch
    of `if (gic_is_vcpu(cpu))'), but avoid ugly VMState description for
    the apr array.

Luc MICHEL (7):
  intc/arm_gic: Refactor operations on the distributor
  intc/arm_gic: Remove some dead code and put some functions static
  vmstate.h: Provide VMSTATE_UINT16_SUB_ARRAY
  intc/arm_gic: Add the virtualization extensions to the GIC state
  intc/arm_gic: Add virtualization extensions logic
  intc/arm_gic: Improve traces
  xlnx-zynqmp: Improve GIC wiring and MMIO mapping

 hw/arm/xlnx-zynqmp.c             |  92 +++-
 hw/intc/arm_gic.c                | 790 ++++++++++++++++++++++++-------
 hw/intc/arm_gic_common.c         | 158 +++++--
 hw/intc/arm_gic_kvm.c            |  31 +-
 hw/intc/gic_internal.h           | 258 ++++++++--
 hw/intc/trace-events             |  12 +-
 include/hw/arm/xlnx-zynqmp.h     |   4 +-
 include/hw/intc/arm_gic_common.h |  51 +-
 include/migration/vmstate.h      |   3 +
 9 files changed, 1153 insertions(+), 246 deletions(-)

--=20
2.17.1

