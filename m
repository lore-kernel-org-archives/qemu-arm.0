Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3672150dye;
        Wed, 2 Jul 2025 01:57:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXrHVOcYUwdr4FAkDtJLwjJqxuCCyH8jDe6cE5i6Vb3mpr41HMmf7QssmRYCOupFSaji9BqU5c3nrVgrg==@linaro.org
X-Google-Smtp-Source: AGHT+IG8WMEK3c/RRika7g6NcwDa7yr//iN6DcrKVM7Sa07PHMePcMz63i8JNe9IPY4KZYKt7XuW
X-Received: by 2002:a05:620a:298c:b0:7d4:6123:fae0 with SMTP id af79cd13be357-7d5c4735b70mr313816285a.44.1751446623320;
        Wed, 02 Jul 2025 01:57:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751446623; cv=none;
        d=google.com; s=arc-20240605;
        b=PsA+7j1Agb5EPV/xpnJ0ZReFCTw9JigOGUXXTORRfWv9zLksKS8CKnsmjuoMQ89Ofj
         MCgLdDB97KtWbNfRQMZs1YgrS/ohmFVpYw+gFg5UKVNC6fR9tFMf6kmAqzU+46/g9Up4
         TTX6S4bgTqpnsFUqcVlzXBCzIA93cM9e5tGEYbNUyJNTFBrKMqGgpMmAa4ep/0z87MCb
         h0AmGC3TSXEVP2rhT2gB0kEt2t2f5BYyn3PUGtsWHXoKdnbGamOXWUplcJXl3x1vbTnt
         SXSnyjlCQfhuCWxC1eijEmmJeR/hH/uOXFmRoTr3dqQCCzwlAcijGl7AaynRNWGDQJYq
         /aDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=RQGL6Fh3ytcO2cXkmkLYkjWcg5c3LLdLoqv9zK/qqQ4=;
        fh=cf4RIoSY8nLlsUThZaJ+LO601L/hXQB8ckYyDM2NlFA=;
        b=TxauhUCAZc9h5cnzb/ZVWW8cxb7aqRBA9KbJcJLXK9nhEQHM8pO+VFIvy8BAqu+ZvL
         QdhBPNqdCAV/+8CsoiZC4UPzRB00PdZ/k4kVwjVOl7jYlt7FkpgtE6qTDwnJJjg/TNmk
         F8MP3nV+tkvpATaty7offcNUWHh5NQk+5KYeFYXfW5vDYaWYn1LO7/w19753FWJphoU4
         ZMTfIGRx3Lzb/1qU9rZcMa6Hr9odPvMvBrCFj+8UNuVK9LfQtjoDeaHIzbR2ZloYPs9q
         7/y5zm3Dubock6dcnB6ctiZd8pMULw7fTQa9POCfUNjY2Hp9l5Zv9Tp0U1dOmJUHYuQp
         8vww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JKKwKNlu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d4432375fesi1214171585a.305.2025.07.02.01.57.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 01:57:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JKKwKNlu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWtGd-0001eK-6Y; Wed, 02 Jul 2025 04:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uWtGb-0001e8-9o
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 04:56:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uWtGY-0003uw-Tv
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 04:56:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751446588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=RQGL6Fh3ytcO2cXkmkLYkjWcg5c3LLdLoqv9zK/qqQ4=;
 b=JKKwKNluNZ713v/DiW/dKE4Nkio/V/LqwM1ADaSXeAIBA/I7/5dZkuyktAEFoKD6xVyVLv
 TdxzWJHfuEAzVNy4P5OXz1qvqOAXwu4uUwZJRnvBF9sEYbQvW8VC+7tAvSgP8JQT3H+v3w
 NcMq9on0ZFq8T0kldOVMTegMZeBX8sE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-541-QtdRg5MZP420TZ-pHO3vVw-1; Wed,
 02 Jul 2025 04:56:25 -0400
X-MC-Unique: QtdRg5MZP420TZ-pHO3vVw-1
X-Mimecast-MFC-AGG-ID: QtdRg5MZP420TZ-pHO3vVw_1751446584
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7EED619560A1; Wed,  2 Jul 2025 08:56:23 +0000 (UTC)
Received: from virt-mtcollins-01.lab.eng.rdu2.redhat.com
 (virt-mtcollins-01.lab.eng.rdu2.redhat.com [10.8.1.196])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2DE0E18002B5; Wed,  2 Jul 2025 08:56:18 +0000 (UTC)
From: Shaoqin Huang <shahuang@redhat.com>
To: qemu-arm@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Auger <eauger@redhat.com>,
 Shaoqin Huang <shahuang@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v7 0/2] ramfb: Add property to control if load the romfile
Date: Wed,  2 Jul 2025 04:56:14 -0400
Message-Id: <20250702085616.2172722-1-shahuang@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Received-SPF: pass client-ip=170.10.129.124; envelope-from=shahuang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: NvMVpK232Swn

Currently the ramfb device loads the vgabios-ramfb.bin unconditionally, but only
the x86 need the vgabios-ramfb.bin, this can cause that when use the
release package on arm64 it can't find the vgabios-ramfb.bin.

Because only seabios will use the vgabios-ramfb.bin, load the rom logic
is x86-specific. For other !x86 platforms, the edk2 ships an EFI driver
for ramfb, so they don't need to load the romfile.

So add a new property use-legacy-x86-rom in both ramfb and vfio_pci
device, because the vfio display also use the ramfb_setup() to load
the vgabios-ramfb.bin file.

After have this property, the machine type can set the compatibility to
not load the vgabios-ramfb.bin if the arch doesn't need it.

Then I set the use_legacy_x86_rom property to false by default, and only set it
to true on x86 since only x86 will need it.

At the same time, set the "use-legacy-x86-rom" property to true on those
historical versioned machine types in order to avoid the memory layout
being changed.

Changelog:
---------
v6 -> v7:
  - Set the property into hw_compat_10_0 instead of hw_compat_9_2.
v5 -> v6:
  - Set the property to true on those historical versioned machine types.
v4 -> v5:
  - Fix some typo error.
  - Set the property in piix machine type.
v3 -> v4:
  - Set the new property to false by default, only set it to true on x86.
v2 -> v3:
  - Fix the underscore error.
  - Add a new patch to set the property in arm compatibility.
v1 -> v2:
  - Change the property name.

v6: https://lore.kernel.org/all/20250701030549.2153331-1-shahuang@redhat.com/
v5: https://lore.kernel.org/all/20250626034526.2136585-1-shahuang@redhat.com/
v4: https://lore.kernel.org/all/20250617030521.2109305-1-shahuang@redhat.com/
v3: https://lore.kernel.org/all/20250609073408.2083831-1-shahuang@redhat.com/
v2: https://lore.kernel.org/all/20250606070234.2063451-1-shahuang@redhat.com/
v1: https://lore.kernel.org/all/20250605030351.2056571-1-shahuang@redhat.com/


Shaoqin Huang (2):
  ramfb: Add property to control if load the romfile
  hw/i386: Add the ramfb romfile compatibility

 hw/core/machine.c             |  2 ++
 hw/display/ramfb-standalone.c |  4 +++-
 hw/display/ramfb-stubs.c      |  2 +-
 hw/display/ramfb.c            |  6 ++++--
 hw/i386/pc_piix.c             | 10 ++++++++++
 hw/i386/pc_q35.c              |  3 +++
 hw/vfio/display.c             |  4 ++--
 hw/vfio/pci.c                 |  1 +
 hw/vfio/pci.h                 |  1 +
 include/hw/display/ramfb.h    |  2 +-
 10 files changed, 28 insertions(+), 7 deletions(-)

-- 
2.40.1

