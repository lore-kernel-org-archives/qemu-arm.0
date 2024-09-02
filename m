Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1113288njf;
        Mon, 2 Sep 2024 07:01:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUGoSh/oVMYQB32hBWIn5GaYSFXpNvGKUVJAuyxWVZT17bFcZZficUasrmZjQkYTlEQkp7hjr0XzTtOwA==@linaro.org
X-Google-Smtp-Source: AGHT+IHzRNk2/ssPOdzTyasBozgY8enOt9XMhOPMVvlI+odfLH3xrJqkksWEfkHEPPGlZJQMQqjp
X-Received: by 2002:a05:6102:32d3:b0:48f:ebf2:14d6 with SMTP id ada2fe7eead31-49a774d8283mr9115935137.6.1725285669685;
        Mon, 02 Sep 2024 07:01:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725285669; cv=none;
        d=google.com; s=arc-20160816;
        b=f1W/ZBA+UoBXZDyAQ3/b2RTMcDdCR2SICE6IAoYuKKB+7SVVN4RkxCp1xZu8ZNe6rf
         +qFab8O4SYXPAbU/JknNwFiG2Yf+Bb4yAFNxja7WYVHVY2O3eRl1lWWf+oNCZNemCm8/
         hE5mXE3YTPYzaL1RPyPO3sRfJG9Ll0zr3l5jgI3MZWHXCII5lv1ZWvxikmnV//E99Fc+
         Sav5UXaCG6d9KayhsBXoMg+mpYzbfMWrNLZmcus9cnlBUl3T458Nt6TidxqmAPgMfSl7
         A//F3eab8jVWvM4IEDxsRC/DK9M6Fb+Waoa0rx3KWxcZtjXpcrjITiOK5K3DA8dec0Ns
         Si4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=/IbOcCpGjfJX6+V2I7caeFN5vDrkIlFaWyb0CnKa2FY=;
        fh=v3Z3YO0jCaChAe1Hkc6L/GpO3t7mqn5N7kwdneIlCOQ=;
        b=vRs+jtzDL2E291iBJii6gWbl9zyjw5d3d/mWbRO9WHZubPX6N0xMLfWESyiyQWyns4
         mkrysV8Kc2/h4qv1T3jgEpDOPf0tfhMqVsmy/SCe8FleN+2KBkeeWdAXL85aIAITD0OK
         3cT/Zd23qQc8MR35t6F4G2VydRMof/AW/5SJQbXmZQfucXwp5lgszADXM0qsoJj/dEiV
         Q5Ip77uqCTVGpCX95FIfhvDs2PXT/FJhKVVJy5xJnQ3B/lTyH8M0QxDiDyT8SSSn75wg
         cRA19TlHJrOaqqWhXOK8E6DpIUMWf4hCPgVHla1uFzxnUVd2+f9Au/Yblol63WdpZxGu
         2w8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xqq366sj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-49a5f4fade5si2576353137.255.2024.09.02.07.01.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Sep 2024 07:01:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xqq366sj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sl7bz-0002TC-Rf; Mon, 02 Sep 2024 10:00:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sl7bx-0002MX-An
 for qemu-arm@nongnu.org; Mon, 02 Sep 2024 10:00:53 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sl7bv-0002h6-8f
 for qemu-arm@nongnu.org; Mon, 02 Sep 2024 10:00:53 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5becc379f3fso3604256a12.3
 for <qemu-arm@nongnu.org>; Mon, 02 Sep 2024 07:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725285649; x=1725890449; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/IbOcCpGjfJX6+V2I7caeFN5vDrkIlFaWyb0CnKa2FY=;
 b=xqq366sjqQxCHt1zL0woC2kHtqk4Q9R8JcQclT1dOO3BKAXRzo457KTNUZnU+Vyfw6
 Kd5u2DD9KNC9kPAE1fK+afOa8rhPqF2qxdD5RN9uIRiwmxFRBNaIBxlja1GyIwIUWOOJ
 lvOVyfh7y9Qb7P1acjYJX6vLWq0zn/nzGDisNQa+vcUZ0xNZfZ2I1f+meKp/NZ1wVPTj
 YLwgtRZh8NEf0sDYRzPmEeiNkqERVHG8K71+aPSHDtU8CCLhi4EkmpMdDTtvRwaat2zB
 L1s/X3zXlKJkuN8pgZGhoP2Rht0w08E5p4pihZx2Ns7wemlPV25mIdqeopK93gIrFMGu
 v/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725285649; x=1725890449;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/IbOcCpGjfJX6+V2I7caeFN5vDrkIlFaWyb0CnKa2FY=;
 b=OXQwyGaYfxZZUMT6uSbCt6+vIfg9xRLSszMHWW/stDNNAvY7I3/bftajNBmfYzIAiX
 D6qIyl7ncLgQ/TsCo688wybPkxoZgJr77nUSc1CnedqGc7R+oJDiISLhc+AMwZCR6Ifv
 lwsGWkL7YNTmfylyq4RYL/uvvAExWVgK22VoJuQKtw0ZrNy+GscvpHSrb+Ik/0NgNRYd
 6VYCspdlL/PkMklQtunecyAuvDA70wJra4xusOw9B4uPbt8kUKwemFxwixDW2ZD5SMXV
 R4Jbnwq3QSfh0I8dsyqBGrGM3a6Pvl/XFAYM3ld1XPjvvlc7j6vu5EhUC0vsVDx5Ac3i
 rABA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCDOITpn71kIeNw5lMGo5cPsI003c8+MIM79fM/kJ+JBFTZk1bZpwnpghV6Hdb3DJcyw6+wF8Oiw==@nongnu.org
X-Gm-Message-State: AOJu0YzRkRBHWq5d/2hliVVRzYWUxQSr52Vw/EIml1C8qF8+hSpxes+f
 sYvBl+Zztjtuao7EbFR52y1kwzadYc/+xjoMko/lsOaeKdcBfOH2Ov6Skyik5Tf/yif/pEW6SsK
 7kN8/q++1E3FyPn/upU1TMmqr4oqwAyVBmDi0Gw==
X-Received: by 2002:a05:6402:2807:b0:5c2:4cbe:ac33 with SMTP id
 4fb4d7f45d1cf-5c24cbeb2ffmr3797074a12.2.1725285648905; Mon, 02 Sep 2024
 07:00:48 -0700 (PDT)
MIME-Version: 1.0
References: <CA+1FSiirzpq4wjcKTLSexiOWtv26sgD37h=wA2qxv8Qh5MW_-w@mail.gmail.com>
In-Reply-To: <CA+1FSiirzpq4wjcKTLSexiOWtv26sgD37h=wA2qxv8Qh5MW_-w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Sep 2024 15:00:37 +0100
Message-ID: <CAFEAcA81xDEubwm7ZYHZWtp_9nZh_gd9o=SZK3WOOm0-9Ja3rQ@mail.gmail.com>
Subject: Re: Error : init: partition(s) not found in /sys, waiting for their
 uevent(s): mmcblk0p2, mmcblk0p3 while trying to emulate Android 14 on Ubuntu
 24.04 X64 bit using qemu-system-aarch64.
To: Mario Marietto <marietto2008@gmail.com>
Cc: qemu-discuss@nongnu.org, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: 9tqAOOF+NMuq

On Mon, 2 Sept 2024 at 14:50, Mario Marietto <marietto2008@gmail.com> wrote=
:

> [ 1.993668] init: bool android::init::BlockDevInitializer::InitDevices(st=
d::set<std::string>): partition(s) not found in /sys, waiting for their uev=
ent(s): mmcblk0p2, mmcblk0p3
>
>
> One user suggested to :
>
>
>
>
> Hi!!! The "/sys" is a "dynamic fs" created at ram from the kernel, to exp=
ort a lot of things...so most of the files only exist at runtime. Normally,=
 the partitions from the block device have a symlink at /sys/<something>/<.=
..> that points to /dev/ block node. It seems that there are no such files =
under /sys according to what init is looking for. You can double check this=
 at init source code to check the exact path but I'm guessing that you'll h=
ave to change the qemu arguments regarding the block device.

The mmcblk* device names are for an SD card.

> So,in short I should change the qemu arguments regarding the block device=
. I tried in this way :
>
>
> qemu-system-aarch64 \
>         -smp 4 \
>         -m 2048 \
>         -cpu cortex-a72 \
>         -M virt \
>         -device virtio-gpu-pci,xres=3D1024,yres=3D768 \
>         -display sdl,gl=3Don \
>         -device usb-ehci \
>         -device usb-kbd \
>         -device virtio-tablet-pci \
>         -usb \
>         -serial stdio \
>         -kernel /mnt/zroot-133/_OS/Android/rpi4/Image \
>         -initrd /mnt/zroot-133/_OS/Android/rpi4/ramdisk.img \
>         -hda /mnt/zroot-133/_OS/Android/rpi4/boot.img \
>         -hdb /mnt/zroot-133/_OS/Android/rpi4/system.img \
>         -hdc /mnt/zroot-133/_OS/Android/rpi4/vendor.img \
>         -append "console=3DttyAMA0,38400 drm.debug=3D0x0 rootwait rootdel=
ay=3D5 root=3D/dev/mmcblk0p2 androidboot.hardware=3Drpi4 androidboot.selinu=
x=3Dpermissive security=3Dselinux selinux=3D1 androidboot.qemu.hw.mainkeys=
=3D0 androidboot.lcd.density=3D160"

Your original command line was creating virtio-scsi disks via
virtio-blk-pci. This one does the same, just via a different
syntax (the default block type for the 'virt' board is IF_VIRTIO).

I'm not sure exactly how you would create an SD card for the
'virt' board (probably by using the sdhci-pci device which is
a PCI sd controller) but I think it would be better to fix
the guest to use the virtio devices and not insist on looking
for an SD card -- the performance from an emulated SD card
will be a lot worse.

thanks
-- PMM
