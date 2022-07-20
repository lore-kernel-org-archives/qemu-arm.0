Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp2678445lfp;
        Wed, 20 Jul 2022 07:46:15 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vw8TXubUih27Gzv14oSU5RDVa7ZscjUwrCWRBAiuvb2pMLxz4uQmGi3qO6CPU6GF3gTdq2
X-Received: by 2002:a05:622a:38f:b0:31e:dd10:608a with SMTP id j15-20020a05622a038f00b0031edd10608amr19437701qtx.149.1658328375299;
        Wed, 20 Jul 2022 07:46:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658328375; cv=none;
        d=google.com; s=arc-20160816;
        b=eQdH+M0D9btgj21z8pHQ+avQmrQb+qA3Vv8UcOO9cjhviR0EygFbZNXUCnZVJxNMZJ
         v7CVJ0oIlt/Sp9Re/jYaaRWJI6O0eKoFtBTo2NT3pwg3FypEg3l2OVy8fkM+jxnVlW/C
         JuYyDE1rBlYyMN6bXks2nnkw0M5Lu4B56/vwy96O8U0OVltACCKBrVeClKDiI4Gx1VR+
         erxrsQc1cFMKD6b+H+UdVSStBNOFJw8JLX3Cb/FUns3HSIASAlUf/I+MsdbFJSvm2IqQ
         5CjYEo2bJDovEmr+lykzUnbDOgojMOknZMHPxWY3VGmn1zfom1ROW0nqWCkFCBK1/zsE
         eC2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=FpIbRJWF1wdgcg4P5NZe7M43OADbD9dwrf3L/ew1dPU=;
        b=cIWrj9MWVqwfkfIyZBXR7w0uZOttiZq3bID8dj4Z9BgDLTl9fCw9OqWdcZDXziSTkA
         yxhCkhTcai/sxQT+lHs/Ei5hHnw8JuVmapgj74PFoAvFs7lUPEJet8IuMKnqP/W9AndP
         2IeP+RIuGljhMzZUzWyZpfOm2rrjKhq+qV2J4vHYt/YLrOniWXPnW+SJK/YXzIQVZ5N7
         0cZ9b9howuq+LTDWfqC3hbWgsBS78kN8w9HK/LN2VYNuoSTqlUAIYw7r9D1ZxQ4522Bj
         gmPDmB9UDcD9pnAaBRt2iVy9aBQ3pzKLmozHWOCA71BZRZVgpfJy8meEdwMfqVi6fE/S
         Is9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=QfFrIggT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f6-20020ac80686000000b0031efce8c0cesi2415644qth.102.2022.07.20.07.46.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Jul 2022 07:46:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=QfFrIggT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oEAxp-0005AS-Qw
	for alex.bennee@linaro.org; Wed, 20 Jul 2022 10:46:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jon.alduan@gmail.com>)
 id 1oEAxe-00059B-Fs
 for qemu-arm@nongnu.org; Wed, 20 Jul 2022 10:46:02 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:43705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jon.alduan@gmail.com>)
 id 1oEAxd-0006x6-2W
 for qemu-arm@nongnu.org; Wed, 20 Jul 2022 10:46:02 -0400
Received: by mail-ed1-x52c.google.com with SMTP id v12so24054878edc.10
 for <qemu-arm@nongnu.org>; Wed, 20 Jul 2022 07:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FpIbRJWF1wdgcg4P5NZe7M43OADbD9dwrf3L/ew1dPU=;
 b=QfFrIggTvW4O4Z3X1bmKkdoEYmfagYeIlkekjwtXUZP5dfpUdLNrhYq78Aht14zCaj
 mGOat0t1/eE0lyro2tINjM/mBMERtxmCQaQXy60GmNIVocWD84ATzhNQHMvhuBQrNabA
 U2U73b02Iwtgd7Sz06SJe2XOJxsGZi/mzyCkgJdVOAyWbw4gO71UsnvTSWouSUDSO6RX
 n7eaa/cfZhRLIbmyA++4ZMJq0XeFfeTLVlP4vCZdNgpUU4QL08dbjlOCB+PMWtHs187w
 uW2Y8oywvxQ6Cp9Sk0XzQKQpC7aQ1VT8bF8btDClOD3ttTF/568UG9gOievX9OXi1/Bx
 O71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FpIbRJWF1wdgcg4P5NZe7M43OADbD9dwrf3L/ew1dPU=;
 b=j6Liqy5HfAZMgKcqNi6ZfrrJrZQj6Ievao86zdqR8O9oNe860Bn8qaIc/0fyNfgDix
 fhCQvMDXeHxeGV2UF3Sww/aTDOX2PmhLNLgrUclkpbV9bKaa+QVxuNgZdSAeNTev/NQo
 FA1lQuv0jp1W1iFCcPIRuLn+E8QYrE13W+7NHGx+wlDwKOy+X356OrGAQp7retHMG9ta
 IYAm8tleQBfo2qEF9qgrdevKxlVM/9nkgiEAxABUsi0R8UkCcPAlIxYrttGEPuJ2apcG
 dLGndodSKqV8LbhMF56eVNzkTHYnBCvsl253L1FDrJ+n9S9VwSVo3autoVqYdtD0rkuI
 br2Q==
X-Gm-Message-State: AJIora8C2jjw9aseh3jHN560dOigZHDnmug7xs7iHohndgvfXIB33bBI
 vAaOAb1p68EZDf8Qh4NMir/flPPDrX83pwEqFUc=
X-Received: by 2002:a05:6402:3047:b0:43a:9e43:95e5 with SMTP id
 bs7-20020a056402304700b0043a9e4395e5mr51390246edb.385.1658328359241; Wed, 20
 Jul 2022 07:45:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAL7npF9T0148jkgTigVfE7cSzH2HKqy0NG0VQtAH2HMXjdBOOg@mail.gmail.com>
 <CAFEAcA8RHhRcrMSO_3MK0hSH=zWzde7S0DHHaLPZf4jOv48RLQ@mail.gmail.com>
 <CAL7npF9hKFsQF18Udi9QFnRZSH-G8cafXHBSBQcrs7jpJmPd7Q@mail.gmail.com>
 <CAFEAcA92=ne8weVYDnLLzNk0+z+aMFJgOJvW_7hSYcY1TimyHw@mail.gmail.com>
 <CAL7npF8Hg7hJBxw9j-1_7GRV_E52KS+hP1WXKfD3+r05C=CBgg@mail.gmail.com>
 <CAFEAcA8tGiaXq+y40-BtdG3jiBJpP=L6x9tsPL_5dF6dr=afEA@mail.gmail.com>
 <CAL7npF8d6LZHZtLWe65JiwQW+X-48JxLa2xBoGdxjJJWpKx-Fw@mail.gmail.com>
 <CAFEAcA9SM--_+Ret6fZwvWNe0J3E8TE-+do614TtTpi0rbAM9A@mail.gmail.com>
 <CAL7npF_8ErAn2cvFBQxVCdP96uKpdRQMs_3aL_UW5OLzm3Q=GQ@mail.gmail.com>
 <CAFEAcA-cTzrA6fZXw7onDJ77NMwjBrSFVwADYmttCgdOf9ODYw@mail.gmail.com>
 <CAL7npF9H_eKi0jA_m-wV=jSHy9hc6re7TpTe2ni=9NYK4CxRpA@mail.gmail.com>
 <CAFEAcA8xV-BdhvwvkzRHxqqEX9BAwDJGwHS=koBRbDeGHwQHEw@mail.gmail.com>
In-Reply-To: <CAFEAcA8xV-BdhvwvkzRHxqqEX9BAwDJGwHS=koBRbDeGHwQHEw@mail.gmail.com>
From: Jon Alduan <jon.alduan@gmail.com>
Date: Wed, 20 Jul 2022 16:45:47 +0200
Message-ID: <CAL7npF9bOP=bPtyFS-K+HgXGy9+W11M0ELRJMqQp1-JB_jVx1g@mail.gmail.com>
Subject: Re: [qemu-arm-static] timer_delete issue from Qemu 5.0.0 onwards
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000c60a7805e43da890"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=jon.alduan@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ogJnZoe9nc5M

--000000000000c60a7805e43da890
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

then, this is the key. Please try a newer version. As I put in the title,
this issue is only to see from 5.0.0 onwards. Qemu version 4.2.1 works fine
for that.

I am looking forward to your feedback.

Best regards
Jon

El mi=C3=A9, 20 jul 2022 a las 16:35, Peter Maydell (<peter.maydell@linaro.=
org>)
escribi=C3=B3:

> On Wed, 20 Jul 2022 at 15:26, Jon Alduan <jon.alduan@gmail.com> wrote:
> >
> > If it is done with Ubuntu 20.04, you should get qemu-arm 4.2.1. Can you
> call "qemu-arm -version"?
>
> Yes, that's 4.2.1. PS: please keep list threads on the list.
>
> -- PMM
>


--=20
j.A

--000000000000c60a7805e43da890
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Peter,</div><div><br></div><div>then, this is the =
key. Please try a newer version. As I put in the title, this issue is only =
to see from 5.0.0 onwards. Qemu version 4.2.1 works fine for that.</div><di=
v><br></div><div>I am looking forward to your feedback.</div><div><br></div=
><div>Best regards</div><div>Jon<br></div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">El mi=C3=A9, 20 jul 2022 a las 16=
:35, Peter Maydell (&lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.m=
aydell@linaro.org</a>&gt;) escribi=C3=B3:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On Wed, 20 Jul 2022 at 15:26, Jon Alduan &lt;<a h=
ref=3D"mailto:jon.alduan@gmail.com" target=3D"_blank">jon.alduan@gmail.com<=
/a>&gt; wrote:<br>
&gt;<br>
&gt; If it is done with Ubuntu 20.04, you should get qemu-arm 4.2.1. Can yo=
u call &quot;qemu-arm -version&quot;?<br>
<br>
Yes, that&#39;s 4.2.1. PS: please keep list threads on the list.<br>
<br>
-- PMM<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">j.A</div>

--000000000000c60a7805e43da890--
