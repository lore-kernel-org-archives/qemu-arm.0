Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5790611lfm;
        Tue, 28 Apr 2020 10:28:50 -0700 (PDT)
X-Google-Smtp-Source: APiQypL3J2vUU9tS9fuHPbyotQGp79JLk0DF9s1XT2424Of1m4h6Lm5woibRClGsx6bdDUW6lXVn
X-Received: by 2002:a05:6214:7e1:: with SMTP id bp1mr28563023qvb.208.1588094930407;
        Tue, 28 Apr 2020 10:28:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588094930; cv=none;
        d=google.com; s=arc-20160816;
        b=YinTPGPvfqGH4kU4qU/EnhB5W9JAJD0Z4SekuCfn2PZgojp5dx/jZiRCPWT5NyL5ZH
         uSQO9caWvt0BWhiYZsJZ/WRc162OOCP7l8QzH8eM3B+ycphqZijIlhkJhjkL3JuHJjwP
         HMb9Wk0TDbzlMo27NU0Fr6XCk/IfQh2sNmT6frTtXqT/xtXl4yiJnqXhm2MJD1bJtDBG
         4paX9L0jWdKN6loQQnD825akWFTdFUhuQlWfM1Ee4pHKoVYsMCpiYmN2WL2x5Ex5NPsB
         M8DeICu66V3jNWr8Ot6QHeOIGK6PUjJ5SV7G6CaTPAuqR0N4OkJ4QWJEGUHmy1LMJGyg
         Nqng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=xj9mbELBxmDJv8s9rOOYS9YWnqmysEZNeFuMvyIIlyA=;
        b=skyqMBmmBrO+GIZQsxKm2m3/3Qk4hXC1Y1Qq/pVgZH16lJb/Po1pbYCfA1lWUtlfkJ
         kMnfUrOFFV3EPy82VmJo6IKTozxvvJNgTDxWbi2g6rRbvmzAFBYkbDetznfU5h4ncY/V
         mu0hOFvPgZxNIA2xY6hk581pUjsICcbUcdQDadeNwY5TkAhU30X3OH6xz/WPHxjaBFcM
         OuNGeimiwEyFSWHXw6WgP5gpGWFX1HNczZ1T85YmK/H3PQ7I9dkgg2nsK4/njgtFg1Y9
         pyyBuicLb545yPytxOD17GDTMojEKYdccp5FedA7fFYT7gMsyG7cvzQMcgz1DQoKp6Wl
         ptaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Kzkdl6Zo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id az7si11673538qvb.195.2020.04.28.10.28.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Apr 2020 10:28:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Kzkdl6Zo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:41272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jTU2L-0004vq-Ph
	for alex.bennee@linaro.org; Tue, 28 Apr 2020 13:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41702)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jTU22-0004jn-If
 for qemu-arm@nongnu.org; Tue, 28 Apr 2020 13:28:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jTU1I-0007ZC-5O
 for qemu-arm@nongnu.org; Tue, 28 Apr 2020 13:28:29 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:41365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jTU0F-0006vK-3Q; Tue, 28 Apr 2020 13:26:39 -0400
Received: by mail-wr1-x443.google.com with SMTP id g13so25618199wrb.8;
 Tue, 28 Apr 2020 10:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xj9mbELBxmDJv8s9rOOYS9YWnqmysEZNeFuMvyIIlyA=;
 b=Kzkdl6ZotuJuQRi9dX0Gl+v1Qt0Rrwc/vwPNM7kYUWRImgpXPnYJW7Jrw87F+YYr1J
 c68jfMCbFNtTJ/1hsZv0drxDIyjrxQ014XUg7ipvyaKgWB7Vuxo3cJyKdpAguzRZP9E+
 9wRKj24gb2AyvHGkBlj0vdbZvthc41UhN1gIst9GnUrQagUNqZkHNcZtiRAJX3j5WEj3
 Pr0b2x3HT1TFmAKTFqqEBFwQNLaNHyxau23MTPaU9WvEx+88E6sNdvqoZceAjh5vMZ7b
 Fq3PX6q1jJabTzHHWM+Jo1gcY4avryYTOQRTg9gC4qNAhkZkaAUMPSrK4U0nJCYb1BCo
 4ygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=xj9mbELBxmDJv8s9rOOYS9YWnqmysEZNeFuMvyIIlyA=;
 b=ITPzEspDVtPcuaOcNhcMd0f3nAWDDUNj+9muNz8PlZwzL81iFLqWLWWhYa/qi0jFwD
 TrF8jMrm3kJcGg92MeFPd1McZ2G8xwQ8sEtjBiGhcplXpAJUyxqoZeGimh2i6xFgo2Kh
 Swli3BvPtwsDXpD5IN6uTahSF+A39iSNKpstboweuSEZ0t+H817wxYUcFXcxRsKc3XU9
 ymygH+3HQU1k9Ar7QJhikXaSUAIWmLv+9fhVcIfWwqYC2r785ue0jHODHGRPL6HU/rB/
 MeiFh2a6BiQL/WqyEy3FdXDvBMmY6cJp3rUT0+5yQU6sFci2B/ERzRiOFsI3O3fyyr8i
 zFGw==
X-Gm-Message-State: AGi0PubY8uUAv3hynISh5Edg9xzIq10xHf8rTORd3W/zYwW1y6f+JhOY
 BmwwEmCA5B3Gx0Ms4gm9wx9GDFO9WFw=
X-Received: by 2002:adf:f1c6:: with SMTP id z6mr27383600wro.361.1588094796438; 
 Tue, 28 Apr 2020 10:26:36 -0700 (PDT)
Received: from x1w.redhat.com (137.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.137])
 by smtp.gmail.com with ESMTPSA id w6sm27132286wrm.86.2020.04.28.10.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 10:26:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] target/arm: Use correct variable for setting 'max' cpu's
 MIDR_EL1
Date: Tue, 28 Apr 2020 19:26:34 +0200
Message-Id: <20200428172634.29707-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::443
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UUeIg+Ilf4Cg

MIDR_EL1 a 64-bit system register with the top 32-bit being RES0.

This fixes when compiling with -Werror=conversion:

  target/arm/cpu64.c: In function ‘aarch64_max_initfn’:
  target/arm/cpu64.c:628:21: error: conversion from ‘uint64_t’ {aka ‘long unsigned int’} to ‘uint32_t’ {aka ‘unsigned int’} may change value [-Werror=conversion]
    628 |         cpu->midr = t;
        |                     ^

Suggested-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Since v2: Do not use RESERVED bits.
Since v1: Follow Laurent and Peter suggestion.
---
 target/arm/cpu.h | 2 +-
 target/arm/cpu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8b9f2961ba..592fb217d6 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -894,7 +894,7 @@ struct ARMCPU {
         uint64_t id_aa64dfr0;
         uint64_t id_aa64dfr1;
     } isar;
-    uint32_t midr;
+    uint64_t midr;
     uint32_t revidr;
     uint32_t reset_fpsid;
     uint32_t ctr;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index a79f233b17..7ff80894b6 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2757,7 +2757,7 @@ static const ARMCPUInfo arm_cpus[] = {
 static Property arm_cpu_properties[] = {
     DEFINE_PROP_BOOL("start-powered-off", ARMCPU, start_powered_off, false),
     DEFINE_PROP_UINT32("psci-conduit", ARMCPU, psci_conduit, 0),
-    DEFINE_PROP_UINT32("midr", ARMCPU, midr, 0),
+    DEFINE_PROP_UINT64("midr", ARMCPU, midr, 0),
     DEFINE_PROP_UINT64("mp-affinity", ARMCPU,
                         mp_affinity, ARM64_AFFINITY_INVALID),
     DEFINE_PROP_INT32("node-id", ARMCPU, node_id, CPU_UNSET_NUMA_NODE_ID),
-- 
2.21.1

