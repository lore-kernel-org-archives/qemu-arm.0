Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4302222wrg;
        Tue, 11 Jun 2019 05:39:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw8t1j6PpKsAI0+gM+dUvPf7L6v0lwSRDLLdgw/5AL1A/eDW5gLFb4GrhO2fS/CIlqSrcyF
X-Received: by 2002:a0c:ae31:: with SMTP id y46mr30946767qvc.172.1560256792895;
        Tue, 11 Jun 2019 05:39:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560256792; cv=none;
        d=google.com; s=arc-20160816;
        b=QxNj39ss7bDP/EzCoQ32jR70Va2qUiD9esmBfu/WzP4SlUeWSaway3aMZJFb4vmmrF
         0Bi9B7vE84ynlaK9EpijRiEYae/wZ+J7BmLHpsqT2ChyX0W0YUMgORqQEy6Rdqd7FUge
         1oL1vHVjaLDXRQPLB41E8VG02OthihYkCNQSDxrLvkAlkOSHt1JVeou2VKuOP1iW0Z+v
         gTDa6HaVWcI7k4jNOc2Ym512UXUMQuRqQHZkCTSQsSIQKJS7HvNRSCJeXUrGp6tWlZC/
         vupPuuzrWcn9knedPl4k0SjSV6ei4emy+bHcf/r39BWwLBzvUuVJnUFDbbQ3uoJSMQlG
         d0iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hqXHWwI+6YLDY2XPkJyKYaUQ0K7IV5tHdMlx1gZ34CE=;
        b=axdFO/Xn6wg72zeCF0NwVJXaP9Rg3vqC1DmCnQuye6/+hwJFhESWZyoUf+vTppMf1c
         OA9Sx8nhqT8C0nR1J7+D/kAGn3GTpxVTxbrgPdbGI3yoj+xTqYqhDJNeg+S0ea+8sXFZ
         1HUVaHU4nB3mOtWCo46vHoMzegvDn30UNRt6VdFq6ZrO8GWRKCUeHrp20fkK+vbglkEp
         8LVQeoSQZbMWn2fuJh0MBdeuEPcnH5ueeSCpYWq4zG8crpz/rzZRwLOVkB5p/7Qm3YB2
         Rd712VPSomiDEoBE1fwl7N18VtwNzW09v42ykbc045RLcKK9LGuAEJRJrqmcyO5Q2U2W
         oXIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KHzbqU+R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 30si1089309qvh.175.2019.06.11.05.39.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2019 05:39:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KHzbqU+R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57788 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hag48-0004lV-Er
	for alex.bennee@linaro.org; Tue, 11 Jun 2019 08:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53448)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <rfried.dev@gmail.com>) id 1hafBr-00081x-RC
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 07:43:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rfried.dev@gmail.com>) id 1haewx-000189-Om
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 07:28:25 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:54611)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rfried.dev@gmail.com>)
 id 1haewu-00014N-Ds; Tue, 11 Jun 2019 07:28:20 -0400
Received: by mail-wm1-x344.google.com with SMTP id g135so2531598wme.4;
 Tue, 11 Jun 2019 04:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hqXHWwI+6YLDY2XPkJyKYaUQ0K7IV5tHdMlx1gZ34CE=;
 b=KHzbqU+RBnzQPi6PE8my31XDM7I8tIJQBemibSIqblOb7XDr+6DOUetrc5L36tbyW6
 8klmUoylaFObVaPCwsMHtZYXWOxeKXIEsTELmmcBkWbNwdKFM4qpBmQN7wsXU//ByAZE
 UgU9rPk4iiGqn1Yqjlez+wPyx6cGv2nW5Nd3m9P+IGOhLzlx9opkQMP6hiCFNefdXqgs
 mjovm9C17WtRyTTal1zWCH7slDKSjzfQnWAY991q7ndVtSlf00ns+ItzClcQf8H2OVWk
 RSczX1WswMlOvjLDfblSYdB4++fwyWnLNDgmid4ZfjtH/DxKMUVen+PKq6rpNyHdmjKh
 3wZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hqXHWwI+6YLDY2XPkJyKYaUQ0K7IV5tHdMlx1gZ34CE=;
 b=KcWS/Hvj8952bn9V9SJe+bwHsJX9Kr2NziUVTV/ulKoUTE1tYv8UmJ8ika7yLmoSHS
 G2eUjT1SUB7rs4LD5Fpj0xJTGmJ9NfHdIMshV7qJJNekABIjInpO6xTQee7US32WembQ
 PKuFtmZJmjdkFkUCEg1sGr9d+5JoqR1LiAFps8FzpBoi6jZ73U8Komu5wznhqbs+o9ch
 awmnldqctqdsifSAtX4B389EnRnwHTFm+8fBx5nRZW40kUbChdveoIsAXFF9sA9u+4zP
 bIVCYwjLo3qSVgOP2N0gWICqGSxbmMXs+JkXkW/BpEg9QQyNrAyezjoTK7FuES3+wQ3P
 PirA==
X-Gm-Message-State: APjAAAViWvw2cvnUUwQ/r8aBToNLul3XSIVqsm5a0PHU0JLyNpeHDSs9
 nemjFcin95UCwK6qlOhnieQGm42QGxCHQp8KQxE=
X-Received: by 2002:a1c:b782:: with SMTP id h124mr17358696wmf.20.1560252498265; 
 Tue, 11 Jun 2019 04:28:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190609100837.17586-1-rfried.dev@gmail.com>
 <04cd3c78-9d8e-8958-1cdf-f65ab7d91dc7@redhat.com>
In-Reply-To: <04cd3c78-9d8e-8958-1cdf-f65ab7d91dc7@redhat.com>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Tue, 11 Jun 2019 14:28:07 +0300
Message-ID: <CAGi-RUJEwpyzFg3qe18CuR+aO1NXX3O8sUBxKyP1ooncFpcOrA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000eb4d98058b0a9736"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] net: cadence_gem: fix
 compilation error when debug is on
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 "open list:Xilinx Zynq" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bq8isG7XtsQi

--000000000000eb4d98058b0a9736
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2019 at 11:34 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat=
.com>
wrote:

> Hi Ramon,
>
> On 6/9/19 12:08 PM, Ramon Fried wrote:
> > defining CADENCE_GEM_ERR_DEBUG causes compilation
> > errors, fix that.
> >
> > Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
> > ---
> >  hw/net/cadence_gem.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> > index 7f63411430..5cc5a71524 100644
> > --- a/hw/net/cadence_gem.c
> > +++ b/hw/net/cadence_gem.c
> > @@ -982,8 +982,8 @@ static ssize_t gem_receive(NetClientState *nc, cons=
t
> uint8_t *buf, size_t size)
> >              return -1;
> >          }
> >
> > -        DB_PRINT("copy %d bytes to 0x%x\n", MIN(bytes_to_copy,
> rxbufsize),
> > -                rx_desc_get_buffer(s->rx_desc[q]));
> > +        DB_PRINT("copy %d bytes to 0x%lx\n", MIN(bytes_to_copy,
> rxbufsize),
> > +                rx_desc_get_buffer(s, s->rx_desc[q]));
>
> Your patch fails on 32-bit hosts:
>
> ./hw/net/cadence_gem.c:987:18: error: format '%lx' expects argument of
> type 'long unsigned int', but argument 4 has type 'uint64_t {aka long
> long unsigned int}' [-Werror=3Dformat=3D]
>          DB_PRINT("copy %d bytes to 0x%lx\n", MIN(bytes_to_copy,
> rxbufsize),
>                   ^
> ./hw/net/cadence_gem.c:39:24: note: in definition of macro 'DB_PRINT'
>      fprintf(stderr, ## __VA_ARGS__); \
>                         ^
> ./hw/net/cadence_gem.c: In function 'gem_transmit':
> ./hw/net/cadence_gem.c:1160:26: error: format '%lx' expects argument of
> type 'long unsigned int', but argument 5 has type 'unsigned int'
> [-Werror=3Dformat=3D]
>                  DB_PRINT("TX descriptor @ 0x%x too large: size 0x%x
> space " \
>                           ^
> ./hw/net/cadence_gem.c:39:24: note: in definition of macro 'DB_PRINT'
>      fprintf(stderr, ## __VA_ARGS__); \
>                         ^
> cc1: all warnings being treated as errors
>
> QEMU provides "HWADDR_PRIx" format for addresses, see for example few
> lines earlier:
>
>     DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", packet_desc_addr);
>
>
> >
> >          /* Copy packet data to emulated DMA buffer */
> >          address_space_write(&s->dma_as, rx_desc_get_buffer(s,
> s->rx_desc[q]) +
> > @@ -1156,7 +1156,7 @@ static void gem_transmit(CadenceGEMState *s)
> >              if (tx_desc_get_length(desc) > sizeof(tx_packet) -
> >                                                 (p - tx_packet)) {
> >                  DB_PRINT("TX descriptor @ 0x%x too large: size 0x%x
> space " \
> > -                         "0x%x\n", (unsigned)packet_desc_addr,
> > +                         "0x%lx\n", (unsigned)packet_desc_addr,
>
> Here the correct format seems to be "%zd" (difference of sizeof).
>
> >                           (unsigned)tx_desc_get_length(desc),
> >                           sizeof(tx_packet) - (p - tx_packet));
> >                  break;
> >
>
> Nowadays QEMU prefers to move from the old DB_PRINT() macros to the
> trace events API, see for example this commit:
>
>
> https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3Dda1804d17a9ed7f060c=
072fbc4889db5fbc9c7d2;hp=3Da4f667b6714916683408b983cfe0a615a725775f
>
> The first line you changed would be replaced by a trace event, while the
> second could be replaced by a qemu_log_mask() call (it is an error
> condition).
>
> Also I suggest to include "QEMU Trivial <qemu-trivial@nongnu.org>" in
> the list of recipients, so your patch might get reviewed/merged quicker.
>
> Regards,
>
> Phil.
>

Hi Phil,
Thanks for the review, I'll send v2 soon.

--000000000000eb4d98058b0a9736
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 11, 2019 at 11:34 AM Phil=
ippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Hi Ramon,<br>
<br>
On 6/9/19 12:08 PM, Ramon Fried wrote:<br>
&gt; defining CADENCE_GEM_ERR_DEBUG causes compilation<br>
&gt; errors, fix that.<br>
&gt; <br>
&gt; Signed-off-by: Ramon Fried &lt;<a href=3D"mailto:rfried.dev@gmail.com"=
 target=3D"_blank">rfried.dev@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/net/cadence_gem.c | 6 +++---<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c<br>
&gt; index 7f63411430..5cc5a71524 100644<br>
&gt; --- a/hw/net/cadence_gem.c<br>
&gt; +++ b/hw/net/cadence_gem.c<br>
&gt; @@ -982,8 +982,8 @@ static ssize_t gem_receive(NetClientState *nc, con=
st uint8_t *buf, size_t size)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 DB_PRINT(&quot;copy %d bytes to 0x%x\n&qu=
ot;, MIN(bytes_to_copy, rxbufsize),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rx_desc_get_b=
uffer(s-&gt;rx_desc[q]));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 DB_PRINT(&quot;copy %d bytes to 0x%lx\n&q=
uot;, MIN(bytes_to_copy, rxbufsize),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rx_desc_get_b=
uffer(s, s-&gt;rx_desc[q]));<br>
<br>
Your patch fails on 32-bit hosts:<br>
<br>
./hw/net/cadence_gem.c:987:18: error: format &#39;%lx&#39; expects argument=
 of<br>
type &#39;long unsigned int&#39;, but argument 4 has type &#39;uint64_t {ak=
a long<br>
long unsigned int}&#39; [-Werror=3Dformat=3D]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DB_PRINT(&quot;copy %d bytes to 0x%lx\n&q=
uot;, MIN(bytes_to_copy, rxbufsize),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>
./hw/net/cadence_gem.c:39:24: note: in definition of macro &#39;DB_PRINT&#3=
9;<br>
=C2=A0 =C2=A0 =C2=A0fprintf(stderr, ## __VA_ARGS__); \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ^<br>
./hw/net/cadence_gem.c: In function &#39;gem_transmit&#39;:<br>
./hw/net/cadence_gem.c:1160:26: error: format &#39;%lx&#39; expects argumen=
t of<br>
type &#39;long unsigned int&#39;, but argument 5 has type &#39;unsigned int=
&#39;<br>
[-Werror=3Dformat=3D]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DB_PRINT(&quo=
t;TX descriptor @ 0x%x too large: size 0x%x<br>
space &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ^<br>
./hw/net/cadence_gem.c:39:24: note: in definition of macro &#39;DB_PRINT&#3=
9;<br>
=C2=A0 =C2=A0 =C2=A0fprintf(stderr, ## __VA_ARGS__); \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ^<br>
cc1: all warnings being treated as errors<br>
<br>
QEMU provides &quot;HWADDR_PRIx&quot; format for addresses, see for example=
 few<br>
lines earlier:<br>
<br>
=C2=A0 =C2=A0 DB_PRINT(&quot;read descriptor 0x%&quot; HWADDR_PRIx &quot;\n=
&quot;, packet_desc_addr);<br>
<br>
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Copy packet data to emulated DMA =
buffer */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 address_space_write(&amp;s-&gt;dma_a=
s, rx_desc_get_buffer(s, s-&gt;rx_desc[q]) +<br>
&gt; @@ -1156,7 +1156,7 @@ static void gem_transmit(CadenceGEMState *s)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tx_desc_get_length=
(desc) &gt; sizeof(tx_packet) -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(p - tx_packet)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DB_PRINT=
(&quot;TX descriptor @ 0x%x too large: size 0x%x space &quot; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0&quot;0x%x\n&quot;, (unsigned)packet_desc_addr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0&quot;0x%lx\n&quot;, (unsigned)packet_desc_addr,<br>
<br>
Here the correct format seems to be &quot;%zd&quot; (difference of sizeof).=
<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0(unsigned)tx_desc_get_length(desc),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(tx_packet) - (p - tx_packet));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<b=
r>
&gt; <br>
<br>
Nowadays QEMU prefers to move from the old DB_PRINT() macros to the<br>
trace events API, see for example this commit:<br>
<br>
<a href=3D"https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3Dda1804d17a=
9ed7f060c072fbc4889db5fbc9c7d2;hp=3Da4f667b6714916683408b983cfe0a615a725775=
f" rel=3D"noreferrer" target=3D"_blank">https://git.qemu.org/?p=3Dqemu.git;=
a=3Dcommitdiff;h=3Dda1804d17a9ed7f060c072fbc4889db5fbc9c7d2;hp=3Da4f667b671=
4916683408b983cfe0a615a725775f</a><br>
<br>
The first line you changed would be replaced by a trace event, while the<br=
>
second could be replaced by a qemu_log_mask() call (it is an error<br>
condition).<br>
<br>
Also I suggest to include &quot;QEMU Trivial &lt;<a href=3D"mailto:qemu-tri=
vial@nongnu.org" target=3D"_blank">qemu-trivial@nongnu.org</a>&gt;&quot; in=
<br>
the list of recipients, so your patch might get reviewed/merged quicker.<br=
>
<br>
Regards,<br>
<br>
Phil.<br></blockquote><div><br></div><div>Hi Phil,</div><div>Thanks for the=
 review, I&#39;ll send v2 soon.</div><div>=C2=A0</div></div></div>

--000000000000eb4d98058b0a9736--
