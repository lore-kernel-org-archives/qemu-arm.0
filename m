Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp4297731lfv;
        Tue, 2 Nov 2021 21:09:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVvIc8XFulBBPNeOuU6cvtYlwMC09vwfa1d3kBdHJYQVUp4nib1zsX2yVBS5TEp9fNjb+x
X-Received: by 2002:a9d:24ea:: with SMTP id z97mr7364575ota.64.1635912577354;
        Tue, 02 Nov 2021 21:09:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635912577; cv=none;
        d=google.com; s=arc-20160816;
        b=TpmAufL69Hy7PM+0+DFQUpRmluxAWxzBkJZeercaP9w48MfE9yhocRP3ym30NXLQJ2
         x1uYqP5LouSYepWkVPB/+0a+VLslF3SQnEO8xqsBwQYTl3jr7ZTj1AQWrNXbeM0vvPMb
         VttCITjNXcDLC6DmXFArVtx4TYDeBaViyxAP/63/dO94a1YlUEDh3TG5bK3ugfn9VcOu
         6mrrc8Bv8RIYcCgTLCvqUDGK/rEI/bBVgvFh2UUYYwXXFj8HiZ2vrKUx1wjQjnU0xt0f
         7zU3Kmt7GnnX7gPiUzbXTS918WmmSvk7TqxOwzhEhj745CkkKjk+sLyf6ii6lj0klNl7
         YqOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cJZzHtETyU7Abpg6jDwficUEI9QcLIESqh5Jw1opJKw=;
        b=NBthtCqdTXjodVxmcAqcDDd1xplvlEiREY8zFZJ0ltzfZtqB82N+bBm+SBchc4IQbh
         Tmkmw8Cw0fDvI5j64BkVp5vp8sgtfXEVshPj+pV8SDA3gXmefxraRS6y6zBaYa2XczrC
         QUW8/2q7aTvb/v76XuViXaig3CQtRV5WTE7mCOS+rkgatmWLuAWPjWr91rB5lnfiK3u+
         63fJiWz5/P6pDyJiYTGRB0A5MZlQrIwqRMDgpkB/s/aDSq0oy7kO+dsmWXW6B6r/7MoP
         UJptQ4yFZIZZ7fYPK3Kg/vYuyziaYJRMIVOyessfpzbpwS8c+lnNJtdD5CeRceCX50K8
         muaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HiDMshOr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8si1466744otc.107.2021.11.02.21.09.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Nov 2021 21:09:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HiDMshOr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mi7ai-0007Te-Jk
	for alex.bennee@linaro.org; Wed, 03 Nov 2021 00:09:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7VL-0005FP-SC
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 00:04:05 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:38807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7VG-0000uW-Am
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 00:04:02 -0400
Received: by mail-qv1-xf33.google.com with SMTP id a24so1491770qvb.5
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 21:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cJZzHtETyU7Abpg6jDwficUEI9QcLIESqh5Jw1opJKw=;
 b=HiDMshOrF2zCqAXoMW3NpyhDdosFedlv5moEfZxaokT6uG/I+CduLfEO7DRkPhhNL+
 L4A1r4rn295Ye9qkFOMqKDBwnXOyV0Asue0rvP7lWneFHHfoa4Ap+G+Xj0h2MS0G9Lca
 1j8ITDUpw73jd+VmOJ24Dk19lyzb9z2/Yvg32M8G1Wg5sL2xh37lYhDHK0/IAxt7aRfO
 XRYq3OTo/tYgF1OxtP4apO2VosQiDOVxFGrTpWdgmnqwiREu8nmO//Am6L281o4tjRvn
 aedjDCWlXIhrmKcRlm75mcyFJJ3Y5jQXUU+d/9JaE/8qeSjtVDrgueSkm1prwtV95Usz
 zaHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cJZzHtETyU7Abpg6jDwficUEI9QcLIESqh5Jw1opJKw=;
 b=DloNYEKAzJB32ER+eC6BusKSMSvoWDTgx58xdlmikmQqBMVCyKtUon1IonijhYm+sA
 6a8/3Gu3OCnvwtbpoWhmG5iHxv36KXQrHA8TQFgfcJrxEwUsyAMIyON1qJ8VjAKA7Eaq
 i/rWiYJZTwlBy+cm1aL2rANmpfzDJIncDPRVIyMzysSvjIh8yHSL/o1Bzm7RIVicJJml
 wbYFoSh+I/daQUoeupbP+gxdeYxIdavKjNQP/x5crFyX99Oh9FP5yxG/DN/r56gVuG8w
 VjRuWXFG5A+d7sstFjKSmXXeIuIqgQ8ZhTax1gvJHRxeuXEuoW1z5G9p5jHAaJX6Yd+f
 ypEw==
X-Gm-Message-State: AOAM531SfAgVrVQKjybEv9GmrLjo+r7D7KbkIsEJfN79Q9t5l8r0m4U0
 jldSpTIqR926VOAjyKO6Lbz5KZj+cFd1rw==
X-Received: by 2002:ac8:7d11:: with SMTP id g17mr5655203qtb.341.1635912237427; 
 Tue, 02 Nov 2021 21:03:57 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id br20sm730408qkb.104.2021.11.02.21.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 21:03:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/10] target/arm: Advance pc for arch single-step exception
Date: Wed,  3 Nov 2021 00:03:47 -0400
Message-Id: <20211103040352.373688-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103040352.373688-1-richard.henderson@linaro.org>
References: <20211103040352.373688-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bXcO1fn78GOi

The size of the code covered by a TranslationBlock cannot be 0;
this is checked via assert in tb_gen_code.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 9c4258ccac..2986fe1393 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14767,6 +14767,7 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
         assert(s->base.num_insns == 1);
         gen_swstep_exception(s, 0, 0);
         s->base.is_jmp = DISAS_NORETURN;
+        s->base.pc_next = pc + 4;
         return;
     }
 
-- 
2.25.1

