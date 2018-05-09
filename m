Received: by 10.28.4.212 with SMTP id 203csp49721wme;
        Wed, 9 May 2018 10:56:42 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpKV16swRN0/ty98B1FfMKiehkhVQ8JBfVsb07MvjNvjZjXs2wAP9FQ8c8Fk4pUTxRw5N01
X-Received: by 2002:ac8:1188:: with SMTP id d8-v6mr24646847qtj.352.1525888602285;
        Wed, 09 May 2018 10:56:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525888602; cv=none;
        d=google.com; s=arc-20160816;
        b=KGgnUMyP4bAnBKt/qXlQmh0y8N4lmdSgVcy5wCRN5T3cT1hfoVEVtUCNVfEQWgGVf9
         e2+xlwhsAhkR3LtSVZvKL6mKnHKbeMKQ/h003qqw+JP/CmGDWD2fnNod9xhOJCD6TU+A
         Rdq6nz/5AXHl3O+LauofXZUS7ZFmRC944yYJlTgTX+U4SB0H1CPB6XSxT/wySkzgu9MM
         vDWL76oi9Uo1Ac/SQyE0fkc4TZjKmSWxpMdZuuN5Am8zKGb4iOGhrAjEalMfdkkDz6ZW
         UqNADqGADTD0DHhLBoeS8xDXfyxWu+MqeEuhmx3wz0sYaguVBnDGvjWD3rwe/4ZnlFN3
         hC/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=WSZEg5EdAHc97+c/MhKzc898Jicxq2TErADybKOef6Q=;
        b=F3CiLYRDCmU8Q5ErKe556darxUpNJViE6utaXi7VaqStRO466RZs6OlZJqyXf4mY+n
         5F/0lr8lyH3OP8R1EmZ+JpookVtluXmUWTpTkfyd4pyjp3Zq6KW0Ikxq+bpbVY8TV6SR
         ZqtrTrsFAiJ6c40pisJDMf+WV1zRtcymF4fbdgWOGFhG0KIXYWlt951ZpZJfWEvIbutl
         BLDLcvkjuxnviMBIZkqlo6SnBnqbyd+y+0jNCNOYJG0JfzYF8EM/6aq+teJJc/9fZ7GZ
         /scLulaeVEtpGYU7BID54zSOkSy8zzKz+OqQrtyj4fVDlTqOHhYs11WknMzhjabPzpBD
         13Sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=D7lmuUiX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o33si304118qko.150.2018.05.09.10.56.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 May 2018 10:56:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=D7lmuUiX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58086 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fGTKT-0006PR-Ms
	for alex.bennee@linaro.org; Wed, 09 May 2018 13:56:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48009)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTJ8-0004fl-JV
	for qemu-arm@nongnu.org; Wed, 09 May 2018 13:55:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTJ5-0005O0-Dm
	for qemu-arm@nongnu.org; Wed, 09 May 2018 13:55:18 -0400
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:41947)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fGTJ5-0005MX-6t
	for qemu-arm@nongnu.org; Wed, 09 May 2018 13:55:15 -0400
Received: by mail-pg0-x243.google.com with SMTP id m21-v6so23010244pgv.8
	for <qemu-arm@nongnu.org>; Wed, 09 May 2018 10:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WSZEg5EdAHc97+c/MhKzc898Jicxq2TErADybKOef6Q=;
	b=D7lmuUiXY7yKhv+7NXcT3duBNOukyr1JVdT3wezh1l49iJzWwKIbFqEb8wg++7p1Sa
	a4GRdQyrSbw4ya/q8LiuqkUAXEF0QcNm+C2dSINuCp1/Cjd/j0UTu2zSps5VxIN9pS2C
	PiZZlp8xrDeqbOLIkHgw/mb+hUrPkWGHtibkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WSZEg5EdAHc97+c/MhKzc898Jicxq2TErADybKOef6Q=;
	b=J1t2XmFBSqYAfdD/iTvxDN29oUEHNgXrHM9oYq+AZLXzvqfeevn5ZBlaLEkNsCJ/XW
	jE5kkrvLqIzkUtQGpqQLGNMe8uqO5gFCftDvmyp1kcT9VF/5C9m56oHtikoEDeo26kcH
	Yne2ofM/QSfnEG5e71cw7LfDPq7r4fxyEh2F1csXJgwEftOMQa7WQuMTtVj1qCZDaFRm
	rovNeK6aesWPJGU1W3fide9Z35LCsz+M3oT2LKddNuKFCFivizVx+aQZzAPvnhPZYR13
	KauGEwkeY79FwD1Gj0y317v5PPVTjWW8T02P3MJN7F0z1zKVYZ2T7dabs5K/WuNZq4BU
	FlQg==
X-Gm-Message-State: ALQs6tC26zTYf6hLVj1Ls3g3f5P450rNgFLnmJLeblsnosl1sGgrxgCD
	F+tKbuvKddjvxU2XH3+oAWzEXw==
X-Received: by 2002:a63:751a:: with SMTP id
	q26-v6mr36146302pgc.338.1525888514127; 
	Wed, 09 May 2018 10:55:14 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	l90sm60332813pfb.149.2018.05.09.10.55.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 09 May 2018 10:55:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  9 May 2018 10:54:38 -0700
Message-Id: <20180509175458.15642-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509175458.15642-1-richard.henderson@linaro.org>
References: <20180509175458.15642-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-arm] [PULL 08/28] target/arm: avoid integer overflow in
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
X-TUID: RgmXcS6tz3+6

From: "Emilio G. Cota" <cota@braap.org>

If the PC is in the last page of the address space, next_page_start
overflows to 0. Fix it.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h |  2 +-
 target/arm/translate.c | 11 +++++------
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 4428c98e2e..37a1bba056 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -9,7 +9,7 @@ typedef struct DisasContext {
     DisasContextBase base;
 
     target_ulong pc;
-    target_ulong next_page_start;
+    target_ulong page_start;
     uint32_t insn;
     /* Nonzero if this instruction has been conditionally skipped.  */
     int condjmp;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index ad208867a7..0f6629f745 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9930,7 +9930,7 @@ static bool thumb_insn_is_16bit(DisasContext *s, uint32_t insn)
         return false;
     }
 
-    if ((insn >> 11) == 0x1e && (s->pc < s->next_page_start - 3)) {
+    if ((insn >> 11) == 0x1e && s->pc - s->page_start < TARGET_PAGE_SIZE - 3) {
         /* 0b1111_0xxx_xxxx_xxxx : BL/BLX prefix, and the suffix
          * is not on the next page; we merge this into a 32-bit
          * insn.
@@ -12301,8 +12301,7 @@ static int arm_tr_init_disas_context(DisasContextBase *dcbase,
     dc->is_ldex = false;
     dc->ss_same_el = false; /* Can't be true since EL_d must be AArch64 */
 
-    dc->next_page_start =
-        (dc->base.pc_first & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
+    dc->page_start = dc->base.pc_first & TARGET_PAGE_MASK;
 
     /* If architectural single step active, limit to 1.  */
     if (is_singlestepping(dc)) {
@@ -12312,7 +12311,7 @@ static int arm_tr_init_disas_context(DisasContextBase *dcbase,
     /* ARM is a fixed-length ISA.  Bound the number of insns to execute
        to those left on the page.  */
     if (!dc->thumb) {
-        int bound = (dc->next_page_start - dc->base.pc_first) / 4;
+        int bound = -(dc->base.pc_first | TARGET_PAGE_MASK) / 4;
         max_insns = MIN(max_insns, bound);
     }
 
@@ -12584,8 +12583,8 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
      * but isn't very efficient).
      */
     if (dc->base.is_jmp == DISAS_NEXT
-        && (dc->pc >= dc->next_page_start
-            || (dc->pc >= dc->next_page_start - 3
+        && (dc->pc - dc->page_start >= TARGET_PAGE_SIZE
+            || (dc->pc - dc->page_start >= TARGET_PAGE_SIZE - 3
                 && insn_crosses_page(env, dc)))) {
         dc->base.is_jmp = DISAS_TOO_MANY;
     }
-- 
2.17.0

