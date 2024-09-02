Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1116403njf;
        Mon, 2 Sep 2024 07:06:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXXnBhcuSeReBycONbJ6OzZH8T4VwhyvFTV5qWbReQPjGNdKlhBe5GVayCtktAC2mkG98qLH8IeYJBFtg==@linaro.org
X-Google-Smtp-Source: AGHT+IHPzEr683fapfzK78ZpFgqqOo+Ra2t3rXO40RYuJIwSE/YdKmwO3F6z2uAnJT7A8zEYZ33R
X-Received: by 2002:a05:6358:7241:b0:1b3:9f0b:89c3 with SMTP id e5c5f4694b2df-1b7ef5fe30emr898352755d.1.1725286004734;
        Mon, 02 Sep 2024 07:06:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725286004; cv=none;
        d=google.com; s=arc-20160816;
        b=lu3WAUQQuXTclst3Vn+KmQAzMAKCb04jVHq/ZZq8lFiLnOXSORWtg7ofl8vZeh+lum
         8e1ITGKx+dKCSY7RmKB0KUqr381lEoL8OQ/tXLc9PYnTZ8yAvCJNaXXWWVx5Av71vvJT
         9apNTjqwnQ7SZtrH9JfLPya7sNzeeSKkZGR22ZLlro7a+l0RU7sgB2nODqq+WwE9Wwwb
         T4Zrrglo0YrGg1d14PzyD+t7EGpi38ZPIQNl4w8rXmun2tFMh9T5Kug0kKXkwb/Ingdt
         ES6fhZ31mjZdJskkrZFOhb/K4qsZID/5LsX8TyHD/TS0wS7dS/S6TpSf/CVa6VV3vFj8
         CAVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=tSRWyi9ZXMyjmmXF8BTytQrMeZM3jkeS24R9/I7AJW8=;
        fh=q6kUTxCRb+sy33wgrgAztJJZ83iW5dUVQd/DFpbbJv4=;
        b=Wq/0DUunjmCeNV5HY0FL5EUDwQttrJi8z7KdRDrprkORgoBBJMCVLptXyOSbdK/ko2
         oFGgepFSGxPrRen0L3fxvlwkbjgHj1Vwcw+YRHQ4R0oH3OlAPwk/vQWB8Vqd+PgLI4Ej
         aZRCpmbrkYxHnKFtL7CIf1fryqTU1mOsMqra36vHZ9Ct3k+pZEWESZfdMNSUQsxtR1eZ
         XUYVxe1kPSbTC6YxLPedqAvWChJd0vFvbIVWtBNyzhfuIAL/Dn5JKIMQAQpWlXVsDTn3
         +hDEx+pc5KxETV3QrALRV2ZuRqnhgbQNdfHWeRs0/IpE1nXvfqvgg/97aTyxBw4J/DJU
         5l9A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=e+IAxxyx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5007127de07si2474411e0c.100.2024.09.02.07.06.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Sep 2024 07:06:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=e+IAxxyx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sl7hI-0001oA-Cl; Mon, 02 Sep 2024 10:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1sl7hC-0001ii-4z; Mon, 02 Sep 2024 10:06:18 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1sl7hA-0003Cr-2q; Mon, 02 Sep 2024 10:06:17 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-2d892997913so1299206a91.3; 
 Mon, 02 Sep 2024 07:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725285974; x=1725890774; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tSRWyi9ZXMyjmmXF8BTytQrMeZM3jkeS24R9/I7AJW8=;
 b=e+IAxxyx1CqxYceDQNid9hJxEtKnNXsHWso0ozZsT6VviA50pIZF/u4Rd2hlTNkdVF
 dJ4oIjdip98CNdQzOFoxnAFHv9APS4f0ea7oOXPG0TpShbQIvDPSb+egdZJhBzj2RKZ3
 ZsYFfe+lSp1AOE3Uzq7jpw+H9v36ADiFo10gaQul6pnQcCP2Rz1iQY4vDSRNqvApESeV
 RFtmrXJVPikKC5hcqM8Zb2F2FiCz9KmYP++pxScq9/AgWgowXa4kQ/CG+zFSRHm2LQmR
 i6Ef2kQE68hAPZin9eXERKKEWg9/Wq6AUsOAOGAMPAuurxljphrXAHVFeboFYzIy+kMe
 IDJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725285974; x=1725890774;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tSRWyi9ZXMyjmmXF8BTytQrMeZM3jkeS24R9/I7AJW8=;
 b=IJdqVjEC7hzOBrAtr8Gu3ra4OsisTW//CGbus8PG8S1dPsb+p6bp0XZFRxE8qvBuY3
 /p8Wzur6HP96IoFEbW5/CdJ1AyK32MUZIXL9x/9K0lBciq+PBWIkP2lZSpwluieerdIj
 lkrxsYl0SX3+UGarFjaaYW+GrUesbRqaeTP3RrgkWReCm5g78APuOq9kBMwAiTZNmNUM
 K4XjYR/bN5fD9A6hXKwVNcpd75fPADim/THYaQO3NcXWpYYqRNi6nDTTf1Syq3OxB5h3
 /Li736SRlhe2gIvmfipi+lrQmK/muKHGygcdj3H/pbSUgyE41WCoe9JZUpS3a6XLFIEt
 gRFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+IKI5LUP9alevvErj7tJjX6vJggkkr6TBs1ux+z7SuDwlHxTrwKLnqm/F6eV+jjomvUl0x4X33Q==@nongnu.org
X-Gm-Message-State: AOJu0YykgwhWV8B/MvEl6QIIe/ua2L0omZ8EFJYVblPbDx0om6AZSAMT
 PBmj33GfMMSNZmTn5WDSxIryjQ8sgGxgfhA3su6PnEWbV+8dlnkHVblNJ1/6Dda1c0b/IE0xFT3
 skJrcYOh/lQ0xCv2bxcz/+8XFY6vYSo4wS+8=
X-Received: by 2002:a17:90b:1917:b0:2d8:7a3b:730d with SMTP id
 98e67ed59e1d1-2d890546c3cmr6286043a91.21.1725285973935; Mon, 02 Sep 2024
 07:06:13 -0700 (PDT)
MIME-Version: 1.0
References: <CA+1FSiirzpq4wjcKTLSexiOWtv26sgD37h=wA2qxv8Qh5MW_-w@mail.gmail.com>
 <CAFEAcA81xDEubwm7ZYHZWtp_9nZh_gd9o=SZK3WOOm0-9Ja3rQ@mail.gmail.com>
In-Reply-To: <CAFEAcA81xDEubwm7ZYHZWtp_9nZh_gd9o=SZK3WOOm0-9Ja3rQ@mail.gmail.com>
From: Mario Marietto <marietto2008@gmail.com>
Date: Mon, 2 Sep 2024 16:05:37 +0200
Message-ID: <CA+1FSiiuThJXkgXOnzuw7U26kXaNuHBrJkmh2EXbtOcH00rKhA@mail.gmail.com>
Subject: Re: Error : init: partition(s) not found in /sys, waiting for their
 uevent(s): mmcblk0p2, mmcblk0p3 while trying to emulate Android 14 on Ubuntu
 24.04 X64 bit using qemu-system-aarch64.
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-discuss@nongnu.org, qemu-arm <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000009cd28b062123718e"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=marietto2008@gmail.com; helo=mail-pj1-x102c.google.com
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
X-TUID: LuKjqgC0RCYV

--0000000000009cd28b062123718e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

---> I think it would be better to fix the guest

I have no idea what to do. Please elaborate more.

Tried with these parameters :

-drive if=3Dsd,format=3Draw,file=3D/mnt/zroot-133/_OS/Android/rpi4/boot.img=
 \
-drive if=3Dsd,format=3Draw,file=3D/mnt/zroot-133/_OS/Android/rpi4/system.i=
mg \
-drive if=3Dsd,format=3Draw,file=3D/mnt/zroot-133/_OS/Android/rpi4/vendor.i=
mg \

but :

qemu-system-aarch64: -drive
if=3Dsd,format=3Draw,file=3D/mnt/zroot-133/_OS/Android/rpi4/boot.img: machi=
ne
type does not support if=3Dsd,bus=3D0,unit=3D0
qemu-system-aarch64: -drive
if=3Dsd,format=3Draw,file=3D/mnt/zroot-133/_OS/Android/rpi4/system.img: mac=
hine
type does not support if=3Dsd,bus=3D0,unit=3D1
qemu-system-aarch64: -drive
if=3Dsd,format=3Draw,file=3D/mnt/zroot-133/_OS/Android/rpi4/vendor.img: mac=
hine
type does not support if=3Dsd,bus=3D0,unit=3D2


On Mon, Sep 2, 2024 at 4:00=E2=80=AFPM Peter Maydell <peter.maydell@linaro.=
org>
wrote:

> On Mon, 2 Sept 2024 at 14:50, Mario Marietto <marietto2008@gmail.com>
> wrote:
>
> > [ 1.993668] init: bool
> android::init::BlockDevInitializer::InitDevices(std::set<std::string>):
> partition(s) not found in /sys, waiting for their uevent(s): mmcblk0p2,
> mmcblk0p3
> >
> >
> > One user suggested to :
> >
> >
> >
> >
> > Hi!!! The "/sys" is a "dynamic fs" created at ram from the kernel, to
> export a lot of things...so most of the files only exist at runtime.
> Normally, the partitions from the block device have a symlink at
> /sys/<something>/<...> that points to /dev/ block node. It seems that the=
re
> are no such files under /sys according to what init is looking for. You c=
an
> double check this at init source code to check the exact path but I'm
> guessing that you'll have to change the qemu arguments regarding the bloc=
k
> device.
>
> The mmcblk* device names are for an SD card.
>
> > So,in short I should change the qemu arguments regarding the block
> device. I tried in this way :
> >
> >
> > qemu-system-aarch64 \
> >         -smp 4 \
> >         -m 2048 \
> >         -cpu cortex-a72 \
> >         -M virt \
> >         -device virtio-gpu-pci,xres=3D1024,yres=3D768 \
> >         -display sdl,gl=3Don \
> >         -device usb-ehci \
> >         -device usb-kbd \
> >         -device virtio-tablet-pci \
> >         -usb \
> >         -serial stdio \
> >         -kernel /mnt/zroot-133/_OS/Android/rpi4/Image \
> >         -initrd /mnt/zroot-133/_OS/Android/rpi4/ramdisk.img \
> >         -hda /mnt/zroot-133/_OS/Android/rpi4/boot.img \
> >         -hdb /mnt/zroot-133/_OS/Android/rpi4/system.img \
> >         -hdc /mnt/zroot-133/_OS/Android/rpi4/vendor.img \
> >         -append "console=3DttyAMA0,38400 drm.debug=3D0x0 rootwait
> rootdelay=3D5 root=3D/dev/mmcblk0p2 androidboot.hardware=3Drpi4
> androidboot.selinux=3Dpermissive security=3Dselinux selinux=3D1
> androidboot.qemu.hw.mainkeys=3D0 androidboot.lcd.density=3D160"
>
> Your original command line was creating virtio-scsi disks via
> virtio-blk-pci. This one does the same, just via a different
> syntax (the default block type for the 'virt' board is IF_VIRTIO).
>
> I'm not sure exactly how you would create an SD card for the
> 'virt' board (probably by using the sdhci-pci device which is
> a PCI sd controller) but I think it would be better to fix
> the guest to use the virtio devices and not insist on looking
> for an SD card -- the performance from an emulated SD card
> will be a lot worse.
>
> thanks
> -- PMM
>


--=20
Mario.

--0000000000009cd28b062123718e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>---&gt; I think it would be better to fix the guest <=
br></div><div><br></div><div>I have no idea what to do. Please elaborate mo=
re.</div><div><br></div><div>Tried with these parameters :</div><div><span =
style=3D"font-family:monospace"><span style=3D"color:rgb(0,0,0);background-=
color:rgb(255,255,255)"><br></span></span></div><div><span style=3D"font-fa=
mily:monospace"><span style=3D"color:rgb(0,0,0);background-color:rgb(255,25=
5,255)">-drive if=3Dsd,format=3Draw,file=3D/mnt/zroot-133/_OS/Android/rpi4/=
boot.img \
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
a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, =
2 Sept 2024 at 14:50, Mario Marietto &lt;<a href=3D"mailto:marietto2008@gma=
il.com" target=3D"_blank">marietto2008@gmail.com</a>&gt; wrote:<br>
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

--0000000000009cd28b062123718e--
