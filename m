Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2107488ejb;
        Tue, 30 May 2023 04:39:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4VudT8PSTNN6ZrB4qO9F/eGVfWnkQYljMLx+XstFbbc7Tgwb4mXJ1FuXBvMk6/ezPrtIL0
X-Received: by 2002:ad4:5d6c:0:b0:621:7241:df33 with SMTP id fn12-20020ad45d6c000000b006217241df33mr2116600qvb.0.1685446743445;
        Tue, 30 May 2023 04:39:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685446743; cv=none;
        d=google.com; s=arc-20160816;
        b=coqzpNYY/5uBp9MrmdOz5+6KmzVpNYOKVqFiHqkQ5vV7BHTE3MUrDl6nQEjZWu2Cup
         a6BfqyYU1EN8YV0Ji5mpxR8IwSMd2SngClW5wiD1UgdzmqA3Kb2IFx61K9R74V9WAzCh
         7gVHxyBXdwObe8FGAmWCTvMVBQJPU0gojgeObNUYaShvzl2RoYyT5qHPCZ8peLX+n7z0
         D0flWGZJMfAIaPv/yrj/iQKr7bhcH8TEgYr9P67hHuezR3bv4SxL2EoLHcSP02rOnKu4
         nT25pVTTG4EiiJ/FoSg/bYfbnl8W4tbTdY2ShyTds5uZ2r6wUtSouD19jNZ1E+WWiAvj
         Uhqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=W8vQx4/9Or5NihRj56D/+Pk8eevcGnxAnsAvxtdm8kE=;
        b=YHKNRcZmPgl6A05P8cgp+fg1mWyD6QjkXAjFvXn5dc3uEVFHiekkMFZMpqDYq4NcyO
         JvigaL8XNW/K8TovFeh0/u4n9/OoNO//KL6GGgqCXVwXErJDfTDxj1l2O2Evu6ItL+zY
         dfgYB7g5M4/Fddb0r3QuBbz/Yts18wNhHFK3ps84IZ2Qbfat3twcUtoodBAFGkQ48GNi
         UGyKotY5JkTx3ZXefvLWMXVa8x8MGkQq8sZfbzahXYTp1IUmUpqZdIv6bcH195MEyV4M
         nRDIblgsrsUDNHMJ1rGipRZa/Re2f8hXq8dMTG52xDMtie1D7sR46AoGU0xCg3ns+7NE
         Dv5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U7gUslkR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p26-20020a05620a133a00b0075c978fa9a5si6043135qkj.497.2023.05.30.04.39.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 04:39:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U7gUslkR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q3xgk-0007qZ-3k; Tue, 30 May 2023 07:38:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q3xgh-0007px-8o
 for qemu-arm@nongnu.org; Tue, 30 May 2023 07:38:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q3xgf-0003xN-D4
 for qemu-arm@nongnu.org; Tue, 30 May 2023 07:38:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685446727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=W8vQx4/9Or5NihRj56D/+Pk8eevcGnxAnsAvxtdm8kE=;
 b=U7gUslkRE1ESqzcFXxzaLRJbLFIKY1KWNbBy5E4h33MvFzPXBVwQv2s6jDkkN1h1AtNYmG
 9TanlSKLjtOXWuPshkxF+iC84U+r8mlMkqqIeFXpkDf4NXNMTEGLIHLmGDjF3cxhwNTNDb
 zAK9aQIV+xPw2LBuZUMxx26+8FvUQXo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-G8hdHSg8P_-8I8U0Hx2npg-1; Tue, 30 May 2023 07:38:44 -0400
X-MC-Unique: G8hdHSg8P_-8I8U0Hx2npg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A50A828237C0;
 Tue, 30 May 2023 11:38:43 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4280640CFD45;
 Tue, 30 May 2023 11:38:39 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PATCH 00/10] memory-device: Some cleanups
Date: Tue, 30 May 2023 13:38:28 +0200
Message-Id: <20230530113838.257755-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: JSIW8bP2Gvy3

Working on adding multi-memslot support for virtio-mem (teaching memory
device code about memory devices that can consume multiple memslots), I
have some preparatory cleanups in my queue that make sense independent of
the actual memory-device/virtio-mem extensions.

v1 -> v2:
- Allocate ms->device_memory only if the size > 0.
- Split it up and include more cleanups

David Hildenbrand (10):
  memory-device: Unify enabled vs. supported error messages
  memory-device: Introduce memory_devices_init()
  hw/arm/virt: Use memory_devices_init()
  hw/ppc/spapr: Use memory_devices_init()
  hw/loongarch/virt: Use memory_devices_init()
  hw/i386/pc: Use memory_devices_init()
  hw/i386/acpi-build: Rely on machine->device_memory when building SRAT
  hw/i386/pc: Remove PC_MACHINE_DEVMEM_REGION_SIZE
  memory-device: Refactor memory_device_pre_plug()
  memory-device: Track used region size in DeviceMemoryState

 hw/arm/virt.c                  |  9 +----
 hw/i386/acpi-build.c           |  9 ++---
 hw/i386/pc.c                   | 36 +++---------------
 hw/loongarch/virt.c            | 14 ++-----
 hw/mem/memory-device.c         | 69 +++++++++++++++-------------------
 hw/ppc/spapr.c                 | 37 +++++++++---------
 hw/ppc/spapr_hcall.c           |  2 +-
 include/hw/boards.h            |  2 +
 include/hw/i386/pc.h           |  1 -
 include/hw/mem/memory-device.h |  2 +
 10 files changed, 68 insertions(+), 113 deletions(-)

-- 
2.40.1

