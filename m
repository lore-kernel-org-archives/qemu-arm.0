Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2402448lfb;
        Tue, 7 Jun 2022 13:35:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzskWTsOYqKaY0TOYl4fawF8TBxOnVOnnMqkmm77itisM/veWuwIn4JuHf8GalhS5hOvNcA
X-Received: by 2002:a05:6214:4013:b0:467:d600:76ea with SMTP id kd19-20020a056214401300b00467d60076eamr20522644qvb.70.1654634107959;
        Tue, 07 Jun 2022 13:35:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654634107; cv=none;
        d=google.com; s=arc-20160816;
        b=GY9LOfuU8V7H+nQ+tI9X18MaOUop+MPue0IVSJrIxW9lT8jT0dnriDdYJ7mAwJrM3l
         k602bikdKzgxEx2Bd51Oa3KlqSDK2xsfLfi5urPD1oc12CqO6tCftfybqWj12BqVpRCw
         CT7NvlUHxjxJRX8FOF4FYIWAfUlDDRDezYHHUTkHxlIcrRjWNirv2y/lKf1qrXyftI1R
         6IHtoiGmc3uE4Ss2p3OH4rG+gCACwQd94jUIliNHV3i8u3PoICqEJMOQWu+6M2g7lT7k
         htEjrgOiRGoCbW26SxydOWo1QvGbrXBQz7o8TTsKsWnmkJQ1K2fZJA7lfiPYpTG/N/1Y
         xUcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pLpYyWtmw6OHm0KZCjVI06POe96iERl3wGHLBQYXyAM=;
        b=vMRMqLGeugw1fPKLiNRGAkTn7SRMWT2voT7ei0R9iEGEMU5/8wvtN0wdgiVeejJPKw
         jGxX0y0YuYjT1mRCMmgI7KwOhI+oEZOHiI8zWXP9vQhZ1xhAeT3JpRlxwjoinu0vCp1a
         c4Nr2W1O1ERhdBotumBY8WK6Mm+D2XyIJfZFy3o0aaCGLEu3UdLS8tRb1QA+4bKrprsd
         +9zBgRKgzmr/yoHjX7gcrrzskxZyLKq3ceTiBlcDsukjAi1Z1wGfOmogSMpqvX97LMu3
         uhmqGTxvVPswSm0O9v0KuQHly+C+lAjNVjyY20xjs1zjwK8yzE0nqkvYc2JrIqsxRj87
         hYxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M1VSKjuU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o16-20020a05620a2a1000b006a5a3ceeb00si11725999qkp.753.2022.06.07.13.35.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 13:35:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M1VSKjuU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyfut-0002cb-FK
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 16:35:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyft6-0007E2-0P
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:16 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:46724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyft2-0007D6-2R
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:15 -0400
Received: by mail-pl1-x633.google.com with SMTP id d13so133192plh.13
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pLpYyWtmw6OHm0KZCjVI06POe96iERl3wGHLBQYXyAM=;
 b=M1VSKjuUvYAaG+gSzge94JduXDpf66YFWnzbHFZhUb6vHNVbIvM1JXkrZRdXDvmMrA
 JYrFhtdEhiphCgl2bTkuyOO109zBWaF5q6yIBbSVEpCeqE0rH9B6zUURXqUHckAu/CPA
 y5VDavPWlxcouT47hW5woqMJJ3B1sBuKd0U9VVX+p3MdvdJiWoqdbCJKvQ3aiEHWgF+j
 TeZXrQfQd0zpE0E/rZY6k8Ykthj1THio84KaiVux18BFpYMonmlqoqJOsYQV+qxRulCy
 gav7qZHU3qzBLEx/AvkSxuRE1yvfrHfbCkixqpSdL/N2D5qW71KX+IPd9IucDaze/wV3
 0kvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pLpYyWtmw6OHm0KZCjVI06POe96iERl3wGHLBQYXyAM=;
 b=qD/42BC3RGiauyVl/my6nBLngs57ytHqU2yLJNYKMqT4GAxe3quZAlhX3cw/lg2TYl
 G8GqtJXYfSjsmDuZbfn8ZIcK89lFm3ud6yrEqOxR+52PfuDODQuGx5/QJBVBLjb8XP0Q
 s+PI1R5hyW+2Pv1YvWwXhNg9k9FsC+XK451fbm8cAq0nNArNoD6WWfckug7lPGgdli6J
 iPfC1P3dD44fsjyRIWfzsk9IT+bpVDzbW7W+OXXYH1+WnVXQEbd9H8SOCC9zOZ6rKo5Z
 ygQ1jqVGP8ywYKE2rMUv3iVj9MOIXKZ5X37wVceXcEzV90TS3ZYgB/GJKTWmCckJiu5u
 0QCA==
X-Gm-Message-State: AOAM532Kn3BrxUtTKjaI+YmsijK7OUbq9zJe/2Z/i6csGaXcmbMYUlH1
 jdAl9MydvjO5jXVkXhG7DOS5LSaZkcYZ/g==
X-Received: by 2002:a17:902:bb90:b0:158:a031:2ff2 with SMTP id
 m16-20020a170902bb9000b00158a0312ff2mr30624511pls.117.1654633990680; 
 Tue, 07 Jun 2022 13:33:10 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 03/71] target/arm: Remove route_to_el2 check from
 sve_exception_el
Date: Tue,  7 Jun 2022 13:31:58 -0700
Message-Id: <20220607203306.657998-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 7Z6arlweS9Sx

We handle this routing in raise_exception.  Promoting the value early
means that we can't directly compare FPEXC_EL and SVEEXC_EL.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 960899022d..8ace3ad533 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6159,8 +6159,7 @@ int sve_exception_el(CPUARMState *env, int el)
             /* fall through */
         case 0:
         case 2:
-            /* route_to_el2 */
-            return hcr_el2 & HCR_TGE ? 2 : 1;
+            return 1;
         }
 
         /* Check CPACR.FPEN.  */
-- 
2.34.1

