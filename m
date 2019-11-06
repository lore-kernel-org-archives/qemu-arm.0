Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp59592wri;
        Wed, 6 Nov 2019 13:48:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqwl0H3UOw8L6FQ501NeSI4zdjqAvr+QO6PyQR7FlSLeIEILdUJ+M6OzCWBdigOZIXtJahjq
X-Received: by 2002:ac8:2361:: with SMTP id b30mr189698qtb.322.1573076924275;
        Wed, 06 Nov 2019 13:48:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573076924; cv=none;
        d=google.com; s=arc-20160816;
        b=NxoSyGhNBc5bMELRkqzRTXh5sMOA+PvI2zzo+W3FFELrpHa/ZO9Ez18phSYROVnHhV
         QvQTLBk+1kiMDgkp38dZVyxk8BBmtlo9ot+EhKiyxiciUjAdAhNMS7lrio/jrO5YA9d9
         mQ9/gFxAJvK+1XdfZYq72fFue4eYulIzvogxC8SWxf8cCcJTzcP9wdaIruu4a+jWbNUO
         cJwJT5/H/NC1pEHTZRga1VDl1ZB5pkQ55BGBTcNIwDerjxaVZEhuJLEWsjiQfQG1pjX5
         ETgkMhkep6Ke1dz8SGXjxF9M4CPZVd2VKRJvtTZ/yS2/b2nC5xCo8FeFQQd/DCZXnw88
         nD0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=nwlj6uiKUgzMCbTeGZiXPFxXjosIburAr5T/E5BOXKw=;
        b=PIS/sKHgP5E/oH5SjB6LvuHwDJMRHKchPUHxYVU6ok5WxizjrAxU2oZrEt87BwQqZi
         nlEyLAPjNSwitMAz+Xio7ZfYuqXwPMoG2jeofNvjq/3TxoIHxGr6t/02Yr4a8OydHLMl
         FVsGWzxGDCqYDH36KOHvV1t1jN5wbhddshs6p/IH9iYArx4CFx3rxNGRnHXQGjoJGph9
         hQqASSB6fHPkNCp6b+JcY2DWEckI0aZPr0yDvKcnaTDfms5gyaWF+l/iD/VPx6GsyF3o
         4ptn0GzsIkLX9sgA8C8bvpbeJlVv0Dwg50OYDJZU5CgwoFPa2keeADp5AoiOrvStKiFF
         9k1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=sKiTWxKF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m31si18191529qvc.91.2019.11.06.13.48.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Nov 2019 13:48:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=sKiTWxKF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iSTAR-0008Hd-Nf
	for alex.bennee@linaro.org; Wed, 06 Nov 2019 16:48:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52184)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcinguy@gmail.com>) id 1iSPd3-0007Ou-Rq
 for qemu-arm@nongnu.org; Wed, 06 Nov 2019 13:02:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcinguy@gmail.com>) id 1iSPd2-0006qN-DS
 for qemu-arm@nongnu.org; Wed, 06 Nov 2019 13:02:01 -0500
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c]:39715)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcinguy@gmail.com>) id 1iSPd2-0006oQ-8N
 for qemu-arm@nongnu.org; Wed, 06 Nov 2019 13:02:00 -0500
Received: by mail-vs1-xe2c.google.com with SMTP id y129so16580287vsc.6
 for <qemu-arm@nongnu.org>; Wed, 06 Nov 2019 10:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=nwlj6uiKUgzMCbTeGZiXPFxXjosIburAr5T/E5BOXKw=;
 b=sKiTWxKFqYMYxwPWXxvae6ZjgCpmz6leF8hEc+jxSnAbWvg6/fZ8c4C72cU5sDVIgI
 1ZiUmH7meRWsYBTCTOQOjfgtEIKKCXTPTSjtu3tSRHNIgoCXhq8egroznxxuFNHX6Ddj
 ijHHhPdCbczEOjLwgEUYD0bnbWPdVZ4Di3dReZ9imrnQ5/TkMGLtCJo8ntOa9J17B3aC
 8oiIGi64uW7vxKEpI1Tn2/5mXgZCjP3DCb9xph/oDtdY8BBQbKVhF+udUrd5OgGjiWGN
 KcUAN2NI/CvlOm7dbFwF/uqOS4n0LLPpSCw+b3y+yO5E1bSXMkBIuTrHzB0gFfiv4dER
 3i5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=nwlj6uiKUgzMCbTeGZiXPFxXjosIburAr5T/E5BOXKw=;
 b=mAa3fSVS5pDoVxmNCkv1ZyXu52H+lUsKstoc9HomoVQuL3uEU4IQiWXmCm+SbAirhY
 D+4xrrGIs9PTOo0ZIcIA8jsVSGtJnnAkhN0YBy3FPxIsNg9ewlTvRQ32YRWjdZl8owEH
 CMrQck7d13olcuTgtQuSUhmhyiCb6Uj+9hYA1uBwFMWROQADQ1dlUiPLJhBBIqcCgVdr
 svf6YcueL3xxVgj23ZGLDtDFdpg+mUIu6cjoFfInMmtF1/s0SH+7lS0fXSl4Fi75iUrf
 YonsixVpljtF4Xn9tpFEYyDDuB31ic8FpPbcdVtKVwrUw39VNMRGmVJvD6bo6xRwdo6q
 0wmw==
X-Gm-Message-State: APjAAAWK37R2MCyCHDME31m741gT4oYeOZ9jP2TP/jmRYcK/4BT6bsbW
 KwlAejoa0lR8VI8UUVNwnQ9uMGX9ZA/FUE5DYjm5BkVlWgs=
X-Received: by 2002:a67:fbd9:: with SMTP id o25mr2058060vsr.70.1573063318952; 
 Wed, 06 Nov 2019 10:01:58 -0800 (PST)
MIME-Version: 1.0
From: Marcin Kozlowski <marcinguy@gmail.com>
Date: Wed, 6 Nov 2019 19:01:48 +0100
Message-ID: <CAP6wrbU__y06GLKnTKpwtvwTyVW+77qmiMkxAB8n-+ABvPtBag@mail.gmail.com>
Subject: Booting Android (Samsung) Kernel in QEMU
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000055df100596b158e2"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::e2c
X-Mailman-Approved-At: Wed, 06 Nov 2019 16:48:37 -0500
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Te78utq77Q63

--00000000000055df100596b158e2
Content-Type: text/plain; charset="UTF-8"

Hi list,

Trying to boot a Samsung S7 Edge Kernel 3.18.x using QEMU

/usr/local/bin/qemu-system-aarch64  -M virt -cpu cortex-a57  -kernel
$HOME/s7boot/boot.emmc.win-zImage -initrd
$HOME/s7boot/boot.emmc.win-ramdisk.gz -nographic

Nothing happens

Screen remains as it was.

CPU is at 100% for QEMU process

Using QEMU:

/usr/local/bin/qemu-system-aarch64 --version
QEMU emulator version 4.1.0
Copyright (c) 2003-2019 Fabrice Bellard and the QEMU Project developers

Trying it with -s -S

 /usr/local/bin/qemu-system-aarch64  -M virt -cpu cortex-a57  -kernel
$HOME/s7boot/boot.emmc.win-zImage -initrd
$HOME/s7boot/boot.emmc.win-ramdisk.gz -nographic -s -S

GDB

Type "apropos word" to search for commands related to "word".
(gdb) target remote:1234
Remote debugging using :1234
warning: while parsing target description (at line 1): Target description
specified unknown architecture "aarch64"
warning: Could not load XML target description; ignoring
0x00000000 in ?? ()
(gdb) cont
Continuing.
^C
Program received signal SIGINT, Interrupt.
0x40080000 in ?? ()
(gdb) cont
Continuing.

So I guess it get stuck at 0x4008000

Anyway .... I tried several Kernels (downloaded from device, LineageOS,
Some other custom, also compiled one from Samsung Sources) with no luck.

Question:

Anybody booted  Android Kernel/Samsung in QEMU?


Thanks,

P.S Also asked this on StackOverflow here:
https://stackoverflow.com/questions/58688656/booting-android-samsung-kernel-in-qemu

--00000000000055df100596b158e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi list,</div><div><br></div><div>Trying to boot a Sa=
msung S7 Edge Kernel 3.18.x using QEMU</div><br>/usr/local/bin/qemu-system-=
aarch64 =C2=A0-M virt -cpu cortex-a57 =C2=A0-kernel $HOME/s7boot/boot.emmc.=
win-zImage -initrd $HOME/s7boot/boot.emmc.win-ramdisk.gz -nographic<br><br>=
Nothing happens<br><br>Screen remains as it was.<br><br>CPU is at 100% for =
QEMU process<br><br>Using QEMU:<br><br>/usr/local/bin/qemu-system-aarch64 -=
-version<br>QEMU emulator version 4.1.0<br>Copyright (c) 2003-2019 Fabrice =
Bellard and the QEMU Project developers<br><br>Trying it with -s -S<br><br>=
=C2=A0/usr/local/bin/qemu-system-aarch64 =C2=A0-M virt -cpu cortex-a57 =C2=
=A0-kernel $HOME/s7boot/boot.emmc.win-zImage -initrd $HOME/s7boot/boot.emmc=
.win-ramdisk.gz -nographic -s -S<br><br>GDB<br><br>Type &quot;apropos word&=
quot; to search for commands related to &quot;word&quot;.<br>(gdb) target r=
emote:1234<br>Remote debugging using :1234<br>warning: while parsing target=
 description (at line 1): Target description specified unknown architecture=
 &quot;aarch64&quot;<br>warning: Could not load XML target description; ign=
oring<br>0x00000000 in ?? ()<br>(gdb) cont<br>Continuing.<br>^C<br>Program =
received signal SIGINT, Interrupt.<br>0x40080000 in ?? ()<br>(gdb) cont<br>=
Continuing.<br><br>So I guess it get stuck at 0x4008000<br><br>Anyway .... =
I tried several Kernels (downloaded from device, LineageOS, Some other cust=
om, also compiled one from Samsung Sources) with no luck.<br><br>Question:<=
br><br><div>Anybody booted=C2=A0 Android Kernel/Samsung in QEMU?</div><div>=
<br></div><br><div>Thanks,</div><div><br></div><div>P.S Also asked this on =
StackOverflow here: <br></div><div><a href=3D"https://stackoverflow.com/que=
stions/58688656/booting-android-samsung-kernel-in-qemu">https://stackoverfl=
ow.com/questions/58688656/booting-android-samsung-kernel-in-qemu</a></div><=
div><br></div><br></div>

--00000000000055df100596b158e2--
