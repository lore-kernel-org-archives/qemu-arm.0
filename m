Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C827C44501
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 20:58:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wiIFC-0001kA-08; Fri, 10 Jul 2026 16:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIFB-0001hx-1u
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 16:54:45 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIEv-0000pG-4c
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 16:54:44 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-8454160043aso1457368b3a.3
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 13:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783716868; x=1784321668; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YQ0VkN+fXYkTd5pIzgNSNc34KFa66jXvc0dQc3T9c/U=;
 b=KgqfIWcbqIF700zUYkkmZ/bLYp3zfRy7TLSMgfSHIWNF07E8sN9CANMyoEIcL45MPh
 dFLbqiFj0wXk1jrfRw7ixN6rFz60YVY2TkOFOVa2o8oanbfdEvMTPUV+2ZmWDG3+YoHL
 0b/iNXCkRcDUMB1rzIZqphJBw8ZUFX1+i5BjGVj3Gau3hqXY5uF53bip/L0bv4+ttWlS
 PhCi5Az9j3XbeV014lbfljeoQdyhIwx+DmjeieR1gdECsKtLRyFPr4lNVqX1d+rZVnyI
 D6EOHlG6XJvJ5uoVqm5lzDuzgkFCK0IJH5cylDpa+I9P1zYFFfH4lOghUBKpUiOPqdFp
 wePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783716868; x=1784321668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=YQ0VkN+fXYkTd5pIzgNSNc34KFa66jXvc0dQc3T9c/U=;
 b=G/jIG2KtPBaxakbQs5HZs7xrz2piKUPHaxL/pc96CVGWHksYR7L04G7SytNIzk/n3n
 uN+MMOhe0NBURGh1c+XvCVDBm6bSJWUqn1FJQnGLgy3N29AbRZtUMUorEsmCBL8DyPAs
 aG/hmjhKS17WBvnW2dt4yfrBPzZIwkp3nKppvNHMi9R4xDkYAtRBMPfl6cbqcVkB/2K4
 dghlDd/IlZV7F0ErhDEUpUL6qpXKXI3emzhJHvD9pj4rTHuxcrv70qV6MFf+8QyATYYs
 yB/B9uT4MHi/rkkeRUP4lQ7zBUr+DJ5rxyp/iMVyGDvO9NLEy+kTv5IeE1OvkJx4o0PT
 IvFA==
X-Gm-Message-State: AOJu0YxjFiBDL8nWLy1la3zQklBkZkQ2BBR+F484V+h1Mfo26wbvIV8D
 hLqNvF9hLT1me4fB8/SIm2/tk/WfwhaZvYsVpWLgiN1V0eHiy1W+qkEpXPex9EVuVNDO1YC+Vj1
 y8ktX
X-Gm-Gg: AfdE7cmmefdbc9rS103ZpnuMeDJPBggoZrnLrpfuKPOaNAqhcHA46FTk/MReZwkW+Rs
 85rI+CyKPQyBhqz0RVRZFGJNdK9bfl+svm4k3+G2ack2aXIQE3f1CvuTFVCssqaigEKPpR1N1z8
 q64/0MNjWAKV+kMH3pGmyXqPw7W4+YeZDfE7R0Wx+DwyBZOfIMZb5/CXsYBe0lXJ4IhgtFNZef1
 MyH3r4cpgWJ+gGWci1D/ihikkOjYWSfeqNVgtzHBSa6gojs9m1kA5vr0EGY14ovpVwqhDMb//0S
 hCy2exCCVRi03mo3kselqN11UO84Ac1uODn0uMo8YO1oK206B6wOrZxE0UnWbJkbiFwmja3OMPy
 DhqUmdPzxHJ+pvah8ofWQoRNW3i8U3PCk3EvdTPT+NiuvYAO12hZEY4SUdE9nbiboku/ZmPgdtu
 pM0SvcPW2Dxx8qJ9qHuA==
X-Received: by 2002:a05:6a00:6c9a:b0:848:2f84:f42d with SMTP id
 d2e1a72fcca58-84889792beemr481182b3a.70.1783716867603; 
 Fri, 10 Jul 2026 13:54:27 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6d76106sm10780574b3a.40.2026.07.10.13.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:54:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
Subject: [PATCH v3 23/51] cpu-common: Validate flags in cpu_breakpoint_insert
Date: Fri, 10 Jul 2026 13:53:33 -0700
Message-ID: <20260710205401.836304-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710205401.836304-1-richard.henderson@linaro.org>
References: <20260710205401.836304-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Flags must specify GDB or CPU but not both.
Flags must not contain extraneous bits.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 cpu-common.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/cpu-common.c b/cpu-common.c
index fcc9bc77a3..80a4a191f4 100644
--- a/cpu-common.c
+++ b/cpu-common.c
@@ -410,6 +410,9 @@ CPUBreakpoint *cpu_breakpoint_insert(CPUState *cpu, vaddr pc,
 {
     CPUBreakpoint *bp;
 
+    assert(!(flags & ~BP_ANY));
+    assert(ctpop32(flags) == 1);
+
     if (cpu->cc->gdb_adjust_breakpoint) {
         pc = cpu->cc->gdb_adjust_breakpoint(cpu, pc);
     }
-- 
2.43.0


