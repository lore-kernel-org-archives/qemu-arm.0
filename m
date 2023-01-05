Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp8408643ejb;
        Wed, 4 Jan 2023 17:51:55 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtQEjVwrztj7E4szcnOwZ4nxwdTADcLVBqcUH0XpPznci7ENiWoXEbrK/FprPkKJkEKGA/V
X-Received: by 2002:ac8:5393:0:b0:3a9:7e3e:adff with SMTP id x19-20020ac85393000000b003a97e3eadffmr68108007qtp.41.1672883515224;
        Wed, 04 Jan 2023 17:51:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672883515; cv=none;
        d=google.com; s=arc-20160816;
        b=MDW+DqKbhMYaTZE30QXxcMA88NnlAS9JCp24N/AA/Z0d9OWQfclGMMz2fJR2kUJZSY
         lJPUalf71214t79QrrJSWN9HbAh15GbXuc7OXGCrvM79/bTzhGlCeJwE+0ESekLwzAJw
         W/vrOuAynnMEE8tfymk9CGhPaZPSTGaRy9Yao5x8XrKIMW4SQ7CZa6vTk+y/pVELrJ6z
         /jLk5wMwl+s2pRsoQhNUVaEUFvxLrk4osAPahRJSLOcXrzgGfu1Vtg8R4pfYhT+BJpI1
         Tfro18/isu5xLAM+AENYfmTZv1NevATTctzYzzPA4UV8RVZj57jTPPKt8ZF6tNx6b+5b
         peXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=Ae+m06scc8CQpVkRRjrujC7NB/xoSDz1xg6pdBHfsII=;
        b=DqZxoet5jeLNaRMG4IMXA7UpRk9vkAoxfNFyxZeyz9PSpa41eqRuxgLJr+TDK6VMoK
         RM6tJuCW6aFBPXDqXvYZqpEVDf23MW3m2nYrVoKzcVStftnZefRHL0JMCcKV0O4T4hBF
         Jq2Ltcx/aj7UrIA3OtC9+H+0HDQzrrDFAu7zzjf475mskBS0fylejmiRJ5ytqtQSM1tH
         6K2qraf02vvRsZT0b2eFRLyKxdQvCMy1Neu2X0T8Wvc8Nlq4gn0EK9LUPZHSZ7yWZUYo
         Z9PGG1LGzKyg43N3ZVBy2rAYPX++33Hu+TleS2C5D5yKf9dbdOibIlbDo3E9tXXD0tHu
         03EA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PTUH2RTq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k2-20020a378802000000b006eedc0101c9si17094248qkd.142.2023.01.04.17.51.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Jan 2023 17:51:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PTUH2RTq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pDFPL-0005Wj-Ut; Wed, 04 Jan 2023 20:51:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDFPJ-0005Uy-SV
 for qemu-arm@nongnu.org; Wed, 04 Jan 2023 20:51:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDFPH-0007RJ-NL
 for qemu-arm@nongnu.org; Wed, 04 Jan 2023 20:51:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672883459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ae+m06scc8CQpVkRRjrujC7NB/xoSDz1xg6pdBHfsII=;
 b=PTUH2RTqE/1kZVLL3w6cjWFt5Yb3BcMRz+OLQ01/5a1rqaqHqc71kpzz5qG0Zts72tifva
 iEf/1A7xOmNUl30Ukt8QuRfdykvJOaTwpQ9ScRkoDmp/LNi4iuEUi1QpctIRgIs/4FGggI
 aMnw0+Qba9JRNoNBll8X1r91TFhcyBs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-363-UJ2T2FloNwOLMDCsD5RF5g-1; Wed, 04 Jan 2023 20:50:55 -0500
X-MC-Unique: UJ2T2FloNwOLMDCsD5RF5g-1
Received: by mail-ej1-f72.google.com with SMTP id
 qb2-20020a1709077e8200b00842b790008fso22436232ejc.21
 for <qemu-arm@nongnu.org>; Wed, 04 Jan 2023 17:50:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ae+m06scc8CQpVkRRjrujC7NB/xoSDz1xg6pdBHfsII=;
 b=Df4dwDQaJdC3u3PoXL4ZcR9v4s8RCzP4Md7V9hXwFzWHn3hUCOep2i3XPZkDuCBbpw
 qRsXRDiRZQqQ36Y6UcJ2tkJV/9OV4iKen95iG7yhEU/IDpiGFbQ8FkM3rfDLZ7yLgFw9
 dsFmMsaOdvrLEaHK13SQ379qLH06BBj5A2hFgpZ8UApVEZZS1oHl5oRgaTKYYoJqlNDE
 9wmok1Bb6YiKTmrDdhdUGEfCH7Zr11hU7b3QyeyfSjH8luDe3V5xXcJel0Z44L9NYn1q
 0QCERyi8P9xkdfBbRXcpGoUZobkTFqylPtv7/xEDFKQB7cyVnZWbAjBs/zcLz6V4HYPc
 0WHQ==
X-Gm-Message-State: AFqh2kruk48SwWutsV1UjN10KRtfm7bjz6s82dHA4BFid2+gtAb5/Opn
 6wtzohO2LraDPkY2FRycmoLwGhJdV1f2anWc8nuE70XDr+I0YWHqzM2zyQ7IObEVXYykMLHSzwY
 cn2hR0Dr4+kxJ
X-Received: by 2002:a17:907:8b09:b0:7c1:6e82:35fc with SMTP id
 sz9-20020a1709078b0900b007c16e8235fcmr57205445ejc.40.1672883454883; 
 Wed, 04 Jan 2023 17:50:54 -0800 (PST)
X-Received: by 2002:a17:907:8b09:b0:7c1:6e82:35fc with SMTP id
 sz9-20020a1709078b0900b007c16e8235fcmr57205412ejc.40.1672883454600; 
 Wed, 04 Jan 2023 17:50:54 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 g26-20020a170906539a00b0073ae9ba9ba8sm15982484ejo.3.2023.01.04.17.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 17:50:53 -0800 (PST)
Date: Wed, 4 Jan 2023 20:50:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, imammedo@redhat.com, ani@anisinha.ca,
 peter.maydell@linaro.org, laurent@vivier.eu,
 edgar.iglesias@gmail.com, Alistair.Francis@wdc.com,
 bin.meng@windriver.com, palmer@dabbelt.com,
 marcel.apfelbaum@gmail.com, yangxiaojuan@loongson.cn,
 gaosong@loongson.cn, richard.henderson@linaro.org, deller@gmx.de,
 jasowang@redhat.com, vikram.garhwal@amd.com,
 francisco.iglesias@amd.com, clg@kaod.org, kraxel@redhat.com,
 marcandre.lureau@redhat.com, riku.voipio@iki.fi,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 crwulff@gmail.com, marex@denx.de
Subject: Re: [PATCH v2 0/4] Clean up includes
Message-ID: <20230104205022-mutt-send-email-mst@kernel.org>
References: <20221222120813.727830-1-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20221222120813.727830-1-armbru@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 07POMBDndtXu

On Thu, Dec 22, 2022 at 01:08:09PM +0100, Markus Armbruster wrote:
> Back in 2016, we discussed[1] rules for headers, and these were
> generally liked:
> 
> 1. Have a carefully curated header that's included everywhere first.  We
>    got that already thanks to Peter: osdep.h.
> 
> 2. Headers should normally include everything they need beyond osdep.h.
>    If exceptions are needed for some reason, they must be documented in
>    the header.  If all that's needed from a header is typedefs, put
>    those into qemu/typedefs.h instead of including the header.
> 
> 3. Cyclic inclusion is forbidden.
> 
> This series fixes a number of rule violations.


Conflicted with some patches I'm merging so I queued this up too.
Thanks!

> It is based on
> 
>     [PATCH v2 0/4] hw/ppc: Clean up includes
>     [PATCH v2 0/7] include/hw/pci include/hw/cxl: Clean up includes
>     [PATCH v2 0/3] block: Clean up includes
>     [PATCH v3 0/5] coroutine: Clean up includes
> 
> With all of these applied, just three inclusion loops remain reachable
> from include/:
> 
>     target/microblaze/cpu.h target/microblaze/mmu.h
> 
>     target/nios2/cpu.h target/nios2/mmu.h
> 
>     target/riscv/cpu.h target/riscv/pmp.h
> 
> Breaking them would be nice, but I'm out of steam.
> 
> v2:
> * Rebased
> * PATCH 3: v1 posted separately
> * PATCH 4: New
> 
> [1] Message-ID: <87h9g8j57d.fsf@blackfin.pond.sub.org>
>     https://lists.nongnu.org/archive/html/qemu-devel/2016-03/msg03345.html
> 
> Based-on: <20221222104628.659681-1-armbru@redhat.com>
> 
> Markus Armbruster (4):
>   include/hw/virtio: Break inclusion loop
>   include: Include headers where needed
>   include: Don't include qemu/osdep.h
>   docs/devel: Rules on #include in headers
> 
>  docs/devel/style.rst                        | 7 +++++++
>  bsd-user/qemu.h                             | 1 -
>  crypto/block-luks-priv.h                    | 1 -
>  include/exec/plugin-gen.h                   | 1 +
>  include/hw/acpi/erst.h                      | 3 +++
>  include/hw/char/cmsdk-apb-uart.h            | 1 +
>  include/hw/char/goldfish_tty.h              | 1 +
>  include/hw/char/xilinx_uartlite.h           | 1 +
>  include/hw/cris/etraxfs.h                   | 1 +
>  include/hw/cxl/cxl_host.h                   | 1 -
>  include/hw/display/macfb.h                  | 3 ++-
>  include/hw/dma/sifive_pdma.h                | 2 ++
>  include/hw/i386/ioapic_internal.h           | 1 +
>  include/hw/i386/sgx-epc.h                   | 1 +
>  include/hw/input/pl050.h                    | 1 -
>  include/hw/intc/goldfish_pic.h              | 2 ++
>  include/hw/intc/loongarch_pch_msi.h         | 2 ++
>  include/hw/intc/loongarch_pch_pic.h         | 2 ++
>  include/hw/intc/nios2_vic.h                 | 2 ++
>  include/hw/misc/mchp_pfsoc_dmc.h            | 2 ++
>  include/hw/misc/mchp_pfsoc_ioscb.h          | 2 ++
>  include/hw/misc/mchp_pfsoc_sysreg.h         | 2 ++
>  include/hw/misc/pvpanic.h                   | 1 +
>  include/hw/misc/sifive_e_prci.h             | 3 ++-
>  include/hw/misc/sifive_u_otp.h              | 3 ++-
>  include/hw/misc/sifive_u_prci.h             | 3 ++-
>  include/hw/misc/virt_ctrl.h                 | 2 ++
>  include/hw/misc/xlnx-versal-pmc-iou-slcr.h  | 1 +
>  include/hw/net/lasi_82596.h                 | 2 +-
>  include/hw/net/xlnx-zynqmp-can.h            | 1 +
>  include/hw/ppc/pnv_psi.h                    | 2 +-
>  include/hw/riscv/boot_opensbi.h             | 2 ++
>  include/hw/riscv/microchip_pfsoc.h          | 3 +++
>  include/hw/riscv/numa.h                     | 1 +
>  include/hw/riscv/sifive_u.h                 | 2 ++
>  include/hw/riscv/spike.h                    | 2 +-
>  include/hw/riscv/virt.h                     | 2 +-
>  include/hw/ssi/sifive_spi.h                 | 3 +++
>  include/hw/timer/sse-timer.h                | 1 +
>  include/hw/tricore/triboard.h               | 1 -
>  include/hw/usb/hcd-dwc3.h                   | 1 +
>  include/hw/usb/hcd-musb.h                   | 2 ++
>  include/hw/usb/xlnx-usb-subsystem.h         | 2 ++
>  include/hw/usb/xlnx-versal-usb2-ctrl-regs.h | 3 +++
>  include/hw/virtio/virtio-mmio.h             | 2 +-
>  include/hw/virtio/virtio.h                  | 1 -
>  include/qemu/plugin-memory.h                | 3 +++
>  include/qemu/userfaultfd.h                  | 1 -
>  include/sysemu/dirtyrate.h                  | 2 ++
>  include/sysemu/dump.h                       | 1 +
>  include/user/syscall-trace.h                | 1 +
>  net/vmnet_int.h                             | 1 -
>  qga/cutils.h                                | 1 -
>  target/hexagon/hex_arch_types.h             | 1 -
>  target/hexagon/mmvec/macros.h               | 1 -
>  target/riscv/pmu.h                          | 1 -
>  hw/virtio/virtio-qmp.c                      | 1 +
>  hw/virtio/virtio.c                          | 1 +
>  qga/cutils.c                                | 3 ++-
>  59 files changed, 82 insertions(+), 22 deletions(-)
> 
> -- 
> 2.38.1

