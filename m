Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1569923njb;
        Thu, 6 Feb 2025 06:24:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV3tsZNPjVU5ODIvbDyGRCrTpMkL6REQnpLVhDKugXqrxjEyn0N2bYs0dpnS7+eqnkSuIOe4JrsKsYfnw==@linaro.org
X-Google-Smtp-Source: AGHT+IHCHbFaeBQlFi0FsCc4MN7GOPH+Sx8SnYIFbBJq0oSBRyNvdsuHCcua++S6Ov4IfBFY45Wk
X-Received: by 2002:a05:622a:2c2:b0:46c:7142:14c4 with SMTP id d75a77b69052e-4702817bdc0mr105474961cf.2.1738851889161;
        Thu, 06 Feb 2025 06:24:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738851889; cv=none;
        d=google.com; s=arc-20240605;
        b=NGKqmTHA8LhXRKKSPeyGOoKczCYhRESurvtDz6kuXAyZhN4lny2X2DwCTOsi2Zav4W
         XXBhcWqA56eDn5fPszfSveU8iTxhNIgROsmM7qNCEkDRtzB9HAFrry5xBlzT/ySrUcl0
         ifiqesdZ7AX2koIiGt109Hp1KmT6KcSy+dxuwhqTrbwi8n5WfrPtX9qk9+T3SUKTtoWe
         CMKvQqa0loEoQbgwQU7BCDYD4lSW04mo6/586f3KS62QYYK9BZVcpJmiV5uluZnJWXxm
         M+3Vrt53PJtzhKkd7EE+fOYTS0pRhnylXnlfosEcUxzDe8hHsfRtPgUtmw+UGPOekj1w
         yDQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=GZbyIXKI1FZ4Jn6pIwE6+ydtpYa2SRS3JE57gu/CUhA=;
        fh=swiL4bERDBgIQIiNoTOu/2bBoUECE5mFI7R2Xc6Vuzs=;
        b=fSWXmwM9ztCY6zUJPWyuJ3zqlIl+DJFCQZy2zQ4fwp1PgowGzp0jItRFGd9GWc4vSh
         XyEYpiitadGgCit1u9+qffxpUEN7KC0uk6sLjmxEZHWXbzhnpiIyHIzIL3h06LA0/j2f
         F5t5qVCYVNWuJV+WzBqFX1f7GYWc9+Loc14zzVRgoUoUPoToXgndf8/8qtGof4uVFjTb
         g0HJsesejgny5/O8NFLVP2fxlSJ0SQrNJMxqrnbcSsbbO2oON8WFLX/67n9N4uLiVyQZ
         izyeeWCt9VwBFK9AP4v4ElrlTUWYf7x4p/bGonYI8EiG/QDmachYtoT0LWTnel8NNVuE
         2zIA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HLN9pHb7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47153b74bfdsi11286011cf.222.2025.02.06.06.24.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 06:24:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HLN9pHb7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg2nE-0002HU-KF; Thu, 06 Feb 2025 09:23:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tg2nC-0002FX-5Z
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 09:23:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tg2n9-0006oE-8N
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 09:23:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738851820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GZbyIXKI1FZ4Jn6pIwE6+ydtpYa2SRS3JE57gu/CUhA=;
 b=HLN9pHb7ByNsCyZ8PS+EZcQsDjEpGeCzI98cIJ9NFrpupOLq6Mwg1PFinnimIzQMGRY000
 6MLu5pLvDmKHMnS4VCaQd9GjXauaEiKnf2CuQmIV6Ru/XskM2rQM3yzeDKAdBNqNJOdZs0
 NMDZ8Z9BC1EqaunrO5RIcPPfKTqtV+o=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-549-R_3ApZWdPwSVLanzbywnhw-1; Thu,
 06 Feb 2025 09:23:37 -0500
X-MC-Unique: R_3ApZWdPwSVLanzbywnhw-1
X-Mimecast-MFC-AGG-ID: R_3ApZWdPwSVLanzbywnhw
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 79CD31800875; Thu,  6 Feb 2025 14:23:36 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.9])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 7EF051800360; Thu,  6 Feb 2025 14:23:28 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 jasowang@redhat.com, imammedo@redhat.com, peterx@redhat.com,
 alex.williamson@redhat.com, clg@redhat.com, philmd@linaro.org,
 zhenzhong.duan@intel.com, ddutile@redhat.com
Subject: [PATCH 3/5] hw/i386/intel_iommu: Tear down address spaces before
 IOMMU reset
Date: Thu,  6 Feb 2025 15:21:54 +0100
Message-ID: <20250206142307.921070-4-eric.auger@redhat.com>
In-Reply-To: <20250206142307.921070-1-eric.auger@redhat.com>
References: <20250206142307.921070-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: uAS+JmF/7kKF

From: Peter Xu <peterx@redhat.com>

No bug report for this, but logically tearing down of existing address
space should happen before reset of IOMMU state / registers, because the
current address spaces may still rely on those information.

Signed-off-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/i386/intel_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 21a8bf45f8..1bd9ae403b 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -4702,8 +4702,8 @@ static void vtd_reset_exit(Object *obj, ResetType type)
     IntelIOMMUState *s = INTEL_IOMMU_DEVICE(obj);
 
     trace_vtd_reset_exit();
-    vtd_init(s);
     vtd_address_space_refresh_all(s);
+    vtd_init(s);
 }
 
 static AddressSpace *vtd_host_dma_iommu(PCIBus *bus, void *opaque, int devfn)
-- 
2.47.1

