Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1034644ejc;
        Mon, 22 Aug 2022 10:12:00 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4w2ty7SGS76e/uQVaRlOql4Fuds+CnW2L+OeUrmgPyA4gIRivNNtz1zJk+FPqejuOwx9YY
X-Received: by 2002:a05:620a:2987:b0:6ba:dc04:11ae with SMTP id r7-20020a05620a298700b006badc0411aemr13238930qkp.748.1661188320634;
        Mon, 22 Aug 2022 10:12:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661188320; cv=none;
        d=google.com; s=arc-20160816;
        b=vWwOgXDPLC9dBKoVzHkMHXq9ZTrWiLfD+wwFNSISvNnoQFPCPniyLRiw6DNAmMnwIp
         KHzFw2qtWNmXBJbbo6qcQCscfXeD9eyZc9LtyxeOFsz2+7UolgVSmgA8/wxCzWqEKyQP
         ib3R66gxJd0zYW8j3ZNiEbDg5AP+v0L7DS6s4xxN6KlvmhBadoa+p85SkFST3OxnKbDA
         Ht6RYJ1azxNueL2IsqeDF1tu0zywwPFrgLE0hbt9tr71GY1wCb/lTx8ADlx6ia+IZvua
         aa55nZ4Q9SwFfsoYfOQ6YUb7ZS6jJY8HJZrRM06d/rd0TLi87sKWFAsASBuXwnBQnuXp
         QZsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=aac6RI9qOaZKSVRWcJWmXw/3ZjmmA0PhS65KUQMelMI=;
        b=qsx5t6EdRdAhytFvZc6TwrwtB/xpFAGRmdviXjMS8Nba40ozjXXSnewgqtqk5IBNu+
         +hqflE/n03gepN7DAskoEZ3wzrhljeMT3GkjqGGAoLwfDHrpubt/LEKhmqMpR3FYqaBH
         tbaSCEWsluXkGSWg53W6CJww3R919Rvy/a3/malXm+rV+YToK0h+a1TUb3sQkz09HqQ+
         FyBycgRbuH3ucnpmL035OfKBEotLwepdzfT1Oi4a19xPVcaZi8SOVElMWYAq25zvOG4L
         DMRzftGdZ3IR5R9Ea3SBkcrQVwDG8B8gM5kYuXJqYMC1i4eKiKUin/ocoYItVLY93C+r
         u8VQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XUjVy4su;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hg25-20020a05622a611900b00341348235dfsi4603847qtb.683.2022.08.22.10.12.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 10:12:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XUjVy4su;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQAxx-0007Rx-Oz
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 13:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Oy-0004lK-Ia
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:48 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:33739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Ol-0001f1-6I
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:41 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 ds12-20020a17090b08cc00b001fae6343d9fso6045606pjb.0
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=aac6RI9qOaZKSVRWcJWmXw/3ZjmmA0PhS65KUQMelMI=;
 b=XUjVy4suW3oWB3SlPYbZjDVmFJT0/I528Jl4OV+CfyhIHItqjNguyVJgghyiw0PJPt
 QO0X9EXuJb+Af07WvMPqup8vqHV834ssuWortY7uAxeZ0XXqdKQ0MJF6fNSK35sMFGSJ
 cmT4F0Y9T15Sth6Ecwafaj+v6sUaJDHuG8ojv8HMrhaPOGEfqjHzt1MAXzKGEC1/MrNk
 HlXgw6hZ0nB0rp7dxfOUn1w9KiaV9hFRYvfFKP43f6fc02/5GWtgIDJE8a90w2KQTWjC
 2PvIplaqSMSZY0mpRlKrmpbfvrZHUAGaRQUV0UWzWFMKgaMSzgg01O9/XZygRKRC5SOl
 mOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=aac6RI9qOaZKSVRWcJWmXw/3ZjmmA0PhS65KUQMelMI=;
 b=epq7REx+B7Byxfl9bdjlU9SwcHriOnqRvrlNcAX4ZNNI0V6DsL5PgUb+VbuPCAEbrO
 vxw2NcWMVy8QmW37alWNITUFS37S7ekxiYaaOo+bsFNy36X0MfSlhp/Sb7amvonAlL65
 G/izTg48eqPRYOkKk0sEQib9cjl2dTZ++CPdCSrB4F/pusNRXXTtKVY7aIVYiAG09Crz
 QpS2cfnoNLVx8JD0AtiKhVnUCqXTR4NyTioOaPfAYLUa8qxe0RmA5MB1u/FAmSZd0qMg
 01lF0/kI6/qzcUF14WWmo5s6hwsSpqqXEctwh0+IaAWAMM+xnvbgUJzkpp3tvsjz4VF6
 CN1w==
X-Gm-Message-State: ACgBeo24MVsusRbGQWfcV8/ChrSag+o6jh5ztn+m9JcQE1iMPaYA7P2u
 6r8LyIpStn6oN6bCKW5Biqw+/AqnXzCnvQ==
X-Received: by 2002:a17:902:e94e:b0:16d:12b6:b9fe with SMTP id
 b14-20020a170902e94e00b0016d12b6b9femr20459519pll.152.1661182289624; 
 Mon, 22 Aug 2022 08:31:29 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 i6-20020a17090a3d8600b001f262f6f717sm10353835pjc.3.2022.08.22.08.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:31:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 53/66] target/arm: Use bool consistently for get_phys_addr
 subroutines
Date: Mon, 22 Aug 2022 08:27:28 -0700
Message-Id: <20220822152741.1617527-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: B0LtwW6O+eDf

The return type of the functions is already bool, but in a few
instances we used an integer type with the return statement.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index e13a8442c5..46f5178692 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2380,7 +2380,7 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
                     fi->type = ARMFault_AddressSize;
                     fi->level = 0;
                     fi->stage2 = false;
-                    return 1;
+                    return true;
                 }
 
                 /*
@@ -2401,7 +2401,7 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
     result->cacheattrs.is_s2_format = false;
     result->cacheattrs.shareability = shareability;
     result->cacheattrs.attrs = memattr;
-    return 0;
+    return false;
 }
 
 static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
@@ -2412,7 +2412,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
 {
     hwaddr ipa;
     int s1_prot;
-    int ret;
+    bool ret;
     bool ipa_secure;
     ARMCacheAttrs cacheattrs1;
     ARMMMUIdx s2_mmu_idx;
@@ -2490,7 +2490,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
                 || (env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW)));
         }
     }
-    return 0;
+    return false;
 }
 
 /**
-- 
2.34.1

