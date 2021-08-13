Received: by 2002:a19:f24a:0:0:0:0:0 with SMTP id d10csp200678lfk;
        Fri, 13 Aug 2021 07:37:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnWwLdPM+tFua8g/BFleeE6EC/TuHGbgxEGyAVLEx15ZATXPlMTRNxgkTKvimt/Gpga/Ux
X-Received: by 2002:adf:dd92:: with SMTP id x18mr3622425wrl.123.1628865452273;
        Fri, 13 Aug 2021 07:37:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628865452; cv=none;
        d=google.com; s=arc-20160816;
        b=JtRqQRAhg9YrKkuhcZ2JgN+6ZzbxHieukXej5hkJETtQsfES/mrXHGEmpgGunelUHJ
         l1er8bOetWgIxq7NzrQSGWnYNWSTLDrMMyR1BpkVxXxdMR3kIcCJdoyw4LP5AAYm4WL8
         zpGx+VwWIzRbSFcHk8f1uDn0kO0aE2/tnoLd20PZ4QpZeqkWLLbonYZuQxmo1zRkIa+K
         DWmKviShN2UuMRFcwCAEPdacHt/VFNbP0nJEnjrzeOSnfRs2jglfiXDWwaFhZc40VCRA
         920yTxNzNC9iM35aJ7r8Jknj1toZ05ptE1Zth21ZxKWSospxjVWvRFL18TrZp73YC4jM
         E1Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=eSW7KlB2a1B6abDS5Zifp5VGmOsYaibq5Zr44ACSu/4=;
        b=R8ucc/vJWH4J7RX21zf17q99gMkLU+wIj7MtukTv0gb3+5z/3ZCd5eqK2mnRBnKcP9
         cnPLqa5B1oRpudFE9iBk8CHBI8JSqZa2njVQYToTbaSEdYIEkFDz0r0SdIAWcZ08mfyh
         h8ZEOcIuFrpjP3haabTPMiWfxDv2kx6vprGhyk1QDfE8ioXIAEwePJFweHlND2OZWGIZ
         s/luncAcE3olRgDc4My1lUkvMoj+usHdPE0TyVv/uWLFxwEUdgGY9eorkJfhKoYo5WOt
         7qiNXOt2HDeRTE1FF0yW25kU5rwY6am0xSVtj83JssTsI/oayJ8ElWwSQfKvM1DwXe6m
         2Ofg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=biPx0Lom;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 95si1793198wrm.394.2021.08.13.07.37.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Aug 2021 07:37:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=biPx0Lom;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:37052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mEYJP-0004wb-9Z
	for alex.bennee@linaro.org; Fri, 13 Aug 2021 10:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stmao@google.com>) id 1mEYJD-0004uW-CT
 for qemu-arm@nongnu.org; Fri, 13 Aug 2021 10:37:19 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:40811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stmao@google.com>) id 1mEYJA-0001N2-6f
 for qemu-arm@nongnu.org; Fri, 13 Aug 2021 10:37:19 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 f12-20020a05600c4e8c00b002e6bdd6ffe2so4036674wmq.5
 for <qemu-arm@nongnu.org>; Fri, 13 Aug 2021 07:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eSW7KlB2a1B6abDS5Zifp5VGmOsYaibq5Zr44ACSu/4=;
 b=biPx0LomRcma35ni94Kd7KHgKgmI4s8Imefh7r2Mg7JFucO7DU1mhRtUmZGxVeUrzm
 /0tZ0tgnXpq9+dErT1Bpngx7wFhdWW6hA8DezgYSslIWASTuHZlBwZK0b4e3UV2NtuZK
 T1p0e1/11AO5ov1cmkBeoFIDEhs/H8nQCp5aUpWlZqpiDN1iLuNxaVRvSk5xF+TmTPsp
 gWtd2qb+RltOFtIS/8lB94KcbTaf7Zf+WaEUgdd/09Qz5x7BPofIq/6BEqqr3Mwk+Kro
 FzXmYvY8qCJjYsbz0FhidcD1r9F8X0QTBEji930H0EWhOscsH9Hq/XiI/INug7DgWmsR
 tUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eSW7KlB2a1B6abDS5Zifp5VGmOsYaibq5Zr44ACSu/4=;
 b=ol2YWtXrE85wUQGerAh8+yVCAGnb3KbROiHDQtYETLLibSniG1GuNYi75mFjJTv06z
 xbnBh/ckOJ5YBm0UeKbU/zFnoGfidQIYYzwZV7riWiEfHFBiWcilGatFHKodhIhN4gB9
 CF3Q0jqWsMJ6JVioDW15TkZx9n4MBfLZCsru3C8YKLo/4tRcsDTdWPXjSIxFHM1hEhHr
 QnguP4beOjTGlKrW3ThW07viVF1ZZVGwi/WIEOVhC3qQLsG3Dd/gfjjaz/PzpArpowrx
 R09Vm1vQtx47Hd6blh0PrOXDmx8JanTj4V/o0rbGwFWavdZiAp5QX/cyz+hd2QWaCKWY
 vEHQ==
X-Gm-Message-State: AOAM533d7K+GCvYGvj1ixPNm5p77FpdQNaKeh8ADWhG3PNXFvoYKJXbf
 8PaHfHlH+imIM7A+14aoxA9WnO7Bk5utYI64UldrZw==
X-Received: by 2002:a1c:1f88:: with SMTP id f130mr3078999wmf.24.1628865431501; 
 Fri, 13 Aug 2021 07:37:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210806234918.122457-1-stmao@google.com>
 <20210807015507.GE3431@minyard.net>
In-Reply-To: <20210807015507.GE3431@minyard.net>
From: Shengtan Mao <stmao@google.com>
Date: Fri, 13 Aug 2021 10:37:00 -0400
Message-ID: <CAMiADQ8uZRZ-XjR9hrN5KazPgAFbsYCPOq9RU7Pkwqw+Y-vVBg@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Add remote I2C device to support external I2C
 device
To: Corey Minyard <cminyard@mvista.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Chris Rauer <crauer@google.com>, Hao Wu <wuhaotsh@google.com>, 
 Patrick Venture <venture@google.com>, maoshengtan2011@gmail.com
Content-Type: multipart/alternative; boundary="0000000000006f613505c971c906"
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=stmao@google.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-TUID: q3M1s4T175yV

--0000000000006f613505c971c906
Content-Type: text/plain; charset="UTF-8"

Hi Corey,
Thank you so much for your feedback. I took some time to discuss these
points with my team.

1. Blocking QEMU I/O
Thanks for bringing this to our attention. We acknowledge it as a drawback,
but we hope that by indicating this clearly in an updated docs, the user
will accept these drawbacks when they use it. In short, we hope that you
will consider merging this patch despite this drawback.

2. Error Handling
We will add them for the next version.

3. Remote end NACK
It  would be helpful to have a bit more information on this. The remote I2C
in QEMU redirects the return value (which can indicate NACK / ACK) from the
external device, so the remote end should be able to NACK if prompted by
the external device. If you are saying that the remote I2C should be able
to NACK independently, then no, it doesn't support that, but we can take
steps to add it.

I am leaving google, so I will be passing this project to my team. Thank
you again for your feedback.

best,
Shengtan

On Fri, Aug 6, 2021 at 9:55 PM Corey Minyard <cminyard@mvista.com> wrote:

> On Fri, Aug 06, 2021 at 11:49:16PM +0000, Shengtan Mao wrote:
> > This patch implements the remote I2C device.  The remote I2C device
> allows an
> > external I2C device to communicate with the I2C controller in QEMU
> through the
> > remote I2C protocol.  Users no longer have to directly modify QEMU to
> add new
> > I2C devices and can instead implement the emulated device externally and
> > connect it to the remote I2C device.
>
> I got to spend some time on this today, and I like the concept, but
> there is one major issue.  When you do a read, you are blocking the
> entire qemu I/O system until the read returns, which may result in
> issues.  At least that's may understanding of how the qemu I/O system
> works, which may be dated or wrong.
>
> If you look at the IPMI code, it as an external BMC that can handle
> async I/O from the chardev.  But the IPMI subsystem is designed to
> handle this sort of thing.
>
> Unfortunately, the I2C code really isn't set up to handle async
> operations.  I'm not sure how hard it would be to modify the I2C core to
> handle this, but it doesn't look trivial.  Well, the changes to the core
> wouldn't be terrible, but all the host devices are set up for
> synchronous operation.  You could add a separate asynchronous interface,
> and only host devices that were modified could use it, and your device
> would only work on those host devices.
>
> Another issue is that you aren't handling errors from the chr read/write
> calls.  If the remote connection dies, this isn't going to be good.  You
> have to do error handling.
>
> There is also no way for the remote end to return a NACK.  That's pretty
> important, I think.  It will, unfortunately, complicate your nice simple
> protocol.
>
> Sorry to be the bearer of bad news.  Maybe I'm wrong about the blocking
> thing, I'd be happy to be wrong.
>
> -corey
>
> >
> > Previous work by Wolfram Sang
> > (
> https://git.kernel.org/pub/scm/virt/qemu/wsa/qemu.git/commit/?h=i2c-passthrough
> )
> > was referenced.  It shares the similar idea of redirecting the actual
> I2C device
> > functionalities, but Sang focuses on physical devices, and we focus on
> emulated devices.
> > The work by Sang mainly utilizes file descriptors while ours utilizes
> character
> > devices, which offers better support for emulated devices. The work by
> Sang is
> > not meant to offer full I2C device support; it only implements the
> receive
> > functionality.  Our work implements full support for I2C devices: send,
> recv,
> > and event (match_and_add is not applicable for external devices).
> >
> > v1 -> v2
> >     fixed terminology errors in the description comments.
> > v2 -> v3
> >     corrected patch set emailing errors.
> > v3 -> v4
> >     added remote I2C protocol description in docs/specs
> >
> > Shengtan Mao (2):
> >   hw/i2c: add remote I2C device
> >   docs/specs: add remote i2c docs
> >
> >  docs/specs/index.rst          |   1 +
> >  docs/specs/remote-i2c.rst     |  51 ++++++++
> >  hw/arm/Kconfig                |   1 +
> >  hw/i2c/Kconfig                |   4 +
> >  hw/i2c/meson.build            |   1 +
> >  hw/i2c/remote-i2c.c           | 117 ++++++++++++++++++
> >  tests/qtest/meson.build       |   1 +
> >  tests/qtest/remote-i2c-test.c | 216 ++++++++++++++++++++++++++++++++++
> >  8 files changed, 392 insertions(+)
> >  create mode 100644 docs/specs/remote-i2c.rst
> >  create mode 100644 hw/i2c/remote-i2c.c
> >  create mode 100644 tests/qtest/remote-i2c-test.c
> >
> > --
> > 2.32.0.605.g8dce9f2422-goog
> >
>

--0000000000006f613505c971c906
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Corey,<div>Thank you so much for your feedback. I took =
some time to discuss these points with my team.</div><div><br></div><div>1.=
 Blocking QEMU I/O</div><div>Thanks for bringing this to our attention. We =
acknowledge it as a drawback, but we hope that by indicating this clearly i=
n an updated docs, the user will accept these drawbacks when they use it. I=
n short, we hope that you will consider merging this patch despite this dra=
wback.</div><div><br></div><div>2. Error Handling</div><div>We will add the=
m for the next version.</div><div><br></div><div>3. Remote end NACK</div><d=
iv>It=C2=A0 would be helpful to have a bit more information on this. The re=
mote I2C in QEMU redirects the return value (which can indicate NACK / ACK)=
 from the external device, so the remote end should be able to NACK if prom=
pted by the external device. If you are saying that the remote I2C should b=
e able to NACK independently, then no, it doesn&#39;t support that, but we =
can take steps to add it.</div><div><br></div><div>I am leaving google, so =
I will be passing this project to my team. Thank you again for your feedbac=
k.</div><div><br></div><div>best,</div><div>Shengtan</div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 6, 20=
21 at 9:55 PM Corey Minyard &lt;<a href=3D"mailto:cminyard@mvista.com">cmin=
yard@mvista.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On Fri, Aug 06, 2021 at 11:49:16PM +0000, Shengtan Mao wrote=
:<br>
&gt; This patch implements the remote I2C device.=C2=A0 The remote I2C devi=
ce allows an<br>
&gt; external I2C device to communicate with the I2C controller in QEMU thr=
ough the<br>
&gt; remote I2C protocol.=C2=A0 Users no longer have to directly modify QEM=
U to add new<br>
&gt; I2C devices and can instead implement the emulated device externally a=
nd<br>
&gt; connect it to the remote I2C device.<br>
<br>
I got to spend some time on this today, and I like the concept, but<br>
there is one major issue.=C2=A0 When you do a read, you are blocking the<br=
>
entire qemu I/O system until the read returns, which may result in<br>
issues.=C2=A0 At least that&#39;s may understanding of how the qemu I/O sys=
tem<br>
works, which may be dated or wrong.<br>
<br>
If you look at the IPMI code, it as an external BMC that can handle<br>
async I/O from the chardev.=C2=A0 But the IPMI subsystem is designed to<br>
handle this sort of thing.<br>
<br>
Unfortunately, the I2C code really isn&#39;t set up to handle async<br>
operations.=C2=A0 I&#39;m not sure how hard it would be to modify the I2C c=
ore to<br>
handle this, but it doesn&#39;t look trivial.=C2=A0 Well, the changes to th=
e core<br>
wouldn&#39;t be terrible, but all the host devices are set up for<br>
synchronous operation.=C2=A0 You could add a separate asynchronous interfac=
e,<br>
and only host devices that were modified could use it, and your device<br>
would only work on those host devices.<br>
<br>
Another issue is that you aren&#39;t handling errors from the chr read/writ=
e<br>
calls.=C2=A0 If the remote connection dies, this isn&#39;t going to be good=
.=C2=A0 You<br>
have to do error handling.<br>
<br>
There is also no way for the remote end to return a NACK.=C2=A0 That&#39;s =
pretty<br>
important, I think.=C2=A0 It will, unfortunately, complicate your nice simp=
le<br>
protocol.<br>
<br>
Sorry to be the bearer of bad news.=C2=A0 Maybe I&#39;m wrong about the blo=
cking<br>
thing, I&#39;d be happy to be wrong.<br>
<br>
-corey<br>
<br>
&gt; <br>
&gt; Previous work by Wolfram Sang<br>
&gt; (<a href=3D"https://git.kernel.org/pub/scm/virt/qemu/wsa/qemu.git/comm=
it/?h=3Di2c-passthrough" rel=3D"noreferrer" target=3D"_blank">https://git.k=
ernel.org/pub/scm/virt/qemu/wsa/qemu.git/commit/?h=3Di2c-passthrough</a>)<b=
r>
&gt; was referenced.=C2=A0 It shares the similar idea of redirecting the ac=
tual I2C device<br>
&gt; functionalities, but Sang focuses on physical devices, and we focus on=
 emulated devices.<br>
&gt; The work by Sang mainly utilizes file descriptors while ours utilizes =
character<br>
&gt; devices, which offers better support for emulated devices. The work by=
 Sang is<br>
&gt; not meant to offer full I2C device support; it only implements the rec=
eive<br>
&gt; functionality.=C2=A0 Our work implements full support for I2C devices:=
 send, recv,<br>
&gt; and event (match_and_add is not applicable for external devices).<br>
&gt; <br>
&gt; v1 -&gt; v2<br>
&gt;=C2=A0 =C2=A0 =C2=A0fixed terminology errors in the description comment=
s.<br>
&gt; v2 -&gt; v3<br>
&gt;=C2=A0 =C2=A0 =C2=A0corrected patch set emailing errors.<br>
&gt; v3 -&gt; v4<br>
&gt;=C2=A0 =C2=A0 =C2=A0added remote I2C protocol description in docs/specs=
<br>
&gt; <br>
&gt; Shengtan Mao (2):<br>
&gt;=C2=A0 =C2=A0hw/i2c: add remote I2C device<br>
&gt;=C2=A0 =C2=A0docs/specs: add remote i2c docs<br>
&gt; <br>
&gt;=C2=A0 docs/specs/index.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A01 +<br>
&gt;=C2=A0 docs/specs/remote-i2c.rst=C2=A0 =C2=A0 =C2=A0|=C2=A0 51 ++++++++=
<br>
&gt;=C2=A0 hw/arm/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 hw/i2c/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A04 +<br>
&gt;=C2=A0 hw/i2c/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A01 +<br>
&gt;=C2=A0 hw/i2c/remote-i2c.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 11=
7 ++++++++++++++++++<br>
&gt;=C2=A0 tests/qtest/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0=
1 +<br>
&gt;=C2=A0 tests/qtest/remote-i2c-test.c | 216 ++++++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 8 files changed, 392 insertions(+)<br>
&gt;=C2=A0 create mode 100644 docs/specs/remote-i2c.rst<br>
&gt;=C2=A0 create mode 100644 hw/i2c/remote-i2c.c<br>
&gt;=C2=A0 create mode 100644 tests/qtest/remote-i2c-test.c<br>
&gt; <br>
&gt; -- <br>
&gt; 2.32.0.605.g8dce9f2422-goog<br>
&gt; <br>
</blockquote></div>

--0000000000006f613505c971c906--
