Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2158C43458
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 21:02:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wiIKG-0003Dm-KR; Fri, 10 Jul 2026 17:00:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIIS-0000yb-98
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 16:58:15 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIIE-0001yt-JT
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 16:58:07 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-384c94c9414so1422241a91.3
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 13:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783717073; x=1784321873; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/dRLgHIpg9jU4QQ3fj8FRVxP7oOcs4Ea/cFITkJMzy0=;
 b=B0qj2qEo4JAtD+kE8gOMN8CsmaE97w5kIcqhutMXNvdupHEkQfOyv9ksqCv3vPXFLT
 My8XRSXB5yagF0ywJqp/6Ag3rS0bn8HbNQqjABeBw5lOmvsb7hiW6usMhaXiTxaaQBuu
 F5UuqBnsjbvk46ercB1pXUZ5SOFzgcFRb52mtm/S7s+JV4VZ1Iovqal31hBcdgMn2edY
 sOoV/8MY/Wx5CBVjXbCQdbM8aug1+4/APRrBnQX6mc6t5jHCJ6FNOwbDdMsPQ0DWYpnt
 8g4fKIV/cGSDedV11ZlRlXfoKwJLofMloAaCVF6HPbMETt3IJnB0BELBZ9bYrlTFnTZ1
 0QxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783717073; x=1784321873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=/dRLgHIpg9jU4QQ3fj8FRVxP7oOcs4Ea/cFITkJMzy0=;
 b=hgK/t1GoNTTpo9jaGvkPBvdcZgqLz5HzipSLXFOqBD54lOgsGaD4FWSEjCMEfgH/Jw
 Mf+KjHlpaAVcotluIRaaDLq+2rayxLtucofKrtcmxQUKOML5+yjgZyHc/fCCXZ2TGXbv
 Wkgb3roA0AaHpWgspT0LRWCIDlP2Wtv23drshS2XTq4Ta+U+BAg2hfwMQf71f9M6X3sI
 k4xIsFDiSPRqCa4g/+dc1ZdL+vJ9Be+9M9BlSrvfXBjWU5iWYIO1NQx5wz3swzxJWh6V
 tfW+cMS7weRmM4uki6UhHl5g8ltMoLI8N3I101mvomUhejmxKvC4v6kWmkMhsLDcZ4Zj
 WyOg==
X-Gm-Message-State: AOJu0YxjIDmSFkBVTXrx5UOsWjrhCzHFTLzwoCQOZSXnewSu1rp7gSja
 KZFXL5LE57b1N4aoIkx1H4PKwF6AUhRaWbolSIT9suiSbvk+uf6xXla7otS3mV+ROSk=
X-Gm-Gg: AfdE7cm3PbLJfOb1jZpHZI1YoGZj1JCp4X3m8QhFmjjuXt3esOFyICEwnqmRGTDz55S
 MQkBQx/SP/4/fdBYiZw/JwLIR8VgcxaVD3WB4chUE+51s6zXEtzqiGDAnE0mgmz2zemRMQWwmUd
 4gFISy2I9+kDsu6sH7UDzDnQaMKC3uik/dEBip3ih4wtBTFrBOIySHn2/I6GgDSkm481Yh+wOKL
 2wvd1C4uZPX6/V76hS3jbgPI6GwEKBTojbccoUtFnkqlQGMC7jyakCfVIh0H642Wliq362aNBfk
 oGzR6aW0+m/0LAw/GofvGJl1ecglmwmSjcqNqLpgpoCzCpiYhmt8iOM3rdFEp4cm0OP1Nmb/g4+
 FnElWlxKajqXhJmbqaKJ6rjZg00pooEiDfEekqA6FTDuiuxrNGRfkOUrnSp4MmJygvLzK2B8hWt
 v3xWpvvRmnIMDbCe6n/l9u0vh2xSRg
X-Received: by 2002:a17:90b:2f0d:b0:37f:9ce1:7360 with SMTP id
 98e67ed59e1d1-38dc77aba5cmr457732a91.33.1783717073029; 
 Fri, 10 Jul 2026 13:57:53 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38a58792cdasm3256221a91.16.2026.07.10.13.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:57:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
Subject: [PATCH v3 50/51] system: Use tlb_flush_range_by_mmuidx in
 cpu_watchpoint_insert
Date: Fri, 10 Jul 2026 13:54:00 -0700
Message-ID: <20260710205401.836304-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710205401.836304-1-richard.henderson@linaro.org>
References: <20260710205401.836304-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Update to newer tlb_flush api and flush exactly what is required,
not single-page vs everything.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 system/watchpoint.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/system/watchpoint.c b/system/watchpoint.c
index 35cb3bdaec..fe7e0ac59f 100644
--- a/system/watchpoint.c
+++ b/system/watchpoint.c
@@ -29,7 +29,6 @@ CPUBreakpoint *cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
 {
     CPUBreakpoint *wp;
     vaddr last = addr + len - 1;
-    vaddr in_page;
 
     assert(len != 0);
     assert(last >= addr);
@@ -45,12 +44,8 @@ CPUBreakpoint *cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
 
     interval_tree_insert(&wp->itree, &cpu->watchpoints);
 
-    in_page = -(addr | TARGET_PAGE_MASK);
-    if (len <= in_page) {
-        tlb_flush_page(cpu, addr);
-    } else {
-        tlb_flush(cpu);
-    }
+    tlb_flush_range_by_mmuidx(cpu, addr, last, ALL_MMUIDX_BITS,
+                              target_long_bits());
     return wp;
 }
 
-- 
2.43.0


