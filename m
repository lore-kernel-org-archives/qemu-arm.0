Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1278974njc;
        Thu, 20 Mar 2025 15:30:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWvMXlI74UKgSteki0mILkONNSyrKSzgeY9lq9TZy9U3pOtt85QuqweCCgTIbJsg7rqL/kyIjo/7XSUZQ==@linaro.org
X-Received: by 2002:a17:903:1a27:b0:21f:98fc:8414 with SMTP id d9443c01a7336-2265e7c2830mr86998495ad.26.1742509826327;
        Thu, 20 Mar 2025 15:30:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742509826; cv=none;
        d=google.com; s=arc-20240605;
        b=TBumJBnlqQcx6XasSCyVrttZRy54V/YaTGO7tAOI0iJbyfUaePMlvarZALMXXx2dg/
         wok3PvB6lma2o+epfV71STjJx5LjOJgm9Bj30ijR8rR2Fq9UdRZBZQXM3/SvPjc3OrGS
         bQ47Td3eE7GBcNTOfZITAFQvh1hJXD7mOi64wM0SliN7T5Xmb305pflYVpeSM1sCVkCo
         iKIRxQCuyMbD1hV8xxsSpK1iRIRO6vXglLsPniM5bx4ISVtBbty2Lz9/rJh0dz8Cym6w
         R8KZ1+z1yeb8yawG1mrfUEOAvlJv2FTcKZyime/R2wSLkbltqd4uDx7WPseMLLVtTydn
         OBvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=avokc7PtwidAIhGAXsNkScUiPBrKycg0jtKiMA4KDgs=;
        fh=WJmEKQx9RzVaaxyst90piPU9B5yTcyA8vWTra2pNaXA=;
        b=Fy++bNSc1/wyk9LRw+gv53YpTE84Z7r1msG93OLWggkf1lYkhsWA6xivTfIPbXyl01
         6kFQyGIxG3g2OGrwDvP+sHLOdABTmIVAdbctvN+nuqOhdcNW9pXSrZrCzI2cM4zY16o5
         Wv0PaNQMb+9GOGBM7GeaUjB/KimdsyUkDJTDniyV1yllAzXw3DrCTU/88YKR3lXEONBr
         Nd3p+phIX6T89KRerKRAAx04S88nrepPPets+yRboCjHBAfEWvPOpTDQhEQOzcz7QJ9u
         tKsyc8XEq9DnZurixOgLgnt2Shig+r51x+X8yRkx/cK7SytRE1UHzrVHPq07hoUeQsvv
         qXog==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OVjR9JN6;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2264b343b75sor19438995ad.4.2025.03.20.15.30.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 15:30:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OVjR9JN6;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742509826; x=1743114626; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=avokc7PtwidAIhGAXsNkScUiPBrKycg0jtKiMA4KDgs=;
        b=OVjR9JN6rgfjn1lW+QLwiURK3LEnpZbkkImOf5YAQivKx0YqEZHOdtZpMafH2vFG8K
         Me6fcx1RsnfrYO/nLwIkNyW/z630odooKuTEJksq+7cwnfl6MXjEgHR/iuJDYxrn7WYT
         M+uKBShIOgEwBLYjrR9p4YDDpvUHP0ILs+XGwafGBmcQwdm13a6KXCWsf8j/TDuC5epq
         IFnp4cCy1bejLvQOMp4YUomTxL3rifNnLR7e+2ajVoI7delb5mOneD42aGKdLHDx2Ik1
         aIhxTyBeHRVz+OWiXPly4aOCpqm/PhVDy5EV98GaTn3hl2aIHKRqGztvi7RplKSTdIQ8
         iaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742509826; x=1743114626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=avokc7PtwidAIhGAXsNkScUiPBrKycg0jtKiMA4KDgs=;
        b=ezFAFCDqFVzd9Sjv1busJnX3io3U3FphxAJ9GDuSxXlNrV2xmtaQtYJYl3D8/bnvqB
         MvthOH3hobjJ5uxkS+6OxPGdoJR5jWCOVdB00fd0K5/HVllgsYRGTC4YU8DUeSVYOeNp
         33xGiq+0hjPbry7qRfSqqyMeNAP2AjYfrqmBS9i2qBoJ2wobpLHDn1obVC02Kyy7ZIAv
         bJepuDRZxNFgIxKePv2xeoiM28V2vK8mdvNlQb8fcQ8kjvxcRDk3WYvKDQOiNUBlrlnE
         fx0xgffKOiklRFQ+0UqDXcxLqdUeZROABMO8G1UatDxJI9IEQOfucw1jnb1m2x9x2Ucs
         bTsg==
X-Forwarded-Encrypted: i=1; AJvYcCX3J41el3meZbeL1WFB4FOeFzt8E+F5ix/sWG0FCu3XaSSE+9w91/Ab6hqql39eAaI8pi/jekjQvgEiEg==@linaro.org
X-Gm-Message-State: AOJu0YxnCmkas3zfJJSeOYSb8wOyjstbTkA+n87QTBoMwQkZArqNVlLq
	ZWTYenR2NMUNt4WzUAO7umnve3+w+7cnrUSAVIUsOp3T5ori04HhC5Eg5q9lfnMovg==
X-Gm-Gg: ASbGncvuvqZnXpfScWtr3mHzX4t4xHCZHmv9jC9P41p6WDkACzLGyB765oBNBE6F1vu
	9JiCu9gPIlvYTaXvnbgjwLR+Kdcv390bqfza466bw/XumCdgDm1IuCbU1y3TsUHIAIlpq5l3kFX
	5WNbMvi7mZZ0ocuCzn55iQi8DrMDp0QRSBfPuCyUz5eGovrqUPYj2W1kkq5Z9X0b273y/97R0Bl
	4N7RlXVvm/dMxg2fNIB8z+kASKVf7wbMX+S3ov1solI+xxvb24fMtOerOuimD7xm7Kq8OW6XEze
	WLC3q7cL9DtaG484j9sVKkKLkFmAjT2bda53vvgAY2XG
X-Google-Smtp-Source: AGHT+IGEEKE91spkEXTcAVV49R6+3YhJ1RqwkB0C8ZoyykH1H01x06i5gZ0hciM5xTE4CtOtK2OMPw==
X-Received: by 2002:a17:902:ef4f:b0:21f:1348:10e6 with SMTP id d9443c01a7336-227806cfff4mr22432425ad.13.1742509825855;
        Thu, 20 Mar 2025 15:30:25 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f4581csm3370145ad.59.2025.03.20.15.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 15:30:25 -0700 (PDT)
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
Subject: [PATCH v2 13/30] accel/tcg: fix missing includes for TARGET_HAS_PRECISE_SMC
Date: Thu, 20 Mar 2025 15:29:45 -0700
Message-Id: <20250320223002.2915728-14-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: abFsiSNUlh6J

We prepare to remove cpu.h from cpu-all.h, which will transitively
remove it from accel/tcg/tb-internal.h, and thus from most of tcg
compilation units.

Note: this was caught by a test regression for s390x-softmmu.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/poison.h | 1 +
 accel/tcg/tb-maint.c  | 1 +
 accel/tcg/user-exec.c | 1 +
 3 files changed, 3 insertions(+)

diff --git a/include/exec/poison.h b/include/exec/poison.h
index 964cbd5081c..c72f56df921 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -38,6 +38,7 @@
 #pragma GCC poison TARGET_SUPPORTS_MTTCG
 #pragma GCC poison TARGET_BIG_ENDIAN
 #pragma GCC poison TCG_GUEST_DEFAULT_MO
+#pragma GCC poison TARGET_HAS_PRECISE_SMC
 #pragma GCC poison BSWAP_NEEDED
 
 #pragma GCC poison TARGET_LONG_BITS
diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index d5899ad0475..efe90d2d695 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu/interval-tree.h"
 #include "qemu/qtree.h"
+#include "cpu.h"
 #include "exec/cputlb.h"
 #include "exec/log.h"
 #include "exec/exec-all.h"
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 667c5e03543..9d82d22bf40 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -19,6 +19,7 @@
 #include "qemu/osdep.h"
 #include "accel/tcg/cpu-ops.h"
 #include "disas/disas.h"
+#include "cpu.h"
 #include "exec/vaddr.h"
 #include "exec/exec-all.h"
 #include "exec/tlb-flags.h"
-- 
2.39.5
