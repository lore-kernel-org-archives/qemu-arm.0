Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp533191ejb;
        Thu, 1 Jun 2023 08:31:46 -0700 (PDT)
X-Received: by 2002:ac2:548d:0:b0:4a4:6af4:43b7 with SMTP id t13-20020ac2548d000000b004a46af443b7mr128969lfk.69.1685633506415;
        Thu, 01 Jun 2023 08:31:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685633506; cv=none;
        d=google.com; s=arc-20160816;
        b=zGrGSO7fGy1Rg/MIMkEnNkNOVI50jDaj6uLjdDOhy2Q1ohQo8nGCmtpt6DI74W8nVo
         8I4nJi/xCcntf0d5BBsWfOdUgYqAKLO3g58SYf1mdOV/H7FXl5q1i3U6XTwTMRxbEwDw
         rxHqqN1lLC+1GIDbdMS9FlmcSJaORhjmDHW2+Z6JIYIS1R6GQWSx89bYWQN7rCji1KnP
         zCvXgRilO2bVVpokMZiRIbIUjBafAbZ5FX7Y3C4hrpJGAVPwMfyGLjsXAJVg1FNpv6v0
         D/vsfGrkRk1YAh01gHxW4/Nm5uLRxJbKd6Thy4EzEHUVzkoBvdMPPi+Jj76W30nJnhcN
         SXDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=FFqn9AjjZkzd8n5FT0PLGukdSL4yY/A1xym9++ydJyQ=;
        b=o38x2FRXvEXH5RWDXhH5VRChLW3R56qmsTE1qMLxyrHBRi9IJsMr9TAjnFuRA12532
         IsoqFpd9WPALGwVOfK5zxKtaflKeAWSuNmcdTQQwnI/4duzkPOkag8QMEKxS0mWNWZ7I
         jMDyhP/vVWUHztb1DfwdfXVNhvaSXiJamlbgLbxRS9xDtWU5vU1fvPUwbqJoeZY6UAqH
         1sEtiibUYS0Naj3hVEFoWK0PV1Du+6VDM3KZ6ZPxTiVT4BdJdSqbUyFbHzKYwbxU0E3y
         CkIWcsSVPFx5KZHCixWQgzQaAs2gww44qD48Mb5f/cPtB7Ddr0QPZF/WFDIQTEhWJ3bV
         sGgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=LRMihSJi;
       spf=pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=francesco.cagnin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <francesco.cagnin@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o29-20020ac25b9d000000b004f3a7ce7ca1sor1309533lfn.17.2023.06.01.08.31.46
        (Google Transport Security);
        Thu, 01 Jun 2023 08:31:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=LRMihSJi;
       spf=pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=francesco.cagnin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685633506; x=1688225506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFqn9AjjZkzd8n5FT0PLGukdSL4yY/A1xym9++ydJyQ=;
        b=LRMihSJi6qwl/qhs9o4V0OcfuPiYviO7e+jCrO4IEcrziqfUcm5DlPVHcJqbIgq3FN
         Ti4tJIxwx22photFR8EWZz5Iet2uHMhk98yDDbG7vM0hTc2vgyDxRLL6I2lPGlnrNZ2v
         JdJa5JjEqhqtYtPr+cH+vdAz8PtwljrM6N/PmBpa+DQORA5P+lh2dALYiHlxiPaxisBK
         waq/xCJPcHK04AsmPCPV+UEaf3FZH61NJEC8gBqjBhUSqeoC5joVheeCiiMAuCxrABd9
         t6AsLPgGj3coVnIVzECQgiUTIy4nxTS051dFFjRcvN5poaE7XqEEP6rMqfNw+WxD3qg2
         4Waw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685633506; x=1688225506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FFqn9AjjZkzd8n5FT0PLGukdSL4yY/A1xym9++ydJyQ=;
        b=TrkMsty2u+avjvL4fUM1QwbzhDo9+t7yBOM1pAJKDrCvRlZXovzjR0Xhic2reuatq+
         kiuLaEWSx+xUbUGGQubjrfYQoGQbQFTafcMxjtjbKibcn+OL6fYiiS/ARaTkVJGaQ/7C
         /NbqvYIQhOgct74PsFApyqjImH84Y7QbUVXl3s2DegK6VZSkgrVytwj7QiBQGZecioQF
         0trAypBbiN4YFtPESwJ6OEQmTwAoVE9zGh049ncE6maSPwDubMAueoEX71BxcYbtndUK
         pieIy5aAbji5IbphU6RVNpMWKUXDcXBG+Z5p+yNyN4EJXgU9DuqA36UMyc4RyHDsrf3L
         kd8A==
X-Gm-Message-State: AC+VfDxwfNUAmxqkPVpfUNgRNvjphJCBOzZbvxaz0Kuu2zpWMMqvGXgs
	GBnjah9PzEeT1f6nfdt5fVs=
X-Google-Smtp-Source: ACHHUZ5Vy5jFPI+cbFqiVmf0b/SsAfY1NZ5XfTtsVpeV/nNj3UgRbyBvO8PZ72WMWZgoubJnVC6Lxw==
X-Received: by 2002:ac2:5d6c:0:b0:4f4:d5d9:7fca with SMTP id h12-20020ac25d6c000000b004f4d5d97fcamr149873lft.53.1685633505852;
        Thu, 01 Jun 2023 08:31:45 -0700 (PDT)
Return-Path: <francesco.cagnin@gmail.com>
Received: from omega.guest.bzh.qb (177.23.22.93.rev.sfr.net. [93.22.23.177])
        by smtp.gmail.com with ESMTPSA id l14-20020a1ced0e000000b003f4289b18a7sm2763975wmh.5.2023.06.01.08.31.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 01 Jun 2023 08:31:45 -0700 (PDT)
From: francesco.cagnin@gmail.com
X-Google-Original-From: fcagnin@quarkslab.com
To: qemu-devel@nongnu.org
Cc: mads@ynddal.dk,
	dirty@apple.com,
	peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	agraf@csgraf.de,
	pbonzini@redhat.com,
	alex.bennee@linaro.org,
	philmd@linaro.org,
	Francesco Cagnin <fcagnin@quarkslab.com>
Subject: [PATCH v5 2/4] hvf: handle access for more registers
Date: Thu,  1 Jun 2023 17:31:05 +0200
Message-Id: <20230601153107.81955-3-fcagnin@quarkslab.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601153107.81955-1-fcagnin@quarkslab.com>
References: <20230601153107.81955-1-fcagnin@quarkslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 4+GOHibt20U3

From: Francesco Cagnin <fcagnin@quarkslab.com>

Required for guest debugging.

Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>
---
 target/arm/hvf/hvf.c | 213 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 213 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index ad65603445..e221e37055 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -107,6 +107,72 @@
 #define SYSREG_ICC_SGI1R_EL1     SYSREG(3, 0, 12, 11, 5)
 #define SYSREG_ICC_SRE_EL1       SYSREG(3, 0, 12, 12, 5)
 
+#define SYSREG_MDSCR_EL1      SYSREG(2, 0, 0, 2, 2)
+#define SYSREG_DBGBVR0_EL1    SYSREG(2, 0, 0, 0, 4)
+#define SYSREG_DBGBCR0_EL1    SYSREG(2, 0, 0, 0, 5)
+#define SYSREG_DBGWVR0_EL1    SYSREG(2, 0, 0, 0, 6)
+#define SYSREG_DBGWCR0_EL1    SYSREG(2, 0, 0, 0, 7)
+#define SYSREG_DBGBVR1_EL1    SYSREG(2, 0, 0, 1, 4)
+#define SYSREG_DBGBCR1_EL1    SYSREG(2, 0, 0, 1, 5)
+#define SYSREG_DBGWVR1_EL1    SYSREG(2, 0, 0, 1, 6)
+#define SYSREG_DBGWCR1_EL1    SYSREG(2, 0, 0, 1, 7)
+#define SYSREG_DBGBVR2_EL1    SYSREG(2, 0, 0, 2, 4)
+#define SYSREG_DBGBCR2_EL1    SYSREG(2, 0, 0, 2, 5)
+#define SYSREG_DBGWVR2_EL1    SYSREG(2, 0, 0, 2, 6)
+#define SYSREG_DBGWCR2_EL1    SYSREG(2, 0, 0, 2, 7)
+#define SYSREG_DBGBVR3_EL1    SYSREG(2, 0, 0, 3, 4)
+#define SYSREG_DBGBCR3_EL1    SYSREG(2, 0, 0, 3, 5)
+#define SYSREG_DBGWVR3_EL1    SYSREG(2, 0, 0, 3, 6)
+#define SYSREG_DBGWCR3_EL1    SYSREG(2, 0, 0, 3, 7)
+#define SYSREG_DBGBVR4_EL1    SYSREG(2, 0, 0, 4, 4)
+#define SYSREG_DBGBCR4_EL1    SYSREG(2, 0, 0, 4, 5)
+#define SYSREG_DBGWVR4_EL1    SYSREG(2, 0, 0, 4, 6)
+#define SYSREG_DBGWCR4_EL1    SYSREG(2, 0, 0, 4, 7)
+#define SYSREG_DBGBVR5_EL1    SYSREG(2, 0, 0, 5, 4)
+#define SYSREG_DBGBCR5_EL1    SYSREG(2, 0, 0, 5, 5)
+#define SYSREG_DBGWVR5_EL1    SYSREG(2, 0, 0, 5, 6)
+#define SYSREG_DBGWCR5_EL1    SYSREG(2, 0, 0, 5, 7)
+#define SYSREG_DBGBVR6_EL1    SYSREG(2, 0, 0, 6, 4)
+#define SYSREG_DBGBCR6_EL1    SYSREG(2, 0, 0, 6, 5)
+#define SYSREG_DBGWVR6_EL1    SYSREG(2, 0, 0, 6, 6)
+#define SYSREG_DBGWCR6_EL1    SYSREG(2, 0, 0, 6, 7)
+#define SYSREG_DBGBVR7_EL1    SYSREG(2, 0, 0, 7, 4)
+#define SYSREG_DBGBCR7_EL1    SYSREG(2, 0, 0, 7, 5)
+#define SYSREG_DBGWVR7_EL1    SYSREG(2, 0, 0, 7, 6)
+#define SYSREG_DBGWCR7_EL1    SYSREG(2, 0, 0, 7, 7)
+#define SYSREG_DBGBVR8_EL1    SYSREG(2, 0, 0, 8, 4)
+#define SYSREG_DBGBCR8_EL1    SYSREG(2, 0, 0, 8, 5)
+#define SYSREG_DBGWVR8_EL1    SYSREG(2, 0, 0, 8, 6)
+#define SYSREG_DBGWCR8_EL1    SYSREG(2, 0, 0, 8, 7)
+#define SYSREG_DBGBVR9_EL1    SYSREG(2, 0, 0, 9, 4)
+#define SYSREG_DBGBCR9_EL1    SYSREG(2, 0, 0, 9, 5)
+#define SYSREG_DBGWVR9_EL1    SYSREG(2, 0, 0, 9, 6)
+#define SYSREG_DBGWCR9_EL1    SYSREG(2, 0, 0, 9, 7)
+#define SYSREG_DBGBVR10_EL1   SYSREG(2, 0, 0, 10, 4)
+#define SYSREG_DBGBCR10_EL1   SYSREG(2, 0, 0, 10, 5)
+#define SYSREG_DBGWVR10_EL1   SYSREG(2, 0, 0, 10, 6)
+#define SYSREG_DBGWCR10_EL1   SYSREG(2, 0, 0, 10, 7)
+#define SYSREG_DBGBVR11_EL1   SYSREG(2, 0, 0, 11, 4)
+#define SYSREG_DBGBCR11_EL1   SYSREG(2, 0, 0, 11, 5)
+#define SYSREG_DBGWVR11_EL1   SYSREG(2, 0, 0, 11, 6)
+#define SYSREG_DBGWCR11_EL1   SYSREG(2, 0, 0, 11, 7)
+#define SYSREG_DBGBVR12_EL1   SYSREG(2, 0, 0, 12, 4)
+#define SYSREG_DBGBCR12_EL1   SYSREG(2, 0, 0, 12, 5)
+#define SYSREG_DBGWVR12_EL1   SYSREG(2, 0, 0, 12, 6)
+#define SYSREG_DBGWCR12_EL1   SYSREG(2, 0, 0, 12, 7)
+#define SYSREG_DBGBVR13_EL1   SYSREG(2, 0, 0, 13, 4)
+#define SYSREG_DBGBCR13_EL1   SYSREG(2, 0, 0, 13, 5)
+#define SYSREG_DBGWVR13_EL1   SYSREG(2, 0, 0, 13, 6)
+#define SYSREG_DBGWCR13_EL1   SYSREG(2, 0, 0, 13, 7)
+#define SYSREG_DBGBVR14_EL1   SYSREG(2, 0, 0, 14, 4)
+#define SYSREG_DBGBCR14_EL1   SYSREG(2, 0, 0, 14, 5)
+#define SYSREG_DBGWVR14_EL1   SYSREG(2, 0, 0, 14, 6)
+#define SYSREG_DBGWCR14_EL1   SYSREG(2, 0, 0, 14, 7)
+#define SYSREG_DBGBVR15_EL1   SYSREG(2, 0, 0, 15, 4)
+#define SYSREG_DBGBCR15_EL1   SYSREG(2, 0, 0, 15, 5)
+#define SYSREG_DBGWVR15_EL1   SYSREG(2, 0, 0, 15, 6)
+#define SYSREG_DBGWCR15_EL1   SYSREG(2, 0, 0, 15, 7)
+
 #define WFX_IS_WFE (1 << 0)
 
 #define TMR_CTL_ENABLE  (1 << 0)
@@ -933,6 +999,78 @@ static int hvf_sysreg_read(CPUState *cpu, uint32_t reg, uint32_t rt)
             hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
         }
         break;
+    case SYSREG_DBGBVR0_EL1:
+    case SYSREG_DBGBVR1_EL1:
+    case SYSREG_DBGBVR2_EL1:
+    case SYSREG_DBGBVR3_EL1:
+    case SYSREG_DBGBVR4_EL1:
+    case SYSREG_DBGBVR5_EL1:
+    case SYSREG_DBGBVR6_EL1:
+    case SYSREG_DBGBVR7_EL1:
+    case SYSREG_DBGBVR8_EL1:
+    case SYSREG_DBGBVR9_EL1:
+    case SYSREG_DBGBVR10_EL1:
+    case SYSREG_DBGBVR11_EL1:
+    case SYSREG_DBGBVR12_EL1:
+    case SYSREG_DBGBVR13_EL1:
+    case SYSREG_DBGBVR14_EL1:
+    case SYSREG_DBGBVR15_EL1:
+        val = env->cp15.dbgbvr[SYSREG_CRM(reg)];
+        break;
+    case SYSREG_DBGBCR0_EL1:
+    case SYSREG_DBGBCR1_EL1:
+    case SYSREG_DBGBCR2_EL1:
+    case SYSREG_DBGBCR3_EL1:
+    case SYSREG_DBGBCR4_EL1:
+    case SYSREG_DBGBCR5_EL1:
+    case SYSREG_DBGBCR6_EL1:
+    case SYSREG_DBGBCR7_EL1:
+    case SYSREG_DBGBCR8_EL1:
+    case SYSREG_DBGBCR9_EL1:
+    case SYSREG_DBGBCR10_EL1:
+    case SYSREG_DBGBCR11_EL1:
+    case SYSREG_DBGBCR12_EL1:
+    case SYSREG_DBGBCR13_EL1:
+    case SYSREG_DBGBCR14_EL1:
+    case SYSREG_DBGBCR15_EL1:
+        val = env->cp15.dbgbcr[SYSREG_CRM(reg)];
+        break;
+    case SYSREG_DBGWVR0_EL1:
+    case SYSREG_DBGWVR1_EL1:
+    case SYSREG_DBGWVR2_EL1:
+    case SYSREG_DBGWVR3_EL1:
+    case SYSREG_DBGWVR4_EL1:
+    case SYSREG_DBGWVR5_EL1:
+    case SYSREG_DBGWVR6_EL1:
+    case SYSREG_DBGWVR7_EL1:
+    case SYSREG_DBGWVR8_EL1:
+    case SYSREG_DBGWVR9_EL1:
+    case SYSREG_DBGWVR10_EL1:
+    case SYSREG_DBGWVR11_EL1:
+    case SYSREG_DBGWVR12_EL1:
+    case SYSREG_DBGWVR13_EL1:
+    case SYSREG_DBGWVR14_EL1:
+    case SYSREG_DBGWVR15_EL1:
+        val = env->cp15.dbgwvr[SYSREG_CRM(reg)];
+        break;
+    case SYSREG_DBGWCR0_EL1:
+    case SYSREG_DBGWCR1_EL1:
+    case SYSREG_DBGWCR2_EL1:
+    case SYSREG_DBGWCR3_EL1:
+    case SYSREG_DBGWCR4_EL1:
+    case SYSREG_DBGWCR5_EL1:
+    case SYSREG_DBGWCR6_EL1:
+    case SYSREG_DBGWCR7_EL1:
+    case SYSREG_DBGWCR8_EL1:
+    case SYSREG_DBGWCR9_EL1:
+    case SYSREG_DBGWCR10_EL1:
+    case SYSREG_DBGWCR11_EL1:
+    case SYSREG_DBGWCR12_EL1:
+    case SYSREG_DBGWCR13_EL1:
+    case SYSREG_DBGWCR14_EL1:
+    case SYSREG_DBGWCR15_EL1:
+        val = env->cp15.dbgwcr[SYSREG_CRM(reg)];
+        break;
     default:
         if (is_id_sysreg(reg)) {
             /* ID system registers read as RES0 */
@@ -1172,6 +1310,81 @@ static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
             hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
         }
         break;
+    case SYSREG_MDSCR_EL1:
+        env->cp15.mdscr_el1 = val;
+        break;
+    case SYSREG_DBGBVR0_EL1:
+    case SYSREG_DBGBVR1_EL1:
+    case SYSREG_DBGBVR2_EL1:
+    case SYSREG_DBGBVR3_EL1:
+    case SYSREG_DBGBVR4_EL1:
+    case SYSREG_DBGBVR5_EL1:
+    case SYSREG_DBGBVR6_EL1:
+    case SYSREG_DBGBVR7_EL1:
+    case SYSREG_DBGBVR8_EL1:
+    case SYSREG_DBGBVR9_EL1:
+    case SYSREG_DBGBVR10_EL1:
+    case SYSREG_DBGBVR11_EL1:
+    case SYSREG_DBGBVR12_EL1:
+    case SYSREG_DBGBVR13_EL1:
+    case SYSREG_DBGBVR14_EL1:
+    case SYSREG_DBGBVR15_EL1:
+        env->cp15.dbgbvr[SYSREG_CRM(reg)] = val;
+        break;
+    case SYSREG_DBGBCR0_EL1:
+    case SYSREG_DBGBCR1_EL1:
+    case SYSREG_DBGBCR2_EL1:
+    case SYSREG_DBGBCR3_EL1:
+    case SYSREG_DBGBCR4_EL1:
+    case SYSREG_DBGBCR5_EL1:
+    case SYSREG_DBGBCR6_EL1:
+    case SYSREG_DBGBCR7_EL1:
+    case SYSREG_DBGBCR8_EL1:
+    case SYSREG_DBGBCR9_EL1:
+    case SYSREG_DBGBCR10_EL1:
+    case SYSREG_DBGBCR11_EL1:
+    case SYSREG_DBGBCR12_EL1:
+    case SYSREG_DBGBCR13_EL1:
+    case SYSREG_DBGBCR14_EL1:
+    case SYSREG_DBGBCR15_EL1:
+        env->cp15.dbgbcr[SYSREG_CRM(reg)] = val;
+        break;
+    case SYSREG_DBGWVR0_EL1:
+    case SYSREG_DBGWVR1_EL1:
+    case SYSREG_DBGWVR2_EL1:
+    case SYSREG_DBGWVR3_EL1:
+    case SYSREG_DBGWVR4_EL1:
+    case SYSREG_DBGWVR5_EL1:
+    case SYSREG_DBGWVR6_EL1:
+    case SYSREG_DBGWVR7_EL1:
+    case SYSREG_DBGWVR8_EL1:
+    case SYSREG_DBGWVR9_EL1:
+    case SYSREG_DBGWVR10_EL1:
+    case SYSREG_DBGWVR11_EL1:
+    case SYSREG_DBGWVR12_EL1:
+    case SYSREG_DBGWVR13_EL1:
+    case SYSREG_DBGWVR14_EL1:
+    case SYSREG_DBGWVR15_EL1:
+        env->cp15.dbgwvr[SYSREG_CRM(reg)] = val;
+        break;
+    case SYSREG_DBGWCR0_EL1:
+    case SYSREG_DBGWCR1_EL1:
+    case SYSREG_DBGWCR2_EL1:
+    case SYSREG_DBGWCR3_EL1:
+    case SYSREG_DBGWCR4_EL1:
+    case SYSREG_DBGWCR5_EL1:
+    case SYSREG_DBGWCR6_EL1:
+    case SYSREG_DBGWCR7_EL1:
+    case SYSREG_DBGWCR8_EL1:
+    case SYSREG_DBGWCR9_EL1:
+    case SYSREG_DBGWCR10_EL1:
+    case SYSREG_DBGWCR11_EL1:
+    case SYSREG_DBGWCR12_EL1:
+    case SYSREG_DBGWCR13_EL1:
+    case SYSREG_DBGWCR14_EL1:
+    case SYSREG_DBGWCR15_EL1:
+        env->cp15.dbgwcr[SYSREG_CRM(reg)] = val;
+        break;
     default:
         cpu_synchronize_state(cpu);
         trace_hvf_unhandled_sysreg_write(env->pc, reg,
-- 
2.40.1
