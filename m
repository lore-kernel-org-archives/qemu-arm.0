Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp5273265lfg;
        Wed, 12 May 2021 11:39:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7z5QmCMqYYotjmEJQFHlyLh6Mi36JveHOmxNZmf2std34k4fUjuyR/Zecxw/Wm+grdbSt
X-Received: by 2002:a05:6e02:d53:: with SMTP id h19mr31304605ilj.232.1620844760177;
        Wed, 12 May 2021 11:39:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620844760; cv=none;
        d=google.com; s=arc-20160816;
        b=ZJ0elTCo2yuJ6u2z+7+zn28SQl8U4kUHrfd1sV1/nqSUiv1ChnjZOJZl0N9dBU6U0r
         sjqH9XK9Eff149tOW2ie40MI4mkY5G8vYlJpXjQR8aTqhr7XNZLxnMW7pQC+EZYsEKS3
         DbLrfZNCRF6NCJDyxdczOoDu2FB1a8FFn3Qi32+Gzb5WgnadVts7+by+IZCYckbsOY5C
         oFso7GiKRnGFMvTc4A/NxD9iHixSe1RLRQx9as6Xyk7GJJ35+SsTHAGuoOJ5/jfAzdyN
         UAO0VQnAr7EuKY13EzbXXuUKSUbZ7lTjtqC4VundijcEf94sBNvvanWNw+MjybR5fxLU
         iCDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uNizM5dd+njefSGglfwPGotA4yVew4h3gSREpFzckEs=;
        b=lLCT7/NkD0ywkXO5g52nOIQpaaI14ZkBumt4PjpDyaOn3c+XkGIuPRrylrr8aZGL+v
         L6tXTFbQ9TpQ17DDBD0yO3pPJDZhaBjOgGVS5fzN4eQTpIVjexpIhJX4Eejq29NwWbYi
         6Vp8/fsNtGRkQ79gONZg3auE+BIYmsv9IhlyJMd5sn24c3O9gHfiYmGEcQXymwsTISVS
         ukYO12BmNgYS4ZgbD/OfaPVPoosCIIsovGghtn1ngLThtnOGBLJfUfwbnrpFehoRELqv
         CHjZA68GWRYlqp77V3sC0o2MOf7aopzX1TJvcDd53h289SCCVgcYDgA/NrOER84IHx1L
         7yCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=sKhSZnjt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f4si534831ilq.1.2021.05.12.11.39.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 May 2021 11:39:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=sKhSZnjt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgtlP-0007G6-I0
	for alex.bennee@linaro.org; Wed, 12 May 2021 14:39:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lgtWS-00065M-BQ
 for qemu-arm@nongnu.org; Wed, 12 May 2021 14:23:52 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:45923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lgtWQ-0005qq-GH
 for qemu-arm@nongnu.org; Wed, 12 May 2021 14:23:52 -0400
Received: by mail-il1-x12c.google.com with SMTP id e14so20928463ils.12
 for <qemu-arm@nongnu.org>; Wed, 12 May 2021 11:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uNizM5dd+njefSGglfwPGotA4yVew4h3gSREpFzckEs=;
 b=sKhSZnjtpQN1Bkj9TABCzW4bl2ROCU2Xn7FBiFOxCvfHmKB41DZVJBGM/04FZjgu4y
 APf8HDOAZOolZ59NNO+KSwTLK9wsmclu9LOnVkbfCX2NJUrAyB01AZJKF+7UVZcG61cD
 oPRJCMBa4lV6j+VqIIKp4AaZ+bRjlVrI3Rf+CMxsicySQDO7BiLRNVD5fEYIEf3sOWMq
 CvuTSMM8LmsIcgQTYsPHuJJ7UqMWD3TaRRtP6kOKZXCPjdEO4V0aPV+bo/njF1RF3Bil
 9OTaE6mkGhvmskS8rn0IAWGZWXyguJfNMiTSnShHAhgk3WGdpvhH9tF/eMvjOpO5Dhbi
 qM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uNizM5dd+njefSGglfwPGotA4yVew4h3gSREpFzckEs=;
 b=HyIapj8Ttk1rX1VzL3PrD/8nnr2up9jcyNyF9bvz9eeKiJ7+qRy/F1hCL22l80Fwq+
 nrEMIwvoVZ5aAFckLGNuPjHzDCVcvxAEgCqVT7jzAdBMNuc3CJ4JrIEOgT5Nt+1VpdnS
 zuq0LlFUz9uGQKG8VocEf0xXUeZn/znSYMsqXkCG5DV2S6rqNWVgZHQNozsL18dpJtbG
 4iQXyTl8/4SOURbJ44V3gZh4ppNnFpYR6zYi+b4MJJIxlmiTDAL7Gd8lvJXoGvh3o1oi
 lmR65WNCfYgGLYW5Slwzr2J6nL1F/By03m6gBuWb3lRAaoQu6czF7mtr7Rl7/fA+JgAl
 bUcw==
X-Gm-Message-State: AOAM531cZs2+8uRYomjDwhDN915INSkXGzMp3XdO8+1ZH9Drmca89a1S
 qJ8wX2BS7BCshmDFG5D2XaNEuA==
X-Received: by 2002:a05:6e02:118b:: with SMTP id
 y11mr31944521ili.163.1620843829298; 
 Wed, 12 May 2021 11:23:49 -0700 (PDT)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id d16sm247484ilo.12.2021.05.12.11.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 11:23:48 -0700 (PDT)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 3/3] target/arm: set ID_AA64ISAR0.TLB to 2 for max AARCH64
 CPU type
Date: Wed, 12 May 2021 12:23:37 -0600
Message-Id: <20210512182337.18563-4-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210512182337.18563-1-rebecca@nuviainc.com>
References: <20210512182337.18563-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=rebecca@nuviainc.com; helo=mail-il1-x12c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Rebecca Cran <rebecca@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Fk5ejGDntP6m

Indicate support for FEAT_TLBIOS and FEAT_TLBIRANGE by setting
ID_AA64ISAR0.TLB to 2 for the max AARCH64 CPU type.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index f0a9e968c9c1..f42803ecaf1d 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -651,6 +651,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);
         t = FIELD_DP64(t, ID_AA64ISAR0, FHM, 1);
         t = FIELD_DP64(t, ID_AA64ISAR0, TS, 2); /* v8.5-CondM */
+        t = FIELD_DP64(t, ID_AA64ISAR0, TLB, 2); /* FEAT_TLBIRANGE */
         t = FIELD_DP64(t, ID_AA64ISAR0, RNDR, 1);
         cpu->isar.id_aa64isar0 = t;
 
-- 
2.26.2

