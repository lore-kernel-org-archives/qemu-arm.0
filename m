Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2082105ejb;
        Tue, 23 May 2023 11:53:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6F3L+S9Cdkf6rLMfuCf7fCjSfa3Q7a64pUC1qa9vHsfYAqbhODz/WicqLiJA5ydXk/DJQg
X-Received: by 2002:a05:620a:b96:b0:75b:23a0:e7c9 with SMTP id k22-20020a05620a0b9600b0075b23a0e7c9mr4945786qkh.42.1684867995636;
        Tue, 23 May 2023 11:53:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684867995; cv=none;
        d=google.com; s=arc-20160816;
        b=afwFzuHTh21wqqu/pPMyUSAYfwW/ZPbvE+5/q9esqzXWpSBWsNdON5n25gVDeT623X
         vozB/uYOcv/L59ac7cP+cK0YdTcoccuau0v72Z0q7tui8T7JkkFKFyKYqYRePZMxzrp8
         eY5x+v45oAEbNwvkvV8pSOe+7QTkxjqwkW3SEEsfcqKluthBpoQZx29NcZvqWk58f0xT
         JfhP3pajqW0kWDt4IhRPAYMGIW1izNveHYuHK4LJnriBp2pNGduhVXfIL/JUwC3xM0Xh
         v9Te89EkWdxDfcnbuoKo/ofF1DddsQaa8fmTF1TOC4RjL1GlP4Aqq51etqNZ/sYM+gYy
         fPcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZqVuXQC+BWaAXu0vRsPhxO0XkmVH5UqPwxUh6UrrnFc=;
        b=M6IyS2+bAHmxoxSo4PaPLjpwHjju0FXTnUUXlRKSzBSiQB8WP8IT1YDNlDpnWtAYEw
         JASZOC1/UWAJ4iI3kR6AA9DW1Z/pjemp67X7yr/uQd423ah9Tm/g5pkDJYffweSKn/tf
         rnih8ioPUnXcUwBa/NTpZ1MEp6/Y7w6DIM2h3gMLPrgAcRJoQcUMs5H+l89IhrPdnyhp
         Ko3eutQroPhZxNcOKO9n41L0dO/PkPYqAcmlyev7ZKBSg6WCeKJTgWAth5sWiFIhbVu/
         4slXbBmodlr1aRA6Z1MRYbqh31b24vHT0AV8lPnDP8glL5Xq2KztKNdeGEUGYZ+A2aZV
         dDLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="F9MuPo/y";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cx23-20020a05620a51d700b0075b1db45b87si2483339qkb.8.2023.05.23.11.53.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 May 2023 11:53:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="F9MuPo/y";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1X75-0007HS-Cr; Tue, 23 May 2023 14:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q1X71-0007GR-NT
 for qemu-arm@nongnu.org; Tue, 23 May 2023 14:51:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q1X6z-0000cP-In
 for qemu-arm@nongnu.org; Tue, 23 May 2023 14:51:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684867915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZqVuXQC+BWaAXu0vRsPhxO0XkmVH5UqPwxUh6UrrnFc=;
 b=F9MuPo/y5E6qdXkKO9hDqW7IjGY9OxKqdMDP7tktecMxo5eV1xj6KQIcNLiQxwPw/Zn/ou
 4ruj7V3pGx8ILMiSooyEj8WmCIyYBOWa+vdtHbDf8HzKvlSHZXP/76Chqwep5MjGKFiW9b
 /15PUcQa7xlH34QAjoBsPIryNbvXNdE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-87WzKyLfNCOWUAOXbIWROw-1; Tue, 23 May 2023 14:51:51 -0400
X-MC-Unique: 87WzKyLfNCOWUAOXbIWROw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0659B2932484;
 Tue, 23 May 2023 18:51:50 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.194.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 508DD40CFD45;
 Tue, 23 May 2023 18:51:44 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 David Hildenbrand <david@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v1 0/3] memory-device: Some cleanups
Date: Tue, 23 May 2023 20:51:41 +0200
Message-Id: <20230523185144.533592-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: +K3ue25XV3dF

Working on adding multi-memslot support for virtio-mem (teaching memory
device code about memory devices that can consume multiple memslots), I
have some preparatory cleanups in my queue that make sense independent of
the actual memory-device/virtio-mem extensions.

Most CCed people are most probably interested in patch #2.

Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Eduardo Habkost <eduardo@habkost.net>
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Cc: Song Gao <gaosong@loongson.cn>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: "Cédric Le Goater" <clg@kaod.org>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Greg Kurz <groug@kaod.org>
Cc: Harsh Prateek Bora <harshpb@linux.ibm.com>
Cc: "Philippe Mathieu-Daudé" <philmd@linaro.org>
Cc: Yanan Wang <wangyanan55@huawei.com>

David Hildenbrand (3):
  memory-device: Refactor memory_device_pre_plug()
  memory-device: Factor out device memory initialization into
    memory_devices_init()
  memory-device: Track used region size in DeviceMemoryState

 hw/arm/virt.c                  |  9 +---
 hw/i386/pc.c                   | 17 +++-----
 hw/loongarch/virt.c            | 14 ++----
 hw/mem/memory-device.c         | 80 ++++++++++++++++++----------------
 hw/ppc/spapr.c                 | 15 +++----
 include/hw/boards.h            |  2 +
 include/hw/mem/memory-device.h |  2 +
 7 files changed, 63 insertions(+), 76 deletions(-)

-- 
2.40.1

