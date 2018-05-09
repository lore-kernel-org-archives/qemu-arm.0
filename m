Received: by 10.28.4.212 with SMTP id 203csp59587wme;
        Wed, 9 May 2018 11:05:59 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqRFbXcVzXfnTfV+TbaW1waqovx/Qu41OlnhfrZZJBr34ZWAnJmNLwBG9MLp3oOw2dO004y
X-Received: by 10.55.33.7 with SMTP id h7mr38621009qkh.438.1525889159658;
        Wed, 09 May 2018 11:05:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525889159; cv=none;
        d=google.com; s=arc-20160816;
        b=JK+tYnVYPw0UuGsuHfDM9nsVlUTr0cznsqj6FNbxHrA2vDCnnMxcq5XvWPMmnDTIeo
         f6iR5vt7x+pDI99F+Qp6Gjoj23k6LN23QXAaZgTbHSiI8JKEjf3Hn44ZOpf6vmZBTn2R
         URxNsatkCO7jd458jH5RVhqUQNw3UPraoW3NJr5fMkOniMV1phtCzsEd+wpbVyK+h6nr
         C26VCZBJpdxth0VHE7UAeAugCfR1avRZ/sGJe3uNmBHVWLp0j68p1mmAybmfrcuMG9ty
         R6LHX7tycrvse7txaqlQ7J9cavwPPwpsoJ1mwGXkZtM4F2ISz9m3CimIN65ao2iu8vV7
         X17g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=6LffsiiHs7lxOOvqYb43jpsKoKbfnr5G0u8u8SMXtOQ=;
        b=YoH87v2yY90hIvEbALmLCoD8ouCCTTZxtduXEPodtgesJaPySkRtzROGcRH7xt1E6E
         vAFcYO/68w7xu1bO1FCaB87T0DoA0bjZoI7VsYfglgHLMXL0mQLRNaE+VOucIYZ2d7KF
         Rl8oYaD2ghDboxzWOeTI6LFHeS2JxuLOv/IIvlRqdQ5hBPkQo6VBIL8owUJHJg9AY26J
         OaRJiXmhHoR7V8py7XRX3ZtY6x/1T8g9ex/ovakKnFUSoWQUUTjfvPfwG0Gx6NoBxuO4
         UWLSXQvnZUImiKZZnJOl29dWNOEyYRUAksQLx1rUUq1xP12XsTLhlMgpSu17wgCI/kVB
         vsIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MntaApi6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e64si1334102qkh.332.2018.05.09.11.05.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 May 2018 11:05:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MntaApi6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58168 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fGTTT-0007V7-4z
	for alex.bennee@linaro.org; Wed, 09 May 2018 14:05:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48018)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTJ8-0004g8-NA
	for qemu-devel@nongnu.org; Wed, 09 May 2018 13:55:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTJ7-0005Rv-Et
	for qemu-devel@nongnu.org; Wed, 09 May 2018 13:55:18 -0400
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:46105)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fGTJ7-0005Q7-9b
	for qemu-devel@nongnu.org; Wed, 09 May 2018 13:55:17 -0400
Received: by mail-pg0-x241.google.com with SMTP id z4-v6so22986552pgu.13
	for <qemu-devel@nongnu.org>; Wed, 09 May 2018 10:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6LffsiiHs7lxOOvqYb43jpsKoKbfnr5G0u8u8SMXtOQ=;
	b=MntaApi64e2bNVvjDc3rJx6Zc9OLgTK2OS+r2wOfN7QmCjKNRQV6JCQRm8mPGF7rly
	pWomKlJVi0UGqEClOFANFI/1ywJuJWB74uZiVGIvKvk57rFWuAPvBoWud7IQY9oWKQGO
	XxzNWz60hQpNJxi3/0xuwzS0jeQhV9srkGoWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6LffsiiHs7lxOOvqYb43jpsKoKbfnr5G0u8u8SMXtOQ=;
	b=hmjonv5sIqjwMyN/5ESYszx9phBMAW8p4GbHJ9+pPoQ8jTdWHc+bleZeot0M2pRqMk
	TwdtdN4Y3mXgz6B2LghT1yKYd0M0awRKHONM920aYgDZwnK9mldExFrkF1pzOgjQj3UL
	oPaol6WwPUM5A/6G70wfhNLMjt0o4NUm/IIr+kpWFfJ89wS3wALZjkzrEvcdzlzf+ipq
	DdcxqgdpisX9QFYMqXQUgACxKVpDFpQqdQnlp/sdz0FBRZGLNH8TNgCQuEoMuQvTi4zH
	qO48EQxHsgbw7ArqskMVYZPLdinmF4pSRLyXjUZ000Ctv99nVNaGNnaqp1PGRC+frJU3
	QgXw==
X-Gm-Message-State: ALQs6tD6ljd4FNMRyoAv8TdJG3rRqHEPVODpvFJP1Inm6zhr39relos7
	SraNq+7V8L+zLq5BucZmTXFr9ZdZ/6Q=
X-Received: by 10.98.202.74 with SMTP id n71mr44855410pfg.149.1525888515954;
	Wed, 09 May 2018 10:55:15 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	l90sm60332813pfb.149.2018.05.09.10.55.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 09 May 2018 10:55:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  9 May 2018 10:54:39 -0700
Message-Id: <20180509175458.15642-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509175458.15642-1-richard.henderson@linaro.org>
References: <20180509175458.15642-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-devel] [PULL 09/28] target/s390x: avoid integer overflow in
 next_page PC check
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>, Palmer Dabbelt <palmer@sifive.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>, Michael Clark <mjc@sifive.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Yongbok Kim <yongbok.kim@mips.com>,
	Alexander Graf <agraf@suse.de>, "Emilio G. Cota" <cota@braap.org>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Cornelia Huck <cohuck@redhat.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 018YJm94dJ5O

From: "Emilio G. Cota" <cota@braap.org>

If the PC is in the last page of the address space, next_page_start
overflows to 0. Fix it.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Acked-by: Cornelia Huck <cohuck@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Alexander Graf <agraf@suse.de>
Cc: David Hildenbrand <david@redhat.com>
Cc: qemu-s390x@nongnu.org
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/translate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index 7d39ab350d..44449f11ab 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
@@ -6163,7 +6163,7 @@ void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
     CPUS390XState *env = cs->env_ptr;
     DisasContext dc;
     target_ulong pc_start;
-    uint64_t next_page_start;
+    uint64_t page_start;
     int num_insns, max_insns;
     ExitStatus status;
     bool do_debug;
@@ -6181,7 +6181,7 @@ void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
     dc.ex_value = tb->cs_base;
     do_debug = dc.singlestep_enabled = cs->singlestep_enabled;
 
-    next_page_start = (pc_start & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
+    page_start = pc_start & TARGET_PAGE_MASK;
 
     num_insns = 0;
     max_insns = tb_cflags(tb) & CF_COUNT_MASK;
@@ -6218,7 +6218,7 @@ void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
         /* If we reach a page boundary, are single stepping,
            or exhaust instruction count, stop generation.  */
         if (status == NO_EXIT
-            && (dc.pc >= next_page_start
+            && (dc.pc - page_start >= TARGET_PAGE_SIZE
                 || tcg_op_buf_full()
                 || num_insns >= max_insns
                 || singlestep
-- 
2.17.0

