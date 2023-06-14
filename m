Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp358607ejt;
        Wed, 14 Jun 2023 15:42:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5rCcGstKqdm6lM7+Y/6VXQiMxrnHHeh2umbgdhlDTyHJiev31UUSGagdCBWgkBfeu8xwyV
X-Received: by 2002:a05:622a:307:b0:3f6:b12f:fae0 with SMTP id q7-20020a05622a030700b003f6b12ffae0mr4309820qtw.62.1686782529845;
        Wed, 14 Jun 2023 15:42:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686782529; cv=none;
        d=google.com; s=arc-20160816;
        b=tXBbtjuCctp12YeAvF/1GmJA0a/p+SHYd0A7ShwiPNO7yI/6HAyzo5UxFWVVkkfJTO
         A2cvVcrLQyDPht9MfDqHRem9Dr7lySPbsH9JPR3ymgyU0opLiljR6l7IwKNXcCtrVIrl
         e1fAfKFIfBqbJWH3/Z/S2Tw4ImT8JDHZWBvarAJq6c042rP3H9/PFRxbjDcppJqSgvhK
         4RmuBupOfA46/z8rbgtwy1rrqD44P3rI3St/Q0prqNCsctSwVrGrx+Ktz/Qklo72NRYM
         kue2l1WuNexzu6JFwClr5GM5a8aIgE/dhxJ6n5Q4woRtpnAPdp7Zj0U/UryVBxi6bM7q
         8zhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:content-transfer-encoding:precedence
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=etEMVVHHBNr+T1MBiSDqNbC8EI942exlpThM1teeV3Y=;
        b=Wsla/FODlwW53Uu3b61B/xQ87Zy1EnIPcDlpP/wqzlL+hTQR4EalIhch4RFroSpMGJ
         cyDc54LEfYpA9ip2ycIuRxRSY0KriMcWh2eHQApRVTDGeucJ9GlH3NqRHOIYDp6InJwj
         JYfRSNj17gK/yW/qYAIWT77ZGEiHlGwZSGJ2hZIr3JpCuScCzq+cNelL2fEcLP6EOxfc
         7TX9G0IwZGQwpv1tqt3LsSFcYot3rlu5yv4rvK3SHpBUT+MiphE10IgjUphUL5nJwoFj
         bcUg2m21Pu3U5BUJ/+PMKWt+XhLiZX6ldhwOg0kF37ShfuJb9M9NC7LHvm44KhSG3ZDn
         nLaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@amazon.com header.s=amazon201209 header.b="o/diAMIU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e19-20020ac85993000000b003f6a844cf5dsi9046629qte.271.2023.06.14.15.42.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Jun 2023 15:42:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amazon.com header.s=amazon201209 header.b="o/diAMIU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q9ZAq-0001EQ-OA; Wed, 14 Jun 2023 18:41:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=52269c73c=graf@amazon.de>)
 id 1q9ZAm-0001DR-It; Wed, 14 Jun 2023 18:41:05 -0400
Received: from smtp-fw-52003.amazon.com ([52.119.213.152])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=52269c73c=graf@amazon.de>)
 id 1q9ZAj-00056P-LR; Wed, 14 Jun 2023 18:41:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1686782462; x=1718318462;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=etEMVVHHBNr+T1MBiSDqNbC8EI942exlpThM1teeV3Y=;
 b=o/diAMIUKUPv7mf3j5DM6EccCrH7Htc1h2UTRhefnyEnJ5f/tzH0kE3H
 Ux51oZrwHxzicH4JCPm5J6jeEDylBnvdxQvT98XHbi0kqvqJUa54ZOR7N
 ZWxOoc8noeTvUVkkRHH8SRA+aXR5XJeg2z1snERC9tPE2t7tMPqwAWCh2 k=;
X-IronPort-AV: E=Sophos;i="6.00,243,1681171200"; d="scan'208";a="590667089"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-pdx-2b-m6i4x-0ec33b60.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-52003.iad7.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 22:40:56 +0000
Received: from EX19MTAUWB001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-pdx-2b-m6i4x-0ec33b60.us-west-2.amazon.com (Postfix)
 with ESMTPS id 7A743A0A89; Wed, 14 Jun 2023 22:40:54 +0000 (UTC)
Received: from EX19D020UWC004.ant.amazon.com (10.13.138.149) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 14 Jun 2023 22:40:48 +0000
Received: from dev-dsk-graf-1a-5ce218e4.eu-west-1.amazon.com (10.253.83.51) by
 EX19D020UWC004.ant.amazon.com (10.13.138.149) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 14 Jun 2023 22:40:45 +0000
From: Alexander Graf <graf@amazon.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-block@nongnu.org>, <qemu-arm@nongnu.org>, Cameron Esfahani
 <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Kevin Wolf
 <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, "Peter
 Maydell" <peter.maydell@linaro.org>
Subject: [PATCH 03/12] hvf: Increase number of possible memory slots
Date: Wed, 14 Jun 2023 22:40:29 +0000
Message-ID: <20230614224038.86148-4-graf@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230614224038.86148-1-graf@amazon.com>
References: <20230614224038.86148-1-graf@amazon.com>
MIME-Version: 1.0
X-Originating-IP: [10.253.83.51]
X-ClientProxiedBy: EX19D035UWA004.ant.amazon.com (10.13.139.109) To
 EX19D020UWC004.ant.amazon.com (10.13.138.149)
Precedence: Bulk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=52.119.213.152;
 envelope-from=prvs=52269c73c=graf@amazon.de; helo=smtp-fw-52003.amazon.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
X-TUID: CWLX4oJC+jeX

For PVG we will need more than the current 32 possible memory slots.
Bump the limit to 512 instead.

Signed-off-by: Alexander Graf <graf@amazon.com>
---
 accel/hvf/hvf-accel-ops.c | 2 +-
 include/sysemu/hvf_int.h  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 9c3da03c94..bf0caaa852 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -88,7 +88,7 @@ struct mac_slot {
     uint64_t gva;
 };
 
-struct mac_slot mac_slots[32];
+struct mac_slot mac_slots[512];
 
 static int do_hvf_set_memory(hvf_slot *slot, hv_memory_flags_t flags)
 {
diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index 6ab119e49f..c7623a2c09 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -40,7 +40,7 @@ typedef struct hvf_vcpu_caps {
 
 struct HVFState {
     AccelState parent;
-    hvf_slot slots[32];
+    hvf_slot slots[512];
     int num_slots;
 
     hvf_vcpu_caps *hvf_caps;
-- 
2.39.2 (Apple Git-143)




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879



