Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp257719lfk;
        Mon, 7 Feb 2022 15:08:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDVwhd9gpGuAImxfTJwegD66riKKpFeKDQ/bbUZV7h4NQ9BjjaYEpYN9nvqy5q1otiFg0R
X-Received: by 2002:a05:6902:124f:: with SMTP id t15mr2345053ybu.640.1644275330433;
        Mon, 07 Feb 2022 15:08:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644275330; cv=none;
        d=google.com; s=arc-20160816;
        b=zHBDqqtsh34iNtUebe69uE+sgZfslSszYT0jvRoOjsW+sRG0s07guWP2U1qWvyuWlM
         xSU9H0qPyj5pyD8FZpblzbaqB7nklWANX8A81IaqIyMbMnJiHjttD2JYkHx5Jty/fT1i
         vno+dIftwK1Z2w7ZXPO9a3v6+3nKr33qQhN4ocCMcNf6nZc1WHHSxEGwvl8v0vikRx14
         2DfJic4w1f3oec8F0fvUk0jr8Yx5gMBY4nfXEjECdXi9ay3Peu+tRofiqs3+AbO/YgQA
         kUaeLOK35u0RkHXhZrg5/hyKxZ0HELmoPB6sg4+mVBVhe/Q1xiCIP+A6QI7dsd3o29rZ
         DUQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=NmeIx7dKOmoGHLkloXQGsgcllY46lrPhn7mMEkZvOlE=;
        b=NZuLSfIvqjDYVWDaAMaPxQCwM5gzukPGI97snEoX3dzuzw5AiE4Hjud2Kkg//p0EDk
         k/sRCXrVBteL7hld9CU1kMp1tl1A3WgOTqoU7AQi/LLBpKwXqLuwvBl2YpE3GezwCayn
         FUUAW7iS4Ki50qu5e9RfK9vvdxygErphyvAqAl4gOF4DCYz8F6DqWqsF04+YAh3l7kMg
         dFtC7EnRGjs6zEsbhH41/DgaUUsWuTshpPG/5Cey2r2JTUg44vsBHoBxEDavN1vU/u+g
         UN6MMpB9YKQurlzlkbSQ0oMWWC1QheN6xAjdsLL09hyspKCdtR0HV9sS0KNIWnEMNjKD
         E2YA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=LXoWlUxw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t64si10072544ywb.446.2022.02.07.15.08.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Feb 2022 15:08:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=LXoWlUxw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:55018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nHD7p-0005H9-Qy
	for alex.bennee@linaro.org; Mon, 07 Feb 2022 18:08:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nHD7L-0005E7-OC
 for qemu-arm@nongnu.org; Mon, 07 Feb 2022 18:08:23 -0500
Received: from [2607:f8b0:4864:20::e2b] (port=36675
 helo=mail-vs1-xe2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nHD7J-0001NT-0K
 for qemu-arm@nongnu.org; Mon, 07 Feb 2022 18:08:19 -0500
Received: by mail-vs1-xe2b.google.com with SMTP id l14so1437638vsm.3
 for <qemu-arm@nongnu.org>; Mon, 07 Feb 2022 15:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NmeIx7dKOmoGHLkloXQGsgcllY46lrPhn7mMEkZvOlE=;
 b=LXoWlUxw/A15n0RFk/84Ju6E2QUes+8qkw8yfoDKPbUhdNibOE33tcn/9yazeE0KYL
 lifVR0yJCDsYuMSeZz2cjMfhGzKQkaI03RVnp31UNwshLQtZlW8bME9xsofTXsEwWtuK
 c8v17HiudLkO5tdBlSVGFjSuq7DirhknNoEd7tqaZKGiUPArPDy9C4w/y4VMlgYD/60D
 1P9t2eOeRG3FSdnuzbPqvvOzpWxDtkZgUXGtLowxao/snK1NCqTbqVXb+1uNZzQ2+EvV
 zsog/WR/jBQVSkfLEer8ZpkFk3GIcpIVWYlt0tJDUBRRnSWsn1AMdh0lAHraSySYbek+
 qofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NmeIx7dKOmoGHLkloXQGsgcllY46lrPhn7mMEkZvOlE=;
 b=Um+oyPhM9I9RyLyRnvD8vremhPts8GgYFGKBZQqfTTqzFjtQw+vsrnzV8RRLGtAyya
 U5hC1bnlnEnC/JjedpECFdhNw0pumMfe9qKW/o4QlRBmAresT8Au+lQ3HCFTjNCtvkha
 ALxwosYC6krFs15BjRhqzbfKI+2MsaPHxiC9BbeHQaqZ1SIWpy0u2ko7N0kvsENihNxC
 0STWOxI1a0yI4IszwDIHQr2LUuhDY2JVjKOVxlT+ijwLx7GjyrsinTvqnjU4odGyB93f
 D88IQhJleHoJvVM2UuoWHSG7LnfPJVmZm6L0rLLh3PhqgHe1xoEnPPGnSAyQ3eX/GV+y
 cB2g==
X-Gm-Message-State: AOAM531+P85t1hhUk4dAVuNQDw5kPp9mzNR7s3dCUiSu7/gEGKYQeC22
 rwO67QoaF1QRaY0HmlMq0ZI6eXPN9KxGNcEpWI8RGw==
X-Received: by 2002:a67:6ec5:: with SMTP id j188mr728277vsc.36.1644275283224; 
 Mon, 07 Feb 2022 15:08:03 -0800 (PST)
MIME-Version: 1.0
References: <20220206014120.2871459-1-venture@google.com>
 <CAFEAcA_k0y3gtzpi_0JG7TM=VaAa8+mb=tLSu7UHCRYhDWajZg@mail.gmail.com>
In-Reply-To: <CAFEAcA_k0y3gtzpi_0JG7TM=VaAa8+mb=tLSu7UHCRYhDWajZg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 7 Feb 2022 15:07:52 -0800
Message-ID: <CAO=notxRLDdi8kyksyz2m09Hf52VK0FypmCf=g_-1S35jocnuw@mail.gmail.com>
Subject: Re: [PATCH v2] tests/qtest: add qtests for npcm7xx sdhci
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 qemu-arm <qemu-arm@nongnu.org>, Havard Skinnemoen <hskinnemoen@google.com>, 
 CS20 KFTing <kfting@nuvoton.com>, Shengtan Mao <stmao@google.com>,
 Hao Wu <wuhaotsh@google.com>, Chris Rauer <crauer@google.com>
Content-Type: multipart/alternative; boundary="0000000000002bf2b405d775ace0"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::e2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=venture@google.com; helo=mail-vs1-xe2b.google.com
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
X-TUID: /+vnYCDp2lU9

--0000000000002bf2b405d775ace0
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 7, 2022 at 9:34 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Sun, 6 Feb 2022 at 01:41, Patrick Venture <venture@google.com> wrote:
> >
> > From: Shengtan Mao <stmao@google.com>
> >
> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
> > Reviewed-by: Chris Rauer <crauer@google.com>
> > Signed-off-by: Shengtan Mao <stmao@google.com>
> > Signed-off-by: Patrick Venture <venture@google.com>
> > ---
> > v2:
> >  * update copyright year
> >  * check result of open
> >  * use g_free instead of free
> >  * move declarations to the top
> >  * use g_file_open_tmp
>
> Fails to compile:
>
> ../../tests/qtest/npcm7xx_sdhci-test.c:121:32: error: use of
> undeclared identifier 'NPCM7XX_REG_SIZE'
>     uint64_t end_addr = addr + NPCM7XX_REG_SIZE;
>                                ^
>

Thanks. I must have only compiled at a part-way point while tweaking it.
I'll see if it compiles for me, and then figure out why it does when it
doesn't, or if it doesn't, then obviously fix it.  Either way, will fix in
v3, thanks.


>
>
> -- PMM
>

--0000000000002bf2b405d775ace0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 7, 2022 at 9:34 AM Peter =
Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On Sun, 6 Feb 2022 at 01:41, Patrick Venture &lt;<a href=3D"mailto:ven=
ture@google.com" target=3D"_blank">venture@google.com</a>&gt; wrote:<br>
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
her way, will fix in v3, thanks.</div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
<br>
<br>
-- PMM<br>
</blockquote></div></div>

--0000000000002bf2b405d775ace0--
