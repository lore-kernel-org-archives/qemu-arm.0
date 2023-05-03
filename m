Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2654302ejm;
        Wed, 3 May 2023 00:12:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ79EZc+JaPYeaGZOdU81qd+0oC0BsarzZRw6i2B0f45rVZvysKv8PCSYcKWzZ4OImekYv6w
X-Received: by 2002:a05:622a:302:b0:3ef:6393:4bcc with SMTP id q2-20020a05622a030200b003ef63934bccmr30097955qtw.15.1683097958416;
        Wed, 03 May 2023 00:12:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683097958; cv=none;
        d=google.com; s=arc-20160816;
        b=mSrlIAB9irSuVynkSGtW10wAXdOMZYHiFxCTp2Stfrv+Uj2AqDHqBpKTbX7uN7wcxu
         91lHtJF7IhTIJ0KABnDJzCzSAiYd0za73ufOp8++IM3CCfrRll28jyUagmmzRr+ngn2a
         /HfdiA/gOj2E7dPw62lGQocTrS4P8pQaOmhRpkuqjnHqhy8OoJqNirMzszkYxfWXSHUI
         v9mCKM3zc2R34hepMR9AYaRs/LqeKy19BjJ6FZyENLvSb6YUuFApUzhZxK+2NUPCVwF6
         ejpfCk8L5kJPu5HxH6a69Esof2vwyE+Y8Gt43jju6PFwjpS+JfswjyaCbbnWBVA1s3Sl
         KMIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Ie4qD4RsOKAembPT/VL7Wty2S+rmvIpYPQ8gnkDX74w=;
        b=bh4xn2aUHe8eBhz7HlwXBQuW+Pgq547RXMZkXGmRIOxUMXdsiDVm6VS/bpFHzZO3SM
         Ljy9iW9xh8TMETkHKh1O7hxvoVsZh+t7UhLgsRsIRV3ZQv8PXKem4pKXQNMItaNFTZ2v
         S+9U+sfAviECJWnQN/SXdgzc/66yEvBIN/ECgi2pZBlucLCKYpo4M5mbLmSe90C8kd9M
         yLuFjeNoyDx2eq1R3ZgdV/8eGSYmDOQSioz/IePHGmUfgYKk1RJwRlpHHdFLaKVY5Imo
         eSuwZOCZm2YcrDVUgVpj5sD+BqPzbCMttuvUacQShitGBnIMo0QiHBGxCG74+Ym+uKSd
         AW3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ivJXbfqO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a16-20020a05622a065000b003bfb4ddc5c7si13728716qtb.601.2023.05.03.00.12.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 May 2023 00:12:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ivJXbfqO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pu6dz-0005Ku-Ey; Wed, 03 May 2023 03:11:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dX-000339-58
 for qemu-arm@nongnu.org; Wed, 03 May 2023 03:10:53 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dL-00072R-HZ
 for qemu-arm@nongnu.org; Wed, 03 May 2023 03:10:50 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f192c23fffso29518835e9.3
 for <qemu-arm@nongnu.org>; Wed, 03 May 2023 00:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097830; x=1685689830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ie4qD4RsOKAembPT/VL7Wty2S+rmvIpYPQ8gnkDX74w=;
 b=ivJXbfqOVAy4sCeV//Ge6LVUFpdTvj1BhbXCSm5CJyRqssQFp64eDlkhxnars94GTj
 phlLEQarljBSjQSZkEA4UHsBdoCxELuW3DbI1EJFHDizk1Vk5461uIRRuVOvKJ1OPbd4
 UJnaI8vTv0b1Mz9mAxEnMPPTBvmVBwq9IDGLSlhL19jKEOhoSYXcRsfMp3AxdqrCjgTN
 cG0DDKfHQj8SKOPt02OMg7rLm65NV1diYL7Cut0VhjskovLP/lfpMQ8o9WsQjGHVqFqV
 BP1lp3HDe1hz4QiA+0jiEbMDusR/jHjqbcZhxRSbA8YtJPUA2NCI9TMQwNwf3NA1dNwO
 opHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097830; x=1685689830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ie4qD4RsOKAembPT/VL7Wty2S+rmvIpYPQ8gnkDX74w=;
 b=GW3FPVgVTAVwqf1va+jUrpZLBk3o0rDen43WxUSa/7cmyrXecEBee2roBJ7LsMlgAw
 nbNRibHYem/L2d2JDVw0gLykTilujr3HHZ2nIFv8+MOWVF0Q++dXptIxboqO2AZ/svj+
 JIm9kifiDK6ZicmheVwwYpa/ZoSEsakmWQDSzdbDGxndiWTvE+1fzBd6ON8w32fo4vKN
 g/xztW9M/PTjA32yQV/rbBTFAUTdsUAo7Dd6ORTkse3PUFNDZyMIKXD1Fq9QLhVLcezQ
 elxRXxbf2gO9+2NVHqhv0w64IF0GkPddF16UKOZGtpddPgl83uXshi6OwS9NhLo2vmqr
 3o5g==
X-Gm-Message-State: AC+VfDzycdH4wfXPdOhP9UUoOibI8Ed8qlq4v9oHVeM5bPkT7+Td4qnU
 FQHDDgGMVRiLL56ZTzz7SeviqA==
X-Received: by 2002:a7b:c446:0:b0:3ee:6d55:8b73 with SMTP id
 l6-20020a7bc446000000b003ee6d558b73mr13330105wmi.29.1683097830591; 
 Wed, 03 May 2023 00:10:30 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003f173be2ccfsm54223673wmn.2.2023.05.03.00.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:10:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 43/57] tcg/i386: Use atom_and_align_for_opc
Date: Wed,  3 May 2023 08:06:42 +0100
Message-Id: <20230503070656.1746170-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qjifzDq6+wC+

No change to the ultimate load/store routines yet, so some atomicity
conditions not yet honored, but plumbs the change to alignment through
the relevant functions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 7c72bf6684..3e21f067d6 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1774,6 +1774,8 @@ typedef struct {
     int index;
     int ofs;
     int seg;
+    MemOp align;
+    MemOp atom;
 } HostAddress;
 
 bool tcg_target_has_memory_bswap(MemOp memop)
@@ -1895,8 +1897,12 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
-    unsigned a_mask = (1 << a_bits) - 1;
+    MemOp atom_u;
+    unsigned a_mask;
+
+    h->align = atom_and_align_for_opc(s, &h->atom, &atom_u, opc,
+                                      MO_ATOM_IFALIGN, false);
+    a_mask = (1 << h->align) - 1;
 
 #ifdef CONFIG_SOFTMMU
     int cmp_ofs = is_ld ? offsetof(CPUTLBEntry, addr_read)
@@ -1941,10 +1947,12 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
                          TLB_MASK_TABLE_OFS(mem_index) +
                          offsetof(CPUTLBDescFast, table));
 
-    /* If the required alignment is at least as large as the access, simply
-       copy the address and mask.  For lesser alignments, check that we don't
-       cross pages for the complete access.  */
-    if (a_bits >= s_bits) {
+    /*
+     * If the required alignment is at least as large as the access, simply
+     * copy the address and mask.  For lesser alignments, check that we don't
+     * cross pages for the complete access.
+     */
+    if (a_mask >= s_mask) {
         tcg_out_mov(s, ttype, TCG_REG_L1, addrlo);
     } else {
         tcg_out_modrm_offset(s, OPC_LEA + trexw, TCG_REG_L1,
@@ -1976,12 +1984,12 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_L0, TCG_REG_L0,
                offsetof(CPUTLBEntry, addend));
 
-    *h = (HostAddress) {
-        .base = addrlo,
-        .index = TCG_REG_L0,
-    };
+    h->base = addrlo;
+    h->index = TCG_REG_L0;
+    h->ofs = 0;
+    h->seg = 0;
 #else
-    if (a_bits) {
+    if (a_mask) {
         ldst = new_ldst_label(s);
 
         ldst->is_ld = is_ld;
@@ -1996,8 +2004,10 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
         s->code_ptr += 4;
     }
 
-    *h = x86_guest_base;
     h->base = addrlo;
+    h->index = x86_guest_base.index;
+    h->ofs = x86_guest_base.ofs;
+    h->seg = x86_guest_base.seg;
 #endif
 
     return ldst;
-- 
2.34.1

