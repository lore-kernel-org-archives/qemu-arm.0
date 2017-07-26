Received: by 10.25.44.15 with SMTP id s15csp393912lfs;
        Tue, 25 Jul 2017 22:22:12 -0700 (PDT)
X-Received: by 10.237.49.103 with SMTP id 94mr27445626qtg.16.1501046532369;
        Tue, 25 Jul 2017 22:22:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501046532; cv=none;
        d=google.com; s=arc-20160816;
        b=GKwKnwj4HWp8IS+8H61Fs9qK2c3DGFejgwpL+rpTocQpjETfs/zGhPK2Q+IST461/O
         ffmqIHK5J+I91Sdwf9jid9yQgz/uaKvmvnr0Ul/TH1AG8DU9Rlc/aTn3iA2X/RidMTzP
         vsp2dLJNAAHYIqsjF3GqVV/aUDrL+CGc6vgVgR7P0XR1Kr0w/MH0hw6u8i0dqRPnEcFN
         B4vT2i2fh5IcKonni28yDmVJBX4a9CtW8JFei6kXvxojJhTSpdOCBkiXBn9dqoZGQLeY
         a4m6WN2SDOo7f4s1ajSyYzaSJis40/YSrub/NUxbhVVSBU9JimymFpuhZB52MD3KJslR
         TfPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:dkim-signature:arc-authentication-results;
        bh=edvDPPFl2x4zae9x00ZHQK+GjiAPg89YroyugWgIGHo=;
        b=Ia0YZIKSUjaVowumbQVeJXUhSSzTM8ptVE7eF33Yn30hljRBQyTc1BefHdL+17ed86
         NLWF3qRE1VsxRyVEroE4nEm+3jkZWsGl5oGFvVj0I4SAk73mekQY7psRb/v2b5QJGdcu
         wQx5wep/2wm3N+M6TKaB/NM6fPEI5OnI6Sr+y+P5BFtqkyduSRXlCW18EVjvRZVKAPAa
         4v9OJsZIArTlTv9XXIciY8hPl7HntFT0V4M/11ETJfyUVZ6icM8QBH+GO68Zm39IzWiz
         w9i7+QIXQHpc0DlU26eEH9KN0FHqzn6eQsx4KDhR3ZtGRkVcDhwHhJYnodJNHy4x2YUq
         M8pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=NRTXW9Ff;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q68si4239476qkd.264.2017.07.25.22.22.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Jul 2017 22:22:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=NRTXW9Ff;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36112 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1daElt-000765-GV
	for alex.bennee@linaro.org; Wed, 26 Jul 2017 01:22:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37288)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ronald.dahlgren@gmail.com>) id 1daCQe-0005RW-8n
	for qemu-arm@nongnu.org; Tue, 25 Jul 2017 22:52:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ronald.dahlgren@gmail.com>) id 1daCQd-0006O0-9h
	for qemu-arm@nongnu.org; Tue, 25 Jul 2017 22:52:04 -0400
Received: from mail-ua0-x241.google.com ([2607:f8b0:400c:c08::241]:36236)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ronald.dahlgren@gmail.com>)
	id 1daCQd-0006NN-3d
	for qemu-arm@nongnu.org; Tue, 25 Jul 2017 22:52:03 -0400
Received: by mail-ua0-x241.google.com with SMTP id w45so13353540uac.3
	for <qemu-arm@nongnu.org>; Tue, 25 Jul 2017 19:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=edvDPPFl2x4zae9x00ZHQK+GjiAPg89YroyugWgIGHo=;
	b=NRTXW9Ffu21VAFNdvqgzCbOuM5tfn13X8FTdvt/XnERFwBcSRZqwyextdoKKhR3e/d
	6qVsWjr92ticepEwx+WxWbjSmR/CjzTGS6qqR9Vi2zRiRgXXMfLdH4C6w/BSeDWD1Mmf
	UdlY7VzjYvXVGzOmSiheD4TZwpJcaAd/GesW1moORZphFPcjwLtF3WYDBmDUzQtci8ON
	PYiOLlbWFqwtKUp7L/ENDxhX/1RBcvzhsdnf0MfdjZ358ekWgGmAryIw0n9wsmoXM99Z
	5Iex6OaUttLGpUWO0we6WSUXGE7/UVghfSJAnpp27IaYBVlnNqFTvcqpVTfagXR96n5f
	8Cxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=edvDPPFl2x4zae9x00ZHQK+GjiAPg89YroyugWgIGHo=;
	b=Fl2Cko+ppJrDCVEHJvSxySDB6+bshtIwLj9cpYzdlO2mnRLqtdSApIh39xo29Csvmf
	j7KLS/n54ZreM5aBAB71+GeoehA3U+gxBljWr/QcwmfJl1wSOviEX6ADA9IC7yk/6QTp
	LPHPaotXCzkYQ5b9jOkqt/vyu3vcKYu8UrYQ0OuqRZGNMT2IpsqB5dwex6THyxL+3fsw
	xdKy2UapIzznLRzh+JnGid1XgIh+kRCUaXpCNo0KLRgVpkIpcb0/aVST4vLhYXOTo9Vl
	vLVg/woNaeH8nErr2iIG49ScQ7NUHXUxErk9yQsnL6WzAeM+BRT2qf0JsW8tr8rSQj6b
	VNUQ==
X-Gm-Message-State: AIVw112eFgv2hjjLboMRraWibz9shViIxHuO1vIQT/RZ26tiyGvVuraL
	Bg3OMcdHnbNFp9cd72SevkrFxQT/UsJ6dsc=
X-Received: by 10.159.34.73 with SMTP id 67mr11397904uad.90.1501037519413;
	Tue, 25 Jul 2017 19:51:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.32.134 with HTTP; Tue, 25 Jul 2017 19:51:58 -0700 (PDT)
From: Ronald Dahlgren <ronald.dahlgren@gmail.com>
Date: Tue, 25 Jul 2017 22:51:58 -0400
Message-ID: <CAMdPreoGpxfJgRScO_k2RiphH9QR=WuDC8QutF4Q+bPJJ2stOg@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="001a113df5f823a5db05552f880f"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c08::241
X-Mailman-Approved-At: Wed, 26 Jul 2017 01:22:01 -0400
Subject: [Qemu-arm] raspi2 vs Linux
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
X-TUID: jSYr7peSHwVg

--001a113df5f823a5db05552f880f
Content-Type: text/plain; charset="UTF-8"

I am trying to setup an emulation environment on my workstation for
development on a Linux environment destined to run on a Raspberry Pi. I'm
using Arch Linux Arm.

I have done some fairly extensive searching and found:

This raspbian specific post:
http://blog.3mdeb.com/2015/12/30/emulate-rapberry-pi-2-in-qemu/
This qemu wiki page: http://wiki.qemu.org/Documentation/Platforms/ARM
This MSDN post:
https://blogs.msdn.microsoft.com/iliast/2016/11/10/how-to-emulate-raspberry-pi/
and finally, this post (and several mailing list posts) from Andrew
Baumann: https://github.com/0xabu/qemu/wiki

Trying several iterations of these instructions all wind up with the qemu
window appearing (initially in a "paused" state) with no output to any of
the tabs.

My question is this: does anyone know of some other resources I may have
missed previously that cover running a Linux distro under a qemu raspi2
emulation?

* Note: I have also tried included the Arch Linux Arm kernel params for the
'-append' line.

Thanks in advance!


-- 
Ron Dahlgren

--001a113df5f823a5db05552f880f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I am trying to setup an emulation environment on my w=
orkstation for development on a Linux environment destined to run on a Rasp=
berry Pi. I&#39;m using Arch Linux Arm.</div><div><br></div><div>I have don=
e some fairly extensive searching and found:</div><div><br></div><div>This =
raspbian specific post:=C2=A0<a href=3D"http://blog.3mdeb.com/2015/12/30/em=
ulate-rapberry-pi-2-in-qemu/">http://blog.3mdeb.com/2015/12/30/emulate-rapb=
erry-pi-2-in-qemu/</a></div><div>This qemu wiki page:=C2=A0<a href=3D"http:=
//wiki.qemu.org/Documentation/Platforms/ARM">http://wiki.qemu.org/Documenta=
tion/Platforms/ARM</a></div><div>This MSDN post:=C2=A0<a href=3D"https://bl=
ogs.msdn.microsoft.com/iliast/2016/11/10/how-to-emulate-raspberry-pi/">http=
s://blogs.msdn.microsoft.com/iliast/2016/11/10/how-to-emulate-raspberry-pi/=
</a></div><div>and finally, this post (and several mailing list posts) from=
 Andrew Baumann:=C2=A0<a href=3D"https://github.com/0xabu/qemu/wiki">https:=
//github.com/0xabu/qemu/wiki</a></div><div><br></div><div>Trying several it=
erations of these instructions all wind up with the qemu window appearing (=
initially in a &quot;paused&quot; state) with no output to any of the tabs.=
</div><div><br></div><div>My question is this: does anyone know of some oth=
er resources I may have missed previously that cover running a Linux distro=
 under a qemu raspi2 emulation?</div><div><br></div><div>* Note: I have als=
o tried included the Arch Linux Arm kernel params for the &#39;-append&#39;=
 line.</div><div><br></div><div>Thanks in advance!</div><div><br></div><div=
><br></div>-- <br><div class=3D"gmail_signature"><div dir=3D"ltr"><div><div=
 dir=3D"ltr"><div><div dir=3D"ltr"><div>Ron Dahlgren</div></div></div></div=
></div></div></div>
</div>

--001a113df5f823a5db05552f880f--
