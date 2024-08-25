Received: by 2002:a17:505:1116:b0:1be9:327d:8ee3 with SMTP id pu22csp798655njb;
        Sun, 25 Aug 2024 08:59:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWrGPifr1NslMBh1lQ4MVGExQTP/PGQasPFTllGhqKyY59le/8xQqyOQYfE3dkZRtwBJmE5EofYRbvXmQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEw0aSLYfvO8qvLkMGS0WZKKggYSsAoQXfonUrtk/P0RG41QkW8JP7nxHL9GJttmhcoTTph
X-Received: by 2002:ac8:7c54:0:b0:444:d42a:c522 with SMTP id d75a77b69052e-454fae21d4cmr208789911cf.4.1724601586566;
        Sun, 25 Aug 2024 08:59:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724601586; cv=none;
        d=google.com; s=arc-20160816;
        b=qLNcVIjhbeIOIlJIAPEAbXZjlYzTptVi+olK+Vp0Tvaqk7xoDZfokogQP6kuRisLi0
         C1CqRuK+eVMrPxmUTYijLHWkVGr1rmWvG5iX9sSh+9mq3uqzZttJPYrnjRJXxvVrGDHB
         gyilQfNimSQutdfgkU0UdckO5RDZfrTAL5x0nLc8hygKrdfFORIUflvpo5TJB5JB4VqS
         asYXDsmisArwiLAqC+m5VZjAcaTFsSnVDmj4UzctxMvF1U+CA4utnczxS6wOIkkrQFwI
         YKPZtXzNnp/CBUC5vp9P4L92i8i56N3XDd2FxK5mtKYGmxbQ5kEqKAZ7ZLHsN6o4PGQX
         BW7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=puMhn0ToNgx6oy1WPXBdQvt9kVZTvxuJMqdStmZOjvM=;
        fh=1MOpvyTXJlPwDRn86WusbYvOpK7aKmz/8tDY7Rhxb30=;
        b=pNfwCw/tKSkp7iD5DHA3CHhWPI37mtmXeewR8ouxq/3nE4SEblKkH0qEZgRogq5pqC
         5DlZ4oygEcbUBKGKcon+pT03cCO1jUitR/wn64OrV+WA4LyIo28DCKTu6YR14qnnDWr7
         CrF6zkp/vZ94BRmY7tORxnsT/IwBA1hCy4gHOyvlM/pivezGhovPc8+PyqVJADgY3Y6s
         p2b8txshfqWYr2NtMIKhVMaNl6lm6jHa3/CSINyCtTCxcgRZ14hx0Ag5MmwQiNQ0KkNy
         sPchRo50LjbM2YKCjBLP5+bCUVnnrGyhXEAGlOy+zLPOoVsFGItg4vpQ45G05MuwtB/f
         nNog==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=VUqaqPy7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-454fe322706si84968901cf.584.2024.08.25.08.59.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Aug 2024 08:59:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=VUqaqPy7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1siFdy-0004VE-7o; Sun, 25 Aug 2024 11:59:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1siFdw-0004T3-L1; Sun, 25 Aug 2024 11:59:04 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1siFdr-00051F-AH; Sun, 25 Aug 2024 11:59:04 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-2d3b595c18dso3250855a91.0; 
 Sun, 25 Aug 2024 08:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724601537; x=1725206337; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=puMhn0ToNgx6oy1WPXBdQvt9kVZTvxuJMqdStmZOjvM=;
 b=VUqaqPy718Lji0t6bPG1JgPon+Bgr1kiR5NVNf4x48uC8lV8wzzANfZbrwA3l+b0Kt
 MEW0FlGWSxNSIWdlaS5baQcngHlzCDiJGOhthYfHQdnJTkCnJXTUpZFFHxM+xeprRPNq
 XD0vPWfANe4nz7DFaGoFrJQaK8q64Uba75epx3WAwMSl0h+H+LqxHU1/+ve3G4sb0jrI
 K0exQYwSi1YvREIcribEc/YjAkBSXfiMaJnqGB0PK2wrE+rssD8lnNpcnM8IjejvDckw
 6ytrR9DbAUG5erkdeUwbtSA5BH2gsvWTYNpp+S8kpR6ak657/F7DxFTbY7zKCJOuBrH/
 Bd4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724601537; x=1725206337;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=puMhn0ToNgx6oy1WPXBdQvt9kVZTvxuJMqdStmZOjvM=;
 b=oJdjNmVtSS3A7TqxXK5BV8lvFY+ZB84iJDovvNYtp0ONzAQbpqZoLJiLskimu/eYIZ
 0F3TUhrHReA+e5pWFEovKWHw/Lv+8pfdvre+QvivdA4OTmeLKWlZZyCiMNVSog7YfOy+
 dAO+kF4oOOF4/Mev1HzUNfC9AhQJGFMckpNdO1bROLlFFyo4ayGzQmhqMKrba9W9AIJa
 zm3Z+6IgVHu3Ms0rGrtlcZquOsO/FDc4F3eVpFyFs1zMg+jeDvVJmUZgdH78O2wrtr9l
 J/eCotLAc0qy878inurIxsYHfFgjnQmDo1gyn8JakRkBj6omLDPdetM3o2q4bM6bazmE
 tH8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTgORNFB3RngLU14zHEJUejydVucSqzhE83PgLx6OitOWnVb0X2Nv7FgUG9RUAVRHYMAC+mhoLuA==@nongnu.org,
 AJvYcCWxEcxdkGI4jNWQaDa2K3xxyjkpomun4WZAxrCOYJw6NwjnBnIFHTKkMWiRTnMCFO6zv30Y289pn06DFpgx@nongnu.org
X-Gm-Message-State: AOJu0YxmeiDnrrSwViiHtHVckriZrTLrm6qecn/rVeNTiDLCdladUjN4
 G1rIGGlSKLwLZrJRr8+tyAHd0HnINinsMIlE+ZZiNlKU9n+iVfQTpf2qWlVTjyEu6XhHzYKsgGZ
 M/6ccf/0t414TeT/giNtHoqkBS7s=
X-Received: by 2002:a17:90b:3907:b0:2c9:a831:3b7d with SMTP id
 98e67ed59e1d1-2d60a9fd3f2mr19513795a91.18.1724601537069; Sun, 25 Aug 2024
 08:58:57 -0700 (PDT)
MIME-Version: 1.0
References: <CA+1FSiiUFeXRvyCk3KK7XfmUjLzOvBLo=VhcQDiZ1z8kgfpjyw@mail.gmail.com>
 <CAFEAcA8J18z8WubfzLu-DmTp6vGwcy4D652ib-KReqNS0whMVA@mail.gmail.com>
 <CA+1FSiir=RG1BTKF29BKxmO+GWDieyW6TxzWtdEX-CYu7a+z5g@mail.gmail.com>
 <CA+1FSij3LJc9S2ChBY-pHZ8QacFt2P0ygsr9LRK9FXLyMJrorQ@mail.gmail.com>
 <CA+1FSiikkAg=41EYfbfPe08uBHkP_FJ9Y2j6ocqChor_92TWig@mail.gmail.com>
 <CA+1FSijGTTt6YvRss9cDSOP5iOMCDmScpxP9ALJRJ19Vsjr6LA@mail.gmail.com>
 <CAFEAcA_zRSgFhs+kauEfkyzAYg2RwSBrkagDEoj5OCgm5j6=iQ@mail.gmail.com>
 <CA+1FSigzZxzdgTCWNRz3UGgTH5mRN8XTWWkeTU20N2ey4a+i+Q@mail.gmail.com>
 <CA+1FSigqsAx_s+-_eP0GtSi7Qq6Vcou12gHcGZwqPk1hhnXXwg@mail.gmail.com>
 <CA+1FSiiYm03SmjMaR0dLKye7j+LR4V-=u=nQu66=_aTrLVUpPg@mail.gmail.com>
In-Reply-To: <CA+1FSiiYm03SmjMaR0dLKye7j+LR4V-=u=nQu66=_aTrLVUpPg@mail.gmail.com>
From: Mario Marietto <marietto2008@gmail.com>
Date: Sun, 25 Aug 2024 17:58:20 +0200
Message-ID: <CA+1FSigvsXe7eo17_qdKaY0Uo68u7Ep3UacooHZDNCnWJHD4+w@mail.gmail.com>
Subject: Re: Kernel panic - not syncing: Unable to initialise architected
 timer : unable to boot Android 14 with qemu-system-aarch64 on Ubuntu 24.04
 X64 bit
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm <qemu-arm@nongnu.org>,
 "cc: Sergey Kambalin" <sergey.kambalin@auriga.com>, 
 qemu-discuss@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000ff09ed062084156e"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=marietto2008@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, FREEMAIL_REPLY=1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: rO1+roJHrima

--000000000000ff09ed062084156e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ok,I've understood that initrd is ramdisk.img,so :

qemu-system-aarch64 \
        -smp 4 \
        -m 2048 \
        -cpu cortex-a72 \
        -machine virt \
        -initrd
/mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi=
4-atv/boot/ramdisk.img
\
        -kernel
/mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi=
4-atv/boot/Image
\
        -device virtio-gpu-pci,xres=3D1024,yres=3D768 \
        -display sdl,gl=3Don \
        -device usb-ehci \
        -device usb-kbd \
        -device virtio-tablet-pci \
        -usb \
        -serial stdio \
        -drive
index=3D0,if=3Dnone,id=3Dsystem,file=3D/mnt/zroot2/zroot2/OS/Linux/lineage-=
21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/lineage-21.0-20240618-UNOFFICI=
AL-KonstaKANG-rpi4-atv.img,format=3Draw,index=3D0,media=3Ddisk
\
        -append "console=3DttyAMA0,38400 drm.debug=3D0x0 rootwait rootdelay=
=3D5
root=3D/dev/vdd1 rw"

=3D=3D=3D=3D=3D=3D>

[    2.862352] Run /init as init process
[    3.119264] magiskinit: open /proc/bootconfig failed with 2: No such
file or directory
[    4.741230] init: init first stage started!
[    4.754789] init: Unable to open /lib/modules, skipping module loading.
[    4.788159] init: Copied ramdisk prop to
/second_stage_resources/system/etc/ramdisk/build.prop
[    4.804110] init: [libfstab] Using Android DT directory
/proc/device-tree/firmware/android/
[    4.811371] init: [libfstab] ReadFstabFromDt(): failed to read fstab
from dt
[    4.825409] init: [libfstab] ReadDefaultFstab(): failed to find device
default fstab
[    4.828176] init: Failed to create FirstStageMount : failed to read
default fstab for first stage mount
[    4.831564] init: FirstStageMount not available
[    4.890952] init: InitFatalReboot: signal 6
[    5.063207] init:   #00 pc 00000000003b7764  /init
(unwindstack::AndroidLocalUnwinder::InternalUnwind(std::__1::optional<int>,
unwin
dstack::AndroidUnwinderData&)+96) (BuildId:
48bce72d2f0c6e6c34530a67b6b7b3be)
[    5.064741] init:   #01 pc 00000000003ab4b8  /init
(android::init::InitFatalReboot(int)+204) (BuildId:
48bce72d2f0c6e6c34530a67b6b7b
3be)
[    5.066931] init:   #02 pc 00000000003abb48  /init
(android::init::InstallRebootSignalHandlers()::$_0::__invoke(int)+32)
(BuildId: 4
8bce72d2f0c6e6c34530a67b6b7b3be)
[    5.068545] init:   #03 pc 0000000000000854  [vdso]
[    5.069555] init:   #04 pc 000000000035285c  /init (abort+164) (BuildId:
48bce72d2f0c6e6c34530a67b6b7b3be)
[    5.072153] init:   #05 pc 00000000003b029c  /init
(android::init::InitAborter(char const*)+44) (BuildId:
48bce72d2f0c6e6c34530a67b6
b7b3be)
[    5.075216] init:   #06 pc 00000000003131d0  /init
(android::base::SetAborter(std::__1::function<void (char
const*)>&&)::$_0::__invo
ke(char const*)+80) (BuildId: 48bce72d2f0c6e6c34530a67b6b7b3be)
[    5.077609] init:   #07 pc 00000000003128f4  /init
(android::base::LogMessage::~LogMessage()+356) (BuildId:
48bce72d2f0c6e6c34530a67
b6b7b3be)
[    5.079506] init:   #08 pc 00000000003a1ec0  /init
(android::init::FirstStageMain(int, char**)+13140) (BuildId:
48bce72d2f0c6e6c3453
0a67b6b7b3be)
[    5.081404] init:   #09 pc 0000000000350e9c  /init
(__real_libc_init(void*, void (*)(), int (*)(int, char**, char**),
structors_arra
y_t const*, bionic_tcb*)+688) (BuildId: 48bce72d2f0c6e6c34530a67b6b7b3be)
[    5.083648] init: Reboot ending, jumping to kernel
[    5.091556] reboot: Restarting system with command 'bootloader'



On Sun, Aug 25, 2024 at 3:31=E2=80=AFPM Mario Marietto <marietto2008@gmail.=
com>
wrote:

> The file below is called config.txt and it's available only if Android is
> installed physically. I don't see it when I unpack the main img file.
> Probably it is embedded inside the file 0.fat,or 1.img,who knows. Anyway,=
Is
> useful to understand what's the name of the initrd file. Actually I tried
> to use 0.fat,but I think it's wrong. Can you give a look at the file belo=
w
> and tell me if it could be "ramdisk.img" ?
>
> # Kernel
> arm_64bit=3D1
> kernel=3DImage
>
> # Ramdisk
> gpio=3D21=3Dip,pu
> [gpio21=3D1]
> initramfs ramdisk.img followkernel
> [gpio21=3D0]
> initramfs ramdisk-recovery.img followkernel
> [all]
>
> # Audio
> dtparam=3Daudio=3Don
>
> # Audio DAC
> #dtoverlay=3Dallo-boss-dac-pcm512x-audio
> #dtoverlay=3Dallo-piano-dac-pcm512x-audio
> #dtoverlay=3Dallo-piano-dac-plus-pcm512x-audio
> #dtoverlay=3Dhifiberry-dacplus
> #dtoverlay=3Di-sabre-q2m
> #dtoverlay=3Diqaudio-dac
> #dtoverlay=3Djustboom-dac
>
> # Boot device
> dtoverlay=3Dandroid-sdcard
> #dtoverlay=3Dandroid-usb
> #dtoverlay=3Dandroid-nvme
>
> # Camera
> camera_auto_detect=3D1
> start_x=3D1
>
> # CPU
> arm_boost=3D1
> #arm_freq=3D1500
>
> # Display
> disable_overscan=3D1
>
> # Display panel
> [gpio21=3D1]
> #dtoverlay=3Dcutiepi-panel
> #dtoverlay=3Dvc4-kms-dsi-7inch
> #dtoverlay=3Dvc4-kms-dsi-lt070me05000
> #dtoverlay=3Dvc4-kms-dsi-lt070me05000-v2
> [all]
> #dtoverlay=3Drpi-backlight
>
> # Fan
> #dtoverlay=3Dgpio-fan
> #dtoverlay=3Di2c-fan
> #dtoverlay=3Drpi-poe
> #dtoverlay=3Drpi-poe-plus
>
> # Graphics acceleration
> disable_fw_kms_setup=3D1
> [gpio21=3D1]
> dtoverlay=3Dvc4-kms-v3d
> [all]
>
> # I2C
> dtparam=3Di2c_arm=3Don
>
> # I2S
> #dtparam=3Di2s=3Don
>
> # IR
> #dtoverlay=3Dgpio-ir,gpio_pin=3D18
>
> # Keys
> #dtoverlay=3Dgpio-key,gpio=3D21,keycode=3D116,label=3D"POWER"
> #dtoverlay=3Dgpio-key,gpio=3D26,keycode=3D115,label=3D"VOLUME_UP"
> #dtoverlay=3Dgpio-key,gpio=3D20,keycode=3D114,label=3D"VOLUME_DOWN"
>
> # RTC
> dtoverlay=3Di2c-rtc,ds3231
>
> # Sensors
> #dtoverlay=3Dandroid-i2c-sensor,mpu6050
>
> # Serial console
> #enable_uart=3D1
>
> # SPI
> dtparam=3Dspi=3Don
>
> # Touchscreen
>
> #dtoverlay=3Dads7846,cs=3D1,penirq=3D25,penirq_pull=3D2,speed=3D50000,kee=
p_vref_on=3D0,swapxy=3D0,pmax=3D255,xohms=3D150,xmin=3D200,xmax=3D3900,ymin=
=3D200,ymax=3D3900
> #dtoverlay=3Dedt-ft5406
> #dtoverlay=3Dgoodix
> #dtoverlay=3Drpi-ft5406
>
> # USB
> dtoverlay=3Ddwc2,dr_mode=3Dperipheral
> [cm4]
> dtoverlay=3Ddwc2,dr_mode=3Dotg
> [all]
>
> include config_user.txt
>
> On Sun, Aug 25, 2024 at 2:44=E2=80=AFPM Mario Marietto <marietto2008@gmai=
l.com>
> wrote:
>
>> Appending the root device does not change the scenario :
>>
>> qemu-system-aarch64 \
>>         -smp 4 \
>>         -m 2048 \
>>         -cpu cortex-a72 \
>>         -machine virt \
>>         -serial stdio \
>>         -initrd
>> /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-=
rpi4-atv/0.fat
>> \
>>         -kernel
>> /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-=
rpi4-atv/boot/Image
>> \
>>         -append "console=3DttyAMA0,38400 drm.debug=3D0x0 rootwait rootde=
lay=3D5
>> root=3D/dev/vdd1 rw"
>>
>>
>> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd083]
>> [    0.000000] Linux version 6.6.36-g01aac93821d2-v8 (kleaf@build-host)
>> (Android (11368308, +pgo, +bolt, +lto, +mlgo, based on r510928)
>> clang version 18.0.0 (
>> https://android.googlesource.com/toolchain/llvm-project
>> 477610d4d0d988e69dbc3fae4fe86bff3f07f2b5), LLD 18.0.0) #
>> 1 SMP PREEMPT Tue Jul  2 09:02:32 UTC 2024
>> [    0.000000] KASLR enabled
>> [    0.000000] random: crng init done
>> [    0.000000] Machine model: linux,dummy-virt
>> [    0.000000] efi: UEFI not found.
>> [    0.000000] Zone ranges:
>> [    0.000000]   DMA      [mem 0x0000000040000000-0x00000000bfffffff]
>> [    0.000000]   DMA32    empty
>> [    0.000000]   Normal   empty
>> [    0.000000] Movable zone start for each node
>> [    0.000000] NoSplit zone start for each node
>> [    0.000000] NoMerge zone start for each node
>> [    0.000000] Early memory node ranges
>> [    0.000000]   node   0: [mem 0x0000000040000000-0x00000000bfffffff]
>> [    0.000000] Initmem setup node 0 [mem
>> 0x0000000040000000-0x00000000bfffffff]
>> [    0.000000] cma: Reserved 8 MiB at 0x00000000bd000000 on node -1
>> [    0.000000] psci: probing for conduit method from DT.
>> [    0.000000] psci: PSCIv1.1 detected in firmware.
>> [    0.000000] psci: Using standard PSCI v0.2 function IDs
>> [    0.000000] psci: Trusted OS migration not required
>> [    0.000000] psci: SMC Calling Convention v1.0
>> [    0.000000] percpu: Embedded 31 pages/cpu s87016 r8192 d31768 u126976
>> [    0.000000] Detected PIPT I-cache on CPU0
>> [    0.000000] CPU features: detected: Spectre-v2
>> [    0.000000] CPU features: detected: Spectre-v3a
>> [    0.000000] CPU features: detected: Spectre-v4
>> [    0.000000] CPU features: detected: Spectre-BHB
>> [    0.000000] CPU features: kernel page table isolation forced ON by
>> KASLR
>> [    0.000000] CPU features: detected: Kernel page table isolation (KPTI=
)
>> [    0.000000] CPU features: detected: ARM erratum 1742098
>> [    0.000000] CPU features: detected: ARM errata 1165522, 1319367, or
>> 1530923
>> [    0.000000] alternatives: applying boot alternatives
>> [    0.000000] Kernel command line: console=3DttyAMA0,38400 drm.debug=3D=
0x0
>> rootwait rootdelay=3D5 root=3D/dev/vdd1 rw androidboot.serialno=3D100
>> 00000abcd1234 androidboot.btmacaddr=3D11:22:33:44:55:66
>> [    0.000000] Dentry cache hash table entries: 262144 (order: 9, 209715=
2
>> bytes, linear)
>> [    0.000000] Inode-cache hash table entries: 131072 (order: 8, 1048576
>> bytes, linear)
>> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages:
>> 516096
>> [    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap
>> free:off
>> [    0.000000] Memory: 1881596K/2097152K available (19328K kernel code,
>> 2374K rwdata, 7612K rodata, 1792K init, 1192K bss, 207364K rese
>> rved, 8192K cma-reserved)
>> [    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D4=
, Nodes=3D1
>> [    0.000000] ftrace: allocating 56269 entries in 220 pages
>> [    0.000000] ftrace: allocated 220 pages with 5 groups
>> [    0.000000] trace event string verifier disabled
>> [    0.000000] rcu: Preemptible hierarchical RCU implementation.
>> [    0.000000] rcu:     RCU event tracing is enabled.
>> [    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=3D256 to
>> nr_cpu_ids=3D4.
>> [    0.000000]  Trampoline variant of Tasks RCU enabled.
>> [    0.000000]  Rude variant of Tasks RCU enabled.
>> [    0.000000]  Tracing variant of Tasks RCU enabled.
>> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay i=
s
>> 25 jiffies.
>> [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16,
>> nr_cpu_ids=3D4
>> [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
>> [    0.000000] Root IRQ handler: gic_handle_irq
>> [    0.000000] GICv2m: range[mem 0x08020000-0x08020fff], SPI[80:143]
>> [    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on
>> contention.
>> [    0.000000] arch_timer: cp15 timer(s) running at 62.50MHz (virt).
>> [    0.000000] clocksource: arch_sys_counter: mask: 0x1ffffffffffffff
>> max_cycles: 0x1cd42e208c, max_idle_ns: 881590405314 ns
>> [    0.000069] sched_clock: 57 bits at 63MHz, resolution 16ns, wraps
>> every 4398046511096ns
>> [    0.003628] kfence: initialized - using 2097152 bytes for 255 objects
>> at 0x(____ptrval____)-0x(____ptrval____)
>> [    0.010906] Calibrating delay loop (skipped), value calculated using
>> timer frequency.. 125.00 BogoMIPS (lpj=3D250000)
>> [    0.011082] pid_max: default: 32768 minimum: 301
>> [    0.013020] LSM: initializing lsm=3Dcapability,selinux,integrity
>> [    0.013436] SELinux:  Initializing.
>> [    0.016921] Mount-cache hash table entries: 4096 (order: 3, 32768
>> bytes, linear)
>> [    0.016984] Mountpoint-cache hash table entries: 4096 (order: 3, 3276=
8
>> bytes, linear)
>> [    0.031469] cgroup: Disabling memory control group subsystem
>> [    0.050059] cacheinfo: Unable to detect cache hierarchy for CPU 0
>> [    0.059978] RCU Tasks: Setting shift to 2 and lim to 1
>> rcu_task_cb_adjust=3D1.
>> [    0.060584] RCU Tasks Rude: Setting shift to 2 and lim to 1
>> rcu_task_cb_adjust=3D1.
>> [    0.060822] RCU Tasks Trace: Setting shift to 2 and lim to 1
>> rcu_task_cb_adjust=3D1.
>> [    0.062427] rcu: Hierarchical SRCU implementation.
>> [    0.062463] rcu:     Max phase no-delay instances is 1000.
>> [    0.068568] EFI services will not be available.
>> [    0.071086] smp: Bringing up secondary CPUs ...
>> [    0.074801] Detected PIPT I-cache on CPU1
>> [    0.075909] CPU1: Booted secondary processor 0x0000000001 [0x410fd083=
]
>> [    0.081065] Detected PIPT I-cache on CPU2
>> [    0.081470] CPU2: Booted secondary processor 0x0000000002 [0x410fd083=
]
>> [    0.083873] Detected PIPT I-cache on CPU3
>> [    0.084168] CPU3: Booted secondary processor 0x0000000003 [0x410fd083=
]
>> [    0.084681] smp: Brought up 1 node, 4 CPUs
>> [    0.084715] SMP: Total of 4 processors activated.
>> [    0.084800] CPU features: detected: 32-bit EL0 Support
>> [    0.084824] CPU features: detected: 32-bit EL1 Support
>> [    0.084885] CPU features: detected: CRC32 instructions
>> [    0.088191] CPU features: emulated: Privileged Access Never (PAN)
>> using TTBR0_EL1 switching
>> [    0.088512] CPU: All CPU(s) started at EL1
>> [    0.088714] alternatives: applying system-wide alternatives
>> [    0.113756] devtmpfs: initialized
>> [    0.126262] Enabled cp15_barrier support
>> [    0.126449] Enabled setend support
>> [    0.127708] clocksource: jiffies: mask: 0xffffffff max_cycles:
>> 0xffffffff, max_idle_ns: 7645041785100000 ns
>> [    0.127840] futex hash table entries: 1024 (order: 4, 65536 bytes,
>> linear)
>> [    0.131302] pinctrl core: initialized pinctrl subsystem
>> [    0.138216] DMI not present or invalid.
>> [    0.147664] NET: Registered PF_NETLINK/PF_ROUTE protocol family
>> [    0.158502] DMA: preallocated 256 KiB GFP_KERNEL pool for atomic
>> allocations
>> [    0.158987] DMA: preallocated 256 KiB GFP_KERNEL|GFP_DMA pool for
>> atomic allocations
>> [    0.159303] audit: initializing netlink subsys (disabled)
>> [    0.161302] audit: type=3D2000 audit(0.148:1): state=3Dinitialized
>> audit_enabled=3D0 res=3D1
>> [    0.164412] thermal_sys: Registered thermal governor 'step_wise'
>> [    0.164806] cpuidle: using governor menu
>> [    0.165816] hw-breakpoint: found 6 breakpoint and 4 watchpoint
>> registers.
>> [    0.166975] ASID allocator initialised with 32768 entries
>> [    0.168385] Serial: AMBA PL011 UART driver
>> [    0.196712] 9000000.pl011: ttyAMA0 at MMIO 0x9000000 (irq =3D 13,
>> base_baud =3D 0) is a PL011 rev1
>> [    0.198278] printk: console [ttyAMA0] enabled
>> [    0.224278] Modules: 2G module region forced by
>> RANDOMIZE_MODULE_REGION_FULL
>> [    0.224486] Modules: 0 pages in range for non-PLT usage
>> [    0.224510] Modules: 516176 pages in range for PLT usage
>> [    0.241442] iommu: Default domain type: Translated
>> [    0.241679] iommu: DMA domain TLB invalidation policy: strict mode
>> [    0.244200] SCSI subsystem initialized
>> [    0.245459] usbcore: registered new interface driver usbfs
>> [    0.245841] usbcore: registered new interface driver hub
>> [    0.246154] usbcore: registered new device driver usb
>> [    0.247257] mc: Linux media interface: v0.10
>> [    0.247617] videodev: Linux video capture interface: v2.00
>> [    0.248602] pps_core: LinuxPPS API ver. 1 registered
>> [    0.248700] pps_core: Software ver. 5.3.6 - Copyright 2005-2007
>> Rodolfo Giometti <giometti@linux.it>
>> [    0.248967] PTP clock support registered
>> [    0.251884] Advanced Linux Sound Architecture Driver Initialized.
>> [    0.262663] Bluetooth: Core ver 2.22
>> [    0.262960] NET: Registered PF_BLUETOOTH protocol family
>> [    0.263069] Bluetooth: HCI device and connection manager initialized
>> [    0.263344] Bluetooth: HCI socket layer initialized
>> [    0.263516] Bluetooth: L2CAP socket layer initialized
>> [    0.263840] Bluetooth: SCO socket layer initialized
>> [    0.266790] vgaarb: loaded
>> [    0.268841] clocksource: Switched to clocksource arch_sys_counter
>> [    0.272056] VFS: Disk quotas dquot_6.6.0
>> [    0.272284] VFS: Dquot-cache hash table entries: 512 (order 0, 4096
>> bytes)
>> [    0.273060] FS-Cache: Loaded
>> [    0.278526] CacheFiles: Loaded
>> [    0.287007] NET: Registered PF_INET protocol family
>> [    0.288390] IP idents hash table entries: 32768 (order: 6, 262144
>> bytes, linear)
>> [    0.297021] tcp_listen_portaddr_hash hash table entries: 1024 (order:
>> 2, 16384 bytes, linear)
>> [    0.297273] Table-perturb hash table entries: 65536 (order: 6, 262144
>> bytes, linear)
>> [    0.297485] TCP established hash table entries: 16384 (order: 5,
>> 131072 bytes, linear)
>> [    0.298036] TCP bind hash table entries: 16384 (order: 7, 524288
>> bytes, linear)
>> [    0.298873] TCP: Hash tables configured (established 16384 bind 16384=
)
>> [    0.301283] MPTCP token hash table entries: 2048 (order: 3, 49152
>> bytes, linear)
>> [    0.301759] UDP hash table entries: 1024 (order: 3, 32768 bytes,
>> linear)
>> [    0.302186] UDP-Lite hash table entries: 1024 (order: 3, 32768 bytes,
>> linear)
>> [    0.304009] NET: Registered PF_UNIX/PF_LOCAL protocol family
>> [    0.306868] PCI: CLS 0 bytes, default 64
>> [    0.312145] Trying to unpack rootfs image as initramfs...
>> [    0.312808] kvm [1]: HYP mode not available
>> [    0.318856] rootfs image is not initramfs (invalid magic at start of
>> compressed archive); looks like an initrd
>> [    0.335544] Initialise system trusted keyrings
>> [    0.338430] workingset: timestamp_bits=3D46 max_order=3D19 bucket_ord=
er=3D0
>> [    0.339134] zbud: loaded
>> [    0.347742] Key type cifs.idmap registered
>> [    0.348673] fuse: init (API version 7.39)
>> [    0.386722] Key type asymmetric registered
>> [    0.386992] Asymmetric key parser 'x509' registered
>> [    0.387460] Block layer SCSI generic (bsg) driver version 0.4 loaded
>> (major 244)
>> [    0.388796] io scheduler mq-deadline registered
>> [    0.388954] io scheduler kyber registered
>> [    0.389319] io scheduler bfq registered
>> [    0.406358] vc-mem: phys_addr:0x00000000 mem_base=3D0x00000000
>> mem_size:0x00000000(0 MiB)
>> [    0.476330] brd: module loaded
>> [    0.508286] loop: module loaded
>> [    0.512092] Loading iSCSI transport class v2.0-870.
>> [    0.522449] wireguard: WireGuard 1.0.0 loaded. See www.wireguard.com
>> for information.
>> [    0.522729] wireguard: Copyright (C) 2015-2019 Jason A. Donenfeld <
>> Jason@zx2c4.com>. All Rights Reserved.
>> [    0.538429] tun: Universal TUN/TAP device driver, 1.6
>> [    0.541953] usbcore: registered new interface driver brcmfmac
>> [    0.542290] usbcore: registered new device driver r8152-cfgselector
>> [    0.542675] usbcore: registered new interface driver r8152
>> [    0.542971] usbcore: registered new interface driver lan78xx
>> [    0.543488] usbcore: registered new interface driver asix
>> [    0.543810] usbcore: registered new interface driver ax88179_178a
>> [    0.544134] usbcore: registered new interface driver cdc_ether
>> [    0.544609] usbcore: registered new interface driver smsc95xx
>> [    0.544909] usbcore: registered new interface driver net1080
>> [    0.545240] usbcore: registered new interface driver cdc_subset
>> [    0.545596] usbcore: registered new interface driver zaurus
>> [    0.545896] usbcore: registered new interface driver cdc_ncm
>> [    0.546192] usbcore: registered new interface driver r8153_ecm
>> [    0.547442] dwc_otg: version 3.00a 10-AUG-2012 (platform bus)
>> [    0.550591] usbcore: registered new interface driver cdc_acm
>> [    0.550756] cdc_acm: USB Abstract Control Model driver for USB modems
>> and ISDN adapters
>> [    0.551948] usbcore: registered new interface driver uas
>> [    0.552352] usbcore: registered new interface driver usb-storage
>> [    0.566050] usbcore: registered new interface driver cp210x
>> [    0.566791] usbserial: USB Serial support registered for cp210x
>> [    0.567318] usbcore: registered new interface driver pl2303
>> [    0.567653] usbserial: USB Serial support registered for pl2303
>> [    0.573531] mousedev: PS/2 mouse device common for all mice
>> [    0.573930] usbcore: registered new interface driver xpad
>> [    0.574228] usbcore: registered new interface driver usb_acecad
>> [    0.574588] usbcore: registered new interface driver aiptek
>> [    0.574937] usbcore: registered new interface driver hanwang
>> [    0.575292] usbcore: registered new interface driver kbtab
>> [    0.577388] usbcore: registered new interface driver usbtouchscreen
>> [    0.580179] i2c_dev: i2c /dev entries driver
>> [    0.584010] ir_imon_decoder: IR iMON protocol handler initialized
>> [    0.584179] IR JVC protocol handler initialized
>> [    0.584296] IR MCE Keyboard/mouse protocol handler initialized
>> [    0.584435] IR NEC protocol handler initialized
>> [    0.584734] IR RC5(x/sz) protocol handler initialized
>> [    0.584863] IR RC6 protocol handler initialized
>> [    0.584991] IR RCMM protocol handler initialized
>> [    0.585111] IR SANYO protocol handler initialized
>> [    0.585226] IR Sharp protocol handler initialized
>> [    0.585358] IR Sony protocol handler initialized
>> [    0.585477] IR XMP protocol handler initialized
>> [    0.586421] usbcore: registered new interface driver uvcvideo
>> [    0.589015] device-mapper: uevent: version 1.0.3
>> [    0.590448] device-mapper: ioctl: 4.48.0-ioctl (2023-03-01)
>> initialised: dm-devel@redhat.com
>> [    0.591924] Bluetooth: HCI UART driver ver 2.3
>> [    0.592106] Bluetooth: HCI UART protocol H4 registered
>> [    0.592885] Bluetooth: HCI UART protocol Broadcom registered
>> [    0.594293] sdhci: Secure Digital Host Controller Interface driver
>> [    0.594442] sdhci: Copyright(c) Pierre Ossman
>> [    0.594948] sdhci-pltfm: SDHCI platform and OF driver helper
>> [    0.596987] ledtrig-cpu: registered to indicate activity on CPUs
>> [    0.599350] hid: raw HID events driver (C) Jiri Kosina
>> [    0.612270] usbcore: registered new interface driver usbhid
>> [    0.612441] usbhid: USB HID core driver
>> [    0.615743] ashmem: initialized
>> [    0.617297] SPI driver st-accel-spi has no spi_device_id for
>> st,lis302dl-spi
>> [    0.617473] SPI driver st-accel-spi has no spi_device_id for
>> st,lis3lv02dl-accel
>> [    0.617626] SPI driver st-accel-spi has no spi_device_id for
>> st,lis3dh-accel
>> [    0.617769] SPI driver st-accel-spi has no spi_device_id for
>> st,lsm330d-accel
>> [    0.617919] SPI driver st-accel-spi has no spi_device_id for
>> st,lsm330dl-accel
>> [    0.618062] SPI driver st-accel-spi has no spi_device_id for
>> st,lsm330dlc-accel
>> [    0.618206] SPI driver st-accel-spi has no spi_device_id for
>> st,lis331dlh-accel
>> [    0.618357] SPI driver st-accel-spi has no spi_device_id for
>> st,lsm330-accel
>> [    0.618493] SPI driver st-accel-spi has no spi_device_id for
>> st,lsm303agr-accel
>> [    0.618638] SPI driver st-accel-spi has no spi_device_id for
>> st,lis2dh12-accel
>> [    0.618775] SPI driver st-accel-spi has no spi_device_id for
>> st,lng2dm-accel
>> [    0.618911] SPI driver st-accel-spi has no spi_device_id for
>> st,h3lis331dl-accel
>> [    0.619056] SPI driver st-accel-spi has no spi_device_id for
>> st,lis331dl-accel
>> [    0.619209] SPI driver st-accel-spi has no spi_device_id for
>> st,lsm303c-accel
>> [    0.620207] SPI driver st-magn-spi has no spi_device_id for
>> st,lis3mdl-magn
>> [    0.620355] SPI driver st-magn-spi has no spi_device_id for
>> st,lsm303agr-magn
>> [    0.620510] SPI driver st-magn-spi has no spi_device_id for
>> st,lsm9ds1-magn
>> [    0.620768] SPI driver st-magn-spi has no spi_device_id for
>> st,lsm303c-magn
>> [    0.626130] hw perfevents: enabled with armv8_pmuv3 PMU driver, 7
>> counters available
>> [    0.630320] usbcore: registered new interface driver snd-usb-audio
>> [    0.638439] Mirror/redirect action on
>> [    0.639343] netem: version 1.3
>> [    0.639435] u32 classifier
>> [    0.639508]     input device check on
>> [    0.639602]     Actions configured
>> [    0.648469] xt_time: kernel timezone is -0000
>> [    0.649096] gre: GRE over IPv4 demultiplexor driver
>> [    0.649255] IPv4 over IPsec tunneling driver
>> [    0.654843] Initializing XFRM netlink socket
>> [    0.655213] IPsec XFRM device driver
>> [    0.676037] NET: Registered PF_INET6 protocol family
>> [    0.687646] Segment Routing with IPv6
>> [    0.687964] In-situ OAM (IOAM) with IPv6
>> [    0.689074] mip6: Mobile IPv6
>> [    0.693823] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
>> [    0.699298] NET: Registered PF_PACKET protocol family
>> [    0.699567] NET: Registered PF_KEY protocol family
>> [    0.699819] Key type dns_resolver registered
>> [    0.798005] Freeing initrd memory: 131072K
>> [    0.806166] registered taskstats version 1
>> [    0.807819] Loading compiled-in X.509 certificates
>> [    0.834497] Key type .fscrypt registered
>> [    0.834641] Key type fscrypt-provisioning registered
>> [    0.841634] of_cfs_init
>> [    0.842079] of_cfs_init: OK
>> [    0.845830] cfg80211: Loading compiled-in X.509 certificates for
>> regulatory database
>> [    0.876283] Loaded X.509 cert 'benh@debian.org:
>> 577e021cb980e0e820821ba7b54b4961b8b4fadf'
>> [    0.877632] Loaded X.509 cert 'romain.perier@gmail.com:
>> 3abbc6ec146e09d1b6016ab9d6cf71dd233f0328'
>> [    0.878441] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
>> [    0.879187] Loaded X.509 cert 'wens:
>> 61c038651aabdcf94bd0ac7ff06c7248db18c600'
>> [    0.885017] clk: Disabling unused clocks
>> [    0.885499] ALSA device list:
>> [    0.885646]   No soundcards found.
>> [    0.894059] uart-pl011 9000000.pl011: no DMA platform data
>> [    0.895672] Waiting 5 sec before mounting root device...
>> [    6.132758] RAMDISK: Couldn't find valid RAM disk image starting at 0=
.
>> [    6.133865] Waiting for root device /dev/vdd1...
>> [   10.994096] platform gpio-keys: deferred probe pending
>>
>>
>>
>> On Sun, Aug 25, 2024 at 2:30=E2=80=AFPM Mario Marietto <marietto2008@gma=
il.com>
>> wrote:
>>
>>> When I unpack this file :
>>>
>>> lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv.img
>>>
>>> I get these files :
>>>
>>> 0.fat
>>> 1.img
>>> 2.img
>>> 3.img
>>>
>>> So,I assume that :
>>>
>>> 0.fat is : initrd
>>> 1.img is : system-rw.img
>>> 2.img is   :  vendor-rw.img
>>> 3.img is   :  userdata.img
>>>
>>> If I use 0.fat as initrd,like this :
>>>
>>> -initrd
>>> /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG=
-rpi4-atv/0.fat
>>>
>>> I get this message :
>>>
>>> rootfs image is not initramfs (invalid magic at start of compressed
>>> archive); looks like an initrd
>>>
>>> it looks like an initrd : right,it's true : it is initrd. (for this
>>> reason I've assumed that 0.fat is initrd...
>>>
>>>
>>> On Sun, Aug 25, 2024 at 1:26=E2=80=AFPM Peter Maydell <peter.maydell@li=
naro.org>
>>> wrote:
>>>
>>>> On Sun, 25 Aug 2024 at 11:45, Mario Marietto <marietto2008@gmail.com>
>>>> wrote:
>>>> >
>>>> > Please look at this example :
>>>> >
>>>> > qemu-system-aarch64 \
>>>> > -smp 4 \
>>>> > -m 2048 \
>>>> > -cpu cortex-a72 \
>>>> > -machine virt \
>>>> > -serial stdio \
>>>> > -kernel
>>>> /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKAN=
G-rpi4-atv/boot/Image
>>>> \
>>>>
>>>> This (assuming it's the complete command line your script is
>>>> running) doesn't pass any arguments telling QEMU to provide a
>>>> root disk, and it doesn't pass any arguments to the kernel
>>>> telling it what root disk to use...
>>>>
>>>> > [    0.000000] Kernel command line: console=3DttyAMA0,115200
>>>> kgdboc=3DttyAMA0,115200 root=3D/dev/mmcblk0p2 rootfstype=3Dext4 rootwa=
it
>>>> androidboot.serialno=3D10000000abcd1234
>>>> androidboot.btmacaddr=3D11:22:33:44:55:66
>>>>
>>>> ...so the kernel defaults to "/dev/mmcblk0p2" as its root disk because
>>>> it's using the command line argument that was compiled into it...
>>>>
>>>> > [    0.658240] Waiting for root device /dev/mmcblk0p2...
>>>>
>>>> ...and then it's hanging around forever waiting for that.
>>>>
>>>> You need to:
>>>>  (1) pass QEMU arguments telling it to provide a root fs
>>>>  (2) pass the kernel arguments telling it to look for the
>>>>      root fs in the place where QEMU is providing it
>>>>
>>>> Your other command line looks more on the right lines:
>>>>
>>>>         -kernel
>>>>
>>>> /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKAN=
G-rpi4-atv/boot/Image
>>>> \
>>>>         -initrd
>>>>
>>>> /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKAN=
G-rpi4-atv/0.fat
>>>> \
>>>>         -drive
>>>> index=3D0,if=3Dnone,id=3Dsystem,file=3D/mnt/zroot2/zroot2/OS/Linux/lin=
eage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/1.img
>>>> \
>>>>         -device virtio-blk-pci,drive=3Dsystem \
>>>>         -drive
>>>> index=3D1,if=3Dnone,id=3Dvendor,file=3D/mnt/zroot2/zroot2/OS/Linux/lin=
eage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/2.img
>>>> \
>>>>         -device virtio-blk-pci,drive=3Dvendor \
>>>>         -drive
>>>> index=3D2,if=3Dnone,id=3Duserdata,file=3D/mnt/zroot2/zroot2/OS/Linux/l=
ineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/3.img
>>>> \
>>>>         -device virtio-blk-pci,drive=3Duserdata \
>>>>
>>>> though I wonder if the kernel really expects a
>>>> FAT file for the initrd, given it complains:
>>>>
>>>> [    0.344033] Trying to unpack rootfs image as initramfs...
>>>> [    0.344947] rootfs image is not initramfs (invalid magic at start
>>>> of compressed archive); looks like an initrd
>>>>
>>>> and then later
>>>>
>>>> [    5.905329] RAMDISK: Couldn't find valid RAM disk image starting at
>>>> 0.
>>>>
>>>> I think if I were you I'd start by figuring out what's going on
>>>> with the initrd.
>>>>
>>>> thanks
>>>> -- PMM
>>>>
>>>
>>>
>>> --
>>> Mario.
>>>
>>
>>
>> --
>> Mario.
>>
>
>
> --
> Mario.
>


--=20
Mario.

--000000000000ff09ed062084156e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>ok,I&#39;ve understood that initrd is ramdisk.img,so =
: <br></div><div><br></div><div>qemu-system-aarch64 \<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 -smp 4 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -m 2048 \<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 -cpu cortex-a72 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -machine=
 virt \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -initrd /mnt/zroot2/zroot2/OS/Linux/=
lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/boot/ramdisk.img \<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -kernel /mnt/zroot2/zroot2/OS/Linux/lineage-21.=
0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/boot/Image \<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 -device virtio-gpu-pci,xres=3D1024,yres=3D768 \<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 -display sdl,gl=3Don \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -devic=
e usb-ehci \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device usb-kbd \<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 -device virtio-tablet-pci \<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 -usb \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -serial stdio \<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 -drive index=3D0,if=3Dnone,id=3Dsystem,file=3D/mnt/zroot2/zro=
ot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/lineage-2=
1.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv.img,format=3Draw,index=3D0,medi=
a=3Ddisk \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -append &quot;console=3DttyAMA0,3=
8400 drm.debug=3D0x0 rootwait rootdelay=3D5 root=3D/dev/vdd1 rw&quot;</div>=
<div><br></div><div>=3D=3D=3D=3D=3D=3D&gt;<br></div><div><span style=3D"fon=
t-family:monospace"><span style=3D"color:rgb(0,0,0);background-color:rgb(25=
5,255,255)"><br></span></span></div><div><span style=3D"font-family:monospa=
ce"><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">[ =
=C2=A0=C2=A0=C2=A02.862352] Run /init as init process
</span></span></div><div><span style=3D"font-family:monospace"></span></div=
><span style=3D"font-family:monospace">[ =C2=A0=C2=A0=C2=A03.119264] magisk=
init: open /proc/bootconfig failed with 2: No such file or directory
<br>[ =C2=A0=C2=A0=C2=A04.741230] init: init first stage started!
<br>[ =C2=A0=C2=A0=C2=A04.754789] init: Unable to open /lib/modules, skippi=
ng module loading.
<br>[ =C2=A0=C2=A0=C2=A04.788159] init: Copied ramdisk prop to /second_stag=
e_resources/system/etc/ramdisk/build.prop
<br>[ =C2=A0=C2=A0=C2=A04.804110] init: [libfstab] Using Android DT directo=
ry /proc/device-tree/firmware/android/
<br>[ =C2=A0=C2=A0=C2=A04.811371] init: [libfstab] ReadFstabFromDt(): faile=
d to read fstab from dt
<br>[ =C2=A0=C2=A0=C2=A04.825409] init: [libfstab] ReadDefaultFstab(): fail=
ed to find device default fstab
<br>[ =C2=A0=C2=A0=C2=A04.828176] init: Failed to create FirstStageMount : =
failed to read default fstab for first stage mount
<br>[ =C2=A0=C2=A0=C2=A04.831564] init: FirstStageMount not available
<br>[ =C2=A0=C2=A0=C2=A04.890952] init: InitFatalReboot: signal 6
<br>[ =C2=A0=C2=A0=C2=A05.063207] init: =C2=A0=C2=A0#00 pc 00000000003b7764=
 =C2=A0/init (unwindstack::AndroidLocalUnwinder::InternalUnwind(std::__1::o=
ptional&lt;int&gt;, unwin<br>dstack::AndroidUnwinderData&amp;)+96) (BuildId=
: 48bce72d2f0c6e6c34530a67b6b7b3be)
<br>[ =C2=A0=C2=A0=C2=A05.064741] init: =C2=A0=C2=A0#01 pc 00000000003ab4b8=
 =C2=A0/init (android::init::InitFatalReboot(int)+204) (BuildId: 48bce72d2f=
0c6e6c34530a67b6b7b<br>3be)
<br>[ =C2=A0=C2=A0=C2=A05.066931] init: =C2=A0=C2=A0#02 pc 00000000003abb48=
 =C2=A0/init (android::init::InstallRebootSignalHandlers()::$_0::__invoke(i=
nt)+32) (BuildId: 4<br>8bce72d2f0c6e6c34530a67b6b7b3be)
<br>[ =C2=A0=C2=A0=C2=A05.068545] init: =C2=A0=C2=A0#03 pc 0000000000000854=
 =C2=A0[vdso]
<br>[ =C2=A0=C2=A0=C2=A05.069555] init: =C2=A0=C2=A0#04 pc 000000000035285c=
 =C2=A0/init (abort+164) (BuildId: 48bce72d2f0c6e6c34530a67b6b7b3be)
<br>[ =C2=A0=C2=A0=C2=A05.072153] init: =C2=A0=C2=A0#05 pc 00000000003b029c=
 =C2=A0/init (android::init::InitAborter(char const*)+44) (BuildId: 48bce72=
d2f0c6e6c34530a67b6<br>b7b3be)
<br>[ =C2=A0=C2=A0=C2=A05.075216] init: =C2=A0=C2=A0#06 pc 00000000003131d0=
 =C2=A0/init (android::base::SetAborter(std::__1::function&lt;void (char co=
nst*)&gt;&amp;&amp;)::$_0::__invo<br>ke(char const*)+80) (BuildId: 48bce72d=
2f0c6e6c34530a67b6b7b3be)
<br>[ =C2=A0=C2=A0=C2=A05.077609] init: =C2=A0=C2=A0#07 pc 00000000003128f4=
 =C2=A0/init (android::base::LogMessage::~LogMessage()+356) (BuildId: 48bce=
72d2f0c6e6c34530a67<br>b6b7b3be)
<br>[ =C2=A0=C2=A0=C2=A05.079506] init: =C2=A0=C2=A0#08 pc 00000000003a1ec0=
 =C2=A0/init (android::init::FirstStageMain(int, char**)+13140) (BuildId: 4=
8bce72d2f0c6e6c3453<br>0a67b6b7b3be)
<br>[ =C2=A0=C2=A0=C2=A05.081404] init: =C2=A0=C2=A0#09 pc 0000000000350e9c=
 =C2=A0/init (__real_libc_init(void*, void (*)(), int (*)(int, char**, char=
**), structors_arra<br>y_t const*, bionic_tcb*)+688) (BuildId: 48bce72d2f0c=
6e6c34530a67b6b7b3be)
<br>[ =C2=A0=C2=A0=C2=A05.083648] init: Reboot ending, jumping to kernel
<br>[ =C2=A0=C2=A0=C2=A05.091556] reboot: Restarting system with command &#=
39;bootloader&#39;<br>
<br><br></span></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Aug 25, 2024 at 3:31=E2=80=AFPM Mario Marietto &lt;=
<a href=3D"mailto:marietto2008@gmail.com">marietto2008@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D=
"ltr"><div>The file below is called config.txt and it&#39;s available only =
if=20
Android is installed physically. I don&#39;t see it when I unpack the main=
=20
img file. Probably it is embedded inside the file 0.fat,or 1.img,who=20
knows. Anyway,Is useful to understand what&#39;s the name of the initrd=20
file. Actually I tried to use 0.fat,but I think it&#39;s wrong. Can you giv=
e
 a look at the file below and tell me if it could be &quot;ramdisk.img&quot=
; ? <br></div><div><br></div><div># Kernel</div>arm_64bit=3D1<br>kernel=3DI=
mage<br><br># Ramdisk<br>gpio=3D21=3Dip,pu<br>[gpio21=3D1]<br>initramfs ram=
disk.img followkernel<br>[gpio21=3D0]<br>initramfs ramdisk-recovery.img fol=
lowkernel<br>[all]<br><br># Audio<br>dtparam=3Daudio=3Don<br><br># Audio DA=
C<br>#dtoverlay=3Dallo-boss-dac-pcm512x-audio<br>#dtoverlay=3Dallo-piano-da=
c-pcm512x-audio<br>#dtoverlay=3Dallo-piano-dac-plus-pcm512x-audio<br>#dtove=
rlay=3Dhifiberry-dacplus<br>#dtoverlay=3Di-sabre-q2m<br>#dtoverlay=3Diqaudi=
o-dac<br>#dtoverlay=3Djustboom-dac<br><br># Boot device<br>dtoverlay=3Dandr=
oid-sdcard<br>#dtoverlay=3Dandroid-usb<br>#dtoverlay=3Dandroid-nvme<br><br>=
# Camera<br>camera_auto_detect=3D1<br>start_x=3D1<br><br># CPU<br>arm_boost=
=3D1<br>#arm_freq=3D1500<br><br># Display<br>disable_overscan=3D1<br><br># =
Display panel<br>[gpio21=3D1]<br>#dtoverlay=3Dcutiepi-panel<br>#dtoverlay=
=3Dvc4-kms-dsi-7inch<br>#dtoverlay=3Dvc4-kms-dsi-lt070me05000<br>#dtoverlay=
=3Dvc4-kms-dsi-lt070me05000-v2<br>[all]<br>#dtoverlay=3Drpi-backlight<br><b=
r># Fan<br>#dtoverlay=3Dgpio-fan<br>#dtoverlay=3Di2c-fan<br>#dtoverlay=3Drp=
i-poe<br>#dtoverlay=3Drpi-poe-plus<br><br># Graphics acceleration<br>disabl=
e_fw_kms_setup=3D1<br>[gpio21=3D1]<br>dtoverlay=3Dvc4-kms-v3d<br>[all]<br><=
br># I2C<br>dtparam=3Di2c_arm=3Don<br><br># I2S<br>#dtparam=3Di2s=3Don<br><=
br># IR<br>#dtoverlay=3Dgpio-ir,gpio_pin=3D18<br><br># Keys<br>#dtoverlay=
=3Dgpio-key,gpio=3D21,keycode=3D116,label=3D&quot;POWER&quot;<br>#dtoverlay=
=3Dgpio-key,gpio=3D26,keycode=3D115,label=3D&quot;VOLUME_UP&quot;<br>#dtove=
rlay=3Dgpio-key,gpio=3D20,keycode=3D114,label=3D&quot;VOLUME_DOWN&quot;<br>=
<br># RTC<br>dtoverlay=3Di2c-rtc,ds3231<br><br># Sensors<br>#dtoverlay=3Dan=
droid-i2c-sensor,mpu6050<br><br># Serial console<br>#enable_uart=3D1<br><br=
># SPI<br>dtparam=3Dspi=3Don<br><br># Touchscreen<br>#dtoverlay=3Dads7846,c=
s=3D1,penirq=3D25,penirq_pull=3D2,speed=3D50000,keep_vref_on=3D0,swapxy=3D0=
,pmax=3D255,xohms=3D150,xmin=3D200,xmax=3D3900,ymin=3D200,ymax=3D3900<br>#d=
toverlay=3Dedt-ft5406<br>#dtoverlay=3Dgoodix<br>#dtoverlay=3Drpi-ft5406<br>=
<br># USB<br>dtoverlay=3Ddwc2,dr_mode=3Dperipheral<br>[cm4]<br>dtoverlay=3D=
dwc2,dr_mode=3Dotg<br>[all]<br><br>include config_user.txt</div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Aug 25, 2=
024 at 2:44=E2=80=AFPM Mario Marietto &lt;<a href=3D"mailto:marietto2008@gm=
ail.com" target=3D"_blank">marietto2008@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Appe=
nding the root device does not change the scenario :</div><div><br></div><d=
iv>qemu-system-aarch64 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -smp 4 \<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 -m 2048 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -cpu cortex-a=
72 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -machine virt \<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 -serial stdio \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -initrd /mnt/zroot2/=
zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/0.fat =
\<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -kernel /mnt/zroot2/zroot2/OS/Linux/lineag=
e-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/boot/Image \<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 -append &quot;console=3DttyAMA0,38400 drm.debug=3D0x0 roo=
twait rootdelay=3D5 root=3D/dev/vdd1 rw&quot;</div><div><br></div><div><br>=
</div><div><span style=3D"font-family:monospace"><span style=3D"color:rgb(0=
,0,0);background-color:rgb(255,255,255)">[ =C2=A0=C2=A0=C2=A00.000000] Boot=
ing Linux on physical CPU 0x0000000000 [0x410fd083]
</span></span></div><div><span style=3D"font-family:monospace"></span></div=
><span style=3D"font-family:monospace">[ =C2=A0=C2=A0=C2=A00.000000] Linux =
version 6.6.36-g01aac93821d2-v8 (kleaf@build-host) (Android (11368308, +pgo=
, +bolt, +lto, +mlgo, based on r510928)<br> clang version 18.0.0 (<a href=
=3D"https://android.googlesource.com/toolchain/llvm-project" target=3D"_bla=
nk">https://android.googlesource.com/toolchain/llvm-project</a> 477610d4d0d=
988e69dbc3fae4fe86bff3f07f2b5), LLD 18.0.0) #<br>1 SMP PREEMPT Tue Jul =C2=
=A02 09:02:32 UTC 2024
<br>[ =C2=A0=C2=A0=C2=A00.000000] KASLR enabled
<br>[ =C2=A0=C2=A0=C2=A00.000000] random: crng init done
<br>[ =C2=A0=C2=A0=C2=A00.000000] Machine model: linux,dummy-virt
<br>[ =C2=A0=C2=A0=C2=A00.000000] efi: UEFI not found.
<br>[ =C2=A0=C2=A0=C2=A00.000000] Zone ranges:
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0DMA =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0[mem 0x0000000040000000-0x00000000bfffffff]
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0DMA32 =C2=A0=C2=A0=C2=A0empty
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0Normal =C2=A0=C2=A0empty
<br>[ =C2=A0=C2=A0=C2=A00.000000] Movable zone start for each node
<br>[ =C2=A0=C2=A0=C2=A00.000000] NoSplit zone start for each node
<br>[ =C2=A0=C2=A0=C2=A00.000000] NoMerge zone start for each node
<br>[ =C2=A0=C2=A0=C2=A00.000000] Early memory node ranges
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0node =C2=A0=C2=A00: [mem 0x00=
00000040000000-0x00000000bfffffff]
<br>[ =C2=A0=C2=A0=C2=A00.000000] Initmem setup node 0 [mem 0x0000000040000=
000-0x00000000bfffffff]
<br>[ =C2=A0=C2=A0=C2=A00.000000] cma: Reserved 8 MiB at 0x00000000bd000000=
 on node -1
<br>[ =C2=A0=C2=A0=C2=A00.000000] psci: probing for conduit method from DT.
<br>[ =C2=A0=C2=A0=C2=A00.000000] psci: PSCIv1.1 detected in firmware.
<br>[ =C2=A0=C2=A0=C2=A00.000000] psci: Using standard PSCI v0.2 function I=
Ds
<br>[ =C2=A0=C2=A0=C2=A00.000000] psci: Trusted OS migration not required
<br>[ =C2=A0=C2=A0=C2=A00.000000] psci: SMC Calling Convention v1.0
<br>[ =C2=A0=C2=A0=C2=A00.000000] percpu: Embedded 31 pages/cpu s87016 r819=
2 d31768 u126976
<br>[ =C2=A0=C2=A0=C2=A00.000000] Detected PIPT I-cache on CPU0
<br>[ =C2=A0=C2=A0=C2=A00.000000] CPU features: detected: Spectre-v2
<br>[ =C2=A0=C2=A0=C2=A00.000000] CPU features: detected: Spectre-v3a
<br>[ =C2=A0=C2=A0=C2=A00.000000] CPU features: detected: Spectre-v4
<br>[ =C2=A0=C2=A0=C2=A00.000000] CPU features: detected: Spectre-BHB
<br>[ =C2=A0=C2=A0=C2=A00.000000] CPU features: kernel page table isolation=
 forced ON by KASLR
<br>[ =C2=A0=C2=A0=C2=A00.000000] CPU features: detected: Kernel page table=
 isolation (KPTI)
<br>[ =C2=A0=C2=A0=C2=A00.000000] CPU features: detected: ARM erratum 17420=
98
<br>[ =C2=A0=C2=A0=C2=A00.000000] CPU features: detected: ARM errata 116552=
2, 1319367, or 1530923
<br>[ =C2=A0=C2=A0=C2=A00.000000] alternatives: applying boot alternatives
<br>[ =C2=A0=C2=A0=C2=A00.000000] Kernel command line: console=3DttyAMA0,38=
400 drm.debug=3D0x0 rootwait rootdelay=3D5 root=3D/dev/vdd1 rw androidboot.=
serialno=3D100<br>00000abcd1234 androidboot.btmacaddr=3D11:22:33:44:55:66
<br>[ =C2=A0=C2=A0=C2=A00.000000] Dentry cache hash table entries: 262144 (=
order: 9, 2097152 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.000000] Inode-cache hash table entries: 131072 (o=
rder: 8, 1048576 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.000000] Built 1 zonelists, mobility grouping on.=
=C2=A0 Total pages: 516096
<br>[ =C2=A0=C2=A0=C2=A00.000000] mem auto-init: stack:all(zero), heap allo=
c:off, heap free:off
<br>[ =C2=A0=C2=A0=C2=A00.000000] Memory: 1881596K/2097152K available (1932=
8K kernel code, 2374K rwdata, 7612K rodata, 1792K init, 1192K bss, 207364K =
rese<br>rved, 8192K cma-reserved)
<br>[ =C2=A0=C2=A0=C2=A00.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjec=
ts=3D0, CPUs=3D4, Nodes=3D1
<br>[ =C2=A0=C2=A0=C2=A00.000000] ftrace: allocating 56269 entries in 220 p=
ages
<br>[ =C2=A0=C2=A0=C2=A00.000000] ftrace: allocated 220 pages with 5 groups
<br>[ =C2=A0=C2=A0=C2=A00.000000] trace event string verifier disabled
<br>[ =C2=A0=C2=A0=C2=A00.000000] rcu: Preemptible hierarchical RCU impleme=
ntation.
<br>[ =C2=A0=C2=A0=C2=A00.000000] rcu: =C2=A0=C2=A0=C2=A0=C2=A0RCU event tr=
acing is enabled.
<br>[ =C2=A0=C2=A0=C2=A00.000000] rcu: =C2=A0=C2=A0=C2=A0=C2=A0RCU restrict=
ing CPUs from NR_CPUS=3D256 to nr_cpu_ids=3D4.
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0Trampoline variant of Tasks RCU ena=
bled.
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0Rude variant of Tasks RCU enabled.
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0Tracing variant of Tasks RCU enable=
d.
<br>[ =C2=A0=C2=A0=C2=A00.000000] rcu: RCU calculated value of scheduler-en=
listment delay is 25 jiffies.
<br>[ =C2=A0=C2=A0=C2=A00.000000] rcu: Adjusting geometry for rcu_fanout_le=
af=3D16, nr_cpu_ids=3D4
<br>[ =C2=A0=C2=A0=C2=A00.000000] NR_IRQS: 64, nr_irqs: 64, preallocated ir=
qs: 0
<br>[ =C2=A0=C2=A0=C2=A00.000000] Root IRQ handler: gic_handle_irq
<br>[ =C2=A0=C2=A0=C2=A00.000000] GICv2m: range[mem 0x08020000-0x08020fff],=
 SPI[80:143]
<br>[ =C2=A0=C2=A0=C2=A00.000000] rcu: srcu_init: Setting srcu_struct sizes=
 based on contention.
<br>[ =C2=A0=C2=A0=C2=A00.000000] arch_timer: cp15 timer(s) running at 62.5=
0MHz (virt).
<br>[ =C2=A0=C2=A0=C2=A00.000000] clocksource: arch_sys_counter: mask: 0x1f=
fffffffffffff max_cycles: 0x1cd42e208c, max_idle_ns: 881590405314 ns
<br>[ =C2=A0=C2=A0=C2=A00.000069] sched_clock: 57 bits at 63MHz, resolution=
 16ns, wraps every 4398046511096ns
<br>[ =C2=A0=C2=A0=C2=A00.003628] kfence: initialized - using 2097152 bytes=
 for 255 objects at 0x(____ptrval____)-0x(____ptrval____)
<br>[ =C2=A0=C2=A0=C2=A00.010906] Calibrating delay loop (skipped), value c=
alculated using timer frequency.. 125.00 BogoMIPS (lpj=3D250000)
<br>[ =C2=A0=C2=A0=C2=A00.011082] pid_max: default: 32768 minimum: 301
<br>[ =C2=A0=C2=A0=C2=A00.013020] LSM: initializing lsm=3Dcapability,selinu=
x,integrity
<br>[ =C2=A0=C2=A0=C2=A00.013436] SELinux: =C2=A0Initializing.
<br>[ =C2=A0=C2=A0=C2=A00.016921] Mount-cache hash table entries: 4096 (ord=
er: 3, 32768 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.016984] Mountpoint-cache hash table entries: 4096=
 (order: 3, 32768 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.031469] cgroup: Disabling memory control group su=
bsystem
<br>[ =C2=A0=C2=A0=C2=A00.050059] cacheinfo: Unable to detect cache hierarc=
hy for CPU 0
<br>[ =C2=A0=C2=A0=C2=A00.059978] RCU Tasks: Setting shift to 2 and lim to =
1 rcu_task_cb_adjust=3D1.
<br>[ =C2=A0=C2=A0=C2=A00.060584] RCU Tasks Rude: Setting shift to 2 and li=
m to 1 rcu_task_cb_adjust=3D1.
<br>[ =C2=A0=C2=A0=C2=A00.060822] RCU Tasks Trace: Setting shift to 2 and l=
im to 1 rcu_task_cb_adjust=3D1.
<br>[ =C2=A0=C2=A0=C2=A00.062427] rcu: Hierarchical SRCU implementation.
<br>[ =C2=A0=C2=A0=C2=A00.062463] rcu: =C2=A0=C2=A0=C2=A0=C2=A0Max phase no=
-delay instances is 1000.
<br>[ =C2=A0=C2=A0=C2=A00.068568] EFI services will not be available.
<br>[ =C2=A0=C2=A0=C2=A00.071086] smp: Bringing up secondary CPUs ...
<br>[ =C2=A0=C2=A0=C2=A00.074801] Detected PIPT I-cache on CPU1
<br>[ =C2=A0=C2=A0=C2=A00.075909] CPU1: Booted secondary processor 0x000000=
0001 [0x410fd083]
<br>[ =C2=A0=C2=A0=C2=A00.081065] Detected PIPT I-cache on CPU2
<br>[ =C2=A0=C2=A0=C2=A00.081470] CPU2: Booted secondary processor 0x000000=
0002 [0x410fd083]
<br>[ =C2=A0=C2=A0=C2=A00.083873] Detected PIPT I-cache on CPU3
<br>[ =C2=A0=C2=A0=C2=A00.084168] CPU3: Booted secondary processor 0x000000=
0003 [0x410fd083]
<br>[ =C2=A0=C2=A0=C2=A00.084681] smp: Brought up 1 node, 4 CPUs
<br>[ =C2=A0=C2=A0=C2=A00.084715] SMP: Total of 4 processors activated.
<br>[ =C2=A0=C2=A0=C2=A00.084800] CPU features: detected: 32-bit EL0 Suppor=
t
<br>[ =C2=A0=C2=A0=C2=A00.084824] CPU features: detected: 32-bit EL1 Suppor=
t
<br>[ =C2=A0=C2=A0=C2=A00.084885] CPU features: detected: CRC32 instruction=
s
<br>[ =C2=A0=C2=A0=C2=A00.088191] CPU features: emulated: Privileged Access=
 Never (PAN) using TTBR0_EL1 switching
<br>[ =C2=A0=C2=A0=C2=A00.088512] CPU: All CPU(s) started at EL1
<br>[ =C2=A0=C2=A0=C2=A00.088714] alternatives: applying system-wide altern=
atives
<br>[ =C2=A0=C2=A0=C2=A00.113756] devtmpfs: initialized
<br>[ =C2=A0=C2=A0=C2=A00.126262] Enabled cp15_barrier support
<br>[ =C2=A0=C2=A0=C2=A00.126449] Enabled setend support
<br>[ =C2=A0=C2=A0=C2=A00.127708] clocksource: jiffies: mask: 0xffffffff ma=
x_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
<br>[ =C2=A0=C2=A0=C2=A00.127840] futex hash table entries: 1024 (order: 4,=
 65536 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.131302] pinctrl core: initialized pinctrl subsyst=
em
<br>[ =C2=A0=C2=A0=C2=A00.138216] DMI not present or invalid.
<br>[ =C2=A0=C2=A0=C2=A00.147664] NET: Registered PF_NETLINK/PF_ROUTE proto=
col family
<br>[ =C2=A0=C2=A0=C2=A00.158502] DMA: preallocated 256 KiB GFP_KERNEL pool=
 for atomic allocations
<br>[ =C2=A0=C2=A0=C2=A00.158987] DMA: preallocated 256 KiB GFP_KERNEL|GFP_=
DMA pool for atomic allocations
<br>[ =C2=A0=C2=A0=C2=A00.159303] audit: initializing netlink subsys (disab=
led)
<br>[ =C2=A0=C2=A0=C2=A00.161302] audit: type=3D2000 audit(0.148:1): state=
=3Dinitialized audit_enabled=3D0 res=3D1
<br>[ =C2=A0=C2=A0=C2=A00.164412] thermal_sys: Registered thermal governor =
&#39;step_wise&#39;
<br>[ =C2=A0=C2=A0=C2=A00.164806] cpuidle: using governor menu
<br>[ =C2=A0=C2=A0=C2=A00.165816] hw-breakpoint: found 6 breakpoint and 4 w=
atchpoint registers.
<br>[ =C2=A0=C2=A0=C2=A00.166975] ASID allocator initialised with 32768 ent=
ries
<br>[ =C2=A0=C2=A0=C2=A00.168385] Serial: AMBA PL011 UART driver
<br>[ =C2=A0=C2=A0=C2=A00.196712] 9000000.pl011: ttyAMA0 at MMIO 0x9000000 =
(irq =3D 13, base_baud =3D 0) is a PL011 rev1
<br>[ =C2=A0=C2=A0=C2=A00.198278] printk: console [ttyAMA0] enabled
<br>[ =C2=A0=C2=A0=C2=A00.224278] Modules: 2G module region forced by RANDO=
MIZE_MODULE_REGION_FULL
<br>[ =C2=A0=C2=A0=C2=A00.224486] Modules: 0 pages in range for non-PLT usa=
ge
<br>[ =C2=A0=C2=A0=C2=A00.224510] Modules: 516176 pages in range for PLT us=
age
<br>[ =C2=A0=C2=A0=C2=A00.241442] iommu: Default domain type: Translated
<br>[ =C2=A0=C2=A0=C2=A00.241679] iommu: DMA domain TLB invalidation policy=
: strict mode
<br>[ =C2=A0=C2=A0=C2=A00.244200] SCSI subsystem initialized
<br>[ =C2=A0=C2=A0=C2=A00.245459] usbcore: registered new interface driver =
usbfs
<br>[ =C2=A0=C2=A0=C2=A00.245841] usbcore: registered new interface driver =
hub
<br>[ =C2=A0=C2=A0=C2=A00.246154] usbcore: registered new device driver usb
<br>[ =C2=A0=C2=A0=C2=A00.247257] mc: Linux media interface: v0.10
<br>[ =C2=A0=C2=A0=C2=A00.247617] videodev: Linux video capture interface: =
v2.00
<br>[ =C2=A0=C2=A0=C2=A00.248602] pps_core: LinuxPPS API ver. 1 registered
<br>[ =C2=A0=C2=A0=C2=A00.248700] pps_core: Software ver. 5.3.6 - Copyright=
 2005-2007 Rodolfo Giometti &lt;<a href=3D"mailto:giometti@linux.it" target=
=3D"_blank">giometti@linux.it</a>&gt;
<br>[ =C2=A0=C2=A0=C2=A00.248967] PTP clock support registered
<br>[ =C2=A0=C2=A0=C2=A00.251884] Advanced Linux Sound Architecture Driver =
Initialized.
<br>[ =C2=A0=C2=A0=C2=A00.262663] Bluetooth: Core ver 2.22
<br>[ =C2=A0=C2=A0=C2=A00.262960] NET: Registered PF_BLUETOOTH protocol fam=
ily
<br>[ =C2=A0=C2=A0=C2=A00.263069] Bluetooth: HCI device and connection mana=
ger initialized
<br>[ =C2=A0=C2=A0=C2=A00.263344] Bluetooth: HCI socket layer initialized
<br>[ =C2=A0=C2=A0=C2=A00.263516] Bluetooth: L2CAP socket layer initialized
<br>[ =C2=A0=C2=A0=C2=A00.263840] Bluetooth: SCO socket layer initialized
<br>[ =C2=A0=C2=A0=C2=A00.266790] vgaarb: loaded
<br>[ =C2=A0=C2=A0=C2=A00.268841] clocksource: Switched to clocksource arch=
_sys_counter
<br>[ =C2=A0=C2=A0=C2=A00.272056] VFS: Disk quotas dquot_6.6.0
<br>[ =C2=A0=C2=A0=C2=A00.272284] VFS: Dquot-cache hash table entries: 512 =
(order 0, 4096 bytes)
<br>[ =C2=A0=C2=A0=C2=A00.273060] FS-Cache: Loaded
<br>[ =C2=A0=C2=A0=C2=A00.278526] CacheFiles: Loaded
<br>[ =C2=A0=C2=A0=C2=A00.287007] NET: Registered PF_INET protocol family
<br>[ =C2=A0=C2=A0=C2=A00.288390] IP idents hash table entries: 32768 (orde=
r: 6, 262144 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.297021] tcp_listen_portaddr_hash hash table entri=
es: 1024 (order: 2, 16384 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.297273] Table-perturb hash table entries: 65536 (=
order: 6, 262144 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.297485] TCP established hash table entries: 16384=
 (order: 5, 131072 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.298036] TCP bind hash table entries: 16384 (order=
: 7, 524288 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.298873] TCP: Hash tables configured (established =
16384 bind 16384)
<br>[ =C2=A0=C2=A0=C2=A00.301283] MPTCP token hash table entries: 2048 (ord=
er: 3, 49152 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.301759] UDP hash table entries: 1024 (order: 3, 3=
2768 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.302186] UDP-Lite hash table entries: 1024 (order:=
 3, 32768 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.304009] NET: Registered PF_UNIX/PF_LOCAL protocol=
 family
<br>[ =C2=A0=C2=A0=C2=A00.306868] PCI: CLS 0 bytes, default 64
<br>[ =C2=A0=C2=A0=C2=A00.312145] Trying to unpack rootfs image as initramf=
s...
<br>[ =C2=A0=C2=A0=C2=A00.312808] kvm [1]: HYP mode not available
<br>[ =C2=A0=C2=A0=C2=A00.318856] rootfs image is not initramfs (invalid ma=
gic at start of compressed archive); looks like an initrd
<br>[ =C2=A0=C2=A0=C2=A00.335544] Initialise system trusted keyrings
<br>[ =C2=A0=C2=A0=C2=A00.338430] workingset: timestamp_bits=3D46 max_order=
=3D19 bucket_order=3D0
<br>[ =C2=A0=C2=A0=C2=A00.339134] zbud: loaded
<br>[ =C2=A0=C2=A0=C2=A00.347742] Key type cifs.idmap registered
<br>[ =C2=A0=C2=A0=C2=A00.348673] fuse: init (API version 7.39)
<br>[ =C2=A0=C2=A0=C2=A00.386722] Key type asymmetric registered
<br>[ =C2=A0=C2=A0=C2=A00.386992] Asymmetric key parser &#39;x509&#39; regi=
stered
<br>[ =C2=A0=C2=A0=C2=A00.387460] Block layer SCSI generic (bsg) driver ver=
sion 0.4 loaded (major 244)
<br>[ =C2=A0=C2=A0=C2=A00.388796] io scheduler mq-deadline registered
<br>[ =C2=A0=C2=A0=C2=A00.388954] io scheduler kyber registered
<br>[ =C2=A0=C2=A0=C2=A00.389319] io scheduler bfq registered
<br>[ =C2=A0=C2=A0=C2=A00.406358] vc-mem: phys_addr:0x00000000 mem_base=3D0=
x00000000 mem_size:0x00000000(0 MiB)
<br>[ =C2=A0=C2=A0=C2=A00.476330] brd: module loaded
<br>[ =C2=A0=C2=A0=C2=A00.508286] loop: module loaded
<br>[ =C2=A0=C2=A0=C2=A00.512092] Loading iSCSI transport class v2.0-870.
<br>[ =C2=A0=C2=A0=C2=A00.522449] wireguard: WireGuard 1.0.0 loaded. See <a=
 href=3D"http://www.wireguard.com" target=3D"_blank">www.wireguard.com</a> =
for information.
<br>[ =C2=A0=C2=A0=C2=A00.522729] wireguard: Copyright (C) 2015-2019 Jason =
A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com" target=3D"_blank">Jason=
@zx2c4.com</a>&gt;. All Rights Reserved.
<br>[ =C2=A0=C2=A0=C2=A00.538429] tun: Universal TUN/TAP device driver, 1.6
<br>[ =C2=A0=C2=A0=C2=A00.541953] usbcore: registered new interface driver =
brcmfmac
<br>[ =C2=A0=C2=A0=C2=A00.542290] usbcore: registered new device driver r81=
52-cfgselector
<br>[ =C2=A0=C2=A0=C2=A00.542675] usbcore: registered new interface driver =
r8152
<br>[ =C2=A0=C2=A0=C2=A00.542971] usbcore: registered new interface driver =
lan78xx
<br>[ =C2=A0=C2=A0=C2=A00.543488] usbcore: registered new interface driver =
asix
<br>[ =C2=A0=C2=A0=C2=A00.543810] usbcore: registered new interface driver =
ax88179_178a
<br>[ =C2=A0=C2=A0=C2=A00.544134] usbcore: registered new interface driver =
cdc_ether
<br>[ =C2=A0=C2=A0=C2=A00.544609] usbcore: registered new interface driver =
smsc95xx
<br>[ =C2=A0=C2=A0=C2=A00.544909] usbcore: registered new interface driver =
net1080
<br>[ =C2=A0=C2=A0=C2=A00.545240] usbcore: registered new interface driver =
cdc_subset
<br>[ =C2=A0=C2=A0=C2=A00.545596] usbcore: registered new interface driver =
zaurus
<br>[ =C2=A0=C2=A0=C2=A00.545896] usbcore: registered new interface driver =
cdc_ncm
<br>[ =C2=A0=C2=A0=C2=A00.546192] usbcore: registered new interface driver =
r8153_ecm
<br>[ =C2=A0=C2=A0=C2=A00.547442] dwc_otg: version 3.00a 10-AUG-2012 (platf=
orm bus)
<br>[ =C2=A0=C2=A0=C2=A00.550591] usbcore: registered new interface driver =
cdc_acm
<br>[ =C2=A0=C2=A0=C2=A00.550756] cdc_acm: USB Abstract Control Model drive=
r for USB modems and ISDN adapters
<br>[ =C2=A0=C2=A0=C2=A00.551948] usbcore: registered new interface driver =
uas
<br>[ =C2=A0=C2=A0=C2=A00.552352] usbcore: registered new interface driver =
usb-storage
<br>[ =C2=A0=C2=A0=C2=A00.566050] usbcore: registered new interface driver =
cp210x
<br>[ =C2=A0=C2=A0=C2=A00.566791] usbserial: USB Serial support registered =
for cp210x
<br>[ =C2=A0=C2=A0=C2=A00.567318] usbcore: registered new interface driver =
pl2303
<br>[ =C2=A0=C2=A0=C2=A00.567653] usbserial: USB Serial support registered =
for pl2303
<br>[ =C2=A0=C2=A0=C2=A00.573531] mousedev: PS/2 mouse device common for al=
l mice
<br>[ =C2=A0=C2=A0=C2=A00.573930] usbcore: registered new interface driver =
xpad
<br>[ =C2=A0=C2=A0=C2=A00.574228] usbcore: registered new interface driver =
usb_acecad
<br>[ =C2=A0=C2=A0=C2=A00.574588] usbcore: registered new interface driver =
aiptek
<br>[ =C2=A0=C2=A0=C2=A00.574937] usbcore: registered new interface driver =
hanwang
<br>[ =C2=A0=C2=A0=C2=A00.575292] usbcore: registered new interface driver =
kbtab
<br>[ =C2=A0=C2=A0=C2=A00.577388] usbcore: registered new interface driver =
usbtouchscreen
<br>[ =C2=A0=C2=A0=C2=A00.580179] i2c_dev: i2c /dev entries driver
<br>[ =C2=A0=C2=A0=C2=A00.584010] ir_imon_decoder: IR iMON protocol handler=
 initialized
<br>[ =C2=A0=C2=A0=C2=A00.584179] IR JVC protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.584296] IR MCE Keyboard/mouse protocol handler in=
itialized
<br>[ =C2=A0=C2=A0=C2=A00.584435] IR NEC protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.584734] IR RC5(x/sz) protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.584863] IR RC6 protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.584991] IR RCMM protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.585111] IR SANYO protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.585226] IR Sharp protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.585358] IR Sony protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.585477] IR XMP protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.586421] usbcore: registered new interface driver =
uvcvideo
<br>[ =C2=A0=C2=A0=C2=A00.589015] device-mapper: uevent: version 1.0.3
<br>[ =C2=A0=C2=A0=C2=A00.590448] device-mapper: ioctl: 4.48.0-ioctl (2023-=
03-01) initialised: <a href=3D"mailto:dm-devel@redhat.com" target=3D"_blank=
">dm-devel@redhat.com</a>
<br>[ =C2=A0=C2=A0=C2=A00.591924] Bluetooth: HCI UART driver ver 2.3
<br>[ =C2=A0=C2=A0=C2=A00.592106] Bluetooth: HCI UART protocol H4 registere=
d
<br>[ =C2=A0=C2=A0=C2=A00.592885] Bluetooth: HCI UART protocol Broadcom reg=
istered
<br>[ =C2=A0=C2=A0=C2=A00.594293] sdhci: Secure Digital Host Controller Int=
erface driver
<br>[ =C2=A0=C2=A0=C2=A00.594442] sdhci: Copyright(c) Pierre Ossman
<br>[ =C2=A0=C2=A0=C2=A00.594948] sdhci-pltfm: SDHCI platform and OF driver=
 helper
<br>[ =C2=A0=C2=A0=C2=A00.596987] ledtrig-cpu: registered to indicate activ=
ity on CPUs
<br>[ =C2=A0=C2=A0=C2=A00.599350] hid: raw HID events driver (C) Jiri Kosin=
a
<br>[ =C2=A0=C2=A0=C2=A00.612270] usbcore: registered new interface driver =
usbhid
<br>[ =C2=A0=C2=A0=C2=A00.612441] usbhid: USB HID core driver
<br>[ =C2=A0=C2=A0=C2=A00.615743] ashmem: initialized
<br>[ =C2=A0=C2=A0=C2=A00.617297] SPI driver st-accel-spi has no spi_device=
_id for st,lis302dl-spi
<br>[ =C2=A0=C2=A0=C2=A00.617473] SPI driver st-accel-spi has no spi_device=
_id for st,lis3lv02dl-accel
<br>[ =C2=A0=C2=A0=C2=A00.617626] SPI driver st-accel-spi has no spi_device=
_id for st,lis3dh-accel
<br>[ =C2=A0=C2=A0=C2=A00.617769] SPI driver st-accel-spi has no spi_device=
_id for st,lsm330d-accel
<br>[ =C2=A0=C2=A0=C2=A00.617919] SPI driver st-accel-spi has no spi_device=
_id for st,lsm330dl-accel
<br>[ =C2=A0=C2=A0=C2=A00.618062] SPI driver st-accel-spi has no spi_device=
_id for st,lsm330dlc-accel
<br>[ =C2=A0=C2=A0=C2=A00.618206] SPI driver st-accel-spi has no spi_device=
_id for st,lis331dlh-accel
<br>[ =C2=A0=C2=A0=C2=A00.618357] SPI driver st-accel-spi has no spi_device=
_id for st,lsm330-accel
<br>[ =C2=A0=C2=A0=C2=A00.618493] SPI driver st-accel-spi has no spi_device=
_id for st,lsm303agr-accel
<br>[ =C2=A0=C2=A0=C2=A00.618638] SPI driver st-accel-spi has no spi_device=
_id for st,lis2dh12-accel
<br>[ =C2=A0=C2=A0=C2=A00.618775] SPI driver st-accel-spi has no spi_device=
_id for st,lng2dm-accel
<br>[ =C2=A0=C2=A0=C2=A00.618911] SPI driver st-accel-spi has no spi_device=
_id for st,h3lis331dl-accel
<br>[ =C2=A0=C2=A0=C2=A00.619056] SPI driver st-accel-spi has no spi_device=
_id for st,lis331dl-accel
<br>[ =C2=A0=C2=A0=C2=A00.619209] SPI driver st-accel-spi has no spi_device=
_id for st,lsm303c-accel
<br>[ =C2=A0=C2=A0=C2=A00.620207] SPI driver st-magn-spi has no spi_device_=
id for st,lis3mdl-magn
<br>[ =C2=A0=C2=A0=C2=A00.620355] SPI driver st-magn-spi has no spi_device_=
id for st,lsm303agr-magn
<br>[ =C2=A0=C2=A0=C2=A00.620510] SPI driver st-magn-spi has no spi_device_=
id for st,lsm9ds1-magn
<br>[ =C2=A0=C2=A0=C2=A00.620768] SPI driver st-magn-spi has no spi_device_=
id for st,lsm303c-magn
<br>[ =C2=A0=C2=A0=C2=A00.626130] hw perfevents: enabled with armv8_pmuv3 P=
MU driver, 7 counters available
<br>[ =C2=A0=C2=A0=C2=A00.630320] usbcore: registered new interface driver =
snd-usb-audio
<br>[ =C2=A0=C2=A0=C2=A00.638439] Mirror/redirect action on
<br>[ =C2=A0=C2=A0=C2=A00.639343] netem: version 1.3
<br>[ =C2=A0=C2=A0=C2=A00.639435] u32 classifier
<br>[ =C2=A0=C2=A0=C2=A00.639508] =C2=A0=C2=A0=C2=A0=C2=A0input device chec=
k on
<br>[ =C2=A0=C2=A0=C2=A00.639602] =C2=A0=C2=A0=C2=A0=C2=A0Actions configure=
d
<br>[ =C2=A0=C2=A0=C2=A00.648469] xt_time: kernel timezone is -0000
<br>[ =C2=A0=C2=A0=C2=A00.649096] gre: GRE over IPv4 demultiplexor driver
<br>[ =C2=A0=C2=A0=C2=A00.649255] IPv4 over IPsec tunneling driver
<br>[ =C2=A0=C2=A0=C2=A00.654843] Initializing XFRM netlink socket
<br>[ =C2=A0=C2=A0=C2=A00.655213] IPsec XFRM device driver
<br>[ =C2=A0=C2=A0=C2=A00.676037] NET: Registered PF_INET6 protocol family
<br>[ =C2=A0=C2=A0=C2=A00.687646] Segment Routing with IPv6
<br>[ =C2=A0=C2=A0=C2=A00.687964] In-situ OAM (IOAM) with IPv6
<br>[ =C2=A0=C2=A0=C2=A00.689074] mip6: Mobile IPv6
<br>[ =C2=A0=C2=A0=C2=A00.693823] sit: IPv6, IPv4 and MPLS over IPv4 tunnel=
ing driver
<br>[ =C2=A0=C2=A0=C2=A00.699298] NET: Registered PF_PACKET protocol family
<br>[ =C2=A0=C2=A0=C2=A00.699567] NET: Registered PF_KEY protocol family
<br>[ =C2=A0=C2=A0=C2=A00.699819] Key type dns_resolver registered
<br>[ =C2=A0=C2=A0=C2=A00.798005] Freeing initrd memory: 131072K
<br>[ =C2=A0=C2=A0=C2=A00.806166] registered taskstats version 1
<br>[ =C2=A0=C2=A0=C2=A00.807819] Loading compiled-in X.509 certificates
<br>[ =C2=A0=C2=A0=C2=A00.834497] Key type .fscrypt registered
<br>[ =C2=A0=C2=A0=C2=A00.834641] Key type fscrypt-provisioning registered
<br>[ =C2=A0=C2=A0=C2=A00.841634] of_cfs_init
<br>[ =C2=A0=C2=A0=C2=A00.842079] of_cfs_init: OK
<br>[ =C2=A0=C2=A0=C2=A00.845830] cfg80211: Loading compiled-in X.509 certi=
ficates for regulatory database
<br>[ =C2=A0=C2=A0=C2=A00.876283] Loaded X.509 cert &#39;<a href=3D"mailto:=
benh@debian.org" target=3D"_blank">benh@debian.org</a>: 577e021cb980e0e8208=
21ba7b54b4961b8b4fadf&#39;
<br>[ =C2=A0=C2=A0=C2=A00.877632] Loaded X.509 cert &#39;<a href=3D"mailto:=
romain.perier@gmail.com" target=3D"_blank">romain.perier@gmail.com</a>: 3ab=
bc6ec146e09d1b6016ab9d6cf71dd233f0328&#39;
<br>[ =C2=A0=C2=A0=C2=A00.878441] Loaded X.509 cert &#39;sforshee: 00b28ddf=
47aef9cea7&#39;
<br>[ =C2=A0=C2=A0=C2=A00.879187] Loaded X.509 cert &#39;wens: 61c038651aab=
dcf94bd0ac7ff06c7248db18c600&#39;
<br>[ =C2=A0=C2=A0=C2=A00.885017] clk: Disabling unused clocks
<br>[ =C2=A0=C2=A0=C2=A00.885499] ALSA device list:
<br>[ =C2=A0=C2=A0=C2=A00.885646] =C2=A0=C2=A0No soundcards found.
<br>[ =C2=A0=C2=A0=C2=A00.894059] uart-pl011 9000000.pl011: no DMA platform=
 data
<br>[ =C2=A0=C2=A0=C2=A00.895672] Waiting 5 sec before mounting root device=
...
<br>[ =C2=A0=C2=A0=C2=A06.132758] RAMDISK: Couldn&#39;t find valid RAM disk=
 image starting at 0.
<br>[ =C2=A0=C2=A0=C2=A06.133865] Waiting for root device /dev/vdd1...
<br>[ =C2=A0=C2=A010.994096] platform gpio-keys: deferred probe pending<br>
<br><br></span></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Aug 25, 2024 at 2:30=E2=80=AFPM Mario Marietto &lt;=
<a href=3D"mailto:marietto2008@gmail.com" target=3D"_blank">marietto2008@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div dir=3D"ltr"><div><span style=3D"font-family:monospace"><span st=
yle=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">When I unpack th=
is file :</span></span></div><div><span style=3D"font-family:monospace"><sp=
an style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)"><br></span>=
</span></div><div><span style=3D"font-family:monospace"><span style=3D"colo=
r:rgb(0,0,0);background-color:rgb(255,255,255)">lineage-21.0-20240618-UNOFF=
ICIAL-KonstaKANG-rpi4-atv.img</span></span></div><div><span style=3D"font-f=
amily:monospace"><span style=3D"color:rgb(0,0,0);background-color:rgb(255,2=
55,255)"><br></span></span></div><div><span style=3D"font-family:monospace"=
><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">I get t=
hese files :</span></span></div><div><span style=3D"font-family:monospace">=
<span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)"><br></sp=
an></span></div><div><span style=3D"font-family:monospace"><span style=3D"c=
olor:rgb(0,0,0);background-color:rgb(255,255,255)">0.fat</span><span style=
=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">
</span><br>1.img<span style=3D"color:rgb(0,0,0);background-color:rgb(255,25=
5,255)">
</span><br>2.img
<br>3.img</span></div><div><span style=3D"font-family:monospace"><br></span=
></div><div><span style=3D"font-family:monospace">So,I assume that :</span>=
</div><div><span style=3D"font-family:monospace"><br></span></div><div><spa=
n style=3D"font-family:monospace">0.fat is : initrd</span></div><div><span =
style=3D"font-family:monospace">1.img is : </span>system-rw.img<br>2.img is=
=C2=A0=C2=A0 :=C2=A0 vendor-rw.img<br>3.img is=C2=A0=C2=A0 :=C2=A0 userdata=
.img</div><div><br></div><div>If I use 0.fat as initrd,like this :</div><di=
v><br></div><div><span style=3D"font-family:monospace"><span style=3D"color=
:rgb(24,178,178);background-color:rgb(255,255,255)">-initrd /mnt/zroot2/zro=
ot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/0.fat</sp=
an></span></div><div><span style=3D"font-family:monospace"><span style=3D"c=
olor:rgb(24,178,178);background-color:rgb(255,255,255)"><br></span></span><=
/div><div><span style=3D"font-family:monospace"><span style=3D"color:rgb(24=
,178,178);background-color:rgb(255,255,255)">I get this message :</span></s=
pan></div><div><span style=3D"font-family:monospace"><span style=3D"color:r=
gb(24,178,178);background-color:rgb(255,255,255)"><br></span></span></div><=
div><span>rootfs image is not initramfs (invalid magic at start of compress=
ed archive); looks like an initrd</span></div><div><span><br></span></div><=
div><span>it looks like an initrd : right,it&#39;s true : it is initrd. (fo=
r this reason I&#39;ve assumed that 0.fat is initrd...</span></div><div><sp=
an><br></span></div><div><span style=3D"font-family:monospace"></span></div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Sun, Aug 25, 2024 at 1:26=E2=80=AFPM Peter Maydell &lt;<a href=3D"mailt=
o:peter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Su=
n, 25 Aug 2024 at 11:45, Mario Marietto &lt;<a href=3D"mailto:marietto2008@=
gmail.com" target=3D"_blank">marietto2008@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Please look at this example :<br>
&gt;<br>
&gt; qemu-system-aarch64 \<br>
&gt; -smp 4 \<br>
&gt; -m 2048 \<br>
&gt; -cpu cortex-a72 \<br>
&gt; -machine virt \<br>
&gt; -serial stdio \<br>
&gt; -kernel /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-K=
onstaKANG-rpi4-atv/boot/Image \<br>
<br>
This (assuming it&#39;s the complete command line your script is<br>
running) doesn&#39;t pass any arguments telling QEMU to provide a<br>
root disk, and it doesn&#39;t pass any arguments to the kernel<br>
telling it what root disk to use...<br>
<br>
&gt; [=C2=A0 =C2=A0 0.000000] Kernel command line: console=3DttyAMA0,115200=
 kgdboc=3DttyAMA0,115200 root=3D/dev/mmcblk0p2 rootfstype=3Dext4 rootwait a=
ndroidboot.serialno=3D10000000abcd1234 androidboot.btmacaddr=3D11:22:33:44:=
55:66<br>
<br>
...so the kernel defaults to &quot;/dev/mmcblk0p2&quot; as its root disk be=
cause<br>
it&#39;s using the command line argument that was compiled into it...<br>
<br>
&gt; [=C2=A0 =C2=A0 0.658240] Waiting for root device /dev/mmcblk0p2...<br>
<br>
...and then it&#39;s hanging around forever waiting for that.<br>
<br>
You need to:<br>
=C2=A0(1) pass QEMU arguments telling it to provide a root fs<br>
=C2=A0(2) pass the kernel arguments telling it to look for the<br>
=C2=A0 =C2=A0 =C2=A0root fs in the place where QEMU is providing it<br>
<br>
Your other command line looks more on the right lines:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -kernel<br>
/mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi=
4-atv/boot/Image<br>
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -initrd<br>
/mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi=
4-atv/0.fat<br>
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -drive index=3D0,if=3Dnone,id=3Dsystem,file=3D/=
mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4=
-atv/1.img<br>
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-blk-pci,drive=3Dsystem \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -drive index=3D1,if=3Dnone,id=3Dvendor,file=3D/=
mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4=
-atv/2.img<br>
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-blk-pci,drive=3Dvendor \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -drive index=3D2,if=3Dnone,id=3Duserdata,file=
=3D/mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-=
rpi4-atv/3.img<br>
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-blk-pci,drive=3Duserdata \<br>
<br>
though I wonder if the kernel really expects a<br>
FAT file for the initrd, given it complains:<br>
<br>
[=C2=A0 =C2=A0 0.344033] Trying to unpack rootfs image as initramfs...<br>
[=C2=A0 =C2=A0 0.344947] rootfs image is not initramfs (invalid magic at st=
art<br>
of compressed archive); looks like an initrd<br>
<br>
and then later<br>
<br>
[=C2=A0 =C2=A0 5.905329] RAMDISK: Couldn&#39;t find valid RAM disk image st=
arting at 0.<br>
<br>
I think if I were you I&#39;d start by figuring out what&#39;s going on<br>
with the initrd.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>

--000000000000ff09ed062084156e--
