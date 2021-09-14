Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp731478lfp;
        Tue, 14 Sep 2021 07:21:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6rv6npNMOyDTbIhNj5O+2wujtijfshbgy3gLX/LxMkMoNie3Or7lYTTquFK07+k+ZdSEB
X-Received: by 2002:a17:907:7601:: with SMTP id jx1mr18926030ejc.69.1631629290970;
        Tue, 14 Sep 2021 07:21:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631629290; cv=none;
        d=google.com; s=arc-20160816;
        b=DF9ggl49QNI3BWwwt1dw5OpFf32nHhXkZGbfH+z6Y9TpWNDtCv9JP/te5WdpCZVvhA
         PWO4W0Cu9pQ1KmHQ0E1NiOjKWzCnkTfVcwZaraz16/M7UKCpavZRMRK4zXcB95sWjwGQ
         WweRoefLIiUyCZA6GsuLabUh+uSfEoosGAw6pbPKLFFSgGThTN0KZYS94e0eyaNwns9I
         4gazC/TlkvmjQOjBjuBc/saRbx5IB+gyGRum5xN/6lH8j/na0nv97FM2360O9Ee0/G0E
         1O+kaSJcjWf6qpxksNDQnHVqjgrxwc4iTjBLc400OrWnnO5eHbOhccYDJ4zecDm9BhTs
         O8+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=4ulHhpKDegj6iAYcvY7KZF8pg/KtdcW4oTK1Usa8Kg4=;
        b=xaTv7z9jwLqgj5yONrG8yWwuTrIStJGPkonYS2IuveOzHcxtWPaDLUMcuZ0eYGHJoi
         CVbdlRl+/FJHYGlA+U6NTEpQjQMCEQw226g4UpQLg10C+Elpd8cmox1OqLWtH5xTMgyL
         r0xwe4vd6xhlQ79ei9zX4ZhVuNFD++gx4HBSLysGNsDE/wIQvJegrcdAWUXVIAzBaMh9
         WRiYhEkvTIcRQ1k7BA07yIpkXsCpBreehU5M7oDV5i7Kfc65kJYiVty6RZxmSh1z6H5f
         drYpDVsXEdqedEqS05dpAIjMtEb7qL+60p4lNxV6N2iOQVvpR9Vlj6+aKmI7iejT6ljz
         LLNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LyFcLBB3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x17si9348948eds.602.2021.09.14.07.21.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Sep 2021 07:21:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LyFcLBB3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQ9JS-0007TE-0X
	for alex.bennee@linaro.org; Tue, 14 Sep 2021 10:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9JF-0007Oc-SW
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 10:21:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9JC-00032p-Pk
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 10:21:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4ulHhpKDegj6iAYcvY7KZF8pg/KtdcW4oTK1Usa8Kg4=;
 b=LyFcLBB32yum17uru6W2zCRYqIhmRVlcOMlYs6OxpfZpYbpqMXRzHtIF/hiDs11PklnOdd
 DKFAgI18DSywxc6LG/+cKt7QuhIcN/ewJmVgRr4UOn/+QpE9tr4dsDQ19xZkChQSxS+EKv
 FbEbrTFMw7o6m0ETv++hKFIN16nxM/8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-811swv3jMJy1esG27-Wdkw-1; Tue, 14 Sep 2021 10:21:11 -0400
X-MC-Unique: 811swv3jMJy1esG27-Wdkw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 526AC1084684;
 Tue, 14 Sep 2021 14:21:07 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C23645D9DC;
 Tue, 14 Sep 2021 14:20:43 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/53] monitor: explicitly permit QMP commands to be added
 for all use cases
Date: Tue, 14 Sep 2021 15:19:49 +0100
Message-Id: <20210914142042.1655100-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zIjFXxvrd51t

Previous postings:=0D
=0D
  v1: https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg02295.html=
=0D
=0D
We are still adding HMP commands without any QMP counterparts. This is=0D
done because there are a reasonable number of scenarios where the cost=0D
of designing a QAPI data type for the command is not justified.=0D
=0D
This has the downside, however, that we will never be able to fully=0D
isolate the monitor code from the remainder of QEMU internals. It is=0D
desirable to be able to get to a point where subsystems in QEMU are=0D
exclusively implemented using QAPI types and never need to have any=0D
knowledge of the monitor.=0D
=0D
The way to get there is to stop adding commands to HMP only. All=0D
commands must be implemented using QMP and any HMP equivalent be=0D
a shim around the QMP implemetation. We don't want to compromise=0D
our supportability of QMP long term though.=0D
=0D
This series proposes that we relax our requirements around fine grained=0D
QAPI data design, but with the caveat that any command taking this=0D
design approach is mandated to use the 'x-' name prefix. This tradeoff=0D
should be suitable for any commands we have been adding exclusively to=0D
HMP in recent times, and thus mean we have mandate QMP support for all=0D
new commands going forward.=0D
=0D
The series then converts the following HMP commands to be QMP shims.=0D
=0D
    info opcount=0D
    info jit=0D
    info tlb=0D
    info irq=0D
    info lapic=0D
    info cmma=0D
    info skeys=0D
    info ramblock=0D
    info rdma=0D
    info usb=0D
    info numa=0D
    info profile=0D
    info roms=0D
    info registers=0D
=0D
After doing this conversion=0D
=0D
 - All except 1 usage of qemu_fprintf is eliminated=0D
 - 50% of calls to qemu_printf are eliminated=0D
 - 75 calls to monitor_printf are eliminated=0D
=0D
Ultimately it should be possible to entirely eliminate qemu_fprintf=0D
and qemu_printf, and confine monitor_printf calls exclusively to=0D
the top level HMP command handlers.=0D
=0D
A full conversion would also enable HMP to be emulated entirely=0D
outside QEMU. This could be interesting if we introduce a new QEMU=0D
system emulator binary which is legacy free and 100% controlled=0D
via QMP, as it would let us provide HMP backcompat around it=0D
without the burden of HMP being integrated directly.=0D
=0D
There are still 48 HMP commands with no QMP counterpart after=0D
this series.=0D
=0D
 - A few are not relevant to port as they directly=0D
   reflect HMP functionality (help, info history).=0D
 - A few are sort of available in QMP but look quite=0D
   different (drive_add vs blockdev_add)=0D
 - A few are complicated. "info usbhost" is a dynamically=0D
   loaded HMP command inside a loadable module and we=0D
   don't have a way to dynamically register QMP handlers=0D
   at runtime.=0D
 - Most are just tedious gruntwork.=0D
=0D
Changed in v2:=0D
=0D
 - Improved documentation in response to feedback=0D
 - Finished "info registers" conversion on all targets=0D
 - Got a bit carried away and converted many many more=0D
   commands=0D
=0D
Daniel P. Berrang=C3=A9 (53):=0D
  docs/devel: rename file for writing monitor commands=0D
  docs/devel: tweak headings in monitor command docs=0D
  docs/devel: document expectations for QAPI data modelling for QMP=0D
  docs/devel: add example of command returning unstructured text=0D
  docs/devel: document expectations for HMP commands in the future=0D
  hw/core: introduce 'format_state' callback to replace 'dump_state'=0D
  target/alpha: convert to use format_state instead of dump_state=0D
  target/arm: convert to use format_state instead of dump_state=0D
  target/avr: convert to use format_state instead of dump_state=0D
  target/cris: convert to use format_state instead of dump_state=0D
  target/hexagon: delete unused hexagon_debug() method=0D
  target/hexagon: convert to use format_state instead of dump_state=0D
  target/hppa: convert to use format_state instead of dump_state=0D
  target/i386: convert to use format_state instead of dump_state=0D
  target/m68k: convert to use format_state instead of dump_state=0D
  target/microblaze: convert to use format_state instead of dump_state=0D
  target/mips: convert to use format_state instead of dump_state=0D
  target/nios2: convert to use format_state instead of dump_state=0D
  target/openrisc: convert to use format_state instead of dump_state=0D
  target/ppc: convert to use format_state instead of dump_state=0D
  target/riscv: convert to use format_state instead of dump_state=0D
  target/rx: convert to use format_state instead of dump_state=0D
  target/s390x: convert to use format_state instead of dump_state=0D
  target/sh: convert to use format_state instead of dump_state=0D
  target/sparc: convert to use format_state instead of dump_state=0D
  target/tricore: convert to use format_state instead of dump_state=0D
  target/xtensa: convert to use format_state instead of dump_state=0D
  monitor: remove 'info ioapic' HMP command=0D
  qapi: introduce x-query-registers QMP command=0D
  qapi: introduce x-query-roms QMP command=0D
  qapi: introduce x-query-profile QMP command=0D
  qapi: introduce x-query-numa QMP command=0D
  qapi: introduce x-query-usb QMP command=0D
  qapi: introduce x-query-rdma QMP command=0D
  qapi: introduce x-query-ramblock QMP command=0D
  qapi: introduce x-query-skeys QMP command=0D
  qapi: introduce x-query-cmma QMP command=0D
  qapi: introduce x-query-lapic QMP command=0D
  qapi: introduce x-query-irq QMP command=0D
  hw/core: drop "dump_state" callback from CPU targets=0D
  hw/core: drop support for NULL pointer for FILE * in cpu_dump_state=0D
  hw/core: introduce a 'format_tlb' callback=0D
  target/i386: convert to use format_tlb callback=0D
  target/m68k: convert to use format_tlb callback=0D
  target/nios2: convert to use format_tlb callback=0D
  target/ppc: convert to use format_tlb callback=0D
  target/sh4: convert to use format_tlb callback=0D
  target/sparc: convert to use format_tlb callback=0D
  target/xtensa: convert to use format_tlb callback=0D
  monitor: merge duplicate "info tlb" handlers=0D
  qapi: introduce x-query-tlb QMP command=0D
  qapi: introduce x-query-jit QMP command=0D
  qapi: introduce x-query-opcount QMP command=0D
=0D
 accel/tcg/cpu-exec.c                          |  56 +-=0D
 accel/tcg/hmp.c                               |  24 +-=0D
 accel/tcg/translate-all.c                     |  84 +--=0D
 docs/devel/index.rst                          |   2 +-=0D
 ...mands.rst =3D> writing-monitor-commands.rst} | 136 ++++-=0D
 hmp-commands-info.hx                          |  18 -=0D
 hw/core/cpu-common.c                          |  27 +-=0D
 hw/core/loader.c                              |  55 +-=0D
 hw/core/machine-hmp-cmds.c                    |  33 +-=0D
 hw/core/machine-qmp-cmds.c                    |  94 ++++=0D
 hw/rdma/rdma_rm.c                             | 104 ++--=0D
 hw/rdma/rdma_rm.h                             |   2 +-=0D
 hw/rdma/vmw/pvrdma_main.c                     |  31 +-=0D
 hw/s390x/s390-skeys.c                         |  37 +-=0D
 hw/s390x/s390-stattrib.c                      |  58 ++-=0D
 hw/usb/bus.c                                  |  38 +-=0D
 include/exec/cpu-all.h                        |   6 +-=0D
 include/exec/ramlist.h                        |   2 +-=0D
 include/hw/core/cpu.h                         |  36 +-=0D
 include/hw/rdma/rdma.h                        |   2 +-=0D
 include/monitor/hmp-target.h                  |   2 -=0D
 include/tcg/tcg.h                             |   4 +-=0D
 monitor/hmp-cmds.c                            |  81 +--=0D
 monitor/misc.c                                |  68 ++-=0D
 monitor/qmp-cmds.c                            | 127 +++++=0D
 qapi/common.json                              |  11 +=0D
 qapi/machine-target.json                      |  58 +++=0D
 qapi/machine.json                             | 140 +++++=0D
 softmmu/physmem.c                             |  19 +-=0D
 stubs/usb-dev-stub.c                          |   8 +=0D
 target/alpha/cpu.c                            |   2 +-=0D
 target/alpha/cpu.h                            |   2 +-=0D
 target/alpha/helper.c                         |  28 +-=0D
 target/arm/cpu.c                              | 152 +++---=0D
 target/avr/cpu.c                              |  57 +-=0D
 target/cris/cpu.c                             |   2 +-=0D
 target/cris/cpu.h                             |   2 +-=0D
 target/cris/translate.c                       |  33 +-=0D
 target/hexagon/cpu.c                          |  70 ++-=0D
 target/hexagon/internal.h                     |   1 -=0D
 target/hppa/cpu.c                             |   2 +-=0D
 target/hppa/cpu.h                             |   2 +-=0D
 target/hppa/helper.c                          |  25 +-=0D
 target/i386/cpu-dump.c                        | 489 ++++++++++--------=0D
 target/i386/cpu.c                             |   5 +-=0D
 target/i386/cpu.h                             |   7 +-=0D
 target/i386/monitor.c                         | 142 ++---=0D
 target/m68k/cpu.c                             |   5 +-=0D
 target/m68k/cpu.h                             |   5 +-=0D
 target/m68k/helper.c                          | 132 ++---=0D
 target/m68k/monitor.c                         |  14 +-=0D
 target/m68k/translate.c                       |  92 ++--=0D
 target/microblaze/cpu.c                       |   2 +-=0D
 target/microblaze/cpu.h                       |   2 +-=0D
 target/microblaze/translate.c                 |  45 +-=0D
 target/mips/cpu.c                             |  85 +--=0D
 target/nios2/cpu.c                            |   5 +-=0D
 target/nios2/cpu.h                            |   4 +-=0D
 target/nios2/mmu.c                            |  37 +-=0D
 target/nios2/monitor.c                        |   7 -=0D
 target/nios2/translate.c                      |  20 +-=0D
 target/openrisc/cpu.c                         |   2 +-=0D
 target/openrisc/cpu.h                         |   2 +-=0D
 target/openrisc/translate.c                   |   8 +-=0D
 target/ppc/cpu.h                              |   5 +-=0D
 target/ppc/cpu_init.c                         | 215 ++++----=0D
 target/ppc/mmu-hash64.c                       |   8 +-=0D
 target/ppc/mmu-hash64.h                       |   2 +-=0D
 target/ppc/mmu_common.c                       | 167 +++---=0D
 target/ppc/monitor.c                          |  11 -=0D
 target/riscv/cpu.c                            | 105 ++--=0D
 target/rx/cpu.c                               |   2 +-=0D
 target/rx/cpu.h                               |   2 +-=0D
 target/rx/translate.c                         |  14 +-=0D
 target/s390x/cpu-dump.c                       |  43 +-=0D
 target/s390x/cpu.c                            |   2 +-=0D
 target/s390x/s390x-internal.h                 |   2 +-=0D
 target/sh4/cpu.c                              |   5 +-=0D
 target/sh4/cpu.h                              |   3 +-=0D
 target/sh4/monitor.c                          |  41 +-=0D
 target/sh4/translate.c                        |  36 +-=0D
 target/sparc/cpu.c                            |  86 +--=0D
 target/sparc/cpu.h                            |   3 +-=0D
 target/sparc/mmu_helper.c                     |  43 +-=0D
 target/sparc/monitor.c                        |  12 -=0D
 target/tricore/cpu.c                          |   2 +-=0D
 target/tricore/cpu.h                          |   2 +-=0D
 target/tricore/translate.c                    |  24 +-=0D
 target/xtensa/cpu.c                           |   2 +-=0D
 target/xtensa/cpu.h                           |   4 +-=0D
 target/xtensa/mmu_helper.c                    | 126 +++--=0D
 target/xtensa/monitor.c                       |  11 -=0D
 target/xtensa/translate.c                     |  45 +-=0D
 tcg/tcg.c                                     |  98 ++--=0D
 tests/qtest/qmp-cmd-test.c                    |   8 +=0D
 95 files changed, 2429 insertions(+), 1551 deletions(-)=0D
 rename docs/devel/{writing-qmp-commands.rst =3D> writing-monitor-commands.=
rst} (78%)=0D
=0D
--=20=0D
2.31.1=0D
=0D

