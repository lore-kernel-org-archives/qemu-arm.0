Received: by 10.223.188.70 with SMTP id a6csp5526345wrh;
        Mon, 28 Aug 2017 23:33:19 -0700 (PDT)
X-Received: by 10.37.44.18 with SMTP id s18mr2517679ybs.107.1503988398976;
        Mon, 28 Aug 2017 23:33:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503988398; cv=none;
        d=google.com; s=arc-20160816;
        b=dd37C4qfOp69czLVbsRr0h63suobHwgn77eVJYZwLwh+dTjKBOSn6oA36EbtoCprqc
         BbMUfyCp97iV2/xgs37sCZQO6XoPr6tZ06jjnrNJp+/DfDajt7XvF8IkF3lXkW59bL9P
         73vDkPW1Cv3fHZ0S5NgJCWbcfFVBwe6r0SABTzdVez8budCt6gu8Sl19f5/Hlix4WwAt
         x+DAOjcXop3ljrGnD7ScVVIWjMzs5Oakn0kHZoZINtdhrSYmy7ij0hzliqWbdX8iuXIF
         VXofjstyIGI0MgAs/5gvgeDRVRPcKZrx6iJYf2MnZ16bljP8ytAtMAcPmAX58n8m00Jx
         IlBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature:arc-authentication-results;
        bh=7cyqdcqT7XR/NRo3PwV57yOZ8y6Or0EHZ7FWsTFdhh4=;
        b=GaLlJb7cqyzidXjx375NdT/4tDnfbbQqJ+cUGJeTS0N96HMoKqnsQh7zUQqSJ4g7Db
         RTbeohPZHTXVmd1kjTNbU2toUVnz8Fgoe8ga/Ie3v6AlF8W6qiNT/GEk0RWXDFLr7OW6
         vsBDq0CWjKDyZEp64vObQz8Fli7yiJZ9P5IVMH+XPcQY+uj9HDrpzszuz0+5RXYZFmYW
         x1dxDy+C8uIMF0XyFBpU7AJAbzTAQ0FmZ8NdLxhiqCardxQAyWdCC1Knmg4bfy43rzsn
         s34ka9kkKz4l4+hQf/u0naZwyrl0ctZNtZVcwkh+Z0wd3lyFmS0nyQw92fZeRcwWQq3L
         TNJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=H/nljru4;
       spf=pass (google.com: domain of bobby.prani@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=bobby.prani@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <bobby.prani@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s187sor1440567yws.106.2017.08.28.23.33.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Aug 2017 23:33:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of bobby.prani@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=H/nljru4;
       spf=pass (google.com: domain of bobby.prani@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=bobby.prani@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7cyqdcqT7XR/NRo3PwV57yOZ8y6Or0EHZ7FWsTFdhh4=;
        b=H/nljru4Bbz8uSXStjX0osnHR2stHKc2Ih1NZqthue6gFvGx2+/rD/LoN4biNch9V5
         WjWwiSXB+bb5uF6j7Om7eSJ6o3ESE51eP599e2K1JElzhfU716GnAshdsgNwBvZFbVgx
         8RKNLjm23cXM7CEXohWKrU1udksYu75K3BmemrO0nLum9CmgZygA6gLIPLMAOehQsQTr
         eq86r5uxrsICwdIrzJD886sseAIiVqQlcK67DOCT6tFitMzMg8aGDtdY6cJGQkgQFJgg
         yoBFkNGFlGkBZJ9zIkq6PCjH+dG2S74hTCvWssQlUujPCoTQ2L6A9FgkJ6WiBICJKMaE
         H9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7cyqdcqT7XR/NRo3PwV57yOZ8y6Or0EHZ7FWsTFdhh4=;
        b=lHtp2AXJbZsePOP3Uke8REIBJK4PCPrcnnCfUl3Zvvo9Ti0EZ3kROKZwUcXA5/qCiV
         GBjdwUpOgZcW/D8+l7GkZl5jTvN1LaJx/DQaEssnB7W9vqOOcvKf5ChCAhSDEl/YNYoZ
         HjeO1gXLSH8CBCdnzCN0jNSSOU/YEXC8vnNGNnlDK5M1ww/ju4f0qYlC2ersWQ+jd8d+
         ty5JjPCCFKvLUu4fZfbhWi5kUIg0BMYH3egdEAx6EUT/igrOiiKWp2RGVX4GxqRLSaOi
         rh/F5gNamzjbP0QaUBbFXqpmu6oZu9F4iu92mAjg7OjUKQnKWcloDvQtxD2limCKEFY/
         4/Kg==
X-Gm-Message-State: AHYfb5hBZlYdCcU1S38lmr3+E2a5BXGSH6NBC6fdrc5n+k1BBP/0Jjkp
	PxtGOtfDpXbNCzvJLGOQtA==
X-Received: by 10.13.225.71 with SMTP id k68mr2537649ywe.33.1503988398387;
        Mon, 28 Aug 2017 23:33:18 -0700 (PDT)
Return-Path: <bobby.prani@gmail.com>
Received: from localhost.localdomain ([98.192.46.210])
        by smtp.gmail.com with ESMTPSA id x4sm817923ywa.44.2017.08.28.23.33.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Aug 2017 23:33:17 -0700 (PDT)
From: Pranith Kumar <bobby.prani@gmail.com>
To: alex.bennee@linaro.org,
	Claudio Fontana <claudio.fontana@huawei.com>,
	Richard Henderson <rth@twiddle.net>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Alexander Graf <agraf@suse.de>,
	qemu-arm@nongnu.org (open list:AArch64 target),
	qemu-devel@nongnu.org (open list:All patches CC here)
Cc: qemu-devel@nongnu.org,
	pbonzini@redhat.com
Subject: [RFC v3 PATCH 3/5] mttcg: Add tcg target default memory ordering
Date: Tue, 29 Aug 2017 02:33:11 -0400
Message-Id: <20170829063313.10237-3-bobby.prani@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170829063313.10237-1-bobby.prani@gmail.com>
References: <20170829063313.10237-1-bobby.prani@gmail.com>
X-TUID: jcLIu+0cMCLN

Signed-off-by: Pranith Kumar <bobby.prani@gmail.com>
---
 tcg/aarch64/tcg-target.h | 2 ++
 tcg/arm/tcg-target.h     | 2 ++
 tcg/ia64/tcg-target.h    | 2 ++
 tcg/mips/tcg-target.h    | 2 ++
 tcg/ppc/tcg-target.h     | 2 ++
 tcg/s390/tcg-target.h    | 2 ++
 tcg/sparc/tcg-target.h   | 2 ++
 7 files changed, 14 insertions(+)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 55a46ac825..b41a248bee 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -117,4 +117,6 @@ static inline void flush_icache_range(uintptr_t start, uintptr_t stop)
     __builtin___clear_cache((char *)start, (char *)stop);
 }
 
+#define TCG_TARGET_DEFAULT_MO (0)
+
 #endif /* AARCH64_TCG_TARGET_H */
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 5ef1086710..a38be15a39 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -134,4 +134,6 @@ static inline void flush_icache_range(uintptr_t start, uintptr_t stop)
     __builtin___clear_cache((char *) start, (char *) stop);
 }
 
+#define TCG_TARGET_DEFAULT_MO (0)
+
 #endif
diff --git a/tcg/ia64/tcg-target.h b/tcg/ia64/tcg-target.h
index 901bb7575d..8f475fe742 100644
--- a/tcg/ia64/tcg-target.h
+++ b/tcg/ia64/tcg-target.h
@@ -195,4 +195,6 @@ static inline void flush_icache_range(uintptr_t start, uintptr_t stop)
     asm volatile (";;sync.i;;srlz.i;;");
 }
 
+#define TCG_TARGET_DEFAULT_MO (0)
+
 #endif
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index d75cb63ed3..e9558d15bc 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -206,4 +206,6 @@ static inline void flush_icache_range(uintptr_t start, uintptr_t stop)
     cacheflush ((void *)start, stop-start, ICACHE);
 }
 
+#define TCG_TARGET_DEFAULT_MO (0)
+
 #endif
diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index 5f4a40a5b4..5a092b038a 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -125,4 +125,6 @@ extern bool have_isa_3_00;
 
 void flush_icache_range(uintptr_t start, uintptr_t stop);
 
+#define TCG_TARGET_DEFAULT_MO (0)
+
 #endif
diff --git a/tcg/s390/tcg-target.h b/tcg/s390/tcg-target.h
index 957f0c0afe..dc0e59193c 100644
--- a/tcg/s390/tcg-target.h
+++ b/tcg/s390/tcg-target.h
@@ -133,6 +133,8 @@ extern uint64_t s390_facilities;
 
 #define TCG_TARGET_EXTEND_ARGS 1
 
+#define TCG_TARGET_DEFAULT_MO (TCG_MO_ALL & ~TCG_MO_ST_LD)
+
 enum {
     TCG_AREG0 = TCG_REG_R10,
 };
diff --git a/tcg/sparc/tcg-target.h b/tcg/sparc/tcg-target.h
index 854a0afd70..4515c9ab48 100644
--- a/tcg/sparc/tcg-target.h
+++ b/tcg/sparc/tcg-target.h
@@ -162,6 +162,8 @@ extern bool use_vis3_instructions;
 
 #define TCG_AREG0 TCG_REG_I0
 
+#define TCG_TARGET_DEFAULT_MO (0)
+
 static inline void flush_icache_range(uintptr_t start, uintptr_t stop)
 {
     uintptr_t p;
-- 
2.13.0
