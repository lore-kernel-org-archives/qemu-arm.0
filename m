Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp816410lfc;
        Wed, 26 Aug 2020 07:41:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyM43seDH/8MunrT9QtriET8bzQltc5Vir2uITCV8V8eH0GoSLPhXKSjB9B9Se9N/VyWMR
X-Received: by 2002:a25:c102:: with SMTP id r2mr22168255ybf.110.1598452900712;
        Wed, 26 Aug 2020 07:41:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598452900; cv=none;
        d=google.com; s=arc-20160816;
        b=g8xw0Wii4bJyIT8VlLY4xvRkIrlc5aEi4TfJ07lVERKyiZOM0CeI5bsEfCxpLhZZki
         DByomlyn8Rk+hYkDGBSgd9jX/gGsSsdjHsFqjeqhj4xS9NHso5RH7hvLu3+Y/RN0X0fF
         Rt6wIfi5OSamiDyMRb7FnXJFmixIpOjdBUIWZAD9uXciNavj2l0XB55Xz0kzQOArVEFh
         KyAYjRMCvs6yPx2HilnhN8KCXPo+vztMv8/YA8mO3bJRf0EjqgR+lnJ34r4aNEa7FQ8r
         cFKSdxOjSJa+Ui1sV+Jfeq3mU8K6cODuJAQbSij77a+7Exsw4qEiJ6N2h3SIbPdkovA1
         Mj3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=RyWFcAK22ccrtFDCgblAv91X5355V0Mv2j3NgB49ZwY=;
        b=f+0GdKT3MlU3FEeqgtv/efQJERPJ1/cAvKgqkNwIk/dplACA/KpZELuI/51qdj2Iey
         6Izc7+D00tcxcRKNOYy9qnkYk0PmD/BaqQXG1QPyUqadMk/P4UPWLhMWawZFlEycdyoH
         N8sfedFGV56QhJbEACmWPVI0HLSVa4w8GAmMjP7z+2xzXUK/DsD0LJLQVbAGV1LHXa4Y
         yvlDLLtbWD/YWDIR0xyKy7nRpIH4ZzWJq732z/zFnDiCrictLM9eqJCx1jraIv4dI5c0
         SZKmqGTOyfkfuLYOGAKSxuZLfyuVbfMu8hnCH+A/Rclaej0cavtI9Hyveg/oOF/DlZLZ
         EkXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gfPJN+1z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g93si2262434ybi.26.2020.08.26.07.41.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Aug 2020 07:41:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gfPJN+1z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAwcO-0004wX-0h
	for alex.bennee@linaro.org; Wed, 26 Aug 2020 10:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kAwZY-0007O6-6x
 for qemu-arm@nongnu.org; Wed, 26 Aug 2020 10:38:44 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:21199
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kAwZW-0006J4-JR
 for qemu-arm@nongnu.org; Wed, 26 Aug 2020 10:38:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598452721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RyWFcAK22ccrtFDCgblAv91X5355V0Mv2j3NgB49ZwY=;
 b=gfPJN+1zNM6uemPimbGip77AdXEunTxqxI7NGnbOPVUlKi4U40/MoQusK22Mk+XpwL5Cq5
 T0qk+WhED/aHLSoxmQQAGAXcFbXuZh409re4zvuFHCOayaZMWpfYbwS5DLAK00XYanYqZU
 GXg0vtIYqHuLYnQ6wBJBPHrd8QRwkNw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-5C7OneFzP5KJ6GJjipw-3A-1; Wed, 26 Aug 2020 10:38:40 -0400
X-MC-Unique: 5C7OneFzP5KJ6GJjipw-3A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3BB61074649;
 Wed, 26 Aug 2020 14:38:38 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-115-59.ams2.redhat.com [10.36.115.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D69AE76E00;
 Wed, 26 Aug 2020 14:38:31 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Xu <peterx@redhat.com>
Subject: [RFC v6 08/13] virtio-iommu: Mark virtio_iommu_translate IOTLB as
 IOMMU_IOTLB_NONE type
Date: Wed, 26 Aug 2020 16:36:46 +0200
Message-Id: <20200826143651.7915-9-eperezma@redhat.com>
In-Reply-To: <20200826143651.7915-1-eperezma@redhat.com>
References: <20200625191651.5817-1-eperezma@redhat.com>
 <20200826143651.7915-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=eperezma@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 03:56:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Avi Kivity <avi@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fFBzEpEaCOK8

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/virtio-iommu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 5d56865e56..16267e8096 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -619,6 +619,7 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
         .translated_addr = addr,
         .addr_mask = (1 << ctz32(s->config.page_size_mask)) - 1,
         .perm = IOMMU_NONE,
+        .type = IOMMU_IOTLB_NONE,
     };
 
     bypass_allowed = virtio_vdev_has_feature(&s->parent_obj,
-- 
2.18.1

