Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3294206ejc;
        Mon, 23 Jan 2023 16:01:40 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsB6F7z7lI650VfOtEvnGNVCnH4zddeXax2LVO6OrQg65rlzGq5xJAr4YY80rpBPIpAqaY3
X-Received: by 2002:a0c:f807:0:b0:535:5c45:1be9 with SMTP id r7-20020a0cf807000000b005355c451be9mr25024273qvn.44.1674518500288;
        Mon, 23 Jan 2023 16:01:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674518500; cv=none;
        d=google.com; s=arc-20160816;
        b=F8TsMdTeJJxyGxuYPFWJ2oRT1eFn7mMKQFClpnkEMpzzxh5uTCpwLeFpDvZVNlI9LI
         jdgw+Qg0X/cGjng7s6I5rDF3woVBCHqxWWNDTXlAvI8kDXcn+zb6t9z6Kcd2vKJ+p9o+
         JTO/WfhnUvBBlAUUXQWnovNCgoZmmWY/fLjr/qRup7o7nL30YJwqNv28cxyAm4+vhVLb
         CKA+tckO/jZGaE8HLa1Ctvc8J7pjS5LBK1uH6ly+0Paniuhg55827/ZuAu1btZAVaBSF
         ppSxwPImy8lDQtg8FD9n4Wjzgc85ILE3YemqTK+awEANKc5l8JleZQsT6RYOlsKiruuO
         tM1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mN9cAMzgJVhB9gjvwFWE29O2HsMxPZwiEF+AaYdvZqg=;
        b=h2AuB2ZTwYRjEDg0srFf/Vf6KKlSWg2xvqZVlxp2IjpOigdWgt3vk/rupGe7jVzr4n
         S81wOjbqNXzlvHcj9NCvpCGgYewYJPZivHk/Fy5ieEZraotJnaMsDgA335EYmJL7n5Zz
         4fJFtRpV8qcXJxo2GZIKA9YcxQ5C1rZzzfkx5A2M8l/b5QL9bgBOhlKJW8/VTnWgnmLL
         txZKlY0IjfZa3SKcdlzu4qXSYMlHRwE+ygh0BrootTepzNU3daO1vtaJRkZcvS82rkbP
         cuq0Tjbz2hulH3+SUqSS1aPiDbaKAjpmuiMr3yX2ub5c/BgAoyBnh4Chypy0vFmpd0gx
         JutA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iUOr2gxP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o18-20020a0ce412000000b0053535c04853si269745qvl.184.2023.01.23.16.01.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jan 2023 16:01:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iUOr2gxP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pK6kc-0001BY-0F; Mon, 23 Jan 2023 19:01:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kZ-00010t-VA
 for qemu-arm@nongnu.org; Mon, 23 Jan 2023 19:01:20 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kX-0001yQ-Du
 for qemu-arm@nongnu.org; Mon, 23 Jan 2023 19:01:19 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 z1-20020a17090a66c100b00226f05b9595so12519899pjl.0
 for <qemu-arm@nongnu.org>; Mon, 23 Jan 2023 16:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mN9cAMzgJVhB9gjvwFWE29O2HsMxPZwiEF+AaYdvZqg=;
 b=iUOr2gxPtjgQ5rX94H68LLu0v0+vSNkJcOqIinvyBPsiQVY2TGTJJZ1QONkfMpnI1J
 cTfVhvUyyHE3c15c88dNtSOdYL6nApIrH3GWMf/F0i0WCD8FpUDW2ptEQWMGfQO2vwFn
 0JtN6VgmsoOh0W+Xr2cfKIejLyMZkk0z3iKYk8a7z2/ChR2qpDrAN/Vtra2WIjc5AuKw
 G51UZMHtZy7ieD0pTTxmoKyHaXbqSaldhuynbowLr5MX3DrKiP3QTzuTRxniYEzSwwis
 nr7sbtEHUiljenhaW8Mo5DJV0wDGskuxIUHv45DxHJd8TSH6lsdLsVyx8Ue9C/TlYpSJ
 gERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mN9cAMzgJVhB9gjvwFWE29O2HsMxPZwiEF+AaYdvZqg=;
 b=aqYYj34KsVf4trOQBdNiThZrA7hrvN4VYcWgE0ISIBp6VRSeJKaMOejWFFmUN5igR+
 EQSl4DYtpUZmTB9wPwUD6v7A6aXHIdpKTNEq2ByGL6r3cg7kRoHQ0cbB7FkHXtGmo7Rm
 wlJQ5X4zrv1qgOntX+WeWivs6/3ADgpCPDAZ0llMOyfii/ohdcy/8zW8+f1xU2G6P517
 p11168I3rHPMd1k3DfL3+qkQXEUJJp6zXVl53tfGwLFfYEHDgAxAYK0EkhMIUtGpyWyT
 x9j5E5gEsxJz77SRzhqcRgJtVTTGSD3qtsGSGq2otuTHKGnrDJHP59ha8fpD4MaxxzRL
 9ecQ==
X-Gm-Message-State: AFqh2kq/TpvHiSfRE0wpr1CvGXuKeEMy5d2yMCnZ7iyCRnK8GJ60iPgN
 1H9VHN1JGOy1pbTiYiGy6CWf9A==
X-Received: by 2002:a05:6a20:4295:b0:b8:9c66:cd64 with SMTP id
 o21-20020a056a20429500b000b89c66cd64mr34076018pzj.14.1674518475853; 
 Mon, 23 Jan 2023 16:01:15 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a056a00189500b0058bc37f3d13sm174104pfh.43.2023.01.23.16.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 16:01:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, yier.jin@huawei.com, jonathan.cameron@huawei.com,
 leonardo.garcia@linaro.org
Subject: [PATCH 17/22] target/arm: Use get_phys_addr_with_struct for stage2
Date: Mon, 23 Jan 2023 14:00:22 -1000
Message-Id: <20230124000027.3565716-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124000027.3565716-1-richard.henderson@linaro.org>
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: rL3IRkVNE45/

This fixes a bug in which we failed to initialize
the result attributes properly after the memset.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index eaa47f6b62..3205339957 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -32,12 +32,6 @@ typedef struct S1Translate {
     void *out_host;
 } S1Translate;
 
-static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
-                               uint64_t address,
-                               MMUAccessType access_type,
-                               GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
-    __attribute__((nonnull));
-
 static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
                                       target_ulong address,
                                       MMUAccessType access_type,
@@ -2854,12 +2848,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     cacheattrs1 = result->cacheattrs;
     memset(result, 0, sizeof(*result));
 
-    if (arm_feature(env, ARM_FEATURE_PMSA)) {
-        ret = get_phys_addr_pmsav8(env, ipa, access_type,
-                                   ptw->in_mmu_idx, s2walk_secure, result, fi);
-    } else {
-        ret = get_phys_addr_lpae(env, ptw, ipa, access_type, result, fi);
-    }
+    ret = get_phys_addr_with_struct(env, ptw, ipa, access_type, result, fi);
     fi->s2addr = ipa;
 
     /* Combine the S1 and S2 perms.  */
-- 
2.34.1

