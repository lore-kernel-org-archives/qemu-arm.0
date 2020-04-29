Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp323607lfm;
        Wed, 29 Apr 2020 02:04:16 -0700 (PDT)
X-Google-Smtp-Source: APiQypKECHIjxkJRUIOK32ITVrovhywMIHf88Vz327zuar0zRznzINVD+i0DsaZFnmUSwifLwQ1X
X-Received: by 2002:a05:6214:3e2:: with SMTP id cf2mr30317802qvb.193.1588151056172;
        Wed, 29 Apr 2020 02:04:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588151056; cv=none;
        d=google.com; s=arc-20160816;
        b=jFxx8tVw4/K78Fur/NdT2pfq25cnyxAiKP57dql5hFVrb6i4t2XfnhqqBjRiZIBOzS
         7gc6g6aKSK4mz6cbUYfUqhzFZpOn5W78c8OTWCuM9j861vBgSAgbcIiXBQcF4HW/4/Sc
         Y9PwnZSf48VDe3kPwCQsJJkSbvRShhPKka8qst17P096JOPgs7keHF/Hv3bSIfYvRg5p
         3/HNBidjsl9ODc45o95gwUxnQmdGnDO3e2BhiAeqE8b/NAMGNg6WhoF/yTkF1+l0rpXK
         AGyk0KpsDUVj5wYLGBS015F80IxtBKcYMmgp3dO5xClj4vqFN35a/PChdEpVt4Y8TH4Q
         sI3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=JDbxljKw+ISuTYIBuU3R/VKuoxcCUtNGydKlXJG412w=;
        b=XoZU/Wg3k3/OvJiLh4/MXx2kgrQ0p+05x8SPuDZtaH69OrT1uvmGg8t3XQghCV7jng
         /+sIutsqu02pTb+NOcV5pXmcK8l8uEUv/r9i4Xieeb67RtBAr0kwMPLTD3kGxnw2MPtC
         nACrfreFj/YqYAb3cXFqqRZBbb2F3Fp6gUXPcRBoUOWtdwJ69fMTp7RLEw3cIsrDsXRJ
         1XPfMc3v6xsaexscdqhn9i1Wbm3pmWypd2KjFCFvkVVBFzfZy8r5JEgP74uiPULvEVno
         A2BsA3ssTbESjFnT/S608kKSq/pL/2GaDaukKsb24wqyjp4OA3thZzyzj+3JU51TJKhG
         40kQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=gsvOxdlJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id n7si11695151qtv.38.2020.04.29.02.04.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Apr 2020 02:04:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=gsvOxdlJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jTidb-0004dm-HB
	for alex.bennee@linaro.org; Wed, 29 Apr 2020 05:04:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53280)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <technochicken2038@gmail.com>) id 1jThsg-0008Cs-QH
 for qemu-arm@nongnu.org; Wed, 29 Apr 2020 04:15:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <technochicken2038@gmail.com>) id 1jThse-0008RC-HA
 for qemu-arm@nongnu.org; Wed, 29 Apr 2020 04:15:46 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:41095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <technochicken2038@gmail.com>)
 id 1jThse-0008If-1B
 for qemu-arm@nongnu.org; Wed, 29 Apr 2020 04:15:44 -0400
Received: by mail-wr1-x429.google.com with SMTP id g13so1349597wrb.8
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2020 01:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=JDbxljKw+ISuTYIBuU3R/VKuoxcCUtNGydKlXJG412w=;
 b=gsvOxdlJ+yCWkKTNJOjLM/HC98k+3DPVn+0wnGrs7Zz/lUxGkeaXTQ/iU5+afg6p1A
 mqUuYOmtFBaG4n0gbDmjKxixMPZfAovSxUg7X7GEi4FrzOcc32D81YJZh/p8OuqN2DhW
 emADdqAxoVX/v3HpThtZs/B9ksZzc0Q59cBEB+C9zJ5EK6jRPx/I0PBok13FGe0x7Lff
 btzzyZ4cGS5VQ05Oca6WQ1DQZeArP0zIPdrUQG6AoTC+RB+M0cnADaMkQ10gH3xuM4l/
 nXvogqBvTJJ8AaAxD6nxECkxP/Y9EGsMN3RTOZ+CWVf2huJknNyyJ6+FAQ50bCEILmUL
 UaAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=JDbxljKw+ISuTYIBuU3R/VKuoxcCUtNGydKlXJG412w=;
 b=nXKoXfk/n2lNXhfbcE3dyNwiPwEnGUpKHZFis+iKfaVXZaYK7LWC7MRPbxyn2ngAOW
 rodKZAa9erzXeMZ4+cTQX2+5bLIXuRbGmMmGokYtQP/dxqDVJyB0thS4mmUCEh0kXHCA
 nyTvl10tUKFLmLrnF4QdFvp1AI9gWWFnBkVeJv0ZQFv/nE8COm/D1sucYVSJwZtdQnVk
 vvWMYodMDmuBMPenAiyt6cvY+w4ua1rgsZc9ClELWD9h2Xkap1+VNyKaGGSdQw46lf5E
 nMQ9cu9egPHZnvJcIderSVbXhhb+Z2wFjD9EECADlmWWCIYUfeKAQ3eB97wKY5mT3IJ9
 apbQ==
X-Gm-Message-State: AGi0PuaZMNIkp5cuqKIYLTekGhr6dWdJpGkohylOTR/cpTBZ8UWelJGI
 wdmDF5b1zA/1KMnk9VXSMSFAS+WDEGn5uap4LKd0HMV8
X-Received: by 2002:adf:ea05:: with SMTP id q5mr40634054wrm.180.1588148141345; 
 Wed, 29 Apr 2020 01:15:41 -0700 (PDT)
MIME-Version: 1.0
From: Prabhnoor Ghuman <technochicken2038@gmail.com>
Date: Wed, 29 Apr 2020 18:15:30 +1000
Message-ID: <CAJ5bNgcK9S-1RH=CdqB_wfPu+qPMYZFWWgso06QHfD-NOiRFuQ@mail.gmail.com>
Subject: Guest has not initialized the display (yet).
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000d0d5c805a4698d92"
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=technochicken2038@gmail.com; helo=mail-wr1-x429.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::429
X-Mailman-Approved-At: Wed, 29 Apr 2020 05:03:00 -0400
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MqE3JTijtJZr

--000000000000d0d5c805a4698d92
Content-Type: text/plain; charset="UTF-8"

Over the last couple of days, I have been trying to run a QEMU system due
to a server that I was setting up. I wanted to protect my actual computer
from anything malicious that could get onto it due to a person being able
to upload. The speed wasn't great and I realised the problem was likely the
fact that the x86_64 emulator doesn't allow for multithreading TCG (well I
can't find anything saying it does anyway), and I had the option enabled. I
therefore decided I could go use a different architecture because the
operating system I would like to use is openSUSE, and it supports aarch64
as well. I have an installer ISO and a QCOW2 disk image. I tried booting
the system and then the error came up: "Guest has not initialized the
display (yet)".

Here are the command line parameters I am using at the moment:

qemu-system-aarch64 -cdrom
"C:\Users\GHU0002\Downloads\openSUSE-Tumbleweed-NET-aarch64-Snapshot20200421-Media.iso"
-drive file=Drive.qcow2 -m 2G -smp 4 -machine sbsa-ref -usbdevice
tablet -net nic -net user -accel tcg,thread=multi -vga xenfb -display
gtk

*Sidenote: I am using the 'sbsa-ref' machine because it is the only
one that seemed to support everything I needed: 4 Cores, 2GB RAM, USB,
and a CD drive. If it is just a problem with the machine, please
suggest another that I can use.*

My system specs:

   - 1.10GHz Celeron N4100 (up to 2.3GHz) (*not great, I know*)
   - 4GB RAM
   - 128GB SanDisk SSD (not sure which type, but pretty sure that
isn't relevant)
   - iGPU UHD 600 (*Again, I know*)

Any help is appreciated!

--000000000000d0d5c805a4698d92
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p style=3D"margin:0px 0px 1em;padding:0px;border:0px;font=
-variant-numeric:inherit;font-variant-east-asian:inherit;font-stretch:inher=
it;line-height:inherit;font-family:Arial,&quot;Helvetica Neue&quot;,Helveti=
ca,sans-serif;font-size:15px;vertical-align:baseline;box-sizing:inherit;cle=
ar:both;color:rgb(36,39,41)">Over the last couple of days, I have been tryi=
ng to run a QEMU system due to a server that I was setting up. I wanted to =
protect my actual computer from anything malicious that could get onto it d=
ue to a person being able to upload. The speed wasn&#39;t great and I reali=
sed the problem was likely the fact that the x86_64 emulator doesn&#39;t al=
low for multithreading TCG (well I can&#39;t find anything saying it does a=
nyway), and I had the option enabled. I therefore decided I could go use a =
different architecture because the operating system I would like to use is =
openSUSE, and it supports aarch64 as well. I have an installer ISO and a QC=
OW2 disk image. I tried booting the system and then the error came up: &quo=
t;Guest has not initialized the display (yet)&quot;.</p><p style=3D"margin:=
0px 0px 1em;padding:0px;border:0px;font-variant-numeric:inherit;font-varian=
t-east-asian:inherit;font-stretch:inherit;line-height:inherit;font-family:A=
rial,&quot;Helvetica Neue&quot;,Helvetica,sans-serif;font-size:15px;vertica=
l-align:baseline;box-sizing:inherit;clear:both;color:rgb(36,39,41)">Here ar=
e the command line parameters I am using at the moment:<br></p><pre style=
=3D"margin-top:0px;margin-bottom:1em;padding:12px 8px;border:0px;font-varia=
nt-numeric:inherit;font-variant-east-asian:inherit;font-stretch:inherit;lin=
e-height:inherit;font-family:Consolas,Menlo,Monaco,&quot;Lucida Console&quo=
t;,&quot;Liberation Mono&quot;,&quot;DejaVu Sans Mono&quot;,&quot;Bitstream=
 Vera Sans Mono&quot;,&quot;Courier New&quot;,monospace,sans-serif;font-siz=
e:13px;vertical-align:baseline;box-sizing:inherit;width:auto;max-height:600=
px;overflow:auto;border-radius:3px;color:rgb(36,39,41)"><code style=3D"marg=
in:0px;padding:0px;border:0px;font-style:inherit;font-variant:inherit;font-=
weight:inherit;font-stretch:inherit;line-height:inherit;font-family:Consola=
s,Menlo,Monaco,&quot;Lucida Console&quot;,&quot;Liberation Mono&quot;,&quot=
;DejaVu Sans Mono&quot;,&quot;Bitstream Vera Sans Mono&quot;,&quot;Courier =
New&quot;,monospace,sans-serif;vertical-align:baseline;box-sizing:inherit;b=
ackground-color:transparent;white-space:inherit">qemu-system-aarch64 -cdrom=
 &quot;C:\Users\GHU0002\Downloads\openSUSE-Tumbleweed-NET-aarch64-Snapshot2=
0200421-Media.iso&quot; -drive file=3DDrive.qcow2 -m 2G -smp 4 -machine sbs=
a-ref -usbdevice tablet -net nic -net user -accel tcg,thread=3Dmulti -vga x=
enfb -display gtk</code></pre><pre style=3D"margin-top:0px;margin-bottom:1e=
m;padding:12px 8px;border:0px;font-variant-numeric:inherit;font-variant-eas=
t-asian:inherit;font-stretch:inherit;line-height:inherit;font-family:Consol=
as,Menlo,Monaco,&quot;Lucida Console&quot;,&quot;Liberation Mono&quot;,&quo=
t;DejaVu Sans Mono&quot;,&quot;Bitstream Vera Sans Mono&quot;,&quot;Courier=
 New&quot;,monospace,sans-serif;font-size:13px;vertical-align:baseline;box-=
sizing:inherit;width:auto;max-height:600px;overflow:auto;border-radius:3px;=
color:rgb(36,39,41)"><code style=3D"margin:0px;padding:0px;border:0px;font-=
style:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit=
;line-height:inherit;font-family:Consolas,Menlo,Monaco,&quot;Lucida Console=
&quot;,&quot;Liberation Mono&quot;,&quot;DejaVu Sans Mono&quot;,&quot;Bitst=
ream Vera Sans Mono&quot;,&quot;Courier New&quot;,monospace,sans-serif;vert=
ical-align:baseline;box-sizing:inherit;background-color:transparent;white-s=
pace:inherit"><p style=3D"margin:0px 0px 1em;padding:0px;border:0px;font-va=
riant-numeric:inherit;font-variant-east-asian:inherit;font-stretch:inherit;=
line-height:inherit;font-family:Arial,&quot;Helvetica Neue&quot;,Helvetica,=
sans-serif;font-size:15px;vertical-align:baseline;box-sizing:inherit;clear:=
both;white-space:normal"><em style=3D"margin:0px;padding:0px;border:0px;fon=
t-variant:inherit;font-weight:inherit;font-stretch:inherit;line-height:inhe=
rit;font-family:inherit;vertical-align:baseline;box-sizing:inherit">Sidenot=
e: I am using the &#39;sbsa-ref&#39; machine because it is the only one tha=
t seemed to support everything I needed: 4 Cores, 2GB RAM, USB, and a CD dr=
ive. If it is just a problem with the machine, please suggest another that =
I can use.</em></p><p style=3D"margin:0px 0px 1em;padding:0px;border:0px;fo=
nt-variant-numeric:inherit;font-variant-east-asian:inherit;font-stretch:inh=
erit;line-height:inherit;font-family:Arial,&quot;Helvetica Neue&quot;,Helve=
tica,sans-serif;font-size:15px;vertical-align:baseline;box-sizing:inherit;c=
lear:both;white-space:normal">My system specs:</p><ul style=3D"margin:0px 0=
px 1em 30px;padding:0px;border:0px;font-variant-numeric:inherit;font-varian=
t-east-asian:inherit;font-stretch:inherit;line-height:inherit;font-family:A=
rial,&quot;Helvetica Neue&quot;,Helvetica,sans-serif;font-size:15px;vertica=
l-align:baseline;list-style-position:initial;box-sizing:inherit;white-space=
:normal"><li style=3D"margin:0px 0px 0.5em;padding:0px;border:0px;font-styl=
e:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;lin=
e-height:inherit;font-family:inherit;vertical-align:baseline;box-sizing:inh=
erit">1.10GHz Celeron N4100 (up to 2.3GHz) (<em style=3D"margin:0px;padding=
:0px;border:0px;font-variant:inherit;font-weight:inherit;font-stretch:inher=
it;line-height:inherit;font-family:inherit;vertical-align:baseline;box-sizi=
ng:inherit">not great, I know</em>)</li><li style=3D"margin:0px 0px 0.5em;p=
adding:0px;border:0px;font-style:inherit;font-variant:inherit;font-weight:i=
nherit;font-stretch:inherit;line-height:inherit;font-family:inherit;vertica=
l-align:baseline;box-sizing:inherit">4GB RAM</li><li style=3D"margin:0px 0p=
x 0.5em;padding:0px;border:0px;font-style:inherit;font-variant:inherit;font=
-weight:inherit;font-stretch:inherit;line-height:inherit;font-family:inheri=
t;vertical-align:baseline;box-sizing:inherit">128GB SanDisk SSD (not sure w=
hich type, but pretty sure that isn&#39;t relevant)</li><li style=3D"margin=
:0px;padding:0px;border:0px;font-style:inherit;font-variant:inherit;font-we=
ight:inherit;font-stretch:inherit;line-height:inherit;font-family:inherit;v=
ertical-align:baseline;box-sizing:inherit">iGPU UHD 600 (<em style=3D"margi=
n:0px;padding:0px;border:0px;font-variant:inherit;font-weight:inherit;font-=
stretch:inherit;line-height:inherit;font-family:inherit;vertical-align:base=
line;box-sizing:inherit">Again, I know</em>)</li></ul><p style=3D"margin:0p=
x 0px 1em;padding:0px;border:0px;font-variant-numeric:inherit;font-variant-=
east-asian:inherit;font-stretch:inherit;line-height:inherit;font-family:Ari=
al,&quot;Helvetica Neue&quot;,Helvetica,sans-serif;font-size:15px;vertical-=
align:baseline;box-sizing:inherit;clear:both;white-space:normal">Any help i=
s appreciated!</p>

</code></pre></div>

--000000000000d0d5c805a4698d92--
