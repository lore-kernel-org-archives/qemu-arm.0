Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60174CC6B30
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 02:28:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHBCU-0004aV-33; Wed, 14 Oct 2026 22:28:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xHBCS-0004ZY-93
 for qemu-arm@nongnu.org; Wed, 14 Oct 2026 22:28:08 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xHBCO-0002RX-En
 for qemu-arm@nongnu.org; Wed, 14 Oct 2026 22:28:08 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-6ae14eecc64so2313890a12.1
 for <qemu-arm@nongnu.org>; Wed, 14 Oct 2026 19:28:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792031282; cv=none;
 d=google.com; s=arc-20260327;
 b=rQamS/8qR46qhf+EJhxvt9QKK0lR1hLmBBw0mYdiW8/mYl40+KyRbnsQjWxzGMFRVR
 WCj4ZGGzHz08kqzI+HUkU31/Hp3gbhEpmaDEfKxQCnAxtmksgl6xmYch8iRU+goBdTT5
 +Z/TtlfXP7UvXmSC+RgN4C5rGzQ2A2t06rzio+4A8v7ndWW9MSJgvLA7wuaTgY1bbAkc
 QFac7IF/QpKhubsHCqASufkPqg6fZWaA+8Mxakn79QwvspXGFxI5HacHlLOEq56NLwxq
 AmCEewxX75HLg8vaaC2JZe/W9myvPFOWwLFfrc2CdS3lclQvq1vwLZdo4kkSXtnlsTCw
 tlaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=HgpTnaG1M0fZ8+ixlQuNqjXfAUXaGLgPrQ17b+wBbEg=;
 fh=6QPRbdmxgDwtdyCAYgCcBGFOKrl9BIzEhEeKyNBBn6g=;
 b=dOHpPhXna8tyOCXDa+P2xlalAXdduaYgVGp8z0bdq6ujklFlU9s33nQU6mnKor5eae
 Sz7xZY4HftKU7ivdbrbkTs/+2qr6+5EZKwr5qmA3GUBpw3Nm0VS9xiAlXs+9+7tiyVuq
 NgzSYSW4aJLDbOTg2U9QGmOkHhqxSN6bahY0t61eyGhVZIuZFsotO8lTLwOjh0I0wry7
 GikiV5HNudfSbdYaNKimsU6rh7v4qnpLM1hJEvpHSqAVm9iWqz65I9bcfeUPCEJsZ468
 WANScUvaWecgMrIdQ3v9j0EfUN80fb/N90iGW8ea6YTOgGPkJp8fD6x+UpKmrS0oqle7
 V68w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792031282; x=1792636082; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=HgpTnaG1M0fZ8+ixlQuNqjXfAUXaGLgPrQ17b+wBbEg=;
 b=TaiGXu6UbW23j1d8LCnF7AEad6BaXDyWKqEVNyqXGioi8Sh73T183IzpZTzpZOya3s
 jRGv56+fSwDOH3buLde2BC3cv6hvSv1SvClVU7XQt3S6GQ0NaZIs9WZQ03NpAzeUKCYv
 le0sF61YekzenBDYOV0jBzaWkpi+v/tMAeb9TdJCQw9briWo2S1M3wl6scGpz9oTu2TA
 ehhFl7vNc/xuKjhY973bgdzwkHJqdFUSqkYGaUt+5JKAfZ7EwKIhyTEaDk5mL+2N/bzq
 FcCoImIVAKbNqyDsbq+8Ap6y1mpReM2lhM7chbrAW5sgwAKU4BejkqwR0irl9O9lNsp1
 MPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792031282; x=1792636082;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=HgpTnaG1M0fZ8+ixlQuNqjXfAUXaGLgPrQ17b+wBbEg=;
 b=eJLPt+KagY/pe4L1saS8TDenPadLXpOEC0QY6YqaJkXvmfUd6X09nRt3D745b9w+nZ
 3qb7fYvBM81sDf/nyYfSKOstDmTbvB0Qk2PJVS2toUX8vsVDlMYDzmKGEcCRsyFTcIFh
 qoqAfXAWtfYUB8I254rnOqLm0S55P+9sbDftSQjvgMA7cLDeP4k/Su/pV+7p1BQ3wBwE
 hRjLPJZoV3H8+aaYdTtnEvK5tQgZXi2cxsVIjMqgVEvSremfgiMii8c25jMPW8YkUGaU
 EblRUI10UIHPesEFVXzBWgM1fACqOaFDIhhjIOJRYIX22AkmyBUwEYKdIDUl3Zl14hdu
 72Ng==
X-Forwarded-Encrypted: i=1;
 AKwUvBwGrsgRPIKF9sLXWjosOlnSBAMQreWvLoC5TSl86ewD3Q2lRcjKpsEl7hk/Vs/NDXaXHdrBhFm4sQ==@nongnu.org
X-Gm-Message-State: AFq9FYJ7gVlZv+y5WNj94Hygi4v7xkMaUN3zvu4w1ZUNTNZJkxFSA9AP
 12Ty5NKBwDSjaDp5mxb0JFCiO6qE5+eBccBJ0weaEkkpyHAiLSMq6ICcWvvSkoRZ0J4DvNljsFM
 TQjothyP0sLeixOzp8VwyH/JAEppzvbA=
X-Gm-Gg: AYBFou2+iKaCrTvlBy7yMdVReN9i2rK28EAZQQkikMLr0WEydrRo4tUEes9VaJz5oOR
 jjLbGRivPlSiNGJ81KA83A6PuQ17F+Aws/JzVQ/n1kAgijYZRX1vh2cMi1eGrKM43CkN+/hSZzM
 +eAIO5W3kIeuJWDAJm/o2m5kX9XLT5oU+myHZAqfx9Naq+2CHnkCEnvxpWqKL6sAzUbZRZl3Q/7
 8Z/ziqBFRiqhHcz85+0qcWhBcoU0J02PXyJ13Wtb5B5q9eGOInHF4ICVJapgMA4pKwWLYPd7pU8
 o2X3+ze2WTm+6rLpd60zKpCDQrIiU1W/MsdZ7q281XogjMJ53byv/iQ=
X-Received: by 2002:a05:6402:a0d8:b0:6b1:d2d6:4013 with SMTP id
 4fb4d7f45d1cf-6b1d2d656aamr6151473a12.17.1792031282201; Wed, 14 Oct 2026
 19:28:02 -0700 (PDT)
MIME-Version: 1.0
References: <20261014093152.834-1-luoyonggang@gmail.com>
 <b0d5c95f-b08d-4a3b-9c8c-7a7575250fdc@oss.qualcomm.com>
In-Reply-To: <b0d5c95f-b08d-4a3b-9c8c-7a7575250fdc@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Thu, 15 Oct 2026 10:27:48 +0800
X-Gm-Features: AclHuK_a0u7yDl5zMmDiJ4AwqFZyaiw4cpLpvZh527ZF_Xzmn3-ADaBc2UBnOzc
Message-ID: <CAE2XoE8joYkWK2UyJ3HW+eyDSQt=4ZAgbyKVv1AR9CBHQf6YKQ@mail.gmail.com>
Subject: Re: [PATCH 00/34] single-binary: Select the softmmu target through
 -machine <type>
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 qemu-riscv@nongnu.org, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Alexander Bulekov <alxndr@bu.edu>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, qemu-s390x@nongnu.org,
 Song Gao <17746591750@163.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Eric Farman <farman@linux.ibm.com>, 
 Brian Cain <brian.cain@oss.qualcomm.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Ani Sinha <anisinha@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>, 
 Cornelia Huck <cohuck@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Weiwei Li <liwei1518@gmail.com>, 
 Markus Armbruster <armbru@redhat.com>, David Hildenbrand <david@kernel.org>,
 Laurent Vivier <laurent@vivier.eu>, 
 Fam Zheng <fam@euphon.net>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 qemu-arm@nongnu.org, Chao Liu <chao.liu@processmission.com>, 
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Max Filippov <jcmvbkbc@gmail.com>, Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed1-x535.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, Oct 15, 2026 at 1:35=E2=80=AFAM Pierrick Bouvier
<pierrick.bouvier@oss.qualcomm.com> wrote:
>
> On 10/14/2026 2:31 AM, Yonggang Luo wrote:
> > MachineClass::targets declares each machine's supported targets as a
> > uint64_t QEMU_ARCH_* mask.
> >
> > In the combined executable, a machine can be selected from
> > <target>-<machine-name> when <machine-name> is ambitious.
> > Otherwise we can use <machine-name> to directly select a target.
> >
> > Renaming SysEmuTarget to EmuTarget prepares the enum for both system an=
d
> > user-mode targets before introducing more usage of it.
> > Rationale:
> > https://lore.kernel.org/qemu-devel/d6217459-1e55-4da0-a49f-bde8215d8c0e=
@oss.qualcomm.com/
> >
> > The "virt" machines need distinct QOM names to coexist in a combined bi=
nary
> > or test. Their existing CLI names and aliases are preserved.
> >
> > Other indirect call of target_info() in class_init/type_init is removed=
 by
> > serveral commits, this is a prepare for select <target> by -machine $ty=
pe.
> > As target_info() will be NULL till the target is selected under machine=
_select.
> >
> > The commits through "hw: add MachineClass::targets with a usage and tes=
t"
> > add a minimal demo/test for introduce MachineClass::targets
> >
> > The next group, through
> > "meson: build combined qemu-system for multi-target configurations",
> > enabled the test guard to prevent introduce future calling
> > target_info() in type_init or class_init
> >
> > These two boundaries provide possible merge points.
> >
> > "targets" be exported along with MachineInfo in commit
> > "qmp: Expose supported targets in query-machines", so that the qmp know
> > how to set proper $<target>-<machine-name>.
> >
> > The rest commits is the introduce of support of <target> select from
> > `-machine $type`.
> >
> > Yonggang Luo (34):
> >   qemu/base-arch-defs: extract QEMU_ARCH_BIT for QEMU_ARCH_* enums
> >   qemu: Use SYS_EMU_TARGET__MAX to define QEMU_ARCH_ALL
> >   qemu: increase width of QEMU_ARCH_* masks enums to be 64 bits
> >   qapi: rename SysEmuTarget to EmuTarget
> >   qapi: add missing Linux user-mode targets to EmuTarget
> >   meson: define TARGET_ARCH_VARIANT to target_name only
> >   target-info: prepare the QOM target list before
> >     module_call_init(MODULE_INIT_QOM)
> >   hw: add MachineClass::targets with a usage and test
> >   accel: register CPU parent for each target
> >   meson: collect Rust crates for combined system target
> >   module: Add module_allow_all_arch for allow all modules be loaded
> >   target/arm: defer max-v8 initializer selection until CPU creation
> >   hw/microblaze: defer PetaLogix endianness default until init
> >   hw/pci: Avoid guard loadparm with target_s390x() for s390x in
> >     class_init
> >   hw/scsi: Avoid guard loadparm with target_s390x() for s390x in
> >     class_init
> >   hw/virtio/virtio-mem: Avoid call to target_info() in class_init
> >   target-info: add a combined-binary query stub
> >   machine: allow -M name to differ from QOM type
> >   hw/riscv/virt: use unique QOM name
> >   hw/arm/virt: use unique QOM name
> >   hw/or1k/virt: use unique QOM name
> >   hw/hexagon/virt: use unique QOM name
> >   hw/loongarch/virt: use unique QOM name
> >   hw/m68k/virt: use unique QOM name
> >   hw/xtensa/virt: use unique QOM name
> >   qapi: return MachineInfo typename from query-machines
> >   machine: match the versioned virt example to arm virt
> >   hw: Add MachineClass.targets for all "virt" machines for all possible
> >     targets
> >   system/arch_init: update qemu_arch_available to handle non-target
> >     select condition
> >   meson: build combined qemu-system for multi-target configurations
> >   qmp: Expose supported targets in query-machines
> >   system/vl: select target from machine name in combined binaries
> >   system/vl: handle cpu/device help properly for multi-target qemu
> >   qdev: Handle device alias ambiguous under multi-target qemu
> >
> >  MAINTAINERS                              |   2 +
> >  accel/accel-common.c                     |   6 +-
> >  accel/accel-internal.h                   |   1 +
> >  accel/accel-system.c                     |  24 +++
> >  accel/accel-user.c                       |   7 +
> >  backends/igvm.c                          |   4 +-
> >  hw/alpha/dp264.c                         |   2 +
> >  hw/arm/virt.c                            |  56 +++----
> >  hw/core/machine-qmp-cmds.c               |  19 ++-
> >  hw/core/machine.c                        |   9 ++
> >  hw/hexagon/virt.c                        |  25 +++-
> >  hw/loongarch/virt.c                      |  47 +++---
> >  hw/m68k/virt.c                           |  39 +++--
> >  hw/microblaze/petalogix_s3adsp1800_mmu.c |  11 +-
> >  hw/misc/vmlaunchupdate.c                 |   6 +-
> >  hw/or1k/virt.c                           |  22 +--
> >  hw/pci/pci.c                             |  18 ++-
> >  hw/riscv/virt.c                          |  28 ++--
> >  hw/scsi/scsi-disk.c                      |  18 ++-
> >  hw/uefi/ovmf-log.c                       |   4 +-
> >  hw/virtio/virtio-mem.c                   |  26 ++--
> >  hw/xtensa/virt.c                         |  24 ++-
> >  include/hw/arm/virt.h                    |   5 +-
> >  include/hw/core/boards.h                 |  45 ++++--
> >  include/hw/hexagon/virt.h                |   5 +-
> >  include/hw/loongarch/virt.h              |   5 +-
> >  include/hw/riscv/virt.h                  |   5 +-
> >  include/monitor/qdev.h                   |   7 +
> >  include/qemu/base-arch-defs.h            |  80 ++++++----
> >  include/qemu/module.h                    |   2 +
> >  include/qemu/target-info-def.h           |   2 +-
> >  include/qemu/target-info-qapi.h          |   4 +-
> >  include/qemu/target-info-qom.h           |   4 +
> >  include/qemu/target-info.h               |   7 +
> >  meson.build                              |  82 +++++++++-
> >  monitor/monitor-hmp-internal.h           |   2 +-
> >  qapi/machine.json                        |  44 +++---
> >  qapi/pragma.json                         |   4 +-
> >  qom/object.c                             |   4 +-
> >  stubs/meson.build                        |   1 +
> >  stubs/target-info.c                      |  10 ++
> >  system/arch_init.c                       |  12 +-
> >  system/qdev-monitor.c                    |  54 ++++++-
> >  system/target-info.c                     |  10 ++
> >  system/vl.c                              | 181 ++++++++++++++++++++---
> >  target-info-def.c                        |   2 +-
> >  target-info-qom.c                        |  26 +++-
> >  target-info.c                            |  38 ++---
> >  target/arm/tcg/cpu-max-v8.c              |  17 ++-
> >  tests/qtest/fuzz/fuzz.c                  |   2 +-
> >  tests/qtest/qom-test.c                   |  65 +++++++-
> >  tests/unit/meson.build                   |   4 +-
> >  tests/unit/test-multi-target.c           |  67 ++++++++-
> >  util/module.c                            |  10 +-
> >  54 files changed, 915 insertions(+), 289 deletions(-)
> >  create mode 100644 stubs/target-info.c
> >  create mode 100644 system/target-info.c
> >
>
> Hi Yonggang,
>
> in a previous thread, we had a long discussion about which direction we
> want to go, and what needs to be implemented. I politely suggested to
> focus first on simply removing dependency in class_init to target_info,

The removing dependency in class_init to target_info is at:

https://lore.kernel.org/qemu-devel/20261013200525.1340-1-luoyonggang@gmail.=
com/

I think it's easy to avoid target_info  in class_init , there is no need to=
 rely
 on is_available for this.


> and rely on is_available only. The idea was to convince you that small
> iteration steps are better than throw-all-in series. I thought we were
> on the same page.

Sorry, I should add the DRAFT in the title, it is just a post for
experiment(means
testing locally) and tells us our direction is correct.
And also I can use it locally. Sorry for the burden.

>
> Now, yet another mega series mixing cleanup, code and even going as far
> as introducing the qemu-system binary.
>
> I feel like spending time to give advice didn't lead to a concrete

Your advice I am hearing and done at
https://lore.kernel.org/qemu-devel/20261013200525.1340-1-luoyonggang@gmail.=
com/

And I explained no need to introduce is_available to avoid
target_info() in class_init.
Because I can not get a usable qemu-system that includes all QOM names.
> change in behavior. As a result, I'm stopping to review all those
> series, and will let others drive this.

I am fine with that, thanks. Others drive(coding) will give more
agreement. Things/Design
sometimes needed in conjunction with code.

>
> Regards,
> Pierrick



--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

