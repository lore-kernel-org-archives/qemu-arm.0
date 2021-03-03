Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5706654lfg;
        Wed, 3 Mar 2021 13:49:00 -0800 (PST)
X-Received: by 2002:a5d:6304:: with SMTP id i4mr665388wru.155.1614808140693;
        Wed, 03 Mar 2021 13:49:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614808140; cv=none;
        d=google.com; s=arc-20160816;
        b=Iu+/fAwZmlt4Zp+kOB1d7YnY52jOsILJick7H0gdMJynlHvz6BKg8CL7tTLyH/2wU/
         OxXzlYsfG1CAU7UE+ihGIXh1UrIL/kZDG/y85W2SdLvrJnKT3yAijkyqSaNrpRmKc0u5
         yY1fnXoH29004HP7FVlT5S77r+cVIjAzxDsrRLvK6aSVNb76umTiazcluzNHpi0zHdXa
         GB8k4pVHHrG7sijTLEKGAI49vMFixUjP6wt5EhBMslxH+Ne1DjghGOzjerNYxXKc1wZl
         +TpM91emoASdsGAIaUSOQc0QY2dmAe2IAH/pIQ+0dGzC1YZB6QT2dcQ6RKKIR1nHzXMH
         qdPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=3OqS7UcP206wRkOojyBF7HLEMqlrEg0K8qjlNSdHuN0=;
        b=Ws7uY7+spgD8+mdOsBZZDXIleh447/6ibMmzibttJWmK4+x0qZ7zV+jTi136Ug4Jyb
         0Lkx6dYjgRv/r8sjv6HZgl4tEcarAJxa2qvycNPwOmVrBQLrpLq94dEBUdK/SFFHXFDP
         zUrzCJmEXbeeJmagJT1i5nw9gCj7pgGQpJiFMGjIMI1NpD/NZjuqZbUo3oXTwAEqZfza
         OEWuGt/tne0A3VylltPCCHLySR7Jjuf8VMXHGel9IVvyx0VC8AIfPrLuFnVNDvkPoFfe
         lxtqgNKeLunFqFoH6cRlWou4NLymZg7IMK597TUYs12eQGYUHQmDEZKcYgC9LT4/Y3P6
         DTZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=hU7xL3jg;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r6sor7681416wrz.23.2021.03.03.13.49.00
        (Google Transport Security);
        Wed, 03 Mar 2021 13:49:00 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=hU7xL3jg;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3OqS7UcP206wRkOojyBF7HLEMqlrEg0K8qjlNSdHuN0=;
        b=hU7xL3jg+s6l7qGQ1ugo7clEuznfIYKCNPA6so5H4ANvAZEdef67E+IBrjWvumF8mr
         dRaunXw3yBmkFeXwznR6lnXEqeWW10oOtoH2DPV195giWlfdKoyRDNfM6yqFRly64ifM
         fvCYb8C6uHL0CBnsCOwK/+tfU4AJjzk3WEauKBuyGtHsNy4P1aaKon77h8q2qbBl2skk
         hixzKIqFxRydwPqWGXpdLc+/74/J0ToRIPbXRP7V3aiG7gOHgluV4PWATbJNzuIh9931
         /v6xe4YWJopUeMrC6S63Dqz9EjeQoz5nbfVE61Ytobk18UpAmG6Ce9X4PaZBonK2zCNP
         q7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=3OqS7UcP206wRkOojyBF7HLEMqlrEg0K8qjlNSdHuN0=;
        b=Nk2Ffv+oce+hWCX2CqNqXmtdLd+0YhgUnHwFNYjmgi3tD9SRr5uaUm57OTpO+8RfiU
         ccZYnowMV9GI0QdxzDt6Blb0LKM43t1JMdBE77bOGRek451yJH8QLCTZu3eKF6vTxgS8
         7h3fyg8tyyVaLhZ4dqdLKFl5WFDUdHR0GB8jlrOQMMbO8rp+Vlx+AEKQzJA4Jgwr9oim
         4Q+cS1033aH7nJV5nBsDawMwVW0tpNLzYJcM8/qV6NltSr+Hv1M0iEeXsWnU2eR+n/JG
         Z5g36Cl5EaR5tmqLaIF1w7gkbNaEmdAmUPigSr1Y8yl8wUyiUXfBQtG4qNEGrDfm9IaX
         sDoQ==
X-Gm-Message-State: AOAM530McDUHCFaOKtfVf4s5H/VD8cLRvV4SfpJ1at3M5k3ppWwpADW6
	BtITWW6rqMRGScHdBAvkysg=
X-Google-Smtp-Source: ABdhPJz4gRG2A32sGzAfcHZ66PB3N78cOzrpsqLmQPbStAAohyvMC5U0xEoflplH77GEmL2Zf9PVIw==
X-Received: by 2002:adf:d4ca:: with SMTP id w10mr816978wrk.146.1614808140459;
        Wed, 03 Mar 2021 13:49:00 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id l8sm18988768wrx.83.2021.03.03.13.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 13:48:59 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-s390x@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-ppc@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Cornelia Huck <cohuck@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v4 20/28] target/arm: Move code blocks around
Date: Wed,  3 Mar 2021 22:47:00 +0100
Message-Id: <20210303214708.1727801-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 3zDfKjpl6y84

To simplify later #ifdef'ry, move some code around.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/internals.h    | 16 ++++++++--------
 target/arm/debug_helper.c | 22 +++++++++++-----------
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index d6ace004855..3fb295431ae 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -278,14 +278,6 @@ void hw_watchpoint_update_all(ARMCPU *cpu);
  * Update a QEMU breakpoint based on the information the guest has set in the
  * DBGBCR<n>_EL1 and DBGBVR<n>_EL1 registers.
  */
-void hw_breakpoint_update(ARMCPU *cpu, int n);
-/*
- * Update the QEMU breakpoints for every guest breakpoint. This does a
- * complete delete-and-reinstate of the QEMU breakpoint list and so is
- * suitable for use after migration or on reset.
- */
-void hw_breakpoint_update_all(ARMCPU *cpu);
-
 /* Callback function for checking if a watchpoint should trigger. */
 bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
 
@@ -295,6 +287,14 @@ bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
  */
 vaddr arm_adjust_watchpoint_address(CPUState *cs, vaddr addr, int len);
 
+void hw_breakpoint_update(ARMCPU *cpu, int n);
+/*
+ * Update the QEMU breakpoints for every guest breakpoint. This does a
+ * complete delete-and-reinstate of the QEMU breakpoint list and so is
+ * suitable for use after migration or on reset.
+ */
+void hw_breakpoint_update_all(ARMCPU *cpu);
+
 /* Callback function for when a watchpoint or breakpoint triggers. */
 void arm_debug_excp_handler(CPUState *cs);
 
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 2ff72d47d19..c01d8524443 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -216,6 +216,17 @@ static bool check_watchpoints(ARMCPU *cpu)
     return false;
 }
 
+bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
+{
+    /*
+     * Called by core code when a CPU watchpoint fires; need to check if this
+     * is also an architectural watchpoint match.
+     */
+    ARMCPU *cpu = ARM_CPU(cs);
+
+    return check_watchpoints(cpu);
+}
+
 static bool check_breakpoints(ARMCPU *cpu)
 {
     CPUARMState *env = &cpu->env;
@@ -247,17 +258,6 @@ void HELPER(check_breakpoints)(CPUARMState *env)
     }
 }
 
-bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
-{
-    /*
-     * Called by core code when a CPU watchpoint fires; need to check if this
-     * is also an architectural watchpoint match.
-     */
-    ARMCPU *cpu = ARM_CPU(cs);
-
-    return check_watchpoints(cpu);
-}
-
 void arm_debug_excp_handler(CPUState *cs)
 {
     /*
-- 
2.26.2
