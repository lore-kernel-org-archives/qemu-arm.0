Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2242758lfo;
        Mon, 14 Mar 2022 09:01:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLCfUiylkDh8oUL+8qE1LlyZEatNqXu7NZfxu4FFSn19GBPdw1DHUSUMv5R+JgCpnkZUTc
X-Received: by 2002:a17:906:c107:b0:6da:bd9c:4779 with SMTP id do7-20020a170906c10700b006dabd9c4779mr19118545ejc.715.1647273678246;
        Mon, 14 Mar 2022 09:01:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647273678; cv=none;
        d=google.com; s=arc-20160816;
        b=FpMp/UNif4Wp84I6katBHf7o9azaDeyZmq219Kg/ud3E1fGJIrRBSWQK5uSN2ttVYh
         QgHQxO7o4miaQjXBZutF10RXKl8S98D3eq/qopsPXzCof+77F1tyywMjhm3rSSouQVQn
         XITPFga+ilMYpeRGPni8W7oKYdWB4DOZSdlwPun+Zj8le94Al0a3WMDOieARPtAWhojy
         BWOXC2fBva0LPsRQBpZaARmswsatsxS6g/tRxlRscnrRfmx57PlutESJYCqikqdPbmTM
         7wdMerJj+gi/9O1/T/tQl4/X0JyCFnpJgDMGtGpvjWS1t+VKbuIbdIgXmL+6ecqb8znC
         XVuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:mime-version
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=LjuojNlljLxHI2R7532V3Nrcf8uo+00tFTpTU3tAPp8=;
        b=G6BRsSf9+C5QKJI1AOqYF37YH0lH5hKZEW5vPk6KY4AKIv8OQavjM5wJ2IVdoahpj3
         mp0oy9uw6ObbDFB4yQ+a2bfhgzHJtERqbSVwvFfS01JzwyLBkBJ1SNDB5g2PIxIYnTqZ
         OKh2OmOCBrP9aV2Nun4UG5yH22lH51v4XhQ0o2F8LLT4mgdl51dBxIRTW+5PwJr4xStX
         ARO9FZwk6njGT53DxJbpYmdnYnWuGVZiTBePHE6ZSJQG+GmHqHMLdLTAjJbY0WJmx+5J
         xpxu8Qm6ZzbKrrgEjy6/vpaXkJgKbD+cU4mBtpTec6nIrFdvUgBMZo+uthjPDFuIiRY0
         Y5OA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EySBaXJY;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id g13-20020aa7c84d000000b0041677b1a65csi11667191edt.111.2022.03.14.09.01.18;
        Mon, 14 Mar 2022 09:01:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EySBaXJY;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242874AbiCNQC0 (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 3 others); Mon, 14 Mar 2022 12:02:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233379AbiCNQCZ (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 14 Mar 2022 12:02:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CD610443F9
        for <kvm@vger.kernel.org>; Mon, 14 Mar 2022 09:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647273673;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=LjuojNlljLxHI2R7532V3Nrcf8uo+00tFTpTU3tAPp8=;
        b=EySBaXJYUTIwghSdtVvMMRZaWPvvm7tZbnEUPdx8gDfgFijfY7J3aiLp5jpnEBeFOzS8fX
        oGQfYMFeB3IlOiB0ioQcP0vLdFY//3yJ4jSerL1OSJ1gpvPQm3uQfCmWlNbnHp9nlHrpgf
        y3LVG/4Ims6eaeNA9QVkvUvlpDnSmF8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-WQIF-gJyOOyssUbaRbBu2Q-1; Mon, 14 Mar 2022 12:01:10 -0400
X-MC-Unique: WQIF-gJyOOyssUbaRbBu2Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63C4F805F49;
        Mon, 14 Mar 2022 16:01:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id C8FD1C44AE5;
        Mon, 14 Mar 2022 16:01:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
        id A1CFC21E66D4; Mon, 14 Mar 2022 17:01:08 +0100 (CET)
From:   Markus Armbruster <armbru@redhat.com>
To:     qemu-devel@nongnu.org
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Christian Schoenebeck <qemu_oss@crudebyte.com>,
        "Gonglei (Arei)" <arei.gonglei@huawei.com>,
        =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Ani Sinha <ani@anisinha.ca>,
        Laurent Vivier <lvivier@redhat.com>,
        Amit Shah <amit@kernel.org>,
        Peter Maydell <peter.maydell@linaro.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony Perard <anthony.perard@citrix.com>,
        Paul Durrant <paul@xen.org>,
        =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
        Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
        Corey Minyard <cminyard@mvista.com>,
        Patrick Venture <venture@google.com>,
        Eduardo Habkost <eduardo@habkost.net>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
        =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
        Daniel Henrique Barboza <danielhb413@gmail.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        Greg Kurz <groug@kaod.org>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        Jean-Christophe Dubois <jcd@tribudubois.net>,
        Keith Busch <kbusch@kernel.org>,
        Klaus Jensen <its@irrelevant.dk>,
        Yuval Shaia <yuval.shaia.ml@gmail.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabien Chouteau <chouteau@adacore.com>,
        KONRAD Frederic <frederic.konrad@adacore.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Eric Auger <eric.auger@redhat.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Juan Quintela <quintela@redhat.com>,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        Konstantin Kostiuk <kkostiuk@redhat.com>,
        Michael Roth <michael.roth@amd.com>,
        =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
        Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        David Hildenbrand <david@redhat.com>,
        Wenchao Wang <wenchao.wang@intel.com>,
        Colin Xu <colin.xu@intel.com>,
        Kamil Rytarowski <kamil@netbsd.org>,
        Reinoud Zandijk <reinoud@netbsd.org>,
        Sunil Muthuswamy <sunilmut@microsoft.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Thomas Huth <thuth@redhat.com>, Eric Blake <eblake@redhat.com>,
        Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
        John Snow <jsnow@redhat.com>, kvm@vger.kernel.org,
        qemu-arm@nongnu.org, xen-devel@lists.xenproject.org,
        qemu-ppc@nongnu.org, qemu-block@nongnu.org, haxm-team@intel.com,
        qemu-s390x@nongnu.org
Subject: [PATCH 0/3] Use g_new() & friends where that makes obvious
Date:   Mon, 14 Mar 2022 17:01:05 +0100
Message-Id: <20220314160108.1440470-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: LnIDTXvzQakx

g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
for two reasons.  One, it catches multiplication overflowing size_t.
Two, it returns T * rather than void *, which lets the compiler catch
more type errors.

This series only touches allocations with size arguments of the form
sizeof(T).  It's mechanical, except for a tiny fix in PATCH 2.

PATCH 1 adds the Coccinelle script.

PATCH 2 cleans up the virtio-9p subsystem, and fixes a harmless typing
error uncovered by the cleanup.

PATCH 3 cleans up everything else.  I started to split it up, but
splitting is a lot of decisions, and I just can't see the value.

For instance, MAINTAINERS tells me to split for subsystem "virtio",
patching

    hw/char/virtio-serial-bus.c
    hw/display/virtio-gpu.c
    hw/net/virtio-net.c
    hw/virtio/virtio-crypto.c
    hw/virtio/virtio-iommu.c
    hw/virtio/virtio.c

But it also tells me to split for subsystem "Character devices",
patching

    hw/char/parallel.c                       |  2 +-
    hw/char/riscv_htif.c                     |  2 +-
    hw/char/virtio-serial-bus.c              |  6 +-

and for subsystem "Network devices", patching

    hw/net/virtio-net.c

and for subsystem "virtio-gpu", patching

    hw/display/virtio-gpu.c

I guess I'd go with "virtio".  Six files down, 103 to go.  Thanks, but
no thanks.

Since the transformation is local to a function call, dropping is
completely safe.  We can deal with conflicts by dropping conflicting
hunks, with "git-pull -s recursive -X ours".  Or drop entire files
with conflicts.

If you want me to split off certain parts, please tell me exactly what
you want split off, and I'll gladly do the splitting.  I don't mind
the splitting part, I do mind the *thinking* part.

Markus Armbruster (3):
  scripts/coccinelle: New use-g_new-etc.cocci
  9pfs: Use g_new() & friends where that makes obvious sense
  Use g_new() & friends where that makes obvious sense

 scripts/coccinelle/use-g_new-etc.cocci   | 75 ++++++++++++++++++++++++
 include/qemu/timer.h                     |  2 +-
 accel/kvm/kvm-all.c                      |  6 +-
 accel/tcg/tcg-accel-ops-mttcg.c          |  2 +-
 accel/tcg/tcg-accel-ops-rr.c             |  4 +-
 audio/audio.c                            |  4 +-
 audio/audio_legacy.c                     |  6 +-
 audio/dsoundaudio.c                      |  2 +-
 audio/jackaudio.c                        |  6 +-
 audio/paaudio.c                          |  4 +-
 backends/cryptodev.c                     |  2 +-
 contrib/vhost-user-gpu/vhost-user-gpu.c  |  2 +-
 cpus-common.c                            |  4 +-
 dump/dump.c                              |  2 +-
 hw/9pfs/9p-proxy.c                       |  2 +-
 hw/9pfs/9p-synth.c                       |  4 +-
 hw/9pfs/9p.c                             |  8 +--
 hw/9pfs/codir.c                          |  6 +-
 hw/acpi/hmat.c                           |  2 +-
 hw/audio/intel-hda.c                     |  2 +-
 hw/char/parallel.c                       |  2 +-
 hw/char/riscv_htif.c                     |  2 +-
 hw/char/virtio-serial-bus.c              |  6 +-
 hw/core/irq.c                            |  2 +-
 hw/core/reset.c                          |  2 +-
 hw/display/pxa2xx_lcd.c                  |  2 +-
 hw/display/tc6393xb.c                    |  2 +-
 hw/display/virtio-gpu.c                  |  4 +-
 hw/display/xenfb.c                       |  4 +-
 hw/dma/rc4030.c                          |  4 +-
 hw/i2c/core.c                            |  4 +-
 hw/i2c/i2c_mux_pca954x.c                 |  2 +-
 hw/i386/amd_iommu.c                      |  4 +-
 hw/i386/intel_iommu.c                    |  2 +-
 hw/i386/xen/xen-hvm.c                    | 10 ++--
 hw/i386/xen/xen-mapcache.c               | 14 ++---
 hw/input/lasips2.c                       |  2 +-
 hw/input/pckbd.c                         |  2 +-
 hw/input/ps2.c                           |  4 +-
 hw/input/pxa2xx_keypad.c                 |  2 +-
 hw/input/tsc2005.c                       |  3 +-
 hw/intc/riscv_aclint.c                   |  6 +-
 hw/intc/xics.c                           |  2 +-
 hw/m68k/virt.c                           |  2 +-
 hw/mips/mipssim.c                        |  2 +-
 hw/misc/applesmc.c                       |  2 +-
 hw/misc/imx6_src.c                       |  2 +-
 hw/misc/ivshmem.c                        |  4 +-
 hw/net/virtio-net.c                      |  4 +-
 hw/nvme/ns.c                             |  2 +-
 hw/pci-host/pnv_phb3.c                   |  2 +-
 hw/pci-host/pnv_phb4.c                   |  2 +-
 hw/pci/pcie_sriov.c                      |  2 +-
 hw/ppc/e500.c                            |  2 +-
 hw/ppc/ppc.c                             |  8 +--
 hw/ppc/ppc405_boards.c                   |  4 +-
 hw/ppc/ppc405_uc.c                       | 18 +++---
 hw/ppc/ppc4xx_devs.c                     |  2 +-
 hw/ppc/ppc_booke.c                       |  4 +-
 hw/ppc/spapr.c                           |  2 +-
 hw/ppc/spapr_events.c                    |  2 +-
 hw/ppc/spapr_hcall.c                     |  2 +-
 hw/ppc/spapr_numa.c                      |  3 +-
 hw/rdma/vmw/pvrdma_dev_ring.c            |  2 +-
 hw/rdma/vmw/pvrdma_qp_ops.c              |  6 +-
 hw/sh4/r2d.c                             |  4 +-
 hw/sh4/sh7750.c                          |  2 +-
 hw/sparc/leon3.c                         |  2 +-
 hw/sparc64/sparc64.c                     |  4 +-
 hw/timer/arm_timer.c                     |  2 +-
 hw/timer/slavio_timer.c                  |  2 +-
 hw/vfio/pci.c                            |  4 +-
 hw/vfio/platform.c                       |  4 +-
 hw/virtio/virtio-crypto.c                |  2 +-
 hw/virtio/virtio-iommu.c                 |  2 +-
 hw/virtio/virtio.c                       |  5 +-
 hw/xtensa/xtfpga.c                       |  2 +-
 linux-user/syscall.c                     |  2 +-
 migration/dirtyrate.c                    |  4 +-
 migration/multifd-zlib.c                 |  4 +-
 migration/ram.c                          |  2 +-
 monitor/misc.c                           |  2 +-
 monitor/qmp-cmds.c                       |  2 +-
 qga/commands-win32.c                     |  8 +--
 qga/commands.c                           |  2 +-
 qom/qom-qmp-cmds.c                       |  2 +-
 replay/replay-char.c                     |  4 +-
 replay/replay-events.c                   | 10 ++--
 scripts/coverity-scan/model.c            |  2 +-
 semihosting/config.c                     |  2 +-
 softmmu/bootdevice.c                     |  4 +-
 softmmu/dma-helpers.c                    |  4 +-
 softmmu/memory_mapping.c                 |  2 +-
 target/i386/cpu-sysemu.c                 |  2 +-
 target/i386/hax/hax-accel-ops.c          |  4 +-
 target/i386/nvmm/nvmm-accel-ops.c        |  4 +-
 target/i386/whpx/whpx-accel-ops.c        |  4 +-
 target/i386/whpx/whpx-all.c              |  2 +-
 target/s390x/cpu-sysemu.c                |  2 +-
 tests/qtest/virtio-9p-test.c             |  4 +-
 tests/unit/test-hbitmap.c                |  2 +-
 tests/unit/test-qmp-cmds.c               | 14 ++---
 tests/unit/test-qobject-output-visitor.c |  2 +-
 tests/unit/test-vmstate.c                | 42 ++++++-------
 ui/vnc-enc-tight.c                       |  2 +-
 util/envlist.c                           |  2 +-
 util/hbitmap.c                           |  2 +-
 util/main-loop.c                         |  2 +-
 util/qemu-timer.c                        |  2 +-
 util/vfio-helpers.c                      |  4 +-
 110 files changed, 284 insertions(+), 214 deletions(-)
 create mode 100644 scripts/coccinelle/use-g_new-etc.cocci

--
2.35.1
