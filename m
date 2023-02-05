Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp3075377ejb;
        Sun, 5 Feb 2023 01:48:22 -0800 (PST)
X-Google-Smtp-Source: AK7set/uHuYxeO6glO3j5pLm5iJz4hKGBqr+97YGn8pLW6cl4cuEeOpCXtthlFYirzWa5yFVVp8H
X-Received: by 2002:ad4:5fcb:0:b0:56b:f40e:57f5 with SMTP id jq11-20020ad45fcb000000b0056bf40e57f5mr747484qvb.13.1675590502485;
        Sun, 05 Feb 2023 01:48:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675590502; cv=none;
        d=google.com; s=arc-20160816;
        b=bGCc+tP3CtDtUbPQMAtFyWW8OTCgMOzXCczcTXhEv2k6gST4bdlQrpkfgRAmGFLObn
         e65vwc/aAO1RSXimVC80wIyADw7O0r3NsJHrGJ3bm/22UYlYnsSlVlJXNHBYFSADtmKf
         D9hTsPRCtycx7W8ZbPgYgQYuO4TQG2YvrlgGGEv9Dw4Yc748kR9DEsH/Psu7AsV8fVfo
         bZtIBqvvzRx9pnWe1O+gcdbEecPem8O0WmEokeOX3FzIo942MVf4pE1u8nsGL7ulVlVW
         2UYADp7fYvsFNAE/tc5U0rkZJnvuzwAoeVAqjabIbXyf9bAIrFFbCiXtLiO4PRJ4L+h3
         0J7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=UjRaFYtVUZqC0NEA0rur78DkyweEGXZXJJbd80wD/+w=;
        b=ymvTh697hi5B0bymw3Lo4AXWZQqgk+c3QSGmuyuWIcANKesNEB5bfLvcRT0TFtIA9y
         ljHcFaRmH3hHQl+uIbMckHwYE6yJ6Au0mNo4ONROox7yV26AfdGxYhVp2YFI8FGYN8/Z
         9zvrcIEA4hIP+cdf4JkpzL02l42OsMS1tzLKNC8VQV3C9BsQeJj1e47FAG3ebbh0Sget
         UMsxvYYl6QYs+yUQxLWi3Ve6u2lSlN/pIjb5ofSQzCLH//tztxGuTeOdA2Z2uEkD2jr+
         QDk8zhw4vu/Oi34axzPXcp3o8nPlwPqQmA9oK2H1ZWW3pIinu9SbXMgJCrYBJxZ4CoyC
         zyrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=fA3MHr7k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c3-20020ad45ae3000000b005348f2ac7afsi5881647qvh.591.2023.02.05.01.48.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Feb 2023 01:48:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=fA3MHr7k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pObZk-0003VA-EJ; Sun, 05 Feb 2023 04:44:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3hHrfYwgKCB0LFHLM3839HH9E7.5HFJ7FN-3KFGHG9GN.HK9@flex--smostafa.bounces.google.com>)
 id 1pObZi-0003TC-3m
 for qemu-arm@nongnu.org; Sun, 05 Feb 2023 04:44:42 -0500
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3hHrfYwgKCB0LFHLM3839HH9E7.5HFJ7FN-3KFGHG9GN.HK9@flex--smostafa.bounces.google.com>)
 id 1pObZe-00017M-AY
 for qemu-arm@nongnu.org; Sun, 05 Feb 2023 04:44:41 -0500
Received: by mail-wm1-x349.google.com with SMTP id
 iz20-20020a05600c555400b003dc53fcc88fso5014998wmb.2
 for <qemu-arm@nongnu.org>; Sun, 05 Feb 2023 01:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=UjRaFYtVUZqC0NEA0rur78DkyweEGXZXJJbd80wD/+w=;
 b=fA3MHr7klX4U5yFiopPsAmgYxH4abl6mHe6hKRaGiwQx3dOnTdqgCZyA6bYlYEe97p
 6P7fZbuRU/1LVnpipU5Xnpw9Ps+8QU3eeAgFahzTk5ilThjM+S8eoys6ctqTXpeBjowD
 KP0OOD43azEYlhiFBJkN42IDrs7ViTAzYWxiFQTtuVGVi3bmiQHUuSK0QvFHNGvOSJTq
 YvYqVghQ6pklKoqIFBrHz9Jbgf/cxEsNVxjFjza5VUUedLp+VV+fzQOES9gmLwIO4DlH
 fboUIirzx4t7jMKdB6Fsze6dOwhKQz7fP+YYZyFrhuwnZpqg3tMURUDrETDiP7Z6ZYBe
 2QyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UjRaFYtVUZqC0NEA0rur78DkyweEGXZXJJbd80wD/+w=;
 b=Wv7HjucIo+7P1+5F5aa1+NpCS6J4MOoJL83Zz2qM3uHHhJIZeTWBgmlVwCFNYqTTuB
 4DdfDudJdigv3+LEDVxdCtEAgHBvi8Z22IrzYNYNWeHRP7mnwqLMcI++73ZAGemV8/8v
 8FqLd18nZ1ts74eo8FqYwJCUdMUjydIH+rWjjt8AFapEEk6E9nGbEW+5rLvOh255k1/5
 4LsNSMacg0QoyObDpTEcjHWcaFDiOIW1MpDN8EUuUfG+BGV0sf9H4+VOFPdL/Ysx2UVW
 HaTUlKLU7TUbIqB9GpKC7VxH/pGoCnXXJm8mxI54JhL7mGau7ZjbHaHjbzeF2wIlmBN5
 blWQ==
X-Gm-Message-State: AO0yUKU8Kh5SwRHoNj7smmj/v0zyaq1Pns4KKyKfUnmi7umgs4Jlu8XB
 eYvSv2WG0aJxdKBSC0EwaqGuk3nlmlQT0g==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:46cd:b0:3db:110f:2691 with SMTP
 id q13-20020a05600c46cd00b003db110f2691mr795316wmo.65.1675590276522; Sun, 05
 Feb 2023 01:44:36 -0800 (PST)
Date: Sun,  5 Feb 2023 09:43:58 +0000
In-Reply-To: <20230205094411.793816-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230205094411.793816-1-smostafa@google.com>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230205094411.793816-4-smostafa@google.com>
Subject: [RFC PATCH 03/16] hw/arm/smmuv3: Rename smmu_ptw_64
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::349;
 envelope-from=3hHrfYwgKCB0LFHLM3839HH9E7.5HFJ7FN-3KFGHG9GN.HK9@flex--smostafa.bounces.google.com;
 helo=mail-wm1-x349.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: oaODRljddfhz

In preparation for adding stage-2 support. Rename smmu_ptw_64 to
smmu_ptw_64_s1.

No functional change intended.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmu-common.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 54186f31cb..4fcbffa2f1 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -264,7 +264,7 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
 }
 
 /**
- * smmu_ptw_64 - VMSAv8-64 Walk of the page tables for a given IOVA
+ * smmu_ptw_64_s1 - VMSAv8-64 Walk of the page tables for a given IOVA
  * @cfg: translation config
  * @iova: iova to translate
  * @perm: access type
@@ -276,9 +276,9 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
  * Upon success, @tlbe is filled with translated_addr and entry
  * permission rights.
  */
-static int smmu_ptw_64(SMMUTransCfg *cfg,
-                       dma_addr_t iova, IOMMUAccessFlags perm,
-                       SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
+static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
+                          dma_addr_t iova, IOMMUAccessFlags perm,
+                          SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
 {
     dma_addr_t baseaddr, indexmask;
     int stage = cfg->stage;
@@ -384,7 +384,7 @@ int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
         g_assert_not_reached();
     }
 
-    return smmu_ptw_64(cfg, iova, perm, tlbe, info);
+    return smmu_ptw_64_s1(cfg, iova, perm, tlbe, info);
 }
 
 /**
-- 
2.39.1.519.gcb327c4b5f-goog

