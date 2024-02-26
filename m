Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2223778ejf;
        Mon, 26 Feb 2024 10:14:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVLBTmb3G5ItiO+vJD09OJHs0LcItzpjaqC/kpX+5SbTPpSvl6pTWRyb6/LQiFxy8lC5LNob6/8dSqemNpXc34c0t82Oes0
X-Google-Smtp-Source: AGHT+IEKYGPi81uee/qeYlyRfXRpvtuspuNjr3LnF067oPTY67cpnJrIhCQ8Pj/bq5mGWKCMbJbR
X-Received: by 2002:a05:6358:2489:b0:17a:ed6c:3f0c with SMTP id m9-20020a056358248900b0017aed6c3f0cmr8287367rwc.24.1708971259246;
        Mon, 26 Feb 2024 10:14:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708971259; cv=none;
        d=google.com; s=arc-20160816;
        b=epEU44iYOGsyKUqPJjAj900bo5wMJOFUNFrxfx/gCjUBJEWlhYN8vuxoFcrs5h/R8F
         cLQM+bhtH1hQ1u0nqdaKI6N4gC2Qd0XkTuea6Hv6rxMMWI8Ai8jwG3zJzAjrj025aeHd
         9YX7R0Xph45rr66e9b/l9GjS47sH5qpjnBD3B4k4SqGBCH2+X30naNAuuaqVNj4HF8WS
         3WJKPKHWngzQR/rMDadOWei0osJEC6P1IbkTnp/KKF3h02Ju/nPMvAcORPW5kcqnBR3M
         DPzt8bgEF36wsiyz6asbzRMa1UqR2ZnNyMew3UJry/L1Bvzeor7X2gPhx/kQWevJfgBn
         XwQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=i1dWddzH/YQyj6E4Obik038GydQPV4mPULLWQS4+yjQ=;
        fh=Qj9XkJT2wrGpuyrK8Cb5JvU0zaa7DXMs4s0kNIoBId8=;
        b=QmNzTo4x25FcXBgz37j22m5kqcQtu3MYAwauampE5GjIY7vFHyDw1weCZEDhkKomv7
         jM4ngHVgA5eHICpgMRZnSVs11/6f3DR320FS8qnC4A+JFTsLCcKPhZlbPLxU0+DoZfT1
         eD1vK/mVzzUzfQADJk9qPB91VqzL+0KW61GvRZ3AHk0QShpKdBvoKXveEU3eti+ZyTqn
         3hlj0t4FZiP62J/ZeNM/tuF5mMz2NvLxsTgStx20K6rItsHbjxt14rzRb0booOyia00U
         nkBLa0GzkOVbHDi+OxKoPK8dOsJm/QYtwY1Os+o2byyIVnKOgFWbGI7uJBSzZBy0CVi2
         LyJA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OWJEILas;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o15-20020ac8554f000000b0042e695ae483si5646390qtr.454.2024.02.26.10.14.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 10:14:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OWJEILas;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1refUS-00058g-9n; Mon, 26 Feb 2024 13:14:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1refUP-000587-0t
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 13:14:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1refUN-00058I-72
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 13:14:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708971244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=i1dWddzH/YQyj6E4Obik038GydQPV4mPULLWQS4+yjQ=;
 b=OWJEILasQ9jHSAU0ThqFSs443e76wZk0DBtKLYIGt+rqFGqQRhVebfz2wvtwfJ7dp5cjmU
 1Yo5cwJA6lTWxkmkafFBmA1AromV4XRXueAm9uEvaCJ+khcUz9zhSeAWMCqbbK5NIAxtQa
 4BEnb/YIlIMcQa9o819ZTuvqQBb706o=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-317-xqYRYeOyOV-qz5T_QpNJfQ-1; Mon,
 26 Feb 2024 13:14:02 -0500
X-MC-Unique: xqYRYeOyOV-qz5T_QpNJfQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F5443804502;
 Mon, 26 Feb 2024 18:14:01 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 49AEF40C1064;
 Mon, 26 Feb 2024 18:13:57 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 peter.maydell@linaro.org, clg@redhat.com, yanghliu@redhat.com
Cc: alex.williamson@redhat.com, zhenzhong.duan@intel.com, jasowang@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com
Subject: [PATCH v5 0/3] VIRTIO-IOMMU: Set default granule to host page size
Date: Mon, 26 Feb 2024 19:11:09 +0100
Message-ID: <20240226181337.24148-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.014,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: vws+s/t1oNSK

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
https://github.com/eauger/qemu/tree/granule-v3

Applied on top of
[PATCH v5 0/4] VIRTIO-IOMMU: Introduce an aw-bits option
https://lore.kernel.org/all/20240215084315.863897-1-eric.auger@redhat.com/

History:
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
 hw/core/qdev-properties-system.c    | 15 +++++++++++++++
 hw/virtio/virtio-iommu.c            | 28 +++++++++++++++++++++++++---
 qemu-options.hx                     |  3 +++
 7 files changed, 67 insertions(+), 3 deletions(-)

-- 
2.41.0

