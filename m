Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D9BCCF2C1
	for <qemu-arm@archiver.kernel.org>; Sat, 17 Oct 2026 13:31:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xI4VO-0008FA-BF; Sat, 17 Oct 2026 09:31:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xI4VN-0008Er-E2
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 09:31:21 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xI4VL-0008Qe-It
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 09:31:21 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-4a6bb779d13so432164fac.1
 for <qemu-arm@nongnu.org>; Sat, 17 Oct 2026 06:31:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792243877; cv=none;
 d=google.com; s=arc-20260327;
 b=FU/88uBaTFA51JwlGXK0jCVaIBTXjRRt+DtLDU94StxIe7ehsvL8SAEBtLldO0J7LO
 IjGIWP5smOVE0yEzmYCbwO6f+aq7lMSmIbjMVbF28csDNvrjGjWMeW5of89ctv9tKs+l
 FQ2ra6CDCJXUOF1BydTY7om1bawEKyH/35A6qObT8Fr4UhrO/AkrUUNx7lTZIkqPwi+A
 YFikRs8Kv6817qoLQi/N8RlAMlW3OYcndP3n9/Dkgd0yJB7RAnpGbxbqY61mWq3bnEDG
 1n+UC5oeRxmYKiS4Z/FDijrpdJ1xc1yiIYWr7l1tPNqvZi90QIlZW8GW0mqgLzYlybtd
 Kvng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
 :from:dkim-signature;
 bh=13++pDd8S7EPRv63bFdXWXkzbJmax0hY3OEt7T+Drr4=;
 fh=uaVWpIhp9naWj/LJgTer1cC1XubRN5eY82xHqPlrlW0=;
 b=dfYoYuacte2KeOz/oLFzRnuw/WCNij/NECdIRwz9nQduoInR24V3H8d2AotP9wb09e
 cGDgQod+K3wXtm+PVnLxzmqHdWpGdQIanr+SscnRjzqjhW7cQc1cLI3+6u6Mqv57NgF2
 mRFA3oDHhnJjkA3FAe0BsSgTKdyfeDhvGcDy8yeX/tdfxdOzbLVsZrJQH02ZVlchgJEq
 q9m94GQ2ceS5m32W9pj3zEDhh6TuAUIyH+lr6cRHOo2YnrVVa0KPN0t+Zo5BLgK1794A
 xm/LeqiSytfXDfQEAy3qlPQ7aDnTHSBDahSe64fybOkbAl3uRqw1In8JjIyacWFQYLt8
 uEow==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792243877; x=1792848677; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:mime-version:references
 :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=13++pDd8S7EPRv63bFdXWXkzbJmax0hY3OEt7T+Drr4=;
 b=d11JbR/q2JuDEqmNngJKuUwjizehn2RAlLQQpnWGWLykT3by+I7ENHkUyoSAC5QTug
 Gd9CutiQ2qE5N1871IImyQcBAsfolg3a6uZWjkjQ5dSlML0ooTHoz9Rwm5aqjqSsRgHc
 Sar1FWQdO/5kjJDByf7hvJiDVO5pg/+c9jzmSM9k4Iwu0fm7nrWshhXLd29qkh7Soqap
 N0YpWSTK4p+DP4pDNRCyf3HkQEnLglhp25MPIUP7j9UZpTw7fGzMJd29NULT0LtKLqiN
 Z3t0azUkcEjv5yRJjg92opf/tFJjxE+Wa5BsC6ZUc6NRpS8jwo5ISX9FzeV6a6XMnVnA
 9AoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792243877; x=1792848677;
 h=content-type:cc:to:subject:message-id:date:mime-version:references
 :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=13++pDd8S7EPRv63bFdXWXkzbJmax0hY3OEt7T+Drr4=;
 b=oy1e+ONyJwtl/AijVpH2I5g15oRt+vUxgOzON6+4PbpPivYOoCqV1tYFup8I7tp/98
 C0UNXUh6UQ82aQmllDWEAX9iC1/gF+n5awN+nGnsiHzt/saysv8tUc7YAPB/Rtx5HTKH
 3KfHZC6hEnSFC+7g8hfoFZRR77OpOHbsuQgxaPjRrfSRWa4vEl54+Xino979SgHTd9Ir
 A8vn00UMUuyokH5z1Iylx87MVzS/iTSZkeN0sJXK+YnfkFRgi+ZNynQ8KsqVIN1o+JWl
 nuNi9GeqyyXo+lehdCof928HRGuswDX4nUTWVQK3rRP3c/Q4+F8A6ghHFRcyO5NHcgqV
 RcBg==
X-Forwarded-Encrypted: i=1;
 AKwUvByjyrM86cWty5dzSQbYqbwoF/8RgUth2AgferlfjzzswJGB9wAPlmN9IB73s7qKklQ5hzKT6M6VOA==@nongnu.org
X-Gm-Message-State: AFq9FYKzwWg40V1OlSoCEhyBeJAX+E/7WrBy3kKUM/HM7+B3UZJtgQX+
 hDp8dhN02r/Z70P1jFF9HvU8jvaO+GyBsuiBTueGpvZINZ0Q7xZq+LTRCUOK8qfAnUkN7az7d5R
 Xas9i2t73w2RQVhE8ChzQw/Q8r5RlpiI=
X-Gm-Gg: AYBFou0JaO53CyxGwv4ah++q+Ag0Qo2jC4MnUkeTbqo2vK+GWhDHhMlDmfF2EQ0Ytu1
 ORIxHLCs14kbTyDhzHXcVGznEvyr70C2S6zeL7lzw0UrVqBBYZAiG4FkFWOiImEOhkV5VB2csJz
 1JWFx2HOWllPb+MacC1uPOuoL8Y5cpMWftREXCInIwrNf4wfWwyg6JP0JliHL/KzMMOQiA1qbLU
 3qdTE1BHPvwTtHs9pwidXO37BcZGoQ2klPpfEaJGLITQsDKpa0vNlb4IRzNYipYRZ1i++aLTnTW
 rwczOkQ+HQPBCEIc+brgmH+99cwb1rEtG8NX+WBOhUte7ZS9qtd9bYx6kHioFdkzJs6yMuFQIJf
 9sym8Htc+pwoJK1twE9GkhI0AKRHaG7N0acrwRSebsYm6u+X2qw==
X-Received: by 2002:a05:6870:b86:b0:48f:e107:317e with SMTP id
 586e51a60fabf-4a757a7bee1mr2550352fac.49.1792243877564; Sat, 17 Oct 2026
 06:31:17 -0700 (PDT)
Received: from 101988054943 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 17 Oct 2026 06:31:16 -0700
Received: from 101988054943 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 17 Oct 2026 09:31:15 -0400
From: Marcelo Manzo <marcelomanzo@gmail.com>
In-Reply-To: <CAFEAcA8qQ-ORtpoD4xsytbqFBOi0+cqE5Bkbv3m6mi+ZXwxm5Q@mail.gmail.com>
References: <CAFEAcA8qQ-ORtpoD4xsytbqFBOi0+cqE5Bkbv3m6mi+ZXwxm5Q@mail.gmail.com>
MIME-Version: 1.0
Date: Sat, 17 Oct 2026 06:31:16 -0700
X-Gm-Features: AclHuK_7PJd-Z-RIwqgSft2ZRaOuF2dvD9KafRJv-NejTH6dyQ6-GkHw5QtiE4I
Message-ID: <CAGaQodKNRm54DnrnaS56E7YRYoss=Ts1fEP5oayqik3T3bTd+Q@mail.gmail.com>
Subject: Re: Re: [PATCH v3 15/16] docs/system/arm/raspi: move PCIe/GENET from
 missing to implemented
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, philmd@oss.qualcomm.com, 
 pierrick.bouvier@oss.qualcomm.com
Content-Type: multipart/alternative; boundary="000000000000ac5837065e094bf2"
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=marcelomanzo@gmail.com; helo=mail-oa1-x2f.google.com
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

--000000000000ac5837065e094bf2
Content-Type: text/plain; charset="UTF-8"

On 17 Oct 2026, Peter Maydell wrote:
>
> Do you know what's missing for the MSI support to work?

I think it's the controller's built-in MSI receiver, which we don't
model.

From the Linux driver (drivers/pci/controller/pcie-brcmstb.c): the guest
programs an MSI target address into PCIE_MISC_MSI_BAR_CONFIG_LO/HI
(0x4044/0x4048, bit 0 = enable) and the message data into
PCIE_MISC_MSI_DATA_CONFIG (0x404c). A device's MSI write then goes to
that target address (0xfffffffc, or 0xffffffffc if the inbound window
extends above 4GB) with data 0x6540 | vector. The controller is supposed
to catch that write, set bit <vector> in its MSI_INTR2 block at 0x4500
(STATUS 0x4500, CLR 0x4508, MASK_SET 0x4510, MASK_CLR 0x4514), and
assert the second interrupt of the pcie DT node ("msi") towards the GIC.

Right now none of that exists: the MSI_INTR2 registers are plain backing
bytes in regs[] with no status/clear/mask behaviour, nothing in the PCI
bus address space claims the target address so the device's write goes
nowhere, and the "msi" interrupt isn't wired to the GIC.

I think it needs a small doorbell MemoryRegion in the PCI address space
at the target address, the INTR2 register semantics, and one more SPI --
on the order of 100-150 lines. I left it out of this series since INTx
covers what I've needed, but I'm happy to do it as a follow-up if you'd
like.

thanks
-- Marcelo

On Sat, Oct 17, 2026 09:10 AM, Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Thu, 15 Oct 2026 at 19:11, Marcelo Manzo <marcelomanzo@gmail.com>
> wrote:
> >
> > raspi4b now has a working PCIe Root Complex and GENET Ethernet
> > controller (added in the preceding patches); move them out of the
> > "Missing devices" list and into "Implemented devices".
> >
> > Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
> > ---
> >  docs/system/arm/raspi.rst | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/docs/system/arm/raspi.rst b/docs/system/arm/raspi.rst
> > index 44eec3f1c3..a8fc37e920 100644
> > --- a/docs/system/arm/raspi.rst
> > +++ b/docs/system/arm/raspi.rst
> > @@ -36,10 +36,12 @@ Implemented devices
> >   * VideoCore firmware (property)
> >   * Peripheral SPI controller (SPI)
> >   * Broadcom Serial Controller (I2C)
> > + * PCIe Root Complex (raspi4b)
> > + * GENET Ethernet Controller (raspi4b)
> >
> >  Missing devices
> >  ---------------
> >
> >   * Pulse Width Modulation (PWM)
> > - * PCIE Root Port (raspi4b)
> > - * GENET Ethernet Controller (raspi4b)
> > + * PCIe MSI/MSI-X interrupt delivery (raspi4b) -- INTx works; a PCIe
> > +   device that only signals via MSI/MSI-X needs ``msi=off,msix=off``
>
> Do you know what's missing for the MSI support to work?
>
> thanks
> -- PMM
>

--000000000000ac5837065e094bf2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><body><div dir=3D"auto">On 17 Oct 2026, Peter Maydell wrote:<br>&gt;<=
br>&gt; Do you know what&#39;s missing for the MSI support to work?<br><br>=
I think it&#39;s the controller&#39;s built-in MSI receiver, which we don&#=
39;t<br>model.<br><br>From the Linux driver (drivers/pci/controller/pcie-br=
cmstb.c): the guest<br>programs an MSI target address into PCIE_MISC_MSI_BA=
R_CONFIG_LO/HI<br>(0x4044/0x4048, bit 0 =3D enable) and the message data in=
to<br>PCIE_MISC_MSI_DATA_CONFIG (0x404c). A device&#39;s MSI write then goe=
s to<br>that target address (0xfffffffc, or 0xffffffffc if the inbound wind=
ow<br>extends above 4GB) with data 0x6540 | vector. The controller is suppo=
sed<br>to catch that write, set bit &lt;vector&gt; in its MSI_INTR2 block a=
t 0x4500<br>(STATUS 0x4500, CLR 0x4508, MASK_SET 0x4510, MASK_CLR 0x4514), =
and<br>assert the second interrupt of the pcie DT node (&quot;msi&quot;) to=
wards the GIC.<br><br>Right now none of that exists: the MSI_INTR2 register=
s are plain backing<br>bytes in regs[] with no status/clear/mask behaviour,=
 nothing in the PCI<br>bus address space claims the target address so the d=
evice&#39;s write goes<br>nowhere, and the &quot;msi&quot; interrupt isn&#3=
9;t wired to the GIC.<br><br>I think it needs a small doorbell MemoryRegion=
 in the PCI address space<br>at the target address, the INTR2 register sema=
ntics, and one more SPI --<br>on the order of 100-150 lines. I left it out =
of this series since INTx<br>covers what I&#39;ve needed, but I&#39;m happy=
 to do it as a follow-up if you&#39;d<br>like.<br><br>thanks<br>-- Marcelo<=
br></div></body></html><br><div class=3D"gmail_extra"><div>On Sat, Oct 17, =
2026 09:10 AM, Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
">peter.maydell@linaro.org</a>&gt; wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>On Thu, 15 Oct 2026 at 19:11, Marcelo Manzo &lt;<a href=3D"mailto:marcelom=
anzo@gmail.com" target=3D"_blank">marcelomanzo@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; raspi4b now has a working PCIe Root Complex and GENET Ethernet<br>
&gt; controller (added in the preceding patches); move them out of the<br>
&gt; &quot;Missing devices&quot; list and into &quot;Implemented devices&qu=
ot;.<br>
&gt;<br>
&gt; Signed-off-by: Marcelo Manzo &lt;<a href=3D"mailto:marcelomanzo@gmail.=
com" target=3D"_blank">marcelomanzo@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 docs/system/arm/raspi.rst | 6 ++++--<br>
&gt;=C2=A0 1 file changed, 4 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/docs/system/arm/raspi.rst b/docs/system/arm/raspi.rst<br>
&gt; index 44eec3f1c3..a8fc37e920 100644<br>
&gt; --- a/docs/system/arm/raspi.rst<br>
&gt; +++ b/docs/system/arm/raspi.rst<br>
&gt; @@ -36,10 +36,12 @@ Implemented devices<br>
&gt;=C2=A0 =C2=A0* VideoCore firmware (property)<br>
&gt;=C2=A0 =C2=A0* Peripheral SPI controller (SPI)<br>
&gt;=C2=A0 =C2=A0* Broadcom Serial Controller (I2C)<br>
&gt; + * PCIe Root Complex (raspi4b)<br>
&gt; + * GENET Ethernet Controller (raspi4b)<br>
&gt;<br>
&gt;=C2=A0 Missing devices<br>
&gt;=C2=A0 ---------------<br>
&gt;<br>
&gt;=C2=A0 =C2=A0* Pulse Width Modulation (PWM)<br>
&gt; - * PCIE Root Port (raspi4b)<br>
&gt; - * GENET Ethernet Controller (raspi4b)<br>
&gt; + * PCIe MSI/MSI-X interrupt delivery (raspi4b) -- INTx works; a PCIe<=
br>
&gt; +=C2=A0 =C2=A0device that only signals via MSI/MSI-X needs ``msi=3Doff=
,msix=3Doff``<br>
<br>
Do you know what&#39;s missing for the MSI support to work?<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>

--000000000000ac5837065e094bf2--

