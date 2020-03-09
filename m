Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1490613lfc;
        Mon, 9 Mar 2020 12:18:08 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vteLu93fU8jciRYQmDJYhonq5+s+UOamUZRLwUL/sM8iq+O+YinkBqExgmC2cmtTYkbocjZ
X-Received: by 2002:a05:620a:9d5:: with SMTP id y21mr9808005qky.427.1583781488811;
        Mon, 09 Mar 2020 12:18:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583781488; cv=none;
        d=google.com; s=arc-20160816;
        b=bBgbGYmi/bq+G5c9Nfm0lB5ENjf8RCry4yiGKmNnaijGXoDwJMNtL1z1GsggTd1/zg
         oa03g1gO1n3UFTzDL36VzzvOQaRVFbPX2I9SxQ2SjJ1EkmbmLwhLuMpvfL7WYv6ATqAP
         Pdc0uGs7zf2KSvQMpQemw8XYRvRUYe2+1f5nxMGrYJNhQb2UjNaa+H3G0SxaoMfNgkL4
         Q6Rlbl4Rv1kiyYioYcNf/2UD6aJdH5c6ISvHWr+zWg1AompLK+m0twMCd5tkEOIssYH9
         Hubp/ActCa8MEJwu3dZQ55xSvnKK0RBfDXYD7QOHp7GBEtK0tgfNr4/Ra4NjE2DyBWQg
         iH/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=KN5Lztumt4MT507GNyJ7s1Z0S9UNEQ0wlWNZR4FSe4M=;
        b=dusSWQJR2+NDTQ1JMT0SibYb4xDX0rQ6DC9gHqmwuRJ6Cd9UUSGc+J3nfouDQ1HTgw
         NG17fMa3h6Ux/vDtdmFzyAVwqVp2vcIVJTM8CLv/Nm9Uf2XwihhqSCBNekmmpDOT3wiu
         N4VxGMCq+m3g2E1vi26T69ZeWTIED1de61hhMFTrAj6fLunS4bxHlOJGHOQ1KBOSFegO
         Fgo81ZxcqfIfq2qIYytqtTAsY3l8A7g4fxx3fWQ1e7CC5jR2DM5m1V416BnbzBFBlL/g
         6Ki/ObkcGWggyHtjNwGJ50pZQYU3jGQjUnmQBJxpJRPFTG0j57kvlz/KDIhF+VqH2kaz
         7i2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RD0HioCP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c18si1357018qko.51.2020.03.09.12.18.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Mar 2020 12:18:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RD0HioCP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBNui-0003jD-6X
	for alex.bennee@linaro.org; Mon, 09 Mar 2020 15:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48924)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1jBNuZ-0003iw-F3
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 15:18:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1jBNuX-00063q-Rf
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 15:17:59 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46101
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1jBNuX-000630-CJ
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 15:17:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583781476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KN5Lztumt4MT507GNyJ7s1Z0S9UNEQ0wlWNZR4FSe4M=;
 b=RD0HioCPrv/LmtuaqSSqGTI9TVdpWs5TIsaa55d7+I7hby8lBW1LFvOLMBvKVQWIcgvE9x
 hR4rGEUXC6sxSHdsgV+pzLMaVPzLql3FHzdJPAn9ZLrtb7U1bJTXeTcCXMewj0eUiwG1yo
 bQkGr+4PhlNNttWziIwBgsD4Knujl2A=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-b1CSqtgIMdiuQFzYsGmaYg-1; Mon, 09 Mar 2020 15:17:54 -0400
X-MC-Unique: b1CSqtgIMdiuQFzYsGmaYg-1
Received: by mail-qv1-f70.google.com with SMTP id v2so7204113qvi.6
 for <qemu-arm@nongnu.org>; Mon, 09 Mar 2020 12:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=duaZiTgTxNvQrcdo/ncFZBotrmtLMlOJLCKEjcPeZ+k=;
 b=uUJOzqevcN4KP2eoPxUex07tG/ny73od7B4QLPpOKyr2mZblMpxlxmlBCcYpERX042
 nindhd04u1ImJzcd07Qw0qO7ESA5+YBUnSxZMkHFzkGAhXMXb6wmSUHkhL3eOiETWvMF
 6yu6dutepXpPTtBLyQe7fqGGuIHhUSl5PE42JhvZ/WGlT0JG6Rl0UVfqPypC7GPVOpUO
 qsZ6pUDDD0+Gznrf87n6I9ojzp0tn03Q6ZR4iiz+ieYcfKXyTSSEoAfSZEIEgGWwdYLt
 f0O3UH5cAyJ1MfxWvgf3vHpUofydXEFrr7kQW7iQULniAI3NOghd2G1LKsjnGswkCZ9f
 8tJA==
X-Gm-Message-State: ANhLgQ0siuiQtzsWpqtFgRaOxmLri5GhOV+S8TKz9Dg2gdPMM0p1lCiL
 jc8NodWKmZBEz5PNjSLAqwL6DtqrJnFOUF/6V3DzETFDclB2DlbMWhfa40Ri4vqYiiSeftdJf3V
 hhqyCPrg+n0Yq
X-Received: by 2002:a0c:8402:: with SMTP id l2mr15434787qva.227.1583781474267; 
 Mon, 09 Mar 2020 12:17:54 -0700 (PDT)
X-Received: by 2002:a0c:8402:: with SMTP id l2mr15434739qva.227.1583781473955; 
 Mon, 09 Mar 2020 12:17:53 -0700 (PDT)
Received: from redhat.com (bzq-79-178-2-19.red.bezeqint.net. [79.178.2.19])
 by smtp.gmail.com with ESMTPSA id r46sm6835526qtb.87.2020.03.09.12.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2020 12:17:53 -0700 (PDT)
Date: Mon, 9 Mar 2020 15:17:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PULL 00/33] Trivial branch patches
Message-ID: <20200309151621-mutt-send-email-mst@kernel.org>
References: <20200309150837.3193387-1-laurent@vivier.eu>
MIME-Version: 1.0
In-Reply-To: <20200309150837.3193387-1-laurent@vivier.eu>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Helge Deller <deller@gmx.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Alistair Francis <alistair@alistair23.me>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AtPiyoKBdD/k

On Mon, Mar 09, 2020 at 04:08:04PM +0100, Laurent Vivier wrote:
> The following changes since commit 7a5853cec479a448edae0fb2aaf4e2f78c9c77=
4d:
>=20
>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into stagi=
ng (2020-03-09 10:32:53 +0000)
>=20
> are available in the Git repository at:
>=20
>   git://github.com/vivier/qemu.git tags/trivial-branch-pull-request
>=20
> for you to fetch changes up to 916c92503bd5348a33e561db600d8894bde636bb:
>=20
>   monitor/hmp-cmds: Remove redundant statement in hmp_rocker_of_dpa_group=
s() (2020-03-09 15:59:31 +0100)


Could you avoid CC everyone involved on the whole PULL req?
I was involved in a patch or two and don't really need to see
the whole series. Just the cover and the relevant patches
would be enough - if I do want it there's always lore.


> ----------------------------------------------------------------
> - includes cleanup
> - reduce .data footprint
> - fix warnings reported by Clang static code analyzer
> - fix dp8393x part lost in merge
> - update git.orderfile and rules.mak
>=20
> ----------------------------------------------------------------
>=20
> Chen Qun (7):
>   block/stream: Remove redundant statement in stream_run()
>   block/file-posix: Remove redundant statement in raw_handle_perm_lock()
>   dma/xlnx-zdma: Remove redundant statement in zdma_write_dst()
>   scsi/scsi-disk: Remove redundant statement in
>     scsi_disk_emulate_command()
>   display/pxa2xx_lcd: Remove redundant statement in
>     pxa2xx_palette_parse()
>   display/exynos4210_fimd: Remove redundant statement in
>     exynos4210_fimd_update()
>   monitor/hmp-cmds: Remove redundant statement in
>     hmp_rocker_of_dpa_groups()
>=20
> Eric Blake (1):
>   maint: Include top-level *.rst files early in git diff
>=20
> Finn Thain (1):
>   dp8393x: Mask EOL bit from descriptor addresses, take 2
>=20
> Pan Nengyuan (1):
>   core/qdev: fix memleak in qdev_get_gpio_out_connector()
>=20
> Philippe Mathieu-Daud=E9 (23):
>   build-sys: Move the print-variable rule to rules.mak
>   hw/audio/fmopl: Fix a typo twice
>   hw/net/e1000: Add readops/writeops typedefs
>   hw/net/e1000: Move macreg[] arrays to .rodata to save 1MiB of .data
>   virtfs-proxy-helper: Make the helper_opts[] array const
>   vl: Add missing "hw/boards.h" include
>   hw/southbridge/ich9: Removed unused headers
>   hw/i386/ioapic_internal: Remove unused "hw/i386/ioapic.h" header
>   hw/timer: Remove unused "ui/console.h" header
>   hw/usb/dev-storage: Remove unused "ui/console.h" header
>   hw/i386/intel_iommu: Remove unused includes
>   hw/alpha/alpha_sys: Remove unused "hw/ide.h" header
>   hw/alpha/dp264: Include "net/net.h"
>   hw/hppa/machine: Include "net/net.h"
>   hw/acpi/cpu_hotplug: Include "hw/pci/pci.h"
>   hw/timer/hpet: Include "exec/address-spaces.h"
>   hw/pci-host/q35: Include "qemu/range.h"
>   hw/i2c/smbus_ich9: Include "qemu/range.h"
>   hw/pci-host/piix: Include "qemu/range.h"
>   hw/acpi: Include "hw/mem/nvdimm.h"
>   hw/i386: Include "hw/mem/nvdimm.h"
>   hw/pci-host/q35: Remove unused includes
>   hw/i386/pc: Clean up includes
>=20
>  Makefile                          |  3 ---
>  block/file-posix.c                |  1 -
>  block/stream.c                    |  3 +--
>  fsdev/virtfs-proxy-helper.c       |  2 +-
>  hw/acpi/cpu_hotplug.c             |  1 +
>  hw/acpi/ich9.c                    |  2 +-
>  hw/acpi/piix4.c                   |  1 +
>  hw/alpha/alpha_sys.h              |  1 -
>  hw/alpha/dp264.c                  |  1 +
>  hw/audio/fmopl.c                  |  4 ++--
>  hw/core/qdev.c                    |  2 +-
>  hw/display/exynos4210_fimd.c      |  1 -
>  hw/display/pxa2xx_lcd.c           |  1 -
>  hw/dma/xlnx-zdma.c                | 10 +++++-----
>  hw/hppa/machine.c                 |  1 +
>  hw/i2c/smbus_ich9.c               |  1 +
>  hw/i386/acpi-build.c              |  1 +
>  hw/i386/pc.c                      |  1 +
>  hw/i386/pc_piix.c                 |  1 +
>  hw/i386/pc_q35.c                  |  1 +
>  hw/isa/lpc_ich9.c                 |  1 -
>  hw/net/dp8393x.c                  |  4 ++--
>  hw/net/e1000.c                    |  6 ++++--
>  hw/net/e1000e_core.c              |  6 ++++--
>  hw/pci-host/i440fx.c              |  1 +
>  hw/pci-host/q35.c                 |  1 +
>  hw/rtc/twl92230.c                 |  1 -
>  hw/scsi/scsi-disk.c               |  1 -
>  hw/timer/hpet.c                   |  2 +-
>  hw/usb/dev-storage.c              |  1 -
>  include/hw/i386/ich9.h            |  1 -
>  include/hw/i386/intel_iommu.h     |  4 ----
>  include/hw/i386/ioapic_internal.h |  1 -
>  include/hw/i386/pc.h              | 11 +++--------
>  include/hw/pci-host/q35.h         |  8 +-------
>  monitor/hmp-cmds.c                |  5 +----
>  rules.mak                         |  3 +++
>  scripts/git.orderfile             |  1 +
>  softmmu/vl.c                      |  1 +
>  39 files changed, 43 insertions(+), 55 deletions(-)
>=20
> --=20
> 2.24.1

