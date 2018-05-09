Received: by 10.28.4.212 with SMTP id 203csp55718wme;
        Wed, 9 May 2018 11:02:22 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqPB5KlWZbvQFT97kEQHhfwO9Q11pvBA2tfVOeTv09lnoSP2zGbVdLMLYGdbXjmZb2wHBGX
X-Received: by 2002:a0c:bd97:: with SMTP id n23-v6mr42915538qvg.146.1525888942030;
        Wed, 09 May 2018 11:02:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525888942; cv=none;
        d=google.com; s=arc-20160816;
        b=LNgitLiYcKEgzLZFT74GBre3yFU7mg9qczvDof1RDICJvfm/P7tHWLibwy2zB6uBcf
         8RuZdVgUlq2ELP4rOxSacAa5oW9j/79OXus+iN6AwofpvT7QUSCOAvsuTm5vUa+9qKwa
         +xNpB+QSC1PH5iEezRyvpG/oZTgFMIfzdOMuOqW7TeeV4yMdVnk5zFQwdd1jVwoPj/U5
         3S90EIa5AfuSTUKeV8wG8SEmyF2zlkI+3Nstbbww9dmT/bxpKrCh9WqF80H/gRe8+mS+
         cRBT49gVHvtTCd2nLd7PiUhcQcV2DoAASKgC3hh+GKqE9cUVxEWphLUJ4IBpGE4OzNz4
         qn/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=MkVuuWcFJCGMt7LHPmcNqXMoE3YSRnpJbNj4Ej/eAOc=;
        b=EAjBC/oyZBkYNI0UvOoMax353QJUlYwcl/GL24na8s/tIUTPhH5S39r/lgtT14MgKJ
         x4MXYgKfp/L5R1NGaouV5rWgzfBx4j8ctfa3jwEMuBCl5RPaL1ec7c0qYdyLHBog9iWy
         jaay/7SY1goN6FoOtErOa+VOGVWPFFX/V7WdIcyUvUF6ekmk5gVjELylf4OD/sRfKwBy
         /nVASWm1flwGFRBA5i6gOfeE6h0r3AT3ePlyUDgupefEqOY+3CeedUlpIVRSd9n7jQfz
         O+xLOE/KHyS3Z36INCmXADc43GV4rNZakbqDZaBfl3Qcl72Ipu3rx1h6fgEaY+1JXLBr
         O9Wg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kgsys3DT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s54-v6si10376387qte.151.2018.05.09.11.02.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 May 2018 11:02:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kgsys3DT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58142 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fGTPx-0004Wj-Ek
	for alex.bennee@linaro.org; Wed, 09 May 2018 14:02:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47998)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTJ8-0004eJ-9w
	for qemu-arm@nongnu.org; Wed, 09 May 2018 13:55:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTJ3-0005Km-RM
	for qemu-arm@nongnu.org; Wed, 09 May 2018 13:55:18 -0400
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:42292)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fGTJ3-0005JL-Gl
	for qemu-arm@nongnu.org; Wed, 09 May 2018 13:55:13 -0400
Received: by mail-pg0-x242.google.com with SMTP id p9-v6so20096711pgc.9
	for <qemu-arm@nongnu.org>; Wed, 09 May 2018 10:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MkVuuWcFJCGMt7LHPmcNqXMoE3YSRnpJbNj4Ej/eAOc=;
	b=kgsys3DTJpgoHRbxVjeCM0550i/Kr5g2tq1LiA8i2wHSWeJTFPOu40swcD3rf7cEL5
	rnCp4RX9idfVBXZ4JQxg/utADnvg8MMKCm6l3IJ/rz5Cud5qq8A6w5DHpLK7pgIGkDMD
	qPDsgsWzZQ7/9hbTFnbAW4A814Hlqd2Z27ho0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MkVuuWcFJCGMt7LHPmcNqXMoE3YSRnpJbNj4Ej/eAOc=;
	b=FPRn10pec1dkElnSNN1P98lxwJuNCptRgMjHb+T+MhEBGY4GUYDNCPB09y6uhrERZR
	rZyhDRzRC31VqGz0zw+1nCTeu3fJheVg7F/dMUbTdkWWEL55zU8ZfzXrclCfq/4/Cimi
	ZRhPoCg/BPrlSa8iOCKd1aGKE7t34ck2pPCAK6+d/OjkjPHiEdwvzWCUrySUxa0AbI9B
	kjPj0Bh6iIATLkIKKYDAufgbybhc24QVx6K/9bkr+Z1VsP1L80AtRY+5DxlYLihNb4x7
	/Tw4irQvZD1KiWvY0YDUU74YCSECa/ubhAVGTqO91zjhpaRZ39KKYYltcIr6zGBcy4sB
	N5wg==
X-Gm-Message-State: ALQs6tAIdgWAtwL0xMEOdEczcy9E+rVcz/KblT0HQ3eX2NXO47hmCtqR
	atDbSQynRqehXiBuDM99ctaiPA==
X-Received: by 2002:a65:635a:: with SMTP id
	p26-v6mr36473512pgv.163.1525888512457; 
	Wed, 09 May 2018 10:55:12 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	l90sm60332813pfb.149.2018.05.09.10.55.10
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 09 May 2018 10:55:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  9 May 2018 10:54:37 -0700
Message-Id: <20180509175458.15642-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509175458.15642-1-richard.henderson@linaro.org>
References: <20180509175458.15642-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-arm] [PULL 07/28] target/microblaze: avoid integer overflow
 in next_page PC check
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
X-TUID: z3VsFzU8uujZ

From: "Emilio G. Cota" <cota@braap.org>

If the PC is in the last page of the address space, next_page_start
overflows to 0. Fix it.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/translate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 100883e2cc..0872dc9ded 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -1635,7 +1635,7 @@ void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
     uint32_t pc_start;
     struct DisasContext ctx;
     struct DisasContext *dc = &ctx;
-    uint32_t next_page_start, org_flags;
+    uint32_t page_start, org_flags;
     target_ulong npc;
     int num_insns;
     int max_insns;
@@ -1661,7 +1661,7 @@ void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
         cpu_abort(cs, "Microblaze: unaligned PC=%x\n", pc_start);
     }
 
-    next_page_start = (pc_start & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
+    page_start = pc_start & TARGET_PAGE_MASK;
     num_insns = 0;
     max_insns = tb_cflags(tb) & CF_COUNT_MASK;
     if (max_insns == 0) {
@@ -1747,7 +1747,7 @@ void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
     } while (!dc->is_jmp && !dc->cpustate_changed
              && !tcg_op_buf_full()
              && !singlestep
-             && (dc->pc < next_page_start)
+             && (dc->pc - page_start < TARGET_PAGE_SIZE)
              && num_insns < max_insns);
 
     npc = dc->pc;
-- 
2.17.0

