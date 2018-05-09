Received: by 10.28.4.212 with SMTP id 203csp48964wme;
        Wed, 9 May 2018 10:55:54 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZp7i7LKy7lv64IvXhscLbOyWWT87w+0q6+dm1S4p5HIlryWwNJb3NyTB83OOwEf4KxsfvZD
X-Received: by 2002:ac8:387d:: with SMTP id r58-v6mr42062164qtb.138.1525888554182;
        Wed, 09 May 2018 10:55:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525888554; cv=none;
        d=google.com; s=arc-20160816;
        b=b2cd8KTi2Vmu7437YzSd+BmgiqB/4J7VoYzGXp3cKYAIv7llhKyU5A31tbony3rMf/
         OE8Db7XJdcrxMmxiHvCZ/wm/ujM77M/zaLLiVpJxip8W1aLceyy2T8wKQwJggdxPSQ+I
         uSFprDKBsMByW5+02glWCfaaOn2qmMhYXsa4bZ8MXpCaF2Cgdoc/ZbLPjSPO4KqeYIEf
         p785Z5A2cWzEdkm+sz1k5Lkq8HppOzMJwfU1eg0dw3Od8JCxysz8PPbl/zhaNtIAl9Ts
         Ys2IiGv3BL5oBESy9ih0mPcPPQGtyYEscOw30hejTDfmjMgAIQ67JpCIQ/CoAal/20Tb
         cQZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Cz2RaWEKME9UX5uwabOkLGSwHGoSJuvxngLRai2i1EQ=;
        b=eZHCxs3Z4+DJzQd3y/eW0p7f82GEnEe6xA5swUC3qdoUo5RsThudUuEb4qZK8lnXSO
         YV9Tx1fawAqdvGK6va/6BQUjkMwICvuw2iBP6lC3BRE6in0NCWi6fRfANJuYDUrzr+ij
         tm/1PaUD23PkQUtZhIgEOokF3Awf/JXjgFtZxlhklJMtxhV5Pusic1ZQeLyaQ3mjVeH9
         tLqHR6GPt/GdmlYvv+Deo3E0sJqfBsUog2ZnimFkiQeYUu4/Jplk9YNQ4MyXezEH6KNC
         JL22lMT/GuGzxLPHQyVDGUT6USrAEySwbVmZXwm1dM+iE1IU/bvX1ntIKafVSN8uuwmN
         lhtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QjqzPWQs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 126si7168625qke.381.2018.05.09.10.55.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 May 2018 10:55:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QjqzPWQs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58078 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fGTJh-0004Xr-L7
	for alex.bennee@linaro.org; Wed, 09 May 2018 13:55:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47685)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTJ0-0004Pn-49
	for qemu-devel@nongnu.org; Wed, 09 May 2018 13:55:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTIx-00059F-Ab
	for qemu-devel@nongnu.org; Wed, 09 May 2018 13:55:10 -0400
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:38256)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fGTIx-00057P-2h
	for qemu-devel@nongnu.org; Wed, 09 May 2018 13:55:07 -0400
Received: by mail-pg0-x244.google.com with SMTP id n9-v6so23007485pgq.5
	for <qemu-devel@nongnu.org>; Wed, 09 May 2018 10:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Cz2RaWEKME9UX5uwabOkLGSwHGoSJuvxngLRai2i1EQ=;
	b=QjqzPWQs3TKsoxhezr4ziyC32p8TwnvNHlQ3GuLt1LNP/M9zuyyQar5KN41h4K8qal
	KkYIhQFl98Li5JsBkLjW+gdHisnCUjKkoG2xof6gnKKAYstHUQ55/Cda/8yuROycGaOt
	5Z/j+HxuX2dWD0zAhIq6RzDDENWgep9pEAw0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Cz2RaWEKME9UX5uwabOkLGSwHGoSJuvxngLRai2i1EQ=;
	b=bpJYFfPjlSx4uhJUDTuY1as/wn70WykUgRDEE7iDuu8wP02d6S4lNGlRB/nVFL8xb2
	hAKRIjbKGd384zJGNYF/EnLNBX26oE1Q7aZQaQYOlx7MWRrQqD/GULzxHOkpGncc0Zk3
	kuDw1DGDSFSKPyJMXyc20TofmNGG/Bbzrm6a8VLBkO6ijmjGDWVTSC5FBq1IEZSt5RAd
	ZdfHhzwYsc+grLzMaeDEcg9UO1MoEzbgfv8iw/p4VTHal/PqwEtlw4jN1Z7a3RyNB3k8
	BiMxtHyQvODY3jQaAVXFquL/UqZLPIyuExCuObc9gnCXqF1wDN9XODAGqJZsLhB4N33+
	A16A==
X-Gm-Message-State: ALQs6tAzgP6ZDgbRpQwPtyVyPmQAvd87Van7SDsxBwgtwyRsHaH4bkXA
	7UJ6rOabaEjmdGB78JO7SI5OoZh9LBM=
X-Received: by 2002:a65:55ca:: with SMTP id
	k10-v6mr37474252pgs.422.1525888505615; 
	Wed, 09 May 2018 10:55:05 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	l90sm60332813pfb.149.2018.05.09.10.55.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 09 May 2018 10:55:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  9 May 2018 10:54:33 -0700
Message-Id: <20180509175458.15642-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509175458.15642-1-richard.henderson@linaro.org>
References: <20180509175458.15642-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-devel] [PULL 03/28] target/lm32: avoid integer overflow in
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
X-TUID: Ce0nhT/waD0k

From: "Emilio G. Cota" <cota@braap.org>

If the PC is in the last page of the address space, next_page_start
overflows to 0. Fix it.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Michael Walle <michael@walle.cc>
Cc: Michael Walle <michael@walle.cc>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/lm32/translate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/lm32/translate.c b/target/lm32/translate.c
index 2e1c5e6d01..fdd206a860 100644
--- a/target/lm32/translate.c
+++ b/target/lm32/translate.c
@@ -1055,7 +1055,7 @@ void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
     LM32CPU *cpu = lm32_env_get_cpu(env);
     struct DisasContext ctx, *dc = &ctx;
     uint32_t pc_start;
-    uint32_t next_page_start;
+    uint32_t page_start;
     int num_insns;
     int max_insns;
 
@@ -1075,7 +1075,7 @@ void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
         pc_start &= ~3;
     }
 
-    next_page_start = (pc_start & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
+    page_start = pc_start & TARGET_PAGE_MASK;
     num_insns = 0;
     max_insns = tb_cflags(tb) & CF_COUNT_MASK;
     if (max_insns == 0) {
@@ -1115,7 +1115,7 @@ void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
          && !tcg_op_buf_full()
          && !cs->singlestep_enabled
          && !singlestep
-         && (dc->pc < next_page_start)
+         && (dc->pc - page_start < TARGET_PAGE_SIZE)
          && num_insns < max_insns);
 
     if (tb_cflags(tb) & CF_LAST_IO) {
-- 
2.17.0

