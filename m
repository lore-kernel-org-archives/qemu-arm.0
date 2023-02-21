Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2861683ejb;
        Mon, 20 Feb 2023 19:42:05 -0800 (PST)
X-Google-Smtp-Source: AK7set+7SE93j8t7SwPFAjrnbGzTkzO6smSTO/Vf6B/+yudqKtYljFg/akTpxk/NvIXBGH7LkNRn
X-Received: by 2002:ad4:5d4c:0:b0:56b:ee5a:89eb with SMTP id jk12-20020ad45d4c000000b0056bee5a89ebmr5470159qvb.19.1676950924976;
        Mon, 20 Feb 2023 19:42:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676950924; cv=none;
        d=google.com; s=arc-20160816;
        b=QanYwPV4tbmdkV1RPVQNf6b+flst0wP2tqz5fNmDphzFeCjROrdPrZLnHUwUWTLH/V
         6JpDdJweyM77dKBZKgokL/Hr+IFDJwL/Rb78IUM2IKJ0BFE8IiYTdMrVl16p2faebABa
         8YqPWo6V/j7RApKTJpVXGokNNseZvb0A+r3lNgHQ5kYxNuh6k8AXpY4PJ0TTvLyaBd4j
         jn0Kqa7Wy6iaTWpmCpHe0pYBoZ+1Y/yr6bPSw55NDiCK10BlDDJnW1yp0GS3YYAbvr1p
         eNdUpZIfqfVHMPU4VdifpJd4XsRISXCtH0EBFygwprV6vRecl3tD+3rlXX8rEnxN7uzx
         RyEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dV3tomdbYmAqkN5Vs+1qw+A5YDs8BGZbPqInFvA+4kU=;
        b=ufQvxjC10KvDVj3dmrXu9duPs/vjl/jmhQqu2bazlht1C89jsab0sZgAYTpLgdM2Bq
         KdFUljMMLkfWI6QCXKCjqQXyg/3YUwbswEiAjjVSoJSSda/cS6cKmzcNjfQVmSIpG9l8
         eKYpEmGMA73w/BG88nNy/RVhV/gxOWCTgEWXINLg5l0bBzCBrKt25Pemgz8juc6NPQfI
         f/JF/jRZlRiY5JNCdcj7L/vaKnyzEFxUparGASCoct9xrD7DUwPnJOwbNa3KPHkgj83Z
         wQufzYbUG0RTGKusSNGtgKH0NPe/MWhB4p5NxzR8ZpZe+O+QJsuUt7iDpdTKZnm3NiJg
         tOhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EWO5prRU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z20-20020a0ca954000000b00571bfc39612si333393qva.346.2023.02.20.19.42.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 19:42:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EWO5prRU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUJXH-0005we-8Z; Mon, 20 Feb 2023 22:41:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUJX6-0005rT-Rf
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 22:41:37 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUJX3-0005nr-U5
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 22:41:36 -0500
Received: by mail-pj1-x1041.google.com with SMTP id
 il18-20020a17090b165200b0023127b2d602so3474093pjb.2
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 19:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dV3tomdbYmAqkN5Vs+1qw+A5YDs8BGZbPqInFvA+4kU=;
 b=EWO5prRUt3P9m/uqTJ/VzV/p820sQhFivmFxggKSP31SBrSYiIrxJXyW6P4h7UnCGI
 ZePg6+RFkeUao384uAKkNTguxD+DLYblGgp4ZwN8ICkR8FSzYbvOEblsDKE4ochkMGiF
 SpoTfEmGQHYbkxL2VKFAbFP3uVVFaxi66lwJzBK637trjEVY8oG+iK+9f5Re6/is/ft2
 MNsUzk3RQWiYE5X9zis1lVGyp5HYMiZeRbDfr9U7btaCNkIADufRp7YvnIOg3RcyBYLd
 D3TBBEasZliVfhHbRVxIDTCKy1SMN7DIknzIlaY5nkZ7156jx7BJGILabuddqwZBDAsS
 CWBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dV3tomdbYmAqkN5Vs+1qw+A5YDs8BGZbPqInFvA+4kU=;
 b=Lc5ptrMp+Tw8NBIOH+nVnK0ZjwJOuT9jdjaTbsncO3nXsIik0GW09JiYaiHz47YdCe
 DzJRyam7cxIqJY3Bb8err0UWArJz3YPnGeb/4RHbXqWTz/i9sbyhqwIhxDTB8imfA8wE
 C3osVidvH1Qim8sI2YZbnHuaKdk/CgTRuBJ0pbt6GUZgXdqmxuzdDePsmsWKpbI+YM5e
 t4iO+XmT70ZcOQ/ZNS/56QPtIO6vlXh+iAOZq0AzAN7w5mjgoxdHIF8Pf6WAzD0WpLYD
 CoGqdkLTuEXq7MqXcn7cD83QLWZPelx5OYByEcL6WsYmxd2ZOQUXUIsn8UEsprDFDHix
 MIrQ==
X-Gm-Message-State: AO0yUKXL7qLIuiLpzQxXBRcmRbStmPX5+jeCQIKh7UXdxZwvUTIC8stk
 nMIepRdOwgeOI38ssI2HWmgGlJQR3ow/mOTBr2Z81g==
X-Received: by 2002:a17:902:f947:b0:19a:968d:26f9 with SMTP id
 kx7-20020a170902f94700b0019a968d26f9mr3669853plb.54.1676950888490; 
 Mon, 20 Feb 2023 19:41:28 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a170902c1c400b0019a88c1cf63sm69851plc.180.2023.02.20.19.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 19:41:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 2/2] target/arm: Fix arm_cpu_get_phys_page_attrs_debug for
 m-profile
Date: Mon, 20 Feb 2023 17:41:22 -1000
Message-Id: <20230221034122.471707-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230221034122.471707-1-richard.henderson@linaro.org>
References: <20230221034122.471707-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Q+pGtnjATgxM

M-profile is not supported by arm_is_secure, so using it as
a replacement when bypassing get_phys_addr was incorrect.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1421
Fixes: 4a35855682ce ("target/arm: Plumb debug into S1Translate")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index cb073ac477..057cc9f641 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2974,9 +2974,10 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
+    ARMMMUIdx mmu_idx = arm_mmu_idx(env);
     S1Translate ptw = {
-        .in_mmu_idx = arm_mmu_idx(env),
-        .in_secure = arm_is_secure(env),
+        .in_mmu_idx = mmu_idx,
+        .in_secure = regime_is_secure(env, mmu_idx),
         .in_debug = true,
     };
     GetPhysAddrResult res = {};
-- 
2.34.1

