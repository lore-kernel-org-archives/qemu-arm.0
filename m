Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CA3E77361
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Dec 2025 15:14:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vYQYx-00024j-1Z; Wed, 24 Dec 2025 10:14:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vYQYt-000248-PA
 for qemu-arm@nongnu.org; Wed, 24 Dec 2025 10:14:03 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vYQYq-0002y2-Dl
 for qemu-arm@nongnu.org; Wed, 24 Dec 2025 10:14:03 -0500
Received: by mail-ej1-x644.google.com with SMTP id
 a640c23a62f3a-b83122f9d78so76568966b.0
 for <qemu-arm@nongnu.org>; Wed, 24 Dec 2025 07:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766589238; x=1767194038; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kz8kL+YclKcnBgSBGG2+Kbv6UCLSfkrnEN6ow1rTYic=;
 b=bEBLEDWQKR1UAK+dC49TKbTGgFvgxKCIGX2kHsm2P/MeBL6BtIXsueHcPu6dOhCPBz
 aJ5rb0GEV/iTlPuPTHwzpFboGDVEVssUJZhFQYjQLFYSkJQnElarWhag9uJdPpUkQ699
 G/ZNtfIV8NrsUz9o9KPBHDwsC7vAAKzQRKW7lwqgt2KcHFysm61mDiAEHnT+gg6UrLu7
 eSrEQDbrXJK4Wy/hfiu1uvBR173+dajjPTycc6QnANOIuQvxpoYmi6kTHpGoiv7DK1RG
 MRWGNLz7s9r4zlXOklt3xkgzT8tg8K2DWeeD1GmFjWEHDzjabHR9oldlL0Yrr7twqm7B
 tpZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766589238; x=1767194038;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kz8kL+YclKcnBgSBGG2+Kbv6UCLSfkrnEN6ow1rTYic=;
 b=BuVOxwujOmDl6tWZgE9h+9gLjYtnGyfiQ6FPnijqsBqN1GCcRVulENIszOfk0/8fDs
 gxzQ1TBOmif1ivqYNc+G6tDzr+NX/sYWkXzP1s4HcGigZqp5H+wVRtoGu9iXF37i+Y4A
 gMxsv9YevP+BOinjKst0pAR3qaNiHqEsi+7o5ibmI6KDHgN9EKrc5qPLZHJu5RShlV7P
 Vfm/oOnNFLaZkqeyjMM9uKChnJzMi+08zoEYM8dvEVaXitvsCgXttHSbT5p7RkfD+bdt
 we9G2h04NWxf1mKigjLGhgkbMPyUACOopxxlDyOgyoAiyjSW/GfwBpSCcleZre3pOXY6
 tWeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUogdjIbKdqq3Rfv4j0YEf0mRKiQJdHoAxBSpUWKTtta3yiUqmZl/IN7Pv/4N0eY93eq+1Y4Fl5qA==@nongnu.org
X-Gm-Message-State: AOJu0YyN5ngwZVVmFvPZikkuHYdK9XEK1Fr7NSRPvD1XW7jibHyKExY7
 BkDV5gN0dJeSJe8Fn1S+kXV/6f1e7x1+GHucM9Pavyt6UYBOycQJCwK7l5qc3/bIaSE=
X-Gm-Gg: AY/fxX6pyv45ZOA96ORVEqNW2b2gN8MCI9V8y/aggsmqUXzFHgyfqe0HFWBv6vuRNte
 lVhs0P6sOdmtSGJ8KT/MctqzaiGidLZ1q9s5yS6pFEogvNCvl56OiWMiZMqTiywhhwpnEKI6nWN
 d8zFmPBoInpAlw3tp0GLebMhpiPJF13CZX9pzLvLH115T0lNtxCRoSHId3uv3aXi9cGIhRK2hrk
 AI+6EHkz8yqf/sBsjn/ThOlpweFsPZeFfzfsm142EjqwvS0CQeA/we9JdOwoG3NFxdhgrLx1k0U
 XfRGt48TXtiYxU/FWLl53+zmAWyGG6DF1C36TUsk5taS+hNl0AsNnl2iO3s6WPxMDF4xx51pHOa
 cgaa8p3dm1oOYLX7KgxRKsE0hV++hr8w3kZp+tpto//2nuvlSaphHDgzmn+n5e2ScAVl/dJ8ls9
 elsedCqvWvuv6B8lgLYE50BtlX7zTQmzdHh+aETK2AMSZQCufPg9dV7aQ=
X-Google-Smtp-Source: AGHT+IGrvXVa+/0ANINlFhDNU0yeNFGdHXSXsM/pi0xthrHpY4vGX7TNUZ/VSt9qUvd/W6+b8m2/xA==
X-Received: by 2002:a17:907:3e8c:b0:b73:7fc8:a9c9 with SMTP id
 a640c23a62f3a-b8036f5a99emr1669580066b.29.1766589237807; 
 Wed, 24 Dec 2025 07:13:57 -0800 (PST)
Received: from localhost.localdomain (188.171.88.92.rev.sfr.net.
 [92.88.171.188]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b916b3b35sm17373819a12.30.2025.12.24.07.13.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 24 Dec 2025 07:13:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Weiwei Li <liwei1518@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Anton Johansson <anjo@rev.ng>, David Hildenbrand <david@kernel.org>,
 qemu-riscv@nongnu.org, Steven Lee <steven_lee@aspeedtech.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Troy Lee <leetroy@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Zhao Liu <zhao1.liu@intel.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Alistair Francis <alistair.francis@wdc.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/9] system/memory: Mark ld/st_phys() API as legacy
Date: Wed, 24 Dec 2025 16:13:41 +0100
Message-ID: <20251224151351.86733-1-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x644.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

When using the ld/st_phys() API, when an access fail,
no error is reported. Because if that we introduced
the address_space_ld/st() API 10 years ago. There are
few uses of the ld/st_phys() API left in the code base,
time to mark it as legacy.
Allow targets to opt-out for the legacy API, by setting
the TARGET_NOT_USING_LEGACY_LDST_PHYS_API definition.

First drop the _notdirty() variant, mark some targets
clean of the legacy API, then rework virtio core layer
a bit in order to clean more targets.

Targets left missing conversion:

 $ fgrep -L TARGET_NOT_USING_LEGACY_LDST_PHYS_API configs/targets/*softmmu*mak
 configs/targets/aarch64-softmmu.mak
 configs/targets/alpha-softmmu.mak
 configs/targets/arm-softmmu.mak
 configs/targets/hppa-softmmu.mak
 configs/targets/i386-softmmu.mak
 configs/targets/loongarch64-softmmu.mak
 configs/targets/m68k-softmmu.mak
 configs/targets/ppc-softmmu.mak
 configs/targets/ppc64-softmmu.mak
 configs/targets/s390x-softmmu.mak
 configs/targets/sparc-softmmu.mak
 configs/targets/x86_64-softmmu.mak

tag: https://gitlab.com/philmd/qemu/-/tags/legacy_ldst_phys-v1
CI: https://gitlab.com/philmd/qemu/-/pipelines/2231223066

Philippe Mathieu-Daudé (9):
  target/i386: Remove x86_stl_phys_notdirty() leftover
  target/sparc: Update MMU page table using stl_phys()
  hw/arm: Avoid address_space_stl_notdirty() when generating bootloader
  system/memory: Remove address_space_stl_notdirty and stl_phys_notdirty
  system/memory: Allow restricting legacy ldst_phys() API usage
  configs/targets: Mark targets not using legacy ldst_phys() API
  hw/virtio: Remove unused ldst_phys() helpers
  hw/virtio: Reduce virtio_lduw/stw_phys_cached() scope
  configs/targets: Mark targets not using legacy ldst_phys() API

 configs/targets/avr-softmmu.mak          |   1 +
 configs/targets/microblaze-softmmu.mak   |   1 +
 configs/targets/microblazeel-softmmu.mak |   1 +
 configs/targets/mips-softmmu.mak         |   1 +
 configs/targets/mips64-softmmu.mak       |   1 +
 configs/targets/mips64el-softmmu.mak     |   1 +
 configs/targets/mipsel-softmmu.mak       |   1 +
 configs/targets/or1k-softmmu.mak         |   1 +
 configs/targets/riscv32-softmmu.mak      |   1 +
 configs/targets/riscv64-softmmu.mak      |   1 +
 configs/targets/rx-softmmu.mak           |   1 +
 configs/targets/sh4-softmmu.mak          |   1 +
 configs/targets/sh4eb-softmmu.mak        |   1 +
 configs/targets/sparc64-softmmu.mak      |   1 +
 configs/targets/tricore-softmmu.mak      |   1 +
 configs/targets/xtensa-softmmu.mak       |   1 +
 configs/targets/xtensaeb-softmmu.mak     |   1 +
 include/hw/virtio/virtio-access.h        | 106 -----------------------
 include/system/memory.h                  |   8 +-
 target/i386/cpu.h                        |   1 -
 include/exec/memory_ldst.h.inc           |   2 -
 hw/arm/aspeed.c                          |   4 +-
 hw/arm/boot.c                            |   8 +-
 hw/virtio/virtio.c                       |  21 +++++
 target/i386/helper.c                     |  10 ---
 target/sparc/mmu_helper.c                |   2 +-
 system/memory_ldst.c.inc                 |  39 ---------
 scripts/make-config-poison.sh            |   1 +
 28 files changed, 48 insertions(+), 171 deletions(-)

-- 
2.52.0


