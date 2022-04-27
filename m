Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp909234lfu;
        Wed, 27 Apr 2022 04:18:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTzTD8aM1uR2Xn9WMu9rN4Gh/iUhHwh9iCFUQ3Fpe7ykKPeAPlPguX4FCKiLQkt8S1/hMW
X-Received: by 2002:ad4:53c5:0:b0:429:d6fb:f0a0 with SMTP id k5-20020ad453c5000000b00429d6fbf0a0mr19906565qvv.108.1651058324072;
        Wed, 27 Apr 2022 04:18:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651058324; cv=none;
        d=google.com; s=arc-20160816;
        b=QGUA+SBCIWud5LNahH44ijtRfK5Cqwl/oUIRq+YHD12yrku44bVIUS77p2k/X87Ure
         4Z2w5FAGDVZj4i/GNYMZ3mZmqlMRL7ZCHr6jQLfcqh1X2rjhZCkAdeCMSpqF+jnBa432
         TDhh6MSWLv3i7HZmTulm/DKAptIkwfmDvXUvx+9lTA7AHXJpSl8AnG7QBbWhsAum228f
         8HorWysD8Vj5wSuTYzagy8k7l74MeCO+yBZq6mgwVaPjS/sB0ZPfwg+BI/GisELzjkHR
         KziUrp7zpd24O9MQYcDJDJYaeNlbtTNjxHTpkoP45f2rgZvl7gLAfMS3mM0vt9EAZppE
         oHEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=BXWQKQjiGW6dpjyjLkpuXMnH49wsJoaisgXWPQdjm7k=;
        b=kckW4giTGlBnhrmUpa9UAKn0TRlbW3VuQ4MEvQI6unIjbmjrXl55MwNycn/a3LdTFj
         DZcv7f+79pYzqF3Ee/jacs570Ex1Wu4YwMBCNW7F4l/WHjOXuU898mfLIv8KXMQjLEbK
         GgD1AYia0q4HfjmhN3GHJLpOVWUzuVqLieDqPWsZt4Z5qxSYCSiGybcer0x1r3ct7Kw+
         FyL0Drhm/ZCv+DhNJrHWif7E3O6WhnasCiZYkcSzaAPQN7JjM8t8wttQNInRM0RsDnig
         uVVMcVonS8tTB5fMyXuhPv3YhLvyc4mnaAKOUNDwsiqhbp8gpmIZKCW4RF958surBJmB
         LcxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JpgYCvw2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kj25-20020a056214529900b0045639bbb2e9si280788qvb.307.2022.04.27.04.18.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Apr 2022 04:18:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JpgYCvw2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njfgx-0007B8-BN
	for alex.bennee@linaro.org; Wed, 27 Apr 2022 07:18:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1njfg7-0006Mr-Ct
 for qemu-arm@nongnu.org; Wed, 27 Apr 2022 07:17:51 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1njfg2-0007N3-Tb
 for qemu-arm@nongnu.org; Wed, 27 Apr 2022 07:17:48 -0400
Received: by mail-wr1-x429.google.com with SMTP id k2so2019628wrd.5
 for <qemu-arm@nongnu.org>; Wed, 27 Apr 2022 04:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BXWQKQjiGW6dpjyjLkpuXMnH49wsJoaisgXWPQdjm7k=;
 b=JpgYCvw26S0gXkW5kga2CEi7PCpNtOVVJa7pRXCgFd/WkAVuuxjPq0ZZK3mnjqpwHR
 j/Ra2cfxUwrH4XUjxr0J6K3Dm7L1Cxe5vMi0/UXcPvUq2g0TGKJl/r0PmLPQX9AffKde
 Y1gFLAjYNLHf502VpcDJfB6LvFtBh4fZlaBxX9Z0Rl1LxIJfDbz9nlSzZO759W3BkvFU
 oZCca2onGod5lXfDo8Tk0dYyE7DzrkCDxoXAu6TJyCKBg8R0yK/tlaBFvgDh6COkJkuL
 6Frnmk2Lj56LGpsiYo+q9v4j5V1AAxGp+zDA9g0cWie8547L0f29RSoB66Cf1jyrDA4J
 b6Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BXWQKQjiGW6dpjyjLkpuXMnH49wsJoaisgXWPQdjm7k=;
 b=6lHuCxmXH8ESs/S1p2ItpJyw8Mk8bg5JM7wjONe/YVelSzrYwv5pY75OB9cD4TmJOV
 FIh3Kigxzw4dwHL68g+SkzL6kDOhRU6NOfHvg8l2ikY6/qRXSs8dZ27DRxJxXWoGvYxA
 pTSP0HYLR+1ADaudArnpQurmjPBK+veLZ+noYKuWCuO1nXkhDboC5w1WTV/MSusCp+aS
 px50QkqSFYQlp85y8erEJqMVkL3dLJrsNUDA8PZcy3QnzMPpk1Ql18Wn0Z55qoBb7jxq
 tiGwsRp3F8WHcLWerRYgVcgAWJs5UC/a1NomYkphvJFBbpY9J+SIETVJmFQQikixshkA
 ysFA==
X-Gm-Message-State: AOAM533nwFXzyuZdFpHbsPj5rpDfzbpx4V9kujemDPCm8ajglcUM1P77
 5f/7681DkzJKq9gG5cS/XHAlhw==
X-Received: by 2002:a5d:64cb:0:b0:20a:903f:5d70 with SMTP id
 f11-20020a5d64cb000000b0020a903f5d70mr21782997wri.138.1651058265114; 
 Wed, 27 Apr 2022 04:17:45 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id
 d17-20020adfa351000000b0020adbfb586fsm8313104wrb.117.2022.04.27.04.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 04:17:44 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH 1/2] hw/arm/smmuv3: Cache event fault record
Date: Wed, 27 Apr 2022 12:15:43 +0100
Message-Id: <20220427111543.124620-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zd5/BkUZDs8U

The Record bit in the Context Descriptor tells the SMMU to report fault
events to the event queue. Since we don't cache the Record bit at the
moment, access faults from a cached Context Descriptor are never
reported. Store the Record bit in the cached SMMUTransCfg.

Fixes: 9bde7f0674fe ("hw/arm/smmuv3: Implement translate callback")
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/smmuv3-internal.h     |  1 -
 include/hw/arm/smmu-common.h |  1 +
 hw/arm/smmuv3.c              | 14 +++++++-------
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index d1885ae3f2..6de52bbf4d 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -387,7 +387,6 @@ typedef struct SMMUEventInfo {
     SMMUEventType type;
     uint32_t sid;
     bool recorded;
-    bool record_trans_faults;
     bool inval_ste_allowed;
     union {
         struct {
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 706be3c6d0..21e62342e9 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -71,6 +71,7 @@ typedef struct SMMUTransCfg {
     bool disabled;             /* smmu is disabled */
     bool bypassed;             /* translation is bypassed */
     bool aborted;              /* translation is aborted */
+    bool record_faults;        /* record fault events */
     uint64_t ttb;              /* TT base address */
     uint8_t oas;               /* output address width */
     uint8_t tbi;               /* Top Byte Ignore */
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 707eb430c2..8b1d8103dc 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -527,7 +527,7 @@ static int decode_cd(SMMUTransCfg *cfg, CD *cd, SMMUEventInfo *event)
         trace_smmuv3_decode_cd_tt(i, tt->tsz, tt->ttb, tt->granule_sz, tt->had);
     }
 
-    event->record_trans_faults = CD_R(cd);
+    cfg->record_faults = CD_R(cd);
 
     return 0;
 
@@ -680,7 +680,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
 
     tt = select_tt(cfg, addr);
     if (!tt) {
-        if (event.record_trans_faults) {
+        if (cfg->record_faults) {
             event.type = SMMU_EVT_F_TRANSLATION;
             event.u.f_translation.addr = addr;
             event.u.f_translation.rnw = flag & 0x1;
@@ -696,7 +696,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     if (cached_entry) {
         if ((flag & IOMMU_WO) && !(cached_entry->entry.perm & IOMMU_WO)) {
             status = SMMU_TRANS_ERROR;
-            if (event.record_trans_faults) {
+            if (cfg->record_faults) {
                 event.type = SMMU_EVT_F_PERMISSION;
                 event.u.f_permission.addr = addr;
                 event.u.f_permission.rnw = flag & 0x1;
@@ -720,28 +720,28 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
             event.u.f_walk_eabt.addr2 = ptw_info.addr;
             break;
         case SMMU_PTW_ERR_TRANSLATION:
-            if (event.record_trans_faults) {
+            if (cfg->record_faults) {
                 event.type = SMMU_EVT_F_TRANSLATION;
                 event.u.f_translation.addr = addr;
                 event.u.f_translation.rnw = flag & 0x1;
             }
             break;
         case SMMU_PTW_ERR_ADDR_SIZE:
-            if (event.record_trans_faults) {
+            if (cfg->record_faults) {
                 event.type = SMMU_EVT_F_ADDR_SIZE;
                 event.u.f_addr_size.addr = addr;
                 event.u.f_addr_size.rnw = flag & 0x1;
             }
             break;
         case SMMU_PTW_ERR_ACCESS:
-            if (event.record_trans_faults) {
+            if (cfg->record_faults) {
                 event.type = SMMU_EVT_F_ACCESS;
                 event.u.f_access.addr = addr;
                 event.u.f_access.rnw = flag & 0x1;
             }
             break;
         case SMMU_PTW_ERR_PERMISSION:
-            if (event.record_trans_faults) {
+            if (cfg->record_faults) {
                 event.type = SMMU_EVT_F_PERMISSION;
                 event.u.f_permission.addr = addr;
                 event.u.f_permission.rnw = flag & 0x1;
-- 
2.35.1

