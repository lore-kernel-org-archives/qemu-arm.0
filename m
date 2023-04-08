Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp615895ejb;
        Fri, 7 Apr 2023 17:52:47 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y5chCOsRgDbHTnMCEQGXpZ84Nz+gDotoWhIfP+lFdj1W06wecdyy2+K7xGvfTiZqkrMK+U
X-Received: by 2002:ad4:5c8a:0:b0:5d5:11b4:ad0 with SMTP id o10-20020ad45c8a000000b005d511b40ad0mr1902539qvh.11.1680915167121;
        Fri, 07 Apr 2023 17:52:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680915167; cv=none;
        d=google.com; s=arc-20160816;
        b=lPQAha3z5IodDx896cVfTnRDRPcoZ7hfuBmLLcOf305fAduFoivUIU1OMJl86xIx0U
         YF8JRIILtNG+VuuNkUz3pgSbZa8wvFqw7QQYbhdaR2TsKd0uJgVfJzPGW3O2chtVdkEI
         cQcTBZOQ74oKNqxZ+2sBS+aBUXIl/7JxpsdosfS9ayOlwdwXJvhNRIBKBamFVJijDUhQ
         vdBV9EkGMSB4+H10VkBe9oUKFrdtcIODWdGPbU/ofR6J9Hpu7ixtEwprDBBxpZXNxuT2
         k1w7pnVr/l5micRX8c1oqAXzXR8RxS+1UXBVLIJrms0eindr3JyuL75omLhdrUqeNvsl
         ojMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=VTuZJ2V+jdEhbYwqKGb3MGF43M2vOvVB+j7SrKwFTRY=;
        b=mi909Fitc9KcR3JcvttKlqIJ+e+844E7n0RxXKNIcnV0DbmQoCZazJIIsH/jRybSLi
         P+4jo0Nv+rzGehBYVfqn2bFWNTh2Hj+l3nV79WU8POp8heP7AFLSdDvrUrC9RxffQx86
         CHGr1g868RTLnfRtIeDG1xt8gnnhwcyLVcmLnvrR7EXGFwxOvv+x0vVoRZhCYYpr5IJa
         4k/wa+YitU2QzgeIQF3+DeN86yKbMmAVAi4gA26jjxI8GKBYvJV+mPDps7+rUZybcYU3
         P3PRkgWZfv4yP1xhQRi3xe32VcrZ/3VTX5VrSne8JAU18zueVkMHa3AYUkoqjlrM/Qn0
         zAZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=PW6rfS36;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y6-20020a05620a44c600b0074849d13ae8si4029393qkp.158.2023.04.07.17.52.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Apr 2023 17:52:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=PW6rfS36;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pkwoQ-0003Wq-9u; Fri, 07 Apr 2023 20:52:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=45500efaa=pbartell@amazon.com>)
 id 1pkw1c-0001lG-GI; Fri, 07 Apr 2023 20:01:48 -0400
Received: from smtp-fw-6002.amazon.com ([52.95.49.90])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=45500efaa=pbartell@amazon.com>)
 id 1pkw1a-0002NR-Tq; Fri, 07 Apr 2023 20:01:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1680912107; x=1712448107;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VTuZJ2V+jdEhbYwqKGb3MGF43M2vOvVB+j7SrKwFTRY=;
 b=PW6rfS36Q22sCR3x8/c0KTKriRoPFs4y2P6yFSf/qVIgKLUmx/cPc2Qi
 SC+dThK0wbPP95rMALNCToNJQI3CoBhsifoiIxttkzNcQQAB5hu/eXky/
 fpY9G8tx92b7RWRX4uBHwwhZX52oBWA6GuZQ3vZrST3qF0xHdwceQDJt/ o=;
X-IronPort-AV: E=Sophos;i="5.98,328,1673913600"; d="scan'208";a="316083244"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1a-m6i4x-b5bd57cf.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-6002.iad6.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2023 00:01:41 +0000
Received: from EX19D012EUA002.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-iad-1a-m6i4x-b5bd57cf.us-east-1.amazon.com (Postfix)
 with ESMTPS id 52D92448A1; Sat,  8 Apr 2023 00:01:40 +0000 (UTC)
Received: from EX19D031EUB004.ant.amazon.com (10.252.61.75) by
 EX19D012EUA002.ant.amazon.com (10.252.50.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 8 Apr 2023 00:01:39 +0000
Received: from EX19MTAUEC001.ant.amazon.com (10.252.135.222) by
 EX19D031EUB004.ant.amazon.com (10.252.61.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 8 Apr 2023 00:01:39 +0000
Received: from 147dda7342a9.ant.amazon.com (10.63.8.32) by
 mail-relay.amazon.com (10.252.135.200) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 8 Apr 2023 00:01:38 +0000
From: <pbartell@amazon.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-arm@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, "Richard
 Henderson" <richard.henderson@linaro.org>,
 Paul Bartell <pbartell@amazon.com>
Subject: [PATCH] target/arm: Fix debugging of ARMv8M Secure code
Date: Fri, 7 Apr 2023 17:01:18 -0700
Message-ID: <20230408000118.50854-1-pbartell@amazon.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: Bulk
Received-SPF: pass client-ip=52.95.49.90;
 envelope-from=prvs=45500efaa=pbartell@amazon.com; helo=smtp-fw-6002.amazon.com
X-Spam_score_int: -118
X-Spam_score: -11.9
X-Spam_bar: -----------
X-Spam_report: (-11.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 07 Apr 2023 20:52:11 -0400
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
X-TUID: 28S709DyhlPB

From: Paul Bartell <pbartell@amazon.com>

Revert changes to arm_cpu_get_phys_page_attrs_debug made in commit
4a35855682cebb89f9630b07aa9fd37c4e8c733b.

Commit 4a35855682 modifies the arm_cpu_get_phys_page_attrs_debug function
so that it calls get_phys_addr_with_struct rather than get_phys_addr, which
leads to a variety of memory access errors when debugging secure state
code on qemu ARMv8M targets with gdb.

This commit fixes a variety of gdb memory access errors including:
"error reading variable" and "Cannot access memory at address" when
attempting to read any memory address via gdb.

Signed-off-by: Paul Bartell <pbartell@amazon.com>
---
 target/arm/ptw.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index ec3f51782a..5a1339d38f 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2999,16 +2999,12 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
-    S1Translate ptw = {
-        .in_mmu_idx = arm_mmu_idx(env),
-        .in_secure = arm_is_secure(env),
-        .in_debug = true,
-    };
     GetPhysAddrResult res = {};
     ARMMMUFaultInfo fi = {};
+    ARMMMUIdx mmu_idx = arm_mmu_idx(env);
     bool ret;
 
-    ret = get_phys_addr_with_struct(env, &ptw, addr, MMU_DATA_LOAD, &res, &fi);
+    ret = get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &res, &fi);
     *attrs = res.f.attrs;
 
     if (ret) {
-- 
2.37.3

