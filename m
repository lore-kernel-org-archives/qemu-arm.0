Received: by 10.80.163.71 with SMTP id 65csp2232906edn;
        Tue, 4 Oct 2016 10:11:29 -0700 (PDT)
X-Received: by 10.55.5.21 with SMTP id 21mr5018971qkf.231.1475601089768;
        Tue, 04 Oct 2016 10:11:29 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y124si3293362qkc.181.2016.10.04.10.11.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Oct 2016 10:11:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44398 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1brTFZ-0000cw-5p
	for alex.bennee@linaro.org; Tue, 04 Oct 2016 13:11:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33215)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jonatan.okagao@gmail.com>) id 1brS68-0004Qq-BB
	for qemu-arm@nongnu.org; Tue, 04 Oct 2016 11:57:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jonatan.okagao@gmail.com>) id 1brS66-0008A2-Fy
	for qemu-arm@nongnu.org; Tue, 04 Oct 2016 11:57:39 -0400
Received: from mail-it0-x22e.google.com ([2607:f8b0:4001:c0b::22e]:36068)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jonatan.okagao@gmail.com>) id 1brS66-00089r-AV
	for qemu-arm@nongnu.org; Tue, 04 Oct 2016 11:57:38 -0400
Received: by mail-it0-x22e.google.com with SMTP id 188so67211117iti.1
	for <qemu-arm@nongnu.org>; Tue, 04 Oct 2016 08:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=vpdDWE3BvMcXR9TXgdgb9DlUCQBC6/AkF1VdyOtUleg=;
	b=XGbw0GKBCzN/+I9gvyCRXoN8vpFszOt2w569yEVML2IoDktU/bly4dvu273bEYm8yO
	n/W6n0GDLoEEN/Ur4L36ib2o/rsxqVLHzjbIE/SDz/xl7BCAPSnXVIJkXehUX7l8k8xK
	7NQoYKEQBJmNixehdqBW7Mge/T/hRChTjoz0zLAMJ8rWQ4q9ZFcPFPvcYcFsCYR09x6n
	Guh2CLuq6cVfmBD6KHpn1yorEvuYfeo9pu6yhHb5/CjfVDg7ZP8WiqNH2s5qoQRkSau7
	JXBWzAZJPX2xRjaCxV6wy5NNmkY7XydwW1OifJTAXMLU1h2P7LTVWJDNNM4P5OPQtiLt
	IHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=vpdDWE3BvMcXR9TXgdgb9DlUCQBC6/AkF1VdyOtUleg=;
	b=kjpzrh6Zm38202b0OZH7rnv2er/IkK6sSsrto8chIJMXQTRQHvTD6joPxctHj9HuOy
	JyL5LXBkUnroZLI0rrlKj/FIPaa+GvPdw/zLEYnDUfifCVMAogA4BX8Pyk6d2S5OiLSb
	q+b1ys77CZ0OF9h0BKJuTOSw+UgGEvr335onk5zPJigwDbayUVyatBniyASMuzU7sNbE
	kylHGsk7cxLLwVFKKavFV1a1TrJrQuWS4uHAui3RNanIJ755tt/2UyeVT+kd3zPSDgVo
	EAno1IW2hepdbUXsuz57UgeRyiPo0lRPeQUxLLM4J5Q0Qk9FkhsyFCXITnAL+BJNTVvm
	IGUA==
X-Gm-Message-State: AA6/9RmkgBGEp/GVPP7G0O7EdPtJV15qRa7Wc1braxuyZsZsFtU3Ouohlm8l+cOc8ILiwXEh/28KuHjJMqIlHQ==
X-Received: by 10.36.214.193 with SMTP id o184mr5066958itg.5.1475596657130;
	Tue, 04 Oct 2016 08:57:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.164.92 with HTTP; Tue, 4 Oct 2016 08:57:36 -0700 (PDT)
From: jonatan okagao <jonatan.okagao@gmail.com>
Date: Tue, 4 Oct 2016 16:57:36 +0100
Message-ID: <CACOEKj0QS2wMT=+i9fM_rO5mK-6ihuJ=u9n_r8E=+uu2wsBZKg@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary=001a114995f29492fa053e0c1e17
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c0b::22e
X-Mailman-Approved-At: Tue, 04 Oct 2016 13:09:52 -0400
Subject: [Qemu-arm] Reading coprocessors registers and dumping physical
 addresses.
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
X-TUID: EleNyJKAl73P

--001a114995f29492fa053e0c1e17
Content-Type: text/plain; charset=UTF-8

Hi all,

I'm using qemu-system-arm and I want to read the values of coprocessors
registers like (CP15,...) and to dump some physical addresses directly via
gdb (gdb_stub).
Is this possible?
Should I modify the Qemu source code (especially the gdbstub.c) or is there
an exciting solution for that?

After a long search on the internet I only found the information that there
is a method of using xml and target description, but I didn't find further
information on how to do so !!

Any help please?

Best regards,
Jonatan

--001a114995f29492fa053e0c1e17
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,<br><br></div><div>I&#39;m using qemu-system-a=
rm and I want to read the values of coprocessors registers like (CP15,...) =
and to dump some physical addresses directly via gdb (gdb_stub).<br></div><=
div>Is this possible?<br></div><div>Should I modify the Qemu source code (e=
specially the gdbstub.c) or is there an exciting solution for that?<br><br>=
</div><div>After a long search on the internet I only found the information=
 that there is a method of using xml and target description, but I didn&#39=
;t find further information on how to do so !!<br><br></div><div>Any help p=
lease?<br></div><div><br></div><div>Best regards,<br>Jonatan<br></div></div=
>

--001a114995f29492fa053e0c1e17--
