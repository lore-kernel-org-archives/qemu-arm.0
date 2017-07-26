Received: by 10.25.44.15 with SMTP id s15csp1065922lfs;
        Wed, 26 Jul 2017 10:40:16 -0700 (PDT)
X-Received: by 10.200.41.220 with SMTP id 28mr2470894qtt.168.1501090816370;
        Wed, 26 Jul 2017 10:40:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501090816; cv=none;
        d=google.com; s=arc-20160816;
        b=yiijQUB861HZ+stKpxj4curlAqdjZ46gYQZlCWQ2wiSSUBGATL8BVcNUeKQdzkUWyL
         1wmIlbNRLoSQ4gkB5F5aLc9OTGye9+FbzvS7yKW9nC2sNoAB/Dy3rjl+1JBzdLPRk99r
         sWL+gKgRJiO5A/ch6KOPiueivO2H0jmAyASHignFa5UxMMZHHTA57h91BmEtZhu7sRuR
         Cn/CO2pWIEEq5kWRpoP/nHBg6PDrg1RFcqvOpw1JCwe4OMMQ9zb9la0lxeh8zINzMSkA
         xd2vDcGmvKPrkhsnVnzBd5eOXCmBiLyGoct2CqxbgWG8ZwKo2Yer0X3BV2p3+w3dpHsD
         l50Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=rGRQVmLHmgc/+dlFB2QrTBX5EDLcW0Xno6uFo4P7vWs=;
        b=aQWZW9qoZ1asCiobFVgcSkYCSNOf42udKIgTrcqgmcyxJlKAW9JfNvGEO51cXzHIpG
         l9AbOPingU/adQrQQryBXekx2dmQeNLisdvTyvXFM/57+TnOxkLvN7dJm8+XS88FU2jz
         dNHL5cvLwKV7e1HTSbNCHX7mQINEZXDWGKQO8tME2Gymp9rSPoLIYtuwLGoGt47fLMV2
         fadU5VpOgYKlhM3OuT6s3uFJl8QTQMFHIeO4DW5wYbfJgUSM10/W8AEyOfyFR9k5Zl5D
         lLpa7wAk8O+YbbDoxjBCUeM1QqbnrSVNGsj3PSTXjgBbvNXqa19Ff5siDCFd/UmcHiL9
         HG9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=YUO7AZNV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v4si13395968qtb.16.2017.07.26.10.40.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Jul 2017 10:40:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=YUO7AZNV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39401 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1daQI9-000182-ND
	for alex.bennee@linaro.org; Wed, 26 Jul 2017 13:40:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55760)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ronald.dahlgren@gmail.com>) id 1daQI4-00013g-M3
	for qemu-arm@nongnu.org; Wed, 26 Jul 2017 13:40:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ronald.dahlgren@gmail.com>) id 1daQI3-0008IP-5l
	for qemu-arm@nongnu.org; Wed, 26 Jul 2017 13:40:08 -0400
Received: from mail-ua0-x234.google.com ([2607:f8b0:400c:c08::234]:33867)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ronald.dahlgren@gmail.com>)
	id 1daQI2-0008Hu-W8
	for qemu-arm@nongnu.org; Wed, 26 Jul 2017 13:40:07 -0400
Received: by mail-ua0-x234.google.com with SMTP id q25so103633956uah.1
	for <qemu-arm@nongnu.org>; Wed, 26 Jul 2017 10:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=rGRQVmLHmgc/+dlFB2QrTBX5EDLcW0Xno6uFo4P7vWs=;
	b=YUO7AZNV/foikb1+lr4eBakH5IiClXbU2e58Nlo700be8hywaBfghT/u7xMH9RXMR9
	CccXwTUV+PEewy5OAhLInx2ZCBm7PKxu8r7VzK6u0Uyj4Gtpa1ai16m7SwW9gLciqF5L
	/F8kP7cMIKibLX3O63NhlMK9CTerRBIkLegMiVDtjH/2EzEB9zm3ZgaTxiAPh+4kFU2S
	eytcptn5juR8bbicrsitvG9g3B+/2/NrA+FLpbYYsU4SAFdU/Qr4455CGN8FXQ/c0JLQ
	qzvktk5DAPRZxU10wiUCdYUOp4RK6shbpOPNk9CuAadIdBWJOM+EAezHRjJLJjMrQJiD
	8DQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=rGRQVmLHmgc/+dlFB2QrTBX5EDLcW0Xno6uFo4P7vWs=;
	b=RNceg4xpnB1Z995ii0YdAksrChU/ugWlljfofNPwyp0LkQjFA6COAW5we5TEG/Id6h
	c41vIqBSXFOUUzmsDyDCoZk9bdAJuFjxb5DkdjB/tXqEDeKKzD5Uitvv8FTM06NdUA3g
	W7k84dkc44Uublzg/q5H8kyHB9knumOl1I0IRldyoXfKld9k1K3NUHdX5mWAyrD9cOj8
	edktLnGSkVqfz24sD6F7qR6VGaHnhBEWbJRpURyFSZEzPxiXC02/+rttk1VuP1tLxuB6
	CCVbVZSwqq5OCvWuq+CRcYZ8VF8sZB3ucY00+lRjB7d3wublVtyhlhbLgpSWISFmuxPI
	46JQ==
X-Gm-Message-State: AIVw111BE0yxm37EyOX0qS8K2GV866kbzLNaz3CnECiC5Sjk5ppCShwQ
	TzjpNqVewRL7Hv4AatwKnk6fNxjvoBwU
X-Received: by 10.31.21.66 with SMTP id 63mr1043077vkv.61.1501090805969; Wed,
	26 Jul 2017 10:40:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.32.134 with HTTP; Wed, 26 Jul 2017 10:40:05 -0700 (PDT)
In-Reply-To: <CAMdPreoGpxfJgRScO_k2RiphH9QR=WuDC8QutF4Q+bPJJ2stOg@mail.gmail.com>
References: <CAMdPreoGpxfJgRScO_k2RiphH9QR=WuDC8QutF4Q+bPJJ2stOg@mail.gmail.com>
From: Ronald Dahlgren <ronald.dahlgren@gmail.com>
Date: Wed, 26 Jul 2017 13:40:05 -0400
Message-ID: <CAMdPrerRjTrkpBgN3vE9P+JQQW7oSPp66SXqEqF4Y8jzOJ2ydg@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="001a1143aed443f71f05553bf062"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c08::234
Subject: Re: [Qemu-arm] raspi2 vs Linux
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
X-TUID: ZXQIMRuKYxOS

--001a1143aed443f71f05553bf062
Content-Type: text/plain; charset="UTF-8"

I have copied the image I was using to an sd card and tried booting it on
actual hardware. The actual hardware doesn't make it past the GPU test
screen, indicating an unbootable kernel.

This tells me the problem is with my image and not with how I'm using qemu.

To be continued!

Ron

On Tue, Jul 25, 2017 at 10:51 PM, Ronald Dahlgren <ronald.dahlgren@gmail.com
> wrote:

> I am trying to setup an emulation environment on my workstation for
> development on a Linux environment destined to run on a Raspberry Pi. I'm
> using Arch Linux Arm.
>
> I have done some fairly extensive searching and found:
>
> This raspbian specific post: http://blog.3mdeb.com/
> 2015/12/30/emulate-rapberry-pi-2-in-qemu/
> This qemu wiki page: http://wiki.qemu.org/Documentation/Platforms/ARM
> This MSDN post: https://blogs.msdn.microsoft.com/iliast/2016/11/
> 10/how-to-emulate-raspberry-pi/
> and finally, this post (and several mailing list posts) from Andrew
> Baumann: https://github.com/0xabu/qemu/wiki
>
> Trying several iterations of these instructions all wind up with the qemu
> window appearing (initially in a "paused" state) with no output to any of
> the tabs.
>
> My question is this: does anyone know of some other resources I may have
> missed previously that cover running a Linux distro under a qemu raspi2
> emulation?
>
> * Note: I have also tried included the Arch Linux Arm kernel params for
> the '-append' line.
>
> Thanks in advance!
>
>
> --
> Ron Dahlgren
>



-- 
Ron Dahlgren
http://www.dahlgren.work

--001a1143aed443f71f05553bf062
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have copied the image I was using to an sd card and trie=
d booting it on actual hardware. The actual hardware doesn&#39;t make it pa=
st the GPU test screen, indicating an unbootable kernel.=C2=A0<div><br></di=
v><div>This tells me the problem is with my image and not with how I&#39;m =
using qemu.</div><div><br></div><div>To be continued!</div><div><br></div><=
div>Ron</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On T=
ue, Jul 25, 2017 at 10:51 PM, Ronald Dahlgren <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ronald.dahlgren@gmail.com" target=3D"_blank">ronald.dahlgren@gma=
il.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"=
ltr"><div>I am trying to setup an emulation environment on my workstation f=
or development on a Linux environment destined to run on a Raspberry Pi. I&=
#39;m using Arch Linux Arm.</div><div><br></div><div>I have done some fairl=
y extensive searching and found:</div><div><br></div><div>This raspbian spe=
cific post:=C2=A0<a href=3D"http://blog.3mdeb.com/2015/12/30/emulate-rapber=
ry-pi-2-in-qemu/" target=3D"_blank">http://blog.3mdeb.com/<wbr>2015/12/30/e=
mulate-rapberry-<wbr>pi-2-in-qemu/</a></div><div>This qemu wiki page:=C2=A0=
<a href=3D"http://wiki.qemu.org/Documentation/Platforms/ARM" target=3D"_bla=
nk">http://wiki.qemu.org/<wbr>Documentation/Platforms/ARM</a></div><div>Thi=
s MSDN post:=C2=A0<a href=3D"https://blogs.msdn.microsoft.com/iliast/2016/1=
1/10/how-to-emulate-raspberry-pi/" target=3D"_blank">https://blogs.msdn.<wb=
r>microsoft.com/iliast/2016/11/<wbr>10/how-to-emulate-raspberry-<wbr>pi/</a=
></div><div>and finally, this post (and several mailing list posts) from An=
drew Baumann:=C2=A0<a href=3D"https://github.com/0xabu/qemu/wiki" target=3D=
"_blank">https://github.com/<wbr>0xabu/qemu/wiki</a></div><div><br></div><d=
iv>Trying several iterations of these instructions all wind up with the qem=
u window appearing (initially in a &quot;paused&quot; state) with no output=
 to any of the tabs.</div><div><br></div><div>My question is this: does any=
one know of some other resources I may have missed previously that cover ru=
nning a Linux distro under a qemu raspi2 emulation?</div><div><br></div><di=
v>* Note: I have also tried included the Arch Linux Arm kernel params for t=
he &#39;-append&#39; line.</div><div><br></div><div>Thanks in advance!</div=
><span class=3D"HOEnZb"><font color=3D"#888888"><div><br></div><div><br></d=
iv>-- <br><div class=3D"m_768185556338087643gmail_signature"><div dir=3D"lt=
r"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div>Ron Dahlgren</div></div=
></div></div></div></div></div>
</font></span></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><d=
iv><div dir=3D"ltr"><div><div dir=3D"ltr"><div>Ron Dahlgren</div><a href=3D=
"http://www.dahlgren.work" target=3D"_blank">http://www.dahlgren.work</a>=
=C2=A0</div></div></div></div></div></div>
</div></div>

--001a1143aed443f71f05553bf062--
