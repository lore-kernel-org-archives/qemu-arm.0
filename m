Received: by 10.28.4.212 with SMTP id 203csp446221wme;
        Fri, 27 Apr 2018 00:25:32 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoGQFSOUaPPKG1CozpFRTgBaxHh5pNuuAOYU26KoAeMwAmbZqfk8wp8VmTn4TIuPij0fW6i
X-Received: by 2002:ac8:8ec:: with SMTP id y41-v6mr1060214qth.26.1524813932461;
        Fri, 27 Apr 2018 00:25:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524813932; cv=none;
        d=google.com; s=arc-20160816;
        b=GGFZMA6WOb9/MZWWkafueTTb5CRTbCbP4pN3vyS1TCb1oOylFl6/ysMSFYARmk3qQT
         /zaPlL91YxSwCsRcnXF9ZSt5g5qmxOOvwlP4vLrEqWICzpPDCIo5jkOB3QbXohjFu67u
         MhiH7Z+iZ7E6xcZGhJMxNr60XCKUcZPVZizQnBvPNolryKcOtncLhS+h/kUAdL32DAXd
         S+qhPwiChG9TQ8uwG0xtNnNXV6X+ce+L7G6LL2L2PW2Tf1I2e9f1pMfF7ykYXluwYaak
         pVfFtYN8cDcQKJdP2YdSjr44zJUB8l4QS1f5cxtqXew3K2diEI+KkIou77q0IilpGPhV
         zxKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:dkim-signature:arc-authentication-results;
        bh=yHuueV2nkux82NeMOSfoU7I6MauWJcZAP2Qf6aP8NXE=;
        b=xGgL9tsauxH31zC9Yom3zecNLACUpHyeyiTvi7YmR/KgbMSzlYZ3UmWsRUGyvHfMm0
         jeqVJG4uMW490uHLL9MVmPch87sc0uAgilFdN5dXpQFIn2Ti+EXpEIH3OgmWTCSK0mGS
         ZCf1gs3WZQro9i0bzg9aIyP0Vb4VPPwUID79+oSgUbmNGfzMuUWn9naCfyAdj7WRNPVo
         wpGwqw1fG5hwDn+myXcdOoTECpVn4lgDgxi+er6b+SxRkijq5hy5DwzVxU43qtfPUp6l
         qAr3GRMCI/v/oUPA1zuAyF96Xa3DZoBeclx/DbqgSafFx0F6RWdQCHGXdK3QMZr/PVnQ
         SCHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NyT/S26z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o12-v6si243414qtk.1.2018.04.27.00.25.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Apr 2018 00:25:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NyT/S26z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46128 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fBxl5-0003Mf-VL
	for alex.bennee@linaro.org; Fri, 27 Apr 2018 03:25:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47225)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <debby83729@gmail.com>) id 1fBwnl-00086G-SA
	for qemu-arm@nongnu.org; Fri, 27 Apr 2018 02:24:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <debby83729@gmail.com>) id 1fBwnk-0002Tr-TN
	for qemu-arm@nongnu.org; Fri, 27 Apr 2018 02:24:13 -0400
Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236]:39778)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <debby83729@gmail.com>)
	id 1fBwnk-0002TW-Id
	for qemu-arm@nongnu.org; Fri, 27 Apr 2018 02:24:12 -0400
Received: by mail-wm0-x236.google.com with SMTP id b21so826139wme.4
	for <qemu-arm@nongnu.org>; Thu, 26 Apr 2018 23:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=yHuueV2nkux82NeMOSfoU7I6MauWJcZAP2Qf6aP8NXE=;
	b=NyT/S26zGfWKTwl61cTRAZDzxQ3bvMd7/AemKzVJnPWyl6rNGrTgfJ/1DXyOQi2bok
	IWBgjYgvhbJTYXvUb3fXgN1st3WyliEk9Y84pU3v+0ENoDTDJEVko7ICvKDUA87oodYg
	OoyRVRKMG0fXVnwq6rfZ0ufttD1sooe7pDXiINKw4d5AAX5kwejvudvkKkvcFtJ6Lhr5
	TO6tvhQBtvrbYm8gBtYVynd0IuCYp7gd5wVf9vAMhO3ggEaEDv5Gy/9+VJmEaJ/B312F
	+W2GKL1+n7JW6gc/9w69N5/99KjbWQoXa7V+KLxs/nnPGSSQtf/jp95IZQz08Zk/eYT8
	LC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=yHuueV2nkux82NeMOSfoU7I6MauWJcZAP2Qf6aP8NXE=;
	b=bzk+D+14mU3BFDiuiDiGjSONwyFyrnnIhvEMRHCmULQ4N44NKTt0xb8hVo2RUjO+Mq
	o3ny4RLtRXqCDWTSHOCm8GpXIj64YfIweFPlCoxshKZwF/K+z8R7gDhU3nRSedvRhRX6
	j5K9/4UHRPyBuKy7DhdOSG+8yOlOfJbI7rmsjA0UBPCBM0sse1EDQ6+JfhkEVAZ26vDH
	pvq9LCXkjgTwNzwbJHRa8breRTgm7WeNtzjToDPAFNllW2KOAKw6oyZjHSl1DOfi2ggw
	b6hEsDIAuEE/wckNV08+oUH2IT07YpNZxvnripSlm0+J69LqOJtI8tPDtMTIUi8mxav+
	YfPA==
X-Gm-Message-State: ALQs6tBI42nbkuoAfeNhAsEt+3asRgGwfBLPek5YGxucr+lF/3t38C/j
	Xrgmo9AGqXvl/QIBLltSX7YaLeBv/0W6IVAjm74b0A==
X-Received: by 2002:a50:8c8c:: with SMTP id
	q12-v6mr1733229edq.17.1524810250908; 
	Thu, 26 Apr 2018 23:24:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.193.130 with HTTP; Thu, 26 Apr 2018 23:23:50 -0700 (PDT)
From: Eva Chen <debby83729@gmail.com>
Date: Fri, 27 Apr 2018 14:23:50 +0800
Message-ID: <CAG0V3WRaw45=ERc+8L3PRdL3gSEjN1BtW7xxerNU2rRK7AHzDg@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000005af70a056ace8d7a"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::236
X-Mailman-Approved-At: Fri, 27 Apr 2018 03:25:19 -0400
Subject: [Qemu-arm] Ask about how DMA is implemented in qemu-arm-system
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
X-TUID: ZVRaZ1r4IhY8

--0000000000005af70a056ace8d7a
Content-Type: text/plain; charset="UTF-8"

Hello,

I want to learn the implementation of simulation DMA, including the flow of
DMA read/write.
The first step I tried is to learn it by debugging *qemu-system-arm.* The
machine I used is *raspi2. *Bcm2835 DMA controller is initialed during
booting, but I find that there are no other devices use DMA read or write
during the booting. (I set breakpoint at *dma_memory_rw() *)Therefore, I
have no idea how to observe the behavior of DMA read/write.

I have read the files under /hw/dma, but these files only describe DMA
structure, they are not related to the behavior of DMA read/write. What I
want to learn is how QEMU dispatch the DMA read/write(using other threads
except cpu thread to do read/write?), and how to invoke guest CPU that the
DMA read/write finish( send signal to main loop thread or CPU thread?).

As far as I know is that using DMA read/write will call function
dma_memory_rw(). I don't know how to invoke DMA read/write in the guest
application. Is there any way to invoke DMA in application? or any method
that I can learn how DMA is simulated in QEMU?

Any advice is welcome. I will be grateful for any help.


Sincerely,
Eva

--0000000000005af70a056ace8d7a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:microsof=
t jhenghei,sans-serif">Hello,<br><br>I want to learn the implementation of =
simulation DMA, including the flow of DMA read/write.</div><div class=3D"gm=
ail_default" style=3D"font-family:microsoft jhenghei,sans-serif">The first =
step I tried is to learn it by debugging=C2=A0<i>qemu-system-arm.</i> The m=
achine I used is=C2=A0<b><i>raspi2</i>. </b>Bcm2835 DMA controller is initi=
aled during booting, but I find that there are no other devices use DMA rea=
d or write during the booting. (I set breakpoint=C2=A0at <i>dma_memory_rw()=
=C2=A0</i>)Therefore, I have no idea how to=C2=A0observe the behavior of DM=
A read/write.</div><div class=3D"gmail_default" style=3D"font-family:micros=
oft jhenghei,sans-serif"><br></div><div class=3D"gmail_default" style=3D"fo=
nt-family:microsoft jhenghei,sans-serif"><span style=3D"color:rgb(34,34,34)=
;font-family:&quot;microsoft jhenghei&quot;,sans-serif;font-size:small;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial;float:none=
;display:inline">I have read the files under /hw/dma, but these files only =
describe DMA structure, they are not related to the behavior of DMA read/wr=
ite. What I want to learn is how QEMU dispatch the=C2=A0</span><span style=
=3D"color:rgb(34,34,34);font-family:&quot;microsoft jhenghei&quot;,sans-ser=
if;font-size:small;font-style:normal;font-variant-ligatures:normal;font-var=
iant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;tex=
t-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;text-d=
ecoration-style:initial;text-decoration-color:initial;background-color:rgb(=
255,255,255);float:none;display:inline">DMA read/write(using other threads =
except cpu thread to=C2=A0do read/write?), and how to invoke guest CPU that=
 the DMA read/write finish( send signal to main loop thread or CPU thread?)=
.</span></div><div class=3D"gmail_default" style=3D"font-family:microsoft j=
henghei,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font-fa=
mily:microsoft jhenghei,sans-serif">As far as I know is that using DMA read=
/write will call function dma_memory_rw(). I don&#39;t know how to invoke D=
MA read/write in the guest application. Is there any way to invoke DMA in a=
pplication? or any method that I can learn how DMA is simulated in QEMU?</d=
iv><div class=3D"gmail_default" style=3D"font-family:microsoft jhenghei,san=
s-serif"><br></div><div class=3D"gmail_default" style=3D"font-family:micros=
oft jhenghei,sans-serif">Any advice is welcome. I will be grateful for any =
help.</div><div class=3D"gmail_default" style=3D"font-family:microsoft jhen=
ghei,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font-famil=
y:microsoft jhenghei,sans-serif"><br></div><div class=3D"gmail_default" sty=
le=3D"font-family:microsoft jhenghei,sans-serif">Sincerely,</div><div class=
=3D"gmail_default" style=3D"font-family:microsoft jhenghei,sans-serif">Eva<=
/div><div class=3D"gmail_default" style=3D"font-family:microsoft jhenghei,s=
ans-serif"><br></div><div><div class=3D"m_-5626664857711060756gmail_signatu=
re" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"><d=
iv dir=3D"ltr"><div dir=3D"ltr"><div><br></div><div><br></div></div></div><=
/div></div></div></div>
</div>

--0000000000005af70a056ace8d7a--
