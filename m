Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2201526lfp;
        Fri, 14 Feb 2020 09:54:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqyWBWtRgzA6Z4Mlgdwm9fj146AkJWYkTgI2qNdhfcECW/cubm6Qlvi9uV4Cpg0wRg2Ivc/Y
X-Received: by 2002:a0c:e4c1:: with SMTP id g1mr3290494qvm.45.1581702859920;
        Fri, 14 Feb 2020 09:54:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581702859; cv=none;
        d=google.com; s=arc-20160816;
        b=i4qzxzRo/AQSRTcHcVGqMJXgk6VQnUKaGFehANzVT//6C8EJN2ii0ueNhol93axO2l
         kepyHEv2Mune5bXfB8QU7DDVjSDUfnaNry6fr5GNcqE2vt8t66YM3uVW53Di0BFL48o9
         kz9dC4Yztsc8FllwNKd4yW9L0DhMZ04jZKPRT8XZONP3fFwBMdlOrHglX+0PEY4oYuba
         KysRrhSi697ud//rak7MJW5ojUHg3lWuFa/q1aw8woAjCy6oyuxmaV12KDh6IewUi5lb
         ZlyKH+VNrsuh01+rM8g/YEIGJ1lHVZr+uOAcZ8suUrxYOvOxE8qEyNQtB7ovUZBpTCS3
         KQEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=NSiQxcnFeKC6KyTWn4PrMXJIxie/Z4B9EArp8D5QAn8=;
        b=d6pTi0KUKo4wUhiWDWDkFsomIcOex1KwnJvSkUsqb+E676ow3UELp0Dq4K5zjraYX4
         mOQq7SpK8m8BZ4on4HG0kxnHE6tXxSwm24d+GG2yWgwEV0PabQm2Ileuw1ms7MdPyo0z
         LuX7LhSiK6ltCIFRcT4HsL6c/j6dKyb9/D/a2wS38SQldgAAwYhWULdWTczCUHB4moSu
         FsBxaLWmY+i6k/vNy6FtnuSbJQ/nwCDrn6BAIkRroqhZnzCl5laBaxk2QpM5L/ya1fYW
         m1MjIUSpRaW5tOtHfTfSC3mppWfFd/FTi8J0FdY1iMURKhsfOZ7ISxjtvbLIH0dYI8YF
         rH1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RvtWl+Sw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f21si3116709qtk.152.2020.02.14.09.54.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 09:54:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RvtWl+Sw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2fAR-000425-9g
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 12:54:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56135)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j2f7t-0005zf-KL
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 12:51:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j2f7s-0000te-B5
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 12:51:41 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:41172)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j2f7r-0000rD-A8
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 12:51:39 -0500
Received: by mail-wr1-x441.google.com with SMTP id c9so11896720wrw.8
 for <qemu-arm@nongnu.org>; Fri, 14 Feb 2020 09:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NSiQxcnFeKC6KyTWn4PrMXJIxie/Z4B9EArp8D5QAn8=;
 b=RvtWl+Sw/xPf0OPNkF8GhOHy0Pr5fEtuJE/ULYUvFUJ6pUJD0MQkU4CcycAaXVNJVq
 MaTzds596dr78mdCdeczzUCWzqI1tCe2GJDpLgOu4BLFDjE2KOluOvg3cQaDm/IPEQoC
 zXuHSW7NssQ4wnvqPpJrcgmr3mnFYVjZgPGl14l1gQuM3PcVx8LTEloRHoqi1kkA3X8y
 yWYP+AWezwP+Oq5pLwWibMrGsqT3NSQy6Tc/Rb9iDrzPjYHn5hovaEWCzqgO4eD+yuCv
 e32aBWKBOUjroIt+ewgluz7SlZuopCTPzRD7zYp4pzXHSYJmevXS7Ixu2c5XmZr0wP80
 FBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NSiQxcnFeKC6KyTWn4PrMXJIxie/Z4B9EArp8D5QAn8=;
 b=oW6UDyl0R1OLefB7U8W+cTP3z0TpVcmZtoRA1EiuMhnAPCQL16BuXmd6SPuazGTs48
 Xy6GExxts8kKO4+30Br82/72vZF8sncRXQaBOhrIWqaDiNL/BdIVHWY7zhTmFZKFHvJY
 JOYvpRqVfZf8tZ6XmTbXAwVayNOmiAvG3wBokJ3APV+9E5I7vS/NupBVbR83jkNn/M7q
 hxyFLTiLjgHNxcH8cKcnRsm4SiKFQVUJHIzwMxypbmiuIpCgByicWYrx/KHepygzmwSz
 1/ZTzuF1cYtSJVzLOuWQafq2Sog1TBAp4is1d1mCRv8fLdE2dLMhQWFyyWiVUdXCFIEo
 EzZg==
X-Gm-Message-State: APjAAAW80pu3qZLd4wGyM+AfmhdNzG3UkTqh/QcfrfChWlpQSyrU3xiy
 fdLnbpA/FW+DTh41lUKKvKg06udAgXw=
X-Received: by 2002:adf:dd0b:: with SMTP id a11mr5462852wrm.150.1581702697631; 
 Fri, 14 Feb 2020 09:51:37 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id v8sm8001857wrw.2.2020.02.14.09.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 09:51:37 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 13/21] target/arm: Implement ARMv8.1-PMU extension
Date: Fri, 14 Feb 2020 17:51:08 +0000
Message-Id: <20200214175116.9164-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214175116.9164-1-peter.maydell@linaro.org>
References: <20200214175116.9164-1-peter.maydell@linaro.org>
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 29entYRa6Yra

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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1dcbb68e49b..aeb01617150 100644
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

