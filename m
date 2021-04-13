Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp5015111lfr;
        Tue, 13 Apr 2021 09:14:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmuJ+a6P8jXHuDS0cb0RVA+l6cro1DNWYYhAz6YXxOi/QT2RlyahbR5RtFbIPbQO1aYPED
X-Received: by 2002:a05:6602:1228:: with SMTP id z8mr17879053iot.152.1618330447519;
        Tue, 13 Apr 2021 09:14:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618330447; cv=none;
        d=google.com; s=arc-20160816;
        b=E03f0CaqJ7miOuz0TSqdDT6VKCfimbjfAsLqWrOlw0MbFouSi2g2tDHrB+WE9Cl8gE
         4pwPUUEVuPW9qM6QPZ3F/Pn5NVMe/sBAemVU/AuZkIsgIYYPH6aEguR6vPYgLWzrbdDX
         gwiM5BtBqVkvB5Fkf+pn+ObV5+LnjCpLLBIaVxyCaVl6z7DbVC9rdd2tQqSvDTWNmyiD
         +UMcevUd1MF6FmJEEkhKW6K9qJIPGwbaigx8YdN4MczYXTHRWtmFDnpruuC8+pOA1yTw
         n0kQWgiJCtBYfTCvrDlCjVxd/ZZhd3181mPhR+WSEDZtVprZ2hSwthty3Q2fHBFKOSVX
         0fxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5ISJxGiSEndrQPbaMd1tRW88KFlIeWIQwxD419HUNGo=;
        b=H2V7Amt1iynCpJrMk37t5g9UZ7lkUa+ENe1mXeuHRzCXvGnPdzOCIvW13pL7dIa1VT
         8rMKUj78xwxlRiUaQtVhME/Dkhkb0kY/5Ifmf51Fh1r4PpF/pTPn0koQaGRrN6K4ZZvr
         dxPODyYuzJuAmEHsPv4aBsGZUufxjxJ+IF1XzYATZ9mbxXgZWoUUb3X3V1518q2uWSj3
         GUqNbw6r6pnjgDgimxblbA38B29ANthU/SZq6cXWNn/y+AZMqNQnDzXGon1Ks28Q86m4
         8ZU4mHs0ww1BiqlFDqAvJZLo9yDXo4URdhxQD96SJ+lvQahVUxm5A2bYP8gGPV9Vi3mW
         Wjrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qhbhKrJY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l22si16730960jad.0.2021.04.13.09.14.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Apr 2021 09:14:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qhbhKrJY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lWLfy-0005BP-Ix
	for alex.bennee@linaro.org; Tue, 13 Apr 2021 12:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaW-0006Li-MW
 for qemu-arm@nongnu.org; Tue, 13 Apr 2021 12:08:28 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:42792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaR-0006w2-2f
 for qemu-arm@nongnu.org; Tue, 13 Apr 2021 12:08:28 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 b136-20020a1c1b8e0000b029012c69da2040so1659102wmb.1
 for <qemu-arm@nongnu.org>; Tue, 13 Apr 2021 09:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=5ISJxGiSEndrQPbaMd1tRW88KFlIeWIQwxD419HUNGo=;
 b=qhbhKrJY7mePxxUGTOJ/zvpsXCMkA03r9BorTj11FUiQDxq5KOllgGmcs6vtYHWpkX
 o7kG+y/AbN3OEbZhNh/wIC/5/ykZypwgfDPNpwP/yg+sEnkPTCTQ/8KIAuF+5z4HMC50
 77X+4fqh3lXkZOQzqLkTV9attckN789b5iG0RQvIsM1js5u190NscsM3c7PI/+n/uJsk
 3BFbY9QdOP44MZBpE/hnRReNfbxdpSZTgvKKKf+qSKitFZhGHmJPOgHW5FagE/1vo6qw
 Sb4FVW4Z/nd39zsX8waLkwLXFOUIzV454Vp6kjhSkFu9PxOeuG8zj+HI9b+8NmJwYhW2
 Xa+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5ISJxGiSEndrQPbaMd1tRW88KFlIeWIQwxD419HUNGo=;
 b=DCRaKscVfKZ4Z+bIA+LvOoRmeb/tCvGp6xya3tWUOv9iNYNGZtWO6BpEwPZt2urGpG
 WZIttfgQUwQJx9YBclxivwQ43+NtsfCD8yPiUGkRMz0uqOst+G/0Oytp4aFmK0y3KfvP
 TXhZ3zyYotQWe5CL3wqpKrg1Jx/s6D0hFmxuW7EVGMkakYEIYInaDrkNXolzi4j7rjnK
 0+eb3Gh2UZnCO8EaSCvTFkxuL1XEF9eAsB3XwQ0t4zFVkDCJdWKEYqr0K0E3t+nYN9hh
 fu6XCgwmpImhstBik9FnwBy9LGBkxfOJGaM8kLzo7zxgkHEeNypRe7Bg5DzoopbINq2J
 phLA==
X-Gm-Message-State: AOAM533Kg/eM9LEXDCI+P9WawXx4aVksEr+EyZK4daCCGVoaooavYaSu
 1osHYUUULGDtDm9ED6FWX80QsyW4oTH1UTs5
X-Received: by 2002:a7b:c204:: with SMTP id x4mr753841wmi.136.1618330100224;
 Tue, 13 Apr 2021 09:08:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b1sm20810888wru.90.2021.04.13.09.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 09:08:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 10/13] target/arm: Delete unused typedef
Date: Tue, 13 Apr 2021 17:07:56 +0100
Message-Id: <20210413160759.5917-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210413160759.5917-1-peter.maydell@linaro.org>
References: <20210413160759.5917-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5XhjVFdiMHZW

The VFPGenFixPointFn typedef is unused; delete it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5eece97584d..7439c56d34b 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -69,8 +69,6 @@ static const char * const regnames[] =
 /* Function prototypes for gen_ functions calling Neon helpers.  */
 typedef void NeonGenThreeOpEnvFn(TCGv_i32, TCGv_env, TCGv_i32,
                                  TCGv_i32, TCGv_i32);
-/* Function prototypes for gen_ functions for fix point conversions */
-typedef void VFPGenFixPointFn(TCGv_i32, TCGv_i32, TCGv_i32, TCGv_ptr);
 
 /* initialize TCG globals.  */
 void arm_translate_init(void)
-- 
2.20.1

