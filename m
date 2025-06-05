Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp290688njc;
        Thu, 5 Jun 2025 07:32:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVogfO1N/k5Ce5MLrwDPWjsDVXffPjs5zReMmp8qBa6sMNxHVSMZ4Dm63U5HZ89WR8zH3cMCCSIYou0rQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEMLLpxOre5bRiqrq0CoUcJztszI0TpdvOVogwmS93dfMhqJxyHG0z3nFYAoWutm+/Xs8Uv
X-Received: by 2002:a05:622a:1b1c:b0:4a4:3963:1e10 with SMTP id d75a77b69052e-4a5a576ed58mr123154771cf.13.1749133933660;
        Thu, 05 Jun 2025 07:32:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749133933; cv=none;
        d=google.com; s=arc-20240605;
        b=iaOJv12OqMfL5lrnXgChxR5fwQxfhNC2wknCHvuj34tv2M0IRDZXtIJiZiySZfgTiF
         Mh8DOgbxNQdtyW6ljsd3DAMzPuXySasnQBzsICj1CwYYWj8SQvB8DPMB9c8OjeDl/71w
         JtY9fE4eaNIpV/TLjFGQwKb3SWy8yhfXnRmSAd0iycOtTe7LKUA6MQA/vo2EXttO5LC2
         OWgcyUgES7CJcmDSx4Ua/k7vLuME3sXfsdNmDS5PPDb87PqTXysh2dUmvy0Z/lR+yUZ+
         siZ7RAgA5LKH9la8XHXp+Bew/glUJMxVlNmJvV1438g82LI0YMH+AV+/0DOh103tHCMb
         ty+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=pJ8Ss0xzwWF59ezoHUUP4X8z0cf+5bPuYM3CJxB7hEo=;
        fh=KcGxQl0RsTbeKlH3wW7JwdXaXWip7NG6hKI2/LcTcg0=;
        b=j84F4lCqdNgmBOotfeq6yGJY5s1+m9ntSH21GlVT7p2LOher+td32CClprox6byR1N
         4qtijvdpXaYDoKm5V6qNdHUizemepZBMAdeCn3qwG4PrdhmMV2n91YHG/dbFcq6Epo9h
         MxyLNiR0a/u9tgIejvbI5RM+8L6uVW+MhBj3l1cvdPYOhj0ExXx2m1dtQMuSIjbgxSga
         9hAewdqSHr1ArZNxBEFAMdydjnf+FQ77Wldu7v3HLVxJytF7fSQzBsvalJRiLFPYP5ug
         KQniwrmJUQWG3dshAM+bq0yjtpW3N9gxTPcKFzQ1Pr8ydzn+C0a4VHfDV4GV/wjFbYA7
         VYCA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=AQlLV7gj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4e6444217b6si5885838137.47.2025.06.05.07.32.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jun 2025 07:32:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=AQlLV7gj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uNBdH-0003DJ-0x; Thu, 05 Jun 2025 10:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cocotroupe20@gmail.com>)
 id 1uNBcw-0003CD-Ce; Thu, 05 Jun 2025 10:31:38 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cocotroupe20@gmail.com>)
 id 1uNBcu-0003Tf-9X; Thu, 05 Jun 2025 10:31:30 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-442fda876a6so8448255e9.0; 
 Thu, 05 Jun 2025 07:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749133884; x=1749738684; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pJ8Ss0xzwWF59ezoHUUP4X8z0cf+5bPuYM3CJxB7hEo=;
 b=AQlLV7gjuggp5U+NXd5sUwgWVB/EyW8wk+ap5eNhu1G+DlSyYwgcguWUiWzastv/bH
 0Qx0yxA73ztzCyqXe4aKd6JGY08gGZPamuWkDsu3ZtCIUHB53yfJridaSUo5kAHn/b12
 idA7rI+eK2xPdw7/laDsvxWIaqozm0sT2QZ7Oo4NAbcHtwijQhIKsDO6XPu1w137nWUE
 hoxjbWSnsesOrG/Ndx/3pjoovLav+Ckz+UajNy7gWAKzmNlz3NDEO/7sAiVoAZRzkovi
 /daS6hW6bXWgWzm7OC/Mc6whukcl86w7SA3voznV2va2drc2Cd3N42rVIFBbwQunvHhq
 SevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749133884; x=1749738684;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pJ8Ss0xzwWF59ezoHUUP4X8z0cf+5bPuYM3CJxB7hEo=;
 b=e6/Wis2OWpE/HDTWeA6aKYwVBy2C4j7Wk6Kno1/iTIJ3b1e5WLLKfTJqRqmcqgeLYv
 6GL4Te9DshwRvEuQPkrehspYTOTrIekoS6pus5U15yA5xhxR1fBQclqkmU7GqkXZK5dc
 o4pTrCfR7nuAYYsjdGCsiexPTQi6UQtFJQjYZYnGSCWinaqaamObLWPi8lCScmxoNhVo
 HQk6OZCcEH5efEiHmiUZ+dsP5vXh5elKh8uaxuVInZ9MNYgn1SVOfBYPb2/8PF9JX96o
 AfMOiMg+yADmhd6CCz5OwJl5ziSdOTacAvLPRtInAQQbxHiwmmyKv4TIgjpm/5Rudlq0
 QCbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXmf2HLCrCwwbJGKCfVNXi4VIa0vjYB+4kaMem9PAju30pasiiZ3U+uFJahrGj37hHf5MHlaVnwAn6QKo=@nongnu.org,
 AJvYcCWzEPQzVD6We7ELJR6dkJBnndkXwl47MJtDPixqr3dqQriEgSpsgXcA8R0Dl965XLnFphfB0HxHYY6I@nongnu.org
X-Gm-Message-State: AOJu0YxjR10M6uvYJNK7E8WCQvRR7mBnbIrFcnw3KwBRb6gf6B0gPeoT
 M3Sa7CjT9Y6iT6Mf9RGST2NwPeAa2pCo4z/UW4pscYA2LfVj2YzVko4eWM53OYbh79n092pM/Ft
 eYGVFxBkdurdV82/VrDBfzG5QJ+RPieo=
X-Gm-Gg: ASbGncv9X3q5OsfT2Zjmus8eCcEDa1xoD7hyVMnZADg05AHo1LM7//CkOhpq8kOTs6x
 AJF6OkDRzKzBn/d24a3c9ylo1OhKBSSGNuJfZZ0lVTxHLELUC8xgOJrivZjApTcNoyGCr5QJpNC
 LT2zFz+9xnYyST0snPLKktBSENWnMZ1BIa+Q==
X-Received: by 2002:a05:600c:1c15:b0:442:cab1:e092 with SMTP id
 5b1f17b1804b1-451f0aa1786mr67991845e9.11.1749133883743; Thu, 05 Jun 2025
 07:31:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250605141801.1083266-1-peter.maydell@linaro.org>
 <CAFEAcA9++obh-vtp7P9MZ9GHBTjuWGY419Dmp+P8iFJhCJiYHQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9++obh-vtp7P9MZ9GHBTjuWGY419Dmp+P8iFJhCJiYHQ@mail.gmail.com>
From: Corentin GENDRE <cocotroupe20@gmail.com>
Date: Thu, 5 Jun 2025 16:31:11 +0200
X-Gm-Features: AX0GCFvYgP0bCQncPASA2UU07AmIGfRRFVixQDS4IhrNCYp3uj8fZr4G8N09Fb8
Message-ID: <CAPwCrcNTgzmOSTRqDRpHXM7zoMZiC3E5Z_W3OFVCBcNbp2WUTQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/mps2: Configure the AN500 CPU with 16 MPU regions
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000ce22140636d3f705"
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=cocotroupe20@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: u7neIBMrKL6X

--000000000000ce22140636d3f705
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fixed!

Le jeu. 5 juin 2025 =C3=A0 16:22, Peter Maydell <peter.maydell@linaro.org> =
a
=C3=A9crit :

> On Thu, 5 Jun 2025 at 15:18, Peter Maydell <peter.maydell@linaro.org>
> wrote:
> >
> > The AN500 application note documents that it configures the Cortex-M7
> > CPU to have 16 MPU regions. We weren't doing this in our emulation,
> > so the CPU had only the default 8 MPU regions. Set the mpu-ns-regions
> > property to 16 for this board.
> >
> > This bug doesn't affect any of the other board types we model in
> > this source file, because they all use either the Cortex-M3 or
> > Cortex-M4. Those CPUs do not have an RTL configurable number of
> > MPU regions, and always provide 8 regions if the MPU is built in.
> >
> > Cc: qemu-stable@nongnu.org
> > Reported-by: Corentin GENDRE <cocotroupe20@gmail.com>
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  hw/arm/mps2.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
> > index 58efb41e6db..50e1a1c1c80 100644
> > --- a/hw/arm/mps2.c
> > +++ b/hw/arm/mps2.c
> > @@ -224,7 +224,11 @@ static void mps2_common_init(MachineState *machine=
)
> >      switch (mmc->fpga_type) {
> >      case FPGA_AN385:
> >      case FPGA_AN386:
> > +        qdev_prop_set_uint32(armv7m, "num-irq", 32);
> > +        break;
> >      case FPGA_AN500:
> > +        /* The AN500 configures its Cortex-M7 with 16 MPU regions */
> > +        qdev_prop_set_uint32(armv7m, "mpu-ns-dregions", 16);
>
> Rats, I failed to actually refresh the git commit with a
> fix for a bug that "make check" caught before I sent it out.
> This should be "mpu-ns-regions", without the "d".
>
> >          qdev_prop_set_uint32(armv7m, "num-irq", 32);
> >          break;
> >      case FPGA_AN511:
>
> -- PMM
>

--000000000000ce22140636d3f705
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Fixed!=C2=A0<br></div><br><div class=3D"gmail_quote gmail_=
quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 5 juin =
2025 =C3=A0=C2=A016:22, Peter Maydell &lt;<a href=3D"mailto:peter.maydell@l=
inaro.org">peter.maydell@linaro.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 5 Jun 2025 at 15:18=
, Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_=
blank">peter.maydell@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; The AN500 application note documents that it configures the Cortex-M7<=
br>
&gt; CPU to have 16 MPU regions. We weren&#39;t doing this in our emulation=
,<br>
&gt; so the CPU had only the default 8 MPU regions. Set the mpu-ns-regions<=
br>
&gt; property to 16 for this board.<br>
&gt;<br>
&gt; This bug doesn&#39;t affect any of the other board types we model in<b=
r>
&gt; this source file, because they all use either the Cortex-M3 or<br>
&gt; Cortex-M4. Those CPUs do not have an RTL configurable number of<br>
&gt; MPU regions, and always provide 8 regions if the MPU is built in.<br>
&gt;<br>
&gt; Cc: <a href=3D"mailto:qemu-stable@nongnu.org" target=3D"_blank">qemu-s=
table@nongnu.org</a><br>
&gt; Reported-by: Corentin GENDRE &lt;<a href=3D"mailto:cocotroupe20@gmail.=
com" target=3D"_blank">cocotroupe20@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linar=
o.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/arm/mps2.c | 4 ++++<br>
&gt;=C2=A0 1 file changed, 4 insertions(+)<br>
&gt;<br>
&gt; diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c<br>
&gt; index 58efb41e6db..50e1a1c1c80 100644<br>
&gt; --- a/hw/arm/mps2.c<br>
&gt; +++ b/hw/arm/mps2.c<br>
&gt; @@ -224,7 +224,11 @@ static void mps2_common_init(MachineState *machin=
e)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 switch (mmc-&gt;fpga_type) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case FPGA_AN385:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case FPGA_AN386:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_prop_set_uint32(armv7m, &quot;num-ir=
q&quot;, 32);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case FPGA_AN500:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* The AN500 configures its Cortex-M7 wit=
h 16 MPU regions */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_prop_set_uint32(armv7m, &quot;mpu-ns=
-dregions&quot;, 16);<br>
<br>
Rats, I failed to actually refresh the git commit with a<br>
fix for a bug that &quot;make check&quot; caught before I sent it out.<br>
This should be &quot;mpu-ns-regions&quot;, without the &quot;d&quot;.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_prop_set_uint32(armv7m, &quot;n=
um-irq&quot;, 32);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case FPGA_AN511:<br>
<br>
-- PMM<br>
</blockquote></div>

--000000000000ce22140636d3f705--
