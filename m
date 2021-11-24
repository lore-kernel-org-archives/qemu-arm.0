Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp11110881lfk;
        Wed, 24 Nov 2021 12:20:08 -0800 (PST)
X-Received: by 2002:adf:da41:: with SMTP id r1mr1310788wrl.443.1637785208450;
        Wed, 24 Nov 2021 12:20:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637785208; cv=none;
        d=google.com; s=arc-20160816;
        b=N/Of4240jx/DUeUidrFANpOIdJeJLGyXZKowawOhUc+53WVRaxiUHuLTsaNKMz1TJ1
         cAE5LVoNbmbFFyzoGWW2/GE/v8mAdo9R07inagyjanx8L83M7FaModi/e88jWI8CY/d4
         VDZjmKbTMz/+He8NWk4IbdrUWvYzqdY6lV4SPhnCVysZmq9OsWzLiRbnnM1zRBVWywxM
         K1fXRRqDfh2sqENVw4tUdICqCAL9U9oFeoVIweGVZudha4Zpwn8NAdwYYeA9UFXVGpTf
         dN3HbJYnMgb23G6FMmg6NYv9lQeRMcKbw9eWnXcWu7Lw7HVFMk5AJeSxheJ5sZeDw9I7
         WhBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=iY3zkci67KDhAgVHHsM976TrmI5TaYyabwOsKa3QFw0=;
        b=aDOUvMf461I8o9UT9qGAv6qJw+PTChf2fZLYhdZgdgOPBvBWr1mZeJInPKtCKccuV3
         N2jl5dhNvvXPQCjQgk2KrLEedtEweXlM7H7WwgXMijgm/g/sdmTMbpiOuxnuoS7bHVs7
         7gOpDO5gmYXv23zrOI3oELPK8PnAf6oSeI15Im0pkBQJOdW8jLyh4/q28UBU8XqP0gjn
         /RK2j1g4lsqQ5iPI5CC3R5vBVVIhxPssNiJlxyiz7uIKTVemgLpHznYe+DMeN5hNrMyL
         3zPSRH9OXyA5QRBOpvkaUGH0KDCRcDE/h1P83kKAMpSipXjQDdtGbzpNDmZY4IacIcxS
         H4Ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MSWIXsTs;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p17sor659993wrf.4.2021.11.24.12.20.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 24 Nov 2021 12:20:08 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MSWIXsTs;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iY3zkci67KDhAgVHHsM976TrmI5TaYyabwOsKa3QFw0=;
        b=MSWIXsTsU62FeZg0ctFu1/cC9L3JIFmQmN18rEJ6+JY4sCUMnYkwzCGhtd9nw4+TRY
         +ChscKmC9BiWABUiPj5p4u6hyo4loQ80Dgl+zZrKYE5jE6JjqDszad4LkouwuTId8hBk
         2+mz6mR7haXAyUzlOUmQ2+Vihe32+HzPNF1Q8iQ3FH7sYnsVwtfAjydQh63YdwY77XyP
         vjxOi6QAtkAMDWjfnlw/eZOsTiOXjf+Y8IDbOxNLVohGiw4mYyHRgxMrYUGuAFSJrkR2
         M7Pl1eUGCiUlrKzsV7aWvr7ua+ru1LzSCMmADAenLmZTuQ0+buA8ABhK5kCFzwC5csjo
         qLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iY3zkci67KDhAgVHHsM976TrmI5TaYyabwOsKa3QFw0=;
        b=ytowMzAQ5ljA8iKXkpbnG0NZE/18hW20HWOsCfucAvNyO3xN0ilecuAPF9KOw/Q1xK
         6xN3Q2cvYUdgUPRwLDsROPADyJiifBK83pBjuoV7d/UfgKJ5s4Gh+F92CpGyUeOcSQ74
         YDW+E/PEy0rLJ1c9qvcyqwOTEgjFru0z2ysqrE5+jRWOxszh2jD+ISBv1fBXnNp3zLLS
         bsSSUT5rOyQvTClV/NEfoFHEJ3ewCD9E7vcHr+vddmRJpdQU9quFibqOoE+7wu1Tc9KF
         nXJvrJDh7yp0epCX7XsPAJHaJb9v1EUc+O9tjd7rCgEhWia2YioI9zRHsEcXDZV3PJkp
         iaBg==
X-Gm-Message-State: AOAM5321vja6Y7c6iCVf9VxeMU0F/PeVBb6IBfKU4dJaG28jcaUXHLBU
	p/sLsD9ak9suZ6E9Q1cfX8MYj32u
X-Google-Smtp-Source: ABdhPJzbfoElgxemVSe5I041jyck63e+vQ7OZSiZ1GkCPI29oLet+TPFZ/vbk6ayGjedIwPy67BQ1Q==
X-Received: by 2002:a5d:460d:: with SMTP id t13mr22262927wrq.44.1637785207894;
        Wed, 24 Nov 2021 12:20:07 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id b10sm793944wrt.36.2021.11.24.12.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 12:20:07 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH v2] hw/intc/arm_gicv3: Update cached state after LPI state changes
Date: Wed, 24 Nov 2021 20:20:05 +0000
Message-Id: <20211124202005.989935-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: XJP/vEfSIsoc

The logic of gicv3_redist_update() is as follows:
 * it must be called in any code path that changes the state of
   (only) redistributor interrupts
 * if it finds a redistributor interrupt that is (now) higher
   priority than the previous highest-priority pending interrupt,
   then this must be the new highest-priority pending interrupt
 * if it does *not* find a better redistributor interrupt, then:
    - if the previous state was "no interrupts pending" then
      the new state is still "no interrupts pending"
    - if the previous best interrupt was not a redistributor
      interrupt then that remains the best interrupt
    - if the previous best interrupt *was* a redistributor interrupt,
      then the new best interrupt must be some non-redistributor
      interrupt, but we don't know which so must do a full scan

In commit 17fb5e36aabd4b2c125 we effectively added the LPI interrupts
as a kind of "redistributor interrupt" for this purpose, by adding
cs->hpplpi to the set of things that gicv3_redist_update() considers
before it gives up and decides to do a full scan of distributor
interrupts. However we didn't quite get this right:
 * the condition check for "was the previous best interrupt a
   redistributor interrupt" must be updated to include LPIs
   in what it considers to be redistributor interrupts
 * every code path which updates the LPI state which
   gicv3_redist_update() checks must also call gicv3_redist_update():
   this is cs->hpplpi and the GICR_CTLR ENABLE_LPIS bit

This commit fixes this by:
 * correcting the test on cs->hppi.irq in gicv3_redist_update()
 * making gicv3_redist_update_lpi() always call gicv3_redist_update()
 * introducing a new gicv3_redist_update_lpi_only() for the one
   callsite (the post-load hook) which must not call
   gicv3_redist_update()
 * making gicv3_redist_lpi_pending() always call gicv3_redist_update(),
   either directly or via gicv3_redist_update_lpi()
 * removing a couple of now-unnecessary calls to gicv3_redist_update()
   from some callers of those two functions
 * calling gicv3_redist_update() when the GICR_CTLR ENABLE_LPIS
   bit is cleared

(This means that the not-file-local gicv3_redist_* LPI related
functions now all take care of the updates of internally cached
GICv3 information, in the same way the older functions
gicv3_redist_set_irq() and gicv3_redist_send_sgi() do.)

The visible effect of this bug was that when the guest acknowledged
an LPI by reading ICC_IAR1_EL1, we marked it as not pending in the
LPI data structure but still left it in cs->hppi so we would offer it
to the guest again.  In particular for setups using an emulated GICv3
and ITS and using devices which use LPIs (ie PCI devices) a Linux
guest would complain "irq 54: nobody cared" and then hang.  (The hang
was intermittent, presumably depending on the timing between
different interrupts arriving and being completed.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I think this is now a proper fix for the problem. Testing
definitely welcomed... The commit message makes it sound like a bit
of a "several things in one patch" change, but it isn't really IMHO:
I just erred on the side of being very verbose in the description...
---
 hw/intc/gicv3_internal.h   | 17 +++++++++++++++++
 hw/intc/arm_gicv3.c        |  6 ++++--
 hw/intc/arm_gicv3_redist.c | 14 ++++++++++----
 3 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index a0369dace7b..70f34ee4955 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -463,7 +463,24 @@ void gicv3_dist_set_irq(GICv3State *s, int irq, int level);
 void gicv3_redist_set_irq(GICv3CPUState *cs, int irq, int level);
 void gicv3_redist_process_lpi(GICv3CPUState *cs, int irq, int level);
 void gicv3_redist_lpi_pending(GICv3CPUState *cs, int irq, int level);
+/**
+ * gicv3_redist_update_lpi:
+ * @cs: GICv3CPUState
+ *
+ * Scan the LPI pending table and recalculate the highest priority
+ * pending LPI and also the overall highest priority pending interrupt.
+ */
 void gicv3_redist_update_lpi(GICv3CPUState *cs);
+/**
+ * gicv3_redist_update_lpi_only:
+ * @cs: GICv3CPUState
+ *
+ * Scan the LPI pending table and recalculate cs->hpplpi only,
+ * without calling gicv3_redist_update() to recalculate the overall
+ * highest priority pending interrupt. This should be called after
+ * an incoming migration has loaded new state.
+ */
+void gicv3_redist_update_lpi_only(GICv3CPUState *cs);
 void gicv3_redist_send_sgi(GICv3CPUState *cs, int grp, int irq, bool ns);
 void gicv3_init_cpuif(GICv3State *s);
 
diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
index c6282984b1e..9f5f815db9b 100644
--- a/hw/intc/arm_gicv3.c
+++ b/hw/intc/arm_gicv3.c
@@ -186,7 +186,9 @@ static void gicv3_redist_update_noirqset(GICv3CPUState *cs)
      * interrupt has reduced in priority and any other interrupt could
      * now be the new best one).
      */
-    if (!seenbetter && cs->hppi.prio != 0xff && cs->hppi.irq < GIC_INTERNAL) {
+    if (!seenbetter && cs->hppi.prio != 0xff &&
+        (cs->hppi.irq < GIC_INTERNAL ||
+         cs->hppi.irq >= GICV3_LPI_INTID_START)) {
         gicv3_full_update_noirqset(cs->gic);
     }
 }
@@ -354,7 +356,7 @@ static void arm_gicv3_post_load(GICv3State *s)
      * pending interrupt, but don't set IRQ or FIQ lines.
      */
     for (i = 0; i < s->num_cpu; i++) {
-        gicv3_redist_update_lpi(&s->cpu[i]);
+        gicv3_redist_update_lpi_only(&s->cpu[i]);
     }
     gicv3_full_update_noirqset(s);
     /* Repopulate the cache of GICv3CPUState pointers for target CPUs */
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 424e7e28a86..c8ff3eca085 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -256,9 +256,10 @@ static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
                 cs->gicr_ctlr |= GICR_CTLR_ENABLE_LPIS;
                 /* Check for any pending interr in pending table */
                 gicv3_redist_update_lpi(cs);
-                gicv3_redist_update(cs);
             } else {
                 cs->gicr_ctlr &= ~GICR_CTLR_ENABLE_LPIS;
+                /* cs->hppi might have been an LPI; recalculate */
+                gicv3_redist_update(cs);
             }
         }
         return MEMTX_OK;
@@ -571,7 +572,7 @@ static void gicv3_redist_check_lpi_priority(GICv3CPUState *cs, int irq)
     }
 }
 
-void gicv3_redist_update_lpi(GICv3CPUState *cs)
+void gicv3_redist_update_lpi_only(GICv3CPUState *cs)
 {
     /*
      * This function scans the LPI pending table and for each pending
@@ -614,6 +615,12 @@ void gicv3_redist_update_lpi(GICv3CPUState *cs)
     }
 }
 
+void gicv3_redist_update_lpi(GICv3CPUState *cs)
+{
+    gicv3_redist_update_lpi_only(cs);
+    gicv3_redist_update(cs);
+}
+
 void gicv3_redist_lpi_pending(GICv3CPUState *cs, int irq, int level)
 {
     /*
@@ -651,6 +658,7 @@ void gicv3_redist_lpi_pending(GICv3CPUState *cs, int irq, int level)
      */
     if (level) {
         gicv3_redist_check_lpi_priority(cs, irq);
+        gicv3_redist_update(cs);
     } else {
         if (irq == cs->hpplpi.irq) {
             gicv3_redist_update_lpi(cs);
@@ -673,8 +681,6 @@ void gicv3_redist_process_lpi(GICv3CPUState *cs, int irq, int level)
 
     /* set/clear the pending bit for this irq */
     gicv3_redist_lpi_pending(cs, irq, level);
-
-    gicv3_redist_update(cs);
 }
 
 void gicv3_redist_set_irq(GICv3CPUState *cs, int irq, int level)
-- 
2.25.1
