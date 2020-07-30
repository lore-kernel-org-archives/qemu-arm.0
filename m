Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2879505lfy;
        Thu, 30 Jul 2020 13:06:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfJV4UEs3wL7qaTS5pB2XlyshJduK/7cJuHhBH1Jpxs4Vb6sB6ErMKjUIjmvzkPTytW/vT
X-Received: by 2002:a25:da4c:: with SMTP id n73mr914772ybf.306.1596139618075;
        Thu, 30 Jul 2020 13:06:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596139618; cv=none;
        d=google.com; s=arc-20160816;
        b=Z20ubud9bTcK2HPjixwAk8JiKFAxFT2McE59obObdk+ZVZ7HRkhGvchzvFdjCeXRGE
         VjxYhDJPujX/xbX9pcYVEQdseQOMnlkXpytxPUeO/JM7yNl1ViyQShxRdSYStQIWwYn3
         7zbC/lZQSSnNmGTCITi1iMhcalcNwtIvbXw5E/lBxrU8Lp1zsjWN9SLnCjAmspJlf9O5
         4rfSEMCmXvKH+nsSk3cLX66aF04aqCJoos7NowA4LGAmgYeH8rlQZR4pTc6exCfGIhsG
         LulTEc+OzQ0Mszua/8i5DR+Kez44yRALH/CqWHrlzTUO9AOhd84h7LleSEERFFFEOeFX
         +2Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5bRKlD5GyuTbaDl8cqqqG7E28GXFye3WnW+CpzaMM8U=;
        b=X3ssieF/2tFf3rrbWT0BlWfJTjTZrPezNJICEROlfw4j7NzLGJ6jjPa4ho17Jy1IMA
         FVRKGNZ7yBW8E8dipnZ+UAPVLSYIQpReew2sigxfRf95mda1xVw67uPgXCHu8jwI590p
         0YW96vhHXz32VH142s6u54sKw26Yvycf2bsU5EMAcfJ63vl8pwlXhMArlFU+jnltLEH0
         AdFGQP/YiBtMI9M2tb4LzfhkX7CFd3QEBmqpKYwD6TB6V7l45OEjyIjXNh1Xx3cbsHTz
         d7fczT7HsyDcSXmd9cG/F06ZPu2mi3gajqzmj4OJuvaNPL6NyWC/jaK6lZESZRT+dUdX
         GROg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=tKLvqDDe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 128si5243545ybd.260.2020.07.30.13.06.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jul 2020 13:06:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=tKLvqDDe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k1EpN-0005mp-Ha
	for alex.bennee@linaro.org; Thu, 30 Jul 2020 16:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <derrick.mckee@gmail.com>)
 id 1k1EpF-0005lT-Ta
 for qemu-arm@nongnu.org; Thu, 30 Jul 2020 16:06:50 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:46138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <derrick.mckee@gmail.com>)
 id 1k1EpD-0001Ah-S6
 for qemu-arm@nongnu.org; Thu, 30 Jul 2020 16:06:49 -0400
Received: by mail-qk1-x72c.google.com with SMTP id d14so26786716qke.13
 for <qemu-arm@nongnu.org>; Thu, 30 Jul 2020 13:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5bRKlD5GyuTbaDl8cqqqG7E28GXFye3WnW+CpzaMM8U=;
 b=tKLvqDDeREf8kS5RTHOob1edb5gJGeO9l8+GsxIUZlneqTyo+/grVKd4gWmDidHqls
 WXfz7rHZfqWbZK5OgMiJfg/dtj2eCsb3KLGvh1x5br4n8QmRD64pqan96wROltKu8vDc
 xrsWCTL/Q6ZctKMVIv1Bp4mO1ivgdEBIjOoLpB5sKEuef+CdSEhus+avbR0rYHLgowSy
 4MlSvHOleYR7bNwLz2vTBYUHdvWd1MZvTKWk1GRK+9EH+oAMOZnViuGytwol/TU5QBlF
 jInxIcnCyJpC75Tgzi4NKBM6khmAE2NT9xz4ADDiPl/zrLfIi1rornA0czWdTErZAoVi
 rpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5bRKlD5GyuTbaDl8cqqqG7E28GXFye3WnW+CpzaMM8U=;
 b=m254KbRammVqWmtBaSilHKANFGIQM8X9uYQXoiFWGn9c/PFWU250rJPfi1YrgHqvC3
 DsXe/SDLfTLr+sukCdmSOvmf0sWL2s6o3EYFzKJMcQVNsPcJ4pqkUP5lChX1fVgDu8PH
 9O5nNdM8GQr7VCn8Y+dYKEsgoB8+v+CC8Njd9nejJkRekW03DFGVzAbNODj7UGWTUP32
 1kro/LxqJo+wtus3Y4eXS7rcT4CiK7WqzGr4LmQIrB9QjwTr/6d9SPHr0uq6OC6bIRcJ
 KZP0+GFax8DUTHznlaGAxEa7C1gpBKpG8dx9i2RafS5xzFy7ImH6DY1SEsge8muydv0v
 owMQ==
X-Gm-Message-State: AOAM530uBZJ6VLxe6CYOUnMAu9hsPzTLa0jLVdLbakSgugYVhSz2QA0A
 Hqda7FZtQjj8gYpXVe8xLwwdjy4Y6FFhL49CUjE=
X-Received: by 2002:a37:a98c:: with SMTP id s134mr832303qke.397.1596139605439; 
 Thu, 30 Jul 2020 13:06:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAJoBWHzJq-51dBxP8pniQPd7fy7J+jU2gHwZOkn-NRJzc5uNiQ@mail.gmail.com>
 <CAFEAcA9XmXhp+Crx09k++Ryd3jSL8U36FSMvw6X73sBFEmiofw@mail.gmail.com>
In-Reply-To: <CAFEAcA9XmXhp+Crx09k++Ryd3jSL8U36FSMvw6X73sBFEmiofw@mail.gmail.com>
From: Derrick McKee <derrick.mckee@gmail.com>
Date: Thu, 30 Jul 2020 16:06:33 -0400
Message-ID: <CAJoBWHypu+nJ4L3fE-tQzr_EWf294THGQkovTrn+j5iQ+b4MyA@mail.gmail.com>
Subject: Re: Differing PAC behavior between Qemu and Arm FVP
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000031b74905abae361c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=derrick.mckee@gmail.com; helo=mail-qk1-x72c.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cREHtoGZkeB2

--00000000000031b74905abae361c
Content-Type: text/plain; charset="UTF-8"

Hi Peter,

I just got a SIGILL trying to execute a stg instruction with the QEMU
version later in this thread, but the same instruction works correctly on
the FVP.  Are you sure that all the MTE functionality is present in the
master head?

On Tue, Jul 28, 2020 at 11:32 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Tue, 28 Jul 2020 at 16:26, Derrick McKee <derrick.mckee@gmail.com>
> wrote:
> >
> > Hi,
> >
> > I think I may have found a behavior different from Qemu's system
> emulation and Arm's FVP, which is supposed to provide exact hardware
> behavior.  The Qemu commit I am using is
> ed67b09529a564d2ceb242a7cb02613bbe0fa3ca from the tgt_arm_mte branch and
> the FVP is the freely available FVP_Base_RevC-2xAEMv8A from Arm's website.
>
> MTE should all be in master now, does the behaviour still reproduce there?
>
> thanks
> -- PMM
>


-- 
Derrick McKee
Phone: (703) 957-9362
Email: derrick.mckee@gmail.com

--00000000000031b74905abae361c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Peter, <br></div><div><br></div><div>I just got a =
SIGILL trying to execute a stg instruction with the QEMU version later in t=
his thread, but the same instruction works correctly on the FVP.=C2=A0 Are =
you sure that all the MTE functionality is present in the master head?<br><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Tue, Jul 28, 2020 at 11:32 AM Peter Maydell &lt;<a href=3D"mailto:p=
eter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 28 Jul 2020 at 16:=
26, Derrick McKee &lt;<a href=3D"mailto:derrick.mckee@gmail.com" target=3D"=
_blank">derrick.mckee@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; I think I may have found a behavior different from Qemu&#39;s system e=
mulation and Arm&#39;s FVP, which is supposed to provide exact hardware beh=
avior.=C2=A0 The Qemu commit I am using is ed67b09529a564d2ceb242a7cb02613b=
be0fa3ca from the tgt_arm_mte branch and the FVP is the freely available FV=
P_Base_RevC-2xAEMv8A from Arm&#39;s website.<br>
<br>
MTE should all be in master now, does the behaviour still reproduce there?<=
br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Derrick McKee<br>Phone: (703) 957-9362<br>Email: <a href=3D=
"mailto:derrick.mckee@gmail.com" target=3D"_blank">derrick.mckee@gmail.com<=
/a><br></div>

--00000000000031b74905abae361c--
