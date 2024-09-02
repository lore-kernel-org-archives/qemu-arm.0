Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1216973njf;
        Mon, 2 Sep 2024 12:54:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVMkN7EpwZu/2PNI0aR0PtKsljkBrXujhuxLBejzSsb+O9mR/x57JVDggUvyf60ZCoLgSiUb78aU67Seg==@linaro.org
X-Google-Smtp-Source: AGHT+IEzkFrn2utM4DvSwhIDW1R9NYNoJSw5latCemcuulHflp3qQUjTA+JY+38v/ShX59IhCSJ9
X-Received: by 2002:a05:6214:4b09:b0:6c3:54fe:ebef with SMTP id 6a1803df08f44-6c3558359fbmr111766116d6.43.1725306891028;
        Mon, 02 Sep 2024 12:54:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725306891; cv=none;
        d=google.com; s=arc-20160816;
        b=QuVJqXsmU0inbgXNKLK0U4Mk4rFU+9YD/8ou4b88OlMuCv3eq6l0rx/pWvX7TtdYQm
         4N4F0sZ6myQGPq0NO0HBmHymmecOfUjtZiHyXj/bbbvXlBIJClpALEW+HefJvIcL8JB1
         vCkldkE2rKxuz5gJ6KYiG/7cnwi7ztlFQ2Fbb4bqZ7Ns9tel5OAkTa5MUiEsrSJRGBJP
         vAs2+z/yZ3clRatNXw8pif6ixYwqR15BvAtE1p2x5Bq0fJiMQPwnTpFx16I+fNjpmQmh
         SNvC61F3RbQvs+cNITsX9A4V2422c0gcAwvf1P08P+pciGnIpSQEZlXjk+NyjkDf1IK1
         jlkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=UQzmTeAlcTfX5qDBu1CLrmDYyJ0sJk0Zx1G4YpsgzU8=;
        fh=IimhuLcLv8z9YeIAp2cWl+Lpn6p8o/aRjZzb4f8fY0U=;
        b=OFTWY6LURS2xWvXhQDMclqNfQwKPJcDL30fIo6W+sJbXxBje60zlIkAhxD4KDlg3/Z
         aTvKhN8f9tu4P1vn9eNjKD3Oi+/okhsCG86iJ9olJDkOmSWAMmi4tKUigziltlyhprPQ
         YQLgezdA86RiwCfAuVv9MTcbFlgNWKp08xdi49T9jtTbTbV7ioTWrnXapjgw5TPs8EgZ
         UXdqw5b35KcMk5BPrahjqSIruy9GjZfWIYo3wHFyCCGvBi4RefpCrz/zcqfdWXxkuFYb
         oEYDbWXELZQuwfDKvFK48tOaQ9jtJPb8pq3PJDYf5KfT1j09ON+DZ6XWoPwiWDnevgIl
         dNiw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=kDRPeSGR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c36e3c5e0esi15536296d6.259.2024.09.02.12.54.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Sep 2024 12:54:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=kDRPeSGR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slD7u-0007Ql-09; Mon, 02 Sep 2024 15:54:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1slD7p-0007Nk-NL; Mon, 02 Sep 2024 15:54:11 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1slD7n-0006Rm-6r; Mon, 02 Sep 2024 15:54:09 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-2d8b96c18f0so1181948a91.2; 
 Mon, 02 Sep 2024 12:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725306845; x=1725911645; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UQzmTeAlcTfX5qDBu1CLrmDYyJ0sJk0Zx1G4YpsgzU8=;
 b=kDRPeSGRJONyQWIzdsixGYdcPkQHDGb4YcYOACPsZFntkqG/MSiZ3/HADkfComsrVR
 AANgasChrdpguICl3NTLBerpWAz3l3oEtjoyUok4kqhMFj/CY4xrH+oZnSrf+vcUj4N6
 f8HMi2Y3hYfuyQbclPWYFnfHUH80Dop6c259rcBijZRde07NK5E8Ko5tlkvcTcELMd7P
 hc7d8Ex8vVF842nYhS+xhPIDxXytV2nVkhv4qX6mvuSFt38dd8aT7KDXN4bjIOTiETM+
 KlGUCRSNAanq8ZlEfbGEEhP/8UAdUur/Rqm6fQdygvj2388TuSiw+f3X9vTtPJrVZAaX
 6cbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725306845; x=1725911645;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UQzmTeAlcTfX5qDBu1CLrmDYyJ0sJk0Zx1G4YpsgzU8=;
 b=rE7zzNNeiXwIsQ6DhZgNliELpjclvjLwq6g7HEDYNKKlUD77RfYfnCvoqbOURkQyfb
 eWGUrrAnWE+s9LqqBiordqaXZqCenlOhpRHZjBCCyHMqU3QHl7+DIm7cc0LZaApobvlX
 HWk3ic512F19y7h0dUgQxX+2eNY4jI9gEGEJ/cbw19i+5iV2RLsJjB3oCSB7FGBfWOLH
 sRCI9oBCmX/zUyO8pg9s3q2iiw9ElpwsnzspzHLCI3h2NpsyodjuzfQZxltJ3L8nouWZ
 EDJ4Bs1/J7YwDBD+B8vkGaSqobSw5ed3HbuSAHaG+0WmdB4tJHROu0pK6M1GT/rArqV9
 h+8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWidFe/luThnWysfssIJTdoUeDQxIiw7F5FeoeMsMkwhQKKDjvIRxowp2voKfOqIAhaxLISZguYGw==@nongnu.org
X-Gm-Message-State: AOJu0YwxrL/C4tnJav37gC4qfW8oBk2u4UNpdNiejhj4mf+J7LvTzajT
 1Wh762DDRtFzGbj+A9mCyJQ+hF5V+YPD+qetszIaZE5vfpVS5tDgX/AGRw9FdR3aoS1m/qoUFRI
 CsK/yBoEjrDfldSn51ROgAkDe15BK+ZrOjJk=
X-Received: by 2002:a17:90a:3988:b0:2d8:aa9c:e386 with SMTP id
 98e67ed59e1d1-2d8aa9ce3a4mr7967882a91.14.1725306845048; Mon, 02 Sep 2024
 12:54:05 -0700 (PDT)
MIME-Version: 1.0
References: <CA+1FSiirzpq4wjcKTLSexiOWtv26sgD37h=wA2qxv8Qh5MW_-w@mail.gmail.com>
 <23d60255-614a-4a06-b449-644f215555d0@linaro.org>
In-Reply-To: <23d60255-614a-4a06-b449-644f215555d0@linaro.org>
From: Mario Marietto <marietto2008@gmail.com>
Date: Mon, 2 Sep 2024 21:53:28 +0200
Message-ID: <CA+1FSiitcSBa3JZaAZMGkdB356d2M0rPqscwFnNXGML5HghVCQ@mail.gmail.com>
Subject: Re: Error : init: partition(s) not found in /sys, waiting for their
 uevent(s): mmcblk0p2, mmcblk0p3 while trying to emulate Android 14 on Ubuntu
 24.04 X64 bit using qemu-system-aarch64.
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-discuss@nongnu.org, qemu-arm <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000a0b9680621284d6e"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=marietto2008@gmail.com; helo=mail-pj1-x1031.google.com
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
X-TUID: x7RW7Wb2rdGE

--000000000000a0b9680621284d6e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Pierrick.

With Cuttlefish can I emulate Android 14 for arm64 ? I ask because in your
script I read :

"/home/user/.work/qemu/build/qemu-system-x86_64", so,I suspect that you
have emulated Android x64 bit,but I need arm64.

I also read "for aarch64 images: select
aosp_cf_arm64_only_phone-trunk_staging-userdebug"
: I'm not able to download this kind of images. I don't understand how the
Branch Grid works. Can you explain to me a little bit more ?



On Mon, Sep 2, 2024 at 8:47=E2=80=AFPM Pierrick Bouvier <pierrick.bouvier@l=
inaro.org>
wrote:

> Hello Mario,
>
> very recently, I had to investigate booting time of Android when using
> QEMU. You can probably manage to boot this with only QEMU alone, but in
> my experience, using Cuttlefish tooling is an easier approach.
>
> If you really want to use only QEMU, you can use Cuttlefish to get exact
> command line used (which disk goes where), and iterate from that.
>
> Instructions:
>
> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Andro=
id+using+QEMU
>
> As you'll see, I could not get a direct graphic output, but using
> scrcpy, it worked well for me. Hope it can fit your use case.
>
> Regards,
> Pierrick
>
> On 9/2/24 06:49, Mario Marietto wrote:
> > Hello.
> >
> > I would like to emulate Android 14 on my Ubuntu 24.04 OS X64 bit using
> > qemu-system-aarch64. I tried using the following parameters :
> >
> > qemu-system-aarch64 \
> >          -smp 4 \
> >          -m 2048 \
> >          -cpu cortex-a72 \
> >          -M virt \
> >          -device virtio-gpu-pci,xres=3D1024,yres=3D768 \
> >          -display sdl,gl=3Don \
> >          -device usb-ehci \
> >          -device usb-kbd \
> >          -device virtio-tablet-pci \
> >          -usb \
> >          -serial stdio \
> >          -kernel /mnt/zroot-133/_OS/Android/rpi4/Image \
> >          -initrd /mnt/zroot-133/_OS/Android/rpi4/ramdisk.img \
> >          -drive
> > index=3D0,if=3Dnone,id=3Dsystem,file=3D/mnt/zroot-133/_OS/Android/rpi4/=
boot.img \
> >          -device virtio-blk-pci,drive=3Dboot \
> >          -drive
> >
> index=3D1,if=3Dnone,id=3Dsystem,file=3D/mnt/zroot-133/_OS/Android/rpi4/sy=
stem.img \
> >          -device virtio-blk-pci,drive=3Dsystem \
> >          -drive
> >
> index=3D2,if=3Dnone,id=3Dvendor,file=3D/mnt/zroot-133/_OS/Android/rpi4/ve=
ndor.img \
> >          -device virtio-blk-pci,drive=3Dvendor \
> > -append "console=3DttyAMA0,38400 drm.debug=3D0x0 rootwait rootdelay=3D5
> > root=3D/dev/mmcblk0p2 androidboot.hardware=3Drpi4
> > androidboot.selinux=3Dpermissive security=3Dselinux selinux=3D1
> > androidboot.qemu.hw.mainkeys=3D0 androidboot.lcd.density=3D160"
> >
> > The error I get in short is :
> >
> > [ 1.993668] init: bool
> > android::init::BlockDevInitializer::InitDevices(std::set<std::string>):
> > partition(s) not found in /sys, waiting for their uevent(s): mmcblk0p2,
> > mmcblk0p3
> >
> >
> > One user suggested to :
> >
> >
> >
> >
> >
> > Hi!!! The "/sys" is a "dynamic fs" created at ram from the kernel, to
> > export a lot of things...so most of the files only exist at runtime.
> > Normally, the partitions from the block device have a symlink at
> > /sys/<something>/<...> that points to /dev/ block node. It seems that
> > there are no such files under /sys according to what init is looking
> > for. You can double check this at init source code to check the exact
> > path but I'm guessing that you'll have to change the qemu arguments
> > regarding the block device.
> >
> > About userdata.img I think it's normal since in the old days, the image
> > was a "empty sparse image", that means, at the first flashing process,
> > there isn't userdata information, we're just "flashing the partition"
> > with empty data.
> > Tks!!!
> >
> >
> >
> > So,in short I should change the qemu arguments regarding the block
> > device. I tried in this way :
> >
> >
> > qemu-system-aarch64 \
> >          -smp 4 \
> >          -m 2048 \
> >          -cpu cortex-a72 \
> >          -M virt \
> >          -device virtio-gpu-pci,xres=3D1024,yres=3D768 \
> >          -display sdl,gl=3Don \
> >          -device usb-ehci \
> >          -device usb-kbd \
> >          -device virtio-tablet-pci \
> >          -usb \
> >          -serial stdio \
> >          -kernel /mnt/zroot-133/_OS/Android/rpi4/Image \
> >          -initrd /mnt/zroot-133/_OS/Android/rpi4/ramdisk.img \
> >          -hda /mnt/zroot-133/_OS/Android/rpi4/boot.img \
> >          -hdb /mnt/zroot-133/_OS/Android/rpi4/system.img \
> >          -hdc /mnt/zroot-133/_OS/Android/rpi4/vendor.img \
> >        -append "console=3DttyAMA0,38400 drm.debug=3D0x0 rootwait rootde=
lay=3D5
> > root=3D/dev/mmcblk0p2 androidboot.hardware=3Drpi4
> > androidboot.selinux=3Dpermissive security=3Dselinux selinux=3D1
> > androidboot.qemu.hw.mainkeys=3D0 androidboot.lcd.density=3D160"
> >
> >
> > but the error is still there. Do you know some different alternative
> > block devices to try ? thanks.
> >
> >
> > --
> > Mario.
>


--=20
Mario.

--000000000000a0b9680621284d6e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Pierrick.</div><div><br></div><div>With  Cuttle=
fish can I emulate Android 14 for arm64 ? I ask because in your script I re=
ad : <br></div><div><br></div><div>&quot;<span class=3D"gmail-prismjs gmail=
-cc-1slwsjo"><code class=3D"gmail-language-" style=3D"white-space:pre"><spa=
n class=3D"gmail-">/home/user/.work/qemu/build/qemu-system-x86_64&quot;, so=
,I suspect that you have emulated Android x64 bit,but I need arm64. </span>=
</code></span></div><div><br></div><div>I also read &quot;for aarch64 image=
s: select <code class=3D"gmail-code gmail-cc-1o5d2cw">aosp_cf_arm64_only_ph=
one-trunk_staging-userdebug&quot; : I&#39;m not able to download this kind =
of images. I don&#39;t understand how the Branch Grid works. Can you explai=
n to me a little bit more ? <br></code></div><div><span class=3D"gmail-pris=
mjs gmail-cc-1slwsjo"><code class=3D"gmail-language-" style=3D"white-space:=
pre"><span class=3D"gmail-"><br></span></code></span></div><div><br> </div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Mon, Sep 2, 2024 at 8:47=E2=80=AFPM Pierrick Bouvier &lt;<a href=3D"mail=
to:pierrick.bouvier@linaro.org">pierrick.bouvier@linaro.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Mario,<br>
<br>
very recently, I had to investigate booting time of Android when using <br>
QEMU. You can probably manage to boot this with only QEMU alone, but in <br=
>
my experience, using Cuttlefish tooling is an easier approach.<br>
<br>
If you really want to use only QEMU, you can use Cuttlefish to get exact <b=
r>
command line used (which disk goes where), and iterate from that.<br>
<br>
Instructions: <br>
<a href=3D"https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29464068097/=
Run+Android+using+QEMU" rel=3D"noreferrer" target=3D"_blank">https://linaro=
.atlassian.net/wiki/spaces/QEMU/pages/29464068097/Run+Android+using+QEMU</a=
><br>
<br>
As you&#39;ll see, I could not get a direct graphic output, but using <br>
scrcpy, it worked well for me. Hope it can fit your use case.<br>
<br>
Regards,<br>
Pierrick<br>
<br>
On 9/2/24 06:49, Mario Marietto wrote:<br>
&gt; Hello.<br>
&gt; <br>
&gt; I would like to emulate Android 14 on my Ubuntu 24.04 OS X64 bit using=
 <br>
&gt; qemu-system-aarch64. I tried using the following parameters :<br>
&gt; <br>
&gt; qemu-system-aarch64 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -smp 4 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -m 2048 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -cpu cortex-a72 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -M virt \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-gpu-pci,xres=3D1024,y=
res=3D768 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -display sdl,gl=3Don \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -device usb-ehci \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -device usb-kbd \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-tablet-pci \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -usb \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -serial stdio \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -kernel /mnt/zroot-133/_OS/Android/r=
pi4/Image \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -initrd /mnt/zroot-133/_OS/Android/r=
pi4/ramdisk.img \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0 -drive <br>
&gt; index=3D0,if=3Dnone,id=3Dsystem,file=3D/mnt/zroot-133/_OS/Android/rpi4=
/boot.img \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-blk-pci,drive=3Dboot =
\<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -drive <br>
&gt; index=3D1,if=3Dnone,id=3Dsystem,file=3D/mnt/zroot-133/_OS/Android/rpi4=
/system.img \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-blk-pci,drive=3Dsyste=
m \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -drive <br>
&gt; index=3D2,if=3Dnone,id=3Dvendor,file=3D/mnt/zroot-133/_OS/Android/rpi4=
/vendor.img \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-blk-pci,drive=3Dvendo=
r \<br>
&gt; -append &quot;console=3DttyAMA0,38400 drm.debug=3D0x0 rootwait rootdel=
ay=3D5 <br>
&gt; root=3D/dev/mmcblk0p2 androidboot.hardware=3Drpi4 <br>
&gt; androidboot.selinux=3Dpermissive security=3Dselinux selinux=3D1 <br>
&gt; androidboot.qemu.hw.mainkeys=3D0 androidboot.lcd.density=3D160&quot;<b=
r>
&gt; <br>
&gt; The error I get in short is :<br>
&gt; <br>
&gt; [ 1.993668] init: bool <br>
&gt; android::init::BlockDevInitializer::InitDevices(std::set&lt;std::strin=
g&gt;): <br>
&gt; partition(s) not found in /sys, waiting for their uevent(s): mmcblk0p2=
, <br>
&gt; mmcblk0p3<br>
&gt; <br>
&gt; <br>
&gt; One user suggested to :<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt; Hi!!! The &quot;/sys&quot; is a &quot;dynamic fs&quot; created at ram =
from the kernel, to <br>
&gt; export a lot of things...so most of the files only exist at runtime. <=
br>
&gt; Normally, the partitions from the block device have a symlink at <br>
&gt; /sys/&lt;something&gt;/&lt;...&gt; that points to /dev/ block node. It=
 seems that <br>
&gt; there are no such files under /sys according to what init is looking <=
br>
&gt; for. You can double check this at init source code to check the exact =
<br>
&gt; path but I&#39;m guessing that you&#39;ll have to change the qemu argu=
ments <br>
&gt; regarding the block device.<br>
&gt; <br>
&gt; About userdata.img I think it&#39;s normal since in the old days, the =
image <br>
&gt; was a &quot;empty sparse image&quot;, that means, at the first flashin=
g process, <br>
&gt; there isn&#39;t userdata information, we&#39;re just &quot;flashing th=
e partition&quot; <br>
&gt; with empty data.<br>
&gt; Tks!!!<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt; So,in short I should change the qemu arguments regarding the block <br=
>
&gt; device. I tried in this way :<br>
&gt; <br>
&gt; <br>
&gt; qemu-system-aarch64 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -smp 4 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -m 2048 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -cpu cortex-a72 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -M virt \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-gpu-pci,xres=3D1024,y=
res=3D768 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -display sdl,gl=3Don \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -device usb-ehci \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -device usb-kbd \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-tablet-pci \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -usb \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -serial stdio \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -kernel /mnt/zroot-133/_OS/Android/r=
pi4/Image \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -initrd /mnt/zroot-133/_OS/Android/r=
pi4/ramdisk.img \<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -hda /mnt/zroot-133/_=
OS/Android/rpi4/boot.img \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -hdb /mnt/zroot-133/_OS/Android/rpi4=
/system.img \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -hdc /mnt/zroot-133/_OS/Android/rpi4=
/vendor.img \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 -append &quot;console=3DttyAMA0,38400 drm.d=
ebug=3D0x0 rootwait rootdelay=3D5 <br>
&gt; root=3D/dev/mmcblk0p2 androidboot.hardware=3Drpi4 <br>
&gt; androidboot.selinux=3Dpermissive security=3Dselinux selinux=3D1 <br>
&gt; androidboot.qemu.hw.mainkeys=3D0 androidboot.lcd.density=3D160&quot;<b=
r>
&gt; <br>
&gt; <br>
&gt; but the error is still there. Do you know some different alternative <=
br>
&gt; block devices to try ? thanks.<br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; Mario.<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>

--000000000000a0b9680621284d6e--
