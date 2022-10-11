Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp2783934ejn;
        Tue, 11 Oct 2022 16:19:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4HYUFpBZv1Gi3ht7fzhqOg/WJjxj3WhTXIIj3awJgWxa7Iwsz4Sn1wng4uvxi3Eh/zb4bz
X-Received: by 2002:a05:6214:1c0c:b0:4b1:d2fe:7ad4 with SMTP id u12-20020a0562141c0c00b004b1d2fe7ad4mr21155999qvc.128.1665530357655;
        Tue, 11 Oct 2022 16:19:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665530357; cv=none;
        d=google.com; s=arc-20160816;
        b=Dpkg/SVq1NWcJGwSnn4fE/d/Bfalr3hRrmjcOBOOL0aTwkxooWLMZjHYBmP18nsa1j
         nOfn0J3yByRRKIlQDlCLhlEKEclMNu6tMLz4a6s2KCYz7g2Ng9NDQ/seDeo8Ev8lox3u
         eWgPyGSipzkhZXY/avLKZe8IHY/K6X9vkRbZ72iCviGcG2hcSkGKNzmUTKs9h0cyOXXi
         QN+aPhgudtZ/t2Vm7YGEK8dzBFl+GSlwGrwB+YIAUch6acJTl8SrpcmzUy6DZ+N0cnKL
         h50TbD2+Ffp9jx3WeXqqk62fud2oOX5OlbO6zXx4Tw6E0ipdWNASGnfwnuEmbSpMLwyx
         2Nsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=96V88CcrRlXApHTOWcATYol6fWaKmNpCsWy7rKr09xw=;
        b=KaTUemLSUuxy9Vrz5+vZmCPHho9hItNi9+rBArGppXE80F9mdKuhiBlK8k/EPx682r
         RUFxnsL+hhci6MclXSRKvWJ3W4Xbi56O9XkORqjt0SUdNctXfcyhfGe1CR0uHed/28So
         4kU/qn6QpqtQxsjdAYjmdivrNpSfImP2taDYPc7ITGrv7Bft6EBjPUMIVVvO6QdZ4HTv
         ay0TT5cyZZUU4XMgI9tHZWRpzHqzfRvuYN2W2XvB6CrQ9M2XJTXZLD73vnNaMmcB5m4N
         QFK95KCEZVKMxoMuC+tQ4cKMATZiJKJX6cSCfqRMNXsXxckFLvQKkZYTcCkSYo/ZYgI3
         ZmjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=feb1wuH3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kf10-20020a056214524a00b004b1b522cf0asi7229565qvb.168.2022.10.11.16.19.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Oct 2022 16:19:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=feb1wuH3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oiOWr-0004N2-4Z
	for alex.bennee@linaro.org; Tue, 11 Oct 2022 19:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oiOWf-0004MX-JD
 for qemu-arm@nongnu.org; Tue, 11 Oct 2022 19:19:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oiOWc-0006Oh-H4
 for qemu-arm@nongnu.org; Tue, 11 Oct 2022 19:19:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665530341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=96V88CcrRlXApHTOWcATYol6fWaKmNpCsWy7rKr09xw=;
 b=feb1wuH3kMZvF9b/HSH2zzDPjOKHI3jrwZBYvBP9JJoK4YdaEn6mN2fMTX4ct50DE8ZBjU
 LpoM1VxnBk34XHVk9yaoYCQmiFZgPcEP01ZuzHiT/ojGFbEvvOqE9uH9CrkrUq9bXbPyc1
 6R4u3cGP92xBQojtco02e1zdQ+buCTg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-204-Y2mpU22hPlChSgMiELM4YQ-1; Tue, 11 Oct 2022 19:18:58 -0400
X-MC-Unique: Y2mpU22hPlChSgMiELM4YQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F20823815D2E;
 Tue, 11 Oct 2022 23:18:57 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-52.bne.redhat.com [10.64.54.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 269882166B2F;
 Tue, 11 Oct 2022 23:18:53 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 cohuck@redhat.com, zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: [PATCH v5 0/6] hw/arm/virt: Improve address assignment for high
 memory regions
Date: Wed, 12 Oct 2022 07:18:26 +0800
Message-Id: <20221011231832.149839-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O7pmBMeD19MA

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
high memory regions.

PATCH[1-4] preparatory work for the improvment
PATCH[5]   improve high memory region address assignment
PATCH[6]   adds 'compact-highmem' to enable or disable the optimization

v4: https://lists.nongnu.org/archive/html/qemu-arm/2022-10/msg00067.html
v3: https://lists.nongnu.org/archive/html/qemu-arm/2022-09/msg00258.html
v2: https://lore.kernel.org/all/20220815062958.100366-1-gshan@redhat.com/T/
v1: https://lists.nongnu.org/archive/html/qemu-arm/2022-08/msg00013.html

Changelog
==========
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

Gavin Shan (6):
  hw/arm/virt: Introduce virt_set_high_memmap() helper
  hw/arm/virt: Rename variable size to region_size in
    virt_set_high_memmap()
  hw/arm/virt: Introduce variable region_base in virt_set_high_memmap()
  hw/arm/virt: Introduce virt_get_high_memmap_enabled() helper
  hw/arm/virt: Improve high memory region address assignment
  hw/arm/virt: Add 'compact-highmem' property

 docs/system/arm/virt.rst |   4 ++
 hw/arm/virt.c            | 135 +++++++++++++++++++++++++++++----------
 include/hw/arm/virt.h    |   2 +
 3 files changed, 108 insertions(+), 33 deletions(-)

-- 
2.23.0

