Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD4EEDEBE0
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 18:32:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxUXj-0001PF-Nc; Tue, 03 Mar 2026 13:32:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1vxUXc-0001OO-4v
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 13:32:23 -0500
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1vxUXa-00071Z-40
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 13:32:19 -0500
Received: by mail-dl1-x1230.google.com with SMTP id
 a92af1059eb24-12758ce1e8dso2620673c88.0
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 10:32:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772562737; cv=none;
 d=google.com; s=arc-20240605;
 b=HenStNaz1EiDl7CwrK7SVBSYIMs1Hr1ZP6zW3jAOYkQ1AHnp/6E/2se7hDKeMM+IWs
 5AMD2sa+wfkyU+ZY/oi+EOofu85zezLbE7xTjxLNv45iVzDaCQQTWBOqN/X5RD9qaXd0
 jtaVmSPibf+Tbdo2dpYG6b9YwZqIwIZo6/yK9/GgyEjWSk9NhjkD2rT9jgSyM1j0S9Sy
 hm5NaKgFp3zsc/AD+fR7U2mEjpA+OjWAMBQ7OEk2XP+yY0gtv8+BRyt+lD6IzYtHmf5Q
 cvbpDj6iEIRXn3mIyU5UlD2OtC9rc21bMQ5tqYaqnQVWueIwaRZn14IvBk1KZLiGdhhq
 u/CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=/EdPveg4tGA8FqN+WLX4ITf8szipKUj0T5kGoi73b8s=;
 fh=k3FakiIK5UxQc6qPe7VZfp9hGt16SzLuOmz2eWErCv4=;
 b=TFo7YFhxhwZ/jYL2uG7+ugzlxtFcKBMMeUoSaLj7SWR8mybPaq8XCrAKwFaxKS6gcz
 NdvHZlwLW5dCyC9FWdTLQsDkXxtQ54inBOqodc4Kd7ZGQ63N2mobfs54AMW7zJ5xTo/R
 roP/c/20XXzxoOKzV7Jce7JJ2c0jgbK+DFJD8ofawt7LfY5WlaytueEUab/0eW3QIYMk
 scJg2PvMRBMPew4k5DnZsWlmS+ZatAu8/DUwetvKjWWgjGKUZkiQJTE2+QEjF9anfIS7
 4HZ8yiwIN4rUIPXPHeTX4Evg5C0nzKKPk7I0ZWeVih5wLbKbAJx46KznA2ePSo6uAW6w
 N1IA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772562737; x=1773167537; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/EdPveg4tGA8FqN+WLX4ITf8szipKUj0T5kGoi73b8s=;
 b=mrZo0kkB+nUpjGAWRMsWYE2wJNs1Hhpv9hoeX3jGI1w6nc4YscDp/2Ag+HQ2SlGFDc
 esKBnKiqCMhko393QYzh0naPjDASx3bHcszsolp1grJM96hhJQcWc/MMK67xU97i1XFX
 Dbb0GM38CTMcuh8Kt8grQ8itCb+hFkPzrIS+zJQUfwgZHyimarSxL55bmxY1pUpuH5sI
 3hY2VWMVIEwlp9rKLiyMYVpYTUM0KfuycvQkQ6sIoPPGA8lG5qhB7LREXW9GmT0CaLbn
 Z5DgZ68KhdGXG1nLNCRa7J5MOAO+U+ERNjsZndKeQaQT2jHXqF15Wi+aZ+jddzIVgBYY
 /uZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772562737; x=1773167537;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/EdPveg4tGA8FqN+WLX4ITf8szipKUj0T5kGoi73b8s=;
 b=drb2oXBj424vRD7XzHOX3UA/wQKoYpD4Eh9Q+hXpG31sFe0PlJeplpuYL9bjZ/c/Ug
 Aur1CP0TW9Dw9USXEfi/ao7H1B6I3/oNdnkfkv9odHL89c+soNgVglJ9nFmUzlmuyfkV
 Ym4tUTW7uvKOJiR/d68PbX/s8duaQ/5d8KOFNqviAJcwk8Ph+/FrdUr5D91SkpLHcIBY
 LHOrSD8Hx2TC3v9Dp2Sp7gwn5OkfGvsqgW07TkSjFgAcQiqqBOkBSftXoMfSccsS67XX
 M3yV3mb+0P80wCs5HYLItkSu0T5Z403eMfOwBOpZYVqcOKHeFoaie4lLsN5Xq08wnFk5
 E2ZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0815R0weus7GLe1k8T5Ab3ecm3ZcUNqzTjfxnLikc+vJHY3wCX5oaJRugjRBfEZWaPaFXwyHQfg==@nongnu.org
X-Gm-Message-State: AOJu0YwCZo8113l6Em6P8ONlYl8RBMhgTwCqNrw54vNPNvP9Nx9hixgf
 iTG4TpTJgLZELpkWZ/OoNxU9wCoXmTCPDWuXsROyFZdqdX7o/g0D6NuzlC216bhwdHQp9TNcOza
 DPhYCbrDdo6QDg/eAInmHW8cxl1AHi0o=
X-Gm-Gg: ATEYQzw5xHeMzst66EnUVqzDvY7hZXISIMGydJW0TH0e0OObWIOnfwXR7dWQUCg5wOP
 2SE7UtuGHPfwYiO+kwOsUVrgfmNkMeMZnMvHxBzKmbx+Pm2bvW0Tx+HHeSuNH5KsjGlfmv4yYMW
 W/GleAWk3MYVKJGEG4kPSpNgG9ZEODKJJSbi+4uodKudAwKd4w1x4fxco33YcO1VjksRURNl14M
 g91fop1YDkpnjAgfTWe92DSAveJG1a2lDVHR61D+A5ULjZc4kW+KvFnaE/TzfUvkhwu5ftx8uSt
 QXrmkxD3YemVx7Klcw==
X-Received: by 2002:a05:7022:90f:b0:11b:9386:a3c8 with SMTP id
 a92af1059eb24-1278fd7b7d5mr7481974c88.41.1772562736313; Tue, 03 Mar 2026
 10:32:16 -0800 (PST)
MIME-Version: 1.0
References: <20260212104432.4168886-1-kchiu@axiado.com>
 <CAFEAcA_u5B2RdVEaGycCQ6gCx1pQuT8rvGVGZpoKLTK+2s72+w@mail.gmail.com>
 <69691e3b-1605-4a5a-8ad5-0eec56ce3eed@axiado.com>
In-Reply-To: <69691e3b-1605-4a5a-8ad5-0eec56ce3eed@axiado.com>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Tue, 3 Mar 2026 12:32:03 -0600
X-Gm-Features: AaiRm50TlLO9zmZIRLd-fBZFSb0JSKwzkeJQUS3HRbcMX-n_cyGgN19ih5MFIUs
Message-ID: <CAJy5ezpcvp0Qy-P9gE46oDtsxZxNO=xMV1k-GC3WF4yY3gARGw@mail.gmail.com>
Subject: Re: [PATCH v1] hw/char/cadence_uart: Add BXRS register
To: Kuan-Jui Chiu <kchiu@axiado.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, 
 pbonzini@redhat.com, marcandre.lureau@redhat.com, alistair@alistair23.me
Content-Type: multipart/alternative; boundary="0000000000003d783f064c22ece9"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1230;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-dl1-x1230.google.com
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

--0000000000003d783f064c22ece9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 2:33=E2=80=AFAM Kuan-Jui Chiu <kchiu@axiado.com> wro=
te:

> Hi
>
> I was referring this commit of upstream kernel which xilinx added BXRS
> register in Cadence UART driver
> serial: xuartps: Adds RXBS register support for zynqmp =C2=B7
> torvalds/linux@3816b2f
> <
> https://github.com/torvalds/linux/commit/3816b2f886d0918d8a8ae593b2db203a=
b905a889
> >
>
> Peter Maydell =E6=96=BC 2026/2/16 =E4=B8=8B=E5=8D=88 06:53 =E5=AF=AB=E9=
=81=93:
> > CAUTION: This email originated from outside of the organization. Do not
> click links or open attachments unless you recognize the sender and know
> the content is safe.
> >
> >
> > On Thu, 12 Feb 2026 at 10:47, Kuan-Jui Chiu <kchiu@axiado.com> wrote:
> >> The new CADENCE UART driver in upstream kernel access BXRS register
> >> This patch adds BXRS (RX FIFO byte status register) or there would be
> >> kernel panic if user are using the new CADENCE UART driver
> >>
> >> Signed-off-by: Kuan-Jui Chiu <kchiu@axiado.com>
> > Hi; thanks for this patch.
> >
> >> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> >> index eff6a3c4d1..f57cad57a8 100644
> >> --- a/hw/char/cadence_uart.c
> >> +++ b/hw/char/cadence_uart.c
> >> @@ -120,6 +120,7 @@
> >>   #define R_PMIN     (0x3C/4)
> >>   #define R_PWID     (0x40/4)
> >>   #define R_TTRIG    (0x44/4)
> >> +#define R_RXBS     (0x48/4)
> > Where is this register documented? The cadence_uart.c file
> > references the Zynq 7000 Soc TRM UG585; its URL for that
> > is out of date, but looking at the copy on the AMD website,
> > there is a table giving the register summary for the UART:
> >
> https://docs.amd.com/r/en-US/ug585-zynq-7000-SoC-TRM/UART-Controller-UART
> > and it lists only registers from offsets 0 to 0x44.
> >
> > thanks
> > -- PMM
>


Hi,

There's documentation here for zynqmp:
https://docs.amd.com/r/en-US/ug1087-zynq-ultrascale-registers/Rx_FIFO_byte_=
status-UART-Register

I haven't looked to carefully, it may be a register that didn't exist in
the version of the UART on zynq and was added in the version of the uart in
the zynqmp.

Cheers,
Edgar

--0000000000003d783f064c22ece9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 3, =
2026 at 2:33=E2=80=AFAM Kuan-Jui Chiu &lt;<a href=3D"mailto:kchiu@axiado.co=
m">kchiu@axiado.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Hi<br>
<br>
I was referring this commit of upstream kernel which xilinx added BXRS <br>
register in Cadence UART driver<br>
serial: xuartps: Adds RXBS register support for zynqmp =C2=B7 <br>
torvalds/linux@3816b2f <br>
&lt;<a href=3D"https://github.com/torvalds/linux/commit/3816b2f886d0918d8a8=
ae593b2db203ab905a889" rel=3D"noreferrer" target=3D"_blank">https://github.=
com/torvalds/linux/commit/3816b2f886d0918d8a8ae593b2db203ab905a889</a>&gt;<=
br>
<br>
Peter Maydell =E6=96=BC 2026/2/16 =E4=B8=8B=E5=8D=88 06:53 =E5=AF=AB=E9=81=
=93:<br>
&gt; CAUTION: This email originated from outside of the organization. Do no=
t click links or open attachments unless you recognize the sender and know =
the content is safe.<br>
&gt;<br>
&gt;<br>
&gt; On Thu, 12 Feb 2026 at 10:47, Kuan-Jui Chiu &lt;<a href=3D"mailto:kchi=
u@axiado.com" target=3D"_blank">kchiu@axiado.com</a>&gt; wrote:<br>
&gt;&gt; The new CADENCE UART driver in upstream kernel access BXRS registe=
r<br>
&gt;&gt; This patch adds BXRS (RX FIFO byte status register) or there would=
 be<br>
&gt;&gt; kernel panic if user are using the new CADENCE UART driver<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Kuan-Jui Chiu &lt;<a href=3D"mailto:kchiu@axiado.co=
m" target=3D"_blank">kchiu@axiado.com</a>&gt;<br>
&gt; Hi; thanks for this patch.<br>
&gt;<br>
&gt;&gt; diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c<br>
&gt;&gt; index eff6a3c4d1..f57cad57a8 100644<br>
&gt;&gt; --- a/hw/char/cadence_uart.c<br>
&gt;&gt; +++ b/hw/char/cadence_uart.c<br>
&gt;&gt; @@ -120,6 +120,7 @@<br>
&gt;&gt;=C2=A0 =C2=A0#define R_PMIN=C2=A0 =C2=A0 =C2=A0(0x3C/4)<br>
&gt;&gt;=C2=A0 =C2=A0#define R_PWID=C2=A0 =C2=A0 =C2=A0(0x40/4)<br>
&gt;&gt;=C2=A0 =C2=A0#define R_TTRIG=C2=A0 =C2=A0 (0x44/4)<br>
&gt;&gt; +#define R_RXBS=C2=A0 =C2=A0 =C2=A0(0x48/4)<br>
&gt; Where is this register documented? The cadence_uart.c file<br>
&gt; references the Zynq 7000 Soc TRM UG585; its URL for that<br>
&gt; is out of date, but looking at the copy on the AMD website,<br>
&gt; there is a table giving the register summary for the UART:<br>
&gt; <a href=3D"https://docs.amd.com/r/en-US/ug585-zynq-7000-SoC-TRM/UART-C=
ontroller-UART" rel=3D"noreferrer" target=3D"_blank">https://docs.amd.com/r=
/en-US/ug585-zynq-7000-SoC-TRM/UART-Controller-UART</a><br>
&gt; and it lists only registers from offsets 0 to 0x44.<br>
&gt;<br>
&gt; thanks<br>
&gt; -- PMM<br></blockquote><div><br></div><div><br></div><div>Hi,</div><di=
v><br></div><div>There&#39;s documentation here for zynqmp:</div><div><a hr=
ef=3D"https://docs.amd.com/r/en-US/ug1087-zynq-ultrascale-registers/Rx_FIFO=
_byte_status-UART-Register">https://docs.amd.com/r/en-US/ug1087-zynq-ultras=
cale-registers/Rx_FIFO_byte_status-UART-Register</a></div><div><br></div><d=
iv>I haven&#39;t looked to carefully, it may be a register that didn&#39;t =
exist in the version of the UART on zynq and was added in the version of th=
e uart in the zynqmp.</div><div><br></div><div>Cheers,</div><div>Edgar</div=
></div></div>

--0000000000003d783f064c22ece9--

