Received: by 10.28.4.212 with SMTP id 203csp48573wme;
        Wed, 9 May 2018 10:55:29 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqZxpgu/Y/UXBMkyFwWu98fIQyqsKc0W4vUHiw3owBkJQ8KeRD1iys2U/VvV/by+JiyMmnP
X-Received: by 2002:ac8:6612:: with SMTP id c18-v6mr43070134qtp.343.1525888528917;
        Wed, 09 May 2018 10:55:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525888528; cv=none;
        d=google.com; s=arc-20160816;
        b=zeR2YQ8fmjg6pvv6VYAevV6yEGhVBnKq7OGT79/hYFl4zP8d03GQ/W5kJtddsSuBRb
         cXFhstHcUD+KLQmBeZt+dHUPy0dwpTbcFZevlgtSJbm3Y6Q+jRvezD4IDkcFZHMxlK6c
         PUSxQpPa238+Tu6PLrH8eXTJ9sXy2JHyLLIV6k8Q8cHzKQ5R7GP/ZCSKUdsLuoqHzTvL
         3314PyXP3CvC1oLVvIBj3Gl7064mZq/Clvg8TD/M6lkVGmiLXtTR+HU6MumZpAy3h3te
         a7dAV3sJbL/NojnxXe3+3N39O8CdDodYWTxX7v7q2//A5gGCe4H1RtesHF4uxnT++A3X
         0HEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=TiojlQ7+bOmRyh2JassU7YgApdfRFoNSCnyqvh/LGfo=;
        b=JCrDaR1N7vzoqXOr/c2WY3XMwDIksKMvUarTMj/EaRLa/gIyddeTAocZFi9Rg+t70x
         MhzJBF8mZ/BB2OA74LUuemr4N5L2pDzRqlx1nNJKO/kQwJpII3WSHvQg9TS7SYNxM19x
         4606KURrzKdX9GBCpbAKbo/1U4fwq713H/qwEFiilFIqRKrOVMBoIRYtU6rDwHi6wCVA
         SQkiMsJVb94jm2CahxY3LcFMAUmni2HyVlOHqr56XDjDS8+EgwvPCuejNPSe5abEOLp0
         sqeYlIVHE2M9hBDB+4GfnGcDBciPIcb99hQsNZ6P6LlnMBEBN3cSe4dBkJtKJNA/z/tV
         GB5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cKYJL1vg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f16-v6si2642662qvm.80.2018.05.09.10.55.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 May 2018 10:55:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cKYJL1vg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58072 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fGTJI-0004Rk-Aq
	for alex.bennee@linaro.org; Wed, 09 May 2018 13:55:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47574)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTIx-0004M4-93
	for qemu-arm@nongnu.org; Wed, 09 May 2018 13:55:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTIu-00054z-VI
	for qemu-arm@nongnu.org; Wed, 09 May 2018 13:55:07 -0400
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:42290)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fGTIu-000540-PU
	for qemu-arm@nongnu.org; Wed, 09 May 2018 13:55:04 -0400
Received: by mail-pg0-x241.google.com with SMTP id p9-v6so20096512pgc.9
	for <qemu-arm@nongnu.org>; Wed, 09 May 2018 10:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TiojlQ7+bOmRyh2JassU7YgApdfRFoNSCnyqvh/LGfo=;
	b=cKYJL1vgxm9vAGftvezFo45pepZN8Xw+F2LZ4IwOFiLEgyt6v+hToPWm+J5SGlWNHb
	Mh7JNlzfi+a1t29CRHBvCxjJA3puZ/6egjARQI/31qlDGouPzh9jWNkhi3+C2aWVjcb7
	KA1Lb3fCkmSYLU19g0SkS808/d6eE7P9ExdQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TiojlQ7+bOmRyh2JassU7YgApdfRFoNSCnyqvh/LGfo=;
	b=DEh5le0NxmL9dSuZDIf8P4Nfv23AiHyS5IE9i2/MWipq+sccfnMLx+h5nWXNoRv/nR
	9e6hW01i2sfkBqdX57gAaBob6SmypxUJQNnHdpqpqFc2Vvi5/SkUBUGfjHbTGxIzGD4C
	RmYaQNIB6IjzvAwDupIM43Ie+OPcS2rC0P8w8jZDHq8blwr3MBK4cfklA5Rk6ndlPLXp
	72N7GtuZQjrurLz8g2dNJTBvm9f+Dtd7wKraO0vmOa/Yv3bh5mEOJ3UV/Aj7dKPQvVL+
	uFU4TYWeSRVz/xJ3ztc5fXEtJgJXODTz1CjSfVjg9g+9drZaqBgIrwltbN+612MhWsaq
	se2w==
X-Gm-Message-State: ALQs6tCZjbwAYhPm+8TT2aim87rUZuLxdo7neSj+FfAeG2Vo3hQrP0ET
	GhS7R4hMf9EyTem0gWhvC9sQxA==
X-Received: by 2002:a65:5a81:: with SMTP id
	c1-v6mr36858067pgt.20.1525888503802; 
	Wed, 09 May 2018 10:55:03 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	l90sm60332813pfb.149.2018.05.09.10.55.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 09 May 2018 10:55:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  9 May 2018 10:54:32 -0700
Message-Id: <20180509175458.15642-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509175458.15642-1-richard.henderson@linaro.org>
References: <20180509175458.15642-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [PULL 02/28] target/cris: avoid integer overflow in
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
X-TUID: vITyZivw/xl9

From: "Emilio G. Cota" <cota@braap.org>

If the PC is in the last page of the address space, next_page_start
overflows to 0. Fix it.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index f51a731db9..64b9ec6649 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -3091,7 +3091,7 @@ void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
     unsigned int insn_len;
     struct DisasContext ctx;
     struct DisasContext *dc = &ctx;
-    uint32_t next_page_start;
+    uint32_t page_start;
     target_ulong npc;
     int num_insns;
     int max_insns;
@@ -3138,7 +3138,7 @@ void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
 
     dc->cpustate_changed = 0;
 
-    next_page_start = (pc_start & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
+    page_start = pc_start & TARGET_PAGE_MASK;
     num_insns = 0;
     max_insns = tb_cflags(tb) & CF_COUNT_MASK;
     if (max_insns == 0) {
@@ -3234,7 +3234,7 @@ void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
     } while (!dc->is_jmp && !dc->cpustate_changed
             && !tcg_op_buf_full()
             && !singlestep
-            && (dc->pc < next_page_start)
+            && (dc->pc - page_start < TARGET_PAGE_SIZE)
             && num_insns < max_insns);
 
     if (dc->clear_locked_irq) {
-- 
2.17.0

