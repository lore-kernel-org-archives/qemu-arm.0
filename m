Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2312512wrt;
        Fri, 14 Dec 2018 09:19:28 -0800 (PST)
X-Received: by 2002:a9d:59d0:: with SMTP id u16mr2702215otg.265.1544807968426;
        Fri, 14 Dec 2018 09:19:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544807968; cv=none;
        d=google.com; s=arc-20160816;
        b=j+xCjPo1HCj836o3vHgF646RmcLcL122GTi7us7GGMNecnA4JzFCDVg5RUwfTM74cc
         rrGFH1/4XVNSFLTKkPg6AnQn0gCyiJaH+WMVsMNqbKMs5Is6THfogYm9ddquDod9EHMd
         FocDP51kKYDE6EPY3h9T6Z6WglLievArmrxkScyFu+O5ACCqDEEt77ecns+7BOMY2oI2
         eJFERqORYLeDIb5gB2Fqjiv1aAVWphmaNFCXGu4Dxh3gY1OIOKAOvP/tmFBQJttCfmPw
         FdFL0DmF0foXKGK4UMVp633FvrZwGvJ+ltETlmmkSby/ImuApAM1hx1CNLwhs8GmRanj
         nZSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=ojE3hiFdpAgro7h/IgKo0d8Q8ornsjv0Kh/D9TRszrE=;
        b=hmclVrZVBxGW6zNaIfePLG4v4NCrw2PR1A+gxZqKzfLNLb69Lm7o+g7psh17uPmiV6
         3hyGSCzRAnp1lEK28FzVWokN/ljZd/87K0I328E7ndYI9tA/vEHR/08uO2gkXqQtULaW
         7UW+K8JB0mklbHw+szNPrYP74mM9js4taxtht/sRgPAHT76AebDd9/nXnOfC9x4pvM1l
         +FDXh0DLA1GB4AEsS/tzrvs+zfYmauJ0aIiI8nGlVZTvo+fUzO7frtlDywfVLevIe++C
         LSL/3n3+zwdwhV1gcXWDbzPOznFOw0i6u6hCnj845C+bjb5qf1JqL1IqtzuplYg0VL1k
         4DXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=pPoL8iqY;
       spf=pass (google.com: domain of aleksandar.m.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=aleksandar.m.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <aleksandar.m.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r21sor3020718otg.159.2018.12.14.09.19.28
        (Google Transport Security);
        Fri, 14 Dec 2018 09:19:28 -0800 (PST)
Received-SPF: pass (google.com: domain of aleksandar.m.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=pPoL8iqY;
       spf=pass (google.com: domain of aleksandar.m.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=aleksandar.m.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=ojE3hiFdpAgro7h/IgKo0d8Q8ornsjv0Kh/D9TRszrE=;
        b=pPoL8iqYidOHD6PwlfknlugTPhOMIWun/2v8znFMC2odw8oYiFNld7FR+P7GWfR356
         Cl/eSBAEkNayNetmTzZ8BLMGIH4/NSTDDG2pmI+HaXg4V5LW930aA3iy309LFEiJdoYg
         T9vFZhnN2xfigfRoSkJdws8bEof9dO6GnZjDkYhKX8i3EAacqd/31OuIgiucjnPk2TNi
         wwGOB1NTsGZA7j+k/mSsD1lg5/Oa/7+gurxcv6EbKErUOLHePa4qHyGtxGOrLt6csxaY
         0NzMLJk9U5M8++Ke3NsFMHZT8y+Dy4w6h5KGCtgFCmRuS1obSbU6bVH6Ix+G6CyTXMgY
         qw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=ojE3hiFdpAgro7h/IgKo0d8Q8ornsjv0Kh/D9TRszrE=;
        b=D8IZDKn+YTZgju9s+IvJWHrF2PG6g4HMOb3vn4n+MFy6hUPX9vRQ+AU7gJeFm4o06V
         pBIctz9BC8Wwal7pe/KrDaK1Fx3dO5Ip9WzV4ezZvM7O8VVNsbD//7BQ5bTZH354iYk3
         SpEsXIRFEfyFFO62TuCig/rgjT/+WLoLUphCEqylA5ipVqDKwKstcLs33dh6Z1Tx95dL
         Uh5JpXNMXu3VyzQaS1EV6NV1E/5X/4YO2ZmG1pziiweFSxUasgojRCmGO5f6OTQ4p3tr
         YsNH7SOqPGmx0TqpQUFO9xdOj36Zzmo+Y5fOy4azrzMCBX3pa6+O5p0Y4TdTbrvC0/nd
         J6yw==
X-Gm-Message-State: AA+aEWavxLLDIWVIpdjtKDA8W8pjw+PPTE3Xp8TBqEMO7DaUbUAlSZK+
	zHx7NQWXWA5WCeIx1YXR/tsK79352jVFsoYacUU=
X-Google-Smtp-Source: AFSGD/XOYRufOunJDYL5QJdjuXUwvigzlTBukpo39GTWC8R2GjPSDRJWLLGrRtd4GmZ3ieRiqEw9bVSjLjSbweJWnTk=
X-Received: by 2002:a9d:6b95:: with SMTP id b21mr2694468otq.303.1544807966432;
 Fri, 14 Dec 2018 09:19:26 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6830:1504:0:0:0:0 with HTTP; Fri, 14 Dec 2018 09:19:24
 -0800 (PST)
Received: by 2002:a05:6830:1504:0:0:0:0 with HTTP; Fri, 14 Dec 2018 09:19:24
 -0800 (PST)
In-Reply-To: <20181213223737.11793-3-pbonzini@redhat.com>
References: <20181213223737.11793-1-pbonzini@redhat.com> <20181213223737.11793-3-pbonzini@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Fri, 14 Dec 2018 18:19:24 +0100
Message-ID: <CAL1e-=hh26Z9n9Jy+zwaWtajmB996X-woGhp-8+Vytckn7GZQA@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 2/2] avoid TABs in files that only contain a few
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Riku Voipio <riku.voipio@iki.fi>, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Dmitry Fleytman <dmitry.fleytman@gmail.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Fam Zheng <famz@redhat.com>, Richard Henderson <rth@twiddle.net>, 
	=?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
	Viktor Prutyanov <viktor.prutyanov@phystech.edu>, John Snow <jsnow@redhat.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, "open list:Stellaris" <qemu-arm@nongnu.org>, Amit Shah <amit@kernel.org>, 
	David Gibson <david@gibson.dropbear.id.au>, "open list:bochs" <qemu-block@nongnu.org>, 
	Max Reitz <mreitz@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, 
	Laurent Vivier <laurent@vivier.eu>, Igor Mammedov <imammedo@redhat.com>, Jiri Pirko <jiri@resnulli.us>, 
	Stefan Markovic <smarkovic@wavecomp.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org, 
	Kevin Wolf <kwolf@redhat.com>, "open list:X86" <xen-devel@lists.xenproject.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>, Thomas Huth <thuth@redhat.com>, 
	"open list:ppc4xx" <qemu-ppc@nongnu.org>, Stefan Weil <sw@weilnetz.de>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Aleksandar Markovic <amarkovic@wavecomp.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Eduardo Habkost <ehabkost@redhat.com>, Jason Wang <jasowang@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000015e331057cfea21e"
X-TUID: fKjtBw0o1whU

--00000000000015e331057cfea21e
Content-Type: text/plain; charset="UTF-8"

On Dec 13, 2018 11:40 PM, "Paolo Bonzini" <pbonzini@redhat.com> wrote:
>
> Most files that have TABs only contain a handful of them.  Change
> them to spaces so that we don't confuse people.
>
> disas, standard-headers, linux-headers and libdecnumber are imported
> from other projects and probably should be exempted from the check.

For MIPS parts, they are all ok and desireable:

Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>

> Outside those, after this patch the following files still contain both
> 8-space and TAB sequences at the beginning of the line.  Many of them
> have a majority of TABs, or were initially committed with all tabs.
>
>     bsd-user/i386/target_syscall.h
>     bsd-user/x86_64/target_syscall.h
>     crypto/aes.c
>     hw/audio/fmopl.c
>     hw/audio/fmopl.h
>     hw/block/tc58128.c
>     hw/display/cirrus_vga.c
>     hw/display/xenfb.c
>     hw/dma/etraxfs_dma.c
>     hw/intc/sh_intc.c
>     hw/misc/mst_fpga.c
>     hw/net/pcnet.c
>     hw/sh4/sh7750.c
>     hw/timer/m48t59.c
>     hw/timer/sh_timer.c
>     include/crypto/aes.h
>     include/disas/bfd.h
>     include/hw/sh4/sh.h
>     libdecnumber/decNumber.c
>     linux-headers/asm-generic/unistd.h
>     linux-headers/linux/kvm.h
>     linux-user/alpha/target_syscall.h
>     linux-user/arm/nwfpe/double_cpdo.c
>     linux-user/arm/nwfpe/fpa11_cpdt.c
>     linux-user/arm/nwfpe/fpa11_cprt.c
>     linux-user/arm/nwfpe/fpa11.h
>     linux-user/flat.h
>     linux-user/flatload.c
>     linux-user/i386/target_syscall.h
>     linux-user/ppc/target_syscall.h
>     linux-user/sparc/target_syscall.h
>     linux-user/syscall.c
>     linux-user/syscall_defs.h
>     linux-user/x86_64/target_syscall.h
>     slirp/cksum.c
>     slirp/if.c
>     slirp/ip.h
>     slirp/ip_icmp.c
>     slirp/ip_icmp.h
>     slirp/ip_input.c
>     slirp/ip_output.c
>     slirp/mbuf.c
>     slirp/misc.c
>     slirp/sbuf.c
>     slirp/socket.c
>     slirp/socket.h
>     slirp/tcp_input.c
>     slirp/tcpip.h
>     slirp/tcp_output.c
>     slirp/tcp_subr.c
>     slirp/tcp_timer.c
>     slirp/tftp.c
>     slirp/udp.c
>     slirp/udp.h
>     target/cris/cpu.h
>     target/cris/mmu.c
>     target/cris/op_helper.c
>     target/sh4/helper.c
>     target/sh4/op_helper.c
>     target/sh4/translate.c
>     tcg/sparc/tcg-target.inc.c
>     tests/tcg/cris/check_addo.c
>     tests/tcg/cris/check_moveq.c
>     tests/tcg/cris/check_swap.c
>     tests/tcg/multiarch/test-mmap.c
>     ui/vnc-enc-hextile-template.h
>     ui/vnc-enc-zywrle.h
>     util/envlist.c
>     util/readline.c
>
> The following have only TABs:
>
>     bsd-user/i386/target_signal.h
>     bsd-user/sparc64/target_signal.h
>     bsd-user/sparc64/target_syscall.h
>     bsd-user/sparc/target_signal.h
>     bsd-user/sparc/target_syscall.h
>     bsd-user/x86_64/target_signal.h
>     crypto/desrfb.c
>     hw/audio/intel-hda-defs.h
>     hw/core/uboot_image.h
>     hw/sh4/sh7750_regnames.c
>     hw/sh4/sh7750_regs.h
>     include/hw/cris/etraxfs_dma.h
>     linux-user/alpha/termbits.h
>     linux-user/arm/nwfpe/fpopcode.h
>     linux-user/arm/nwfpe/fpsr.h
>     linux-user/arm/syscall_nr.h
>     linux-user/arm/target_signal.h
>     linux-user/cris/target_signal.h
>     linux-user/i386/target_signal.h
>     linux-user/linux_loop.h
>     linux-user/m68k/target_signal.h
>     linux-user/microblaze/target_signal.h
>     linux-user/mips64/target_signal.h
>     linux-user/mips/target_signal.h
>     linux-user/mips/target_syscall.h
>     linux-user/mips/termbits.h
>     linux-user/ppc/target_signal.h
>     linux-user/sh4/target_signal.h
>     linux-user/sh4/termbits.h
>     linux-user/sparc64/target_syscall.h
>     linux-user/sparc/target_signal.h
>     linux-user/x86_64/target_signal.h
>     linux-user/x86_64/termbits.h
>     pc-bios/optionrom/optionrom.h
>     slirp/mbuf.h
>     slirp/misc.h
>     slirp/sbuf.h
>     slirp/tcp.h
>     slirp/tcp_timer.h
>     slirp/tcp_var.h
>     target/i386/svm.h
>     target/sparc/asi.h
>     target/xtensa/core-dc232b/xtensa-modules.inc.c
>     target/xtensa/core-dc233c/xtensa-modules.inc.c
>     target/xtensa/core-de212/core-isa.h
>     target/xtensa/core-de212/xtensa-modules.inc.c
>     target/xtensa/core-fsf/xtensa-modules.inc.c
>     target/xtensa/core-sample_controller/core-isa.h
>     target/xtensa/core-sample_controller/xtensa-modules.inc.c
>     target/xtensa/core-test_kc705_be/core-isa.h
>     target/xtensa/core-test_kc705_be/xtensa-modules.inc.c
>     tests/tcg/cris/check_abs.c
>     tests/tcg/cris/check_addc.c
>     tests/tcg/cris/check_addcm.c
>     tests/tcg/cris/check_addoq.c
>     tests/tcg/cris/check_bound.c
>     tests/tcg/cris/check_ftag.c
>     tests/tcg/cris/check_int64.c
>     tests/tcg/cris/check_lz.c
>     tests/tcg/cris/check_openpf5.c
>     tests/tcg/cris/check_sigalrm.c
>     tests/tcg/cris/crisutils.h
>     tests/tcg/cris/sys.c
>     tests/tcg/i386/test-i386-ssse3.c
>     ui/vgafont.h
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/bochs.c                              | 22 ++---
>  block/file-posix.c                         |  2 +-
>  block/file-win32.c                         |  8 +-
>  block/linux-aio.c                          |  4 +-
>  block/qcow2-cluster.c                      |  2 +-
>  block/vpc.c                                |  2 +-
>  bsd-user/elfload.c                         |  2 +-
>  contrib/elf2dmp/main.c                     |  2 +-
>  hw/alpha/typhoon.c                         | 12 +--
>  hw/arm/stellaris.c                         |  2 +-
>  hw/arm/virt.c                              |  2 +-
>  hw/char/sh_serial.c                        | 18 ++---
>  hw/char/virtio-serial-bus.c                |  2 +-
>  hw/char/xen_console.c                      | 58 ++++++-------
>  hw/core/loader.c                           | 28 +++----
>  hw/display/tc6393xb.c                      |  6 +-
>  hw/display/vga.c                           |  8 +-
>  hw/display/virtio-gpu-3d.c                 |  6 +-
>  hw/dma/pxa2xx_dma.c                        |  4 +-
>  hw/dma/soc_dma.c                           |  2 +-
>  hw/gpio/max7310.c                          |  2 +-
>  hw/i386/xen/xen-hvm.c                      |  4 +-
>  hw/ide/core.c                              | 94 +++++++++++-----------
>  hw/input/lm832x.c                          |  2 +-
>  hw/input/pckbd.c                           |  2 +-
>  hw/input/tsc210x.c                         |  2 +-
>  hw/intc/apic.c                             |  2 +-
>  hw/mips/gt64xxx_pci.c                      |  6 +-
>  hw/mips/mips_r4k.c                         |  4 +-
>  hw/misc/max111x.c                          |  6 +-
>  hw/misc/omap_l4.c                          |  4 +-
>  hw/net/mipsnet.c                           | 16 ++--
>  hw/net/ne2000.c                            | 44 +++++-----
>  hw/net/rocker/rocker.c                     |  2 +-
>  hw/net/virtio-net.c                        |  4 +-
>  hw/net/vmxnet3.c                           |  6 +-
>  hw/pci/msix.c                              |  2 +-
>  hw/pci/pci.c                               | 44 +++++-----
>  hw/pci/pci_bridge.c                        |  2 +-
>  hw/ppc/ppc405_uc.c                         |  2 +-
>  hw/ppc/prep.c                              |  4 +-
>  hw/scsi/lsi53c895a.c                       |  6 +-
>  hw/sh4/r2d.c                               | 16 ++--
>  hw/usb/dev-bluetooth.c                     |  2 +-
>  hw/usb/dev-hid.c                           |  6 +-
>  hw/usb/dev-hub.c                           | 14 ++--
>  hw/xen/xen_devconfig.c                     |  2 +-
>  hw/xenpv/xen_domainbuild.c                 |  8 +-
>  include/elf.h                              | 10 +--
>  include/hw/acpi/acpi.h                     | 14 ++--
>  include/hw/elf_ops.h                       |  2 +-
>  include/hw/ide/internal.h                  |  2 +-
>  include/hw/sh4/sh_intc.h                   | 20 ++---
>  include/hw/xen/io/ring.h                   |  4 +-
>  include/qemu/acl.h                         | 14 ++--
>  include/qemu/iov.h                         |  2 +-
>  include/scsi/constants.h                   |  2 +-
>  include/sysemu/balloon.h                   |  2 +-
>  linux-user/linuxload.c                     | 14 ++--
>  linux-user/main.c                          |  4 +-
>  linux-user/mmap.c                          | 10 +--
>  linux-user/qemu.h                          |  4 +-
>  linux-user/signal.c                        | 16 ++--
>  linux-user/strace.c                        |  4 +-
>  linux-user/uaccess.c                       |  2 +-
>  linux-user/vm86.c                          |  2 +-
>  nbd/client.c                               |  2 +-
>  net/checksum.c                             |  2 +-
>  qtest.c                                    |  4 +-
>  target/alpha/translate.c                   |  2 +-
>  target/cris/helper.c                       |  2 +-
>  target/cris/mmu.h                          | 10 +--
>  target/cris/translate_v10.inc.c            |  2 +-
>  target/i386/translate.c                    | 12 +--
>  target/mips/translate.c                    |  2 +-
>  target/tilegx/translate.c                  |  2 +-
>  tcg/i386/tcg-target.inc.c                  |  4 +-
>  tests/tcg/alpha/test-cond.c                |  4 +-
>  tests/tcg/arm/hello-arm.c                  | 20 ++---
>  tests/tcg/cris/check_glibc_kernelversion.c |  8 +-
>  tests/tcg/cris/check_mmap3.c               |  2 +-
>  tests/tcg/cris/check_openpf1.c             |  2 +-
>  tests/tcg/cris/check_settls1.c             |  2 +-
>  tests/tcg/i386/hello-i386.c                | 14 ++--
>  tests/tcg/mips/hello-mips.c                | 10 +--
>  tests/tcg/multiarch/sha1.c                 | 12 +--
>  tests/vhost-user-test.c                    |  4 +-
>  ui/keymaps.h                               |  4 +-
>  ui/qemu-pixman.c                           |  2 +-
>  ui/vnc-enc-zywrle-template.c               |  4 +-
>  ui/vnc.c                                   |  4 +-
>  util/bitops.c                              |  4 +-
>  util/osdep.c                               |  4 +-
>  util/qemu-sockets.c                        |  4 +-
>  94 files changed, 388 insertions(+), 388 deletions(-)
>
> diff --git a/block/bochs.c b/block/bochs.c
> index 22e7d44211..79f95d3b50 100644
> --- a/block/bochs.c
> +++ b/block/bochs.c
> @@ -85,14 +85,14 @@ static int bochs_probe(const uint8_t *buf, int
buf_size, const char *filename)
>      const struct bochs_header *bochs = (const void *)buf;
>
>      if (buf_size < HEADER_SIZE)
> -       return 0;
> +        return 0;
>
>      if (!strcmp(bochs->magic, HEADER_MAGIC) &&
> -       !strcmp(bochs->type, REDOLOG_TYPE) &&
> -       !strcmp(bochs->subtype, GROWING_TYPE) &&
> -       ((le32_to_cpu(bochs->version) == HEADER_VERSION) ||
> -       (le32_to_cpu(bochs->version) == HEADER_V1)))
> -       return 100;
> +        !strcmp(bochs->type, REDOLOG_TYPE) &&
> +        !strcmp(bochs->subtype, GROWING_TYPE) &&
> +        ((le32_to_cpu(bochs->version) == HEADER_VERSION) ||
> +        (le32_to_cpu(bochs->version) == HEADER_V1)))
> +        return 100;
>
>      return 0;
>  }
> @@ -125,8 +125,8 @@ static int bochs_open(BlockDriverState *bs, QDict
*options, int flags,
>      if (strcmp(bochs.magic, HEADER_MAGIC) ||
>          strcmp(bochs.type, REDOLOG_TYPE) ||
>          strcmp(bochs.subtype, GROWING_TYPE) ||
> -       ((le32_to_cpu(bochs.version) != HEADER_VERSION) &&
> -       (le32_to_cpu(bochs.version) != HEADER_V1))) {
> +        ((le32_to_cpu(bochs.version) != HEADER_VERSION) &&
> +        (le32_to_cpu(bochs.version) != HEADER_V1))) {
>          error_setg(errp, "Image not in Bochs format");
>          return -EINVAL;
>      }
> @@ -158,7 +158,7 @@ static int bochs_open(BlockDriverState *bs, QDict
*options, int flags,
>      }
>
>      for (i = 0; i < s->catalog_size; i++)
> -       le32_to_cpus(&s->catalog_bitmap[i]);
> +        le32_to_cpus(&s->catalog_bitmap[i]);
>
>      s->data_offset = le32_to_cpu(bochs.header) + (s->catalog_size * 4);
>
> @@ -217,7 +217,7 @@ static int64_t seek_to_sector(BlockDriverState *bs,
int64_t sector_num)
>      extent_offset = (offset % s->extent_size) / 512;
>
>      if (s->catalog_bitmap[extent_index] == 0xffffffff) {
> -       return 0; /* not allocated */
> +        return 0; /* not allocated */
>      }
>
>      bitmap_offset = s->data_offset +
> @@ -232,7 +232,7 @@ static int64_t seek_to_sector(BlockDriverState *bs,
int64_t sector_num)
>      }
>
>      if (!((bitmap_entry >> (extent_offset % 8)) & 1)) {
> -       return 0; /* not allocated */
> +        return 0; /* not allocated */
>      }
>
>      return bitmap_offset + (512 * (s->bitmap_blocks + extent_offset));
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 07bbdab953..5c66c3b2bc 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -2117,7 +2117,7 @@ again:
>  #endif
>      if (!fstat(fd, &sb) && (S_IFCHR & sb.st_mode)) {
>  #ifdef DIOCGMEDIASIZE
> -       if (ioctl(fd, DIOCGMEDIASIZE, (off_t *)&size))
> +        if (ioctl(fd, DIOCGMEDIASIZE, (off_t *)&size))
>  #elif defined(DIOCGPART)
>          {
>                  struct partinfo pi;
> diff --git a/block/file-win32.c b/block/file-win32.c
> index f1e2187f3b..6b2d67b239 100644
> --- a/block/file-win32.c
> +++ b/block/file-win32.c
> @@ -176,7 +176,7 @@ int qemu_ftruncate64(int fd, int64_t length)
>      BOOL res;
>
>      if ((GetVersion() & 0x80000000UL) && (length >> 32) != 0)
> -       return -1;
> +        return -1;
>
>      h = (HANDLE)_get_osfhandle(fd);
>
> @@ -184,13 +184,13 @@ int qemu_ftruncate64(int fd, int64_t length)
>      li.HighPart = 0;
>      li.LowPart = SetFilePointer (h, 0, &li.HighPart, FILE_CURRENT);
>      if (li.LowPart == INVALID_SET_FILE_POINTER && GetLastError() !=
NO_ERROR) {
> -       return -1;
> +        return -1;
>      }
>
>      high = length >> 32;
>      dw = SetFilePointer(h, (DWORD) length, &high, FILE_BEGIN);
>      if (dw == INVALID_SET_FILE_POINTER && GetLastError() != NO_ERROR) {
> -       return -1;
> +        return -1;
>      }
>      res = SetEndOfFile(h);
>
> @@ -203,7 +203,7 @@ static int set_sparse(int fd)
>  {
>      DWORD returned;
>      return (int) DeviceIoControl((HANDLE)_get_osfhandle(fd),
FSCTL_SET_SPARSE,
> -                                NULL, 0, NULL, 0, &returned, NULL);
> +                                 NULL, 0, NULL, 0, &returned, NULL);
>  }
>
>  static void raw_detach_aio_context(BlockDriverState *bs)
> diff --git a/block/linux-aio.c b/block/linux-aio.c
> index 217ce60138..d4b61fb251 100644
> --- a/block/linux-aio.c
> +++ b/block/linux-aio.c
> @@ -384,10 +384,10 @@ static int laio_do_submit(int fd, struct
qemu_laiocb *laiocb, off_t offset,
>      switch (type) {
>      case QEMU_AIO_WRITE:
>          io_prep_pwritev(iocbs, fd, qiov->iov, qiov->niov, offset);
> -       break;
> +        break;
>      case QEMU_AIO_READ:
>          io_prep_preadv(iocbs, fd, qiov->iov, qiov->niov, offset);
> -       break;
> +        break;
>      /* Currently Linux kernel does not support other operations */
>      default:
>          fprintf(stderr, "%s: invalid AIO request type 0x%x.\n",
> diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
> index d37fe08b3d..0145ce5218 100644
> --- a/block/qcow2-cluster.c
> +++ b/block/qcow2-cluster.c
> @@ -402,7 +402,7 @@ static int count_contiguous_clusters(int nb_clusters,
int cluster_size,
>          }
>      }
>
> -       return i;
> +        return i;
>  }
>
>  /*
> diff --git a/block/vpc.c b/block/vpc.c
> index 80c5b2b197..d886465b7e 100644
> --- a/block/vpc.c
> +++ b/block/vpc.c
> @@ -187,7 +187,7 @@ static uint32_t vpc_checksum(uint8_t* buf, size_t
size)
>  static int vpc_probe(const uint8_t *buf, int buf_size, const char
*filename)
>  {
>      if (buf_size >= 8 && !strncmp((char *)buf, "conectix", 8))
> -       return 100;
> +        return 100;
>      return 0;
>  }
>
> diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
> index 7cccf3eb8b..32378af7b2 100644
> --- a/bsd-user/elfload.c
> +++ b/bsd-user/elfload.c
> @@ -1367,7 +1367,7 @@ int load_elf_binary(struct linux_binprm * bprm,
struct target_pt_regs * regs,
>      if (!have_guest_base) {
>          /*
>           * Go through ELF program header table and find out whether
> -        * any of the segments drop below our current mmap_min_addr and
> +         * any of the segments drop below our current mmap_min_addr and
>           * in that case set guest_base to corresponding address.
>           */
>          for (i = 0, elf_ppnt = elf_phdata; i < elf_ex.e_phnum;
> diff --git a/contrib/elf2dmp/main.c b/contrib/elf2dmp/main.c
> index 9b93dab662..7115b0d6d0 100644
> --- a/contrib/elf2dmp/main.c
> +++ b/contrib/elf2dmp/main.c
> @@ -296,7 +296,7 @@ static int fill_header(WinDumpHeader64 *hdr, struct
pa_space *ps,
>  static int fill_context(KDDEBUGGER_DATA64 *kdbg,
>          struct va_space *vs, QEMU_Elf *qe)
>  {
> -       int i;
> +        int i;
>      for (i = 0; i < qe->state_nr; i++) {
>          uint64_t Prcb;
>          uint64_t Context;
> diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c
> index 8004afe45b..ad79638ffa 100644
> --- a/hw/alpha/typhoon.c
> +++ b/hw/alpha/typhoon.c
> @@ -657,8 +657,8 @@ static bool window_translate(TyphoonWindow *win,
hwaddr addr,
>          pte_addr |= (addr & (wsm | 0xfe000)) >> 10;
>          return pte_translate(pte_addr, ret);
>      } else {
> -       /* Direct-mapped translation.  */
> -       return make_iommu_tlbe(tba & ~wsm_ext, wsm_ext, ret);
> +        /* Direct-mapped translation.  */
> +        return make_iommu_tlbe(tba & ~wsm_ext, wsm_ext, ret);
>      }
>  }
>
> @@ -693,7 +693,7 @@ static IOMMUTLBEntry
typhoon_translate_iommu(IOMMUMemoryRegion *iommu,
>
>          /* Check the fourth window for DAC disable.  */
>          if ((pchip->win[3].wba & 0x80000000000ull) == 0
> -           && window_translate(&pchip->win[3], addr, &ret)) {
> +            && window_translate(&pchip->win[3], addr, &ret)) {
>              goto success;
>          }
>      } else {
> @@ -704,7 +704,7 @@ static IOMMUTLBEntry
typhoon_translate_iommu(IOMMUMemoryRegion *iommu,
>              if (pchip->ctl & 0x40) {
>                  /* See 10.1.4.4; in particular <39:35> is ignored.  */
>                  make_iommu_tlbe(0, 0x007ffffffffull, &ret);
> -               goto success;
> +                goto success;
>              }
>          }
>
> @@ -716,8 +716,8 @@ static IOMMUTLBEntry
typhoon_translate_iommu(IOMMUMemoryRegion *iommu,
>                  pte_addr  = pchip->win[3].tba & 0x7ffc00000ull;
>                  pte_addr |= (addr & 0xffffe000u) >> 10;
>                  if (pte_translate(pte_addr, &ret)) {
> -                       goto success;
> -               }
> +                        goto success;
> +                }
>              }
>          }
>      }
> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
> index 6c69ce79b2..442529cc65 100644
> --- a/hw/arm/stellaris.c
> +++ b/hw/arm/stellaris.c
> @@ -131,7 +131,7 @@ static void gptm_tick(void *opaque)
>          s->state |= 1;
>          if ((s->control & 0x20)) {
>              /* Output trigger.  */
> -           qemu_irq_pulse(s->trigger);
> +            qemu_irq_pulse(s->trigger);
>          }
>          if (s->mode[0] & 1) {
>              /* One-shot.  */
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 17f1b49d11..ad6fa8e3c6 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1854,7 +1854,7 @@ static const TypeInfo virt_machine_info = {
>      .instance_size = sizeof(VirtMachineState),
>      .class_size    = sizeof(VirtMachineClass),
>      .class_init    = virt_machine_class_init,
> -       .instance_init = virt_instance_init,
> +        .instance_init = virt_instance_init,
>      .interfaces = (InterfaceInfo[]) {
>           { TYPE_HOTPLUG_HANDLER },
>           { }
> diff --git a/hw/char/sh_serial.c b/hw/char/sh_serial.c
> index 12831561a6..67740b7ee6 100644
> --- a/hw/char/sh_serial.c
> +++ b/hw/char/sh_serial.c
> @@ -90,7 +90,7 @@ static void sh_serial_write(void *opaque, hwaddr offs,
>
>  #ifdef DEBUG_SERIAL
>      printf("sh_serial: write offs=0x%02x val=0x%02x\n",
> -          offs, val);
> +           offs, val);
>  #endif
>      switch(offs) {
>      case 0x00: /* SMR */
> @@ -98,17 +98,17 @@ static void sh_serial_write(void *opaque, hwaddr offs,
>          return;
>      case 0x04: /* BRR */
>          s->brr = val;
> -       return;
> +        return;
>      case 0x08: /* SCR */
>          /* TODO : For SH7751, SCIF mask should be 0xfb. */
>          s->scr = val & ((s->feat & SH_SERIAL_FEAT_SCIF) ? 0xfa : 0xff);
>          if (!(val & (1 << 5)))
>              s->flags |= SH_SERIAL_FLAG_TEND;
>          if ((s->feat & SH_SERIAL_FEAT_SCIF) && s->txi) {
> -           qemu_set_irq(s->txi, val & (1 << 7));
> +            qemu_set_irq(s->txi, val & (1 << 7));
>          }
>          if (!(val & (1 << 6))) {
> -           qemu_set_irq(s->rxi, 0);
> +            qemu_set_irq(s->rxi, 0);
>          }
>          return;
>      case 0x0c: /* FTDR / TDR */
> @@ -117,9 +117,9 @@ static void sh_serial_write(void *opaque, hwaddr offs,
>              /* XXX this blocks entire thread. Rewrite to use
>               * qemu_chr_fe_write and background I/O callbacks */
>              qemu_chr_fe_write_all(&s->chr, &ch, 1);
> -       }
> -       s->dr = val;
> -       s->flags &= ~SH_SERIAL_FLAG_TDE;
> +        }
> +        s->dr = val;
> +        s->flags &= ~SH_SERIAL_FLAG_TDE;
>          return;
>  #if 0
>      case 0x14: /* FRDR / RDR */
> @@ -210,7 +210,7 @@ static uint64_t sh_serial_read(void *opaque, hwaddr
offs,
>          break;
>      case 0x04:
>          ret = s->brr;
> -       break;
> +        break;
>      case 0x08:
>          ret = s->scr;
>          break;
> @@ -288,7 +288,7 @@ static uint64_t sh_serial_read(void *opaque, hwaddr
offs,
>      }
>  #ifdef DEBUG_SERIAL
>      printf("sh_serial: read offs=0x%02x val=0x%x\n",
> -          offs, ret);
> +           offs, ret);
>  #endif
>
>      if (ret & ~((1 << 16) - 1)) {
> diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
> index 04e3ebe352..d76351d748 100644
> --- a/hw/char/virtio-serial-bus.c
> +++ b/hw/char/virtio-serial-bus.c
> @@ -696,7 +696,7 @@ static void virtio_serial_save_device(VirtIODevice
*vdev, QEMUFile *f)
>          qemu_put_byte(f, port->guest_connected);
>          qemu_put_byte(f, port->host_connected);
>
> -       elem_popped = 0;
> +        elem_popped = 0;
>          if (port->elem) {
>              elem_popped = 1;
>          }
> diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
> index 44f7236382..b1a1e66d5a 100644
> --- a/hw/char/xen_console.c
> +++ b/hw/char/xen_console.c
> @@ -60,34 +60,34 @@ static void buffer_append(struct XenConsole *con)
>
>      size = prod - cons;
>      if ((size == 0) || (size > sizeof(intf->out)))
> -       return;
> +        return;
>
>      if ((buffer->capacity - buffer->size) < size) {
> -       buffer->capacity += (size + 1024);
> -       buffer->data = g_realloc(buffer->data, buffer->capacity);
> +        buffer->capacity += (size + 1024);
> +        buffer->data = g_realloc(buffer->data, buffer->capacity);
>      }
>
>      while (cons != prod)
> -       buffer->data[buffer->size++] = intf->out[
> -           MASK_XENCONS_IDX(cons++, intf->out)];
> +        buffer->data[buffer->size++] = intf->out[
> +            MASK_XENCONS_IDX(cons++, intf->out)];
>
>      xen_mb();
>      intf->out_cons = cons;
>      xen_pv_send_notify(&con->xendev);
>
>      if (buffer->max_capacity &&
> -       buffer->size > buffer->max_capacity) {
> -       /* Discard the middle of the data. */
> +        buffer->size > buffer->max_capacity) {
> +        /* Discard the middle of the data. */
>
> -       size_t over = buffer->size - buffer->max_capacity;
> -       uint8_t *maxpos = buffer->data + buffer->max_capacity;
> +        size_t over = buffer->size - buffer->max_capacity;
> +        uint8_t *maxpos = buffer->data + buffer->max_capacity;
>
> -       memmove(maxpos - over, maxpos, over);
> -       buffer->data = g_realloc(buffer->data, buffer->max_capacity);
> -       buffer->size = buffer->capacity = buffer->max_capacity;
> +        memmove(maxpos - over, maxpos, over);
> +        buffer->data = g_realloc(buffer->data, buffer->max_capacity);
> +        buffer->size = buffer->capacity = buffer->max_capacity;
>
> -       if (buffer->consumed > buffer->max_capacity - over)
> -           buffer->consumed = buffer->max_capacity - over;
> +        if (buffer->consumed > buffer->max_capacity - over)
> +            buffer->consumed = buffer->max_capacity - over;
>      }
>  }
>
> @@ -95,8 +95,8 @@ static void buffer_advance(struct buffer *buffer,
size_t len)
>  {
>      buffer->consumed += len;
>      if (buffer->consumed == buffer->size) {
> -       buffer->consumed = 0;
> -       buffer->size = 0;
> +        buffer->consumed = 0;
> +        buffer->size = 0;
>      }
>  }
>
> @@ -111,7 +111,7 @@ static int ring_free_bytes(struct XenConsole *con)
>
>      space = prod - cons;
>      if (space > sizeof(intf->in))
> -       return 0; /* ring is screwed: ignore it */
> +        return 0; /* ring is screwed: ignore it */
>
>      return (sizeof(intf->in) - space);
>  }
> @@ -132,12 +132,12 @@ static void xencons_receive(void *opaque, const
uint8_t *buf, int len)
>      max = ring_free_bytes(con);
>      /* The can_receive() func limits this, but check again anyway */
>      if (max < len)
> -       len = max;
> +        len = max;
>
>      prod = intf->in_prod;
>      for (i = 0; i < len; i++) {
> -       intf->in[MASK_XENCONS_IDX(prod++, intf->in)] =
> -           buf[i];
> +        intf->in[MASK_XENCONS_IDX(prod++, intf->in)] =
> +            buf[i];
>      }
>      xen_wmb();
>      intf->in_prod = prod;
> @@ -228,11 +228,11 @@ static int con_initialise(struct XenDevice *xendev)
>      int limit;
>
>      if (xenstore_read_int(con->console, "ring-ref", &con->ring_ref) ==
-1)
> -       return -1;
> +        return -1;
>      if (xenstore_read_int(con->console, "port",
&con->xendev.remote_port) == -1)
> -       return -1;
> +        return -1;
>      if (xenstore_read_int(con->console, "limit", &limit) == 0)
> -       con->buffer.max_capacity = limit;
> +        con->buffer.max_capacity = limit;
>
>      if (!xendev->dev) {
>          xen_pfn_t mfn = con->ring_ref;
> @@ -244,7 +244,7 @@ static int con_initialise(struct XenDevice *xendev)
>                                            PROT_READ | PROT_WRITE);
>      }
>      if (!con->sring)
> -       return -1;
> +        return -1;
>
>      xen_be_bind_evtchn(&con->xendev);
>      qemu_chr_fe_set_handlers(&con->chr, xencons_can_receive,
> @@ -252,10 +252,10 @@ static int con_initialise(struct XenDevice *xendev)
>
>      xen_pv_printf(xendev, 1,
>                    "ring mfn %d, remote port %d, local port %d, limit
%zd\n",
> -                 con->ring_ref,
> -                 con->xendev.remote_port,
> -                 con->xendev.local_port,
> -                 con->buffer.max_capacity);
> +                  con->ring_ref,
> +                  con->xendev.remote_port,
> +                  con->xendev.local_port,
> +                  con->buffer.max_capacity);
>      return 0;
>  }
>
> @@ -282,7 +282,7 @@ static void con_event(struct XenDevice *xendev)
>
>      buffer_append(con);
>      if (con->buffer.size - con->buffer.consumed)
> -       xencons_send(con);
> +        xencons_send(con);
>  }
>
>  /* --------------------------------------------------------------------
*/
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index aa0b3fc867..0b7762a062 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -269,26 +269,26 @@ int load_aout(const char *filename, hwaddr addr,
int max_sz,
>      case OMAGIC:
>          if (e.a_text + e.a_data > max_sz)
>              goto fail;
> -       lseek(fd, N_TXTOFF(e), SEEK_SET);
> -       size = read_targphys(filename, fd, addr, e.a_text + e.a_data);
> -       if (size < 0)
> -           goto fail;
> -       break;
> +        lseek(fd, N_TXTOFF(e), SEEK_SET);
> +        size = read_targphys(filename, fd, addr, e.a_text + e.a_data);
> +        if (size < 0)
> +            goto fail;
> +        break;
>      case NMAGIC:
>          if (N_DATADDR(e, target_page_size) + e.a_data > max_sz)
>              goto fail;
> -       lseek(fd, N_TXTOFF(e), SEEK_SET);
> -       size = read_targphys(filename, fd, addr, e.a_text);
> -       if (size < 0)
> -           goto fail;
> +        lseek(fd, N_TXTOFF(e), SEEK_SET);
> +        size = read_targphys(filename, fd, addr, e.a_text);
> +        if (size < 0)
> +            goto fail;
>          ret = read_targphys(filename, fd, addr + N_DATADDR(e,
target_page_size),
>                              e.a_data);
> -       if (ret < 0)
> -           goto fail;
> -       size += ret;
> -       break;
> +        if (ret < 0)
> +            goto fail;
> +        size += ret;
> +        break;
>      default:
> -       goto fail;
> +        goto fail;
>      }
>      close(fd);
>      return size;
> diff --git a/hw/display/tc6393xb.c b/hw/display/tc6393xb.c
> index 3360be6f84..e1b1e302f2 100644
> --- a/hw/display/tc6393xb.c
> +++ b/hw/display/tc6393xb.c
> @@ -319,7 +319,7 @@ static void tc6393xb_scr_writeb(TC6393xbState *s,
hwaddr addr, uint32_t value)
>          SCR_REG_B(DEBUG);
>      }
>      fprintf(stderr, "tc6393xb_scr: unhandled write at %08x: %02x\n",
> -                                       (uint32_t) addr, value & 0xff);
> +                                        (uint32_t) addr, value & 0xff);
>  }
>  #undef SCR_REG_B
>  #undef SCR_REG_W
> @@ -358,7 +358,7 @@ static void tc6393xb_nand_cfg_writeb(TC6393xbState
*s, hwaddr addr, uint32_t val
>              return;
>      }
>      fprintf(stderr, "tc6393xb_nand_cfg: unhandled write at %08x: %02x\n",
> -                                       (uint32_t) addr, value & 0xff);
> +                                        (uint32_t) addr, value & 0xff);
>  }
>
>  static uint32_t tc6393xb_nand_readb(TC6393xbState *s, hwaddr addr) {
> @@ -421,7 +421,7 @@ static void tc6393xb_nand_writeb(TC6393xbState *s,
hwaddr addr, uint32_t value)
>              return;
>      }
>      fprintf(stderr, "tc6393xb_nand: unhandled write at %08x: %02x\n",
> -                                       (uint32_t) addr, value & 0xff);
> +                                        (uint32_t) addr, value & 0xff);
>  }
>
>  #define BITS 8
> diff --git a/hw/display/vga.c b/hw/display/vga.c
> index 3ba3f6853c..910a23c12e 100644
> --- a/hw/display/vga.c
> +++ b/hw/display/vga.c
> @@ -85,10 +85,10 @@ const uint8_t gr_mask[16] = {
>
>  #define cbswap_32(__x) \
>  ((uint32_t)( \
> -               (((uint32_t)(__x) & (uint32_t)0x000000ffUL) << 24) | \
> -               (((uint32_t)(__x) & (uint32_t)0x0000ff00UL) <<  8) | \
> -               (((uint32_t)(__x) & (uint32_t)0x00ff0000UL) >>  8) | \
> -               (((uint32_t)(__x) & (uint32_t)0xff000000UL) >> 24) ))
> +                (((uint32_t)(__x) & (uint32_t)0x000000ffUL) << 24) | \
> +                (((uint32_t)(__x) & (uint32_t)0x0000ff00UL) <<  8) | \
> +                (((uint32_t)(__x) & (uint32_t)0x00ff0000UL) >>  8) | \
> +                (((uint32_t)(__x) & (uint32_t)0xff000000UL) >> 24) ))
>
>  #ifdef HOST_WORDS_BIGENDIAN
>  #define PAT(x) cbswap_32(x)
> diff --git a/hw/display/virtio-gpu-3d.c b/hw/display/virtio-gpu-3d.c
> index 55d76405a9..bc6e99c943 100644
> --- a/hw/display/virtio-gpu-3d.c
> +++ b/hw/display/virtio-gpu-3d.c
> @@ -498,9 +498,9 @@ static void virgl_write_fence(void *opaque, uint32_t
fence)
>
>      QTAILQ_FOREACH_SAFE(cmd, &g->fenceq, next, tmp) {
>          /*
> -        * the guest can end up emitting fences out of order
> -        * so we should check all fenced cmds not just the first one.
> -        */
> +         * the guest can end up emitting fences out of order
> +         * so we should check all fenced cmds not just the first one.
> +         */
>          if (cmd->cmd_hdr.fence_id > fence) {
>              continue;
>          }
> diff --git a/hw/dma/pxa2xx_dma.c b/hw/dma/pxa2xx_dma.c
> index f4eb26cf17..d498de8ffe 100644
> --- a/hw/dma/pxa2xx_dma.c
> +++ b/hw/dma/pxa2xx_dma.c
> @@ -228,7 +228,7 @@ static void pxa2xx_dma_run(PXA2xxDMAState *s)
>                                          !(ch->state & DCSR_NODESCFETCH))
>                              pxa2xx_dma_descriptor_fetch(s, c);
>                          break;
> -                   }
> +                    }
>                  }
>
>                  ch->cmd = (ch->cmd & ~DCMD_LEN) | length;
> @@ -283,7 +283,7 @@ static uint64_t pxa2xx_dma_read(void *opaque, hwaddr
offset,
>
>      case DCSR0 ... DCSR31:
>          channel = offset >> 2;
> -       if (s->chan[channel].request)
> +        if (s->chan[channel].request)
>              return s->chan[channel].state | DCSR_REQPEND;
>          return s->chan[channel].state;
>
> diff --git a/hw/dma/soc_dma.c b/hw/dma/soc_dma.c
> index 45516241c6..58502721fa 100644
> --- a/hw/dma/soc_dma.c
> +++ b/hw/dma/soc_dma.c
> @@ -345,7 +345,7 @@ void soc_dma_port_add_mem(struct soc_dma_s *soc,
uint8_t *phys_base,
>              while (entry < dma->memmap + dma->memmap_size &&
>                              entry->addr <= virt_base)
>                  entry ++;
> -       }
> +        }
>
>          memmove(entry + 1, entry,
>                          (uint8_t *) (dma->memmap + dma->memmap_size ++) -
> diff --git a/hw/gpio/max7310.c b/hw/gpio/max7310.c
> index a560e3afd2..1a2478b5a9 100644
> --- a/hw/gpio/max7310.c
> +++ b/hw/gpio/max7310.c
> @@ -118,7 +118,7 @@ static int max7310_tx(I2CSlave *i2c, uint8_t data)
>          break;
>
>      case 0x00: /* Input port - ignore writes */
> -       break;
> +        break;
>      default:
>  #ifdef VERBOSE
>          printf("%s: unknown register %02x\n", __func__, s->command);
> diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
> index 935a3676c8..bf4812cfc9 100644
> --- a/hw/i386/xen/xen-hvm.c
> +++ b/hw/i386/xen/xen-hvm.c
> @@ -570,7 +570,7 @@ static void xen_io_del(MemoryListener *listener,
>  }
>
>  static void xen_device_realize(DeviceListener *listener,
> -                              DeviceState *dev)
> +                               DeviceState *dev)
>  {
>      XenIOState *state = container_of(listener, XenIOState,
device_listener);
>
> @@ -588,7 +588,7 @@ static void xen_device_realize(DeviceListener
*listener,
>  }
>
>  static void xen_device_unrealize(DeviceListener *listener,
> -                                DeviceState *dev)
> +                                 DeviceState *dev)
>  {
>      XenIOState *state = container_of(listener, XenIOState,
device_listener);
>
> diff --git a/hw/ide/core.c b/hw/ide/core.c
> index 04e22e751d..c3d779db6e 100644
> --- a/hw/ide/core.c
> +++ b/hw/ide/core.c
> @@ -575,16 +575,16 @@ int64_t ide_get_sector(IDEState *s)
>      int64_t sector_num;
>      if (s->select & 0x40) {
>          /* lba */
> -       if (!s->lba48) {
> -           sector_num = ((s->select & 0x0f) << 24) | (s->hcyl << 16) |
> -               (s->lcyl << 8) | s->sector;
> -       } else {
> -           sector_num = ((int64_t)s->hob_hcyl << 40) |
> -               ((int64_t) s->hob_lcyl << 32) |
> -               ((int64_t) s->hob_sector << 24) |
> -               ((int64_t) s->hcyl << 16) |
> -               ((int64_t) s->lcyl << 8) | s->sector;
> -       }
> +        if (!s->lba48) {
> +            sector_num = ((s->select & 0x0f) << 24) | (s->hcyl << 16) |
> +                (s->lcyl << 8) | s->sector;
> +        } else {
> +            sector_num = ((int64_t)s->hob_hcyl << 40) |
> +                ((int64_t) s->hob_lcyl << 32) |
> +                ((int64_t) s->hob_sector << 24) |
> +                ((int64_t) s->hcyl << 16) |
> +                ((int64_t) s->lcyl << 8) | s->sector;
> +        }
>      } else {
>          sector_num = ((s->hcyl << 8) | s->lcyl) * s->heads * s->sectors +
>              (s->select & 0x0f) * s->sectors + (s->sector - 1);
> @@ -596,19 +596,19 @@ void ide_set_sector(IDEState *s, int64_t sector_num)
>  {
>      unsigned int cyl, r;
>      if (s->select & 0x40) {
> -       if (!s->lba48) {
> +        if (!s->lba48) {
>              s->select = (s->select & 0xf0) | (sector_num >> 24);
>              s->hcyl = (sector_num >> 16);
>              s->lcyl = (sector_num >> 8);
>              s->sector = (sector_num);
> -       } else {
> -           s->sector = sector_num;
> -           s->lcyl = sector_num >> 8;
> -           s->hcyl = sector_num >> 16;
> -           s->hob_sector = sector_num >> 24;
> -           s->hob_lcyl = sector_num >> 32;
> -           s->hob_hcyl = sector_num >> 40;
> -       }
> +        } else {
> +            s->sector = sector_num;
> +            s->lcyl = sector_num >> 8;
> +            s->hcyl = sector_num >> 16;
> +            s->hob_sector = sector_num >> 24;
> +            s->hob_lcyl = sector_num >> 32;
> +            s->hob_hcyl = sector_num >> 40;
> +        }
>      } else {
>          cyl = sector_num / (s->heads * s->sectors);
>          r = sector_num % (s->heads * s->sectors);
> @@ -1188,17 +1188,17 @@ static void ide_cmd_lba48_transform(IDEState *s,
int lba48)
>       * full sector count in ->nsector and ignore ->hob_nsector from now
>       */
>      if (!s->lba48) {
> -       if (!s->nsector)
> -           s->nsector = 256;
> +        if (!s->nsector)
> +            s->nsector = 256;
>      } else {
> -       if (!s->nsector && !s->hob_nsector)
> -           s->nsector = 65536;
> -       else {
> -           int lo = s->nsector;
> -           int hi = s->hob_nsector;
> +        if (!s->nsector && !s->hob_nsector)
> +            s->nsector = 65536;
> +        else {
> +            int lo = s->nsector;
> +            int hi = s->hob_nsector;
>
> -           s->nsector = (hi << 8) | lo;
> -       }
> +            s->nsector = (hi << 8) | lo;
> +        }
>      }
>  }
>
> @@ -1258,35 +1258,35 @@ void ide_ioport_write(void *opaque, uint32_t
addr, uint32_t val)
>          bus->ifs[1].feature = val;
>          break;
>      case ATA_IOPORT_WR_SECTOR_COUNT:
> -       ide_clear_hob(bus);
> -       bus->ifs[0].hob_nsector = bus->ifs[0].nsector;
> -       bus->ifs[1].hob_nsector = bus->ifs[1].nsector;
> +        ide_clear_hob(bus);
> +        bus->ifs[0].hob_nsector = bus->ifs[0].nsector;
> +        bus->ifs[1].hob_nsector = bus->ifs[1].nsector;
>          bus->ifs[0].nsector = val;
>          bus->ifs[1].nsector = val;
>          break;
>      case ATA_IOPORT_WR_SECTOR_NUMBER:
> -       ide_clear_hob(bus);
> -       bus->ifs[0].hob_sector = bus->ifs[0].sector;
> -       bus->ifs[1].hob_sector = bus->ifs[1].sector;
> +        ide_clear_hob(bus);
> +        bus->ifs[0].hob_sector = bus->ifs[0].sector;
> +        bus->ifs[1].hob_sector = bus->ifs[1].sector;
>          bus->ifs[0].sector = val;
>          bus->ifs[1].sector = val;
>          break;
>      case ATA_IOPORT_WR_CYLINDER_LOW:
> -       ide_clear_hob(bus);
> -       bus->ifs[0].hob_lcyl = bus->ifs[0].lcyl;
> -       bus->ifs[1].hob_lcyl = bus->ifs[1].lcyl;
> +        ide_clear_hob(bus);
> +        bus->ifs[0].hob_lcyl = bus->ifs[0].lcyl;
> +        bus->ifs[1].hob_lcyl = bus->ifs[1].lcyl;
>          bus->ifs[0].lcyl = val;
>          bus->ifs[1].lcyl = val;
>          break;
>      case ATA_IOPORT_WR_CYLINDER_HIGH:
> -       ide_clear_hob(bus);
> -       bus->ifs[0].hob_hcyl = bus->ifs[0].hcyl;
> -       bus->ifs[1].hob_hcyl = bus->ifs[1].hcyl;
> +        ide_clear_hob(bus);
> +        bus->ifs[0].hob_hcyl = bus->ifs[0].hcyl;
> +        bus->ifs[1].hob_hcyl = bus->ifs[1].hcyl;
>          bus->ifs[0].hcyl = val;
>          bus->ifs[1].hcyl = val;
>          break;
>      case ATA_IOPORT_WR_DEVICE_HEAD:
> -       /* FIXME: HOB readback uses bit 7 */
> +        /* FIXME: HOB readback uses bit 7 */
>          bus->ifs[0].select = (val & ~0x10) | 0xa0;
>          bus->ifs[1].select = (val | 0x10) | 0xa0;
>          /* select drive */
> @@ -2146,7 +2146,7 @@ uint32_t ide_ioport_read(void *opaque, uint32_t
addr)
>          } else if (!hob) {
>              ret = s->error;
>          } else {
> -           ret = s->hob_feature;
> +            ret = s->hob_feature;
>          }
>          break;
>      case ATA_IOPORT_RR_SECTOR_COUNT:
> @@ -2155,7 +2155,7 @@ uint32_t ide_ioport_read(void *opaque, uint32_t
addr)
>          } else if (!hob) {
>              ret = s->nsector & 0xff;
>          } else {
> -           ret = s->hob_nsector;
> +            ret = s->hob_nsector;
>          }
>          break;
>      case ATA_IOPORT_RR_SECTOR_NUMBER:
> @@ -2164,7 +2164,7 @@ uint32_t ide_ioport_read(void *opaque, uint32_t
addr)
>          } else if (!hob) {
>              ret = s->sector;
>          } else {
> -           ret = s->hob_sector;
> +            ret = s->hob_sector;
>          }
>          break;
>      case ATA_IOPORT_RR_CYLINDER_LOW:
> @@ -2173,7 +2173,7 @@ uint32_t ide_ioport_read(void *opaque, uint32_t
addr)
>          } else if (!hob) {
>              ret = s->lcyl;
>          } else {
> -           ret = s->hob_lcyl;
> +            ret = s->hob_lcyl;
>          }
>          break;
>      case ATA_IOPORT_RR_CYLINDER_HIGH:
> @@ -2182,7 +2182,7 @@ uint32_t ide_ioport_read(void *opaque, uint32_t
addr)
>          } else if (!hob) {
>              ret = s->hcyl;
>          } else {
> -           ret = s->hob_hcyl;
> +            ret = s->hob_hcyl;
>          }
>          break;
>      case ATA_IOPORT_RR_DEVICE_HEAD:
> @@ -2847,7 +2847,7 @@ static const VMStateDescription
vmstate_ide_drive_pio_state = {
>      .fields = (VMStateField[]) {
>          VMSTATE_INT32(req_nb_sectors, IDEState),
>          VMSTATE_VARRAY_INT32(io_buffer, IDEState, io_buffer_total_len, 1,
> -                            vmstate_info_uint8, uint8_t),
> +                             vmstate_info_uint8, uint8_t),
>          VMSTATE_INT32(cur_io_buffer_offset, IDEState),
>          VMSTATE_INT32(cur_io_buffer_len, IDEState),
>          VMSTATE_UINT8(end_transfer_fn_idx, IDEState),
> diff --git a/hw/input/lm832x.c b/hw/input/lm832x.c
> index 74da30d9ca..cffbf586d4 100644
> --- a/hw/input/lm832x.c
> +++ b/hw/input/lm832x.c
> @@ -66,7 +66,7 @@ typedef struct {
>
>      struct {
>          uint16_t file[256];
> -       uint8_t faddr;
> +        uint8_t faddr;
>          uint8_t addr[3];
>          QEMUTimer *tm[3];
>      } pwm;
> diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
> index 07c8801387..3e66713b47 100644
> --- a/hw/input/pckbd.c
> +++ b/hw/input/pckbd.c
> @@ -55,7 +55,7 @@
>  #define KBD_CCMD_WRITE_OUTPORT 0xD1    /* write output port */
>  #define KBD_CCMD_WRITE_OBUF    0xD2
>  #define KBD_CCMD_WRITE_AUX_OBUF        0xD3    /* Write to output buffer
as if
> -                                          initiated by the auxiliary
device */
> +                                           initiated by the auxiliary
device */
>  #define KBD_CCMD_WRITE_MOUSE   0xD4    /* Write the following byte to
the mouse */
>  #define KBD_CCMD_DISABLE_A20    0xDD    /* HP vectra only ? */
>  #define KBD_CCMD_ENABLE_A20     0xDF    /* HP vectra only ? */
> diff --git a/hw/input/tsc210x.c b/hw/input/tsc210x.c
> index 1cad57f644..ded0db9351 100644
> --- a/hw/input/tsc210x.c
> +++ b/hw/input/tsc210x.c
> @@ -577,7 +577,7 @@ static void tsc2102_control_register_write(
>      case 0x01: /* Status / Keypad Control */
>          if ((s->model & 0xff00) == 0x2100)
>              s->pin_func = value >> 14;
> -       else {
> +        else {
>              s->kb.scan = (value >> 14) & 1;
>              s->kb.debounce = (value >> 11) & 7;
>              if (s->kb.intr && s->kb.scan) {
> diff --git a/hw/intc/apic.c b/hw/intc/apic.c
> index 97ffdd820f..4e8290c4e0 100644
> --- a/hw/intc/apic.c
> +++ b/hw/intc/apic.c
> @@ -441,7 +441,7 @@ static int apic_find_dest(uint8_t dest)
>
>      for (i = 0; i < MAX_APICS; i++) {
>          apic = local_apics[i];
> -       if (apic && apic->id == dest)
> +        if (apic && apic->id == dest)
>              return i;
>          if (!apic)
>              break;
> diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
> index 1cd8aac658..f707e59c7a 100644
> --- a/hw/mips/gt64xxx_pci.c
> +++ b/hw/mips/gt64xxx_pci.c
> @@ -395,7 +395,7 @@ static void gt64120_writel (void *opaque, hwaddr addr,
>          s->regs[GT_CPU] = val;
>          break;
>      case GT_MULTI:
> -       /* Read-only register as only one GT64xxx is present on the CPU
bus */
> +        /* Read-only register as only one GT64xxx is present on the CPU
bus */
>          break;
>
>      /* CPU Address Decode */
> @@ -457,13 +457,13 @@ static void gt64120_writel (void *opaque, hwaddr
addr,
>      case GT_CPUERR_DATALO:
>      case GT_CPUERR_DATAHI:
>      case GT_CPUERR_PARITY:
> -       /* Read-only registers, do nothing */
> +        /* Read-only registers, do nothing */
>          break;
>
>      /* CPU Sync Barrier */
>      case GT_PCI0SYNC:
>      case GT_PCI1SYNC:
> -       /* Read-only registers, do nothing */
> +        /* Read-only registers, do nothing */
>          break;
>
>      /* SDRAM and Device Address Decode */
> diff --git a/hw/mips/mips_r4k.c b/hw/mips/mips_r4k.c
> index 3e852e98cf..1922407394 100644
> --- a/hw/mips/mips_r4k.c
> +++ b/hw/mips/mips_r4k.c
> @@ -239,7 +239,7 @@ void mips_r4k_init(MachineState *machine)
>                                     sector_len, mips_rom / sector_len,
>                                     4, 0, 0, 0, 0, be)) {
>              fprintf(stderr, "qemu: Error registering flash memory.\n");
> -       }
> +        }
>      } else if (!qtest_enabled()) {
>          /* not fatal */
>          warn_report("could not load MIPS bios '%s'", bios_name);
> @@ -285,7 +285,7 @@ void mips_r4k_init(MachineState *machine)
>      for(i = 0; i < MAX_IDE_BUS; i++)
>          isa_ide_init(isa_bus, ide_iobase[i], ide_iobase2[i], ide_irq[i],
>                       hd[MAX_IDE_DEVS * i],
> -                    hd[MAX_IDE_DEVS * i + 1]);
> +                     hd[MAX_IDE_DEVS * i + 1]);
>
>      isa_create_simple(isa_bus, TYPE_I8042);
>  }
> diff --git a/hw/misc/max111x.c b/hw/misc/max111x.c
> index 6dbdc03677..ac6d35a81d 100644
> --- a/hw/misc/max111x.c
> +++ b/hw/misc/max111x.c
> @@ -43,9 +43,9 @@ typedef struct {
>  #define CB_START       (1 << 7)
>
>  #define CHANNEL_NUM(v, b0, b1, b2)     \
> -                       ((((v) >> (2 + (b0))) & 4) |    \
> -                        (((v) >> (3 + (b1))) & 2) |    \
> -                        (((v) >> (4 + (b2))) & 1))
> +                        ((((v) >> (2 + (b0))) & 4) |   \
> +                         (((v) >> (3 + (b1))) & 2) |   \
> +                         (((v) >> (4 + (b2))) & 1))
>
>  static uint32_t max111x_read(MAX111xState *s)
>  {
> diff --git a/hw/misc/omap_l4.c b/hw/misc/omap_l4.c
> index 96fc057b4e..c217728c78 100644
> --- a/hw/misc/omap_l4.c
> +++ b/hw/misc/omap_l4.c
> @@ -112,8 +112,8 @@ static const MemoryRegionOps omap_l4ta_ops = {
>
>  struct omap_target_agent_s *omap_l4ta_get(struct omap_l4_s *bus,
>          const struct omap_l4_region_s *regions,
> -       const struct omap_l4_agent_info_s *agents,
> -       int cs)
> +        const struct omap_l4_agent_info_s *agents,
> +        int cs)
>  {
>      int i;
>      struct omap_target_agent_s *ta = NULL;
> diff --git a/hw/net/mipsnet.c b/hw/net/mipsnet.c
> index 03b3104278..5ec13105df 100644
> --- a/hw/net/mipsnet.c
> +++ b/hw/net/mipsnet.c
> @@ -112,27 +112,27 @@ static uint64_t mipsnet_ioport_read(void *opaque,
hwaddr addr,
>      addr &= 0x3f;
>      switch (addr) {
>      case MIPSNET_DEV_ID:
> -       ret = be32_to_cpu(0x4d495053);          /* MIPS */
> +        ret = be32_to_cpu(0x4d495053);         /* MIPS */
>          break;
>      case MIPSNET_DEV_ID + 4:
> -       ret = be32_to_cpu(0x4e455430);          /* NET0 */
> +        ret = be32_to_cpu(0x4e455430);         /* NET0 */
>          break;
>      case MIPSNET_BUSY:
> -       ret = s->busy;
> +        ret = s->busy;
>          break;
>      case MIPSNET_RX_DATA_COUNT:
> -       ret = s->rx_count;
> +        ret = s->rx_count;
>          break;
>      case MIPSNET_TX_DATA_COUNT:
> -       ret = s->tx_count;
> +        ret = s->tx_count;
>          break;
>      case MIPSNET_INT_CTL:
> -       ret = s->intctl;
> +        ret = s->intctl;
>          s->intctl &= ~MIPSNET_INTCTL_TESTBIT;
>          break;
>      case MIPSNET_INTERRUPT_INFO:
>          /* XXX: This seems to be a per-VPE interrupt number. */
> -       ret = 0;
> +        ret = 0;
>          break;
>      case MIPSNET_RX_DATA_BUFFER:
>          if (s->rx_count) {
> @@ -161,7 +161,7 @@ static void mipsnet_ioport_write(void *opaque, hwaddr
addr,
>      trace_mipsnet_write(addr, val);
>      switch (addr) {
>      case MIPSNET_TX_DATA_COUNT:
> -       s->tx_count = (val <= MAX_ETH_FRAME_SIZE) ? val : 0;
> +        s->tx_count = (val <= MAX_ETH_FRAME_SIZE) ? val : 0;
>          s->tx_written = 0;
>          break;
>      case MIPSNET_INT_CTL:
> diff --git a/hw/net/ne2000.c b/hw/net/ne2000.c
> index 869518ee06..037afc8052 100644
> --- a/hw/net/ne2000.c
> +++ b/hw/net/ne2000.c
> @@ -145,7 +145,7 @@ static void ne2000_update_irq(NE2000State *s)
>      isr = (s->isr & s->imr) & 0x7f;
>  #if defined(DEBUG_NE2000)
>      printf("NE2000: Set IRQ to %d (%02x %02x)\n",
> -          isr ? 1 : 0, s->isr, s->imr);
> +           isr ? 1 : 0, s->isr, s->imr);
>  #endif
>      qemu_set_irq(s->irq, (isr != 0));
>  }
> @@ -396,12 +396,12 @@ static uint32_t ne2000_ioport_read(void *opaque,
uint32_t addr)
>          case EN0_ISR:
>              ret = s->isr;
>              break;
> -       case EN0_RSARLO:
> -           ret = s->rsar & 0x00ff;
> -           break;
> -       case EN0_RSARHI:
> -           ret = s->rsar >> 8;
> -           break;
> +        case EN0_RSARLO:
> +            ret = s->rsar & 0x00ff;
> +            break;
> +        case EN0_RSARHI:
> +            ret = s->rsar >> 8;
> +            break;
>          case EN1_PHYS ... EN1_PHYS + 5:
>              ret = s->phys[offset - EN1_PHYS];
>              break;
> @@ -420,21 +420,21 @@ static uint32_t ne2000_ioport_read(void *opaque,
uint32_t addr)
>          case EN2_STOPPG:
>              ret = s->stop >> 8;
>              break;
> -       case EN0_RTL8029ID0:
> -           ret = 0x50;
> -           break;
> -       case EN0_RTL8029ID1:
> -           ret = 0x43;
> -           break;
> -       case EN3_CONFIG0:
> -           ret = 0;            /* 10baseT media */
> -           break;
> -       case EN3_CONFIG2:
> -           ret = 0x40;         /* 10baseT active */
> -           break;
> -       case EN3_CONFIG3:
> -           ret = 0x40;         /* Full duplex */
> -           break;
> +        case EN0_RTL8029ID0:
> +            ret = 0x50;
> +            break;
> +        case EN0_RTL8029ID1:
> +            ret = 0x43;
> +            break;
> +        case EN3_CONFIG0:
> +            ret = 0;           /* 10baseT media */
> +            break;
> +        case EN3_CONFIG2:
> +            ret = 0x40;                /* 10baseT active */
> +            break;
> +        case EN3_CONFIG3:
> +            ret = 0x40;                /* Full duplex */
> +            break;
>          default:
>              ret = 0x00;
>              break;
> diff --git a/hw/net/rocker/rocker.c b/hw/net/rocker/rocker.c
> index c02cbefece..5266f9b7dd 100644
> --- a/hw/net/rocker/rocker.c
> +++ b/hw/net/rocker/rocker.c
> @@ -1279,7 +1279,7 @@ static World *rocker_world_type_by_name(Rocker *r,
const char *name)
>      for (i = 0; i < ROCKER_WORLD_TYPE_MAX; i++) {
>          if (strcmp(name, world_name(r->worlds[i])) == 0) {
>              return r->worlds[i];
> -       }
> +        }
>      }
>      return NULL;
>  }
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 385b1a03e9..e37fc34839 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -1375,10 +1375,10 @@ static int32_t virtio_net_flush_tx(VirtIONetQueue
*q)
>                                     n->guest_hdr_len, -1);
>                  if (out_num == VIRTQUEUE_MAX_SIZE) {
>                      goto drop;
> -               }
> +                }
>                  out_num += 1;
>                  out_sg = sg2;
> -           }
> +            }
>          }
>          /*
>           * If host wants to see the guest header as is, we can
> diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
> index 3648630386..76f3ed319d 100644
> --- a/hw/net/vmxnet3.c
> +++ b/hw/net/vmxnet3.c
> @@ -149,7 +149,7 @@ typedef struct {
>  } Vmxnet3Ring;
>
>  static inline void vmxnet3_ring_init(PCIDevice *d,
> -                                    Vmxnet3Ring *ring,
> +                                     Vmxnet3Ring *ring,
>                                       hwaddr pa,
>                                       uint32_t size,
>                                       uint32_t cell_size,
> @@ -193,13 +193,13 @@ static inline hwaddr
vmxnet3_ring_curr_cell_pa(Vmxnet3Ring *ring)
>  }
>
>  static inline void vmxnet3_ring_read_curr_cell(PCIDevice *d, Vmxnet3Ring
*ring,
> -                                              void *buff)
> +                                               void *buff)
>  {
>      vmw_shmem_read(d, vmxnet3_ring_curr_cell_pa(ring), buff,
ring->cell_size);
>  }
>
>  static inline void vmxnet3_ring_write_curr_cell(PCIDevice *d,
Vmxnet3Ring *ring,
> -                                               void *buff)
> +                                                void *buff)
>  {
>      vmw_shmem_write(d, vmxnet3_ring_curr_cell_pa(ring), buff,
ring->cell_size);
>  }
> diff --git a/hw/pci/msix.c b/hw/pci/msix.c
> index 702dac4ec7..c7bdbeda9e 100644
> --- a/hw/pci/msix.c
> +++ b/hw/pci/msix.c
> @@ -501,7 +501,7 @@ void msix_reset(PCIDevice *dev)
>      }
>      msix_clear_all_vectors(dev);
>      dev->config[dev->msix_cap + MSIX_CONTROL_OFFSET] &=
> -           ~dev->wmask[dev->msix_cap + MSIX_CONTROL_OFFSET];
> +            ~dev->wmask[dev->msix_cap + MSIX_CONTROL_OFFSET];
>      memset(dev->msix_table, 0, dev->msix_entries_nr *
PCI_MSIX_ENTRY_SIZE);
>      memset(dev->msix_pba, 0, QEMU_ALIGN_UP(dev->msix_entries_nr, 64) /
8);
>      msix_mask_all(dev, dev->msix_entries_nr);
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 56b13b3320..13328a0827 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -211,13 +211,13 @@ int pci_bar(PCIDevice *d, int reg)
>
>  static inline int pci_irq_state(PCIDevice *d, int irq_num)
>  {
> -       return (d->irq_state >> irq_num) & 0x1;
> +        return (d->irq_state >> irq_num) & 0x1;
>  }
>
>  static inline void pci_set_irq_state(PCIDevice *d, int irq_num, int
level)
>  {
> -       d->irq_state &= ~(0x1 << irq_num);
> -       d->irq_state |= level << irq_num;
> +        d->irq_state &= ~(0x1 << irq_num);
> +        d->irq_state |= level << irq_num;
>  }
>
>  static void pci_change_irq_level(PCIDevice *pci_dev, int irq_num, int
change)
> @@ -571,8 +571,8 @@ const VMStateDescription vmstate_pci_device = {
>                                     0, vmstate_info_pci_config,
>                                     PCIE_CONFIG_SPACE_SIZE),
>          VMSTATE_BUFFER_UNSAFE_INFO(irq_state, PCIDevice, 2,
> -                                  vmstate_info_pci_irq_state,
> -                                  PCI_NUM_PINS * sizeof(int32_t)),
> +                                   vmstate_info_pci_irq_state,
> +                                   PCI_NUM_PINS * sizeof(int32_t)),
>          VMSTATE_END_OF_LIST()
>      }
>  };
> @@ -624,21 +624,21 @@ static int pci_parse_devaddr(const char *addr, int
*domp, int *busp,
>      p = addr;
>      val = strtoul(p, &e, 16);
>      if (e == p)
> -       return -1;
> +        return -1;
>      if (*e == ':') {
> -       bus = val;
> -       p = e + 1;
> -       val = strtoul(p, &e, 16);
> -       if (e == p)
> -           return -1;
> -       if (*e == ':') {
> -           dom = bus;
> -           bus = val;
> -           p = e + 1;
> -           val = strtoul(p, &e, 16);
> -           if (e == p)
> -               return -1;
> -       }
> +        bus = val;
> +        p = e + 1;
> +        val = strtoul(p, &e, 16);
> +        if (e == p)
> +            return -1;
> +        if (*e == ':') {
> +            dom = bus;
> +            bus = val;
> +            p = e + 1;
> +            val = strtoul(p, &e, 16);
> +            if (e == p)
> +                return -1;
> +        }
>      }
>
>      slot = val;
> @@ -657,10 +657,10 @@ static int pci_parse_devaddr(const char *addr, int
*domp, int *busp,
>
>      /* if funcp == NULL func is 0 */
>      if (dom > 0xffff || bus > 0xff || slot > 0x1f || func > 7)
> -       return -1;
> +        return -1;
>
>      if (*e)
> -       return -1;
> +        return -1;
>
>      *domp = dom;
>      *busp = bus;
> @@ -1217,7 +1217,7 @@ pcibus_t pci_get_bar_addr(PCIDevice *pci_dev, int
region_num)
>  }
>
>  static pcibus_t pci_bar_address(PCIDevice *d,
> -                               int reg, uint8_t type, pcibus_t size)
> +                                int reg, uint8_t type, pcibus_t size)
>  {
>      pcibus_t new_addr, last_addr;
>      int bar = pci_bar(d, reg);
> diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
> index ee9dff2d3a..55d0dacd60 100644
> --- a/hw/pci/pci_bridge.c
> +++ b/hw/pci/pci_bridge.c
> @@ -369,7 +369,7 @@ void pci_bridge_initfn(PCIDevice *dev, const char
*typename)
>       * let users address the bus using the device name.
>       */
>      if (!br->bus_name && dev->qdev.id && *dev->qdev.id) {
> -           br->bus_name = dev->qdev.id;
> +            br->bus_name = dev->qdev.id;
>      }
>
>      qbus_create_inplace(sec_bus, sizeof(br->sec_bus), typename,
DEVICE(dev),
> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
> index 5c58415cf1..fbe2e7f857 100644
> --- a/hw/ppc/ppc405_uc.c
> +++ b/hw/ppc/ppc405_uc.c
> @@ -1885,7 +1885,7 @@ CPUPPCState *ppc405ep_init(MemoryRegion
*address_space_mem,
>      pic = ppcuic_init(env, irqs, 0x0C0, 0, 1);
>      *picp = pic;
>      /* SDRAM controller */
> -       /* XXX 405EP has no ECC interrupt */
> +        /* XXX 405EP has no ECC interrupt */
>      ppc4xx_sdram_init(env, pic[17], 2, ram_memories,
>                        ram_bases, ram_sizes, do_init);
>      /* External bus controller */
> diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
> index 2afb7f437e..7bda86a7d0 100644
> --- a/hw/ppc/prep.c
> +++ b/hw/ppc/prep.c
> @@ -538,7 +538,7 @@ static void ppc_prep_init(MachineState *machine)
>          nb_nics1 = NE2000_NB_MAX;
>      for(i = 0; i < nb_nics1; i++) {
>          if (nd_table[i].model == NULL) {
> -           nd_table[i].model = g_strdup("ne2k_isa");
> +            nd_table[i].model = g_strdup("ne2k_isa");
>          }
>          if (strcmp(nd_table[i].model, "ne2k_isa") == 0) {
>              isa_ne2000_init(isa_bus, ne2000_io[i], ne2000_irq[i],
> @@ -552,7 +552,7 @@ static void ppc_prep_init(MachineState *machine)
>      for(i = 0; i < MAX_IDE_BUS; i++) {
>          isa_ide_init(isa_bus, ide_iobase[i], ide_iobase2[i], ide_irq[i],
>                       hd[2 * i],
> -                    hd[2 * i + 1]);
> +                     hd[2 * i + 1]);
>      }
>
>      cpu = POWERPC_CPU(first_cpu);
> diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
> index 52a38933b6..89def1421f 100644
> --- a/hw/scsi/lsi53c895a.c
> +++ b/hw/scsi/lsi53c895a.c
> @@ -1850,7 +1850,7 @@ static void lsi_reg_writeb(LSIState *s, int offset,
uint8_t val)
>          break;
>      case 0x0a: case 0x0b:
>          /* Openserver writes to these readonly registers on startup */
> -       return;
> +        return;
>      case 0x0c: case 0x0d: case 0x0e: case 0x0f:
>          /* Linux writes to these readonly registers on startup.  */
>          return;
> @@ -1884,8 +1884,8 @@ static void lsi_reg_writeb(LSIState *s, int offset,
uint8_t val)
>          /* nothing to do */
>          break;
>      case 0x1a: /* CTEST2 */
> -       s->ctest2 = val & LSI_CTEST2_PCICIE;
> -       break;
> +        s->ctest2 = val & LSI_CTEST2_PCICIE;
> +        break;
>      case 0x1b: /* CTEST3 */
>          s->ctest3 = val & 0x0f;
>          break;
> diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
> index 6a5fc46a47..5b399e7161 100644
> --- a/hw/sh4/r2d.c
> +++ b/hw/sh4/r2d.c
> @@ -139,11 +139,11 @@ static uint64_t r2d_fpga_read(void *opaque, hwaddr
addr, unsigned int size)
>      case PA_IRLMSK:
>          return s->irlmsk;
>      case PA_OUTPORT:
> -       return s->outport;
> +        return s->outport;
>      case PA_POWOFF:
> -       return 0x00;
> +        return 0x00;
>      case PA_VERREG:
> -       return 0x10;
> +        return 0x10;
>      }
>
>      return 0;
> @@ -158,18 +158,18 @@ r2d_fpga_write(void *opaque, hwaddr addr, uint64_t
value, unsigned int size)
>      case PA_IRLMSK:
>          s->irlmsk = value;
>          update_irl(s);
> -       break;
> +        break;
>      case PA_OUTPORT:
> -       s->outport = value;
> -       break;
> +        s->outport = value;
> +        break;
>      case PA_POWOFF:
>          if (value & 1) {
>              qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
>          }
>          break;
>      case PA_VERREG:
> -       /* Discard writes */
> -       break;
> +        /* Discard writes */
> +        break;
>      }
>  }
>
> diff --git a/hw/usb/dev-bluetooth.c b/hw/usb/dev-bluetooth.c
> index eac7365b0a..c539a1afc6 100644
> --- a/hw/usb/dev-bluetooth.c
> +++ b/hw/usb/dev-bluetooth.c
> @@ -46,7 +46,7 @@ struct USBBtState {
>
>      struct usb_hci_out_fifo_s {
>          uint8_t data[4096];
> -       int len;
> +        int len;
>      } outcmd, outacl, outsco;
>  };
>
> diff --git a/hw/usb/dev-hid.c b/hw/usb/dev-hid.c
> index 62d18290dc..90cd745f06 100644
> --- a/hw/usb/dev-hid.c
> +++ b/hw/usb/dev-hid.c
> @@ -592,12 +592,12 @@ static void usb_hid_handle_control(USBDevice *dev,
USBPacket *p,
>          switch (value >> 8) {
>          case 0x22:
>              if (hs->kind == HID_MOUSE) {
> -               memcpy(data, qemu_mouse_hid_report_descriptor,
> -                      sizeof(qemu_mouse_hid_report_descriptor));
> +                memcpy(data, qemu_mouse_hid_report_descriptor,
> +                       sizeof(qemu_mouse_hid_report_descriptor));
>                  p->actual_length =
sizeof(qemu_mouse_hid_report_descriptor);
>              } else if (hs->kind == HID_TABLET) {
>                  memcpy(data, qemu_tablet_hid_report_descriptor,
> -                      sizeof(qemu_tablet_hid_report_descriptor));
> +                       sizeof(qemu_tablet_hid_report_descriptor));
>                  p->actual_length =
sizeof(qemu_tablet_hid_report_descriptor);
>              } else if (hs->kind == HID_KEYBOARD) {
>                  memcpy(data, qemu_keyboard_hid_report_descriptor,
> diff --git a/hw/usb/dev-hub.c b/hw/usb/dev-hub.c
> index dc368179d1..7e9339b8a8 100644
> --- a/hw/usb/dev-hub.c
> +++ b/hw/usb/dev-hub.c
> @@ -147,13 +147,13 @@ static const USBDesc desc_hub = {
>
>  static const uint8_t qemu_hub_hub_descriptor[] =
>  {
> -       0x00,                   /*  u8  bLength; patched in later */
> -       0x29,                   /*  u8  bDescriptorType; Hub-descriptor */
> -       0x00,                   /*  u8  bNbrPorts; (patched later) */
> -       0x0a,                   /* u16  wHubCharacteristics; */
> -       0x00,                   /*   (per-port OC, no power switching) */
> -       0x01,                   /*  u8  bPwrOn2pwrGood; 2ms */
> -       0x00                    /*  u8  bHubContrCurrent; 0 mA */
> +        0x00,                  /*  u8  bLength; patched in later */
> +        0x29,                  /*  u8  bDescriptorType; Hub-descriptor */
> +        0x00,                  /*  u8  bNbrPorts; (patched later) */
> +        0x0a,                  /* u16  wHubCharacteristics; */
> +        0x00,                  /*   (per-port OC, no power switching) */
> +        0x01,                  /*  u8  bPwrOn2pwrGood; 2ms */
> +        0x00                   /*  u8  bHubContrCurrent; 0 mA */
>
>          /* DeviceRemovable and PortPwrCtrlMask patched in later */
>  };
> diff --git a/hw/xen/xen_devconfig.c b/hw/xen/xen_devconfig.c
> index aebc19bd71..3500d88a3e 100644
> --- a/hw/xen/xen_devconfig.c
> +++ b/hw/xen/xen_devconfig.c
> @@ -6,7 +6,7 @@
>  /* ------------------------------------------------------------- */
>
>  static int xen_config_dev_dirs(const char *ftype, const char *btype, int
vdev,
> -                              char *fe, char *be, int len)
> +                               char *fe, char *be, int len)
>  {
>      char *dom;
>
> diff --git a/hw/xenpv/xen_domainbuild.c b/hw/xenpv/xen_domainbuild.c
> index 188acaca16..2859280a6a 100644
> --- a/hw/xenpv/xen_domainbuild.c
> +++ b/hw/xenpv/xen_domainbuild.c
> @@ -27,11 +27,11 @@ static int xenstore_domain_mkdir(char *path)
>
>      if (!xs_mkdir(xenstore, 0, path)) {
>          fprintf(stderr, "%s: xs_mkdir %s: failed\n", __func__, path);
> -       return -1;
> +        return -1;
>      }
>      if (!xs_set_permissions(xenstore, 0, path, perms_ro, 2)) {
>          fprintf(stderr, "%s: xs_set_permissions failed\n", __func__);
> -       return -1;
> +        return -1;
>      }
>
>      for (i = 0; writable[i]; i++) {
> @@ -82,8 +82,8 @@ int xenstore_domain_init1(const char *kernel, const
char *ramdisk,
>
>      /* cpus */
>      for (i = 0; i < smp_cpus; i++) {
> -       snprintf(path, sizeof(path), "cpu/%d/availability",i);
> -       xenstore_write_str(dom, path, "online");
> +        snprintf(path, sizeof(path), "cpu/%d/availability",i);
> +        xenstore_write_str(dom, path, "online");
>      }
>      xenstore_write_int(vm, "vcpu_avail",  smp_cpus);
>      xenstore_write_int(vm, "vcpus",       smp_cpus);
> diff --git a/include/elf.h b/include/elf.h
> index c151164b63..2a72b282f7 100644
> --- a/include/elf.h
> +++ b/include/elf.h
> @@ -782,11 +782,11 @@ typedef struct {
>  /* ARM-specific values for sh_flags */
>  #define SHF_ARM_ENTRYSECT  0x10000000   /* Section contains an entry
point */
>  #define SHF_ARM_COMDEF     0x80000000   /* Section may be multiply
defined
> -                                          in the input to a link step */
> +                                           in the input to a link step */
>
>  /* ARM-specific program header flags */
>  #define PF_ARM_SB          0x10000000   /* Segment contains the location
> -                                          addressed by the static base */
> +                                           addressed by the static base
*/
>
>  /* ARM relocs.  */
>  #define R_ARM_NONE             0       /* No reloc */
> @@ -1047,7 +1047,7 @@ typedef struct {
>  #define R_X86_64_JUMP_SLOT     7       /* Create PLT entry */
>  #define R_X86_64_RELATIVE      8       /* Adjust by program base */
>  #define R_X86_64_GOTPCREL      9       /* 32 bit signed pc relative
> -                                          offset to GOT */
> +                                           offset to GOT */
>  #define R_X86_64_32            10      /* Direct 32 bit zero extended */
>  #define R_X86_64_32S           11      /* Direct 32 bit sign extended */
>  #define R_X86_64_16            12      /* Direct 16 bit zero extended */
> @@ -1070,7 +1070,7 @@ typedef struct {
>  #define EF_PARISC_LSB          0x00040000 /* Program expects little
endian. */
>  #define EF_PARISC_WIDE         0x00080000 /* Program expects wide mode.
*/
>  #define EF_PARISC_NO_KABP      0x00100000 /* No kernel assisted branch
> -                                             prediction.  */
> +                                              prediction.  */
>  #define EF_PARISC_LAZYSWAP     0x00400000 /* Allow lazy swapping.  */
>  #define EF_PARISC_ARCH         0x0000ffff /* Architecture version.  */
>
> @@ -1083,7 +1083,7 @@ typedef struct {
>  /* Additional section indeces.  */
>
>  #define SHN_PARISC_ANSI_COMMON 0xff00     /* Section for tenatively
declared
> -                                             symbols in ANSI C.  */
> +                                              symbols in ANSI C.  */
>  #define SHN_PARISC_HUGE_COMMON 0xff01     /* Common blocks in huge
model.  */
>
>  /* Legal values for sh_type field of Elf32_Shdr.  */
> diff --git a/include/hw/acpi/acpi.h b/include/hw/acpi/acpi.h
> index c20ace0d0b..bbf541263a 100644
> --- a/include/hw/acpi/acpi.h
> +++ b/include/hw/acpi/acpi.h
> @@ -69,13 +69,13 @@
>  #define ACPI_BITMASK_WAKE_STATUS                0x8000
>
>  #define ACPI_BITMASK_ALL_FIXED_STATUS           (\
> -       ACPI_BITMASK_TIMER_STATUS          | \
> -       ACPI_BITMASK_BUS_MASTER_STATUS     | \
> -       ACPI_BITMASK_GLOBAL_LOCK_STATUS    | \
> -       ACPI_BITMASK_POWER_BUTTON_STATUS   | \
> -       ACPI_BITMASK_SLEEP_BUTTON_STATUS   | \
> -       ACPI_BITMASK_RT_CLOCK_STATUS       | \
> -       ACPI_BITMASK_WAKE_STATUS)
> +        ACPI_BITMASK_TIMER_STATUS          | \
> +        ACPI_BITMASK_BUS_MASTER_STATUS     | \
> +        ACPI_BITMASK_GLOBAL_LOCK_STATUS    | \
> +        ACPI_BITMASK_POWER_BUTTON_STATUS   | \
> +        ACPI_BITMASK_SLEEP_BUTTON_STATUS   | \
> +        ACPI_BITMASK_RT_CLOCK_STATUS       | \
> +        ACPI_BITMASK_WAKE_STATUS)
>
>  /* PM1x_EN */
>  #define ACPI_BITMASK_TIMER_ENABLE               0x0001
> diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
> index 3b6398cb39..b84ba87e44 100644
> --- a/include/hw/elf_ops.h
> +++ b/include/hw/elf_ops.h
> @@ -343,7 +343,7 @@ static int glue(load_elf, SZ)(const char *name, int
fd,
>      }
>
>      if (pentry)
> -       *pentry = (uint64_t)(elf_sword)ehdr.e_entry;
> +        *pentry = (uint64_t)(elf_sword)ehdr.e_entry;
>
>      glue(load_symbols, SZ)(&ehdr, fd, must_swab, clear_lsb, sym_cb);
>
> diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
> index 594081e57f..880413ddc7 100644
> --- a/include/hw/ide/internal.h
> +++ b/include/hw/ide/internal.h
> @@ -342,7 +342,7 @@ enum ide_dma_cmd {
>  extern const char *IDE_DMA_CMD_lookup[IDE_DMA__COUNT];
>
>  #define ide_cmd_is_read(s) \
> -       ((s)->dma_cmd == IDE_DMA_READ)
> +        ((s)->dma_cmd == IDE_DMA_READ)
>
>  typedef struct IDEBufferedRequest {
>      QLIST_ENTRY(IDEBufferedRequest) list;
> diff --git a/include/hw/sh4/sh_intc.h b/include/hw/sh4/sh_intc.h
> index fbcee94ed7..adfedb2efc 100644
> --- a/include/hw/sh4/sh_intc.h
> +++ b/include/hw/sh4/sh_intc.h
> @@ -61,21 +61,21 @@ struct intc_desc {
>  int sh_intc_get_pending_vector(struct intc_desc *desc, int imask);
>  struct intc_source *sh_intc_source(struct intc_desc *desc, intc_enum id);
>  void sh_intc_toggle_source(struct intc_source *source,
> -                          int enable_adj, int assert_adj);
> +                           int enable_adj, int assert_adj);
>
>  void sh_intc_register_sources(struct intc_desc *desc,
> -                             struct intc_vect *vectors,
> -                             int nr_vectors,
> -                             struct intc_group *groups,
> -                             int nr_groups);
> +                              struct intc_vect *vectors,
> +                              int nr_vectors,
> +                              struct intc_group *groups,
> +                              int nr_groups);
>
>  int sh_intc_init(MemoryRegion *sysmem,
>                   struct intc_desc *desc,
> -                int nr_sources,
> -                struct intc_mask_reg *mask_regs,
> -                int nr_mask_regs,
> -                struct intc_prio_reg *prio_regs,
> -                int nr_prio_regs);
> +                 int nr_sources,
> +                 struct intc_mask_reg *mask_regs,
> +                 int nr_mask_regs,
> +                 struct intc_prio_reg *prio_regs,
> +                 int nr_prio_regs);
>
>  void sh_intc_set_irl(void *opaque, int n, int level);
>
> diff --git a/include/hw/xen/io/ring.h b/include/hw/xen/io/ring.h
> index ffa3ebadc8..1adacf09f9 100644
> --- a/include/hw/xen/io/ring.h
> +++ b/include/hw/xen/io/ring.h
> @@ -235,8 +235,8 @@ typedef struct __name##_back_ring __name##_back_ring_t
>   * to be ineffective where _req is a struct which consists of only
bitfields.
>   */
>  #define RING_COPY_REQUEST(_r, _idx, _req) do {                         \
> -       /* Use volatile to force the copy into _req. */                 \
> -       *(_req) = *(volatile typeof(_req))RING_GET_REQUEST(_r, _idx);   \
> +        /* Use volatile to force the copy into _req. */
      \
> +        *(_req) = *(volatile typeof(_req))RING_GET_REQUEST(_r, _idx);  \
>  } while (0)
>
>  #define RING_GET_RESPONSE(_r, _idx)                                     \
> diff --git a/include/qemu/acl.h b/include/qemu/acl.h
> index 7c44119a47..73d2a71c8d 100644
> --- a/include/qemu/acl.h
> +++ b/include/qemu/acl.h
> @@ -49,18 +49,18 @@ qemu_acl *qemu_acl_init(const char *aclname);
>  qemu_acl *qemu_acl_find(const char *aclname);
>
>  int qemu_acl_party_is_allowed(qemu_acl *acl,
> -                             const char *party);
> +                              const char *party);
>
>  void qemu_acl_reset(qemu_acl *acl);
>
>  int qemu_acl_append(qemu_acl *acl,
> -                   int deny,
> -                   const char *match);
> +                    int deny,
> +                    const char *match);
>  int qemu_acl_insert(qemu_acl *acl,
> -                   int deny,
> -                   const char *match,
> -                   int index);
> +                    int deny,
> +                    const char *match,
> +                    int index);
>  int qemu_acl_remove(qemu_acl *acl,
> -                   const char *match);
> +                    const char *match);
>
>  #endif /* QEMU_ACL_H */
> diff --git a/include/qemu/iov.h b/include/qemu/iov.h
> index 72d4c559b4..5f433c7768 100644
> --- a/include/qemu/iov.h
> +++ b/include/qemu/iov.h
> @@ -35,7 +35,7 @@ size_t iov_size(const struct iovec *iov, const unsigned
int iov_cnt);
>  size_t iov_from_buf_full(const struct iovec *iov, unsigned int iov_cnt,
>                           size_t offset, const void *buf, size_t bytes);
>  size_t iov_to_buf_full(const struct iovec *iov, const unsigned int
iov_cnt,
> -                      size_t offset, void *buf, size_t bytes);
> +                       size_t offset, void *buf, size_t bytes);
>
>  static inline size_t
>  iov_from_buf(const struct iovec *iov, unsigned int iov_cnt,
> diff --git a/include/scsi/constants.h b/include/scsi/constants.h
> index 083a8e887a..0dc550732d 100644
> --- a/include/scsi/constants.h
> +++ b/include/scsi/constants.h
> @@ -212,7 +212,7 @@
>  #define TYPE_ROM            0x05
>  #define TYPE_SCANNER        0x06
>  #define TYPE_MOD            0x07    /* Magneto-optical disk -
> -                                    * - treated as TYPE_DISK */
> +                                     * - treated as TYPE_DISK */
>  #define TYPE_MEDIUM_CHANGER 0x08
>  #define TYPE_STORAGE_ARRAY  0x0c    /* Storage array device */
>  #define TYPE_ENCLOSURE      0x0d    /* Enclosure Services Device */
> diff --git a/include/sysemu/balloon.h b/include/sysemu/balloon.h
> index 66543ae8f4..c8f6145257 100644
> --- a/include/sysemu/balloon.h
> +++ b/include/sysemu/balloon.h
> @@ -20,7 +20,7 @@ typedef void (QEMUBalloonEvent)(void *opaque,
ram_addr_t target);
>  typedef void (QEMUBalloonStatus)(void *opaque, BalloonInfo *info);
>
>  int qemu_add_balloon_handler(QEMUBalloonEvent *event_func,
> -                            QEMUBalloonStatus *stat_func, void *opaque);
> +                             QEMUBalloonStatus *stat_func, void *opaque);
>  void qemu_remove_balloon_handler(void *opaque);
>  bool qemu_balloon_is_inhibited(void);
>  void qemu_balloon_inhibit(bool state);
> diff --git a/linux-user/linuxload.c b/linux-user/linuxload.c
> index 6717c9c6f0..a27e1d0d8b 100644
> --- a/linux-user/linuxload.c
> +++ b/linux-user/linuxload.c
> @@ -38,15 +38,15 @@ static int prepare_binprm(struct linux_binprm *bprm)
>      int retval;
>
>      if(fstat(bprm->fd, &st) < 0) {
> -       return(-errno);
> +        return(-errno);
>      }
>
>      mode = st.st_mode;
>      if(!S_ISREG(mode)) {       /* Must be regular file */
> -       return(-EACCES);
> +        return(-EACCES);
>      }
>      if(!(mode & 0111)) {       /* Must have at least one execute bit set
*/
> -       return(-EACCES);
> +        return(-EACCES);
>      }
>
>      bprm->e_uid = geteuid();
> @@ -54,7 +54,7 @@ static int prepare_binprm(struct linux_binprm *bprm)
>
>      /* Set-uid? */
>      if(mode & S_ISUID) {
> -       bprm->e_uid = st.st_uid;
> +        bprm->e_uid = st.st_uid;
>      }
>
>      /* Set-gid? */
> @@ -64,13 +64,13 @@ static int prepare_binprm(struct linux_binprm *bprm)
>       * executable.
>       */
>      if ((mode & (S_ISGID | S_IXGRP)) == (S_ISGID | S_IXGRP)) {
> -       bprm->e_gid = st.st_gid;
> +        bprm->e_gid = st.st_gid;
>      }
>
>      retval = read(bprm->fd, bprm->buf, BPRM_BUF_SIZE);
>      if (retval < 0) {
> -       perror("prepare_binprm");
> -       exit(-1);
> +        perror("prepare_binprm");
> +        exit(-1);
>      }
>      if (retval < BPRM_BUF_SIZE) {
>          /* Make sure the rest of the loader won't read garbage.  */
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 923cbb753a..a0aba9cb1e 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -740,8 +740,8 @@ int main(int argc, char **argv, char **envp)
>      target_argc = argc - optind;
>      target_argv = calloc(target_argc + 1, sizeof (char *));
>      if (target_argv == NULL) {
> -       (void) fprintf(stderr, "Unable to allocate memory for
target_argv\n");
> -       exit(EXIT_FAILURE);
> +        (void) fprintf(stderr, "Unable to allocate memory for
target_argv\n");
> +        exit(EXIT_FAILURE);
>      }
>
>      /*
> diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> index 41e0983ce8..e0249efe4f 100644
> --- a/linux-user/mmap.c
> +++ b/linux-user/mmap.c
> @@ -485,11 +485,11 @@ abi_long target_mmap(abi_ulong start, abi_ulong
len, int prot,
>          end = start + len;
>          real_end = HOST_PAGE_ALIGN(end);
>
> -       /*
> -        * Test if requested memory area fits target address space
> -        * It can fail only on 64-bit host with 32-bit target.
> -        * On any other target/host host mmap() handles this error
correctly.
> -        */
> +        /*
> +         * Test if requested memory area fits target address space
> +         * It can fail only on 64-bit host with 32-bit target.
> +         * On any other target/host host mmap() handles this error
correctly.
> +         */
>          if (!guest_range_valid(start, len)) {
>              errno = ENOMEM;
>              goto fail;
> diff --git a/linux-user/qemu.h b/linux-user/qemu.h
> index dd5771ce0c..069df8f1f9 100644
> --- a/linux-user/qemu.h
> +++ b/linux-user/qemu.h
> @@ -50,7 +50,7 @@ struct image_info {
>          abi_ulong       env_strings;
>          abi_ulong       file_string;
>          uint32_t        elf_flags;
> -       int             personality;
> +        int            personality;
>          abi_ulong       alignment;
>
>          /* The fields below are used in FDPIC mode.  */
> @@ -174,7 +174,7 @@ extern unsigned long mmap_min_addr;
>  struct linux_binprm {
>          char buf[BPRM_BUF_SIZE] __attribute__((aligned));
>          abi_ulong p;
> -       int fd;
> +        int fd;
>          int e_uid, e_gid;
>          int argc, envc;
>          char **argv;
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index 602b631b92..e2c0b37173 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -727,7 +727,7 @@ abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong
uoss_addr, abi_ulong sp)
>          }
>  #endif
>
> -       ret = -TARGET_EFAULT;
> +        ret = -TARGET_EFAULT;
>          if (!lock_user_struct(VERIFY_READ, uss, uss_addr, 1)) {
>              goto out;
>          }
> @@ -736,25 +736,25 @@ abi_long do_sigaltstack(abi_ulong uss_addr,
abi_ulong uoss_addr, abi_ulong sp)
>          __get_user(ss.ss_flags, &uss->ss_flags);
>          unlock_user_struct(uss, uss_addr, 0);
>
> -       ret = -TARGET_EPERM;
> -       if (on_sig_stack(sp))
> +        ret = -TARGET_EPERM;
> +        if (on_sig_stack(sp))
>              goto out;
>
> -       ret = -TARGET_EINVAL;
> -       if (ss.ss_flags != TARGET_SS_DISABLE
> +        ret = -TARGET_EINVAL;
> +        if (ss.ss_flags != TARGET_SS_DISABLE
>              && ss.ss_flags != TARGET_SS_ONSTACK
>              && ss.ss_flags != 0)
>              goto out;
>
> -       if (ss.ss_flags == TARGET_SS_DISABLE) {
> +        if (ss.ss_flags == TARGET_SS_DISABLE) {
>              ss.ss_size = 0;
>              ss.ss_sp = 0;
> -       } else {
> +        } else {
>              ret = -TARGET_ENOMEM;
>              if (ss.ss_size < minstacksize) {
>                  goto out;
>              }
> -       }
> +        }
>
>          target_sigaltstack_used.ss_sp = ss.ss_sp;
>          target_sigaltstack_used.ss_size = ss.ss_size;
> diff --git a/linux-user/strace.c b/linux-user/strace.c
> index d1d14945f9..7318392e57 100644
> --- a/linux-user/strace.c
> +++ b/linux-user/strace.c
> @@ -647,11 +647,11 @@ print_execve(const struct syscallname *name,
>      for (arg_ptr_addr = arg2; ; arg_ptr_addr += sizeof(abi_ulong)) {
>          abi_ulong *arg_ptr, arg_addr;
>
> -       arg_ptr = lock_user(VERIFY_READ, arg_ptr_addr, sizeof(abi_ulong),
1);
> +        arg_ptr = lock_user(VERIFY_READ, arg_ptr_addr,
sizeof(abi_ulong), 1);
>          if (!arg_ptr)
>              return;
>      arg_addr = tswapal(*arg_ptr);
> -       unlock_user(arg_ptr, arg_ptr_addr, 0);
> +        unlock_user(arg_ptr, arg_ptr_addr, 0);
>          if (!arg_addr)
>              break;
>          if ((s = lock_user_string(arg_addr))) {
> diff --git a/linux-user/uaccess.c b/linux-user/uaccess.c
> index 0a5c0b0b29..e215ecc2a6 100644
> --- a/linux-user/uaccess.c
> +++ b/linux-user/uaccess.c
> @@ -30,7 +30,7 @@ abi_long copy_to_user(abi_ulong gaddr, void *hptr,
size_t len)
>
>      if ((ghptr = lock_user(VERIFY_WRITE, gaddr, len, 0))) {
>          memcpy(ghptr, hptr, len);
> -       unlock_user(ghptr, gaddr, len);
> +        unlock_user(ghptr, gaddr, len);
>      } else
>          ret = -TARGET_EFAULT;
>
> diff --git a/linux-user/vm86.c b/linux-user/vm86.c
> index 3829b9a677..9c393df424 100644
> --- a/linux-user/vm86.c
> +++ b/linux-user/vm86.c
> @@ -257,7 +257,7 @@ void handle_vm86_trap(CPUX86State *env, int trapno)
>  #define CHECK_IF_IN_TRAP() \
>        if ((ts->vm86plus.vm86plus.flags & TARGET_vm86dbg_active) && \
>            (ts->vm86plus.vm86plus.flags & TARGET_vm86dbg_TFpendig)) \
> -               newflags |= TF_MASK
> +                newflags |= TF_MASK
>
>  #define VM86_FAULT_RETURN \
>          if ((ts->vm86plus.vm86plus.flags & TARGET_force_return_for_pic)
&& \
> diff --git a/nbd/client.c b/nbd/client.c
> index b4d457a19a..69f5e1b7d2 100644
> --- a/nbd/client.c
> +++ b/nbd/client.c
> @@ -1028,7 +1028,7 @@ int nbd_disconnect(int fd)
>
>  #else
>  int nbd_init(int fd, QIOChannelSocket *ioc, NBDExportInfo *info,
> -            Error **errp)
> +             Error **errp)
>  {
>      error_setg(errp, "nbd_init is only supported on Linux");
>      return -ENOTSUP;
> diff --git a/net/checksum.c b/net/checksum.c
> index 4da72a6a6c..273bc9c6bc 100644
> --- a/net/checksum.c
> +++ b/net/checksum.c
> @@ -43,7 +43,7 @@ uint32_t net_checksum_add_cont(int len, uint8_t *buf,
int seq)
>  uint16_t net_checksum_finish(uint32_t sum)
>  {
>      while (sum>>16)
> -       sum = (sum & 0xFFFF)+(sum >> 16);
> +        sum = (sum & 0xFFFF)+(sum >> 16);
>      return ~sum;
>  }
>
> diff --git a/qtest.c b/qtest.c
> index 69b9e9962b..55df6c43db 100644
> --- a/qtest.c
> +++ b/qtest.c
> @@ -290,7 +290,7 @@ static void qtest_process_command(CharBackend *chr,
gchar **words)
>          if (!dev) {
>              qtest_send_prefix(chr);
>              qtest_send(chr, "FAIL Unknown device\n");
> -           return;
> +            return;
>          }
>
>          if (irq_intercept_dev) {
> @@ -300,7 +300,7 @@ static void qtest_process_command(CharBackend *chr,
gchar **words)
>              } else {
>                  qtest_send(chr, "OK\n");
>              }
> -           return;
> +            return;
>          }
>
>          QLIST_FOREACH(ngl, &dev->gpios, node) {
> diff --git a/target/alpha/translate.c b/target/alpha/translate.c
> index e5d62850c5..9d8f9b3eea 100644
> --- a/target/alpha/translate.c
> +++ b/target/alpha/translate.c
> @@ -804,7 +804,7 @@ static void gen_cvttq(DisasContext *ctx, int rb, int
rc, int fn11)
>
>  static void gen_ieee_intcvt(DisasContext *ctx,
>                              void (*helper)(TCGv, TCGv_ptr, TCGv),
> -                           int rb, int rc, int fn11)
> +                            int rb, int rc, int fn11)
>  {
>      TCGv vb, vc;
>
> diff --git a/target/cris/helper.c b/target/cris/helper.c
> index d2ec349191..754fa00d06 100644
> --- a/target/cris/helper.c
> +++ b/target/cris/helper.c
> @@ -240,7 +240,7 @@ void cris_cpu_do_interrupt(CPUState *cs)
>          /* Exception starts with dslot cleared.  */
>          env->dslot = 0;
>      }
> -
> +
>      if (env->pregs[PR_CCS] & U_FLAG) {
>          /* Swap stack pointers.  */
>          env->pregs[PR_USP] = env->regs[R_SP];
> diff --git a/target/cris/mmu.h b/target/cris/mmu.h
> index 8e249e812b..0217f476de 100644
> --- a/target/cris/mmu.h
> +++ b/target/cris/mmu.h
> @@ -5,13 +5,13 @@
>
>  struct cris_mmu_result
>  {
> -       uint32_t phy;
> -       int prot;
> -       int bf_vec;
> +        uint32_t phy;
> +        int prot;
> +        int bf_vec;
>  };
>
>  void cris_mmu_init(CPUCRISState *env);
>  void cris_mmu_flush_pid(CPUCRISState *env, uint32_t pid);
>  int cris_mmu_translate(struct cris_mmu_result *res,
> -                      CPUCRISState *env, uint32_t vaddr,
> -                      int rw, int mmu_idx, int debug);
> +                       CPUCRISState *env, uint32_t vaddr,
> +                       int rw, int mmu_idx, int debug);
> diff --git a/target/cris/translate_v10.inc.c
b/target/cris/translate_v10.inc.c
> index fce78825cc..a87b8bb281 100644
> --- a/target/cris/translate_v10.inc.c
> +++ b/target/cris/translate_v10.inc.c
> @@ -384,7 +384,7 @@ static unsigned int dec10_setclrf(DisasContext *dc)
>  }
>
>  static inline void dec10_reg_prep_sext(DisasContext *dc, int size, int
sext,
> -                                      TCGv dd, TCGv ds, TCGv sd, TCGv ss)
> +                                       TCGv dd, TCGv ds, TCGv sd, TCGv
ss)
>  {
>      if (sext) {
>          t_gen_sext(dd, sd, size);
> diff --git a/target/i386/translate.c b/target/i386/translate.c
> index 0dd5fbe45c..49cd298374 100644
> --- a/target/i386/translate.c
> +++ b/target/i386/translate.c
> @@ -3445,7 +3445,7 @@ static void gen_sse(CPUX86State *env, DisasContext
*s, int b,
>          case 0x172:
>          case 0x173:
>              if (b1 >= 2) {
> -               goto unknown_op;
> +                goto unknown_op;
>              }
>              val = x86_ldub_code(env, s);
>              if (is_xmm) {
> @@ -6400,7 +6400,7 @@ static target_ulong disas_insn(DisasContext *s,
CPUState *cpu)
>                       SVM_IOIO_TYPE_MASK | svm_is_rep(prefixes));
>          if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
>              gen_io_start();
> -       }
> +        }
>          tcg_gen_movi_i32(s->tmp2_i32, val);
>          gen_helper_in_func(ot, s->T1, s->tmp2_i32);
>          gen_op_mov_reg_v(s, ot, R_EAX, s->T1);
> @@ -6421,7 +6421,7 @@ static target_ulong disas_insn(DisasContext *s,
CPUState *cpu)
>
>          if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
>              gen_io_start();
> -       }
> +        }
>          tcg_gen_movi_i32(s->tmp2_i32, val);
>          tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
>          gen_helper_out_func(ot, s->tmp2_i32, s->tmp3_i32);
> @@ -6439,7 +6439,7 @@ static target_ulong disas_insn(DisasContext *s,
CPUState *cpu)
>                       SVM_IOIO_TYPE_MASK | svm_is_rep(prefixes));
>          if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
>              gen_io_start();
> -       }
> +        }
>          tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
>          gen_helper_in_func(ot, s->T1, s->tmp2_i32);
>          gen_op_mov_reg_v(s, ot, R_EAX, s->T1);
> @@ -6459,7 +6459,7 @@ static target_ulong disas_insn(DisasContext *s,
CPUState *cpu)
>
>          if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
>              gen_io_start();
> -       }
> +        }
>          tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
>          tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
>          gen_helper_out_func(ot, s->tmp2_i32, s->tmp3_i32);
> @@ -7166,7 +7166,7 @@ static target_ulong disas_insn(DisasContext *s,
CPUState *cpu)
>          gen_jmp_im(s, pc_start - s->cs_base);
>          if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
>              gen_io_start();
> -       }
> +        }
>          gen_helper_rdtsc(cpu_env);
>          if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
>              gen_io_end();
> diff --git a/target/mips/translate.c b/target/mips/translate.c
> index e9c23a594b..b8dcab5307 100644
> --- a/target/mips/translate.c
> +++ b/target/mips/translate.c
> @@ -6942,7 +6942,7 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg,
int reg, int sel)
>              /* Mark as an IO operation because we read the time.  */
>              if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
>                  gen_io_start();
> -           }
> +            }
>              gen_helper_mfc0_count(arg, cpu_env);
>              if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
>                  gen_io_end();
> diff --git a/target/tilegx/translate.c b/target/tilegx/translate.c
> index f201150fc7..df1e4d0fef 100644
> --- a/target/tilegx/translate.c
> +++ b/target/tilegx/translate.c
> @@ -297,7 +297,7 @@ static TileExcp gen_st_opcode(DisasContext *dc,
unsigned dest, unsigned srca,
>      }
>
>      tcg_gen_qemu_st_tl(load_gr(dc, srcb), load_gr(dc, srca),
> -                      dc->mmuidx, memop);
> +                       dc->mmuidx, memop);
>
>      qemu_log_mask(CPU_LOG_TB_IN_ASM, "%s %s, %s", name,
>                    reg_names[srca], reg_names[srcb]);
> diff --git a/tcg/i386/tcg-target.inc.c b/tcg/i386/tcg-target.inc.c
> index 436195894b..cdca3fe034 100644
> --- a/tcg/i386/tcg-target.inc.c
> +++ b/tcg/i386/tcg-target.inc.c
> @@ -3424,8 +3424,8 @@ static void tcg_target_qemu_prologue(TCGContext *s)
>      tcg_out_addi(s, TCG_REG_ESP, -stack_addend);
>      /* jmp *tb.  */
>      tcg_out_modrm_offset(s, OPC_GRP5, EXT5_JMPN_Ev, TCG_REG_ESP,
> -                        (ARRAY_SIZE(tcg_target_callee_save_regs) + 2) * 4
> -                        + stack_addend);
> +                         (ARRAY_SIZE(tcg_target_callee_save_regs) + 2) *
4
> +                         + stack_addend);
>  #else
>      tcg_out_mov(s, TCG_TYPE_PTR, TCG_AREG0,
tcg_target_call_iarg_regs[0]);
>      tcg_out_addi(s, TCG_REG_ESP, -stack_addend);
> diff --git a/tests/tcg/alpha/test-cond.c b/tests/tcg/alpha/test-cond.c
> index e625313b3e..3e11c4c105 100644
> --- a/tests/tcg/alpha/test-cond.c
> +++ b/tests/tcg/alpha/test-cond.c
> @@ -6,7 +6,7 @@
>  int test_##N (long a)                          \
>  {                                              \
>    int res = 1;                                 \
> -                                               \
> +                                                \
>    asm ("cmov"#N" %1,$31,%0"                    \
>         : "+r" (res) : "r" (a));                        \
>    return !res;                                 \
> @@ -18,7 +18,7 @@ int test_##N (long a)                         \
>  int test_##N (long a)                          \
>  {                                              \
>    int res = 1;                                 \
> -                                               \
> +                                                \
>    asm ("b"#N" %1,1f\n\t"                       \
>         "addq $31,$31,%0\n\t"                   \
>         "1: unop\n"                             \
> diff --git a/tests/tcg/arm/hello-arm.c b/tests/tcg/arm/hello-arm.c
> index 6e5a93bccf..e33edf949f 100644
> --- a/tests/tcg/arm/hello-arm.c
> +++ b/tests/tcg/arm/hello-arm.c
> @@ -11,7 +11,7 @@
>
>  #define __syscall_return(type, res)                                    \
>  do {                                                                   \
> -       return (type) (res);                                            \
> +        return (type) (res);                                           \
>  } while (0)
>
>  #define _syscall0(type,name)                                           \
> @@ -33,7 +33,7 @@ type name(type1 arg1) {
                       \
>    "mov %0,r0"                                                          \
>          : "=r" (__res)                                                 \
>          : "r" ((long)(arg1))                                           \
> -       : "r0","lr");                                                   \
> +        : "r0","lr");                                                  \
>    __syscall_return(type,__res);
      \
>  }
>
> @@ -47,7 +47,7 @@ type name(type1 arg1,type2 arg2) {
              \
>    "mov\t%0,r0"                                                         \
>          : "=r" (__res)                                                 \
>          : "r" ((long)(arg1)),"r" ((long)(arg2))
      \
> -       : "r0","r1","lr");                                              \
> +        : "r0","r1","lr");                                             \
>    __syscall_return(type,__res);
      \
>  }
>
> @@ -78,9 +78,9 @@ type name(type1 arg1, type2 arg2, type3 arg3, type4
arg4) {                           \
>    "mov\tr3,%4\n\t"
               \
>    __syscall(name)
              \
>    "mov\t%0,r0"
               \
> -       : "=r" (__res)
              \
> -       : "r" ((long)(arg1)),"r" ((long)(arg2)),"r" ((long)(arg3)),"r"
((long)(arg4))   \
> -       : "r0","r1","r2","r3","lr");
              \
> +        : "=r" (__res)
               \
> +        : "r" ((long)(arg1)),"r" ((long)(arg2)),"r" ((long)(arg3)),"r"
((long)(arg4))  \
> +        : "r0","r1","r2","r3","lr");
               \
>    __syscall_return(type,__res);
                      \
>  }
>
> @@ -96,10 +96,10 @@ type name(type1 arg1, type2 arg2, type3 arg3, type4
arg4, type5 arg5) {                     \
>    "mov\tr4,%5\n\t"
               \
>    __syscall(name)
              \
>    "mov\t%0,r0"
               \
> -       : "=r" (__res)
              \
> -       : "r" ((long)(arg1)),"r" ((long)(arg2)),"r" ((long)(arg3)),"r"
((long)(arg4)),  \
> -         "r" ((long)(arg5))
              \
> -       : "r0","r1","r2","r3","r4","lr");
               \
> +        : "=r" (__res)
               \
> +        : "r" ((long)(arg1)),"r" ((long)(arg2)),"r" ((long)(arg3)),"r"
((long)(arg4)), \
> +          "r" ((long)(arg5))
               \
> +        : "r0","r1","r2","r3","r4","lr");
              \
>    __syscall_return(type,__res);
                      \
>  }
>
> diff --git a/tests/tcg/cris/check_glibc_kernelversion.c
b/tests/tcg/cris/check_glibc_kernelversion.c
> index 07448722c0..7aada89911 100644
> --- a/tests/tcg/cris/check_glibc_kernelversion.c
> +++ b/tests/tcg/cris/check_glibc_kernelversion.c
> @@ -109,8 +109,8 @@ int main(void)
>
>          if (parts < 3)
>            version <<= 8 * (3 - parts);
> -       if (version < __LINUX_KERNEL_VERSION)
> -               err();
> -       pass();
> -       exit(0);
> +        if (version < __LINUX_KERNEL_VERSION)
> +                err();
> +        pass();
> +        exit(0);
>  }
> diff --git a/tests/tcg/cris/check_mmap3.c b/tests/tcg/cris/check_mmap3.c
> index 34401fa0c9..cb890ef120 100644
> --- a/tests/tcg/cris/check_mmap3.c
> +++ b/tests/tcg/cris/check_mmap3.c
> @@ -17,7 +17,7 @@ int main (int argc, char *argv[])
>
>    /* Check that we can map a non-multiple of a page and still get a full
page.  */
>    a = mmap (NULL, 0x4c, PROT_READ | PROT_WRITE | PROT_EXEC,
> -           MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> +            MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>    if (a == NULL || a == (unsigned char *) -1)
>      abort ();
>
> diff --git a/tests/tcg/cris/check_openpf1.c
b/tests/tcg/cris/check_openpf1.c
> index fdcf4c5c3f..251d26eec2 100644
> --- a/tests/tcg/cris/check_openpf1.c
> +++ b/tests/tcg/cris/check_openpf1.c
> @@ -19,7 +19,7 @@ int main (int argc, char *argv[])
>      {
>        fnam = malloc (strlen (argv[0]) + 2);
>        if (fnam == NULL)
> -       abort ();
> +        abort ();
>        strcpy (fnam, "/");
>        strcat (fnam, argv[0]);
>      }
> diff --git a/tests/tcg/cris/check_settls1.c
b/tests/tcg/cris/check_settls1.c
> index 69d202652a..3abc3a9ea8 100644
> --- a/tests/tcg/cris/check_settls1.c
> +++ b/tests/tcg/cris/check_settls1.c
> @@ -35,7 +35,7 @@ int main (void)
>      syscall (SYS_set_thread_area, old_tp);
>
>      if (tp != 0xeddeed00) {
> -       * (volatile int *) 0 = 0;
> +        * (volatile int *) 0 = 0;
>          perror ("tls2");
>          abort ();
>      }
> diff --git a/tests/tcg/i386/hello-i386.c b/tests/tcg/i386/hello-i386.c
> index cfeb24b2f5..59196dd0b7 100644
> --- a/tests/tcg/i386/hello-i386.c
> +++ b/tests/tcg/i386/hello-i386.c
> @@ -4,19 +4,19 @@ static inline void exit(int status)
>  {
>    int __res;
>    __asm__ volatile ("movl %%ecx,%%ebx\n"\
> -                   "int $0x80" \
> -                   :  "=a" (__res) : "0" (__NR_exit),"c"
((long)(status)));
> +                    "int $0x80" \
> +                    :  "=a" (__res) : "0" (__NR_exit),"c"
((long)(status)));
>  }
>
>  static inline int write(int fd, const char * buf, int len)
>  {
>    int status;
>    __asm__ volatile ("pushl %%ebx\n"\
> -                   "movl %%esi,%%ebx\n"\
> -                   "int $0x80\n" \
> -                   "popl %%ebx\n"\
> -                   : "=a" (status) \
> -                   : "0" (__NR_write),"S" ((long)(fd)),"c"
((long)(buf)),"d" ((long)(len)));
> +                    "movl %%esi,%%ebx\n"\
> +                    "int $0x80\n" \
> +                    "popl %%ebx\n"\
> +                    : "=a" (status) \
> +                    : "0" (__NR_write),"S" ((long)(fd)),"c"
((long)(buf)),"d" ((long)(len)));
>    return status;
>  }
>
> diff --git a/tests/tcg/mips/hello-mips.c b/tests/tcg/mips/hello-mips.c
> index f8256730dd..c7052fdf2e 100644
> --- a/tests/tcg/mips/hello-mips.c
> +++ b/tests/tcg/mips/hello-mips.c
> @@ -24,9 +24,9 @@ static inline void exit1(int status)
>          "      syscall         \n"
>          "      .set pop        "
>          :
> -       : "i" (__NR_exit), "r" (__a0)
> -       : "$2", "$8", "$9", "$10", "$11", "$12", "$13", "$14", "$15",
"$24",
> -         "memory");
> +        : "i" (__NR_exit), "r" (__a0)
> +        : "$2", "$8", "$9", "$10", "$11", "$12", "$13", "$14", "$15",
"$24",
> +          "memory");
>  }
>
>  static inline int write(int fd, const char *buf, int len)
> @@ -46,8 +46,8 @@ static inline int write(int fd, const char *buf, int
len)
>          "      .set pop        "
>          : "=r" (__v0), "=r" (__a3)
>          : "i" (__NR_write), "r" (__a0), "r" (__a1), "r" (__a2)
> -       : "$2", "$8", "$9", "$10", "$11", "$12", "$13", "$14", "$15",
"$24",
> -         "memory");
> +        : "$2", "$8", "$9", "$10", "$11", "$12", "$13", "$14", "$15",
"$24",
> +          "memory");
>
>  /*    if (__a3 == 0) */
>          return (int) __v0;
> diff --git a/tests/tcg/multiarch/sha1.c b/tests/tcg/multiarch/sha1.c
> index 93b7c8e808..87bfbcdf52 100644
> --- a/tests/tcg/multiarch/sha1.c
> +++ b/tests/tcg/multiarch/sha1.c
> @@ -152,7 +152,7 @@ uint32_t j;
>
>      j = context->count[0];
>      if ((context->count[0] += len << 3) < j)
> -       context->count[1]++;
> +        context->count[1]++;
>      context->count[1] += (len>>29);
>      j = (j >> 3) & 63;
>      if ((j + len) > 63) {
> @@ -186,11 +186,11 @@ unsigned char c;
>
>      for (i = 0; i < 2; i++)
>      {
> -       uint32_t t = context->count[i];
> -       int j;
> +        uint32_t t = context->count[i];
> +        int j;
>
> -       for (j = 0; j < 4; t >>= 8, j++)
> -           *--fcp = (unsigned char) t;
> +        for (j = 0; j < 4; t >>= 8, j++)
> +            *--fcp = (unsigned char) t;
>      }
>  #else
>      for (i = 0; i < 8; i++) {
> @@ -201,7 +201,7 @@ unsigned char c;
>      c = 0200;
>      SHA1Update(context, &c, 1);
>      while ((context->count[0] & 504) != 448) {
> -       c = 0000;
> +        c = 0000;
>          SHA1Update(context, &c, 1);
>      }
>      SHA1Update(context, finalcount, 8);  /* Should cause a
SHA1Transform() */
> diff --git a/tests/vhost-user-test.c b/tests/vhost-user-test.c
> index 9d7b0d48a0..4e43d6b96e 100644
> --- a/tests/vhost-user-test.c
> +++ b/tests/vhost-user-test.c
> @@ -369,8 +369,8 @@ static void chr_read(void *opaque, const uint8_t
*buf, int size)
>          break;
>
>      case VHOST_USER_SET_FEATURES:
> -       g_assert_cmpint(msg.payload.u64 & (0x1ULL <<
VHOST_USER_F_PROTOCOL_FEATURES),
> -                       !=, 0ULL);
> +        g_assert_cmpint(msg.payload.u64 & (0x1ULL <<
VHOST_USER_F_PROTOCOL_FEATURES),
> +                        !=, 0ULL);
>          if (s->test_flags == TEST_FLAGS_DISCONNECT) {
>              qemu_chr_fe_disconnect(chr);
>              s->test_flags = TEST_FLAGS_BAD;
> diff --git a/ui/keymaps.h b/ui/keymaps.h
> index 98213a4191..4e9c87fb8f 100644
> --- a/ui/keymaps.h
> +++ b/ui/keymaps.h
> @@ -28,8 +28,8 @@
>  #include "qemu-common.h"
>
>  typedef struct {
> -       const char* name;
> -       int keysym;
> +    const char* name;
> +    int keysym;
>  } name2keysym_t;
>
>  /* scancode without modifiers */
> diff --git a/ui/qemu-pixman.c b/ui/qemu-pixman.c
> index 3e52abd92d..1429cf08d5 100644
> --- a/ui/qemu-pixman.c
> +++ b/ui/qemu-pixman.c
> @@ -36,7 +36,7 @@ PixelFormat
qemu_pixelformat_from_pixman(pixman_format_code_t format)
>          pf.rshift = 0;
>          break;
>      case PIXMAN_TYPE_BGRA:
> -       pf.bshift = bpp - pf.bbits;
> +        pf.bshift = bpp - pf.bbits;
>          pf.gshift = bpp - (pf.bbits + pf.gbits);
>          pf.rshift = bpp - (pf.bbits + pf.gbits + pf.rbits);
>          pf.ashift = 0;
> diff --git a/ui/vnc-enc-zywrle-template.c b/ui/vnc-enc-zywrle-template.c
> index b446380a7a..e9be55966e 100644
> --- a/ui/vnc-enc-zywrle-template.c
> +++ b/ui/vnc-enc-zywrle-template.c
> @@ -44,8 +44,8 @@ OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
SUCH DAMAGE.
>
>  /* Change Log:
>       V0.02 : 2008/02/04 : Fix mis encode/decode when width != scanline
> -                            (Thanks Johannes Schindelin, author of LibVNC
> -                                                 Server/Client)
> +                             (Thanks Johannes Schindelin, author of
LibVNC
> +                                                  Server/Client)
>       V0.01 : 2007/02/06 : Initial release
>  */
>
> diff --git a/ui/vnc.c b/ui/vnc.c
> index 0c1b477425..9e4b2beb71 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -3097,8 +3097,8 @@ static void vnc_connect(VncDisplay *vd,
QIOChannelSocket *sioc,
>      buffer_init(&vs->zrle.zlib,      "vnc-zrle-zlib/%p", sioc);
>
>      if (skipauth) {
> -       vs->auth = VNC_AUTH_NONE;
> -       vs->subauth = VNC_AUTH_INVALID;
> +        vs->auth = VNC_AUTH_NONE;
> +        vs->subauth = VNC_AUTH_INVALID;
>      } else {
>          if (websocket) {
>              vs->auth = vd->ws_auth;
> diff --git a/util/bitops.c b/util/bitops.c
> index f2364015c4..3fe6b1c4f1 100644
> --- a/util/bitops.c
> +++ b/util/bitops.c
> @@ -18,7 +18,7 @@
>   * Find the next set bit in a memory region.
>   */
>  unsigned long find_next_bit(const unsigned long *addr, unsigned long
size,
> -                           unsigned long offset)
> +                            unsigned long offset)
>  {
>      const unsigned long *p = addr + BIT_WORD(offset);
>      unsigned long result = offset & ~(BITS_PER_LONG-1);
> @@ -83,7 +83,7 @@ found_middle:
>   * Linus' asm-alpha/bitops.h.
>   */
>  unsigned long find_next_zero_bit(const unsigned long *addr, unsigned
long size,
> -                                unsigned long offset)
> +                                 unsigned long offset)
>  {
>      const unsigned long *p = addr + BIT_WORD(offset);
>      unsigned long result = offset & ~(BITS_PER_LONG-1);
> diff --git a/util/osdep.c b/util/osdep.c
> index 1c8d1e2ee0..4b5dc7287d 100644
> --- a/util/osdep.c
> +++ b/util/osdep.c
> @@ -470,8 +470,8 @@ void fips_set_state(bool requested)
>
>  #ifdef _FIPS_DEBUG
>      fprintf(stderr, "FIPS mode %s (requested %s)\n",
> -           (fips_enabled ? "enabled" : "disabled"),
> -           (requested ? "enabled" : "disabled"));
> +            (fips_enabled ? "enabled" : "disabled"),
> +            (requested ? "enabled" : "disabled"));
>  #endif
>  }
>
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index 8bd8bb64eb..9705051690 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -270,8 +270,8 @@ static int inet_listen_saddr(InetSocketAddress *saddr,
>      /* create socket + bind/listen */
>      for (e = res; e != NULL; e = e->ai_next) {
>          getnameinfo((struct sockaddr*)e->ai_addr,e->ai_addrlen,
> -                       uaddr,INET6_ADDRSTRLEN,uport,32,
> -                       NI_NUMERICHOST | NI_NUMERICSERV);
> +                        uaddr,INET6_ADDRSTRLEN,uport,32,
> +                        NI_NUMERICHOST | NI_NUMERICSERV);
>
>          port_min = inet_getport(e);
>          port_max = saddr->has_to ? saddr->to + port_offset : port_min;
> --
> 2.19.2
>
>

--00000000000015e331057cfea21e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Dec 13, 2018 11:40 PM, &quot;Paolo Bonzini&quot; &lt;<a href=3D"mailto:p=
bonzini@redhat.com">pbonzini@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Most files that have TABs only contain a handful of them.=C2=A0 Change=
<br>
&gt; them to spaces so that we don&#39;t confuse people.<br>
&gt;<br>
&gt; disas, standard-headers, linux-headers and libdecnumber are imported<b=
r>
&gt; from other projects and probably should be exempted from the check.<br=
></p>
<p dir=3D"ltr">For MIPS parts, they are all ok and desireable:</p>
<p dir=3D"ltr">Reviewed-by: Aleksandar Markovic &lt;<a href=3D"mailto:amark=
ovic@wavecomp.com">amarkovic@wavecomp.com</a>&gt;<br><br></p>
<p dir=3D"ltr">&gt; Outside those, after this patch the following files sti=
ll contain both<br>
&gt; 8-space and TAB sequences at the beginning of the line.=C2=A0 Many of =
them<br>
&gt; have a majority of TABs, or were initially committed with all tabs.<br=
>
&gt;<br>
&gt; =C2=A0 =C2=A0 bsd-user/i386/target_syscall.h<br>
&gt; =C2=A0 =C2=A0 bsd-user/x86_64/target_syscall.h<br>
&gt; =C2=A0 =C2=A0 crypto/aes.c<br>
&gt; =C2=A0 =C2=A0 hw/audio/fmopl.c<br>
&gt; =C2=A0 =C2=A0 hw/audio/fmopl.h<br>
&gt; =C2=A0 =C2=A0 hw/block/tc58128.c<br>
&gt; =C2=A0 =C2=A0 hw/display/cirrus_vga.c<br>
&gt; =C2=A0 =C2=A0 hw/display/xenfb.c<br>
&gt; =C2=A0 =C2=A0 hw/dma/etraxfs_dma.c<br>
&gt; =C2=A0 =C2=A0 hw/intc/sh_intc.c<br>
&gt; =C2=A0 =C2=A0 hw/misc/mst_fpga.c<br>
&gt; =C2=A0 =C2=A0 hw/net/pcnet.c<br>
&gt; =C2=A0 =C2=A0 hw/sh4/sh7750.c<br>
&gt; =C2=A0 =C2=A0 hw/timer/m48t59.c<br>
&gt; =C2=A0 =C2=A0 hw/timer/sh_timer.c<br>
&gt; =C2=A0 =C2=A0 include/crypto/aes.h<br>
&gt; =C2=A0 =C2=A0 include/disas/bfd.h<br>
&gt; =C2=A0 =C2=A0 include/hw/sh4/sh.h<br>
&gt; =C2=A0 =C2=A0 libdecnumber/decNumber.c<br>
&gt; =C2=A0 =C2=A0 linux-headers/asm-generic/unistd.h<br>
&gt; =C2=A0 =C2=A0 linux-headers/linux/kvm.h<br>
&gt; =C2=A0 =C2=A0 linux-user/alpha/target_syscall.h<br>
&gt; =C2=A0 =C2=A0 linux-user/arm/nwfpe/double_cpdo.c<br>
&gt; =C2=A0 =C2=A0 linux-user/arm/nwfpe/fpa11_cpdt.c<br>
&gt; =C2=A0 =C2=A0 linux-user/arm/nwfpe/fpa11_cprt.c<br>
&gt; =C2=A0 =C2=A0 linux-user/arm/nwfpe/fpa11.h<br>
&gt; =C2=A0 =C2=A0 linux-user/flat.h<br>
&gt; =C2=A0 =C2=A0 linux-user/flatload.c<br>
&gt; =C2=A0 =C2=A0 linux-user/i386/target_syscall.h<br>
&gt; =C2=A0 =C2=A0 linux-user/ppc/target_syscall.h<br>
&gt; =C2=A0 =C2=A0 linux-user/sparc/target_syscall.h<br>
&gt; =C2=A0 =C2=A0 linux-user/syscall.c<br>
&gt; =C2=A0 =C2=A0 linux-user/syscall_defs.h<br>
&gt; =C2=A0 =C2=A0 linux-user/x86_64/target_syscall.h<br>
&gt; =C2=A0 =C2=A0 slirp/cksum.c<br>
&gt; =C2=A0 =C2=A0 slirp/if.c<br>
&gt; =C2=A0 =C2=A0 slirp/ip.h<br>
&gt; =C2=A0 =C2=A0 slirp/ip_icmp.c<br>
&gt; =C2=A0 =C2=A0 slirp/ip_icmp.h<br>
&gt; =C2=A0 =C2=A0 slirp/ip_input.c<br>
&gt; =C2=A0 =C2=A0 slirp/ip_output.c<br>
&gt; =C2=A0 =C2=A0 slirp/mbuf.c<br>
&gt; =C2=A0 =C2=A0 slirp/misc.c<br>
&gt; =C2=A0 =C2=A0 slirp/sbuf.c<br>
&gt; =C2=A0 =C2=A0 slirp/socket.c<br>
&gt; =C2=A0 =C2=A0 slirp/socket.h<br>
&gt; =C2=A0 =C2=A0 slirp/tcp_input.c<br>
&gt; =C2=A0 =C2=A0 slirp/tcpip.h<br>
&gt; =C2=A0 =C2=A0 slirp/tcp_output.c<br>
&gt; =C2=A0 =C2=A0 slirp/tcp_subr.c<br>
&gt; =C2=A0 =C2=A0 slirp/tcp_timer.c<br>
&gt; =C2=A0 =C2=A0 slirp/tftp.c<br>
&gt; =C2=A0 =C2=A0 slirp/udp.c<br>
&gt; =C2=A0 =C2=A0 slirp/udp.h<br>
&gt; =C2=A0 =C2=A0 target/cris/cpu.h<br>
&gt; =C2=A0 =C2=A0 target/cris/mmu.c<br>
&gt; =C2=A0 =C2=A0 target/cris/op_helper.c<br>
&gt; =C2=A0 =C2=A0 target/sh4/helper.c<br>
&gt; =C2=A0 =C2=A0 target/sh4/op_helper.c<br>
&gt; =C2=A0 =C2=A0 target/sh4/translate.c<br>
&gt; =C2=A0 =C2=A0 tcg/sparc/tcg-target.inc.c<br>
&gt; =C2=A0 =C2=A0 tests/tcg/cris/check_addo.c<br>
&gt; =C2=A0 =C2=A0 tests/tcg/cris/check_moveq.c<br>
&gt; =C2=A0 =C2=A0 tests/tcg/cris/check_swap.c<br>
&gt; =C2=A0 =C2=A0 tests/tcg/multiarch/test-mmap.c<br>
&gt; =C2=A0 =C2=A0 ui/vnc-enc-hextile-template.h<br>
&gt; =C2=A0 =C2=A0 ui/vnc-enc-zywrle.h<br>
&gt; =C2=A0 =C2=A0 util/envlist.c<br>
&gt; =C2=A0 =C2=A0 util/readline.c<br>
&gt;<br>
&gt; The following have only TABs:<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 bsd-user/i386/target_signal.h<br>
&gt; =C2=A0 =C2=A0 bsd-user/sparc64/target_signal.h<br>
&gt; =C2=A0 =C2=A0 bsd-user/sparc64/target_syscall.h<br>
&gt; =C2=A0 =C2=A0 bsd-user/sparc/target_signal.h<br>
&gt; =C2=A0 =C2=A0 bsd-user/sparc/target_syscall.h<br>
&gt; =C2=A0 =C2=A0 bsd-user/x86_64/target_signal.h<br>
&gt; =C2=A0 =C2=A0 crypto/desrfb.c<br>
&gt; =C2=A0 =C2=A0 hw/audio/intel-hda-defs.h<br>
&gt; =C2=A0 =C2=A0 hw/core/uboot_image.h<br>
&gt; =C2=A0 =C2=A0 hw/sh4/sh7750_regnames.c<br>
&gt; =C2=A0 =C2=A0 hw/sh4/sh7750_regs.h<br>
&gt; =C2=A0 =C2=A0 include/hw/cris/etraxfs_dma.h<br>
&gt; =C2=A0 =C2=A0 linux-user/alpha/termbits.h<br>
&gt; =C2=A0 =C2=A0 linux-user/arm/nwfpe/fpopcode.h<br>
&gt; =C2=A0 =C2=A0 linux-user/arm/nwfpe/fpsr.h<br>
&gt; =C2=A0 =C2=A0 linux-user/arm/syscall_nr.h<br>
&gt; =C2=A0 =C2=A0 linux-user/arm/target_signal.h<br>
&gt; =C2=A0 =C2=A0 linux-user/cris/target_signal.h<br>
&gt; =C2=A0 =C2=A0 linux-user/i386/target_signal.h<br>
&gt; =C2=A0 =C2=A0 linux-user/linux_loop.h<br>
&gt; =C2=A0 =C2=A0 linux-user/m68k/target_signal.h<br>
&gt; =C2=A0 =C2=A0 linux-user/microblaze/target_signal.h<br>
&gt; =C2=A0 =C2=A0 linux-user/mips64/target_signal.h<br>
&gt; =C2=A0 =C2=A0 linux-user/mips/target_signal.h<br>
&gt; =C2=A0 =C2=A0 linux-user/mips/target_syscall.h<br>
&gt; =C2=A0 =C2=A0 linux-user/mips/termbits.h<br>
&gt; =C2=A0 =C2=A0 linux-user/ppc/target_signal.h<br>
&gt; =C2=A0 =C2=A0 linux-user/sh4/target_signal.h<br>
&gt; =C2=A0 =C2=A0 linux-user/sh4/termbits.h<br>
&gt; =C2=A0 =C2=A0 linux-user/sparc64/target_syscall.h<br>
&gt; =C2=A0 =C2=A0 linux-user/sparc/target_signal.h<br>
&gt; =C2=A0 =C2=A0 linux-user/x86_64/target_signal.h<br>
&gt; =C2=A0 =C2=A0 linux-user/x86_64/termbits.h<br>
&gt; =C2=A0 =C2=A0 pc-bios/optionrom/optionrom.h<br>
&gt; =C2=A0 =C2=A0 slirp/mbuf.h<br>
&gt; =C2=A0 =C2=A0 slirp/misc.h<br>
&gt; =C2=A0 =C2=A0 slirp/sbuf.h<br>
&gt; =C2=A0 =C2=A0 slirp/tcp.h<br>
&gt; =C2=A0 =C2=A0 slirp/tcp_timer.h<br>
&gt; =C2=A0 =C2=A0 slirp/tcp_var.h<br>
&gt; =C2=A0 =C2=A0 target/i386/svm.h<br>
&gt; =C2=A0 =C2=A0 target/sparc/asi.h<br>
&gt; =C2=A0 =C2=A0 target/xtensa/core-dc232b/xtensa-modules.inc.c<br>
&gt; =C2=A0 =C2=A0 target/xtensa/core-dc233c/xtensa-modules.inc.c<br>
&gt; =C2=A0 =C2=A0 target/xtensa/core-de212/core-isa.h<br>
&gt; =C2=A0 =C2=A0 target/xtensa/core-de212/xtensa-modules.inc.c<br>
&gt; =C2=A0 =C2=A0 target/xtensa/core-fsf/xtensa-modules.inc.c<br>
&gt; =C2=A0 =C2=A0 target/xtensa/core-sample_controller/core-isa.h<br>
&gt; =C2=A0 =C2=A0 target/xtensa/core-sample_controller/xtensa-modules.inc.=
c<br>
&gt; =C2=A0 =C2=A0 target/xtensa/core-test_kc705_be/core-isa.h<br>
&gt; =C2=A0 =C2=A0 target/xtensa/core-test_kc705_be/xtensa-modules.inc.c<br=
>
&gt; =C2=A0 =C2=A0 tests/tcg/cris/check_abs.c<br>
&gt; =C2=A0 =C2=A0 tests/tcg/cris/check_addc.c<br>
&gt; =C2=A0 =C2=A0 tests/tcg/cris/check_addcm.c<br>
&gt; =C2=A0 =C2=A0 tests/tcg/cris/check_addoq.c<br>
&gt; =C2=A0 =C2=A0 tests/tcg/cris/check_bound.c<br>
&gt; =C2=A0 =C2=A0 tests/tcg/cris/check_ftag.c<br>
&gt; =C2=A0 =C2=A0 tests/tcg/cris/check_int64.c<br>
&gt; =C2=A0 =C2=A0 tests/tcg/cris/check_lz.c<br>
&gt; =C2=A0 =C2=A0 tests/tcg/cris/check_openpf5.c<br>
&gt; =C2=A0 =C2=A0 tests/tcg/cris/check_sigalrm.c<br>
&gt; =C2=A0 =C2=A0 tests/tcg/cris/crisutils.h<br>
&gt; =C2=A0 =C2=A0 tests/tcg/cris/sys.c<br>
&gt; =C2=A0 =C2=A0 tests/tcg/i386/test-i386-ssse3.c<br>
&gt; =C2=A0 =C2=A0 ui/vgafont.h<br>
&gt;<br>
&gt; Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com=
">pbonzini@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0block/bochs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 22 ++---<br>
&gt; =C2=A0block/file-posix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; =C2=A0block/file-win32.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 8 +-<br>
&gt; =C2=A0block/linux-aio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +-<br>
&gt; =C2=A0block/qcow2-cluster.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; =C2=A0block/vpc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br=
>
&gt; =C2=A0bsd-user/elfload.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; =C2=A0contrib/elf2dmp/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; =C2=A0hw/alpha/typhoon.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 12 +--<br>
&gt; =C2=A0hw/arm/stellaris.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; =C2=A0hw/arm/virt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; =C2=A0hw/char/sh_serial.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 18 ++---<br>
&gt; =C2=A0hw/char/virtio-serial-bus.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; =C2=A0hw/char/xen_console.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 58 ++++++-------<br>
&gt; =C2=A0hw/core/loader.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 28 +++----<br>
&gt; =C2=A0hw/display/tc6393xb.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +-<br>
&gt; =C2=A0hw/display/vga.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 8 +-<br>
&gt; =C2=A0hw/display/virtio-gpu-3d.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +-<br>
&gt; =C2=A0hw/dma/pxa2xx_dma.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +-<br>
&gt; =C2=A0hw/dma/soc_dma.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; =C2=A0hw/gpio/max7310.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; =C2=A0hw/i386/xen/xen-hvm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +-<br>
&gt; =C2=A0hw/ide/core.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 94 +++++++++++---=
--------<br>
&gt; =C2=A0hw/input/lm832x.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; =C2=A0hw/input/pckbd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; =C2=A0hw/input/tsc210x.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; =C2=A0hw/intc/apic.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; =C2=A0hw/mips/gt64xxx_pci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +-<br>
&gt; =C2=A0hw/mips/mips_r4k.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +-<br>
&gt; =C2=A0hw/misc/max111x.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +-<br>
&gt; =C2=A0hw/misc/omap_l4.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +-<br>
&gt; =C2=A0hw/net/mipsnet.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 16 ++--<br>
&gt; =C2=A0hw/net/ne2000.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 44 +++++-----<br>
&gt; =C2=A0hw/net/rocker/rocker.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; =C2=A0hw/net/virtio-net.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +-<br>
&gt; =C2=A0hw/net/vmxnet3.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +-<br>
&gt; =C2=A0hw/pci/msix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; =C2=A0hw/pci/pci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 44 +++++-----<=
br>
&gt; =C2=A0hw/pci/pci_bridge.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; =C2=A0hw/ppc/ppc405_uc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; =C2=A0hw/ppc/prep.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +-<br>
&gt; =C2=A0hw/scsi/lsi53c895a.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +-<br>
&gt; =C2=A0hw/sh4/r2d.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 16 ++--<br>
&gt; =C2=A0hw/usb/dev-bluetooth.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; =C2=A0hw/usb/dev-hid.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +-<br>
&gt; =C2=A0hw/usb/dev-hub.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 ++--<br>
&gt; =C2=A0hw/xen/xen_devconfig.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; =C2=A0hw/xenpv/xen_domainbuild.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 8 +-<br>
&gt; =C2=A0include/elf.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 +--<br>
&gt; =C2=A0include/hw/acpi/acpi.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 ++--<br>
&gt; =C2=A0include/hw/elf_ops.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; =C2=A0include/hw/ide/internal.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; =C2=A0include/hw/sh4/sh_intc.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 20 ++---<br>
&gt; =C2=A0include/hw/xen/io/ring.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +-<br>
&gt; =C2=A0include/qemu/acl.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 ++--<br>
&gt; =C2=A0include/qemu/iov.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; =C2=A0include/scsi/constants.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; =C2=A0include/sysemu/balloon.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; =C2=A0linux-user/linuxload.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 ++--<br>
&gt; =C2=A0linux-user/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +-<br>
&gt; =C2=A0linux-user/mmap.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 +--<br>
&gt; =C2=A0linux-user/qemu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +-<br>
&gt; =C2=A0linux-user/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 16 ++--<br>
&gt; =C2=A0linux-user/strace.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +-<br>
&gt; =C2=A0linux-user/uaccess.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; =C2=A0linux-user/vm86.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; =C2=A0nbd/client.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; =C2=A0net/checksum.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; =C2=A0qtest.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 4 +-<br>
&gt; =C2=A0target/alpha/translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; =C2=A0target/cris/helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; =C2=A0target/cris/mmu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 +--<br>
&gt; =C2=A0target/cris/translate_v10.inc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; =C2=A0target/i386/translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12 +--<br>
&gt; =C2=A0target/mips/translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; =C2=A0target/tilegx/translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; =C2=A0tcg/i386/tcg-target.inc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +-<br>
&gt; =C2=A0tests/tcg/alpha/test-cond.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +-<br>
&gt; =C2=A0tests/tcg/arm/hello-arm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 20 ++---<br>
&gt; =C2=A0tests/tcg/cris/check_glibc_kernelversion.c |=C2=A0 8 +-<br>
&gt; =C2=A0tests/tcg/cris/check_mmap3.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; =C2=A0tests/tcg/cris/check_openpf1.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; =C2=A0tests/tcg/cris/check_settls1.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; =C2=A0tests/tcg/i386/hello-i386.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 14 ++--<br>
&gt; =C2=A0tests/tcg/mips/hello-mips.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 10 +--<br>
&gt; =C2=A0tests/tcg/multiarch/sha1.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 12 +--<br>
&gt; =C2=A0tests/vhost-user-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +-<br>
&gt; =C2=A0ui/keymaps.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +-<br>
&gt; =C2=A0ui/qemu-pixman.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; =C2=A0ui/vnc-enc-zywrle-template.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +-<br>
&gt; =C2=A0ui/vnc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 4 +-<br>
&gt; =C2=A0util/bitops.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +-<br>
&gt; =C2=A0util/osdep.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +-<br>
&gt; =C2=A0util/qemu-sockets.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +-<br>
&gt; =C2=A094 files changed, 388 insertions(+), 388 deletions(-)<br>
&gt;<br>
&gt; diff --git a/block/bochs.c b/block/bochs.c<br>
&gt; index 22e7d44211..79f95d3b50 100644<br>
&gt; --- a/block/bochs.c<br>
&gt; +++ b/block/bochs.c<br>
&gt; @@ -85,14 +85,14 @@ static int bochs_probe(const uint8_t *buf, int buf=
_size, const char *filename)<br>
&gt; =C2=A0 =C2=A0 =C2=A0const struct bochs_header *bochs =3D (const void *=
)buf;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (buf_size &lt; HEADER_SIZE)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (!strcmp(bochs-&gt;magic, HEADER_MAGIC) &amp;&a=
mp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0!strcmp(bochs-&gt;type, REDOLOG_TYPE) &amp=
;&amp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0!strcmp(bochs-&gt;subtype, GROWING_TYPE) &=
amp;&amp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0((le32_to_cpu(bochs-&gt;version) =3D=3D HE=
ADER_VERSION) ||<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0(le32_to_cpu(bochs-&gt;version) =3D=3D HEA=
DER_V1)))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return 100;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 !strcmp(bochs-&gt;type, REDOLOG_TYPE) &am=
p;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 !strcmp(bochs-&gt;subtype, GROWING_TYPE) =
&amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ((le32_to_cpu(bochs-&gt;version) =3D=3D H=
EADER_VERSION) ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (le32_to_cpu(bochs-&gt;version) =3D=3D HE=
ADER_V1)))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 100;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; =C2=A0}<br>
&gt; @@ -125,8 +125,8 @@ static int bochs_open(BlockDriverState *bs, QDict =
*options, int flags,<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (strcmp(bochs.magic, HEADER_MAGIC) ||<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strcmp(bochs.type, REDOLOG_TYPE) ||<=
br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strcmp(bochs.subtype, GROWING_TYPE) =
||<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0((le32_to_cpu(bochs.version) !=3D HEADER_V=
ERSION) &amp;&amp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0(le32_to_cpu(bochs.version) !=3D HEADER_V1=
))) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ((le32_to_cpu(bochs.version) !=3D HEADER_=
VERSION) &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (le32_to_cpu(bochs.version) !=3D HEADER_V=
1))) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;Image not in =
Bochs format&quot;);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -158,7 +158,7 @@ static int bochs_open(BlockDriverState *bs, QDict =
*options, int flags,<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; s-&gt;catalog_size; i++)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0le32_to_cpus(&amp;s-&gt;catalog_bitmap[i])=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 le32_to_cpus(&amp;s-&gt;catalog_bitmap[i]=
);<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0s-&gt;data_offset =3D le32_to_cpu(bochs.header) + =
(s-&gt;catalog_size * 4);<br>
&gt;<br>
&gt; @@ -217,7 +217,7 @@ static int64_t seek_to_sector(BlockDriverState *bs=
, int64_t sector_num)<br>
&gt; =C2=A0 =C2=A0 =C2=A0extent_offset =3D (offset % s-&gt;extent_size) / 5=
12;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (s-&gt;catalog_bitmap[extent_index] =3D=3D 0xff=
ffffff) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0; /* not allocated */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0; /* not allocated */<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0bitmap_offset =3D s-&gt;data_offset +<br>
&gt; @@ -232,7 +232,7 @@ static int64_t seek_to_sector(BlockDriverState *bs=
, int64_t sector_num)<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (!((bitmap_entry &gt;&gt; (extent_offset % 8)) =
&amp; 1)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0; /* not allocated */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0; /* not allocated */<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0return bitmap_offset + (512 * (s-&gt;bitmap_blocks=
 + extent_offset));<br>
&gt; diff --git a/block/file-posix.c b/block/file-posix.c<br>
&gt; index 07bbdab953..5c66c3b2bc 100644<br>
&gt; --- a/block/file-posix.c<br>
&gt; +++ b/block/file-posix.c<br>
&gt; @@ -2117,7 +2117,7 @@ again:<br>
&gt; =C2=A0#endif<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (!fstat(fd, &amp;sb) &amp;&amp; (S_IFCHR &amp; =
sb.st_mode)) {<br>
&gt; =C2=A0#ifdef DIOCGMEDIASIZE<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ioctl(fd, DIOCGMEDIASIZE, (off_t *)&am=
p;size))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ioctl(fd, DIOCGMEDIASIZE, (off_t *)&a=
mp;size))<br>
&gt; =C2=A0#elif defined(DIOCGPART)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct p=
artinfo pi;<br>
&gt; diff --git a/block/file-win32.c b/block/file-win32.c<br>
&gt; index f1e2187f3b..6b2d67b239 100644<br>
&gt; --- a/block/file-win32.c<br>
&gt; +++ b/block/file-win32.c<br>
&gt; @@ -176,7 +176,7 @@ int qemu_ftruncate64(int fd, int64_t length)<br>
&gt; =C2=A0 =C2=A0 =C2=A0BOOL res;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0if ((GetVersion() &amp; 0x80000000UL) &amp;&amp; (=
length &gt;&gt; 32) !=3D 0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0h =3D (HANDLE)_get_osfhandle(fd);<br>
&gt;<br>
&gt; @@ -184,13 +184,13 @@ int qemu_ftruncate64(int fd, int64_t length)<br>
&gt; =C2=A0 =C2=A0 =C2=A0li.HighPart =3D 0;<br>
&gt; =C2=A0 =C2=A0 =C2=A0li.LowPart =3D SetFilePointer (h, 0, &amp;li.HighP=
art, FILE_CURRENT);<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (li.LowPart =3D=3D INVALID_SET_FILE_POINTER &am=
p;&amp; GetLastError() !=3D NO_ERROR) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0high =3D length &gt;&gt; 32;<br>
&gt; =C2=A0 =C2=A0 =C2=A0dw =3D SetFilePointer(h, (DWORD) length, &amp;high=
, FILE_BEGIN);<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (dw =3D=3D INVALID_SET_FILE_POINTER &amp;&amp; =
GetLastError() !=3D NO_ERROR) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0res =3D SetEndOfFile(h);<br>
&gt;<br>
&gt; @@ -203,7 +203,7 @@ static int set_sparse(int fd)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0DWORD returned;<br>
&gt; =C2=A0 =C2=A0 =C2=A0return (int) DeviceIoControl((HANDLE)_get_osfhandl=
e(fd), FSCTL_SET_SPARSE,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, 0, NULL, 0, &amp;returned,=
 NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, 0, NULL, 0, &amp;ret=
urned, NULL);<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; =C2=A0static void raw_detach_aio_context(BlockDriverState *bs)<br>
&gt; diff --git a/block/linux-aio.c b/block/linux-aio.c<br>
&gt; index 217ce60138..d4b61fb251 100644<br>
&gt; --- a/block/linux-aio.c<br>
&gt; +++ b/block/linux-aio.c<br>
&gt; @@ -384,10 +384,10 @@ static int laio_do_submit(int fd, struct qemu_la=
iocb *laiocb, off_t offset,<br>
&gt; =C2=A0 =C2=A0 =C2=A0switch (type) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0case QEMU_AIO_WRITE:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0io_prep_pwritev(iocbs, fd, qiov-&gt;=
iov, qiov-&gt;niov, offset);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case QEMU_AIO_READ:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0io_prep_preadv(iocbs, fd, qiov-&gt;i=
ov, qiov-&gt;niov, offset);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0/* Currently Linux kernel does not support other o=
perations */<br>
&gt; =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;%s: invalid AI=
O request type 0x%x.\n&quot;,<br>
&gt; diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c<br>
&gt; index d37fe08b3d..0145ce5218 100644<br>
&gt; --- a/block/qcow2-cluster.c<br>
&gt; +++ b/block/qcow2-cluster.c<br>
&gt; @@ -402,7 +402,7 @@ static int count_contiguous_clusters(int nb_cluste=
rs, int cluster_size,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return i;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return i;<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; =C2=A0/*<br>
&gt; diff --git a/block/vpc.c b/block/vpc.c<br>
&gt; index 80c5b2b197..d886465b7e 100644<br>
&gt; --- a/block/vpc.c<br>
&gt; +++ b/block/vpc.c<br>
&gt; @@ -187,7 +187,7 @@ static uint32_t vpc_checksum(uint8_t* buf, size_t =
size)<br>
&gt; =C2=A0static int vpc_probe(const uint8_t *buf, int buf_size, const cha=
r *filename)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (buf_size &gt;=3D 8 &amp;&amp; !strncmp((char *=
)buf, &quot;conectix&quot;, 8))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return 100;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 100;<br>
&gt; =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c<br>
&gt; index 7cccf3eb8b..32378af7b2 100644<br>
&gt; --- a/bsd-user/elfload.c<br>
&gt; +++ b/bsd-user/elfload.c<br>
&gt; @@ -1367,7 +1367,7 @@ int load_elf_binary(struct linux_binprm * bprm, =
struct target_pt_regs * regs,<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (!have_guest_base) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Go through ELF program header tab=
le and find out whether<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 * any of the segments drop below our curr=
ent mmap_min_addr and<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* any of the segments drop below ou=
r current mmap_min_addr and<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * in that case set guest_base to co=
rresponding address.<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0, elf_ppnt =3D elf_phdat=
a; i &lt; elf_ex.e_phnum;<br>
&gt; diff --git a/contrib/elf2dmp/main.c b/contrib/elf2dmp/main.c<br>
&gt; index 9b93dab662..7115b0d6d0 100644<br>
&gt; --- a/contrib/elf2dmp/main.c<br>
&gt; +++ b/contrib/elf2dmp/main.c<br>
&gt; @@ -296,7 +296,7 @@ static int fill_header(WinDumpHeader64 *hdr, struc=
t pa_space *ps,<br>
&gt; =C2=A0static int fill_context(KDDEBUGGER_DATA64 *kdbg,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct va_space *vs, QEMU_Elf *qe)<b=
r>
&gt; =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 int i;<br>
&gt; =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; qe-&gt;state_nr; i++) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t Prcb;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t Context;<br>
&gt; diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c<br>
&gt; index 8004afe45b..ad79638ffa 100644<br>
&gt; --- a/hw/alpha/typhoon.c<br>
&gt; +++ b/hw/alpha/typhoon.c<br>
&gt; @@ -657,8 +657,8 @@ static bool window_translate(TyphoonWindow *win, h=
waddr addr,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pte_addr |=3D (addr &amp; (wsm | 0xf=
e000)) &gt;&gt; 10;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return pte_translate(pte_addr, ret);=
<br>
&gt; =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Direct-mapped translation.=C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return make_iommu_tlbe(tba &amp; ~wsm_ext,=
 wsm_ext, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Direct-mapped translation.=C2=A0 */<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return make_iommu_tlbe(tba &amp; ~wsm_ext=
, wsm_ext, ret);<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; @@ -693,7 +693,7 @@ static IOMMUTLBEntry typhoon_translate_iommu(IOMMU=
MemoryRegion *iommu,<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Check the fourth window for DAC d=
isable.=C2=A0 */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((pchip-&gt;win[3].wba &amp; 0x80=
000000000ull) =3D=3D 0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; window_translate(=
&amp;pchip-&gt;win[3], addr, &amp;ret)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; window_translate=
(&amp;pchip-&gt;win[3], addr, &amp;ret)) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto success;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; @@ -704,7 +704,7 @@ static IOMMUTLBEntry typhoon_translate_iommu(IOMMU=
MemoryRegion *iommu,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pchip-&gt;ctl &amp=
; 0x40) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* See 1=
0.1.4.4; in particular &lt;39:35&gt; is ignored.=C2=A0 */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0make_iom=
mu_tlbe(0, 0x007ffffffffull, &amp;ret);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto success;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto success;=
<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; @@ -716,8 +716,8 @@ static IOMMUTLBEntry typhoon_translate_iommu(IOMMU=
MemoryRegion *iommu,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pte_addr=
=C2=A0 =3D pchip-&gt;win[3].tba &amp; 0x7ffc00000ull;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pte_addr=
 |=3D (addr &amp; 0xffffe000u) &gt;&gt; 10;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pte_=
translate(pte_addr, &amp;ret)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0goto success;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 goto success;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c<br>
&gt; index 6c69ce79b2..442529cc65 100644<br>
&gt; --- a/hw/arm/stellaris.c<br>
&gt; +++ b/hw/arm/stellaris.c<br>
&gt; @@ -131,7 +131,7 @@ static void gptm_tick(void *opaque)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;state |=3D 1;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((s-&gt;control &amp; 0x20)) {<br=
>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Output trigger.=C2=
=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_irq_pulse(s-&gt;trigger=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_irq_pulse(s-&gt;trigge=
r);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;mode[0] &amp; 1) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* One-shot.=C2=A0 */<=
br>
&gt; diff --git a/hw/arm/virt.c b/hw/arm/virt.c<br>
&gt; index 17f1b49d11..ad6fa8e3c6 100644<br>
&gt; --- a/hw/arm/virt.c<br>
&gt; +++ b/hw/arm/virt.c<br>
&gt; @@ -1854,7 +1854,7 @@ static const TypeInfo virt_machine_info =3D {<br=
>
&gt; =C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(VirtMachineState),<br>
&gt; =C2=A0 =C2=A0 =C2=A0.class_size=C2=A0 =C2=A0 =3D sizeof(VirtMachineCla=
ss),<br>
&gt; =C2=A0 =C2=A0 =C2=A0.class_init=C2=A0 =C2=A0 =3D virt_machine_class_in=
it,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.instance_init =3D virt_instance_init,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .instance_init =3D virt_instance_init,<br=
>
&gt; =C2=A0 =C2=A0 =C2=A0.interfaces =3D (InterfaceInfo[]) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { TYPE_HOTPLUG_HANDLER },<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { }<br>
&gt; diff --git a/hw/char/sh_serial.c b/hw/char/sh_serial.c<br>
&gt; index 12831561a6..67740b7ee6 100644<br>
&gt; --- a/hw/char/sh_serial.c<br>
&gt; +++ b/hw/char/sh_serial.c<br>
&gt; @@ -90,7 +90,7 @@ static void sh_serial_write(void *opaque, hwaddr off=
s,<br>
&gt;<br>
&gt; =C2=A0#ifdef DEBUG_SERIAL<br>
&gt; =C2=A0 =C2=A0 =C2=A0printf(&quot;sh_serial: write offs=3D0x%02x val=3D=
0x%02x\n&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offs, val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offs, val);<br>
&gt; =C2=A0#endif<br>
&gt; =C2=A0 =C2=A0 =C2=A0switch(offs) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0case 0x00: /* SMR */<br>
&gt; @@ -98,17 +98,17 @@ static void sh_serial_write(void *opaque, hwaddr o=
ffs,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case 0x04: /* BRR */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;brr =3D val;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case 0x08: /* SCR */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* TODO : For SH7751, SCIF mask shou=
ld be 0xfb. */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;scr =3D val &amp; ((s-&gt;feat=
 &amp; SH_SERIAL_FEAT_SCIF) ? 0xfa : 0xff);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(val &amp; (1 &lt;&lt; 5)))<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;flags |=3D SH_SE=
RIAL_FLAG_TEND;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((s-&gt;feat &amp; SH_SERIAL_FEAT=
_SCIF) &amp;&amp; s-&gt;txi) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_set_irq(s-&gt;txi, val =
&amp; (1 &lt;&lt; 7));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_set_irq(s-&gt;txi, val=
 &amp; (1 &lt;&lt; 7));<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(val &amp; (1 &lt;&lt; 6))) {<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_set_irq(s-&gt;rxi, 0);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_set_irq(s-&gt;rxi, 0);=
<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case 0x0c: /* FTDR / TDR */<br>
&gt; @@ -117,9 +117,9 @@ static void sh_serial_write(void *opaque, hwaddr o=
ffs,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* XXX this blocks ent=
ire thread. Rewrite to use<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * qemu_chr_fe_write a=
nd background I/O callbacks */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_chr_fe_write_all(=
&amp;s-&gt;chr, &amp;ch, 1);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;dr =3D val;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;flags &amp;=3D ~SH_SERIAL_FLAG_TDE;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;dr =3D val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;flags &amp;=3D ~SH_SERIAL_FLAG_TDE;=
<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; =C2=A0#if 0<br>
&gt; =C2=A0 =C2=A0 =C2=A0case 0x14: /* FRDR / RDR */<br>
&gt; @@ -210,7 +210,7 @@ static uint64_t sh_serial_read(void *opaque, hwadd=
r offs,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case 0x04:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D s-&gt;brr;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case 0x08:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D s-&gt;scr;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; @@ -288,7 +288,7 @@ static uint64_t sh_serial_read(void *opaque, hwadd=
r offs,<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0#ifdef DEBUG_SERIAL<br>
&gt; =C2=A0 =C2=A0 =C2=A0printf(&quot;sh_serial: read offs=3D0x%02x val=3D0=
x%x\n&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offs, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offs, ret);<br>
&gt; =C2=A0#endif<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (ret &amp; ~((1 &lt;&lt; 16) - 1)) {<br>
&gt; diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c=
<br>
&gt; index 04e3ebe352..d76351d748 100644<br>
&gt; --- a/hw/char/virtio-serial-bus.c<br>
&gt; +++ b/hw/char/virtio-serial-bus.c<br>
&gt; @@ -696,7 +696,7 @@ static void virtio_serial_save_device(VirtIODevice=
 *vdev, QEMUFile *f)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_put_byte(f, port-&gt;guest_conn=
ected);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_put_byte(f, port-&gt;host_conne=
cted);<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0elem_popped =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 elem_popped =3D 0;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (port-&gt;elem) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elem_popped =3D 1;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c<br>
&gt; index 44f7236382..b1a1e66d5a 100644<br>
&gt; --- a/hw/char/xen_console.c<br>
&gt; +++ b/hw/char/xen_console.c<br>
&gt; @@ -60,34 +60,34 @@ static void buffer_append(struct XenConsole *con)<=
br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0size =3D prod - cons;<br>
&gt; =C2=A0 =C2=A0 =C2=A0if ((size =3D=3D 0) || (size &gt; sizeof(intf-&gt;=
out)))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0if ((buffer-&gt;capacity - buffer-&gt;size) &lt; s=
ize) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0buffer-&gt;capacity +=3D (size + 1024);<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0buffer-&gt;data =3D g_realloc(buffer-&gt;d=
ata, buffer-&gt;capacity);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 buffer-&gt;capacity +=3D (size + 1024);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 buffer-&gt;data =3D g_realloc(buffer-&gt;=
data, buffer-&gt;capacity);<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0while (cons !=3D prod)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0buffer-&gt;data[buffer-&gt;size++] =3D int=
f-&gt;out[<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MASK_XENCONS_IDX(cons++, int=
f-&gt;out)];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 buffer-&gt;data[buffer-&gt;size++] =3D in=
tf-&gt;out[<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MASK_XENCONS_IDX(cons++, in=
tf-&gt;out)];<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0xen_mb();<br>
&gt; =C2=A0 =C2=A0 =C2=A0intf-&gt;out_cons =3D cons;<br>
&gt; =C2=A0 =C2=A0 =C2=A0xen_pv_send_notify(&amp;con-&gt;xendev);<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (buffer-&gt;max_capacity &amp;&amp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0buffer-&gt;size &gt; buffer-&gt;max_capaci=
ty) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Discard the middle of the data. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 buffer-&gt;size &gt; buffer-&gt;max_capac=
ity) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Discard the middle of the data. */<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t over =3D buffer-&gt;size - buffer-&=
gt;max_capacity;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t *maxpos =3D buffer-&gt;data + buff=
er-&gt;max_capacity;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t over =3D buffer-&gt;size - buffer-=
&gt;max_capacity;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t *maxpos =3D buffer-&gt;data + buf=
fer-&gt;max_capacity;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0memmove(maxpos - over, maxpos, over);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0buffer-&gt;data =3D g_realloc(buffer-&gt;d=
ata, buffer-&gt;max_capacity);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0buffer-&gt;size =3D buffer-&gt;capacity =
=3D buffer-&gt;max_capacity;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 memmove(maxpos - over, maxpos, over);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 buffer-&gt;data =3D g_realloc(buffer-&gt;=
data, buffer-&gt;max_capacity);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 buffer-&gt;size =3D buffer-&gt;capacity =
=3D buffer-&gt;max_capacity;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (buffer-&gt;consumed &gt; buffer-&gt;ma=
x_capacity - over)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buffer-&gt;consumed =3D buff=
er-&gt;max_capacity - over;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (buffer-&gt;consumed &gt; buffer-&gt;m=
ax_capacity - over)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buffer-&gt;consumed =3D buf=
fer-&gt;max_capacity - over;<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; @@ -95,8 +95,8 @@ static void buffer_advance(struct buffer *buffer, si=
ze_t len)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0buffer-&gt;consumed +=3D len;<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (buffer-&gt;consumed =3D=3D buffer-&gt;size) {<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0buffer-&gt;consumed =3D 0;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0buffer-&gt;size =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 buffer-&gt;consumed =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 buffer-&gt;size =3D 0;<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; @@ -111,7 +111,7 @@ static int ring_free_bytes(struct XenConsole *con)=
<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0space =3D prod - cons;<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (space &gt; sizeof(intf-&gt;in))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0; /* ring is screwed: ignore it */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0; /* ring is screwed: ignore it *=
/<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0return (sizeof(intf-&gt;in) - space);<br>
&gt; =C2=A0}<br>
&gt; @@ -132,12 +132,12 @@ static void xencons_receive(void *opaque, const =
uint8_t *buf, int len)<br>
&gt; =C2=A0 =C2=A0 =C2=A0max =3D ring_free_bytes(con);<br>
&gt; =C2=A0 =C2=A0 =C2=A0/* The can_receive() func limits this, but check a=
gain anyway */<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (max &lt; len)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D max;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D max;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0prod =3D intf-&gt;in_prod;<br>
&gt; =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; len; i++) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0intf-&gt;in[MASK_XENCONS_IDX(prod++, intf-=
&gt;in)] =3D<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf[i];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 intf-&gt;in[MASK_XENCONS_IDX(prod++, intf=
-&gt;in)] =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf[i];<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0xen_wmb();<br>
&gt; =C2=A0 =C2=A0 =C2=A0intf-&gt;in_prod =3D prod;<br>
&gt; @@ -228,11 +228,11 @@ static int con_initialise(struct XenDevice *xend=
ev)<br>
&gt; =C2=A0 =C2=A0 =C2=A0int limit;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (xenstore_read_int(con-&gt;console, &quot;ring-=
ref&quot;, &amp;con-&gt;ring_ref) =3D=3D -1)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (xenstore_read_int(con-&gt;console, &quot;port&=
quot;, &amp;con-&gt;xendev.remote_port) =3D=3D -1)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (xenstore_read_int(con-&gt;console, &quot;limit=
&quot;, &amp;limit) =3D=3D 0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0con-&gt;buffer.max_capacity =3D limit;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 con-&gt;buffer.max_capacity =3D limit;<br=
>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (!xendev-&gt;dev) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xen_pfn_t mfn =3D con-&gt;ring_ref;<=
br>
&gt; @@ -244,7 +244,7 @@ static int con_initialise(struct XenDevice *xendev=
)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0PROT_READ | PROT_WRITE);<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (!con-&gt;sring)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0xen_be_bind_evtchn(&amp;con-&gt;xendev);<br>
&gt; =C2=A0 =C2=A0 =C2=A0qemu_chr_fe_set_handlers(&amp;con-&gt;chr, xencons=
_can_receive,<br>
&gt; @@ -252,10 +252,10 @@ static int con_initialise(struct XenDevice *xend=
ev)<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0xen_pv_printf(xendev, 1,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&=
quot;ring mfn %d, remote port %d, local port %d, limit %zd\n&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0con-&gt=
;ring_ref,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0con-&gt=
;xendev.remote_port,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0con-&gt=
;xendev.local_port,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0con-&gt=
;buffer.max_capacity);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 con-&g=
t;ring_ref,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 con-&g=
t;xendev.remote_port,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 con-&g=
t;xendev.local_port,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 con-&g=
t;buffer.max_capacity);<br>
&gt; =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; @@ -282,7 +282,7 @@ static void con_event(struct XenDevice *xendev)<br=
>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0buffer_append(con);<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (con-&gt;buffer.size - con-&gt;buffer.consumed)=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0xencons_send(con);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 xencons_send(con);<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; =C2=A0/* -------------------------------------------------------------=
------- */<br>
&gt; diff --git a/hw/core/loader.c b/hw/core/loader.c<br>
&gt; index aa0b3fc867..0b7762a062 100644<br>
&gt; --- a/hw/core/loader.c<br>
&gt; +++ b/hw/core/loader.c<br>
&gt; @@ -269,26 +269,26 @@ int load_aout(const char *filename, hwaddr addr,=
 int max_sz,<br>
&gt; =C2=A0 =C2=A0 =C2=A0case OMAGIC:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (e.a_text + e.a_data &gt; max_sz)=
<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0lseek(fd, N_TXTOFF(e), SEEK_SET);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D read_targphys(filename, fd, addr,=
 e.a_text + e.a_data);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (size &lt; 0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 lseek(fd, N_TXTOFF(e), SEEK_SET);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D read_targphys(filename, fd, addr=
, e.a_text + e.a_data);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case NMAGIC:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (N_DATADDR(e, target_page_size) +=
 e.a_data &gt; max_sz)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0lseek(fd, N_TXTOFF(e), SEEK_SET);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D read_targphys(filename, fd, addr,=
 e.a_text);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (size &lt; 0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 lseek(fd, N_TXTOFF(e), SEEK_SET);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D read_targphys(filename, fd, addr=
, e.a_text);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D read_targphys(filename, fd, =
addr + N_DATADDR(e, target_page_size),<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0e.a_data);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0size +=3D ret;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 size +=3D ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0close(fd);<br>
&gt; =C2=A0 =C2=A0 =C2=A0return size;<br>
&gt; diff --git a/hw/display/tc6393xb.c b/hw/display/tc6393xb.c<br>
&gt; index 3360be6f84..e1b1e302f2 100644<br>
&gt; --- a/hw/display/tc6393xb.c<br>
&gt; +++ b/hw/display/tc6393xb.c<br>
&gt; @@ -319,7 +319,7 @@ static void tc6393xb_scr_writeb(TC6393xbState *s, =
hwaddr addr, uint32_t value)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SCR_REG_B(DEBUG);<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;tc6393xb_scr: unhandled writ=
e at %08x: %02x\n&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(uint=
32_t) addr, value &amp; 0xff);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (uin=
t32_t) addr, value &amp; 0xff);<br>
&gt; =C2=A0}<br>
&gt; =C2=A0#undef SCR_REG_B<br>
&gt; =C2=A0#undef SCR_REG_W<br>
&gt; @@ -358,7 +358,7 @@ static void tc6393xb_nand_cfg_writeb(TC6393xbState=
 *s, hwaddr addr, uint32_t val<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;tc6393xb_nand_cfg: unhandled=
 write at %08x: %02x\n&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(uint=
32_t) addr, value &amp; 0xff);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (uin=
t32_t) addr, value &amp; 0xff);<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; =C2=A0static uint32_t tc6393xb_nand_readb(TC6393xbState *s, hwaddr add=
r) {<br>
&gt; @@ -421,7 +421,7 @@ static void tc6393xb_nand_writeb(TC6393xbState *s,=
 hwaddr addr, uint32_t value)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;tc6393xb_nand: unhandled wri=
te at %08x: %02x\n&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(uint=
32_t) addr, value &amp; 0xff);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (uin=
t32_t) addr, value &amp; 0xff);<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; =C2=A0#define BITS 8<br>
&gt; diff --git a/hw/display/vga.c b/hw/display/vga.c<br>
&gt; index 3ba3f6853c..910a23c12e 100644<br>
&gt; --- a/hw/display/vga.c<br>
&gt; +++ b/hw/display/vga.c<br>
&gt; @@ -85,10 +85,10 @@ const uint8_t gr_mask[16] =3D {<br>
&gt;<br>
&gt; =C2=A0#define cbswap_32(__x) \<br>
&gt; =C2=A0((uint32_t)( \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(((uint32_t)(_=
_x) &amp; (uint32_t)0x000000ffUL) &lt;&lt; 24) | \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(((uint32_t)(_=
_x) &amp; (uint32_t)0x0000ff00UL) &lt;&lt;=C2=A0 8) | \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(((uint32_t)(_=
_x) &amp; (uint32_t)0x00ff0000UL) &gt;&gt;=C2=A0 8) | \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(((uint32_t)(_=
_x) &amp; (uint32_t)0xff000000UL) &gt;&gt; 24) ))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (((uint32_t)(=
__x) &amp; (uint32_t)0x000000ffUL) &lt;&lt; 24) | \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (((uint32_t)(=
__x) &amp; (uint32_t)0x0000ff00UL) &lt;&lt;=C2=A0 8) | \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (((uint32_t)(=
__x) &amp; (uint32_t)0x00ff0000UL) &gt;&gt;=C2=A0 8) | \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (((uint32_t)(=
__x) &amp; (uint32_t)0xff000000UL) &gt;&gt; 24) ))<br>
&gt;<br>
&gt; =C2=A0#ifdef HOST_WORDS_BIGENDIAN<br>
&gt; =C2=A0#define PAT(x) cbswap_32(x)<br>
&gt; diff --git a/hw/display/virtio-gpu-3d.c b/hw/display/virtio-gpu-3d.c<b=
r>
&gt; index 55d76405a9..bc6e99c943 100644<br>
&gt; --- a/hw/display/virtio-gpu-3d.c<br>
&gt; +++ b/hw/display/virtio-gpu-3d.c<br>
&gt; @@ -498,9 +498,9 @@ static void virgl_write_fence(void *opaque, uint32=
_t fence)<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0QTAILQ_FOREACH_SAFE(cmd, &amp;g-&gt;fenceq, next, =
tmp) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 * the guest can end up emitting fences ou=
t of order<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 * so we should check all fenced cmds not =
just the first one.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* the guest can end up emitting fen=
ces out of order<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* so we should check all fenced cmd=
s not just the first one.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cmd-&gt;cmd_hdr.fence_id &gt; fe=
nce) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; diff --git a/hw/dma/pxa2xx_dma.c b/hw/dma/pxa2xx_dma.c<br>
&gt; index f4eb26cf17..d498de8ffe 100644<br>
&gt; --- a/hw/dma/pxa2xx_dma.c<br>
&gt; +++ b/hw/dma/pxa2xx_dma.c<br>
&gt; @@ -228,7 +228,7 @@ static void pxa2xx_dma_run(PXA2xxDMAState *s)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0!(ch-&gt;state &amp; DCSR_NODESCFETCH))<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pxa2xx_dma_descriptor_fetch(s, c);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 }<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ch-&gt;c=
md =3D (ch-&gt;cmd &amp; ~DCMD_LEN) | length;<br>
&gt; @@ -283,7 +283,7 @@ static uint64_t pxa2xx_dma_read(void *opaque, hwad=
dr offset,<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case DCSR0 ... DCSR31:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0channel =3D offset &gt;&gt; 2;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;chan[channel].request)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;chan[channel].request)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return s-&gt;chan[chan=
nel].state | DCSR_REQPEND;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return s-&gt;chan[channel].state;<br=
>
&gt;<br>
&gt; diff --git a/hw/dma/soc_dma.c b/hw/dma/soc_dma.c<br>
&gt; index 45516241c6..58502721fa 100644<br>
&gt; --- a/hw/dma/soc_dma.c<br>
&gt; +++ b/hw/dma/soc_dma.c<br>
&gt; @@ -345,7 +345,7 @@ void soc_dma_port_add_mem(struct soc_dma_s *soc, u=
int8_t *phys_base,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while (entry &lt; dma-=
&gt;memmap + dma-&gt;memmap_size &amp;&amp;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0entry-&gt;addr &lt;=3D virt_base)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0entry ++=
;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memmove(entry + 1, entry,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0(uint8_t *) (dma-&gt;memmap + dma-&gt;memmap_size ++) -=
<br>
&gt; diff --git a/hw/gpio/max7310.c b/hw/gpio/max7310.c<br>
&gt; index a560e3afd2..1a2478b5a9 100644<br>
&gt; --- a/hw/gpio/max7310.c<br>
&gt; +++ b/hw/gpio/max7310.c<br>
&gt; @@ -118,7 +118,7 @@ static int max7310_tx(I2CSlave *i2c, uint8_t data)=
<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case 0x00: /* Input port - ignore writes */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; =C2=A0#ifdef VERBOSE<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;%s: unknown register %0=
2x\n&quot;, __func__, s-&gt;command);<br>
&gt; diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c<br>
&gt; index 935a3676c8..bf4812cfc9 100644<br>
&gt; --- a/hw/i386/xen/xen-hvm.c<br>
&gt; +++ b/hw/i386/xen/xen-hvm.c<br>
&gt; @@ -570,7 +570,7 @@ static void xen_io_del(MemoryListener *listener,<b=
r>
&gt; =C2=A0}<br>
&gt;<br>
&gt; =C2=A0static void xen_device_realize(DeviceListener *listener,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DeviceState *dev)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DeviceState *dev)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0XenIOState *state =3D container_of(listener, XenIO=
State, device_listener);<br>
&gt;<br>
&gt; @@ -588,7 +588,7 @@ static void xen_device_realize(DeviceListener *lis=
tener,<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; =C2=A0static void xen_device_unrealize(DeviceListener *listener,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DeviceState *dev)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DeviceState *dev)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0XenIOState *state =3D container_of(listener, XenIO=
State, device_listener);<br>
&gt;<br>
&gt; diff --git a/hw/ide/core.c b/hw/ide/core.c<br>
&gt; index 04e22e751d..c3d779db6e 100644<br>
&gt; --- a/hw/ide/core.c<br>
&gt; +++ b/hw/ide/core.c<br>
&gt; @@ -575,16 +575,16 @@ int64_t ide_get_sector(IDEState *s)<br>
&gt; =C2=A0 =C2=A0 =C2=A0int64_t sector_num;<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (s-&gt;select &amp; 0x40) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* lba */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!s-&gt;lba48) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sector_num =3D ((s-&gt;selec=
t &amp; 0x0f) &lt;&lt; 24) | (s-&gt;hcyl &lt;&lt; 16) |<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(s-&gt;lcyl &l=
t;&lt; 8) | s-&gt;sector;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sector_num =3D ((int64_t)s-&=
gt;hob_hcyl &lt;&lt; 40) |<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((int64_t) s-&=
gt;hob_lcyl &lt;&lt; 32) |<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((int64_t) s-&=
gt;hob_sector &lt;&lt; 24) |<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((int64_t) s-&=
gt;hcyl &lt;&lt; 16) |<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((int64_t) s-&=
gt;lcyl &lt;&lt; 8) | s-&gt;sector;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!s-&gt;lba48) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sector_num =3D ((s-&gt;sele=
ct &amp; 0x0f) &lt;&lt; 24) | (s-&gt;hcyl &lt;&lt; 16) |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (s-&gt;lcyl &=
lt;&lt; 8) | s-&gt;sector;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sector_num =3D ((int64_t)s-=
&gt;hob_hcyl &lt;&lt; 40) |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((int64_t) s-=
&gt;hob_lcyl &lt;&lt; 32) |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((int64_t) s-=
&gt;hob_sector &lt;&lt; 24) |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((int64_t) s-=
&gt;hcyl &lt;&lt; 16) |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((int64_t) s-=
&gt;lcyl &lt;&lt; 8) | s-&gt;sector;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sector_num =3D ((s-&gt;hcyl &lt;&lt;=
 8) | s-&gt;lcyl) * s-&gt;heads * s-&gt;sectors +<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(s-&gt;select &amp; 0x=
0f) * s-&gt;sectors + (s-&gt;sector - 1);<br>
&gt; @@ -596,19 +596,19 @@ void ide_set_sector(IDEState *s, int64_t sector_=
num)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0unsigned int cyl, r;<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (s-&gt;select &amp; 0x40) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!s-&gt;lba48) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!s-&gt;lba48) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;select =3D (s-&g=
t;select &amp; 0xf0) | (sector_num &gt;&gt; 24);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;hcyl =3D (sector=
_num &gt;&gt; 16);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;lcyl =3D (sector=
_num &gt;&gt; 8);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;sector =3D (sect=
or_num);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;sector =3D sector_num;=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;lcyl =3D sector_num &g=
t;&gt; 8;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;hcyl =3D sector_num &g=
t;&gt; 16;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;hob_sector =3D sector_=
num &gt;&gt; 24;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;hob_lcyl =3D sector_nu=
m &gt;&gt; 32;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;hob_hcyl =3D sector_nu=
m &gt;&gt; 40;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;sector =3D sector_num=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;lcyl =3D sector_num &=
gt;&gt; 8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;hcyl =3D sector_num &=
gt;&gt; 16;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;hob_sector =3D sector=
_num &gt;&gt; 24;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;hob_lcyl =3D sector_n=
um &gt;&gt; 32;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;hob_hcyl =3D sector_n=
um &gt;&gt; 40;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cyl =3D sector_num / (s-&gt;heads * =
s-&gt;sectors);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D sector_num % (s-&gt;heads * s-=
&gt;sectors);<br>
&gt; @@ -1188,17 +1188,17 @@ static void ide_cmd_lba48_transform(IDEState *=
s, int lba48)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 * full sector count in -&gt;nsector and ignore -&=
gt;hob_nsector from now<br>
&gt; =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (!s-&gt;lba48) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!s-&gt;nsector)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;nsector =3D 256;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!s-&gt;nsector)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;nsector =3D 256;<br>
&gt; =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!s-&gt;nsector &amp;&amp; !s-&gt;hob_n=
sector)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;nsector =3D 65536;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int lo =3D s-&gt;nsector;<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int hi =3D s-&gt;hob_nsector=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!s-&gt;nsector &amp;&amp; !s-&gt;hob_=
nsector)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;nsector =3D 65536;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int lo =3D s-&gt;nsector;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int hi =3D s-&gt;hob_nsecto=
r;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;nsector =3D (hi &lt;&l=
t; 8) | lo;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;nsector =3D (hi &lt;&=
lt; 8) | lo;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; @@ -1258,35 +1258,35 @@ void ide_ioport_write(void *opaque, uint32_t a=
ddr, uint32_t val)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bus-&gt;ifs[1].feature =3D val;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case ATA_IOPORT_WR_SECTOR_COUNT:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ide_clear_hob(bus);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0bus-&gt;ifs[0].hob_nsector =3D bus-&gt;ifs=
[0].nsector;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0bus-&gt;ifs[1].hob_nsector =3D bus-&gt;ifs=
[1].nsector;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ide_clear_hob(bus);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bus-&gt;ifs[0].hob_nsector =3D bus-&gt;if=
s[0].nsector;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bus-&gt;ifs[1].hob_nsector =3D bus-&gt;if=
s[1].nsector;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bus-&gt;ifs[0].nsector =3D val;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bus-&gt;ifs[1].nsector =3D val;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case ATA_IOPORT_WR_SECTOR_NUMBER:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ide_clear_hob(bus);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0bus-&gt;ifs[0].hob_sector =3D bus-&gt;ifs[=
0].sector;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0bus-&gt;ifs[1].hob_sector =3D bus-&gt;ifs[=
1].sector;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ide_clear_hob(bus);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bus-&gt;ifs[0].hob_sector =3D bus-&gt;ifs=
[0].sector;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bus-&gt;ifs[1].hob_sector =3D bus-&gt;ifs=
[1].sector;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bus-&gt;ifs[0].sector =3D val;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bus-&gt;ifs[1].sector =3D val;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case ATA_IOPORT_WR_CYLINDER_LOW:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ide_clear_hob(bus);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0bus-&gt;ifs[0].hob_lcyl =3D bus-&gt;ifs[0]=
.lcyl;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0bus-&gt;ifs[1].hob_lcyl =3D bus-&gt;ifs[1]=
.lcyl;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ide_clear_hob(bus);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bus-&gt;ifs[0].hob_lcyl =3D bus-&gt;ifs[0=
].lcyl;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bus-&gt;ifs[1].hob_lcyl =3D bus-&gt;ifs[1=
].lcyl;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bus-&gt;ifs[0].lcyl =3D val;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bus-&gt;ifs[1].lcyl =3D val;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case ATA_IOPORT_WR_CYLINDER_HIGH:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ide_clear_hob(bus);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0bus-&gt;ifs[0].hob_hcyl =3D bus-&gt;ifs[0]=
.hcyl;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0bus-&gt;ifs[1].hob_hcyl =3D bus-&gt;ifs[1]=
.hcyl;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ide_clear_hob(bus);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bus-&gt;ifs[0].hob_hcyl =3D bus-&gt;ifs[0=
].hcyl;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bus-&gt;ifs[1].hob_hcyl =3D bus-&gt;ifs[1=
].hcyl;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bus-&gt;ifs[0].hcyl =3D val;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bus-&gt;ifs[1].hcyl =3D val;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case ATA_IOPORT_WR_DEVICE_HEAD:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* FIXME: HOB readback uses bit 7 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* FIXME: HOB readback uses bit 7 */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bus-&gt;ifs[0].select =3D (val &amp;=
 ~0x10) | 0xa0;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bus-&gt;ifs[1].select =3D (val | 0x1=
0) | 0xa0;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* select drive */<br>
&gt; @@ -2146,7 +2146,7 @@ uint32_t ide_ioport_read(void *opaque, uint32_t =
addr)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (!hob) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D s-&gt;error;<b=
r>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D s-&gt;hob_feature;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D s-&gt;hob_feature;<=
br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case ATA_IOPORT_RR_SECTOR_COUNT:<br>
&gt; @@ -2155,7 +2155,7 @@ uint32_t ide_ioport_read(void *opaque, uint32_t =
addr)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (!hob) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D s-&gt;nsector =
&amp; 0xff;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D s-&gt;hob_nsector;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D s-&gt;hob_nsector;<=
br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case ATA_IOPORT_RR_SECTOR_NUMBER:<br>
&gt; @@ -2164,7 +2164,7 @@ uint32_t ide_ioport_read(void *opaque, uint32_t =
addr)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (!hob) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D s-&gt;sector;<=
br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D s-&gt;hob_sector;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D s-&gt;hob_sector;<b=
r>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case ATA_IOPORT_RR_CYLINDER_LOW:<br>
&gt; @@ -2173,7 +2173,7 @@ uint32_t ide_ioport_read(void *opaque, uint32_t =
addr)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (!hob) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D s-&gt;lcyl;<br=
>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D s-&gt;hob_lcyl;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D s-&gt;hob_lcyl;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case ATA_IOPORT_RR_CYLINDER_HIGH:<br>
&gt; @@ -2182,7 +2182,7 @@ uint32_t ide_ioport_read(void *opaque, uint32_t =
addr)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (!hob) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D s-&gt;hcyl;<br=
>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D s-&gt;hob_hcyl;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D s-&gt;hob_hcyl;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case ATA_IOPORT_RR_DEVICE_HEAD:<br>
&gt; @@ -2847,7 +2847,7 @@ static const VMStateDescription vmstate_ide_driv=
e_pio_state =3D {<br>
&gt; =C2=A0 =C2=A0 =C2=A0.fields =3D (VMStateField[]) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_INT32(req_nb_sectors, IDESta=
te),<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_VARRAY_INT32(io_buffer, IDES=
tate, io_buffer_total_len, 1,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmstate_info_uint8, uint8_t),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vmstate_info_uint8, uint8_t),<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_INT32(cur_io_buffer_offset, =
IDEState),<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_INT32(cur_io_buffer_len, IDE=
State),<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINT8(end_transfer_fn_idx, I=
DEState),<br>
&gt; diff --git a/hw/input/lm832x.c b/hw/input/lm832x.c<br>
&gt; index 74da30d9ca..cffbf586d4 100644<br>
&gt; --- a/hw/input/lm832x.c<br>
&gt; +++ b/hw/input/lm832x.c<br>
&gt; @@ -66,7 +66,7 @@ typedef struct {<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0struct {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint16_t file[256];<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t faddr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t faddr;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t addr[3];<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QEMUTimer *tm[3];<br>
&gt; =C2=A0 =C2=A0 =C2=A0} pwm;<br>
&gt; diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c<br>
&gt; index 07c8801387..3e66713b47 100644<br>
&gt; --- a/hw/input/pckbd.c<br>
&gt; +++ b/hw/input/pckbd.c<br>
&gt; @@ -55,7 +55,7 @@<br>
&gt; =C2=A0#define KBD_CCMD_WRITE_OUTPORT 0xD1=C2=A0 =C2=A0 /* write output=
 port */<br>
&gt; =C2=A0#define KBD_CCMD_WRITE_OBUF=C2=A0 =C2=A0 0xD2<br>
&gt; =C2=A0#define KBD_CCMD_WRITE_AUX_OBUF=C2=A0 =C2=A0 =C2=A0 =C2=A0 0xD3=
=C2=A0 =C2=A0 /* Write to output buffer as if<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 initiated by the auxiliary device */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0initiated by the auxiliary device */<br>
&gt; =C2=A0#define KBD_CCMD_WRITE_MOUSE=C2=A0 =C2=A00xD4=C2=A0 =C2=A0 /* Wr=
ite the following byte to the mouse */<br>
&gt; =C2=A0#define KBD_CCMD_DISABLE_A20=C2=A0 =C2=A0 0xDD=C2=A0 =C2=A0 /* H=
P vectra only ? */<br>
&gt; =C2=A0#define KBD_CCMD_ENABLE_A20=C2=A0 =C2=A0 =C2=A00xDF=C2=A0 =C2=A0=
 /* HP vectra only ? */<br>
&gt; diff --git a/hw/input/tsc210x.c b/hw/input/tsc210x.c<br>
&gt; index 1cad57f644..ded0db9351 100644<br>
&gt; --- a/hw/input/tsc210x.c<br>
&gt; +++ b/hw/input/tsc210x.c<br>
&gt; @@ -577,7 +577,7 @@ static void tsc2102_control_register_write(<br>
&gt; =C2=A0 =C2=A0 =C2=A0case 0x01: /* Status / Keypad Control */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((s-&gt;model &amp; 0xff00) =3D=
=3D 0x2100)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;pin_func =3D val=
ue &gt;&gt; 14;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;kb.scan =3D (val=
ue &gt;&gt; 14) &amp; 1;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;kb.debounce =3D =
(value &gt;&gt; 11) &amp; 7;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;kb.intr &amp=
;&amp; s-&gt;kb.scan) {<br>
&gt; diff --git a/hw/intc/apic.c b/hw/intc/apic.c<br>
&gt; index 97ffdd820f..4e8290c4e0 100644<br>
&gt; --- a/hw/intc/apic.c<br>
&gt; +++ b/hw/intc/apic.c<br>
&gt; @@ -441,7 +441,7 @@ static int apic_find_dest(uint8_t dest)<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; MAX_APICS; i++) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0apic =3D local_apics[i];<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (apic &amp;&amp; apic-&gt;id =3D=3D des=
t)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (apic &amp;&amp; apic-&gt;id =3D=3D de=
st)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return i;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!apic)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c<br>
&gt; index 1cd8aac658..f707e59c7a 100644<br>
&gt; --- a/hw/mips/gt64xxx_pci.c<br>
&gt; +++ b/hw/mips/gt64xxx_pci.c<br>
&gt; @@ -395,7 +395,7 @@ static void gt64120_writel (void *opaque, hwaddr a=
ddr,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;regs[GT_CPU] =3D val;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case GT_MULTI:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Read-only register as only one GT64xxx =
is present on the CPU bus */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Read-only register as only one GT64xxx=
 is present on the CPU bus */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0/* CPU Address Decode */<br>
&gt; @@ -457,13 +457,13 @@ static void gt64120_writel (void *opaque, hwaddr=
 addr,<br>
&gt; =C2=A0 =C2=A0 =C2=A0case GT_CPUERR_DATALO:<br>
&gt; =C2=A0 =C2=A0 =C2=A0case GT_CPUERR_DATAHI:<br>
&gt; =C2=A0 =C2=A0 =C2=A0case GT_CPUERR_PARITY:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Read-only registers, do nothing */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Read-only registers, do nothing */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0/* CPU Sync Barrier */<br>
&gt; =C2=A0 =C2=A0 =C2=A0case GT_PCI0SYNC:<br>
&gt; =C2=A0 =C2=A0 =C2=A0case GT_PCI1SYNC:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Read-only registers, do nothing */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Read-only registers, do nothing */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0/* SDRAM and Device Address Decode */<br>
&gt; diff --git a/hw/mips/mips_r4k.c b/hw/mips/mips_r4k.c<br>
&gt; index 3e852e98cf..1922407394 100644<br>
&gt; --- a/hw/mips/mips_r4k.c<br>
&gt; +++ b/hw/mips/mips_r4k.c<br>
&gt; @@ -239,7 +239,7 @@ void mips_r4k_init(MachineState *machine)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sector_len, mips_ro=
m / sector_len,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4, 0, 0, 0, 0, be))=
 {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;=
qemu: Error registering flash memory.\n&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; =C2=A0 =C2=A0 =C2=A0} else if (!qtest_enabled()) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* not fatal */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0warn_report(&quot;could not load MIP=
S bios &#39;%s&#39;&quot;, bios_name);<br>
&gt; @@ -285,7 +285,7 @@ void mips_r4k_init(MachineState *machine)<br>
&gt; =C2=A0 =C2=A0 =C2=A0for(i =3D 0; i &lt; MAX_IDE_BUS; i++)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0isa_ide_init(isa_bus, ide_iobase[i],=
 ide_iobase2[i], ide_irq[i],<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 hd[MAX_IDE_DEVS * i],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 hd[MAX_IDE_DEVS * i + 1]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0hd[MAX_IDE_DEVS * i + 1]);<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0isa_create_simple(isa_bus, TYPE_I8042);<br>
&gt; =C2=A0}<br>
&gt; diff --git a/hw/misc/max111x.c b/hw/misc/max111x.c<br>
&gt; index 6dbdc03677..ac6d35a81d 100644<br>
&gt; --- a/hw/misc/max111x.c<br>
&gt; +++ b/hw/misc/max111x.c<br>
&gt; @@ -43,9 +43,9 @@ typedef struct {<br>
&gt; =C2=A0#define CB_START=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 7)<br>
&gt;<br>
&gt; =C2=A0#define CHANNEL_NUM(v, b0, b1, b2)=C2=A0 =C2=A0 =C2=A0\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0((((v) &gt;&gt; (2 + (b0))) &amp; 4) |=C2=A0 =C2=A0 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 (((v) &gt;&gt; (3 + (b1))) &amp; 2) |=C2=A0 =C2=A0 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 (((v) &gt;&gt; (4 + (b2))) &amp; 1))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ((((v) &gt;&gt; (2 + (b0))) &amp; 4) |=C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0(((v) &gt;&gt; (3 + (b1))) &amp; 2) |=C2=A0 =C2=A0\<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0(((v) &gt;&gt; (4 + (b2))) &amp; 1))<br>
&gt;<br>
&gt; =C2=A0static uint32_t max111x_read(MAX111xState *s)<br>
&gt; =C2=A0{<br>
&gt; diff --git a/hw/misc/omap_l4.c b/hw/misc/omap_l4.c<br>
&gt; index 96fc057b4e..c217728c78 100644<br>
&gt; --- a/hw/misc/omap_l4.c<br>
&gt; +++ b/hw/misc/omap_l4.c<br>
&gt; @@ -112,8 +112,8 @@ static const MemoryRegionOps omap_l4ta_ops =3D {<b=
r>
&gt;<br>
&gt; =C2=A0struct omap_target_agent_s *omap_l4ta_get(struct omap_l4_s *bus,=
<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct omap_l4_region_s *regio=
ns,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct omap_l4_agent_info_s *agents,=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0int cs)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct omap_l4_agent_info_s *agents=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 int cs)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; =C2=A0 =C2=A0 =C2=A0struct omap_target_agent_s *ta =3D NULL;<br>
&gt; diff --git a/hw/net/mipsnet.c b/hw/net/mipsnet.c<br>
&gt; index 03b3104278..5ec13105df 100644<br>
&gt; --- a/hw/net/mipsnet.c<br>
&gt; +++ b/hw/net/mipsnet.c<br>
&gt; @@ -112,27 +112,27 @@ static uint64_t mipsnet_ioport_read(void *opaque=
, hwaddr addr,<br>
&gt; =C2=A0 =C2=A0 =C2=A0addr &amp;=3D 0x3f;<br>
&gt; =C2=A0 =C2=A0 =C2=A0switch (addr) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0case MIPSNET_DEV_ID:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D be32_to_cpu(0x4d495053);=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /* MIPS */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D be32_to_cpu(0x4d495053);=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0/* MIPS */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case MIPSNET_DEV_ID + 4:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D be32_to_cpu(0x4e455430);=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /* NET0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D be32_to_cpu(0x4e455430);=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0/* NET0 */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case MIPSNET_BUSY:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D s-&gt;busy;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D s-&gt;busy;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case MIPSNET_RX_DATA_COUNT:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D s-&gt;rx_count;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D s-&gt;rx_count;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case MIPSNET_TX_DATA_COUNT:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D s-&gt;tx_count;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D s-&gt;tx_count;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case MIPSNET_INT_CTL:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D s-&gt;intctl;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D s-&gt;intctl;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;intctl &amp;=3D ~MIPSNET_INTCT=
L_TESTBIT;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case MIPSNET_INTERRUPT_INFO:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* XXX: This seems to be a per-VPE i=
nterrupt number. */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 0;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case MIPSNET_RX_DATA_BUFFER:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;rx_count) {<br>
&gt; @@ -161,7 +161,7 @@ static void mipsnet_ioport_write(void *opaque, hwa=
ddr addr,<br>
&gt; =C2=A0 =C2=A0 =C2=A0trace_mipsnet_write(addr, val);<br>
&gt; =C2=A0 =C2=A0 =C2=A0switch (addr) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0case MIPSNET_TX_DATA_COUNT:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;tx_count =3D (val &lt;=3D MAX_ETH_FR=
AME_SIZE) ? val : 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;tx_count =3D (val &lt;=3D MAX_ETH_F=
RAME_SIZE) ? val : 0;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;tx_written =3D 0;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case MIPSNET_INT_CTL:<br>
&gt; diff --git a/hw/net/ne2000.c b/hw/net/ne2000.c<br>
&gt; index 869518ee06..037afc8052 100644<br>
&gt; --- a/hw/net/ne2000.c<br>
&gt; +++ b/hw/net/ne2000.c<br>
&gt; @@ -145,7 +145,7 @@ static void ne2000_update_irq(NE2000State *s)<br>
&gt; =C2=A0 =C2=A0 =C2=A0isr =3D (s-&gt;isr &amp; s-&gt;imr) &amp; 0x7f;<br=
>
&gt; =C2=A0#if defined(DEBUG_NE2000)<br>
&gt; =C2=A0 =C2=A0 =C2=A0printf(&quot;NE2000: Set IRQ to %d (%02x %02x)\n&q=
uot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 isr ? 1 : 0, s-&gt;isr, s-&gt;imr)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0isr ? 1 : 0, s-&gt;isr, s-&g=
t;imr);<br>
&gt; =C2=A0#endif<br>
&gt; =C2=A0 =C2=A0 =C2=A0qemu_set_irq(s-&gt;irq, (isr !=3D 0));<br>
&gt; =C2=A0}<br>
&gt; @@ -396,12 +396,12 @@ static uint32_t ne2000_ioport_read(void *opaque,=
 uint32_t addr)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case EN0_ISR:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D s-&gt;isr;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0case EN0_RSARLO:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D s-&gt;rsar &amp; 0x0=
0ff;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0case EN0_RSARHI:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D s-&gt;rsar &gt;&gt; =
8;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case EN0_RSARLO:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D s-&gt;rsar &amp; 0x=
00ff;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case EN0_RSARHI:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D s-&gt;rsar &gt;&gt;=
 8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case EN1_PHYS ... EN1_PHYS + 5:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D s-&gt;phys[off=
set - EN1_PHYS];<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; @@ -420,21 +420,21 @@ static uint32_t ne2000_ioport_read(void *opaque,=
 uint32_t addr)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case EN2_STOPPG:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D s-&gt;stop &gt=
;&gt; 8;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0case EN0_RTL8029ID0:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D 0x50;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0case EN0_RTL8029ID1:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D 0x43;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0case EN3_CONFIG0:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D 0;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /* 10baseT media */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0case EN3_CONFIG2:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D 0x40;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0/* 10baseT active */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0case EN3_CONFIG3:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D 0x40;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0/* Full duplex */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case EN0_RTL8029ID0:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 0x50;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case EN0_RTL8029ID1:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 0x43;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case EN3_CONFIG0:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 0;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0/* 10baseT media */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case EN3_CONFIG2:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 0x40;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* 10baseT active */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case EN3_CONFIG3:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 0x40;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Full duplex */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D 0x00;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; diff --git a/hw/net/rocker/rocker.c b/hw/net/rocker/rocker.c<br>
&gt; index c02cbefece..5266f9b7dd 100644<br>
&gt; --- a/hw/net/rocker/rocker.c<br>
&gt; +++ b/hw/net/rocker/rocker.c<br>
&gt; @@ -1279,7 +1279,7 @@ static World *rocker_world_type_by_name(Rocker *=
r, const char *name)<br>
&gt; =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; ROCKER_WORLD_TYPE_MAX; i++) {=
<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (strcmp(name, world_name(r-&gt;wo=
rlds[i])) =3D=3D 0) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return r-&gt;worlds[i]=
;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt; =C2=A0}<br>
&gt; diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c<br>
&gt; index 385b1a03e9..e37fc34839 100644<br>
&gt; --- a/hw/net/virtio-net.c<br>
&gt; +++ b/hw/net/virtio-net.c<br>
&gt; @@ -1375,10 +1375,10 @@ static int32_t virtio_net_flush_tx(VirtIONetQu=
eue *q)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n-&gt;guest_hdr_len=
, -1);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (out_=
num =3D=3D VIRTQUEUE_MAX_SIZE) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0goto drop;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0out_num =
+=3D 1;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0out_sg =
=3D sg2;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * If host wants to see the guest he=
ader as is, we can<br>
&gt; diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c<br>
&gt; index 3648630386..76f3ed319d 100644<br>
&gt; --- a/hw/net/vmxnet3.c<br>
&gt; +++ b/hw/net/vmxnet3.c<br>
&gt; @@ -149,7 +149,7 @@ typedef struct {<br>
&gt; =C2=A0} Vmxnet3Ring;<br>
&gt;<br>
&gt; =C2=A0static inline void vmxnet3_ring_init(PCIDevice *d,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Vmxnet3Ring *ring,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Vmxnet3Ring =
*ring,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hwaddr pa,<b=
r>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t siz=
e,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t cel=
l_size,<br>
&gt; @@ -193,13 +193,13 @@ static inline hwaddr vmxnet3_ring_curr_cell_pa(V=
mxnet3Ring *ring)<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; =C2=A0static inline void vmxnet3_ring_read_curr_cell(PCIDevice *d, Vmx=
net3Ring *ring,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 void *buff)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0void *buff)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0vmw_shmem_read(d, vmxnet3_ring_curr_cell_pa(ring),=
 buff, ring-&gt;cell_size);<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; =C2=A0static inline void vmxnet3_ring_write_curr_cell(PCIDevice *d, Vm=
xnet3Ring *ring,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0void *buff)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 void *buff)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0vmw_shmem_write(d, vmxnet3_ring_curr_cell_pa(ring)=
, buff, ring-&gt;cell_size);<br>
&gt; =C2=A0}<br>
&gt; diff --git a/hw/pci/msix.c b/hw/pci/msix.c<br>
&gt; index 702dac4ec7..c7bdbeda9e 100644<br>
&gt; --- a/hw/pci/msix.c<br>
&gt; +++ b/hw/pci/msix.c<br>
&gt; @@ -501,7 +501,7 @@ void msix_reset(PCIDevice *dev)<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0msix_clear_all_vectors(dev);<br>
&gt; =C2=A0 =C2=A0 =C2=A0dev-&gt;config[dev-&gt;msix_cap + MSIX_CONTROL_OFF=
SET] &amp;=3D<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~dev-&gt;wmask[dev-&gt;msix_=
cap + MSIX_CONTROL_OFFSET];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~dev-&gt;wmask[dev-&gt;msix=
_cap + MSIX_CONTROL_OFFSET];<br>
&gt; =C2=A0 =C2=A0 =C2=A0memset(dev-&gt;msix_table, 0, dev-&gt;msix_entries=
_nr * PCI_MSIX_ENTRY_SIZE);<br>
&gt; =C2=A0 =C2=A0 =C2=A0memset(dev-&gt;msix_pba, 0, QEMU_ALIGN_UP(dev-&gt;=
msix_entries_nr, 64) / 8);<br>
&gt; =C2=A0 =C2=A0 =C2=A0msix_mask_all(dev, dev-&gt;msix_entries_nr);<br>
&gt; diff --git a/hw/pci/pci.c b/hw/pci/pci.c<br>
&gt; index 56b13b3320..13328a0827 100644<br>
&gt; --- a/hw/pci/pci.c<br>
&gt; +++ b/hw/pci/pci.c<br>
&gt; @@ -211,13 +211,13 @@ int pci_bar(PCIDevice *d, int reg)<br>
&gt;<br>
&gt; =C2=A0static inline int pci_irq_state(PCIDevice *d, int irq_num)<br>
&gt; =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return (d-&gt;irq_state &gt;&gt; irq_num) =
&amp; 0x1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (d-&gt;irq_state &gt;&gt; irq_num)=
 &amp; 0x1;<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; =C2=A0static inline void pci_set_irq_state(PCIDevice *d, int irq_num, =
int level)<br>
&gt; =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0d-&gt;irq_state &amp;=3D ~(0x1 &lt;&lt; ir=
q_num);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0d-&gt;irq_state |=3D level &lt;&lt; irq_nu=
m;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;irq_state &amp;=3D ~(0x1 &lt;&lt; i=
rq_num);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;irq_state |=3D level &lt;&lt; irq_n=
um;<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; =C2=A0static void pci_change_irq_level(PCIDevice *pci_dev, int irq_num=
, int change)<br>
&gt; @@ -571,8 +571,8 @@ const VMStateDescription vmstate_pci_device =3D {<=
br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0, vmstate_info_pci=
_config,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PCIE_CONFIG_SPACE_S=
IZE),<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_BUFFER_UNSAFE_INFO(irq_state=
, PCIDevice, 2,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmstate_info_pci_irq_stat=
e,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PCI_NUM_PINS * sizeof(int=
32_t)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vmstate_info_pci_ir=
q_state,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PCI_NUM_PINS * size=
of(int32_t)),<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_END_OF_LIST()<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0};<br>
&gt; @@ -624,21 +624,21 @@ static int pci_parse_devaddr(const char *addr, i=
nt *domp, int *busp,<br>
&gt; =C2=A0 =C2=A0 =C2=A0p =3D addr;<br>
&gt; =C2=A0 =C2=A0 =C2=A0val =3D strtoul(p, &amp;e, 16);<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (e =3D=3D p)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (*e =3D=3D &#39;:&#39;) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0bus =3D val;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0p =3D e + 1;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D strtoul(p, &amp;e, 16);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (e =3D=3D p)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (*e =3D=3D &#39;:&#39;) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dom =3D bus;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bus =3D val;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p =3D e + 1;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D strtoul(p, &amp;e, 1=
6);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (e =3D=3D p)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bus =3D val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D e + 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D strtoul(p, &amp;e, 16);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (e =3D=3D p)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*e =3D=3D &#39;:&#39;) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dom =3D bus;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bus =3D val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D e + 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D strtoul(p, &amp;e, =
16);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (e =3D=3D p)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0slot =3D val;<br>
&gt; @@ -657,10 +657,10 @@ static int pci_parse_devaddr(const char *addr, i=
nt *domp, int *busp,<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0/* if funcp =3D=3D NULL func is 0 */<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (dom &gt; 0xffff || bus &gt; 0xff || slot &gt; =
0x1f || func &gt; 7)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (*e)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0*domp =3D dom;<br>
&gt; =C2=A0 =C2=A0 =C2=A0*busp =3D bus;<br>
&gt; @@ -1217,7 +1217,7 @@ pcibus_t pci_get_bar_addr(PCIDevice *pci_dev, in=
t region_num)<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; =C2=A0static pcibus_t pci_bar_address(PCIDevice *d,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int reg, uint8_t type, pcibus_t s=
ize)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int reg, uint8_t type, pcibus_t =
size)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0pcibus_t new_addr, last_addr;<br>
&gt; =C2=A0 =C2=A0 =C2=A0int bar =3D pci_bar(d, reg);<br>
&gt; diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c<br>
&gt; index ee9dff2d3a..55d0dacd60 100644<br>
&gt; --- a/hw/pci/pci_bridge.c<br>
&gt; +++ b/hw/pci/pci_bridge.c<br>
&gt; @@ -369,7 +369,7 @@ void pci_bridge_initfn(PCIDevice *dev, const char =
*typename)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 * let users address the bus using the device name=
.<br>
&gt; =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (!br-&gt;bus_name &amp;&amp; dev-&gt;<a href=3D=
"http://qdev.id">qdev.id</a> &amp;&amp; *dev-&gt;<a href=3D"http://qdev.id"=
>qdev.id</a>) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0br-&gt;bus_name =3D dev-&gt;=
<a href=3D"http://qdev.id">qdev.id</a>;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 br-&gt;bus_name =3D dev-&gt=
;<a href=3D"http://qdev.id">qdev.id</a>;<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0qbus_create_inplace(sec_bus, sizeof(br-&gt;sec_bus=
), typename, DEVICE(dev),<br>
&gt; diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c<br>
&gt; index 5c58415cf1..fbe2e7f857 100644<br>
&gt; --- a/hw/ppc/ppc405_uc.c<br>
&gt; +++ b/hw/ppc/ppc405_uc.c<br>
&gt; @@ -1885,7 +1885,7 @@ CPUPPCState *ppc405ep_init(MemoryRegion *address=
_space_mem,<br>
&gt; =C2=A0 =C2=A0 =C2=A0pic =3D ppcuic_init(env, irqs, 0x0C0, 0, 1);<br>
&gt; =C2=A0 =C2=A0 =C2=A0*picp =3D pic;<br>
&gt; =C2=A0 =C2=A0 =C2=A0/* SDRAM controller */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* XXX 405EP has no ECC interrupt */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* XXX 405EP has no ECC interrupt */<br>
&gt; =C2=A0 =C2=A0 =C2=A0ppc4xx_sdram_init(env, pic[17], 2, ram_memories,<b=
r>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0ram_bases, ram_sizes, do_init);<br>
&gt; =C2=A0 =C2=A0 =C2=A0/* External bus controller */<br>
&gt; diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c<br>
&gt; index 2afb7f437e..7bda86a7d0 100644<br>
&gt; --- a/hw/ppc/prep.c<br>
&gt; +++ b/hw/ppc/prep.c<br>
&gt; @@ -538,7 +538,7 @@ static void ppc_prep_init(MachineState *machine)<b=
r>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nb_nics1 =3D NE2000_NB_MAX;<br>
&gt; =C2=A0 =C2=A0 =C2=A0for(i =3D 0; i &lt; nb_nics1; i++) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (nd_table[i].model =3D=3D NULL) {=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nd_table[i].model =3D g_strd=
up(&quot;ne2k_isa&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nd_table[i].model =3D g_str=
dup(&quot;ne2k_isa&quot;);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (strcmp(nd_table[i].model, &quot;=
ne2k_isa&quot;) =3D=3D 0) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0isa_ne2000_init(isa_bu=
s, ne2000_io[i], ne2000_irq[i],<br>
&gt; @@ -552,7 +552,7 @@ static void ppc_prep_init(MachineState *machine)<b=
r>
&gt; =C2=A0 =C2=A0 =C2=A0for(i =3D 0; i &lt; MAX_IDE_BUS; i++) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0isa_ide_init(isa_bus, ide_iobase[i],=
 ide_iobase2[i], ide_irq[i],<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 hd[2 * i],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 hd[2 * i + 1]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0hd[2 * i + 1]);<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0cpu =3D POWERPC_CPU(first_cpu);<br>
&gt; diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c<br>
&gt; index 52a38933b6..89def1421f 100644<br>
&gt; --- a/hw/scsi/lsi53c895a.c<br>
&gt; +++ b/hw/scsi/lsi53c895a.c<br>
&gt; @@ -1850,7 +1850,7 @@ static void lsi_reg_writeb(LSIState *s, int offs=
et, uint8_t val)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case 0x0a: case 0x0b:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Openserver writes to these readon=
ly registers on startup */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case 0x0c: case 0x0d: case 0x0e: case 0x0f:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Linux writes to these readonly re=
gisters on startup.=C2=A0 */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; @@ -1884,8 +1884,8 @@ static void lsi_reg_writeb(LSIState *s, int offs=
et, uint8_t val)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* nothing to do */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case 0x1a: /* CTEST2 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;ctest2 =3D val &amp; LSI_CTEST2_PCIC=
IE;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;ctest2 =3D val &amp; LSI_CTEST2_PCI=
CIE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case 0x1b: /* CTEST3 */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;ctest3 =3D val &amp; 0x0f;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c<br>
&gt; index 6a5fc46a47..5b399e7161 100644<br>
&gt; --- a/hw/sh4/r2d.c<br>
&gt; +++ b/hw/sh4/r2d.c<br>
&gt; @@ -139,11 +139,11 @@ static uint64_t r2d_fpga_read(void *opaque, hwad=
dr addr, unsigned int size)<br>
&gt; =C2=A0 =C2=A0 =C2=A0case PA_IRLMSK:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return s-&gt;irlmsk;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case PA_OUTPORT:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return s-&gt;outport;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return s-&gt;outport;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case PA_POWOFF:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0x00;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0x00;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case PA_VERREG:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0x10;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0x10;<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; @@ -158,18 +158,18 @@ r2d_fpga_write(void *opaque, hwaddr addr, uint64=
_t value, unsigned int size)<br>
&gt; =C2=A0 =C2=A0 =C2=A0case PA_IRLMSK:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;irlmsk =3D value;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0update_irl(s);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case PA_OUTPORT:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;outport =3D value;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;outport =3D value;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case PA_POWOFF:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (value &amp; 1) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_system_shutdown_r=
equest(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case PA_VERREG:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Discard writes */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Discard writes */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; diff --git a/hw/usb/dev-bluetooth.c b/hw/usb/dev-bluetooth.c<br>
&gt; index eac7365b0a..c539a1afc6 100644<br>
&gt; --- a/hw/usb/dev-bluetooth.c<br>
&gt; +++ b/hw/usb/dev-bluetooth.c<br>
&gt; @@ -46,7 +46,7 @@ struct USBBtState {<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0struct usb_hci_out_fifo_s {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t data[4096];<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0int len;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 int len;<br>
&gt; =C2=A0 =C2=A0 =C2=A0} outcmd, outacl, outsco;<br>
&gt; =C2=A0};<br>
&gt;<br>
&gt; diff --git a/hw/usb/dev-hid.c b/hw/usb/dev-hid.c<br>
&gt; index 62d18290dc..90cd745f06 100644<br>
&gt; --- a/hw/usb/dev-hid.c<br>
&gt; +++ b/hw/usb/dev-hid.c<br>
&gt; @@ -592,12 +592,12 @@ static void usb_hid_handle_control(USBDevice *de=
v, USBPacket *p,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (value &gt;&gt; 8) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 0x22:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (hs-&gt;kind =3D=3D=
 HID_MOUSE) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(data, q=
emu_mouse_hid_report_descriptor,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 sizeof(qemu_mouse_hid_report_descriptor));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(data, =
qemu_mouse_hid_report_descriptor,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0sizeof(qemu_mouse_hid_report_descriptor));<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p-&gt;ac=
tual_length =3D sizeof(qemu_mouse_hid_report_descriptor);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (hs-&gt;kind=
 =3D=3D HID_TABLET) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(d=
ata, qemu_tablet_hid_report_descriptor,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 sizeof(qemu_tablet_hid_report_descriptor));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0sizeof(qemu_tablet_hid_report_descriptor));<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p-&gt;ac=
tual_length =3D sizeof(qemu_tablet_hid_report_descriptor);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (hs-&gt;kind=
 =3D=3D HID_KEYBOARD) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(d=
ata, qemu_keyboard_hid_report_descriptor,<br>
&gt; diff --git a/hw/usb/dev-hub.c b/hw/usb/dev-hub.c<br>
&gt; index dc368179d1..7e9339b8a8 100644<br>
&gt; --- a/hw/usb/dev-hub.c<br>
&gt; +++ b/hw/usb/dev-hub.c<br>
&gt; @@ -147,13 +147,13 @@ static const USBDesc desc_hub =3D {<br>
&gt;<br>
&gt; =C2=A0static const uint8_t qemu_hub_hub_descriptor[] =3D<br>
&gt; =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A00x00,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*=C2=A0 u8=C2=A0 bLength; patched in lat=
er */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A00x29,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*=C2=A0 u8=C2=A0 bDescriptorType; Hub-de=
scriptor */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A00x00,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*=C2=A0 u8=C2=A0 bNbrPorts; (patched lat=
er) */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A00x0a,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* u16=C2=A0 wHubCharacteristics; */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A00x00,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*=C2=A0 =C2=A0(per-port OC, no power swi=
tching) */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A00x01,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*=C2=A0 u8=C2=A0 bPwrOn2pwrGood; 2ms */<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A00x00=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*=C2=A0 u8=C2=A0 bHubContrCurrent; 0 mA */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x00,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*=C2=A0 u8=C2=A0 bLength; patched in later */<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x29,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*=C2=A0 u8=C2=A0 bDescriptorType; Hub-descript=
or */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x00,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*=C2=A0 u8=C2=A0 bNbrPorts; (patched later) */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0a,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* u16=C2=A0 wHubCharacteristics; */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x00,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*=C2=A0 =C2=A0(per-port OC, no power switching=
) */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*=C2=A0 u8=C2=A0 bPwrOn2pwrGood; 2ms */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x00=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*=C2=A0 u8=C2=A0 bHubContrCurrent; 0 mA =
*/<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* DeviceRemovable and PortPwrCtrlMa=
sk patched in later */<br>
&gt; =C2=A0};<br>
&gt; diff --git a/hw/xen/xen_devconfig.c b/hw/xen/xen_devconfig.c<br>
&gt; index aebc19bd71..3500d88a3e 100644<br>
&gt; --- a/hw/xen/xen_devconfig.c<br>
&gt; +++ b/hw/xen/xen_devconfig.c<br>
&gt; @@ -6,7 +6,7 @@<br>
&gt; =C2=A0/* -------------------------------------------------------------=
 */<br>
&gt;<br>
&gt; =C2=A0static int xen_config_dev_dirs(const char *ftype, const char *bt=
ype, int vdev,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *fe, char *be, int len)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *fe, char *be, int len)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0char *dom;<br>
&gt;<br>
&gt; diff --git a/hw/xenpv/xen_domainbuild.c b/hw/xenpv/xen_domainbuild.c<b=
r>
&gt; index 188acaca16..2859280a6a 100644<br>
&gt; --- a/hw/xenpv/xen_domainbuild.c<br>
&gt; +++ b/hw/xenpv/xen_domainbuild.c<br>
&gt; @@ -27,11 +27,11 @@ static int xenstore_domain_mkdir(char *path)<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (!xs_mkdir(xenstore, 0, path)) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;%s: xs_mkdir %=
s: failed\n&quot;, __func__, path);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (!xs_set_permissions(xenstore, 0, path, perms_r=
o, 2)) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;%s: xs_set_per=
missions failed\n&quot;, __func__);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0for (i =3D 0; writable[i]; i++) {<br>
&gt; @@ -82,8 +82,8 @@ int xenstore_domain_init1(const char *kernel, const =
char *ramdisk,<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0/* cpus */<br>
&gt; =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; smp_cpus; i++) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(path, sizeof(path), &quot;cpu/%d/=
availability&quot;,i);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0xenstore_write_str(dom, path, &quot;online=
&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(path, sizeof(path), &quot;cpu/%d=
/availability&quot;,i);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 xenstore_write_str(dom, path, &quot;onlin=
e&quot;);<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0xenstore_write_int(vm, &quot;vcpu_avail&quot;,=C2=
=A0 smp_cpus);<br>
&gt; =C2=A0 =C2=A0 =C2=A0xenstore_write_int(vm, &quot;vcpus&quot;,=C2=A0 =
=C2=A0 =C2=A0 =C2=A0smp_cpus);<br>
&gt; diff --git a/include/elf.h b/include/elf.h<br>
&gt; index c151164b63..2a72b282f7 100644<br>
&gt; --- a/include/elf.h<br>
&gt; +++ b/include/elf.h<br>
&gt; @@ -782,11 +782,11 @@ typedef struct {<br>
&gt; =C2=A0/* ARM-specific values for sh_flags */<br>
&gt; =C2=A0#define SHF_ARM_ENTRYSECT=C2=A0 0x10000000=C2=A0 =C2=A0/* Sectio=
n contains an entry point */<br>
&gt; =C2=A0#define SHF_ARM_COMDEF=C2=A0 =C2=A0 =C2=A00x80000000=C2=A0 =C2=
=A0/* Section may be multiply defined<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 in the input to a link step */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0in the input to a link step */<br>
&gt;<br>
&gt; =C2=A0/* ARM-specific program header flags */<br>
&gt; =C2=A0#define PF_ARM_SB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x10000000=
=C2=A0 =C2=A0/* Segment contains the location<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 addressed by the static base */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0addressed by the static base */<br>
&gt;<br>
&gt; =C2=A0/* ARM relocs.=C2=A0 */<br>
&gt; =C2=A0#define R_ARM_NONE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00=C2=A0 =C2=A0 =C2=A0 =C2=A0/* No reloc */<br>
&gt; @@ -1047,7 +1047,7 @@ typedef struct {<br>
&gt; =C2=A0#define R_X86_64_JUMP_SLOT=C2=A0 =C2=A0 =C2=A07=C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* Create PLT entry */<br>
&gt; =C2=A0#define R_X86_64_RELATIVE=C2=A0 =C2=A0 =C2=A0 8=C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* Adjust by program base */<br>
&gt; =C2=A0#define R_X86_64_GOTPCREL=C2=A0 =C2=A0 =C2=A0 9=C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* 32 bit signed pc relative<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 offset to GOT */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0offset to GOT */<br>
&gt; =C2=A0#define R_X86_64_32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 10=
=C2=A0 =C2=A0 =C2=A0 /* Direct 32 bit zero extended */<br>
&gt; =C2=A0#define R_X86_64_32S=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A011=
=C2=A0 =C2=A0 =C2=A0 /* Direct 32 bit sign extended */<br>
&gt; =C2=A0#define R_X86_64_16=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 12=
=C2=A0 =C2=A0 =C2=A0 /* Direct 16 bit zero extended */<br>
&gt; @@ -1070,7 +1070,7 @@ typedef struct {<br>
&gt; =C2=A0#define EF_PARISC_LSB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x000400=
00 /* Program expects little endian. */<br>
&gt; =C2=A0#define EF_PARISC_WIDE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x000800=
00 /* Program expects wide mode.=C2=A0 */<br>
&gt; =C2=A0#define EF_PARISC_NO_KABP=C2=A0 =C2=A0 =C2=A0 0x00100000 /* No k=
ernel assisted branch<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0prediction.=C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 prediction.=C2=A0 */<br>
&gt; =C2=A0#define EF_PARISC_LAZYSWAP=C2=A0 =C2=A0 =C2=A00x00400000 /* Allo=
w lazy swapping.=C2=A0 */<br>
&gt; =C2=A0#define EF_PARISC_ARCH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0000ff=
ff /* Architecture version.=C2=A0 */<br>
&gt;<br>
&gt; @@ -1083,7 +1083,7 @@ typedef struct {<br>
&gt; =C2=A0/* Additional section indeces.=C2=A0 */<br>
&gt;<br>
&gt; =C2=A0#define SHN_PARISC_ANSI_COMMON 0xff00=C2=A0 =C2=A0 =C2=A0/* Sect=
ion for tenatively declared<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0symbols in ANSI C.=C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 symbols in ANSI C.=C2=A0 */<br>
&gt; =C2=A0#define SHN_PARISC_HUGE_COMMON 0xff01=C2=A0 =C2=A0 =C2=A0/* Comm=
on blocks in huge model.=C2=A0 */<br>
&gt;<br>
&gt; =C2=A0/* Legal values for sh_type field of Elf32_Shdr.=C2=A0 */<br>
&gt; diff --git a/include/hw/acpi/acpi.h b/include/hw/acpi/acpi.h<br>
&gt; index c20ace0d0b..bbf541263a 100644<br>
&gt; --- a/include/hw/acpi/acpi.h<br>
&gt; +++ b/include/hw/acpi/acpi.h<br>
&gt; @@ -69,13 +69,13 @@<br>
&gt; =C2=A0#define ACPI_BITMASK_WAKE_STATUS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0x8000<br>
&gt;<br>
&gt; =C2=A0#define ACPI_BITMASK_ALL_FIXED_STATUS=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0(\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ACPI_BITMASK_TIMER_STATUS=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ACPI_BITMASK_BUS_MASTER_STATUS=C2=A0 =C2=
=A0 =C2=A0| \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ACPI_BITMASK_GLOBAL_LOCK_STATUS=C2=A0 =C2=
=A0 | \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ACPI_BITMASK_POWER_BUTTON_STATUS=C2=A0 =C2=
=A0| \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ACPI_BITMASK_SLEEP_BUTTON_STATUS=C2=A0 =C2=
=A0| \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ACPI_BITMASK_RT_CLOCK_STATUS=C2=A0 =C2=A0 =
=C2=A0 =C2=A0| \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ACPI_BITMASK_WAKE_STATUS)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ACPI_BITMASK_TIMER_STATUS=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ACPI_BITMASK_BUS_MASTER_STATUS=C2=A0 =C2=
=A0 =C2=A0| \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ACPI_BITMASK_GLOBAL_LOCK_STATUS=C2=A0 =C2=
=A0 | \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ACPI_BITMASK_POWER_BUTTON_STATUS=C2=A0 =
=C2=A0| \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ACPI_BITMASK_SLEEP_BUTTON_STATUS=C2=A0 =
=C2=A0| \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ACPI_BITMASK_RT_CLOCK_STATUS=C2=A0 =C2=A0=
 =C2=A0 =C2=A0| \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ACPI_BITMASK_WAKE_STATUS)<br>
&gt;<br>
&gt; =C2=A0/* PM1x_EN */<br>
&gt; =C2=A0#define ACPI_BITMASK_TIMER_ENABLE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00x0001<br>
&gt; diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h<br>
&gt; index 3b6398cb39..b84ba87e44 100644<br>
&gt; --- a/include/hw/elf_ops.h<br>
&gt; +++ b/include/hw/elf_ops.h<br>
&gt; @@ -343,7 +343,7 @@ static int glue(load_elf, SZ)(const char *name, in=
t fd,<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (pentry)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0*pentry =3D (uint64_t)(elf_sword)ehdr.e_en=
try;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *pentry =3D (uint64_t)(elf_sword)ehdr.e_e=
ntry;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0glue(load_symbols, SZ)(&amp;ehdr, fd, must_swab, c=
lear_lsb, sym_cb);<br>
&gt;<br>
&gt; diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h<br>
&gt; index 594081e57f..880413ddc7 100644<br>
&gt; --- a/include/hw/ide/internal.h<br>
&gt; +++ b/include/hw/ide/internal.h<br>
&gt; @@ -342,7 +342,7 @@ enum ide_dma_cmd {<br>
&gt; =C2=A0extern const char *IDE_DMA_CMD_lookup[IDE_DMA__COUNT];<br>
&gt;<br>
&gt; =C2=A0#define ide_cmd_is_read(s) \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0((s)-&gt;dma_cmd =3D=3D IDE_DMA_READ)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ((s)-&gt;dma_cmd =3D=3D IDE_DMA_READ)<br>
&gt;<br>
&gt; =C2=A0typedef struct IDEBufferedRequest {<br>
&gt; =C2=A0 =C2=A0 =C2=A0QLIST_ENTRY(IDEBufferedRequest) list;<br>
&gt; diff --git a/include/hw/sh4/sh_intc.h b/include/hw/sh4/sh_intc.h<br>
&gt; index fbcee94ed7..adfedb2efc 100644<br>
&gt; --- a/include/hw/sh4/sh_intc.h<br>
&gt; +++ b/include/hw/sh4/sh_intc.h<br>
&gt; @@ -61,21 +61,21 @@ struct intc_desc {<br>
&gt; =C2=A0int sh_intc_get_pending_vector(struct intc_desc *desc, int imask=
);<br>
&gt; =C2=A0struct intc_source *sh_intc_source(struct intc_desc *desc, intc_=
enum id);<br>
&gt; =C2=A0void sh_intc_toggle_source(struct intc_source *source,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 int enable_adj, int assert_adj);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0int enable_adj, int assert_adj);<br>
&gt;<br>
&gt; =C2=A0void sh_intc_register_sources(struct intc_desc *desc,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct intc_vect *vectors,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int nr_vectors,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct intc_group *groups,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int nr_groups);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct intc_vect *vectors,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int nr_vectors,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct intc_group *groups,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int nr_groups);<br>
&gt;<br>
&gt; =C2=A0int sh_intc_init(MemoryRegion *sysmem,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct =
intc_desc *desc,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int nr_source=
s,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct intc_m=
ask_reg *mask_regs,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int nr_mask_r=
egs,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct intc_p=
rio_reg *prio_regs,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int nr_prio_r=
egs);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int nr_=
sources,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct =
intc_mask_reg *mask_regs,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int nr_=
mask_regs,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct =
intc_prio_reg *prio_regs,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int nr_=
prio_regs);<br>
&gt;<br>
&gt; =C2=A0void sh_intc_set_irl(void *opaque, int n, int level);<br>
&gt;<br>
&gt; diff --git a/include/hw/xen/io/ring.h b/include/hw/xen/io/ring.h<br>
&gt; index ffa3ebadc8..1adacf09f9 100644<br>
&gt; --- a/include/hw/xen/io/ring.h<br>
&gt; +++ b/include/hw/xen/io/ring.h<br>
&gt; @@ -235,8 +235,8 @@ typedef struct __name##_back_ring __name##_back_ri=
ng_t<br>
&gt; =C2=A0 * to be ineffective where _req is a struct which consists of on=
ly bitfields.<br>
&gt; =C2=A0 */<br>
&gt; =C2=A0#define RING_COPY_REQUEST(_r, _idx, _req) do {=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Use volatile to force the copy into _re=
q. */=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0*(_req) =3D *(volatile typeof(_req))RING_G=
ET_REQUEST(_r, _idx);=C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Use volatile to force the copy into _r=
eq. */=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *(_req) =3D *(volatile typeof(_req))RING_=
GET_REQUEST(_r, _idx);=C2=A0 \<br>
&gt; =C2=A0} while (0)<br>
&gt;<br>
&gt; =C2=A0#define RING_GET_RESPONSE(_r, _idx)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; diff --git a/include/qemu/acl.h b/include/qemu/acl.h<br>
&gt; index 7c44119a47..73d2a71c8d 100644<br>
&gt; --- a/include/qemu/acl.h<br>
&gt; +++ b/include/qemu/acl.h<br>
&gt; @@ -49,18 +49,18 @@ qemu_acl *qemu_acl_init(const char *aclname);<br>
&gt; =C2=A0qemu_acl *qemu_acl_find(const char *aclname);<br>
&gt;<br>
&gt; =C2=A0int qemu_acl_party_is_allowed(qemu_acl *acl,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *party);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *party);<br>
&gt;<br>
&gt; =C2=A0void qemu_acl_reset(qemu_acl *acl);<br>
&gt;<br>
&gt; =C2=A0int qemu_acl_append(qemu_acl *acl,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
int deny,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
const char *match);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 int deny,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 const char *match);<br>
&gt; =C2=A0int qemu_acl_insert(qemu_acl *acl,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
int deny,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
const char *match,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
int index);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 int deny,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 const char *match,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 int index);<br>
&gt; =C2=A0int qemu_acl_remove(qemu_acl *acl,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
const char *match);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 const char *match);<br>
&gt;<br>
&gt; =C2=A0#endif /* QEMU_ACL_H */<br>
&gt; diff --git a/include/qemu/iov.h b/include/qemu/iov.h<br>
&gt; index 72d4c559b4..5f433c7768 100644<br>
&gt; --- a/include/qemu/iov.h<br>
&gt; +++ b/include/qemu/iov.h<br>
&gt; @@ -35,7 +35,7 @@ size_t iov_size(const struct iovec *iov, const unsig=
ned int iov_cnt);<br>
&gt; =C2=A0size_t iov_from_buf_full(const struct iovec *iov, unsigned int i=
ov_cnt,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 size_t offset, const void *buf, size_t bytes);<br>
&gt; =C2=A0size_t iov_to_buf_full(const struct iovec *iov, const unsigned i=
nt iov_cnt,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 size_t offset, void *buf, size_t bytes);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0size_t offset, void *buf, size_t bytes);<br>
&gt;<br>
&gt; =C2=A0static inline size_t<br>
&gt; =C2=A0iov_from_buf(const struct iovec *iov, unsigned int iov_cnt,<br>
&gt; diff --git a/include/scsi/constants.h b/include/scsi/constants.h<br>
&gt; index 083a8e887a..0dc550732d 100644<br>
&gt; --- a/include/scsi/constants.h<br>
&gt; +++ b/include/scsi/constants.h<br>
&gt; @@ -212,7 +212,7 @@<br>
&gt; =C2=A0#define TYPE_ROM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x05<b=
r>
&gt; =C2=A0#define TYPE_SCANNER=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x06<br>
&gt; =C2=A0#define TYPE_MOD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x07=
=C2=A0 =C2=A0 /* Magneto-optical disk -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * - treated as TYP=
E_DISK */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* - treated =
as TYPE_DISK */<br>
&gt; =C2=A0#define TYPE_MEDIUM_CHANGER 0x08<br>
&gt; =C2=A0#define TYPE_STORAGE_ARRAY=C2=A0 0x0c=C2=A0 =C2=A0 /* Storage ar=
ray device */<br>
&gt; =C2=A0#define TYPE_ENCLOSURE=C2=A0 =C2=A0 =C2=A0 0x0d=C2=A0 =C2=A0 /* =
Enclosure Services Device */<br>
&gt; diff --git a/include/sysemu/balloon.h b/include/sysemu/balloon.h<br>
&gt; index 66543ae8f4..c8f6145257 100644<br>
&gt; --- a/include/sysemu/balloon.h<br>
&gt; +++ b/include/sysemu/balloon.h<br>
&gt; @@ -20,7 +20,7 @@ typedef void (QEMUBalloonEvent)(void *opaque, ram_ad=
dr_t target);<br>
&gt; =C2=A0typedef void (QEMUBalloonStatus)(void *opaque, BalloonInfo *info=
);<br>
&gt;<br>
&gt; =C2=A0int qemu_add_balloon_handler(QEMUBalloonEvent *event_func,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QEMUBalloonStatus *stat_func, void *opaque);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QEMUBalloonStatus *stat_func, void *opaq=
ue);<br>
&gt; =C2=A0void qemu_remove_balloon_handler(void *opaque);<br>
&gt; =C2=A0bool qemu_balloon_is_inhibited(void);<br>
&gt; =C2=A0void qemu_balloon_inhibit(bool state);<br>
&gt; diff --git a/linux-user/linuxload.c b/linux-user/linuxload.c<br>
&gt; index 6717c9c6f0..a27e1d0d8b 100644<br>
&gt; --- a/linux-user/linuxload.c<br>
&gt; +++ b/linux-user/linuxload.c<br>
&gt; @@ -38,15 +38,15 @@ static int prepare_binprm(struct linux_binprm *bpr=
m)<br>
&gt; =C2=A0 =C2=A0 =C2=A0int retval;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0if(fstat(bprm-&gt;fd, &amp;st) &lt; 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return(-errno);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return(-errno);<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0mode =3D st.st_mode;<br>
&gt; =C2=A0 =C2=A0 =C2=A0if(!S_ISREG(mode)) {=C2=A0 =C2=A0 =C2=A0 =C2=A0/* =
Must be regular file */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return(-EACCES);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return(-EACCES);<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0if(!(mode &amp; 0111)) {=C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* Must have at least one execute bit set */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return(-EACCES);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return(-EACCES);<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0bprm-&gt;e_uid =3D geteuid();<br>
&gt; @@ -54,7 +54,7 @@ static int prepare_binprm(struct linux_binprm *bprm)=
<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0/* Set-uid? */<br>
&gt; =C2=A0 =C2=A0 =C2=A0if(mode &amp; S_ISUID) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0bprm-&gt;e_uid =3D st.st_uid;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bprm-&gt;e_uid =3D st.st_uid;<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0/* Set-gid? */<br>
&gt; @@ -64,13 +64,13 @@ static int prepare_binprm(struct linux_binprm *bpr=
m)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 * executable.<br>
&gt; =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; =C2=A0 =C2=A0 =C2=A0if ((mode &amp; (S_ISGID | S_IXGRP)) =3D=3D (S_ISG=
ID | S_IXGRP)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0bprm-&gt;e_gid =3D st.st_gid;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bprm-&gt;e_gid =3D st.st_gid;<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0retval =3D read(bprm-&gt;fd, bprm-&gt;buf, BPRM_BU=
F_SIZE);<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (retval &lt; 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0perror(&quot;prepare_binprm&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0exit(-1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 perror(&quot;prepare_binprm&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(-1);<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (retval &lt; BPRM_BUF_SIZE) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Make sure the rest of the loader =
won&#39;t read garbage.=C2=A0 */<br>
&gt; diff --git a/linux-user/main.c b/linux-user/main.c<br>
&gt; index 923cbb753a..a0aba9cb1e 100644<br>
&gt; --- a/linux-user/main.c<br>
&gt; +++ b/linux-user/main.c<br>
&gt; @@ -740,8 +740,8 @@ int main(int argc, char **argv, char **envp)<br>
&gt; =C2=A0 =C2=A0 =C2=A0target_argc =3D argc - optind;<br>
&gt; =C2=A0 =C2=A0 =C2=A0target_argv =3D calloc(target_argc + 1, sizeof (ch=
ar *));<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (target_argv =3D=3D NULL) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0(void) fprintf(stderr, &quot;Unable to all=
ocate memory for target_argv\n&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0exit(EXIT_FAILURE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (void) fprintf(stderr, &quot;Unable to al=
locate memory for target_argv\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(EXIT_FAILURE);<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; diff --git a/linux-user/mmap.c b/linux-user/mmap.c<br>
&gt; index 41e0983ce8..e0249efe4f 100644<br>
&gt; --- a/linux-user/mmap.c<br>
&gt; +++ b/linux-user/mmap.c<br>
&gt; @@ -485,11 +485,11 @@ abi_long target_mmap(abi_ulong start, abi_ulong =
len, int prot,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0end =3D start + len;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0real_end =3D HOST_PAGE_ALIGN(end);<b=
r>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Test if requested memory area fits targ=
et address space<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 * It can fail only on 64-bit host with 32=
-bit target.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 * On any other target/host host mmap() ha=
ndles this error correctly.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Test if requested memory area fit=
s target address space<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* It can fail only on 64-bit host w=
ith 32-bit target.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* On any other target/host host mma=
p() handles this error correctly.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!guest_range_valid(start, len)) =
{<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errno =3D ENOMEM;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; diff --git a/linux-user/qemu.h b/linux-user/qemu.h<br>
&gt; index dd5771ce0c..069df8f1f9 100644<br>
&gt; --- a/linux-user/qemu.h<br>
&gt; +++ b/linux-user/qemu.h<br>
&gt; @@ -50,7 +50,7 @@ struct image_info {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0abi_ulong=C2=A0 =C2=A0 =C2=A0 =C2=A0=
env_strings;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0abi_ulong=C2=A0 =C2=A0 =C2=A0 =C2=A0=
file_string;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
elf_flags;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0personality;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 personality;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0abi_ulong=C2=A0 =C2=A0 =C2=A0 =C2=A0=
alignment;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* The fields below are used in FDPI=
C mode.=C2=A0 */<br>
&gt; @@ -174,7 +174,7 @@ extern unsigned long mmap_min_addr;<br>
&gt; =C2=A0struct linux_binprm {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char buf[BPRM_BUF_SIZE] __attribute_=
_((aligned));<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0abi_ulong p;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0int fd;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 int fd;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int e_uid, e_gid;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int argc, envc;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char **argv;<br>
&gt; diff --git a/linux-user/signal.c b/linux-user/signal.c<br>
&gt; index 602b631b92..e2c0b37173 100644<br>
&gt; --- a/linux-user/signal.c<br>
&gt; +++ b/linux-user/signal.c<br>
&gt; @@ -727,7 +727,7 @@ abi_long do_sigaltstack(abi_ulong uss_addr, abi_ul=
ong uoss_addr, abi_ulong sp)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0#endif<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -TARGET_EFAULT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -TARGET_EFAULT;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!lock_user_struct(VERIFY_READ, u=
ss, uss_addr, 1)) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -736,25 +736,25 @@ abi_long do_sigaltstack(abi_ulong uss_addr, abi_=
ulong uoss_addr, abi_ulong sp)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__get_user(ss.ss_flags, &amp;uss-&gt=
;ss_flags);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unlock_user_struct(uss, uss_addr, 0)=
;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -TARGET_EPERM;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (on_sig_stack(sp))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -TARGET_EPERM;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (on_sig_stack(sp))<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -TARGET_EINVAL;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ss.ss_flags !=3D TARGET_SS_DISABLE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -TARGET_EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ss.ss_flags !=3D TARGET_SS_DISABLE<br=
>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; ss.ss_flags=
 !=3D TARGET_SS_ONSTACK<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; ss.ss_flags=
 !=3D 0)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ss.ss_flags =3D=3D TARGET_SS_DISABLE) =
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ss.ss_flags =3D=3D TARGET_SS_DISABLE)=
 {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ss.ss_size =3D 0;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ss.ss_sp =3D 0;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -TARGET_ENOMEM=
;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ss.ss_size &lt; mi=
nstacksize) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out=
;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_sigaltstack_used.ss_sp =3D ss=
.ss_sp;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_sigaltstack_used.ss_size =3D =
ss.ss_size;<br>
&gt; diff --git a/linux-user/strace.c b/linux-user/strace.c<br>
&gt; index d1d14945f9..7318392e57 100644<br>
&gt; --- a/linux-user/strace.c<br>
&gt; +++ b/linux-user/strace.c<br>
&gt; @@ -647,11 +647,11 @@ print_execve(const struct syscallname *name,<br>
&gt; =C2=A0 =C2=A0 =C2=A0for (arg_ptr_addr =3D arg2; ; arg_ptr_addr +=3D si=
zeof(abi_ulong)) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0abi_ulong *arg_ptr, arg_addr;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0arg_ptr =3D lock_user(VERIFY_READ, arg_ptr=
_addr, sizeof(abi_ulong), 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 arg_ptr =3D lock_user(VERIFY_READ, arg_pt=
r_addr, sizeof(abi_ulong), 1);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!arg_ptr)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; =C2=A0 =C2=A0 =C2=A0arg_addr =3D tswapal(*arg_ptr);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0unlock_user(arg_ptr, arg_ptr_addr, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 unlock_user(arg_ptr, arg_ptr_addr, 0);<br=
>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!arg_addr)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((s =3D lock_user_string(arg_addr=
))) {<br>
&gt; diff --git a/linux-user/uaccess.c b/linux-user/uaccess.c<br>
&gt; index 0a5c0b0b29..e215ecc2a6 100644<br>
&gt; --- a/linux-user/uaccess.c<br>
&gt; +++ b/linux-user/uaccess.c<br>
&gt; @@ -30,7 +30,7 @@ abi_long copy_to_user(abi_ulong gaddr, void *hptr, s=
ize_t len)<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0if ((ghptr =3D lock_user(VERIFY_WRITE, gaddr, len,=
 0))) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(ghptr, hptr, len);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0unlock_user(ghptr, gaddr, len);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 unlock_user(ghptr, gaddr, len);<br>
&gt; =C2=A0 =C2=A0 =C2=A0} else<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -TARGET_EFAULT;<br>
&gt;<br>
&gt; diff --git a/linux-user/vm86.c b/linux-user/vm86.c<br>
&gt; index 3829b9a677..9c393df424 100644<br>
&gt; --- a/linux-user/vm86.c<br>
&gt; +++ b/linux-user/vm86.c<br>
&gt; @@ -257,7 +257,7 @@ void handle_vm86_trap(CPUX86State *env, int trapno=
)<br>
&gt; =C2=A0#define CHECK_IF_IN_TRAP() \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((ts-&gt;vm86plus.vm86plus.flags &amp; T=
ARGET_vm86dbg_active) &amp;&amp; \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(ts-&gt;vm86plus.vm86plus.fla=
gs &amp; TARGET_vm86dbg_TFpendig)) \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0newflags |=3D =
TF_MASK<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 newflags |=3D=
 TF_MASK<br>
&gt;<br>
&gt; =C2=A0#define VM86_FAULT_RETURN \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((ts-&gt;vm86plus.vm86plus.flags =
&amp; TARGET_force_return_for_pic) &amp;&amp; \<br>
&gt; diff --git a/nbd/client.c b/nbd/client.c<br>
&gt; index b4d457a19a..69f5e1b7d2 100644<br>
&gt; --- a/nbd/client.c<br>
&gt; +++ b/nbd/client.c<br>
&gt; @@ -1028,7 +1028,7 @@ int nbd_disconnect(int fd)<br>
&gt;<br>
&gt; =C2=A0#else<br>
&gt; =C2=A0int nbd_init(int fd, QIOChannelSocket *ioc, NBDExportInfo *info,=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Error **errp)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;nbd_init is only supported =
on Linux&quot;);<br>
&gt; =C2=A0 =C2=A0 =C2=A0return -ENOTSUP;<br>
&gt; diff --git a/net/checksum.c b/net/checksum.c<br>
&gt; index 4da72a6a6c..273bc9c6bc 100644<br>
&gt; --- a/net/checksum.c<br>
&gt; +++ b/net/checksum.c<br>
&gt; @@ -43,7 +43,7 @@ uint32_t net_checksum_add_cont(int len, uint8_t *buf=
, int seq)<br>
&gt; =C2=A0uint16_t net_checksum_finish(uint32_t sum)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0while (sum&gt;&gt;16)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0sum =3D (sum &amp; 0xFFFF)+(sum &gt;&gt; 1=
6);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sum =3D (sum &amp; 0xFFFF)+(sum &gt;&gt; =
16);<br>
&gt; =C2=A0 =C2=A0 =C2=A0return ~sum;<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; diff --git a/qtest.c b/qtest.c<br>
&gt; index 69b9e9962b..55df6c43db 100644<br>
&gt; --- a/qtest.c<br>
&gt; +++ b/qtest.c<br>
&gt; @@ -290,7 +290,7 @@ static void qtest_process_command(CharBackend *chr=
, gchar **words)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!dev) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qtest_send_prefix(chr)=
;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qtest_send(chr, &quot;=
FAIL Unknown device\n&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (irq_intercept_dev) {<br>
&gt; @@ -300,7 +300,7 @@ static void qtest_process_command(CharBackend *chr=
, gchar **words)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qtest_se=
nd(chr, &quot;OK\n&quot;);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QLIST_FOREACH(ngl, &amp;dev-&gt;gpio=
s, node) {<br>
&gt; diff --git a/target/alpha/translate.c b/target/alpha/translate.c<br>
&gt; index e5d62850c5..9d8f9b3eea 100644<br>
&gt; --- a/target/alpha/translate.c<br>
&gt; +++ b/target/alpha/translate.c<br>
&gt; @@ -804,7 +804,7 @@ static void gen_cvttq(DisasContext *ctx, int rb, i=
nt rc, int fn11)<br>
&gt;<br>
&gt; =C2=A0static void gen_ieee_intcvt(DisasContext *ctx,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void (*helper)(TCGv, TCGv_ptr, TCGv),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0int rb, int rc, int fn11)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int rb, int rc, int fn11)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0TCGv vb, vc;<br>
&gt;<br>
&gt; diff --git a/target/cris/helper.c b/target/cris/helper.c<br>
&gt; index d2ec349191..754fa00d06 100644<br>
&gt; --- a/target/cris/helper.c<br>
&gt; +++ b/target/cris/helper.c<br>
&gt; @@ -240,7 +240,7 @@ void cris_cpu_do_interrupt(CPUState *cs)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Exception starts with dslot clear=
ed.=C2=A0 */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;dslot =3D 0;<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt; =C2=A0 =C2=A0 =C2=A0if (env-&gt;pregs[PR_CCS] &amp; U_FLAG) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Swap stack pointers.=C2=A0 */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;pregs[PR_USP] =3D env-&gt;re=
gs[R_SP];<br>
&gt; diff --git a/target/cris/mmu.h b/target/cris/mmu.h<br>
&gt; index 8e249e812b..0217f476de 100644<br>
&gt; --- a/target/cris/mmu.h<br>
&gt; +++ b/target/cris/mmu.h<br>
&gt; @@ -5,13 +5,13 @@<br>
&gt;<br>
&gt; =C2=A0struct cris_mmu_result<br>
&gt; =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t phy;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0int prot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0int bf_vec;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t phy;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 int prot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 int bf_vec;<br>
&gt; =C2=A0};<br>
&gt;<br>
&gt; =C2=A0void cris_mmu_init(CPUCRISState *env);<br>
&gt; =C2=A0void cris_mmu_flush_pid(CPUCRISState *env, uint32_t pid);<br>
&gt; =C2=A0int cris_mmu_translate(struct cris_mmu_result *res,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 CPUCRISState *env, uint32_t vaddr,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 int rw, int mmu_idx, int debug);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0CPUCRISState *env, uint32_t vaddr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0int rw, int mmu_idx, int debug);<br>
&gt; diff --git a/target/cris/translate_v10.inc.c b/target/cris/translate_v=
10.inc.c<br>
&gt; index fce78825cc..a87b8bb281 100644<br>
&gt; --- a/target/cris/translate_v10.inc.c<br>
&gt; +++ b/target/cris/translate_v10.inc.c<br>
&gt; @@ -384,7 +384,7 @@ static unsigned int dec10_setclrf(DisasContext *dc=
)<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; =C2=A0static inline void dec10_reg_prep_sext(DisasContext *dc, int siz=
e, int sext,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv dd, TC=
Gv ds, TCGv sd, TCGv ss)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TCGv =
dd, TCGv ds, TCGv sd, TCGv ss)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (sext) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t_gen_sext(dd, sd, size);<br>
&gt; diff --git a/target/i386/translate.c b/target/i386/translate.c<br>
&gt; index 0dd5fbe45c..49cd298374 100644<br>
&gt; --- a/target/i386/translate.c<br>
&gt; +++ b/target/i386/translate.c<br>
&gt; @@ -3445,7 +3445,7 @@ static void gen_sse(CPUX86State *env, DisasConte=
xt *s, int b,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 0x172:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 0x173:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (b1 &gt;=3D 2) {<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto unknown_o=
p;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto unknown_=
op;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D x86_ldub_code(=
env, s);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (is_xmm) {<br>
&gt; @@ -6400,7 +6400,7 @@ static target_ulong disas_insn(DisasContext *s, =
CPUState *cpu)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 SVM_IOIO_TYPE_MASK | svm_is_rep(prefixes));<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (tb_cflags(s-&gt;base.tb) &amp; C=
F_USE_ICOUNT) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_io_start();<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_movi_i32(s-&gt;tmp2_i32, val=
);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_helper_in_func(ot, s-&gt;T1, s-&=
gt;tmp2_i32);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_op_mov_reg_v(s, ot, R_EAX, s-&gt=
;T1);<br>
&gt; @@ -6421,7 +6421,7 @@ static target_ulong disas_insn(DisasContext *s, =
CPUState *cpu)<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (tb_cflags(s-&gt;base.tb) &amp; C=
F_USE_ICOUNT) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_io_start();<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_movi_i32(s-&gt;tmp2_i32, val=
);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_trunc_tl_i32(s-&gt;tmp3_i32,=
 s-&gt;T1);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_helper_out_func(ot, s-&gt;tmp2_i=
32, s-&gt;tmp3_i32);<br>
&gt; @@ -6439,7 +6439,7 @@ static target_ulong disas_insn(DisasContext *s, =
CPUState *cpu)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 SVM_IOIO_TYPE_MASK | svm_is_rep(prefixes));<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (tb_cflags(s-&gt;base.tb) &amp; C=
F_USE_ICOUNT) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_io_start();<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_trunc_tl_i32(s-&gt;tmp2_i32,=
 s-&gt;T0);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_helper_in_func(ot, s-&gt;T1, s-&=
gt;tmp2_i32);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_op_mov_reg_v(s, ot, R_EAX, s-&gt=
;T1);<br>
&gt; @@ -6459,7 +6459,7 @@ static target_ulong disas_insn(DisasContext *s, =
CPUState *cpu)<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (tb_cflags(s-&gt;base.tb) &amp; C=
F_USE_ICOUNT) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_io_start();<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_trunc_tl_i32(s-&gt;tmp2_i32,=
 s-&gt;T0);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_trunc_tl_i32(s-&gt;tmp3_i32,=
 s-&gt;T1);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_helper_out_func(ot, s-&gt;tmp2_i=
32, s-&gt;tmp3_i32);<br>
&gt; @@ -7166,7 +7166,7 @@ static target_ulong disas_insn(DisasContext *s, =
CPUState *cpu)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_jmp_im(s, pc_start - s-&gt;cs_ba=
se);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (tb_cflags(s-&gt;base.tb) &amp; C=
F_USE_ICOUNT) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_io_start();<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_helper_rdtsc(cpu_env);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (tb_cflags(s-&gt;base.tb) &amp; C=
F_USE_ICOUNT) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_io_end();<br>
&gt; diff --git a/target/mips/translate.c b/target/mips/translate.c<br>
&gt; index e9c23a594b..b8dcab5307 100644<br>
&gt; --- a/target/mips/translate.c<br>
&gt; +++ b/target/mips/translate.c<br>
&gt; @@ -6942,7 +6942,7 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg=
, int reg, int sel)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Mark as an IO opera=
tion because we read the time.=C2=A0 */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (tb_cflags(ctx-&gt;=
base.tb) &amp; CF_USE_ICOUNT) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_io_s=
tart();<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_helper_mfc0_count(=
arg, cpu_env);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (tb_cflags(ctx-&gt;=
base.tb) &amp; CF_USE_ICOUNT) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_io_e=
nd();<br>
&gt; diff --git a/target/tilegx/translate.c b/target/tilegx/translate.c<br>
&gt; index f201150fc7..df1e4d0fef 100644<br>
&gt; --- a/target/tilegx/translate.c<br>
&gt; +++ b/target/tilegx/translate.c<br>
&gt; @@ -297,7 +297,7 @@ static TileExcp gen_st_opcode(DisasContext *dc, un=
signed dest, unsigned srca,<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0tcg_gen_qemu_st_tl(load_gr(dc, srcb), load_gr(dc, =
srca),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 dc-&gt;mmuidx, memop);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0dc-&gt;mmuidx, memop);<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0qemu_log_mask(CPU_LOG_TB_IN_ASM, &quot;%s %s, %s&q=
uot;, name,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r=
eg_names[srca], reg_names[srcb]);<br>
&gt; diff --git a/tcg/i386/tcg-target.inc.c b/tcg/i386/tcg-target.inc.c<br>
&gt; index 436195894b..cdca3fe034 100644<br>
&gt; --- a/tcg/i386/tcg-target.inc.c<br>
&gt; +++ b/tcg/i386/tcg-target.inc.c<br>
&gt; @@ -3424,8 +3424,8 @@ static void tcg_target_qemu_prologue(TCGContext =
*s)<br>
&gt; =C2=A0 =C2=A0 =C2=A0tcg_out_addi(s, TCG_REG_ESP, -stack_addend);<br>
&gt; =C2=A0 =C2=A0 =C2=A0/* jmp *tb.=C2=A0 */<br>
&gt; =C2=A0 =C2=A0 =C2=A0tcg_out_modrm_offset(s, OPC_GRP5, EXT5_JMPN_Ev, TC=
G_REG_ESP,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 (ARRAY_SIZE(tcg_target_callee_save_regs) + 2) * 4<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 + stack_addend);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0(ARRAY_SIZE(tcg_target_callee_save_regs) + 2) * 4<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0+ stack_addend);<br>
&gt; =C2=A0#else<br>
&gt; =C2=A0 =C2=A0 =C2=A0tcg_out_mov(s, TCG_TYPE_PTR, TCG_AREG0, tcg_target=
_call_iarg_regs[0]);<br>
&gt; =C2=A0 =C2=A0 =C2=A0tcg_out_addi(s, TCG_REG_ESP, -stack_addend);<br>
&gt; diff --git a/tests/tcg/alpha/test-cond.c b/tests/tcg/alpha/test-cond.c=
<br>
&gt; index e625313b3e..3e11c4c105 100644<br>
&gt; --- a/tests/tcg/alpha/test-cond.c<br>
&gt; +++ b/tests/tcg/alpha/test-cond.c<br>
&gt; @@ -6,7 +6,7 @@<br>
&gt; =C2=A0int test_##N (long a)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; =C2=A0{=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; =C2=A0 =C2=A0int res =3D 1;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; =C2=A0 =C2=A0asm (&quot;cmov&quot;#N&quot; %1,$31,%0&quot;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 : &quot;+r&quot; (res) : &quot;r&quot; (a)=
);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>
&gt; =C2=A0 =C2=A0return !res;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<=
br>
&gt; @@ -18,7 +18,7 @@ int test_##N (long a)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; =C2=A0int test_##N (long a)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; =C2=A0{=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; =C2=A0 =C2=A0int res =3D 1;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; =C2=A0 =C2=A0asm (&quot;b&quot;#N&quot; %1,1f\n\t&quot;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;addq $31,$31,%0\n\t&quot;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;1: unop\n&quot;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0\<br>
&gt; diff --git a/tests/tcg/arm/hello-arm.c b/tests/tcg/arm/hello-arm.c<br>
&gt; index 6e5a93bccf..e33edf949f 100644<br>
&gt; --- a/tests/tcg/arm/hello-arm.c<br>
&gt; +++ b/tests/tcg/arm/hello-arm.c<br>
&gt; @@ -11,7 +11,7 @@<br>
&gt;<br>
&gt; =C2=A0#define __syscall_return(type, res)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; =C2=A0do {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return (type) (res);=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (type) (res);=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; =C2=A0} while (0)<br>
&gt;<br>
&gt; =C2=A0#define _syscall0(type,name)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; @@ -33,7 +33,7 @@ type name(type1 arg1) {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0\<br>
&gt; =C2=A0 =C2=A0&quot;mov %0,r0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: &quot;=3Dr&quot; (__res)=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0\<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: &quot;r&quot; ((long)(arg1))=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0: &quot;r0&quot;,&quot;lr&quot;);=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 : &quot;r0&quot;,&quot;lr&quot;);=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 \<br>
&gt; =C2=A0 =C2=A0__syscall_return(type,__res);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; @@ -47,7 +47,7 @@ type name(type1 arg1,type2 arg2) {=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; =C2=A0 =C2=A0&quot;mov\t%0,r0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0\<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: &quot;=3Dr&quot; (__res)=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0\<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: &quot;r&quot; ((long)(arg1)),&quot=
;r&quot; ((long)(arg2))=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0: &quot;r0&quot;,&quot;r1&quot;,&quot;lr&q=
uot;);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 : &quot;r0&quot;,&quot;r1&quot;,&quot;lr&=
quot;);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0\<br>
&gt; =C2=A0 =C2=A0__syscall_return(type,__res);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; @@ -78,9 +78,9 @@ type name(type1 arg1, type2 arg2, type3 arg3, type4 =
arg4) {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; =C2=A0 =C2=A0&quot;mov\tr3,%4\n\t&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; =C2=A0 =C2=A0__syscall(name)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; =C2=A0 =C2=A0&quot;mov\t%0,r0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0: &quot;=3Dr&quot; (__res)=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0: &quot;r&quot; ((long)(arg1)),&quot;r&quo=
t; ((long)(arg2)),&quot;r&quot; ((long)(arg3)),&quot;r&quot; ((long)(arg4))=
=C2=A0 =C2=A0\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0: &quot;r0&quot;,&quot;r1&quot;,&quot;r2&q=
uot;,&quot;r3&quot;,&quot;lr&quot;);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 : &quot;=3Dr&quot; (__res)=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 : &quot;r&quot; ((long)(arg1)),&quot;r&qu=
ot; ((long)(arg2)),&quot;r&quot; ((long)(arg3)),&quot;r&quot; ((long)(arg4)=
)=C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 : &quot;r0&quot;,&quot;r1&quot;,&quot;r2&=
quot;,&quot;r3&quot;,&quot;lr&quot;);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; =C2=A0 =C2=A0__syscall_return(type,__res);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; @@ -96,10 +96,10 @@ type name(type1 arg1, type2 arg2, type3 arg3, type=
4 arg4, type5 arg5) {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; =C2=A0 =C2=A0&quot;mov\tr4,%5\n\t&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; =C2=A0 =C2=A0__syscall(name)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; =C2=A0 =C2=A0&quot;mov\t%0,r0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0: &quot;=3Dr&quot; (__res)=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0: &quot;r&quot; ((long)(arg1)),&quot;r&quo=
t; ((long)(arg2)),&quot;r&quot; ((long)(arg3)),&quot;r&quot; ((long)(arg4))=
,=C2=A0 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;r&quot; ((long)(arg5))=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0: &quot;r0&quot;,&quot;r1&quot;,&quot;r2&q=
uot;,&quot;r3&quot;,&quot;r4&quot;,&quot;lr&quot;);=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 : &quot;=3Dr&quot; (__res)=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 : &quot;r&quot; ((long)(arg1)),&quot;r&qu=
ot; ((long)(arg2)),&quot;r&quot; ((long)(arg3)),&quot;r&quot; ((long)(arg4)=
), \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;r&quot; ((long)(arg5))=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 : &quot;r0&quot;,&quot;r1&quot;,&quot;r2&=
quot;,&quot;r3&quot;,&quot;r4&quot;,&quot;lr&quot;);=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; =C2=A0 =C2=A0__syscall_return(type,__res);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; diff --git a/tests/tcg/cris/check_glibc_kernelversion.c b/tests/tcg/cr=
is/check_glibc_kernelversion.c<br>
&gt; index 07448722c0..7aada89911 100644<br>
&gt; --- a/tests/tcg/cris/check_glibc_kernelversion.c<br>
&gt; +++ b/tests/tcg/cris/check_glibc_kernelversion.c<br>
&gt; @@ -109,8 +109,8 @@ int main(void)<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (parts &lt; 3)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0version &lt;&lt;=3D 8 * (3 - =
parts);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (version &lt; __LINUX_KERNEL_VERSION)<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err();<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0pass();<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0exit(0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (version &lt; __LINUX_KERNEL_VERSION)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pass();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(0);<br>
&gt; =C2=A0}<br>
&gt; diff --git a/tests/tcg/cris/check_mmap3.c b/tests/tcg/cris/check_mmap3=
.c<br>
&gt; index 34401fa0c9..cb890ef120 100644<br>
&gt; --- a/tests/tcg/cris/check_mmap3.c<br>
&gt; +++ b/tests/tcg/cris/check_mmap3.c<br>
&gt; @@ -17,7 +17,7 @@ int main (int argc, char *argv[])<br>
&gt;<br>
&gt; =C2=A0 =C2=A0/* Check that we can map a non-multiple of a page and sti=
ll get a full page.=C2=A0 */<br>
&gt; =C2=A0 =C2=A0a =3D mmap (NULL, 0x4c, PROT_READ | PROT_WRITE | PROT_EXE=
C,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MAP_PRIVATE | MAP_ANONYMOUS,=
 -1, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MAP_PRIVATE | MAP_ANONYMOUS=
, -1, 0);<br>
&gt; =C2=A0 =C2=A0if (a =3D=3D NULL || a =3D=3D (unsigned char *) -1)<br>
&gt; =C2=A0 =C2=A0 =C2=A0abort ();<br>
&gt;<br>
&gt; diff --git a/tests/tcg/cris/check_openpf1.c b/tests/tcg/cris/check_ope=
npf1.c<br>
&gt; index fdcf4c5c3f..251d26eec2 100644<br>
&gt; --- a/tests/tcg/cris/check_openpf1.c<br>
&gt; +++ b/tests/tcg/cris/check_openpf1.c<br>
&gt; @@ -19,7 +19,7 @@ int main (int argc, char *argv[])<br>
&gt; =C2=A0 =C2=A0 =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0fnam =3D malloc (strlen (argv[0]) + 2);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fnam =3D=3D NULL)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0abort ();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 abort ();<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0strcpy (fnam, &quot;/&quot;);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0strcat (fnam, argv[0]);<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; diff --git a/tests/tcg/cris/check_settls1.c b/tests/tcg/cris/check_set=
tls1.c<br>
&gt; index 69d202652a..3abc3a9ea8 100644<br>
&gt; --- a/tests/tcg/cris/check_settls1.c<br>
&gt; +++ b/tests/tcg/cris/check_settls1.c<br>
&gt; @@ -35,7 +35,7 @@ int main (void)<br>
&gt; =C2=A0 =C2=A0 =C2=A0syscall (SYS_set_thread_area, old_tp);<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (tp !=3D 0xeddeed00) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0* (volatile int *) 0 =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * (volatile int *) 0 =3D 0;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0perror (&quot;tls2&quot;);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0abort ();<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; diff --git a/tests/tcg/i386/hello-i386.c b/tests/tcg/i386/hello-i386.c=
<br>
&gt; index cfeb24b2f5..59196dd0b7 100644<br>
&gt; --- a/tests/tcg/i386/hello-i386.c<br>
&gt; +++ b/tests/tcg/i386/hello-i386.c<br>
&gt; @@ -4,19 +4,19 @@ static inline void exit(int status)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0int __res;<br>
&gt; =C2=A0 =C2=A0__asm__ volatile (&quot;movl %%ecx,%%ebx\n&quot;\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&quot;int $0x80&quot; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
:=C2=A0 &quot;=3Da&quot; (__res) : &quot;0&quot; (__NR_exit),&quot;c&quot; =
((long)(status)));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &quot;int $0x80&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 :=C2=A0 &quot;=3Da&quot; (__res) : &quot;0&quot; (__NR_exit),&quot;c&quot;=
 ((long)(status)));<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; =C2=A0static inline int write(int fd, const char * buf, int len)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0int status;<br>
&gt; =C2=A0 =C2=A0__asm__ volatile (&quot;pushl %%ebx\n&quot;\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&quot;movl %%esi,%%ebx\n&quot;\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&quot;int $0x80\n&quot; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&quot;popl %%ebx\n&quot;\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
: &quot;=3Da&quot; (status) \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
: &quot;0&quot; (__NR_write),&quot;S&quot; ((long)(fd)),&quot;c&quot; ((lon=
g)(buf)),&quot;d&quot; ((long)(len)));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &quot;movl %%esi,%%ebx\n&quot;\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &quot;int $0x80\n&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &quot;popl %%ebx\n&quot;\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 : &quot;=3Da&quot; (status) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 : &quot;0&quot; (__NR_write),&quot;S&quot; ((long)(fd)),&quot;c&quot; ((lo=
ng)(buf)),&quot;d&quot; ((long)(len)));<br>
&gt; =C2=A0 =C2=A0return status;<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; diff --git a/tests/tcg/mips/hello-mips.c b/tests/tcg/mips/hello-mips.c=
<br>
&gt; index f8256730dd..c7052fdf2e 100644<br>
&gt; --- a/tests/tcg/mips/hello-mips.c<br>
&gt; +++ b/tests/tcg/mips/hello-mips.c<br>
&gt; @@ -24,9 +24,9 @@ static inline void exit1(int status)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 syscall=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\n&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 .set pop=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0: &quot;i&quot; (__NR_exit), &quot;r&quot;=
 (__a0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0: &quot;$2&quot;, &quot;$8&quot;, &quot;$9=
&quot;, &quot;$10&quot;, &quot;$11&quot;, &quot;$12&quot;, &quot;$13&quot;,=
 &quot;$14&quot;, &quot;$15&quot;, &quot;$24&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;memory&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 : &quot;i&quot; (__NR_exit), &quot;r&quot=
; (__a0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 : &quot;$2&quot;, &quot;$8&quot;, &quot;$=
9&quot;, &quot;$10&quot;, &quot;$11&quot;, &quot;$12&quot;, &quot;$13&quot;=
, &quot;$14&quot;, &quot;$15&quot;, &quot;$24&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;memory&quot;);<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; =C2=A0static inline int write(int fd, const char *buf, int len)<br>
&gt; @@ -46,8 +46,8 @@ static inline int write(int fd, const char *buf, int=
 len)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 .set pop=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: &quot;=3Dr&quot; (__v0), &quot;=3D=
r&quot; (__a3)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: &quot;i&quot; (__NR_write), &quot;=
r&quot; (__a0), &quot;r&quot; (__a1), &quot;r&quot; (__a2)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0: &quot;$2&quot;, &quot;$8&quot;, &quot;$9=
&quot;, &quot;$10&quot;, &quot;$11&quot;, &quot;$12&quot;, &quot;$13&quot;,=
 &quot;$14&quot;, &quot;$15&quot;, &quot;$24&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;memory&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 : &quot;$2&quot;, &quot;$8&quot;, &quot;$=
9&quot;, &quot;$10&quot;, &quot;$11&quot;, &quot;$12&quot;, &quot;$13&quot;=
, &quot;$14&quot;, &quot;$15&quot;, &quot;$24&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;memory&quot;);<br>
&gt;<br>
&gt; =C2=A0/*=C2=A0 =C2=A0 if (__a3 =3D=3D 0) */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return (int) __v0;<br>
&gt; diff --git a/tests/tcg/multiarch/sha1.c b/tests/tcg/multiarch/sha1.c<b=
r>
&gt; index 93b7c8e808..87bfbcdf52 100644<br>
&gt; --- a/tests/tcg/multiarch/sha1.c<br>
&gt; +++ b/tests/tcg/multiarch/sha1.c<br>
&gt; @@ -152,7 +152,7 @@ uint32_t j;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0j =3D context-&gt;count[0];<br>
&gt; =C2=A0 =C2=A0 =C2=A0if ((context-&gt;count[0] +=3D len &lt;&lt; 3) &lt=
; j)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0context-&gt;count[1]++;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 context-&gt;count[1]++;<br>
&gt; =C2=A0 =C2=A0 =C2=A0context-&gt;count[1] +=3D (len&gt;&gt;29);<br>
&gt; =C2=A0 =C2=A0 =C2=A0j =3D (j &gt;&gt; 3) &amp; 63;<br>
&gt; =C2=A0 =C2=A0 =C2=A0if ((j + len) &gt; 63) {<br>
&gt; @@ -186,11 +186,11 @@ unsigned char c;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; 2; i++)<br>
&gt; =C2=A0 =C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t t =3D context-&gt;count[i];<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0int j;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t t =3D context-&gt;count[i];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 int j;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0for (j =3D 0; j &lt; 4; t &gt;&gt;=3D 8, j=
++)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*--fcp =3D (unsigned char) t=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (j =3D 0; j &lt; 4; t &gt;&gt;=3D 8, =
j++)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *--fcp =3D (unsigned char) =
t;<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0#else<br>
&gt; =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; 8; i++) {<br>
&gt; @@ -201,7 +201,7 @@ unsigned char c;<br>
&gt; =C2=A0 =C2=A0 =C2=A0c =3D 0200;<br>
&gt; =C2=A0 =C2=A0 =C2=A0SHA1Update(context, &amp;c, 1);<br>
&gt; =C2=A0 =C2=A0 =C2=A0while ((context-&gt;count[0] &amp; 504) !=3D 448) =
{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0c =3D 0000;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 c =3D 0000;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SHA1Update(context, &amp;c, 1);<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0SHA1Update(context, finalcount, 8);=C2=A0 /* Shoul=
d cause a SHA1Transform() */<br>
&gt; diff --git a/tests/vhost-user-test.c b/tests/vhost-user-test.c<br>
&gt; index 9d7b0d48a0..4e43d6b96e 100644<br>
&gt; --- a/tests/vhost-user-test.c<br>
&gt; +++ b/tests/vhost-user-test.c<br>
&gt; @@ -369,8 +369,8 @@ static void chr_read(void *opaque, const uint8_t *=
buf, int size)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case VHOST_USER_SET_FEATURES:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert_cmpint(msg.payload.u64 &amp; (0x1=
ULL &lt;&lt; VHOST_USER_F_PROTOCOL_FEATURES),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0!=3D, 0ULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_cmpint(msg.payload.u64 &amp; (0x=
1ULL &lt;&lt; VHOST_USER_F_PROTOCOL_FEATURES),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 !=3D, 0ULL);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;test_flags =3D=3D TEST_FLA=
GS_DISCONNECT) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_chr_fe_disconnect=
(chr);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;test_flags =3D T=
EST_FLAGS_BAD;<br>
&gt; diff --git a/ui/keymaps.h b/ui/keymaps.h<br>
&gt; index 98213a4191..4e9c87fb8f 100644<br>
&gt; --- a/ui/keymaps.h<br>
&gt; +++ b/ui/keymaps.h<br>
&gt; @@ -28,8 +28,8 @@<br>
&gt; =C2=A0#include &quot;qemu-common.h&quot;<br>
&gt;<br>
&gt; =C2=A0typedef struct {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0const char* name;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0int keysym;<br>
&gt; +=C2=A0 =C2=A0 const char* name;<br>
&gt; +=C2=A0 =C2=A0 int keysym;<br>
&gt; =C2=A0} name2keysym_t;<br>
&gt;<br>
&gt; =C2=A0/* scancode without modifiers */<br>
&gt; diff --git a/ui/qemu-pixman.c b/ui/qemu-pixman.c<br>
&gt; index 3e52abd92d..1429cf08d5 100644<br>
&gt; --- a/ui/qemu-pixman.c<br>
&gt; +++ b/ui/qemu-pixman.c<br>
&gt; @@ -36,7 +36,7 @@ PixelFormat qemu_pixelformat_from_pixman(pixman_form=
at_code_t format)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pf.rshift =3D 0;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case PIXMAN_TYPE_BGRA:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0pf.bshift =3D bpp - pf.bbits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pf.bshift =3D bpp - pf.bbits;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pf.gshift =3D bpp - (pf.bbits + pf.g=
bits);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pf.rshift =3D bpp - (pf.bbits + pf.g=
bits + pf.rbits);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pf.ashift =3D 0;<br>
&gt; diff --git a/ui/vnc-enc-zywrle-template.c b/ui/vnc-enc-zywrle-template=
.c<br>
&gt; index b446380a7a..e9be55966e 100644<br>
&gt; --- a/ui/vnc-enc-zywrle-template.c<br>
&gt; +++ b/ui/vnc-enc-zywrle-template.c<br>
&gt; @@ -44,8 +44,8 @@ OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY=
 OF SUCH DAMAGE.<br>
&gt;<br>
&gt; =C2=A0/* Change Log:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 V0.02 : 2008/02/04 : Fix mis encode/decode when w=
idth !=3D scanline<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (Thanks Johannes Schindelin, author of LibVNC<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Server/Client)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(Thanks Johannes Schindelin, author of L=
ibVNC<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Server/Client)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 V0.01 : 2007/02/06 : Initial release<br>
&gt; =C2=A0*/<br>
&gt;<br>
&gt; diff --git a/ui/vnc.c b/ui/vnc.c<br>
&gt; index 0c1b477425..9e4b2beb71 100644<br>
&gt; --- a/ui/vnc.c<br>
&gt; +++ b/ui/vnc.c<br>
&gt; @@ -3097,8 +3097,8 @@ static void vnc_connect(VncDisplay *vd, QIOChann=
elSocket *sioc,<br>
&gt; =C2=A0 =C2=A0 =C2=A0buffer_init(&amp;vs-&gt;zrle.zlib,=C2=A0 =C2=A0 =
=C2=A0 &quot;vnc-zrle-zlib/%p&quot;, sioc);<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (skipauth) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0vs-&gt;auth =3D VNC_AUTH_NONE;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0vs-&gt;subauth =3D VNC_AUTH_INVALID;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vs-&gt;auth =3D VNC_AUTH_NONE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vs-&gt;subauth =3D VNC_AUTH_INVALID;<br>
&gt; =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (websocket) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vs-&gt;auth =3D vd-&gt=
;ws_auth;<br>
&gt; diff --git a/util/bitops.c b/util/bitops.c<br>
&gt; index f2364015c4..3fe6b1c4f1 100644<br>
&gt; --- a/util/bitops.c<br>
&gt; +++ b/util/bitops.c<br>
&gt; @@ -18,7 +18,7 @@<br>
&gt; =C2=A0 * Find the next set bit in a memory region.<br>
&gt; =C2=A0 */<br>
&gt; =C2=A0unsigned long find_next_bit(const unsigned long *addr, unsigned =
long size,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long offset)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long offset)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0const unsigned long *p =3D addr + BIT_WORD(offset)=
;<br>
&gt; =C2=A0 =C2=A0 =C2=A0unsigned long result =3D offset &amp; ~(BITS_PER_L=
ONG-1);<br>
&gt; @@ -83,7 +83,7 @@ found_middle:<br>
&gt; =C2=A0 * Linus&#39; asm-alpha/bitops.h.<br>
&gt; =C2=A0 */<br>
&gt; =C2=A0unsigned long find_next_zero_bit(const unsigned long *addr, unsi=
gned long size,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long offset)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long offset)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0const unsigned long *p =3D addr + BIT_WORD(offset)=
;<br>
&gt; =C2=A0 =C2=A0 =C2=A0unsigned long result =3D offset &amp; ~(BITS_PER_L=
ONG-1);<br>
&gt; diff --git a/util/osdep.c b/util/osdep.c<br>
&gt; index 1c8d1e2ee0..4b5dc7287d 100644<br>
&gt; --- a/util/osdep.c<br>
&gt; +++ b/util/osdep.c<br>
&gt; @@ -470,8 +470,8 @@ void fips_set_state(bool requested)<br>
&gt;<br>
&gt; =C2=A0#ifdef _FIPS_DEBUG<br>
&gt; =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;FIPS mode %s (requested %s)\=
n&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fips_enabled ? &quot;enable=
d&quot; : &quot;disabled&quot;),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(requested ? &quot;enabled&q=
uot; : &quot;disabled&quot;));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (fips_enabled ? &quot;enabl=
ed&quot; : &quot;disabled&quot;),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (requested ? &quot;enabled&=
quot; : &quot;disabled&quot;));<br>
&gt; =C2=A0#endif<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c<br>
&gt; index 8bd8bb64eb..9705051690 100644<br>
&gt; --- a/util/qemu-sockets.c<br>
&gt; +++ b/util/qemu-sockets.c<br>
&gt; @@ -270,8 +270,8 @@ static int inet_listen_saddr(InetSocketAddress *sa=
ddr,<br>
&gt; =C2=A0 =C2=A0 =C2=A0/* create socket + bind/listen */<br>
&gt; =C2=A0 =C2=A0 =C2=A0for (e =3D res; e !=3D NULL; e =3D e-&gt;ai_next) =
{<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0getnameinfo((struct sockaddr*)e-&gt;=
ai_addr,e-&gt;ai_addrlen,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0uaddr,INET6_ADDRSTRLEN,uport,32,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0NI_NUMERICHOST | NI_NUMERICSERV);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 uaddr,INET6_ADDRSTRLEN,uport,32,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 NI_NUMERICHOST | NI_NUMERICSERV);<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0port_min =3D inet_getport(e);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0port_max =3D saddr-&gt;has_to ? sadd=
r-&gt;to + port_offset : port_min;<br>
&gt; -- <br>
&gt; 2.19.2<br>
&gt;<br>
&gt;<br>
</p>

--00000000000015e331057cfea21e--
