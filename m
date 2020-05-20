Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp575318lfb;
        Wed, 20 May 2020 06:23:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYoBmQcpORjvEjcpjhsnw0RJhoojMWDOCldK0UBjK4c49UwhohslDwZlAvKWLt/hLUFkLh
X-Received: by 2002:a37:d245:: with SMTP id f66mr3695058qkj.452.1589980984107;
        Wed, 20 May 2020 06:23:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589980984; cv=none;
        d=google.com; s=arc-20160816;
        b=oYKHEA2E3z9Z0IbYXZijJ6IbfkWGvr4Vncat+EgVe40v+e5twTQcoIt5i9tq5mRVrf
         JxSDjjLSoUr89U07mASzFJtZntNf6RAxVhTyAVT4xYnEOYvn5vgK4CkNljD4Tdq0mVbc
         K2NPsoIOGIg/ZHXKdwJPX8Q1yAwm163Z/3xpEuNdYrDvKA5mLxcMpcHQ0tjYAd5DZG3C
         xMwgqe1M8CuXgUZ43yxCnkH8aabkOy1JyG3rCp22eehP6a70BSTcMfP6Fk+w5n3n37Zy
         fLiLJnxzUBv4yLg6ru97ujZ7Z3E34GVPV1jXko6GdalXoH0OT6Y6Lb6ErGcZ/HC8C2eq
         fWpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=LjEUqtAyDJRh+3ySal0dAeENhAV5iT0I2cr2A1T9mw0=;
        b=rnZJKmYxTfnz2/31QMj4arMsgN4H0cL24u7VI726UgLYjnJ5ylIWUnEoRTEDWaUwnL
         kp0zFxmF5fO+AsUcUdEhO1raPqRTR4yp0kGHLmiC3W9rU1s+b9lnWMbifD35W3UIlSOB
         G0oaTIsYbmTSN3eN9ut0/u8m0IIWgYnqQhjKi1yP2vYvAFjJktyJFipQceQLaBUCXZib
         Ae87Jsc6bdpmOfF8BqtEi5hxcEa4+xOJXSWYkokh26q2YSm6UGrU1VDcNYHmfyFAbBRL
         oncRpcK1G4YbigSigNsR5rofoO0MboRo8fGlPmlWRj5IUODUag29OnKznhMg+HOmSsli
         IAAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=daZSJOQP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l13si1634816qtf.68.2020.05.20.06.23.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 May 2020 06:23:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=daZSJOQP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbOgZ-0006t5-Df
	for alex.bennee@linaro.org; Wed, 20 May 2020 09:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jbOe5-0001qi-5A
 for qemu-arm@nongnu.org; Wed, 20 May 2020 09:20:29 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23970
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jbOe2-0000E5-AE
 for qemu-arm@nongnu.org; Wed, 20 May 2020 09:20:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589980825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LjEUqtAyDJRh+3ySal0dAeENhAV5iT0I2cr2A1T9mw0=;
 b=daZSJOQPGnwOCSyaSHEH3V2ItdGUYCBcRW/GiNztZpeg/UCJ/KFHiuGNhYqeaJG8cqpChG
 +7j8N+FSH4zWUQ9qnWsISJcgQUcs5g9I8/suNt/sCaQuQcNllki9fHZCrsr2pIRCczdoya
 /Tr5x4eyXS7Q2qSnu9W0msFF2NLHrsQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-_O4RNU_fMvqSY4AG9lTl1A-1; Wed, 20 May 2020 09:20:19 -0400
X-MC-Unique: _O4RNU_fMvqSY4AG9lTl1A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E23C835B45;
 Wed, 20 May 2020 13:20:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E49DF6246F;
 Wed, 20 May 2020 13:20:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8A74617444; Wed, 20 May 2020 15:20:03 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/22] microvm: add acpi support
Date: Wed, 20 May 2020 15:19:41 +0200
Message-Id: <20200520132003.9492-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 01:34:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g8FKqTZmNUda

I know that not supporting ACPI in microvm is intentional.  If you still
don't want ACPI this is perfectly fine, you can use the usual -no-acpi
switch to toggle ACPI support.

These are the advantages you are going to loose then:

  (1) virtio-mmio device discovery without command line hacks (tweaking
      the command line is a problem when not using direct kernel boot).
  (2) Better IO-APIC support, we can use IRQ lines 16-23.
  (3) ACPI power button (aka powerdown request) works.
  (4) machine poweroff (aka S5 state) works.

Together with seabios patches for virtio-mmio support this allows to
boot standard fedora images (cloud, coreos, workstation live) with the
microvm machine type.

git branch for testing (including updated seabios):
	https://git.kraxel.org/cgit/qemu/log/?h=sirius/microvm

changes in v2:
  * some acpi cleanups are an separate patch series now.
  * switched to hw reduced acpi & generic event device.
  * misc fixes here and there.

changes in v3:
  * depeds on "[PATCH v6 00/16] acpi: i386 tweaks" series.
  * renamed qboot to qboot.bin
  * updated seabios to master branch snapshot.
    - this version boots fine with rtc=off
  * generic event device tweaks (Igor's comments).
  * make SMP work.
  * add RfC patches to turn off acpi by default for microvm.
  * misc fixes here and there.

cheers,
  Gerd

Gerd Hoffmann (22):
  microvm: name qboot binary qboot.bin
  [testing] seabios: update submodule to master snapshot
  [testing] seabios: update config & build rules
  [testing] seabios: update binaries to master snapshot
  acpi: make build_madt() more generic.
  acpi: create acpi-common.c and move madt code
  acpi: madt: skip pci override on pci-less systems.
  acpi: fadt: add hw-reduced sleep register support
  acpi: ged: rename event memory region
  acpi: ged: add control regs
  acpi: ged: add x86 device variant.
  acpi: move acpi_dsdt_add_power_button() to ged
  x86: coldplug cpus
  microvm: use 2G split unconditionally
  microvm: make virtio irq base runtime configurable
  microvm/acpi: add minimal acpi support
  microvm/acpi: add acpi_dsdt_add_virtio() for x86
  microvm/acpi: use GSI 16-23 for virtio
  microvm/acpi: use seabios with acpi=on
  microvm/acpi: disable virtio-mmio cmdline hack
  [RfC] acpi: add per machine type acpi default
  [RfC] acpi: flip default to off for microvm

 hw/i386/acpi-common.h                  |  15 ++
 hw/i386/acpi-microvm.h                 |   6 +
 include/hw/acpi/acpi-defs.h            |   2 +
 include/hw/acpi/generic_event_device.h |  14 +-
 include/hw/i386/microvm.h              |  11 +-
 include/hw/i386/x86.h                  |   1 +
 hw/acpi/aml-build.c                    |   4 +-
 hw/acpi/generic_event_device.c         |  68 ++++++-
 hw/arm/virt-acpi-build.c               |   8 -
 hw/i386/acpi-build.c                   | 126 +------------
 hw/i386/acpi-common.c                  | 156 +++++++++++++++++
 hw/i386/acpi-microvm.c                 | 234 +++++++++++++++++++++++++
 hw/i386/generic_event_device_x86.c     |  36 ++++
 hw/i386/microvm.c                      |  78 ++++++---
 hw/i386/x86.c                          |  32 +++-
 hw/i386/Kconfig                        |   1 +
 hw/i386/Makefile.objs                  |   3 +
 pc-bios/bios-256k.bin                  | Bin 262144 -> 262144 bytes
 pc-bios/bios-microvm.bin               | Bin 65536 -> 131072 bytes
 pc-bios/bios.bin                       | Bin 131072 -> 131072 bytes
 pc-bios/qboot.bin                      | Bin 0 -> 65536 bytes
 roms/Makefile                          |  11 +-
 roms/config.seabios-128k               |   3 +
 roms/config.seabios-microvm            |  26 +++
 roms/seabios                           |   2 +-
 25 files changed, 664 insertions(+), 173 deletions(-)
 create mode 100644 hw/i386/acpi-common.h
 create mode 100644 hw/i386/acpi-microvm.h
 create mode 100644 hw/i386/acpi-common.c
 create mode 100644 hw/i386/acpi-microvm.c
 create mode 100644 hw/i386/generic_event_device_x86.c
 create mode 100644 pc-bios/qboot.bin
 create mode 100644 roms/config.seabios-microvm

-- 
2.18.4

