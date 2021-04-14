Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp6181305lfr;
        Wed, 14 Apr 2021 13:38:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXxrlHpx+ApXlYorjIMAcObWpXdhv089esnkf1dyggPpxQCyl2I6gQBpCNfTqzd++XfWtn
X-Received: by 2002:a92:130c:: with SMTP id 12mr41936ilt.279.1618432691883;
        Wed, 14 Apr 2021 13:38:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618432691; cv=none;
        d=google.com; s=arc-20160816;
        b=AGNAmX/9UfxJUj9J2gOH1c6y/0/1wvKgoMQdkrJs5CvVVWHwDPRuzv800hy3no3qcv
         3ZCO5OmurvmSHatGthyPS8icQwM9egF1xknt0Um1TqP4sKR340DRboyuc52WucxxL5nO
         Dg6bTTE0kedTeTWyMlrakjI9odJkMsSspTRJr2ffDLobRHLqqs0acr7D3a73Tg9YNO4k
         dMPGtYx9wy2tkDmK2VoRzIfJyR6adrW0TFksP+J7zJC6B+iBlBDHk6pHHXsweGNSXY3o
         Hoe9XDwViifqLnL7Z9siZRDLbl9uethDNbh5LON2U+Zd5GcBl4omQIQi5Omh2C+lgZoN
         3t1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uNizM5dd+njefSGglfwPGotA4yVew4h3gSREpFzckEs=;
        b=rXKMdvMvu2UFbN90WYtu02GeX69l8jraPHw+lOkFJZOVPpubocjPkaTwmK1cHqcNIa
         0mAp6DmVGflbLntd2xWjgx+nN4NSUvZBFB0fW1E59/zkZKkRP487LnQr6dXxmJqCTuf+
         ntpijAx3ji2oPXbhaR/q3VkBWB5wtNOwQv/i5axI2hPiV8Euh6yEdqYjcqGv3kBrOxOS
         1EM+VS11glO/cwLK0kzfXLecPZBnFDEg/P8AM+cFke5gB63Klz0aU58vQNNsGSy2bgSe
         jvx1XbGBV6idoJxZ11w6MV3tdSxZOA8k58cGgjGCX/nahdz9If46UstiN0N5FoW+SSTw
         8bNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=bbKaddtf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f21si529215jaj.48.2021.04.14.13.38.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Apr 2021 13:38:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=bbKaddtf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lWmH5-00024F-2k
	for alex.bennee@linaro.org; Wed, 14 Apr 2021 16:38:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lWmBs-0005HW-4X
 for qemu-arm@nongnu.org; Wed, 14 Apr 2021 16:32:48 -0400
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842]:46072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lWmBo-0004qT-1t
 for qemu-arm@nongnu.org; Wed, 14 Apr 2021 16:32:47 -0400
Received: by mail-qt1-x842.google.com with SMTP id u8so16453506qtq.12
 for <qemu-arm@nongnu.org>; Wed, 14 Apr 2021 13:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uNizM5dd+njefSGglfwPGotA4yVew4h3gSREpFzckEs=;
 b=bbKaddtfzFSlozFgmHJO+5yNaKkKDuUwQyPnQACuGfzIG2e86HLso7gMyvc10oXU4y
 M+oDx2/xPvSwd9BJV/RXz3IGzVDPijG8NWzi28WI5l3W6nGX1GeGqqP2PHCaTQbLFaML
 XlMu5I/cwxyMqwmQtiH1BlWVvgga7dCAjTXsFhinHCQ/ZMIxIKkZZd7d84O788a8tidz
 WnqoPyjTfPPd5MDsiWf5l06cRSIHUQxFq5cXyWlxau4bBQdz8u0UlqciG11Olaf0pxil
 Yih+pFP70X6GTVP7hndUKJl9ewvPlAIjmdRGv8Vc2LEllIwvX6xvHHQ7sMlOS+iGNVVw
 MoPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uNizM5dd+njefSGglfwPGotA4yVew4h3gSREpFzckEs=;
 b=nS7iujOAlB/FtsjI5heKd5mCnzI0O8n9n9/bKWe1ULfwViUwSRP9SpZi4W57apae/l
 iCkVB5qBT/InPPycmNuWxHvnkUcN4hpRAwUG7fdO7LrDuD3ZJSrqYNoMFHf/ujHKAH1u
 8HCYM5FAZ6JepYP+1c5xCuxCS8HnbyVahGeX80HbOEWeP+T9TL8PVscMhzFCyYQXr5yz
 nv4KUWMwQgNA29Ee9ik70LnXTq94HLYVhd1jADkt1G1xcbcmACmSzLD1ssP11UNWXFBb
 +RC0v2hTvz56VngCmaI+7xXeLyySowUTfCNTVmvzYFWW/1YaDsNd5Iic8vV0jAp72zEn
 VfLw==
X-Gm-Message-State: AOAM5326fs7xO0gTL5Mz4WhkWsUgevhtse0iA4ObAouKar/flpdCZo34
 BYQrEK1PBNYahV9+8oGAFFHNOQ==
X-Received: by 2002:ac8:7dd2:: with SMTP id c18mr37597145qte.301.1618432363225; 
 Wed, 14 Apr 2021 13:32:43 -0700 (PDT)
Received: from cube.int.bluestop.org (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id q3sm304692qtw.40.2021.04.14.13.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 13:32:42 -0700 (PDT)
From: Rebecca Cran <rebecca@nuviainc.com>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Subject: [PATCH v7 4/4] target/arm: set ID_AA64ISAR0.TLB to 2 for max AARCH64
 CPU type
Date: Wed, 14 Apr 2021 14:32:31 -0600
Message-Id: <20210414203231.824-5-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210414203231.824-1-rebecca@nuviainc.com>
References: <20210414203231.824-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::842;
 envelope-from=rebecca@nuviainc.com; helo=mail-qt1-x842.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x68GEsu7ojh+

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

