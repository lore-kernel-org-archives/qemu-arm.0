Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp867208wrm;
        Fri, 11 Oct 2019 06:54:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyJ2Ogqm3En0ZhK5ATQLA6sb89lSd4DVxSyI00ce3bcLoHHPonFMaYq22gBqzDCIQYjzzHM
X-Received: by 2002:a37:6156:: with SMTP id v83mr14499445qkb.99.1570802070444;
        Fri, 11 Oct 2019 06:54:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570802070; cv=none;
        d=google.com; s=arc-20160816;
        b=byYeOzm857LysP2cCjwjE/T1CcCVvJgXnGdsKFrSvsyAZNZZEx+aaHApOLnU4XF34T
         bulL4jb0+TW7yidefOZ4YNC+vyKJLXRU4Ai6dmcUMruUe9LbeOaKs4znzxau9XTVjaZl
         cP/SBolwtVdyq4IUeI+JZdKKVpmpIgi+zO+zU6LIbKOv5GcklbIDuZLGQrkFg0jHIVw4
         YjULa/BcRZ6oHuIwmvZaE3dD/ZAXjsaw86SJK4DyE8CFrUKaQ7YVKUatvbSj7kO7w9GQ
         Y8BPnvEQGoTDhs7ju1yISJbbXpoqxc2+pzKa4rJjBOh03raQPIJVRPyyoNAVau0pvFJ7
         tNnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=loK2jdE9Lal6vbE+5e7UnQvjF9Y+wxx/GDkdqZVvRmE=;
        b=tOgeyY3CP6rFSBqTLnZGKeQCPoE5K4079+hm6yq+olipqC2T7GCqg78YyFqEoYmG8X
         tVUseDmLfl6TfBNN3d+SCwzXpUzUCFR+kz7+KWr7HiHfy5QCkVH2TW55vZtzKIDdHH8f
         U7895lQoGcErQOt/w3lkILcoM0nt+udZp1YrL2To2+fGWdiiVO0BL7evpfZSh9F5g0FZ
         4pQXk6xlOo1zl2kcgfAiANyFqpRf8BdtGHfUPkVEvzu+fDefTSot8hNMNsT4H7LeppgL
         sppL0+R74d6764pm4KO0Q4Zrr777GQZNB3nSSwYfIIHMhwWWjS62RQYg8GqnDRtB5G4Z
         Xf2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rgQUFRww;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y32si9491322qtc.203.2019.10.11.06.54.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 06:54:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rgQUFRww;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIvNF-0002Ez-H7
	for alex.bennee@linaro.org; Fri, 11 Oct 2019 09:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39061)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iIvJC-0005ms-Ak
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 09:50:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iIvJB-0003z8-Ai
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 09:50:18 -0400
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43]:33833)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iIvJB-0003yr-6p
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 09:50:17 -0400
Received: by mail-yb1-xb43.google.com with SMTP id m1so3125137ybm.1
 for <qemu-arm@nongnu.org>; Fri, 11 Oct 2019 06:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=loK2jdE9Lal6vbE+5e7UnQvjF9Y+wxx/GDkdqZVvRmE=;
 b=rgQUFRwwaWMEgX5YCcnaVMpy3V0hXYTFShehuEbdsWzUWaJmEQlOeXEtWM1y27D7mM
 CSUMBgNLjfDQL/gi5E+/8rgfOt3WmIoZs4N4b6au6hoxDwnvhu5uGFooADfmlXnyWJcY
 mS/yl1wyPd1OllYK2lTPH4jVTwQ7eLiX+tGFbZF9f2vwWZbGAt4YeBGp4eP9dUYua0hD
 Y8h4whClCNhCo6tZoN46BceCJO8hM5113fOqxFUWzV3euz1kHcrs/4VSquCvjYvak4sn
 eWsLuCvjZhzCsb+mENz7ZvQa77x/xbXpQ47GS9SPXMhnGk81Vv282w8LwV3JW1qIY8cN
 bvGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=loK2jdE9Lal6vbE+5e7UnQvjF9Y+wxx/GDkdqZVvRmE=;
 b=bme07YSOP+najXtmiqWrK1iMEnCuhW30T+Eo9eu+7Ct0I7mBu+ZbOCvSe3BFGR5UB2
 K5xVy5qw+VpAxOS9pmJ2dQBxBwxHHTZbvScVRWWNzNDBSbIKoUMx4fgd/z2B1WSxgJbc
 yIs58SGdUmL1hIbcGF56jBfSqYW4QTpRg5o1BtCEcJWZaJUW4yzBY32e8qLYT2Bjk/26
 351NGpRTvWPB7g7rx8hm756UyAn/0tc2uxkZPWV4KA0JyshmYCx2zso6ZVFKHyGuOoCw
 FBEekLAtuRcGCIIbAi3D2OYUdlO94/MT2tYVwiIO2wJWW80bw2aIG3nINIR+OqQFGSoM
 toyw==
X-Gm-Message-State: APjAAAXkzU4wZzJM8VxDPAK9+pNApryko/bHh+593K8hrpXF+QsgCcNn
 eb6RNctDQev4h5uG/HZ80mN0fA==
X-Received: by 2002:a25:cbce:: with SMTP id
 b197mr10026823ybg.355.1570801816528; 
 Fri, 11 Oct 2019 06:50:16 -0700 (PDT)
Received: from cloudburst.gateway.pace.com (67.216.151.25.pool.hargray.net.
 [67.216.151.25])
 by smtp.gmail.com with ESMTPSA id f68sm2534000ywb.96.2019.10.11.06.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 06:50:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 10/22] target/arm: Define arm_cpu_do_unaligned_access for
 CONFIG_USER_ONLY
Date: Fri, 11 Oct 2019 09:47:32 -0400
Message-Id: <20191011134744.2477-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011134744.2477-1-richard.henderson@linaro.org>
References: <20191011134744.2477-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b43
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zb/SHxTFOh0A

We will need this to raise unaligned exceptions from user mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tlb_helper.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 5feb312941..29b92a1149 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -10,8 +10,6 @@
 #include "internals.h"
 #include "exec/exec-all.h"
 
-#if !defined(CONFIG_USER_ONLY)
-
 static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
                                             unsigned int target_el,
                                             bool same_el, bool ea,
@@ -122,6 +120,7 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
     arm_deliver_fault(cpu, vaddr, access_type, mmu_idx, &fi);
 }
 
+#ifndef CONFIG_USER_ONLY
 /*
  * arm_cpu_do_transaction_failed: handle a memory system error response
  * (eg "no device/memory present at address") by raising an external abort
-- 
2.17.1

