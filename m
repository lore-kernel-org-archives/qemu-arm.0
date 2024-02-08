Received: by 2002:a17:906:c945:b0:a38:6d10:c5dd with SMTP id fw5csp2577ejb;
        Thu, 8 Feb 2024 02:12:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVcF/3qs8nF8p95XymjNJRM5PdyFmuZctGuHgNVc04tStNkugTEeKRSGfvuaWPv6NEdJVRqEnhqzu+v4qC9DjyfdfAOACAn
X-Google-Smtp-Source: AGHT+IGiRg7Hv8+rH+OZ8E2HoB77OlzLWubqknn532Ekac1ttxkypFaYm35obPbPCHHMgYCaeyl5
X-Received: by 2002:a05:622a:551:b0:42c:69a:b8d3 with SMTP id m17-20020a05622a055100b0042c069ab8d3mr3069777qtx.27.1707387125951;
        Thu, 08 Feb 2024 02:12:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707387125; cv=none;
        d=google.com; s=arc-20160816;
        b=Tud1JnoUYWpu6NxXfPZspikaJadG0ggyM2Tqzy3FCeMXdOMKTU9dd1fSZRv05DczlE
         LJtkBwho84RIy4bv3etI3yQuHaJgTNtEErcoWfsShFjUHDAw5pyC/nCXbeweYWMlkRC3
         nZ6VmXdQoTzlTkpTdpVUum4n2zeFYdFFlm3LNM7vyrETG9iiEMKgI4lrbVxoju8pL5Jw
         0IQFJEU9cwVgD6BiqVvIomo1D25vl3Ap6v6I18BA+PTzwXLmfQJI6Q27P6iKVbZq0Guc
         n6H/a+aSQ0OGVgGW3kHpcEsjBW6N7iHvDGN9FGGTt1wIa/+rHk0Lt5JmltDm0KjfbV0r
         Jasg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XHE2H6uhV4KUZG8lLuhXe39Zxs3kxprbLm0Gjjc1q+0=;
        fh=Sbk3tNUFEEg0njuz421IKyYtCrR9z2o8mhTrnbfvdIc=;
        b=W9/RHgxmEPXeYoOKGaAzn3UkBYa+iGdTmD90Bw8E4O8mJSVxz1qauJP0lN8ATM5tjI
         G5Ss58HKOB39tEs74R0sFVxC6xN6xZYwZ0yaVA56lfMfT2w5kwIv5me6J4qSSrWu7FfQ
         r+B5K2ndJ0zjrugwa6JbPkllCfjG+8vCcMs5LtXExTwxEnos8+5pmLqaUm4bdqvbrHTW
         uDWt2CC3N6RBHb7glWrACf3ZgvKNoD1pfNw3u2QArrKBVxkq0rZLAYPPJRKhQIwdjzj+
         7V30eoImlTCyFZhNZcJmucsJoL8YFrD21cxDol7E6e79Brs6rcnxrXjvO5bgu7BjoM0Y
         5wKA==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=I9TDoc6P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=1; AJvYcCXe4cfH8bNowL+RVVneLaBjeQAHJWcH9iN6YnSUbS9i8vLvVJBRbbkHmSrpQAx3FVQ0uc88sXnefjU7QVcIRy9JqG4MEvVX
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q14-20020a05622a04ce00b0042a630184dasi3017264qtx.443.2024.02.08.02.12.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Feb 2024 02:12:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=I9TDoc6P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rY1Nj-0003yn-1y; Thu, 08 Feb 2024 05:11:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rY1Nh-0003wF-1H
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 05:11:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rY1Ne-0000Rk-A0
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 05:11:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707387101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XHE2H6uhV4KUZG8lLuhXe39Zxs3kxprbLm0Gjjc1q+0=;
 b=I9TDoc6P6L2ZPhMrhrPqkM8oGEXWrsdoEuTl23E3qjPNskp0qucrMz6ViOUs70tQIDtzs6
 2DCS+NXv0OkOEEDC6XmT+ZBbrzFh6ys5qj8X6x8tNKdvMyKtKcsu2lj61HjspILE6uKLAM
 Z3z21HcXCQCGxQlBu75ox5BTqK+xqpw=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-284-MIqZTykXPNmneDtJz1g8mg-1; Thu,
 08 Feb 2024 05:11:37 -0500
X-MC-Unique: MIqZTykXPNmneDtJz1g8mg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5189A1C09832;
 Thu,  8 Feb 2024 10:11:36 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C143C1E95A;
 Thu,  8 Feb 2024 10:11:34 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, jean-philippe@linaro.org, mst@redhat.com,
 peter.maydell@linaro.org, clg@redhat.com, zhenzhong.duan@intel.com,
 yanghliu@redhat.com
Cc: alex.williamson@redhat.com,
	jasowang@redhat.com
Subject: [PATCH v3 1/3] virtio-iommu: Add an option to define the input range
 width
Date: Thu,  8 Feb 2024 11:10:17 +0100
Message-ID: <20240208101128.655167-2-eric.auger@redhat.com>
In-Reply-To: <20240208101128.655167-1-eric.auger@redhat.com>
References: <20240208101128.655167-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.106,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: krpBdT76kB++

aw-bits is a new option that allows to set the bit width of
the input address range. This value will be used as a default for
the device config input_range.end. By default it is set to 64 bits
which is the current value.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>

---

v1 -> v2:
- Check the aw-bits value is within [32,64]
---
 include/hw/virtio/virtio-iommu.h | 1 +
 hw/virtio/virtio-iommu.c         | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
index 781ebaea8f..5fbe4677c2 100644
--- a/include/hw/virtio/virtio-iommu.h
+++ b/include/hw/virtio/virtio-iommu.h
@@ -66,6 +66,7 @@ struct VirtIOIOMMU {
     bool boot_bypass;
     Notifier machine_done;
     bool granule_frozen;
+    uint8_t aw_bits;
 };
 
 #endif
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index ec2ba11d1d..7870bdbeee 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -1314,7 +1314,11 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
      */
     s->config.bypass = s->boot_bypass;
     s->config.page_size_mask = qemu_real_host_page_mask();
-    s->config.input_range.end = UINT64_MAX;
+    if (s->aw_bits < 32 || s->aw_bits > 64) {
+        error_setg(errp, "aw-bits must be within [32,64]");
+    }
+    s->config.input_range.end =
+        s->aw_bits == 64 ? UINT64_MAX : BIT_ULL(s->aw_bits) - 1;
     s->config.domain_range.end = UINT32_MAX;
     s->config.probe_size = VIOMMU_PROBE_SIZE;
 
@@ -1525,6 +1529,7 @@ static Property virtio_iommu_properties[] = {
     DEFINE_PROP_LINK("primary-bus", VirtIOIOMMU, primary_bus,
                      TYPE_PCI_BUS, PCIBus *),
     DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
+    DEFINE_PROP_UINT8("aw-bits", VirtIOIOMMU, aw_bits, 64),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.41.0

