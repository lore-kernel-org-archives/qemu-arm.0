Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp2008934ejf;
        Tue, 16 Aug 2022 13:34:28 -0700 (PDT)
X-Received: by 2002:a05:6808:10ca:b0:343:2fbe:8fa2 with SMTP id s10-20020a05680810ca00b003432fbe8fa2mr146148ois.220.1660682068475;
        Tue, 16 Aug 2022 13:34:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660682068; cv=none;
        d=google.com; s=arc-20160816;
        b=hFvNYC3jzHk8MZ92xETA+DvBNnAMpVD1JXVn9bThcAcDB0+IOjqHZS/m0rrUvYvTtR
         ivV8+7DuqltFds4lyDBGhDU4NTuWRTlFShLtYpMgMaMUQiveLi8lBCel8wJu3Tdpnx24
         D5vg4r/5Sisk9w1ohbJfsl1NxoF/TD9p5idMzc4hFpmSo8G1YMcY9O/TI36C1z7DR2kQ
         Jz9w2sjpe6TggJXsZNdRMysTxbYL/ouCsqUPNefZ9fvw4J/8TC7iX46hF5N2xFAklcHy
         sQpxXoplUafFsCxAJ6KPfNUNpxN31h2N2Al706B7D3QR8QlHdFwWRMqa4fGTAONCEEta
         UtrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=9LSApl9gK4E8RvBz1mB97pn/6P6IkI2dyhjdGvU+Vp8=;
        b=aW8BxRaMKgjl3IrYNVlguUYKT3uv9vVISbLjjt+ipww3gSuw+CMLR4ll+9ATQ0ectJ
         Ml5V+rIdMSfeR+bBA3ryEEFwtsuYhC+fHBsqosqOcbn7i6W3PVKGBZCn1dHpgbwDDhnT
         cr8EoJJzdhS7kTJE/HozXYeRD8U33SKqafX58kXb8VmiLYX7RAryuFDt64BuO/gpy52R
         cE17DIR0waGmFL5GmSFu3vnxcyXV3VzgWUdCDmZo8csq2O5veGWDHpdotMFcZqd982Hd
         ufUWQFuzK/yVDKE2xJe4UI32M1ouooscUpUJUtBvMZKpOPVdf8EVfYmGdYx3bEkxSpA1
         6jtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pwf0OxKI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id cp2-20020a056830660200b00636aac66ddasor1695838otb.187.2022.08.16.13.34.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Aug 2022 13:34:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pwf0OxKI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=9LSApl9gK4E8RvBz1mB97pn/6P6IkI2dyhjdGvU+Vp8=;
        b=pwf0OxKI65SDaagobi6eiL+ny8tJpvhOdmRcFg2fqc09Qv4RHoqcRZRxiuoNud1juw
         gbc9sNGejFztuJsrmwZIUaeouA1Ook1akNDMQYOJwH8kpjRhQ/qtGnwbwt+UciqA0349
         OuIeGj04nGZAhhcqhAJJYYRpl7CAjDw705uFnm56uB0CXaAqIytsRvoHioEI4xdTl8qT
         +FVHEPx4TC71xmGSba2BJ4YAjf+XiThSp16LhXe0CuI9o9IhEOUomB/dC6s9p1XnIb1o
         x2Tfo2O19c/RK3egCQDnUcViguwJAcAB0EfmTiAV2jCcY6iW2+udsLonFm8ovZlLFZOP
         5GeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=9LSApl9gK4E8RvBz1mB97pn/6P6IkI2dyhjdGvU+Vp8=;
        b=K53B9UqgQjMbiHhmO60F2aLJ3eW9pxkXNwGSLQhl6l8DEfu1uf1to0Pkymln4t2+pC
         jhBGZK3MuerCxXD7hzXJQ9FYgm0qod6zJXbRgTW5rLucvmEmf9AOtfS+0ZJwRSsKZaKY
         olYmNrzXWAbujb/5CtU/uJ3ousvejzpotq5TCGn3r8hb2bxHjiKpRUHwEH0McO0tOp1z
         an/osfNY70bv6UAxrWtBuZQNPxeshLlM76btE6ci2u0lGJjshiykCSGeFj9r8et2xOEX
         ofS+Re+KJM5yD/mz0shwKQfvDhVgHptkqXegPM/nrS7qS8i+P/K76BBEObQaRvvjjOD7
         JBBA==
X-Gm-Message-State: ACgBeo2zo+gqQzIzgaOnU7i5p7IdsEkVJRNg2eIS+G+U3T17NyeFke2p
	b+/NaIsLhojsNOqqwSmSY2LbpihW
X-Google-Smtp-Source: AA6agR4YBkswOZLoCX5Ht/cn8LZmdOMi7axdfRDfsGrqsymSnMHZHNc2JUNWxCPSSIVaIi/+b+54Ig==
X-Received: by 2002:a9d:6a98:0:b0:638:d325:3874 with SMTP id l24-20020a9d6a98000000b00638d3253874mr1318656otq.297.1660682068013;
        Tue, 16 Aug 2022 13:34:28 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
        by smtp.gmail.com with ESMTPSA id y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:34:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 09/33] accel/tcg: Move qemu_ram_addr_from_host_nofail to physmem.c
Date: Tue, 16 Aug 2022 15:33:36 -0500
Message-Id: <20220816203400.161187-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 8zYPstxHzLU3

The base qemu_ram_addr_from_host function is already in
softmmu/physmem.c; move the nofail version to be adjacent.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-common.h |  1 +
 accel/tcg/cputlb.c        | 12 ------------
 softmmu/physmem.c         | 12 ++++++++++++
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 2281be4e10..d909429427 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -72,6 +72,7 @@ typedef uintptr_t ram_addr_t;
 void qemu_ram_remap(ram_addr_t addr, ram_addr_t length);
 /* This should not be used by devices.  */
 ram_addr_t qemu_ram_addr_from_host(void *ptr);
+ram_addr_t qemu_ram_addr_from_host_nofail(void *ptr);
 RAMBlock *qemu_ram_block_by_name(const char *name);
 RAMBlock *qemu_ram_block_from_host(void *ptr, bool round_offset,
                                    ram_addr_t *offset);
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index a46f3a654d..5db56bcd1e 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1283,18 +1283,6 @@ void tlb_set_page(CPUState *cpu, target_ulong vaddr,
                             prot, mmu_idx, size);
 }
 
-static inline ram_addr_t qemu_ram_addr_from_host_nofail(void *ptr)
-{
-    ram_addr_t ram_addr;
-
-    ram_addr = qemu_ram_addr_from_host(ptr);
-    if (ram_addr == RAM_ADDR_INVALID) {
-        error_report("Bad ram pointer %p", ptr);
-        abort();
-    }
-    return ram_addr;
-}
-
 /*
  * Note: tlb_fill() can trigger a resize of the TLB. This means that all of the
  * caller's prior references to the TLB table (e.g. CPUTLBEntry pointers) must
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index dc3c3e5f2e..d4c30e99ea 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2460,6 +2460,18 @@ ram_addr_t qemu_ram_addr_from_host(void *ptr)
     return block->offset + offset;
 }
 
+ram_addr_t qemu_ram_addr_from_host_nofail(void *ptr)
+{
+    ram_addr_t ram_addr;
+
+    ram_addr = qemu_ram_addr_from_host(ptr);
+    if (ram_addr == RAM_ADDR_INVALID) {
+        error_report("Bad ram pointer %p", ptr);
+        abort();
+    }
+    return ram_addr;
+}
+
 static MemTxResult flatview_read(FlatView *fv, hwaddr addr,
                                  MemTxAttrs attrs, void *buf, hwaddr len);
 static MemTxResult flatview_write(FlatView *fv, hwaddr addr, MemTxAttrs attrs,
-- 
2.34.1
