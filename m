Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5353590lfp;
        Tue, 11 Feb 2020 09:38:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqxW/QrbXVhcCjvJlAqrMP0h0mHiksSg6Lz9vsvE/1TR01Z72WNUpQTWjc0PeKqHCYOVJLc7
X-Received: by 2002:ac8:145:: with SMTP id f5mr3456060qtg.194.1581442715524;
        Tue, 11 Feb 2020 09:38:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581442715; cv=none;
        d=google.com; s=arc-20160816;
        b=JBhGfX578Doc1m4A+CCji6bJIaT+jiNkvz2a/Z9+vUr6X0X9srtXx9r2D7b1JHkj74
         9fmFW9LOKabJs+iwWLTKBKay3d58YX1x7HmkLjwCAMg+ZF2megMu2YTcAWPaAC5Z8lNb
         N8Rj2sKEdu3YgLnSDhZmFJi4ceFdJJ3DBLAFBVr4kCA5QasURaGxWoP7hXJadK4Hmr10
         Twjx7K+XOJpfOdHvrXAEfMJ6iiaUqxUQ7o3BJYpFgKH/AAkMSaQ2LQVMz+JURksRhrjm
         MLbTTuD7CSDL2GercSk5Qp8I1MFJCWBMye+nLMuK4Opet+5UUzwhLQl+qayoHE1Tpz22
         xw4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YAolMHbVRc4z4JgtOBFldRu9cUtp/1u8OxuIdSNhw1w=;
        b=nR56+XA/S1msNijBmSFlHnCWHWJfOD5ukwP+3Vb5rTD0digQyJWAx+GJECd15gU8Vz
         QFGtKti8AHzB7BOLShU+HJ7M8F/RM9ctpU/pkVkK1odjnPioWGxC7ScaBbLqSO2+0PdP
         +LOKvhkdoh0f0nOXMK7Icr1/GOwLVOZfRk6vIHJmZYAgZz2bn2Ht2y4Q3tmIWiAoJ156
         QbtPFQOrqU/OamrF3J8GSV7CucxQCb9HdfYew7ZxJLdwaPsvDiN9oPaW8t5eha4Sak8N
         du9UHPfBN3nQsWcz3H3llayLjmlt4wyCVInMejLS24N+BOwvSLyS4B9j2lD+MEDWtTp6
         E9XQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HH1sWJ4s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q13si2121136qtn.133.2020.02.11.09.38.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 09:38:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HH1sWJ4s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1ZUY-0007GO-R0
	for alex.bennee@linaro.org; Tue, 11 Feb 2020 12:38:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48632)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j1ZTl-0005my-44
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 12:37:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j1ZTi-00049j-61
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 12:37:44 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:39499)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j1ZTh-00047E-W6
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 12:37:42 -0500
Received: by mail-wr1-x441.google.com with SMTP id y11so13492443wrt.6
 for <qemu-arm@nongnu.org>; Tue, 11 Feb 2020 09:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YAolMHbVRc4z4JgtOBFldRu9cUtp/1u8OxuIdSNhw1w=;
 b=HH1sWJ4sQ+0T8BkfjmGLV4oOGm+e01IArqCqdQcoh9FCju7AAyVpVXJdoxsXxVZNcJ
 NUjpADGCP9igs4hUmzM+5W387e//3UA8NKpFuJNYKM/IixnyEoUrGxjI23/1ImToOFY+
 BmZRl+cCugFMS7osvgoGohXXV+2Asf+OoryznAwSeUvtHSlwP1iV5XAdd1RAokIvF52A
 0LXN0Wx8lVO0p98TYhxEfIbDjVvSHags2Tmac7BJYYUFUHXeWE3rcxRXfQ5XIWbFNfRb
 RdhNFo6Bzxp07MucbBylAc/37YTUon+XTxyRpJ2a44rFnhd1Zi1j6XBCEGpnIwemrxAT
 /j7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YAolMHbVRc4z4JgtOBFldRu9cUtp/1u8OxuIdSNhw1w=;
 b=fVjXioDcAB033DytxkK0eWujQ0kjj5g3A7QDwCpN5Y8ZRXCc2Bi4N+Ff1b5NaYAj/n
 AsDDxtg3/eRyEvnfdXb46mJuGpT+yImQ80Dsuqxv1gW2UdHWhcQkuTxMKHExmgAUW7n2
 RrLZYQSOQ8yiuJvxckqluDj8PnZzcazKsCXay/LRthhZcjRmAnEwPJn1eY0ZjJ65J7L4
 q5b0GjHThNeHtthR4nIL5ypUumuEM/L/fLFdTclWj3Xm/aP2dWECkAd+Rg5GOGNSdJq8
 1ckjDGhI+2ELXPviIBYKDE8A4Gw711x5R0pEAu0akgXI38TLahdGIQXWkNxrzEEn4nJx
 8NVQ==
X-Gm-Message-State: APjAAAWdsNGPaHsjIepar4OYGRrsZVRUEur1KamGM4qV/RlBC5E4mvjL
 43dNEHCM1Pxas2/aFvl3cgQihnP4dGM=
X-Received: by 2002:adf:d0c1:: with SMTP id z1mr10209600wrh.371.1581442660645; 
 Tue, 11 Feb 2020 09:37:40 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y1sm6109675wrq.16.2020.02.11.09.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 09:37:40 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 09/13] target/arm: Implement ARMv8.1-PMU extension
Date: Tue, 11 Feb 2020 17:37:22 +0000
Message-Id: <20200211173726.22541-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200211173726.22541-1-peter.maydell@linaro.org>
References: <20200211173726.22541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6gSvEeXpmB/6

The ARMv8.1-PMU extension requires:
 * the evtCount field in PMETYPER<n>_EL0 is 16 bits, not 10
 * MDCR_EL2.HPMD allows event counting to be disabled at EL2
 * two new required events, STALL_FRONTEND and STALL_BACKEND
 * ID register bits in ID_AA64DFR0_EL1 and ID_DFR0

We already implement the 16-bit evtCount field and the
HPMD bit, so all that is missing is the two new events:
  STALL_FRONTEND
   "counts every cycle counted by the CPU_CYCLES event on which no
    operation was issued because there are no operations available
    to issue to this PE from the frontend"
  STALL_BACKEND
   "counts every cycle counted by the CPU_CYCLES event on which no
    operation was issued because the backend is unable to accept
    any available operations from the frontend"

QEMU never stalls in this sense, so our implementation is trivial:
always return a zero count.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 9537785104e..c896ad0b7ee 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1124,6 +1124,24 @@ static int64_t instructions_ns_per(uint64_t icount)
 }
 #endif
 
+static bool pmu_8_1_events_supported(CPUARMState *env)
+{
+    /* For events which are supported in any v8.1 PMU */
+    return cpu_isar_feature(any_pmu_8_1, env_archcpu(env));
+}
+
+static uint64_t zero_event_get_count(CPUARMState *env)
+{
+    /* For events which on QEMU never fire, so their count is always zero */
+    return 0;
+}
+
+static int64_t zero_event_ns_per(uint64_t cycles)
+{
+    /* An event which never fires can never overflow */
+    return -1;
+}
+
 static const pm_event pm_events[] = {
     { .number = 0x000, /* SW_INCR */
       .supported = event_always_supported,
@@ -1140,8 +1158,18 @@ static const pm_event pm_events[] = {
       .supported = event_always_supported,
       .get_count = cycles_get_count,
       .ns_per_count = cycles_ns_per,
-    }
+    },
 #endif
+    { .number = 0x023, /* STALL_FRONTEND */
+      .supported = pmu_8_1_events_supported,
+      .get_count = zero_event_get_count,
+      .ns_per_count = zero_event_ns_per,
+    },
+    { .number = 0x024, /* STALL_BACKEND */
+      .supported = pmu_8_1_events_supported,
+      .get_count = zero_event_get_count,
+      .ns_per_count = zero_event_ns_per,
+    },
 };
 
 /*
@@ -1150,7 +1178,7 @@ static const pm_event pm_events[] = {
  * should first be updated to something sparse instead of the current
  * supported_event_map[] array.
  */
-#define MAX_EVENT_ID 0x11
+#define MAX_EVENT_ID 0x24
 #define UNSUPPORTED_EVENT UINT16_MAX
 static uint16_t supported_event_map[MAX_EVENT_ID + 1];
 
-- 
2.20.1

