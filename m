Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3730255wrt;
        Mon, 1 Oct 2018 04:58:04 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63KUkv0EOyx44WEgtIq8YhHpjCRyAGchgFn9TSthZys0RLxNtQINegIsZU7zYiN55BdpUgK
X-Received: by 2002:a0c:9230:: with SMTP id a45-v6mr8057596qva.124.1538395084542;
        Mon, 01 Oct 2018 04:58:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538395084; cv=none;
        d=google.com; s=arc-20160816;
        b=BZ1HANDilWnkksUvZVoWImzsbylwBopqldfwy0N/L6ADq4kw41sW+cmJSzQlPhlqJI
         9DL1LztI05p6xc0X9D/Uz6BldjOOz/T9bKn69xEvVImYjghnlqOPOlIazU6l9iurUL1J
         YMpMOIU3xK/YZXYiPb0JxgbSCI287tIrzHlIafUn5XwH9d+ewm17y5kTpRZRAuAewz/r
         Ha8C4n/rQ1m//kBEOSP6IdoIrx/u0xyynrAWmjuScTXPFi0bPsKgVtz18cIDv8yCv8V+
         fxrZoXIesfmN/vaEjKPEq7krkPi4UBeXdHFyeGyk6uDPpca8gXurS3n49hDrHAs7EtKD
         QnDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:dkim-signature:dkim-signature;
        bh=jfLNhswtJMUFamnn8LkHAyPdgY/JarExixZUb+37/sc=;
        b=NrR9+Tq6m2OAxCfpOAy3t8K96090QU46YMnKt5RKzhqOXt34KbIjpAun4H8vroJhLj
         rDBIfo7EWq5ctbR/MktCh+LW0t++MdhrS9YQGgscsMqI4h5Hkam30oWIeSstVu/NlJCz
         mCEcIj6NLv3rEwJ494D5ucAgoQqu4Mo/4Lpq8oW8f3NdMsDvx9+w8cJbABBUX0pNLm/W
         rBQBhWjXPB7Aret6evusdn8zgMrk1uxjq6MHR8YEwy+NjfF3/QYgiNswdhTVDg5CKwnM
         /8RM20x0ysVbwzrIbCBXqfPg/PoIqQZuJZ8BSaPD8OcGk5UR2cn+mw4piDAX74+9hpL3
         faKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=Yz7cqZ6z;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=jwtOWsnd;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=p9Eiqo3J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y198-v6si4875571qkb.231.2018.10.01.04.58.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Oct 2018 04:58:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=Yz7cqZ6z;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=jwtOWsnd;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=p9Eiqo3J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37795 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g6wpw-0002gS-0A
	for alex.bennee@linaro.org; Mon, 01 Oct 2018 07:58:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34906)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1g6wpO-0002NQ-IG
	for qemu-arm@nongnu.org; Mon, 01 Oct 2018 07:57:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1g6wpK-0005gH-Bs
	for qemu-arm@nongnu.org; Mon, 01 Oct 2018 07:57:30 -0400
Received: from greensocs.com ([193.104.36.180]:40041)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1g6wpF-0005SQ-W6; Mon, 01 Oct 2018 07:57:26 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id EC0B8511C72;
	Mon,  1 Oct 2018 13:57:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395028;
	bh=+qx1q9yK5m0Om6fDDmfIgGKAonwx+zBtob8Wmu7o8ow=;
	h=From:To:Cc:Subject:Date;
	b=Yz7cqZ6zJ8WOz5rzGudjr0nama34ADNB4eOCe3BW5D5H0HZfEKVdurPtIG7d4Dlgq
	CaWOXQQX0W2AIUv3kbK75g90lOpzcQ6u6WB0GS6vFnjoTRKJlbm90e3vvVn8aCILzi
	AKnWnDeeVUJ/pQrSRkFqni7xGcJ3/z9aS0SdKubY=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=jwtOWsnd;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=p9Eiqo3J
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SAeSzTVyLFgw; Mon,  1 Oct 2018 13:57:06 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 1D10B511C59; Mon,  1 Oct 2018 13:57:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395026;
	bh=+qx1q9yK5m0Om6fDDmfIgGKAonwx+zBtob8Wmu7o8ow=;
	h=From:To:Cc:Subject:Date;
	b=jwtOWsnd69TsArfIbH5kuXX2BjU2PguEiJnJKdwyaNrSwp2WL2D6hZLfIfcjHIsQu
	F6s7OGt2Ai/L8lAWYJ610uaEMMcz2r4C66jTBH4JOr/ipDMY/84u6I6jekkKuEXOVQ
	zd+K9u/Phodyp6MimwHc3TtjXwlm1VgPPI3yuR7E=
Received: from michell-laptop.home.lmichel.fr
	(LFbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id AF454511C51;
	Mon,  1 Oct 2018 13:57:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395025;
	bh=+qx1q9yK5m0Om6fDDmfIgGKAonwx+zBtob8Wmu7o8ow=;
	h=From:To:Cc:Subject:Date;
	b=p9Eiqo3JOeWJK2dLRfMqd2gXXdqtD6wT8Oq/ZyXPJwDJmY1t/sedt6xuYSZlBfsYV
	6+Oq9SWEOfYcMCr4cg3DSMaRr2O82/3epPmrtENti8I1hgF3jSqY+d0KDadw5ENuNB
	iF9higtSXI6odIHuXD5Qgk1ndEgLg7DoT45Pd6nU=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon,  1 Oct 2018 13:56:49 +0200
Message-Id: <20181001115704.701-1-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v2 00/15] gdbstub: support for the multiprocess
 extension
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o6paXWc4qb66

changes since v1:
  - rename qemu_get_thread_id() to gdb_fmt_thread_id() [Philippe]
  - check qemu_strtoul() return value for 'D' packets [Philippe]


This series adds support for the multiprocess extension of the GDB
remote protocol in the QEMU GDB stub.

This extension is useful to split QEMU emulated CPUs in different
processes from the point of view of the GDB client. It adds the
possibility to debug different kind of processors (e.g. an AArch64 and
an ARMv7 CPU) at the same time (it is not possible otherwise since GDB
expects an SMP view at the thread granularity.

CPUs are grouped using specially named QOM containers. CPUs that are
children of such a container are grouped under the same GDB process.

The last patch groups the CPUs of different model in the zynqmp machines
into separate processes.

To test this patchset, you can use the following commands:

(Note that this requires a recent enough GDB, I think GDB 7.2 is OK.
Also, it must be compiled to support both ARM and AArch64 architectures)

Run QEMU: (-smp 6 in xlnx-zcu102 enables both cortex-a53 and cortex-r5
CPUs)

qemu-system-aarch64 -M xlnx-zcu102 -gdb tcp::1234 -S -smp 6

Run the following commands in GDB:

target extended :1234
add-inferior
inferior 2
attach 2
info threads

I want to thanks the Xilinx's QEMU team who sponsored this work for
their collaboration and their prototype implementation.

Luc Michel (15):
  gdbstub: introduce GDB processes
  gdbstub: add multiprocess support to '?' packets
  gdbstub: add multiprocess support to 'H' and 'T' packets
  gdbstub: add multiprocess support to vCont packets
  gdbstub: add multiprocess support to 'sC' packets
  gdbstub: add multiprocess support to (f|s)ThreadInfo and
    ThreadExtraInfo
  gdbstub: add multiprocess support to Xfer:features:read:
  gdbstub: add multiprocess support to gdb_vm_state_change()
  gdbstub: add multiprocess support to 'D' packets
  gdbstub: add support for extended mode packet
  gdbstub: add support for vAttach packets
  gdbstub: processes initialization on new peer connection
  gdbstub: gdb_set_stop_cpu: ignore request when process is not attached
  gdbstub: add multiprocess extension support
  arm/xlnx-zynqmp: put APUs and RPUs in separate GDB groups

 include/exec/gdbstub.h |   8 +
 gdbstub.c              | 594 +++++++++++++++++++++++++++++++++++------
 hw/arm/xlnx-zynqmp.c   |   7 +-
 3 files changed, 531 insertions(+), 78 deletions(-)

--
2.19.0

