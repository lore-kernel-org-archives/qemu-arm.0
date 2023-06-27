Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp1453714ejx;
        Tue, 27 Jun 2023 07:10:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4nvJZUqc+ti+mqbz4B4aDP39UkRcaypPnXAvTct51vhsm8mWr6QhS3pvN+/VgU4HShBhwo
X-Received: by 2002:a05:622a:190a:b0:3ff:2f27:12ac with SMTP id w10-20020a05622a190a00b003ff2f2712acmr24650455qtc.66.1687875009406;
        Tue, 27 Jun 2023 07:10:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687875009; cv=none;
        d=google.com; s=arc-20160816;
        b=gU1idEgeB3h9ZcU40rdQNcroRPzwVUfxFug1lUOSQdiT4Y0M1To5eCsntg8O373qLb
         opAdY2qlDQ0DZVNqEzTKAWU3D8MBBEFY7xd8aO+bOJg4JVZTCe1wYScJuUdhcXMYyLDw
         gSdo9tXc7WpHf4UYRohZcUyWfEOmwxkXfzOqDWiHdiBiskQ6+U7gEar2emuSk4I8rpip
         UzsJJARzEQeWiBX6xFPcWoxd0j/6CAHB1MyRssnJnQk4UeWCMSHSDC+xdjy2A8onKtn2
         jC3qvM4HepbnxiJoF4ftxubVxU7UOLGWFsm9yJJrGpc7JkPKCyVB+HgUt+yIW25t8Pah
         Zgiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PW08iT5svZ8TehTQNsrK/51jZ0TOGl+C3M6BwWduSdc=;
        fh=nlvs0DNuaumhRSTpzOJfqYeZdKSzkZJr/D9gNRTQd+M=;
        b=AykPaTpf+pRKBjkvKrkiDT5GBhsASuwulE69Q3RbudLILIeElzOI7m5NQdJngTl1e1
         5/LYUqk13/hpqthrUpLKvOufRusXJy1c1HIdyJhhFfJJ7z0eoJY7KAwJER7p8XNz3h0F
         qoaEMgryLEVWlLb6frqzNMSMvCIBa7MuguGUgUmX7Gn/zPzQEC0DIwD7fPbWbi8MyGjf
         7X8rTDgHT3yv+TbIKO7/m/rckL+3V+KqnONShbIyUsRUkDLhR54X+mWrGEV6x/BD4nu5
         ZXLeYHXstl/etlwDNhU/iSPhYMWYAyIKEO0K+BYBEPD8tSM5z9VwPdAObDfvw5EHPRNm
         8s8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=eOCLdvt+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b22-20020a05622a021600b00400eddbce19si1635768qtx.235.2023.06.27.07.10.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Jun 2023 07:10:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=eOCLdvt+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qE9OL-0005xW-C5; Tue, 27 Jun 2023 10:10:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patilabhijit180@gmail.com>)
 id 1qE9OK-0005xK-BG
 for qemu-arm@nongnu.org; Tue, 27 Jun 2023 10:10:00 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <patilabhijit180@gmail.com>)
 id 1qE9OI-0006U5-MR
 for qemu-arm@nongnu.org; Tue, 27 Jun 2023 10:10:00 -0400
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-bff0beb2d82so4576702276.2
 for <qemu-arm@nongnu.org>; Tue, 27 Jun 2023 07:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687874997; x=1690466997;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PW08iT5svZ8TehTQNsrK/51jZ0TOGl+C3M6BwWduSdc=;
 b=eOCLdvt+O9nNqb68n3zHgeXAgt8QAE6F+L9i4WovGWNFh6PA40Uof5m3P6DoMn/3Ym
 QSqAJW008LviM1I3NSjurN73gMLgmWqoIO2cvn88m/omdCY+tTBCSWhDIENBc7Z1engc
 BQ2NbADtnq0iDmeqxhaljaXuDAyD39LN/XeZoBmKvt8zyAfIe4dsNZMzkz8+5W5B8oA4
 yyczx11D6/EfqSHJk0D9MNJ5ZRVI+H69DT30p6vO8jKjLnrILhvmIsd66qiFD/pDEzmw
 byXIaK2eAYWz2FZggKgU5CfxdXknq7OiD3j2g331eWhV4OBMYxoneqGV/7amhUQ/wE9+
 pxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687874997; x=1690466997;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PW08iT5svZ8TehTQNsrK/51jZ0TOGl+C3M6BwWduSdc=;
 b=WYz3Ri562s/fXrsuxB/Axljo32kup9+zuZBJjTyvp+dcfWhgV6l+47e3fC8S7mElrb
 DhdwaK0K5Ak9NOlZaEmtJHya4+/NhVedEtObYeCWpvfT7Uls7947di7Bt650EPSws7y3
 EiVgarmh/7YdiUudsnlMDmP3Z0nMV9tJCvKhWwx5VpkjOnW/NYTOaRe7BkD0+gidyaeX
 CTmXr0DJ2UXKtJeVSr+gB1PFyr7Uj3HymjgpypQs7xM04xFAf+cseHlnfYjnJUEYwxpT
 e3o7RxzTaY7SZ2JPyiRQKs2DztB7GhCapjvSM0VVhqtJwHjXL6r11sTtn+2kXMutuYTI
 ZcsQ==
X-Gm-Message-State: AC+VfDyKZXNECTJdZA/rZs5Z20Wvy2oEWh/Web3yBBH5a1/rxKK5LcgY
 OX4ymbTXB34+wImTRoArfWcT4HE8Dux5tIYaYjY=
X-Received: by 2002:a25:73d5:0:b0:c01:287b:41f9 with SMTP id
 o204-20020a2573d5000000b00c01287b41f9mr15375923ybc.59.1687874997367; Tue, 27
 Jun 2023 07:09:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ-ErDDkWPE6QFF5Qvq2OQ55aaMoRPKXT9a-+1Ma79XVkw_c6A@mail.gmail.com>
 <CAFEAcA9vjp3o08F+aLB9DPga0tQgmHhaweZADB_wrniZ38GrBQ@mail.gmail.com>
 <CAJ-ErDCb_bvCg-RYYnsawxhM47wSnAj3qFeP4hKB9AdjDDswKA@mail.gmail.com>
In-Reply-To: <CAJ-ErDCb_bvCg-RYYnsawxhM47wSnAj3qFeP4hKB9AdjDDswKA@mail.gmail.com>
From: abhijit patil <patilabhijit180@gmail.com>
Date: Tue, 27 Jun 2023 19:39:46 +0530
Message-ID: <CAJ-ErDBJi_0SeeOBjjNbyEE5BiYjcgEBA4tx7uULgOB1=FfUEw@mail.gmail.com>
Subject: Re: Regarding hello world program for ARM M7 (s32k312) using qemu
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000a4ba5c05ff1d051b"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=patilabhijit180@gmail.com; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: kxTdqlrsbUId

--000000000000a4ba5c05ff1d051b
Content-Type: text/plain; charset="UTF-8"

Does it have for ARM M7 any board?...I read somewhere that if you have
latest version 5 for qemu then it supports the ARM M7 machine...is it
right?...and if yes where can we download the same and the programs and
other things for ARM M7 using qemu

On Tue, Jun 27, 2023, 7:12 PM abhijit patil <patilabhijit180@gmail.com>
wrote:

> Does it have for ARM M7 any board?
>
> On Tue, Jun 27, 2023, 7:07 PM Peter Maydell <peter.maydell@linaro.org>
> wrote:
>
>> On Tue, 27 Jun 2023 at 14:32, abhijit patil <patilabhijit180@gmail.com>
>> wrote:
>> >
>> > Need hello world program for ARM M7 (s32k312) using qemu...need all
>> files for startup linker and main .c file and also how to execute the
>> same....have program using versatilepb....but needed for this specific
>> board  ARM M7 (s32k312) using qemu
>>
>> Hi. I'm afraid QEMU doesn't have a model of the s32k312
>> board. If you want to run code on QEMU you need to build
>> it for one of the board types that QEMU does support.
>>
>> thanks
>> -- PMM
>>
>

--000000000000a4ba5c05ff1d051b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><span style=3D"font-size:12.8px">Does it have for ARM M7 =
any board?...I read somewhere that if you have latest version 5 for qemu th=
en it supports the ARM M7 machine...is it right?...and if yes where can we =
download the same and the programs and other things for ARM M7 using qemu</=
span></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Tue, Jun 27, 2023, 7:12 PM abhijit patil &lt;<a href=3D"mailto:pati=
labhijit180@gmail.com">patilabhijit180@gmail.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><div dir=3D"auto">Does it have for ARM M7 any =
board?</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Tue, Jun 27, 2023, 7:07 PM Peter Maydell &lt;<a href=3D"mailto:pet=
er.maydell@linaro.org" target=3D"_blank" rel=3D"noreferrer">peter.maydell@l=
inaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Tue, =
27 Jun 2023 at 14:32, abhijit patil &lt;<a href=3D"mailto:patilabhijit180@g=
mail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">patilabhijit180@g=
mail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Need hello world program for ARM M7 (s32k312) using qemu...need all fi=
les for startup linker and main .c file and also how to execute the same...=
.have program using versatilepb....but needed for this specific board=C2=A0=
 ARM M7 (s32k312) using qemu<br>
<br>
Hi. I&#39;m afraid QEMU doesn&#39;t have a model of the s32k312<br>
board. If you want to run code on QEMU you need to build<br>
it for one of the board types that QEMU does support.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>
</blockquote></div>

--000000000000a4ba5c05ff1d051b--
