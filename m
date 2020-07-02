Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1593940lfm;
        Thu, 2 Jul 2020 08:36:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgiOchTniK9vFUD2Yly6kftgblGgdtCLWnthM1bRMnDjcx4FdPTrsoPgUbgt66d/YrPJ4g
X-Received: by 2002:a05:6902:692:: with SMTP id i18mr51897140ybt.164.1593704194140;
        Thu, 02 Jul 2020 08:36:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593704194; cv=none;
        d=google.com; s=arc-20160816;
        b=tJhuqh59FzFXMT8Ozmxu61/kllHLvxTEB9yajUfw8RLRs0tVyTIRoYDGX1k65KAtLl
         eaOcgmBEqtMGvUUkqBRg4IBLKsrS0IqL3A9X9ibKwpLMnP44Ao2NMHbaA9l8fuz5bIz5
         nHupqo04KAoW7NX6tYo1WyrRiu5qAlUz2GnZc3PXvO0sVSIH2AIN2EfZInAv3Fjm/3S9
         nhFOtq2vGdFKSfB3zehpI+5IbQNawVopVfWWEO9Go9H2PYfZGlXaIEOAcjyCef7ZTjdy
         RIg17E68kbNcRxexlqfoox67WNGMI0HSra6qIX2LZkHgMJVE7RD2FHXW9dIEWjhl1OjM
         XqEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=m7UIwO4hcxYoI/BNBT1BncFKmWj1KcoaB4NX7cSnyRc=;
        b=f1VUcZ51P2iO62Ri17TfFtbk62Q4zwX4cav+ELFsY7ewHBSREXrd6p0BtUwnvjOHjU
         xcv1zAE/Bc9RUt8VFm2eW8S52DS+DLgwIz2fiiM/QzGWblH1v2h4+FJ/jC+AYSv8QFF1
         rfi7AYILyVbzWOEsFJp1FesavD4TVe0uS3OVrRM4fh0TFGLohC0aXjDlm9C1VwyTppNm
         Ul54wn9U+CV7KnATtUBQBjkZKwhs5D1RYjP8Y9d/+XY1AbG6p3GTeVzC3G+FpqPa1twh
         0N8OW8FZR3oBvE161b0jjG6Iq6pDOj5sRr59R1a+ywv3r4vb7/CiKpzoaRm1cSm76rCF
         2dTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ddD1NaN6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2si9066686ybn.417.2020.07.02.08.36.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jul 2020 08:36:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ddD1NaN6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jr1GL-0007mv-Cc
	for alex.bennee@linaro.org; Thu, 02 Jul 2020 11:36:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jr18K-0002Py-MJ
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 11:28:16 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:32176
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jr18I-0006Xp-3r
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 11:28:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593703690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m7UIwO4hcxYoI/BNBT1BncFKmWj1KcoaB4NX7cSnyRc=;
 b=ddD1NaN628plmLFXmraZSU0oWdbqeKkw4Htn3BpNVuCXlG1TOuzlw8M2/G+bGkgpalntbS
 lWYN1QNr6cbW5ul4jn1nKmHKhNVChbnLhnOOL/LSsUJPevLB9pluZJlifW/FZ7cg8tYLuz
 MlsYHg/KIfXfLPAz8NNFQ8mQG3kKwHw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-xdqQv_LSPe6zuiwI4pkzLg-1; Thu, 02 Jul 2020 11:28:09 -0400
X-MC-Unique: xdqQv_LSPe6zuiwI4pkzLg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77BA019253C4;
 Thu,  2 Jul 2020 15:28:07 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-70.ams2.redhat.com [10.36.112.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC26517D8F;
 Thu,  2 Jul 2020 15:28:01 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com
Subject: [PATCH v2 9/9] hw/arm/smmuv3: Advertise SMMUv3.2 range invalidation
Date: Thu,  2 Jul 2020 17:26:59 +0200
Message-Id: <20200702152659.8522-10-eric.auger@redhat.com>
In-Reply-To: <20200702152659.8522-1-eric.auger@redhat.com>
References: <20200702152659.8522-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 03:42:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-TUID: I05P8guSnuTG

Expose the RIL bit so that the guest driver uses range
invalidation.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index 89ab11fc36..add4ba4543 100644
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
2.21.3

