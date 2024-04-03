Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp4484375ejv;
        Wed, 3 Apr 2024 03:19:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXf+aYXBdhjjd0H5PoNCBzaW5t93VcGGi8pZ9+l50yUBmYVF0MzBB/VFmWKqd51l0TVv2QBNBx/mqzkpFNNWpPNIDgKrSXz
X-Google-Smtp-Source: AGHT+IF1zLs40FTXKmbzDn0ZpsSxRI1zoUQXVaMPAi4Rgcgmxm+U4RlQppxiWbZFr93xPmWBlOQB
X-Received: by 2002:a0d:f845:0:b0:611:67c:e6dc with SMTP id i66-20020a0df845000000b00611067ce6dcmr14624452ywf.13.1712139549984;
        Wed, 03 Apr 2024 03:19:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712139549; cv=none;
        d=google.com; s=arc-20160816;
        b=oWA6vGRkNfRHXw6VCqeZgJHIi8HJgBLBRwQcOPh69VWwCFzFDyND+9sJylpC33nA4y
         8lHC+7D9ay9pf6novf/6ymCkgbE/rQAmwhEHlrbwThpaLSgwgSOOaUAMK2aUjOGBJR8p
         XFMQ2JUWRDRR0qxXqhhVq0J0hkYy4pXknj1xLx73N3CGj9ThIvK307C9opyRWTxOSlTP
         g0mYf5MxZDNm07Li/dZ6c38StuN9TWCugszvZk5uAonrQNIlWOgJvEbEXGjnWEmyG1Qx
         J+m/LJpNDSdkjm+Oe785vslmd49l8KLiSV6u11FYmkyY/yc/YHG4gfcw71Epix/NmGeQ
         JzDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=6isEtGqC/xkVhiOwzs1udE8M7np4HLCHPTCpQhwXgaA=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=tKeOlGOnCkMeo7ddCI3vd0swukyvPgxDOQ53rdibES2ByCEFD3gqJ5ZTBGp84advbG
         s+K0g0k1OHIhI9i7CEaplZ6vVxZXGfUwA5MFQRCcsFeVZ5wpRLAUkm1m/TSiqwrENddp
         EAwcMhwjmKWe7NWJeK77+Yu35PXndnjh0uZ9OHiWSXygE3KC2Y1GDPeFQMfUIUzLHXsW
         x92xe1/LhTAUjPc2k/T3JqmGLcDtza72SuvdyW8KtRIWa76FD1cvevNq2L6+EX1z+VB2
         R9gIi80/t8ZfKgiO0NjdONQaIfYqaEu5sU3eG615dL7sJRUCdqSENqJeEoNzqjr5i4gr
         oeUg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z21-20020a05620a261500b0078bc655aa89si13728923qko.14.2024.04.03.03.19.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Apr 2024 03:19:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rrxhB-00011X-3i; Wed, 03 Apr 2024 06:18:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rrxgw-0000sA-RO; Wed, 03 Apr 2024 06:18:02 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rrxgl-0006bt-Vn; Wed, 03 Apr 2024 06:18:02 -0400
Received: from mail.maildlp.com (unknown [172.19.88.163])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4V8gf71jhGz1GFnL;
 Wed,  3 Apr 2024 18:17:03 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id AA58518002D;
 Wed,  3 Apr 2024 18:17:41 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 3 Apr
 2024 18:17:41 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v12 02/23] target/arm: Add PSTATE.ALLINT
Date: Wed, 3 Apr 2024 10:15:50 +0000
Message-ID: <20240403101611.3204086-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403101611.3204086-1-ruanjinjie@huawei.com>
References: <20240403101611.3204086-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=ruanjinjie@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: fbCYuCy5js4S

When PSTATE.ALLINT is set, an IRQ or FIQ interrupt that is targeted to
ELx, with or without superpriority is masked.

As Richard suggested, place ALLINT bit in PSTATE in env->pstate.

With the change to pstate_read/write, exception entry
and return are automatically handled.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v5:
- Remove the ALLINT comment, as it is covered by "all other bits".
- Add Reviewed-by.
v4:
- Keep PSTATE.ALLINT in env->pstate but not env->allint.
- Update the commit message.
v3:
- Remove ALLINT dump in aarch64_cpu_dump_state().
- Update the commit message.
---
 target/arm/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index bc0c84873f..de740d223f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1430,6 +1430,7 @@ void pmu_init(ARMCPU *cpu);
 #define PSTATE_D (1U << 9)
 #define PSTATE_BTYPE (3U << 10)
 #define PSTATE_SSBS (1U << 12)
+#define PSTATE_ALLINT (1U << 13)
 #define PSTATE_IL (1U << 20)
 #define PSTATE_SS (1U << 21)
 #define PSTATE_PAN (1U << 22)
-- 
2.34.1

