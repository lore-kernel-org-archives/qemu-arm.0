Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4028602ejc;
        Sun, 26 Feb 2023 14:07:52 -0800 (PST)
X-Google-Smtp-Source: AK7set9A+Aqrk85KSpaAZuNHgCik5fEY08zufkOD8DeKsk1L9E44O9rrpjxWO+MgvWjun6WOcRTC
X-Received: by 2002:a05:622a:54f:b0:3bf:c407:10ca with SMTP id m15-20020a05622a054f00b003bfc40710camr11431088qtx.10.1677449272523;
        Sun, 26 Feb 2023 14:07:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677449272; cv=none;
        d=google.com; s=arc-20160816;
        b=aMb91eRZrXTMMJmcQre4tOlIJTidROGFskQ+v+SXbmOvK60B6ZmvDT5GbJ4OV4Xeby
         aSq9cFGP8aDUus6RNpctY4ztnce9yL7pG/+7Cq8IbPpzM9SJPhhZToFg0HHEJYYN0fRn
         hmFSaEFwmhBVl/RpgB689IN205A+bT4pft1mkFI8rQFdUVZsp9jIOBI1tPoJXPm2H0x9
         0jVyJV4NxJp31YX7/1U5JhMqiTY0POAJBkj0KEKn3sHJg5K9DdWAGJ2RsVDVn9v1K02i
         FPRKqMInuZR+4nl5VbGAAKJ32v6ZDkOEAn8svBJUu+zLzXbIPQh2Hk/rXKTttwHaFjUR
         S9sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=26w0ZsK+yJV9JuE2L/gekg4quDGDsIKNMc4eL5/NDRI=;
        b=DhER0Uy/74HhYy26y2+XuXTFkBXZzRDtar1qdUtnU9omPAXOimRc9hlt/o3NxRmvuA
         7T2vY0hAlcisFm264dSBcbZfDTGcqXRQXidUPphEZhxvEfY2BVkSCrFKEfvv1Za8p8zU
         5DqNB0Hjn8qPw2g6WyKAkgfUhf/nx3aJ42tZmpteGWodqK6UFn+l7oAtxB/GPVyVJqsC
         eRxLyP34X2NjZAZzINAFtJGDAxYzvEgHNRtIQG+Irl/tqMi3tT0Xbhzi3I8keoeCQxUO
         gLYiGbPBWzZIG0Dn8c1vwijghMzTZKbQXQ4uJJuJA5ECPd+gPX+Ooy0l06dQOWP8WZwX
         uNpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=CTSGuKkV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e9-20020ac85dc9000000b003b9b48eba27si5043347qtx.103.2023.02.26.14.07.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 14:07:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=CTSGuKkV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWPAv-0002Uw-OO; Sun, 26 Feb 2023 17:07:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Etj7YwgKCNcLFHLM3839HH9E7.5HFJ7FN-3KFGHG9GN.HK9@flex--smostafa.bounces.google.com>)
 id 1pWPAs-0002TI-7r
 for qemu-arm@nongnu.org; Sun, 26 Feb 2023 17:07:19 -0500
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Etj7YwgKCNcLFHLM3839HH9E7.5HFJ7FN-3KFGHG9GN.HK9@flex--smostafa.bounces.google.com>)
 id 1pWPAq-0003vl-Mq
 for qemu-arm@nongnu.org; Sun, 26 Feb 2023 17:07:17 -0500
Received: by mail-wm1-x349.google.com with SMTP id
 r7-20020a05600c35c700b003eb3f2c4fb4so862796wmq.6
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 14:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=26w0ZsK+yJV9JuE2L/gekg4quDGDsIKNMc4eL5/NDRI=;
 b=CTSGuKkVgdYZQi1dCSGiHEk+sdX8iCW/vK4nvGaGetkrr67LvWKZCvm3yuR9nNile1
 XOpt0G78roqLs46t5FqFBUbleob/fHH1ewnvq+1FujnFhUjr9luhQSaSP9pyKLunbEYu
 w+qFfeTWI0na/1oNXmHxDRb6OgaPy+5hea4cUEit1KQ6AB3QA0nGn3mDAMUGV5aNmAve
 Cgu9EdeGG1DakBM9WuJAtiOxPA+B7Gk9i6RWpiQfTuobvmNBgeHbz8dTQhe5aiO/ZQp6
 nLxQABLxd0L9czFDkuxKEcJgQRC7oFudK40VIPbK2k5zc14q5mT2riffLWRWeRkv7sLf
 pD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=26w0ZsK+yJV9JuE2L/gekg4quDGDsIKNMc4eL5/NDRI=;
 b=opAojcNdBlfd/z4k6vTAEPQln0+3EU3P6zcGbkr6cJVuZNpNl+X/3a1iFlgsjGPEoW
 FSFPNRHGRi/FgkYA5qTBGcDZkr5yvekuNIQ/YDqa2goDpAGdeUl521tNMkEn2OeTledU
 aoW1M3337xnMPA5/GWGfg0I09cKDWhWFeulnUi5me0Vn/BcbIdxnD2W/4UejlrNwEm1P
 gXMuVRqGedXOlwW1HHgEpCfY7B5VlNlYquE3lSGoxSi1ku+U/fnWnNspI9J7QsV82wvd
 9kMaZ+lFeMsfs2VxES2JKMAlOFJWOoM7fouCGm+0Pm+vaXrLq1p7YBFGv6IwiXNHyCOr
 SaTw==
X-Gm-Message-State: AO0yUKVr2dpUZDWXEytxU4NTNPbUFB7YjhJ5+M9icYYeHUQAfI7d75tN
 Z9xHJQlyq1mQymeQk5a5PTC8iogHO0XdPA==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a5d:4205:0:b0:2c9:bd6e:83c0 with SMTP id
 n5-20020a5d4205000000b002c9bd6e83c0mr547690wrq.3.1677449234920; Sun, 26 Feb
 2023 14:07:14 -0800 (PST)
Date: Sun, 26 Feb 2023 22:06:45 +0000
In-Reply-To: <20230226220650.1480786-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230226220650.1480786-1-smostafa@google.com>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
Message-ID: <20230226220650.1480786-7-smostafa@google.com>
Subject: [RFC PATCH v2 06/11] hw/arm/smmuv3: Make TLB lookup work for stage-2
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::349;
 envelope-from=3Etj7YwgKCNcLFHLM3839HH9E7.5HFJ7FN-3KFGHG9GN.HK9@flex--smostafa.bounces.google.com;
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
X-TUID: pa2THlQxMWSc

Right now, either stage-1 or stage-2 are supported, this simplifies
how we can deal with TLBs.
This patch makes TLB lookup work if stage-2 is enabled instead of
stage-1.
TLB lookup is done before a PTW, if a valid entry is found we won't
do the PTW.
To be able to do TLB lookup, we need the correct tagging info, as
granularity and input size, so we get this based on the supported
translation stage. The TLB entries are added correctly from each
stage PTW.

When nested translation is supported, this would need to change, for
example if we go with a combined TLB implementation, we would need to
use the min of the granularities in TLB.

As stage-2 shouldn't be tagged by ASID, it will be set to -1 if S1P
is not enabled.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
Changes in v2:
- check if S1 is enabled(not supported) when reading S1 TT.
---
 hw/arm/smmuv3.c | 45 ++++++++++++++++++++++++++++++++++-----------
 1 file changed, 34 insertions(+), 11 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index dc74a5442d..ce193e9598 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -697,6 +697,9 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
     STE ste;
     CD cd;
 
+    /* ASID defaults to -1 (if s1 is not supported). */
+    cfg->asid = -1;
+
     ret = smmu_find_ste(s, sid, &ste, event);
     if (ret) {
         return ret;
@@ -787,6 +790,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     SMMUTLBEntry *cached_entry = NULL;
     SMMUTransTableInfo *tt;
     SMMUTransCfg *cfg = NULL;
+    uint8_t granule_sz, tsz;
     IOMMUTLBEntry entry = {
         .target_as = &address_space_memory,
         .iova = addr,
@@ -822,21 +826,40 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
         goto epilogue;
     }
 
-    tt = select_tt(cfg, addr);
-    if (!tt) {
-        if (cfg->record_faults) {
-            event.type = SMMU_EVT_F_TRANSLATION;
-            event.u.f_translation.addr = addr;
-            event.u.f_translation.rnw = flag & 0x1;
+    if (cfg->stage == 1) {
+        /* Select stage1 translation table. */
+        tt = select_tt(cfg, addr);
+        if (!tt) {
+            if (cfg->record_faults) {
+                event.type = SMMU_EVT_F_TRANSLATION;
+                event.u.f_translation.addr = addr;
+                event.u.f_translation.rnw = flag & 0x1;
+            }
+            status = SMMU_TRANS_ERROR;
+            goto epilogue;
         }
-        status = SMMU_TRANS_ERROR;
-        goto epilogue;
-    }
+        granule_sz = tt->granule_sz;
+        tsz = tt->tsz;
 
-    page_mask = (1ULL << (tt->granule_sz)) - 1;
+    } else {
+        /* Stage2. */
+        granule_sz = cfg->s2cfg.granule_sz;
+        tsz = cfg->s2cfg.tsz;
+    }
+    /*
+     * TLB lookup looks for granule and input size for a translation stage,
+     * as only one stage is supported right now, choose the right values
+     * from the configuration.
+     */
+    page_mask = (1ULL << granule_sz) - 1;
     aligned_addr = addr & ~page_mask;
 
-    cached_entry = smmu_iotlb_lookup(bs, cfg, tt, aligned_addr);
+    SMMUTransTableInfo temp = {
+        .granule_sz = granule_sz,
+        .tsz = tsz,
+    };
+
+    cached_entry = smmu_iotlb_lookup(bs, cfg, &temp, aligned_addr);
     if (cached_entry) {
         if ((flag & IOMMU_WO) && !(cached_entry->entry.perm & IOMMU_WO)) {
             status = SMMU_TRANS_ERROR;
-- 
2.39.2.637.g21b0678d19-goog

