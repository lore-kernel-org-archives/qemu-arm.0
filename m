Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp1573776lfk;
        Fri, 26 Nov 2021 23:34:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmJ6tH0zgkNMGh4837wMuPpR2W4FFnFNXA0edulM7DSmgnvRCfMssc8Gw42T0qtrqk300Y
X-Received: by 2002:a05:6602:483:: with SMTP id y3mr36283245iov.42.1637998493202;
        Fri, 26 Nov 2021 23:34:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637998493; cv=none;
        d=google.com; s=arc-20160816;
        b=FfsKCXiD/1YQaOBbJ1KMPwoESCCyly+R0/4zc2POEU7sX0m7gcX36W8Low52GJdki+
         0cLqKxE5NnMKHBdGjgZxhqzGCNFHC7VO212xD/8IR/CfXTavWZFeJdlJ7fVGIvNxqdba
         WBlJcP7UruGVHoYgzbWdVzUPthXz2of/cwZuOaZXsbFAkqA1QUIVCNaDHe9kB4j051ep
         s4akp/2raHKq+k2BmTdjkcUFsjbC2Zz+7NFGCpyv232OrTQM/tMh+SsrbX6tnTOwWFIF
         jnXfRWd0ZnlyTXesXMZb/9+tshdQ5b2j/ybolIEThROhg0QJTBs+9cQvHIKY8Gkyh0gm
         mBcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=VIuxFRuweUAeTWrB2lcanKs1mZt8Wy3ZRuUOHxLwMqQ=;
        b=iZIRU/h0WJnt60lH5B3pcHgre8vRmEkqwARt4VAV9NpI7Av9aAIxEMVZpDXOemDR6b
         5/e7CH5tY7wYwc9eMTEhO/1F6VxN5EYGuuy07vAN3w4w8bQvFood7QCH0C+YZEak3UvJ
         oavRZaI/9sneTzQ4SCCwfGoGrdiDtaZ9TOtZR8hwuW9o2RoZ950zBKh7rALtv/CbT52G
         A2XTQDwUie533AoPydsyfT48ygyyvZKU9WYLML2MXP+uaJYeMjre55ZPeFySq/lHHCcD
         2bLYOr7axdjDieggaIULCGG/qumcMinUqww1A3Fj4DG6LgQA0Vz1gdJCrlCmsYKfxkcq
         3ugQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SF0dEtb6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g20si15324057iow.69.2021.11.26.23.34.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Nov 2021 23:34:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SF0dEtb6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mqsEW-00055c-LJ
	for alex.bennee@linaro.org; Sat, 27 Nov 2021 02:34:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mqs9n-0007oD-LP
 for qemu-arm@nongnu.org; Sat, 27 Nov 2021 02:30:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mqs9h-0002Di-KI
 for qemu-arm@nongnu.org; Sat, 27 Nov 2021 02:29:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637998193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VIuxFRuweUAeTWrB2lcanKs1mZt8Wy3ZRuUOHxLwMqQ=;
 b=SF0dEtb6W3cqIHxyrEgs9h70GO/jaQqZi+RzrQkUnoQGUZnPPKCN4d6OJUAQerJ52PO7XS
 8vFvlRmn+6un9G9jHRREHHrwimdSD38Mxje5afd5qUG9tMkjm2eOp6mXPlIULC32w5u4JS
 Z8wegbdXn6Pxry6drf0JgkPCbZ+9GSY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-176-7GsNcoTxPdiZh17twas-jw-1; Sat, 27 Nov 2021 02:29:49 -0500
X-MC-Unique: 7GsNcoTxPdiZh17twas-jw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC624801B01;
 Sat, 27 Nov 2021 07:29:48 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.178])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D31085BAE2;
 Sat, 27 Nov 2021 07:29:45 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, thuth@redhat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org
Subject: [PATCH v6 3/4] virtio-iommu: Fix the domain_range end
Date: Sat, 27 Nov 2021 08:29:09 +0100
Message-Id: <20211127072910.1261824-4-eric.auger@redhat.com>
In-Reply-To: <20211127072910.1261824-1-eric.auger@redhat.com>
References: <20211127072910.1261824-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: lvivier@redhat.com, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9EaD5XQrJq2p

in old times the domain range was defined by a domain_bits le32.
This was then converted into a domain_range struct. During the
upgrade the original value of '32' (bits) has been kept while
the end field now is the max value of the domain id (UINT32_MAX).
Fix that and also use UINT64_MAX for the input_range.end.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reported-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/virtio/virtio-iommu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 30ee09187b8..aa9c16a17b1 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -978,8 +978,8 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
     s->event_vq = virtio_add_queue(vdev, VIOMMU_DEFAULT_QUEUE_SIZE, NULL);
 
     s->config.page_size_mask = TARGET_PAGE_MASK;
-    s->config.input_range.end = -1UL;
-    s->config.domain_range.end = 32;
+    s->config.input_range.end = UINT64_MAX;
+    s->config.domain_range.end = UINT32_MAX;
     s->config.probe_size = VIOMMU_PROBE_SIZE;
 
     virtio_add_feature(&s->features, VIRTIO_RING_F_EVENT_IDX);
-- 
2.26.3

