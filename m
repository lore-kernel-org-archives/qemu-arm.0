Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp371131lff;
        Thu, 12 Dec 2019 21:50:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqxPWwdp3eNwUKQywjpnDxxJAn89xBWdqNK0v1MeHbesvuWdfRMFf6kiejVZmsv9JJE2nz00
X-Received: by 2002:ae9:e50d:: with SMTP id w13mr11954374qkf.458.1576216201546;
        Thu, 12 Dec 2019 21:50:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576216201; cv=none;
        d=google.com; s=arc-20160816;
        b=dX/lSJTv2hEQpawRAGAAR2MHspm/zxrnmfH1anvQ2dHbLU5Y9frMcqdcoEyRb+0135
         QZfv+WH5xVeNEOO+pElYReT8Nyfk8n1ToWHk3dL1TBAmD/KjArhNEAQ6NFNOYRKiDWKf
         VxiTTDgkAQ1bVnU4dn65wWN83gSB2xD5yFv0rTETzzc3pkyc91gbwueCKLQG1QTD2Cso
         A7cJiTW/Es4s4KjRk+UaSUbbpTCEbDyY2Fl56IV5tp14bwv88v4n92zVnnhUYqIsL5p7
         EgUL4jZR7ok7Ck/WIdK1NXqDwXKav6KW7mlCJQ26UUmaAiPSXLFbtjfuG1TFd5OKPYLC
         vKtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature:dkim-signature;
        bh=gNZ9DXDMNR7EpJAh12OKvhgw7oyqCMhiE3JvRC5PYi4=;
        b=p+9I20x8h3Az174DFB0gVB47G5mNQrqUKNMFTR0gdEMwIK6J9dzFxN9dgmXU1tGCnI
         C1DHlHPKYI3l4VbGbOu4EGqhxkbo14FqNRopgdeejTIT6GqjQnVoiT8UOcCiwlidrpJE
         6lYkJRstnAgdNVWA7sApsS3XzwruYHYyrzj4NbNk3H9dKmDnKlv8YLv0G4L80Ww1I88j
         mEdk/P7cZRq6cRWfe8GRmP0ohAxMPcrZJhzQBUYHMymMxM04zbJAEh2aMoc0wzeD9enF
         xWQbivanBh6Elk2IrUqmnGTlVw11OHY+S3Y8RcvoMURv8hYWDcBon0WPM2JNW+dr5iq6
         VUSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b="F9z4/wml";
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=b5PJu6cm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 63si4087174qkg.226.2019.12.12.21.50.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Dec 2019 21:50:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b="F9z4/wml";
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=b5PJu6cm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ifdpw-0004FI-RM
	for alex.bennee@linaro.org; Fri, 13 Dec 2019 00:50:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56343)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrew@aj.id.au>) id 1ifdos-00037n-VM
 for qemu-arm@nongnu.org; Fri, 13 Dec 2019 00:48:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrew@aj.id.au>) id 1ifdor-0004v6-F2
 for qemu-arm@nongnu.org; Fri, 13 Dec 2019 00:48:54 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:37341)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrew@aj.id.au>)
 id 1ifdor-0004tR-7N; Fri, 13 Dec 2019 00:48:53 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id E226890C;
 Fri, 13 Dec 2019 00:48:51 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 13 Dec 2019 00:48:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=gNZ9DXDMNR7Ep
 JAh12OKvhgw7oyqCMhiE3JvRC5PYi4=; b=F9z4/wmlnuMoEM8t3BpJwYqegqG9X
 l5MYDk1Q+9wp1vL9o/jYbPb+9Rq5vlauosaKqFOPboOJOiFDfV3G6r+FLwuYfSa9
 E2dTDYKVwewMidtzTeYzm2JmAqek86JIjsmiaIar+YFbc8zbaBtQt24j7YkjoO+T
 RhzpFC6HEydyZktcjkEV5EM7efkw6t9hm2wPPM3bg7YDRZFlu5+r6tMfT3PMjXxw
 nbmFx8vxfvtrBM700q9MRSZlCKOnkSzXxksREtKE9F1xx0jfckGPTUDhthqWW33C
 A/3/pLK/sqkdjW62RA231xQh0hfoiQ4nKFqWXBOdvfqZhmE9QpueQuLuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=gNZ9DXDMNR7EpJAh12OKvhgw7oyqCMhiE3JvRC5PYi4=; b=b5PJu6cm
 yvHUmvH1n0U8Enp1QB0jNq+4crZddxjabwf32CLZFM4a7E08UVwys6x5+rZY/rwk
 xwP18oHvqZF6OI+9+CNXjD8CboI/RkglPMqYOJ659Swz+7nsvdExLr+fKeQrn01U
 9/4NfwQWMZDqiHUaDf2CbWsT3tQjIYgoD0oDwc/NHQPnikxVMpmXflaVMxnQK15+
 qAQsBhvfjJ/vhpqjD4IgM6eGJvX113/6Yx9969FqmgsmuWgWfaQpXpeenHjlw8E+
 bb9TnDBxWX4ypam124dh163fl8k3yUuLQKI7XjPswhViSg5PFUSoOwGf9Nn2XorE
 qxbg08B4TPOpMQ==
X-ME-Sender: <xms:QybzXZQcIz_rJi3yW96emt2VB-TqwDhQn8YJNQRG6STFKLnYmqP16A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudelkedgkeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhgurhgv
 ficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffohhmrghinh
 epthgrghdrthgrrhhgvghtnecukfhppedvtddvrdekuddrudekrdeftdenucfrrghrrghm
 pehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghruf
 hiiigvpedt
X-ME-Proxy: <xmx:QybzXdcovfyJR9c2xlMm-NsSC-VLMPCqhoWzp_8V6clsKxQOiNIXRg>
 <xmx:QybzXXhX8VThQDTAwWDg_2FZr2etjGEvQkUN_dmlMcQRtGe7XEjrQg>
 <xmx:QybzXYKw7WuZ-eaXtTK87B37wItyN-d2woMocBtPDoJy3xpIPs2YTQ>
 <xmx:QybzXT1qVwFBvq4o35df_sMsOBCTAFV2lpJn9uwsJGLjfihp3Ist5w>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 61DDE80060;
 Fri, 13 Dec 2019 00:48:48 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Subject: [PATCH v3 3/4] target/arm: Prepare generic timer for per-platform
 CNTFRQ
Date: Fri, 13 Dec 2019 16:19:50 +1030
Message-Id: <a22db9325f96e39f76e3c2baddcb712149f46bf2.1576215453.git-series.andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.ec85a2db47c3e10de70fba144e1bc75caf2f0a91.1576215453.git-series.andrew@aj.id.au>
References: <cover.ec85a2db47c3e10de70fba144e1bc75caf2f0a91.1576215453.git-series.andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 64.147.123.19
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, clg@kaod.org, philmd@redhat.com, joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZLzru4e8iN3j

The ASPEED AST2600 clocks the generic timer at the rate of HPLL. On
recent firmwares this is at 1125MHz, which is considerably quicker than
the assumed 62.5MHz of the current generic timer implementation. The
delta between the value as read from CNTFRQ and the true rate of the
underlying QEMUTimer leads to sticky behaviour in AST2600 guests.

Add a feature-gated property exposing CNTFRQ for ARM CPUs providing the
generic timer. This allows platforms to configure CNTFRQ (and the
associated QEMUTimer) to the appropriate frequency prior to starting the
guest.

As the platform can now determine the rate of CNTFRQ we're exposed to
limitations of QEMUTimer that didn't previously materialise: In the
course of emulation we need to arbitrarily and accurately convert
between guest ticks and time, but we're constrained by QEMUTimer's use
of an integer scaling factor. The effect is QEMUTimer cannot exactly
capture the period of frequencies that do not cleanly divide
NANOSECONDS_PER_SECOND for scaling ticks to time. As such, provide an
equally inaccurate scaling factor for scaling time to ticks so at least
a self-consistent inverse relationship holds.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v3:
* Relocate comment as a consequence of uninlining gt_cntfrq_period_ns() in 2/4.
Philippe - I haven't moved it to the previous patch based on my reasoning on
the list. I'm not sure whether you're satisfied by that, so I haven't added
your Reviewed-by tag.

 target/arm/cpu.c    | 61 ++++++++++++++++++++++++++++++++++++++--------
 target/arm/helper.c |  9 ++++++-
 2 files changed, 59 insertions(+), 11 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index cd0dbe005d9f..7b21eb544eae 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -974,10 +974,12 @@ static void arm_cpu_initfn(Object *obj)
     if (tcg_enabled()) {
         cpu->psci_version = 2; /* TCG implements PSCI 0.2 */
     }
-
-    cpu->gt_cntfrq_hz = NANOSECONDS_PER_SECOND / GTIMER_SCALE;
 }
 
+static Property arm_cpu_gt_cntfrq_property =
+            DEFINE_PROP_UINT64("cntfrq", ARMCPU, gt_cntfrq_hz,
+                               NANOSECONDS_PER_SECOND / GTIMER_SCALE);
+
 static Property arm_cpu_reset_cbar_property =
             DEFINE_PROP_UINT64("reset-cbar", ARMCPU, reset_cbar, 0);
 
@@ -1059,6 +1061,24 @@ static void arm_set_init_svtor(Object *obj, Visitor *v, const char *name,
 
 unsigned int gt_cntfrq_period_ns(ARMCPU *cpu)
 {
+    /*
+     * The exact approach to calculating guest ticks is:
+     *
+     *     muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL), cpu->gt_cntfrq_hz,
+     *              NANOSECONDS_PER_SECOND);
+     *
+     * We don't do that. Rather we intentionally use integer division
+     * truncation below and in the caller for the conversion of host monotonic
+     * time to guest ticks to provide the exact inverse for the semantics of
+     * the QEMUTimer scale factor. QEMUTimer's scale facter is an integer, so
+     * it loses precision when representing frequencies where
+     * `(NANOSECONDS_PER_SECOND % cpu->gt_cntfrq) > 0` holds. Failing to
+     * provide an exact inverse leads to scheduling timers with negative
+     * periods, which in turn leads to sticky behaviour in the guest.
+     *
+     * Finally, CNTFRQ is effectively capped at 1GHz to ensure our scale factor
+     * cannot become zero.
+     */
     return NANOSECONDS_PER_SECOND > cpu->gt_cntfrq_hz ?
       NANOSECONDS_PER_SECOND / cpu->gt_cntfrq_hz : 1;
 }
@@ -1180,6 +1200,11 @@ void arm_cpu_post_init(Object *obj)
 
     qdev_property_add_static(DEVICE(obj), &arm_cpu_cfgend_property,
                              &error_abort);
+
+    if (arm_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER)) {
+        qdev_property_add_static(DEVICE(cpu), &arm_cpu_gt_cntfrq_property,
+                                 &error_abort);
+    }
 }
 
 static void arm_cpu_finalizefn(Object *obj)
@@ -1259,14 +1284,30 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         }
     }
 
-    cpu->gt_timer[GTIMER_PHYS] = timer_new(QEMU_CLOCK_VIRTUAL, GTIMER_SCALE,
-                                           arm_gt_ptimer_cb, cpu);
-    cpu->gt_timer[GTIMER_VIRT] = timer_new(QEMU_CLOCK_VIRTUAL, GTIMER_SCALE,
-                                           arm_gt_vtimer_cb, cpu);
-    cpu->gt_timer[GTIMER_HYP] = timer_new(QEMU_CLOCK_VIRTUAL, GTIMER_SCALE,
-                                          arm_gt_htimer_cb, cpu);
-    cpu->gt_timer[GTIMER_SEC] = timer_new(QEMU_CLOCK_VIRTUAL, GTIMER_SCALE,
-                                          arm_gt_stimer_cb, cpu);
+
+    {
+        uint64_t scale;
+
+        if (arm_feature(env, ARM_FEATURE_GENERIC_TIMER)) {
+            if (!cpu->gt_cntfrq_hz) {
+                error_setg(errp, "Invalid CNTFRQ: %"PRId64"Hz",
+                           cpu->gt_cntfrq_hz);
+                return;
+            }
+            scale = gt_cntfrq_period_ns(cpu);
+        } else {
+            scale = GTIMER_SCALE;
+        }
+
+        cpu->gt_timer[GTIMER_PHYS] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
+                                               arm_gt_ptimer_cb, cpu);
+        cpu->gt_timer[GTIMER_VIRT] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
+                                               arm_gt_vtimer_cb, cpu);
+        cpu->gt_timer[GTIMER_HYP] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
+                                              arm_gt_htimer_cb, cpu);
+        cpu->gt_timer[GTIMER_SEC] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
+                                              arm_gt_stimer_cb, cpu);
+    }
 #endif
 
     cpu_exec_realizefn(cs, &local_err);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2622a9a8d02f..94a05cd978bc 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2683,6 +2683,13 @@ void arm_gt_stimer_cb(void *opaque)
     gt_recalc_timer(cpu, GTIMER_SEC);
 }
 
+static void arm_gt_cntfrq_reset(CPUARMState *env, const ARMCPRegInfo *opaque)
+{
+    ARMCPU *cpu = env_archcpu(env);
+
+    cpu->env.cp15.c14_cntfrq = cpu->gt_cntfrq_hz;
+}
+
 static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
     /* Note that CNTFRQ is purely reads-as-written for the benefit
      * of software; writing it doesn't actually change the timer frequency.
@@ -2697,7 +2704,7 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
       .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 0, .opc2 = 0,
       .access = PL1_RW | PL0_R, .accessfn = gt_cntfrq_access,
       .fieldoffset = offsetof(CPUARMState, cp15.c14_cntfrq),
-      .resetvalue = (1000 * 1000 * 1000) / GTIMER_SCALE,
+      .resetfn = arm_gt_cntfrq_reset,
     },
     /* overall control: mostly access permissions */
     { .name = "CNTKCTL", .state = ARM_CP_STATE_BOTH,
-- 
git-series 0.9.1
