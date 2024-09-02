Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1123576njf;
        Mon, 2 Sep 2024 07:25:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWeP7nCrGV1cDXig+0bPZoMzSbev+PzmgO/D3GaLAx2iXlxWgVhd08uK6vLlK+wIq0kaiWzJe7hbnl84A==@linaro.org
X-Google-Smtp-Source: AGHT+IHeAndRQd0NuZ0hheXqoHpVV43hhpE4iUNWgQUqDAK36Zg7y9x9a+7dVr3AwywrIgPNWhfr
X-Received: by 2002:a05:6808:10d2:b0:3dd:cc7:959a with SMTP id 5614622812f47-3df05e8a24bmr17032908b6e.47.1725287122071;
        Mon, 02 Sep 2024 07:25:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725287122; cv=none;
        d=google.com; s=arc-20160816;
        b=aUfUR3I3yd+kAF23f1gNNN/DyJoDg9EnD0ldVvr/14P9B0XMGktdlkiUjW5b711HjP
         PK/+eKKdEw64P4fc6JSK9G4yzvELOVA7fTU39BdcLayxYirQpW6fr5x9Jktz+OW0M0w2
         h1P3wzQzRaGF4CdoO4bEMYKhgu01TgmRpPxbfG7O6x7uFGKRvMCc+uqmgho6EpkTY68C
         PdoCASB1SjKe10jUH6ivFiFQIo8dFcnsRSrUjg33P+u7OzxOEP5rabW5KpSx5z1SfhYh
         hXnqMKbB8ccfGdqp1fbMv68KIKSKQvI8Ptx/rQPzFcsRM15CU4f7FHaUYG/UbYmfRT9O
         H+iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Xtlc+LkCzuTuo3meIsQ17HPFzASqi6VOpNlf4EeLR3w=;
        fh=YTv1lVtgHOmFNA7jUx1E6LnlUUbo4TIBj6I8boLg0aM=;
        b=ysnEv180TtS2HJGB239KipN5n73hFHF6+9+YUoBFG7Kwoo188mYGOejXTygQy5B5hG
         WJ6nqtLX+Etvw4TI5u4yLDq5yTZDFwG5lESlwqP0dHueh8RZt385VCGRihVNzJzMUPBw
         KB0Pc02ew5nz/7fJm+vYUo1oBM6mZwkBa8wDwX9YsCByRexxabQM/8vPvRMOOK0CKez3
         D+GinXAX9ocxpP8Ijmf5OBgd1IL3n5l7wGfn5eefrRNrYT3K+PRaXDbbvDRa9hyGEigo
         Ve8tAgLrEl3XkPTveP5I66dlkwkMdPhRqNdeP+EgSS+4f+Zd1rGPE1sZP7bRgsTe1AQW
         HwYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=msaU+hUo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-846d54efc33si471673241.221.2024.09.02.07.25.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Sep 2024 07:25:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=msaU+hUo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sl7zQ-0000Bs-D6; Mon, 02 Sep 2024 10:25:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1sl7zN-000090-5u; Mon, 02 Sep 2024 10:25:05 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1sl7zJ-0004wc-Oo; Mon, 02 Sep 2024 10:25:04 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-7176645e51bso312336b3a.3; 
 Mon, 02 Sep 2024 07:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725287099; x=1725891899; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Xtlc+LkCzuTuo3meIsQ17HPFzASqi6VOpNlf4EeLR3w=;
 b=msaU+hUoZ4CeJNyD+WXt995PvnIX2MdflE36iJpyyt5SDatXWki4G1c1jK3ehmdhhd
 JaWHyVQ+6CybIvsrOreECI65Xp4IUWkcvyGCyfuj7E+pDMHcOK1WUxyovY2f69Wjw7NW
 c5C3tEREXVo1fkMDScMStMM6HfdWEZIBBz4QSgbp+PklPfen6VkbTh4CDqMt03Xu5pYu
 zB2UeF2/8RwoLeH2C0UUSAHz2akC/yxfdQ2PD03WjuMx/N4LSI5mCdLFKwca33PD84hw
 QqFx2Z3LRhsDnf+SN+KZ+n50jIWWL9vvjf7EnuaGKWu2+chor9nvX7Qi4oe43OmprxaS
 PHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725287099; x=1725891899;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xtlc+LkCzuTuo3meIsQ17HPFzASqi6VOpNlf4EeLR3w=;
 b=HKSkeSanxNiVGiKEBhiDtQ0YovXgYLcel5IFkX3P9qHhq3cWJ4/91OtYt4aPaTx5yi
 IkLV4Ueqwi1D5DA0HF4373aFRj7+0Ec+Q1lD6WVlbioI0KBuuw2be077wOCNubSMgxXd
 pW6QJRwi04ww0/NiHrw1F4m7W1kpXhCn4rCK052FyeEAW5tUNuX/5XsMaZi+WB7hfljo
 frRXW8OClhZSiR0MySoTJf0jHNJEYXto1jXVmA9LwDlljnjM/oZYL2QJl0IvZ/o5d+Ia
 Q7jyFy9PJ/2/1M4oaMil5WLVYgmqPBBEQ0x6HvrtsGWI1l3MpkXzOH7aBf+5MDqHuR/P
 XyBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWPZFuZkinssrhYVK1XIzqTNFpuUeogP6qcz08aFUqNRxFht8pN1ZAyg08QZ6a93yIlYvipT0yLg==@nongnu.org
X-Gm-Message-State: AOJu0YyhKGQ4yqDBS8g6oIek5WWXPvUbB/GHIDiKf4533Sg6wTWuiMfX
 6di9kYU2agjKRnLbLFQwRMULX9KbDGII0I3z6sNeyiRuMpYTHQ08PotMcSEta8Kg4pZhimBdtPB
 h4loc5Ngr8ni4Ac7U9EqdHxhHgSk=
X-Received: by 2002:a05:6a21:1646:b0:1cc:bb86:a406 with SMTP id
 adf61e73a8af0-1cce1003864mr14879516637.2.1725287098628; Mon, 02 Sep 2024
 07:24:58 -0700 (PDT)
MIME-Version: 1.0
References: <CA+1FSiirzpq4wjcKTLSexiOWtv26sgD37h=wA2qxv8Qh5MW_-w@mail.gmail.com>
 <CAFEAcA81xDEubwm7ZYHZWtp_9nZh_gd9o=SZK3WOOm0-9Ja3rQ@mail.gmail.com>
 <CA+1FSiiuThJXkgXOnzuw7U26kXaNuHBrJkmh2EXbtOcH00rKhA@mail.gmail.com>
In-Reply-To: <CA+1FSiiuThJXkgXOnzuw7U26kXaNuHBrJkmh2EXbtOcH00rKhA@mail.gmail.com>
From: Mario Marietto <marietto2008@gmail.com>
Date: Mon, 2 Sep 2024 16:24:22 +0200
Message-ID: <CA+1FSiiaShNE=zwZDC9PSq-v2fLE5NBZgvrqt0mnuTSqdEjAnQ@mail.gmail.com>
Subject: Re: Error : init: partition(s) not found in /sys, waiting for their
 uevent(s): mmcblk0p2, mmcblk0p3 while trying to emulate Android 14 on Ubuntu
 24.04 X64 bit using qemu-system-aarch64.
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-discuss@nongnu.org, qemu-arm <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000a6435c062123b48a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=marietto2008@gmail.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 5SWBxkRztjrh

--000000000000a6435c062123b48a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

qemu-system-aarch64 \
       -smp 4 \
       -m 2048 \
       -cpu cortex-a72 \
       -M virt \
       -device virtio-gpu-pci,xres=3D1024,yres=3D768 \
       -display sdl,gl=3Don \
       -device usb-ehci \
       -device usb-kbd \
       -device virtio-tablet-pci \
       -usb \
       -serial stdio \
       -kernel /mnt/zroot-133/_OS/Android/rpi4/Image \
       -initrd /mnt/zroot-133/_OS/Android/rpi4/ramdisk.img \
       -device sdhci-pci,sd-spec-version=3D3 \
       -drive
if=3Dnone,file=3D/mnt/zroot-133/_OS/Android/rpi4/boot.img,format=3Draw,id=
=3DMMC1 \
       -device sd-card,drive=3DMMC1 \
       -drive
if=3Dnone,file=3D/mnt/zroot-133/_OS/Android/rpi4/system.img,format=3Draw,id=
=3DMMC2
\
       -device sd-card,drive=3DMMC2 \
       -drive
if=3Dnone,file=3D/mnt/zroot-133/_OS/Android/rpi4/vendor.img,format=3Draw,id=
=3DMMC3
\
       -device sd-card,drive=3DMMC3 \
-append "console=3DttyAMA0,38400 drm.debug=3D0x0 rootwait rootdelay=3D5
root=3D/dev/mmcblk0p2 androidboot.hardware=3Drpi4
androidboot.selinux=3Dpermissive security=3Dselinux selinux=3D1
androidboot.qemu.hw.mainkeys=3D0 androidboot.lcd.density=3D160"

=3D same error :

[    1.111482] init: [libfstab] ReadFstabFromDt(): failed to read fstab
from dt
[    1.149319] init: Failed to read vbmeta partitions.
[    2.046632] init: bool
android::init::BlockDevInitializer::InitDevices(std::set<std::string>):
partition(s) not found in /sys, waiting for their uevent(s): mmcblk0p2,
mmcblk0p3

On Mon, Sep 2, 2024 at 4:05=E2=80=AFPM Mario Marietto <marietto2008@gmail.c=
om>
wrote:

> ---> I think it would be better to fix the guest
>
> I have no idea what to do. Please elaborate more.
>
> Tried with these parameters :
>
> -drive if=3Dsd,format=3Draw,file=3D/mnt/zroot-133/_OS/Android/rpi4/boot.i=
mg \
> -drive if=3Dsd,format=3Draw,file=3D/mnt/zroot-133/_OS/Android/rpi4/system=
.img \
> -drive if=3Dsd,format=3Draw,file=3D/mnt/zroot-133/_OS/Android/rpi4/vendor=
.img \
>
> but :
>
> qemu-system-aarch64: -drive
> if=3Dsd,format=3Draw,file=3D/mnt/zroot-133/_OS/Android/rpi4/boot.img: mac=
hine
> type does not support if=3Dsd,bus=3D0,unit=3D0
> qemu-system-aarch64: -drive
> if=3Dsd,format=3Draw,file=3D/mnt/zroot-133/_OS/Android/rpi4/system.img: m=
achine
> type does not support if=3Dsd,bus=3D0,unit=3D1
> qemu-system-aarch64: -drive
> if=3Dsd,format=3Draw,file=3D/mnt/zroot-133/_OS/Android/rpi4/vendor.img: m=
achine
> type does not support if=3Dsd,bus=3D0,unit=3D2
>
>
> On Mon, Sep 2, 2024 at 4:00=E2=80=AFPM Peter Maydell <peter.maydell@linar=
o.org>
> wrote:
>
>> On Mon, 2 Sept 2024 at 14:50, Mario Marietto <marietto2008@gmail.com>
>> wrote:
>>
>> > [ 1.993668] init: bool
>> android::init::BlockDevInitializer::InitDevices(std::set<std::string>):
>> partition(s) not found in /sys, waiting for their uevent(s): mmcblk0p2,
>> mmcblk0p3
>> >
>> >
>> > One user suggested to :
>> >
>> >
>> >
>> >
>> > Hi!!! The "/sys" is a "dynamic fs" created at ram from the kernel, to
>> export a lot of things...so most of the files only exist at runtime.
>> Normally, the partitions from the block device have a symlink at
>> /sys/<something>/<...> that points to /dev/ block node. It seems that th=
ere
>> are no such files under /sys according to what init is looking for. You =
can
>> double check this at init source code to check the exact path but I'm
>> guessing that you'll have to change the qemu arguments regarding the blo=
ck
>> device.
>>
>> The mmcblk* device names are for an SD card.
>>
>> > So,in short I should change the qemu arguments regarding the block
>> device. I tried in this way :
>> >
>> >
>> > qemu-system-aarch64 \
>> >         -smp 4 \
>> >         -m 2048 \
>> >         -cpu cortex-a72 \
>> >         -M virt \
>> >         -device virtio-gpu-pci,xres=3D1024,yres=3D768 \
>> >         -display sdl,gl=3Don \
>> >         -device usb-ehci \
>> >         -device usb-kbd \
>> >         -device virtio-tablet-pci \
>> >         -usb \
>> >         -serial stdio \
>> >         -kernel /mnt/zroot-133/_OS/Android/rpi4/Image \
>> >         -initrd /mnt/zroot-133/_OS/Android/rpi4/ramdisk.img \
>> >         -hda /mnt/zroot-133/_OS/Android/rpi4/boot.img \
>> >         -hdb /mnt/zroot-133/_OS/Android/rpi4/system.img \
>> >         -hdc /mnt/zroot-133/_OS/Android/rpi4/vendor.img \
>> >         -append "console=3DttyAMA0,38400 drm.debug=3D0x0 rootwait
>> rootdelay=3D5 root=3D/dev/mmcblk0p2 androidboot.hardware=3Drpi4
>> androidboot.selinux=3Dpermissive security=3Dselinux selinux=3D1
>> androidboot.qemu.hw.mainkeys=3D0 androidboot.lcd.density=3D160"
>>
>> Your original command line was creating virtio-scsi disks via
>> virtio-blk-pci. This one does the same, just via a different
>> syntax (the default block type for the 'virt' board is IF_VIRTIO).
>>
>> I'm not sure exactly how you would create an SD card for the
>> 'virt' board (probably by using the sdhci-pci device which is
>> a PCI sd controller) but I think it would be better to fix
>> the guest to use the virtio devices and not insist on looking
>> for an SD card -- the performance from an emulated SD card
>> will be a lot worse.
>>
>> thanks
>> -- PMM
>>
>
>
> --
> Mario.
>


--=20
Mario.

--000000000000a6435c062123b48a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span style=3D"font-family:monospace"><span style=3D"=
color:rgb(0,0,0);background-color:rgb(255,255,255)">qemu-system-aarch64 \
</span><br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-smp 4 \
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-m 2048 \
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-cpu cortex-a72 \
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-M virt \
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-device virtio-gpu-pci,xres=
=3D1024,yres=3D768 \
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-display sdl,gl=3Don \
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-device usb-ehci \
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-device usb-kbd \
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-device virtio-tablet-pci \
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-usb \
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-serial stdio \
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-kernel /mnt/zroot-133/_OS/A=
ndroid/rpi4/Image \
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-initrd /mnt/zroot-133/_OS/A=
ndroid/rpi4/ramdisk.img \
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-device sdhci-pci,sd-spec-ve=
rsion=3D3 \
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-drive if=3Dnone,file=3D/mnt=
/zroot-133/_OS/Android/rpi4/boot.img,format=3Draw,id=3DMMC1 \
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-device sd-card,drive=3DMMC1=
 \
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-drive if=3Dnone,file=3D/mnt=
/zroot-133/_OS/Android/rpi4/system.img,format=3Draw,id=3DMMC2 \
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-device sd-card,drive=3DMMC2=
 \
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-drive if=3Dnone,file=3D/mnt=
/zroot-133/_OS/Android/rpi4/vendor.img,format=3Draw,id=3DMMC3 \
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-device sd-card,drive=3DMMC3=
 \
<br></span><span class=3D"gmail-im">-append &quot;console=3DttyAMA0,38400 d=
rm.debug=3D0x0 rootwait=20
rootdelay=3D5 root=3D/dev/mmcblk0p2 androidboot.hardware=3Drpi4=20
androidboot.selinux=3Dpermissive security=3Dselinux selinux=3D1=20
androidboot.qemu.hw.mainkeys=3D0 androidboot.lcd.density=3D160&quot;</span>=
</div><div><span style=3D"font-family:monospace"><span style=3D"color:rgb(0=
,0,0);background-color:rgb(255,255,255)"><br></span></span></div><div><span=
 style=3D"font-family:monospace"><span style=3D"color:rgb(0,0,0);background=
-color:rgb(255,255,255)">=3D same error :<br></span></span></div><div><span=
 style=3D"font-family:monospace"><span style=3D"color:rgb(0,0,0);background=
-color:rgb(255,255,255)"><br></span></span></div><div><span style=3D"font-f=
amily:monospace"><span style=3D"color:rgb(0,0,0);background-color:rgb(255,2=
55,255)">[ =C2=A0=C2=A0=C2=A01.111482] init: [libfstab] ReadFstabFromDt(): =
failed to read fstab from dt
</span></span></div><div><span style=3D"font-family:monospace"></span></div=
><span style=3D"font-family:monospace">[ =C2=A0=C2=A0=C2=A01.149319] init: =
Failed to read vbmeta partitions.
<br>[ =C2=A0=C2=A0=C2=A02.046632] init: bool android::init::BlockDevInitial=
izer::InitDevices(std::set&lt;std::string&gt;): partition(s) not found in /=
sys, waiting for their uevent(s): mmcblk0p2, mmcblk0p3<br></span></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Se=
p 2, 2024 at 4:05=E2=80=AFPM Mario Marietto &lt;<a href=3D"mailto:marietto2=
008@gmail.com">marietto2008@gmail.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>---&gt; I think =
it would be better to fix the guest <br></div><div><br></div><div>I have no=
 idea what to do. Please elaborate more.</div><div><br></div><div>Tried wit=
h these parameters :</div><div><span style=3D"font-family:monospace"><span =
style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)"><br></span></s=
pan></div><div><span style=3D"font-family:monospace"><span style=3D"color:r=
gb(0,0,0);background-color:rgb(255,255,255)">-drive if=3Dsd,format=3Draw,fi=
le=3D/mnt/zroot-133/_OS/Android/rpi4/boot.img \
</span><br>-drive if=3Dsd,format=3Draw,file=3D/mnt/zroot-133/_OS/Android/rp=
i4/system.img \
<br>-drive if=3Dsd,format=3Draw,file=3D/mnt/zroot-133/_OS/Android/rpi4/vend=
or.img \<br>
<br></span></div><div>but :</div><div><br></div><div><span style=3D"font-fa=
mily:monospace"><span style=3D"color:rgb(0,0,0);background-color:rgb(255,25=
5,255)">qemu-system-aarch64: -drive if=3Dsd,format=3Draw,file=3D/mnt/zroot-=
133/_OS/Android/rpi4/boot.img: machine type does not support if=3Dsd,bus=3D=
0,u</span>nit=3D0
<br>qemu-system-aarch64: -drive if=3Dsd,format=3Draw,file=3D/mnt/zroot-133/=
_OS/Android/rpi4/system.img: machine type does not support if=3Dsd,bus=3D0,=
unit=3D1
<br>qemu-system-aarch64: -drive if=3Dsd,format=3Draw,file=3D/mnt/zroot-133/=
_OS/Android/rpi4/vendor.img: machine type does not support if=3Dsd,bus=3D0,=
unit=3D2<br>
<br></span></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Mon, Sep 2, 2024 at 4:00=E2=80=AFPM Peter Maydell &lt;<=
a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank">peter.maydell@=
linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Mon, 2 Sept 2024 at 14:50, Mario Marietto &lt;<a href=3D"mail=
to:marietto2008@gmail.com" target=3D"_blank">marietto2008@gmail.com</a>&gt;=
 wrote:<br>
<br>
&gt; [ 1.993668] init: bool android::init::BlockDevInitializer::InitDevices=
(std::set&lt;std::string&gt;): partition(s) not found in /sys, waiting for =
their uevent(s): mmcblk0p2, mmcblk0p3<br>
&gt;<br>
&gt;<br>
&gt; One user suggested to :<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Hi!!! The &quot;/sys&quot; is a &quot;dynamic fs&quot; created at ram =
from the kernel, to export a lot of things...so most of the files only exis=
t at runtime. Normally, the partitions from the block device have a symlink=
 at /sys/&lt;something&gt;/&lt;...&gt; that points to /dev/ block node. It =
seems that there are no such files under /sys according to what init is loo=
king for. You can double check this at init source code to check the exact =
path but I&#39;m guessing that you&#39;ll have to change the qemu arguments=
 regarding the block device.<br>
<br>
The mmcblk* device names are for an SD card.<br>
<br>
&gt; So,in short I should change the qemu arguments regarding the block dev=
ice. I tried in this way :<br>
&gt;<br>
&gt;<br>
&gt; qemu-system-aarch64 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-smp 4 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-m 2048 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-cpu cortex-a72 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-M virt \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-device virtio-gpu-pci,xres=3D1024,yr=
es=3D768 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-display sdl,gl=3Don \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-device usb-ehci \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-device usb-kbd \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-device virtio-tablet-pci \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-usb \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-serial stdio \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-kernel /mnt/zroot-133/_OS/Android/rp=
i4/Image \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-initrd /mnt/zroot-133/_OS/Android/rp=
i4/ramdisk.img \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-hda /mnt/zroot-133/_OS/Android/rpi4/=
boot.img \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-hdb /mnt/zroot-133/_OS/Android/rpi4/=
system.img \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-hdc /mnt/zroot-133/_OS/Android/rpi4/=
vendor.img \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-append &quot;console=3DttyAMA0,38400=
 drm.debug=3D0x0 rootwait rootdelay=3D5 root=3D/dev/mmcblk0p2 androidboot.h=
ardware=3Drpi4 androidboot.selinux=3Dpermissive security=3Dselinux selinux=
=3D1 androidboot.qemu.hw.mainkeys=3D0 androidboot.lcd.density=3D160&quot;<b=
r>
<br>
Your original command line was creating virtio-scsi disks via<br>
virtio-blk-pci. This one does the same, just via a different<br>
syntax (the default block type for the &#39;virt&#39; board is IF_VIRTIO).<=
br>
<br>
I&#39;m not sure exactly how you would create an SD card for the<br>
&#39;virt&#39; board (probably by using the sdhci-pci device which is<br>
a PCI sd controller) but I think it would be better to fix<br>
the guest to use the virtio devices and not insist on looking<br>
for an SD card -- the performance from an emulated SD card<br>
will be a lot worse.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>

--000000000000a6435c062123b48a--
