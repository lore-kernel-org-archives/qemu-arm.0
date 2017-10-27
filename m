Received: by 10.223.161.27 with SMTP id o27csp809813wro;
        Fri, 27 Oct 2017 07:40:34 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+SeMiOozRRlOkAXMAuELzH2Ts3i4cNYIiiPB1I58qz6rrWzkJoq7hZraDhGCo+5qP1JSMFR
X-Received: by 10.37.246.39 with SMTP id t39mr525393ybd.220.1509115234415;
        Fri, 27 Oct 2017 07:40:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509115234; cv=none;
        d=google.com; s=arc-20160816;
        b=fRYXqSKmFX1x9ZVilx1cBdgr6FGpJOaOGb61nRkr3+6wLuEa9yP7iB5B8xLoCThCfg
         KJJt+LoWqxny8n3RV2bKO+o4DDu3qJ5s8GyonuCd4CwjIYfsAISrgEECNqFmjtv1mvvK
         LUiD7WljaNlVrBYNbsXybTD7o0cATJY3rJwSO7d4lNpuhN9tDKUOAi41rM9Fws3Lz7Bd
         PX4yVeHd6hPSENo7OGR20pB++U0cQRSAhO11SlyKLNN6X1H05Fv4ejJAfO+jfWl6JQTh
         eWwgXVZLQUr35QkoYYJGLrdc6ufrbNyK6TchB3i+LGflm2i9jknqRM8bsrBgihMXNmBU
         +hsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=xTLzahSjL/e+2drp2HKsXFqoSlsN2VxP1VkERAZmsG8=;
        b=svOM5IyKHUR33bEhs0Mzy1uuLNlqTguwOXHXbaw70E7xs1mCf8y9VddgS/r5Fl9gr0
         sbOgr0ADfylclmcau826Y5dPHDntNBCHbLYJCNBSu5lI2qEwnZeApQ3DUAzkRlbFLWhV
         0vmJrlRXe/8wJN6nXfBqXfUjtdrcecLhsaHJRpjNmt+BQFVG5NAENSG5JJ3xPu9/EdYN
         afSq8Yi/Bx53yuyY1jhKLDW4xnnkAM9qm5vLDxz6XhWlTshlUHbuSyjnOEFO32OeZwQT
         t19cFfqlf3VTSBejl1+091a3yFxru77SFD5hODCyqUDoHKF3GP3pnzZigNlDl7yIBTKl
         8wFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aU+W/G/P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k9si1257062ywb.416.2017.10.27.07.40.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Oct 2017 07:40:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aU+W/G/P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57628 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e85oH-0000CU-MM
	for alex.bennee@linaro.org; Fri, 27 Oct 2017 10:40:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35366)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gabriel291075@gmail.com>) id 1e85a3-0005zd-Ld
	for qemu-arm@nongnu.org; Fri, 27 Oct 2017 10:25:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gabriel291075@gmail.com>) id 1e85a2-0003pV-5d
	for qemu-arm@nongnu.org; Fri, 27 Oct 2017 10:25:51 -0400
Received: from mail-pf0-x236.google.com ([2607:f8b0:400e:c00::236]:47482)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <gabriel291075@gmail.com>)
	id 1e85Zy-0003nz-U0; Fri, 27 Oct 2017 10:25:47 -0400
Received: by mail-pf0-x236.google.com with SMTP id z11so5082058pfk.4;
	Fri, 27 Oct 2017 07:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xTLzahSjL/e+2drp2HKsXFqoSlsN2VxP1VkERAZmsG8=;
	b=aU+W/G/PV2KlWKZr7IxJ/cXxBbNITeRrm/ShXbdQQzP9MTD8tuSc7bO4CbxOAveU+s
	brTfxAZOuMEgldbw1YvW40J+R23EecCsKwJC/gVcMtx6iXIcgEDRXZYDJCN1YAStBB1T
	AdBZ71bRp9+4+YmwWuWWFtX4+DynGbXDwNeoN8zf5hCuNG32lq4ZSD1eYjwTWW1zTdT+
	yUQdnv2cZ5b1yeb7+r2Ie5XWXRsmMfqhJUObfdQ82fymBShHccwQqOm9XQNZ4t0o2roO
	9SpWMmEcbNyTzcZDxRrpzCA+x/c3YxG835IeD91el8WWhd85aMgJQRd/eH/adUwIG6ci
	j4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xTLzahSjL/e+2drp2HKsXFqoSlsN2VxP1VkERAZmsG8=;
	b=jlcirUj9Jy3HUdlyBjWhdToRoM68YSKGAgPa39meqDHFmqOqbqJI86qV4DKYTwhHXM
	RGmp3sApnDECEGlAcx+db/PgLl5ptS+pTa+07wXdbJxwhOR5QxynXhFrL9NSP74PttHa
	BwMogfjb1NX1IJY+6l7QhL8cX9nMxE8EwoQKIxTaxKoIJlKagUZQ9sM+Ry7Wvz8CX2WP
	qeP5zgVHisOUwQ1A/u8+KRwGnO7PIw+25GlP7BnwKDpi/pPFeNFY7vfb1030MsZlVlKY
	qzzM7v9dh3ng5vj5Xn5KA6emdf/hZSljSQ5Yb/bh5iURqAzUDUdM/zFoQ69cwz1MVC0F
	n+IQ==
X-Gm-Message-State: AMCzsaV8zTyJ4VFG3j+IUrHN6rvpW1Ec+0QJQzdJVAPzO0CAFJlQWk9V
	jrEG8HpljnC2xQsiX8NXjh5Kqi7laBfQjk81+CI=
X-Received: by 10.98.245.21 with SMTP id n21mr680671pfh.68.1509114346088; Fri,
	27 Oct 2017 07:25:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.182.104 with HTTP; Fri, 27 Oct 2017 07:25:45 -0700 (PDT)
In-Reply-To: <d48801c9-4801-d271-2d13-e08a518391fc@adacore.com>
References: <1509014053-28134-1-git-send-email-costa@advantech.ca>
	<1509014053-28134-7-git-send-email-costa@advantech.ca>
	<d48801c9-4801-d271-2d13-e08a518391fc@adacore.com>
From: Gabriel Costa <gabriel291075@gmail.com>
Date: Fri, 27 Oct 2017 10:25:45 -0400
Message-ID: <CAG+oHk8m85xSUY0mkKDrpNzgXA7h_UsW6AY3uHeDJiHefEvFpg@mail.gmail.com>
To: KONRAD Frederic <frederic.konrad@adacore.com>
Content-Type: multipart/alternative; boundary="001a113accc0862e6a055c8810ea"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::236
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6]arm: Makefiles to kinetis k64
 platform
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5xWOY/bL1H3J

--001a113accc0862e6a055c8810ea
Content-Type: text/plain; charset="UTF-8"

Hi Fred,

Thanks, I have misunderstood the process to add a new model.
I will follow your advice for the next patch and add the Makefile
modification in the same Patch.

Gabriel

On Fri, Oct 27, 2017 at 9:07 AM, KONRAD Frederic <
frederic.konrad@adacore.com> wrote:

> Hi,
>
> Why does this patch has a v6 prefix? And it seems some patches
> are missing.
> To send your patches I suggest you use git send-email.
>
> About this patch:
> Each Makefile modification should go in the patch which
> introduces the new model.
> eg:
> hw/char/Makefile.objs must be modified in 4/5 kinetis_k64_uart.
>
> Fred
>
>
> On 10/26/2017 12:34 PM, Gabriel Costa wrote:
>
>> From: Gabriel Augusto Costa <gabriel291075@gmail.com>
>>
>> This file change the Makefiles to compile the mk64fn1m0 machine.
>>
>> Signed-off-by: Gabriel Augusto Costa <gabriel291075@gmail.com>
>> ---
>>   default-configs/arm-softmmu.mak | 1 +
>>   hw/arm/Makefile.objs            | 1 +
>>   hw/char/Makefile.objs           | 1 +
>>   hw/misc/Makefile.objs           | 3 +++
>>   4 files changed, 6 insertions(+)
>>
>> diff --git a/default-configs/arm-softmmu.mak
>> b/default-configs/arm-softmmu.mak
>> index 5059d13..a835d4f
>> --- a/default-configs/arm-softmmu.mak
>> +++ b/default-configs/arm-softmmu.mak
>> @@ -130,3 +130,4 @@ CONFIG_SMBIOS=y
>>   CONFIG_ASPEED_SOC=y
>>   CONFIG_GPIO_KEY=y
>>   CONFIG_MSF2=y
>> +CONFIG_KINETIS_K64=y
>> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
>> index 2794e08..874a38a
>> --- a/hw/arm/Makefile.objs
>> +++ b/hw/arm/Makefile.objs
>> @@ -20,3 +20,4 @@ obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o sabrelite.o
>>   obj-$(CONFIG_ASPEED_SOC) += aspeed_soc.o aspeed.o
>>   obj-$(CONFIG_MPS2) += mps2.o
>>   obj-$(CONFIG_MSF2) += msf2-soc.o msf2-som.o
>> +obj-$(CONFIG_KINETIS_K64) += mk64fn1m0.o
>> diff --git a/hw/char/Makefile.objs b/hw/char/Makefile.objs
>> index 1bcd37e..75b194c
>> --- a/hw/char/Makefile.objs
>> +++ b/hw/char/Makefile.objs
>> @@ -31,3 +31,4 @@ common-obj-$(CONFIG_SCLPCONSOLE) += sclpconsole.o
>> sclpconsole-lm.o
>>     obj-$(CONFIG_VIRTIO) += virtio-serial-bus.o
>>   obj-$(CONFIG_TERMINAL3270) += terminal3270.o
>> +obj-$(CONFIG_KINETIS_K64) += kinetis_k64_uart.o
>> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
>> index 19202d9..c5c8589
>> --- a/hw/misc/Makefile.objs
>> +++ b/hw/misc/Makefile.objs
>> @@ -61,3 +61,6 @@ obj-$(CONFIG_AUX) += auxbus.o
>>   obj-$(CONFIG_ASPEED_SOC) += aspeed_scu.o aspeed_sdmc.o
>>   obj-y += mmio_interface.o
>>   obj-$(CONFIG_MSF2) += msf2-sysreg.o
>> +obj-$(CONFIG_KINETIS_K64) += kinetis_k64_mcg.o
>> +obj-$(CONFIG_KINETIS_K64) += kinetis_k64_pmux.o
>> +obj-$(CONFIG_KINETIS_K64) += kinetis_k64_system.o
>>
>>

--001a113accc0862e6a055c8810ea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi Fred,<br><br></div>Thanks, I have misund=
erstood the process to add a new model.<br></div>I will follow your advice =
for the next patch and add the Makefile modification in the same Patch.<br>=
<br></div>Gabriel<br></div><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On Fri, Oct 27, 2017 at 9:07 AM, KONRAD Frederic <span dir=3D"ltr=
">&lt;<a href=3D"mailto:frederic.konrad@adacore.com" target=3D"_blank">fred=
eric.konrad@adacore.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">Hi,<br>
<br>
Why does this patch has a v6 prefix? And it seems some patches<br>
are missing.<br>
To send your patches I suggest you use git send-email.<br>
<br>
About this patch:<br>
Each Makefile modification should go in the patch which<br>
introduces the new model.<br>
eg:<br>
hw/char/Makefile.objs must be modified in 4/5 kinetis_k64_uart.<br>
<br>
Fred<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
On 10/26/2017 12:34 PM, Gabriel Costa wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
From: Gabriel Augusto Costa &lt;<a href=3D"mailto:gabriel291075@gmail.com" =
target=3D"_blank">gabriel291075@gmail.com</a>&gt;<br>
<br>
This file change the Makefiles to compile the mk64fn1m0 machine.<br>
<br>
Signed-off-by: Gabriel Augusto Costa &lt;<a href=3D"mailto:gabriel291075@gm=
ail.com" target=3D"_blank">gabriel291075@gmail.com</a>&gt;<br>
---<br>
=C2=A0 default-configs/<a href=3D"http://arm-softmmu.ma">arm-softmmu.ma</a>=
<wbr>k | 1 +<br>
=C2=A0 hw/arm/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<=
br>
=C2=A0 hw/char/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<=
br>
=C2=A0 hw/misc/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 ++=
+<br>
=C2=A0 4 files changed, 6 insertions(+)<br>
<br>
diff --git a/default-configs/arm-softmmu.<wbr>mak b/default-configs/arm-sof=
tmmu.<wbr>mak<br>
index 5059d13..a835d4f<br>
--- a/default-configs/arm-softmmu.<wbr>mak<br>
+++ b/default-configs/arm-softmmu.<wbr>mak<br>
@@ -130,3 +130,4 @@ CONFIG_SMBIOS=3Dy<br>
=C2=A0 CONFIG_ASPEED_SOC=3Dy<br>
=C2=A0 CONFIG_GPIO_KEY=3Dy<br>
=C2=A0 CONFIG_MSF2=3Dy<br>
+CONFIG_KINETIS_K64=3Dy<br>
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs<br>
index 2794e08..874a38a<br>
--- a/hw/arm/Makefile.objs<br>
+++ b/hw/arm/Makefile.objs<br>
@@ -20,3 +20,4 @@ obj-$(CONFIG_FSL_IMX6) +=3D fsl-imx6.o sabrelite.o<br>
=C2=A0 obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_soc.o aspeed.o<br>
=C2=A0 obj-$(CONFIG_MPS2) +=3D mps2.o<br>
=C2=A0 obj-$(CONFIG_MSF2) +=3D msf2-soc.o msf2-som.o<br>
+obj-$(CONFIG_KINETIS_K64) +=3D mk64fn1m0.o<br>
diff --git a/hw/char/Makefile.objs b/hw/char/Makefile.objs<br>
index 1bcd37e..75b194c<br>
--- a/hw/char/Makefile.objs<br>
+++ b/hw/char/Makefile.objs<br>
@@ -31,3 +31,4 @@ common-obj-$(CONFIG_SCLPCONSOL<wbr>E) +=3D sclpconsole.o =
sclpconsole-lm.o<br>
=C2=A0 =C2=A0 obj-$(CONFIG_VIRTIO) +=3D virtio-serial-bus.o<br>
=C2=A0 obj-$(CONFIG_TERMINAL3270) +=3D terminal3270.o<br>
+obj-$(CONFIG_KINETIS_K64) +=3D kinetis_k64_uart.o<br>
diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs<br>
index 19202d9..c5c8589<br>
--- a/hw/misc/Makefile.objs<br>
+++ b/hw/misc/Makefile.objs<br>
@@ -61,3 +61,6 @@ obj-$(CONFIG_AUX) +=3D auxbus.o<br>
=C2=A0 obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_scu.o aspeed_sdmc.o<br>
=C2=A0 obj-y +=3D mmio_interface.o<br>
=C2=A0 obj-$(CONFIG_MSF2) +=3D msf2-sysreg.o<br>
+obj-$(CONFIG_KINETIS_K64) +=3D kinetis_k64_mcg.o<br>
+obj-$(CONFIG_KINETIS_K64) +=3D kinetis_k64_pmux.o<br>
+obj-$(CONFIG_KINETIS_K64) +=3D kinetis_k64_system.o<br>
<br>
</blockquote>
</div></div></blockquote></div><br></div>

--001a113accc0862e6a055c8810ea--
