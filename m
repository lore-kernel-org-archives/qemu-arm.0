Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1131630lfb;
        Tue, 12 May 2020 05:50:03 -0700 (PDT)
X-Google-Smtp-Source: APiQypJjI/HMF2ODjPFnA3AUITJ83UObJAlDtyCAgKH9N9zwdVaiLaC3cqBYlsBaTHyc7QwqBcFL
X-Received: by 2002:a0c:8045:: with SMTP id 63mr20786915qva.68.1589287803758;
        Tue, 12 May 2020 05:50:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589287803; cv=none;
        d=google.com; s=arc-20160816;
        b=xd0hrssSnyfeNU5d8WkVvUHkvsSjn59CHbdBH8swby1eS8yqec1aRXryW09nPy57Xp
         BwAYY3tRDluLqZmtdtXHRTejLxYTfLfKLPPk+1avS/j1OGraqO76kSHFp1VIGBXwOtZY
         thMyK/8ldH19GQyz0UCJkGnW0agEVxVu/PssPXQyolORyAW/y/JfbNs60sB0B1arNw/x
         qwXYdg8OKw2uSfJRLAQ3+dn9gW63tPwi3ovdSBKHzi/fNvOo3Ri1jeAHiY4XcvIRhgTn
         h+6k0a9AsQzzqxZVWo0XQsZ7icqjR/Lqfr4r2G4Y4jF9u9xZ+MOO3UM3VwQi6uGcdJnY
         9puw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A6r3NaFnAcVrEeMqXBb5G94A6MKmDfEU/jj3VfxkxEo=;
        b=w8LsCNvFO70ULz7PlLcRjqypzzw1OIXG4ayabbMMHCvFgPPWrBHMcaU1TeHR7vVP+E
         MgVEsedMUu6rDs3f/PHQ8kvbs5mVjXvnQN3NdNnbJLYwVBtn8IXYXwMzi9obbJgjeQuP
         KKFizgph4n7iCpUfVYF+LK3RW7TUD8kUkmPjSTlm68y6lN0lDOEOwNQzvQ/jqEeaKlxi
         mrVkjlydpMEGqRRjtTcX7KkEwVej3/Cw5MzSTkFewClrN7TflK3Om2doiC0Saqixdv8T
         ZPbN9mS6puHzFjkrZDtRO6oeQAkAvyZzXvpwpwOjv14piCoymbQ0ZlOlQL7XZGT6Y2Co
         SdZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=A6KPWvUB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eb10si768462qvb.88.2020.05.12.05.50.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 May 2020 05:50:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=A6KPWvUB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jYUMF-0004sM-5R
	for alex.bennee@linaro.org; Tue, 12 May 2020 08:50:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <radoslaw.biernacki@gmail.com>)
 id 1jYT03-0004ab-B3; Tue, 12 May 2020 07:23:03 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:39856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <radoslaw.biernacki@gmail.com>)
 id 1jYT01-0002Qd-Fp; Tue, 12 May 2020 07:23:02 -0400
Received: by mail-ot1-x32c.google.com with SMTP id m13so10164364otf.6;
 Tue, 12 May 2020 04:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A6r3NaFnAcVrEeMqXBb5G94A6MKmDfEU/jj3VfxkxEo=;
 b=A6KPWvUBtQC0Vzwotm99EbXHRuICLUByTW2St1ZPGDjmca70SOwXf8z8zBBawAjMlc
 K/euaAM2YB+Zb0lsPoJnFvm7BY8XmpBvCtjjq9Z1hUiY4R+GAzdBUEBF3lFeT3BSTnrg
 bQQ8VARsBqizeTgDR9xTk9ylviYVZH1ughlMxS1ZCcudqR17RQXRpSs2FzGCkY5CoyTg
 KUTYykBXYCRDBcHcy7ks3r3zd8LUYLAN5Z0ZvX9SBS+uuV1IwGu8xyzUAnwLdS2qTc6e
 NyZ/XMZdg5Yr/yAhZpt84znrwiD0+3QLF5PEcFhNNj3sOFWwFouR02mOB/UMhrCxkVWt
 3tiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A6r3NaFnAcVrEeMqXBb5G94A6MKmDfEU/jj3VfxkxEo=;
 b=uUtkQeEULwIkObo8guQtvEoj0RNiwe3/0iAgeHx2JpvKRyjLE4/M0zJBLrxsXee9RA
 XgtXF1VwB2LXCxL3Q07ix0ZGwI3rkaRiyZs2hsP4yf1p9XloU0RfVnZ4NTdnHCyEu+YR
 4ynb0DXuZw11DOETrD1k9oH9MqruNa2JHIEhjfe8DESITimI1xuRyh5x8PfiSTXx4WZg
 ZNz4ckU+PG39SDWnpUi1xV0Ntn/HJG7vHWlEiWuvD5/eMEZzM5VyjSGmjFxSTeClDgBc
 BY5UIIRps5P8a6iCTIyrhJv51EryUi5/OGBfIXg5BXypjuVly19m0b/6x3g+zr/y846v
 xjGA==
X-Gm-Message-State: AGi0PubWESvZj1ARAiASx+xVLu4CGK4tJi16Mbe7ujwlW0Ld3XpvkAiG
 zQEa0kfnbKFsgvrw3yILMgptWQ8XAK4aSr7eiLc=
X-Received: by 2002:a05:6830:1b65:: with SMTP id
 d5mr15417069ote.141.1589282579309; 
 Tue, 12 May 2020 04:22:59 -0700 (PDT)
MIME-Version: 1.0
References: <dcb8d325-a2af-0c68-ad64-87f41521d4bb@redhat.com>
 <20200512093717.GZ21486@vanye>
In-Reply-To: <20200512093717.GZ21486@vanye>
From: Radoslaw Biernacki <radoslaw.biernacki@gmail.com>
Date: Tue, 12 May 2020 13:22:49 +0200
Message-ID: <CADp3C4vtiHnrcXCTzj-bUOCs=G=V6ayAtn9L7nEf+0BQSxDcWg@mail.gmail.com>
Subject: Re: SBSA-REF maintainer email bouncing
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: multipart/alternative; boundary="0000000000009669fb05a571af28"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=radoslaw.biernacki@gmail.com; helo=mail-ot1-x32c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 12 May 2020 08:48:17 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Uk6EFnVPHM6P

--0000000000009669fb05a571af28
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes my Linaro account is not active anymore.
I will sent a patch witch email update to rad@semihalf.com as this is my
company's email.

wt., 12 maj 2020, 11:37 u=C5=BCytkownik Leif Lindholm <leif@nuviainc.com>
napisa=C5=82:

> On Tue, May 12, 2020 at 08:34:13 +0200, Philippe Mathieu-Daud=C3=A9 wrote=
:
> > Hello,
> >
> > Radoslaw Biernacki is listed as maintainer for the SBSA-REF board.
> >
> > His radoslaw.biernacki@linaro.org email address no longer works,
> > apparently "Radoslaw Biernacki no longer works for Linaro".
>
> That was probably technically the case already when the patches went
> in, but Radek was given an "associate account" for continuity.
>
> I'm digging into what happened (although as _I_ don't work for Linaro
> anymore, that might take a bit longer than it otherwise would have).
>
> /
>     Leif
>
> >   SBSA-REF
> >   M: Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
> >   M: Peter Maydell <peter.maydell@linaro.org>
> >   R: Leif Lindholm <leif@nuviainc.com>
> >   L: qemu-arm@nongnu.org
> >   S: Maintained
> >   F: hw/arm/sbsa-ref.c
> >
>

--0000000000009669fb05a571af28
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Yes my Linaro account is not active anymore.<div dir=3D"a=
uto">I will sent a patch witch email update to <a href=3D"mailto:rad@semiha=
lf.com">rad@semihalf.com</a> as this is my company&#39;s email.</div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">wt., 1=
2 maj 2020, 11:37 u=C5=BCytkownik Leif Lindholm &lt;<a href=3D"mailto:leif@=
nuviainc.com">leif@nuviainc.com</a>&gt; napisa=C5=82:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">On Tue, May 12, 2020 at 08:34:13 +0200, Philippe Mathieu=
-Daud=C3=A9 wrote:<br>
&gt; Hello,<br>
&gt; <br>
&gt; Radoslaw Biernacki is listed as maintainer for the SBSA-REF board.<br>
&gt; <br>
&gt; His <a href=3D"mailto:radoslaw.biernacki@linaro.org" target=3D"_blank"=
 rel=3D"noreferrer">radoslaw.biernacki@linaro.org</a> email address no long=
er works,<br>
&gt; apparently &quot;Radoslaw Biernacki no longer works for Linaro&quot;.<=
br>
<br>
That was probably technically the case already when the patches went<br>
in, but Radek was given an &quot;associate account&quot; for continuity.<br=
>
<br>
I&#39;m digging into what happened (although as _I_ don&#39;t work for Lina=
ro<br>
anymore, that might take a bit longer than it otherwise would have).<br>
<br>
/<br>
=C2=A0 =C2=A0 Leif<br>
<br>
&gt;=C2=A0 =C2=A0SBSA-REF<br>
&gt;=C2=A0 =C2=A0M: Radoslaw Biernacki &lt;<a href=3D"mailto:radoslaw.biern=
acki@linaro.org" target=3D"_blank" rel=3D"noreferrer">radoslaw.biernacki@li=
naro.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0M: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linar=
o.org" target=3D"_blank" rel=3D"noreferrer">peter.maydell@linaro.org</a>&gt=
;<br>
&gt;=C2=A0 =C2=A0R: Leif Lindholm &lt;<a href=3D"mailto:leif@nuviainc.com" =
target=3D"_blank" rel=3D"noreferrer">leif@nuviainc.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0L: <a href=3D"mailto:qemu-arm@nongnu.org" target=3D"_blank=
" rel=3D"noreferrer">qemu-arm@nongnu.org</a><br>
&gt;=C2=A0 =C2=A0S: Maintained<br>
&gt;=C2=A0 =C2=A0F: hw/arm/sbsa-ref.c<br>
&gt; <br>
</blockquote></div>

--0000000000009669fb05a571af28--
