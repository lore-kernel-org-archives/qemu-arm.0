Received: by 10.25.0.147 with SMTP id 141csp225823lfa;
        Fri, 3 Mar 2017 04:32:35 -0800 (PST)
X-Received: by 10.55.40.77 with SMTP id o74mr2432205qkh.288.1488544355751;
        Fri, 03 Mar 2017 04:32:35 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id 30si9266265qtr.25.2017.03.03.04.32.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Mar 2017 04:32:35 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx10.intmail.prod.int.phx2.redhat.com (int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DDE3737E72;
	Fri,  3 Mar 2017 12:32:35 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id v23CWYRT026632;
	Fri, 3 Mar 2017 07:32:34 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org
Subject: [PATCH] [RFT] target/arm/arm-powerctl: Fix psci info return values
Date: Fri,  3 Mar 2017 13:32:32 +0100
Message-Id: <20170303123232.4967-1-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Fri, 03 Mar 2017 12:32:35 +0000 (UTC)
X-TUID: bUgPW2ES3Ds1

The power state spec section 5.1.5 AFFINITY_INFO defines the
affinity info return values as

  0 ON
  1 OFF
  2 ON_PENDING

I grepped QEMU for power_state to ensure that no assumptions
of OFF=0 were being made.

Signed-off-by: Andrew Jones <drjones@redhat.com>

---

I found this with the yet to be committed kvm-unit-tests test
https://lists.cs.columbia.edu/pipermail/kvmarm/2017-February/023820.html

I've added the RFT because I didn't bother to confirm Linux is still
happy (although I can't see why it wouldn't be happier).

 target/arm/cpu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 25ceaabb5ded..a8aabce7ddd5 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -536,8 +536,8 @@ typedef void ARMELChangeHook(ARMCPU *cpu, void *opaque);
 /* These values map onto the return values for
  * QEMU_PSCI_0_2_FN_AFFINITY_INFO */
 typedef enum ARMPSCIState {
-    PSCI_OFF = 0,
-    PSCI_ON = 1,
+    PSCI_ON = 0,
+    PSCI_OFF = 1,
     PSCI_ON_PENDING = 2
 } ARMPSCIState;
 
-- 
2.9.3
