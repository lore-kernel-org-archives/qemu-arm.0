Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4188980ejb;
        Tue, 13 Dec 2022 04:52:26 -0800 (PST)
X-Received: by 2002:a05:600c:3b9c:b0:3d1:e710:98ec with SMTP id n28-20020a05600c3b9c00b003d1e71098ecmr18646226wms.21.1670935946335;
        Tue, 13 Dec 2022 04:52:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670935946; cv=none;
        d=google.com; s=arc-20160816;
        b=duxBNbeMUvsG1uDPEKh12oU64IRbe7aDbyy0sYTUNUtSs1CxgEbL4MUNBUayIHEemy
         fOMSl3T9eBP4Sn/G9oJIExa0R5dw7ZmlaB7BrsQwz+8QjMS8kLXGkxvYd+PwvGvVriFN
         WqbQNo+YQWEJeX2p21ZBQIf6gt5p3SMYVn9o4Fypo32QNU9nEFA6qdjWOA7NzyZMUeo1
         mZiOZsNSBVf7a2ZsLLCPSW3LIOX/lkPlP+nS6D6arheKoAxukr9ftUrbW2tFaemxXiuy
         ctZiRv3mA3PywQcAPfP36QRfkApvEZnvTwffnYvPNdWTB7YpcK8U2Lsq7KldFAi1ZC72
         rahA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=tV5dDqKeW0g9sIA7fe0a/By2zgJayPRpeDRbB0e1smc=;
        b=mRPm04/zaRtQSFMRTFF+IDtvxS+EvRbGqez0H5oK+DNTHoZmcSWD1Q6yQiYubhk/Wb
         mkQFuFX53G8snISrC0kpoTQ5idQEulXw8oee8VlaxwYwhTrinNIg5qMQLjloAMDBi+ql
         t3yVvpSuzveBAyVnE6gP2RsOfepalcz76gTWbYi/bBpElhzsh6tRGny3NPLaemanXJtC
         yl6ez35lCwpV221+K9aIGikQrDLxSSAZU+PcfOt45bS6nAN43LrFt5ux5aHkj8/mCkD2
         MPGVucX+tIhtSPRZLBTST1LsGWJbq9K8by5a5Ls5tRbiiNz7NJfPwDO4rMqonq69+VZs
         B/8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NwCxfj4W;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v129-20020a1cac87000000b003d1f69be2e9sor3151172wme.13.2022.12.13.04.52.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 Dec 2022 04:52:26 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NwCxfj4W;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tV5dDqKeW0g9sIA7fe0a/By2zgJayPRpeDRbB0e1smc=;
        b=NwCxfj4WCNtdnsgbLWI91hcX0HEh5S4lhhSXsLWyy2Wf9RcRlwRaQxMRWQOpqV2+QG
         bHIGRLggMoS3aGXMpew6zbSAULzSLrw2RTdv8zkJMoJMLt6aZ68xVx3HmWKUVMjOX4hK
         zZOI/aNnie7lOXaFvU5uN8YH0GEJHoX8js/2Y37mZzwPHp8NDeYm1jXnWyqkURHjtfsG
         Y9rpiUqh0AwV500L6ODruQzJmw+UeYtWE4P1tpW1zusyMZF0GiTvaQex/1FIvmWj5T0m
         ya5nSFNB5ZumK+PhCGC67KKCCL3JGkWFQ+ihU5/sK6Qi6mal3uHdTwbItlX7Z6Tyyg3l
         PF7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tV5dDqKeW0g9sIA7fe0a/By2zgJayPRpeDRbB0e1smc=;
        b=XqbEoV8FjIDC9No1/7F0H/nrij2IMWuECliC9Q1Q21aRhf1g4o4tXIKCV0ybgWs6hN
         tODOgAdNr/EgkYX7howN3U2pPhVnOpjZTgy9Q3f7Cu1Aegb1Co2idn7F3EfHDPxrNpXS
         Sg8r0q6E8j260YbBNN2nd4HKGtwhqNfZJkij/WySNitY1QRoNm6ctteWt9MLBBuiI6IE
         SimLLTPuB+P6qhYMncZImGbCOw5pcE3KGW8um/ku9/r5I3KeFA41AdPKt5ByiB3ewQGZ
         0SITcNcNwFW/l3AXDh2Qz6kWcoVupgt5DodiCHqIeZiJU8uYzmfxu45eEruypF789wg0
         uj+A==
X-Gm-Message-State: ANoB5pnD9a99Pcd2A5VjvQuaK6Yp+sh2mwHQckbkgtjbxEZ5+8cyF7BS
	WcsuxOO58A8RZ35E0fo/8xR0g1VO
X-Google-Smtp-Source: AA0mqf7ZGadK9LQwOEYIQpatBgd093EgAqPVlMz83i53R1n60QgjRjkkXsHpy+7CPpi2Ki7tTj6E4A==
X-Received: by 2002:a05:600c:4e91:b0:3d1:dc6f:b1a4 with SMTP id f17-20020a05600c4e9100b003d1dc6fb1a4mr19595334wmq.5.1670935946097;
        Tue, 13 Dec 2022 04:52:26 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id 18-20020a05600c22d200b003c6bd12ac27sm12560385wmg.37.2022.12.13.04.52.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Dec 2022 04:52:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	David Gibson <david@gibson.dropbear.id.au>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Greg Kurz <groug@kaod.org>,
	qemu-arm@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH-for-8.0 1/3] hw/ppc: Replace tswap32() by const_le32()
Date: Tue, 13 Dec 2022 13:52:16 +0100
Message-Id: <20221213125218.39868-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221213125218.39868-1-philmd@linaro.org>
References: <20221213125218.39868-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ARblOdDm8NIn

Assuming the developers of commits 2c50e26efd ("powerpc: Add
a virtex5 ml507 refdesign board") and 4b387f9ee1 ("ppc: Add
aCube Sam460ex board") were testing on a little-endian setup,
they meant to use const_le32() instead of tswap32() here,
since tswap32() depends on the host endianness.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ppc/sam460ex.c     | 3 ++-
 hw/ppc/virtex_ml507.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 4a22ce3761..88b1480138 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -15,6 +15,7 @@
 #include "qemu/units.h"
 #include "qemu/datadir.h"
 #include "qemu/error-report.h"
+#include "qemu/bswap.h"
 #include "qapi/error.h"
 #include "hw/boards.h"
 #include "sysemu/kvm.h"
@@ -255,7 +256,7 @@ static void main_cpu_reset(void *opaque)
 
         /* Create a mapping for the kernel.  */
         mmubooke_create_initial_mapping(env, 0, 0);
-        env->gpr[6] = tswap32(EPAPR_MAGIC);
+        env->gpr[6] = const_le32(EPAPR_MAGIC);
         env->gpr[7] = (16 * MiB) - 8; /* bi->ima_size; */
 
     } else {
diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index 13cace229b..0f282ecaa7 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -38,6 +38,7 @@
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/option.h"
+#include "qemu/bswap.h"
 
 #include "hw/intc/ppc-uic.h"
 #include "hw/ppc/ppc.h"
@@ -141,7 +142,7 @@ static void main_cpu_reset(void *opaque)
 
     /* Create a mapping for the kernel.  */
     mmubooke_create_initial_mapping(env, 0, 0);
-    env->gpr[6] = tswap32(EPAPR_MAGIC);
+    env->gpr[6] = const_le32(EPAPR_MAGIC);
     env->gpr[7] = bi->ima_size;
 }
 
-- 
2.38.1
