Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32764C53219
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 14:09:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1woiUZ-00063O-Ot; Tue, 28 Jul 2026 10:09:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huang.botsz@gmail.com>)
 id 1woiUW-000629-BB
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 10:09:08 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <huang.botsz@gmail.com>)
 id 1woiUT-0003rB-3m
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 10:09:08 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-7eb64371a2aso2354705a34.0
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 07:09:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785247743; cv=none;
 d=google.com; s=arc-20260327;
 b=sOpE6nnCDQHht3EDNbWOUWKE6Qv/iDeEnas7aWeBMPZzhj2QcH0c5GyVtjIykaWCa2
 xXJipq5BKC4bsJmvvLYmEPbZrWmLLaSIjQPhGQzTp1iLy7wBBd1SEhIwhTP/b7bPDByA
 qrQ+x+rhFLI3BflQaASSxdPaJkE6EeQE+gvl74L4eCxVLhxgczcUoGJL9CK7dko0fD82
 mhCLM8d4UrTczJE2IR3eARYnqX0vU3T2emiyi32DLV24pk81GpGekKz/3my1uRUlHAdu
 tzXj558l1MhHiE8Jo4ML14/wN2eMK4yBoUb3BzcdCCMQT62mZyjcVNzeIH0azk/mEm9h
 frVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=w8VPkSPT7sWevU5cAFZw5DWgr97KdkfvaaLraanPR2o=;
 fh=nKHqn8Jc/lbnV5RD1P6x1Qx0GwTngfHNoI1hCkOpQus=;
 b=mqQHbK+pAmCgfcXL2DFmlGwtPHP+NIsu7pRMZ+TXmmzjGQE27ESn18XYx46IBmZ2IC
 lcZmdFa+T6T3x5BFRcTpQf1S8XLE5doq1evpw7+I1vfrZ+ikSsg5R9TmZSdStE0wkYK4
 JZPNa8FMW5EStzoC2FRcZyQ64sKXl5dnTjodziAdFh8OVi+Qq/mPba+6XB91X5g0tvNl
 qMCuXi/Smr07nIpUSxnqkT2Rv5sLj132AQtkAYt+6oc/8EygdC89nEV/glDsO57H7Ni9
 5PjZmoAgcgqgl9iqz1XTaX5+jUQVAJYWIKoqorryxnLPQo2cG1ttGdxyxntGc7YzrlP6
 vrTQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785247743; x=1785852543; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=w8VPkSPT7sWevU5cAFZw5DWgr97KdkfvaaLraanPR2o=;
 b=njpHtGS6uvfsPeWGTvaQ5GV2Z17v6JdnC7y0NWfLMRJ7U+WwnKhF1NNKUkFxYe0QJz
 Md3MXR8GuUGumib8irrLEPaw70lG3eLuOXLRDKmPbrt5xnzqDEWZl42dl8X86bm0ner+
 5aWB+Lm+hUwjCV0Dyw0PcYJkcjjayoznPhjOj6IYUME2cOOvGvXqT65yZcRRZ+VZdprz
 7oAmA+dVXBf4qkASrTjJk64CBy64dY6ePMsRMGm9P6avm62akjFXtURCAp+PFgPFNMsA
 vKcdPGTXndstI+RNrQzim3dCiHueJfzD2eK/OEZVqhTlJBTu6CPBGZ8cIu/NjR2lfAt+
 5ZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785247743; x=1785852543;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=w8VPkSPT7sWevU5cAFZw5DWgr97KdkfvaaLraanPR2o=;
 b=n/5gy4HYC/FCmkBrmSmEpKxYyv0cg/TWDL8MhhcFQOLTedpmttuvsI+Pxb6d0t+3Ka
 P6N8kFgwkmOeb4zqiZGpFdP+5c92QjPGMFd6kmFtbiR2CRPQDICtpHNvIRys6zOQuXhu
 uMIeaHeuNq8k5fYEcPG+c6yfFEw803JA9rypD6UsM/lGTjO53nsfkc3ZgB3D8zsCjurZ
 zFIfx98EkPilm0iVwMtlDacu0QhMYIVOG/fbVR0/iO27WVEI8Kq6cgGqkyL+0yxz9RvN
 CmLaJPx8qHO9WZm6LzVhogg0Fk7k59jnxhCqy6+JPS8JQYCKodv++0PLRYe3sKmNV60j
 s1AQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrmP/47lxJasEzQETEBBXHD3Gbw7pyqkm2VpNUcYuEJf4T4v+e1FnWT5loIM7D7hi3m/ranu7fwgw==@nongnu.org
X-Gm-Message-State: AOJu0Yw7VJ2RsbCAtlxtMQlv1ryjMQpAJas9zh0aE0dX4vCcxdDUf2VL
 H10jDlCSTlHMtw1H7onIcFE7quYGeyw1dVf3vlRo7ByIat2hQ+m7DwQbGb1f8pR6r/X/QiYdYcI
 ziVaxx2HG4Bj8C9cfO4zmnyfQaC5XjaI=
X-Gm-Gg: AR+sD12uonhvSMquRzotAZFjzHDNv+ly7ks27Du2fgH+d+KikbkVncxTVKKf087mXVo
 NTsfgk++xtZ3lrytkFrcQlCwro6KEkjm/A8JMQK0zkwTrDyvAzHqfi/t6aPgow2/bpUjhHWqxHA
 V2EeiSCMz6LiGWtveXEOiS6Bn0rwRUXH0Td9tIzUwtLITP9aDDiiRL/NyRJ8IveYgJyoJlXL9Ux
 oCog1BDb/MRPXYe1mdrnkZLVYKPZI+2JDdt6TNt2GNw+PSizU0Ewp8CtQ02WskAAZGw+yYmQytI
 ZwIGLNK555zyh72PS7iC78rdgvlhoeLXuJ0yoY5+Pb/H71mYYU8V5pM7WNtYw3ruaT0VRd+oLv1
 NTg==
X-Received: by 2002:a05:6830:3741:b0:7e6:dc7a:f459 with SMTP id
 46e09a7af769-7effef433b6mr1542620a34.11.1785247743346; Tue, 28 Jul 2026
 07:09:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260724124220.24152-1-22925483+botszhuang@users.noreply.github.com>
 <CAFEAcA-q5ihYpgYtEosQ3+SgbMdw7e7=xk4motLFL-A==g1k0w@mail.gmail.com>
 <a9ad33dc-b487-4ce7-9b8e-d437b6cc5d12@oss.qualcomm.com>
In-Reply-To: <a9ad33dc-b487-4ce7-9b8e-d437b6cc5d12@oss.qualcomm.com>
From: B H <huang.botsz@gmail.com>
Date: Tue, 28 Jul 2026 22:08:27 +0800
X-Gm-Features: AUfX_mx5Vv5DM91K48rp0bgZcpGc6s6ZOGvX3SHDJJ68-x55560VvR9PkJTpZ6w
Message-ID: <CAJQXNd3D6R1bA65sthKMWLGkCnk0ZjJu-fcmhnJpvquS4ihe0Q@mail.gmail.com>
Subject: Re: [PATCH] fix BCM2835_I2C_CLKT
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 philmd@mailo.com, qemu-arm@nongnu.org, sef1548@gmail.com
Content-Type: multipart/alternative; boundary="000000000000940a8b0657ac61f4"
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=huang.botsz@gmail.com; helo=mail-ot1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

--000000000000940a8b0657ac61f4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear all,

Thanks for applying the patch and for the detailed explanation!

You are completely right=E2=80=94my commit message reasoning was flawed. QE=
MU's
macro doesn't change the guest's behavior, it only affects how QEMU handles
the guest's access (logging a guest error and returning read-as-zero, as
you noted). I appreciate you clarifying that.

Regarding the register layout, since the CLKT register is at offset 0x1c
(and assuming it's the last 32-bit register), the total memory region size
should technically be 0x20 instead of 0x24.

Do you think we should also reduce the region size, as shown in the diff
below? If it looks good to you, I can send this as a separate follow-up
patch.

-- >8 --
diff --git a/hw/i2c/bcm2835_i2c.c b/hw/i2c/bcm2835_i2c.c
index 34de1f36e5b..5f6093087dd 100644
--- a/hw/i2c/bcm2835_i2c.c
+++ b/hw/i2c/bcm2835_i2c.c
@@ -222,7 +222,7 @@ static void bcm2835_i2c_realize(DeviceState *dev, Error
**errp)
       s->bus =3D i2c_init_bus(dev, NULL);

       memory_region_init_io(&s->iomem, OBJECT(dev), &bcm2835_i2c_ops, s,
-                          TYPE_BCM2835_I2C, 0x24);
+                          TYPE_BCM2835_I2C, 0x20);
       sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
       sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
   }
---

Best regards,
Botsz HUANG
Signed-off-by: botszhuang <botszhuang@gmail.com>

Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com> =E6=96=BC 2026=E5=B9=
=B47=E6=9C=8827=E6=97=A5=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=887:54=E5=AF=AB=
=E9=81=93=EF=BC=9A

> On 27/7/26 12:04, Peter Maydell wrote:
> > On Fri, 24 Jul 2026 at 13:51, botszhuang <huang.botsz@gmail.com> wrote:
> >>
> >> hw/i2c/bcm2835_i2c: Correct CLKT register offset
> >>
> >> The Clock Stretch Timeout (CLKT) register for the BCM2835 I2C
> controller is actually located at offset 0x1c, not 0x20.
> >>
> >> The previous incorrect value caused the guest OS to read from and writ=
e
> to the wrong memory address when configuring the I2C timeout, which could
> lead to unexpected controller behavior.
> >>
> >> Update the BCM2835_I2C_CLKT macro to match the hardware specification.
> >
> > Checking the datasheet, this is definitely the wrong value,
> > so the fix is correct. I'm a bit confused by your commit message,
> > though. The value here in QEMU can't cause the guest OS to write
> > to the wrong memory address, because the guest OS doesn't ever
> > see what we have defined here. It has the offset hardcoded into
> > its own source code.
> >
> > It looks to me like the effect of getting this wrong is that when
> > the guest writes to CLKT (at its actual 0x1c offset) we will log
> > a guest error and give read-as-zero behaviour. That's not correct,
> > but I expect for most guest OSes it'll be pretty harmless because
> > the guest probably doesn't write the value it wants to configure
> > and then read it back to check. (QEMU ignores the value written
> > anyway.)
> >
> > I've applied this to target-arm.next.
>
> Should we also reduce the region size?
>
> -- >8 --
> diff --git a/hw/i2c/bcm2835_i2c.c b/hw/i2c/bcm2835_i2c.c
> index 34de1f36e5b..5f6093087dd 100644
> --- a/hw/i2c/bcm2835_i2c.c
> +++ b/hw/i2c/bcm2835_i2c.c
> @@ -222,7 +222,7 @@ static void bcm2835_i2c_realize(DeviceState *dev,
> Error **errp)
>       s->bus =3D i2c_init_bus(dev, NULL);
>
>       memory_region_init_io(&s->iomem, OBJECT(dev), &bcm2835_i2c_ops, s,
> -                          TYPE_BCM2835_I2C, 0x24);
> +                          TYPE_BCM2835_I2C, 0x20);
>       sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
>       sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
>   }
> ---
>

--000000000000940a8b0657ac61f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Dear all,<br><br><div>Thanks for applying=
 the patch and for the detailed explanation!=C2=A0</div><div><br></div><div=
>You are completely right=E2=80=94my commit message reasoning was flawed. Q=
EMU&#39;s macro doesn&#39;t change the guest&#39;s behavior, it only affect=
s how QEMU handles the guest&#39;s access (logging a guest error and return=
ing read-as-zero, as you noted). I appreciate you clarifying that.</div><br=
>Regarding the register layout, since the CLKT register is at offset 0x1c (=
and assuming it&#39;s the last 32-bit register), the total memory region si=
ze should technically be 0x20 instead of 0x24.<br><br>Do you think we shoul=
d also reduce the region size, as shown in the diff below? If it looks good=
 to you, I can send this as a separate follow-up patch.<br><br>-- &gt;8 --<=
br>diff --git a/hw/i2c/bcm2835_i2c.c b/hw/i2c/bcm2835_i2c.c<br>index 34de1f=
36e5b..5f6093087dd 100644<br>--- a/hw/i2c/bcm2835_i2c.c<br>+++ b/hw/i2c/bcm=
2835_i2c.c<br>@@ -222,7 +222,7 @@ static void bcm2835_i2c_realize(DeviceSta=
te *dev, Error **errp)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;bus =3D i2c_init=
_bus(dev, NULL);<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0memory_region_init=
_io(&amp;s-&gt;iomem, OBJECT(dev), &amp;bcm2835_i2c_ops, s,<br>- =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0TYPE_BCM2835_I2C, 0x24);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_BCM2835_I2C, 0x20)=
;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0sysbus_init_mmio(SYS_BUS_DEVICE(dev), &amp;=
s-&gt;iomem);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0sysbus_init_irq(SYS_BUS_DEVICE(=
dev), &amp;s-&gt;irq);<br>=C2=A0 =C2=A0}<br>---<br><br>Best regards,<br>Bot=
sz HUANG<br>Signed-off-by: botszhuang &lt;<a href=3D"mailto:botszhuang@gmai=
l.com" target=3D"_blank">botszhuang@gmail.com</a>&gt;</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Philippe Mathieu-Dau=
d=C3=A9 &lt;<a href=3D"mailto:philmd@oss.qualcomm.com" target=3D"_blank">ph=
ilmd@oss.qualcomm.com</a>&gt; =E6=96=BC 2026=E5=B9=B47=E6=9C=8827=E6=97=A5=
=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=887:54=E5=AF=AB=E9=81=93=EF=BC=9A<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">On 27/7/26 12:04, Pete=
r Maydell wrote:<br>
&gt; On Fri, 24 Jul 2026 at 13:51, botszhuang &lt;<a href=3D"mailto:huang.b=
otsz@gmail.com" target=3D"_blank">huang.botsz@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; hw/i2c/bcm2835_i2c: Correct CLKT register offset<br>
&gt;&gt;<br>
&gt;&gt; The Clock Stretch Timeout (CLKT) register for the BCM2835 I2C cont=
roller is actually located at offset 0x1c, not 0x20.<br>
&gt;&gt;<br>
&gt;&gt; The previous incorrect value caused the guest OS to read from and =
write to the wrong memory address when configuring the I2C timeout, which c=
ould lead to unexpected controller behavior.<br>
&gt;&gt;<br>
&gt;&gt; Update the BCM2835_I2C_CLKT macro to match the hardware specificat=
ion.<br>
&gt; <br>
&gt; Checking the datasheet, this is definitely the wrong value,<br>
&gt; so the fix is correct. I&#39;m a bit confused by your commit message,<=
br>
&gt; though. The value here in QEMU can&#39;t cause the guest OS to write<b=
r>
&gt; to the wrong memory address, because the guest OS doesn&#39;t ever<br>
&gt; see what we have defined here. It has the offset hardcoded into<br>
&gt; its own source code.<br>
&gt; <br>
&gt; It looks to me like the effect of getting this wrong is that when<br>
&gt; the guest writes to CLKT (at its actual 0x1c offset) we will log<br>
&gt; a guest error and give read-as-zero behaviour. That&#39;s not correct,=
<br>
&gt; but I expect for most guest OSes it&#39;ll be pretty harmless because<=
br>
&gt; the guest probably doesn&#39;t write the value it wants to configure<b=
r>
&gt; and then read it back to check. (QEMU ignores the value written<br>
&gt; anyway.)<br>
&gt; <br>
&gt; I&#39;ve applied this to target-arm.next.<br>
<br>
Should we also reduce the region size?<br>
<br>
-- &gt;8 --<br>
diff --git a/hw/i2c/bcm2835_i2c.c b/hw/i2c/bcm2835_i2c.c<br>
index 34de1f36e5b..5f6093087dd 100644<br>
--- a/hw/i2c/bcm2835_i2c.c<br>
+++ b/hw/i2c/bcm2835_i2c.c<br>
@@ -222,7 +222,7 @@ static void bcm2835_i2c_realize(DeviceState *dev, <br>
Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 s-&gt;bus =3D i2c_init_bus(dev, NULL);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 memory_region_init_io(&amp;s-&gt;iomem, OBJECT(dev), &=
amp;bcm2835_i2c_ops, s,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 TYPE_BCM2835_I2C, 0x24);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 TYPE_BCM2835_I2C, 0x20);<br>
=C2=A0 =C2=A0 =C2=A0 sysbus_init_mmio(SYS_BUS_DEVICE(dev), &amp;s-&gt;iomem=
);<br>
=C2=A0 =C2=A0 =C2=A0 sysbus_init_irq(SYS_BUS_DEVICE(dev), &amp;s-&gt;irq);<=
br>
=C2=A0 }<br>
---<br>
</blockquote></div>
</div>

--000000000000940a8b0657ac61f4--

