Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp308160njb;
        Wed, 4 Dec 2024 08:00:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWAQDaV3iyWFwNVywXNq9VTO+JmEiWudGNPrtAEq53FeKxdlbhYBGa5rMJQROxGsVH9zDLvttZMx2gVbA==@linaro.org
X-Google-Smtp-Source: AGHT+IGi4SoWFap9F33b9taS+aTUHbEvVvEZCBfLZHbEycjivhBpKXMDvrEF0EIyyS74K3/JHY4n
X-Received: by 2002:a05:6122:2212:b0:515:3bb5:8802 with SMTP id 71dfb90a1353d-515bf632480mr9724817e0c.8.1733328010998;
        Wed, 04 Dec 2024 08:00:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733328010; cv=none;
        d=google.com; s=arc-20240605;
        b=DPcRS08qM0B0MUkvROv8zSzpCwgxfSOmOTMP7o3q+ZEkvv+1reez8NFZ2yBPXvgIAE
         tEf0jTjHJpaW1yzoXj0/CNt3/jO92Ksqm+ZFDeU1xlsUYucOwxgfNwP1GKhzh0tdKGSa
         X9sGKHqOjV2uPCRkeuUXjTkxksJqBEkKuN98BxZmLDqWkPfS1xv9XUISoHUTUzRivaiV
         ljMP1eyctKloroYh5NcoTzbCfgwX5a6s/HPWFahJHpfOzuv542OFFJ5aDHuGACSCgOzv
         aRINGxriV0w8lAASgmNRRhQe/lmvMlSP2HsjVcsPt0CLVo9Fc0kJ4vQz4n6/5HpJZxJl
         RzzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=MCYBn8oAUoiezjFe0xxaOlmhaLLXjgAc7LQEWWepicM=;
        fh=NUwGKPB2OQlT0sLfPAMpUPJtGunfjBtjDOvxEyEf9Yc=;
        b=XZHSsvrVYq7PGjTz7EYq/yCQ9ymE4jxzSy2ha5eKUFZj+46vD/hcXiI+L6aYdLSUPk
         deurkRwv40csG+4d+fPuGw50KX358VdXfijHlOp+o5oIyFRnu8695K5vvBgjs5sOncVu
         heig0PZP60XwhRJJVoRxMMlCUYxUHLK4dow9N5eYsZFwX5VuUI1TVeYqTfpvYPSgxIv7
         qsNaBwHKXvZcBFYFdhjpalQtfVblRxJLXrmCjyDaJVtS6lviuOAYnq4FhClr8qFDxOYh
         +gEhlZAuR950HA8Fq7W39n4OWZFIg4g3s2gRh3dNI/h3W9ol8t1Lii3tSBFpEnKA7AAe
         DV8g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=GhUknTQV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-515e22a9be7si295224e0c.213.2024.12.04.08.00.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2024 08:00:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=GhUknTQV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIrm3-0007eH-LG; Wed, 04 Dec 2024 10:58:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab@kernel.org>)
 id 1tIrly-0007bg-ME; Wed, 04 Dec 2024 10:58:43 -0500
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab@kernel.org>)
 id 1tIrlw-000757-06; Wed, 04 Dec 2024 10:58:42 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5A772A4086D;
 Wed,  4 Dec 2024 15:56:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 249CCC4CED2;
 Wed,  4 Dec 2024 15:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733327909;
 bh=jueMBi9DqtcIAo8jCb8vFwaEcMnWhMI0+nsU7Naunbo=;
 h=From:To:Cc:Subject:Date:From;
 b=GhUknTQVxI50Jxwu9VmhFjNs3op+lf/OTVA8FmnQWxFzTsMOfExv7I1rAuKrd9a36
 oQ68qTKjBhtWueYPiTTACBtwrN4hliJm9ufJeh4FT2jGtfTcF9fzamauhRheIlmT4O
 YULaUG/LU8ictiFlD4Qo+kQlfJB4xCvfKr7gjvjtb7aUS/TlyY4MJ90+yZxGL+8bNn
 6+ujN+JnuvLIIpNY2V8KCWA2CKqLSlTfRDka+kbtMJM9O/AWMFD7EvNm+PpHjJ1qlE
 74T8z2Octji2s4cr6q40rrr7z7CDy4zI/jtc3l+H1M55FE8rPdOt+laRsCt6lg1Eso
 3AjlS6gKJYtkQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab@kernel.org>) id 1tIrlf-00000000HYp-3B0D;
 Wed, 04 Dec 2024 16:58:23 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ani Sinha <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3 0/5] Change ghes driver to use HEST-based offsets
Date: Wed,  4 Dec 2024 16:57:54 +0100
Message-ID: <cover.1733327276.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:45d1:ec00::3;
 envelope-from=mchehab@kernel.org; helo=nyc.source.kernel.org
X-Spam_score_int: -73
X-Spam_score: -7.4
X-Spam_bar: -------
X-Spam_report: (-7.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: P1zdXJ4Pdd/Z

This  series was part of the previous PR to add generic error injection
support on GHES. It depends on a cleanup patch series sent earlier
today:

    https://lore.kernel.org/qemu-devel/cover.1733297707.git.mchehab+huawei@kernel.org/T/#t

It contains the changes of the math used to calculate offsets at HEST table 
and hardware_error firmware file. It prepares for the addition of GHES
error injection.

The first patch was previously at the cleanup series. It prepares
the logic to support multiple sources.

The second patch adds a new firmware file to store HEST address.

The third patch use the new firmware to calculate offsets using
HEST table.

Patches 4 and 5 add migration support. They assume that this
series will be merged for qemu 9.2 (maybe it is too late for that,
as QEMU is now on soft freeze). 

I tested migration using both virt-9.1 and virt-9.2 machines
on qemu 9.2.

I also tested migration with:

	qemu-9.1 -M virt-9.1 -cpu cortex-a57 => qemu-9.2 -M virt-9.1 -cpu cortex-a57
	qemu-9.2 -M virt-9.1 -cpu cortex-a57 => qemu-9.1 -M virt-9.1 -cpu cortex-a57 

The full qemu command when test backward-compatibility when running virt-9.1 is:


~/qemu/build/qemu-system-aarch64 \
-m 4g,maxmem=8G,slots=8 -monitor stdio -no-reboot -bios ~/emulator/QEMU_EFI-silent.fd -kernel~/kernel/arm64_build/arch/arm64/boot/Image.gz -device pcie-root-port,id=root_port1 -device virtio-blk-pci,drive=hd -device virtio-net-pci,netdev=mynet,id=bob -drive if=none,file=~/emulator/debian.qcow2,format=qcow2,id=hd -object memory-backend-ram,size=4G,id=mem0 -netdev type=user,id=mynet,hostfwd=tcp::5555-:22 -qmp tcp:localhost:4445,server=on,wait=off -M virt-9.1,nvdimm=on,gic-version=3,ras=on -cpu max -smp 4 -numa node,nodeid=0,cpus=0-3,memdev=mem0 -append 'earlycon nomodeset root=/dev/vda1 fsck.mode=skip tp_printk maxcpus=4'

(I actually call it from two different directories, one with qemu-9.1 and the other one with qemu-9.2.

For tests on qemu-9.2 with virt-9.2, I used a similar command:

~/qemu/build/qemu-system-aarch64 -m 4g,maxmem=8G,slots=8 -monitor stdio -no-reboot -bios ~/emulator/QEMU_EFI-silent.fd -kernel ~/kernel/arm64_build/arch/arm64/boot/Image.gz -device pcie-root-port,id=root_port1 -device virtio-blk-pci,drive=hd -device virtio-net-pci,netdev=mynet,id=bob -drive if=none,file=~/emulator/debian.qcow2,format=qcow2,id=hd -object memory-backend-ram,size=4G,id=mem0 -netdev type=user,id=mynet,hostfwd=tcp::5555-:22 -qmp tcp:localhost:4445,server=on,wait=off -M virt-9.2,nvdimm=on,gic-version=3,ras=on -cpu max -smp 4 -numa node,nodeid=0,cpus=0-3,memdev=mem0 -append 'earlycon nomodeset root=/dev/vda1 fsck.mode=skip tp_printk maxcpus=4'

---

v3: did some minor cleanups at the code, as suggested by Jonathan Cameron.

v2:
  - some whitespace and comment changes
  - patch 3/6 (acpi/ghes: rename the function which gets hw error offsets)
    was merged on the cleanup series.

Mauro Carvalho Chehab (5):
  acpi/ghes: Prepare to support multiple sources on ghes
  acpi/ghes: add a firmware file with HEST address
  acpi/ghes: Use HEST table offsets when preparing GHES records
  acpi/generic_event_device: Update GHES migration to cover hest addr
  acpi/generic_event_device: add logic to detect if HEST addr is
    available

 hw/acpi/generic_event_device.c |  30 +++++++
 hw/acpi/ghes.c                 | 160 +++++++++++++++++++++++++++++----
 hw/arm/virt-acpi-build.c       |  33 ++++++-
 hw/core/machine.c              |   2 +
 include/hw/acpi/ghes.h         |  23 +++--
 5 files changed, 220 insertions(+), 28 deletions(-)

-- 
2.47.1


