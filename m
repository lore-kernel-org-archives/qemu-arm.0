Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4584560wrt;
        Mon, 24 Dec 2018 23:27:30 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6F5s2+e2thTJalvM3RfXwGimzGj+nB60zpdp0yyMOerQI4549ICvbot9LPAiUz/+3o0Err
X-Received: by 2002:a37:2cc2:: with SMTP id s185mr13735737qkh.74.1545722850809;
        Mon, 24 Dec 2018 23:27:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1545722850; cv=none;
        d=google.com; s=arc-20160816;
        b=G9hfTOtOF16eHaFgYEMzWBZMsUbMJGz3EroCgbcYshkaMFc5015eLbG76OnfMCaGyO
         cJkAs0gOMdcffobFyVPybkYgXXBVsCBCleAzuSGyDG8rhrxGNbTlxacW3CercCnZDpcT
         jEeGr3dNtNe7EXbUlneH3kOvGJhXHgCSFeaFCfZLtRcbCc6u9z39P9zbF67OXC1q1TRW
         N/111E843qqASZp/AXDhOAJz2Fy3/g/bHf5SziWH+49Xi1z4cjBZmB93HA3EOrhkUEJz
         9vFGBX0ikTHvKZ3STeVT3z1mQCW63QIeAe37bcjCzU8cvYMEDJqeqTqdxuk+OlzFNhat
         B3ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S8Z4RUIhlMmkqRzGalyOnr5y45aWZ+Wy7cMKGJArZSo=;
        b=1BBTk/ga1rJhv/3G4/TF6Mx+dHQUeOOhAMUi5POGQanLn35hS5lXfYrw3Fr8V2pMEg
         J284kYPqOGuOMau06PX4B6/+kkywGKJVGvMDoardTCW3FAJOCc1hD/jUW1W3etojdMhy
         1T/x1Gt8D+U2EIld14WcKfzadICfJy5cgB5+no7mKSsvnkUUIhFHZgF+0aTPjF2Lv87m
         i+QeKklSiTIs2ve68lEGn5Y7Ct49zFaqT8rukUpHpelwcrWcunu3W8rW3mcpf1VVasgu
         fSp0e9EqlysJujBm0e8l0Rc+EoQU98VO1ojj1V4hdIaQ6LgpzhupA9D0em/KjlLd4tt5
         sUfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=c8f4PHss;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id t42si1658034qtb.192.2018.12.24.23.27.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Dec 2018 23:27:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=c8f4PHss;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:39974 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gbh7i-0000N3-Bn
	for alex.bennee@linaro.org; Tue, 25 Dec 2018 02:27:30 -0500
Received: from eggs.gnu.org ([208.118.235.92]:32999)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stast.3vium@gmail.com>) id 1gbh7Q-0000Jd-Qq
	for qemu-arm@nongnu.org; Tue, 25 Dec 2018 02:27:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stast.3vium@gmail.com>) id 1gbh7M-00024S-5m
	for qemu-arm@nongnu.org; Tue, 25 Dec 2018 02:27:12 -0500
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:37121)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stast.3vium@gmail.com>)
	id 1gbh7M-000240-0L
	for qemu-arm@nongnu.org; Tue, 25 Dec 2018 02:27:08 -0500
Received: by mail-oi1-x229.google.com with SMTP id y23so11111716oia.4
	for <qemu-arm@nongnu.org>; Mon, 24 Dec 2018 23:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=S8Z4RUIhlMmkqRzGalyOnr5y45aWZ+Wy7cMKGJArZSo=;
	b=c8f4PHssTTnIyOXefTLWtf+p3GeE3w00ZQO5qRt7dZHbqKGYK5F3eEFKW2Lf2phKdd
	gnYR1f6G8b3MBRiiBqmn9zJJtuJsN9MDTLD1cfefZIzepkwRt2hFag0NJT/pIooCmAhH
	XmKjUgrrrEeZOMu0pNZ2BVPq9686xs8ADuhcV1LocPV/fv/45WwGTE0jO86sxhwq1wuE
	itg7lb25fs+FbM38fFRc1c0ah12oZ1/DsFL5RQKHO2maT0vwWAR6M7rI2rXO2ERVwSXI
	CLqGyU16uuAyI4EGt0lMG0R+RmURpOxwLErF57C5++yGd9biW0TmBLnwDAChBmJkRgbe
	hSLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=S8Z4RUIhlMmkqRzGalyOnr5y45aWZ+Wy7cMKGJArZSo=;
	b=BjnMl+8nKLYI7WEhJJcvC6Vk6d39dNehRLX9BXLYHWNSg53Cggfi8wMG4vWH+vJPMT
	HF12fxajElSd8SQocXrLokMAuRHMlLBhU6+3aoCZrKx0X9V6NtapGFcMB9hdtUQjVkjU
	+qcVdbmZL4PLbtq3DGsFZV7X+D4UX3CEwKyCeq/ygCvbWbcGaeXWkr9KQyd0CSQjADwA
	2aFDigpMquWdCmOAvZb9xkhiPQnTaq7b5JFjWBmD2aviZc4ZdBFMrM2SaCgA0SJCBYWD
	0uqec6KmLKpKBIqsuXsmOeylLGXtKKpQ7GsZKoANCd09mGYtXt48rLYgZLgI0+a5MeuD
	BI2g==
X-Gm-Message-State: AA+aEWZ45Wg3u+wd4YJ9eoAJBkuue+EpST18ai92gJ7f65I1GIt6mZgR
	FFeolQ7v4pof51QZ3RhNcoQ4J5n7ZWAE2l8nxOzQiA==
X-Received: by 2002:aca:d804:: with SMTP id p4mr10303646oig.304.1545722827139; 
	Mon, 24 Dec 2018 23:27:07 -0800 (PST)
MIME-Version: 1.0
References: <CAC-7+Cg5EX1qb11kwRprSE8_E2SMtEm1Cgh0OzFMCuiBhh+3BQ@mail.gmail.com>
	<CAFEAcA8qqzPxwYmjGG1Y940RFyuf0AccNy+N51HODnoKEuYSfQ@mail.gmail.com>
	<CAC-7+Cix_s3xdzqre8r4c8f2djDBi42k4oOvyG6C4VCC29Ww6g@mail.gmail.com>
In-Reply-To: <CAC-7+Cix_s3xdzqre8r4c8f2djDBi42k4oOvyG6C4VCC29Ww6g@mail.gmail.com>
From: =?UTF-8?B?0KHRgtCw0L3QuNGB0LvQsNCyINCi0YPQvNCw0YHQvtCy?=
	<stast.3vium@gmail.com>
Date: Tue, 25 Dec 2018 10:26:56 +0300
Message-ID: <CAC-7+CidVH8KGBaCKxeEricWKhago1w+-j7fDB88gnN1bXVy1A@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000086e77057dd3a4f5"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::229
Subject: [Qemu-arm] Fwd:  Run Kernel+rootfs for ARM Cortex-A72 on QEMU
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
X-TUID: pFiF6F9rsx9G

--000000000000086e77057dd3a4f5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for information!
Yes, I mean "virt" board.

Although there is no big difference now. I really want to see the logs.
If the board is not suitable for the kernel, the logs will not be displayed=
?

With best regards, Stanislav.

=D0=BF=D0=BD, 24 =D0=B4=D0=B5=D0=BA. 2018 =D0=B3. =D0=B2 17:48, Peter Mayde=
ll <peter.maydell@linaro.org>:

> On Mon, 24 Dec 2018 at 14:17, =D0=A1=D1=82=D0=B0=D0=BD=D0=B8=D1=81=D0=BB=
=D0=B0=D0=B2 =D0=A2=D1=83=D0=BC=D0=B0=D1=81=D0=BE=D0=B2 <stast.3vium@gmail.=
com>
> wrote:
> >
> > Hello, dear developers. I use Yocto to build Kernel and rootfs for ARM
> Cortex-A72. Kernel and rootfs are in separate files The kernel has an Ima=
ge
> type (extension .bin). Rootfs has ext4 type(extension .ext4). I did not
> find this processor in the support list in QEMU 3.1.0 Dec 11th 2018. But
> this processor is on the support list in QEMU 3.1.0-rc3, but I could not
> run the kernel and rootfs.
> > Is there any possibility to run QUEMU for this processor?
>
> cortex-a72 is supported in 3.1.0. What are you doing that
> makes you think that it is not ?
>
> More important than the CPU type, you should make sure
> that the kernel and rootfs that you have built are for
> the correct board model (you probably want to be using
> the "virt" board). The differences between board
> models are much more important than the differences
> between different 64-bit Arm CPU types.
>
> thanks
> -- PMM
>

--000000000000086e77057dd3a4f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you for information!<br><div class=3D"gmail_quote"><=
div dir=3D"ltr"><div>Yes, I mean &quot;virt&quot; board.<br><br><span class=
=3D"m_-8025357515596374928gmail-tlid-translation m_-8025357515596374928gmai=
l-translation"><span title=3D"">Although there is no big difference now.</s=
pan> <span title=3D"">I really want to see the logs.</span><br><span title=
=3D"" class=3D"m_-8025357515596374928gmail-">If the board is not suitable f=
or the kernel, the logs will not be displayed?<br><br></span></span></div><=
span class=3D"m_-8025357515596374928gmail-tlid-translation m_-8025357515596=
374928gmail-translation"><span title=3D"" class=3D"m_-8025357515596374928gm=
ail-">With best regards, Stanislav.<br></span></span></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr">=D0=BF=D0=BD, 24 =D0=B4=D0=B5=D0=BA. 2018=
 =D0=B3. =D0=B2 17:48, Peter Maydell &lt;<a href=3D"mailto:peter.maydell@li=
naro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">On Mon, 24 Dec 2018 at 14:17,=
 =D0=A1=D1=82=D0=B0=D0=BD=D0=B8=D1=81=D0=BB=D0=B0=D0=B2 =D0=A2=D1=83=D0=BC=
=D0=B0=D1=81=D0=BE=D0=B2 &lt;<a href=3D"mailto:stast.3vium@gmail.com" targe=
t=3D"_blank">stast.3vium@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello, dear developers. I use Yocto to build Kernel and rootfs for ARM=
 Cortex-A72. Kernel and rootfs are in separate files The kernel has an Imag=
e type (extension .bin). Rootfs has ext4 type(extension .ext4). I did not f=
ind this processor in the support list in QEMU 3.1.0 Dec 11th 2018. But thi=
s processor is on the support list in QEMU 3.1.0-rc3, but I could not run t=
he kernel and rootfs.<br>
&gt; Is there any possibility to run QUEMU for this processor?<br>
<br>
cortex-a72 is supported in 3.1.0. What are you doing that<br>
makes you think that it is not ?<br>
<br>
More important than the CPU type, you should make sure<br>
that the kernel and rootfs that you have built are for<br>
the correct board model (you probably want to be using<br>
the &quot;virt&quot; board). The differences between board<br>
models are much more important than the differences<br>
between different 64-bit Arm CPU types.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>
</div></div>

--000000000000086e77057dd3a4f5--
