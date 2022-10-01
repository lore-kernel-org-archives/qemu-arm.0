Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp465784ocs;
        Sat, 1 Oct 2022 09:41:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6iq02T77bS0/8aOOsRcETEhnzP5VDXOU4CRLQMKOMRJ0jP6vKp5iPr4bp+2KDNAGVxQrw7
X-Received: by 2002:a05:622a:38d:b0:35d:4cd3:1c79 with SMTP id j13-20020a05622a038d00b0035d4cd31c79mr11307422qtx.346.1664642485955;
        Sat, 01 Oct 2022 09:41:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664642485; cv=none;
        d=google.com; s=arc-20160816;
        b=ypm3GzST9KdCh+Pzy4fvHCkJTJfDhQCMHOJ+dvnVzYffV4RyxUrM1op4v8Vev+dCok
         cp3STdX8jFvg2kBDDHR2t683ig0BXzaJzzLaY4tGaZKNKwOwSu1UxKzJXJPfeIgFwsld
         2A9RlUq1eLZtjDizCt7Mv50UldHuOnrSaNUuSrcW1EPnl49So4Z1JVJsqBh8UJoTFI5B
         xpZy3UlJSj4skli2KD9dnx8zlnsYV19bF7WPtQoRK3C8OiPkA/SOUN5+QSACAStBHs9u
         PlAh6FXkrwn2hyA+Kdb6eK2UWGrAkG5mh5h74jqvJYj/PvtHoxg77N+vcRUoUrMmUPXi
         qDAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1wNWHezVm2UV71ghHCMk5XJVYInqSqpNnuv7vR6v7WU=;
        b=R5zt77PPEygqoMOy3iytMYEqFIpjwF0YN4MiMId63ENGgep9/iseuyws1vIRnYeiJ+
         f0iA0B0BtH6Z4QB1QROYC/75sRdaag8tebtCYzwub1Ksx8BGy3wgwSzkdr+HUQeVPIY3
         qjj+eBqtGvO0cvrLfgvW0bP1Xamcpkf2296C3piq2PJ2Ff5VMlDQlFbJjS11Iex3lrFE
         JVMIk4OdY73vSgk1lGnDZHdwkM90fdnd1bZAGvhidkor9JhFlEw92YzWWg0/SZGr8Cj+
         qF6Hq5C3ecuq4wTwNaAViIl11MNUQi4tsL3oytacXva64FRG0wZ7CrQG1xql2ysBmD1f
         X6uA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uta0XtAq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i21-20020ac84895000000b0035cd8169943si2390315qtq.189.2022.10.01.09.41.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Oct 2022 09:41:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uta0XtAq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oefYL-0007fb-GB
	for alex.bennee@linaro.org; Sat, 01 Oct 2022 12:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefI3-0007y6-76
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:35 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:35429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefI1-0006Nb-GF
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:34 -0400
Received: by mail-qt1-x82b.google.com with SMTP id g23so4351608qtu.2
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 09:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=1wNWHezVm2UV71ghHCMk5XJVYInqSqpNnuv7vR6v7WU=;
 b=uta0XtAq0zkGKDu1c8hXsyDPsYAVjvfwUFxTlVAbeYrrGuciXQxZBWDudQidrIOY8u
 dVq9oEyZaBn8TJ/rEzaVbMjB+LBstcPRC9TWdLCCKdxJ34bhzDJsZHwxyGS9djzqSk9p
 /QL8aUdQqIm2S25JCv2yI57K82sqYDmyc6SY79UXucx7wUwTjDXu9YkxEHWDXAMXsloK
 oE+jaT9tgbJTspU7ZslVg7kzYAuy1PQMy06Fn4MJrZBD5CEnmfvFX9nVjwrkDK+uVNOm
 gymT77MgonR9yAMCSUA4OHT7LMi9hb970673mONltVyy21rcGW1qsPt+M7pFuUFADpUp
 Fnng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=1wNWHezVm2UV71ghHCMk5XJVYInqSqpNnuv7vR6v7WU=;
 b=NbSFe6Tbe31XM9JKx6tQn4TVxDzupgsENVhUaavN6vfK02mVWhdmozUjWhtqoO3DTn
 xHzgWiYsnzrDjxMn8T/HL9m2QcGajP0SMdPTDPkaS6Ng0RSww0ByPhI9RQXITMD/SF24
 Nhma9lRnopSSh5pEfYUzZXg1c3rZSaWk0GdHTJWTisO0ksA1/JEC9m0cHKbxRHxs0IgW
 q0USp38m6vZ0vSGhwwTtSqihjVOzkaqI766N58ftq2k5c4SNAPtYE9REASD4xjQMgXRg
 nqCXE/Q7DTtfQjD6A2p8vEoLuGp5M/obH4BwoblHB0IfNtQspoXw87XEtyE6JJ7FyjET
 FiBg==
X-Gm-Message-State: ACrzQf3udccrh9y7XZWPtABqtSmiIH4rHQ/AWaixSDfLxJTOFkyTt8jd
 gggoqP4J/lucRLqZvPKJnW0WFurfHUk6hg==
X-Received: by 2002:ac8:5c0b:0:b0:35c:e066:998d with SMTP id
 i11-20020ac85c0b000000b0035ce066998dmr10906978qti.336.1664641472882; 
 Sat, 01 Oct 2022 09:24:32 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:24:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 29/42] target/arm: Use bool consistently for get_phys_addr
 subroutines
Date: Sat,  1 Oct 2022 09:23:05 -0700
Message-Id: <20221001162318.153420-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JWLLbqk9xiU2

The return type of the functions is already bool, but in a few
instances we used an integer type with the return statement.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 3f5733a237..445382ab03 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2432,7 +2432,7 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
     result->f.lg_page_size = TARGET_PAGE_BITS;
     result->cacheattrs.shareability = shareability;
     result->cacheattrs.attrs = memattr;
-    return 0;
+    return false;
 }
 
 static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
@@ -2444,8 +2444,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
 {
     hwaddr ipa;
     int s1_prot;
-    int ret;
-    bool ipa_secure, s2walk_secure;
+    bool ret, ipa_secure, s2walk_secure;
     ARMCacheAttrs cacheattrs1;
     ARMMMUIdx s2_mmu_idx;
     bool is_el0;
@@ -2524,7 +2523,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
                 || (env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW)));
         }
     }
-    return 0;
+    return false;
 }
 
 static bool get_phys_addr_with_secure_debug(CPUARMState *env,
-- 
2.34.1

