Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp144674lfo;
        Thu, 28 Jan 2021 03:42:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxz6xpJ/5zOf5oOjCCxQbAlYgg6Ux+qa2BRBuCf0+qdGwffnZX1sLpHL4hY1aaY6oJVmbt1
X-Received: by 2002:a25:2ace:: with SMTP id q197mr24014787ybq.150.1611834168864;
        Thu, 28 Jan 2021 03:42:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611834168; cv=none;
        d=google.com; s=arc-20160816;
        b=eKa2KwAlchWAGpFX6MLoOTEtjC8HLOopOdQw5iu9YJMeBvpkgtzy04T6DnQqYHeWrR
         deQsBc7hqGN7/cCg+6F4vzJPtVp3vGwaXALZGKJ2S1rmAqs3JuAcApwtsSUbxUeJWsLV
         +n7c6816aVlqzQqLcgSkM7rWskVZmgnM6L/ndgAb1dHVbzelCvL6pKyDZ774r7URSsWz
         3QLO3RYwa5M+yiTkAfRNaD+Eoua3hKdxATjAs6NtbKSCzbhW9pfZLiNm1OzJafo1D9wg
         JJIhi9fqP/dH3zyFCpO93dY3YBNyCOIPQ4E2d04Adg3fOYTJt89mpQTh75fkWrLlrQqd
         UFCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=XY5Jo/ZT5buRijDwijPJpiWYvfGhsBqb0McwKxae44A=;
        b=e6ju60xpSb2PUeW4wGo3IsBwrT99ZhTx1AToMS5xN1kISbfyZp7MmWDGGO7JOLgwgo
         WT2YPPLdpGFvySd9vB31u+9uhCX6vtZu6AMwCmQuUmg8himZ2Ejxbnf5LVteV1FttdfI
         vClc1OdjY9372FPlpF8Iv/RvFEaTc0U5kgjxe3amj/6IXMMNf8kTAapXzo59hxhns+pG
         q7lNn5H1IKtUetaAksgfzP5esIZdSOv3l+nHDv37IXP9xaRrEqXx6XjrdSSwezBwbZkq
         Ft1xa1C9pKiWhqGcsJ4uVKV5ge2MRm9ULoR9oSb6DmvhdJuWMOmEKrMI/3KozrJzHyZ5
         tIGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VB7ChyjH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s70si1646515ybi.165.2021.01.28.03.42.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 03:42:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VB7ChyjH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l55hI-0001we-7w
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 06:42:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gT-00018k-GN
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 06:41:59 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:36647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gM-00064w-Tm
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 06:41:57 -0500
Received: by mail-wm1-x333.google.com with SMTP id i9so4316327wmq.1
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 03:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XY5Jo/ZT5buRijDwijPJpiWYvfGhsBqb0McwKxae44A=;
 b=VB7ChyjHAXtZLxKz9QXM8zrfwXDt3JjBoVecDU1V96TuMJBKUZHFDp/L7Qq+v0cwCJ
 JDlWUl8iWpGr3oNEAvIftDpLi4X+Ulc1l8s/vtPU+IIPyXAUxoq6N/xbQ49CtAzLDjr4
 etR0kjNZJFQMR2q/FsXtJER1YnQOOQFjhZ9WIOn9slsGAfv4ULVIgXGJfP201KMpa2Df
 aBXgqZDPlQxC3xh+HgzYoXUm8u54F8n+5bRfu0oi6hR4qISk8bE6c+aChJAvKc+58dYj
 sBXNfqEqlrDbzvEUEo1Ktem6zRixqqCty/8+O/m54hGBqpJRXoEZ90+cFDRk2DTD2XSK
 9c1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XY5Jo/ZT5buRijDwijPJpiWYvfGhsBqb0McwKxae44A=;
 b=nBBceBU+ySro51/1vo87XWg8qRgbfI4aONQHbIZ8Wp9TpDtaLsVU4iQOSfoGs5rnl6
 +fNG+vlvR4vvV6lkVMalQxZcx/+m/EnFqpwg5jG7IelLjKwquSPjRtbnFf6v6d1YwVsL
 tn6XvIWt9943RNAuZjlfOaPhzzlGgJlHyS7hzolxkL9CKNhnQec49ir8tUkCyrbKvQ/H
 E+T7bECWhpR/8JkCOUIKUoym/MhccFQUNfXhxCZ+/lVFOub0Mwfeu+Wwrd6CbSJ7u3Cd
 Lm6KlcQ/NqBHPghwMOXEibFXVapGAQ/hG8rRp83tFIrviC+vPb/PZwVJszE5FzVBlqse
 GQtg==
X-Gm-Message-State: AOAM530fdm+S6koa7XrZrFhJwKBSm+TjkPoLa5gg3EohAqzg/0MBg48r
 GvHnhxL7pLuQCvf9BzlZlfjXEuNiMi01Hw==
X-Received: by 2002:a05:600c:28b:: with SMTP id
 11mr3103117wmk.69.1611834109439; 
 Thu, 28 Jan 2021 03:41:49 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q9sm6431033wme.18.2021.01.28.03.41.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:41:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 01/25] ptimer: Add new ptimer_set_period_from_clock()
 function
Date: Thu, 28 Jan 2021 11:41:21 +0000
Message-Id: <20210128114145.20536-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210128114145.20536-1-peter.maydell@linaro.org>
References: <20210128114145.20536-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: atOW31BfQHQs

The ptimer API currently provides two methods for setting the period:
ptimer_set_period(), which takes a period in nanoseconds, and
ptimer_set_freq(), which takes a frequency in Hz.  Neither of these
lines up nicely with the Clock API, because although both the Clock
and the ptimer track the frequency using a representation of whole
and fractional nanoseconds, conversion via either period-in-ns or
frequency-in-Hz will introduce a rounding error.

Add a new function ptimer_set_period_from_clock() which takes the
Clock object directly to avoid the rounding issues.  This includes a
facility for the user to specify that there is a frequency divider
between the Clock proper and the timer, as some timer devices like
the CMSDK APB dualtimer need this.

To avoid having to drag in clock.h from ptimer.h we add the Clock
type to typedefs.h.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20210121190622.22000-2-peter.maydell@linaro.org
---
 include/hw/ptimer.h     | 22 ++++++++++++++++++++++
 include/qemu/typedefs.h |  1 +
 hw/core/ptimer.c        | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 57 insertions(+)

diff --git a/include/hw/ptimer.h b/include/hw/ptimer.h
index 412763fffb2..c443218475b 100644
--- a/include/hw/ptimer.h
+++ b/include/hw/ptimer.h
@@ -165,6 +165,28 @@ void ptimer_transaction_commit(ptimer_state *s);
  */
 void ptimer_set_period(ptimer_state *s, int64_t period);
 
+/**
+ * ptimer_set_period_from_clock - Set counter increment from a Clock
+ * @s: ptimer to configure
+ * @clk: pointer to Clock object to take period from
+ * @divisor: value to scale the clock frequency down by
+ *
+ * If the ptimer is being driven from a Clock, this is the preferred
+ * way to tell the ptimer about the period, because it avoids any
+ * possible rounding errors that might happen if the internal
+ * representation of the Clock period was converted to either a period
+ * in ns or a frequency in Hz.
+ *
+ * If the ptimer should run at the same frequency as the clock,
+ * pass 1 as the @divisor; if the ptimer should run at half the
+ * frequency, pass 2, and so on.
+ *
+ * This function will assert if it is called outside a
+ * ptimer_transaction_begin/commit block.
+ */
+void ptimer_set_period_from_clock(ptimer_state *s, const Clock *clock,
+                                  unsigned int divisor);
+
 /**
  * ptimer_set_freq - Set counter frequency in Hz
  * @s: ptimer to configure
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 976b529dfb5..68deb74ef6f 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -34,6 +34,7 @@ typedef struct BlockDriverState BlockDriverState;
 typedef struct BusClass BusClass;
 typedef struct BusState BusState;
 typedef struct Chardev Chardev;
+typedef struct Clock Clock;
 typedef struct CompatProperty CompatProperty;
 typedef struct CoMutex CoMutex;
 typedef struct CPUAddressSpace CPUAddressSpace;
diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index 2aa97cb665c..6ba19fd9658 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -15,6 +15,7 @@
 #include "sysemu/qtest.h"
 #include "block/aio.h"
 #include "sysemu/cpus.h"
+#include "hw/clock.h"
 
 #define DELTA_ADJUST     1
 #define DELTA_NO_ADJUST -1
@@ -348,6 +349,39 @@ void ptimer_set_period(ptimer_state *s, int64_t period)
     }
 }
 
+/* Set counter increment interval from a Clock */
+void ptimer_set_period_from_clock(ptimer_state *s, const Clock *clk,
+                                  unsigned int divisor)
+{
+    /*
+     * The raw clock period is a 64-bit value in units of 2^-32 ns;
+     * put another way it's a 32.32 fixed-point ns value. Our internal
+     * representation of the period is 64.32 fixed point ns, so
+     * the conversion is simple.
+     */
+    uint64_t raw_period = clock_get(clk);
+    uint64_t period_frac;
+
+    assert(s->in_transaction);
+    s->delta = ptimer_get_count(s);
+    s->period = extract64(raw_period, 32, 32);
+    period_frac = extract64(raw_period, 0, 32);
+    /*
+     * divisor specifies a possible frequency divisor between the
+     * clock and the timer, so it is a multiplier on the period.
+     * We do the multiply after splitting the raw period out into
+     * period and frac to avoid having to do a 32*64->96 multiply.
+     */
+    s->period *= divisor;
+    period_frac *= divisor;
+    s->period += extract64(period_frac, 32, 32);
+    s->period_frac = (uint32_t)period_frac;
+
+    if (s->enabled) {
+        s->need_reload = true;
+    }
+}
+
 /* Set counter frequency in Hz.  */
 void ptimer_set_freq(ptimer_state *s, uint32_t freq)
 {
-- 
2.20.1

