Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1109484njf;
        Mon, 2 Sep 2024 06:50:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWpRHiSeQHAIr6m5DJOP2+A080QDnb0B3/YfEsCyuz0PxdfrIXzRW5on3B73JrbtMIR2aLIyKeZ+jvyyA==@linaro.org
X-Google-Smtp-Source: AGHT+IF7OHq+x/p1sdGlqzfvI4qp1zQTvds30po4TKjwhZixW8Li8/kJKjUFXrzjKhbcsA7gyKGw
X-Received: by 2002:a05:6870:fb91:b0:277:c28c:147e with SMTP id 586e51a60fabf-27810c1052fmr343130fac.21.1725285052717;
        Mon, 02 Sep 2024 06:50:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725285052; cv=none;
        d=google.com; s=arc-20160816;
        b=UQQekckNqnzilK0G01dgTTRM5xqbxYz4GafUixnimbtszMEbT5yBqdRGwBiVBIFqQI
         BbNg3rXWLIKqq5MtjFVt0vUYYFpRvpmVkyFuDbs8Zy/LjWqH4qxsKhug5FOBJJvLG5gA
         kLPnMFFbiLF38mLp8UBWZtdb1NrvMb0WkcFGNWS5O1NdoxAn4e8jryelHs9mAsBf+zCb
         MKW0lVLpBToaf29Gn59ey93PZjKzolHHWoDCH1wKBFoBvIdEFouHggsGh8WixNHf9LCT
         R1edyZZP0pjJTQ4h7541TnbQbXfqy9w909ENpgAN0rx3H7kI3bz9Xek765wY0wHvE2zs
         qMww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=86Wtjwlk7p61ZOojwtzGDO05XFu8qOxdfefgXGWxunk=;
        fh=6hrxJz77WcQoNvJOuPmgcS8KW9+yzMIqtAevjeNtFUg=;
        b=MfrrKL4w8T/mpcy79UxEblhIYP5zZ/KDosQdmbzRsqMeVw+ndy+RSe7QQ8DCTAGvS3
         4mF9ArHEWPWiUOzLUA5uegeWvISzUQnFFuGuRVCnEFcEvdbnPzvcZMkMRR60d5daDQsQ
         uLDS8pk5zWJ80bQ1pCsEdNYvHNrDoxrv8CRYr8guq+xh0ISsT5NEeUCe9mzZbyX2ZlQ8
         6IdjeZaeewK2LhOMPwFnRx5F0mzSg76OeedouQECpX8MxsNAFA8B+rQzbOoyvShSqExU
         z9zZk2CSsMnggX3q9saYEwnbfvyMRcAXc/Hi40ylp/HQ7NtP72jkHZnX99Naeb2gK6DO
         acIQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=SNNXNvfr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a806df1123si1036685385a.690.2024.09.02.06.50.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Sep 2024 06:50:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=SNNXNvfr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sl7S9-0006Iz-1C; Mon, 02 Sep 2024 09:50:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1sl7S4-0006GA-VX; Mon, 02 Sep 2024 09:50:40 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1sl7S2-0001Mu-Qd; Mon, 02 Sep 2024 09:50:40 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-2d88c5d76eeso1373928a91.2; 
 Mon, 02 Sep 2024 06:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725285035; x=1725889835; darn=nongnu.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=86Wtjwlk7p61ZOojwtzGDO05XFu8qOxdfefgXGWxunk=;
 b=SNNXNvfreC3EuxZc9sjbZzoNik/ef6qhzQOkxk2veZ7rjypc2pUmOPGapb5GHg9vdD
 BcW2s05wgUs7NGZfDI6Duo0reThzbWMJg/PgZFqTt7JS8eIFagcZaBt88UEn0ld+0iaX
 uWLJrHioS0t7f2pOUbcers24K9CBDXiI/Tara0YJ8lNUD8ua4n3F4WW6qu2Gy0p0dcZZ
 Cg2NU1RX7ZTH0HZUIyiyo0JnrARZ9sa7hDHhHm2e5uurihyk7tX7YZtW8M6PFxig8khr
 Q7r7MA+3QYbNsosAcLU3F3c1tKX8Vitm+uuiXU7DPE8dSVig1UdLX912NwBblvUJDHRh
 jMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725285035; x=1725889835;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=86Wtjwlk7p61ZOojwtzGDO05XFu8qOxdfefgXGWxunk=;
 b=FM5z5CPSHjp1FU7Ay8bWPiZt7Ma5i93PcfLBn6Ig1wjnIg801aHUVw0bHm42mcP1LI
 ho6CU+vl7h71Pr1V8U/H86yIbA6RNid7qEEsfX866Sy6x3RWQNr/hrHYEArheiQug3AV
 BU1ayu7LvmjXAp8MKCjfsOhGeqfLz4FAOMUPEMGeYTBXAEBB1tZQnmgs9zIt8mgf/sI+
 CaNavj4jm9n5KDUKrJNOudN7uOLMMWG8YKIvOykX8ZO+BfPK8Nb6pZUBTO7UVBq9L3H0
 6zC1Lm2QDexz1a57S/q78HbDNGeuPpoSqVz4sCYMf46CeStrPD4srHZcFypRKsIlTkiN
 iiZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbAd4EDYcE/RoVey081PihVNS7296Atg5iaosUoSzSXDgVaLYUUejVaNssbFpeM/TO5AybJts0SQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy+uuiuC5UqyQhlGdeDKBJkmJytiWFT0JBuhKhrjlSN8AMjGDpa
 BL1Rx7AAQPLx4fNWB4KhI+4sJjP4tnxhJt9bF/IIzXqisQQXHU2B97/dcJ6pmE5zNGVW4xb/q0W
 rMFO/dDAZ/6mIgiycDpbNXHlIpHjN8dy446c=
X-Received: by 2002:a17:90b:4b92:b0:2da:5289:89a2 with SMTP id
 98e67ed59e1d1-2da52898ae1mr306525a91.41.1725285034872; Mon, 02 Sep 2024
 06:50:34 -0700 (PDT)
MIME-Version: 1.0
From: Mario Marietto <marietto2008@gmail.com>
Date: Mon, 2 Sep 2024 15:49:58 +0200
Message-ID: <CA+1FSiirzpq4wjcKTLSexiOWtv26sgD37h=wA2qxv8Qh5MW_-w@mail.gmail.com>
Subject: Error : init: partition(s) not found in /sys, waiting for their
 uevent(s): mmcblk0p2, mmcblk0p3 while trying to emulate Android 14 on Ubuntu
 24.04 X64 bit using qemu-system-aarch64.
To: qemu-discuss@nongnu.org, qemu-arm <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000a3dfc7062123392b"
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
X-TUID: EYEFyysRlhFf

--000000000000a3dfc7062123392b
Content-Type: text/plain; charset="UTF-8"

Hello.

I would like to emulate Android 14 on my Ubuntu 24.04 OS X64 bit using
qemu-system-aarch64. I tried using the following parameters :

qemu-system-aarch64 \
        -smp 4 \
        -m 2048 \
        -cpu cortex-a72 \
        -M virt \
        -device virtio-gpu-pci,xres=1024,yres=768 \
        -display sdl,gl=on \
        -device usb-ehci \
        -device usb-kbd \
        -device virtio-tablet-pci \
        -usb \
        -serial stdio \
        -kernel /mnt/zroot-133/_OS/Android/rpi4/Image \
        -initrd /mnt/zroot-133/_OS/Android/rpi4/ramdisk.img \
        -drive
index=0,if=none,id=system,file=/mnt/zroot-133/_OS/Android/rpi4/boot.img \
        -device virtio-blk-pci,drive=boot \
        -drive
index=1,if=none,id=system,file=/mnt/zroot-133/_OS/Android/rpi4/system.img \
        -device virtio-blk-pci,drive=system \
        -drive
index=2,if=none,id=vendor,file=/mnt/zroot-133/_OS/Android/rpi4/vendor.img \
        -device virtio-blk-pci,drive=vendor \
-append "console=ttyAMA0,38400 drm.debug=0x0 rootwait rootdelay=5
root=/dev/mmcblk0p2 androidboot.hardware=rpi4
androidboot.selinux=permissive security=selinux selinux=1
androidboot.qemu.hw.mainkeys=0 androidboot.lcd.density=160"

The error I get in short is :

[ 1.993668] init: bool
android::init::BlockDevInitializer::InitDevices(std::set<std::string>):
partition(s) not found in /sys, waiting for their uevent(s): mmcblk0p2,
mmcblk0p3


One user suggested to :




Hi!!! The "/sys" is a "dynamic fs" created at ram from the kernel, to
export a lot of things...so most of the files only exist at runtime.
Normally, the partitions from the block device have a symlink at
/sys/<something>/<...> that points to /dev/ block node. It seems that there
are no such files under /sys according to what init is looking for. You can
double check this at init source code to check the exact path but I'm
guessing that you'll have to change the qemu arguments regarding the block
device.

About userdata.img I think it's normal since in the old days, the image was
a "empty sparse image", that means, at the first flashing process, there
isn't userdata information, we're just "flashing the partition" with empty
data.
Tks!!!



So,in short I should change the qemu arguments regarding the block device.
I tried in this way :


qemu-system-aarch64 \
        -smp 4 \
        -m 2048 \
        -cpu cortex-a72 \
        -M virt \
        -device virtio-gpu-pci,xres=1024,yres=768 \
        -display sdl,gl=on \
        -device usb-ehci \
        -device usb-kbd \
        -device virtio-tablet-pci \
        -usb \
        -serial stdio \
        -kernel /mnt/zroot-133/_OS/Android/rpi4/Image \
        -initrd /mnt/zroot-133/_OS/Android/rpi4/ramdisk.img \
        -hda /mnt/zroot-133/_OS/Android/rpi4/boot.img \
        -hdb /mnt/zroot-133/_OS/Android/rpi4/system.img \
        -hdc /mnt/zroot-133/_OS/Android/rpi4/vendor.img \
        -append "console=ttyAMA0,38400 drm.debug=0x0 rootwait rootdelay=5
root=/dev/mmcblk0p2 androidboot.hardware=rpi4
androidboot.selinux=permissive security=selinux selinux=1
androidboot.qemu.hw.mainkeys=0 androidboot.lcd.density=160"

but the error is still there. Do you know some different alternative block
devices to try ? thanks.

-- 
Mario.

--000000000000a3dfc7062123392b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hello.</div><div><br></div><div>I wo=
uld like to=20
emulate Android 14 on my Ubuntu 24.04 OS X64 bit using=20
qemu-system-aarch64. I tried using the following parameters :</div><div><br=
></div><div><span class=3D"gmail-im">qemu-system-aarch64 \<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 -smp 4 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -m 2048 \<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 -cpu cortex-a72 \<br></span>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 -M virt \<span class=3D"gmail-im"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -devi=
ce virtio-gpu-pci,xres=3D1024,yres=3D768 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
display sdl,gl=3Don \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device usb-ehci \<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device usb-kbd \<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 -device virtio-tablet-pci \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -usb \<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -serial stdio \<br></span>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -kernel /mnt/zroot-133/_OS/Android/rpi4/Image \<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 -initrd /mnt/zroot-133/_OS/Android/rpi4/ramdisk.img \</div><div>=
=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0 -drive index=3D0,if=3Dnone,id=3Dsystem,fil=
e=3D/mnt/zroot-133/_OS/Android/rpi4/boot.img \<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 -device virtio-blk-pci,drive=3Dboot \</div><div>=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -drive index=3D1,if=3Dnone,id=3Dsystem,file=3D/mnt/zr=
oot-133/_OS/Android/rpi4/system.img \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -devic=
e virtio-blk-pci,drive=3Dsystem \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -drive ind=
ex=3D2,if=3Dnone,id=3Dvendor,file=3D/mnt/zroot-133/_OS/Android/rpi4/vendor.=
img \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-blk-pci,drive=3Dvendor =
\ <br>-append &quot;console=3DttyAMA0,38400 drm.debug=3D0x0 rootwait rootde=
lay=3D5
 root=3D/dev/mmcblk0p2 androidboot.hardware=3Drpi4=20
androidboot.selinux=3Dpermissive security=3Dselinux selinux=3D1=20
androidboot.qemu.hw.mainkeys=3D0 androidboot.lcd.density=3D160&quot;</div><=
div><br></div><div>The error I get in short is :</div><div><br></div><div><=
span><span><p>
    <span>[ 1.993668] init: bool android::init::BlockDevInitializer::InitDe=
vices(std::set&lt;std::string&gt;): partition(s) not found in /sys, waiting=
 for their uevent(s): mmcblk0p2, mmcblk0p3</span><br></p><p><br></p><p>One =
user suggested to :</p><p><br>
  </p></span></span></div><div><div><table cellpadding=3D"0"><tbody><tr><td=
><table cellpadding=3D"0"><tbody><tr><td><br><br></td></tr></tbody></table>=
</td><td><div>Hi!!! The &quot;/sys&quot; is a &quot;dynamic fs&quot; create=
d at ram from the kernel, to=20
export a lot of things...so most of the files only exist at runtime.=20
Normally, the partitions from the block device have a symlink at=20
/sys/&lt;something&gt;/&lt;...&gt; that points to /dev/ block node. It=20
seems that there are no such files under /sys according to what init is=20
looking for. You can double check this at init source code to check the=20
exact path but I&#39;m guessing that you&#39;ll have to change the qemu=20
arguments regarding the block device.<br><br>About userdata.img I think=20
it&#39;s normal since in the old days, the image was a &quot;empty sparse=
=20
image&quot;, that means, at the first flashing process, there isn&#39;t use=
rdata=20
information, we&#39;re just &quot;flashing the partition&quot; with empty d=
ata.<br>Tks!!!</div><div><br></div></td></tr></tbody></table></div></div><t=
able cellpadding=3D"0"><tbody><tr><td><br></td><td rowspan=3D"2"><br>So,in =
short I should change the qemu=20
arguments regarding the block device. I tried in this way :<br><br><br><div=
><span class=3D"gmail-im">qemu-system-aarch64 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 -smp 4 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -m 2048 \<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 -cpu cortex-a72 \<br></span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -M virt =
\<span class=3D"gmail-im"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-gp=
u-pci,xres=3D1024,yres=3D768 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -display sdl,=
gl=3Don \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device usb-ehci \<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 -device usb-kbd \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device =
virtio-tablet-pci \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -usb \<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 -serial stdio \<br></span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -kernel=
 /mnt/zroot-133/_OS/Android/rpi4/Image \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -in=
itrd /mnt/zroot-133/_OS/Android/rpi4/ramdisk.img \</div>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 -hda /mnt/zroot-133/_OS/Android/rpi4/boot.img \<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -hdb /mnt/zroot-133/_OS/Android/rpi4/system.im=
g \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -hdc /mnt/zroot-133/_OS/Android/rpi4/ven=
dor.img \<br>=C2=A0
 =C2=A0 =C2=A0 =C2=A0 -append &quot;console=3DttyAMA0,38400 drm.debug=3D0x0=
 rootwait rootdelay=3D5
 root=3D/dev/mmcblk0p2 androidboot.hardware=3Drpi4=20
androidboot.selinux=3Dpermissive security=3Dselinux selinux=3D1=20
androidboot.qemu.hw.mainkeys=3D0 androidboot.lcd.density=3D160&quot;</td></=
tr></tbody></table><div></div><table cellpadding=3D"0"><tbody><tr></tr></tb=
ody></table><table cellpadding=3D"0"><tbody><tr><td colspan=3D"3"><table ce=
llpadding=3D"0"><tbody><tr><td><div id=3D"m_5541545894965738869m_-646450509=
2228251337m_8113901380321572879gmail-:q5" aria-haspopup=3D"true" role=3D"bu=
tton" aria-label=3D"Show details"><img src=3D"https://mail.google.com/mail/=
u/0/images/cleardot.gif" alt=3D"" class=3D"gmail-CToWUd"></div><div aria-ha=
spopup=3D"true" role=3D"button" aria-label=3D"Show details"><br></div><div =
aria-haspopup=3D"true" role=3D"button" aria-label=3D"Show details">but the =
error is still there. Do you know some different alternative block devices =
to try ? thanks.<br></div></td></tr></tbody></table></td></tr></tbody></tab=
le></div><br><span class=3D"gmail_signature_prefix">-- </span><br><div dir=
=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature">Mario=
.<br></div></div>

--000000000000a3dfc7062123392b--
