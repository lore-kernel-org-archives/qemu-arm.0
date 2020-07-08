Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp841260lfm;
        Wed, 8 Jul 2020 15:50:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxD3prDgEk/CGTa17CPWqZqSa5129RQNR+R2YPlTUnfFEPWxcH+1XF2e2qGGiSSUS+VjFt7
X-Received: by 2002:a25:c606:: with SMTP id k6mr49658867ybf.0.1594248659077;
        Wed, 08 Jul 2020 15:50:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594248659; cv=none;
        d=google.com; s=arc-20160816;
        b=QpzKtxR51PHVjaI0ZD1TN6fTtzJitqmNImXuzN5IyUzrtKVtItNWcpPdmCp0gE4zVA
         XrvrSEzVG2xBFNA7mh5k485dAR9QNesnBb29/fbS8C92nt4cVlEapnMpGUKI/d1s3H2J
         UmQPxGS39v44UBXS6B7pC/7Qr1NIwFw716Wpwm2dhEKtJ65T3PdbgCDiw5jSUI5o5dW7
         Q0Fzm2HjkW58AY5f1oMkd9LFn1+atX4mhIWULiHUP2q3buASXzqU0rvYL7V4oesXbUp9
         Qpvk08Lwl5112n/bTN5JrtWUVxvguXQ8XT07ckDNZBQI1wusqA3Kp7xDHLV66fc0a51S
         WByQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6yjuXNg91FQ7XnZXBYK+59h6W3sqDgVqPuN6eW5+ooU=;
        b=vzwsRkACfU1JeTrr0rwkWzFDVG77DdlDif0w+QldwnQTiYMXVAOFtGy3XWcToFDR7R
         SfspZp+aQtgFgByBfGfCUFKb52tvIha2cKyBPZdpzFVxw5eQ/JztKOo48KWufB9LLrDo
         401gmfR9NfLUZVjVsDgGCpFpcuz7Sqf8o+VgF0fb6WpGup5ciX4BZCt+lgDpVC/ELn/F
         Bw2RhQ9oP9MqTVI7QCDrvf2zdSGMOvnztSOXQ0JtlouCosqRsC5jLZRq7aqEqDpyPBbI
         y3PLzYGPuZ2RSQZCEz3oBOR9LXr1YnJ5EOGt7qi+5TTgKP7C2N6qR+KB6cIueWroWHlg
         Qdxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gS56oJ2V;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s66si857904ybf.465.2020.07.08.15.50.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jul 2020 15:50:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gS56oJ2V;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtIu2-00025h-Bs
	for alex.bennee@linaro.org; Wed, 08 Jul 2020 18:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jtISH-000397-RS
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 18:22:18 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:46469
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jtISE-0001AX-DI
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 18:22:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594246933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6yjuXNg91FQ7XnZXBYK+59h6W3sqDgVqPuN6eW5+ooU=;
 b=gS56oJ2VoF0B7hZuBMpzBj2SLOw3B/p1xgc0zy1iNBDOsOVbHsQ7afBg1b6o1b8lx7+gMa
 LGHco1Nu96mPaYwKAdBb9I7ruyJSOzCjYfncC2MvQxEUZlOdvFItyHEzydz2klb2dpwaAx
 59Ut5zFg0UiN/qqBYQX3M/pQF5bi+YM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-0vVufS_mNFeDOBkQKB6vOQ-1; Wed, 08 Jul 2020 10:20:19 -0400
X-MC-Unique: 0vVufS_mNFeDOBkQKB6vOQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D39111081;
 Wed,  8 Jul 2020 14:20:17 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-241.ams2.redhat.com [10.36.113.241])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F6DE5BAC3;
 Wed,  8 Jul 2020 14:20:12 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com
Subject: [PATCH v3 11/11] hw/arm/smmuv3: Advertise SMMUv3.2 range invalidation
Date: Wed,  8 Jul 2020 16:18:56 +0200
Message-Id: <20200708141856.15776-12-eric.auger@redhat.com>
In-Reply-To: <20200708141856.15776-1-eric.auger@redhat.com>
References: <20200708141856.15776-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 17:25:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: jean-philippe@linaro.org, robh@kernel.org, robin.murphy@arm.com,
 mst@redhat.com, zhangfei.gao@foxmail.com, shameerali.kolothum.thodi@huawei.com,
 will@kernel.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iM1SwibZj3yC

Expose the RIL bit so that the guest driver uses range
invalidation. Range invalidation being an SMMU3.2 feature,
let AIDR advertise SMMUv3.2 support.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3-internal.h | 1 +
 hw/arm/smmuv3.c          | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index 4bc1548dff..932d5701da 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -55,6 +55,7 @@ REG32(IDR1,                0x4)
 REG32(IDR2,                0x8)
 REG32(IDR3,                0xc)
      FIELD(IDR3, HAD,         2, 1);
+     FIELD(IDR3, RIL,        10, 1);
 REG32(IDR4,                0x10)
 REG32(IDR5,                0x14)
      FIELD(IDR5, OAS,         0, 3);
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index b262f0e4a7..9f9e9877b9 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -254,6 +254,7 @@ static void smmuv3_init_regs(SMMUv3State *s)
     s->idr[1] = FIELD_DP32(s->idr[1], IDR1, EVENTQS, SMMU_EVENTQS);
     s->idr[1] = FIELD_DP32(s->idr[1], IDR1, CMDQS,   SMMU_CMDQS);
 
+    s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL, 1);
     s->idr[3] = FIELD_DP32(s->idr[3], IDR3, HAD, 1);
 
    /* 4K and 64K granule support */
@@ -272,7 +273,7 @@ static void smmuv3_init_regs(SMMUv3State *s)
 
     s->features = 0;
     s->sid_split = 0;
-    s->aidr = 0x1;
+    s->aidr = 0x2;
 }
 
 static int smmu_get_ste(SMMUv3State *s, dma_addr_t addr, STE *buf,
-- 
2.21.3

