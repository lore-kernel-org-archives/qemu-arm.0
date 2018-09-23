Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1670878wrd;
        Sun, 23 Sep 2018 09:21:09 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63XfdV5FIq59OHQL+JFak+6gd5stZmh4D1UpPopn9ET03nWWfCek7Gm1PGqt9HXLoXn7MFc
X-Received: by 2002:a0c:86dc:: with SMTP id 28-v6mr3019912qvg.91.1537719669725;
        Sun, 23 Sep 2018 09:21:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537719669; cv=none;
        d=google.com; s=arc-20160816;
        b=pwMkmdM698gPZFyWmvN6G57EJfgWSaP5ET9qePg5QIAvSRwAkIayLzGyxBZtI7IWnn
         UiKb+YxsIBOg1NbspAkQstb8fs9W8zdlL4dZDTYqV0t1911mk1JOHUOufONDbrtEESxp
         CqUFuTlx4wYwAmlLiuAK6exuricAd7Y0TR8kea7KrKVRnUdocWJDneB/dIIjHiUOMYVw
         0OTYCHelfL3G3xr/Txk1+kXSx83ezxIOdR2VWHH/LNqK3VpJ+GKo20zfaoaML/TCGCpu
         qNL2S0YE6IizeRbwPMPL+17VCkQCjRNnPzJPR+DKfYnHsFPACYyMrpcQjTb5pI0i+QC0
         Kdfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:to
         :in-reply-to:date:mime-version:message-id:from:dkim-signature;
        bh=bSL964a5O7WoXfdnOiDtnn0ThAlrbkTcE/tnNg5mRHI=;
        b=hWG0YDcMGOLiD3EUu1rf7O+J9znvdxWVoCSATDK/sDJFx2Lls7pBchwmwdGveupmb5
         rekhxHnS8KzsLVEC83vl7qf/yx76PQ/f9ULjIPfrq+DITxpADDWnVNtbYSD1J0kYUSgz
         iKFaFa6n2s7iXmze6WIldFJVCZkYg+M3vMSITdBchyAE03gS7FxbQLoRwv8eVY4LUExX
         liEW8gAhm9R0OgLn3rCufkzTL1A1E7WfVfFYNekAsZ3l+6tLtIzfL4L2jsJ9XThr1ux5
         0LD/oEYib6yXSilrFmi9F+DCAbYL/LtGpi0pmKsthtuSspyjT/slDQzlvHP+2Dalc1aI
         6Qxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=gouQR9WI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p15-v6si1977650qve.62.2018.09.23.09.21.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 23 Sep 2018 09:21:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=gouQR9WI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41490 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4789-00079i-9A
	for alex.bennee@linaro.org; Sun, 23 Sep 2018 12:21:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46729)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <karthimohanraj.in@gmail.com>) id 1g4782-00079c-71
	for qemu-arm@nongnu.org; Sun, 23 Sep 2018 12:21:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <karthimohanraj.in@gmail.com>) id 1g477y-0004nM-Ud
	for qemu-arm@nongnu.org; Sun, 23 Sep 2018 12:21:02 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:36871)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <karthimohanraj.in@gmail.com>)
	id 1g477y-0004mx-NX
	for qemu-arm@nongnu.org; Sun, 23 Sep 2018 12:20:58 -0400
Received: by mail-pl1-x644.google.com with SMTP id q1-v6so2573809plr.4
	for <qemu-arm@nongnu.org>; Sun, 23 Sep 2018 09:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=bSL964a5O7WoXfdnOiDtnn0ThAlrbkTcE/tnNg5mRHI=;
	b=gouQR9WI2pdAd6ncaH52gRJKwottt6TXyZkqW8x9C8iJzshOiwAvcUWmUe3cL9ZDpp
	AFKei+1CoxMqCeRistVf5VCb+cVFMGJtROD4982eML27KHt5YtHnbWbYkHDHPt7qoiuj
	YI4k7NbR7ELPspPfucBDqMkfE2qxfXr2sDCCR1s+xgVXRK6sPPlla0HPnBnWAnZvkV3H
	msYbH23bPXNInJdAC/DcWwlqW3xA9tldDOytuYkOK0GaHUq1Mq1OugaxL8F/QTeL45l6
	dKT9/W3Hv01ATY9IpjmnsL0zEfKb3HFqjSLDcGulSGUTTUlqaIegjz3EVMQA50l5tico
	kaNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=bSL964a5O7WoXfdnOiDtnn0ThAlrbkTcE/tnNg5mRHI=;
	b=ulQi4yyUJ5XJW8oT9ORE8wly88umS7HgRwbhpG5aWwjBuGexICdfwVnB1/DmfFEXbG
	p6+7Vuxx4T/gLN/0EIU710aGeBnh5BGDHPSQIX0CkHZbQTLJDIxAhNSbU5jtesJWw1ao
	qQ9Xq1fvDY2Oe0bOiKRW7X78XcfnmUyR+6SfzyVeMmcu7w66cPYAeGAuhwdrWg9882wc
	YiuhlosCPrvI6if8oKSXvCvQbd7pHSERFxZ1zLezzR27nW4py/13gTrSA+YRcQTGg/c1
	qimA6UTEa4EgZCop0xGNZ9odI88ivd58+8T/4NpiBYxYLmpo0OAbBGGNVn5C5dvQXKQ9
	VTcw==
X-Gm-Message-State: ABuFfoifn3PizbLuku+YkHoD28X2saU0OcPumPbdNchc/C/8zB2WQjft
	M4TXUFLR/v6SKcQvh7WHpns=
X-Received: by 2002:a17:902:f085:: with SMTP id
	go5mr7261726plb.241.1537719657560; 
	Sun, 23 Sep 2018 09:20:57 -0700 (PDT)
Received: from [192.168.1.100] ([103.6.156.111])
	by smtp.gmail.com with ESMTPSA id
	t23-v6sm14878710pfl.109.2018.09.23.09.20.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Sep 2018 09:20:57 -0700 (PDT)
From: karthi mohanraj <karthimohanraj.in@gmail.com>
Message-Id: <7FECCB75-9B28-4AB7-8ED1-B37FEC14C644@gmail.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_2F1A3C70-8709-45EB-B69D-8CD6D7F41211"
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Date: Sun, 23 Sep 2018 21:50:38 +0530
In-Reply-To: <CAFEAcA9KwO=U99wKi-7pMJB5wwUAs1yEX98XR=RY0YTPZSvXKg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <F594E1D2-CAB1-48DF-9A78-66C3DC66F41E@gmail.com>
	<CAFEAcA-QWubs8FWWYuD9KjDnkjuVodtx++8DtHvsCC2AbDZSKg@mail.gmail.com>
	<9DF52029-EEB1-4ECA-B1B0-0F7B1ACAE83A@gmail.com>
	<CAFEAcA9KwO=U99wKi-7pMJB5wwUAs1yEX98XR=RY0YTPZSvXKg@mail.gmail.com>
X-Mailer: Apple Mail (2.3445.9.1)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: Re: [Qemu-arm] Arm Cortex A-72 Emulator not able to configure
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EIh8Xv+qWWwp


--Apple-Mail=_2F1A3C70-8709-45EB-B69D-8CD6D7F41211
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi Peter,

As i have gone through CentOS documentation qemu-system-arm is the only =
binary which is used for 64 bit and 32 bit arm emulation. There is no =
separate qemu-system-aarch64 binary in CentOS. Please correct me if =
i=E2=80=99m wrong.=20


Regards,
Karthi


> On 23-Sep-2018, at 9:46 PM, Peter Maydell <peter.maydell@linaro.org> =
wrote:
>=20
> On Sun, 23 Sep 2018 at 17:02, karthi mohanraj
> <karthimohanraj.in@gmail.com> wrote:
>>=20
>> Hi Peter,
>>=20
>> I have tried the blog post which you shared but i=E2=80=99m getting =
some error as Virt type not supported.
>>=20
>> qemu-system-arm -M virt -m 1024 -cpu cortex-a53   -kernel =
installer-linux   -initrd installer-initrd.gz   -drive =
if=3Dnone,file=3Dhda.qcow2,format=3Dqcow2,id=3Dhd   -device =
virtio-blk-pci,drive=3Dhd   -netdev user,id=3Dmynet   -device =
virtio-net-pci,netdev=3Dmynet   -nographic -no-reboot
>>=20
>> (process:3246): GLib-WARNING **: gmem.c:483: custom memory allocation =
vtable not supported
>> qemu-system-arm: mach-virt: CPU cortex-a53 not supported
>=20
> The blog post's command lines use qemu-system-aarch64. You're
> using qemu-system-arm, which is for 32-bit guest CPUs.
> Use the command lines it tells you to and you should have
> better success...
>=20
> thanks
> -- PMM


--Apple-Mail=_2F1A3C70-8709-45EB-B69D-8CD6D7F41211
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">Hi =
Peter,<div class=3D""><br class=3D""></div><div class=3D"">As i have =
gone through CentOS documentation<b class=3D""> =
qemu-system-arm</b>&nbsp;is the only binary which is used for 64 bit and =
32 bit arm emulation. There is no separate qemu-system-aarch64 binary in =
CentOS. Please correct me if i=E2=80=99m wrong.&nbsp;</div><div =
class=3D""><br class=3D""></div><div class=3D""><br class=3D""></div><div =
class=3D"">Regards,</div><div class=3D"">Karthi</div><div class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 23-Sep-2018, at 9:46 PM, Peter Maydell &lt;<a =
href=3D"mailto:peter.maydell@linaro.org" =
class=3D"">peter.maydell@linaro.org</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">On =
Sun, 23 Sep 2018 at 17:02, karthi mohanraj<br class=3D"">&lt;<a =
href=3D"mailto:karthimohanraj.in@gmail.com" =
class=3D"">karthimohanraj.in@gmail.com</a>&gt; wrote:<br =
class=3D""><blockquote type=3D"cite" class=3D""><br class=3D"">Hi =
Peter,<br class=3D""><br class=3D"">I have tried the blog post which you =
shared but i=E2=80=99m getting some error as Virt type not supported.<br =
class=3D""><br class=3D"">qemu-system-arm -M virt -m 1024 -cpu =
cortex-a53 &nbsp;&nbsp;-kernel installer-linux &nbsp;&nbsp;-initrd =
installer-initrd.gz &nbsp;&nbsp;-drive =
if=3Dnone,file=3Dhda.qcow2,format=3Dqcow2,id=3Dhd &nbsp;&nbsp;-device =
virtio-blk-pci,drive=3Dhd &nbsp;&nbsp;-netdev user,id=3Dmynet =
&nbsp;&nbsp;-device virtio-net-pci,netdev=3Dmynet &nbsp;&nbsp;-nographic =
-no-reboot<br class=3D""><br class=3D"">(process:3246): GLib-WARNING **: =
gmem.c:483: custom memory allocation vtable not supported<br =
class=3D"">qemu-system-arm: mach-virt: CPU cortex-a53 not supported<br =
class=3D""></blockquote><br class=3D"">The blog post's command lines use =
qemu-system-aarch64. You're<br class=3D"">using qemu-system-arm, which =
is for 32-bit guest CPUs.<br class=3D"">Use the command lines it tells =
you to and you should have<br class=3D"">better success...<br =
class=3D""><br class=3D"">thanks<br class=3D"">-- PMM<br =
class=3D""></div></div></blockquote></div><br =
class=3D""></div></body></html>=

--Apple-Mail=_2F1A3C70-8709-45EB-B69D-8CD6D7F41211--
