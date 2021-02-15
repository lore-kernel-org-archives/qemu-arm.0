Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp5961558lfc;
        Mon, 15 Feb 2021 13:58:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1vSVKhII8bBNfp5a86CcMKXTpIvrc1wstI5/0Tj09vHtObShTH1W6tng1Z39wJyKs2fn+
X-Received: by 2002:a25:bd85:: with SMTP id f5mr11447970ybh.183.1613426328648;
        Mon, 15 Feb 2021 13:58:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613426328; cv=none;
        d=google.com; s=arc-20160816;
        b=urlUbhWJMsreyefHh+Hv0I6quBQgUrxXcJAXjkzwkdd3oIDO+HYUxkEm4HtyAimHcY
         lBwmfaNnaumN+J95Kc9DuMDbdxpIFBgTU195Q+cWSZH0aL1dH3BpzP0kgfuWQ+D9NXwu
         P9HFJ/Eba5+YLzjN8AbWCntgHIZCtA9ZH0kcKSimimti7y+BZudX9y9CKLdSnzMsJHMD
         esKy66Wq+0B+D3R1T06/5QIp5OVoARJjxWUiqUfFSgT4rtclezGANRNBNvzfKc7muKN8
         G0g6XBFl00gWfvv4Bv9ahoWQFN8LhNmixpLmLz8pRpPlKCmBrRjGnWYFOXGV+gI++Pvv
         gypw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=VflgyIvO6lAZNAekBnYTZDN9ESJWGJH5fDx0w3xyYWw=;
        b=i81GfE6lRX1Zdqmat/lRVxMtjhoxzlzeszQ9Ua3vKiQdKcCOso0KTrnLgLEoA5lIx7
         nGkrhDhOdJbC3yu7lB06zuT6D5cD2x2RGDM3TxaHM6DHhRMfl7PmsAo64eJuhX2BSIEk
         eldB6XZZNwVfP3u6w+b88Ia9TnSTQT6a8RDpN4JoPivUvvwx4IZGJoy24yMZebUTJVEV
         v1oLmkn+9yiRA/DRWfAw/g+KpiV59eS+ZSmReS8oCjVgxki5cGPcLvfl1h3mJ8OoY9ze
         uje5KiMZKcyEALU3zbPP9wuFj+tuD4rRJH5D+1qzu6jJNrlr9nuFfqDlJvbON8vJIYAc
         o21w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=IT8txeXs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 65si18057819ybh.65.2021.02.15.13.58.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Feb 2021 13:58:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=IT8txeXs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lBltH-0006Ov-T3
	for alex.bennee@linaro.org; Mon, 15 Feb 2021 16:58:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lBlt8-0006Ok-Nh
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 16:58:38 -0500
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:40990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lBlt6-0007of-Ix
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 16:58:38 -0500
Received: by mail-io1-xd2e.google.com with SMTP id e133so8196515iof.8
 for <qemu-arm@nongnu.org>; Mon, 15 Feb 2021 13:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VflgyIvO6lAZNAekBnYTZDN9ESJWGJH5fDx0w3xyYWw=;
 b=IT8txeXsjlha/Vlekj8Y/bDiW+uUHTIowiUh78r9/QokmD4OOHc7jnYcgCKv5tdMpX
 f1LTdDuDw7eh88z9FTLLBoLd0Y+bVySnycPgmU95Q2VuJClDvA5R/r9amCYNYmWiRM94
 1IMJnMkm/BMGKBV1B/SU6p9NXh81VPH/Lk1TtT5QdT90CCSJGd933zqWNcY3KTykOVWl
 Zzq5PfdyUMFwVcn6XINKSejpzHzL7P96zNXT4g213bRAAy6O6S3k7nKeIFMKzyVbLhqd
 dt3S8BdagSavP1F3S0xC2+CFQrGYKd9YKP88t149/68uFqQ4oU7uCJlv7fuIQ8eO22vP
 zdKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VflgyIvO6lAZNAekBnYTZDN9ESJWGJH5fDx0w3xyYWw=;
 b=gYUGBsckzR5OmH6rdYYcVa40Jc7nprc+6talrJbyl+D5kSRu069JykkF78nIfulcTv
 Glg+ZGIlGJC0LmzHQUpoJGqRqPEeEd/pRMtdns2ukMluUGAQcmuWxrfOGiY931nJL815
 qfuhTkNxpe54znuS3+flkkakJWohaawT9uoIYpTr3c186y8UK/z2Z8UNHNSeVN/R8Ctk
 pIR5X/ny25CrUCees5PwcOfO9RSz3JX9sIxLxJEEGwwCrWTwEWOQiSwwJuMpwAJmXDNv
 w+0e1KN4FDc5lso7eCUS2FobXHSBE2UQQ2C97nqMPQx2LjhHB4aVxJg0GiqB3AuPk5Ji
 fs5g==
X-Gm-Message-State: AOAM532NHd/wfyltv0I+G2pdonamnFURd3XayKr5cb8DtBX3Zh/axJQO
 Ga4+0URA+VIL+4P3Kf3f7XgKf7syWTep5qFQPsX066gj1nwuyS9r7i/7OLbMWvJkD+gO+VH389D
 Ykun4XW+1QDg1M0k3FPSFSP7PHQBjy7ccu/c0RBHqHLAMU8WHLRTzAaNBcXA65p5h2n32
X-Received: by 2002:a5e:c644:: with SMTP id s4mr3258552ioo.132.1613426315277; 
 Mon, 15 Feb 2021 13:58:35 -0800 (PST)
Received: from cube.int.bluestop.org (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id j12sm9812254ila.75.2021.02.15.13.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 13:58:34 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 2/3] target/arm: Enable FEAT_SSBS for "max" AARCH64 CPU
Date: Mon, 15 Feb 2021 14:58:18 -0700
Message-Id: <20210215215819.1142-3-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210215215819.1142-1-rebecca@nuviainc.com>
References: <20210215215819.1142-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=rebecca@nuviainc.com; helo=mail-io1-xd2e.google.com
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ScL4RrGKCMyo

Set ID_AA64PFR1_EL1.SSBS to 2 and ID_PFR2.SSBS to 1.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
---
 target/arm/cpu64.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index c255f1bcc393..f0a9e968c9c1 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -674,6 +674,7 @@ static void aarch64_max_initfn(Object *obj)
 
         t = cpu->isar.id_aa64pfr1;
         t = FIELD_DP64(t, ID_AA64PFR1, BT, 1);
+        t = FIELD_DP64(t, ID_AA64PFR1, SSBS, 2);
         /*
          * Begin with full support for MTE. This will be downgraded to MTE=0
          * during realize if the board provides no tag memory, much like
@@ -723,6 +724,10 @@ static void aarch64_max_initfn(Object *obj)
         u = FIELD_DP32(u, ID_PFR0, DIT, 1);
         cpu->isar.id_pfr0 = u;
 
+        u = cpu->isar.id_pfr2;
+        u = FIELD_DP32(u, ID_PFR2, SSBS, 1);
+        cpu->isar.id_pfr2 = u;
+
         u = cpu->isar.id_mmfr3;
         u = FIELD_DP32(u, ID_MMFR3, PAN, 2); /* ATS1E1 */
         cpu->isar.id_mmfr3 = u;
-- 
2.26.2

