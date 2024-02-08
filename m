Received: by 2002:a17:906:c945:b0:a38:6d10:c5dd with SMTP id fw5csp2656ejb;
        Thu, 8 Feb 2024 02:12:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0Uvo1y260CtxntvPV0dxC1oC7tvUU2+pOzxfK+SEKuUe67XjnX1dWsOsE3KJHnU2Y/QlN
X-Received: by 2002:a05:620a:35a:b0:785:8c17:dfa3 with SMTP id t26-20020a05620a035a00b007858c17dfa3mr8093775qkm.40.1707387138451;
        Thu, 08 Feb 2024 02:12:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707387138; cv=none;
        d=google.com; s=arc-20160816;
        b=WAZaO0gF8yzxgQuAniTgwxr07+QH1nTv108rVglZv3VxgSvdTAWkOLBq0qYTeYQkXJ
         BIx2tCHpmCLbHXOI3RT1JeMWlCvtSYIdmaP3bb/zRG31tPDxX+d323sILpIh84qV8i5O
         IDafZZcs6/+knOMKyQvnagq16L+3+GbjF17OWurbHNZCLb39g0QU0K+b6EyoqggP04aD
         7p8KXuGoZmTIpVaVxT2ZusMBPT8Yniqcv+j/tdep2fED0s1GL4snVrC5sySRtczVYMJh
         PD8zXEVRlBSPl8l20RCUESMX4xMGmqLB9GbzQEmDh8SrLRZKSEHP7j46iLbSi0WpHBt1
         IdXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=QWc7K4SAaAUGSopscvwZUSnyqPN5PmMwwPZ0eEeRFAQ=;
        fh=M3s71foXjU4bWdNJF6DbZwd6TwT2aPT91zheAI9GpXQ=;
        b=VMrGB516XSzmit64gEC0BZ2H3CApjnvaLE4s5bV+0ViDxM3d3I0E89IbHswFChWAIf
         +e4HhZ64IjQpMd2LqqezLInb4gBpJr+tX6DcvhGdvh5BfFqLbR4py5iuaoszvtdy/JZq
         R85fFD6BIT013BrorU89McxzyNDk5bEmvtycAzPTKoqXgdImQBkJ9d3giIUi7bS5juyW
         7pwqKf6HGWNQhcqa3Nf0+SgbtNw0rd+sPTGMstnEAbDlCYuenybaVTIDSQSF/QNMj5kn
         n8uFpE8xlMImw7wMfrU/u7J8tlwCprGCydagIRzR8m5rx3pg3Ewuml2KDo3odKrCjZA/
         XaXQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JAAYBEm5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=1; AJvYcCWM9oaDUGjziiCL8De1fPySsC2/Y1kqoisBTqXY2g8sBvrRK/ecKJ6aRSDuq42m3BFwv5BIMoTDZ6Qf6wUdgw1he9FtjlUO
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id vq13-20020a05620a558d00b007856007f7basi2891451qkn.349.2024.02.08.02.12.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Feb 2024 02:12:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JAAYBEm5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rY1Nh-0003ww-DC; Thu, 08 Feb 2024 05:11:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rY1Ng-0003w3-0S
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 05:11:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rY1Nb-0000RX-1h
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 05:11:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707387097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QWc7K4SAaAUGSopscvwZUSnyqPN5PmMwwPZ0eEeRFAQ=;
 b=JAAYBEm5DBDIiPb2n84eCQZyaZbsajGUrWHiFtwD1fNz90RWavwyahoAqySa6PvgL6XVrr
 7y3a0xsiBncth9PQM6viDYkRKbbm+zfePAA4pTAfIzjxw3ujDVHKkYBNDQarGfs/jtXxop
 N/SRAdaH/6LJ5VN4tRO4eQuNlFLSvUg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-Vm9mNB92OJG5pdVudNufDQ-1; Thu, 08 Feb 2024 05:11:34 -0500
X-MC-Unique: Vm9mNB92OJG5pdVudNufDQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC576101FA0B;
 Thu,  8 Feb 2024 10:11:33 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 988E6C08EF7;
 Thu,  8 Feb 2024 10:11:31 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, jean-philippe@linaro.org, mst@redhat.com,
 peter.maydell@linaro.org, clg@redhat.com, zhenzhong.duan@intel.com,
 yanghliu@redhat.com
Cc: alex.williamson@redhat.com,
	jasowang@redhat.com
Subject: [PATCH v3 0/3] VIRTIO-IOMMU: Introduce an aw-bits option
Date: Thu,  8 Feb 2024 11:10:16 +0100
Message-ID: <20240208101128.655167-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: 4rVp+H0mn8lG

In [1] and [2] we attempted to fix a case where a VFIO-PCI device
protected with a virtio-iommu is assigned to an x86 guest. On x86
the physical IOMMU may have an address width (gaw) of 39 or 48 bits
whereas the virtio-iommu exposes a 64b input address space by default.
Hence the guest may try to use the full 64b space and DMA MAP
failures may be encountered. To work around this issue we endeavoured
to pass usable host IOVA regions (excluding the out of range space) from
VFIO to the virtio-iommu device so that the virtio-iommu driver can
query those latter during the probe request and let the guest iommu
kernel subsystem carve them out. 

However if there are several devices in the same iommu group,
only the reserved regions of the first one are taken into
account by the iommu subsystem of the guest. This generally
works on baremetal because devices are not going to
expose different reserved regions. However in our case, this
may prevent from taking into account the host iommu geometry.

So the simplest solution to this problem looks to introduce an
input address width option, aw-bits, which matches what is
done on the intel-iommu. By default, from now on it is set
to 39 bits with pc_q35 and 48 with arm virt. This replaces the
previous default value of 64b. So we need to introduce a compat
for machines older than 9.0 to behave similarly. We use
hw_compat_8_2 to acheive that goal.

Outstanding series [2] remains useful to let resv regions beeing
communicated on time before the probe request.

[1] [PATCH v4 00/12] VIRTIO-IOMMU/VFIO: Don't assume 64b IOVA space
    https://lore.kernel.org/all/20231019134651.842175-1-eric.auger@redhat.com/
    - This is merged -

[2] [RFC 0/7] VIRTIO-IOMMU/VFIO: Fix host iommu geometry handling for hotplugged devices
    https://lore.kernel.org/all/20240117080414.316890-1-eric.auger@redhat.com/
    - This is pending for review on the ML -

This series can be found at:
https://github.com/eauger/qemu/tree/virtio-iommu-aw-bits-v3
previous
https://github.com/eauger/qemu/tree/virtio-iommu-aw-bits-v2

Applied on top of [3]
[PATCH v2] virtio-iommu: Use qemu_real_host_page_mask as default page_size_mask
https://lore.kernel.org/all/20240117132039.332273-1-eric.auger@redhat.com/

History:
v2 -> v3:
- Collected Zhenzhong and Cédric's R-b + Yanghang's T-b
- use &error_abort instead of NULL error handle
  on object_property_get_uint() call (Cédric)
- use VTD_HOST_AW_39BIT (Cédric)

v1 -> v2
- Limit aw to 48b on ARM
- Check aw is within [32,64]
- Use hw_compat_8_2


Eric Auger (3):
  virtio-iommu: Add an option to define the input range width
  virtio-iommu: Trace domain range limits as unsigned int
  hw: Set virtio-iommu aw-bits default value on pc_q35 and arm virt

 include/hw/virtio/virtio-iommu.h | 1 +
 hw/arm/virt.c                    | 6 ++++++
 hw/core/machine.c                | 5 ++++-
 hw/i386/pc.c                     | 6 ++++++
 hw/virtio/virtio-iommu.c         | 7 ++++++-
 hw/virtio/trace-events           | 2 +-
 6 files changed, 24 insertions(+), 3 deletions(-)

-- 
2.41.0

