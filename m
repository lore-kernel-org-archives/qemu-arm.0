Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6F1F433CC
	for <qemu-arm@archiver.kernel.org>; Wed, 15 Apr 2026 21:56:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wD8D9-00029I-Uu; Wed, 15 Apr 2026 17:55:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wD8D4-00024u-7p
 for qemu-arm@nongnu.org; Wed, 15 Apr 2026 17:55:46 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wD8D1-0002bC-EM
 for qemu-arm@nongnu.org; Wed, 15 Apr 2026 17:55:45 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-43cfe71e5d3so5649975f8f.0
 for <qemu-arm@nongnu.org>; Wed, 15 Apr 2026 14:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776290141; x=1776894941; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0gK3ebuBLsO9TL29eLiofU5GeQFOBK3V3k+ulyTqFcs=;
 b=gCU9Nw9CiHA8609uO+qeLTsYlFVjc9D2NHpB2dfGLnN5UfkLaNUQFDovv9lWP7KCpH
 rgLJS/b38xpZ0/kcdWoA51/UlEHQETISjqbyz1tzijL3mi36z4dx20pGUBPyJBYzhltd
 26yRk0NZdLsUGTEUy/ioEhdn7+aIslWBStSB0EXmkF9g+YUEiYGTFMLLDUI+Wjp2mexV
 5a4ok9z/qvtfyp0xXgLUyM/UaHasewtsAiZvMuTIJNHLiT3nLGWFXsA1tJ5cfYtUmFAG
 AkD8+bnsnURvVezQU/vv67OJHB51xth0qaJd5TiH2gA9LJJk/aZhrcHXcbZsGT4ZRK64
 WuzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776290141; x=1776894941;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0gK3ebuBLsO9TL29eLiofU5GeQFOBK3V3k+ulyTqFcs=;
 b=kZnKs9TXg3agM1hRYP7Zp/Dr8XgOcuEHxxq1HeRNHhg/SXNyKwD4QMin6dvp+G8Se7
 OVvQlnrLmY+yz7e5S72tuUafXkuo9r4cH/KuRav/AhdBOlO048Wjrakzq0IERId1FIE/
 O4EtIyS/mPxLwDuQGL05IVfdTDYuP6MwD18sayFchnmha6VqTDK71NOUpNdOHO+5XcIV
 xSNpzFhyNLmJO/Uw55RXcS36MpQRJlRyv/61No73Sdxhgn6I/MSUDEGFPvKY7vc+Sl6q
 jnpARm3HtjU+oX5JJAgAqM5a2f3W8PxfUHxWoXlM9J1MfcmQ5AojsAL4U1RzaH1ZySNG
 iYOg==
X-Gm-Message-State: AOJu0YwdfIKbV+QWN5UGSoxpSn0kVZXWlBLrpAIX0zC2crl3FeG3Yro+
 awrvi8hrH9oQ7lsbH1va9NYgobnWofebjLNcuyXSgLfjQsZNKCyt8XocP3klVvRI6ZI=
X-Gm-Gg: AeBDies1kR1MAwnrcBimspXxITZmbyWAToRYpYNq76QD3jYe/6Ycp8WvlkzXHn3I9dF
 qC9lNePqCc9V5ZK0LifnXphpaAQ4JIP2aRfv0x2gd6vz4FB605jc3zW17tMjTzlB8HuRvUAgnsd
 IkX4GMOayE0rbMfut+cKRJQk5k81AaARi6tmCCP2VvACW1MHVuOiM7phTx2g+G8SoLXyK95hIr3
 qpAocan55VrFc/6Ab99/+RfVv8B1WbbpFinHkYdUTWanbbKmF+AMqzF2xAmEVfBM5v00h6EEqMz
 /q7KyFnzYL4Ze4ciOaf5ZpR9m4kgLLk7mtYvDX8EUeH4/p+/OVEeW1icQft3XDaM0wkC//n0s3z
 uJp0GEC/TaxQmUW6Ck6uiFJI+868+de1hgStMlRM0tEShhGtqOXXwV6KhLAavJjy6rEQOFwTa8V
 5WCQERhYX0sMnaqseesmX78OcR/uRzP8F0RhtKeP/cN8XTNAQApUFqc9LSCtd63ZHhcZt4901/
X-Received: by 2002:a05:6000:1844:b0:43e:a8ad:975e with SMTP id
 ffacd0b85a97d-43ea8ad9b14mr11012064f8f.27.1776290141237; 
 Wed, 15 Apr 2026 14:55:41 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43ead33d6d3sm8682428f8f.8.2026.04.15.14.55.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Apr 2026 14:55:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-block@nongnu.org
Subject: [PATCH 0/8] cocci: Do not initialize variable used by *FOREACH*()
 macro
Date: Wed, 15 Apr 2026 23:55:31 +0200
Message-ID: <20260415215539.92629-1-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

Most of our *FOREACH*() macros take a pointer argument,
then assign it upon entry before iterating. Thus there
is no need to initialize the variable used as argument.
But sometimes we do, which is confusing (for example
&first_cpu). This series uses a Coccinelle script to
clean these unnecessary usages. (and 2 bonus cleanup
patches at the end).

Philippe Mathieu-Daudé (8):
  cocci: Do not initialize variable used by QLIST_FOREACH macro
  cocci: Do not initialize variable used by QSLIST_FOREACH macro
  cocci: Do not initialize variable used by QSIMPLEQ_FOREACH macro
  cocci: Do not initialize variable used by QTAILQ_FOREACH macro
  cocci: Do not initialize variable used by RAMBLOCK_FOREACH* macro
  cocci: Do not initialize variable used by CPU_FOREACH macro
  target/mips: Reduce CPUState scope when used with CPU_FOREACH()
  target/riscv: Iterate vCPUs using CPU_FOREACH() macro

 target/mips/internal.h              | 11 ++++++-----
 block/blkdebug.c                    |  2 +-
 block/blkio.c                       |  2 +-
 block/gluster.c                     |  4 ++--
 ebpf/ebpf.c                         |  2 +-
 hw/arm/virt-acpi-build.c            |  2 +-
 hw/i386/xen/xen-hvm.c               |  4 ++--
 hw/misc/mips_cpc.c                  |  4 ++--
 hw/ppc/spapr.c                      |  2 +-
 hw/ppc/spapr_events.c               |  4 ++--
 hw/riscv/boot.c                     |  9 +++++----
 hw/riscv/riscv-iommu.c              |  2 +-
 hw/vfio/cpr-legacy.c                |  2 +-
 hw/vfio/listener.c                  |  4 ++--
 hw/xen/xen_pt_config_init.c         |  4 ++--
 migration/block-dirty-bitmap.c      |  2 +-
 migration/dirtyrate.c               |  4 ++--
 net/colo-compare.c                  |  4 ++--
 net/net.c                           |  2 +-
 target/mips/tcg/system/cp0_helper.c | 28 ++++++++++++++++------------
 target/mips/tcg/system/tlb_helper.c |  7 +++----
 target/s390x/kvm/stsi-topology.c    |  2 +-
 22 files changed, 56 insertions(+), 51 deletions(-)

-- 
2.53.0


