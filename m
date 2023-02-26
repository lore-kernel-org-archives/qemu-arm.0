Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4028785ejc;
        Sun, 26 Feb 2023 14:08:08 -0800 (PST)
X-Google-Smtp-Source: AK7set+JUiHj1w9NUUUEQwNll3lan6d3EuVZ/rF6NF6WOyMP1tUzyXxvJlsfMYEjLNioIxsrtPzw
X-Received: by 2002:ac8:5e09:0:b0:3bf:cd81:3a31 with SMTP id h9-20020ac85e09000000b003bfcd813a31mr8144834qtx.65.1677449288604;
        Sun, 26 Feb 2023 14:08:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677449288; cv=none;
        d=google.com; s=arc-20160816;
        b=E0TgK7TqGj5vdK7ZZrsbO+/ZEpqOlEZ6MfSjzLjRDiMUop9udiUu+XWltYXL2v+MqJ
         xRcneoD9gAOyRM6aWNt8iqhx7XWGEuP+7jGsYPLjnwVKe1TEYcIEEXxpjujJMqSVA8D4
         6KtYz7+hFO87LMDCd+FxdPmLgrI/eCeaTqkyYIMBf2TJJGzIyqTuHa8eF6AkTyzX40eJ
         OXWzDgWBTJs2TFsAOtta8HXlVuosKJY2ZLy2FuE0C5Lo5VDALOE8sRW+HhjNRm6OQU6S
         hVEvu5feq7pTZl8/tNBhn287mhBLS7aTq/V5Z5v2tyWPEahCXFK6nbNOIxSQ4+oZh10w
         uaeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=5TC0wFDlcrEeYII5tY/AKUl2RtqT3yWH0TbfuyNXD9o=;
        b=wbAau5rSVEf+ysfAzyVuvaQzEhEywPRbXzPeON0lchbVpjstr+pE7m41vmSndtBdql
         BM77eqVCAmfid7PXvCMRbLQS+4OZcshL+RmMUNf+eUV5tD0bXZ7ZHeMy5phq/pS3hoSK
         ArcMXNLAmt1raYeOGiY8tV0F1MS/0gKNcgBrapTyJVtQJkFMFKw+ji9HW8n1oc8TQeSb
         PIniFWeERb/6ViBPKxqSNHJpoCe8EOGWKE46GjfJQJSMjmBTfmt9pDsZBDfdXkILcp5K
         He1iIwn127Z//BvveJievoAXY5z9Dc+6hTQ9jOBIJXND5RJR5II9+Pn+n27syunHB+Yv
         UqpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="Fy0/vgOR";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t2-20020a05622a01c200b003b6836e472bsi5105555qtw.781.2023.02.26.14.08.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 14:08:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="Fy0/vgOR";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWPAq-0002RX-Bq; Sun, 26 Feb 2023 17:07:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Ctj7YwgKCM8D79DEv0v19916z.x97Bz7F-vC789818F.9C1@flex--smostafa.bounces.google.com>)
 id 1pWPAj-0002On-CD
 for qemu-arm@nongnu.org; Sun, 26 Feb 2023 17:07:10 -0500
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Ctj7YwgKCM8D79DEv0v19916z.x97Bz7F-vC789818F.9C1@flex--smostafa.bounces.google.com>)
 id 1pWPAh-0003uA-Vv
 for qemu-arm@nongnu.org; Sun, 26 Feb 2023 17:07:09 -0500
Received: by mail-wm1-x349.google.com with SMTP id
 p22-20020a7bcc96000000b003e2036a1516so4397188wma.7
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 14:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=5TC0wFDlcrEeYII5tY/AKUl2RtqT3yWH0TbfuyNXD9o=;
 b=Fy0/vgORRnReXyOSSxrZliKq5c7pm0JTu5obFxJtU6OAMT5szKIteAN+44aduytQXg
 8sm/SzWf/hnvtBingVIDsTm4onAnT9cddqOAI1ZbvqWw0L+CJh8OAU2m09hxmXr7tuvW
 jW6TEh7esdxBK0xmFxpXW3iGb3EctBJU7W/C4eMNyNZmHJBVsL81AwEckMoWOmENzKsi
 EsVNIjc/5rGMSf3A46WG13qUra7oICjB3OFrYU6/ExmTSEVYN6CJxAsJgrsyT3YzvFiL
 0u0kibzTE9tPR4x14vTt6frlGke3EKcKJIEKdvlkhF8XfnffJu+84aY09DyoUKMOWT1y
 EPGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5TC0wFDlcrEeYII5tY/AKUl2RtqT3yWH0TbfuyNXD9o=;
 b=vuJ/SqEbKLfNibrdUfhR5UZYDVriNLMFZ/L4nKBaPX+UHpeM0W7NO58OJHUtHrUw/b
 TEVdJd04iEWyszyA+v8OPRt98kxY5wr/yCpp8z+1kemLqrdLRdgs5h9KoMSzwxsSIsKm
 ynbizLZSDrdJxcaILBHKHlIHN5E0WFeT+QwpjJ5+49MFH7G40QDCFLV9NvyHqBnaTLMx
 KFTLpPm/eZ0G09VrrV0pRZK8SbdGzxzRcmkwH5ABZfl0YBPO6/k4tXzqBqj6Sz9XZsQt
 Gnq2iK9h+7sJ9R3WPCmx6I10kLJ8ebWIbdh1Bn9Nt/c8pmj5YVzBCdoQ4RtAlt89kkLk
 nWFA==
X-Gm-Message-State: AO0yUKWR4CBd0qavyqqE6RPJaWiC5EbKV+1a1OdfKQwAdr1VJA1YbZz5
 r2dZwCNhNTSxKwCYsAP1xdCBE1uKr05LeA==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:adf:d844:0:b0:2c5:52f8:59ab with SMTP id
 k4-20020adfd844000000b002c552f859abmr1812543wrl.13.1677449226015; Sun, 26 Feb
 2023 14:07:06 -0800 (PST)
Date: Sun, 26 Feb 2023 22:06:41 +0000
In-Reply-To: <20230226220650.1480786-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230226220650.1480786-1-smostafa@google.com>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
Message-ID: <20230226220650.1480786-3-smostafa@google.com>
Subject: [RFC PATCH v2 02/11] hw/arm/smmuv3: Update translation config to hold
 stage-2
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::349;
 envelope-from=3Ctj7YwgKCM8D79DEv0v19916z.x97Bz7F-vC789818F.9C1@flex--smostafa.bounces.google.com;
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
X-TUID: OyUsRLU/21nb

In preparation for adding stage-2 support, add a S2 config
struct(SMMUS2Cfg), composed of the following fields and embedded in
the main SMMUTransCfg:
 -tsz: Input range
 -sl0: start level of translation
 -affd: AF fault disable
 -granule_sz: Granule page shift
 -vmid: VMID
 -vttb: PA of translation table
 -oas: Output address size

They will be used in the next patches in stage-2 address translation.

No functional change intended.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
Changes in v2:
-Add oas
---
 include/hw/arm/smmu-common.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 9fcff26357..2deead08d6 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -58,6 +58,16 @@ typedef struct SMMUTLBEntry {
     uint8_t granule;
 } SMMUTLBEntry;
 
+typedef struct SMMUS2Cfg {
+    uint8_t tsz;            /* Input range */
+    uint8_t sl0;            /* Start level of translation */
+    bool affd;              /* AF Fault Disable */
+    uint8_t granule_sz;     /* Granule page shift */
+    uint8_t oas;            /* Output address size */
+    uint16_t vmid;          /* Virtual machine ID */
+    uint64_t vttb;          /* PA of translation table */
+} SMMUS2Cfg;
+
 /*
  * Generic structure populated by derived SMMU devices
  * after decoding the configuration information and used as
@@ -77,6 +87,7 @@ typedef struct SMMUTransCfg {
     SMMUTransTableInfo tt[2];
     uint32_t iotlb_hits;       /* counts IOTLB hits for this asid */
     uint32_t iotlb_misses;     /* counts IOTLB misses for this asid */
+    struct SMMUS2Cfg s2cfg;
 } SMMUTransCfg;
 
 typedef struct SMMUDevice {
-- 
2.39.2.637.g21b0678d19-goog

