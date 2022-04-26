Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp362436lfu;
        Tue, 26 Apr 2022 09:41:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx190umjjbf+ReVmYsQzIYn9DXGyA3871YwOSVEL2ZVTAaEtkXB0D9h9Isn/cCKpznqwTX6
X-Received: by 2002:a05:6902:10c1:b0:63c:d3bf:59d2 with SMTP id w1-20020a05690210c100b0063cd3bf59d2mr21378535ybu.99.1650991270634;
        Tue, 26 Apr 2022 09:41:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650991270; cv=none;
        d=google.com; s=arc-20160816;
        b=w7vCEZ1/chWF5jZPyT/W4QdajGRKPsbbWfaPbo5OgePGLXKmNyx9GX77Zzq5MI5q0C
         8vkSjIRjrGFttNajXNY2fvngKn2weRiC24t6IpF3b8gRGfKxtMpIXd9iZowRYUg2P40k
         /Z7xflnpYITVBBL2CE0VUNy+2P+fjQd0uI8WEKV9XR/xBbIEvXGTN77Bi28Fvn0yxHwN
         smGJgZ+K3RLdfcKKR84hCcNpX+yO4AJOtZkvwyx3w++9mXEomgPvM723WXWaZg6dYr2w
         W9GvHaICnrb+hGuG4MaLA+nkZI8yV4q9lqTqBWt/rWipCTKkMH9mkp1eT1ukQo+4U5DP
         T/pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=k0IsIX7Ck4EtbQii90oZ9+BigHGoubRwN65gCKY+dLo=;
        b=AundSoztUpaHnoH/750kdbbDhbv0fqHAdBlCG4NfpBQR4aDuwhR2eq3nBTVtVNViDU
         1cn9FDThP3n0/kLjYFKxiExFiO1xaDYriNfkgq3/AYXc2uM2yDhQiu3LVNYjezQwZFGz
         dQ9YXDPE5G+NySoKFJhGR18PIuaTCt4E/pywXd7yieNK7P/W/v+CjhN5vYTmWbPn2xdw
         x712mW5opRb+GpetoAfTkkQ9tZwPuSeC5w2BAr2pN+K4CykRk1p0fNwviUVoAAVzUfj3
         vvwUp0ZZiYmIcapjIHMlNKA9ijYeCVGOe8pJ3/oVM7Cm73EITvHLTJmS39E6GgRr7yYU
         mmFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZZiB6oo4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t129-20020a818387000000b002f4dfb82b48si12103279ywf.116.2022.04.26.09.41.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Apr 2022 09:41:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZZiB6oo4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njOFS-0006xn-3B
	for alex.bennee@linaro.org; Tue, 26 Apr 2022 12:41:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5f-0002xV-AA
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:31:04 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:42587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5c-0003n2-AA
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:31:02 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 l11-20020a17090a49cb00b001d923a9ca99so3009286pjm.1
 for <qemu-arm@nongnu.org>; Tue, 26 Apr 2022 09:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k0IsIX7Ck4EtbQii90oZ9+BigHGoubRwN65gCKY+dLo=;
 b=ZZiB6oo4+2NcXVazBJOgVVGMb81SxD4+NUhfjzbn9cxWxR/PPmsPXbOy95TCjf4pUK
 R/FXAMdeVvvgob5sn3DUX6LqFQN5fmgniE0Pfv758Cw9Lmo8+qneFG202kqaQKOvSn4i
 PCu9SWtIk/cWjBN6OcFTe6g7tfJgCT7Xj6zxOTOt+IHUeJhMlZcINs/2kwFxECXpJAlZ
 GcdG9chSTd7PU0RUhUqp8i9dDIy91C07wqKM3b5X/IlV3cnrNhDk5G8gR6xmDWSxh7Hh
 wl2e9a+qE0nZMv6qRrxIIlz0uRHONFXawhmQ8h0i5G9xPGI6/r8BYeZ6st/NYia6/5/H
 Z4rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k0IsIX7Ck4EtbQii90oZ9+BigHGoubRwN65gCKY+dLo=;
 b=D0CYUZAJyJXTd6w7TpFUczqDKc8yfuazYPEXiJh6Y4bE6Zc3+XBsQKvQHloXzn+j7V
 052ADuT5KibqZTdmoHhtiKAss3XrMBTo9USBJ0CRK77G6jTnxZ3zn1EOpR3apLhx57z9
 4DG/JR9MocGqN2rGkcxml6e72574TQpwFcSJZAzHSepI4ifYJvFBq48mEZYUrK0AKNdq
 iQYctV76VjkgNXULDJFZ9N3vB9W8XNGmYw94vLkM8/cQH0NgjlrQdgjU37uYwfIWq6aN
 vv9KQ1Bh9KhKIih4kPGRBiQ1ybBd+tvEnUfwXQfnCsfqjF7RMZPw9x98N6G0u7Ib/+kA
 D7Cg==
X-Gm-Message-State: AOAM530QrKxgTwgUQRxTG/MBluNPz23+/ltaMKuy/Z/IkoXaOfD8IqGL
 RhPnJxvw7pBZjE6QhIOV76Tol8SKA1hMIQ==
X-Received: by 2002:a17:90b:1e45:b0:1d2:3ef6:18d9 with SMTP id
 pi5-20020a17090b1e4500b001d23ef618d9mr39041317pjb.221.1650990655788; 
 Tue, 26 Apr 2022 09:30:55 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:30:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/47] target/arm: Use tcg_constant in disas_ldst_*
Date: Tue, 26 Apr 2022 09:30:06 -0700
Message-Id: <20220426163043.100432-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PZOaHXoM50H9

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 1caca38a79..4cdc869d52 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3693,7 +3693,7 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
     mop = endian | size | align;
 
     elements = (is_q ? 16 : 8) >> size;
-    tcg_ebytes = tcg_const_i64(1 << size);
+    tcg_ebytes = tcg_constant_i64(1 << size);
     for (r = 0; r < rpt; r++) {
         int e;
         for (e = 0; e < elements; e++) {
@@ -3709,7 +3709,6 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
             }
         }
     }
-    tcg_temp_free_i64(tcg_ebytes);
 
     if (!is_store) {
         /* For non-quad operations, setting a slice of the low
@@ -3839,7 +3838,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
                                 total);
     mop = finalize_memop(s, scale);
 
-    tcg_ebytes = tcg_const_i64(1 << scale);
+    tcg_ebytes = tcg_constant_i64(1 << scale);
     for (xs = 0; xs < selem; xs++) {
         if (replicate) {
             /* Load and replicate to all elements */
@@ -3861,7 +3860,6 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
         tcg_gen_add_i64(clean_addr, clean_addr, tcg_ebytes);
         rt = (rt + 1) % 32;
     }
-    tcg_temp_free_i64(tcg_ebytes);
 
     if (is_postidx) {
         if (rm == 31) {
@@ -4052,7 +4050,7 @@ static void disas_ldst_tag(DisasContext *s, uint32_t insn)
 
     if (is_zero) {
         TCGv_i64 clean_addr = clean_data_tbi(s, addr);
-        TCGv_i64 tcg_zero = tcg_const_i64(0);
+        TCGv_i64 tcg_zero = tcg_constant_i64(0);
         int mem_index = get_mem_index(s);
         int i, n = (1 + is_pair) << LOG2_TAG_GRANULE;
 
@@ -4062,7 +4060,6 @@ static void disas_ldst_tag(DisasContext *s, uint32_t insn)
             tcg_gen_addi_i64(clean_addr, clean_addr, 8);
             tcg_gen_qemu_st_i64(tcg_zero, clean_addr, mem_index, MO_UQ);
         }
-        tcg_temp_free_i64(tcg_zero);
     }
 
     if (index != 0) {
-- 
2.34.1

