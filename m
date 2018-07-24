Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp6954885wru;
        Tue, 24 Jul 2018 08:36:40 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpe+Nhp++llOXEgzT1BIQ62T4VAnOnaRppUuPpOx1Hh4kg8Tx3GEhNtKBSWkjdNqDgnc7rwk
X-Received: by 2002:ac8:d4a:: with SMTP id r10-v6mr16729701qti.271.1532446600660;
        Tue, 24 Jul 2018 08:36:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532446600; cv=none;
        d=google.com; s=arc-20160816;
        b=eb1Q2+eUNgKuwE8viN/JF78nF5WBAbH/MQ5LBLUjZea6G3YgYmurFh3bydc2lTGD4o
         hwu77Pn6JZ4jsWB1gR1HJ44zo5vNeHNWbZDmIG1QXP29EnDEakZpTjeDUCsokf0yIQEc
         RpQn5INRBDbf8O5DTZxBsvt4TvZIx6xQbPjuxZS3pcVLtw0SZ2sE2Q345lb+ugOQFwIH
         8t9/7t5sfEfsS7gaGJY942X9H7Lt3Yw5GodrmdEyE8Os6KsvBwWlOUAOK9kyhhkOIULR
         LzyBP6GJeaP0qFLyhS391bJj3tmp+g/jALVDpv9THOR4FspviHl6Tf8HuKbJ+gD3ELn7
         a8ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=zdbDWa+BM5jgf4nFD2dLQLXsPFAfgVmLbySqcWmwoX8=;
        b=NfXN++295xN4uBr6TvM0rbq4HTxfyO0uXkWPgWLT6zCgpD9tDCdhun/oSs/IP6P73f
         aEinnpQPLSbvk4mP/74t39EyQOIrDWFbqH1MW1aAcKdOEZVGdX2mTketw/1rFayqCu0r
         tGzb66rEybN7OyP7TCZPd6Sqwjw6JwRfj0GD667dFv09sX+bukOUxmrkewBTa84QUFsX
         3ebFbuWp5DlM0XCmLAFv2LQwhlDpYqy42iswZbphNqd8YdGtAXDm+0LC4pv2r6y8j/Af
         xi3105C2tBa9qCvOjeyGHmlv9TQoS847+GGMoIXZ7X19K1JFIXeLTvjWjX5EXJTzmPId
         ggow==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s58-v6si417586qtc.107.2018.07.24.08.36.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Jul 2018 08:36:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41167 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fhzMe-0002Kv-08
	for alex.bennee@linaro.org; Tue, 24 Jul 2018 11:36:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50692)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fhzMS-0002Jd-L2
	for qemu-arm@nongnu.org; Tue, 24 Jul 2018 11:36:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fhzMR-0003jm-JX
	for qemu-arm@nongnu.org; Tue, 24 Jul 2018 11:36:28 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43728)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fhzMR-0003cp-CJ; Tue, 24 Jul 2018 11:36:27 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fhzMH-00008n-QE; Tue, 24 Jul 2018 16:36:17 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 24 Jul 2018 16:36:16 +0100
Message-Id: <20180724153616.32352-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-3.0] hw/misc/tz-mpc: Zero the LUT on
 initialization, not just reset
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
Cc: Thomas Huth <thuth@redhat.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mQxkjcADDUv/

In the tz-mpc device we allocate a data block for the LUT,
which we then clear to zero in the device's reset method.
This is conceptually fine, but unfortunately results in a
valgrind complaint about use of uninitialized data on startup:

==30906== Conditional jump or move depends on uninitialised value(s)
==30906==    at 0x503609: tz_mpc_translate (tz-mpc.c:439)
==30906==    by 0x3F3D90: address_space_translate_iommu (exec.c:511)
==30906==    by 0x3F3FF8: flatview_do_translate (exec.c:584)
==30906==    by 0x3F4292: flatview_translate (exec.c:644)
==30906==    by 0x3F2120: address_space_translate (memory.h:1962)
==30906==    by 0x3FB753: address_space_ldl_internal (memory_ldst.inc.c:36)
==30906==    by 0x3FB8A6: address_space_ldl (memory_ldst.inc.c:80)
==30906==    by 0x619037: ldl_phys (memory_ldst_phys.inc.h:25)
==30906==    by 0x61985D: arm_cpu_reset (cpu.c:255)
==30906==    by 0x98791B: cpu_reset (cpu.c:249)
==30906==    by 0x57FFDB: armv7m_reset (armv7m.c:265)
==30906==    by 0x7B1775: qemu_devices_reset (reset.c:69)

This is because of a reset ordering problem -- the TZ MPC
resets after the CPU, but an M-profile CPU's reset function
includes memory loads to get the initial PC and SP, which
then go through an MPC that hasn't yet been reset.

The simplest fix for this is to zero the LUT when we
initialize the data, which will result in the MPC's
translate function giving the right answers for these
early memory accesses.

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I think the long-term solution is probably for the M profile
reset not to load PC and SP in its reset function (which
has other issues, like not interacting nicely with ROM
images which write to aliased memory regions), but that's
complicated...

 hw/misc/tz-mpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/tz-mpc.c b/hw/misc/tz-mpc.c
index 8316079b4bf..e0c58ba37ec 100644
--- a/hw/misc/tz-mpc.c
+++ b/hw/misc/tz-mpc.c
@@ -547,7 +547,7 @@ static void tz_mpc_realize(DeviceState *dev, Error **errp)
     address_space_init(&s->blocked_io_as, &s->blocked_io,
                        "tz-mpc-blocked-io");
 
-    s->blk_lut = g_new(uint32_t, s->blk_max);
+    s->blk_lut = g_new0(uint32_t, s->blk_max);
 }
 
 static int tz_mpc_post_load(void *opaque, int version_id)
-- 
2.17.1

