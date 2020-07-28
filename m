Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp781527lfy;
        Tue, 28 Jul 2020 10:10:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxV7X0ziBsiFn+SJOp6miUq/2qYLLq6MRceAU4E/w24xV2r9lvDpKWDInIcZ3YxEDl85Vbk
X-Received: by 2002:a25:6d87:: with SMTP id i129mr42845664ybc.315.1595956226540;
        Tue, 28 Jul 2020 10:10:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595956226; cv=none;
        d=google.com; s=arc-20160816;
        b=gZJMTFT0wJgXcNU564GqyJw3+pywTj/IxS/SplEWBS6ycr+te8kp1+H6qbJErW9uAb
         P4/1Vr8rUHf8nEZVeRNRNT5YxPl8LFEKbsWbpu0/oaVl929aU1nEYpU1qFZGKYoiY+OB
         8ODfHqADWHxIJiE6ZFC38p8DXhW7Z204pvsgif0uxfm8fVuFseDrIHN+WGFRNbAzmlII
         EIsqXHhVXN07ewG9mRDWDSbO0ZuuVzdqlUKPpj5ddspNZctmfSqyGcrGYNz5610Gvdae
         RpEc+lzy3mnX5Y1J+iwIbYkXXU0TgvPOuPmZnKqHEXEduXzraCQXpeL5IlSblNqx/K/G
         FsWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FsJwPj0J7q1c5WS1Za10a1rCAToPv0+pM/y01TvtYlY=;
        b=hsxILgM/QnFlGnDdJPjtM4UiQ0pvDJ+otffobmNd2wdnqd524Ml8w7R8XienNdhfC0
         Fv3DqO2kRRtlFVikCQDE6gbd0Hi77ZnnUV/nP4l+QOfUPmNkfrQrorDvQS/tZrWE8idD
         FwkrNKaHn6JF4h8QQLD8k7u8TcvwkSwyEnq1cjK6749kkZmBsHFgAUV7qPTjDLtTCqvY
         ALMLZxMY8F03ZEPuw2OVSAnqUtuMH0VpbubQEHesctYM7gIWcz6ujxokmMfRGjnW1N2W
         rsyfUj8ZP7f4kWs0BVDLkg4OXBOFb4tVJfcE9hXyGtuLjlrUGf2X8ajsRx+BL6cqyhG8
         g7Cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=aGOe278U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m21si15125865ybf.139.2020.07.28.10.10.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jul 2020 10:10:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=aGOe278U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k0T7R-00069S-UV
	for alex.bennee@linaro.org; Tue, 28 Jul 2020 13:10:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <derrick.mckee@gmail.com>)
 id 1k0T7K-00069F-Uo
 for qemu-arm@nongnu.org; Tue, 28 Jul 2020 13:10:18 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:46257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <derrick.mckee@gmail.com>)
 id 1k0T7J-0001Wn-AN
 for qemu-arm@nongnu.org; Tue, 28 Jul 2020 13:10:18 -0400
Received: by mail-qk1-x729.google.com with SMTP id d14so19333656qke.13
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2020 10:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FsJwPj0J7q1c5WS1Za10a1rCAToPv0+pM/y01TvtYlY=;
 b=aGOe278UYleptMUnV4mHvING86iKHll0n7t+4VbmVcQoz+cOtVakLCicDPMXY1lc/t
 WPWg9oSKLe3P/4NHlqmeCwUrAJeBjszjDgo0fo/SQiCZdoyGLkzEDk4Z5+E3vG0UBTAe
 gAYqEuF0C7S0RvRt/+xJtNXEJf2RQ7diiAGBMp5HPhhzmFvX3/KVtJL+FrVlx5J7gW7u
 QaS7KOXTusP3VO33Ypvt8IQVhJNG7XeqhKF0HcPGFNjK/bdVRa24eMTU473eGJQlW4xF
 Of+Datzmo/nmEfKXKCFfg97wA0Xv9H2nTzl6DkVTqaZ3fFX9BJaWH8u3WH1eVEkzO691
 NgmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FsJwPj0J7q1c5WS1Za10a1rCAToPv0+pM/y01TvtYlY=;
 b=SW0WJxeeq8aMfOxDQeGJWS4NbatyZOODaUdIh6XwGdsKA0i3pd3QyKut6EWBgPbGx+
 X96nOCgarlnF+wtSrm0BbXPgeNqta+kGFCP+EPQDbX+wFvD/KRpqwIc50e0zLtmMhSvb
 FOEYW9z0F/bZWJAg1dRmGx7Rn8LanqnIgdXrqB0p87HpfAWckrH3XGFrwrJ5Ltj6jVQc
 1F5HLoNxGfGJ/L/6Q61DSFhILdPaoESODwyxWemYy7SvQRaEvqUomHhg+Knuk/3RS6gN
 cjCdqsGW5NU2WoijEP57xl8lbgglG+K81LKH3vayg+dOB0QtwtLqqsPtTGbKQJCODb0W
 0tOg==
X-Gm-Message-State: AOAM532trEq5ruhOZhuME0CcP5mVztjdn0q1pwss3GidAMTkqnhAnTvQ
 kj1blkU7LmCVgLUdQwxsa8BF1MVRaQUbqz0KAMA=
X-Received: by 2002:a37:9d0d:: with SMTP id g13mr8040025qke.165.1595956216132; 
 Tue, 28 Jul 2020 10:10:16 -0700 (PDT)
MIME-Version: 1.0
References: <c5b4e931-f475-d0ab-70d4-0100cdb55dbc@linaro.org>
In-Reply-To: <c5b4e931-f475-d0ab-70d4-0100cdb55dbc@linaro.org>
From: Derrick McKee <derrick.mckee@gmail.com>
Date: Tue, 28 Jul 2020 13:10:05 -0400
Message-ID: <CAJoBWHxBv8L1nS_rf85kKPeWkq_E3bTvoMqNu1TRZZvYwg7ANQ@mail.gmail.com>
Subject: Re: Differing PAC behavior between Qemu and Arm FVP
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000056fecf05ab8383d9"
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=derrick.mckee@gmail.com; helo=mail-qk1-x729.google.com
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
Cc: "open list:ARM" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +8TSPjb6aJbX

--00000000000056fecf05ab8383d9
Content-Type: text/plain; charset="UTF-8"

I'm not quite sure if it matters, but I am also using MTE as well.  My
understanding is that the only affect to PAC is that the available
signature bits are reduced  But I am definitely getting a valid pointer
from the second pacda instruction because the autda instruction succeeds.
My application is kinda convoluted because I was testing out a research
idea.  I'll try to come up with a minimal test case, and test it out on the
Qemu master head.

On Tue, Jul 28, 2020 at 11:50 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> > The scenario: Application signs pointer 0xdeadbeef using the pacda
> > instruction to obtain a new pointer 0xXYdeadbeef.  Later, the application
> > wants to generate a new PAC signature for 0xdeadbeef, but uses
> 0xXYdeadbeef
> > as the address for the pacda instruction to generate pointer
> 0xABdeadbeef.
> > Finally, the application wants to authenticate using the autda
> instruction
> > using 0xABdeadbeef and the modifier used to generate that pointer.>
> > Qemu behavior: The autda instruction succeeds and 0xdeadbeef is returned.
> >
> > FVP behavior: The autda instruction fails, and an invalid pointer is
> > returned.  In order for the autda instruction to succeed, the pointer
> > provided to the pacda instruction must have the upper bits set to zero.
> >
> > Is this a bug, or are we not very concerned about corner cases like
> these?
>
> Well, actually, if you haven't already gotten an invalid pointer out of
> step
> two (the second pacda) then *that* is a bug.  And an invalid pointer
> should not
> succeed the autda.
>
> So, yes, this does sound like a bug.
>
> I will see if I can create a test case for this, but if you already have
> one,
> that would also be helpful.
>
>
> r~
>


-- 
Derrick McKee
Phone: (703) 957-9362
Email: derrick.mckee@gmail.com

--00000000000056fecf05ab8383d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m not quite sure if it matters, but I am also using =
MTE as well.=C2=A0 My understanding is that the only affect to PAC is that =
the available signature bits are reduced=C2=A0 But I am definitely getting =
a valid pointer from the second pacda instruction because the autda instruc=
tion succeeds.=C2=A0 My application is kinda convoluted because I was testi=
ng out a research idea.=C2=A0 I&#39;ll try to come up with a minimal test c=
ase, and test it out on the Qemu master head.<br></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 28, 2020 at 11=
:50 AM Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org=
">richard.henderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">&gt; The scenario: Application signs pointer =
0xdeadbeef using the pacda<br>
&gt; instruction to obtain a new pointer 0xXYdeadbeef.=C2=A0 Later, the app=
lication<br>
&gt; wants to generate a new PAC signature for 0xdeadbeef, but uses 0xXYdea=
dbeef<br>
&gt; as the address for the pacda instruction to generate pointer 0xABdeadb=
eef.<br>
&gt; Finally, the application wants to authenticate using the autda instruc=
tion<br>
&gt; using 0xABdeadbeef and the modifier used to generate that pointer.&gt;=
<br>
&gt; Qemu behavior: The autda instruction succeeds and 0xdeadbeef is return=
ed.<br>
&gt; <br>
&gt; FVP behavior: The autda instruction fails, and an invalid pointer is<b=
r>
&gt; returned.=C2=A0 In order for the autda instruction to succeed, the poi=
nter<br>
&gt; provided to the pacda instruction must have the upper bits set to zero=
.<br>
&gt; <br>
&gt; Is this a bug, or are we not very concerned about corner cases like th=
ese?<br>
<br>
Well, actually, if you haven&#39;t already gotten an invalid pointer out of=
 step<br>
two (the second pacda) then *that* is a bug.=C2=A0 And an invalid pointer s=
hould not<br>
succeed the autda.<br>
<br>
So, yes, this does sound like a bug.<br>
<br>
I will see if I can create a test case for this, but if you already have on=
e,<br>
that would also be helpful.<br>
<br>
<br>
r~<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Derrick McKee<br>Phone: (703) 957-9362<br>Email: <a href=3D=
"mailto:derrick.mckee@gmail.com" target=3D"_blank">derrick.mckee@gmail.com<=
/a><br></div>

--00000000000056fecf05ab8383d9--
