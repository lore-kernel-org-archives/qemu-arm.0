Received: by 2002:a17:505:7d82:b0:1be9:327d:8ee3 with SMTP id wv2csp400171njc;
        Wed, 13 Nov 2024 06:27:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWgEuwxNRPGAyPXcypilfgwKeajB3BAPChjRDY6jXEhVjCwUt8FssN6eq1wmisr045sDXeb5PQkOMJEIQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEGD7YMDP9s5F7bytv1J0OUntUfeW3+StIYVDW6JzHMJp0U61f1Yo3ua7PnpRhomSO4a9Qj
X-Received: by 2002:a05:6102:c46:b0:4a3:e18e:1f60 with SMTP id ada2fe7eead31-4aae1639756mr19442166137.20.1731508022557;
        Wed, 13 Nov 2024 06:27:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731508022; cv=none;
        d=google.com; s=arc-20240605;
        b=Co1aRfgTtbKCM3S42SMPjDjEVacXGrLSx4yZ1IShIN4YhzXE8RuYQoSQRfRB8GjEE2
         mecOJl46uX8ZnqoOKiOWOpRCes+NkUQzQpg/Xbzosc8Ul0B+nBV3jkZzgkux+Z1cXukG
         iL5L8X7dPZwi+1ttQrBal7HuvFKQiopGT2o4FVzfMXSy7dMoZ2RnItDaQ7qmRCoESioR
         0DXbU9+T5B7ylPcKCOntAc2H/Y7KTBqZoxbl0CqZRd2Q/ucva5ot2i9Lcl6OvZM+qzP3
         33K/OhRXojpgeTGWt5dDB9gnFLYwRJtY6GHU4S0xmxnbFNrsI9ze+NwUilZF6UauzjIg
         aq3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IOlf/wzEJ+wM7g5BTurCACeEWddAq/2jF0kyAkwof9o=;
        fh=pJxE3yE5haIYCkY9mR2/L28BDy0dwLU1Rp2g3l6fdoQ=;
        b=KR0dSI2xgVlExqrOb0SSpIqGhYKBjCKGoTcVDtP0v9NyV3v1qLs2CYpdn9dW+bXq97
         jMNtb/TUrRBOO5wOk1zV5JCSVKnholK9Ek0Cv2Wnng/+/sovcDsmN7QkmabZysb7BdgI
         i/DSj4aKbNRd0YjfMZntN4QyxAo6wq2SS2peSJw8rR62pt1J6MMXVlgjGySj6SeaW22S
         6FPVA4lj9zczEDthV8AK5DWaNizfzFazkpOBxYhdbZbbGwCxvR8OZfaoxC7u4hsv54S4
         a5JT9ckQuOAFDMKnzbYTS8WZZgc/U3jcZb0d3HzpbiEBQfhXR7+2/KdM9+utWQyrhLaV
         X/dQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=qI4mnx5w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4aa97d33ec6si3798950137.26.2024.11.13.06.27.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Nov 2024 06:27:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=qI4mnx5w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBEIL-000477-CB; Wed, 13 Nov 2024 09:24:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tBEI3-00040n-Nt
 for qemu-arm@nongnu.org; Wed, 13 Nov 2024 09:24:15 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tBEI1-00004w-6I
 for qemu-arm@nongnu.org; Wed, 13 Nov 2024 09:24:15 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5ceb03aadb1so8047917a12.0
 for <qemu-arm@nongnu.org>; Wed, 13 Nov 2024 06:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1731507851; x=1732112651;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IOlf/wzEJ+wM7g5BTurCACeEWddAq/2jF0kyAkwof9o=;
 b=qI4mnx5wt9zg0YPalM3JcQIkfwSjETWg3IZS62VQcAtf6xKLYOKLOPBliGoDq9iXQB
 ya5r5RkkQwpoaXe2wYk9I7Zf3b62muA6Bj2TD9+SHnh0zkc1xIgYEj3pS8kdWAXLnn2b
 al/0ezR03tN5V145yifgVtGvtQyjgP8lr35ddyDyUFJmyk/1tzvL4/nDgC2AwZETAYpR
 9vvLMKP3gIYKF/FB2Ohap+zOSLVE3rh6s2ncSac4b+Y+VcviJrrR4P0jG6icCtNcqMif
 fm678amo4QguLD1RBzActNb0KQxHHsrY47t2E5qphcQPJnZAvXnRHpUw3yDS8VAnU1ZZ
 Ugng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731507851; x=1732112651;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IOlf/wzEJ+wM7g5BTurCACeEWddAq/2jF0kyAkwof9o=;
 b=CKC7ehnQLsdp9aRSN/g4eZDFv98B6c2dQHyl1Vybb2KMI9CwHYsoYUtdjAZYVwVG/z
 JAFC3cGLP1wTl06VA6acelfnv07OVvtt9KTF6jT3TzpjFzRsh9B6ZktBWjiGrn1xhYCK
 KDq8AN617qUrrEtwjjZfqXDmjtBUKWOKGu2/AxX3SD0weSzymP+IFag3J6/GAUjL7B0S
 Tlk3AREj5dwKdkyEtepke+TTpysIBz8TfnZoV/c/WkoijvY1kGkZdUf0BPV1mHMpfrCx
 JL4Tn672zhOfnmX+Nt8lcAvWtm+uRicQq+QgUAzxOxNVVWVCnjPA1MHZuiCd4QUJTJr2
 6f3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhVkWAJZbD/H+pcnBHsxvgD/KSbNWiumJ7EfyJOFSC1sGErr43j4G2npQI/0blp8HpaIeZDGsy9A==@nongnu.org
X-Gm-Message-State: AOJu0Yy992o7APUaTWnS918IwLABEsZ6FvxFO4g6W9SB+fTTz2Kk86gh
 bmIg2InoVMQs11x9Be+2jbxjvyhjSBjL9yIJaDjngmUboN7vC3RGnezOJjZMyQ==
X-Received: by 2002:a05:6402:35d6:b0:5c9:7dd9:3eda with SMTP id
 4fb4d7f45d1cf-5cf630a7d06mr2811573a12.5.1731507851435; 
 Wed, 13 Nov 2024 06:24:11 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf03b5d76esm7134612a12.9.2024.11.13.06.24.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 13 Nov 2024 06:24:10 -0800 (PST)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 stefanha@redhat.com, mst@redhat.com, slp@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 jcmvbkbc@gmail.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 akihiko.odaki@daynix.com, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, balaton@eik.bme.hu, Alexander Graf <graf@amazon.com>
Subject: [PATCH v10 08/15] hvf: arm: Ignore writes to CNTP_CTL_EL0
Date: Wed, 13 Nov 2024 15:23:36 +0100
Message-Id: <20241113142343.40832-9-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241113142343.40832-1-phil@philjordan.eu>
References: <20241113142343.40832-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::533;
 envelope-from=phil@philjordan.eu; helo=mail-ed1-x533.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Ey5LUqwAOcPw

From: Alexander Graf <graf@amazon.com>

MacOS unconditionally disables interrupts of the physical timer on boot
and then continues to use the virtual one. We don't really want to support
a full physical timer emulation, so let's just ignore those writes.

Signed-off-by: Alexander Graf <graf@amazon.com>
Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 target/arm/hvf/hvf.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 6cea483d422..b45b764dfd0 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -11,6 +11,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
+#include "qemu/log.h"
 
 #include "sysemu/runstate.h"
 #include "sysemu/hvf.h"
@@ -184,6 +185,7 @@ void hvf_arm_init_debug(void)
 #define SYSREG_OSLSR_EL1      SYSREG(2, 0, 1, 1, 4)
 #define SYSREG_OSDLR_EL1      SYSREG(2, 0, 1, 3, 4)
 #define SYSREG_CNTPCT_EL0     SYSREG(3, 3, 14, 0, 1)
+#define SYSREG_CNTP_CTL_EL0   SYSREG(3, 3, 14, 2, 1)
 #define SYSREG_PMCR_EL0       SYSREG(3, 3, 9, 12, 0)
 #define SYSREG_PMUSERENR_EL0  SYSREG(3, 3, 9, 14, 0)
 #define SYSREG_PMCNTENSET_EL0 SYSREG(3, 3, 9, 12, 1)
@@ -1620,6 +1622,13 @@ static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
     case SYSREG_OSLAR_EL1:
         env->cp15.oslsr_el1 = val & 1;
         return 0;
+    case SYSREG_CNTP_CTL_EL0:
+        /*
+         * Guests should not rely on the physical counter, but macOS emits
+         * disable writes to it. Let it do so, but ignore the requests.
+         */
+        qemu_log_mask(LOG_UNIMP, "Unsupported write to CNTP_CTL_EL0\n");
+        return 0;
     case SYSREG_OSDLR_EL1:
         /* Dummy register */
         return 0;
-- 
2.39.3 (Apple Git-145)

