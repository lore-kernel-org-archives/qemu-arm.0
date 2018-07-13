Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp747685wrq;
        Fri, 13 Jul 2018 07:24:56 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdbUcKQrv3qYguNDTW/TDSmabYevx/JAI3EmFfPovooQxVcILWgCAuEYfIO0c8t+4nf4Fwb
X-Received: by 2002:a37:88c5:: with SMTP id k188-v6mr5891671qkd.365.1531491896374;
        Fri, 13 Jul 2018 07:24:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531491896; cv=none;
        d=google.com; s=arc-20160816;
        b=LMdk16N2awIZqhOV+lkTiyaEZTAfVNT7JVdcWRFnwvCNdRA6uTcQc6RvDAFjophhhs
         JHObC/CVQn1tgF+dxxGykxrO6TX/0nyu+RvV+myZzLicyQV5YXCgPJueRXt3bzDlgRyN
         2dAzcnatINOIBGjUN3CEsrAGoy7nDeramO/185Z2tahZMZMcSzhPGQ6QKfwm6OWtMEsq
         an9hknEo2C2VDGS9vQEdbrWxs7iFueHsXxLyoA1OjZshExIRLVgLb9VDH6a6Cq1f27eb
         +DOGrwCoOkVIXXa8lTBwDLeYB/J0R1jCu6gj2BQjhSGl2wx6IgF+pc2yvhAW4XoAnRyW
         5qag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=1hRTC4qVWtMiRQGEmEuV2qGV4pDaOJLbawdkW9VzdQA=;
        b=rzm6QEVOh3AN0tAXj0AT2EtLaEihcimmPMSQCFGfULPy4jCSyZd0ncoBuBVuBaQV3p
         kAQYffW8vzKNBABd5g9sxkR9u2O39jaz1GA2E8CbumOPlnx+WBijOy6srcVsjAmVtKoV
         PcM/V3tCCOntmVDUaAC5KG7czr3hGKdOTUALUlrCvXdC95NEkhMklPTLc7xc4vZxh+wr
         vJml57ZZMEOtWXhiUKVQjJBTJ3WbUsJF3PLVKR688w2sLhxUFQIWLQJJV3OCHvFvRxmT
         3gxskAr+o0zKjyUwBt6A84dzPqSb8iUQlwWIlXxBDR+N6QfLIBm9MCO+cCbyVcA1dsRD
         7eAw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c13-v6si3333861qth.157.2018.07.13.07.24.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 07:24:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37621 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdz0B-0000HR-N4
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 10:24:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60217)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fdyzz-0000HD-Lm
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 10:24:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fdyzy-0001Pl-O0
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 10:24:43 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43526)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fdyzy-0001OZ-GA; Fri, 13 Jul 2018 10:24:42 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fdysA-0005Ou-RW; Fri, 13 Jul 2018 15:16:38 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 13 Jul 2018 15:16:36 +0100
Message-Id: <20180713141636.18665-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180713141636.18665-1-peter.maydell@linaro.org>
References: <20180713141636.18665-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-3.0 2/2] accel/tcg: Assert that tlb fill gave
 us a valid TLB entry
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
Cc: Richard Henderson <rth@twiddle.net>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 86KbjeFEq/wt

In commit 4b1a3e1e34ad97 we added a check for whether the TLB entry
we had following a tlb_fill had the INVALID bit set.  This could
happen in some circumstances because a stale or wrong TLB entry was
pulled out of the victim cache.  However, after commit
68fea038553039e (which prevents stale entries being in the victim
cache) and the previous commit (which ensures we don't incorrectly
hit in the victim cache)) this should never be possible.

Drop the check on TLB_INVALID_MASK from the "is this a TLB_RECHECK?"
condition, and instead assert that the tlb fill procedure has given
us a valid TLB entry (or longjumped out with a guest exception).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 accel/tcg/cputlb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 2d5fb15d9a3..563fa30117e 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -970,10 +970,10 @@ tb_page_addr_t get_page_addr_code(CPUArchState *env, target_ulong addr)
         if (!VICTIM_TLB_HIT(addr_code, addr)) {
             tlb_fill(ENV_GET_CPU(env), addr, 0, MMU_INST_FETCH, mmu_idx, 0);
         }
+        assert(tlb_hit(env->tlb_table[mmu_idx][index].addr_code, addr));
     }
 
-    if (unlikely((env->tlb_table[mmu_idx][index].addr_code &
-                  (TLB_RECHECK | TLB_INVALID_MASK)) == TLB_RECHECK)) {
+    if (unlikely(env->tlb_table[mmu_idx][index].addr_code & TLB_RECHECK)) {
         /*
          * This is a TLB_RECHECK access, where the MMU protection
          * covers a smaller range than a target page, and we must
-- 
2.17.1

