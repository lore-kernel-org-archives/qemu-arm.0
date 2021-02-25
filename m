Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp251062lfg;
        Thu, 25 Feb 2021 03:11:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxCEToXKQAilzO8l4ErwsVVbUWmxowA6aeoV3s4fXJz0x7xbKX7kF+Z0KU31Ef1mddtrWQE
X-Received: by 2002:a05:6830:16d6:: with SMTP id l22mr1748197otr.121.1614251517130;
        Thu, 25 Feb 2021 03:11:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614251517; cv=none;
        d=google.com; s=arc-20160816;
        b=uydu+tHki7zzIcHUO9KUsw0dVXQ1F+WLFz1wOs921BcZygMU5wUbElAFhcMQyVs9M9
         W+QwA73TdPUxnvrkrMYV0ha4nBvkHkMGuHJWQUwB1svc2403iX83nZaaSOHmjfWR5+rl
         MdC1w6rcaXenB3Add9PAaiso/KV3I8G484EoPu5ToQxpSnv4jVgt2gEEW8uxH9wy07mC
         C9YqeLLEr1YrPwRP+YqHP+pJxHNEltQ/0U1XKHJuFXxzy3nL3NVXSiIn2XOSkNykFzVr
         1H9nYjvG8C23HcD2AHPcsl/vxOthiG07k3pgkTHUDpBum3+r4Ha6t+Lo/mSJ2+WwOkga
         HMEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ucnkIMVDxxULLy56H1j/WOiURiBi560G1f25zjOBI0g=;
        b=CFvP1psRrPTDXOMwn9yXNRBdKx+PDyqACvkGb2kj7Ox2OSkvBlO21b6sOin6C/pWGM
         yS9NEhlygKOzdw/qbH3/6GbdlNxJQ7d6s0PryfkvoF20QUsM2wBwZOuZ8y/1hkrmS2ui
         68ZEumrt5tnUT87PE0P8riy/lvT0jwgAwNEiWRNUEaN2gI8jklxuZTxiv87ymhFAFMdy
         xFH94Q+R5DF1hbPudez2uI7HmvLijVyR7bZz/wZUcL6nM5m5vBdwJWJSTObJjZGHbD9h
         t0JPOZRWOiwpjWL2ygRclEChBSKG2K0GHgaRJgrw7NqR4jPzPdLu+tEHXnOZEgrtoSg6
         94cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=b6NR1ZVu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o13si3836261oik.44.2021.02.25.03.11.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Feb 2021 03:11:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=b6NR1ZVu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFEYm-0007ct-E5
	for alex.bennee@linaro.org; Thu, 25 Feb 2021 06:11:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFEKO-0002Qr-1I
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:57:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFEKM-0006Wh-AM
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:57:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614250621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ucnkIMVDxxULLy56H1j/WOiURiBi560G1f25zjOBI0g=;
 b=b6NR1ZVuQR8J+7djMPzlpk970QvuuwFbG3J8b5trH+HUR2JgPgh8h6nOETYpJ11nM7XJUH
 NiPtHSICbLwL9noYtvl77xZ6gD2fyPIhbA59ECuhRuV9eAEyunC5K721kTkiBZjLdu5WN7
 53UPvF4R22J5pbVJz8QdDKM36TqGf3Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-puUwa2AmMHGhA1BhgzM75A-1; Thu, 25 Feb 2021 05:56:59 -0500
X-MC-Unique: puUwa2AmMHGhA1BhgzM75A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDF0B107ACC7;
 Thu, 25 Feb 2021 10:56:57 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-150.ams2.redhat.com [10.36.112.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A7B95D9D7;
 Thu, 25 Feb 2021 10:56:51 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com
Subject: [RFC v8 21/28] hw/arm/smmuv3: Store the PASID table GPA in the
 translation config
Date: Thu, 25 Feb 2021 11:52:26 +0100
Message-Id: <20210225105233.650545-22-eric.auger@redhat.com>
In-Reply-To: <20210225105233.650545-1-eric.auger@redhat.com>
References: <20210225105233.650545-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: jean-philippe@linaro.org, tnowicki@marvell.com, maz@kernel.org,
 jiangkunkun@huawei.com, zhangfei.gao@foxmail.com, peterx@redhat.com,
 shameerali.kolothum.thodi@huawei.com, yuzenghui@huawei.com,
 zhangfei.gao@linaro.org, will@kernel.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g/QdyiaJoM3V

For VFIO integration we will need to pass the Context Descriptor (CD)
table GPA to the host. The CD table is also referred to as the PASID
table. Its GPA corresponds to the s1ctrptr field of the Stream Table
Entry. So let's decode and store it in the configuration structure.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3.c              | 1 +
 include/hw/arm/smmu-common.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index a998e237f0..ab0e1c5818 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -358,6 +358,7 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
                       "SMMUv3 S1 stalling fault model not allowed yet\n");
         goto bad_ste;
     }
+    cfg->s1ctxptr = STE_CTXPTR(ste);
     return 0;
 
 bad_ste:
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 706be3c6d0..d578339935 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -76,6 +76,7 @@ typedef struct SMMUTransCfg {
     uint8_t tbi;               /* Top Byte Ignore */
     uint16_t asid;
     SMMUTransTableInfo tt[2];
+    dma_addr_t s1ctxptr;
     uint32_t iotlb_hits;       /* counts IOTLB hits for this asid */
     uint32_t iotlb_misses;     /* counts IOTLB misses for this asid */
 } SMMUTransCfg;
-- 
2.26.2

