Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0839606A32C
	for <qemu-arm@archiver.kernel.org>; Fri, 30 Oct 2026 15:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jkL/59uE
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMoLz-0004Wr-3z; Fri, 30 Oct 2026 11:17:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMoKn-0004IB-87
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 11:16:10 -0400
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMoKk-0008Oo-FW
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 11:16:00 -0400
Received: by mail-dy1-x1333.google.com with SMTP id
 5a478bee46e88-36a2551d7b5so2478621eec.1
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2026 08:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793373355; x=1793978155; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:content-type:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=1Rg4bi/F0EGsPeT/kaQ1mX1hyEceGiWztvW5JiOyGZA=;
 b=jkL/59uEsuYVDYuahuUzSicrnquI0Ks8Is/wr+vSwasljI18H86/BSbwMxdHV1PVPV
 aLWpgFLkdhEeQlcQ89xTP7im9XTxm97McJFwesm1nnikzo7z33nTRQWYJmgnzyNTVKCe
 RP865ndUnV4Fj3IS4WkKXzwmXr/rd391A+4GWT6xgJLbrcKtfmt7po9A8esjoCaQY7KC
 o1Wg6YPe1KQpY8JJVzQj6Yg7girVnu2GliDPZ7JP4Gh2Z4HRjzXCTdLrMdiLiHE4nQcd
 ds7pRiP1Hm02XPlTQKCgF0dKM6jMstfEjcxakJPg08yAUbXZOey2EH72vIMnQxiy7/oh
 zOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793373355; x=1793978155;
 h=content-transfer-encoding:mime-version:content-type:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=1Rg4bi/F0EGsPeT/kaQ1mX1hyEceGiWztvW5JiOyGZA=;
 b=QYFC28LVFjmh18PLA/csN8ygX8TXVLoAnQblfNJJ0V2xqBBD+Mw4wD93BjCxMng/QL
 wRYfTwn0242ZAHFe0ODg7lpe9FbCnM3Kkui9N6Z8+bSsqUkm77AgWRIQXVscEkIbkLBe
 wiqw3v1T5HulYh6bM6jKjJnzSaBIPaJ/ZQuj6uurfGc6S/ulMfIl2pL25OLpPInASt00
 /3MYqsAcMInHhlVXTgcMRRAreuZ8TOqIIAcMq3n6aYGykE4n+kcIV1cLOUYOaiWURd7m
 0r3qwuhLOhHcIU1HTkizNGUqzK7bOWZz4OBpWw5TR32nniZSmxf20unK4+7GQduXNgRE
 5bZA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwSMMlFOZ9Y9GaMeGsfLNYVEtpPjKRRpUanaftWU0sdS7gFR8ITyyQ7rPWudOvBFSRMfIlw8XGcRg==@nongnu.org
X-Gm-Message-State: AFq9FYKQKWt5EwopAKn38e4BRlipSkkdHMmO82y4wDBOsAqICn/58H98
 1T/NGEPk9YRMe+zHt1Hl+2sf8kZCwhaIHLqRpTnj1Fke87UIUQBOVbBg
X-Gm-Gg: AYBFou2zk/f2iwLUQiGtz/h01DYpxoT1Pyy9zp3g6aFrVjn4FsAe5NO5HaM1MC5OCDo
 ThFXyRCtZaljD2JF8NncJfAUwb8p2jHX6EsHyJiHcsv3pi+CBfPHdZKfFK3DTUwrnlfN7EES1/o
 duL9l9L3VARAYlgcbCouLbGcSpcL6eKnn/LR3xL3iJlYL0dm6gdz2gyD1iYR0+UsEcpiTL9rPRq
 29qWG+FfQoumNWSMSMk4wmS5B9uKUOMi+5aRxUOlEUpTnboCpF9ljn56DG/UXGkl/VTSgxwNDDk
 0vg0S22xY0FDZAb8qhCzGWJc63inydFp1bkXvZSj6Z/K/3O90Mili392g1jxK6LlYixji1zxKj0
 cpiZFmv7MT+RZjfuI4kYaJgzydnztpTShX2GEWyNGHbPPeF3fnOVPO9u8UXOncmYed+uPyDpg7C
 tfzQzLZ33kGqvGINs5eRnKkSL2XPZzuVIhiM0cuHWJs39rpfMcmQ9mDX1a8Gfp6VHfKcFghDZNc
 oGl3zorI3Mh5QEYPvW5g9y/r8hBIg0NfwfVAWd4kriGOfrsGuDWB0vJin7ofKmZePfkMr0cKWoX
 887S0yReTwjfFGKRxQuImy/rhFlrlcg5uJU/uq5DlYTlqv4Y
X-Received: by 2002:a05:7022:f90d:b0:151:7831:e403 with SMTP id
 a92af1059eb24-1ac5b027fbfmr2873959c88.13.1793373355336; 
 Fri, 30 Oct 2026 08:15:55 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1ac1854d925sm12770449c88.7.2026.10.30.08.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:15:54 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Anthony PERARD <anthony@xenproject.org>, Felipe Balbi <balbi@kernel.org>,
 Aleksandar Rikalo <arikalo@gmail.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, xen-devel@lists.xenproject.org,
 qemu-riscv@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 qemu-ppc@nongnu.org, Alexandre Iooss <erdnaxe@crans.org>,
 Weiwei Li <liwei1518@gmail.com>, Zhao Liu <zhao1.liu@intel.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Frederic Konrad <konrad.frederic@yahoo.fr>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Chao Liu <chao.liu@processmission.com>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 Alistair Francis <alistair@alistair23.me>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, qemu-arm@nongnu.org
Subject: [PATCH 00/15] hw: expand DEFINE_MACHINE to explicit TypeInfo
 registration
Date: Fri, 30 Oct 2026 23:15:21 +0800
Message-ID: <20261030151539.1872-1-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1333;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy1-x1333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

DEFINE_MACHINE and DEFINE_MACHINE_EXTENDED hide the TypeInfo and the type_init
function that calls type_register_static(). A later change needs to pass a
target mask into that registration, and the macros have no parameter for it.
This series expands every caller first, with no behavior change, so the
follow-up only replaces the type_register_static() call.

Each machine file gains a class_init function, a TypeInfo, and a type_init
function that calls type_register_static(). The last patch removes
DEFINE_MACHINE* and DEFINE_SECURE_MACHINE* from include/hw/core/boards.h.

Yonggang Luo (15):
  hw/alpha: expand DEFINE_MACHINE in dp264.c
  hw/m68k: expand DEFINE_MACHINE for M68K machines
  hw/microblaze: expand DEFINE_MACHINE for MicroBlaze
  hw/tricore: expand DEFINE_MACHINE in tricore_testboard.c
  hw/arm: expand DEFINE_MACHINE for ARM machines
  hw/riscv: expand DEFINE_MACHINE for RISC-V machines
  hw/core/null-machine: expand DEFINE_MACHINE
  hw/mips: expand DEFINE_MACHINE for MIPS machines
  hw/ppc: expand DEFINE_MACHINE for PowerPC machines
  hw/sh4: expand DEFINE_MACHINE in r2d.c
  hw/sparc: expand DEFINE_MACHINE in leon3.c
  hw/xenpv: expand DEFINE_MACHINE in xen_machine_pv.c
  hw/xtensa: expand DEFINE_MACHINE in sim.c
  hw/xtensa: expand DEFINE_MACHINE in virt.c
  hw/core/boards: remove unused DEFINE_MACHINE* macros

 hw/alpha/dp264.c                    | 18 +++++++++--
 hw/arm/bananapi_m2u.c               | 18 +++++++++--
 hw/arm/cubieboard.c                 | 19 +++++++++---
 hw/arm/digic_boards.c               | 18 +++++++++--
 hw/arm/imx25_pdk.c                  | 18 +++++++++--
 hw/arm/imx8mm-evk.c                 | 20 +++++++++---
 hw/arm/integratorcp.c               | 14 ++++++---
 hw/arm/kzm.c                        | 18 +++++++++--
 hw/arm/max78000fthr.c               | 17 ++++++++--
 hw/arm/mcimx6ul-evk.c               | 18 +++++++++--
 hw/arm/mcimx7d-sabre.c              | 20 +++++++++---
 hw/arm/msf2-som.c                   | 17 ++++++++--
 hw/arm/netduino2.c                  | 17 ++++++++--
 hw/arm/netduinoplus2.c              | 17 ++++++++--
 hw/arm/olimex-stm32-h405.c          | 18 +++++++++--
 hw/arm/orangepi.c                   | 19 +++++++++---
 hw/arm/stm32vldiscovery.c           | 18 +++++++++--
 hw/core/null-machine.c              | 18 +++++++++--
 hw/m68k/an5206.c                    | 18 +++++++++--
 hw/m68k/mcf5208.c                   | 18 +++++++++--
 hw/microblaze/petalogix_ml605_mmu.c | 19 ++++++++++--
 hw/microblaze/xlnx-zynqmp-pmu.c     | 19 ++++++++++--
 hw/mips/boston.c                    | 18 +++++++++--
 hw/mips/fuloong2e.c                 | 18 +++++++++--
 hw/mips/malta.c                     | 12 ++++++--
 hw/ppc/amigaone.c                   | 18 +++++++++--
 hw/ppc/pegasos.c                    | 21 ++++++++-----
 hw/ppc/ppc440_bamboo.c              | 18 +++++++++--
 hw/ppc/prep.c                       | 18 +++++++++--
 hw/ppc/sam460ex.c                   | 18 +++++++++--
 hw/ppc/virtex_ml507.c               | 18 +++++++++--
 hw/riscv/boston-aia.c               | 18 +++++++++--
 hw/riscv/microblaze-v-generic.c     | 18 +++++++++--
 hw/sh4/r2d.c                        | 18 +++++++++--
 hw/sparc/leon3.c                    | 18 +++++++++--
 hw/tricore/tricore_testboard.c      | 18 +++++++++--
 hw/xenpv/xen_machine_pv.c           | 18 +++++++++--
 hw/xtensa/sim.c                     | 18 +++++++++--
 hw/xtensa/virt.c                    | 18 +++++++++--
 include/hw/core/boards.h            | 48 -----------------------------
 40 files changed, 605 insertions(+), 142 deletions(-)

-- 
2.55.0.windows.3


