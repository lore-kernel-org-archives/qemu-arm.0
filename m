Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3293791ejc;
        Mon, 23 Jan 2023 16:01:04 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs/9osG90EzNF8R6F7ZvvN8xD7rax3+n5qs1sIuuR6nIyJYCUAftRFr6F9a50CDf/QU1EeG
X-Received: by 2002:a05:622a:4a83:b0:3b6:3931:640d with SMTP id fw3-20020a05622a4a8300b003b63931640dmr39354425qtb.48.1674518464543;
        Mon, 23 Jan 2023 16:01:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674518464; cv=none;
        d=google.com; s=arc-20160816;
        b=HQlqOC2SlsB37M9LmUArHlkXkVhYyUmBFmh+K5HCYrUpo35Q1MZe+U0EkCeQUgR6Dw
         Wc4kw9gR0Il3JSw27zLD58BoxEASe/9F/0jFTUTC+Jn4demaVyKiYZSX6a+zDuGQlRFR
         ODPssv0U7FiZgQ3BJjiO6csZqxajjhfTxoBMGh2MkhGpFzpePq8P2JD2SZLVRSKPUAAV
         ynfjDnKDzuvf/7fV6QTWPlfgRtlAVXrH5gZ+qFw5NecJa3eSEnz0wE9c97ai2d77+7HL
         1Idp+oPme/AvFo2lgVDlNpPSy1zO+0tjLvyxOuvotXANPQg72ieK6vmKW4bTo7PB9X3p
         Nlag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WHiUfCNScuj5b8UaTFKcutwQlH91thfqJKII3X2ibc0=;
        b=kaTjCADuwwyzvOXp25Yi0EkShnPgiWL/Df6hKi5Zb/yBaWe6fw4o2O4+yI6e7fdrmX
         QAsicEIN8m4RHepQZmnoBV8MK69kcIxdQMrAq08lSDqot0+8UVFRrOMV0ERGG9BgEIvn
         aQiJwi6WLTJOngUqfpMx7pbsjmAcZshJCvJgVV3Oa91fbqiVyZANoqgcjuuqVdHYYIsc
         I9VxtYNkCvYRTudZhPeAklb30HIhMd2H0eC6wXBCu8CvOHVi38NvpzrqSjXxaX4HF1hv
         uqjZe8X0VV+DFNVJPcn010J8sdXLw2wLM9/+7NHs4cHlDnFrjmEgJhm41uBHudZHokM3
         ICMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AQNAHJLC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j24-20020ac85518000000b003b630226888si273139qtq.551.2023.01.23.16.01.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jan 2023 16:01:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AQNAHJLC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK6kB-0007yn-87; Mon, 23 Jan 2023 19:00:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6k8-0007mi-8H
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 19:00:52 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6k5-0001qI-Q8
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 19:00:52 -0500
Received: by mail-pf1-x431.google.com with SMTP id 20so10083392pfu.13
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 16:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WHiUfCNScuj5b8UaTFKcutwQlH91thfqJKII3X2ibc0=;
 b=AQNAHJLCyoCkg074RzrDdBWr27u1dLXHQp4dCNyWB4U7vd1eCsSoMtRUUCe0ZlDfNg
 IEC/lWygI6T/Xkq9PIwsPwxO5eWJss1npOumWERbYaV1hS/9Sj1kzxjjDtl4IAo9CbTj
 9S/I/8vE3NIf/l7kXoK/O3uNe6f+qjKXmjKpUxcKRUfADmpsUL/KujG0Pb3Yi6sUmtGm
 NscBqqid2cu9rpOGOy0hb3J8ZdHp30loWHL3nW8rCwswfonV890lfW4N+P49gLIcGrsT
 8wB6U+boad38BOUKeKOWLDQKriWoFm1+VVbguXNYimm9K/vU/xuXyLreEhxdSqxHV519
 h54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WHiUfCNScuj5b8UaTFKcutwQlH91thfqJKII3X2ibc0=;
 b=g2FbghyL/IWipRHMcNETpSbKjbEhfkFm8lfRIJTLHwF07xWhaZvpx/cc0miW5uq5Te
 CKql62pR/R7lQTPkREbvVxa4z+qJ6VI3J4d/WtZjf1bMKecDN8kZAWimKgTrWEvSsCtW
 xPZaxNG8CJ8HDtqTbMHnZJTVKQ832jxL7ttAllqlR28oVZ9HS0JdaOGW4up5tN3ikm+k
 l95lNbIYPQG1uEZr6W9g8Q5SyBQZmWUHgiMrUi32A5+kfYw427ywMApO9DvbTxsHbe0B
 r/UuCd7udbM6m4F5ZdXQm6P4aS8OK9cB2kkRF9rH6Y6JFxqQlcNkN1F10dxIjjwyg4TB
 BHQw==
X-Gm-Message-State: AFqh2koPVcGFsBcRXgYo2+59b5DsW8yukFROsfhv0d6cGokpAG81cFRv
 DZOxE1KAbq5SjiglcGh3+gGKjKnq6jk+pp/s
X-Received: by 2002:a05:6a00:300f:b0:58d:94a2:f404 with SMTP id
 ay15-20020a056a00300f00b0058d94a2f404mr30318795pfb.12.1674518448351; 
 Mon, 23 Jan 2023 16:00:48 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a056a00189500b0058bc37f3d13sm174104pfh.43.2023.01.23.16.00.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 16:00:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, yier.jin@huawei.com, jonathan.cameron@huawei.com,
 leonardo.garcia@linaro.org
Subject: [PATCH 01/22] target/arm: Fix pmsav8 stage2 secure parameter
Date: Mon, 23 Jan 2023 14:00:06 -1000
Message-Id: <20230124000027.3565716-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124000027.3565716-1-richard.henderson@linaro.org>
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: F/BkTVWKefJp

We have computed the security state for the stage2 lookup
into s2walk_secure -- use it.

Fixes: fca45e3467f ("target/arm: Add PMSAv8r functionality")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 57f3615a66..b0f8c59767 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2727,7 +2727,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
 
     if (arm_feature(env, ARM_FEATURE_PMSA)) {
         ret = get_phys_addr_pmsav8(env, ipa, access_type,
-                                   ptw->in_mmu_idx, is_secure, result, fi);
+                                   ptw->in_mmu_idx, s2walk_secure, result, fi);
     } else {
         ret = get_phys_addr_lpae(env, ptw, ipa, access_type,
                                  is_el0, result, fi);
-- 
2.34.1

