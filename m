Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2371005njk;
        Mon, 27 Jan 2025 03:39:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWOZCNZgk5faaRE5xSgBaUpRsBgaW4AZuor0+vqiv60U8AqdEWYv4HZJJUileievscgQhnmMW3gelWp2Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHldLQS5Y1pg2JN0JlDK07Dcevk7VED6Pcr1CrCAs+rn27UnFlwTd1p0+MutdHwEKBMg2iL
X-Received: by 2002:a05:620a:601a:b0:7b6:f1be:4f7e with SMTP id af79cd13be357-7be6320bd00mr6044896685a.26.1737977955572;
        Mon, 27 Jan 2025 03:39:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737977955; cv=none;
        d=google.com; s=arc-20240605;
        b=TopSq8noPfuRuMvfDq4Tolj8j5D+/tfNAv9DDPZkj1nIjSVBcWXHua+NOMx1z7XvZg
         0vfAf20UXvisKJwbqyTNOkZxbY1mF8FhJQ74wevgdE2Ap85INX5NtISysp+ygoU6rMPG
         pKXa6vT11U1gdRLcGmMplR/94UlZJxTgKgoBdPygvSKE3+7y8tCxWRRlyIj2ktwFm3Hc
         ngWowap//mi+8NuhJYdGxzPIgl4wo8Oql+xx5OVtnYB6lR0y8XM0fTmFHvs7pSXXSS1S
         072J3dod2Dbk0PVCa98Mk7s3EZdvdTpHNbKtqqlbr2LFe9mZQlxAu74ZWIEs48zB63XK
         dsTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=SDlniYJth9Q9EXO7ByEZmIQ07W79NQhs7LYdTCiW6J0=;
        fh=nTj08K2Hq5weUBHsNsqSMy3CkMqm3wti1yKeq+rNqBI=;
        b=U70qNOzjxLdGRPvmTYrhbi+5K6e2BKSGKvafYy9pBcxAphZaFkbskC47JqMQ6Xiye4
         9oBedqi+1KKnkfn0WW3ao8/nQpLDkS3kC8UqCSaN3/oyGzyMEcE+3vdnX7JfuCRFLScv
         0a10pVksCkYn/W553fuSqkA6CLCp1tiRbpjXmfcF0jyYlIojL6D2fmrxm2nC/rSOeQsU
         VXjsMpMt7U7MON5cq6bZqXtjdI4sZCr1R7NfWhvTyjaW9uIjvP0pi4q8D5rknblwuOuH
         GbdFYmB+fyJ2ydA5HPFIfpNyrfqzcl++S8qObsj5Zhc43YQ4+MA62f/hyo9IpiGWxKaw
         jBAg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wGPCXTo1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9aee0179si1047375985a.312.2025.01.27.03.39.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 03:39:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wGPCXTo1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tcNRv-0005qh-76; Mon, 27 Jan 2025 06:38:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcNRn-0005pJ-6y
 for qemu-devel@nongnu.org; Mon, 27 Jan 2025 06:38:31 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcNRk-0005A1-Em
 for qemu-devel@nongnu.org; Mon, 27 Jan 2025 06:38:30 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-385d7f19f20so2191892f8f.1
 for <qemu-devel@nongnu.org>; Mon, 27 Jan 2025 03:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737977906; x=1738582706; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SDlniYJth9Q9EXO7ByEZmIQ07W79NQhs7LYdTCiW6J0=;
 b=wGPCXTo1INN1RdghhoxoK2shxTcqOy2t1U0HRgAPAQQqM8dhiUo5IEig6ihEFREh1v
 5Al7Z4DFCFPgYp/UK5zRNfdTCerHDvJlM8S9captzMs3B94KQx7mz+HA1cFrw613e4XK
 6mtkEgW3142P1XSi0eBaKgYleXSqh78nB0tNOLVsc1V2WnCocWBnkK1yIxbg0EKVcq/6
 eV8d7wT55wM6YHgMq6avJzXmSGyXDn2kLJ9w6XyMV8V60tjZL3R5le+dmtdSqMwTICCR
 4QBEGAT98PzD3O63q/t17IL42VhJJuud7dMrW5zmyV0ulJx9do4MDpJdXmMw8D5nBkH0
 L67Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737977906; x=1738582706;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SDlniYJth9Q9EXO7ByEZmIQ07W79NQhs7LYdTCiW6J0=;
 b=pIuuSZjYvkK6nJ8pRe/vcNNPVJF3H+wfGVRa/7d8RLA1LnenwgqN5llGLwwkLuzJtM
 KeyfFreYjehqt636JyNE8GoF+P7m0eN7shBk+ps6zNdGoxBuml+wS0Av+nXnPqJiOWH8
 KsFSi4j6j0eQ0ZdPe9KGOgwUQkacNXTVWuLBZg5dEYVVBDqn93o4TdKM8D/Awdglab21
 M5GCuXV8wJgsR8XdsZuAQdPcPuIr6Q8iPIkNGDfilkAY+nhiy7pbauRVcTvYfSU1b5uc
 hd7ISELkAobJLrGfKEVKaKqLOyFlR+lMTHi+Q2xBaPW3VLa/CQ22PTL9hAqwi9rGRIAK
 dLqg==
X-Gm-Message-State: AOJu0YwopGKSqiiQlvGr0SPX1BNwyWOIyzfK2QxQFXGW0PzHp3ReLyzW
 Zc4cUKVy+Y0shVYQNBpP+XrdcqMkdmfxweLCkpYrLVSsGsdzhrShm0zOSrlJ9ZnUmXEGzsVfmwC
 ixFE=
X-Gm-Gg: ASbGncsxankWb7jyAUUoe6Hyv36OgLd8YYiMPQ8nMwlyJTxxu6LQ4nsgrYYBFq+uV4S
 51T0jsv9obyVH0bDf9hZhq7FSr7jCmPyam4fGmN1s0GJ6eo0bEwP8OYLwPXAQ5MJakUjl28q0j9
 4azGxWsY2Vij+rslzOgX89KNi9w20S+aJ2e6+daTnP0dKdI6WcVbvAe9DleFtuA3bvlZm+fPMds
 2J+kKKMA+lkoZFqj9ve0TUc1MkooW35AXmoA0nV+rU72nKbESJ25Xba9vbUurs0011+FbCcY8VH
 b+JyTenfkbzgQDL/2BQ0chyRZFaMLKBrEDrSr2QKTXCbWKcZv64pzhY=
X-Received: by 2002:a5d:6b8b:0:b0:38a:8b2c:53ac with SMTP id
 ffacd0b85a97d-38bf57b3fe9mr26672006f8f.42.1737977906516; 
 Mon, 27 Jan 2025 03:38:26 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1c403asm10982852f8f.93.2025.01.27.03.38.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Jan 2025 03:38:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/6] hw/loader: Pass ELFDATA endian order argument to
 load_elf()
Date: Mon, 27 Jan 2025 12:38:18 +0100
Message-ID: <20250127113824.50177-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Irxj61h56lVK

Hi,

The goal of this series is to be able to use the generic loader
on heterogeneous binary. In order to do that we need to remove
its target_words_bigendian() call. This series replace the
'bool is_big_endian' (~equivalent) argument of load_elf*() API
by ELFDATA (which can be LSB / MSB or NONE), updating all the
call sites.

Philippe Mathieu-Daudé (6):
  hw/avr/boot: Replace load_elf_ram_sym() -> load_elf_as()
  hw/loader: Remove unused load_elf_ram()
  hw/loader: Clarify local variable name in load_elf_ram_sym()
  hw/loader: Pass ELFDATA endian order argument to load_elf_ram_sym()
  hw/loader: Pass ELFDATA endian order argument to load_elf_as()
  hw/loader: Pass ELFDATA endian order argument to load_elf()

 include/hw/loader.h            | 22 ++++------------
 hw/core/loader.c               | 48 +++++++++++-----------------------
 hw/alpha/dp264.c               |  4 +--
 hw/arm/armv7m.c                |  2 +-
 hw/arm/boot.c                  | 16 ++++++------
 hw/avr/boot.c                  |  8 +++---
 hw/core/generic-loader.c       |  6 +----
 hw/hppa/machine.c              |  4 +--
 hw/i386/multiboot.c            |  4 +--
 hw/i386/x86-common.c           |  4 +--
 hw/loongarch/boot.c            |  2 +-
 hw/m68k/an5206.c               |  2 +-
 hw/m68k/mcf5208.c              |  2 +-
 hw/m68k/q800.c                 |  2 +-
 hw/m68k/virt.c                 |  2 +-
 hw/microblaze/boot.c           |  6 +++--
 hw/mips/boston.c               |  2 +-
 hw/mips/fuloong2e.c            |  2 +-
 hw/mips/loongson3_virt.c       |  2 +-
 hw/mips/malta.c                |  5 ++--
 hw/mips/mipssim.c              |  3 ++-
 hw/openrisc/boot.c             |  2 +-
 hw/pci-host/raven.c            |  4 +--
 hw/ppc/e500.c                  |  2 +-
 hw/ppc/mac_newworld.c          |  5 ++--
 hw/ppc/mac_oldworld.c          |  4 +--
 hw/ppc/pegasos2.c              |  8 +++---
 hw/ppc/ppc405_boards.c         |  2 +-
 hw/ppc/ppc440_bamboo.c         |  3 ++-
 hw/ppc/sam460ex.c              |  2 +-
 hw/ppc/spapr.c                 |  8 +++---
 hw/ppc/virtex_ml507.c          |  4 +--
 hw/riscv/boot.c                |  3 ++-
 hw/s390x/ipl.c                 |  6 ++---
 hw/sparc/leon3.c               |  2 +-
 hw/sparc/sun4m.c               |  5 ++--
 hw/sparc64/sun4u.c             |  6 ++---
 hw/tricore/triboard.c          |  2 +-
 hw/tricore/tricore_testboard.c |  2 +-
 hw/xtensa/sim.c                |  3 ++-
 hw/xtensa/xtfpga.c             |  3 ++-
 41 files changed, 99 insertions(+), 125 deletions(-)

-- 
2.47.1

