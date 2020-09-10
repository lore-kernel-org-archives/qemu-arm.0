Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1572422lfq;
        Thu, 10 Sep 2020 11:59:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwH8yYo4+nt6sknyJzUyg5DC8LpXavx9bt3NnA8KTt9Y4SfKJj4Xme0KWOUMhkOd0zShvTC
X-Received: by 2002:a5b:501:: with SMTP id o1mr15955799ybp.447.1599764352663;
        Thu, 10 Sep 2020 11:59:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599764352; cv=none;
        d=google.com; s=arc-20160816;
        b=aEaLPRHB61oLENxihssbCL9IywE4K+rjuvddPGqdmSB/TSevqgfNmdSP5Sp8ipFh8l
         EhGne1RyqWLgqgY6V2MnR/LGgYQvDVtiEsvrdCgxQifXGTKmPHUTwprzg1B6nb/7F8Lb
         17YPCljVgBuF8dJubvbFkpWEAdpCQwro1uvzV1syt88rtJIDfDalVq2NbihSsuUBfpKK
         HoXF9KQvMMBF6eBnMiNN3RH3/KmaNw3oysA5Ggxw7CJx/ipfMp2r2/vyaJvdEhLE8rhQ
         n4fFQDyFd6TT4jN1JKzd8bLchyVhyh6YXXpQ8ZNsGzTpUYGlGvYzhUe3QLWvxUNAAbrw
         5Yag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YcmYaXhfixz5ddsOGSwvmxYwdRuiLXgyqooVsbx2RsA=;
        b=w0bfH7g3D+mS+cMbfGwfFPSxq2HYyog1fTJ8eadaQ/qCV7r05RhdYhhUvOnkcmq3rp
         03ZotrbywI9X4Pr7hB6jnhTlQUcnw5cc9Bp3M118c7Jkn/ft5dQ8VgZkp0mjHgCV6O55
         Y+m8OF448I46DLXhMUVTUnP3kUMN25pQ+aKpvfap9vGxdqwi0FR3Cl+ArsJR1OVJMeIT
         Hp6EBPw742lcvnQZifqs5w8lQMtG3vzjF1G4kkkRisuUJvqbP0gYHz06Wy8R3L/MBBXh
         6KqOJAyuebEZmuHxRpRa98aNYkxDCKktL5WwcB1pjCl35RvjQZiJkvKY4Vkjk2BdPh0f
         T3sA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=uFQtGKva;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h68si6862581ybi.351.2020.09.10.11.59.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Sep 2020 11:59:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=uFQtGKva;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kGRmq-00048r-2Z
	for alex.bennee@linaro.org; Thu, 10 Sep 2020 14:59:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <derrick.mckee@gmail.com>)
 id 1kGRe0-0005dy-Ip; Thu, 10 Sep 2020 14:50:04 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:46502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <derrick.mckee@gmail.com>)
 id 1kGRdy-0007F9-Mt; Thu, 10 Sep 2020 14:50:04 -0400
Received: by mail-qk1-x734.google.com with SMTP id f142so7111829qke.13;
 Thu, 10 Sep 2020 11:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YcmYaXhfixz5ddsOGSwvmxYwdRuiLXgyqooVsbx2RsA=;
 b=uFQtGKva3Nc22LbxNEI4S+TAX8cAYNjtzC4n8b5puBpLH2vgRuQnAiOmYGpwFaNa/+
 2XzVhl+zwJ9W+JmTj8cmkzHT+FAYpHVcvgY30SXZqBsCBBtGKlAM7dBNjrWyp2UsUWsQ
 0tBCe+gCDTJNq1pdU0C0x+6P1xuNoyGYfNRLUtosYUVQNj7UnorFLGh2eDN97iLEmytt
 WdQuTuf2eDMwt2xfOcfbjHOiTVJ43M5ZjxjXrd4D7l/Blo6h5+WDezJrOwsR4GHJQrw+
 uz3UNtrWlF1+SrCEUXvoWShzHtycmYwHwUacQcK+YcFeq6rfRZHBHIHepjjoC6p/lrMs
 SwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YcmYaXhfixz5ddsOGSwvmxYwdRuiLXgyqooVsbx2RsA=;
 b=B/N/U0A1QGSq6NyZk1EERPJolm9K4s4h1Ys9UyblYkcr4OjZoGFHUua5iRn0QUTisD
 i3ToG8H1n39gcf0LIKSXw8hdta9CF4EBjFEzYZOcM4VQgSv5s5ZaoDIMVqEl7LCSD1bV
 vNZUAvl8R/uFrJZdpSxSnB8bLSnj0NIv3vsyiK5vceKlgHmugy08+20jkf4MQ7ZgHWba
 Xajzi8/FlC6gioQfONCcEr2uscpKR9W8XEya012y7GhjNmjFpxnYiywlKERIKCU2NUcN
 bt0xk/U+ru2xLpC/mDpL54IpLe5KrBbjpIdUvz6+fFim1Wm0YyCq8s1QkWjdCNv/HBWX
 1NIQ==
X-Gm-Message-State: AOAM530Eh9gR1beFRoRmidfHqbkSCnuO4XNTDbrVjDzdZUOu1AnodGvZ
 gF40HHUEa6MCpsCmZBQD9CprBrttsK7Er7dx2Ds=
X-Received: by 2002:ae9:f40d:: with SMTP id y13mr9320224qkl.165.1599763801003; 
 Thu, 10 Sep 2020 11:50:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAJoBWHwtE+HWkoj3a2pdYHOkPpG7ya=+-RRFvUp-SXwuTWvm5g@mail.gmail.com>
 <CAFEAcA8spQVin2vj2V5DJYQCR_BizqrRneoRMKhqKAzFv8EiMg@mail.gmail.com>
 <20200910174346.6y24jkyd7ca4xuoz@kamzik.brq.redhat.com>
 <CAFEAcA8OszXLXPNsRt68pQQ6SQVG+-PYduOqGpodqKk+fi6rqA@mail.gmail.com>
In-Reply-To: <CAFEAcA8OszXLXPNsRt68pQQ6SQVG+-PYduOqGpodqKk+fi6rqA@mail.gmail.com>
From: Derrick McKee <derrick.mckee@gmail.com>
Date: Thu, 10 Sep 2020 14:49:49 -0400
Message-ID: <CAJoBWHzZGq7NC-G=QU+Bwg9mWRw+rBw6T+af0Y9ZH+7uwXXDEw@mail.gmail.com>
Subject: Re: Master cannot execute MTE instructions
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000155d3705aefa0960"
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=derrick.mckee@gmail.com; helo=mail-qk1-x734.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, "open list:ARM" <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sWsdZlWwxamS

--000000000000155d3705aefa0960
Content-Type: text/plain; charset="UTF-8"

Thanks for the help. The virt,mte=on did it!

On Thu, Sep 10, 2020 at 1:49 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Thu, 10 Sep 2020 at 18:43, Andrew Jones <drjones@redhat.com> wrote:
> >
> > On Thu, Sep 10, 2020 at 05:17:17PM +0100, Peter Maydell wrote:
> > > What QEMU command line are you using to run this?
> > > In particular, MTE is not enabled by default, so you need
> > > "-cpu max,mte=on" or similar, is not enabled for any
> > > board except 'virt', and doesn't work with KVM, only TCG.
> >
> > Actually I think the 'max' cpu type has it enabled by default, but you
> > need '-machine virt,mte=on' for it to work.
>
> Oops, yeah -- I remembered we disabled it by default somewhere
> but forgot where the enable was.
>
> thanks
> -- PMM
>


-- 
Derrick McKee
Phone: (703) 957-9362
Email: derrick.mckee@gmail.com

--000000000000155d3705aefa0960
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the help. The virt,mte=3Don did it!<br></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, =
Sep 10, 2020 at 1:49 PM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@l=
inaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On Thu, 10 Sep 2020 at 18:43, Andrew Jon=
es &lt;<a href=3D"mailto:drjones@redhat.com" target=3D"_blank">drjones@redh=
at.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Thu, Sep 10, 2020 at 05:17:17PM +0100, Peter Maydell wrote:<br>
&gt; &gt; What QEMU command line are you using to run this?<br>
&gt; &gt; In particular, MTE is not enabled by default, so you need<br>
&gt; &gt; &quot;-cpu max,mte=3Don&quot; or similar, is not enabled for any<=
br>
&gt; &gt; board except &#39;virt&#39;, and doesn&#39;t work with KVM, only =
TCG.<br>
&gt;<br>
&gt; Actually I think the &#39;max&#39; cpu type has it enabled by default,=
 but you<br>
&gt; need &#39;-machine virt,mte=3Don&#39; for it to work.<br>
<br>
Oops, yeah -- I remembered we disabled it by default somewhere<br>
but forgot where the enable was.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Derrick McKee<br>Phone: (703) 957-9362<br>Email: <a href=3D=
"mailto:derrick.mckee@gmail.com" target=3D"_blank">derrick.mckee@gmail.com<=
/a><br></div>

--000000000000155d3705aefa0960--
