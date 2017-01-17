Received: by 10.25.205.13 with SMTP id d13csp437682lfg;
        Tue, 17 Jan 2017 03:01:42 -0800 (PST)
X-Received: by 10.237.59.213 with SMTP id s21mr23660265qte.146.1484650902250;
        Tue, 17 Jan 2017 03:01:42 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r66si16284943qkl.175.2017.01.17.03.01.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Jan 2017 03:01:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34359 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cTRWF-0005kc-Pt
	for alex.bennee@linaro.org; Tue, 17 Jan 2017 06:01:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46691)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jiahuanzhang90@gmail.com>) id 1cTRW5-0005jy-6r
	for qemu-arm@nongnu.org; Tue, 17 Jan 2017 06:01:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jiahuanzhang90@gmail.com>) id 1cTRVz-0005Kq-0F
	for qemu-arm@nongnu.org; Tue, 17 Jan 2017 06:01:29 -0500
Received: from mail-qt0-x235.google.com ([2607:f8b0:400d:c0d::235]:34804)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jiahuanzhang90@gmail.com>)
	id 1cTRVy-0005KB-SI
	for qemu-arm@nongnu.org; Tue, 17 Jan 2017 06:01:22 -0500
Received: by mail-qt0-x235.google.com with SMTP id l7so150526004qtd.1
	for <qemu-arm@nongnu.org>; Tue, 17 Jan 2017 03:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=yCcMIZsdn2Tq0tRgv/fESRaECJ8EVYekAobvC3kX2OA=;
	b=g9+ItSCO5ogckZOKGSJkQA8MzfIvqmY2cUbPRlgnTmBDkRu5Epij+z464uLNSfUNa9
	ofEyosqfDUYZtNyCA5W7dczW3OJFh43l/rpRGSMR1RNoUUMVWVO5LIB+4PUAk7XM/2xK
	n6Ix15XAcVT4nggc3K5sg4EuH8C190s6L3+sdbJktzoaV2DnnKX3pbQUvBIQzLFuQx9o
	8V0FU6lU/G75Kn4owzFNiexYiTeuaJAJtvRc4PgME6JkVGf0j6EmFy4fpG3wzSdENYd+
	HVTOEQPHFYOI8hLcRgePIArqQKBBWazdD/64dcFvuqygVxxKNkGWxzbjJ4EyJpFnM7+x
	Wsgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=yCcMIZsdn2Tq0tRgv/fESRaECJ8EVYekAobvC3kX2OA=;
	b=oXmVxmRkolZj/ckGGFHRIdrIE+KNCcECKVh5AjrDXe82aND6s73leuOako2I+QMR3a
	D6wzpyVInhbGKans2K6QAFBLsH2Ze15n72JJO1ukR1Lsd3CRbqmC61tu3RbXSdlb8nyj
	qAYvVb99l4ZtB/dU4xJonmNavl2NnXyienYGAnKPtBYF4MJxFsOT3w5mDs9Y3ktqVhDr
	aHEXr4FXs2f4/wm3dWyQH2KyEAzEku9byYHHiVTIWU8FGZwcJZd43RMPPftKTp5cY+tk
	v08+ommG/OeCGLzYbibUevEZC9Al1yMLYIKsvEPH+l4eiSJBpoP9+ULjBS+Ar+9T0GwC
	lXDA==
X-Gm-Message-State: AIkVDXKmSjiwofJqfx27+CeivTlH4R66vmXBB8r3W0edApEkEj0NalZqHAOdxEt8nHefbda24LCgjkAgd4KfdA==
X-Received: by 10.200.56.4 with SMTP id q4mr36631187qtb.73.1484650880485; Tue,
	17 Jan 2017 03:01:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.101.135 with HTTP; Tue, 17 Jan 2017 03:01:20 -0800 (PST)
From: Jiahuan Zhang <jiahuanzhang90@gmail.com>
Date: Tue, 17 Jan 2017 12:01:20 +0100
Message-ID: <CAJy91CYBdTWh=jMzjmMfM-4Mg-MHJzzdjB717R8TRovOX_A3hQ@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary=001a114339a658ce940546483899
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::235
Subject: [Qemu-arm] How to use pipe for interaction between Guest and Host
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
X-TUID: PpDZVfBS4bJl

--001a114339a658ce940546483899
Content-Type: text/plain; charset=UTF-8

Dear everybody,

I wonder how to realize the interaction between qemu guest and the
host. there is

"-chardev pipe ,id=id ,path=path"

Create a two-way connection to the guest. The behaviour differs slightly
between Windows hosts and other hosts:

On Windows, a single duplex pipe will be created at \\.pipe\path.

On other hosts, 2 pipes will be created called path.in and path.out. Data
written to path.in will be received by the guest. Data written by the guest
can be read from path.out. QEMU will not create these fifos, and requires
them to be present.
in qemu user documentation. Are there any pipe implementation emaples?

I am using qemu in windows. I cannot understand the directory \\.pipe\path.

Any friends can help? Thank you in advance.

Best regards,
Jiahuan

--001a114339a658ce940546483899
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Dear everybody,</div><div><br></div><div>I wonder how=
 to=C2=A0realize the interaction between qemu guest and the host.=C2=A0ther=
e is=C2=A0</div><div><br></div><div><font face=3D"Courier New">&quot;-chard=
ev pipe ,id=3D<var>id</var> ,path=3Dpath&quot;</font></div><div><font face=
=3D"Courier New"><p>Create a two-way connection to the guest. The behaviour=
 differs slightly between Windows hosts and other hosts: </p><p>On Windows,=
 a single duplex pipe will be created at <samp>\\.pipe\<samp>path</samp></s=
amp>. </p><p>On other hosts, 2 pipes will be created called <samp><samp>pat=
h</samp>.in</samp> and <samp><samp>path</samp>.out</samp>. Data written to =
<samp><samp>path</samp>.in</samp> will be received by the guest. Data writt=
en by the guest can be read from <samp><samp>path</samp>.out</samp>. QEMU w=
ill not create these fifos, and requires them to be present. <span></span><=
/p></font></div><div><font face=3D"Courier New"><font face=3D"arial,helveti=
ca,sans-serif"><span><span>in=C2=A0qemu user=C2=A0documentation.=C2=A0Are t=
here any pipe implementation=C2=A0emaples? </span></span></font></font></di=
v><div><br></div><div>I am using qemu in windows. I cannot understand the d=
irectory \\.pipe\<samp>path</samp>. </div><div><span><br></span></div><div>=
Any friends can help? Thank you in advance.</div><div><br></div><div>Best r=
egards,</div><div>Jiahuan</div><div><br></div></div>

--001a114339a658ce940546483899--
