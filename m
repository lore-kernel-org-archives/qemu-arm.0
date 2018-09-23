Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1656251wrd;
        Sun, 23 Sep 2018 09:04:04 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZhEzKWtRR4YNvj5mUayK4P87Y60RvmobcCEmAaN4iQYCxp9YT4/M9M6aTknHdUpyf1Ae41
X-Received: by 2002:ac8:fe9:: with SMTP id f38-v6mr4488829qtk.63.1537718644420;
        Sun, 23 Sep 2018 09:04:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537718644; cv=none;
        d=google.com; s=arc-20160816;
        b=YaDP350GTUJJE+aKXEBmjN2Q0GGZb0t2lsCGY7KpVjp+bj1C57VjDzNIZH9COWmAVG
         UIdPwNuGQmZwgmt1ubTstorvLXpvjVjTUv/YO/C10VJdNRNC7+QM1ZpBB+MfowCEuMiV
         R2/ALlGVQf9O/aU4QcfUvJeoev5uO1qgUn1sxFDpTxj6yU8puGTqOjEICpeugm8navya
         AXcbFtD1Yf4LMkKtaAvid9dhsG3DvVorFswTqmGP7FosQ4fGXByXGY0uKoxKURLAyrZk
         BHn+JS3mxYG0ZElQBfztK9jxi8H5DLqRLydOqvsU7oaLanBnDne5ODugG1Q/X/ZUO4XG
         qq5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:to
         :in-reply-to:date:mime-version:message-id:from:dkim-signature;
        bh=cCMg2vQx47HUnBTwERsqMw2/Av8uYpiG7/qirZhim0k=;
        b=g/ZFk4hFSwJ36FUvCPU4Lzjqc5xvMA2p1yeVJYqhDn1+MXzMdJtMd1atqh2FxidJ7T
         qrR89V1Pjps3MCefApDBn7zl49teJ5ZCS5HUuOPFoDlxNaMTRPUkPADiwqbmr+lXYTQ1
         loPoMDaT9IMLwDK/06jKa3cYRM0a6AV+e9YI9GdfA6mb4Ipx9Y3E+yb72mFE4mcr33Qj
         4lXOghpVam/0a+gl1IimBzs7i8PbZNM/BHAR9p3nUwtc9tzGX8rCYNBUa0cvVVW7vSon
         T0IYbbAky1aFysuPIthwsEb2NLc9vQAJN2xAgaqBalIAj8Y6sNehoVX+MoH4rIniS6nA
         5OVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="Emk/cpNP";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y3-v6si1856823qvc.17.2018.09.23.09.04.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 23 Sep 2018 09:04:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="Emk/cpNP";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41319 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g46rc-0001bG-0m
	for alex.bennee@linaro.org; Sun, 23 Sep 2018 12:04:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42513)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <karthimohanraj.in@gmail.com>) id 1g46rR-0001a2-IG
	for qemu-arm@nongnu.org; Sun, 23 Sep 2018 12:03:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <karthimohanraj.in@gmail.com>) id 1g46qE-0002Cr-Ns
	for qemu-arm@nongnu.org; Sun, 23 Sep 2018 12:02:43 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:38431)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <karthimohanraj.in@gmail.com>)
	id 1g46qE-0002Bz-6e
	for qemu-arm@nongnu.org; Sun, 23 Sep 2018 12:02:38 -0400
Received: by mail-pf1-x442.google.com with SMTP id x17-v6so8005235pfh.5
	for <qemu-arm@nongnu.org>; Sun, 23 Sep 2018 09:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=cCMg2vQx47HUnBTwERsqMw2/Av8uYpiG7/qirZhim0k=;
	b=Emk/cpNPxRko/LQ6uY1oL81NSQR1EE25WcMF3asYCJLr4dHc1qNOfeCs4peiqNmgkw
	BDyHOaE+lzE1VvmaXi5W1l7XvvhIJLIkMYzviZEdPJpiTDaujG1AhByvaOO3GBTyJW2h
	o+SiHxSNhiRCwYxSDMpjbNcRzrr6Ri0OZgTcjKxxJAHQ4vS/NOr+HYgf7n7Wo9YFhiKC
	sfhS4m9kqkz649TiNP6ZSI3BJENeK85xOKDaKAE4C7CbwVFHEBlb/4EK0kEl+E2l32IA
	uiDGutClxAM6Y1NwIKz0FruVrTPEG1YNziA5Is5F+y/S/wdYp3b1eBiV6mllVr0/Ykn0
	9vQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=cCMg2vQx47HUnBTwERsqMw2/Av8uYpiG7/qirZhim0k=;
	b=h4vNUtdktMskflixKTkEyIV7BFu0QVRiUndCMCMXtkPhZ+q4T64yG20z48IpjBiAc8
	rVS6KG3TNrZX8yenF/K3S/hwUFVz9BVX+xVDnfwWAxMTEHDwhLkEgVA1iKTdwYpOhkzA
	ofPU/A4GYyGiUezrSuDsOwMRtQWIC6AsrT/xfq4AQafsWk97fV8FjkiOWNrYXke9es2c
	JOuV3waNNliZSSIHamTlSDoQ8VMWwFq76oqS8mx/UgKmxCjj82mcjNxvwi6HCP9FHePK
	/GFo990wXBYE9RQUSUSKjNF0JMx1aM9RUnW7tBtRb3eYkbZgioFVPL2PZO1CE/+maBvx
	N7qA==
X-Gm-Message-State: APzg51CEhJtGoHNcbAR92Wmv5ILuX422F1Poc+Wn0DD3/RjJxanspzyQ
	R5hL8pfbJg2h9en/XESHM4c=
X-Received: by 2002:aa7:8118:: with SMTP id
	b24-v6mr6904007pfi.78.1537718556548; 
	Sun, 23 Sep 2018 09:02:36 -0700 (PDT)
Received: from [192.168.1.100] ([103.6.156.111])
	by smtp.gmail.com with ESMTPSA id
	l3-v6sm41451242pff.8.2018.09.23.09.02.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Sep 2018 09:02:35 -0700 (PDT)
From: karthi mohanraj <karthimohanraj.in@gmail.com>
Message-Id: <9DF52029-EEB1-4ECA-B1B0-0F7B1ACAE83A@gmail.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_520088A6-614A-4CE2-8C2F-47CFA1C0D6CF"
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Date: Sun, 23 Sep 2018 21:32:29 +0530
In-Reply-To: <CAFEAcA-QWubs8FWWYuD9KjDnkjuVodtx++8DtHvsCC2AbDZSKg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <F594E1D2-CAB1-48DF-9A78-66C3DC66F41E@gmail.com>
	<CAFEAcA-QWubs8FWWYuD9KjDnkjuVodtx++8DtHvsCC2AbDZSKg@mail.gmail.com>
X-Mailer: Apple Mail (2.3445.9.1)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::442
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
X-TUID: j4Jx+473DtGf


--Apple-Mail=_520088A6-614A-4CE2-8C2F-47CFA1C0D6CF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi Peter,=20

I have tried the blog post which you shared but i=E2=80=99m getting some =
error as Virt type not supported.=20

qemu-system-arm -M virt -m 1024 -cpu cortex-a53   -kernel =
installer-linux   -initrd installer-initrd.gz   -drive =
if=3Dnone,file=3Dhda.qcow2,format=3Dqcow2,id=3Dhd   -device =
virtio-blk-pci,drive=3Dhd   -netdev user,id=3Dmynet   -device =
virtio-net-pci,netdev=3Dmynet   -nographic -no-reboot

(process:3246): GLib-WARNING **: gmem.c:483: custom memory allocation =
vtable not supported
qemu-system-arm: mach-virt: CPU cortex-a53 not supported

Some times i=E2=80=99m getting error as pic-virtio device not supported.=20=


I would give some picture on what i=E2=80=99m trying to achieve.=20

I have a host with CentOS 7 (x86 arch) and in that i have install Qemu =
and KVM. In this server, I=E2=80=99m trying to install a VM with Arm64 =
and setup a development environment for ARM.=20

Regards,=20
Karthi=20

> On 22-Sep-2018, at 1:09 AM, Peter Maydell <peter.maydell@linaro.org> =
wrote:
>=20
> On 21 September 2018 at 11:04, karthi mohanraj
> <karthimohanraj.in@gmail.com> wrote:
>> Hi All,
>>=20
>> I=E2=80=99m new to Qemu Environment. I was trying to setup a Arm (64 =
bit) emulator
>> for getting hands-on and need to setup an development environment. I =
was
>> not able to find any document or any working article for setting up
>> the ARM Emulator using KVM. Can someone help me to point in right =
direction to proceed?
>=20
> =
https://translatedcode.wordpress.com/2017/07/24/installing-debian-on-qemus=
-64-bit-arm-virt-board/
> To use KVM on an Arm host you should just be able to pass
> "-cpu host -enable-kvm" instead of "-cpu cortex-53" (by
> default it will use emulation, which will work but be slower).
>=20
>> can this be achieved in Nested Virtualization?
>=20
> You'll need to be clearer about what you mean here, but in general
> nested virt is not yet implemented for arm hosts.
>=20
> thanks
> -- PMM


--Apple-Mail=_520088A6-614A-4CE2-8C2F-47CFA1C0D6CF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">Hi =
Peter,&nbsp;<div class=3D""><br class=3D""></div><div class=3D"">I have =
tried the blog post which you shared but i=E2=80=99m getting some error =
as Virt type not supported.&nbsp;</div><div class=3D""><br =
class=3D""></div><div class=3D""><span style=3D"background-color: =
white;" class=3D""><i class=3D""><font size=3D"2" =
class=3D"">qemu-system-arm -M virt -m 1024 -cpu cortex-a53 &nbsp; =
-kernel installer-linux &nbsp; -initrd installer-initrd.gz &nbsp; -drive =
if=3Dnone,file=3Dhda.qcow2,format=3Dqcow2,id=3Dhd &nbsp; -device =
virtio-blk-pci,drive=3Dhd &nbsp; -netdev user,id=3Dmynet &nbsp; -device =
virtio-net-pci,netdev=3Dmynet &nbsp; -nographic =
-no-reboot</font></i></span><div style=3D"margin: 0px; font-stretch: =
normal; line-height: normal; min-height: 21px;" class=3D""><span =
style=3D"background-color: white;" class=3D""><i class=3D""><font =
size=3D"2" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D""></span><br =
class=3D""></font></i></span></div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"background-color: white;" class=3D""><i class=3D""><font =
size=3D"2" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">(process:3246): GLib-</span><span =
style=3D"font-variant-ligatures: no-common-ligatures; color: #ffff37" =
class=3D""><b class=3D"">WARNING</b></span><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""> **: =
gmem.c:483: custom memory allocation vtable not =
supported</span></font></i></span></div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures; background-color: =
white;" class=3D""><i class=3D""><font size=3D"2" =
class=3D"">qemu-system-arm: mach-virt: CPU cortex-a53 not =
supported</font></i></span></div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures; background-color: =
white;" class=3D""><i class=3D""><font size=3D"2" class=3D""><br =
class=3D""></font></i></span></div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures; background-color: =
white;" class=3D""><font size=3D"2" class=3D""><i class=3D"">Some times =
i=E2=80=99m getting error as&nbsp;</i></font></span><font size=3D"2" =
class=3D""><i class=3D"">pic-virtio device =
not&nbsp;supported.&nbsp;</i></font></div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures; background-color: =
white;" class=3D""><i class=3D""><font size=3D"2" class=3D""><br =
class=3D""></font></i></span></div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal;" class=3D""><font size=3D"2" =
class=3D""><span style=3D"background-color: rgb(255, 255, 255);" =
class=3D"">I would give some picture on what i=E2=80=99m trying =
to&nbsp;</span>achieve.&nbsp;</font></div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal;" class=3D""><font size=3D"2" =
class=3D""><br class=3D""></font></div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal;" class=3D""><font size=3D"2" =
class=3D"">I have a host with CentOS 7 (x86 arch) and in that i have =
install Qemu and KVM. In this server, I=E2=80=99m trying to install a VM =
with Arm64 and setup a development environment for =
ARM.&nbsp;</font></div><div><br =
class=3D""></div><div>Regards,&nbsp;</div><div>Karthi&nbsp;</div><div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">On =
22-Sep-2018, at 1:09 AM, Peter Maydell &lt;<a =
href=3D"mailto:peter.maydell@linaro.org" =
class=3D"">peter.maydell@linaro.org</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">On =
21 September 2018 at 11:04, karthi mohanraj<br class=3D"">&lt;<a =
href=3D"mailto:karthimohanraj.in@gmail.com" =
class=3D"">karthimohanraj.in@gmail.com</a>&gt; wrote:<br =
class=3D""><blockquote type=3D"cite" class=3D"">Hi All,<br class=3D""><br =
class=3D"">I=E2=80=99m new to Qemu Environment. I was trying to setup a =
Arm (64 bit) emulator<br class=3D"">for getting hands-on and need to =
setup an development environment. I was<br class=3D"">not able to find =
any document or any working article for setting up<br class=3D"">the ARM =
Emulator using KVM. Can someone help me to point in right direction to =
proceed?<br class=3D""></blockquote><br class=3D""><a =
href=3D"https://translatedcode.wordpress.com/2017/07/24/installing-debian-=
on-qemus-64-bit-arm-virt-board/" =
class=3D"">https://translatedcode.wordpress.com/2017/07/24/installing-debi=
an-on-qemus-64-bit-arm-virt-board/</a><br class=3D"">To use KVM on an =
Arm host you should just be able to pass<br class=3D"">"-cpu host =
-enable-kvm" instead of "-cpu cortex-53" (by<br class=3D"">default it =
will use emulation, which will work but be slower).<br class=3D""><br =
class=3D""><blockquote type=3D"cite" class=3D"">can this be achieved in =
Nested Virtualization?<br class=3D""></blockquote><br class=3D"">You'll =
need to be clearer about what you mean here, but in general<br =
class=3D"">nested virt is not yet implemented for arm hosts.<br =
class=3D""><br class=3D"">thanks<br class=3D"">-- PMM<br =
class=3D""></div></div></blockquote></div><br =
class=3D""></div></body></html>=

--Apple-Mail=_520088A6-614A-4CE2-8C2F-47CFA1C0D6CF--
