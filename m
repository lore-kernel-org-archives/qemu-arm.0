Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp2008825ejf;
        Tue, 16 Aug 2022 13:34:11 -0700 (PDT)
X-Received: by 2002:a9d:6e0a:0:b0:637:60a:795f with SMTP id e10-20020a9d6e0a000000b00637060a795fmr8100954otr.121.1660682050826;
        Tue, 16 Aug 2022 13:34:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660682050; cv=none;
        d=google.com; s=arc-20160816;
        b=YiYq5JY0QxhgYifCTLtsUo0z/QAvZsQgGmhM6YJkiA49tqFnImiZ+FXhJ9J8tK54i2
         VSmdOh87w1SCRFVlxQaaGyHuzvKeIzFzZw+P7GZYW/Y/CudNsO+B+mXMB4/4K6E42GVt
         B8OYuhMIf/NEhbFg59Boc/MV//Dlpg6154tMtYaIBVr4hp5nKDlzLw/Rg6HxcCWJ+4Ug
         kOsuskV01iUyHpXoH4qCjFCfoDAgqFJt/5db8sP8gcKzdCCAE7AQB6teNs8en+pyYu/k
         yLsvm2vyTU5u3otejX7pVXShnV+BWxuQFylz/kqbJTmnKHA92FN5Qkb/18laN531QTrz
         hjnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=aJaNQ6aSdE9rWibAJT4lh7LTRwz3SqqWw+/j8K8vQwg=;
        b=s8dLlUCz18FeAM6rHL9GTi5ryTlSidmWIyEwLeI6MnHwoGFA0iaCSkN6quy5+jmcXm
         oLtNkZup2T+2kBeFLyTxkyXVBCbjjuTxwQpkoDVRc0YbvKfLhHlfWI+0yofAmclBV74m
         cTmpmZjrL9YcOi6dduV8xRhyaAenXqAXvRNF7eAB8PsWVlyg+L6l9CU4tm9eIX0EXdze
         BHrZrswNhjInHEdLlCN8Mt10twZsiumV9lDjbuZQr7kEuUJRcYEr1IeoHTjS1cmz35sd
         fbuU3yNTgO12Xp3AvQwgk/4XMcoVjKDp9RJBdk4Q9jcojdj7Usr5QHmmXZnmTfMlxYOB
         LD4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oEnMed6t;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id qj2-20020a0568702f0200b0010cca90b1c5sor2286817oab.38.2022.08.16.13.34.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Aug 2022 13:34:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oEnMed6t;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=aJaNQ6aSdE9rWibAJT4lh7LTRwz3SqqWw+/j8K8vQwg=;
        b=oEnMed6tOl3Y+xrLCmvfWgfuaWYWu3X97xgc/ysSM9aVPWfbLsw6DQwmi77+Kwshfg
         tkgqfIcJaqD7iI3n1EktcX/lH3sdryHe/fiJtnqIx3xjnwwKH/c+rw5qY1IYvtteTTMP
         CDBo/zOLPFWGYqXJazEynH973s0k6lL+akWmhV+f6RQK7gUSX6M0G/G4OaMSVM05Igjd
         Ora/qx2GvapfmEWp79EBQRS3PVu67MQBdDrwe9yKGxHPWM+0gvQ2psUntEveFX3/WBQK
         VK1B1nki5NwOymq4tjFO13oaH03ZnwcHyo/UyzKdFr80JXAWpFFhlAiJafJ3x9kjOb4p
         c5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=aJaNQ6aSdE9rWibAJT4lh7LTRwz3SqqWw+/j8K8vQwg=;
        b=N3OdRdD4/k8hm24Fjo0083mctaRX8o1byWvWKyh5NtfHWRSiNCRmh9rLD2O+khbMWz
         y9zGrICY8LueC5aKnWwjlARxJ4C0ox8Ihm5RAP07vRZoDYcOckXlyob2M+9rNQ5dGHfS
         LvGnycBcluaWujg6WxezjB00688PzNHVlG+hK1odZTDc/tsTCgabKjCeB9OStQFHaTsb
         89EYBL6N7ZAgTirOG9Trafvf1g3Z/5VOdlRyozBHQQWb4ri7Mr6UZR8mHlOR7uQbCbw4
         2HwTCxOeBPkufbFlf7SgqgjjAstuM+g6m87aSJ+g2HTrcAfJYQwZ3z7uuoggMI6Hw98b
         wCbg==
X-Gm-Message-State: ACgBeo1dFFfd0+hXfEsnoifWNPG17OkTYCRf9pTmaVkx2EfSAjHRpYrY
	BWPd408tC0UpxN5lw6kG4pGvSV13
X-Google-Smtp-Source: AA6agR5QloLnexmhB6aaW0yHTIzd3pfTqjdlI8EYIxlgEb2CSRznLrbSrCzZDw927/ez7i06DuLZWw==
X-Received: by 2002:a05:6870:5584:b0:10d:ccda:433c with SMTP id n4-20020a056870558400b0010dccda433cmr135106oao.185.1660682050234;
        Tue, 16 Aug 2022 13:34:10 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
        by smtp.gmail.com with ESMTPSA id y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:34:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 02/33] linux-user/hppa: Allocate page zero as a commpage
Date: Tue, 16 Aug 2022 15:33:29 -0500
Message-Id: <20220816203400.161187-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 0lHuueMgJGoK

We're about to start validating PAGE_EXEC, which means that we've
got to mark page zero executable.  We had been special casing this
entirely within translate.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 3e3dc02499..29d910c4cc 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1646,6 +1646,34 @@ static inline void init_thread(struct target_pt_regs *regs,
     regs->gr[31] = infop->entry;
 }
 
+#define LO_COMMPAGE  0
+
+static bool init_guest_commpage(void)
+{
+    void *want = g2h_untagged(LO_COMMPAGE);
+    void *addr = mmap(want, qemu_host_page_size, PROT_NONE,
+                      MAP_ANONYMOUS | MAP_PRIVATE | MAP_FIXED, -1, 0);
+
+    if (addr == MAP_FAILED) {
+        perror("Allocating guest commpage");
+        exit(EXIT_FAILURE);
+    }
+    if (addr != want) {
+        return false;
+    }
+
+    /*
+     * On Linux, page zero is normally marked execute only + gateway.
+     * Normal read or write is supposed to fail (thus PROT_NONE above),
+     * but specific offsets have kernel code mapped to raise permissions
+     * and implement syscalls.  Here, simply mark the page executable.
+     * Special case the entry points during translation (see do_page_zero).
+     */
+    page_set_flags(LO_COMMPAGE, LO_COMMPAGE + TARGET_PAGE_SIZE,
+                   PAGE_EXEC | PAGE_VALID);
+    return true;
+}
+
 #endif /* TARGET_HPPA */
 
 #ifdef TARGET_XTENSA
@@ -2326,12 +2354,12 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
 }
 
 #if defined(HI_COMMPAGE)
-#define LO_COMMPAGE 0
+#define LO_COMMPAGE -1
 #elif defined(LO_COMMPAGE)
 #define HI_COMMPAGE 0
 #else
 #define HI_COMMPAGE 0
-#define LO_COMMPAGE 0
+#define LO_COMMPAGE -1
 #define init_guest_commpage() true
 #endif
 
@@ -2555,7 +2583,7 @@ static void pgb_static(const char *image_name, abi_ulong orig_loaddr,
         } else {
             offset = -(HI_COMMPAGE & -align);
         }
-    } else if (LO_COMMPAGE != 0) {
+    } else if (LO_COMMPAGE != -1) {
         loaddr = MIN(loaddr, LO_COMMPAGE & -align);
     }
 
-- 
2.34.1
