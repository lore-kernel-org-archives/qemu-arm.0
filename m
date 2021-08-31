Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4973287lfb;
        Tue, 31 Aug 2021 05:16:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkxEKq3YJOSDRWshAW2NqgGXrFM3/3Bo1/UKadkFk2m6m0z/nciqdwhjhiNb8FbF+Ig2Ff
X-Received: by 2002:a05:6402:40cf:: with SMTP id z15mr19840301edb.70.1630412172674;
        Tue, 31 Aug 2021 05:16:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630412172; cv=none;
        d=google.com; s=arc-20160816;
        b=MyNMaXesunWW4t+Vm3j6kahSzVPNbLlGJwS7gtul1jnFW/xPG3kuU/GEhTdJA3gM1u
         d3Veaeyec9BcNd6A6GRRnJcYFq8Y1NMi39dIQu9v99Ct4V3Z/rftIOeEJWrtFqjvApc0
         WQz4yemRZP+gBCH9aDiFeBANKhQ5t4ZbLuESN4YGMHNB9RlQAUdnHzVWE27blkocY4Zh
         JuKK3HWdfzDhf/+4FOqGeo+nsUmdDXpOyc7FBUX0Oe7ngW6nNxLvTxjS98bJqcFOveV7
         Ktu8rnVZ50cLlc6YxQqI3vO7DAMeD2BsAXbvvuxB9Kzp6UgsWbwztIjmb8DLoyEVgq0D
         cwnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=lZS4DXMXSOjtCM69VzWdjvjuCGX5Br/qVVvKVZTVxAA=;
        b=eUZJoq3gSfi3B61OKF/FcjLa4nBeq9z9o8Ye0F6uOR1txzhqcVPb4rZzFUCABp07s1
         Ugt/U6yQF2I+2G6FYhN9YGqETVh5+n/+KVDMKLtNWGS28XMQ51QnFjTkeYo2Fm3for7l
         zLy4H93kHHX7ng08/vNhImmdLVT1i1H4oCodiGEGwDPxMrSkJq0ntKp5gkJVsUsSWGRg
         p8SOBafwIDo8z+wrqYfE2Wp1QpY8zWPzeC3k84gM+6N58ee1fe68RTe+EtZp0L3CYfZI
         pzCU5tKw1onNenf7PmxvwW6QBFuBDoZisornqhCnykcEgFyy5SOfB89pfw3jxtV0AMxo
         yytA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AJFU+WfD;
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kraxel@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id j12si18330124edr.598.2021.08.31.05.16.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Aug 2021 05:16:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of kraxel@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AJFU+WfD;
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630412170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lZS4DXMXSOjtCM69VzWdjvjuCGX5Br/qVVvKVZTVxAA=;
	b=AJFU+WfDYr3S0JGOl2c+kF4lN/gIhSKoL5MqMo8CT8x/Hxdq79giPYKAGD2RTt52f4fCT2
	3mjnWOUDcqstjTzF4q2XDzYNuzj5o2095DBMxyizVgljkSAmntFzJKw2VAhdLZEZ4RTKXu
	ke3lK/eyVVoq518MMp0c4Fexb67Nx3o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-NbqoTxYwMOSz1n-Y13nYiw-1; Tue, 31 Aug 2021 08:16:09 -0400
X-MC-Unique: NbqoTxYwMOSz1n-Y13nYiw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52118185302A;
	Tue, 31 Aug 2021 12:16:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB1BC1001281;
	Tue, 31 Aug 2021 12:15:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 13FFA1800936; Tue, 31 Aug 2021 14:15:45 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	Laurent Vivier <laurent@vivier.eu>,
	Peter Xu <peterx@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Cornelia Huck <cohuck@redhat.com>,
	qemu-ppc@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	qemu-riscv@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Stafford Horne <shorne@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Bin Meng <bin.meng@windriver.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Greg Kurz <groug@kaod.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	qemu-s390x@nongnu.org,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 00/29] [RFC] build more i386 tcg code modular.
Date: Tue, 31 Aug 2021 14:15:16 +0200
Message-Id: <20210831121545.2874233-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: U5EG0/YGL4kX

This series moves a big pile of code from core qemu to the tcg module.=0D
=0D
To allow for more fine-grained patches the first patch disables modular=0D
tcg and the last patch re-enables it.  Alternatively we could move all=0D
the build system changes (patches 4-8) to the end of the series and=0D
squash them into a single patch.  Not sure which is better ...=0D
=0D
The fundamental idea of this series is that any call from core qemu into=0D
tcg gets routed through function pointers.  This is simliar to the way=0D
we handle the spice module (see ui/spice-module.c).=0D
=0D
Initially the function pointers are filled with stubs, when the tcg=0D
module loads all function pointers are updated to point to the real=0D
functions instead.  One side effect of this is that compile-time stubs=0D
will become runtime-stubs.=0D
=0D
Series overview:=0D
   1         - disable modular tcg.=0D
   2 =3D>  3   - misc small tweaks.=0D
   4 =3D>  8   - build system changes.=0D
   9 =3D> 21   - add generic tcg function pointers.=0D
  22 =3D> 28   - add i386 tcg function pointers.=0D
  29         - re-enable modular tcg.=0D
=0D
take care,=0D
  Gerd=0D
=0D
Gerd Hoffmann (29):=0D
  build: temporarily disable modular tcg=0D
  plugins: register qemu_plugin_opts using opts_init()=0D
  tcg/module: move hmp.c to module=0D
  tcg/module: move cputlb.c to module=0D
  tcg/module: move tcg_ss to module [accel/tcg]=0D
  tcg/module: move tcg_ss to module [tcg]=0D
  tcg/module: move files to module [target/i386/tcg]=0D
  move cpu-exec-common.c from tcg module to core qemu [accel/tcg]=0D
  tcg/module: add tcg-module.[ch] infrastructure=0D
  tcg_funcs: Add tlb_flush to TCGModuleOps=0D
  tcg_funcs: Add tlb_flush_page to TCGModuleOps=0D
  tcg_funcs: Add tlb_reset_dirty to TCGModuleOps=0D
  tcg_funcs: Add tlb_plugin_lookup to TCGModuleOps=0D
  tcg_funcs:Add  tcg_exec_{realizefn,unrealizefn} to TCGModuleOps=0D
  tcg_funcs: Add tb_flush to TCGModuleOps=0D
  tcg: use tb_page_addr_t for tb_invalidate_phys_range()=0D
  tcg: drop tb_invalidate_phys_page_range()=0D
  tcg_funcs: Add tb_invalidate_phys_range to TCGModuleOps=0D
  tcg_funcs: Add tb_check_watchpoint to TCGModuleOps=0D
  tcg_funcs: Add cpu_restore_state to TCGModuleOps=0D
  tcg_funcs: Add curr_cflags to TCGModuleOps=0D
  tcg_i386_funcs: Add update_fp_status to TCGI386ModuleOps=0D
  tcg_i386_funcs: Add update_mxcsr_status to TCGI386ModuleOps=0D
  tcg_i386_funcs: Add update_mxcsr_from_sse_status to TCGI386ModuleOps=0D
  tcg_i386_funcs: Add x86_register_ferr_irq to TCGI386ModuleOps=0D
  tcg_i386_funcs: Add cpu_set_ignne to TCGI386ModuleOps=0D
  tcg_i386_funcs: Add cpu_x86_update_dr7 to TCGI386ModuleOps=0D
  tcg_i386_funcs: Add cpu_cc_compute_all to TCGI386ModuleOps=0D
  Revert "build: temporarily disable modular tcg"=0D
=0D
 include/exec/cpu-all.h              |  2 -=0D
 include/exec/exec-all.h             | 16 ++------=0D
 include/exec/ram_addr.h             |  2 -=0D
 include/exec/translate-all.h        |  2 -=0D
 include/qemu/plugin.h               |  7 ----=0D
 include/tcg/tcg-module-i386.h       | 15 ++++++++=0D
 include/tcg/tcg-module.h            | 24 ++++++++++++=0D
 target/i386/cpu.h                   | 17 ++------=0D
 accel/stubs/tcg-stub.c              |  4 --=0D
 accel/tcg/cpu-exec-common.c         | 10 ++++-=0D
 accel/tcg/cpu-exec.c                | 15 ++++++--=0D
 accel/tcg/cputlb.c                  | 14 ++++++-=0D
 accel/tcg/tcg-module-i386.c         | 33 ++++++++++++++++=0D
 accel/tcg/tcg-module.c              | 60 +++++++++++++++++++++++++++++=0D
 accel/tcg/translate-all.c           | 55 +++++++-------------------=0D
 cpu.c                               | 14 +++----=0D
 gdbstub.c                           |  4 +-=0D
 hw/i386/pc.c                        |  2 +-=0D
 hw/i386/pc_piix.c                   |  2 +-=0D
 hw/i386/pc_q35.c                    |  2 +-=0D
 hw/ppc/spapr_hcall.c                |  2 +-=0D
 linux-user/main.c                   |  2 +-=0D
 linux-user/mmap.c                   |  8 ++--=0D
 linux-user/syscall.c                |  4 +-=0D
 plugins/api.c                       |  4 +-=0D
 plugins/core.c                      |  2 +-=0D
 plugins/loader.c                    | 11 +++++-=0D
 softmmu/physmem.c                   | 22 +++++------=0D
 softmmu/vl.c                        |  1 -=0D
 target/alpha/helper.c               |  2 +-=0D
 target/alpha/mem_helper.c           |  2 +-=0D
 target/alpha/sys_helper.c           |  2 +-=0D
 target/arm/helper.c                 | 26 ++++++-------=0D
 target/arm/op_helper.c              |  2 +-=0D
 target/arm/tlb_helper.c             |  8 ++--=0D
 target/cris/helper.c                |  2 +-=0D
 target/i386/cpu-dump.c              |  2 +-=0D
 target/i386/gdbstub.c               |  2 +-=0D
 target/i386/helper.c                | 10 ++---=0D
 target/i386/machine.c               |  8 ++--=0D
 target/i386/tcg/cc_helper.c         |  9 ++++-=0D
 target/i386/tcg/fpu_helper.c        | 23 +++++++----=0D
 target/i386/tcg/int_helper.c        |  8 ++--=0D
 target/i386/tcg/mem_helper.c        |  8 ++--=0D
 target/i386/tcg/misc_helper.c       |  4 +-=0D
 target/i386/tcg/seg_helper.c        | 10 ++---=0D
 target/i386/tcg/sysemu/bpt_helper.c |  9 ++++-=0D
 target/i386/tcg/sysemu/fpu_helper.c | 12 +++++-=0D
 target/i386/tcg/sysemu/svm_helper.c |  2 +-=0D
 target/i386/tcg/tcg-stub.c          | 25 ------------=0D
 target/m68k/op_helper.c             |  6 +--=0D
 target/microblaze/helper.c          |  2 +-=0D
 target/mips/sysemu/cp0.c            |  2 +-=0D
 target/openrisc/sys_helper.c        |  8 ++--=0D
 target/ppc/excp_helper.c            |  2 +-=0D
 target/riscv/csr.c                  |  2 +-=0D
 target/s390x/gdbstub.c              |  2 +-=0D
 target/s390x/sigp.c                 |  2 +-=0D
 target/s390x/tcg/excp_helper.c      |  2 +-=0D
 target/tricore/op_helper.c          |  2 +-=0D
 target/xtensa/helper.c              |  6 +--=0D
 accel/tcg/meson.build               | 24 ++++++++----=0D
 target/i386/tcg/meson.build         |  7 +++-=0D
 target/i386/tcg/sysemu/meson.build  |  5 ++-=0D
 tcg/meson.build                     |  2 +-=0D
 65 files changed, 367 insertions(+), 239 deletions(-)=0D
 create mode 100644 include/tcg/tcg-module-i386.h=0D
 create mode 100644 include/tcg/tcg-module.h=0D
 create mode 100644 accel/tcg/tcg-module-i386.c=0D
 create mode 100644 accel/tcg/tcg-module.c=0D
 delete mode 100644 target/i386/tcg/tcg-stub.c=0D
=0D
--=20=0D
2.31.1=0D
=0D
