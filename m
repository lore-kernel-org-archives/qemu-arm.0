Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp123466wrw;
        Fri, 9 Nov 2018 09:36:45 -0800 (PST)
X-Google-Smtp-Source: AJdET5deceeVuzZgBr9cRqdZuiEAXarPmb0ju/NNTObVjm+LdQTmdIEcysABnLx6pdu5WB4XOi6z
X-Received: by 2002:a0c:8822:: with SMTP id 31mr9713898qvl.5.1541785005361;
        Fri, 09 Nov 2018 09:36:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541785005; cv=none;
        d=google.com; s=arc-20160816;
        b=o3sicw8rLfswW+OS+y95sMSLpAaFymBjiG9szKbIyn3f31YoNtCBeZAysBoFH00n4L
         cjJ6bbj+3mbkWtNGs8cjOh7sO2Hv5xIeou2ieLxIv/FaGgnhvfdZxBcdFbG5vcy8HzjW
         hRUcM7toeA9PDHZL5clDI0czGrgCC8AYqOESR4ScYz+WFm5+z6aHlOTyl5/fyTdEIKOa
         bkeiDdmLFIMIDSvfdni/BH/NhdGqdYmo944Hr6q5H+F2yXMpQ5ARyHdqLaEHghConqwg
         2iJy05MedgOziA5PRJhbwSevNjBPm5px3y7Uq+HV/anB7BRWwMiLuNFZAvHmQNwtH+F7
         Zyxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=n1A9HspsKtvP+1NkzZ1Zr+WC+c2qRdvKOE+ynK6QGOc=;
        b=jkIxC/vXjwk1OzKGZGi5HvNsvDANn06krI+w7q75McZyjj/AY5zeREvfW4kkFADb3e
         VExtk7J7dJWPz/PucOAG69HPmeXBoUEiZ0IqJeVOY5QvDNRog28fr+orakbOlnnsA22C
         /QzEK4/Zdf1xqOv1GJThujdOaTI3HO4A4GytnEAcEbz/C3QWClaBvHK3xjGUU6QLn6EM
         QXtsLKKjXnrMsNx65eYx+G+J24FV+BI7x4iYyGS8l3AWLyorUtwdFv3vsB74/0n5prIp
         qjF8mBzplxM/pQadv5KUjlFxq6fGlHsSVd4UhAlu2fGDkN6I2x8tvDYFC6ShbWg9ELmr
         nRPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j129si53121qkc.168.2018.11.09.09.36.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Nov 2018 09:36:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35326 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gLAi4-0004Fr-SJ
	for alex.bennee@linaro.org; Fri, 09 Nov 2018 12:36:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59447)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gLAha-00041R-GV
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 12:36:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gLAhZ-0001DI-Gp
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 12:36:14 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:52472)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1gLAhX-000169-4K; Fri, 09 Nov 2018 12:36:11 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1gLAhI-0002t1-Hv; Fri, 09 Nov 2018 17:35:56 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  9 Nov 2018 17:35:51 +0000
Message-Id: <20181109173553.22341-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 0/2] Fix the last Hyp mode bug and turn it on for
 A7, A15
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
Cc: Adam Lackorzynski <adam.lackorzynski@kernkonzept.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: odI/sabhJ+Tr

This patchset fixes the last serious bug in our implementation
of Hyp mode (aka EL2 for AArch32), and turns the feature bit
on for the Cortex-A7 and Cortex-A15 CPUs.

The bug is that Hyp mode is an exception to the previous
general rule that every AArch32 mode (except SYS, which
always shares with USR) has its own banked r13, r14 and
SPSR. Instead Hyp has a banked r13 and SPSR, but r14 is
shared with USR and SYS. We were accidentally implementing
it as banked, which results in remarkably nonobvious
failure modes.

With this fix, I can boot an AArch32 guest that uses KVM to
boot an AArch32 nested guest, and I can also boot an L4Re/
Fiasco guest successfully.

Not entirely sure what to do about this for 3.1 -- maybe
put in the bugfix patch but hold off on actually setting
the feature bit til 4.0?

thanks
-- PMM

Peter Maydell (2):
  target/arm: Hyp mode R14 is shared with User and System
  target/arm/cpu: Give Cortex-A15 and -A7 the EL2 feature

 target/arm/internals.h | 16 ++++++++++++++++
 target/arm/cpu.c       |  2 ++
 target/arm/helper.c    | 29 +++++++++++++++--------------
 target/arm/kvm32.c     |  4 ++--
 target/arm/op_helper.c |  2 +-
 5 files changed, 36 insertions(+), 17 deletions(-)

-- 
2.19.1

