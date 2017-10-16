Received: by 10.223.197.9 with SMTP id q9csp3333399wrf;
        Mon, 16 Oct 2017 02:44:12 -0700 (PDT)
X-Received: by 10.55.221.68 with SMTP id n65mr13017427qki.27.1508147052014;
        Mon, 16 Oct 2017 02:44:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508147052; cv=none;
        d=google.com; s=arc-20160816;
        b=GED7dyJ2ygvJs8ZKpT6H9xhtiSD3rYsIl/87cVMIrirLA/S+BduIFIaKYuo15VkAmd
         /44Wy/XLU9E3b44GvGYXJ4Ep7ou7xmxXlnmtmrxqkcCWz3LqRRJe6f7vqi/oOD2Cashe
         aac8SRwylcJrNLsub7pdORoZK/Qr83fOzolLdiVF3ebGZV5oaZ7AJUCAzNSGkEK+T9gz
         YZpzYLjXTcxHQWKtDMJ1+Xxax95rCZnpKK7HG+MNpYAMLkbZDk0RQ4mRDCLA6VcAno7l
         gWcTIu3evPhGpmbp7yVPXE0Ov/6WtIuiA/C3fkrZRS14NFLfUIcW8opnC5gGvmBoxbd1
         giuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=spluKzKbbEFcCwVIRQKlSpxqx9SR3oTbk9hAZnO5B8Q=;
        b=HCIKUfj2LlQX7iimjQI0Eps9aSXCN0ODI6IkPrZuQAG0IIriiRajIwwhb59XFb2Wov
         Sufv2dnuN7xx9vT3xiLj2swv1SmPTq5u8jt7OqZe/n1nlzF6ADC2YV+DyiM9vadtvel8
         rwkNrNpBo9rphGNFs6smh31dNrluOO671TgNrbNpfM664U/uc3KACvxqETZhnDfHVukN
         I0vSb7/GlPqgTxVb3Q2n87nESp4ytjeI4itVj1kzUt7G3qdz+f/onop4i21vfm60HKzG
         Zcj0mjtPY1ddTsRL1TWLrUjkdNuUwFRILab+XzAdjfGwPBuCj0NnPK05z/9AetTAzEsh
         iRNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NgurEhxp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j35si201574qta.368.2017.10.16.02.44.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Oct 2017 02:44:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NgurEhxp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60208 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e41wP-0005zM-PD
	for alex.bennee@linaro.org; Mon, 16 Oct 2017 05:44:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1e41wG-0005xt-FC
	for qemu-arm@nongnu.org; Mon, 16 Oct 2017 05:44:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1e41wF-0001J3-B9
	for qemu-arm@nongnu.org; Mon, 16 Oct 2017 05:44:00 -0400
Received: from mail-ua0-x22d.google.com ([2607:f8b0:400c:c08::22d]:54523)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1e41wC-0001He-B6; Mon, 16 Oct 2017 05:43:56 -0400
Received: by mail-ua0-x22d.google.com with SMTP id n38so9247472uai.11;
	Mon, 16 Oct 2017 02:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=spluKzKbbEFcCwVIRQKlSpxqx9SR3oTbk9hAZnO5B8Q=;
	b=NgurEhxpaB5UvT/GLXy6K2UlulqcR+IPz+LZV3EtrvLq2jwmKKc6/TYMq2dYvOiyk3
	QRtpriQgVhyo5aSlU2xxOkqaLxSO+kPnvH1Xr+CZxpIVIZu0TUF9CURqRDLuSfuCXomg
	iONhMnubDeZ+D3v5L6Mrdq9zOyTVnWYO7j6vKI6zc8CofsrZEHYVExK8bT+x9RR6u01w
	XPBFCPxXlI05kbMCXidXc47HDS1bzkjVeIuZmQnttluDbrWwG3mQAwheqjk34UAB2K4v
	x7F1o9co78HS0/dxk31jWOsTaPE9ryv5vXH7Tc/NOONHJLXhruM5V/MBWMDohMYWTsrA
	FO6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=spluKzKbbEFcCwVIRQKlSpxqx9SR3oTbk9hAZnO5B8Q=;
	b=anUdmi6/Qn7vakK3oEr48T9qDqm2YgKe1SUpKNdOhM7rCcb8NqvKEdgWBPffd1vqDr
	39TnoAXv5FJPeGYy8mNjMsOPrJJuvbPEvXt6JMdnomI5WceDwPYrtCVd+OEIYczY+eM6
	8cdnSOuuvvnWZGYk0oxt3JQAEO209c5VoBSgnylZutWmU8c7aBvWnbi9yl0CZFIv8t6r
	OLfFI3xYBodVjm3k8RDJQFiQEbhp7F/OmU6nAZcD4/1qZBQ1G/4iYQIKKXa72r/Qq99D
	8acESMdjG+sVMzoFKTXNxhq/PTKXm9NC51H7cPtgBV8fjN5lwqUtoIvkmAATbFJYeABW
	a67w==
X-Gm-Message-State: AMCzsaVY6zdlvYa4+3UQ6KHGfBUVU39jRwgfKmVo50xyEzJCCxuh1tIv
	QnHiEWfNlP3jw15qIN8xHDEuy4jLSIc4bUzV/hg=
X-Google-Smtp-Source: AOwi7QCR6Am2lXjvg5RCKLuRLzstk8fHZ73kn9uCKi6XVtzUDkCQ8ffKtQBljJjHQzef3wCdOdQtZQun2URybGsrngo=
X-Received: by 10.176.79.42 with SMTP id n42mr7007991uah.158.1508147034375;
	Mon, 16 Oct 2017 02:43:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.63.6 with HTTP; Mon, 16 Oct 2017 02:43:53 -0700 (PDT)
In-Reply-To: <CAFEAcA_wci=BT69jDM6uNa=JCM=b5GD4pO2vRQUNi6cX-B1QGA@mail.gmail.com>
References: <20170920201737.25723-1-f4bug@amsat.org>
	<20170920201737.25723-4-f4bug@amsat.org>
	<CAFEAcA_wci=BT69jDM6uNa=JCM=b5GD4pO2vRQUNi6cX-B1QGA@mail.gmail.com>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Mon, 16 Oct 2017 15:13:53 +0530
Message-ID: <CALHRZuoc9ddSfcwSK+4Le+k8DP6B5nhBfbKuVK_D-hNXcmFzNQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="f403043c6d1c40cc2c055ba6d89a"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c08::22d
Subject: Re: [Qemu-arm] [PATCH v11 3/5] msf2: Add Smartfusion2 SPI controller
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
Cc: Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oWEI0UxBmYE6

--f403043c6d1c40cc2c055ba6d89a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Tue, Oct 10, 2017 at 6:24 PM, Peter Maydell <peter.maydell@linaro.org>
wrote:

> On 20 September 2017 at 21:17, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>
> wrote:
> > From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> >
> > Modelled Microsemi's Smartfusion2 SPI controller.
> >
> > Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> > Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
> > Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> > +#define FRAMESZ_MASK         0x1F
>
> > +static void set_fifodepth(MSSSpiState *s)
> > +{
> > +    unsigned int size =3D s->regs[R_SPI_DFSIZE] & FRAMESZ_MASK;
> > +
> > +    if (size <=3D 8) {
> > +        s->fifo_depth =3D 32;
> > +    } else if (size <=3D 16) {
> > +        s->fifo_depth =3D 16;
> > +    } else if (size <=3D 32) {
> > +        s->fifo_depth =3D 8;
> > +    } else {
> > +        s->fifo_depth =3D 4;
> > +    }
> > +}
>
> Hi. Coverity points out (CID 1381483) that the "else" case here
> is dead code, because the FRAMESZ_MASK of 0x1F means that size
> cannot be 32 or more.
>
> Paolo kindly checked up with the spec at
> https://www.eecs.umich.edu/courses/eecs373/readings/Actel_SmartFusion_MSS=
_
> UserGuide.pdf
> which says that this register's field is bits [5:0] which
> would imply an 0x3f mask is needed. On the other hand it also
> says that "maximum value is 32", so what is the else clause
> doing anyway?
>

I will remove the else, change mask to 0x3F and add check for max 32 in
spi_write:
  case R_SPI_DFSIZE:
        if (s->enabled || (value &  FRAMESZ_MASK) > 32) {
            break;
        }
        s->regs[R_SPI_DFSIZE] =3D value;
        break;

Thanks for pointing out.
Sundeep


>
> thanks
> -- PMM
>

--f403043c6d1c40cc2c055ba6d89a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Peter,<div class=3D"gmail_extra"><br><div class=3D"gmai=
l_quote">On Tue, Oct 10, 2017 at 6:24 PM, Peter Maydell <span dir=3D"ltr">&=
lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank">peter.mayd=
ell@linaro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><span class=3D"gmail-">On 20 September 2017 at 21:17, Philip=
pe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.or=
g</a>&gt; wrote:<br>
&gt; From: Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep.lkml@gmail.com">=
sundeep.lkml@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Modelled Microsemi&#39;s Smartfusion2 SPI controller.<br>
&gt;<br>
&gt; Signed-off-by: Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep.lkml@gm=
ail.com">sundeep.lkml@gmail.com</a>&gt;<br>
&gt; Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@x=
ilinx.com">alistair.francis@xilinx.com</a>&gt;<br>
&gt; Tested-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@ams=
at.org">f4bug@amsat.org</a>&gt;<br>
<br>
</span>&gt; +#define FRAMESZ_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x1F<br>
<span class=3D"gmail-"><br>
&gt; +static void set_fifodepth(MSSSpiState *s)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 unsigned int size =3D s-&gt;regs[R_SPI_DFSIZE] &amp; FR=
AMESZ_MASK;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (size &lt;=3D 8) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;fifo_depth =3D 32;<br>
&gt; +=C2=A0 =C2=A0 } else if (size &lt;=3D 16) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;fifo_depth =3D 16;<br>
&gt; +=C2=A0 =C2=A0 } else if (size &lt;=3D 32) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;fifo_depth =3D 8;<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;fifo_depth =3D 4;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
<br>
</span>Hi. Coverity points out (CID 1381483) that the &quot;else&quot; case=
 here<br>
is dead code, because the FRAMESZ_MASK of 0x1F means that size<br>
cannot be 32 or more.<br>
<br>
Paolo kindly checked up with the spec at<br>
<a href=3D"https://www.eecs.umich.edu/courses/eecs373/readings/Actel_SmartF=
usion_MSS_UserGuide.pdf" rel=3D"noreferrer" target=3D"_blank">https://www.e=
ecs.umich.edu/<wbr>courses/eecs373/readings/<wbr>Actel_SmartFusion_MSS_<wbr=
>UserGuide.pdf</a><br>
which says that this register&#39;s field is bits [5:0] which<br>
would imply an 0x3f mask is needed. On the other hand it also<br>
says that &quot;maximum value is 32&quot;, so what is the else clause<br>
doing anyway?<br></blockquote><div><br></div><div>I will remove the else, c=
hange mask to 0x3F and add check for max 32 in spi_write:</div><span style=
=3D"font-size:12.8px">=C2=A0 case R_SPI_DFSIZE:</span><br style=3D"font-siz=
e:12.8px"><span style=3D"font-size:12.8px">=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (=
s-&gt;enabled || (value &amp;=C2=A0=C2=A0</span>FRAMESZ_MASK)=C2=A0<span st=
yle=3D"font-size:12.8px">&gt; 32) {</span></div><div class=3D"gmail_quote">=
<span style=3D"font-size:12.8px">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
break;</span><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px=
">=C2=A0 =C2=A0 =C2=A0 =C2=A0 }</span><br style=3D"font-size:12.8px"><span =
style=3D"font-size:12.8px">=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_DFS=
IZE] =3D value;</span><br style=3D"font-size:12.8px"><div><span style=3D"fo=
nt-size:12.8px">=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;</span></div><div><br></d=
iv><div>Thanks for pointing out.</div><div>Sundeep</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br></div></div>

--f403043c6d1c40cc2c055ba6d89a--
