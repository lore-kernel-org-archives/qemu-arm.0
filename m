Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1235193njf;
        Mon, 2 Sep 2024 14:21:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWAuUevmqridhg2oroXTL+jwN/QUmf/rGoHhhYp5SuSwZ8r7G9BEadqxkM8d8/3pApmKq4Amq8DEjZK9g==@linaro.org
X-Google-Smtp-Source: AGHT+IHGIXaYvCvLUCCygy0sjQtcrkLm0YbQdVcyKpaq+w82WuPQqSE3mj320d53uLSavNTuuhM1
X-Received: by 2002:a05:622a:993:b0:456:847d:47a5 with SMTP id d75a77b69052e-456fd7da328mr130256151cf.38.1725312083541;
        Mon, 02 Sep 2024 14:21:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725312083; cv=none;
        d=google.com; s=arc-20160816;
        b=N/IDxuVrN2swI0V7V15M7JZmv50Cc6tpqdp6p2gsX89dNqlXDbGDAVSiJ9aSDoAUK0
         o6mu9HElvOtemVvWIfgKAaHFo2hNfLD1jRl4V3d2+GeDo0scwj88Wv+UjqdN7Zd1B4CY
         RwI796GFwjb5kYqYOM06TN9PCY+Zrg9kdZLPL5+viR5ajfuNqxO0ux03ZzV5PyAiIwZJ
         e0F1QJnTXRRfrRTjpgMNgt5Xms84NGWEv/70ljDLUSBT0TXwwM4JIKXtraJTr6Q5SyUd
         8Db0hXyvO+T73XcKI9jP13P0hJpK6zdKTYhxie7CdE7gam1WOdJdG4rtt93xecgjVRJ4
         wh0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Syh43mWTFqC3pAhSWyz0m1pOZ0HsA1PDAVMBJOu+JDM=;
        fh=nzrBkd9gDRdC4ODu9JM2dyGQDWbs4mITBKo9YjKjhcM=;
        b=BPhsrTzExGRjwQvRRonrdiBsuDdN/TMa3DZlZZOKEcE/1BGIF92SWsRkWW0ZH5UjIl
         mx5c/5Mx4q5gApuGnvjFH33ElpQDPE0cLUPGM0eC9mT4pqjncenvyZeNTL5P7ggFjaYX
         c69Zh3DQ89PD4ZwwjPUKQD0EodBxwev1ixCcBeeJxXx3dZWAAAgsXwsjY7ZuqmJPoMRc
         w6aOOcp0K6XQg36fhU1w6M8MFCv0mLvgCeRiSZSkTJjdynrMGiTOV0gFI3kHUp0r2/0Q
         9YoYBIpL4W3lvxtlb3mVcQCWSyaQEUjWY85evzKsWZlE1X2BosgoTeX5fO5WoO3QqRKi
         Dlvg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=NudPXWRP;
       spf=pass (google.com: domain of qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45682df34ecsi112869431cf.636.2024.09.02.14.21.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Sep 2024 14:21:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=NudPXWRP;
       spf=pass (google.com: domain of qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-discuss-bounces@nongnu.org>)
	id 1slETm-000302-C5; Mon, 02 Sep 2024 17:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1slETk-0002yK-Nf; Mon, 02 Sep 2024 17:20:52 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1slETi-0006Iq-7g; Mon, 02 Sep 2024 17:20:52 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-2da4ea59658so441587a91.0; 
 Mon, 02 Sep 2024 14:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725312048; x=1725916848; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Syh43mWTFqC3pAhSWyz0m1pOZ0HsA1PDAVMBJOu+JDM=;
 b=NudPXWRPVv1wYkwsn4CA24JEFgS3+TMdeNJYk/XLjrvzRoigtuT7KyInuBsN6EN2lS
 mKM6O8PN8dQyE64cxPvTKrPxaQ9DVUATrNq813qF2RFfd07bYbIYuBJOJrOdvmo5zwTp
 xG01DGXOk/J/5WAD65dLy0e3c9kJrLrsRlyace4dH1pjrLDhcedZn9Fq5xqk4jORGw0V
 6c11zUNHQAYL/aQxKDypUrh4mhxPlvRgwF4xSn2wvWqEuLsTblE5ytCshua7Bn2KraX/
 STCnM3ovz0nVkaPhb6HtyBRHvEO0rSFpRadQKW3F6Ecjky20mX85sqfIxGXHND7pq3VW
 oNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725312048; x=1725916848;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Syh43mWTFqC3pAhSWyz0m1pOZ0HsA1PDAVMBJOu+JDM=;
 b=B+xEaAq4zg+q8fdGY7/jhnKDidhSUcd8pW/uFA/9XHmoVIlEW04QnOL6fbK+3a/hIJ
 Tj9PJFgZzkC04V6Bk6FMdzjEkrxyA/Fv2FhvWjOuOm2WyrWehNuu7lqOqaZ3L0KBvPA8
 whA+h0fLBkJOaiRMAKS3YXBWhB4Vp0V1TwA+I98PJGTOAermiJ4XzfrsMIS1pIO8dXlm
 9br18GpNUEcOuY7ggl02KmnnaLfJYiIbAaOiAYRTBAWrgB3nAi/BzSYd38IWMdVoqDzj
 3vnMC5/QZGIGPtBwIDOBVXp8vQKsCW3SAuH1bSn+hFOoaQ9cdwV6lk6FUIrfRG+T0FXJ
 1KgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkE5eJr+g4lAp/N6+L1LnkcATlHBCzZCwpPu5kV6mvKVwD9M1X3JnabzVhyL2E8uq1srX3HnBlAQ==@nongnu.org
X-Gm-Message-State: AOJu0YxGGbSFeYJdLrjP3kTG17DbEWrY9suHNwJfb4DSzsqdcF8hBOOt
 wotk8MPvD/muFDdnqjm9Ey4hojxMh7K1xreM6pBXEifzlB07LPVhb7zZIddpQEY+NLidmEN4uk+
 OGlnPVNPkMEfezt0YCuz9Sdx3jHQ=
X-Received: by 2002:a17:90b:510e:b0:2c9:754d:2cba with SMTP id
 98e67ed59e1d1-2d88d6688b1mr9306284a91.3.1725312048281; Mon, 02 Sep 2024
 14:20:48 -0700 (PDT)
MIME-Version: 1.0
References: <CA+1FSiirzpq4wjcKTLSexiOWtv26sgD37h=wA2qxv8Qh5MW_-w@mail.gmail.com>
 <23d60255-614a-4a06-b449-644f215555d0@linaro.org>
 <CA+1FSiitcSBa3JZaAZMGkdB356d2M0rPqscwFnNXGML5HghVCQ@mail.gmail.com>
 <c80e855a-ac1c-40b6-8a76-966e53c0b7d7@linaro.org>
 <4cbc21b0-0634-445d-8a67-7705a4e186d8@linaro.org>
In-Reply-To: <4cbc21b0-0634-445d-8a67-7705a4e186d8@linaro.org>
From: Mario Marietto <marietto2008@gmail.com>
Date: Mon, 2 Sep 2024 23:20:11 +0200
Message-ID: <CA+1FSigiu8xXF1OPs1oSPS7LiGe23gsN73RwPpJUYH=X5EkTRQ@mail.gmail.com>
Subject: Re: Error : init: partition(s) not found in /sys, waiting for their
 uevent(s): mmcblk0p2, mmcblk0p3 while trying to emulate Android 14 on Ubuntu
 24.04 X64 bit using qemu-system-aarch64.
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-discuss@nongnu.org, qemu-arm <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000c3c14f06212983df"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=marietto2008@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-discuss@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-discuss.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-discuss>,
 <mailto:qemu-discuss-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-discuss>
List-Post: <mailto:qemu-discuss@nongnu.org>
List-Help: <mailto:qemu-discuss-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-discuss>,
 <mailto:qemu-discuss-request@nongnu.org?subject=subscribe>
Errors-To: qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yWz/81x1gcbj

--000000000000c3c14f06212983df
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello.

I've downloaded this file : aosp_cf_arm64_only_phone-img-12309296.zip and
this file : cvd-host_package.tar.gz

from here :
https://ci.android.com/builds/submitted/12309296/aosp_cf_arm64_only_phone-t=
runk_staging-userdebug/latest

But let's say that I don't want to use the *.img files that are stored
inside "aosp_cf_arm64_only_phone-img-12309296.zip",but the same files that
have been produced when I have compiled this version of Android :

https://github.com/raspberry-vanilla/android_local_manifest?tab=3Dreadme-ov=
-file

Can I do it ? Is it supposed to work the same ?

Thanks.

On Mon, Sep 2, 2024 at 10:23=E2=80=AFPM Pierrick Bouvier <
pierrick.bouvier@linaro.org> wrote:

>
>
> On 9/2/24 13:20, Pierrick Bouvier wrote:
> > On 9/2/24 12:53, Mario Marietto wrote:
> >> Hello Pierrick.
> >>
> >> With Cuttlefish can I emulate Android 14 for arm64 ? I ask because in
> >> your script I read :
> >>
> >> "|/home/user/.work/qemu/build/qemu-system-x86_64", so,I suspect that y=
ou
> >> have emulated Android x64 bit,but I need arm64. |
> >>
> >
> > Yes, it works for both architecture. The only thing I didn't try is an
> > arm64 vm accelerated with kvm (I don't have this a linux-aarch64
> > machine), but it should work.
>
> And of course, if you want to write a custom wrapper for qemu, name it
> qemu-system-aarch64, and call the same binary instead of x86_64 variants.
>
> >
> >> I also read "for aarch64 images: select
> >> |aosp_cf_arm64_only_phone-trunk_staging-userdebug" : I'm not able to
> >> download this kind of images. I don't understand how the Branch Grid
> >> works. Can you explain to me a little bit more ?
> >> |
> >
> > You have a link just next to it ("Branch grid") on the wiki page.
> > Once on ci android page, click on filter button (three bars, inverted
> > pyramid), and select aosp_cf_arm64_only_phone-trunk_staging-userdebug.
> > Then go to artifacts, and download image and cvd_host_x86_64 package, a=
s
> > wiki mentions.
> >
> > Don't hesitate to ask more questions on this. I imagine this topic migh=
t
> > interest some people who try to do the same thing.
> >
> > Pierrick
> >
> >> |
> >> |
> >>
> >>
> >> On Mon, Sep 2, 2024 at 8:47=E2=80=AFPM Pierrick Bouvier
> >> <pierrick.bouvier@linaro.org <mailto:pierrick.bouvier@linaro.org>>
> wrote:
> >>
> >>      Hello Mario,
> >>
> >>      very recently, I had to investigate booting time of Android when
> using
> >>      QEMU. You can probably manage to boot this with only QEMU alone,
> but in
> >>      my experience, using Cuttlefish tooling is an easier approach.
> >>
> >>      If you really want to use only QEMU, you can use Cuttlefish to ge=
t
> >>      exact
> >>      command line used (which disk goes where), and iterate from that.
> >>
> >>      Instructions:
> >>
> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Andro=
id+using+QEMU
> <
> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Andro=
id+using+QEMU
> >
> >>
> >>      As you'll see, I could not get a direct graphic output, but using
> >>      scrcpy, it worked well for me. Hope it can fit your use case.
> >>
> >>      Regards,
> >>      Pierrick
> >>
> >>      On 9/2/24 06:49, Mario Marietto wrote:
> >>       > Hello.
> >>       >
> >>       > I would like to emulate Android 14 on my Ubuntu 24.04 OS X64 b=
it
> >>      using
> >>       > qemu-system-aarch64. I tried using the following parameters :
> >>       >
> >>       > qemu-system-aarch64 \
> >>       >          -smp 4 \
> >>       >          -m 2048 \
> >>       >          -cpu cortex-a72 \
> >>       >          -M virt \
> >>       >          -device virtio-gpu-pci,xres=3D1024,yres=3D768 \
> >>       >          -display sdl,gl=3Don \
> >>       >          -device usb-ehci \
> >>       >          -device usb-kbd \
> >>       >          -device virtio-tablet-pci \
> >>       >          -usb \
> >>       >          -serial stdio \
> >>       >          -kernel /mnt/zroot-133/_OS/Android/rpi4/Image \
> >>       >          -initrd /mnt/zroot-133/_OS/Android/rpi4/ramdisk.img \
> >>       >          -drive
> >>       >
> >>
> index=3D0,if=3Dnone,id=3Dsystem,file=3D/mnt/zroot-133/_OS/Android/rpi4/bo=
ot.img \
> >>       >          -device virtio-blk-pci,drive=3Dboot \
> >>       >          -drive
> >>       >
> >>
> index=3D1,if=3Dnone,id=3Dsystem,file=3D/mnt/zroot-133/_OS/Android/rpi4/sy=
stem.img \
> >>       >          -device virtio-blk-pci,drive=3Dsystem \
> >>       >          -drive
> >>       >
> >>
> index=3D2,if=3Dnone,id=3Dvendor,file=3D/mnt/zroot-133/_OS/Android/rpi4/ve=
ndor.img \
> >>       >          -device virtio-blk-pci,drive=3Dvendor \
> >>       > -append "console=3DttyAMA0,38400 drm.debug=3D0x0 rootwait
> rootdelay=3D5
> >>       > root=3D/dev/mmcblk0p2 androidboot.hardware=3Drpi4
> >>       > androidboot.selinux=3Dpermissive security=3Dselinux selinux=3D=
1
> >>       > androidboot.qemu.hw.mainkeys=3D0 androidboot.lcd.density=3D160=
"
> >>       >
> >>       > The error I get in short is :
> >>       >
> >>       > [ 1.993668] init: bool
> >>       >
> >>
> android::init::BlockDevInitializer::InitDevices(std::set<std::string>):
> >>       > partition(s) not found in /sys, waiting for their uevent(s):
> >>      mmcblk0p2,
> >>       > mmcblk0p3
> >>       >
> >>       >
> >>       > One user suggested to :
> >>       >
> >>       >
> >>       >
> >>       >
> >>       >
> >>       > Hi!!! The "/sys" is a "dynamic fs" created at ram from the
> >>      kernel, to
> >>       > export a lot of things...so most of the files only exist at
> runtime.
> >>       > Normally, the partitions from the block device have a symlink =
at
> >>       > /sys/<something>/<...> that points to /dev/ block node. It see=
ms
> >>      that
> >>       > there are no such files under /sys according to what init is
> looking
> >>       > for. You can double check this at init source code to check th=
e
> >>      exact
> >>       > path but I'm guessing that you'll have to change the qemu
> arguments
> >>       > regarding the block device.
> >>       >
> >>       > About userdata.img I think it's normal since in the old days,
> the
> >>      image
> >>       > was a "empty sparse image", that means, at the first flashing
> >>      process,
> >>       > there isn't userdata information, we're just "flashing the
> >>      partition"
> >>       > with empty data.
> >>       > Tks!!!
> >>       >
> >>       >
> >>       >
> >>       > So,in short I should change the qemu arguments regarding the
> block
> >>       > device. I tried in this way :
> >>       >
> >>       >
> >>       > qemu-system-aarch64 \
> >>       >          -smp 4 \
> >>       >          -m 2048 \
> >>       >          -cpu cortex-a72 \
> >>       >          -M virt \
> >>       >          -device virtio-gpu-pci,xres=3D1024,yres=3D768 \
> >>       >          -display sdl,gl=3Don \
> >>       >          -device usb-ehci \
> >>       >          -device usb-kbd \
> >>       >          -device virtio-tablet-pci \
> >>       >          -usb \
> >>       >          -serial stdio \
> >>       >          -kernel /mnt/zroot-133/_OS/Android/rpi4/Image \
> >>       >          -initrd /mnt/zroot-133/_OS/Android/rpi4/ramdisk.img \
> >>       >          -hda /mnt/zroot-133/_OS/Android/rpi4/boot.img \
> >>       >          -hdb /mnt/zroot-133/_OS/Android/rpi4/system.img \
> >>       >          -hdc /mnt/zroot-133/_OS/Android/rpi4/vendor.img \
> >>       >        -append "console=3DttyAMA0,38400 drm.debug=3D0x0 rootwa=
it
> >>      rootdelay=3D5
> >>       > root=3D/dev/mmcblk0p2 androidboot.hardware=3Drpi4
> >>       > androidboot.selinux=3Dpermissive security=3Dselinux selinux=3D=
1
> >>       > androidboot.qemu.hw.mainkeys=3D0 androidboot.lcd.density=3D160=
"
> >>       >
> >>       >
> >>       > but the error is still there. Do you know some different
> alternative
> >>       > block devices to try ? thanks.
> >>       >
> >>       >
> >>       > --
> >>       > Mario.
> >>
> >>
> >>
> >> --
> >> Mario.
>


--=20
Mario.

--000000000000c3c14f06212983df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello.</div><div><div><br></div><div>I&#39;ve downloa=
ded this file : aosp_cf_arm64_only_phone-img-12309296.zip and this file : c=
vd-host_package.tar.gz</div><div><div><br></div></div></div><div>from here =
: <a href=3D"https://ci.android.com/builds/submitted/12309296/aosp_cf_arm64=
_only_phone-trunk_staging-userdebug/latest">https://ci.android.com/builds/s=
ubmitted/12309296/aosp_cf_arm64_only_phone-trunk_staging-userdebug/latest</=
a></div><div></div><div><br></div><div>But let&#39;s say that I don&#39;t w=
ant to use the *.img files that are stored inside &quot;aosp_cf_arm64_only_=
phone-img-12309296.zip&quot;,but the same files that have been produced whe=
n I have compiled this version of Android :</div><div><br></div><div><a hre=
f=3D"https://github.com/raspberry-vanilla/android_local_manifest?tab=3Dread=
me-ov-file">https://github.com/raspberry-vanilla/android_local_manifest?tab=
=3Dreadme-ov-file</a></div><div><br></div><div>Can I do it ? Is it supposed=
 to work the same ? <br></div><div><br></div><div>Thanks.<br></div><div><di=
v></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Sep 2, 2024 at 10:23=E2=80=AFPM Pierrick Bouvier &l=
t;<a href=3D"mailto:pierrick.bouvier@linaro.org">pierrick.bouvier@linaro.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><br>
<br>
On 9/2/24 13:20, Pierrick Bouvier wrote:<br>
&gt; On 9/2/24 12:53, Mario Marietto wrote:<br>
&gt;&gt; Hello Pierrick.<br>
&gt;&gt;<br>
&gt;&gt; With Cuttlefish can I emulate Android 14 for arm64 ? I ask because=
 in<br>
&gt;&gt; your script I read :<br>
&gt;&gt;<br>
&gt;&gt; &quot;|/home/user/.work/qemu/build/qemu-system-x86_64&quot;, so,I =
suspect that you<br>
&gt;&gt; have emulated Android x64 bit,but I need arm64. |<br>
&gt;&gt;<br>
&gt; <br>
&gt; Yes, it works for both architecture. The only thing I didn&#39;t try i=
s an<br>
&gt; arm64 vm accelerated with kvm (I don&#39;t have this a linux-aarch64<b=
r>
&gt; machine), but it should work.<br>
<br>
And of course, if you want to write a custom wrapper for qemu, name it <br>
qemu-system-aarch64, and call the same binary instead of x86_64 variants.<b=
r>
<br>
&gt; <br>
&gt;&gt; I also read &quot;for aarch64 images: select<br>
&gt;&gt; |aosp_cf_arm64_only_phone-trunk_staging-userdebug&quot; : I&#39;m =
not able to<br>
&gt;&gt; download this kind of images. I don&#39;t understand how the Branc=
h Grid<br>
&gt;&gt; works. Can you explain to me a little bit more ?<br>
&gt;&gt; |<br>
&gt; <br>
&gt; You have a link just next to it (&quot;Branch grid&quot;) on the wiki =
page.<br>
&gt; Once on ci android page, click on filter button (three bars, inverted<=
br>
&gt; pyramid), and select aosp_cf_arm64_only_phone-trunk_staging-userdebug.=
<br>
&gt; Then go to artifacts, and download image and cvd_host_x86_64 package, =
as<br>
&gt; wiki mentions.<br>
&gt; <br>
&gt; Don&#39;t hesitate to ask more questions on this. I imagine this topic=
 might<br>
&gt; interest some people who try to do the same thing.<br>
&gt; <br>
&gt; Pierrick<br>
&gt; <br>
&gt;&gt; |<br>
&gt;&gt; |<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Sep 2, 2024 at 8:47=E2=80=AFPM Pierrick Bouvier<br>
&gt;&gt; &lt;<a href=3D"mailto:pierrick.bouvier@linaro.org" target=3D"_blan=
k">pierrick.bouvier@linaro.org</a> &lt;mailto:<a href=3D"mailto:pierrick.bo=
uvier@linaro.org" target=3D"_blank">pierrick.bouvier@linaro.org</a>&gt;&gt;=
 wrote:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Hello Mario,<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 very recently, I had to investigate booting ti=
me of Android when using<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 QEMU. You can probably manage to boot this wit=
h only QEMU alone, but in<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 my experience, using Cuttlefish tooling is an =
easier approach.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 If you really want to use only QEMU, you can u=
se Cuttlefish to get<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 exact<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 command line used (which disk goes where), and=
 iterate from that.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Instructions:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 <a href=3D"https://linaro.atlassian.net/wiki/s=
paces/QEMU/pages/29464068097/Run+Android+using+QEMU" rel=3D"noreferrer" tar=
get=3D"_blank">https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068=
097/Run+Android+using+QEMU</a> &lt;<a href=3D"https://linaro.atlassian.net/=
wiki/spaces/QEMU/pages/29464068097/Run+Android+using+QEMU" rel=3D"noreferre=
r" target=3D"_blank">https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29=
464068097/Run+Android+using+QEMU</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 As you&#39;ll see, I could not get a direct gr=
aphic output, but using<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 scrcpy, it worked well for me. Hope it can fit=
 your use case.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Regards,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Pierrick<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 On 9/2/24 06:49, Mario Marietto wrote:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Hello.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I would like to emulate Android 14 =
on my Ubuntu 24.04 OS X64 bit<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 using<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; qemu-system-aarch64. I tried using =
the following parameters :<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; qemu-system-aarch64 \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
smp 4 \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
m 2048 \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
cpu cortex-a72 \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
M virt \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
device virtio-gpu-pci,xres=3D1024,yres=3D768 \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
display sdl,gl=3Don \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
device usb-ehci \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
device usb-kbd \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
device virtio-tablet-pci \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
usb \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
serial stdio \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
kernel /mnt/zroot-133/_OS/Android/rpi4/Image \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
initrd /mnt/zroot-133/_OS/Android/rpi4/ramdisk.img \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=
=A0 -drive<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 index=3D0,if=3Dnone,id=3Dsystem,file=3D/mnt/zr=
oot-133/_OS/Android/rpi4/boot.img \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
device virtio-blk-pci,drive=3Dboot \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -drive<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 index=3D1,if=3Dnone,id=3Dsystem,file=3D/mnt/zr=
oot-133/_OS/Android/rpi4/system.img \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
device virtio-blk-pci,drive=3Dsystem \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
drive<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 index=3D2,if=3Dnone,id=3Dvendor,file=3D/mnt/zr=
oot-133/_OS/Android/rpi4/vendor.img \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
device virtio-blk-pci,drive=3Dvendor \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; -append &quot;console=3DttyAMA0,384=
00 drm.debug=3D0x0 rootwait rootdelay=3D5<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; root=3D/dev/mmcblk0p2 androidboot.h=
ardware=3Drpi4<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; androidboot.selinux=3Dpermissive se=
curity=3Dselinux selinux=3D1<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; androidboot.qemu.hw.mainkeys=3D0 an=
droidboot.lcd.density=3D160&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; The error I get in short is :<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ 1.993668] init: bool<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 android::init::BlockDevInitializer::InitDevice=
s(std::set&lt;std::string&gt;):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; partition(s) not found in /sys, wai=
ting for their uevent(s):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 mmcblk0p2,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; mmcblk0p3<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; One user suggested to :<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Hi!!! The &quot;/sys&quot; is a &qu=
ot;dynamic fs&quot; created at ram from the<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 kernel, to<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; export a lot of things...so most of=
 the files only exist at runtime.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Normally, the partitions from the b=
lock device have a symlink at<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; /sys/&lt;something&gt;/&lt;...&gt; =
that points to /dev/ block node. It seems<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 that<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; there are no such files under /sys =
according to what init is looking<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; for. You can double check this at i=
nit source code to check the<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 exact<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; path but I&#39;m guessing that you&=
#39;ll have to change the qemu arguments<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; regarding the block device.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; About userdata.img I think it&#39;s=
 normal since in the old days, the<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 image<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; was a &quot;empty sparse image&quot=
;, that means, at the first flashing<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 process,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; there isn&#39;t userdata informatio=
n, we&#39;re just &quot;flashing the<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 partition&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; with empty data.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Tks!!!<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; So,in short I should change the qem=
u arguments regarding the block<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; device. I tried in this way :<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; qemu-system-aarch64 \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
smp 4 \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
m 2048 \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
cpu cortex-a72 \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
M virt \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
device virtio-gpu-pci,xres=3D1024,yres=3D768 \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
display sdl,gl=3Don \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
device usb-ehci \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
device usb-kbd \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
device virtio-tablet-pci \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
usb \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
serial stdio \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
kernel /mnt/zroot-133/_OS/Android/rpi4/Image \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
initrd /mnt/zroot-133/_OS/Android/rpi4/ramdisk.img \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -hda /mnt/zroot-133/_OS/Android/rpi4/boot.img \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
hdb /mnt/zroot-133/_OS/Android/rpi4/system.img \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
hdc /mnt/zroot-133/_OS/Android/rpi4/vendor.img \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 -append =
&quot;console=3DttyAMA0,38400 drm.debug=3D0x0 rootwait<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 rootdelay=3D5<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; root=3D/dev/mmcblk0p2 androidboot.h=
ardware=3Drpi4<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; androidboot.selinux=3Dpermissive se=
curity=3Dselinux selinux=3D1<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; androidboot.qemu.hw.mainkeys=3D0 an=
droidboot.lcd.density=3D160&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; but the error is still there. Do yo=
u know some different alternative<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; block devices to try ? thanks.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; --<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Mario.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -- <br>
&gt;&gt; Mario.<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>

--000000000000c3c14f06212983df--
