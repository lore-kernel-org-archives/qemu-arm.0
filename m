Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1033692wrm;
        Fri, 11 Oct 2019 09:12:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzlG6Mmjvz+/ssjBDrmPPiAchmokllc8tStKDWu0reOrlR54Ri/D/R0IInM+7hxJ1Pm55fX
X-Received: by 2002:a17:906:d971:: with SMTP id rp17mr14972496ejb.42.1570810379552;
        Fri, 11 Oct 2019 09:12:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570810379; cv=none;
        d=google.com; s=arc-20160816;
        b=lWthmOZdXI1BnAYCLLcqQ6pS7kqC4I5wduyYZXgd7AO2GBarmkY+1/81xWrIvN1udp
         rg8KFGj318Ok0Gu+pMhb/+e3qgSM8p5zO/tQNKV1DLBAszMoU+gijfH+hxUhl5z2IXov
         mg3kdEmFAIUOIBtIEsefyaT74Dq7dWt4+hYBtm2sCkHnDEVzWnOn7PxWa4GIUQBBfkCO
         XpRgJFC48v0hQAQBUy4rm0qkiEdcrDje5HPymrC9PBQYNEOnYQp2+Uit2cbXC00uzQ/q
         ciY5JK2ZWUxUOT6aKL1MAAoH1PpbMqqeMx2zCL6leoWA9ytk0M9r/LwVzAw1jTnJ7lod
         JV8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=ReDLvA+WR/T82Ne1Z6mUqgY0iX8aRnhgEWdNBPA2eNw=;
        b=wllTgpA+ZmQ1S0xlSV54n9t88NWIbmGSTtRdwGTWziRP+y4Ksz0ZwD+2a4jp3LbIiV
         /yUsu2D0pcPH+ZYM05pyO8v7OV0xPjrCsXXXmukxX6Zss5zxGXOjT0XFCFvs1GXkcJHw
         6gguW+htWgKYir+uudv073rEdZHmMkA17ljAkF/hXpKPNTfr+hN4RskH5py98dqAnO1Q
         zPmn9nauoI9/gciXXyAbsRJc3ziavzDK0R/SyVYnH2nlNlnQZoHKnMFJMdwiY6P/Du26
         Web4T1GvWGHdvCt0RJO053JN0sTm55OSFSvAh+I7QJLxdFTUAjoyNRcQsAX6iLz9g66N
         X1Xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wswCKfzZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l18si5457313ejg.248.2019.10.11.09.12.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 09:12:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wswCKfzZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIxXE-0006is-WA
	for alex.bennee@linaro.org; Fri, 11 Oct 2019 12:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33860)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iIxGv-0002b0-VX
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:56:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iIxGu-0007lG-UF
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:56:05 -0400
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:39344)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iIxGu-0007kq-QM
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:56:04 -0400
Received: by mail-yb1-xb42.google.com with SMTP id z2so217174ybn.6
 for <qemu-arm@nongnu.org>; Fri, 11 Oct 2019 08:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ReDLvA+WR/T82Ne1Z6mUqgY0iX8aRnhgEWdNBPA2eNw=;
 b=wswCKfzZ6ZGMe3YYDoaISuVaqu0ShmUFqHtawTQxD6dxDG6iPuTssqczv+YrA9s6Mp
 u6fq4eIgOF1k20SRumbKrjDvmQQJPtU3CXf48TBNADU5zY4gSLZZvk94IJsACbmgKgXO
 alE0vPdweclCXnEGNWkuE5gqhp+R3Sa48tl0lWotAhebsNMjgw2hp8uLifNQNmj06Q1q
 Ixf75bivWH6cFM3ioQyysonDMftMFv/fKzqmZ6LI3kjGWdk9Gi9NcdVUkCx7Qi7c4AAt
 SwVn7GCirvYX2UyGVPQSDkiuwuV6+7cqkcb864jpkTSWj5L4H4FPlEX3l/MDuYVdamox
 QLmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ReDLvA+WR/T82Ne1Z6mUqgY0iX8aRnhgEWdNBPA2eNw=;
 b=UOF2nc+YVIqXQOpRkmneJenE8+J4OuDdxs9rGjnQ9tg/h7uEtL0zvYtJrngJN4FihR
 zBvUmk4tlPfC1Gky0RxsRxa99C/wRHTlBuZKkM4BHzGd+dk1LMrj9uGENj/WbCASj+2B
 9ONn7ip6zWWCLg/PShRhEZUCOVGTU6WUKgIwrlLUgw3X6FXFL6B2jAr4P+9oP9VFYc9T
 PoxfiiTDAS0uiP0YzddRft/dx8p9URiuo/n9HQtQlPnGeovPLo3qev+0C52M8Z98txrE
 iWHxiwScwiZy7n1PfnLOWtszO8TfZO9IXxLb0xr0xKVFfHxBB5q14hujtN8cgvxdRPr4
 dfpw==
X-Gm-Message-State: APjAAAU5Jt/PL4+XUoi/vi/D3Zk3vPlFitKiLimXKdVt7H25QFGRF93p
 NTOzpPrQX7uMj+Pu+KXwyEGRQQ==
X-Received: by 2002:a5b:30d:: with SMTP id j13mr10598348ybp.308.1570809364235; 
 Fri, 11 Oct 2019 08:56:04 -0700 (PDT)
Received: from cloudburst.gateway.pace.com (67.216.151.25.pool.hargray.net.
 [67.216.151.25])
 by smtp.gmail.com with ESMTPSA id d17sm2473139ywb.95.2019.10.11.08.56.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 08:56:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 14/20] target/arm: Hoist store to cs_base in
 cpu_get_tb_cpu_state
Date: Fri, 11 Oct 2019 11:55:40 -0400
Message-Id: <20191011155546.14342-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011155546.14342-1-richard.henderson@linaro.org>
References: <20191011155546.14342-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b42
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
Cc: laurent.desnogues@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TuMgwCjjW423

By performing this store early, we avoid having to save and restore
the register holding the address around any function calls.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3f7d3f257d..37424e3d4d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11225,6 +11225,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
 {
     uint32_t flags, pstate_for_ss;
 
+    *cs_base = 0;
     flags = rebuild_hflags_internal(env);
 
     if (is_a64(env)) {
@@ -11298,7 +11299,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
     }
 
     *pflags = flags;
-    *cs_base = 0;
 }
 
 #ifdef TARGET_AARCH64
-- 
2.17.1

