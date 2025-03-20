Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1278919njc;
        Thu, 20 Mar 2025 15:30:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWFa58tOlYoOvKGUKjrhoAeaJ//0WbQCpEYr/KB0dkmL0lWqlo07fzuB6jioTCjlMFOwAhwYxrMvPN2Lw==@linaro.org
X-Received: by 2002:a17:902:ef11:b0:224:c46:d166 with SMTP id d9443c01a7336-22780e14e84mr19516475ad.40.1742509821031;
        Thu, 20 Mar 2025 15:30:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742509821; cv=none;
        d=google.com; s=arc-20240605;
        b=J2zGnMPmcjvzEA0vmjG8Z463m0CSbrV1YOfjk/xcJMVgHOoumANt6pEi663tsFld3Q
         hSz+LC3AU5dFN8PlO0JxRiQcSx6QEeLx4ONIaHAnF3EK0YZ/0Q35IQcncJcUQNoB3tJx
         aZzJ5eluPLdMDRTYSE/781vTq5p2ROXyqW6BZsn/epthYl8NGN/8SMboPD7M1v7DO0gC
         kQZqGgG2Hurg3IMxFocRGmvQ5inPNN2dXSkYZ0fW+llortCi+bg0rjkKFak8OW/iSpt3
         WOi/yjFQg6CwO9CnkDBj2IzJjlVcIFV++3BLvRnKSC+F5FQVNKJY5RDbzs2L/i2IK8fJ
         B4GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=xFqUHpOq6/zm0nogOBs1dNKROVvqoyXbuPu8a/iEMZk=;
        fh=GMIHLIdrMTLa3TQU4BrhOHbbD8yBy1QEvNZUXkF6s2w=;
        b=Uu3ZuDqFNhsmY45oC0VOb7yh1Voo7txwMMTKVFf25ezvRqmhNAFqi035oTG/iqoy4K
         uQrOSySaHsiETwoR0frYREE6+l04ogccbaPsvTV4cBXuIpFfo5b+rrIWPk5KQgHi9Rzc
         d9ocewbUFrclFRkMGWr8sEQn6B338++Hfm11h3JRAZDaAaWHJ7TNnOeeozMlg9r0+vLO
         cKSG8MNOUHEuPCfnPGsoUY+uM+SsnECUd5gjhWLRPWE+laU9pBTTFFNWZbpONUw7gxF9
         QJH2ZB9zcRodb2RpwnJ75wOnLkWTAMe0jYyc739sWGcLPs3tyUn7YGoKKb5t3PHNHTMF
         bu4w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b5NvpjLV;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780f087dfsor4423535ad.7.2025.03.20.15.30.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 15:30:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b5NvpjLV;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742509820; x=1743114620; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xFqUHpOq6/zm0nogOBs1dNKROVvqoyXbuPu8a/iEMZk=;
        b=b5NvpjLV+jaY3vjOX9N0hx76DmfS/DQf/H3uWphlmUv0+QBLoDEMlLdkX04pemAaVQ
         weVZJibxr1fBBecXGGMaHoDT604orhp2N56ftwscih1X/ROyQlRT2e9CUQxysHqyoSx0
         ZzW4EjcUtHOCBkZxD6tptsAVgHWCwS+lJf11qPoPl/IHVa+ho1GQgOvJ5orLULFiHbVR
         uWd7k5X/pQd94ik8eNvkOY2LtwngGru+eBp4w7N1iQtym+YRnYtQUkqFetuLKsP6AVnW
         35bJrJVo4r6srUfA1yooXDiw+iYe3r+zSOj3oaGngW4IbtwrakzHINZsqiTyI9wzKw37
         K4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742509820; x=1743114620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xFqUHpOq6/zm0nogOBs1dNKROVvqoyXbuPu8a/iEMZk=;
        b=XQNkriIt1l0gdtY7aL4ieFjzpFQCpIchlGfKR4Pg5AfIrZnPK1DRQlVkDf+JBbS14s
         YeC5fN9VybC5W20Q11cd4s8XvqwyZX/b9BWSAeW4KyCEvAmH4eU33BpBRdmDo5MvHhyV
         F7H0vlgkb5E75pAZXJZ5Bu83a7HPR08j5Sckaa0daRBamSjtK0neTxot2jxjDflE6tvb
         J+XiXqPQMH1CG+lEOucMrZcNiFePxsOPfT1H1yEdeUvlYIAkxWKbirU/LvjXh7vIdKfy
         ON2UNNbmRBGRDYATpFWKZorkso/b/3wOkLqBoxVGm0+6PPdIxP04pM0/p0E3fcxJW6nt
         ZD5A==
X-Forwarded-Encrypted: i=1; AJvYcCXnH3zqcsg4w+T8VxP1NK3AJPjTfli12vAEll3EA+74cdV7Y/xorbDaHzhX382BUy20u0Ya0zLsef3RFQ==@linaro.org
X-Gm-Message-State: AOJu0YxhiMTYUmwZramw4UL/ZnefLRnalTH/3FxVp7FrdD1XNu8p6/eN
	DKVOU3SoJC8AWIM+NZf0zRegYX3OJ61EiJpg7R7cyQkcKQds3ia3VnjHj3upAWVcMw==
X-Gm-Gg: ASbGncsAs8ZSFOHSkJVIKyqd2IkLspnz6RxJd9HgNGHtNuGBu9U11aoXSfE2KezARs+
	Oj6XTSEd6s+EDurbHnv2rlqHCpaJDm7VB5eZ6EUppRfWsrbimaHvzU7+6u4PhM+evkuJ+pXvzdp
	uZk41yxRnUSLkYQoZ7FqlI/tb2mYScn8voj3RFQpDlXzRDgNATgvZV4v0bEuNb9ihzZOjeIWjK7
	fAJAq1qxUgyOEG6LiheZ9zW986Ov4vV74EcQUgNl0FbNToyKXINgz2ZpCCr36tUhdvv7HSR5zVL
	zvg0+4oup4BCAgncxR2LE4f09evIGhSyihxYFdW6r1+O
X-Google-Smtp-Source: AGHT+IFBKDA1KSEszRYL6pQSK/w5qMFQcOYQFQf+g/w2J4vsHvlcI3/0ADJcw1lVzMWVtNrb1auW7g==
X-Received: by 2002:a17:903:32ce:b0:223:6180:1bf7 with SMTP id d9443c01a7336-22780e1557emr14650115ad.42.1742509820539;
        Thu, 20 Mar 2025 15:30:20 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f4581csm3370145ad.59.2025.03.20.15.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 15:30:20 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 07/30] exec/cpu-all: remove tswap include
Date: Thu, 20 Mar 2025 15:29:39 -0700
Message-Id: <20250320223002.2915728-8-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: vG5ufwvN4Awc

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/cpu-all.h               | 1 -
 target/ppc/mmu-hash64.h              | 2 ++
 target/i386/tcg/system/excp_helper.c | 1 +
 target/i386/xsave_helper.c           | 1 +
 target/riscv/vector_helper.c         | 1 +
 5 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 4a2cac1252d..1539574a22a 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -21,7 +21,6 @@
 
 #include "exec/cpu-common.h"
 #include "exec/cpu-interrupt.h"
-#include "exec/tswap.h"
 #include "hw/core/cpu.h"
 
 /* page related stuff */
diff --git a/target/ppc/mmu-hash64.h b/target/ppc/mmu-hash64.h
index ae8d4b37aed..b8fb12a9705 100644
--- a/target/ppc/mmu-hash64.h
+++ b/target/ppc/mmu-hash64.h
@@ -1,6 +1,8 @@
 #ifndef MMU_HASH64_H
 #define MMU_HASH64_H
 
+#include "exec/tswap.h"
+
 #ifndef CONFIG_USER_ONLY
 
 #ifdef TARGET_PPC64
diff --git a/target/i386/tcg/system/excp_helper.c b/target/i386/tcg/system/excp_helper.c
index b0b74df72fd..4badd739432 100644
--- a/target/i386/tcg/system/excp_helper.c
+++ b/target/i386/tcg/system/excp_helper.c
@@ -23,6 +23,7 @@
 #include "exec/cputlb.h"
 #include "exec/page-protection.h"
 #include "exec/tlb-flags.h"
+#include "exec/tswap.h"
 #include "tcg/helper-tcg.h"
 
 typedef struct TranslateParams {
diff --git a/target/i386/xsave_helper.c b/target/i386/xsave_helper.c
index 996e9f3bfef..24ab7be8e9a 100644
--- a/target/i386/xsave_helper.c
+++ b/target/i386/xsave_helper.c
@@ -5,6 +5,7 @@
 #include "qemu/osdep.h"
 
 #include "cpu.h"
+#include "exec/tswap.h"
 
 void x86_cpu_xsave_all_areas(X86CPU *cpu, void *buf, uint32_t buflen)
 {
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index ff05390baef..ff8b2b395f5 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -26,6 +26,7 @@
 #include "exec/page-protection.h"
 #include "exec/helper-proto.h"
 #include "exec/tlb-flags.h"
+#include "exec/tswap.h"
 #include "fpu/softfloat.h"
 #include "tcg/tcg-gvec-desc.h"
 #include "internals.h"
-- 
2.39.5
