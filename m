Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp60024eja;
        Wed, 1 Nov 2023 17:26:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnUErGv/BAqiseNRUf6VBS6qUDv2S3FrbR1kjk6tCMVHnm0qUecQ99jmLN9Z4msVP50rRO
X-Received: by 2002:a05:622a:2a81:b0:41e:1c64:7b34 with SMTP id kf1-20020a05622a2a8100b0041e1c647b34mr14078390qtb.67.1698884799566;
        Wed, 01 Nov 2023 17:26:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698884799; cv=none;
        d=google.com; s=arc-20160816;
        b=PRZpYNqvWgnQPPteapXZ381uZZnNsHpPGXdwHHCtfg0Obr4rxi/MFONMRaS98rZRyl
         HKJhEtGeosDBX4BqplcoCThWQquD/h8NuzVukNNy6s+9SQFcGLwuUCCUH1cDv+yVcW0E
         O+c+A8i3+7AjF6U2kALzdkwdEOUdMuMdcayIN2cCL90OkXSKfHE+zHmaXtSgAgyHkiTz
         u2RMnlRrpS4G03o76o0p1FRdpynnlERsF6wI392iQDxwLxQGjOwWXNIit0uMGcH9WS+k
         SgLRakqPQgfL/MRhuUSX5y4zpGBpAiYIvwXvmH/DxhAVDD5m1HyDFaB6yn0SwtjNdtJG
         XOFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:mime-version:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=L2Qn8R/0wzVuiL3gACkZMpV9Y9yBgfHAX0OxhSnceJQ=;
        fh=rgQPcVbcOjZgL6aK5WmEt+m6+w+zLiqfGJUo4Bg6NIA=;
        b=NDO+6RSNG+YK0bJWTGev8d5GW8uMCIuc/edgQE0rr856vG96l/9S5ax8b7itrm3oky
         vP5xzcQkHLEd/psfL7NWbq2yR161nzBozHqkC1ftWi1O81DiQwpifCgDM1yH7tfj4bxq
         gVIuwg2fKQgW0ur1WEHSwh1MP+10eJBerkUQMufclLQfw2jnAjmORVRW/7QssqKF2IKL
         /gprZGbkbWBZOQZTkj1bg9uKv3pdJzmLJFgoW52e/tCU2iTi/6i3VLFi0Qp9UrbKqD/E
         E1UZ8g4iIG/SH0Km7LwhjrtdqwRzc++Xq4uzWghyJ7NFoAKi5bZ4LkTtmvcr4fmwLPix
         0xaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RGff4tCm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f14-20020ac85d0e000000b004181e519799si3799319qtx.100.2023.11.01.17.26.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Nov 2023 17:26:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RGff4tCm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyLXM-0000c8-56; Wed, 01 Nov 2023 20:26:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLXF-0000Yl-0x
 for qemu-arm@nongnu.org; Wed, 01 Nov 2023 20:26:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLWy-0008JA-2f
 for qemu-arm@nongnu.org; Wed, 01 Nov 2023 20:26:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698884749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:mime-version: content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=L2Qn8R/0wzVuiL3gACkZMpV9Y9yBgfHAX0OxhSnceJQ=;
 b=RGff4tCm/Omm4XF28iac5n0p6cqFAoR9LEpG3O0q2DmkclEY6eHMMjxqLEnCUWuV4GZd54
 K1tYGBi4k91oJcG4RuI7lXrWRBoYZy+WKungSanyoF6d6MHaPKKeCZIencLJBJIVTG/EHd
 KLGyqpT+aDP9S0TyQBEMZs4VLUN+m1o=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-130-kpFMDz_RPA-RDPhIYQ86qA-1; Wed,
 01 Nov 2023 20:25:46 -0400
X-MC-Unique: kpFMDz_RPA-RDPhIYQ86qA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65EA228B72F2;
 Thu,  2 Nov 2023 00:25:44 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C3305C1290F;
 Thu,  2 Nov 2023 00:25:23 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, philmd@linaro.org, clg@kaod.org,
 imammedo@redhat.com, imp@bsdimp.com, kevans@freebsd.org,
 richard.henderson@linaro.org, pbonzini@redhat.com,
 peter.maydell@linaro.org, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com, kfting@nuvoton.com,
 wuhaotsh@google.com, nieklinnenbank@gmail.com, rad@semihalf.com,
 quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, bcain@quicinc.com, gaosong@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com,
 aleksandar.rikalo@syrmia.com, chenhuacai@kernel.org, crwulff@gmail.com,
 marex@denx.de, shorne@gmail.com, npiggin@gmail.com,
 ysato@users.sourceforge.jp, david@redhat.com, thuth@redhat.com,
 iii@linux.ibm.com, kbastian@mail.uni-paderborn.de, jcmvbkbc@gmail.com,
 shan.gavin@gmail.com
Subject: [PATCH v4 00/33] Unified CPU type check
Date: Thu,  2 Nov 2023 10:24:27 +1000
Message-ID: <20231102002500.1750692-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: RVMi9ptt3tbP

There are two places where the user specified CPU type is checked to see
if it's supported or allowed by the board: machine_run_board_init() and
mc->init(). We don't have to maintain two duplicate sets of logic. This
series intends to move the check to machine_run_board_init() so that we
have unified CPU type check.

Note that the term "the registered CPU type name" used in this series
corresponds to the names of non-abstract CPU classes, regitered by
individual target.

PATCH[01-03] Come from Philippe Mathieu-Daudé. cpu_class_by_name()
             is consolidated to ensure that the returned object
             class isn't abstract and a child object class of
             CPU_RESOLVING_TYPE
PATCH[04]    Adds a generic helper cpu_model_from_type() to extract
             the CPU model name from the CPU type name
PATCH[05-20] Uses cpu_model_from_type() in the individual target
PATCH[21-24] Implements cpu_list() for the missed targets
PATCH[25-33] Validates the CPU type in machine_run_board_init() for
             the individual board

v1: https://lists.nongnu.org/archive/html/qemu-arm/2023-07/msg00302.html
v2: https://lists.nongnu.org/archive/html/qemu-arm/2023-07/msg00528.html
v3: https://lists.nongnu.org/archive/html/qemu-arm/2023-09/msg00157.html

Testing
=======

With the following command lines, the output messages are varied before
and after the series is applied.

  ./build/qemu-system-aarch64            \
  -accel tcg -machine virt,gic-version=3 \
  -cpu cortex-a8 -smp maxcpus=2,cpus=1

Before the series is applied:

  qemu-system-aarch64: mach-virt: CPU type cortex-a8-arm-cpu not supported

After the series is applied:

  qemu-system-aarch64: Invalid CPU type: cortex-a8-arm-cpu
  The valid models are: cortex-a7, cortex-a15, cortex-a35, cortex-a55,
                        cortex-a72, cortex-a76, a64fx, neoverse-n1,
                        neoverse-v1, cortex-a53, cortex-a57, max

Changelog
=========
v4:
  * Rebase to latest v8.1.2                                     (Gavin)
  * Integrate Philippe's patches where cpu_class_by_name()
    is consolidated and my duplicate code is dropped            (Philippe)
  * Simplified changelog and improvements                       (Thomas)
  * g_assert() on the return value from cpu_model_from_type()
    in is_cpu_type_supported()                                  (Philippe)
  * Collected r-bs from Philippe Mathieu-Daudé, Leif Lindholm,
    Bastian Koppelmann, Daniel Henrique Barboza, Cédric Le Goater,
    Gavin Shan                                                  (Gavin)
v3:
  * Generic helper cpu_model_from_type()                        (Igor)
  * Apply cpu_model_from_type() to the individual targets       (Igor)
  * Implement cpu_list() for the missed targets                 (Gavin)
  * Remove mc->valid_cpu_models                                 (Richard)
  * Separate patch to constify mc->validate_cpu_types           (Gavin)
v2:
  * Constify mc->valid_cpu_types                                (Richard)
  * Print the supported CPU models, instead of typenames        (Peter)
  * Misc improvements for the hleper to do the check            (Igor)
  * More patches to move the check                              (Marcin)

Gavin Shan (30):
  cpu: Add helper cpu_model_from_type()
  target/alpha: Use generic helper to show CPU model names
  target/arm: Use generic helper to show CPU model names
  target/avr: Use generic helper to show CPU model names
  target/cris: Use generic helper to show CPU model names
  target/hexagon: Use generic helper to show CPU model names
  target/i386: Use generic helper to show CPU model names
  target/loongarch: Use generic helper to show CPU model names
  target/m68k: Use generic helper to show CPU model names
  target/mips: Use generic helper to show CPU model names
  target/openrisc: Use generic helper to show CPU model names
  target/ppc: Use generic helper to show CPU model names
  target/riscv: Use generic helper to show CPU model names
  target/rx: Use generic helper to show CPU model names
  target/s390x: Use generic helper to show CPU model names
  target/sh4: Use generic helper to show CPU model names
  target/tricore: Use generic helper to show CPU model names
  target/hppa: Implement hppa_cpu_list()
  target/microblaze: Implement microblaze_cpu_list()
  target/nios2: Implement nios2_cpu_list()
  cpu: Mark cpu_list() supported on all targets
  machine: Constify MachineClass::valid_cpu_types[i]
  machine: Use error handling when CPU type is checked
  machine: Introduce helper is_cpu_type_supported()
  machine: Print CPU model name instead of CPU type name
  hw/arm/virt: Check CPU type in machine_run_board_init()
  hw/arm/virt: Hide host CPU model for tcg
  hw/arm/sbsa-ref: Check CPU type in machine_run_board_init()
  hw/arm: Check CPU type in machine_run_board_init()
  hw/riscv/shakti_c: Check CPU type in machine_run_board_init()

Philippe Mathieu-Daudé (3):
  target/alpha: Tidy up alpha_cpu_class_by_name()
  hw/cpu: Call object_class_is_abstract() once in cpu_class_by_name()
  cpu: Call object_class_dynamic_cast() once in cpu_class_by_name()

 bsd-user/main.c                       |  3 -
 cpu-target.c                          | 34 +++++++++-
 hw/arm/bananapi_m2u.c                 | 12 ++--
 hw/arm/cubieboard.c                   | 12 ++--
 hw/arm/mps2-tz.c                      | 20 ++++--
 hw/arm/mps2.c                         | 25 +++++--
 hw/arm/msf2-som.c                     | 12 ++--
 hw/arm/musca.c                        | 13 ++--
 hw/arm/npcm7xx_boards.c               | 13 ++--
 hw/arm/orangepi.c                     | 12 ++--
 hw/arm/sbsa-ref.c                     | 21 +-----
 hw/arm/virt.c                         | 23 ++-----
 hw/core/cpu-common.c                  |  8 ---
 hw/core/machine.c                     | 93 ++++++++++++++++-----------
 hw/m68k/q800.c                        |  2 +-
 hw/riscv/shakti_c.c                   | 11 ++--
 include/hw/boards.h                   |  2 +-
 include/hw/core/cpu.h                 | 19 +++++-
 target/alpha/cpu.c                    | 15 ++---
 target/arm/arm-qmp-cmds.c             |  6 +-
 target/arm/cpu.c                      |  5 +-
 target/arm/helper.c                   | 12 ++--
 target/avr/cpu.c                      | 17 +++--
 target/cris/cpu.c                     | 12 ++--
 target/hexagon/cpu.c                  | 17 ++---
 target/hppa/cpu.c                     | 19 ++++++
 target/hppa/cpu.h                     |  3 +
 target/i386/cpu.c                     |  7 +-
 target/loongarch/cpu.c                | 14 ++--
 target/loongarch/loongarch-qmp-cmds.c |  3 +-
 target/m68k/cpu.c                     |  5 +-
 target/m68k/helper.c                  | 14 ++--
 target/microblaze/cpu.c               | 20 ++++++
 target/microblaze/cpu.h               |  3 +
 target/mips/cpu-defs.c.inc            |  9 ---
 target/mips/cpu.c                     | 18 ++++++
 target/mips/sysemu/mips-qmp-cmds.c    |  3 +-
 target/nios2/cpu.c                    | 20 ++++++
 target/nios2/cpu.h                    |  3 +
 target/openrisc/cpu.c                 | 19 ++----
 target/ppc/cpu_init.c                 | 12 ++--
 target/riscv/cpu.c                    | 19 +++---
 target/riscv/riscv-qmp-cmds.c         |  3 +-
 target/rx/cpu.c                       | 11 ++--
 target/s390x/cpu_models.c             | 12 ++--
 target/s390x/cpu_models_sysemu.c      |  9 ++-
 target/sh4/cpu.c                      | 26 ++++----
 target/tricore/cpu.c                  |  5 +-
 target/tricore/helper.c               | 13 ++--
 target/xtensa/cpu.c                   |  5 +-
 50 files changed, 384 insertions(+), 310 deletions(-)

-- 
2.41.0

