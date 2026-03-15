Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44339D58B0A
	for <qemu-arm@archiver.kernel.org>; Sun, 15 Mar 2026 03:43:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w1cMc-0004uu-Oa; Sat, 14 Mar 2026 23:42:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w1cMb-0004uZ-Ah
 for qemu-arm@nongnu.org; Sat, 14 Mar 2026 23:42:01 -0400
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w1cMZ-0003kM-Se
 for qemu-arm@nongnu.org; Sat, 14 Mar 2026 23:42:01 -0400
Received: by mail-dy1-x1332.google.com with SMTP id
 5a478bee46e88-2ba895adfeaso3453685eec.0
 for <qemu-arm@nongnu.org>; Sat, 14 Mar 2026 20:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773546118; x=1774150918; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nRwkOlHiZuZmBiCl3d8kL5L6Osw97C441XFZwC/9TuY=;
 b=FLsqb2rk4vhmd/nTM2kqrMaQGLZLWvnaV4q85ZhTXx76M6MGR33gHMEUhqOCHdlXpf
 tLYcYEffw2eS6WXjJrxX5byUDI5ooWSzSW5Sk2G82udh6gMkxH6N3trQ0EYPOP76879A
 L+alyRQhdjIXUV/ZwogSwaHd5VFDecxMh+YGlsSUqPWM9CzLtaP83U6Nzec6TZfkWFCs
 GEU270mq7foZg3IcKAabfUNA8yX86upTsLVyq9UHXT88hSKdpXGdUqC+AltTn0u8eYpj
 zTr83Y8uRqc9yYYb6lDQxOgCuXWGaSbkT4zrljXwyf3TSxqn1gIbvMRxkG5vy8NaFyph
 n7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773546118; x=1774150918;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nRwkOlHiZuZmBiCl3d8kL5L6Osw97C441XFZwC/9TuY=;
 b=a+XcvEPMqz9LwshaYV6x+yRHVdLA5ZauHyatc4UfeRr09Cq0FUH2PvvugFrtVTGpNM
 MDYjwLSevAVFS6huRChN27gTaDgDsfVRymV2xyZpsKZ5LxKMPFIFT+rYnOG3xCy05rLR
 0PtnFvOwER6CqKDL/cF5M1N9HgoX3gIWZidme0jCY7UGdu6t1qGsQq/H/Du00CoTHq9v
 RH16HuB9tCpuD5bnwcV1cHKrnEXLSXfs9I//txunQbEXvHX4IJpCag/t9hs9RsYJfpcV
 AAwILAMTrcGTUY7NWJV9S8NbiYzYxRD/yeJ4nO2gvbIunIr3jDWFkQYHgqFStcy3UUhT
 a8JQ==
X-Gm-Message-State: AOJu0YyKugDo8EAJhxIt5X7t1zcFF4ZQzr/uW0b9DRFiyGfH16HdQ2RC
 GaD66zoCh3DYtou+TdKZ7OmauVHEIC75LCu/EDv6qi3+z0gRSBmRvTZY
X-Gm-Gg: ATEYQzxiTrK8j02NLjSG4mJ7Zwdoa7SLk7W5BNB2oHnjOuTW32hIqRrq1d+Nlr1ukLS
 DYnlsm6CqCixFOjuYfhs0paRhntvWXzyHX2FGSwIsh9bdcQqwGIn266GOdExTG11odJevt+KI2G
 HgP9vkFUShQpZkQmOZ70moVNdn3eJX3LHNcGHDGzsAo9B//ulpWXUUFNOArn2K4nlB/Q+ktzdV1
 NXf0gUb6/zz4y43PLvhT136Ew0PAyD7zDhVvaKOBNXTuDI54kh9w2952W+Xakvy1g8oEeTgIcOe
 lIPwZczlHepguU8apLea2/6WMQESnq0qdxzzsARZ0rIjYNl0QeMxTOz7rtgGN9gCK6RMbtdFBU2
 eBqKIah6I06uhsbkDzQMhbFfzwsEK/SyPI+iXji8EST5PuR09VFJS50auoduLSvkOJKDl+Vla7Y
 B99DHsRQ6UYx7TmJBaYZcjgFBPsETlTOfvFG7LJqA=
X-Received: by 2002:a05:693c:290b:b0:2be:83d0:d229 with SMTP id
 5a478bee46e88-2bea55eea08mr3986632eec.27.1773546118376; 
 Sat, 14 Mar 2026 20:41:58 -0700 (PDT)
Received: from 192.168.7.2 ([189.6.247.75]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2beab57b2b2sm8862982eec.33.2026.03.14.20.41.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 14 Mar 2026 20:41:57 -0700 (PDT)
From: Lucas Amaral <lucaaamaral@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Lucas Amaral <lucaaamaral@gmail.com>
Subject: [PATCH v3 0/3] hvf: map granule abstraction, configurable IPA,
 and MAP_FIXED alignment fix
Date: Sun, 15 Mar 2026 00:41:51 -0300
Message-ID: <20260315034154.41986-1-lucaaamaral@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260311022732.64141-1-lucaaamaral@gmail.com>
References: <20260311022732.64141-1-lucaaamaral@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1332;
 envelope-from=lucaaamaral@gmail.com; helo=mail-dy1-x1332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FSL_HELO_BARE_IP_2=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Fix a bug in the MAP_FIXED blob mapping path (introduced by 4eb0aace)
where non-host-page-aligned offsets cause mmap(MAP_FIXED) to fail with
EINVAL.  This affects any host where the page size exceeds the guest's
(ARM64 with 16KB/64KB pages, macOS ARM64).

This series introduces:

1. MAP_FIXED alignment validation in virtio-gpu: check that both
   offset and blob size are aligned to the host page size before
   calling virgl_renderer_resource_map_fixed().  When not aligned,
   fall through to the subregion method (which works at any
   alignment).

2. A map granule abstraction (hvf_set/get_map_granule) replacing
   hardcoded qemu_real_host_page_size() calls in HVF memory mapping.
   Non-aligned regions return early instead of proceeding with
   add=false (which attempted an unnecessary unmap).
   An 'ipa-granule' property (auto, 4k, 16k) on the HVF accelerator
   object allows opt-in configuration:

     -accel hvf,ipa-granule=4k

   The property follows the kvm_arch_accel_class_init() pattern:
   ARM registers the property in hvf_arch_accel_class_init(), x86
   provides an empty stub.

3. macOS 26 IPA granule support via hv_vm_config_set_ipa_granule(),
   reading the ipa-granule property to select HV_IPA_GRANULE_4KB or
   HV_IPA_GRANULE_16KB.  Falls back with a warning on macOS < 26.

Dependencies: none.

Changes v2 → v3:
  - Rebased on current master
  - Add MAP_FIXED alignment validation (new patch 1)
  - Move #ifdef __aarch64__ property code into hvf_arch_accel_class_init
    following kvm_arch_accel_class_init() pattern (x86 empty stub)
  - Use MAC_OS_VERSION_26_0 named constant
  - Remove Venus blob mapping warning

Changes v1 → v2 (Mohamed Mosaad review):
  - Replace hardcoded 4KB with configurable ipa-granule property
    (auto, 4k, 16k) on the HVF accelerator object.
  - 'auto' defaults to host page size; explicit values opt in.
  - Add fallback warning when macOS < 26 can't honor the request.
  - Add Venus blob mapping safety warning.
  - Use KiB constants instead of magic numbers.

Lucas Amaral (3):
  virtio-gpu: validate host page alignment for MAP_FIXED blobs
  accel/hvf: introduce map granule abstraction and IPA property
  target/arm/hvf: configure IPA granule on macOS 26

 accel/hvf/hvf-all.c           | 30 +++++++++++++--
 hw/display/virtio-gpu-virgl.c | 45 +++++++++++++---------
 include/system/hvf.h          | 15 ++++++++
 include/system/hvf_int.h      |  2 +
 target/arm/hvf/hvf.c          | 72 +++++++++++++++++++++++++++++++++++
 target/i386/hvf/hvf.c         |  4 ++
 6 files changed, 147 insertions(+), 21 deletions(-)

--
2.52.0


