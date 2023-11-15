Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2839155ejc;
        Wed, 15 Nov 2023 07:13:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGicLx3Ix8t2+1nMj49RwTOFxDmI2sPjTNM2e8FgY+SIq4G5JNVL1tYvOCaCsuj6rwV9QIo
X-Received: by 2002:a0c:eb08:0:b0:670:5242:a6a1 with SMTP id j8-20020a0ceb08000000b006705242a6a1mr8377613qvp.31.1700061203719;
        Wed, 15 Nov 2023 07:13:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700061203; cv=none;
        d=google.com; s=arc-20160816;
        b=Qer1S75orBRFnjY0waTMy2J64mZ4bNbRVsqA9KRyYAypisrSo4rd1J+iCIjOz3W9Yu
         +ZU6jPG+QSRALc1KK2aybXTW5jgdVUkYVTnClYlVJI/qTvkh07YyS1QflURy6DPAON/Z
         3X87QUGNTzoFYsUgkWJyDmtkR3YXD9IbYDr4uFixLsiprceRkjiWkPZe7f85uXDUTxkx
         iMLItGhWYoEu7OwWhTZougaz/qsNrI9p1/RDfZMi9jMryR8KEYaY9B7XsqTKAsxoSHHV
         eioCsKxCMcH5eZhlToDGop53l+33YgcIOUVG8KCWTnEmnThK6aQo7DmaEIdRYC0JAPcP
         3y0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=aOdtLnBeupD44njXn4MsoVi1WSu1OdmrTBNNCcdehoI=;
        fh=aH4SF+xuSHrUGtnSFxtFTCUyBE4iqqHq5kYhw/wkcgk=;
        b=SUpCvB/EUJLIvMqguqHZX9enCc21yME/Lt3oNIWR0pegeUFDL8TPA56Y0I8aEhPVjm
         VHsUAeMbRuwalxEHqTWTRUHTwkaMWmxbVqwrXaj9qomRfH7j/Uhms6EAjqm/rvjzEtRy
         jkRs1JvJLxvAmPKQBJvtDgk/kflPpBBVHqTOoUi5SyZjTRfI8Armm2W/QF+4tFIm2YrZ
         WEAZYZ9pkhdvvA/X45QN3kWAf9hvPrGL2ZUa1Slcu5qCyxaY91cbVdaN8Cqb3Hqbcf2/
         kvU7h3i5+UX3OYIsaCR9yAK8b09U2ywIRFwqgHdsTGlPMniufoc1O+k5HUD/N69IyVbK
         MgEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FroqMcVd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q11-20020a0cfa0b000000b0065af9336a9csi9118860qvn.157.2023.11.15.07.13.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Nov 2023 07:13:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FroqMcVd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r3HZk-0003uc-Bf; Wed, 15 Nov 2023 10:13:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1r3HZY-0003tB-Gj
 for qemu-arm@nongnu.org; Wed, 15 Nov 2023 10:12:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1r3HZQ-0003Eq-JJ
 for qemu-arm@nongnu.org; Wed, 15 Nov 2023 10:12:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700061167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aOdtLnBeupD44njXn4MsoVi1WSu1OdmrTBNNCcdehoI=;
 b=FroqMcVdU3gnBL1dVXvHSKylIpbdh60aNVmkjU7vhMU4a0qsqOuOt5gLQ1oKN9HFBmZpxt
 lejGAL0YFlwo/0KcU0Lr8EOXu+hAkYaSiDDSHNuxik3jZS4jOipSDpLS0v+gwLNM3cu03W
 dt2gYCCeqGe67o66h3lL5pStNsM3fUI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-2aoodDrQN1G2NwdYBE0c6w-1; Wed, 15 Nov 2023 10:12:44 -0500
X-MC-Unique: 2aoodDrQN1G2NwdYBE0c6w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 238EA8630DE;
 Wed, 15 Nov 2023 15:12:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB54A36EE;
 Wed, 15 Nov 2023 15:12:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 63795180AC06; Wed, 15 Nov 2023 16:12:42 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Eric Blake <eblake@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?L=C3=A1szl=C3=B3=20=C3=89rsek?= <lersek@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 graf@amazon.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 00/16] hw/uefi: add uefi variable service
Date: Wed, 15 Nov 2023 16:12:22 +0100
Message-ID: <20231115151242.184645-1-kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.099,
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
X-TUID: gP6E6a2mC61K

This patch adds a virtual device to qemu which the uefi firmware can use
to store variables.  This moves the UEFI variable management from
privileged guest code (managing vars in pflash) to the host.  Main
advantage is that the need to have privilege separation in the guest
goes away.

On x86 privileged guest code runs in SMM.  It's supported by kvm, but
not liked much by various stakeholders in cloud space due to the
complexity SMM emulation brings.

On arm privileged guest code runs in el3 (aka secure world).  This is
not supported by kvm, which is unlikely to change anytime soon given
that even el2 support (nested virt) is being worked on for years and is
not yet in mainline.

The design idea is to reuse the request serialization protocol edk2 uses
for communication between SMM and non-SMM code, so large chunks of the
edk2 variable driver stack can be used unmodified.  Only the driver
which traps into SMM mode must be replaced by a driver which talks to
qemu instead.

A edk2 test branch can be found here (build with "-D QEMU_VARS=TRUE").
https://github.com/kraxel/edk2/commits/devel/secure-boot-external-vars

The uefi-vars device must re-implement the privileged edk2 protocols
(i.e. the code running in SMM mode).  The implementation is not complete
yet, specifically updating authenticated variables is not implemented.
These variables are simply read-only for now.

But there is enough functionality working that it is possible to run
guests, including guests in secure boot mode, so I'm sending this out
for feedback (before tackling the remaining 20% which evidently will
need 80% of the time ;)

Because the guest can not write to authenticated variables (yet) it can
not enroll secure boot keys itself, this must be done on the host.  The
virt-firmware tools (https://gitlab.com/kraxel/virt-firmware) can be
used for that:

virt-fw-vars --enroll-redhat --secure-boot --output-json uefivars.json

enjoy & take care,
  Gerd

Gerd Hoffmann (16):
  hw/uefi: add include/hw/uefi/var-service-api.h
  hw/uefi: add include/hw/uefi/var-service-edk2.h
  hw/uefi: add include/hw/uefi/var-service.h
  hw/uefi: add var-service-guid.c
  hw/uefi: add var-service-core.c
  hw/uefi: add var-service-vars.c
  hw/uefi: add var-service-auth.c
  hw/uefi: add var-service-policy.c
  hw/uefi: add support for storing persistent variables on disk
  hw/uefi: add trace-events
  hw/uefi: add to Kconfig
  hw/uefi: add to meson
  hw/uefi: add uefi-vars-sysbus device
  hw/uefi: add uefi-vars-isa device
  hw/arm: add uefi variable support to virt machine type
  docs: add uefi variable service documentation and TODO list.

 include/hw/arm/virt.h              |   2 +
 include/hw/uefi/var-service-api.h  |  40 ++
 include/hw/uefi/var-service-edk2.h | 184 +++++++++
 include/hw/uefi/var-service.h      | 119 ++++++
 hw/arm/virt.c                      |  41 ++
 hw/uefi/var-service-auth.c         |  91 +++++
 hw/uefi/var-service-core.c         | 350 +++++++++++++++++
 hw/uefi/var-service-guid.c         |  61 +++
 hw/uefi/var-service-isa.c          |  88 +++++
 hw/uefi/var-service-json.c         | 194 ++++++++++
 hw/uefi/var-service-policy.c       | 390 +++++++++++++++++++
 hw/uefi/var-service-sysbus.c       |  87 +++++
 hw/uefi/var-service-vars.c         | 602 +++++++++++++++++++++++++++++
 docs/devel/index-internals.rst     |   1 +
 docs/devel/uefi-vars.rst           |  66 ++++
 hw/Kconfig                         |   1 +
 hw/meson.build                     |   1 +
 hw/uefi/Kconfig                    |   9 +
 hw/uefi/TODO.md                    |  17 +
 hw/uefi/meson.build                |  18 +
 hw/uefi/trace-events               |  16 +
 meson.build                        |   1 +
 qapi/meson.build                   |   1 +
 qapi/qapi-schema.json              |   1 +
 qapi/uefi.json                     |  40 ++
 25 files changed, 2421 insertions(+)
 create mode 100644 include/hw/uefi/var-service-api.h
 create mode 100644 include/hw/uefi/var-service-edk2.h
 create mode 100644 include/hw/uefi/var-service.h
 create mode 100644 hw/uefi/var-service-auth.c
 create mode 100644 hw/uefi/var-service-core.c
 create mode 100644 hw/uefi/var-service-guid.c
 create mode 100644 hw/uefi/var-service-isa.c
 create mode 100644 hw/uefi/var-service-json.c
 create mode 100644 hw/uefi/var-service-policy.c
 create mode 100644 hw/uefi/var-service-sysbus.c
 create mode 100644 hw/uefi/var-service-vars.c
 create mode 100644 docs/devel/uefi-vars.rst
 create mode 100644 hw/uefi/Kconfig
 create mode 100644 hw/uefi/TODO.md
 create mode 100644 hw/uefi/meson.build
 create mode 100644 hw/uefi/trace-events
 create mode 100644 qapi/uefi.json

-- 
2.41.0

