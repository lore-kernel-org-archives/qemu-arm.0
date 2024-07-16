Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp58843njk;
        Tue, 16 Jul 2024 02:47:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU4pOmDNALEzoxddqjWBK/mUhITVZ3qX1rWrVsH13OI97PLuCur0SNMl36j9ghzIX0ngXd3wYtS5NAGtUerY10B1eoLJbft
X-Google-Smtp-Source: AGHT+IEj0vifUwa14dF+o3wq/HScDKBy5qHQFOyUWrAvjvcn8SvV8qBl+G1RUQ0v1Ptn0hTFBn6K
X-Received: by 2002:a05:6214:400a:b0:6b5:ea0e:98f with SMTP id 6a1803df08f44-6b77f249d69mr22961806d6.0.1721123261587;
        Tue, 16 Jul 2024 02:47:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721123261; cv=none;
        d=google.com; s=arc-20160816;
        b=Pomj/nWC16wil3r8/eRqIh9L1emdQMh10fKX6YfYrpQMF7khSQSf6Dk2xGH5vx2rl8
         bagd6iZDw3knoQTsQMLqHTQlF6Fx2jQkRWQ3iqeCKv6v3mYZgL+7VkkyIgk8M268wIVc
         RKB0HUrCZM/uksEAyq8+wpVNnNvRQtveHl8085dULhv/3XTS+6vrBPxc4f2clFZP4xKF
         cgoLwdcKEPIcXJhHjEMTp6KtZDr8teYRYPVnp8u7H4cn21TQJZNNR1Roz46RfZkaMFON
         ctKsGkE5CkCz63P7Dl7O1P3z1zye5iN/X44/8v/FPWlrOx9cGJyT3tBpuPHYIcYB/+pF
         xLNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dvRk7/vnzWK99OFXCu80rCuujpBBeYujjUCGgbqJY8E=;
        fh=D1TEnXH2DbXUr6sVqyo/ig9zTKSO675I5EGRzxL3ieY=;
        b=jnYAE6rD0Q22KMwyQ8Tw6BvNZlVt6N97HozMX8sPz9SbhU3CA9ZAFS6N3j7UuvQeGi
         qua3mV2+b2Qfa0QlS5BrHMgiYoeux7Dbb9lorLPycmss1uV2RNLgG5qw/647WfUI4ZFp
         65Lm4IiIYJm2Z7h5zjC9XHz4g0T4kcM8iuZd5Z7bNFhp+HxkuiAwMjfaTc2+wntm81yx
         aQBu4jjoTGDZnWh3//3LXBV2cRmr16JmNAeFpvrZncehpdSNjryXwaHR6VOLyPGgzgtc
         Wvfy7N6SQrNpJGPVgNzAeeDQCK37Sq4nLWHSAlRcpYWJ+5b6moIorovWZYnocfAtfsZy
         p/KQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ThfoTF2a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b761a02c68si71213776d6.307.2024.07.16.02.47.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2024 02:47:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ThfoTF2a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sTelt-0006X5-L2; Tue, 16 Jul 2024 05:46:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sTelr-0006Nc-DZ
 for qemu-arm@nongnu.org; Tue, 16 Jul 2024 05:46:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sTelq-0000Ou-2a
 for qemu-arm@nongnu.org; Tue, 16 Jul 2024 05:46:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721123212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dvRk7/vnzWK99OFXCu80rCuujpBBeYujjUCGgbqJY8E=;
 b=ThfoTF2aahZr+aP+RVLaSTcrODvUAGC88qmTxsD2L9AuREaGIicv82OFichN91CVm+twaE
 bfR/DueWr55FVgZKpDHiwwwqFPyStDSqZCIRUixWtog57FwqEg1FutfhqNezNB23ZInjBS
 wLQBIsjiBkriFZVnB1j8c7udEd3lE0o=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-62-nbLm-52IOC2sG1xBSU7uLg-1; Tue,
 16 Jul 2024 05:46:49 -0400
X-MC-Unique: nbLm-52IOC2sG1xBSU7uLg-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 13B281955D63; Tue, 16 Jul 2024 09:46:48 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.185])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 45513300018E; Tue, 16 Jul 2024 09:46:43 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 peter.maydell@linaro.org, clg@redhat.com, zhenzhong.duan@intel.com,
 alex.williamson@redhat.com, jasowang@redhat.com
Cc: yanghliu@redhat.com
Subject: [PATCH 4/6] virtio-iommu: Remove the end point on detach
Date: Tue, 16 Jul 2024 11:45:06 +0200
Message-ID: <20240716094619.1713905-5-eric.auger@redhat.com>
In-Reply-To: <20240716094619.1713905-1-eric.auger@redhat.com>
References: <20240716094619.1713905-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: vJH9JmpdsA4s

We currently miss the removal of the endpoint in case of detach.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/virtio/virtio-iommu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 2de41ab412..440dfa6e92 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -786,6 +786,7 @@ static int virtio_iommu_detach(VirtIOIOMMU *s,
     if (QLIST_EMPTY(&domain->endpoint_list)) {
         g_tree_remove(s->domains, GUINT_TO_POINTER(domain->id));
     }
+    g_tree_remove(s->endpoints, GUINT_TO_POINTER(ep_id));
     return VIRTIO_IOMMU_S_OK;
 }
 
-- 
2.41.0

