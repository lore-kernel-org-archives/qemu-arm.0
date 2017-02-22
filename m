Received: by 10.25.0.147 with SMTP id 141csp1007222lfa;
        Wed, 22 Feb 2017 06:49:52 -0800 (PST)
X-Received: by 10.237.53.124 with SMTP id b57mr18577762qte.113.1487774992312;
        Wed, 22 Feb 2017 06:49:52 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b204si1012968qka.304.2017.02.22.06.49.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Feb 2017 06:49:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52989 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgYEn-0007wU-PG
	for alex.bennee@linaro.org; Wed, 22 Feb 2017 09:49:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44444)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jiahuanzhang90@gmail.com>) id 1cgYE8-0007Ms-OM
	for qemu-arm@nongnu.org; Wed, 22 Feb 2017 09:49:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jiahuanzhang90@gmail.com>) id 1cgYE2-0002sL-G6
	for qemu-arm@nongnu.org; Wed, 22 Feb 2017 09:49:08 -0500
Received: from mail-qk0-x22d.google.com ([2607:f8b0:400d:c09::22d]:33214)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jiahuanzhang90@gmail.com>)
	id 1cgYE2-0002rj-BM
	for qemu-arm@nongnu.org; Wed, 22 Feb 2017 09:49:02 -0500
Received: by mail-qk0-x22d.google.com with SMTP id n127so4638550qkf.0
	for <qemu-arm@nongnu.org>; Wed, 22 Feb 2017 06:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=GVjT2FiJ9xas913JeKTZIt9j67u5VS9NScAKTjwi3cU=;
	b=eFQsYN4FHbc+S3vpbInrzCHN5rjU12CW3U85CluSNfZZRClpIIKszNYt/HrPxcgtR2
	Fph4NH3MUSkRD9C6ztyjdJj+2paZwEcX3pi6c9JtQ8REBR/FA8Xj2W8PhF4GLUq48LNV
	ArRBIthfTd+24kyfLrzW+CgkW3gwgd6smxji9BTkTrURjR+jDRzESziBYBHIg0SgfZqI
	dzOPiMz4ak+UWKoU8ajEpo0NOWbl4OgiLHMrhhfvwFavmzDZzqeeg3UcqV9GABSRziRu
	jHM5ucxnvB9662CuJ3AhK0/LA8z8HEkSpNrv2j7rheIG/mNG4AYM5pLx7vS4fpL1Eu/P
	L4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=GVjT2FiJ9xas913JeKTZIt9j67u5VS9NScAKTjwi3cU=;
	b=NxDNBbgwuATDhQmW0Y0VtfW3MSZfTcbPcoNiOV7wgC4sNc3feMbErqqrIO0FIrj9zr
	OxR6PrZtVvfLKYq3NIUnmJgjoU1XhmxNF2EM3WDp9ClLRN7jrjlEjDYvPPr4wlUe4cFA
	5McuH9GaSB2Jc5nfGqaFek4uSjKP//8RiiaQICo4qvmPy4f1vnnTcrFpPD250ps/D3U7
	xteTrnN4JeHzLw+gni4b561Amww+LGYQQSCs+NohCc3kaC1aGRC6yYeK+29H5vj6uWF7
	eitfM8aIKFgLrzeedZ+ZVJD/Zzx+IZKa/oCkIJ1N5ECdU/4qD6WtVcZZrJDjum3yS9dQ
	+s2Q==
X-Gm-Message-State: AMke39m3y4/4YJ53fFqd7vuxQ6bOfMaauU3a0F/Sf1m9DvD/7JTbkBpfsJa2zxY0HpEhR41ZG64k2sWxppKEYg==
X-Received: by 10.55.83.71 with SMTP id h68mr28529900qkb.259.1487774939737;
	Wed, 22 Feb 2017 06:48:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.108.70 with HTTP; Wed, 22 Feb 2017 06:48:59 -0800 (PST)
From: Jiahuan Zhang <jiahuanzhang90@gmail.com>
Date: Wed, 22 Feb 2017 15:48:59 +0100
Message-ID: <CAJy91CaRiC+dPzv4G1V54p1ahsQSaqbaQnyzn8-JiZ6agYyDTA@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary=001a114c9be8ca35c805491f98bb
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::22d
Subject: [Qemu-arm] Pipe implementation for Windows Host
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
X-TUID: EIgcKBouiDno

--001a114c9be8ca35c805491f98bb
Content-Type: text/plain; charset=UTF-8

Hi All,

I am using QEMU to emulate an arm-based Linux kernel in Windows host. I
want to make the host and guest communciate via a pipe redirected by a
serial port.
From the qemu user documentaion, I get

-chardev pipe ,id=id ,path=path

Create a two-way connection to the guest. The behaviour differs slightly
between Windows hosts and other hosts:

On Windows, a single duplex pipe will be created at \\.pipe\path.

On other hosts, 2 pipes will be created called path.in and path.out. Data
written to path.in will be received by the guest. Data written by the guest
can be read from path.out. QEMU will not create these fifos, and requires
them to be present.

path forms part of the pipe path as described above. path is required.

I have successfully made a serial-pipe implementation for the
communciation between Linux guest and Linux host by *-serial
pipe:/temp/serial.* The two pipes are created by *mkfifo*.
But I have no idea about any shortcut to create fifo in windows. I am
running qemu via msys64. There is a *mkfifo *command. However, it just give
me a .lnk file, and qemu complains when I use the pipe. See below. So my
question is how to create a pipe for Windows host pipe implementation.

Regards,
Jiahuan

 MINGW64 ~/test

$ mkfifo pipe

 MINGW64 ~/test

$ ls -al pipe

prw-rw-rw- 1 qzj Domain Users 0 Jan 16 17:22 pipe

 MINGW64 ~/test

$ ~/qemu/build/arm-softmmu/qemu-system-arm.exe -M versatilepb -kernel
test.bin -nographic -serial pipe:/tmp/serial5

QEMU 2.8.50 monitor - type 'help' for more information

(qemu) C:\msys64\home\qemu\build\arm-softmmu\qemu-system-arm.exe: -serial
pipe;C:\msys64\tmp\serial5.lnk: could not conect serial device to character
backend 'pipe;C:\msys64\tmp\serial5.lnk'

--001a114c9be8ca35c805491f98bb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi All,</div><div><br></div><div>I am using QEMU to e=
mulate an=C2=A0arm-based Linux kernel=C2=A0in Windows host. I want to make =
the host and guest communciate via a pipe redirected by a serial port. </di=
v><div>From the qemu user documentaion, I get </div><div><br></div><div><dt=
><samp>-chardev pipe ,id=3D<var>id</var> ,path=3D<var>path</var></samp></dt=
><dd><p>Create a two-way connection to the guest. The behaviour differs sli=
ghtly between Windows hosts and other hosts: </p><p>On Windows, a single du=
plex pipe will be created at <samp>\\.pipe\<samp>path</samp></samp>. </p><p=
>On other hosts, 2 pipes will be created called <samp><samp>path</samp>.in<=
/samp> and <samp><samp>path</samp>.out</samp>. Data written to <samp><samp>=
path</samp>.in</samp> will be received by the guest. Data written by the gu=
est can be read from <samp><samp>path</samp>.out</samp>. QEMU will not crea=
te these fifos, and requires them to be present. </p><p><samp>path</samp> f=
orms part of the pipe path as described above. <samp>path</samp> is require=
d. </p></dd></div><div><br></div><div>I have=C2=A0successfully=C2=A0made a =
serial-pipe implementation for the communciation=C2=A0between Linux guest a=
nd Linux host by <em>-serial pipe:/temp/serial.</em> The two pipes are crea=
ted by <em>mkfifo</em>. </div><div>But I have no idea about any shortcut to=
 create fifo in windows. I am running qemu via msys64. There is a <em>mkfif=
o </em>command. However, it just give me a=C2=A0.lnk file, and qemu complai=
ns when I use the pipe. See below. So my question is how to create a pipe f=
or Windows host pipe implementation. </div><div><br></div><div>Regards,</di=
v><div>Jiahuan</div><div><br></div><div><p><font color=3D"#00bf00" size=3D"=
1"><font color=3D"#00bf00" size=3D"1">=C2=A0</font></font><font color=3D"#b=
f00bf" size=3D"1"><font color=3D"#bf00bf" size=3D"1">MINGW64</font></font><=
font size=3D"1"> </font><font color=3D"#bfbf00" size=3D"1"><font color=3D"#=
bfbf00" size=3D"1">~/test</font></font></p><font color=3D"#bfbf00" size=3D"=
1"><font color=3D"#bfbf00" size=3D"1">
</font></font><font size=3D"1"><p>$ mkfifo pipe</p>

</font><font color=3D"#00bf00" size=3D"1"><font color=3D"#00bf00" size=3D"1=
"><p><font color=3D"#00bf00" size=3D"1"><font color=3D"#00bf00" size=3D"1">=
=C2=A0</font></font><font color=3D"#bf00bf" size=3D"1"><font color=3D"#bf00=
bf" size=3D"1">MINGW64</font></font><font size=3D"1"> </font><font color=3D=
"#bfbf00" size=3D"1"><font color=3D"#bfbf00" size=3D"1">~/test</font></font=
></p><font color=3D"#bfbf00" size=3D"1"><font color=3D"#bfbf00" size=3D"1">
</font></font><font size=3D"1"><p>$ ls -al pipe</p>
<p>prw-rw-rw- 1 qzj Domain Users 0 Jan 16 17:22 pipe</p><span><p><font colo=
r=3D"#00bf00" size=3D"1"><font color=3D"#00bf00" size=3D"1">=C2=A0</font></=
font><font color=3D"#bf00bf" size=3D"1"><font color=3D"#bf00bf" size=3D"1">=
MINGW64</font></font><font size=3D"1"> </font><font color=3D"#bfbf00" size=
=3D"1"><font color=3D"#bfbf00" size=3D"1">~/test</font></font></p><font siz=
e=3D"1"><p><p>$  ~/qemu/build/arm-softmmu/qemu-system-arm.exe -M versatilep=
b -kernel test.bin -nographic -serial pipe:/tmp/serial5</p><p>
</p><p>QEMU 2.8.50 monitor - type &#39;help&#39; for more information</p><p=
>
</p><p>(qemu) C:\msys64\home\qemu\build\arm-softmmu\qemu-system-arm.exe: -s=
erial pipe;C:\msys64\tmp\serial5.lnk: could not conect serial device to cha=
racter backend &#39;pipe;C:\msys64\tmp\serial5.lnk&#39;</p></p></font><span=
><span></span></span></span></font></font></font></div><div><font color=3D"=
#00bf00" size=3D"1"><font color=3D"#00bf00" size=3D"1"><font size=3D"1"><sp=
an><span><span><p><br></p></span></span></span></font></font><p><font color=
=3D"#00bf00" size=3D"1"><font size=3D"1"></font></font></p></font></div></d=
iv>

--001a114c9be8ca35c805491f98bb--
