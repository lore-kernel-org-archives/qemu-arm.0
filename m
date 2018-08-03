Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp268915wru;
        Fri, 3 Aug 2018 09:37:17 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpf56hS5I/hpNAoFJ4NrryXmpft510cg7bznFYEvnhBNiNnp0V9tBm7Pmg2/CFW3CaHp4zOT
X-Received: by 2002:a37:56c7:: with SMTP id k190-v6mr4152591qkb.29.1533314237498;
        Fri, 03 Aug 2018 09:37:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533314237; cv=none;
        d=google.com; s=arc-20160816;
        b=gdnVSb9IN9kaNpxAT8tnSySZJl8/QNk6TLoaGjqzd+B8OoWiils0Dlzulz3ypyRf6C
         WgDjrrNav5YuzTsCEPzQMxiNfYOHoXoM9eFZYSNN6qEZGto6qxLZrPGsfspxVAiTUSPl
         NwiwzNN02KG7+RDhPaAr28P0/R8fzGLx4bgFf2EtjYqDcgnTleDDrmzpQuQl+UDdX4gu
         wUzIEdKpFCsrml6iPiMwByTLro2H3dqAeaCzGzXRt4UWqtceGFMCnYIUen8FegT/nfTf
         KH0BqYRvY4Lj1d5waGJsbKxUIStJX6snDn76wq3ru5GfV3GJx5sZCdQitJijowlIqSOt
         ySIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=xWN6t1Qz/roGnGQsBzcp/aNOuoIpfmQ2/3WbWdHZOHs=;
        b=qgj1WgXn6L0e/Ml2WezmW8893fTGENayUZYjN8/rC3NQr9P2AaiVlyyeD9hizOHOX7
         bEdaIty9TY5JE8EBub17PGHVSBbMTBDSDE0bKZz5tCz8A6tjgVxmHKLfXXS1rPsqT5Gn
         31GwLSW2VbhehgGf7WZnwn25ImZoi+wxVwFfmapT3E+cyCMD8CHMP+W56Gzq4BcQBcJM
         lbhWK1gtp40JIZleZn4wIExGhjuEZQbpAfQ3Zr/nzyVGDLPML0DTmIBVKob9vVJjQzSu
         Bhf66+fTLNA97UtbGE3onLN5IjOkenOw3giT4H/f2F9cWW+gIr0iJ5F0CK4OqM4UmPtc
         phhw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b16-v6si5400106qkh.379.2018.08.03.09.37.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Aug 2018 09:37:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52245 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fld4m-0004OY-Sl
	for alex.bennee@linaro.org; Fri, 03 Aug 2018 12:37:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48916)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fld4V-0004O5-Ce
	for qemu-arm@nongnu.org; Fri, 03 Aug 2018 12:37:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fld4U-0006Vj-K8
	for qemu-arm@nongnu.org; Fri, 03 Aug 2018 12:36:59 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44042)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fld4U-0006RQ-Ci; Fri, 03 Aug 2018 12:36:58 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fld4L-00075h-OX; Fri, 03 Aug 2018 17:36:49 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  3 Aug 2018 17:36:43 +0100
Message-Id: <20180803163646.31068-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 0/3] Arm migration fixes for 3.0
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
Cc: Juan Quintela <quintela@redhat.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wPYhFsb5q3bS

This patchset primarily fixes problems with Arm migration
induced by a bug in the core vmstate handling of subsections:
currently the migration code incorrectly treats a subsection with
no .needed function pointer as if it was the subsection list
terminator -- it is ignored and so is everything after it.

I did an audit of all uses of subsections in QEMU, and found
that we had four which didn't define a .needed function (assuming
that this meant "always needed", same as the semantics for
not providing a .needed function for a toplevel vmsd).
This patchset fixes them all up by providing a dummy needed
function.

It also fixes an error in vmstate_gicv3_cpu which was accidentally
initializing .subsections twice and so ignoring one of the subsections.

Strictly speaking only the first patch is a true regression from 2.12.

Disclaimer: compile tested only as I have to rush out the door in a
moment, but I wanted to get these on-list for review given that
rc4 isn't too far away... I'll test them properly on Monday.

thanks
-- PMM

Peter Maydell (3):
  hw/intc/arm_gicv3_common: Give no-migration-shift-bug subsection a
    needed function
  hw/intc/arm_gicv3_common: Combine duplicate .subsections in
    vmstate_gicv3_cpu
  target/arm: Add dummy needed functions to M profile vmstate
    subsections

 hw/intc/arm_gicv3_common.c | 9 ++++++---
 target/arm/machine.c       | 3 +++
 2 files changed, 9 insertions(+), 3 deletions(-)

-- 
2.17.1

