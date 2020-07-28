Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp685468lfy;
        Tue, 28 Jul 2020 08:16:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyACiXLkxTBsjaquQZLMcF1Cohl6h9GoP2A8hgY2hUlYPnbpSb2phrMeJJ7bezsYXyplenz
X-Received: by 2002:a67:582:: with SMTP id 124mr7008409vsf.101.1595949403725;
        Tue, 28 Jul 2020 08:16:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595949403; cv=none;
        d=google.com; s=arc-20160816;
        b=Tp7uH0/GBWikS0/lMrWEnTGUPivNZxHbEhB/NKt9zm14/bnGhCSHEuR2FBUzFM1njs
         tuvdgwxWBVklCStKT4/WCTx/eXYNhh7mE5eHft5IcPDAtuEQEQsSLAdZYRCWupitt62G
         6k2Jwme/Eou+8Nl8TiFcPEQYj+Q3sDdIHS7DVkndygvGcMQLt4cbk7XGVWPnjGh7I9hh
         p0wJWxBRkVeOQa6wShlTcs5/2Stfa0Sre5ouhguxZ/uzEDHc/T5NUpFnUY+Jic6OfGUD
         NX9yNyFfTqJSsKOqArKFnnXzwqpv8VkwdElxRT6B9TBI0jDQZ9wXiL4lsqN1J6nA9maD
         lKpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=gGmSho80hRJEgScVaDEnT/Pg7XjU4Fmj6TVlaAS5JRA=;
        b=Wtv++ZWhq/I3/DoBLGPLrJ/bzqy5G8s82o+UBDEYMaDeB2d5+G7BM0Jlv1PrhA7PUB
         /6crpiJyXu3kxn0S23NZfotJh6PWuEo2B0x7wqWKSzNPRWa+0p0YLGElzj4gKnHqtTMh
         htP2J8eUegIaXpuN39qtguY7OEUEPL3rDBvEYjHwp5zsoXjaHWP71MT3yfPIZfAGlTlW
         dQQ7Hh/d+Nv8/prfegaoA7peZpPhr/OMhmYTOtkc0Vew9FEAMPtZj9omhau/FYfKJV2V
         RX8SxzxD4U2uoN0JaI0veNtAgRyI3Q/AeQhUgoosJqlN4Fr2YQxAKZ5QzpE8ibtDm1mZ
         sB3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hG3I48c1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y15si1572124uaq.132.2020.07.28.08.16.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jul 2020 08:16:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hG3I48c1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k0RLO-0002cr-UU
	for alex.bennee@linaro.org; Tue, 28 Jul 2020 11:16:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1k0RFy-0000t0-Rn
 for qemu-arm@nongnu.org; Tue, 28 Jul 2020 11:11:06 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49324
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1k0RFw-00084W-9U
 for qemu-arm@nongnu.org; Tue, 28 Jul 2020 11:11:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595949063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gGmSho80hRJEgScVaDEnT/Pg7XjU4Fmj6TVlaAS5JRA=;
 b=hG3I48c1bzOLVr/5KEv4TuAW8sAMpHx6uDMQvXa2RqR3osS7TdUCsi9tqojRXBGTFyzcf9
 UYHXArq7+J/+y3ug25TPTWq+WBVVuxbuOUAKwn2EqWohShREnmZkxQWPefBvbwszBaTVPA
 +w4GHNiziwUeYAk0RdZFU+iy/8bWJdI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-VVFPvW5SOEyhMrSabjs0Eg-1; Tue, 28 Jul 2020 11:10:59 -0400
X-MC-Unique: VVFPvW5SOEyhMrSabjs0Eg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C783A18C63C3;
 Tue, 28 Jul 2020 15:10:56 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-203.ams2.redhat.com [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 214BC69328;
 Tue, 28 Jul 2020 15:10:49 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com
Subject: [PATCH for-5.2 v4 11/11] hw/arm/smmuv3: Advertise SMMUv3.2 range
 invalidation
Date: Tue, 28 Jul 2020 17:08:15 +0200
Message-Id: <20200728150815.11446-12-eric.auger@redhat.com>
In-Reply-To: <20200728150815.11446-1-eric.auger@redhat.com>
References: <20200728150815.11446-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/28 10:28:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: jean-philippe@linaro.org, robh@kernel.org, robin.murphy@arm.com,
 mst@redhat.com, zhangfei.gao@foxmail.com, shameerali.kolothum.thodi@huawei.com,
 will@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PfIDUdjRgoP7

Expose the RIL bit so that the guest driver uses range
invalidation. Although RIL is a 3.2 features, We let
the AIDR advertise SMMUv3.1 support as v3.x implementation
is allowed to implement features from v3.(x+1).

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

---

v2 -> v3:
- keep the AIDR equal to 2. BBML support, which is 3.2
  mandatory feature will be addressed in a separate
  patch.
- added Peter's R-b (same version as in v1)
---
 hw/arm/smmuv3-internal.h | 1 +
 hw/arm/smmuv3.c          | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index 9ae7d97faf..fa3c088972 100644
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
index b262f0e4a7..0122700e72 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -254,6 +254,7 @@ static void smmuv3_init_regs(SMMUv3State *s)
     s->idr[1] = FIELD_DP32(s->idr[1], IDR1, EVENTQS, SMMU_EVENTQS);
     s->idr[1] = FIELD_DP32(s->idr[1], IDR1, CMDQS,   SMMU_CMDQS);
 
+    s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL, 1);
     s->idr[3] = FIELD_DP32(s->idr[3], IDR3, HAD, 1);
 
    /* 4K and 64K granule support */
-- 
2.21.3

