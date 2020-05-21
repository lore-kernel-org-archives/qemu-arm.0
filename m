Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1383604lfb;
        Thu, 21 May 2020 02:18:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKUnssFzbs4EFs40/3XHHxK1mu2E7w2KYdTphw3RzCH2KDeD6xP0Q2ygvs+OiBUTYs+Zie
X-Received: by 2002:a05:620a:128a:: with SMTP id w10mr8979225qki.70.1590052739663;
        Thu, 21 May 2020 02:18:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590052739; cv=none;
        d=google.com; s=arc-20160816;
        b=sTrkLVSLmo78HNFSwh6Fcs7jTRXfx2KVkaFM3yDzy8SUelNb8lMp8ygEjNwBi0qrPY
         GV2lrA6cu7ncwLV2whD8YhM+dvZEEEA6t5g0QjIIYkXWnGhNk4VAmwxNzDH62GjkxoIQ
         94dBjtCwDu5FXkRzL8IHmX+vQ7LEZ7oCVFfl5aQ1LX6aWAHApd53uaBD0LOxDIQYwPRX
         af70SuxpyikpKJYzpmAhnQU7y44UXM9M0dVbyLExJeZGRDA3f3hXEJg1ZSz5KHtZQ6hb
         uNli08Zo0VJmOxZhJo5BcamkBEYPq6nibJT68uFpyD+bCH3w247DBtY+CfPPGYLkxEBT
         8b9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=b9hGE1kZUZvCbnSbzRYkY+Xwj8Z7keAHPfrl7Jr1YeY=;
        b=p8QO2i4xoVXoAzuBYkXXEQZaM3ROzAdNyW/nwcaC5p0vaINKojfsto7zbOa+LYQihi
         nKosO+8//xDS0sam3TxYdj/v8Zw3ztpl/0tActoHlgTCeNz7Qdn/tnrf+FSAzlYu7YFl
         2MbehgIBjnjkz2PAVEpuq4ZeBe4OK8u4ycmY1EnZ7IkrKnARrdcT4tSne9ANaQqsScYP
         UgEH2z7rbj/JH47lLq+UIC1zPOYovuE9N9z2aVj8eH88igvuLyfeK8uUUj6OPycOrupF
         WDMGDQ2lwwWG0ppspbpdGKEJ/fUOuQ4QryPLM3bYDR9wPGJn1PmKMleXOYQdGJ96qTNH
         mKnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=G3bnGAEX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x130si3170110qka.218.2020.05.21.02.18.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 May 2020 02:18:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=G3bnGAEX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbhLv-00085D-5b
	for alex.bennee@linaro.org; Thu, 21 May 2020 05:18:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jbhFP-0005T6-Ue
 for qemu-devel@nongnu.org; Thu, 21 May 2020 05:12:15 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33980
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jbhFP-0005PL-5U
 for qemu-devel@nongnu.org; Thu, 21 May 2020 05:12:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590052334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b9hGE1kZUZvCbnSbzRYkY+Xwj8Z7keAHPfrl7Jr1YeY=;
 b=G3bnGAEXiQ9g8IekYf9SUBDWVDKQakrjV0cir2bLPva5yfh2aWlVwJmEii87EvlWW0c4W7
 sCjzp96jarRi0TS6lIYntN8TtsRHf7Ce7cHo622ACi7o87nm8tDuslCVEYDKM8tmq3YxO+
 o3vcXimjlNcl1MQIvpivoV6tN4bMw7Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-FgeXcZFRPuipx40Q3TG5Tw-1; Thu, 21 May 2020 05:12:11 -0400
X-MC-Unique: FgeXcZFRPuipx40Q3TG5Tw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A05218FF66E;
 Thu, 21 May 2020 09:12:09 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-56.ams2.redhat.com [10.36.113.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E224E5D9C9;
 Thu, 21 May 2020 09:12:03 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com
Subject: [PATCH 9/9] hw/arm/smmuv3: Advertise SMMUv3.2 range invalidation
Date: Thu, 21 May 2020 11:10:59 +0200
Message-Id: <20200521091059.9453-10-eric.auger@redhat.com>
In-Reply-To: <20200521091059.9453-1-eric.auger@redhat.com>
References: <20200521091059.9453-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 01:44:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-TUID: uHUHg7nqWm8h

Expose the RIL bit so that the guest driver uses range
invalidation.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3-internal.h | 1 +
 hw/arm/smmuv3.c          | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index 5babf72f7d..4e7ec252ed 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -54,6 +54,7 @@ REG32(IDR1,                0x4)
 
 REG32(IDR2,                0x8)
 REG32(IDR3,                0xc)
+    FIELD(IDR3, RIL,          10, 1);
 REG32(IDR4,                0x10)
 REG32(IDR5,                0x14)
      FIELD(IDR5, OAS,         0, 3);
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 4dff438809..78920f5158 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -254,6 +254,8 @@ static void smmuv3_init_regs(SMMUv3State *s)
     s->idr[1] = FIELD_DP32(s->idr[1], IDR1, EVENTQS, SMMU_EVENTQS);
     s->idr[1] = FIELD_DP32(s->idr[1], IDR1, CMDQS,   SMMU_CMDQS);
 
+    s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL, 1);
+
    /* 4K and 64K granule support */
     s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN4K, 1);
     s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN64K, 1);
-- 
2.20.1

