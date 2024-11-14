Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp26329njc;
        Wed, 13 Nov 2024 17:15:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUOfCpRa78vhLH7Cs2X6MpxuTcz+LvJyV1PwNxxlDdxyJ4qzEw+fWSwtRUhKuC11yH7aPXgFpWk1pVboA==@linaro.org
X-Received: by 2002:a05:600c:3b1c:b0:431:542d:2599 with SMTP id 5b1f17b1804b1-432da7cbc48mr2390425e9.22.1731546902539;
        Wed, 13 Nov 2024 17:15:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731546902; cv=none;
        d=google.com; s=arc-20240605;
        b=Yw9fTAIyXBWPYvg+ilgd8YHao0G68BqavoIYo6UPaT2nGSQ+DXOzeJ+uuqN1K0Dwhx
         4kMAfvdbqbiMdAeL74BJnyc/232GCx8UG0fhbvDOXEq4rpRJpi8GxoM3xUR8bWr737fi
         bCm7xXJ2hoeRJV+d3WT2gJvecVHjlkm73jVxF11k2mhNeyI5MN54UJjDL4EcVv5s2Izt
         V43DyqonaBJ2M4CaPnQPmf6fHMR4h0g7dunt8NEoc3iXc48iq9IMaCx60pDq84PIvgUo
         osd0jiJyhVfPK/vWhfvnzNr5zKtAuXURKXUSUvH0ASP6nOV7yaQ0axBDX7S191e0Oip7
         LXIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=2hAfsLa5F/wTHTnThKWfes1iOEyMXfbHgC1xYE0xNjQ=;
        fh=pDwoAzUt0QrVd9ROyNbeCUc84KkfiMjEWV1EzgafKFg=;
        b=CgHYz2zzjFP7t32XqUrCHVBDxxg2UWZgX7PEsuLT1FE1a7jr/mA0NOSYuO93HgGoWz
         CBc44KvbRWtHEiHqK6gsZGs1RiI2BMiKfDUfLSz6fS1CKfmJL7/wNU36MTahxWshZdru
         Fdwo2GMmT7xoDACaZOQnDKDxNHtxhaJY1REzKnK9ZPDNIUs2cm7Wp5i8yQE556F+paVt
         x35MAg4zbRbkaLIU6NjqyrjsKJjiAwKOyzDX5BHmXq3NEcTONT3FoQlOv1vJgnaUGFbd
         tSWwOBmX6uLWB9/szSOWFNUGt28NH2mOiIwQ0uLlPgbejmT2OHmLJeiDHfIJw4S2Ga1G
         b7mw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JqaPfgFZ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-432b0b64bcdsor81880575e9.7.2024.11.13.17.15.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 17:15:02 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JqaPfgFZ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731546902; x=1732151702; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hAfsLa5F/wTHTnThKWfes1iOEyMXfbHgC1xYE0xNjQ=;
        b=JqaPfgFZ1zPkpTEPRkZFlnmUlCBQUfqIBfjBMcxaKO42i0/IxEAdF/41HOh9xZpCd9
         ka03anifvBqItdgM9Bhwx1o30cyIHqqEK1JnKDYdfNRDfBRKPVhTPtCkJ3SS+5HOvG15
         XsFFdNMVz3n/dNYJzwpybBhHYeghHnewq43IWL118MLRXF1IsSEpmioXqR64pJ0kx+8i
         /9kpxwJ50EY78obK7V2ey0cAQ0r69XZy4zd+adw74c0U9umgzFg2/MSg9Oxw01CFGVqn
         nitVDrtymimB78YNyFTJ5bYObWfNwW0i2DQQOULmpKEVQhsNIxPbO94eP7CaigGScs21
         0uDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731546902; x=1732151702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2hAfsLa5F/wTHTnThKWfes1iOEyMXfbHgC1xYE0xNjQ=;
        b=bTNX7OhN2xMIbrVxVA+c1ASz4hGUKcqeM2Fy1QkvgEyuIFvntLMophl6b1IsNzZfZK
         Mme8LE3PJceiDUMOaNRSikGvuXEaa7wUNipK6VjhUE96qGJEGAMeEB1xFPCDzN3YBYZr
         YvHZfTAaWzDWQiujBPzVWegIA6d7m5DTVJTcjzFRgRE4WGCxi191CZTVdZ95TO5+mQIW
         juCYUdCobgOJg4Z9bhxDe4wdKup0QrYLqBaeM8h54gMfy2w4GS+dAzmRfzy7RWQIrita
         8/lnMRAoHbyUeoC9Fkonm3nGQtNUaqqE5xgprsrARo6C27ynBgIQzNLOHs9dX08zVV5d
         pxSw==
X-Forwarded-Encrypted: i=1; AJvYcCXed2ZsdgVZiN6i9frHEr6trevc616yD57JRf0Jaaomi7M93beT5J5fZoCiya2mUNXOscXmmds6/gyQjg==@linaro.org
X-Gm-Message-State: AOJu0YzNck2b1nEZ6icENmAERsJuX7+6O13opHk9FejBLlJtEoharDPI
	TjbGnp/Po5RQsBwZSfplO5ws0BHebFB+tBPD4QyawoUaLDIZAKVbjzgnagT6GjUVsQ==
X-Google-Smtp-Source: AGHT+IH7RFWsMnakRg5GJlnl5zZr5zJQPCLqZOnOCy/xPwCBs6cxFICDeA4XzSDQuRyqlWzDDXypCA==
X-Received: by 2002:a05:600c:444e:b0:431:52a3:d9d5 with SMTP id 5b1f17b1804b1-432da6d6676mr3323435e9.0.1731546902007;
        Wed, 13 Nov 2024 17:15:02 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.187.209.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dac1fbf9sm1377125e9.41.2024.11.13.17.14.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 13 Nov 2024 17:15:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Peter Xu <peterx@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 13/24] exec: Declare tlb_reset_dirty*() in 'exec/cputlb.h'
Date: Thu, 14 Nov 2024 02:12:58 +0100
Message-ID: <20241114011310.3615-14-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114011310.3615-1-philmd@linaro.org>
References: <20241114011310.3615-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: iJIW4iLbS+Db

Move CPU TLB related methods to "exec/cputlb.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cputlb.h   | 7 +++++++
 include/exec/exec-all.h | 3 ---
 include/exec/ram_addr.h | 1 +
 system/physmem.c        | 1 +
 4 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/exec/cputlb.h b/include/exec/cputlb.h
index ef18642a32..6cac7d530f 100644
--- a/include/exec/cputlb.h
+++ b/include/exec/cputlb.h
@@ -32,4 +32,11 @@ void tlb_unprotect_code(ram_addr_t ram_addr);
 
 #endif /* CONFIG_TCG */
 
+#ifndef CONFIG_USER_ONLY
+
+void tlb_reset_dirty(CPUState *cpu, ram_addr_t start1, ram_addr_t length);
+void tlb_reset_dirty_range_all(ram_addr_t start, ram_addr_t length);
+
+#endif
+
 #endif
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 2e4c4cc4b4..2c06e54387 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -589,9 +589,6 @@ static inline void mmap_lock(void) {}
 static inline void mmap_unlock(void) {}
 #define WITH_MMAP_LOCK_GUARD()
 
-void tlb_reset_dirty(CPUState *cpu, ram_addr_t start1, ram_addr_t length);
-void tlb_reset_dirty_range_all(ram_addr_t start, ram_addr_t length);
-
 MemoryRegionSection *
 address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
                                   hwaddr *xlat, hwaddr *plen,
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 891c44cf2d..b6d5551549 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -23,6 +23,7 @@
 #include "cpu.h"
 #include "sysemu/xen.h"
 #include "sysemu/tcg.h"
+#include "exec/cputlb.h"
 #include "exec/ramlist.h"
 #include "exec/ramblock.h"
 #include "exec/exec-all.h"
diff --git a/system/physmem.c b/system/physmem.c
index dc1db3a384..3f937a5e58 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -32,6 +32,7 @@
 #endif /* CONFIG_TCG */
 
 #include "exec/exec-all.h"
+#include "exec/cputlb.h"
 #include "exec/page-protection.h"
 #include "exec/target_page.h"
 #include "hw/qdev-core.h"
-- 
2.45.2
