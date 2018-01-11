Received: by 10.28.173.206 with SMTP id w197csp25082wme;
        Wed, 10 Jan 2018 19:43:00 -0800 (PST)
X-Google-Smtp-Source: ACJfBovR6vnygP2sXYh/de+lAZPyO+j9c1Prq8Q2krQYNQgnbYK+5ttUIY/1tyYLtMksiuzcKHEu
X-Received: by 10.129.238.17 with SMTP id l17mr18727302ywm.398.1515642179961;
        Wed, 10 Jan 2018 19:42:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515642179; cv=none;
        d=google.com; s=arc-20160816;
        b=mI9PmPJ12IKZ8XE9OQbJ/NfWdB5RTAukSnkIfzD2Hq5/08qA46pu9AVbmohQBMjGO5
         /XZaGydXlbugWx6ohaEyMDRJurKMLI5p+SWbfQTHjV4F1mm8iXszG1lfNLEnvZW/030R
         W9w6OwmzSaB8aCMORflQsZ66PmDt1lOKRofyWG8P5uqcoMdtKhTOm4OrRYH0CZIpX8rV
         hpC1YHCa1VVVRC0Thu6pOXLbfU1jDBriGgGuUpPtyp8Cy16S+KzUJsYyWa9MQPhbsKaD
         e6SSHuxGUH5MzhsrtveNd29tHg2hgWipTPROQLA+BgI5K/4XKhgimjGjadI5FJchQn8P
         L/JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:to
         :message-id:date:from:mime-version:dkim-signature
         :arc-authentication-results;
        bh=twS8Xuor6MncPdL+WjcObVgm9AO82gQ3FiX30DIXhOc=;
        b=pTvqBUKQKmVQ4kJEu0QPX0ffPLA8cXKZX4XiECnSCNX6XZMd3JubgxA3waB77fuDMR
         FdXhppfG8rax3tDEpVu4PhribnDEZo7Hi8sxzmkQ6ttcN8yJ5USHgksJYoPPBxmQs3t1
         Arm70MfCScsdg9dtL8eeHahvlpWBO6Xemds8BPjH0Pt6iQ75iFIhkjqjsaIMRYectOde
         JDLkLj6NaLFfSrpDcOJv2F/FS1IK2JgJzy4dPVBBvLwcQ+S3tS11tVYpvw7zdMvURZ4H
         wJM5lLPCwoPWPgL40Cv94Vp42yLT+61zZAvLp8ZhUwVx4juYWca53cA1W9K8F7LxLgXB
         68zg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ta1YsZn9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u127si3768469ywa.509.2018.01.10.19.42.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 Jan 2018 19:42:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ta1YsZn9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36357 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZTlb-0005gL-Fh
	for alex.bennee@linaro.org; Wed, 10 Jan 2018 22:42:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57877)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <patrickelectric@gmail.com>) id 1eZQQ9-0006St-W9
	for qemu-arm@nongnu.org; Wed, 10 Jan 2018 19:08:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <patrickelectric@gmail.com>) id 1eZQQ7-0003F8-IH
	for qemu-arm@nongnu.org; Wed, 10 Jan 2018 19:08:36 -0500
Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234]:38803)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <patrickelectric@gmail.com>)
	id 1eZQQ7-0003DL-Ap
	for qemu-arm@nongnu.org; Wed, 10 Jan 2018 19:08:35 -0500
Received: by mail-wm0-x234.google.com with SMTP id 141so2146331wme.3
	for <qemu-arm@nongnu.org>; Wed, 10 Jan 2018 16:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:from:date:message-id:subject:to;
	bh=twS8Xuor6MncPdL+WjcObVgm9AO82gQ3FiX30DIXhOc=;
	b=ta1YsZn98W/sPqF/0wVaC45EbpwhEgjsSOpFxjbBH+XGF1JGX+xgvZ7m3fbkLW32eZ
	cRcpOKt+paH/+1Y8rz/sd9Bl4pHvYlHhcQBFb1HhI3lXJtFYWJEXl6MEcr+zkU/NvrEe
	NUjZqh5WCcTXZNl9bxf4j8Jd74lUvYDS5h44bwt7FoHzq5WPIlFQQ2Tkx44IMmGvcIjU
	m8wUy8/XiUOhZE6sJA/LfqPjEMVJa4l2xBYLCoKPphpTwv1XvdyoNjOF37g2b2wFI/7y
	acWc2PmN89j5p0IKT1KAHEk9oqvy7GzZ5iBsG7gLipadQi6kGt+KoPo2yqSOle1uWQVv
	SSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:from:date:message-id
	:subject:to;
	bh=twS8Xuor6MncPdL+WjcObVgm9AO82gQ3FiX30DIXhOc=;
	b=P0Imds3uBYPsoaaerlIJmsAPlhcB4kqFGNejG+wZaP/s1Wv5NUz2tQjOaESwdj/7za
	kAGme2BX+SFlnFu5EE+jPQ7aEH8icFziHzDnDoCkGWRjShJP+u9OVV5IFEcvu2NqnqDY
	hTPXg+qt1Qs+hIRnVnb1L4+7NASAUAJmZc9x92S5kvAZxUXhAG3cQ0GlzDM1FfyGQYIL
	eSoTlwW1V0lOhzSwfYghgf25sc2B1n/GCSYIBbK1b7k2eTX1UlFAB31UryIUFbnPV1ID
	jAK9zX/0wkULINKJ8jijQJ3hHTOeNBqiCS8IlyS/E5bNj8a24MbPu0ocd7LzbcdGkS0p
	ODsA==
X-Gm-Message-State: AKGB3mImmGNCHC7qRvuv46dVgWMERLevrMs7UC6VgkXZ8NX4DOzvjp/m
	vMZIV4s2sKcnyKSathA28Wzu0DrlxWJU2q7Z2fKkow==
X-Received: by 10.80.208.201 with SMTP id g9mr27937618edf.216.1515629313434;
	Wed, 10 Jan 2018 16:08:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.140.193 with HTTP; Wed, 10 Jan 2018 16:07:52 -0800 (PST)
From: patrick JP <patrickelectric@gmail.com>
Date: Wed, 10 Jan 2018 22:07:52 -0200
Message-ID: <CANN23NnJWS-dT8yDZnZW_wf-L88rMU7n5fzfsgEE3b61Zoa-Rg@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="94eb2c1cd468d6aa5c056274f272"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::234
X-Mailman-Approved-At: Wed, 10 Jan 2018 22:42:53 -0500
Subject: [Qemu-arm] Running qemu-system-arm with stm32f303
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
Reply-To: patrickelectric@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lVXDZ2b1fHGO

--94eb2c1cd468d6aa5c056274f272
Content-Type: text/plain; charset="UTF-8"

Hello,

I am running QEMU v2.11.0 to run my .elf, a bare metal code.
The .elf runs in my stm32f303 board, flashed via stm32flash.
My objective is to run the .elf in my machine to do testes over the serial
communication, running socat PTY,link to create a bridge between
/dev/deviceIn and /dev/deviceOut, where /dev/deviceIn would be qemu -serial
argument and /dev/deviceOut the path for my python script.

Right now, I am running:

qemu-system-arm -machine versatilepb -cpu cortex-m3 -nographic -monitor
null -serial null -semihosting -device loader,file=file.elf
output: segmentation fault (core dumped)  qemu-system-arm -d cpu,in_asm
-machine versatilepb -cpu cortex-m3 -nographi

qemu-arm -d cpu,in_asm -cpu cortex-m3 -B 0x08000000 file.elf
log: https://pastebin.com/FyA1pc8m

qemu-system-arm with .elf return the same error with .elf.
qemu-arm with .elf return Error while loading file.hex: Permission denied.

Someone know how can I solve or debug problem ?

My best regards.

--94eb2c1cd468d6aa5c056274f272
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><br>I am running QEMU v2.11.0 to run my .elf, a =
bare metal code.<div>The .elf runs in my stm32f303 board, flashed via stm32=
flash.</div><div>My objective is to run the .elf in my machine to do testes=
 over the serial communication, running=C2=A0socat PTY,link to create a bri=
dge between /dev/deviceIn and /dev/deviceOut, where /dev/deviceIn would be =
qemu -serial argument and /dev/deviceOut the path for my python script.</di=
v><div><br></div><div>Right now, I am running:</div><div><br></div>qemu-sys=
tem-arm -machine versatilepb -cpu cortex-m3 -nographic -monitor null -seria=
l null -semihosting -device loader,file=3Dfile.elf<div>output: segmentation=
 fault (core dumped) =C2=A0qemu-system-arm -d cpu,in_asm -machine versatile=
pb -cpu cortex-m3 -nographi<br><br><div><div>qemu-arm -d cpu,in_asm -cpu co=
rtex-m3 -B 0x08000000 file.elf</div></div><div>log: <a href=3D"https://past=
ebin.com/FyA1pc8m">https://pastebin.com/FyA1pc8m</a></div><div><br></div><d=
iv>qemu-system-arm with .elf return the same error with .elf.<br></div><div=
>qemu-arm with .elf return=C2=A0Error while loading file.hex: Permission de=
nied.<br><br>Someone know how can I solve or debug problem ?<br><br>My best=
 regards.</div><div><br></div></div></div>

--94eb2c1cd468d6aa5c056274f272--
