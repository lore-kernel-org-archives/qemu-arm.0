Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp2153188lfe;
        Sat, 21 Mar 2020 06:40:55 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vueYXGEgpYtsiDzg4dA0Njp9VPcKfsZyWN+ytldEngZvwJaKEuMsjRi2gh6Ed83G9FtWF84
X-Received: by 2002:a37:5cc2:: with SMTP id q185mr12265800qkb.488.1584798055703;
        Sat, 21 Mar 2020 06:40:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584798055; cv=none;
        d=google.com; s=arc-20160816;
        b=oxhcEUe2bIQUY40zUSja5toRmIDWQnrkxHwIqwnX+QqobA73vzsN86TmRdE3hYSYTZ
         MHpYmGFKMFqQMbO/0YmajvUUOVQq/WZcnDZheO0MB4+zkBPTzZS3lw5w6Jjb2rf2Kyxr
         sZe9kt/3Q3jyoPIBLHT3wCZj/dD5NXRSRBhKguDF14dRThxar+zFwuPeSop81BrKikQs
         8IUXGdhxCVoOUYATHh8r62lTvCoSE5vFhQEpVIs/6STxamFkJZCXobq4voYNpqifRzS8
         BayBL0xsWjRpMbQZG0xw3vqmCYMpCsddUmi827t/t5GpNQYSxePdyBjzWpSb3VjL31XL
         hx6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=p4HXzZVbh/QYOWLxtVfg2M72s5Y67wp6zELlRy3Nl58=;
        b=Z4g4Xw9qxIewlV2EDZv8ZSzaPjz1li4ktCkFJSy3YknKTs4iRqQIPLrzBFfxJjXxQk
         9W6XmGYlLmxn2Qfw7QixTmPB0l37gEHVCtary0XWLkArUcRCGSf5I0A+9p9c5ib/SvZF
         4Erz2syCqv82tJuATVL0urPD8q/rx1LmQ6u1xZQg29zlhPrnDFvYIwPFpnZzHx2HfLhs
         GVjhcsYa5DilQAtRDWijnn/qrlKFoJVNvggkQVZTs3mL8WIikBT9qZQ0iJJ+zXrOGwWF
         /jbG7uFLvKQHoXrk86aC6GsWQoZtb9xBqI0Bpxxx1+3F5WgCNsI17WglVzRVe3BiayFW
         8n+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=q1j8ibuo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n11si3382810qkh.215.2020.03.21.06.40.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Mar 2020 06:40:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=q1j8ibuo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFeMx-0002iM-5i
	for alex.bennee@linaro.org; Sat, 21 Mar 2020 09:40:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50692)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1jFeM3-0001wf-Bp
 for qemu-devel@nongnu.org; Sat, 21 Mar 2020 09:40:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1jFeM2-0002Tl-45
 for qemu-devel@nongnu.org; Sat, 21 Mar 2020 09:39:59 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:40403)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1jFeM1-0002Sp-Rr; Sat, 21 Mar 2020 09:39:58 -0400
Received: by mail-oi1-x243.google.com with SMTP id y71so9661630oia.7;
 Sat, 21 Mar 2020 06:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=p4HXzZVbh/QYOWLxtVfg2M72s5Y67wp6zELlRy3Nl58=;
 b=q1j8ibuoWEUaiNlU0koPNqsiJOA4d+44D/CEvQrrfEWBk8HYcHUrwosVur54km4QAt
 QRjUoWAc7cnvfkUN9i8wrvUSB99ZYR6D3MwDVS+3rdaPRARawWiaVVdSH+H5aM6k0r0G
 8M/N8iuyXSXFsQsLoXr3PzMwTLa6hr7OQtVtvUVpeDbu4xEnVET2apIw39uxj0wq8N7H
 f5Ks3ibwzWPilHYiSNAjEwuuDNzeeB4Y4OGuLolaAAt3hOpv2tNGqF3YC9kqndxHzwNt
 +dilHZXrUSdR12WWwMWYc/DnaoXeMNKqz6jzaSBy9AYxTxV4IdwM8blGlZnODjIOd801
 agyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=p4HXzZVbh/QYOWLxtVfg2M72s5Y67wp6zELlRy3Nl58=;
 b=GLiHVEtts/2GKbcoXy6CiMbrnng9W8eSC601cGVHgZJ5seQOxUtwL//l7AlKsZ+Ifu
 tC/69BCtbxZ/mWICyQ5P/pqo2YvA1W7nQPPRSG6jpCaiyypO71zxYhDVaihNS3wqH3Ih
 FP7xOEhN00Ya4tIaIdUEGsi5y659LDESobfvRwFQC80HB/0CV9zCpA4ZkJmukXHP3hxL
 0PJBG+ecQE+erkBiytYFYiJMz+0E/IWIzU4dsVDfPsP1OB0JyTsFROdKuXvNCuyRQQNT
 LPHOi4ayChaxCCXbiafQk/iSJOXitzosqnMo6MARr5ns2UM0fx7LuoNHTktF0MWl8to7
 fw4Q==
X-Gm-Message-State: ANhLgQ1SsQfOfAyy9EYXJhSMW2GBcaiULQeU9aeMxsQxjT3YVNGDTJN6
 hCbpQ8ft2dmFbWqgUly6IHsZuCGw0tOXkHCVAAA=
X-Received: by 2002:a54:478c:: with SMTP id o12mr10159207oic.106.1584797996903; 
 Sat, 21 Mar 2020 06:39:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:4044:0:0:0:0:0 with HTTP; Sat, 21 Mar 2020 06:39:56
 -0700 (PDT)
In-Reply-To: <20200321114615.5360-6-philmd@redhat.com>
References: <20200321114615.5360-1-philmd@redhat.com>
 <20200321114615.5360-6-philmd@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Sat, 21 Mar 2020 14:39:56 +0100
Message-ID: <CAL1e-=hQPwJ3XKrt4ip2S92ScjyjS63-A4REDeXzyiCt1Phx6A@mail.gmail.com>
Subject: Re: [PATCH-for-5.0 05/11] hw/ide/sii3112: Remove dead assignment
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000a571a805a15d8915"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Michael Tokarev <mjt@tls.msk.ru>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IXGe5XxhymI+

--000000000000a571a805a15d8915
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Saturday, March 21, 2020, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
>
wrote:

> Fix warning reported by Clang static code analyzer:
>
>     CC      hw/ide/sii3112.o
>   hw/ide/sii3112.c:204:9: warning: Value stored to 'val' is never read
>           val =3D 0;
>           ^     ~
>
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/ide/sii3112.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
> index 06605d7af2..36f1905ddb 100644
> --- a/hw/ide/sii3112.c
> +++ b/hw/ide/sii3112.c
> @@ -125,7 +125,7 @@ static uint64_t sii3112_reg_read(void *opaque, hwaddr
> addr,
>          val =3D (uint32_t)d->regs[1].sien << 16;
>          break;
>      default:
> -        val =3D 0;
> +        break;


There is another function in the same file, having a similar switch
statement. There is no warning for that second tunction, since "val" is its
parameter, not a local varioble, like is the case here. This means that the
proposed change introduces inconsistency between two functions, therefore
it is better to remove the initialization of "val" to 0, than to remove
this line in "default" section.

Regards,
Aleksandar



>      }
>      trace_sii3112_read(size, addr, val);
>      return val;
> --
> 2.21.1
>
>
>

--000000000000a571a805a15d8915
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Saturday, March 21, 2020, Philippe Mathieu-Daud=C3=A9 &lt;<a hre=
f=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">Fix warning reported by Clang static code analyzer:<=
br>
<br>
=C2=A0 =C2=A0 CC=C2=A0 =C2=A0 =C2=A0 hw/ide/sii3112.o<br>
=C2=A0 hw/ide/sii3112.c:204:9: warning: Value stored to &#39;val&#39; is ne=
ver read<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^=C2=A0 =C2=A0 =C2=A0~<br>
<br>
Reported-by: Clang Static Analyzer<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/ide/sii3112.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c<br>
index 06605d7af2..36f1905ddb 100644<br>
--- a/hw/ide/sii3112.c<br>
+++ b/hw/ide/sii3112.c<br>
@@ -125,7 +125,7 @@ static uint64_t sii3112_reg_read(void *opaque, hwaddr a=
ddr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D (uint32_t)d-&gt;regs[1].sien &lt;=
&lt; 16;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;</blockquote><div><br></div><div>There i=
s another function in the same file, having a similar switch statement. The=
re is no warning for that second tunction, since &quot;val&quot; is its par=
ameter, not a local varioble, like is the case here. This means that the pr=
oposed change introduces inconsistency between two functions, therefore it =
is better to remove the initialization of &quot;val&quot; to 0, than to rem=
ove this line in &quot;default&quot; section.</div><div><br></div><div>Rega=
rds,</div><div>Aleksandar</div><div><br></div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0trace_sii3112_read(size, addr, val);<br>
=C2=A0 =C2=A0 =C2=A0return val;<br>
-- <br>
2.21.1<br>
<br>
<br>
</blockquote>

--000000000000a571a805a15d8915--
