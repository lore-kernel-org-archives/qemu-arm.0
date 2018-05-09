Received: by 10.28.4.212 with SMTP id 203csp51175wme;
        Wed, 9 May 2018 10:58:20 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZo7jtk1PBnpyt6UCA7hRf2mO48ftThWjDRWQcmlD7Mv0f3+mJDag00BhRf/O0c9tLqqraLW
X-Received: by 2002:a0c:959d:: with SMTP id s29-v6mr26198485qvs.181.1525888700692;
        Wed, 09 May 2018 10:58:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525888700; cv=none;
        d=google.com; s=arc-20160816;
        b=MYRiPAb6d/vHwsNF93KwEewcmux+I/KRFbQoHnO3HUR8AWTInIt8dh4SHAORWv3beQ
         eHs8PNztzCHFF6Rs/pd25hC9QBOirqoPo+buIIplonYrNAvEOLUliSPpZLVlrRzjVhQW
         h9Se3LFeUgX5VayMFlBbMbwfufqq96whLIV88s/ivGyqZKurJM4IlGRu6P2sBvRz980l
         IcyCmMdVXdB/xew/ZHDgqXs7JBG5/7mDYxDXTatiNuoi2CB7UjkW9MaRE8GUP4lDROT3
         Se/Z2Mvx5LD0yesUvPvew0wYXFhR8MoMF6vuO37o70P+ZeGK0NI4SErvn21O0cl7vWuG
         2e2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=C6GLpnz32qLKJyll2w953Cqp2/0LFJEW5cEcvn8UW7A=;
        b=zKCc8MAsLff6Wrn5VucXHIPqz7d8SUVhpfuU3Y/VSAKw/vk8VkUYQQk1JTj3vE9zi9
         bDmFRiRVFRKJjgHlalgdRJGZiI+UO8QDXB1Tzfv1ZygUwP/gYm4XeFJQQdyOe7Lnglvk
         wTi7vuXY6knXXHFzA/f2m5oKXmIY9hUMWTDnc2Y3Ih6kYF+4WWGvrb0rQaBOnFGtFJoy
         uKUTRFJdtMTxActbEOslRwLXenh/p+/9gdMwzrJ/gClraglU9uSEIQglfPoGL1EHotGu
         xsDhKiFYPt9ZfncGs+QRgcs2s1Qdz8NWtRfUD3uuDp19Sn5DzgRJyQP55BR7CKWj8M5V
         zCcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QESz65bZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l44-v6si5367502qtf.162.2018.05.09.10.58.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 May 2018 10:58:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QESz65bZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58101 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fGTM4-0008LL-3b
	for alex.bennee@linaro.org; Wed, 09 May 2018 13:58:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47709)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTJ0-0004Po-LS
	for qemu-arm@nongnu.org; Wed, 09 May 2018 13:55:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTIy-0005BD-MQ
	for qemu-arm@nongnu.org; Wed, 09 May 2018 13:55:10 -0400
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:34616)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fGTIy-0005AB-CZ
	for qemu-arm@nongnu.org; Wed, 09 May 2018 13:55:08 -0400
Received: by mail-pf0-x243.google.com with SMTP id a14so26018693pfi.1
	for <qemu-arm@nongnu.org>; Wed, 09 May 2018 10:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=C6GLpnz32qLKJyll2w953Cqp2/0LFJEW5cEcvn8UW7A=;
	b=QESz65bZTPC7yPTPpY+STOhoiYBPCgU4/QiO0596gwYXvkTjQwHPC/WUBCYJbojhMo
	B583JA22vQLtngjBgjpcpnrS0OVXS6zdoQTKYAWIbbztYFhVIBiz6z6GWNs9hetmPhCl
	KWv2oL7M/mXghJxdeaAXDsoEuSp7nkXbA63wY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=C6GLpnz32qLKJyll2w953Cqp2/0LFJEW5cEcvn8UW7A=;
	b=nH65cPE552PbvYamGt6GEPpDNOrheDaUgP1kTi6c3uVE6GwpHVjKNDQfO27fhwe2Yk
	K7XCs2zBEldZobEdNDl6i806PFY7/S6pifYwxnZb4D3RS6WO8piq66blPbDZk8/i8jwX
	jBwRwojipEamJwNxpwP91SfJCTs9vE0grXlMR5sSlvrMtUQoclLZqa7wQ9Mp8KzpyyhE
	DY1uOTMKYCUP792tpgG2/gH4bEwk7fXXkMWdwpKcAhqg3w5m5w6mvqLzdtSv11+iRrcz
	APGKi+JzxwTMm4fwt4lkPdCn3B/ZtNmER1xO6ogBeuOlKHVT4HCjY+f0txk7I+X8N5mQ
	t+1w==
X-Gm-Message-State: ALQs6tBbU7ZbwIeeMsyMvCQtPiGnUFwYLpbE2pajpPGYGWL4ylRun4V9
	nbaZ2Pl+PuAVwxTTn0v0SwZyZw==
X-Received: by 2002:a63:a41a:: with SMTP id
	c26-v6mr15190057pgf.311.1525888507442; 
	Wed, 09 May 2018 10:55:07 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	l90sm60332813pfb.149.2018.05.09.10.55.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 09 May 2018 10:55:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  9 May 2018 10:54:34 -0700
Message-Id: <20180509175458.15642-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509175458.15642-1-richard.henderson@linaro.org>
References: <20180509175458.15642-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-arm] [PULL 04/28] target/xtensa: avoid integer overflow in
 next_page PC check
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>, Palmer Dabbelt <palmer@sifive.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>, Michael Clark <mjc@sifive.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Yongbok Kim <yongbok.kim@mips.com>,
	Alexander Graf <agraf@suse.de>, "Emilio G. Cota" <cota@braap.org>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Cornelia Huck <cohuck@redhat.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0rDb8HmXy+Zh

From: "Emilio G. Cota" <cota@braap.org>

If the PC is in the last page of the address space, next_page_start
overflows to 0. Fix it.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Max Filippov <jcmvbkbc@gmail.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 4f6d03059f..aad496347d 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1061,8 +1061,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
     int insn_count = 0;
     int max_insns = tb_cflags(tb) & CF_COUNT_MASK;
     uint32_t pc_start = tb->pc;
-    uint32_t next_page_start =
-        (pc_start & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
+    uint32_t page_start = pc_start & TARGET_PAGE_MASK;
 
     if (max_insns == 0) {
         max_insns = CF_COUNT_MASK;
@@ -1162,9 +1161,9 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
         }
     } while (dc.is_jmp == DISAS_NEXT &&
             insn_count < max_insns &&
-            dc.pc < next_page_start &&
-            dc.pc + xtensa_insn_len(env, &dc) <= next_page_start &&
-            !tcg_op_buf_full());
+            dc.pc - page_start < TARGET_PAGE_SIZE &&
+            dc.pc - page_start + xtensa_insn_len(env, &dc) <= TARGET_PAGE_SIZE
+            && !tcg_op_buf_full());
 done:
     reset_sar_tracker(&dc);
     if (dc.icount) {
-- 
2.17.0

