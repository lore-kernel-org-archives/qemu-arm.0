Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp1068625eje;
        Mon, 10 Jul 2023 03:08:06 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFva7139JLz0vURsG0BX9qw5j3/tWRqJ1FlIOI9STQLFVU9laUu9mJAPzhbmoa6hna+MyNd
X-Received: by 2002:a05:622a:1aa7:b0:3e4:e2ce:526f with SMTP id s39-20020a05622a1aa700b003e4e2ce526fmr15554154qtc.39.1688983686430;
        Mon, 10 Jul 2023 03:08:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688983686; cv=none;
        d=google.com; s=arc-20160816;
        b=w1QStGCXRRvM+BGZHxuYrVDbZmsqDLF3tLSqYhJOQsyoZ5zPJq7N39bzLjFeIds7ns
         YDliKfMXoO21Nsx6pco51/dDVw3HBwfW2dgLiIxSRU58hAo5JCieBY9gs0SMMpBNJUpo
         GygBUviw7OI8Adr9God5+jb48NbnebIOUMucklgGOUMzucNYKjsIyIRcPefCpYW+QXsN
         jzC0GLblilMN5q1tr3BiKVwT2ixsj4JVLvTfS35MFyrsRTtccNAv01CGuVXl3cTpmES8
         Epkut2qvzOhTot9exkiVA/wGhmT/IK0R3ZDTNXKIKFIv7Z56dJxPVJQ4P9Fn7DIFakm4
         T7jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=6+FoA7ereaDUPB4zC1oCJv9vOkkfVjia/S4CKNEV3P8=;
        fh=he34ucSNOi56U9wkr/s+M3ZTDgBY7iRqVjLgddG0i4w=;
        b=cnOC8KSm/pW5L+5pqL2JRJFmYIVEVAwSgSli6NK21lkUk/+D2U0TVheVf0bOHacyw2
         KYNvBCDMJnOSs6p6k8WiMAtuZtEihfg4A0wYANCIKtTVeGOvG7GrMYcnc8dl+p+kiGZB
         vHpDHVYWVQcAZ8/nfo9S6UMjt9c9p/chhti0gPneNAxgg1R+C1VoWSrS8sLczbeN6VLA
         6b4szMOrkHScBqIUdiaS8+WA9LZq0YWW28XdtMwFk7BT6KMuASn0YXs7c2ZVVkjLianM
         dnUKYcY4LEFZIK0458tGzGh9TH2DwOE+kb8Gw1DnatPZqUVdhdW2m+WAC9Bgpno+DHoK
         0i1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TYowzBma;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m14-20020a05622a118e00b00403a1b5592fsi2613617qtk.239.2023.07.10.03.08.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Jul 2023 03:08:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TYowzBma;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qInnm-0003ih-SX; Mon, 10 Jul 2023 06:07:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qInnk-0003fx-Pp
 for qemu-arm@nongnu.org; Mon, 10 Jul 2023 06:07:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qInnj-0004jL-3z
 for qemu-arm@nongnu.org; Mon, 10 Jul 2023 06:07:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688983646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=6+FoA7ereaDUPB4zC1oCJv9vOkkfVjia/S4CKNEV3P8=;
 b=TYowzBmaiMi1BIaUrzWzGRn7npxy5eY88itivo0uMAc8P88RTpxN2pC1yxQgFWa8Uc53U+
 Ecc68ftk4mU13Q/JfJfmkDyT3XevWjcsDhy1fCUGsNPckOVEnHqahhyyKuGK+cp+9xsyGZ
 8ZdlJ9y6eEM4uv5tBQaA6Zo5vDTOKIw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-ktrEwKoANkCWWUHUHsIpxA-1; Mon, 10 Jul 2023 06:07:23 -0400
X-MC-Unique: ktrEwKoANkCWWUHUHsIpxA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 176E5384CC4B;
 Mon, 10 Jul 2023 10:07:23 +0000 (UTC)
Received: from t14s.redhat.com (unknown [10.39.194.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 02BD4111CA03;
 Mon, 10 Jul 2023 10:07:20 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 Gavin Shan <gshan@redhat.com>, Mario Casquero <mcasquer@redhat.com>
Subject: [PATCH v3 0/7] virtio-mem: Device unplug support
Date: Mon, 10 Jul 2023 12:07:07 +0200
Message-ID: <20230710100714.228867-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: sl4/YdMCeS7q

Any further comments? IMHO this is pretty straight forward. I'll wait
a bit longer for more feedback.


One limitation of virtio-mem is that we cannot currently unplug virtio-mem
devices that have all memory unplugged from the VM.

Let's properly handle forced unplug (as can be triggered by the VM) and
add support for ordinary unplug (requests) of virtio-mem devices that are
in a compatible state (no legacy mode, no plugged memory, no plug request).

Briefly tested on both, x86_64 and aarch64.

v2 -> v3:
- "virtio-md-pci: New parent type for virtio-mem-pci and virtio-pmem-pci"
 -> Add MAINTAINERS entry

v1 -> v2:
- Reduce code duplication and implement it in a cleaner way using a
  new abstract virtio-md-pci parent class
- "virtio-md-pci: New parent type for virtio-mem-pci and virtio-pmem-pci"
 -> Added, use a new aprent type like virtio-input-pci
- "pc: Factor out (un)plug handling of virtio-md-pci devices"
 -> Added, factor it cleanly out
- "arm/virt: Use virtio-md-pci (un)plug functions"
 -> Added, reduce code duplciation
- "virtio-md-pci: Handle unplug of virtio based memory devices"
 -> More generic without any device-specifics
- "virtio-md-pci: Support unplug requests for compatible devices"
 -> More generic without any device-specifics
- "virtio-mem: Prepare for device unplug support"
 -> Use callback, separated from virtio-mem-pci device change
- "virtio-mem-pci: Device unplug support"
 -> Use callback, separated from virtio-mem device change

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Eduardo Habkost <eduardo@habkost.net>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-arm@nongnu.org
Cc: Gavin Shan <gshan@redhat.com>
Cc: Mario Casquero <mcasquer@redhat.com>

David Hildenbrand (7):
  virtio-md-pci: New parent type for virtio-mem-pci and virtio-pmem-pci
  pc: Factor out (un)plug handling of virtio-md-pci devices
  arm/virt: Use virtio-md-pci (un)plug functions
  virtio-md-pci: Handle unplug of virtio based memory devices
  virtio-md-pci: Support unplug requests for compatible devices
  virtio-mem: Prepare for device unplug support
  virtio-mem-pci: Device unplug support

 MAINTAINERS                       |   6 ++
 hw/arm/virt.c                     |  81 +++-------------
 hw/i386/pc.c                      |  90 +++---------------
 hw/virtio/Kconfig                 |   8 +-
 hw/virtio/meson.build             |   1 +
 hw/virtio/virtio-md-pci.c         | 151 ++++++++++++++++++++++++++++++
 hw/virtio/virtio-mem-pci.c        |  54 +++++++++--
 hw/virtio/virtio-mem-pci.h        |   6 +-
 hw/virtio/virtio-mem.c            |  25 +++++
 hw/virtio/virtio-pmem-pci.c       |   5 +-
 hw/virtio/virtio-pmem-pci.h       |   6 +-
 include/hw/virtio/virtio-md-pci.h |  44 +++++++++
 include/hw/virtio/virtio-mem.h    |   1 +
 13 files changed, 311 insertions(+), 167 deletions(-)
 create mode 100644 hw/virtio/virtio-md-pci.c
 create mode 100644 include/hw/virtio/virtio-md-pci.h

-- 
2.41.0

