Received: by 10.28.4.212 with SMTP id 203csp50413wme;
        Wed, 9 May 2018 10:57:33 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqpu6xXIRCOJ9Jb4IOjkY5pDgena+TKCpke4LzLb99RtR+J2XzDwwwHSQnL94AA9LKgo7Z2
X-Received: by 2002:a0c:e609:: with SMTP id z9-v6mr42975328qvm.158.1525888652923;
        Wed, 09 May 2018 10:57:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525888652; cv=none;
        d=google.com; s=arc-20160816;
        b=wenB3uyA5oUt9i9I/78gGeTz5e6kMNkgl4Fhj+qZnb3aKWjhJrnEs0akEE4mOtLqOH
         ONcjBPjDpiI5/Cqfzckmwm6bUtJ8j5+C5aDFynzV31p9r7QRa/PYgCdl6PpNYxc2iZ4i
         ZjTGtKq50bvrUrBqvCVrpuitRCj6ReW3EB7tKfPIZdUUL/0iBJw2FLyOnJYBxho2JkjL
         eN/DyJlS6qfdNe09sjHIZ+j9V8H1JUqr6vYOeFoTzm5JYjM4umIHEZDtW8BCIz3D6OXY
         JSfmcVkosJDx7OF8aMufv5MErH0bnysMgIv1LD98bU0XW4drpIQtInCEVkX8iU4U5JkO
         Ro4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=S/2JGGydUpeF2M5E3pq1XD2DFxk3JsLAsIrsUVrcu1E=;
        b=aBu4MBecYRDqGCTOjXAp8SDKgXVQAtuw/pqHVOv2yjEBnpjGZlhWGYXp9oIn8cqBGK
         wgHMB0EKpr26tcWWnXSLpdzWjnV/fK+H6oUHvAQ0yWAq6rQ76aYHEksp/aTYa6PirkWo
         Rx+pjZroSc54+STTIcOvlgDSqm4Twe5t1qIAThjhhq9HpzPAGU5tociMA0pfY+Mmhyrs
         aw4YzSCvdThGJ4UNbwzLqDk/sO0R6Pc7ovCIvzFyToUgYQc2UbVBIIiaE9ohrZIh5uPM
         h9mo+omK/Syoue9FGqqQAZvFDFe/0azOrNGm2vH53Jjy/QrlBg57eZaxMOibgVQX0Opq
         KDfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DzwQoQdH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 8-v6si8815250qto.347.2018.05.09.10.57.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 May 2018 10:57:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DzwQoQdH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58092 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fGTLI-0007PP-Ah
	for alex.bennee@linaro.org; Wed, 09 May 2018 13:57:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48132)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTJC-0004sp-4k
	for qemu-arm@nongnu.org; Wed, 09 May 2018 13:55:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTJ9-0005Wf-5r
	for qemu-arm@nongnu.org; Wed, 09 May 2018 13:55:22 -0400
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:36131)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fGTJ8-0005U1-Hw
	for qemu-arm@nongnu.org; Wed, 09 May 2018 13:55:18 -0400
Received: by mail-pg0-x241.google.com with SMTP id z70-v6so2800118pgz.3
	for <qemu-arm@nongnu.org>; Wed, 09 May 2018 10:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=S/2JGGydUpeF2M5E3pq1XD2DFxk3JsLAsIrsUVrcu1E=;
	b=DzwQoQdHgXYDTu8EPEgY37Ii0/fGlmbiRVuHuH/kSt8KLyjZ080/YhQ8m/SzJ25Khy
	G0onN7A/Xp2wUcQV+p89pfQEkBUwuGxIwlcMgSmbt5YVBigIbQx88cTw2MqglJZ0YZTe
	RH3KET/yx4PpceB2F230ftNxCQ5WV46aPCbCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=S/2JGGydUpeF2M5E3pq1XD2DFxk3JsLAsIrsUVrcu1E=;
	b=qn7PFaIGXYC9Q3TeY7ryWWsjOu1bx23dtfa8gdadFTNoFKblxJ0uJZnRSpLgpHbTmi
	wbn0wFM1Dv7IyZcvLeEJZKefHaVj783k638QJB673iNHqpjQZNjxids6dXDAB1hb5+B7
	FppTQekPufG+lCsGx40ZJNdVqMM/N++V7i0Ld9zi1uKDQRvBh4cPeFUM7AsxyTMBb+qB
	zk/ILJmTjvNNXUN075W6R8G2YVRbCUI8C0xbVIsz2HmwF8gV8gdkXHXxcRo4L8hiuyFB
	UQIK+urnfK5uLxj7OK/M3tjaMGZjhIh/o2h/75IO1bnARvBVrEz+cl6e8FyHZ6Kyzg3o
	OhxQ==
X-Gm-Message-State: ALQs6tCSTHOx3Y4bS0/Pb7CUcWRZjo6BSNBzzD/n8iLUVST63i9JosaR
	me2HKsaJzPepu8n/u+kXGB91kQ==
X-Received: by 10.98.157.137 with SMTP id a9mr44574172pfk.206.1525888517560;
	Wed, 09 May 2018 10:55:17 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	l90sm60332813pfb.149.2018.05.09.10.55.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 09 May 2018 10:55:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  9 May 2018 10:54:40 -0700
Message-Id: <20180509175458.15642-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509175458.15642-1-richard.henderson@linaro.org>
References: <20180509175458.15642-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [PULL 10/28] target/mips: avoid integer overflow in
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
X-TUID: w9YCmCDwI0NK

From: "Emilio G. Cota" <cota@braap.org>

If the PC is in the last page of the address space, next_page_start
overflows to 0. Fix it.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Yongbok Kim <yongbok.kim@mips.com>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/translate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index d05ee67e63..d8e717dacf 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -20202,14 +20202,14 @@ void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
     CPUMIPSState *env = cs->env_ptr;
     DisasContext ctx;
     target_ulong pc_start;
-    target_ulong next_page_start;
+    target_ulong page_start;
     int num_insns;
     int max_insns;
     int insn_bytes;
     int is_slot;
 
     pc_start = tb->pc;
-    next_page_start = (pc_start & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
+    page_start = pc_start & TARGET_PAGE_MASK;
     ctx.pc = pc_start;
     ctx.saved_pc = -1;
     ctx.singlestep_enabled = cs->singlestep_enabled;
@@ -20320,7 +20320,7 @@ void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
             break;
         }
 
-        if (ctx.pc >= next_page_start) {
+        if (ctx.pc - page_start >= TARGET_PAGE_SIZE) {
             break;
         }
 
-- 
2.17.0

