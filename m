Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2396959njc;
        Mon, 24 Mar 2025 21:59:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVyqQ2Q1aaXavXwUEyn0QXxVRNOBcgkjOvP+qKZdBlrLYIaz4jBzvPkQAj+V1RqObZaYZoeVUgW11JBWg==@linaro.org
X-Received: by 2002:a05:6a20:7488:b0:1f3:194b:30b0 with SMTP id adf61e73a8af0-1fe42f25e29mr25204706637.5.1742878767646;
        Mon, 24 Mar 2025 21:59:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742878767; cv=none;
        d=google.com; s=arc-20240605;
        b=B3is1YQJYGpTX9vpHmmA0Fwhp14hhIAAjPV1CQrzb9maCRS+f2fvnv7meJucYXaURP
         i/Cct4pyJCdxosuMU0sTrnz0p7E22lCpv/Y8BgH9Q7snpkMlYSkwgmeE48zfoPZTSnAv
         paTDZZTKMEWSknZP+eYRONDSbzY3hedDhu7K+0vNLBL6Vdz/ZPHtMDTMJPtETA531Us6
         Q6ASOwaNSgGgNvyNJMRa1GeGi6JXteWUjIuQzDKnBU5WkCDpIFl/DZtzLKuTjAMgTq/B
         2P8yOsIyXV3RmwtObGp1ldGoZDUs6t+moOjv7/QWMjCaaC0DwuBNcs+Rx60y2dQWRqyS
         LXBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7u9igk3DJeYNJ4kHlFRAOur7C++4prjQF3K5i5oOOhU=;
        fh=eMqxUSFGvpffw3C7fOY86vFd8yI0tAs+NQK6unSmna4=;
        b=NOA+iOLkiM5T2WXw8x0QPoSPssPhmNZCAkuGdI3rdB675R/mpHqdMgImc9KeKnV4+p
         gYLObaCUNXVX3axUyVlIKLBmedM4+DLT//ZNNRSxtVISErfdVi8VFsLWpAt4Mp8p3Gum
         52F9WB/i9atjbD3xAb0olTHTbk91ESwcKg2QkWN/PDL/NBUXWl5FZrUa07SYDdJaIfkY
         L2Tt5omr3ZxEFv0g9VlSIiF42JFBEiMkmx6Gpy57IWpuzMHvgFeM71+K1652w53XcWXx
         kfJYtAMABr6cySkFYKC3HrqZPqM8QoQtfKb0dyU6kvg9DL+mcE6SIFEbZTekl0gmuISE
         JMkw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qjLTijFj;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-af8a23db56bsor5038610a12.0.2025.03.24.21.59.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 21:59:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qjLTijFj;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742878767; x=1743483567; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7u9igk3DJeYNJ4kHlFRAOur7C++4prjQF3K5i5oOOhU=;
        b=qjLTijFjYw1o3yRPDs8YfLBG0ABb746KDWOwWd8ff64fv60CD/miAShutcS5Ya2/jf
         SWDxPX1jHxEn0a16QaG/fwhJObOXrqGrJh9psHCi0oTW77Kswunn8smxzG9AGRTfn00w
         ULsseZn+zU5ECA1qpAQI4tJAUXOKI3ID+IU21sXpbr7X0UpgdZ0I9O0/cy4UEV/QO7xM
         9IndK2H9T8BmG9KRn4UKDHq99Nb4loFl3dtrkjDG7yU2ku3J+gYg1fm9VytpTxgA+g/B
         +LC0s+lg4UvAc+mmCI0yrDsVeKYkHwFoEN1sZH54+K3emHnBwppLiiBO0vDGx593Gel0
         0RhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742878767; x=1743483567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7u9igk3DJeYNJ4kHlFRAOur7C++4prjQF3K5i5oOOhU=;
        b=RuJ+bsPD15xcwvQ78Leof8mLmKstR0gA8xHiPafBJP4CyQ1oneYZDzmfMcsOLUiQIl
         Y1iiFuiGJxyLVTFmUPx2JHCb/Cir6efSFgpU0QFAGRmCbpUV4c2/yAI3HGOq2VQLxRz9
         Kykv/nwKm0LQVCJ/yCGpxBUCWXwf+nYpKD8+w7fcv6+ubRD5NDw62aNln6oCwK0VO2bZ
         UiYhdUty1yMM3rau7jQU8yVuQKt2J6aykCBwfXJXlJM/xdTyoGNqNxZIF+oekFHMM8DI
         6ld6vxT/bBXseF/9TwS9a/4ERnySfKx0/WgCQqsI8LNinZRLr8Uesn2Bs3XwUIXnbs+d
         BKoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwRvNULDip3sTDJPzUsxVjsRCgXW3nPkyp6WW6avQvb+0StNLcrV2PkjbRaP4bSVvqQCM2PUaR2Lq96g==@linaro.org
X-Gm-Message-State: AOJu0YwrW1r5FDN+wVUfRUAqWQmMjbMGdlGw2SOVxsTYJmbKAjF2rjQc
	QB7Wwsn9ItdQ96xKsXNCngh9sMchMKlJPnj7lt5XCSm9ZjfXb/uJx0oyjK5hGUkRqw==
X-Gm-Gg: ASbGncunZfki+tpuRYV9EJ3WbTABMIFoa7G+lp7Ltbb6p11wAN0DvipxBfaLoJlsp/u
	Gbwe/DnTmk6PtJvMijuHKnwNfKao7jO3Axm4Vohnpzse9X2HKPlGbHY3OryvS7eyt2lp5kP/Tfz
	1/J5/yb9iGU14kbym34GCehE1AR5ym71QHQeiErrRHJk5wb27jm6YuCBuZLSD7KGPu+lAVEf3BM
	2uSMfIOUmH18AwtSeUEiuPHQXnPBQGjRVbxiztiP8AnN7o5UjNdbo3H100DevXo9YwVvkGWuvFF
	GvMo07dQrONUU5htjvThPgDHoFKsRwk0X4/va1/CtMko
X-Google-Smtp-Source: AGHT+IEiLeBzJzC5jt8zA/2EUNgz/WuF2tstB2sh/pCZJeNAww/EeI683sYhypnoorCiSk/JT+KeeQ==
X-Received: by 2002:a17:90b:5108:b0:2ff:7b28:a519 with SMTP id 98e67ed59e1d1-3030ff24236mr23516938a91.30.1742878767084;
        Mon, 24 Mar 2025 21:59:27 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf58b413sm14595120a91.13.2025.03.24.21.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 21:59:26 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 06/29] exec/cpu-all: remove tswap include
Date: Mon, 24 Mar 2025 21:58:51 -0700
Message-Id: <20250325045915.994760-7-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
References: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 3C1RZtgEPtgF

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
index 83978be0603..7fffa23bc8d 100644
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
