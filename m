Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3367076lfq;
        Sun, 4 Oct 2020 11:40:58 -0700 (PDT)
X-Received: by 2002:a05:6402:84f:: with SMTP id b15mr13605842edz.149.1601836858464;
        Sun, 04 Oct 2020 11:40:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601836858; cv=none;
        d=google.com; s=arc-20160816;
        b=w99EfkfgNpitsALTif9ieNG8MCbN1WBFS9PgOTjtYocalCDHkW5fmkD18hH0bYng/U
         axuFz8NvUFHKsTa0RnFJgPyojfRMRdhxFseivZvkrqRKGoqYLxbGvC1dy4MJ19CKYCLm
         2nCUHlDo+X0poirbrZ4Zyu93F9g8bnP/t3mPtGixve+WBgFwjLgCv+SmzVxqYlMyrjZa
         Ed/35/mVQ6er8gIb8UOlY+6anytD/SuipHWkctjo+sSkgCGG/x7k7VxUeT+xuoejoY7S
         IF/g6uKe44AhT9sdD3uuevEAD7/UB0WhuJyvw/l0SGh2bvMsP9I9S4j5FuPYfFJ42pjU
         Zibw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vPP3s4z361Q9UgQNLLTL7OkavWGws14FpHuVpd66USo=;
        b=Cm+iwymUTT/MKBspsKoTIO53z8sw4PHaElSeVlR6P56asfNNHZLZLT79p4znqXAG05
         nOctu7vKH5NwAwBTllCAczjG+vjEwj+fImDSIMiyNpSqCJqL2//Y1xHiVUJVl4fmGfga
         Wm23OI7ZIWKH4CumkfXfuhP7eLRDtH+9noKidZjRvQW8fOWt2J/QUXZMmBv4n7IZ77fI
         K7R+nWC3rVWjxmzm6B1lde7OqAhgO5ySgro5uJmXBoGfxUx+Vh2z9hSbUStORZxPBeMv
         /PlwSfCUf8dGNQLxL2V1GjpJMQKPSt5RvoQuPK42M0kdr7ite3EN+02A5dKJhVC1eHJW
         7Gvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mmJtpsOS;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id n22sor3201869eju.86.2020.10.04.11.40.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 Oct 2020 11:40:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mmJtpsOS;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vPP3s4z361Q9UgQNLLTL7OkavWGws14FpHuVpd66USo=;
        b=mmJtpsOS8ugC5pZ2fC9NsasWinEZCA3IWEKnwATZFzxq3BU+O9GdQFbnCwTjlSSRpX
         tYx2zEdYaqLFmEI4/EC9KoCYqOx54nS1bY3uNzrYn6H9NyDQoBR4rnlDzJRdzUc0Nhh7
         VPP/Go8ftHassRygl1KeOHpcrjYBS4sH8CSNGQFti3j3agWu2eO62py25CsDXkb3CqBP
         59XTuBXkkFVP6E7+N93RIfGVjDE5VhkXLuRXpekl1pqnr2A9+5VSQOKPTkAavXZo8dHJ
         FF97o5v4yOti9TGihzMCEdF4CGYPcRa5qGfQ12gMdvkJnqBLxATVPLCitja1Kr0N56XR
         wh6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vPP3s4z361Q9UgQNLLTL7OkavWGws14FpHuVpd66USo=;
        b=c4g9aL1dXLaRJjEBht7VyVmaIUZmEP0YF2ee8dFmSdvLSmAqaLfJqCqt+nV3lnU1lr
         +tRhjOo42EpahuCMX2UZ3N1B0br24z4Ixwog4pS1mO7gD5Gp2ZvAjETGATAS9snmYslX
         De0XfVn4LKlMZnkh6g9SDhWxruSAbf0QbLSuhyYr2o9xjT/Cf4RPja9xb87+A+vkgsxa
         peQi7RrfNCjD1wyJr4tGdBDGyqBycGvEBL7ww0vMLkLz5/T9W53OFntVQKnIU0Ti7JH0
         ChceuIPuezzo6GdUxjREeUz9mNDOFjt3nXo+iOt2Xc4Q/91JdfjuHrkecpzh+IcsCL5Q
         R92A==
X-Gm-Message-State: AOAM532Hl49F0J3VYf2ZKxWlCXxKobuNUg1IIcTwfDK1zJFUnjRJIOCT
	edkIosj+2whkEA+v/djYLMeW3ROAM3Wo0oulONMh1EfMlyJE5eOdRuY=
X-Google-Smtp-Source: ABdhPJwI4Kuk0DLopxQQFsVJd36uVqa4/wc42sYxtjxCOTRkDh3lTqZwxjQ6YtDzPdfGyy/EUIuBx06zXMdiTlzw3Gc=
X-Received: by 2002:a17:906:1f42:: with SMTP id d2mr11713267ejk.407.1601836857425;
 Sun, 04 Oct 2020 11:40:57 -0700 (PDT)
MIME-Version: 1.0
References: <47dbcad4-3121-b1c3-06fa-abec7c353fb6@gmail.com> <87sgatanti.fsf@linaro.org>
In-Reply-To: <87sgatanti.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 4 Oct 2020 19:40:46 +0100
Message-ID: <CAFEAcA_ZMLV3DZ_R_SHvPLdEf=i-xpspD5itBmfYeqyMhgtLWQ@mail.gmail.com>
Subject: Re: Emulate Rpi with QEMU fails
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Thomas <74cmonty@gmail.com>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, Andrew Baumann <Andrew.Baumann@microsoft.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: BM3op0qEQFTl

On Sun, 4 Oct 2020 at 18:44, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> Thomas <74cmonty@gmail.com> writes:
> > I'm trying to emulate Rpi with QEMU.
> > I found
> > [url=3D1]this[/url]
> > arcticle in Raspberry Pi Geek documenting the steps including persisten=
t
> > storage on host.
> >
> > However when starting the emulation with command
> > qemu-system-arm -M versatilepb -cpu arm1176 -m 256 -serial stdio -hda
> > 2020-08-20-raspios-buster-armhf-lite.img -net
> > "user,hostfwd=3Dtcp::5022-:22" -dtb versatile-pb-buster.dtb -kernel
> > kernel-qemu-5.4.51-buster -append "root=3D/dev/sda2 rootfstype=3Dext4 r=
w
> > panic=3D1" -no-reboot
>
> Let's start with the fact you are using a versatilepb machine type with
> a versatilepb dtb and not the rasppi model.

Given the name of the kernel image, this probably actually *is*
built for versatilepb, or it wouldn't have got as far as failing
to mount the root partition. There seems to be a lot of confusion
in the raspberry pi community about the difference between
running the raspi userspace plus a for-versatilepb kernel
versus running a full raspi setup.

Anyway, failing to mount the rootfs and not listing any
sda devices is not a problem with the fstab, because the system
hasn't got as far as being able to mount the filesystem with a
fstab on it yet. One possibility is that the kernel is
missing the device drivers for either PCI or for the SCSI
controller that gets plugged in to versatilepb by default.

My guess at the cause is that you're trying to boot a Linux 5.something
kernel and you've run into the issue described in this thread:
https://lists.gnu.org/archive/html/qemu-discuss/2020-09/msg00023.html
where the Linux 5.x sym53c8xx scsi driver is not compatible with QEMU's
emulation of that device. If that's the case then you should see
earlier in the kernel boot log error messages similar to the ones
that Roger reported. The fix would be either to use an older
kernel, or to change the QEMU commandline to use a different
SCSI controller (or to use a virtio block device).

thanks
-- PMM
