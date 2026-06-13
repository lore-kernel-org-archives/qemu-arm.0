Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C93E7CD98C5
	for <qemu-arm@archiver.kernel.org>; Sat, 13 Jun 2026 05:23:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wYGpU-0004yh-H3; Sat, 13 Jun 2026 01:22:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kylefoxaustin.github@gmail.com>)
 id 1wYGpP-0004y6-62
 for qemu-arm@nongnu.org; Sat, 13 Jun 2026 01:22:43 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kylefoxaustin.github@gmail.com>)
 id 1wYGpM-0003kY-5t
 for qemu-arm@nongnu.org; Sat, 13 Jun 2026 01:22:42 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-6913fb25322so2063660a12.1
 for <qemu-arm@nongnu.org>; Fri, 12 Jun 2026 22:22:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781328158; cv=none;
 d=google.com; s=arc-20240605;
 b=QY7hGFgWh7oMQHn6Py+kvzfAiWxP4ZL/aejGRugWK+lC4D1tHOsyLzgaNf6Zl74Dby
 MTyT6/sIrNhFw7v5hFutxRhKzpFIMu9INRV1T7zEScSsdSZW45VXlKuO0diuJB6etauH
 XD/a6Z9TmJZNvXBbkhNu3PLCQNOPH3ShDWmskeXajQRFda3qAtQWK7e74//iBuE19xPC
 kz78RfMNq/khqpCAFTHR8nVLdKAPU93muIEMr+ZqWf4vwYjttBArORBt6MlcH6FQ5/eB
 vaW09om9Ijvc6+xKzpWAydfr5Zodrf+WX6ZJL4ss6tS3i5NkU9+YAxRMpy81cbLJOpm5
 axIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=8it+egN+vgeOFmSRjEavP5t+0d6gXiZXjFH/DtNplZE=;
 fh=PpZ1CCXoZMh/DRvZh+FxXhmYvb7cgaexUeWdx5nsuRU=;
 b=IqMNLTgHyPCCNnK0/arV/dC13TtuRYlai4BUqCxwfG3EOpztitOCfNwE14x56KZeuJ
 yUOuFMpxNcRwoCLan2RIq55AZlN2N0zky8Gs94cQaSdG0lmvZ3UnTwIPo9mfpdSUDtfL
 Ek4bya7CKF8Fku5afJ/NLH9gv9pfRRoeqdtnri1ge3+pWwSUQQ+m1HKBB5Mx9AA/TwA4
 HQy4hTA0129ltcYQz3DCORqvgIxJ4u4FjjO2pDAl5639VGsi3Waar2gedG06Tg8ALs9I
 +apPW76iJ5nkgu9wf6co51F9af+h2Z+cUiLu2DXagbj8xQi1bPgRM8JOW1uF8FDS69Mw
 kJLg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781328158; x=1781932958; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8it+egN+vgeOFmSRjEavP5t+0d6gXiZXjFH/DtNplZE=;
 b=o8vwMg42MdXVeN3nCzhZr9CfD/0XY32J3NPfraK6P/07HR633iPQZ/4Sbe1yRiQ4IT
 IK5jwBQIxUxQnz6zPdM1C+88nI/ATWBXQIDczrhcjFqV5Fid8Cwhqaktc7VGPzHpK6tt
 D/7mOmVDvcPhiDAiB6y+DheePUq9MfTF3sWKfvK3BvCjS5wILUOxK1djzlFN2RIMXo2Q
 ywXJ4+z/w9EtyJPb0aGqKPj7wlgwLuY+yDzP80NazRso4W36mAnXO7V4Hwliw6JU0ZoF
 2flr1ikLV5MMVBPQ1RJMjUpJc8YkXd5ecaiVYjOuCaJtezYjl0ZjNNuxk4mzE9JMv+C6
 wAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781328158; x=1781932958;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8it+egN+vgeOFmSRjEavP5t+0d6gXiZXjFH/DtNplZE=;
 b=jpI80sgGhjTmvtzQBFeleF3IppyIvaE3THGMbPnL0eAgNE7oejXdMeQtuxwRBergKZ
 WoP9I1+eRzJqDl8Q7iCT+B1AH1gRVYVXbjAcluReXQC9NA2uIHvceRZG3f20yEINtbQc
 UNUTrFHro/+OZ3qLusVZE3s+RCVd1XCnoeKCMevgaJH6Hg/S+SVzHrVoLlfqq618L5a1
 YgXiqouLvJBoHyD+8+1OKyzuKFIQYTZIORdJOwER6u3GtvRP1tqpaGxLDfUK4I5eJXs/
 9tJO674r4kNjhhQXe0yYyL/Aux1IuF7Uz4ygNZYYTtOnu5hHN7NN5z9YJjopuO98L87b
 dQkg==
X-Gm-Message-State: AOJu0YxtKGfLsMMay2Qq2l5bf1SHTTmyUMbqfSx7z8VFXIZkjWh74Y66
 6DAz6oMagBppDQELHP93pZtOaxgsQk4TTWfkMecs+nWTISEYbTaMBgcBPYdQtKvb7AfaeVcClSk
 G6GZzWUMsBbzHpUDNjyHFROjQDg9ZoDHsj1jQmYSAHQ==
X-Gm-Gg: Acq92OF19wnw0KISMMrUohkKuSgQdiIKkyzYOPyseYyGuGT+5xW14+SN9b65HLbel6U
 TcHfx2eqHC01nSepigPBKZazW/Q4XoyeSl10YMqqLDrbnJcs+E+4tTdR/0/W31/IkcaSf/PUHaX
 sg7ROrXnY9UaZJ4jILq83YoastcJMFzF3h9QSZ3q9EFlhnAktF4GxNwiFGd3246LftXDn0X8QZJ
 B6IU9VH19TTjGoY3ByBDDnmT6zdiiiOvfQr7UKgfXPyxwvlcy2CwD/+iy+YyDh0u7PlId/7iK/m
 n6U=
X-Received: by 2002:a17:906:8a4b:b0:bd1:fe8f:59ab with SMTP id
 a640c23a62f3a-bfe2a2198eamr194270566b.23.1781328157761; Fri, 12 Jun 2026
 22:22:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260605034729.2874861-1-kylefoxaustin.github@gmail.com>
 <CAFEAcA_=2j+jHuqcCF0S9X=4q3dhY8=EKJuGCkuuUSG1jaO0bQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_=2j+jHuqcCF0S9X=4q3dhY8=EKJuGCkuuUSG1jaO0bQ@mail.gmail.com>
From: kylefoxaustin <kylefoxaustin.github@gmail.com>
Date: Sat, 13 Jun 2026 00:22:26 -0500
X-Gm-Features: AVVi8CdAsw54szzgiQrTO3kXZFGcrF7r9CpU5YPZlpAAF0-7zH1CKVJm9hvnYr0
Message-ID: <CANqqvPeUAHNpw5_h=Lq4ts=W6sE49occngXga+o=Yezem0dr3g@mail.gmail.com>
Subject: Re: [PATCH] target/arm: align down misaligned PMSAv7 MPU region base
 instead of dropping it
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000001264a006541bc874"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=kylefoxaustin.github@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--0000000000001264a006541bc874
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,
yeah sorry for sending this in.   Based on your feedback I went a bit deepe=
r
and realized what you pointed out: I was chasing a software bug that
exists in the guest and QEMU shouldn't emulate one particular
implementation's choice as if it were architectural.

It is based on NXP's proprietary M7 sdk firmware which I can't modify.
Plan is to clearly document local workaround and see if I can
later convince NXP to fix it on their end.

Please drop this one; thanks for the review!!.

-- Kyle


On Mon, Jun 8, 2026 at 4:37=E2=80=AFAM Peter Maydell <peter.maydell@linaro.=
org>
wrote:

> On Fri, 5 Jun 2026 at 04:47, Kyle Fox <kylefoxaustin.github@gmail.com>
> wrote:
> >
> > When a PMSAv7 (ARMv7-M) MPU region's DRBAR base is not aligned to its
> > DRSR region size, get_phys_addr_pmsav7() logged a guest-error and
> > skipped the region entirely (continue). The architecture calls a
> > misaligned base UNPREDICTABLE, but real Cortex-M hardware does not
> > disable the region: RBAR.ADDR is only bits [31:log2(size)], so the
> > sub-size low bits are simply ignored and the region matches against the
> > aligned-down base.
> >
> > NXP's i.MX95 Cortex-M7 firmware (and the MCUXpresso SDK demos) rely on
> > this. The M7 sets up a deny-all background region (region 0, whole
> > address space, AP=3D000) and then grants the peripheral space with a
> > 512 MiB region programmed as DRBAR=3D0x4c800000 - misaligned, intended =
as
> > 0x40000000. QEMU dropped that region, so a privileged access to e.g.
> > LPUART3 at 0x42570000 fell through to the deny-all region and took a
> > MemManage fault (CFSR.DACCVIOL), trapping the firmware in its default
> > fault handler before it could print anything.
>
> This is a guest software bug -- software must not rely on UNPREDICTABLE
> behaviour, even if the hardware implementation happens to do the
> same thing every time. Other M-profile CPUs might do something different.
> The right thing to do here is to fix the broken software...
>
> thanks
> -- PMM
>

--0000000000001264a006541bc874
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Peter,</div><div>yeah sorry for sending this in.=
=C2=A0 =C2=A0Based on your feedback I went a bit deeper<br>and realized wha=
t you pointed out: I was chasing a software bug that=C2=A0<br>exists in the=
 guest and QEMU shouldn&#39;t emulate one particular=C2=A0<br>implementatio=
n&#39;s choice as if it were architectural.</div><div><br>It is based on NX=
P&#39;s proprietary M7 sdk firmware which I can&#39;t modify.=C2=A0=C2=A0<b=
r>Plan is to clearly document local workaround and see if I can=C2=A0<br>la=
ter convince NXP to fix it on their end.=C2=A0</div><div><br></div>Please d=
rop this one; thanks for the review!!.<br><br>-- Kyle</div><div dir=3D"ltr"=
><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Mon, Jun 8, 2026 at 4:37=E2=80=AFAM Peter Maydell =
&lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank">peter.may=
dell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On Fri, 5 Jun 2026 at 04:47, Kyle Fox &lt;<a href=3D"mailto:=
kylefoxaustin.github@gmail.com" target=3D"_blank">kylefoxaustin.github@gmai=
l.com</a>&gt; wrote:<br>
&gt;<br>
&gt; When a PMSAv7 (ARMv7-M) MPU region&#39;s DRBAR base is not aligned to =
its<br>
&gt; DRSR region size, get_phys_addr_pmsav7() logged a guest-error and<br>
&gt; skipped the region entirely (continue). The architecture calls a<br>
&gt; misaligned base UNPREDICTABLE, but real Cortex-M hardware does not<br>
&gt; disable the region: RBAR.ADDR is only bits [31:log2(size)], so the<br>
&gt; sub-size low bits are simply ignored and the region matches against th=
e<br>
&gt; aligned-down base.<br>
&gt;<br>
&gt; NXP&#39;s i.MX95 Cortex-M7 firmware (and the MCUXpresso SDK demos) rel=
y on<br>
&gt; this. The M7 sets up a deny-all background region (region 0, whole<br>
&gt; address space, AP=3D000) and then grants the peripheral space with a<b=
r>
&gt; 512 MiB region programmed as DRBAR=3D0x4c800000 - misaligned, intended=
 as<br>
&gt; 0x40000000. QEMU dropped that region, so a privileged access to e.g.<b=
r>
&gt; LPUART3 at 0x42570000 fell through to the deny-all region and took a<b=
r>
&gt; MemManage fault (CFSR.DACCVIOL), trapping the firmware in its default<=
br>
&gt; fault handler before it could print anything.<br>
<br>
This is a guest software bug -- software must not rely on UNPREDICTABLE<br>
behaviour, even if the hardware implementation happens to do the<br>
same thing every time. Other M-profile CPUs might do something different.<b=
r>
The right thing to do here is to fix the broken software...<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>

--0000000000001264a006541bc874--

