Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp183925lfp;
        Wed, 29 Sep 2021 02:11:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1H+kT+wH19KItvqoBJzSqZHrnpv6fg2Be3t21VWgyh7WY1WsBlwFNgO6nPOFPF1HFKNB+
X-Received: by 2002:a0c:fe87:: with SMTP id d7mr10393679qvs.51.1632906671423;
        Wed, 29 Sep 2021 02:11:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632906671; cv=none;
        d=google.com; s=arc-20160816;
        b=EqdLgS1qOrK8GDdYjuRE3puWWSeaOBc3wqJnSg4W3M0HVsVaZoYtvocbJ9/Wq49JiX
         AGLDY/2uKi9+VGd1jrDEYJ8CGFWSbrpU9QrWlIHKCjgK7GqZdI2jpwrkKFHI1MbAQWYK
         LII1I2AMy2LGWh2Ap/mbyvozWDQDAQtHNcKxkmRnDzN4FuoLQMRpAfTGT6YO/SEm+Vkz
         VlolRzrRvfJExPNJbP1HXuOivqLsFjthfVh/SxE2//tEsb81OV48vJNhvsgYd8QptZ8B
         ClRI2ZuXZbjo9py57W6MQtzheViy8VVnHRkrSRPbMmtDtW9TvUklIUIsghUDPsvIsUaZ
         mXLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sSziG86OyoRTL66noHj0SwAN+2VckCYxnmfYy0a1Hug=;
        b=wP1NPlJRhqpiqhFTeszr18bftozmAzIiJxRSNdsHvogx8cGEPxfkKilqnoSXyFP8WA
         B+1LVD2uLlDwoXO7GzVboyy7TnxJpz8h0VfsU+sGy8hJKNRxumFUJd7bG6LKljTkcgFM
         lafzRbOjKtYhXjlZjkZoxznyvACMfivuaKCSEMJibd5XrMMBbbtBXRXuP9c7Uv/kotD0
         lz1FlBDU9Tqb2aKjUYHHflzJeINtUPXh/YF0w4NhYQI0/8B+8jqyUMcD+LPOlFM1oKd3
         fpoIFqEFzkArw0tTezoNP+NWLA1r70AkpfmmW5TohtKc4jzwqPeVVkxU70kEJmoSikb9
         ZWnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LZHtNIuH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h15si1085947qvb.0.2021.09.29.02.11.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Sep 2021 02:11:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LZHtNIuH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVVcM-0007PY-AT
	for alex.bennee@linaro.org; Wed, 29 Sep 2021 05:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVVbx-0007O6-Et
 for qemu-arm@nongnu.org; Wed, 29 Sep 2021 05:10:46 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:50868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVVbt-0007CH-OB
 for qemu-arm@nongnu.org; Wed, 29 Sep 2021 05:10:44 -0400
Received: by mail-wm1-x329.google.com with SMTP id j27so1296962wms.0
 for <qemu-arm@nongnu.org>; Wed, 29 Sep 2021 02:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sSziG86OyoRTL66noHj0SwAN+2VckCYxnmfYy0a1Hug=;
 b=LZHtNIuH1mm00PvsA0j9z8/HAGnVLIkQHUqptjFSZEc1NTV0bvdHtMX1OCnX1qGWHI
 WvG1NphyvGDWzTAjyW9uw0V8BcvtJOaaLdfUOamu89KNQBoVHUwZiVMvvhGiznlSbodA
 m4fzPuoekeYuKWvovBMcz1cRaSDxl2Nvpz9zShqnUJIIVp9nh8sNbevtROXuZR2SlYO8
 fAbUF+oXFmNmv5zifvqGXqGk1+uAEcrTnC+i4R0qsYSUALrymeeBtAAzxXNvZ3L/CTB7
 XxqBd5ciBDkhwyEU/27Tpk8nsZP/Aqi9jXFXEor76qvIJ8SGz7HNhe0fJheI70UP/kHM
 iobQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sSziG86OyoRTL66noHj0SwAN+2VckCYxnmfYy0a1Hug=;
 b=N0aXhs8GUiYkZOmJpuRgK3ijqgTwpmKIBoXJXjW1XWmEMVdvnJhqgqUjld5Au/tUfj
 qDNjPfokM5h5DCA47KRAxP1tCwI3rVb24wMdWYKiKsfvoW6Wx7DZB93tMa8Vf0xi4iNW
 fwfavwjyslJaAyR/3K3pEghK20wiGNkpJB7GW6d7pxJC+tQFrDBlXQ87yZdAHvq9x2/A
 LW58le9JoK7V7CVlYPIRy8aBHbeqSA/2Y18qJhRO60KKODqhGqUJbwrHCkw991EuEC5o
 6eXpmJOp32ETzhEGyYANx5wUaB9o8ucx/XV1ifL1gxu+FE5uV/VAj+nJ8rFjUBr+F2yF
 2EhA==
X-Gm-Message-State: AOAM531lAmt69KiQV/42j0DGs++XQnQuh8MIHozPi9ca9PjDtDqS9nFC
 9uRGZ8RXiexuebSvtzhCxLhPYuGrPq+UrTQnkyc+fw==
X-Received: by 2002:a05:600c:d6:: with SMTP id
 u22mr9121925wmm.133.1632906639073; 
 Wed, 29 Sep 2021 02:10:39 -0700 (PDT)
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
In-Reply-To: <CAPnjgZ0xMH+SSjQWGjynTLDDbg6tO=z+-eDbpDKV1gqo=bhqaQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 29 Sep 2021 10:09:45 +0100
Message-ID: <CAFEAcA9y+sBpL-ncYwdqNkMx_oXkQ-pdhNcHOdgTxJmWBArzhA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Allow additions to the generated device tree
To: Simon Glass <sjg@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: HRXsBQ0xrDrz

On Wed, 29 Sept 2021 at 04:01, Simon Glass <sjg@chromium.org> wrote:
> On Tue, 28 Sept 2021 at 03:21, Peter Maydell <peter.maydell@linaro.org> wrote:
> > So what *is* this patch doing? The subject says "Allow additions to
> > the generated device tree", and the patch adds an option to
> > "Merge a device tree binary (dtb) file into the generated device tree".
> > That sounds exactly like "combine two bits of dtb" -- the one the
> > user provides to the -dtbi option and the one QEMU generates
> > internally.
>
> Yes that's right, but as you say one of them is generated by QEMU. It
> is fixing a problem caused by QEMU's generation of the device tree,
> since it provides no wat to augment the device tree without my patch.

You can augment it in the guest if you need to add guest-specific stuff.

> > > The only current working option is to just pass the U-Boot dtb through
> > > and not use QEMU's on-the-fly-generated dtb at all. But I am assuming
> > > there is a reason why QEMU generates that dtb, so that would not be
> > > desirable?
> >
> > QEMU generates the dtb to tell the guest what hardware is
> > present and where it is. We don't guarantee that that hardware
> > arrangement is necessarily stable between QEMU versions (in
> > practice there are generally additions and not deletions or
> > moves, but in theory there might be). All the guest is supposed
> > to assume is the location of RAM and flash; everything else it
> > must look in the dtb to determine.
>
> Yes, so that is going to severely limit the usefulness of the virtio
> support, for example. But we can just ignore it for CI, I suppose,
> since we can use fixed parameters to QEMU, if you don't want to allow
> more control of the device tree.

virtio-mmio devices should already be correctly indicated in the
device tree. virtio-pci devices can be found by probing the PCI
bus in the usual way (and you can find out where the PCI controller
is by looking in the dtb).

> This patch is really just augmenting what QEMU is already doing and
> solving a problem that it has. I don't see it as creating a new boot
> mechanism or being a weird tweak. If anything, it puts the tweaking in
> the hands of the user. It seems like something you would be keen on,
> from that POV.

I absolutely see it as a weird tweak. It's something that
only u-boot seems to care about, and it's adding an extra
user-facing command line option that is basically
"if you need to boot u-boot you need this". The user should
not need to "control" the dtb, because QEMU should already
be creating a dtb which describes the hardware it is exposing
to the guest.

> > Guest software running on the "virt" board needs to know it is
> > running on the "virt" board and deal with the interface and
> > information that QEMU provides. (For instance, Arm Trusted
> > Firmware and UEFI both have done this.)
>
> Well unfortunately this is in conflict, based on what you have said in
> this thread. We can either have virtio support (use QEMU-generated
> device tree) or have U-Boot work correctly (use -dtb). Do you have any
> other ideas?

I've already suggested what I think you should do: have u-boot
combine the dtb it gets from QEMU with the dtb-extras stuff
it wants for its own purposes, with the latter supplied in
any of a bunch of workable ways (extra file loaded in memory,
concatenate the dtb blob with the u-boot binary at compile
time, whatever; rough analogy with however u-boot gets the
full dtb on hardware platforms where there is none).

-- PMM
