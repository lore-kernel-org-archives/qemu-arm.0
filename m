Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp273456lfk;
        Tue, 8 Feb 2022 09:27:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzXqG4L/1+xMIiEIlPbW2BZVhTj/rs0OHvt8DiHlHreZ2j5Nxx9NO6gkAraS6d2Oo9KQv64
X-Received: by 2002:a81:a848:: with SMTP id f69mr5695293ywh.79.1644341239899;
        Tue, 08 Feb 2022 09:27:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644341239; cv=none;
        d=google.com; s=arc-20160816;
        b=zIdrbKNpC2jIrpjtR6PLuDc6W1joeJUUOpnzobl04ryin5AbsW08GME2PIGeHpxK/a
         nUTfFKMIk96oGXmdQ1LQi1iiH8sQJroLtARpX2yIQ2jXK2e6b/inClsX7tqdV2TZ6d9/
         PKyxponr//NDJH8z4DuJuQmnwLxjf/+tc0k8t4qVBhICmXH0xlLb7UbIz0QQpCQ1MH3e
         Byn3Dbc+JucODSbL6mKToyGmjg4yU08Bebi75zKef0mw4d7FjvL77H/UllAUFOy4rX7N
         185TBhPziAfvfDMECgtlz22JuzZWalsShId8ZgFPx9drR09uOltSlXdPcoAzZb+nI3sw
         phIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=UxwRn46+LqpiM0nVg34Qzli9ENib652z/RD4xAV+oHs=;
        b=v7pWnpCPYvAwJKjlMErHMPK4z8a35JMqi0rIl7reGH0gxuLYaiGneQGEHX/AJBc/Ql
         MK4YUSh4RLaAL+jfxgs4s2bk8sUGpbUZhc7ngjX5fkAQhABbZusRGVeqhX2pKbpsV2RV
         oaX8DDWyR5bQTlZangQDkZnt8YYyijj967cHjnfDcuyeu0WwbZCFE34S8qf102h/T3YV
         tDl6908CUJtE2kqK0x5VAVxXAd6/YfvAIM5w9V0DPFiJkEF5C0INGdMwMInSQw+L0RWg
         KjAVDGdeM1TUZ9zqkHE3PaA9j/EWK21POB0IoAoReUdvQEyeeh/Cr2Bf9N7KaujN04b3
         8sqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=THEH11tm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d4si9629999ywf.287.2022.02.08.09.27.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Feb 2022 09:27:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=THEH11tm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:34116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nHUGt-00037k-3o
	for alex.bennee@linaro.org; Tue, 08 Feb 2022 12:27:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nHTmY-00075R-I9
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 11:55:58 -0500
Received: from [2607:f8b0:4864:20::931] (port=37828
 helo=mail-ua1-x931.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nHTmW-0007NH-S2
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 11:55:58 -0500
Received: by mail-ua1-x931.google.com with SMTP id 103so11761605uag.4
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 08:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UxwRn46+LqpiM0nVg34Qzli9ENib652z/RD4xAV+oHs=;
 b=THEH11tmqZX+Y6W6q7lBDKLaADb2NXxbkyzdL8mYgkRZ0ktRofY6ABzxaatwhPHBSS
 dMyANcD4/7ed36qh2z1rs0LnEvdrj+QgPpPei4weLmDlgRn7h08HDtDgAeXgARR1Ieas
 +IyR8XZvgCkj/6vbSSqXB4hIz7nTK8H/DLENMkiOgegcWWFsA5kmFBckUMBJbKrYx3pi
 WPAhEwjW77xPZXY7OWI7ioHeFF5+HIzykKd3Li2DUZHsVDfL4qDi0eQvWNboDk/mLbPN
 8gE7YRKmYIwg8fyjLy5SCsQDpghhtBVq1Q09KvOnim/qbMldHQn+6MGXfdbTlu2m+YeQ
 t7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UxwRn46+LqpiM0nVg34Qzli9ENib652z/RD4xAV+oHs=;
 b=eL70WAoEVammHcu454ZnmsvUCPVMpYaqxE55vNJjo7nk0Mf0ZnwEWt6zwSdyHKE3zr
 hZrGI0YY/6YjN9Th4MB/cdkGdSFkSqBNOqJGjVxv1ojok1i9iJUjo9te4JcpPkrfFEt5
 EfJBA6OHCoijBNXEBzIbZ994nrFPNi/A+FZ/U7huISbmsqMcpeMW7pEVz6EcSXMsFzua
 1KevQd/CaCTTqUb9Cqc1+OCW/r2ZKsOnOBz4zDgsJBsVi0b3UJp7sQCC6YlP3hbH9kZI
 ZBSC04qey0/fZZdakOWnVFZUmeK1oRY5/eEcYlM/OGOrStZvXOBhvmhknBUEhhsZGHLd
 b5Nw==
X-Gm-Message-State: AOAM530HDaTnuyb3Bi4IcdHAfr+f6V+DRovzhHIKoRg/YNvgT9gONZsP
 KXoPanC+xlOB8D5K8ay8OEaG6thRyMEPNirS74o0fA==
X-Received: by 2002:ab0:72c2:: with SMTP id g2mr1766181uap.15.1644339352284;
 Tue, 08 Feb 2022 08:55:52 -0800 (PST)
MIME-Version: 1.0
References: <20220206014120.2871459-1-venture@google.com>
 <CAFEAcA_k0y3gtzpi_0JG7TM=VaAa8+mb=tLSu7UHCRYhDWajZg@mail.gmail.com>
 <CAO=notxRLDdi8kyksyz2m09Hf52VK0FypmCf=g_-1S35jocnuw@mail.gmail.com>
In-Reply-To: <CAO=notxRLDdi8kyksyz2m09Hf52VK0FypmCf=g_-1S35jocnuw@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 8 Feb 2022 08:55:41 -0800
Message-ID: <CAO=notw9NfXCzieGRXk-fwFjJMGHiGCX+7Q7WMx78rifsrmrfQ@mail.gmail.com>
Subject: Re: [PATCH v2] tests/qtest: add qtests for npcm7xx sdhci
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 qemu-arm <qemu-arm@nongnu.org>, Havard Skinnemoen <hskinnemoen@google.com>, 
 CS20 KFTing <kfting@nuvoton.com>, Shengtan Mao <stmao@google.com>,
 Hao Wu <wuhaotsh@google.com>, Chris Rauer <crauer@google.com>
Content-Type: multipart/alternative; boundary="000000000000fc208205d784967f"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::931
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=venture@google.com; helo=mail-ua1-x931.google.com
X-Spam_score_int: -167
X-Spam_score: -16.8
X-Spam_bar: ----------------
X-Spam_report: (-16.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f3hco6vXtTax

--000000000000fc208205d784967f
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 7, 2022 at 3:07 PM Patrick Venture <venture@google.com> wrote:

>
>
> On Mon, Feb 7, 2022 at 9:34 AM Peter Maydell <peter.maydell@linaro.org>
> wrote:
>
>> On Sun, 6 Feb 2022 at 01:41, Patrick Venture <venture@google.com> wrote:
>> >
>> > From: Shengtan Mao <stmao@google.com>
>> >
>> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
>> > Reviewed-by: Chris Rauer <crauer@google.com>
>> > Signed-off-by: Shengtan Mao <stmao@google.com>
>> > Signed-off-by: Patrick Venture <venture@google.com>
>> > ---
>> > v2:
>> >  * update copyright year
>> >  * check result of open
>> >  * use g_free instead of free
>> >  * move declarations to the top
>> >  * use g_file_open_tmp
>>
>> Fails to compile:
>>
>> ../../tests/qtest/npcm7xx_sdhci-test.c:121:32: error: use of
>> undeclared identifier 'NPCM7XX_REG_SIZE'
>>     uint64_t end_addr = addr + NPCM7XX_REG_SIZE;
>>                                ^
>>
>
> Thanks. I must have only compiled at a part-way point while tweaking it.
> I'll see if it compiles for me, and then figure out why it does when it
> doesn't, or if it doesn't, then obviously fix it.  Either way, will fix in
> v3, thanks.
>

Validated that when I build it, it's not getting built :)  So that's why
this slipped through.  I'll dig into the history to see what this value
should be now.


>
>
>>
>>
>> -- PMM
>>
>

--000000000000fc208205d784967f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 7, 2022 at 3:07 PM Patric=
k Venture &lt;<a href=3D"mailto:venture@google.com">venture@google.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 7, 2022 at 9:34 AM Peter Mayde=
ll &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank">peter.=
maydell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Sun, 6 Feb 2022 at 01:41, Patrick Venture &lt;<a href=
=3D"mailto:venture@google.com" target=3D"_blank">venture@google.com</a>&gt;=
 wrote:<br>
&gt;<br>
&gt; From: Shengtan Mao &lt;<a href=3D"mailto:stmao@google.com" target=3D"_=
blank">stmao@google.com</a>&gt;<br>
&gt;<br>
&gt; Reviewed-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=
=3D"_blank">wuhaotsh@google.com</a>&gt;<br>
&gt; Reviewed-by: Chris Rauer &lt;<a href=3D"mailto:crauer@google.com" targ=
et=3D"_blank">crauer@google.com</a>&gt;<br>
&gt; Signed-off-by: Shengtan Mao &lt;<a href=3D"mailto:stmao@google.com" ta=
rget=3D"_blank">stmao@google.com</a>&gt;<br>
&gt; Signed-off-by: Patrick Venture &lt;<a href=3D"mailto:venture@google.co=
m" target=3D"_blank">venture@google.com</a>&gt;<br>
&gt; ---<br>
&gt; v2:<br>
&gt;=C2=A0 * update copyright year<br>
&gt;=C2=A0 * check result of open<br>
&gt;=C2=A0 * use g_free instead of free<br>
&gt;=C2=A0 * move declarations to the top<br>
&gt;=C2=A0 * use g_file_open_tmp<br>
<br>
Fails to compile:<br>
<br>
../../tests/qtest/npcm7xx_sdhci-test.c:121:32: error: use of<br>
undeclared identifier &#39;NPCM7XX_REG_SIZE&#39;<br>
=C2=A0 =C2=A0 uint64_t end_addr =3D addr + NPCM7XX_REG_SIZE;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br></blockquote><div><br></div><div=
>Thanks. I must have only compiled at a part-way point while tweaking it.=
=C2=A0 I&#39;ll see if it compiles for me, and then figure out why it does =
when it doesn&#39;t, or if it doesn&#39;t, then obviously fix it.=C2=A0 Eit=
her way, will fix in v3, thanks.</div></div></div></blockquote><div><br></d=
iv><div>Validated that when I build it, it&#39;s not getting built :)=C2=A0=
 So that&#39;s why this slipped through.=C2=A0 I&#39;ll dig into the histor=
y to see what this value should be now.</div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_q=
uote"><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
-- PMM<br>
</blockquote></div></div>
</blockquote></div></div>

--000000000000fc208205d784967f--
