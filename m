Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3942192lfg;
        Mon, 1 Mar 2021 13:51:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9NMJ0xvNbhB+h1+Bc4vp9DvjCP6mvq/Uc2HVRyM/ClDmNkd8f+N5S3fLJQOzugLlGCyUQ
X-Received: by 2002:a9d:7216:: with SMTP id u22mr14316703otj.291.1614635494088;
        Mon, 01 Mar 2021 13:51:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614635494; cv=none;
        d=google.com; s=arc-20160816;
        b=EYfTFQJ/xSRZS4iMBaIwVK8zO0rmMjKa1EMJMTGGwlciDVsl7RXaJlw2jzEYqAO7hn
         1AeMshGk9neB0dNRnAZ/Htscnr2qCTECXMt5F28WpooZVm5ITJhHnJTEPYl9ms8qzM4W
         XEzNsb6BAM3+QTlX0PnZ2blTeD5347RSF/WCHdPxRUQ9r0TE4mrfTUAiA0asb6QJz7XW
         8jdUQirJAXyUmJ1b+pPQ9DeKcNn06eFxdJiFBY9EF/Jip9d8mOxDC4l3ZIUC60FOLWFh
         MMWWT2igOrWT0o55UNY5DfesnvFUll1GL7axn9O5U6fW24xY6UCAkz+/0DitxFkq8KME
         T9NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=TgU9g7sxuuToYY0NcbUASWLJoXAYrOMW28gUzw0UYX4=;
        b=UPWBWhd48qL6jhvL/sEB8oeshfODrGtqmknBa8B2jKuk6xEnJb43q2QVGoOLxb2uyX
         Z2J+Iw6TMEw9exg9ZoPYuypuFjrimwFlrWdsUwphCUUKDCz6MfBmtR4WbPDU5AfXlba7
         FU9UZNQisMSF63vYoWezWmjhdSbWKRGx2ew6JmubCeLF/ShtnsvTppQ1kB9vC29T9Cax
         QStpMmcjlgZ5/HfCCLHYUFwftFcuPfsNjOt5+kB6jWYK817N7oUdwkN28Y5ihpsTxEQD
         EvEiFReC5nSKz5mQIwWPEH30+6So8bRueinquq42U0Zc3KK4Aa6eh2zNKgxWFGlXcpPs
         yYcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MjUxIOyJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f6si11021511oom.40.2021.03.01.13.51.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Mar 2021 13:51:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MjUxIOyJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:32838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lGqRx-00009P-7W
	for alex.bennee@linaro.org; Mon, 01 Mar 2021 16:51:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGqRl-00006P-H1; Mon, 01 Mar 2021 16:51:21 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:42024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGqRj-0004gv-Gc; Mon, 01 Mar 2021 16:51:20 -0500
Received: by mail-ej1-x62c.google.com with SMTP id c10so4654206ejx.9;
 Mon, 01 Mar 2021 13:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TgU9g7sxuuToYY0NcbUASWLJoXAYrOMW28gUzw0UYX4=;
 b=MjUxIOyJmZt42YG/WnmTH7i+XkiKjXJtVBoVDF2uqpZcPx2bE7UBkt7K7Xedpifgzv
 uVVHZqkiYkq150I/IyLhHiXcxwzqKtlclERrTdetQmrEYTFL1BSksR3cbcneP6ahc2QV
 SX8sivvauRZ8ONUZ+XUgWH2tZgkg+myHwS+hDLUPq/+D/1ac2xGspba+rzN/nb0ewWNk
 j5bj1RWR3jN7JTF7d2edAziBcMKc8ifpqx2OYepTR8hChcOmRVTi+QY7tsbfpkiqBc/P
 6H9fuOiffS4CqoX46+gkBwwKbfx0drAAKzKSXgHmrdPS4lVPtOgFBmz6+OBod0RTqrMP
 +6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=TgU9g7sxuuToYY0NcbUASWLJoXAYrOMW28gUzw0UYX4=;
 b=HYlz/U3BtaoaCOgnjqteDC1Co3RLS9eNM+5Km/rYK1EwPJiGIsVugyHIwV6jyHbAw8
 LgItuktg5Y42Y1nsM7vdV1VjDzcBFCN7CoW4Lf0JDnx2z2K/WVt57ka9F2PeqJdI61+G
 zOc/hxAAh5mHAK+LxdQLa6xEksFahQTxNVhSD/ylNm5Ka23LJsHDrkZgVW706mAywCTh
 EKZOoo387PoQlh5inMFiOifTMtPyeMJynKNGpKeRrG1ihw7L8n5RzJns0yGKx3wpQ+aO
 MdJD9WOFlVqKmbJLDggsT8nKe6O4RIQbiOfXLXfXsOq/rBmIW25HSWtynBEtb9smkKcP
 VjSw==
X-Gm-Message-State: AOAM533Wc3xA4fwbWSDM9oiVHWmpx2S+mIHMVj9DZivytnZwfU7Q69wx
 /Eh/U3LNj0A7af8EiqPDyex6O3FsERA=
X-Received: by 2002:a17:906:cecc:: with SMTP id
 si12mr17899227ejb.461.1614635474708; 
 Mon, 01 Mar 2021 13:51:14 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id m7sm15710201ejk.52.2021.03.01.13.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 13:51:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/17] cpu: Introduce SysemuCPUOps structure
Date: Mon,  1 Mar 2021 22:50:53 +0100
Message-Id: <20210301215110.772346-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Michael S. Tsirkin" <mst@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-ppc@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 345q56FknFCX

Hi,=0D
=0D
This series is inspired on Claudio TCG work.=0D
=0D
Instead of separate TCG from other accelerators, here we=0D
separate sysemu operations (system VS user).=0D
=0D
Patches 1-6 are generic cleanups.=0D
Patches 7-15 move from CPUClass to SysemuCPUOps=0D
Patches 16-17 restrict SysemuCPUOps to sysemu=0D
=0D
Since v1:=0D
- Name 'sysemu' (Claudio)=0D
- change each field progressively (Richard)=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Supersedes: <20210226163227.4097950-1-f4bug@amsat.org>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (17):=0D
  target: Set CPUClass::vmsd instead of DeviceClass::vmsd=0D
  cpu: Un-inline cpu_get_phys_page_debug and cpu_asidx_from_attrs=0D
  cpu: Introduce cpu_virtio_is_big_endian()=0D
  cpu: Directly use cpu_write_elf*() fallback handlers in place=0D
  cpu: Directly use get_paging_enabled() fallback handlers in place=0D
  cpu: Directly use get_memory_mapping() fallback handlers in place=0D
  cpu: Introduce SysemuCPUOps structure=0D
  cpu: Move CPUClass::vmsd to SysemuCPUOps=0D
  cpu: Move CPUClass::virtio_is_big_endian to SysemuCPUOps=0D
  cpu: Move CPUClass::get_crash_info to SysemuCPUOps=0D
  cpu: Move CPUClass::write_elf* to SysemuCPUOps=0D
  cpu: Move CPUClass::asidx_from_attrs to SysemuCPUOps=0D
  cpu: Move CPUClass::get_phys_page_debug to SysemuCPUOps=0D
  cpu: Move CPUClass::get_memory_mapping to SysemuCPUOps=0D
  cpu: Move CPUClass::get_paging_enabled to SysemuCPUOps=0D
  cpu: Restrict cpu_paging_enabled / cpu_get_memory_mapping to sysemu=0D
  cpu: Restrict "hw/core/sysemu-cpu-ops.h" to target/cpu.c=0D
=0D
 include/hw/core/cpu.h            |  91 ++++++-------------------=0D
 include/hw/core/sysemu-cpu-ops.h |  89 ++++++++++++++++++++++++=0D
 cpu.c                            |  19 +++---=0D
 hw/core/cpu.c                    | 113 +++++++++++++++++--------------=0D
 hw/virtio/virtio.c               |   4 +-=0D
 target/alpha/cpu.c               |  11 ++-=0D
 target/arm/cpu.c                 |  19 ++++--=0D
 target/avr/cpu.c                 |   9 ++-=0D
 target/cris/cpu.c                |  11 ++-=0D
 target/hppa/cpu.c                |  11 ++-=0D
 target/i386/cpu.c                |  29 +++++---=0D
 target/lm32/cpu.c                |  10 ++-=0D
 target/m68k/cpu.c                |  11 ++-=0D
 target/microblaze/cpu.c          |  11 ++-=0D
 target/mips/cpu.c                |  11 ++-=0D
 target/moxie/cpu.c               |  11 +--=0D
 target/nios2/cpu.c               |  16 ++++-=0D
 target/openrisc/cpu.c            |  11 ++-=0D
 target/riscv/cpu.c               |  13 +++-=0D
 target/rx/cpu.c                  |  17 ++++-=0D
 target/s390x/cpu.c               |  15 ++--=0D
 target/sh4/cpu.c                 |  11 ++-=0D
 target/sparc/cpu.c               |  11 ++-=0D
 target/tricore/cpu.c             |  14 +++-=0D
 target/unicore32/cpu.c           |   8 ++-=0D
 target/xtensa/cpu.c              |  11 ++-=0D
 target/ppc/translate_init.c.inc  |  21 +++---=0D
 27 files changed, 409 insertions(+), 199 deletions(-)=0D
 create mode 100644 include/hw/core/sysemu-cpu-ops.h=0D
=0D
-- =0D
2.26.2=0D
=0D
