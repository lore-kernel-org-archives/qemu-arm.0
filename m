Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp757456wrt;
        Tue, 25 Sep 2018 07:41:41 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62bDgs0yKaR8opkGSa3sIdn4WDGS6Mjmv97CGiHWB+3OGk/7kgNq6f+kibIPpJ21SH7uJ4N
X-Received: by 2002:a37:655:: with SMTP id 82-v6mr923374qkg.223.1537886501224;
        Tue, 25 Sep 2018 07:41:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537886501; cv=none;
        d=google.com; s=arc-20160816;
        b=zg52xTeCnNjfhHpKm2xiBGcLTPSP6z3J2khe9yKH6uCzJzDz7cpcA497CAPXgfCI84
         bjzBameEunGpL1H89X6Ta7WYQQKuSlhqSeaoe5Q7ffjmOB0fYixV1ru6KiKGbw+2UHYr
         bLmFK47Si2O5zwjY4C1//o8C/tUtY+1qx3Ibhvn0gIW87/aOrMkwx5lq3w4rdzNvAIGe
         Qot6ZoZbSlhw2uWy3UZOpeN7PM9EnmhHjpSx8ruGGOj8TmnUTWA0FeKBOS0c6GUe86pb
         XWTZ4A0VGhpjbV3UceRzmkv4A+c/Mtngf2DxS4dvs8+QTCAjxZD72C7BDHGLXWAAxcf5
         +OHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=1soVMTDkFpRwkooSQ7BM+/MvrrWYYnrsZl7jLTIvkbw=;
        b=TIu02a6v4fSdagvlBrLizFetexJRhSiYhGyOTkui8Pj8RatCigfOIZPcNBEFocky2R
         T1/2p/ihWykjObTecSz+YYoPNKVO/aOjZ2Brhy6FncNVBwIfdJxCTv+VwPHjJJx9sF06
         mIaP9rWoqZw1DDX2Sxo07ZC+PMqCoMsI2VuXuoxhCJfP0snED+wlKG9mZoe2Zb5eTRBq
         fa6nTIwUI94XIomc234Nr4YBFnaHtwPSW2Q0qM5EZK6rocC3Mk4UKn0Um99+/1eNweix
         UHs293UpJnvHmJyrj1skh2ZK7i2p7P49yPN5Nd58WRZavjnC+Qo3md0vAqmxPn55JlmD
         G36w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r8-v6si1890867qkk.286.2018.09.25.07.41.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Sep 2018 07:41:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53514 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4oWy-0003cj-Pa
	for alex.bennee@linaro.org; Tue, 25 Sep 2018 10:41:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33308)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1g4oWr-0003ac-4h
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 10:41:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1g4oWq-0007Nb-DM
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 10:41:33 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:48618)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1g4oWq-0007Mw-5P; Tue, 25 Sep 2018 10:41:32 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1g4oWo-0001Ep-4n; Tue, 25 Sep 2018 15:41:30 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 25 Sep 2018 15:41:27 +0100
Message-Id: <20180925144127.31965-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH] virt: Suppress external aborts on virt-2.10 and
 earlier
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
Cc: Idwer Vollering <idwer@cuckoo.sh>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3viMbrBYUrsV

In commit c79c0a314c43b78 we enabled emulation of external aborts
when the guest attempts to access a physical address with no
mapped device. In commit 4672cbd7bed88dc6 we suppress this for
most legacy boards to prevent breakage of previously working
guests, but we didn't suppress it in the 'virt' board, with
the rationale "we know that guests won't try to prod devices
that we don't describe in the device tree or ACPI tables". This
is mostly true, but we've had a report of a Linux guest image
that this did break. The problem seems to be that the guest
is (incorrectly) configured with a DEBUG_UART_PHYS value that
tells it there is a uart at 0x10009000 (which is true for
vexpress but not for virt), so in early bootup the kernel
probes this bogus address.

This is a misconfigured guest, so we don't need to worry
about it too much, but we can arrange that guests that ran
on QEMU v2.10 (before c79c0a314c43b78) will still run on
the "virt-2.10" board model, by suppressing external aborts
only for that version and earlier. This seems a reasonable
compromise.

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0b57f87abcb..3ba310a37b6 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1926,6 +1926,7 @@ static void virt_machine_2_10_options(MachineClass *mc)
 {
     virt_machine_2_11_options(mc);
     SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_10);
+    mc->ignore_memory_transaction_failures = true;
 }
 DEFINE_VIRT_MACHINE(2, 10)
 
-- 
2.19.0

