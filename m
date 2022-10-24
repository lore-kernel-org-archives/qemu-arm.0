Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp3003876ejn;
        Sun, 23 Oct 2022 21:19:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5szxmy/oUKsax+SKzB8L5lUMlLsgA4KsmjzrIM1N0uZgbq/CSgZXtmk8WOAcXm6cBLFLiL
X-Received: by 2002:a37:6303:0:b0:6ec:554b:131d with SMTP id x3-20020a376303000000b006ec554b131dmr21671173qkb.166.1666585152974;
        Sun, 23 Oct 2022 21:19:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666585152; cv=none;
        d=google.com; s=arc-20160816;
        b=U9nJpDno838HFmXf3dEtfiIDp55lHoVmOcWjwSF/4aNW/fbr1CwsfmOGO0RHzQem+W
         tXxUSGF/Qt+2YbeWcWUdL8u7VQCLfIQQy0JlU8WMdbCcg0erzbNH6CI8IqeaxsFlbVEg
         2dTkeOiM2M3UKg/HUz1y0QU120gu3x4QSzrWTnDiBSlAHfq+3UVW9N5PGwV6KYmL9G06
         SAqwblohO5oJ0AhXyQe/N8HPboWRs9WktESAMEVbuXfd8TUxPvyNeRmUI0cJIgv1DUMc
         6JpazcsKKgjQDK2YZFAzlt0U/acdl/nJ3ZDuWtGKPvaW1wZCaFYpu17S1YdV/hgoaphM
         NLDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=/gFv8flEKFR5XhvE3xDSVrn6pybwoyJKg6mjp+ourJE=;
        b=aJ518XlN/LSSos1p4Vmulykjq1ydHD/K41LXPF/dODe0wOWYWbQF+JWxuWWnn+DlFV
         WurFvngwsuiBz7uqmy2VAxwvreGo/NqIAuIUa4imgw5LkgHNiTS/xfmU8S9s4+LgZAhz
         tVHD0a2I9ZpB2spWND+vcxj+p3fCYZam811yWQjOaNLpd3/kvPpTFc3tCTgrs0lvyLC4
         gIWHMxSGjV8BZrVFpkSz5iQEPbfuHWmYOQrl2BB8/fnDDGGJzyW4J8TvBBHK7WwwnG9R
         SD/KCMRje8vBI4Vt/xOAS+e+vI2WqHR4mEuhvjOk0fZreIFs4mlWfqWys+pTOGbe85P8
         tO1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iNb637Nh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o62-20020a375a41000000b006cf03b4c696si15643351qkb.257.2022.10.23.21.19.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Oct 2022 21:19:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iNb637Nh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1omoXq-00087f-LF; Sun, 23 Oct 2022 23:54:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1omoXp-00086e-DS
 for qemu-arm@nongnu.org; Sun, 23 Oct 2022 23:54:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1omoXn-0000fA-ED
 for qemu-arm@nongnu.org; Sun, 23 Oct 2022 23:54:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666583670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/gFv8flEKFR5XhvE3xDSVrn6pybwoyJKg6mjp+ourJE=;
 b=iNb637NhXtZz1DojPa9CRAgrMwnOgoRllOPtwYmeOEFZ/ZCd3lQn7tusYy+rZdVwWIVPPI
 P0WdLbTYCXMEM9m8zYigF70moKC45ee5o0oTxZ5mI3t7OIE/xet/sFi/r5VocZBXHTqVvw
 XLZy4lcPKI97mJUv5SthxjDPrfVXuZ8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-wlqYJwm6PPiHe7_8UEijwQ-1; Sun, 23 Oct 2022 23:54:27 -0400
X-MC-Unique: wlqYJwm6PPiHe7_8UEijwQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED426185A79C;
 Mon, 24 Oct 2022 03:54:26 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-29.bne.redhat.com [10.64.54.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 646A540C6F9F;
 Mon, 24 Oct 2022 03:54:23 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 cohuck@redhat.com, zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: [PATCH v6 0/7] hw/arm/virt: Improve address assignment for high
 memory regions
Date: Mon, 24 Oct 2022 11:54:09 +0800
Message-Id: <20221024035416.34068-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FqQmkJudZaNZ

There are three high memory regions, which are VIRT_HIGH_REDIST2,
VIRT_HIGH_PCIE_ECAM and VIRT_HIGH_PCIE_MMIO. Their base addresses
are floating on highest RAM address. However, they can be disabled
in several cases.

(1) One specific high memory region is disabled by developer by
    toggling vms->highmem_{redists, ecam, mmio}.

(2) VIRT_HIGH_PCIE_ECAM region is disabled on machine, which is
    'virt-2.12' or ealier than it.

(3) VIRT_HIGH_PCIE_ECAM region is disabled when firmware is loaded
    on 32-bits system.

(4) One specific high memory region is disabled when it breaks the
    PA space limit.

The current implementation of virt_set_memmap() isn't comprehensive
because the space for one specific high memory region is always
reserved from the PA space for case (1), (2) and (3). In the code,
'base' and 'vms->highest_gpa' are always increased for those three
cases. It's unnecessary since the assigned space of the disabled
high memory region won't be used afterwards.

The series intends to improve the address assignment for these
high memory regions and introduces new properties for user to
selectively disable those 3 high memory regions.

PATCH[1-4] preparatory work for the improvment
PATCH[5]   improve high memory region address assignment
PATCH[6]   adds 'compact-highmem' to enable or disable the optimization
PATCH[7]   adds properties so that high memory regions can be disabled

v5: https://lists.nongnu.org/archive/html/qemu-arm/2022-10/msg00280.html
v4: https://lists.nongnu.org/archive/html/qemu-arm/2022-10/msg00067.html
v3: https://lists.nongnu.org/archive/html/qemu-arm/2022-09/msg00258.html
v2: https://lore.kernel.org/all/20220815062958.100366-1-gshan@redhat.com/T/
v1: https://lists.nongnu.org/archive/html/qemu-arm/2022-08/msg00013.html

Changelog
==========
v6:
  * Pick review-by from Connie/Eric                            (Connie/Eric)
  * Make the changes obvious in PATCH[v6 5/7]                  (Eric)
  * Move the example to commit log and describe the legacy
    and compact layout in code's comments in PATCH[v6 6/7]     (Eric)
  * Comment and commit message improvements                    (Connie/Eric)
  * Add 3 properties in PATCH[v6 7/7], allowing user to disable
    those 3 high memory regions                                (Marc)
v5:
  * Pick review-by and tested-by                               (Connie/Zhenyu)
  * Add extra check in PATCH[v5 4/6]                           (Connie)
  * Improve comments about compatibility for disabled regions
    in PATCH[v5 5/6]                                           (Connie)
v4:
  * Add virt_get_high_memmap_enabled() helper                  (Eric)
  * Move 'vms->highmem_compact' and related logic from
    PATCH[v4 6/6] to PATCH[v4 5/6] to avoid git-bisect
    breakage                                                   (Eric)
  * Document the legacy and optimized high memory region
    layout in commit log and source code                       (Eric)
v3:
  * Reorder the patches                                        (Gavin)
  * Add 'highmem-compact' property for backwards compatibility (Eric)
v2:
  * Split the patches for easier review                        (Gavin)
  * Improved changelog                                         (Marc)
  * Use 'bool fits' in virt_set_high_memmap()                  (Eric)

Gavin Shan (7):
  hw/arm/virt: Introduce virt_set_high_memmap() helper
  hw/arm/virt: Rename variable size to region_size in
    virt_set_high_memmap()
  hw/arm/virt: Introduce variable region_base in virt_set_high_memmap()
  hw/arm/virt: Introduce virt_get_high_memmap_enabled() helper
  hw/arm/virt: Improve high memory region address assignment
  hw/arm/virt: Add 'compact-highmem' property
  hw/arm/virt: Add properties to disable high memory regions

 docs/system/arm/virt.rst |  16 ++++
 hw/arm/virt.c            | 182 ++++++++++++++++++++++++++++++++-------
 include/hw/arm/virt.h    |   2 +
 3 files changed, 167 insertions(+), 33 deletions(-)

-- 
2.23.0

