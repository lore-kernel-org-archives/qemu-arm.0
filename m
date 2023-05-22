Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1177578ejb;
        Mon, 22 May 2023 05:42:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ50vv8esyY8lT8eZbk8yCK048xOZkN3PUZ3HWhe6FeIDmm20Hztv+XZwlOojZjsy2IRgYXm
X-Received: by 2002:ad4:596d:0:b0:5ef:8c79:fe98 with SMTP id eq13-20020ad4596d000000b005ef8c79fe98mr17137468qvb.8.1684759333278;
        Mon, 22 May 2023 05:42:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684759333; cv=none;
        d=google.com; s=arc-20160816;
        b=NcdWO7fYus10wZFu7Ecl+XGDaYyu1PbLMaH+YrktxhhR1CFiB6WELAgVRw0H+OJ8k9
         J4RH25bcTI0oWENlm1JJvCIZdCUv9pgKDW0/WS06rORbrxkMQ0h/zp5zXYqSfhnWnNSE
         CuYsxNxFVHPfcJrRDVd5gIoV/alNFEhlY5VYuCjVbJhqFkr44GPTW35MsAFbrXUzMDEP
         vyj/SS+YRL3zzLcHTDdTIyn8hmdF17NtijMS9Qf1v63cnpZIK8yZZQkCeCU/aiLqomho
         Vt2WcEqkmXRSwZlHxrujwx+0neTQ6tVoETuFy8ESOzD+IRZZ4RCn89WEX1w4sxWw3jG3
         FPUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=KQoSzuezfyJivOqkO4aEM87L/takb7wCxvvBXTax95k=;
        b=qZlFqiF5FdUkvl7XSJp32evCZ4uKqwLmP2cnhCzIl+gUu5IVDtw8OvUn9gJWjtQNjt
         2iJ3o2jEswmb+WAnhzh72azALHy4PUcPPXxkqHeWdaSmHqFq6VHZPkVrcgQ+kvJYkftl
         KKmNUed7BE0VLvxXvyNQSxkofxfbjnW+wTRMx801ddB1l2dakneKHwnDif7kJpxe1vbd
         eLNBLNblp3mNOTgPQC5BncWqaNqkSKt3/DHDoKzvjL698ljVsWt1WTSPHR/FxhXWF0FZ
         xI8UEtNDMPAIqpaRNPY7eHoX3oRJ6M7ihSN+xvcxh+BUPB+oCpVxuu4QGuX8EFo6Z0XS
         mCrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iu14-20020ad45cce000000b006210472fb87si3396828qvb.256.2023.05.22.05.42.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 May 2023 05:42:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q14r2-0004yW-Hf; Mon, 22 May 2023 08:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sergey.kambalin@auriga.com>)
 id 1q14qx-0004xv-5B; Mon, 22 May 2023 08:41:31 -0400
Received: from hq-ms.auriga.com ([82.97.202.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sergey.kambalin@auriga.com>)
 id 1q14qt-0000xp-FK; Mon, 22 May 2023 08:41:29 -0400
Received: from HQ-MS1.office.auriga.msk (82.97.202.32) by
 hq-ms1.office.auriga.msk (82.97.202.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.12; Mon, 22 May 2023 15:41:19 +0300
Received: from HQ-MS1.office.auriga.msk ([fe80::e2f8:5f63:adc1:868f]) by
 hq-ms1.office.auriga.msk ([fe80::e2f8:5f63:adc1:868f%8]) with mapi id
 15.02.1258.012; Mon, 22 May 2023 15:41:19 +0300
From: "Kambalin, Sergey" <sergey.kambalin@auriga.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: Sergey Kambalin <serg.oker@gmail.com>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH] [rpi4b] Make bootable rpi4b model
Thread-Topic: [PATCH] [rpi4b] Make bootable rpi4b model
Thread-Index: AQHZjJhM5s2DGZMhDE6fRKCxSTEX869l5goAgAA0A2T//9M1AIAAPGd6///VIACAAD0/pg==
Date: Mon, 22 May 2023 12:41:19 +0000
Message-ID: <672004b332154e15b14e4e96d20a23de@auriga.com>
References: <20230522102910.20942-1-sergey.kambalin@auriga.com>
 <CAFEAcA_aV0DvL3DgqU9SKKRsqCoMrvwbPoomx+NA8fkXKkTytA@mail.gmail.com>
 <e5f053c126a24a62a4e1e8d309d939ce@auriga.com>
 <CAFEAcA8bLr+_raHie4JxoEJAQ7cuj5nJKTYt5+7r6T0w8FFNsg@mail.gmail.com>
 <ea63d09bb2d249b282a429ff9d373e4d@auriga.com>,
 <CAFEAcA8HMgJ5_WwC6Mc5E61_KN4kqvpW6AE_EyDf-JcrFVQJMg@mail.gmail.com>
In-Reply-To: <CAFEAcA8HMgJ5_WwC6Mc5E61_KN4kqvpW6AE_EyDf-JcrFVQJMg@mail.gmail.com>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [134.191.220.81]
x-tm-as-product-ver: SMEX-14.0.0.1158-9.0.1002-27556.003
x-tm-as-result: No-10--17.501200-8.000000
x-tmase-matchedrid: IDcII6LbfMCJVA+ukO+5MWg4D2QV/2zL6r3HCixfuKcc4ri4RJV/1W/R
 DAZTdSI3QnEYvg6//klFmXhQ6rgRVOyDy8V8lTWUzH6d90mb4+Ih6cl1707zKlZxVB3B2qbP6Xk
 ezPna397QLE3MitZAfl9/IWsrV5Ek1LFdtmiebE5itzfafzhYerzutTz14s8pB4N9b2b2Ot6L2s
 CeHVx5vavLMqivPPjo9ElewkZ1UEQ2ib2gFI+X3zo39wOA02Lhv/7xdLQjXSIgaqPnI+BNyB2MH
 UpnrEwAiPTUF0vMdpGHIX2JO/wOMi3UeYOWBocyARprIm1hk212ZYwNBqM6IsSQ5qUrBcx3zKAC
 X7I5tE7P1hd0ZMHSA01AeToCHLWXQqvLyTLhF8UFxov+3JYvY9+43C02PchEoUhuKHSz/jb7Tdr
 4xDxETRUJDVhOCrc2J9Dn0zV8taUumHyO4Y/CA51U1lojafr/DvKSaIxu6kqISI683skDCtSHnJ
 Dq2yhMlixDUeTodIK9NZJut0CFKN9faxl/I4mhq5uw61JZjZBcdJ43JX6v+OTCMddcL/gjcxYeV
 rfi/UI7kyoFYZ/5JMyhWimj2LHmYRa3eYQPHJ+lOc5PPl6XJn7cGd19dSFd
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--17.501200-8.000000
x-tmase-version: SMEX-14.0.0.1158-9.0.1002-27556.003
x-tm-snts-smtp: 8571BD7DE9C36E2D69E7D65F6F955E30376DC1AC75FB639448EC0A5A7BF18F002000:8
Content-Type: multipart/alternative;
 boundary="_000_672004b332154e15b14e4e96d20a23deaurigacom_"
MIME-Version: 1.0
Received-SPF: pass client-ip=82.97.202.32;
 envelope-from=sergey.kambalin@auriga.com; helo=hq-ms.auriga.com
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 MIME_CHARSET_FARAWAY=2.45, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Hor+ze0/31JK

--_000_672004b332154e15b14e4e96d20a23deaurigacom_
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

Thanks!

________________________________
=EF=D4: Peter Maydell <peter.maydell@linaro.org>
=EF=D4=D0=D2=C1=D7=CC=C5=CE=CF: 22 =CD=C1=D1 2023 =C7. 15:01:26
=EB=CF=CD=D5: Kambalin, Sergey
=EB=CF=D0=C9=D1: Sergey Kambalin; qemu-arm@nongnu.org; qemu-devel@nongnu.or=
g
=F4=C5=CD=C1: Re: [PATCH] [rpi4b] Make bootable rpi4b model

On Mon, 22 May 2023 at 12:42, Kambalin, Sergey
<sergey.kambalin@auriga.com> wrote:
>
> Aw, I thought the entire machine should work at the first patch.
>
> Thank you for the detailed clarification! I think I've got the idea. I'll=
 split it up.
>
> Could you please tell me what size is appropriate for a single patch?

The most important things for patch splitting are:
 * everything still has to compile cleanly
 * the contents of a single patch should be a coherent single
   thing that it makes sense to review in one part

If there's something in there that only touches 20 lines of
code but is a coherent single change, it's fine to have that in
its own patch -- small patches are easy to review.

At the upper end, I tend to think a patch is a bit big
at around 200 lines, but for the specific case of "here
is a new device" bigger than that is OK, because it's
just adding new files rather than merging changes into
existing ones.

https://www.qemu.org/docs/master/devel/submitting-a-patch.html
has some other advice on patch submission, if you haven't
read that yet.

thanks
-- PMM

--_000_672004b332154e15b14e4e96d20a23deaurigacom_
Content-Type: text/html; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dkoi8-r">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<meta content=3D"text/html; charset=3DUTF-8">
<style type=3D"text/css" style=3D"">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; col=
or:#000000; font-family:Calibri,Helvetica,sans-serif">
<p>Thanks!</p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>=EF=D4:</b> Peter Maydell &lt=
;peter.maydell@linaro.org&gt;<br>
<b>=EF=D4=D0=D2=C1=D7=CC=C5=CE=CF:</b> 22 =CD=C1=D1 2023 =C7. 15:01:26<br>
<b>=EB=CF=CD=D5:</b> Kambalin, Sergey<br>
<b>=EB=CF=D0=C9=D1:</b> Sergey Kambalin; qemu-arm@nongnu.org; qemu-devel@no=
ngnu.org<br>
<b>=F4=C5=CD=C1:</b> Re: [PATCH] [rpi4b] Make bootable rpi4b model</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">On Mon, 22 May 2023 at 12:42, Kambalin, Sergey<br>
&lt;sergey.kambalin@auriga.com&gt; wrote:<br>
&gt;<br>
&gt; Aw, I thought the entire machine should work at the first patch.<br>
&gt;<br>
&gt; Thank you for the detailed clarification! I think I've got the idea. I=
'll split it up.<br>
&gt;<br>
&gt; Could you please tell me what size is appropriate for a single patch?<=
br>
<br>
The most important things for patch splitting are:<br>
&nbsp;* everything still has to compile cleanly<br>
&nbsp;* the contents of a single patch should be a coherent single<br>
&nbsp;&nbsp; thing that it makes sense to review in one part<br>
<br>
If there's something in there that only touches 20 lines of<br>
code but is a coherent single change, it's fine to have that in<br>
its own patch -- small patches are easy to review.<br>
<br>
At the upper end, I tend to think a patch is a bit big<br>
at around 200 lines, but for the specific case of &quot;here<br>
is a new device&quot; bigger than that is OK, because it's<br>
just adding new files rather than merging changes into<br>
existing ones.<br>
<br>
<a href=3D"https://www.qemu.org/docs/master/devel/submitting-a-patch.html">=
https://www.qemu.org/docs/master/devel/submitting-a-patch.html</a><br>
has some other advice on patch submission, if you haven't<br>
read that yet.<br>
<br>
thanks<br>
-- PMM<br>
</div>
</span></font>
</body>
</html>

--_000_672004b332154e15b14e4e96d20a23deaurigacom_--
