Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp3612572lfo;
        Wed, 16 Mar 2022 06:09:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymgIi2+XJV6jrlw7G2b8JOxsssCiYxV3+U263f8eNY+cbtwygKBas3lPF+gW+eEhhMcfnm
X-Received: by 2002:a05:6402:50cf:b0:418:ee57:ed9 with SMTP id h15-20020a05640250cf00b00418ee570ed9mr1182968edb.37.1647436177846;
        Wed, 16 Mar 2022 06:09:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647436177; cv=none;
        d=google.com; s=arc-20160816;
        b=oHIxJ6Fkqz+TCTyMdHAswm9mKGkm1Py12kWUpSAiFj8kTlzX3173l3LGTx6h+B53Ec
         VD1G6hBoBEhrqzI8VtTDB02YZwBGT6wEat7bgIRF+78jI1hpNPbrp0lQ9w9EK/F/LqEG
         SpqoxofBnlA/q1nhMouNMWZNhE4ij8hj2cAE/Vnd5EzK/uzjwiboV9fJgzhckgSXS4Og
         hrlnkK7GQz4ReCknd3Rhf1fzi+tMiXZ8LpTszlTIvUP8/+x1QPp0dW9Ki8wuiwOn+3AT
         9D/i34PpRAxl01DFhd0ic3I/WE8S3ybKzlsQXDQtRxuRZVcOJlVmRegbeUZBb+PifFUL
         C1HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LUjDUMLR1cceFSXs3+vNunkuSyJVRtv6LfmBiXXSacU=;
        b=xQy0/RFchbqvFZ7+iyhlR2mq+5CktTPqB9kjYG/3Fkj27M0D8xHKqGeYzSzBAryuWV
         d8R7TnpNgrT6EWiGtwWznDO277vtP4vg0nayDaREVRfGLgprArQXKiDdGyWiVJ3qs89K
         8jAsskTDfZEV4jM1B5HzdrCQ5ZGyEAkyxXiYKt7XaFQfbRG++w+A1JJnpsyR19CAEQhj
         Xnc1tsctZzeYChf+RTPllcmdw/J9G+Cj3fjvM9EzbdQo0GXbxJe/ZRr+BMPbMQfWt4ot
         yvs9l8CePI5ucZXT/1LTH+zA3chZKJ2dwGpT05JZ59dEOcxkq1dGwNUpZymQFqEQqzPs
         QFdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CwjFcJ4H;
       spf=pass (google.com: domain of mlureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=mlureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mlureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id hv21-20020a17090760d500b006daa266143dsi1122243ejc.972.2022.03.16.06.09.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Mar 2022 06:09:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of mlureau@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CwjFcJ4H;
       spf=pass (google.com: domain of mlureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=mlureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647436176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LUjDUMLR1cceFSXs3+vNunkuSyJVRtv6LfmBiXXSacU=;
	b=CwjFcJ4HPmYWRB/gW0hs0mLxuiRemsDfKJfmBqcUaCaXDhdVuKWXP/t9uPEQH5Qatx14w0
	pJ5BwIAuiqjbbm2UVDWIwKwh6P85HfMP97xJduokiybvF15IiRcdDoYOlCJxK8k9y0DUZv
	1bvz8TV7lM7xOt8Tum5jyVIX1RLscUk=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-xFKWohkRMbSZulio5M0rCw-1; Wed, 16 Mar 2022 09:09:33 -0400
X-MC-Unique: xFKWohkRMbSZulio5M0rCw-1
Received: by mail-yb1-f197.google.com with SMTP id g2-20020a5b0242000000b0062892750241so1868414ybp.23
        for <alex.bennee@linaro.org>; Wed, 16 Mar 2022 06:09:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LUjDUMLR1cceFSXs3+vNunkuSyJVRtv6LfmBiXXSacU=;
        b=j3iLumxfaADIxuFExsCAjLyN9UZFjE/jQz3IUlG2N6iSxC53kLso5bPbs3Hm/R3p/g
         0p9+JCIe8Uqgh/l1YFP/bP8ee2Xko5ss/PPZMw/GgcmV8IOnU/0GqD0mfOoLtwQ+y3Zs
         8DwU35DqzcNSQ6qK0XewRNHZF8OESp1Pv98by0CWJGdq1W0vIsvoHfhmBld/FNuOBxE9
         8nDkCJMUFkpkH6PPayO0pZ8+uGspF/rvv5YlJCL/wXgCLGdQ/URMOcmLrqIsoVTBykHh
         GQiJ/8FCOcZ7Vi8YDg9/fW7SUFRcPDbrtk0v+xGc0DBYGcb/d5oFXUn+PYnvEoN/G0z+
         kBIQ==
X-Gm-Message-State: AOAM530Bw79UYf6GbHS7ng7mgPRokbHudCcTLiULytk2wCKiq34Vhj+U
	nS0yCYl1qlBZvg6Ofizi3+pF2O3GIPz9VJZ5yI54g9KIB9oWKlAZZs7vQCju6BzLzUyEWl1tZCd
	FLkt+CMFxHiU/MYZ+cU0HZEDb8b+O9ri2
X-Received: by 2002:a25:af41:0:b0:633:905f:9e9b with SMTP id c1-20020a25af41000000b00633905f9e9bmr2095239ybj.77.1647436173257;
        Wed, 16 Mar 2022 06:09:33 -0700 (PDT)
X-Received: by 2002:a25:af41:0:b0:633:905f:9e9b with SMTP id
 c1-20020a25af41000000b00633905f9e9bmr2095185ybj.77.1647436173029; Wed, 16 Mar
 2022 06:09:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220316095308.2613651-1-marcandre.lureau@redhat.com> <e709547a-a0c2-d1bd-7145-d03e9fd1776a@gmail.com>
In-Reply-To: <e709547a-a0c2-d1bd-7145-d03e9fd1776a@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 16 Mar 2022 17:09:21 +0400
Message-ID: <CAMxuvaze+OAZevgxnUSiwUN_ARch-Dgd643RYEC+vVm4J84d-Q@mail.gmail.com>
Subject: Re: [PATCH 10/27] Replace config-time define HOST_WORDS_BIGENDIAN
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Pavel Pisa <pisa@cmp.felk.cvut.cz>, Vikram Garhwal <fnu.vikram@xilinx.com>, 
	Jason Wang <jasowang@redhat.com>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>, Eric Farman <farman@linux.ibm.com>, 
	David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	Aurelien Jarno <aurelien@aurel32.net>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Eduardo Habkost <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
	Yanan Wang <wangyanan55@huawei.com>, Laurent Vivier <laurent@vivier.eu>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, David Gibson <david@gibson.dropbear.id.au>, 
	Greg Kurz <groug@kaod.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>, 
	Max Filippov <jcmvbkbc@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Coiby Xu <Coiby.Xu@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	"open list:Overall KVM CPUs" <kvm@vger.kernel.org>, 
	"open list:ARM PrimeCell and..." <qemu-arm@nongnu.org>, 
	"open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>, "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>, 
	"open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>, "open list:virtio-blk" <qemu-block@nongnu.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: YpyA9uFvkUGJ

On Wed, Mar 16, 2022 at 5:04 PM Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
>
> On 16/3/22 10:53, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Replace a config-time define with a compile time condition
> > define (compatible with clang and gcc) that must be declared prior to
> > its usage. This avoids having a global configure time define, but also
> > prevents from bad usage, if the config header wasn't included before.
> >
> > This can help to make some code independent from qemu too.
> >
> > gcc supports __BYTE_ORDER__ from about 4.6 and clang from 3.2.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >   meson.build                             |  1 -
> >   accel/tcg/atomic_template.h             |  4 +-
> >   audio/audio.h                           |  2 +-
> >   hw/display/pl110_template.h             |  6 +--
> >   hw/net/can/ctucan_core.h                |  2 +-
> >   hw/net/vmxnet3.h                        |  4 +-
> >   include/exec/cpu-all.h                  |  4 +-
> >   include/exec/cpu-common.h               |  2 +-
> >   include/exec/memop.h                    |  2 +-
> >   include/exec/memory.h                   |  2 +-
> >   include/fpu/softfloat-types.h           |  2 +-
> >   include/hw/core/cpu.h                   |  2 +-
> >   include/hw/i386/intel_iommu.h           |  6 +--
> >   include/hw/i386/x86-iommu.h             |  4 +-
> >   include/hw/virtio/virtio-access.h       |  6 +--
> >   include/hw/virtio/virtio-gpu-bswap.h    |  2 +-
> >   include/libdecnumber/dconfig.h          |  2 +-
> >   include/net/eth.h                       |  2 +-
> >   include/qemu/bswap.h                    |  8 ++--
> >   include/qemu/compiler.h                 |  2 +
> >   include/qemu/host-utils.h               |  2 +-
> >   include/qemu/int128.h                   |  2 +-
> >   include/ui/qemu-pixman.h                |  2 +-
> >   net/util.h                              |  2 +-
> >   target/arm/cpu.h                        |  8 ++--
> >   target/arm/translate-a64.h              |  2 +-
> >   target/arm/vec_internal.h               |  2 +-
> >   target/i386/cpu.h                       |  2 +-
> >   target/mips/cpu.h                       |  2 +-
> >   target/ppc/cpu.h                        |  2 +-
> >   target/s390x/tcg/vec.h                  |  2 +-
> >   target/xtensa/cpu.h                     |  2 +-
> >   tests/fp/platform.h                     |  4 +-
> >   accel/kvm/kvm-all.c                     |  4 +-
> >   audio/dbusaudio.c                       |  2 +-
> >   disas.c                                 |  2 +-
> >   hw/core/loader.c                        |  4 +-
> >   hw/display/artist.c                     |  6 +--
> >   hw/display/pxa2xx_lcd.c                 |  2 +-
> >   hw/display/vga.c                        | 12 +++---
> >   hw/display/virtio-gpu-gl.c              |  2 +-
> >   hw/s390x/event-facility.c               |  2 +-
> >   hw/virtio/vhost.c                       |  2 +-
> >   linux-user/arm/nwfpe/double_cpdo.c      |  4 +-
> >   linux-user/arm/nwfpe/fpa11_cpdt.c       |  4 +-
> >   linux-user/ppc/signal.c                 |  3 +-
> >   linux-user/syscall.c                    |  6 +--
> >   net/net.c                               |  4 +-
> >   target/alpha/translate.c                |  2 +-
> >   target/arm/crypto_helper.c              |  2 +-
> >   target/arm/helper.c                     |  2 +-
> >   target/arm/kvm64.c                      |  4 +-
> >   target/arm/neon_helper.c                |  2 +-
> >   target/arm/sve_helper.c                 |  4 +-
> >   target/arm/translate-sve.c              |  6 +--
> >   target/arm/translate-vfp.c              |  2 +-
> >   target/arm/translate.c                  |  2 +-
> >   target/hppa/translate.c                 |  2 +-
> >   target/i386/tcg/translate.c             |  2 +-
> >   target/mips/tcg/lmmi_helper.c           |  2 +-
> >   target/mips/tcg/msa_helper.c            | 54 ++++++++++++------------=
-
> >   target/ppc/arch_dump.c                  |  2 +-
> >   target/ppc/int_helper.c                 | 22 +++++-----
> >   target/ppc/kvm.c                        |  4 +-
> >   target/ppc/mem_helper.c                 |  2 +-
> >   target/riscv/vector_helper.c            |  2 +-
> >   target/s390x/tcg/translate.c            |  2 +-
> >   target/sparc/vis_helper.c               |  4 +-
> >   tcg/tcg-op.c                            |  4 +-
> >   tcg/tcg.c                               | 12 +++---
> >   tests/qtest/vhost-user-blk-test.c       |  2 +-
> >   tests/qtest/virtio-blk-test.c           |  2 +-
> >   ui/vdagent.c                            |  2 +-
> >   ui/vnc.c                                |  2 +-
> >   util/bitmap.c                           |  2 +-
> >   util/host-utils.c                       |  2 +-
> >   target/ppc/translate/vmx-impl.c.inc     |  4 +-
> >   target/ppc/translate/vsx-impl.c.inc     |  2 +-
> >   target/riscv/insn_trans/trans_rvv.c.inc |  4 +-
> >   target/s390x/tcg/translate_vx.c.inc     |  2 +-
> >   tcg/aarch64/tcg-target.c.inc            |  4 +-
> >   tcg/arm/tcg-target.c.inc                |  4 +-
> >   tcg/mips/tcg-target.c.inc               |  2 +-
> >   tcg/ppc/tcg-target.c.inc                | 10 ++---
> >   tcg/riscv/tcg-target.c.inc              |  4 +-
> >   85 files changed, 173 insertions(+), 173 deletions(-)
> >
> > diff --git a/meson.build b/meson.build
> > index f20712cb93d7..88df1bc42973 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -1591,7 +1591,6 @@ config_host_data.set('QEMU_VERSION_MICRO', meson.=
project_version().split('.')[2]
> >
> >   config_host_data.set_quoted('CONFIG_HOST_DSOSUF', host_dsosuf)
> >   config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device=
)
> > -config_host_data.set('HOST_WORDS_BIGENDIAN', host_machine.endian() =3D=
=3D 'big')
>
> Can we poison HOST_WORDS_BIGENDIAN definition to force cleaning old
> patches before merging them?
>

Sure, next patch :)
