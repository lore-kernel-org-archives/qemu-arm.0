Received: by 2002:a17:505:790d:b0:1cc9:4ad0:aa2 with SMTP id xu13csp1280671njc;
        Mon, 9 Jun 2025 02:08:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUEhXLQuMPfoC5c+I9rXXJXGbau0Px268iz6Xi1X7mo/e3MH8BgNt2G1CmKCE5eMNwZk5NqxEbfoH6/lg==@linaro.org
X-Google-Smtp-Source: AGHT+IGw3yzAaow3qUwi2ABWL45lXSwArqv9KTTI9SwVnpMnyIjkgcQZhZsdwLNBeTm3xoFMJQnz
X-Received: by 2002:a05:620a:278e:b0:7cf:431:29c3 with SMTP id af79cd13be357-7d38726e217mr1124985685a.26.1749460089507;
        Mon, 09 Jun 2025 02:08:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749460089; cv=none;
        d=google.com; s=arc-20240605;
        b=MWXKb/8eFnNHwzTy2UaxrcHdCqo7w1NAndttT/1l4nIlrnBTpHgOQAy3PpF9meLMz1
         k2UlU8/1A9YODq7rPmD9vNP6art/1WRUG1Rm9DLRFotgeoHtNpo/eD4zoab1Q5MrJsCI
         TX6sQ6wPhVgPd7dGtevZUAV5z/LAVsjiVo9EMox7uWbKRSbYQvGktFl4tUD1hSkY9LTn
         gyJ8P406SI4M83m5QvEfQKVwpF+4fJZPR6N4QaJPmeQ2WKeHE1Se/RLBuF7MWao6N7IN
         z9b0pfjmmFz0+Mb0i5A/74AfmaqEjgXkUqbw3cw8OBPAitYa37JIIMNblP/M8Vn8wtpo
         FQkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=thpea/1JNZH7PBugbUbosQMVELieY5KDrCh67UmZqlI=;
        fh=uDuX0opI29gY01biAB6EoFS/sR6pK9gUBoiiFXepHeU=;
        b=kUKmGn+dXMAwdw0UXHeY1HxlP299nPJhW0m+UZ9Kr4YO1NtFlRjeDFH8ZF9rzyX8a7
         O39QPq732ArHJl9AHdNasvO5Q08NBDqOa8qwbVckR1qeUr64xY/UGXNrdeL6ZLxBX7KZ
         MaRt2YVxWxALE2CBMEHrDPe0mPhAhx1G5+gamWoZUqo8mBmfuajO9uOXKcwhWz4eUMBs
         tYprPieWrdyqaeosrX0gCnBb9cZnxDluW3RbcoUqj62VexrnQgsTYzy4mVFvOzuTzjd2
         p6Y7PwPIwA+hnKiU4JYVZy2+L58tUhj1t3Q+uxP+k8woDsVuzUkUjhJoJRLjPxA5BkSz
         2Nng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Cq/l9QpG";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d24b3cbc2esi764677185a.108.2025.06.09.02.08.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jun 2025 02:08:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Cq/l9QpG";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uOYTd-000574-BA; Mon, 09 Jun 2025 05:07:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1uOYTY-00056c-A1
 for qemu-arm@nongnu.org; Mon, 09 Jun 2025 05:07:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1uOYTU-00087y-Kl
 for qemu-arm@nongnu.org; Mon, 09 Jun 2025 05:07:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749460042;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=thpea/1JNZH7PBugbUbosQMVELieY5KDrCh67UmZqlI=;
 b=Cq/l9QpGkXLOuusLLrbXcDdOdcQ9N3NL4AhqZ0TMp5sRz4Haw8yzMEcg8B6l4mqzJmXClD
 T6VdTWzrdZZYfesvg2bEgBMaSvNzxLIogdTMpP+2Hny3c8rChY5+85vif7P0yeRMAvQdco
 VAX3VZ2BUctDnMD9c99ArejLxQJ2KKI=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-279-yC8uf6jbPAO34lI0mQeriw-1; Mon,
 09 Jun 2025 05:07:20 -0400
X-MC-Unique: yC8uf6jbPAO34lI0mQeriw-1
X-Mimecast-MFC-AGG-ID: yC8uf6jbPAO34lI0mQeriw_1749460039
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id EF70119560BE; Mon,  9 Jun 2025 09:07:18 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.45])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1D92218003FC; Mon,  9 Jun 2025 09:07:14 +0000 (UTC)
Date: Mon, 9 Jun 2025 10:07:11 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Shaoqin Huang <shahuang@redhat.com>
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Auger <eauger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 1/2] ramfb: Add property to control if load the romfile
Message-ID: <aEakP3rDTyBqDXA5@redhat.com>
References: <20250609073408.2083831-1-shahuang@redhat.com>
 <20250609073408.2083831-2-shahuang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250609073408.2083831-2-shahuang@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6foDrikDioVm

On Mon, Jun 09, 2025 at 03:34:07AM -0400, Shaoqin Huang wrote:
> Now the ramfb will load the vgabios-ramfb.bin unconditionally, but only
> the x86 need the vgabios-ramfb.bin, this can cause that when use the
> release package on arm64 it can't find the vgabios-ramfb.bin.
> 
> Because only seabios will use the vgabios-ramfb.bin, load the rom logic
> is x86-specific. For other !x86 platforms, the edk2 ships an EFI driver
> for ramfb, so they don't need to load the romfile.

vgabios-ramfb.bin is just one of many VGA BIOS ROMs in QEMU

$ git grep vgabios hw/
../hw/display/ati.c:    k->romfile = "vgabios-ati.bin";
../hw/display/bochs-display.c:    k->romfile   = "vgabios-bochs-display.bin";
../hw/display/qxl.c:    k->romfile = "vgabios-qxl.bin";
../hw/display/ramfb.c:    rom_add_vga("vgabios-ramfb.bin");
../hw/display/vga-pci.c:    k->romfile = "vgabios-stdvga.bin";
../hw/display/vga_int.h:#define VGABIOS_FILENAME "vgabios.bin"
../hw/display/vga_int.h:#define VGABIOS_CIRRUS_FILENAME "vgabios-cirrus.bin"
../hw/display/virtio-vga.c:    pcidev_k->romfile = "vgabios-virtio.bin";
../hw/display/vmware_vga.c:    k->romfile = "vgabios-vmware.bin";
../hw/ppc/amigaone.c: * BIOS emulator in firmware cannot run QEMU vgabios and hangs on it, use
../hw/ppc/amigaone.c: * from http://www.nongnu.org/vgabios/ instead.
../hw/xen/xen_pt_graphics.c:static void *get_vgabios(XenPCIPassthroughState *s, int *size,
../hw/xen/xen_pt_graphics.c:    bios = get_vgabios(s, &bios_size, dev);


At least some of these devices are built into non-x86 system
emulators, and would show the same behaviour if the ROM is not
installed

$ qemu-system-aarch64  -machine virt -cpu max -device ati-vga
qemu-system-aarch64: -device ati-vga: failed to find romfile "vgabios-ati.bin"
$ qemu-system-aarch64  -machine virt -cpu max -device cirrus-vga
qemu-system-aarch64: -device cirrus-vga: failed to find romfile "vgabios-cirrus.bin"
$ qemu-system-aarch64  -machine virt -cpu max -device VGA
qemu-system-aarch64: -device VGA: failed to find romfile "vgabios-stdvga.bin"

Perhaps some of these devices are non-functional for other
reasons ?

None the less if the device is built for non-x86 targets, and
the ROM files contain x86-only code that is to be executed by
SeaBIOS only, then conceptually this fix should apply to all
devices use a VGA BIOS ROM, not just ramfb.

If we're introducing a property to control this usage, then
we should fix all devices at once, so we don't need to add
separate properties for other devices in future.

> 
> So add a new property use_legacy_x86_rom in both ramfb and vfio_pci
> device, because the vfio display also use the ramfb_setup() to load
> the vgabios-ramfb.bin file.
> 
> After have this property, the machine type can set the compatibility to
> not load the vgabios-ramfb.bin if the arch doesn't need it.
> 
> Signed-off-by: Shaoqin Huang <shahuang@redhat.com>
> ---
>  hw/display/ramfb-standalone.c | 4 +++-
>  hw/display/ramfb-stubs.c      | 2 +-
>  hw/display/ramfb.c            | 6 ++++--
>  hw/vfio/display.c             | 4 ++--
>  hw/vfio/pci.c                 | 1 +
>  hw/vfio/pci.h                 | 1 +
>  include/hw/display/ramfb.h    | 2 +-
>  7 files changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/display/ramfb-standalone.c b/hw/display/ramfb-standalone.c
> index 1be106b57f..af1175bf96 100644
> --- a/hw/display/ramfb-standalone.c
> +++ b/hw/display/ramfb-standalone.c
> @@ -17,6 +17,7 @@ struct RAMFBStandaloneState {
>      QemuConsole *con;
>      RAMFBState *state;
>      bool migrate;
> +    bool use_legacy_x86_rom;
>  };
>  
>  static void display_update_wrapper(void *dev)
> @@ -39,7 +40,7 @@ static void ramfb_realizefn(DeviceState *dev, Error **errp)
>      RAMFBStandaloneState *ramfb = RAMFB(dev);
>  
>      ramfb->con = graphic_console_init(dev, 0, &wrapper_ops, dev);
> -    ramfb->state = ramfb_setup(errp);
> +    ramfb->state = ramfb_setup(ramfb->use_legacy_x86_rom, errp);
>  }
>  
>  static bool migrate_needed(void *opaque)
> @@ -62,6 +63,7 @@ static const VMStateDescription ramfb_dev_vmstate = {
>  
>  static const Property ramfb_properties[] = {
>      DEFINE_PROP_BOOL("x-migrate", RAMFBStandaloneState, migrate,  true),
> +    DEFINE_PROP_BOOL("use-legacy-x86-rom", RAMFBStandaloneState, use_legacy_x86_rom, true),

There are lots of ROMs, so this property name should include
some reference to vgabios, perhaps

  'use-legacy-vgabios-rom'


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

