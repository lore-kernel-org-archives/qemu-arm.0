Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6573747ejq;
        Mon, 15 May 2023 08:02:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6xQ3YBfAuqjmsyoIrbwIwiO+xhlLc5epNlbbdGNLPZVZrAo1LvZ/1pFkoVca8S20cZGVKK
X-Received: by 2002:aca:1014:0:b0:394:25fd:1723 with SMTP id 20-20020aca1014000000b0039425fd1723mr8771126oiq.13.1684162960002;
        Mon, 15 May 2023 08:02:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684162959; cv=none;
        d=google.com; s=arc-20160816;
        b=R6pB6Vd/861Do4+JR01bRtAjtNea01Y3CX4fqxFr7N2i6mrpIzNTUZ6OY4hXccb2YG
         aPKp8BOjhWg1D52H+Putww/2iSEY982o3WpZE1t7I6txPVW+jjFnkuYiEFryD9jJdiNp
         whOl/09ozNgUIOStKv9WtE8Alq8iM/LgBltdHE5EpPDKTITWk/p27utcJET+XbgLP5dG
         PO2Y1wAiQwh8g8MqNn/p/jgyKq0sOnwD3+S3pDaiNqJt8Ux2urZDd61K3vrRmJoF7M/Y
         zywgYvmNHaV+8cc0IcnuUK27ZHjJPSySMyPn5YzCjU0yq8wWmzN3FsM39uIPUq6Bc7PR
         TBQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=udci6EEhxJsFM3OJ4RCi5N8U0RcK0CcyHoB02ejCoyw=;
        b=puUsinExy262SBWuvQ8EMVSRGB0HUjTVxYSDAKiah17hDdvcZ4tIL8XXbraQC3id7V
         xtc0tzWy8NOxjIb7QsUZdNoI/nyqLq6lNlNCQtX9kE1ufuVIl8rXhC8uTmuNEC8HfSbh
         9V1ab0qKWtbTHKOMM7rv/HfhdSIY77Q8unMrG+hSDStURU+nd0gOjLyZZqD/09mtmU6u
         fB9gotwEdVYZJkQJ2nAO+8dsPvt+1NRvPQTBHAJWQ4qwJ0R5KulTmY6y1Vz1zlYxRq3M
         PAxO4n/3gMugSetvJ2nVjNjQqR7mMigjvGwk/es24jMqz8XYNtchCU24VZDStoSmH0qz
         DBcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GUtI0Ick;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id op51-20020a05620a537300b0074576196164si13062493qkn.549.2023.05.15.08.02.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 08:02:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GUtI0Ick;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyZL9-0007dJ-O4; Mon, 15 May 2023 10:38:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZJo-0004ps-Pn
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:36:57 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZJi-0005wr-Gk
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:36:56 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1adc913094aso45841425ad.0
 for <qemu-arm@nongnu.org>; Mon, 15 May 2023 07:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161409; x=1686753409;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=udci6EEhxJsFM3OJ4RCi5N8U0RcK0CcyHoB02ejCoyw=;
 b=GUtI0IckYyMCaETSFMXz9jpRAioavRDtkAzg8O9UEOOfc9DCWCt38FQ1Wqhf+6uE/z
 2NMv3/GtZxP24jmmmiScPagnNf9fReO7LLnhfUs7CaYvQC+XWZxiy7enU9TzM457gCxe
 5zqN07howVaXg4nAwcvBDSTRWiw+ov5fqBcvIMWf3wM28HjOvKUYs81IndTHgCtbmRCH
 OvVJqQUOQmlDxZVnzlUahLohKJlZ6P0l33g8gbmDfhJprVSLTEHbziMSEBuNdYc6volQ
 W/UOcnukelK7NCU4QeYZiZaHxoAkHD/dzZuNu9Kmsh6bgYeokc7R6rNbuD4f3d/tz+j7
 ga+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161409; x=1686753409;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=udci6EEhxJsFM3OJ4RCi5N8U0RcK0CcyHoB02ejCoyw=;
 b=Z7oBCFwmTan5x2WsXZaCO6vF01UlPqPIjlKy97UuAnqIMF5r5jqQTrwHuQoceGmfLo
 LT1rAaE1Ydziivq8SPyWAwF/zL22MX0KOuF1cPXx+HqlrOoTDqmRu801UtTyqcLezun6
 YAguA2SG0g9PDMdqByLPIwc108k5WdzOzJHmORPJ6SmV7TQ4tBlINUSUiPo0aXFlCMgL
 ljOIYYL5KTnFlI1Uef6ij7Y6pCr1d/OMUzDB4rp9ZAlEgwAGJ+9CdvTirz26tobDO669
 KP7gY7AAB5W8IRuoidaFdxI5noDhf1I/5L9kAIlnEbwnjPQU4TSc0V/PaOx4vNHexhNM
 81SA==
X-Gm-Message-State: AC+VfDxNi9ok1vPoAa8W4c+oARSHsN0SK6QYvhZS0XFG3NvJJSpMjuQJ
 XayDNMJqwlgbjprHuHKiX//vvg==
X-Received: by 2002:a17:902:7b81:b0:1ae:89a:92 with SMTP id
 w1-20020a1709027b8100b001ae089a0092mr5437652pll.59.1684161409297; 
 Mon, 15 May 2023 07:36:49 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a1709026ac600b001aadfdfcd06sm8942735plt.299.2023.05.15.07.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:36:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v5 40/54] tcg/i386: Use atom_and_align_for_opc
Date: Mon, 15 May 2023 07:32:59 -0700
Message-Id: <20230515143313.734053-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: YoX8rEwsXIcx

No change to the ultimate load/store routines yet, so some atomicity
conditions not yet honored, but plumbs the change to alignment through
the relevant functions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v5: Removed r-b for changes to HostAddress.
---
 tcg/i386/tcg-target.c.inc | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 6d55ba5a1c..3b8528e332 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1774,6 +1774,7 @@ typedef struct {
     int index;
     int ofs;
     int seg;
+    TCGAtomAlign aa;
 } HostAddress;
 
 bool tcg_target_has_memory_bswap(MemOp memop)
@@ -1895,8 +1896,18 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
-    unsigned a_mask = (1 << a_bits) - 1;
+    unsigned a_mask;
+
+#ifdef CONFIG_SOFTMMU
+    h->index = TCG_REG_L0;
+    h->ofs = 0;
+    h->seg = 0;
+#else
+    *h = x86_guest_base;
+#endif
+    h->base = addrlo;
+    h->aa = atom_and_align_for_opc(s, opc, MO_ATOM_IFALIGN, false);
+    a_mask = (1 << h->aa.align) - 1;
 
 #ifdef CONFIG_SOFTMMU
     int cmp_ofs = is_ld ? offsetof(CPUTLBEntry, addr_read)
@@ -1946,7 +1957,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
      * copy the address and mask.  For lesser alignments, check that we don't
      * cross pages for the complete access.
      */
-    if (a_bits >= s_bits) {
+    if (a_mask >= s_mask) {
         tcg_out_mov(s, ttype, TCG_REG_L1, addrlo);
     } else {
         tcg_out_modrm_offset(s, OPC_LEA + trexw, TCG_REG_L1,
@@ -1977,13 +1988,8 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     /* TLB Hit.  */
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_L0, TCG_REG_L0,
                offsetof(CPUTLBEntry, addend));
-
-    *h = (HostAddress) {
-        .base = addrlo,
-        .index = TCG_REG_L0,
-    };
 #else
-    if (a_bits) {
+    if (a_mask) {
         ldst = new_ldst_label(s);
 
         ldst->is_ld = is_ld;
@@ -1997,9 +2003,6 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
         ldst->label_ptr[0] = s->code_ptr;
         s->code_ptr += 4;
     }
-
-    *h = x86_guest_base;
-    h->base = addrlo;
 #endif
 
     return ldst;
-- 
2.34.1

