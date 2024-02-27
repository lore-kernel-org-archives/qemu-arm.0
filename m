Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2797010ejf;
        Tue, 27 Feb 2024 08:58:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX1/uSelQBzL9CtEEeJeaAlbnlPLaaa5so11J4VwwvKJMgtob7KkVRJhGYQvrXZNRi7MekxmTrzBoQX5zUDVRhG4q4SYMVP
X-Google-Smtp-Source: AGHT+IHF6uZ+LZoS4L0SLfVesJky0s1NdMdSrfvbmNmPlxGWHBNEerNjY2/zLpEfIHBkPonumMOF
X-Received: by 2002:a25:c405:0:b0:dc7:43b7:31ac with SMTP id u5-20020a25c405000000b00dc743b731acmr56880ybf.14.1709053083117;
        Tue, 27 Feb 2024 08:58:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709053083; cv=none;
        d=google.com; s=arc-20160816;
        b=BYeDHTQvr2PLtcZeigqHAUS3ZtcQifGYN87GFB1EIH9VM6n6SxuXFYT8B8NenbcpMa
         N9w8bGlBsf34BCB7BWVPUNfYexZdY3/auAeNIs5FREdx17yAXwXf1Lvjas1T6e0QjH1L
         BmIkp2htQC+7R0fhuUcLcJb6br3w8+vvE53Q5Vq9ZPVf4kV7JZM5SGN9iWpmKipstVSl
         tyoJwzTnDRczGESajCsUwc5P4Xj5fKgyxtRuFaS2ngb8K7e5jODrmu4hPrO4Ey6cl+dN
         AaSs6cSGPUz7m5KcPHsd6c7+AgkDidgXIXg9QSk0CFDaQoKfgateNpiDX2cv69z5L3Mt
         2K+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=xLHqlVXT6u7++hKNve5zJfLTJT6CBjxuNawJLM4V4V4=;
        fh=Qj9XkJT2wrGpuyrK8Cb5JvU0zaa7DXMs4s0kNIoBId8=;
        b=ZlQA9nPtAN2ljco8vCHMYwGQPcMiLKsL1ZhnA67e4VNKl6rGC8Qa47s7bMJj1enVS1
         TEyDMOZ/+EoWoHZnWsqxFh6f3XzqZ9ChqsnfQoUbat6fxGofRkauMyyM+HMFaCFpepiW
         8HeV1fTDnxw+P+4IyNODSDUATwqaJU/oovzrAAFJ/ycTsQY4fM1+4fnUyCgey3QzILKH
         kQ9ksp/Tjy8Qb+08janz/KdKbvJUx7Sr2ficRaqMfUhV4cSMrxYSSVcZI3I+ykaxkHOr
         HmoOC52/fKrKJVl0qLbTF2DB7e5NaUhgrqhzMw8Ll3xwXUUVx8TmqhnrznoQl9srYoPo
         jJ1Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f+Yk+zYE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z22-20020a05622a029600b0042e83ad786csi5696959qtw.504.2024.02.27.08.58.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 08:58:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f+Yk+zYE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rf0m4-0005Hx-M2; Tue, 27 Feb 2024 11:57:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rf0m3-0005Ha-H0
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 11:57:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rf0m0-00054M-Sq
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 11:57:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709053062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xLHqlVXT6u7++hKNve5zJfLTJT6CBjxuNawJLM4V4V4=;
 b=f+Yk+zYEFkpci+uXlwu4j4sPGiQ4amnxdoTKAMCEPLAejIgByNuBSHQEEPSr4H9KUGoU7Q
 Og3DEbq+/7HccQd3obyBEaIv2VZKE8jo6OwTwgW+g9HIG3yvWEh+xW7ceQnUh15q7Bl/pU
 wCSJGWeNCEAtLXUitmCkwjKEGuj5VXk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-t5gE07s5MpWK62mlSZbK_Q-1; Tue, 27 Feb 2024 11:57:39 -0500
X-MC-Unique: t5gE07s5MpWK62mlSZbK_Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04590185A783;
 Tue, 27 Feb 2024 16:57:39 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7873A2166B5D;
 Tue, 27 Feb 2024 16:57:34 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 peter.maydell@linaro.org, clg@redhat.com, yanghliu@redhat.com
Cc: alex.williamson@redhat.com, zhenzhong.duan@intel.com, jasowang@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com
Subject: [PATCH v6 0/3] VIRTIO-IOMMU: Set default granule to host page size
Date: Tue, 27 Feb 2024 17:55:47 +0100
Message-ID: <20240227165730.14099-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: FJhluSNZgwjC

We used to set the default granule to 4kB but with VFIO assignment
it makes more sense to use the actual host page size.

Indeed when hotplugging a VFIO device protected by a virtio-iommu
on a 64kB/64kB host/guest config, we currently get a qemu crash:

"vfio: DMA mapping failed, unable to continue"

This is due to the hot-attached VFIO device calling
memory_region_iommu_set_page_size_mask() with 64kB granule
whereas the virtio-iommu granule was already frozen to 4kB on
machine init done.

Introduce a new granule property, set this latter to "host"
and introduce a new compat (that sets it to 4k for machine
types older than 9.0).

Note that the new default will prevent 4kB guest on 64kB host
because the granule will be set to 64kB which would be larger
than the guest page size. In that situation, the virtio-iommu
driver fails on viommu_domain_finalise() with
"granule 0x10000 larger than system page size 0x1000".

In that case 4K granule should be used.

To summarize, before the series, the support matrix (credit
to Jean-Philippe Brucker) was:

 Host | Guest | virtio-net | IGB passthrough
  4k  | 4k    | Y          | Y
  64k | 64k   | Y          | N
  64k | 4k    | Y          | N
  4k  | 64k   | Y          | Y

After the series:

 Host | Guest | virtio-net | IGB passthrough
  4k  | 4k    | Y          | Y
  64k | 64k   | Y          | Y
  64k | 4k    | 4K         | N
  4k  | 64k   | Y          | Y

The current limitation of global granule in the virtio-iommu
should be removed and turned into per domain granule. But
until we get this upgraded, this new default is probably
better because I don't think anyone is currently interested in
running a 4KB page size guest with virtio-iommu on a 64KB host.
However supporting 64kB guest on 64kB host with virtio-iommu and
VFIO looks a more important feature.

This series can be found at:
https://github.com/eauger/qemu/tree/granule-v4

Applied on top of
[PATCH v5 0/4] VIRTIO-IOMMU: Introduce an aw-bits option
https://lore.kernel.org/all/20240215084315.863897-1-eric.auger@redhat.com/

History:
v5 -> v6:
- remove one useless header inclusion
- collected Philippe & Zhenzhong's R-b

v4 -> v5:
- use -(n * KiB) (Philippe)
- remove code that can be automatically generated
  and add the new enum in qapi/virtio.json (Philippe).
- Improve commit msg on last patch and collected Philippe's R-b

v3 -> v4:
- Add 8K granule (Richard)

v2 -> v3
- introduce a dedicated granule option to handle the compat


Eric Auger (3):
  qdev: Add a granule_mode property
  virtio-iommu: Add a granule property
  virtio-iommu: Change the default granule to the host page size

 qapi/virtio.json                    | 18 ++++++++++++++++++
 include/hw/qdev-properties-system.h |  3 +++
 include/hw/virtio/virtio-iommu.h    |  2 ++
 hw/core/machine.c                   |  1 +
 hw/core/qdev-properties-system.c    | 14 ++++++++++++++
 hw/virtio/virtio-iommu.c            | 28 +++++++++++++++++++++++++---
 qemu-options.hx                     |  3 +++
 7 files changed, 66 insertions(+), 3 deletions(-)

-- 
2.41.0

