Received: by 10.25.159.131 with SMTP id i125csp1609859lfe;
        Mon, 5 Dec 2016 07:36:06 -0800 (PST)
X-Received: by 10.237.60.51 with SMTP id t48mr51085807qte.24.1480952165922;
        Mon, 05 Dec 2016 07:36:05 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g39si9128223qtc.206.2016.12.05.07.36.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Dec 2016 07:36:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42498 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cDvJF-0005zT-5x
	for alex.bennee@linaro.org; Mon, 05 Dec 2016 10:36:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48274)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jayadevk123@gmail.com>) id 1cDqye-0003q7-Ha
	for qemu-arm@nongnu.org; Mon, 05 Dec 2016 05:58:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jayadevk123@gmail.com>) id 1cDqyd-0007s5-Bj
	for qemu-arm@nongnu.org; Mon, 05 Dec 2016 05:58:32 -0500
Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230]:36445)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jayadevk123@gmail.com>)
	id 1cDqyd-0007rZ-1M
	for qemu-arm@nongnu.org; Mon, 05 Dec 2016 05:58:31 -0500
Received: by mail-wm0-x230.google.com with SMTP id g23so91107855wme.1
	for <qemu-arm@nongnu.org>; Mon, 05 Dec 2016 02:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=O6q/sA+Qtaw94DVDXAlMJ5wc0XEl47px7M2m3SKTClk=;
	b=vS38vco9aUWrLpB84oLH3AFGyFYHk0SbxMjXmoSuB/Fl1TuyJeaYlSWLwwb/1usG73
	gcUh7D8NA5JVfoKor5YeWI9MOwT3Sfea1oBzehE8VMVuqDTTVDEE1KPp3lJcGrDKSgyx
	4s8+1WS9FsNRkbs45Nu2tpA2ktoHdfiFaUfLxGJFjwRcnN3zde14G2qvYxX3A89AF8eb
	yl1zH0k9lAMyKf9kXGsZFr3kbH6dkz8NHNnxFVyz9bZY6b1vGN3GemCESJ9cFy09wiZa
	y5WvO8bQe0HBX6kofuje/DfbsKd+CunFIHtJl3euzVWPx5eb0VEabhbalTZxSbqxQ+G7
	32Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=O6q/sA+Qtaw94DVDXAlMJ5wc0XEl47px7M2m3SKTClk=;
	b=lGqEFFHUJnePFsm05eGoZdztNvLVpnFiCLW8nJRyFCPEa5/t7R2x4UxZpZGuh3oH+L
	Qh6Jz3li+4qQ5V0L2QTr85j4xA4T/DHPtdmG6B32A7S1Koe6eOn3UeU8jTNE8jUO9G72
	LnrknMouE5BybbnvXvzS7Mr6Yr2d2kLyUCuCRh21QaItKl5TKYx7jKBK+NDJ0tdGiDf+
	3C/7J9ld6kgpa9KVox1acg/pxnM2fogaX1/rJUXey8ykHepMvQIdHyyGQAwzBZ5pnTic
	aC4L9IHWzf5jLJCVIatOcnNKmbh6i4s0FBqc6ltO7AXJVUoKCDf66eWUpleRdCuLTOaw
	i1nQ==
X-Gm-Message-State: AKaTC03Psqap9z76/yTW+lJTzTmtyTmeSkFsUk2CX6qOwlOZMPtYMk2RVES7p7p2wNKHZhY0coA56pOReVoxxg==
X-Received: by 10.46.9.194 with SMTP id 185mr24901084ljj.3.1480935509433; Mon,
	05 Dec 2016 02:58:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.21.95 with HTTP; Mon, 5 Dec 2016 02:58:28 -0800 (PST)
From: Jayadev Kumaran <jayadevk123@gmail.com>
Date: Mon, 5 Dec 2016 16:28:28 +0530
Message-ID: <CAOG0femt3MC1ph_6BrCj+FZisRXrJw5g=h1iKeU+JDYzmBkwwg@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary=001a114b1788f9a1660542e72a56
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::230
X-Mailman-Approved-At: Mon, 05 Dec 2016 10:35:59 -0500
Subject: [Qemu-arm] Unable to share host folder
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lH/paprzCjfh

--001a114b1788f9a1660542e72a56
Content-Type: text/plain; charset=UTF-8

Hello everyone,

I'm very new to Qemu and currently running the emulator for arm64 platform.
I'm trying to share/copy a folder from my host system onto Qemu , but
haven't succeeded yet. I have tried quite a few ways

1 Mount a host folder using 9p over virtio

   Kernel configuration options were verfied to ensure 9p options are
enabled.
   Ran the emulator using :
   *qemu-system-aarch64 -M virt -cpu cortex-a57 -kernel Image -initrd
rootfs.img.gz -nographic -append "console=ttyAMA0 root=/dev/ram
rootfstype=ramfs init=/bin/sh" -snapshot -fsdev
local,**security_model=none,id=fsdev0,path=/mnt/shared
-device virtio-9p-pci,id=fs0,fsdev=fsdev0,mount_tag=hostshare*

   And tried mounting using
   *mount -t 9p -o trans=virtio,version=9p2000.L hostshare /tmp/share*

   But  the console showed ;
   9pnet_virtio : No channels available
   mount: mounting hostshare on /tmp/share/ failed: No such file or
directory

   a) I verfied that /tmp/share is present .
   b) Tried using -virtfs option with qemu-system-aarch64 , but it showed
the same logs.

2  Created a plain binary image using qemu-img ( raw format ). Formatted it
as ext4. Mounted it on the host , copied the required folder into the mount
point and then unmounted it . Now I tried inserting the image using;

*qemu-system-aarch64 -M virt -cpu cortex-a57 -kernel Image -initrd
rootfs.img.gz -nographic -append "console=ttyAMA0 root=/dev/ram
rootfstype=ramfs init=/bin/sh" -snapshot -drive
/home/user/Documents/image_file*
Also using


*qemu-system-aarch64 -M virt -cpu cortex-a57 -kernel Image -initrd
rootfs.img.gz -nographic -append "console=ttyAMA0 root=/dev/ram
rootfstype=ramfs init=/bin/sh" -snapshot -hdd
/home/user/Documents/image_file*
But on my guest , I couldn't locate any mount point for the image

3 Sharing through host USB device
Added the usb device using the usb_add monitor command . But the device
wasn't detected/mounted in Qemu ( lsusb and mount didn't show any USB
device )

4 Added the folder to initrd image ( rootfs.img.gz)
In this method , emulator didn't start , supposedly due to exceeding size
limit of 16M ( new image was found to be around 160M ).

As I had mentioned in the beginning , I'm very new to this and couldn't
actually figure the proper way to resolve these issues.. Any help would be
appreciated.

Regards,
Jayadev

--001a114b1788f9a1660542e72a56
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div>Hello everyone,<br><br></div>I&#3=
9;m very new to Qemu and currently running the emulator for arm64 platform.=
 I&#39;m trying to share/copy a folder from my host system onto Qemu , but =
haven&#39;t succeeded yet. I have tried quite a few ways<br><br></div>1 Mou=
nt a host folder using 9p over virtio<br><br></div>=C2=A0=C2=A0 Kernel conf=
iguration options were verfied to ensure 9p options are enabled.<br></div>=
=C2=A0=C2=A0 Ran the emulator using :<br>=C2=A0=C2=A0 <i><b>qemu-system-aar=
ch64 -M virt -cpu cortex-a57 -kernel Image -initrd rootfs.img.gz -nographic=
 -append &quot;console=3DttyAMA0 root=3D/dev/ram rootfstype=3Dramfs init=3D=
/bin/sh&quot; -snapshot -fsdev local,</b></i><span style=3D"font-family:ari=
al,helvetica,sans-serif"><i><b>security_model=3Dnone,id=3Dfsdev0,path=3D/mn=
t/shared -device virtio-9p-pci,id=3Dfs0,fsdev=3Dfsdev0,mount_tag=3Dhostshar=
e</b></i><br>=C2=A0 <br></span></div><span style=3D"font-family:arial,helve=
tica,sans-serif">=C2=A0=C2=A0 And tried mounting using <br>=C2=A0=C2=A0 </s=
pan><i><b><span style=3D"font-family:arial,helvetica,sans-serif">mount -t 9=
p -o trans=3Dvirtio,version=3D9p2000.L hostshare /tmp/share</span></b></i><=
div><span style=3D"font-family:arial,helvetica,sans-serif">=C2=A0 <br></spa=
n></div><div><span style=3D"font-family:arial,helvetica,sans-serif">=C2=A0=
=C2=A0 But=C2=A0 the console showed ;<br>=C2=A0=C2=A0 </span>9pnet_virtio :=
 No channels available<br>=C2=A0=C2=A0 mount: mounting hostshare on /tmp/sh=
are/ failed: No such file or directory<br>=C2=A0=C2=A0=C2=A0 <br></div><div=
>=C2=A0=C2=A0 a) I verfied that /tmp/share is present . <br></div><div>=C2=
=A0=C2=A0 b) Tried using -virtfs option with qemu-system-aarch64 , but it s=
howed the same logs.<br></div><div>=C2=A0=C2=A0 <br></div><div>2=C2=A0 Crea=
ted a plain binary image using qemu-img ( raw format ). Formatted it as ext=
4. Mounted it on the host , copied the required folder into the mount point=
 and then unmounted it . Now I tried inserting the image using;<br>=C2=A0<i=
><b>qemu-system-aarch64 -M virt -cpu cortex-a57 -kernel Image -initrd=20
rootfs.img.gz -nographic -append &quot;console=3DttyAMA0 root=3D/dev/ram=20
rootfstype=3Dramfs init=3D/bin/sh&quot; -snapshot -drive /home/user/Documen=
ts/image_file<br></b></i></div><div>Also using<i><b><br></b></i><i><b>qemu-=
system-aarch64 -M virt -cpu cortex-a57 -kernel Image -initrd=20
rootfs.img.gz -nographic -append &quot;console=3DttyAMA0 root=3D/dev/ram=20
rootfstype=3Dramfs init=3D/bin/sh&quot; -snapshot -hdd /home/user/Documents=
/image_file<br><br></b></i></div><div>But on my guest , I couldn&#39;t loca=
te any mount point for the image<br><br>3 Sharing through host USB device <=
br>
   Added the usb device using the usb_add monitor command . But the device =
wasn&#39;t detected/mounted in Qemu ( lsusb and mount didn&#39;t show any U=
SB=20
device )</div><div><i><b><br></b></i>4   Added the folder  to initrd image =
( rootfs.img.gz)<br>
     In this method , emulator didn&#39;t start , supposedly due to=20
exceeding size limit of 16M ( new image was found to be around 160M ).<br><=
br></div><div>As I had mentioned in the beginning , I&#39;m very new to thi=
s and couldn&#39;t actually figure the proper way to resolve these issues..=
 Any help would be appreciated.<br><br></div><div>Regards,<br></div><div>Ja=
yadev<br></div></div>

--001a114b1788f9a1660542e72a56--
