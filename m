Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1016899wrq;
        Wed, 23 Oct 2019 08:09:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyqOTrHATPGHMmVc3Yq+K+KvOclvsnD7c4nzCy3Kwq6uOTY64sQjA2x11qsUk/BPcyrMWPr
X-Received: by 2002:a0c:efcd:: with SMTP id a13mr9187810qvt.94.1571843398585;
        Wed, 23 Oct 2019 08:09:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571843398; cv=none;
        d=google.com; s=arc-20160816;
        b=n6Asl+Jxx9iBVJLAQ/HFF6HyarbU+xAcnSn9Va4Ak4obxXUZGI0e/CxuAI2ycgqaJp
         w11tR+tQaWREHgD4VgQDKzdzDd7UIppNwQ7eS62v+SrZn2IOZ89AUy1WbB+i6nHqy57o
         ql3YDTXFS5vl77Ez7K6+s0aexj9XBISVvezCjRSLfcscgkBJH2jo4wCNWAnMwDq1UYQf
         vmIrHBB1Q8bLJKw9HGXDHPy3ywgiISGmeDKP31UJwCLRnsM7IEWT60fj6MIkBYzr6UWD
         kSUry+8OjXTAVfYDOwY1Xv8HVzI65wSog+w00J3SZHpraY8odmNVo3GKT+ewMDzYUiYv
         4sBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=IBA+abtZ26hlRDDlZ8eTB3Pn4yNYwZChmFB+u2JQGOM=;
        b=Kk5pmtxGD6O9t2NHsxjrB4vxs3tifKBBZIQzT0oAYZl6DhjvavOSbZbUBkNEpn8O2L
         e/B/9AEExQfL+JUMrlAh6zIJ8xCj9zAAQuQLPnbkajYJLeXthQiCxeFdPi3SaX/oQnEs
         bJZ/IwdOUdt712rTPrQdbxNlkapga/BCrNBjLYeJiJ/RB+zXLOpXYTJRijdkFhs8WO38
         61mXZqIbrh2A+O98I/J5rZJUKX8RLmeH/UONu0qQEBaRExexV21o6TiaI0EH3IdF/m1N
         qnReWXSeNWlhttDIo/6mTg5p2DCV4sAMTYwMF1R8PCXGQom0dLr61k9yBlXJCVerf4qt
         6FYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kl7dFo28;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q28si16870202qtf.22.2019.10.23.08.09.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 08:09:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kl7dFo28;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNIGr-0004yc-Im
	for alex.bennee@linaro.org; Wed, 23 Oct 2019 11:09:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35095)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iNI8r-000861-T6
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 11:01:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iNI8q-0001Dg-MX
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 11:01:41 -0400
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843]:37773)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iNI8o-00013Z-L2
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 11:01:40 -0400
Received: by mail-qt1-x843.google.com with SMTP id g50so18582133qtb.4
 for <qemu-devel@nongnu.org>; Wed, 23 Oct 2019 08:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IBA+abtZ26hlRDDlZ8eTB3Pn4yNYwZChmFB+u2JQGOM=;
 b=Kl7dFo28PEXr9icb+mFQdKLB4ia3YW7xNtm5+36Axi5JLbMVMjmEJg+o1rLT7O6hFY
 Njdd1uj18qTWYtm1tKivlXWozJ0IXiXkjEMBjxjH1Xtqcy78egANpG+uFQbfRcZOwDj0
 FVcZcImevfyeqhw6Xii0bm3EbKKIVsuiQ5xidiZxYuFShVTIpllo8EOt/iqv9JiKt2eb
 WPe8B12kbWYO8FX4R67m6AdhgjfSeB2Ia0IyFw4pgky5hh7WXRlLZGZNQTU4Ib3rH9ka
 hjw2vkFPUXNyDR1/FBkytveJpl2WqoS2zJUzfWkrFDoVRFw+xsmiuz3xMdtAv+Z/ZY/+
 2YXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IBA+abtZ26hlRDDlZ8eTB3Pn4yNYwZChmFB+u2JQGOM=;
 b=L42PabNQYuvb39SSpTAAOyURxuS6tzclsG/BVRQw4vJM7NJJPOwcV3BS47XE8Vw9yG
 IJyfsE4aJUDwJvFAWedqVtpPK234nomQ2EhRsU+6o6kJx09keUONxqQ0oOvKaa1bSeRf
 DobIfi1EBrgRywsaFqhFysb5sWBIAhmxato5JK24iIXuZDezuhK/CQKlVuk5fv0AuiJq
 cJU+AWX5Xishg+slX0z/v4j5nc5/oCrGWhHEIXXRKN6ScZAvY4szPGSaQbgHttfnOv3n
 p0tme1TBPIhOfop5RdeRCAshk0mIg+XxoG1x2hZqVQvxJqOLMa8vPNoaCehP34AmOy04
 5O5A==
X-Gm-Message-State: APjAAAVWPYdKqzrUO4+ZHJiAfTRm5LD+d/He/XgfbNdUCKvY+c+ctr6w
 E5+I/w9/P2Ahs2JBfWVPmbihuuhKnxE=
X-Received: by 2002:ac8:3597:: with SMTP id k23mr3420879qtb.195.1571842871709; 
 Wed, 23 Oct 2019 08:01:11 -0700 (PDT)
Received: from localhost.localdomain (198-4-20-64.static.cosmoweb.net.
 [64.20.4.198])
 by smtp.gmail.com with ESMTPSA id l189sm11030168qke.69.2019.10.23.08.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 08:01:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 07/24] target/arm: Split out rebuild_hflags_a32
Date: Wed, 23 Oct 2019 11:00:40 -0400
Message-Id: <20191023150057.25731-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023150057.25731-1-richard.henderson@linaro.org>
References: <20191023150057.25731-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::843
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qkucgCz3Ind5

Currently a trivial wrapper for rebuild_hflags_common_32.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 296a4b2232..d1cd54cc93 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11106,6 +11106,12 @@ static uint32_t rebuild_hflags_m32(CPUARMState *env, int fp_el,
     return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
 }
 
+static uint32_t rebuild_hflags_a32(CPUARMState *env, int fp_el,
+                                   ARMMMUIdx mmu_idx)
+{
+    return rebuild_hflags_common_32(env, fp_el, mmu_idx, 0);
+}
+
 static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
                                    ARMMMUIdx mmu_idx)
 {
@@ -11218,7 +11224,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
                 flags = FIELD_DP32(flags, TBFLAG_A32, LSPACT, 1);
             }
         } else {
-            flags = rebuild_hflags_common_32(env, fp_el, mmu_idx, 0);
+            flags = rebuild_hflags_a32(env, fp_el, mmu_idx);
         }
 
         flags = FIELD_DP32(flags, TBFLAG_A32, THUMB, env->thumb);
-- 
2.17.1

