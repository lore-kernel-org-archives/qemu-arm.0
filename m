Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp3074244ejb;
        Sun, 5 Feb 2023 01:46:05 -0800 (PST)
X-Google-Smtp-Source: AK7set8li8Lmv2oRrUBgawepK7he7rVKbJq8OsiphqGayNWN8Qpvs4F3IdJ2SvQeH70MMfRH/0ux
X-Received: by 2002:a05:6214:300c:b0:56a:d22b:5821 with SMTP id ke12-20020a056214300c00b0056ad22b5821mr11412159qvb.22.1675590365134;
        Sun, 05 Feb 2023 01:46:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675590365; cv=none;
        d=google.com; s=arc-20160816;
        b=sBlVQQkxqCccf+Wg+mCcLFLoSqikCYZD4Aod06HaSat69QABzGvZEAbhirpSI1vKz0
         RZi2squ4/mOvUB8L8JI1JnLzaujQ5KLTIHT6Kn7ZgfMPPF8LfKwzdnE+ZIMUGUUSy2Q8
         aascV5sTHFyEK8eah8VBHnm6ulFetWJK5hvN6lHka9NQmJTHIvrtmEEinDwlBuAdBsQ/
         c2p6BEuS2+/mQS4b4nvYfTicy172Bpi87f/S3UENMBU2r1Pxa4TxKN/yHMWSZHP/sMML
         XylQfyYQZlnZBjVOyY9nKR8NNuZYOiy3OSYBAu8tzMegKvKx2zb+q+jD3nlh3svmGrvM
         OkMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=oZmVbGTM1GrVSDIJ7xJyWQW2x7fLoxHdZgxSqMELtoo=;
        b=UCy7fGV6k7Zxkzx93p4L2iH1PXSxrKjzEKqv5SB9LbT2Ktc37s3E1CPbqTnu1GsT1o
         kSz5gx+ISWvvg2EwttiIn9IoBfz/kgc113PJpV6fo+zlXMEmawgpAheoHGRrmQgxO9Ov
         BnKsuatltKRdDkrm+ZkIIaxyMx1NnIywjnjAa+BXZxY7X9GgqfotB+v4RlgNNuyAiQFC
         BYyQmmOWOok56Bs29KtvhLW3o1ybwkEtPUzRw4hwXTnClU3dVx9PhFAyAbbijzvJ8PDL
         UhgUzIwwQKtfQo4QhhcsyOUbIBvj0uUT7/hpAszojglukI1Bi8W2BZd7nnRfs8ZVjqW9
         NWvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=Fi2u5moW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a18-20020a0ca992000000b0056ac181103bsi3652081qvb.39.2023.02.05.01.46.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Feb 2023 01:46:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=Fi2u5moW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pOba7-0003gZ-Km; Sun, 05 Feb 2023 04:45:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3nnrfYwgKCDclfhlmTYTZhhZeX.VhfjXfn-TkfghgZgn.hkZ@flex--smostafa.bounces.google.com>)
 id 1pOba6-0003eG-4u
 for qemu-arm@nongnu.org; Sun, 05 Feb 2023 04:45:06 -0500
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3nnrfYwgKCDclfhlmTYTZhhZeX.VhfjXfn-TkfghgZgn.hkZ@flex--smostafa.bounces.google.com>)
 id 1pOba3-00017O-J2
 for qemu-arm@nongnu.org; Sun, 05 Feb 2023 04:45:04 -0500
Received: by mail-wm1-x34a.google.com with SMTP id
 n7-20020a05600c3b8700b003dc55dcb298so5002598wms.8
 for <qemu-arm@nongnu.org>; Sun, 05 Feb 2023 01:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=oZmVbGTM1GrVSDIJ7xJyWQW2x7fLoxHdZgxSqMELtoo=;
 b=Fi2u5moWNgChc+gmWxLvDu2+LkatRAoQchz3NaL2TVwS8jNEPy/RJuGR4js5jsknEY
 DHTq2IPjiP+po/Uul3CGDkIKAdKH9wJ2XYgkZ4g4rthAH4CvR6MCrG7h2YDqRLEbeqz7
 ZsuUN2dk2Qg1aMcTx5+4ZFS7y21zWJuGHaSQHZQSDJPERqN/JAtDwKiPn1w9nWwub2zP
 uCJQw42GVc8xkJBz+Bw+TJQZDGSBExy7BHphfLd0vGRtGOb2Tp1a6WtsiU1NHlW3m10x
 vkkKmpGrRo2Jvg4QvEX6+hTqNZ59oJZMjtzX3mmmeYDgDtmu6AKzopHT9MRT357+OLuo
 Ih1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oZmVbGTM1GrVSDIJ7xJyWQW2x7fLoxHdZgxSqMELtoo=;
 b=j3hzWOoNV8UpCi6O/sUVJNzAZSzVKcgb5vrbjR79/Ane2MIzP9s+D46vZ+ZvAov8CQ
 pvJlRpob3TBTutRkLaXBpbDaX57ibJQYTg9ajLNLfMbpt6MpRwIm7NpxGdQfK+5lW3zo
 ++b3YAyf/b6atHVXpLClw+C8aQirSFqtp0WHKlIPi45dBoFuD5hM1oE50esbJndIwQNd
 Q+yYHfB7zLsHMocRIxFZ2ztoe8A2/tn4/MoatIxufKD11WiHKmYI1tmKUu8qpLdxG+mc
 Q/VO2H+ek56eqPd/RQrGuCrq0XePEBUZZGDW3ZeJCjfVY3mTcrBRQmmoijzeeupIo9u0
 rvfg==
X-Gm-Message-State: AO0yUKUzJLGoq+9vZQ+Gxx5i9tny3cvJwg8UzA6xbfDTY98D4XS8EeOh
 6ex4LV2sDUuYXQj/gjYRL4UchlDmusUtkA==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:198f:b0:3dc:58f0:e94d with SMTP
 id t15-20020a05600c198f00b003dc58f0e94dmr686402wmq.30.1675590302357; Sun, 05
 Feb 2023 01:45:02 -0800 (PST)
Date: Sun,  5 Feb 2023 09:44:02 +0000
In-Reply-To: <20230205094411.793816-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230205094411.793816-1-smostafa@google.com>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230205094411.793816-8-smostafa@google.com>
Subject: [RFC PATCH 07/16] hw/arm/smmuv3: Check validity of stage-2 page table
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::34a;
 envelope-from=3nnrfYwgKCDclfhlmTYTZhhZeX.VhfjXfn-TkfghgZgn.hkZ@flex--smostafa.bounces.google.com;
 helo=mail-wm1-x34a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: DJd4Og0RiBSi

Check if with the configured start level, ia_bits and granularity we
can have a valid page table as described in ARM ARM D8.2 Translation
process.
The idea is to see for the highest possible number of IPA bits, how
many concatenated tables we would need, if it is more than 16, then
this is not possible.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 6633fe40fa..c49b341287 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -341,6 +341,28 @@ static int smmu_get_cd(SMMUv3State *s, STE *ste, uint32_t ssid,
     return 0;
 }
 
+/*
+ * Return true if s2 page table config is valid.
+ * This checks with the configured start level, ia_bits and granularity we can
+ * have a valid page table as described in ARM ARM D8.2 Translation process.
+ * The idea here is to see for the highest possible number of IPA bits, how
+ * many concatenated tables we would need, if it is more than 16, then this is
+ * not possible.
+ */
+static bool s2_pgtable_config_valid(uint8_t sl0, uint8_t t0sz, uint8_t gran)
+{
+    int level = get_start_level(sl0, gran);
+    uint64_t ia_bits = 64 - t0sz;
+    uint64_t mx = (1ULL << ia_bits) - 1;
+    int nr_concat = pgd_idx(level, gran, mx) + 1;
+
+    if (nr_concat > SMMU_MAX_S2_CONCAT) {
+        return false;
+    }
+
+    return true;
+}
+
 /* Returns < 0 in case of invalid STE, 0 otherwise */
 static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
                       STE *ste, SMMUEventInfo *event)
@@ -407,6 +429,13 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
             goto bad_ste;
         }
 
+        if (!s2_pgtable_config_valid(cfg->s2cfg.sl0, cfg->s2cfg.tsz,
+                                     cfg->s2cfg.granule_sz)) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "SMMUv3 STE stage 2 config not valid!\n");
+            goto bad_ste;
+        }
+
         /* This is still here as stage 2 has not been fully enabled yet. */
         qemu_log_mask(LOG_UNIMP, "SMMUv3 does not support stage 2 yet\n");
         goto bad_ste;
-- 
2.39.1.519.gcb327c4b5f-goog

