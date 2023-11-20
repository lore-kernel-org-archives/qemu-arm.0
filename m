Received: by 2002:a17:906:b00f:b0:9d0:bf65:29fa with SMTP id v15csp64810ejy;
        Mon, 20 Nov 2023 13:34:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcx6YgcVKz1enYhWy1LtvMTwM2byE3ox705IBLRpgMPeHQ0nK3IXPZhP7DdNypmPDkrk7U
X-Received: by 2002:a05:620a:1362:b0:778:bb39:7d34 with SMTP id d2-20020a05620a136200b00778bb397d34mr7414770qkl.36.1700516058930;
        Mon, 20 Nov 2023 13:34:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700516058; cv=none;
        d=google.com; s=arc-20160816;
        b=g88O3XXZA5q6yz9Xj8KGTk44z7rm9kvfYhxLnnr77oViZ+Tj1nErn0uavyJQI60tRs
         4bAmVPHuLOvtPH2HyPy+A824OkHc1JvArXm6hhX4UffdL1+33HSI6JJPkWw35OdczhIf
         xR/dNXneUvZHd9tA8mdbVQ7ks8cNZjZBRTsH/EIFUR2R8bSdJ+6WLms7fnwYlQdCa8tr
         Rsk+VvKFa1//X4JCg/aBCHnCswLxV1V+65Nqs9U7qPDEvmEwtHG2rzqK/SsylazbBJao
         Nnyw2V7rr60pLTaS6skC0nMiWIcvN1tRm++HPgtnb/LkUwl15j8CsG98tw1Oka3hbPEj
         FY6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=hTS81rcfQfLYfQDgcPUQbgGkksTLDJmJ/NWa4pFo3AE=;
        fh=toXMQ9nuJ3L4CLQ8EKaTQ8L/ltDlD3GauRZSJpgYVzU=;
        b=oOQRwK0XW2RwlmnOPhLux1Qn72H7GuoB3r75Zzs5cfX+lW/9FMdKHrLkANM3ZMxLyz
         r0xqAbPwWfe/zZIQ1SqMgsBazHHk0Sl/2yPhNrP3xobtq9MAOt0/80MC2QZfqW5FC8LM
         GTn6KNF/ORFzbN0MSMF3VwWlfAjBneGMWqWwR/pP42nAMiAH/n7HKWK3Sl4SMzibektD
         ejhxGJs3z6PNd2S5urqoQ3sMJkpiAsiXL9D74UniTQu7v8hXMSrpyx3AXQp0r3JK8qXe
         LA+0uBDEznpH2UXKlkdlz51R9cLzFrqCZuXnxAM4RGSZLGc2MT7FriABD2e6Y3L26gL7
         pang==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kRHWp2v+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c27-20020a05620a269b00b0077bb3e29089si7822359qkp.473.2023.11.20.13.34.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Nov 2023 13:34:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kRHWp2v+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5BtR-0000qo-IL; Mon, 20 Nov 2023 16:33:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r5BtP-0000qK-LO
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 16:33:19 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r5BtO-00037H-3i
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 16:33:19 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-32daeed7771so2977119f8f.3
 for <qemu-arm@nongnu.org>; Mon, 20 Nov 2023 13:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700515996; x=1701120796; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hTS81rcfQfLYfQDgcPUQbgGkksTLDJmJ/NWa4pFo3AE=;
 b=kRHWp2v+cqgTP7Qcv2CEVV2AK9DkO3QlLyqLwRzlr2DyHbSjx6HCowqurzeaA9wfps
 +MY7Yc4ciEQINq4lctpBuXjjap3qpyrUIdQAuiX10uwgw8p7fAbLAhaaGyw38S4Zs9+B
 StMG1uZQYoH4hCRGBtGqQemXt3EecdGt1OUUs2jT58ePfjqPP9Qiecat1avxrBVcw98a
 N+tCOkMz/qNPdNFaYm2o9hDinkY+gcLqg9lQxtaIy39JRjx6jKuH6Ke3JQw7NHzN5cIO
 LbahMaBLhcrNkkZDKDBoOo912geTo5Ui7rudX59l76KN6c10TIEEa2ag5DCE4jRvq/zF
 IVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700515996; x=1701120796;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hTS81rcfQfLYfQDgcPUQbgGkksTLDJmJ/NWa4pFo3AE=;
 b=r+klF33mtd9FFLbiJ76L6oaRN3WRl8ubI91dkkigg7sEZ3k0aCIod/Z0HJE24XrpaO
 JXvYW+X2f6MJ4cfZA5BJb0f7GqXBdZ7XqQriqOGl30y7+ABU8/Syor3A4ibGHVylZ5n4
 MQUjq4zfplGSJj4sz6R+1IZufSwaxefFAJX35cHgd8cqTLFo4DvZKLGELTYGDqGYu/jO
 BWRfFs4Hv8rqBDVlPlfuVhZaQ4hpQWcUB0BpoADg8WyVTD6AM0716pNyR8IcCIaYXHBd
 Vw/GQDG63Iv5ZDgiLrd6YPoB+uRF/XstGRcEN+OWSBTOxudWbQ5wo8cMTihxE+TcppTq
 GQOA==
X-Gm-Message-State: AOJu0YwYB4mrg69VPzr52aUgBQRm1hzRi0ewL/Brq2gIoSfx9DPe4ix2
 uRI4ErjjJE5IN0JmzCMEpMcB/A==
X-Received: by 2002:adf:fd0c:0:b0:32f:889a:2b9f with SMTP id
 e12-20020adffd0c000000b0032f889a2b9fmr5519318wrr.15.1700515996324; 
 Mon, 20 Nov 2023 13:33:16 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.190])
 by smtp.gmail.com with ESMTPSA id
 dd11-20020a0560001e8b00b0032db8f7f378sm12302913wrb.71.2023.11.20.13.33.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Nov 2023 13:33:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH-for-9.0 00/25] memory: Propagate Error* when possible
Date: Mon, 20 Nov 2023 22:32:34 +0100
Message-ID: <20231120213301.24349-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: 94pXK7oPMEsq

Hi,

This series is remotely connected with the "dynamic machine"
project. We need QOM objects created either from command line,
QMP or loaded by modules to NOT fail exiting the whole QEMU
process, but cleanly propagate any error before failing cleanly.

In preparation for that big goal, we start reworking a bit the
Memory API to be able to propagate all errors.

This targets the 9.0 release, but posting earlier to discuss with
Markus meanwhile.

Regards,

Phil.

Philippe Mathieu-Daudé (25):
  memory: Have memory_region_init_ram_flags_nomigrate() return a boolean
  memory: Have memory_region_init_ram_nomigrate() handler return a
    boolean
  memory: Have memory_region_init_rom_nomigrate() handler return a
    boolean
  memory: Simplify memory_region_init_rom_nomigrate() calls
  memory: Simplify memory_region_init_ram_from_fd() calls
  memory: Have memory_region_init_ram() handler return a boolean
  memory: Have memory_region_init_rom() handler return a boolean
  memory: Have memory_region_init_rom_device_nomigrate() return a
    boolean
  memory: Simplify memory_region_init_rom_device_nomigrate() calls
  memory: Have memory_region_init_rom_device() handler return a boolean
  memory: Have memory_region_init_resizeable_ram() return a boolean
  memory: Have memory_region_init_ram_from_file() handler return a
    boolean
  memory: Have memory_region_init_ram_from_fd() handler return a boolean
  backends: Use g_autofree in HostMemoryBackendClass::alloc() handlers
  backends: Simplify host_memory_backend_memory_complete()
  backends: Have HostMemoryBackendClass::alloc() handler return a
    boolean
  backends: Reduce variable scope in host_memory_backend_memory_complete
  util/oslib: Have qemu_prealloc_mem() handler return a boolean
  misc: Simplify qemu_prealloc_mem() calls
  hw: Simplify memory_region_init_ram() calls
  hw/arm: Simplify memory_region_init_rom() calls
  hw/sparc: Simplify memory_region_init_ram_nomigrate() calls
  hw/misc: Simplify memory_region_init_ram_from_fd() calls
  hw/nvram: Simplify memory_region_init_rom_device() calls
  hw/pci-host/raven: Propagate error in raven_realize()

 include/exec/memory.h    |  40 ++++++++---
 include/qemu/osdep.h     |   4 +-
 include/sysemu/hostmem.h |  10 ++-
 backends/hostmem-epc.c   |  14 ++--
 backends/hostmem-file.c  |  22 +++---
 backends/hostmem-memfd.c |  13 ++--
 backends/hostmem-ram.c   |  12 ++--
 backends/hostmem.c       | 144 ++++++++++++++++++---------------------
 hw/arm/aspeed_ast2400.c  |   6 +-
 hw/arm/aspeed_ast2600.c  |   6 +-
 hw/arm/fsl-imx25.c       |  19 ++----
 hw/arm/fsl-imx31.c       |  19 ++----
 hw/arm/fsl-imx6.c        |  19 ++----
 hw/arm/integratorcp.c    |   7 +-
 hw/arm/nrf51_soc.c       |   7 +-
 hw/misc/ivshmem.c        |   8 +--
 hw/nvram/nrf51_nvm.c     |   7 +-
 hw/pci-host/raven.c      |   6 +-
 hw/ppc/rs6000_mc.c       |   7 +-
 hw/sparc/sun4m.c         |  20 ++----
 hw/sparc64/sun4u.c       |   7 +-
 hw/virtio/virtio-mem.c   |   6 +-
 system/memory.c          |  68 ++++++++++--------
 util/oslib-posix.c       |   7 +-
 util/oslib-win32.c       |   4 +-
 25 files changed, 234 insertions(+), 248 deletions(-)

-- 
2.41.0

