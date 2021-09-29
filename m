Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp487595lfp;
        Wed, 29 Sep 2021 08:10:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+zRpHPH8sRQII4wvKPpVskuFuDs2pUXVct2KDCD3h19p3RK60BNJ/fBgaLKzsXn8/3Oxy
X-Received: by 2002:a1c:a942:: with SMTP id s63mr10866906wme.45.1632928258981;
        Wed, 29 Sep 2021 08:10:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632928258; cv=none;
        d=google.com; s=arc-20160816;
        b=TZAMClHiNkOC0+zB//E/F3hdiPp0bDD6sxhgtuXEWzvQ7Ah0I1TybkZnY34xuDfVbu
         h6+Kab5vhwbMqHak2oHkXX4gZ9PSRvWkhOE0O2dKtBueOFp7AHcj+H4KqZo70VONPccu
         /sJe5y1b4G1n5p/ivmk63bYTRqfezV4wrMPlbTHh8VxzXp0HDy9DDhCn0KA/BOaX80hU
         z1ZFRXMoDxQsgpsLNh1ecPh8UeXbxy3OOkR7CbHttZv0iYVxbqeOkn6wkoWJ/FeLSVa3
         R5LAMUUbEPSLf2Qk2bbM9yCVL+heZVCHSP+3gIKtvq93lR+8t2pKO/w0yraH3R836/3x
         wY9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PUxk40rTx2Sh7ewbJxJOxBp3inOkrnkI194r4WuDcB0=;
        b=l1XmiJDI7y+sL19dEJiUVd10akBJN9GLj742nJ7B+pL/Xwyj9RofN4j+HAh8R7JXz4
         urYN3jX2CEs1pjKvKjWap6aZJm2y5CV8Fx0kra1i4hKpyaa23EwccQxyMdooZnLyKuW7
         bZXeE6FZbOIhdRkY6i3L9KHmxKmMNIh4Zhv7eaqNvBia7CU1RGX5qLyE5LmEtehs0Qvh
         PT78BZ4dctP1LArRjqLsjlzHDWLz1S+B4XckBLcdhmqRNYplKHWvDm+xD4HxW4TwfnK8
         XmFecxN76Vz2IPWaxfn8g4jWlbCi7RGjClz48WkMvJYCbmhhACx+2UHW8W+tWHWkHZjA
         roWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@chromium.org header.s=google header.b="LECGC/vl";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=chromium.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f1si15365wrm.572.2021.09.29.08.10.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Sep 2021 08:10:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@chromium.org header.s=google header.b="LECGC/vl";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=chromium.org
Received: from localhost ([::1]:57622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVbEY-0003nj-0r
	for alex.bennee@linaro.org; Wed, 29 Sep 2021 11:10:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mVbDq-0003nJ-UV
 for qemu-arm@nongnu.org; Wed, 29 Sep 2021 11:10:15 -0400
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f]:47099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mVbDo-0004Zq-52
 for qemu-arm@nongnu.org; Wed, 29 Sep 2021 11:10:14 -0400
Received: by mail-ua1-x92f.google.com with SMTP id 101so1786685uaf.13
 for <qemu-arm@nongnu.org>; Wed, 29 Sep 2021 08:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PUxk40rTx2Sh7ewbJxJOxBp3inOkrnkI194r4WuDcB0=;
 b=LECGC/vlaKmHYCx/Wx1zGx//2bBsZd1e19OuZU3+u4ooy6nj6PnJL9dQtXhaGgcG3H
 dy4lZaRBb5655tcqXjEPiyWJg5l3ovMLrwyNo7B0iM935lQVFSD32xbSdoU3Axgq4XHr
 wIbmyIlT9DiBood+HjzJd3QHx92yELnTvoZPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PUxk40rTx2Sh7ewbJxJOxBp3inOkrnkI194r4WuDcB0=;
 b=TCeNGC3a8yB3z3CYf7CFikhdLT7yEHZt0wgV1TxxRCDdOy98/wgMBWKHmiivaEzvH9
 NZtr0DUMRG8FBfj9m/r/sP92tMIHV0qNR8GMAxShD3UUzuAkk6cDlxIq4przOuUwIhoH
 SaKd+Tjl47AAir+hJ9GMDZu6cIbdokletNxBa94PNK+3L/q7WINKg1JSRvAwGYZoXdi4
 /8YP96riJdZjs2BxdAsc8Xxb8J8cmSPIC3TbuhsDk05aMEPZXoUSx1VQCd93EwGnQeRw
 3YsCkJ1OdIUaKSzX1mwD3OUz2V8jLChuUADBH99g5uRuenF7Z5Q1NUHWx7mM/qAm714N
 uB+A==
X-Gm-Message-State: AOAM5312u4jTUpv7b92zNHbbAdV8ZKhH8owpDnW2c4W3xV+xYzAMASmo
 tzrkagPYNxY1b9wzxZS9UDHM3i/65BwL/FV8T0AqYQ==
X-Received: by 2002:ab0:3d13:: with SMTP id f19mr651268uax.140.1632928210785; 
 Wed, 29 Sep 2021 08:10:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210926183410.256484-1-sjg@chromium.org>
 <CAFEAcA8S2=7rOKxeqcW+kw0BVPO3PUJGSUH-ioN7=c=U7zQxvg@mail.gmail.com>
 <CAPnjgZ2NCRVxKULWR1JjZU+D9saJ7fbZ=yHmWTSr3ufHxLYg-g@mail.gmail.com>
 <CAFEAcA9n+2JDFv8BezeEMA4e2Zhr0ENAvzLjBS6YXRoW9P-JXQ@mail.gmail.com>
 <CAPnjgZ1AO8575LYbwmuouNR5=dgNam6EFDC1_bai=8xAHdw7-Q@mail.gmail.com>
 <CAFEAcA8FsPcBELEZxiRMuFbKtmKTFgDHABePQ33hdxYRq0C0ig@mail.gmail.com>
 <CAPnjgZ2S7SXxHYd_bkcf+GcmmgEew3vpJkw+DRPqrpb44eLgcA@mail.gmail.com>
 <CAFEAcA-bk6PF_P3JOxQSCXo7Fh2K5AVygB9WwDUiK2fV9Fx5jw@mail.gmail.com>
 <CAPnjgZ26gQVpzL6fYsGzDf=c+z4aG5SPkBf7yoDC9+ynxQi_9Q@mail.gmail.com>
 <CAFEAcA_QNcAHtdxUPLpmyzMYgb9YzhcE0-zyh=N8rqm4vOcGZA@mail.gmail.com>
 <CAPnjgZ0xMH+SSjQWGjynTLDDbg6tO=z+-eDbpDKV1gqo=bhqaQ@mail.gmail.com>
 <CAFEAcA9y+sBpL-ncYwdqNkMx_oXkQ-pdhNcHOdgTxJmWBArzhA@mail.gmail.com>
In-Reply-To: <CAFEAcA9y+sBpL-ncYwdqNkMx_oXkQ-pdhNcHOdgTxJmWBArzhA@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 29 Sep 2021 09:09:59 -0600
Message-ID: <CAPnjgZ1L=UCh9cDaeNTu3i9FtOvARcDKtpuG=YLynjhBi9wn=A@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Allow additions to the generated device tree
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=sjg@google.com; helo=mail-ua1-x92f.google.com
X-Spam_score_int: -92
X-Spam_score: -9.3
X-Spam_bar: ---------
X-Spam_report: (-9.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /SB9BZGaGKPc

Hi Peter,

On Wed, 29 Sept 2021 at 03:10, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 29 Sept 2021 at 04:01, Simon Glass <sjg@chromium.org> wrote:
> > On Tue, 28 Sept 2021 at 03:21, Peter Maydell <peter.maydell@linaro.org> wrote:
> > > So what *is* this patch doing? The subject says "Allow additions to
> > > the generated device tree", and the patch adds an option to
> > > "Merge a device tree binary (dtb) file into the generated device tree".
> > > That sounds exactly like "combine two bits of dtb" -- the one the
> > > user provides to the -dtbi option and the one QEMU generates
> > > internally.
> >
> > Yes that's right, but as you say one of them is generated by QEMU. It
> > is fixing a problem caused by QEMU's generation of the device tree,
> > since it provides no wat to augment the device tree without my patch.
>
> You can augment it in the guest if you need to add guest-specific stuff.

This was also discussed, see below.

>
> > > > The only current working option is to just pass the U-Boot dtb through
> > > > and not use QEMU's on-the-fly-generated dtb at all. But I am assuming
> > > > there is a reason why QEMU generates that dtb, so that would not be
> > > > desirable?
> > >
> > > QEMU generates the dtb to tell the guest what hardware is
> > > present and where it is. We don't guarantee that that hardware
> > > arrangement is necessarily stable between QEMU versions (in
> > > practice there are generally additions and not deletions or
> > > moves, but in theory there might be). All the guest is supposed
> > > to assume is the location of RAM and flash; everything else it
> > > must look in the dtb to determine.
> >
> > Yes, so that is going to severely limit the usefulness of the virtio
> > support, for example. But we can just ignore it for CI, I suppose,
> > since we can use fixed parameters to QEMU, if you don't want to allow
> > more control of the device tree.
>
> virtio-mmio devices should already be correctly indicated in the
> device tree. virtio-pci devices can be found by probing the PCI
> bus in the usual way (and you can find out where the PCI controller
> is by looking in the dtb).

Which device tree? The one generated by QEMU or the one we would
actually use, in U-Boot?

>
> > This patch is really just augmenting what QEMU is already doing and
> > solving a problem that it has. I don't see it as creating a new boot
> > mechanism or being a weird tweak. If anything, it puts the tweaking in
> > the hands of the user. It seems like something you would be keen on,
> > from that POV.
>
> I absolutely see it as a weird tweak. It's something that
> only u-boot seems to care about, and it's adding an extra
> user-facing command line option that is basically
> "if you need to boot u-boot you need this". The user should
> not need to "control" the dtb, because QEMU should already
> be creating a dtb which describes the hardware it is exposing
> to the guest.

I don't even know how to respond to that. Anything that uses
devicetree for control will need to have its bindings respected. It is
QEMU that is confused here, with its idea that if it just creates
whatever it feels like, it will be suitable for the payload. It may be
suitable for linux because it was coded up that way, but it is not
suitable in general. Each project can have its own device tree
bindings, yes?

See for example barebox which has the same problem:
https://www.barebox.org/doc/latest/devicetree/bindings/barebox/barebox,environment.html

>
> > > Guest software running on the "virt" board needs to know it is
> > > running on the "virt" board and deal with the interface and
> > > information that QEMU provides. (For instance, Arm Trusted
> > > Firmware and UEFI both have done this.)
> >
> > Well unfortunately this is in conflict, based on what you have said in
> > this thread. We can either have virtio support (use QEMU-generated
> > device tree) or have U-Boot work correctly (use -dtb). Do you have any
> > other ideas?
>
> I've already suggested what I think you should do: have u-boot
> combine the dtb it gets from QEMU with the dtb-extras stuff
> it wants for its own purposes, with the latter supplied in
> any of a bunch of workable ways (extra file loaded in memory,
> concatenate the dtb blob with the u-boot binary at compile
> time, whatever; rough analogy with however u-boot gets the
> full dtb on hardware platforms where there is none).

Unfortunately this is not practical for reasons I explained
previously. To recap:

- this is not how real boards work (they expect their dtb to be provided)
- It adds code to the early stage of U-Boot which would not be there
in a real system
- this code takes a long time to run, particularly with the cache off or in SPL
- we don't have access to a second dtb anyway

Another option is to run QEMU twice, like:

arm/qemu-system-arm -M virt -nographic  -M dumpdtb=out.dtb
(run a tool to merge them)
arm/qemu-system-arm -M virt -nographic -bios
/tmp/b/qemu_arm/u-boot-nodtb.bin -dtb merged.dtb

If we really need the virtio devices then that could be one option.

Regards,
Simon
