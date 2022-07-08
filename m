Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp354902lft;
        Fri, 8 Jul 2022 08:57:53 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tQHBUKK/A+yoqodXbc0VQ2voi7Hw9Rd6e8vtVCHMKvXytgA0wQbQhZLrRH49m358D1xeMv
X-Received: by 2002:a05:620a:448a:b0:6af:3a05:f73c with SMTP id x10-20020a05620a448a00b006af3a05f73cmr2978372qkp.72.1657295873420;
        Fri, 08 Jul 2022 08:57:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657295873; cv=none;
        d=google.com; s=arc-20160816;
        b=ZwCY1U6aD0kzRrokPn3u2CwYfNA6Dx1qf0lJNEXmElw0TtUMt2VeA98PngHVhgLT5W
         sAIUXdLlImeA3j8Q5Qj0vaxOLwEKXy5ioTU3leWqiy0qYZ21atZq/tfXK3iSYYXRw0FU
         sQAAhcTkz3KzhF5b0UKK8oVYO8Gma9VgH07UK4bQREKiwKLQbykd0f622XBF2aUgEZng
         aCkYj51j7YOjmjw7UDOcmr+py5m5bzJ+uggxspYeCWHooCc/ZylcwQlVO5dUK8WY4cUN
         WiEycMtKdTnoGyrswSrHH/OU21VMJ2x/Vhw5jmLJpZWQ7iPgWfjK/TBgvK6o0DXF5RCb
         YiQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5PME71S11cSPKZ4C3ISqAJ4KA5QkjnbMhk+jE1tP2f8=;
        b=js0Bp+Q++t8pv27HCPdssWLp1iHwk7eYqbTYMptJ++nsxSYLwBLmyvc/cYreXZmna8
         w3cH9KTjiidYCM1pHGFImmkcXOSX274Gk9eoemwlMbo87cj56/7WLbxjYnDzEHP3h+Cq
         uCU62SE1MjPc+TS4oPW8Q+axFYV7g3g39cZllFClwfPmnOWXV9QVlKauoCVv/OuvsY/k
         yIGuCl+aHA2eQBWMboyZKD/BLeI69X75FV0Z3gy1+X0FAsVScupQ8QkLa3ZEYPomRlA1
         dKLzUeN9gM9FkI1IPdgQjG7R/KPWQIYajwfhBPEF00l7NMmZUkOAhRN8uu01l6Mxmki9
         VYsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SvXHXwwr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gd13-20020a05622a5c0d00b0031ea53f6525si1341746qtb.54.2022.07.08.08.57.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jul 2022 08:57:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SvXHXwwr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9qMa-00082A-OO
	for alex.bennee@linaro.org; Fri, 08 Jul 2022 11:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pjX-0004Pq-Mh
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:17:40 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:34508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pjT-0002WI-U7
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:17:29 -0400
Received: by mail-pg1-x52f.google.com with SMTP id g4so22628990pgc.1
 for <qemu-arm@nongnu.org>; Fri, 08 Jul 2022 08:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5PME71S11cSPKZ4C3ISqAJ4KA5QkjnbMhk+jE1tP2f8=;
 b=SvXHXwwrb9UIIWa/IQI8vlHZiYEKQYfspABMDonF+Wqb7Zmul6sWgIjcs0m7hSFltQ
 Ntxrh6838agLRvEL9vNHu15nVOwOLkoi40QBMojgzsV3ErZQjLXpKZNy4SJRCNOIAKsR
 sCTJr0u19Q1ipUgteeqDQVSAsJAceVmmBwAAHna4Id7veoXbHwaDhFblSVxpXLpJGSte
 cPi0OKjo+OkbkFAunHCS2PwFGBx7wEb5WxUWfUNpTUw4rzCs0diFuRmuSJy8tPLKGyCs
 TlkdZX1LOK05AB4XydiQqracouR7Sez/oWAHJcgg07lpnV30N6i45MPfauy00+OSC1A6
 5VNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5PME71S11cSPKZ4C3ISqAJ4KA5QkjnbMhk+jE1tP2f8=;
 b=iG9Xgj9qXyD5fwAbv9GbgEsScJh8G1kLJI3kHKapN12weMSpf2XJ6K/ghWWQiYhbVj
 UILrRMcL1o23afVG2UA0GTaby1pQfsB7ZKOw73DqJ+ATNUbVCMwvNd5ccfsH7C8svY3i
 uq+mszP69PqTgm81KJM6ph60JWPne0t893CVwE/q035PPYHPkZ0yuHWsmoni5q1RnzRp
 SX8R62a2TFr/YyVnd7Q9vIOi1m2qlulveP+dnUEl3Vfuno3zSrcDCrVmyDavw+ST0Rpf
 I9JVbGxqZ6yx4dx1UmgskjjkYXGbrqrEYsWDQ/FEx4q5izIOdJyKFjP9u3Y+lOb4/edW
 nlkA==
X-Gm-Message-State: AJIora/vVXkh6uHez0/gYn2zyYlsmfr7RCuPFyspChRJlcVwxDN1OYYe
 5qVSYpIToE9XyA5VeBL2GKxHFw==
X-Received: by 2002:aa7:8895:0:b0:528:c6c7:c603 with SMTP id
 z21-20020aa78895000000b00528c6c7c603mr4542097pfe.46.1657293445432; 
 Fri, 08 Jul 2022 08:17:25 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:17:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 33/45] linux-user/aarch64: Clear tpidr2_el0 if CLONE_SETTLS
Date: Fri,  8 Jul 2022 20:45:28 +0530
Message-Id: <20220708151540.18136-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0PLRZS2YTZ+7

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_cpu.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/linux-user/aarch64/target_cpu.h b/linux-user/aarch64/target_cpu.h
index 97a477bd3e..f90359faf2 100644
--- a/linux-user/aarch64/target_cpu.h
+++ b/linux-user/aarch64/target_cpu.h
@@ -34,10 +34,13 @@ static inline void cpu_clone_regs_parent(CPUARMState *env, unsigned flags)
 
 static inline void cpu_set_tls(CPUARMState *env, target_ulong newtls)
 {
-    /* Note that AArch64 Linux keeps the TLS pointer in TPIDR; this is
+    /*
+     * Note that AArch64 Linux keeps the TLS pointer in TPIDR; this is
      * different from AArch32 Linux, which uses TPIDRRO.
      */
     env->cp15.tpidr_el[0] = newtls;
+    /* TPIDR2_EL0 is cleared with CLONE_SETTLS. */
+    env->cp15.tpidr2_el0 = 0;
 }
 
 static inline abi_ulong get_sp_from_cpustate(CPUARMState *state)
-- 
2.34.1

