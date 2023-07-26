Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp197655ejb;
        Tue, 25 Jul 2023 17:34:06 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHs9JowlIR21hF3JnpR1LRbi7EFxlF9nMc29fNtCtjan59FEKuL5bpnWlu2U3Mrh9IEYgvl
X-Received: by 2002:ac8:7f13:0:b0:403:b3a2:f9c9 with SMTP id f19-20020ac87f13000000b00403b3a2f9c9mr677781qtk.3.1690331645888;
        Tue, 25 Jul 2023 17:34:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690331645; cv=none;
        d=google.com; s=arc-20160816;
        b=XvrBisMyPXzbKweATDT/nf0DST+FwwgRPYtA/H80ZG2n7VWSmvi0q/pN8hmhnzfD7W
         2eCTk3ddsukvE1NSkt8CSbkff7Y51K7lCWhUiRyGB1/xhAdNpjWaxI9PPKdlTvmTb5KF
         YwotKAp4uz5Bx/kKt21BKdnEO2TB+RIQr6Rhh2bEOwKcO2Dhd6dfPOtK6RkK6VSYCrb8
         9ipzxmsRn5RAyRDjX7mkAHhsav5X+ZIp5+FsfiTcTxoLXglbyqNvKj1bbAApqb1N+FDO
         5m8OxYdOVczggtQ9oRk+uMdxQbcXIDrhlySZmYzX0vaATyvJmPd70uiZqXdEu9H/NMp7
         HOMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=W16tekFmtJ4pSe/TsgfDc55GNpEBrYdT/oyvB8SOmnU=;
        fh=FuziOALKyXfrMoq6H15/q1ev+uC2b5q3xHaYPu2Bj/E=;
        b=LrRGjw5eJMFIR7G0OvLxJao7SqX+fWYtmEnQ2zGsG+WbofkxWndfDsPPw7eoD3Lnf4
         qmw/jBht//6XFCFHr+XtXGw8YCoBrNFm44T/dO4cKsy6tkUXjsQ9FCiCsaTSK/7DboSa
         JyVuv3wuj31ZHzIXPa+bO4GPjTxqA9yIoBsVWPn3SfUICJAvGJK9ImzpfpLmIZWQbY2n
         oRCJ/GYXKm9bEbTuWexc4/kQy7sg3877sa1RxEed4PPKYBoCkAKzlYYYGg2my/qrNbtR
         2iieYs/VhL8XlbgYhNmZz8XrqeuPJkZRE9bdptZMYde+xin7jHw/nmED4PF0t2HmyVwW
         rL2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fM3ViOw1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w14-20020a05622a190e00b00403a935d1d7si7443736qtc.412.2023.07.25.17.34.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jul 2023 17:34:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fM3ViOw1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qOSSv-0001Ru-Pa; Tue, 25 Jul 2023 20:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qOSSu-0001Rd-RD
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 20:33:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qOSSs-00034r-B2
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 20:33:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690331594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=W16tekFmtJ4pSe/TsgfDc55GNpEBrYdT/oyvB8SOmnU=;
 b=fM3ViOw1WZSN4z6x2uFuEDJBOQWghSYjDXRqYZPZcJsUs/SB+B6quYOVu9PpmqmGaOwuo5
 6AAlw7/ks1x8ZZhlXZ8UwUhwFcOmZV8vsJN6PaD8pHDGKNRV0woDGdN6u9JOYc3K0Fow6Z
 vuuPIXywz4AG8Zak0B2Sm2/Ygrmp2T8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-148-RSkP3gnnMFmokwRmACLDPQ-1; Tue, 25 Jul 2023 20:33:10 -0400
X-MC-Unique: RSkP3gnnMFmokwRmACLDPQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E071F8564EF;
 Wed, 26 Jul 2023 00:33:08 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 65C16492C13;
 Wed, 26 Jul 2023 00:32:55 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com,
 sundeep.lkml@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 imammedo@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 pbonzini@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v2 0/8] machine: Unified CPU type check
Date: Wed, 26 Jul 2023 10:31:57 +1000
Message-ID: <20230726003205.1599788-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-TUID: h3fNZmPAk4uj

There are two places where the user specified CPU type is checked to see
if it's supported or allowed by the board: machine_run_board_init() and
mc->init(). We don't have to maintain two duplicate sets of logic. This
series intends to move the check to machine_run_board_init().

PATCH[1-3] Improves the check in machine_run_board_init()
PATCH[4-8] Move the check mc->init() to machine_run_board_init()

v1: https://lists.nongnu.org/archive/html/qemu-arm/2023-07/msg00302.html

Testing
=======

With the following command lines, the output messages are varied before
and after the series is applied.

  /home/gshan/sandbox/src/qemu/main/build/qemu-system-aarch64 \
  -accel tcg -machine virt,gic-version=3,nvdimm=on            \
  -cpu cortex-a8 -smp maxcpus=2,cpus=1                        \
    :

Before the series is applied:

  qemu-system-aarch64: mach-virt: CPU type cortex-a8-arm-cpu not supported

After the series is applied:

  qemu-system-aarch64: Invalid CPU type: cortex-a8-arm-cpu
  The valid models are: cortex-a7, cortex-a15, cortex-a35, cortex-a55,
                        cortex-a72, cortex-a76, a64fx, neoverse-n1,
                        neoverse-v1, cortex-a53, cortex-a57, max

Changelog
=========
v2:
  * Constify mc->valid_cpu_types                                (Richard)
  * Print the supported CPU models, instead of typenames        (Peter)
  * Misc improvements for the hleper to do the check            (Igor)
  * More patches to move the check                              (Marcin)

Gavin Shan (8):
  machine: Use error handling when CPU type is checked
  machine: Introduce helper is_cpu_type_supported()
  machine: Print supported CPU models instead of typenames
  hw/arm/virt: Check CPU type in machine_run_board_init()
  hw/arm/virt: Unsupported host CPU model on TCG
  hw/arm/sbsa-ref: Check CPU type in machine_run_board_init()
  hw/arm: Check CPU type in machine_run_board_init()
  hw/riscv/shakti_c: Check CPU type in machine_run_board_init()

 hw/arm/bananapi_m2u.c   | 18 ++++++---
 hw/arm/cubieboard.c     | 18 ++++++---
 hw/arm/mps2-tz.c        | 34 ++++++++++++++---
 hw/arm/mps2.c           | 44 ++++++++++++++++++---
 hw/arm/msf2-som.c       | 18 ++++++---
 hw/arm/musca.c          | 19 ++++++----
 hw/arm/npcm7xx_boards.c | 19 ++++++----
 hw/arm/orangepi.c       | 18 ++++++---
 hw/arm/sbsa-ref.c       | 29 ++++++--------
 hw/arm/virt.c           | 43 ++++++++++++---------
 hw/core/machine.c       | 84 +++++++++++++++++++++++------------------
 hw/m68k/q800.c          |  8 +++-
 hw/riscv/shakti_c.c     | 17 ++++++---
 include/hw/boards.h     |  3 +-
 14 files changed, 243 insertions(+), 129 deletions(-)

-- 
2.41.0

