Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3891252wrt;
        Mon, 24 Dec 2018 06:17:20 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Upz9C2F5bbGObRf3jdsDU3o2zyDj8FUDswViXIvxHDgNSolUcP9WHjB4W542iFt7twCOtr
X-Received: by 2002:aed:3aa7:: with SMTP id o36mr12196521qte.240.1545661040726;
        Mon, 24 Dec 2018 06:17:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1545661040; cv=none;
        d=google.com; s=arc-20160816;
        b=Ugk8oYxBhYinUCwXkKOKrsj8R5+sh5P4rOPMhFbMn6zkfWSmvjbVnPtqqr4NlCUxfI
         DIK9LR9J01YU5UHWw36D9f75ejkVSJmw7BjPvXPAnsengDK5qGiDiSk+o/C8UMuPx658
         2wXOUqfcUo2+8mqfI8VaXaG+o8hU/9XGvUigVe5ILYzB7iHmclkUlivP9TeEguvy0mU8
         4qL8z9+4XhdAmGPNcCY0O7X3iumQHmUKmE4siImvzQDAdsZinv2sSvMyNIQgWgD1hW5S
         /h79ldWjuZqxbVjQkeRNaVywM0cFNKodgBg0UEGT7acJoQvQ+PTwCHg5oexE4IjylY/B
         BRCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:dkim-signature;
        bh=og3BB0xe/l5Spferu7oMjcMNOLn2ajCFjA+EM20k3nw=;
        b=k2mzOc747JRKDdOr68c5Cr0hzdrvQfsD1DMnPvxHX1Tb3xdk4RDsr0im4XB3QRjZXA
         g2km9N9WXo7prvg8NilyGPhOn+y1L+G5PKn2jsJrMH+oemw0dc9FZ6WW++8+H/ZiliNF
         0BHAZbheMDyC5tcreHsel1kT/faLkhAXhdORCKBtqssfaqypVJ5SFikm8E972U0BiCtQ
         OuYaX11bzzZrg92N3I9CeBc0EoSbtXwDbc94QWlsEVYMuht1kworJG2GLTofPdQnOKbd
         9ZyEK2l/K1QUj70MeVRBvdfM9dmcbcvsOSTM/vcmO8g6YDpu5TIaFlVCZvwiECL7WFpS
         KXCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=l1ETReQu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id k17si6051816qkh.130.2018.12.24.06.17.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Dec 2018 06:17:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=l1ETReQu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:37407 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gbR2m-0001Y3-87
	for alex.bennee@linaro.org; Mon, 24 Dec 2018 09:17:20 -0500
Received: from eggs.gnu.org ([208.118.235.92]:35383)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stast.3vium@gmail.com>) id 1gbLsY-0002Xt-UD
	for qemu-arm@nongnu.org; Mon, 24 Dec 2018 03:46:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stast.3vium@gmail.com>) id 1gbLsY-0004WP-27
	for qemu-arm@nongnu.org; Mon, 24 Dec 2018 03:46:26 -0500
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:36952)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stast.3vium@gmail.com>)
	id 1gbLsX-0004W1-TD
	for qemu-arm@nongnu.org; Mon, 24 Dec 2018 03:46:26 -0500
Received: by mail-oi1-x22d.google.com with SMTP id y23so9538328oia.4
	for <qemu-arm@nongnu.org>; Mon, 24 Dec 2018 00:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=og3BB0xe/l5Spferu7oMjcMNOLn2ajCFjA+EM20k3nw=;
	b=l1ETReQuxjJGTD7mx0zXfRJLywLGQzG0O6COerir/Ay5LsgMqgEAudMk6MJwT2YAI2
	jKMn/Qn46qK3d2B8I5SloV0hUw2cnTtyMuRneKKlqFRA9ZbYDycXyJBWY0KwKDxDs/fQ
	NUqx2RKJlxg1axG+p6nJimNcevTZw0ezqSTCXOjxQSupkS+2LvkKMmld8uzzmXOEPPK1
	+6XFWXQeY9O+K/LPeXW4AZ6AF5P6VCPC3s6idKkh05o+p3BBVL9UsC/8FVSw7pF8zggP
	O7kUaNbYdvHmlWsdruRWnrdl6ZvZaj2es/GGeikyNgZVcMUL8OjPRhlq9gvjoUKSjnn2
	I0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=og3BB0xe/l5Spferu7oMjcMNOLn2ajCFjA+EM20k3nw=;
	b=PNLMt6sHkTiAbjzWXsLeqgfibXSBxWvRn44gUMR6AMCZaxT28k/oixVe9PVccwnp9x
	VMJd9GNJRfBkbuV97fJc7kaIn1J1tFV8XYwOBRiuMwOt7TT5lS1zNTJ6SnfcBzyEGgK4
	7Buqsy3LHU6eOMOuaimZhf82QoKpTBaczRbOyQNp9IUiNsE3K66WZgdg1B5goyVgjIsY
	SjPLvV89kInxQZ/aXRE0/OYcONzBh4eUg85Zc38Ff7YhvXqgZTrPJHic1KSy6/H7wqpy
	QW/Kn2YyAfXqnppjSY9Zwb3/MN/4UpzGXmB5ogvQZjDP1LRnVsX/x9ltnbkYS3k/9cyi
	ou1g==
X-Gm-Message-State: AA+aEWbjLED4hR9x0G3YoDYXwazW5Ewio1i9wyEyiBj2XWAeDwdc8XNi
	/FoAqm+jpP7nYPOYSNeV6qs8W/oR0XQOryTSt2jHyH69
X-Received: by 2002:aca:4489:: with SMTP id r131mr7908674oia.296.1545641184715;
	Mon, 24 Dec 2018 00:46:24 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?0KHRgtCw0L3QuNGB0LvQsNCyINCi0YPQvNCw0YHQvtCy?=
	<stast.3vium@gmail.com>
Date: Mon, 24 Dec 2018 11:46:14 +0300
Message-ID: <CAC-7+Cg5EX1qb11kwRprSE8_E2SMtEm1Cgh0OzFMCuiBhh+3BQ@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000c3e6a5057dc0a18d"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::22d
X-Mailman-Approved-At: Mon, 24 Dec 2018 09:17:07 -0500
Subject: [Qemu-arm] Run Kernel+rootfs for ARM Cortex-A72 on QEMU
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
X-TUID: ZjnYuv96oVOi

--000000000000c3e6a5057dc0a18d
Content-Type: text/plain; charset="UTF-8"

Hello, dear developers. I use Yocto to build Kernel and rootfs for ARM
Cortex-A72. Kernel and rootfs are in separate files The kernel has an Image
type (extension .bin). Rootfs has ext4 type(extension .ext4). I did not
find this processor in the support list in QEMU *3.1.0
<https://download.qemu.org/qemu-3.1.0.tar.xz>* Dec 11th 2018. But this
processor is on the support list in QEMU 3.1.0-rc3, but I could not run the
kernel and rootfs.
Is there any possibility to run QUEMU for this processor?
Thanks a lot in advance.

With best regards, Stanislav.

--000000000000c3e6a5057dc0a18d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hello, dear developers. =
I use Yocto to build Kernel and rootfs for ARM Cortex-A72. <span class=3D"g=
mail-tlid-translation gmail-translation"><span title=3D"" class=3D"gmail-">=
Kernel and rootfs are in separate files</span></span> <span class=3D"gmail-=
tlid-translation gmail-translation"><span title=3D"" class=3D"gmail-">The k=
ernel has an Image type (<span class=3D"gmail-gt-baf-term-text"><span class=
=3D"gmail-gt-baf-cell gmail-gt-baf-word-clickable">extension .bin</span></s=
pan>). Rootfs has ext4 type<span class=3D"gmail-tlid-translation gmail-tran=
slation"><span title=3D"" class=3D"gmail-">(<span class=3D"gmail-gt-baf-ter=
m-text"><span class=3D"gmail-gt-baf-cell gmail-gt-baf-word-clickable">exten=
sion .ext4</span></span>)</span></span>. I did not find this processor <spa=
n class=3D"gmail-tlid-translation gmail-translation"><span title=3D"" class=
=3D"gmail-">in the support list in QEMU</span></span> <strong><a href=3D"ht=
tps://download.qemu.org/qemu-3.1.0.tar.xz">3.1.0</a></strong>
  Dec 11th 2018. But <span class=3D"gmail-tlid-translation gmail-translatio=
n"><span title=3D"" class=3D"gmail-">this processor is on the support list =
in QEMU 3.1.0-rc3, <span class=3D"gmail-tlid-translation gmail-translation"=
><span title=3D"" class=3D"gmail-">but I could not run the kernel and rootf=
s</span></span>.<br><span class=3D"gmail-tlid-translation gmail-translation=
"><span title=3D"" class=3D"gmail-">Is there any possibility to run QUEMU f=
or this processor?<br><span class=3D"gmail-tlid-translation gmail-translati=
on"><span title=3D"" class=3D"gmail-">Thanks a lot in advance.</span></span=
><br><br><span class=3D"gmail-tlid-translation gmail-translation"><span tit=
le=3D"" class=3D"gmail-">With best regards, Stanislav.<br></span></span></s=
pan></span></span></span></span></span></div></div></div>

--000000000000c3e6a5057dc0a18d--
