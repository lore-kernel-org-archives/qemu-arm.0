Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp685601ocb;
        Thu, 6 Oct 2022 11:34:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7LJfyfWhhOFCY+Fv8UScLRawK0du5kpW6rxXw1ujP4CAS8zVAzokUTceeRBTP/jl4VL5wg
X-Received: by 2002:a05:620a:4454:b0:6ce:bfbf:7e3f with SMTP id w20-20020a05620a445400b006cebfbf7e3fmr1222565qkp.748.1665081266863;
        Thu, 06 Oct 2022 11:34:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665081266; cv=none;
        d=google.com; s=arc-20160816;
        b=rxuAYJT0zZlhrYP3Kh07qaS8cJ65qS+wo7XUKINcL7StCuN4xqbToUsIoJqKS45EOk
         TTj9d98LOp9UFCNKsuTuZrSxUoRcy3A7qi/OchTVrkoO0kWcAq4iwfNEaHB0bsJlPT7w
         i9q83sdzr8X4h21IcmilN5RhrCbOi8CeofrS+BN/pY+ZO2IOA3ezuQGJOuPDbpqxcEsL
         6nQZfv4FNsQspA470uuNzwipfD+3tWHgZQTbnmBaBrBWPxavPhuofjAyWUJNlqewsEks
         pncMu7a5X87ovwHYJ3lm/qTMzNwlOjrm5kq0/Esw/LmZiQi/40qb/wIT6SDxbG5ypubz
         z+Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ft3vXViZXweOud3hGmW4bSl9f69a0dyFiCQHbUfysCE=;
        b=ItAo9CEabww9sGlRyfjOAsyHxj9tDl8xWx32ZlwfIhblHW1Ex91VAT+ptkRk72n0oO
         z1KZIwJqhYHV3UuQwAjXGVtHOSRPWmx0ty/3eRMVtQE0ebKvHi++0aA1rZQIAlwRZ9Wq
         FmqkGe4s9UKzuU2IbC5Pqs4R0j6971UIcPDu8peftIvElwSc8lsEAD3jd8uz3sZOAZ65
         e6Qxt/x3oOaHHEr9ODyCb/LcX+Vm+g6/F39r69mnU4dhv+/gX4WCRB4mf73KQXlEFhg1
         O5/YnnuAeJlHLXxO+3tL88MnPhGrlSYFU2LZrp0VzUMZZkxsMt0j86byKYs1SJyRvJ/j
         oi0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=NCXTpTfX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t25-20020ac865d9000000b00316cc5b2e9fsi207923qto.8.2022.10.06.11.34.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Oct 2022 11:34:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=NCXTpTfX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:45826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogVhR-0005HK-BB
	for alex.bennee@linaro.org; Thu, 06 Oct 2022 14:34:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1ogV9Z-00031u-An
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 13:59:25 -0400
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933]:38793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1ogV9X-00062R-Gp
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 13:59:25 -0400
Received: by mail-ua1-x933.google.com with SMTP id e22so905650uar.5
 for <qemu-arm@nongnu.org>; Thu, 06 Oct 2022 10:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ft3vXViZXweOud3hGmW4bSl9f69a0dyFiCQHbUfysCE=;
 b=NCXTpTfXZLjtdjcfOLdYDeDXtaIr0oAXXX+0AwTDpnLyVzFJuqfubVcmdhiPibjYkZ
 rIVhnXM7bo3wbBDvCHR5+dE4cm4bCJsyHy8Qf3gxsUrrbGozQV3fue16pMwL5LTigPLY
 SB73d9d+QzJLslA5wZVC7A58rPTJdQjhTZAsxT+ofhgRTwfWm6Pm4zcwLO2unzi5i8rz
 vKc/wm7+7KSlYt5509CDlbso5mqdGIaQFVvKC7WFm26QfVw1rFp0NPZlgYT8fXQmxX9U
 9Z2bj5AEjHgV6aFYxVlPtWZs7GJ0H6VqSAYJBTrz33quJNtCWkimbLWcFBMT8Jsclvla
 vxFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ft3vXViZXweOud3hGmW4bSl9f69a0dyFiCQHbUfysCE=;
 b=MdccC3Jw6XkGjfHJUz2ezI+aYPZfo6YsZzGGagXXVwQpFnndDgwEeFoCZTOwT8t9Bu
 SilJWiEQGgVhzei8b7Dzl/EH0YoMk2Mz458aFvNPTIW4Tn7cFMm+MOUZFD71+NO0jc+E
 Cjft8prJNOrstjn/tS6VgxMyNEJYrjBAPmYRKzMA+VzrbvnM5FWeLT/sSNY5PgMoV1Eg
 LBhtOS2aQ/1Va9PHGLWvBkiInV4492boiZrbVIUTU3OaZJSPtgSY4rHzQF87fCyWZqFJ
 A/H4f8BkpzZmzobuuSNBeJZjxvJugbe/QtQ+ix5XKJThlQXq5FZvND4pijC9STXz2NLI
 L4Pw==
X-Gm-Message-State: ACrzQf2DAX8BBTXBMgsaisuQDyKaBM9D3FB7s1aBQwKqBvLf9/EnLppS
 OaOY4omNgzdVApnGRedy7aPhC/ubKiejUlp/At+y1g==
X-Received: by 2002:ab0:6027:0:b0:3d9:4b58:1ea4 with SMTP id
 n7-20020ab06027000000b003d94b581ea4mr895478ual.26.1665079162545; Thu, 06 Oct
 2022 10:59:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220906163138.2831353-1-venture@google.com>
 <98b23697-00ec-2952-31c1-258419bd5440@redhat.com>
 <CAO=notzNRHaJvqnBx34qN0ovvwiwXNPRt73VnWqxyYhvnZMXnA@mail.gmail.com>
 <eccfd9bd-2900-f437-778c-74a8052fc045@redhat.com>
 <CAO=notzEJer6rfBxqGrHdzw9S+bHCQ1jcW0WYBdP3G1nuHJ8nQ@mail.gmail.com>
In-Reply-To: <CAO=notzEJer6rfBxqGrHdzw9S+bHCQ1jcW0WYBdP3G1nuHJ8nQ@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 6 Oct 2022 10:59:11 -0700
Message-ID: <CAO=notzxvvfjT9RUT_zZ0nf28+0aiJvf3+4DYhfjWryZ45ZQWQ@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest: npcm7xx-emc-test: Skip checking MAC
To: Thomas Huth <thuth@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, 
 CS20 KFTing <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>
Content-Type: multipart/alternative; boundary="00000000000002038605ea6174ad"
Received-SPF: pass client-ip=2607:f8b0:4864:20::933;
 envelope-from=venture@google.com; helo=mail-ua1-x933.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: 4CGjEVLfiNkt

--00000000000002038605ea6174ad
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 6, 2022 at 10:58 AM Patrick Venture <venture@google.com> wrote:

>
>
> On Tue, Sep 20, 2022 at 12:00 AM Thomas Huth <thuth@redhat.com> wrote:
>
>> On 20/09/2022 00.37, Patrick Venture wrote:
>> >
>> >
>> > On Mon, Sep 19, 2022 at 5:44 AM Thomas Huth <thuth@redhat.com
>> > <mailto:thuth@redhat.com>> wrote:
>> >
>> >     On 06/09/2022 18.31, Patrick Venture wrote:
>> >      > The register tests walks all the registers to verify they are
>> initially
>> >      > 0 when appropriate.  However, if the MAC address is set in the
>> register
>> >      >    space, this should not be checked against 0.
>> >      >
>> >      > Reviewed-by: Hao Wu <wuhaotsh@google.com <mailto:
>> wuhaotsh@google.com>>
>> >      > Change-Id: I02426e39bdab33ceedd42c49d233e8680d4ec058
>> >
>> >     What's that change-id good for?
>> >
>> >
>> > Oops, sorry about that.  I can send out a v2 without it, or during
>> > application someone can nicely trim it? :)
>>
>> I can take the patch through my qtest branch - I'll drop the line there.
>>
>> >     Basically ack, but one question: Where should that non-zero MAC
>> address
>> >     come
>> >     from / when did you hit a problem here? If QEMU is started without
>> any mac
>> >     settings at all (like it is done here), the register never contains
>> a
>> >     non-zero value, does it?
>> >
>> >
>> > So, there's a bug in the emc device presently where that value isn't
>> set
>> > when it should be.  I have that bug fixed, but for whatever reason,
>> probably
>> > not enough caffeine, I didn't bundle the two patches together.
>>
>> OK, makes sense now, thanks for the explanation!
>>
>
> The follow-on patch was just applied to arm.next, so I wanted to check if
> this was applied to your .next or if you wanted a v2.
>

Nevermind, sorry for the spam - I already saw it in a PULL but forgot to
update my internal tracking.  Thanks!

>
>
>>
>>   Thomas
>>
>>
>>

--00000000000002038605ea6174ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 6, 2022 at 10:58 AM Patri=
ck Venture &lt;<a href=3D"mailto:venture@google.com">venture@google.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 20, 2022 at 12:00 AM Thomas H=
uth &lt;<a href=3D"mailto:thuth@redhat.com" target=3D"_blank">thuth@redhat.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On 20/09/2022 00.37, Patrick Venture wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Mon, Sep 19, 2022 at 5:44 AM Thomas Huth &lt;<a href=3D"mailto:thut=
h@redhat.com" target=3D"_blank">thuth@redhat.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:thuth@redhat.com" target=3D"_blank">thuth=
@redhat.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 06/09/2022 18.31, Patrick Venture wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; The register tests walks all the registers to=
 verify they are initially<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; 0 when appropriate.=C2=A0 However, if the MAC=
 address is set in the register<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 space, this should not be checke=
d against 0.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Reviewed-by: Hao Wu &lt;<a href=3D"mailto:wuh=
aotsh@google.com" target=3D"_blank">wuhaotsh@google.com</a> &lt;mailto:<a h=
ref=3D"mailto:wuhaotsh@google.com" target=3D"_blank">wuhaotsh@google.com</a=
>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Change-Id: I02426e39bdab33ceedd42c49d233e8680=
d4ec058<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0What&#39;s that change-id good for?<br>
&gt; <br>
&gt; <br>
&gt; Oops, sorry about that.=C2=A0 I can send out a v2 without it, or durin=
g <br>
&gt; application someone can nicely trim it? :)<br>
<br>
I can take the patch through my qtest branch - I&#39;ll drop the line there=
.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0Basically ack, but one question: Where should that =
non-zero MAC address<br>
&gt;=C2=A0 =C2=A0 =C2=A0come<br>
&gt;=C2=A0 =C2=A0 =C2=A0from / when did you hit a problem here? If QEMU is =
started without any mac<br>
&gt;=C2=A0 =C2=A0 =C2=A0settings at all (like it is done here), the registe=
r never contains a<br>
&gt;=C2=A0 =C2=A0 =C2=A0non-zero value, does it?<br>
&gt; <br>
&gt; <br>
&gt; So, there&#39;s a bug in the emc device presently where that value isn=
&#39;t set <br>
&gt; when it should be.=C2=A0 I have that bug fixed, but for whatever reaso=
n, probably <br>
&gt; not enough caffeine, I didn&#39;t bundle the two patches together.<br>
<br>
OK, makes sense now, thanks for the explanation!<br></blockquote><div><br><=
/div><div>The follow-on patch was just applied to arm.next, so I wanted to =
check if this was applied to your .next or if you wanted a v2.</div></div><=
/div></blockquote><div><br></div><div>Nevermind, sorry for the spam - I alr=
eady saw it in a PULL but forgot to update my internal tracking.=C2=A0 Than=
ks!=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div class=3D"gmail_quote"><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
=C2=A0 Thomas<br>
<br>
<br>
</blockquote></div></div>
</blockquote></div></div>

--00000000000002038605ea6174ad--
