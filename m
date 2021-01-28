Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp622584lfo;
        Thu, 28 Jan 2021 14:46:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyH3/3yo1U9oRhpheiqgF/BYzXmjHnxVrzrYd+OCLDU7l3iGsvlNSKOj/VwYQ0WfaxDiys6
X-Received: by 2002:a25:c6d3:: with SMTP id k202mr2111283ybf.284.1611873984671;
        Thu, 28 Jan 2021 14:46:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611873984; cv=none;
        d=google.com; s=arc-20160816;
        b=TdjFeIzes7X1BAHcAHtcJrYCRypXc5N0tqbPPeNThqrVkrZuBZYAAg8rmLDsysgtCV
         dXQmfEfKJ5xp55CWgbKzk+MbBDqun2rwFqxDppEw/zAv0JxzFWkHYk4Qw7BFtDDB1W2s
         lw04rU7jHfNAnzER/qH+/Sz5Wu5DHlic+eFG+ppm9J8afwOdqkkjv57LUfBP+8o4UZ8R
         4rvv/QeUeCxtC5FUzakTPYCxIX430nVmBlrVTWUYXKkzbO/xxVn5Kvp19poFiydiVNNL
         VLKRgwnA/aK2aYKB6vMctfdxc7+sdM40Zj0oK9Y5mPEJJeOYjysvEdKvM7CxD01GmmYU
         tFyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=yAOD8rB2c9GoNvNcKMZwjdplIAr1RvdqOJ4SbnIjxU0=;
        b=VU8WMoQjqjXYpIdsm0IAeDX+GL6r4u4+WIYIZ1UoXCk578ZhgMa6h9bj8EDBeO3XU3
         vVPJWP9E1TSJ6ZtFEWHP0eIJ8LHt5HEPhgdAh78ev8yQ58CTz4rg0waANR5mvVq0RYjp
         mwXNV3yzw5W843NAqc/35MRXwmcHU/BAZMFclqyVKOV7MmqLeOHHu78CIbNNezqh1NpN
         KGO0K6c/ysnUGNbLLhcI1uL4XMNO59hir5QHXUZavLH9+aN8Vz+w5RYV8K2XEWBg+cW0
         ZI1allWZKKl8GJjIG0t/UGF8iTcp7anWk2AaUN+Z0A8y2Zg+gr02q5gaAxhim8b1cQT3
         7HAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="R/F3YyFC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b25si7715717ybj.251.2021.01.28.14.46.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 14:46:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="R/F3YyFC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5G3U-0001Mj-1r
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 17:46:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzK-0005WA-J4
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 17:42:11 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:39348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzC-00086Z-6E
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 17:42:06 -0500
Received: by mail-pg1-x52a.google.com with SMTP id o63so5269917pgo.6
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 14:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yAOD8rB2c9GoNvNcKMZwjdplIAr1RvdqOJ4SbnIjxU0=;
 b=R/F3YyFCc8P4RFEKcagFfxMLOvG9vlxwyTklHlikzFx6WPnuKQWec2SILIg7td2fzU
 siH2mWYc7CCMnj+eJF0B1Vixgveut2jo7Gkp8pTi0j65BJQwNvY9Wk1i8kSpJCCRitxo
 YXfGFUeZ+PoJHlJLTCfHOP5unBeerJ+X9jd+1tl0ifjkhOGWY9XaQ8PAgK3H5c78Ij1a
 qDLjKceXJ0esgipHREPO4UGuRZ+VzXEpjn2xkifg7SLO2dLTtzV/ps1Z3s+Phn47H0pO
 OHGfGN7qBSirTQtcKvERMM2v2c77rPhuQ6cdWl4FTgjZQJi+QSCULyeZFwICdhAGjaLa
 JjCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yAOD8rB2c9GoNvNcKMZwjdplIAr1RvdqOJ4SbnIjxU0=;
 b=Ctse1rLzVBYe+qZkEzzeaWBPhLwP05UOvRPRiX1K7B0tQqOBHPYyTDUoR24gN6rL39
 k780eODh7DIMmvEeZWPjiCbE/jrO9QTGTyRys97/RYEDShGis+HFcT1RQbswa7wQtwbr
 NC3D62Lf7dCRxTZCjHvcgvVGib1aqmNz1h4UuEB5mZ55P5i22c3Slbs/G6ZySDYoHcmE
 MSGAj1PLwXW8jEt2Q6w+3yYBMZIO++KPNgXerdNhpl7e9+lvK47TkmEzBsWGjZ2Ol4pE
 wOu+IANdEs2xus7ju2Qp2mJeOfBC8/xFa7LIZD90UgJnZamh5CcM5uuOQw9xerbNMkSp
 Gbeg==
X-Gm-Message-State: AOAM5305ZXdQ65SMR82hPs8HOnwKRY7orARQYF6NUL+k05I3w/zaqYuW
 f/TtPZnA/FDrSSNADFBNRRVGKg==
X-Received: by 2002:a65:408c:: with SMTP id t12mr1532592pgp.157.1611873714714; 
 Thu, 28 Jan 2021 14:41:54 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id m10sm6042358pjs.25.2021.01.28.14.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 14:41:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/23] linux-user: Check for overflow in access_ok
Date: Thu, 28 Jan 2021 12:41:24 -1000
Message-Id: <20210128224141.638790-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128224141.638790-1-richard.henderson@linaro.org>
References: <20210128224141.638790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-TUID: Y0jM6PGjl9GM

Verify that addr + size - 1 does not wrap around.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/qemu.h | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 17aa992165..441ba6a78b 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -491,12 +491,19 @@ extern unsigned long guest_stack_size;
 #define VERIFY_READ 0
 #define VERIFY_WRITE 1 /* implies read access */
 
-static inline int access_ok(int type, abi_ulong addr, abi_ulong size)
+static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
 {
-    return guest_addr_valid(addr) &&
-           (size == 0 || guest_addr_valid(addr + size - 1)) &&
-           page_check_range((target_ulong)addr, size,
-                            (type == VERIFY_READ) ? PAGE_READ : (PAGE_READ | PAGE_WRITE)) == 0;
+    if (!guest_addr_valid(addr)) {
+        return false;
+    }
+    if (size != 0 &&
+        (addr + size - 1 < addr ||
+         !guest_addr_valid(addr + size - 1))) {
+        return false;
+    }
+    return page_check_range((target_ulong)addr, size,
+                            (type == VERIFY_READ) ? PAGE_READ :
+                            (PAGE_READ | PAGE_WRITE)) == 0;
 }
 
 /* NOTE __get_user and __put_user use host pointers and don't check access.
-- 
2.25.1

