Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp3052088lfc;
        Wed, 13 Oct 2021 08:29:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJ9207bhDkS05IsuZmOQbMc09USfPIOMI/KkkgYXY/LHQuEm2a8+xC/GkCUMw9+qztoCfM
X-Received: by 2002:ac8:598d:: with SMTP id e13mr18761811qte.76.1634138978270;
        Wed, 13 Oct 2021 08:29:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634138978; cv=none;
        d=google.com; s=arc-20160816;
        b=g1Sf9jXqTIZWkmqHte8QOvUdzpfd7hNJUKdS6KL6yi3k6aC/P+mMr6IRD9MvJd+4e2
         TbqZXuBzVLptbEHsiobONR9+MYP5reN7eZmEmwdtYbdluXqFMnm3qzp4q6DNjwiOBVAN
         KWQ20ykbVewHo+1Uify8CIQgJMQZSd415NyiUyvwCerXx94TbKb691TzG+03otJILMYx
         fmRJHO0A8Cm2u/nwjooKrXqQpA7+flE++Gihri2HoPdRswHqWmkUI/fnyr+ZIup3iIgQ
         Npl08vwrKoKswosnGMsLlq64RgDcx8M8mw06+GTd26VgXrD2wa74sqyde1HpKX24rgr6
         rn8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=VBho0TWjjqvlP6UvRHJBFLlLhs1Ay386b+9lhoYGW4E=;
        b=y+55qPUAjnW/omzrQsZmBAA2zVAsk+5lzJ46lOd53q+eJqoRRC4J1GNrwMekWxgk7C
         Y1h6s4SNqw2sRwbkU7aPGy5wcKwLgmMmzzUMe5hyT/igfDY36Oe4VDp5P6vpMWW2Ry9t
         iAAnOJ/9hC6nZ8dDDh4hpWaXoiOcbTuFtTUzOf5d++kX8otDVXUALbOtoj6cRSw2rwxq
         xHiHOvw/y/pn6xcde55h2QB1zL0+Z1O4WP/EytYTn+5XAM8JCQZeCwerQNl/214qn+RC
         UqjN00U6Nlo0nO3ZIloBbGJmNW/F8C/OEVwBn0u6GtCTPNlZdB9Gj8skZgRx/BihyXld
         0j3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=biKfKxuK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q13si11621127qvk.26.2021.10.13.08.29.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Oct 2021 08:29:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=biKfKxuK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1magCH-00010s-N9
	for alex.bennee@linaro.org; Wed, 13 Oct 2021 11:29:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1magBV-00005a-JU
 for qemu-arm@nongnu.org; Wed, 13 Oct 2021 11:28:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1magBR-0001gY-BR
 for qemu-arm@nongnu.org; Wed, 13 Oct 2021 11:28:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634138923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VBho0TWjjqvlP6UvRHJBFLlLhs1Ay386b+9lhoYGW4E=;
 b=biKfKxuKB/Td3wNpY3TKRVIvTDGpdAtGVe3d4I0lYPBUcWeVn/YLy5KFe2Fn0qnafHKVDm
 JyZwlK9tHWNJEsUQAFFhIzk/k4fU4JvaBFca9Y4RS80ACa31BRROzk7aMGFAXiQkGgF5Sz
 x4J+KdJBGJfiZWwdKeSXVXU9ZzJ6hl0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-R5Iih4X6NWKWcHozyYFQfQ-1; Wed, 13 Oct 2021 11:28:42 -0400
X-MC-Unique: R5Iih4X6NWKWcHozyYFQfQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA03679EDC;
 Wed, 13 Oct 2021 15:28:40 +0000 (UTC)
Received: from virtlab-arm04.virt.lab.eng.bos.redhat.com
 (virtlab-arm04.virt.lab.eng.bos.redhat.com [10.19.152.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D29770886;
 Wed, 13 Oct 2021 15:28:29 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, mst@redhat.com, cohuck@redhat.com,
 peter.maydell@linaro.org
Subject: [PATCH v2 0/2] virtio-iommu: Name Tweaks
Date: Wed, 13 Oct 2021 11:28:25 -0400
Message-Id: <20211013152827.764566-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jean-philippe@linaro.org, abologna@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vqXSEcCVI+rN

This small series removes the non transitional name, drop the base_name
and change the generic_name into  "virtio-iommu-pci".

History:
v1 -> v2:
- drop the base_name and change the generic_name into  "virtio-iommu-pci"
  (Connie)

Eric Auger (2):
  virtio-iommu: Remove the non transitional name
  virtio-iommu: Drop base_name and change generic_name

 hw/virtio/virtio-iommu-pci.c     | 4 +---
 include/hw/virtio/virtio-iommu.h | 2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)

-- 
2.27.0

