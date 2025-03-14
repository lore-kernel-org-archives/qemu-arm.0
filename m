Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp437245njb;
        Fri, 14 Mar 2025 01:13:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWXW/kgHzceO4jyhPumZRH56Ogd7dVL8T+0J36j7VlSWq6jjROKkA0jm986QmNxRUG+JtLs+amQJHBYlg==@linaro.org
X-Google-Smtp-Source: AGHT+IF00/APiClMie+wf4ckL6BrvYVOgBJyWbl3w5m/jnLBYEwCD/oJlx+yR29BKMpsVCOYY/YZ
X-Received: by 2002:a05:6214:1304:b0:6e8:f387:e0d2 with SMTP id 6a1803df08f44-6eaeac3b5aamr17903566d6.11.1741940036516;
        Fri, 14 Mar 2025 01:13:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741940036; cv=none;
        d=google.com; s=arc-20240605;
        b=h9rAa5KMf1Kk4E/xOkQDvbmeMfmGagPcQThB5pwLCungjZAT1Kssfu/hn8hfKwB7LG
         fw9SR3sGrkr8zw09DrjDjSHpyCwG4JsDuAXxoUX1hz4DWfZNPcrh65aIvx4+whcwrw4S
         nP4cWbJ6XhWUya6ut0gL4TgjrtiiY9LfCu+Ulldosqjt1izh6JyJmTXFI5wbFHsKA1s/
         ttz6lz4erybSV1NdWkhhslEdhHfR42P5IuOvyD8Jj1Z6fZ74HAjdeSC+PZk+lf5xKWOY
         y2+cik47qEooCoFHQTKR5mW9GYvMdO1TEmBEHgECEC0LAtHJTBo1Aw6NOQR44AxrYomt
         yZYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:message-id
         :content-transfer-encoding:mime-version:subject:date:from
         :dkim-signature;
        bh=CyjoW/KyG+IekCP/byAanaMOrZmEHo+RD2zSHnIJRzw=;
        fh=kFyTX8JNHNRbNJxbvToRAL9yTCDon3/TSdnBu2npt+I=;
        b=BSGjghdvkJRjpY9QAQkKee4HHGFbrQP5I3NHioQLl2f7+BWvizwTXJasv/8G8My0iX
         kOh44B2SOV9lW//bVrJ9Z0bVfOpsQ2wDv5DdQzFz926bc7ObTkaKv3bPI02xW8O6WZ/o
         3QFBjOpYqbtqZJebJcBRk2NIjTMbiNnD0AauOC0c/RRjxo3ueul+tIMaEqifrQ7pi7xG
         Lj6nxCUUlIYXWJRiPaeTekMIlx0dn/FmyC/TBcLCkmnilTPRA+nSqySs/aWu8188hxHM
         RgIcYBMGACAuFvUl2xuCfC+jvmtZZRbZOghadY5n7ZM58v/V1NmTNJZd5Bv+fPG07b1L
         sI4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=AEVpq8zf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eade356d46si33707676d6.304.2025.03.14.01.13.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Mar 2025 01:13:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=AEVpq8zf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tt0Ap-00014e-M7; Fri, 14 Mar 2025 04:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tt0An-00013w-2x
 for qemu-arm@nongnu.org; Fri, 14 Mar 2025 04:13:41 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tt0Aj-0003HU-NX
 for qemu-arm@nongnu.org; Fri, 14 Mar 2025 04:13:40 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2235189adaeso33640945ad.0
 for <qemu-arm@nongnu.org>; Fri, 14 Mar 2025 01:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1741940011; x=1742544811;
 darn=nongnu.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CyjoW/KyG+IekCP/byAanaMOrZmEHo+RD2zSHnIJRzw=;
 b=AEVpq8zfM84342yPnl9G0KaNRRTTSfIcCm/xgk62g2OUNRRF48gjly/h0WlgKzXlFs
 VVqAoCwjvs+hvKMEXW2b9aYJT2AzWQ3K5Rq74YGCNWzXPc9k69MMLc6X6CjU1nUFYZEe
 f98WlaQwMcWp9BNrGkgHJFEa51t78Dc5mO/xb42JYSg03jH24LTnNyY2ABvzNV65H3EO
 wq95qC/RmUDGKbva9gH1fEdHJCCTNGnTFlsILZX3pF8F7SviGyLTNxgsAhj1cOpXguGj
 +2kodpZ47/0R7E/j5vhM2YNghwvb5Xx5yJwmDX+FR5ob6igsK7NjeWBdMnfPwnTzzVlT
 UHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741940011; x=1742544811;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CyjoW/KyG+IekCP/byAanaMOrZmEHo+RD2zSHnIJRzw=;
 b=VAIvchrwqsKpy/bK0xI6CSdvi06X16sn/cwtFcK54ZQS7vHSMOmFSbI4yFRyDmv7c4
 R1ub4t3Q386eKmKdPHio2V5DnALEUJFh9TBzIb26hi1Gcn3wacj/mzijioDcMrlcMwlY
 byF17YsJ+F/wo/VLWlBh+6m89ASPf4lYhQMQbdWb+TJQaaYARFvAA0mIClkvkoc3B7dh
 aSPzuSzx5oY7WqiTYZ6jnCcB50lmjk7H0opb8eKcg1ir5W7Dy0oeKF7nMAXB5GZhyBR4
 w9kHtnwgtv6olF1FmBzxtfoqJbsgPS7+mf1I4gxjuZwawA6Rle3wkY1LiY/fLBIhVZ0G
 4p8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0Kj9ej1EXogFI6q+L5kMiCWhO3Y6RhgW/tsK5yZ/pK5VUquQFQ1xszIVA2gWebSUzLXK9CIvQOw==@nongnu.org
X-Gm-Message-State: AOJu0YzznRAeEJoA5gYEQ3rEJqT00IT0aicoHbsclXc8MVcIYacKESsQ
 3XxFoysAwcsZnUKnUiqufZzQKHxmKom2j5wRzEoadCKjAvU+Rg7zPQ6ZYTOtHCM=
X-Gm-Gg: ASbGncvn+dZvoFWA8ib2jNBYwYQnDSXXM2iJYd3RS1g+5aDCh25oJHTIHlzjNXcSKNn
 0XIobJeM7df2IxXh642JZHhIwyvr2Ea2h3ota9sL9bnK81cxdxmADdGIWcnS/sgMcN8qT59dZfd
 I49VoywB7w1O53iefTpOMt2g/rAXGWZM5saBhOdiL3+aNhy2iB56gAaRlc3cHJ/L7Dy1Q6b14Yd
 90tSdRJ7zwSs+E5MRJUiNRu8C6aJ202I6BXVIFa5SwFhksieI423w1D4ZmA/qPr0M/JUbNzAk6I
 wJ3zZiayuDhSZ886YEuQhaB0GL1UpNeGHIlJchf0C5sdrQp3
X-Received: by 2002:a17:902:dac1:b0:21f:6d63:6f4f with SMTP id
 d9443c01a7336-225c64f42bdmr70453355ad.2.1741940011292; 
 Fri, 14 Mar 2025 01:13:31 -0700 (PDT)
Received: from localhost ([157.82.205.237])
 by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-225c6ba6d16sm24502315ad.139.2025.03.14.01.13.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 01:13:30 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Fri, 14 Mar 2025 17:13:22 +0900
Subject: [PATCH v2] target/arm: Define raw write for PMU CLR registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-clr-v2-1-7c7220c177c9@daynix.com>
X-B4-Tracking: v=1; b=H4sIACHl02cC/1WMyw7CIBBFf6WZtRhe1taV/2G6QBjsJAoGDGnT8
 O9idy7PzT1ng4yJMMOl2yBhoUwxNJCHDuxswgMZucYguTxxJRSzz8R6o/SgRC+H+xna853Q07J
 XblPjmfInpnWPFvFb//0imGDSWj06r7nH8erMGmg52viCqdb6BULYHbqXAAAA
X-Change-ID: 20250313-clr-6a34831628b7
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 devel@daynix.com, Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.15-dev-edae6
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: KGa2f1cfljbB

Raw writes to PMCNTENCLR and PMCNTENCLR_EL0 incorrectly used their
default write function, which clears written bits instead of writes the
raw value.

PMINTENCLR and PMINTENCLR_EL1 are similar registers, but they instead
had ARM_CP_NO_RAW. target/arm/cpregs.h suggests this flag usage is
inappropriate:
> Flag: Register has no underlying state and does not support raw access
> for state saving/loading; it will not be used for either migration or
> KVM state synchronization. Typically this is for "registers" which are
> actually used as instructions for cache maintenance and so on.

PMINTENCLR and PMINTENCLR_EL1 have underlying states and can support
raw access for state saving/loading. Flagging a register with
ARM_CP_NO_RAW has a side effect that hides it from GDB.

Properly set raw write functions and drop the ARM_CP_NO_RAW flag from
PMINTENCLR and PMINTENCLR_EL1.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
Changes in v2:
- Added raw write functions to PMCNTENCLR and PMINTENCLR.
- Dropped the ARM_CP_NO_RAW flag from PMINTENCLR and PMINTENCLR_EL1.
- Link to v1: https://lore.kernel.org/qemu-devel/20250313-clr-v1-1-2cc49df40fe9@daynix.com
---
 target/arm/helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index f0ead22937bf..d05865983416 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1899,7 +1899,7 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmcnten),
       .accessfn = pmreg_access,
       .fgt = FGT_PMCNTEN,
-      .writefn = pmcntenclr_write,
+      .writefn = pmcntenclr_write, .raw_writefn = raw_write,
       .type = ARM_CP_ALIAS | ARM_CP_IO },
     { .name = "PMCNTENCLR_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 12, .opc2 = 2,
@@ -1907,7 +1907,7 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .fgt = FGT_PMCNTEN,
       .type = ARM_CP_ALIAS | ARM_CP_IO,
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pmcnten),
-      .writefn = pmcntenclr_write },
+      .writefn = pmcntenclr_write, .raw_writefn = raw_write },
     { .name = "PMOVSR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 3,
       .access = PL0_RW, .type = ARM_CP_IO,
       .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmovsr),
@@ -2024,16 +2024,16 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
     { .name = "PMINTENCLR", .cp = 15, .crn = 9, .crm = 14, .opc1 = 0, .opc2 = 2,
       .access = PL1_RW, .accessfn = access_tpm,
       .fgt = FGT_PMINTEN,
-      .type = ARM_CP_ALIAS | ARM_CP_IO | ARM_CP_NO_RAW,
+      .type = ARM_CP_ALIAS | ARM_CP_IO,
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pminten),
-      .writefn = pmintenclr_write, },
+      .writefn = pmintenclr_write, .raw_writefn = raw_write },
     { .name = "PMINTENCLR_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 9, .crm = 14, .opc2 = 2,
       .access = PL1_RW, .accessfn = access_tpm,
       .fgt = FGT_PMINTEN,
-      .type = ARM_CP_ALIAS | ARM_CP_IO | ARM_CP_NO_RAW,
+      .type = ARM_CP_ALIAS | ARM_CP_IO,
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pminten),
-      .writefn = pmintenclr_write },
+      .writefn = pmintenclr_write, .raw_writefn = raw_write },
     { .name = "CCSIDR", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .crn = 0, .crm = 0, .opc1 = 1, .opc2 = 0,
       .access = PL1_R,

---
base-commit: 825b96dbcee23d134b691fc75618b59c5f53da32
change-id: 20250313-clr-6a34831628b7

Best regards,
-- 
Akihiko Odaki <akihiko.odaki@daynix.com>

