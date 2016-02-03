Received: by 10.25.159.19 with SMTP id i19csp114983lfe;
        Wed, 3 Feb 2016 13:55:08 -0800 (PST)
X-Received: by 10.140.29.53 with SMTP id a50mr4858044qga.37.1454536508416;
        Wed, 03 Feb 2016 13:55:08 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 39si7337862qgo.127.2016.02.03.13.55.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Feb 2016 13:55:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37922 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aR5OF-00068x-SG
	for alex.bennee@linaro.org; Wed, 03 Feb 2016 16:55:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42443)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jl4312@columbia.edu>) id 1aR4V9-0007s2-Lr
	for qemu-arm@nongnu.org; Wed, 03 Feb 2016 15:58:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jl4312@columbia.edu>) id 1aR4V6-0003SP-Ex
	for qemu-arm@nongnu.org; Wed, 03 Feb 2016 15:58:11 -0500
Received: from buckwheat.cc.columbia.edu ([128.59.72.251]:37599)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jl4312@columbia.edu>) id 1aR4V6-0003S7-Bh
	for qemu-arm@nongnu.org; Wed, 03 Feb 2016 15:58:08 -0500
Received: from hazelnut (hazelnut.cc.columbia.edu [128.59.213.250])
	by buckwheat.cc.columbia.edu (8.13.8/8.13.8) with ESMTP id
	u13Ks1p9021002
	for <qemu-arm@nongnu.org>; Wed, 3 Feb 2016 15:58:02 -0500
Received: from hazelnut (localhost.localdomain [127.0.0.1])
	by hazelnut (Postfix) with ESMTP id 5546382
	for <qemu-arm@nongnu.org>; Wed,  3 Feb 2016 15:58:02 -0500 (EST)
Received: from tarap.cc.columbia.edu (tarap.cc.columbia.edu [128.59.29.7])
	by hazelnut (Postfix) with ESMTP id 3ABF76D
	for <qemu-arm@nongnu.org>; Wed,  3 Feb 2016 15:58:02 -0500 (EST)
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by tarap.cc.columbia.edu (8.14.4/8.14.3) with ESMTP id u13Kw0tr025882
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=NOT)
	for <qemu-arm@nongnu.org>; Wed, 3 Feb 2016 15:58:02 -0500 (EST)
Received: by mail-ig0-f181.google.com with SMTP id hb3so21087906igb.0
	for <qemu-arm@nongnu.org>; Wed, 03 Feb 2016 12:58:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to:cc
	:content-type;
	bh=n3TrLIaTKSC3giTOilqjh+V5Lx1JIu3zNuexU9+MnQ0=;
	b=lxcivCbkaL3JOms5l08MfjTvJVf22YQEQjxOGEaaYaOLvQwVBBKz81WI3ILN/nBgLb
	ZVOaPiVSfdLG/yudL37dOSoIdW0ZTVvK7uDm2HxI2jlzJZpk8zbUzC2cJQl+buqiURoU
	PU4fwqGdzYSRIg5iuq6lMvZ7IgnpIuVKWEkdg1euyc1shlb9s1+N9ImVzG2ipDMtE5Vm
	D24tCX6aNQIrNKmkvLYSsmr8hOC8MoKu5SmZQy8uFdG4UZR1pQ2IHZ67hP5GoEV4bVtj
	rLN/Lv3tnT9wBYu/Bq1Fo6WUC/uS1OlK2P0mxKkNMOez+cGbHpkuw90m0N/Fp7gNeQBH
	bRgA==
X-Gm-Message-State: AG10YOSXa6RrO2AXW3sXJktkO1rxyOU3m0MG8hr8GnIz2XT5Dpec0tBC0UgZ+BqbGMF3u7XIL6K2rCNn1+70WY1OcdE0wnp6C/r22lpIaAEmZ+Ow4MqWDcrXYkU23U6aGLNxXU4=
X-Received: by 10.50.171.200 with SMTP id aw8mr296792igc.77.1454533080691;
	Wed, 03 Feb 2016 12:58:00 -0800 (PST)
X-Received: by 10.50.171.200 with SMTP id aw8mr296777igc.77.1454533080532;
	Wed, 03 Feb 2016 12:58:00 -0800 (PST)
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com.
	[209.85.223.181]) by smtp.gmail.com with ESMTPSA id
	l11sm3610656iol.17.2016.02.03.12.57.57 for <qemu-arm@nongnu.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Feb 2016 12:57:58 -0800 (PST)
Received: by mail-io0-f181.google.com with SMTP id d63so70437081ioj.2
	for <qemu-arm@nongnu.org>; Wed, 03 Feb 2016 12:57:57 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.107.9.220 with SMTP id 89mr5772916ioj.6.1454533077051; Wed,
	03 Feb 2016 12:57:57 -0800 (PST)
Received: by 10.50.239.2 with HTTP; Wed, 3 Feb 2016 12:57:56 -0800 (PST)
Date: Wed, 3 Feb 2016 15:57:56 -0500
X-Gmail-Original-Message-ID: <CAHyh4xiVysLUreprtNnKMOLf0VUH2bTsF4thPwbkeFOfpDXFCw@mail.gmail.com>
Message-ID: <CAHyh4xiVysLUreprtNnKMOLf0VUH2bTsF4thPwbkeFOfpDXFCw@mail.gmail.com>
From: Jintack Lim <jintack@cs.columbia.edu>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary=001a113eb8305f34dd052ae3df31
X-No-Spam-Score: Local
X-Scanned-By: MIMEDefang 2.68 on 128.59.29.7
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 128.59.72.251
X-Mailman-Approved-At: Wed, 03 Feb 2016 16:54:34 -0500
Cc: peter.maydell@linaro.org, Christoffer Dall <christofferdall@gmail.com>
Subject: [Qemu-arm] Adding sp804 timer to the virtboard
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4s1pTLYAylep

--001a113eb8305f34dd052ae3df31
Content-Type: text/plain; charset=UTF-8

Hi,

I'd like to replace an arm arch timer with sp804 timer in the virtboard.
What would be the easiest way to do that?

I'm thinking to add sp804 node to DT as follows which is from
arch/arm/boot/dts/vexpress-v2m.dtsi.
v2m_timer01: timer@11000 {
        compatible = "arm,sp804", "arm,primecell";
        reg = <0x11000 0x1000>;
        interrupts = <2>;
        clocks = <&v2m_sysctl 0>, <&v2m_sysctl 1>, <&smbclk>;
        clock-names = "timclken1", "timclken2", "apb_pclk";
};

The values of reg and interrupts will be replaced properly.
About the clock property, should I also add the original clock providers
such as sp810 and in turn 32k, 1M and smb clocks?
Or canI just use apb-pclk, which is an existing clock provider in the
virtboard, for all three clocks?

Thanks,
Jintack

--001a113eb8305f34dd052ae3df31
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div></div><div><br></div><div>Hi,</div><div><br></div><di=
v>I&#39;d like to replace an arm arch timer with sp804 timer in the virtboa=
rd.</div><div>What would be the easiest way to do that?</div><div><br></div=
><div>I&#39;m thinking to add sp804 node to DT as follows which is from arc=
h/arm/boot/dts/vexpress-v2m.dtsi.</div><div>v2m_timer01: timer@11000 {<br><=
/div><div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;arm,sp804&q=
uot;, &quot;arm,primecell&quot;;</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =
=3D &lt;0x11000 0x1000&gt;;</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 interrupt=
s =3D &lt;2&gt;;</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 clocks =3D &lt;&amp;=
v2m_sysctl 0&gt;, &lt;&amp;v2m_sysctl 1&gt;, &lt;&amp;smbclk&gt;;</div><div=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 clock-names =3D &quot;timclken1&quot;, &quot;t=
imclken2&quot;, &quot;apb_pclk&quot;;</div><div>};</div></div><div><br></di=
v><div>The values of reg and interrupts will be replaced properly.</div><di=
v>About the clock property, should I also add the original clock providers =
such as=C2=A0sp810 and in turn 32k, 1M and smb clocks?</div><div>Or canI ju=
st use=C2=A0apb-pclk, which is an existing clock provider in the virtboard,=
 for all three clocks?</div><div><br></div><div>Thanks,</div><div>Jintack</=
div></div>

--001a113eb8305f34dd052ae3df31--

