Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2824798lfg;
        Wed, 26 Feb 2020 01:33:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqyUeO2OP6TEnHTXSbCcJ+k9NB6QiiiS2lq+jrSmgBlNuQksTUkVfeMZsGi4oT4Dn3hW6lMU
X-Received: by 2002:ac8:4659:: with SMTP id f25mr3928403qto.273.1582709580152;
        Wed, 26 Feb 2020 01:33:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582709580; cv=none;
        d=google.com; s=arc-20160816;
        b=SBQnXYkbXIdGWr4s6Hd7yuzck1t+/P1hUwvvuyghARqQz2/FHrndxw4W8+DvnbA3dx
         T8GopVRoAbhkt63En4GWGrYcjiD3C0muiV2U+iPgm0cYliHD5OxO2fLzadHiCRmLX/MT
         9dJxrfDeI6v7VAiEL/Juizr5obvhvjAUCvi26nb+lK7au3KNvLy3RdEl1ArzWBa0FKEt
         TJ8blTRHeIuR4ERgOFbngw4kjvzGP2X5FkfjzJlrI46rSYRKbgblTKSPPPNjtPlFMhvP
         du3U/mSB4oaRNrL3UbjnZjKen2kojnIuP3XbbwzNZ9hvvKCmdh6fYUQYGDNtnahDcBbf
         +4dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sTxTWxs9ibr9SOfGmEzWE9VTkqwAdNoBkiyD4216zPQ=;
        b=TinqCuAqha+DboMfaFyD+Fyk1TU4v/7wVHCHTcBBFV4TQY05dr0aVyp62cC3vucJjx
         1zTLYVGnldAjeV3n8jnU7toPnDoB+/86uDGW+uyk9JbBH/FGq86uJBoczfWT6692LWeJ
         Z/aHLz83HExDLsHFTAYRnOUrpXfQlTrM9UyCF/Uc7f4jebgGqE2TMro0a4bOp6NBYZ6u
         psP7JZwufbEC2ISZL6r7501qE0NvDaSKNdsykG/jHsl8Fj+CxXInYT5Hq4klWvgrQ2fa
         13lcOZYnL+RljXYsMJgiui8K49ohrqDxBLrNFMht5FVNfIT8LxV/P3oyvNyoc1j8Mzrp
         qAdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ggb7DDzP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i11si664452qvt.120.2020.02.26.01.32.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 01:33:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ggb7DDzP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6t3r-0001Uh-IX
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 04:32:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46965)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <hsp.cat7@gmail.com>) id 1j6t3j-0001UP-OE
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 04:32:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <hsp.cat7@gmail.com>) id 1j6t3i-0008II-L4
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 04:32:51 -0500
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:33794)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <hsp.cat7@gmail.com>)
 id 1j6t3i-0008Ex-FY; Wed, 26 Feb 2020 04:32:50 -0500
Received: by mail-oi1-x22d.google.com with SMTP id l136so2397325oig.1;
 Wed, 26 Feb 2020 01:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sTxTWxs9ibr9SOfGmEzWE9VTkqwAdNoBkiyD4216zPQ=;
 b=ggb7DDzPY1wcF4IR9ockCQBFCDd4XShvYIwrahtfC2y7QQkQ1k8xQIFDlrXEtuO7/r
 s7uVPr7CcK+YdDoEjRm5dVSaexFbW3r5j1rw418HLcrxDWDiDxp2gG8II2LbK49EfMte
 1i9ZxoDazk7DlTqsY0RoM0tjHTiK6zlcSdKNKacaJO5uvHJdb6XDHYTCIyhsFz/pTVOd
 4jjvtydpBQi1g1TwuNkzn7KtHnctIf4sDZ1ao7X6G11eRAyLKkTmKSHsW7u/9MUpEciv
 9tr416K74TLodXlFhE690E+YtCbRKwnX+gdbkdZ8L9Y9RMtyZJOOkqTLQ+PG/zdY9jaU
 cAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sTxTWxs9ibr9SOfGmEzWE9VTkqwAdNoBkiyD4216zPQ=;
 b=PidYDBFqEzziyJg4A1WFv7tYOgYwP/Om61+L8Skxxc4lJuI+NZqNu2vDNW+PhfjosC
 h+CcSDykVEvn648zZUUexvHCgDbBUeafWKx4yfE2lkpaTnygY8Af6UZxaamR/nuTAbOo
 xkd/iNY1q/zpjRCLzo+SXKibWI8odGId9M0HYinFEi7U/wBX2yJrivhRtli6ixl9hD5g
 /jmD8bQo4KyMUDSniKdSk0F8nH70j8uMKMih0vMieZCiUGueN+LvY90G5YJH9RlAJFnI
 BlURKWlYkjYE5Q4NwA+HyWCaX9LX7sN28qevQEXplpLQhC4cHdNpSfXKDsnQH1u0pCip
 Ceew==
X-Gm-Message-State: APjAAAUGhIjkgB91I+u+h1IFz9CGDfgrY/T736jbqLpTRcT9lIEKPFKe
 lWTHryGkgNS+AZplxKkDIognIEObs94t4Fkw3hQ=
X-Received: by 2002:a05:6808:209:: with SMTP id
 l9mr2346556oie.112.1582709569687; 
 Wed, 26 Feb 2020 01:32:49 -0800 (PST)
MIME-Version: 1.0
References: <CAPan3Wq-MVwcJQELP8n+g33CR7tsiGXQ698gA177nd2my9hWCw@mail.gmail.com>
 <20200226101948.786be4b0@redhat.com>
In-Reply-To: <20200226101948.786be4b0@redhat.com>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Wed, 26 Feb 2020 10:32:38 +0100
Message-ID: <CABLmASFMv5MziuMKBdi0wydB9bKVZ-uYJ4_B_0a-YUQVk0nHYw@mail.gmail.com>
Subject: Re: Sudden slowdown of ARM emulation in master
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000af1356059f774996"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::22d
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JrWW6AN7wLQo

--000000000000af1356059f774996
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 26, 2020 at 10:19 AM Igor Mammedov <imammedo@redhat.com> wrote:

> On Wed, 26 Feb 2020 00:07:55 +0100
> Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
>
> > Hello Igor and Paolo,
>
> does following hack solves issue?
>
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index a08ab11f65..ab2448c5aa 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -944,7 +944,7 @@ static inline size_t size_code_gen_buffer(size_t
> tb_size)
>          /* ??? If we relax the requirement that CONFIG_USER_ONLY use the
>             static buffer, we could size this on RESERVED_VA, on the text
>             segment size of the executable, or continue to use the
> default.  */
> -        tb_size = (unsigned long)(ram_size / 4);
> +        tb_size = MAX_CODE_GEN_BUFFER_SIZE;
>  #endif
>      }
>      if (tb_size < MIN_CODE_GEN_BUFFER_SIZE) {
>
>

Nice, for me, that brings qemu-system-ppc back up to speed. (applied to
ppc-for-5.0)

Best,
Howard

--000000000000af1356059f774996
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 26, 2020 at 10:19 AM Igor=
 Mammedov &lt;<a href=3D"mailto:imammedo@redhat.com">imammedo@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
Wed, 26 Feb 2020 00:07:55 +0100<br>
Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.com" target=3D"_=
blank">nieklinnenbank@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Hello Igor and Paolo,<br>
<br>
does following hack solves issue?<br>
<br>
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c<br>
index a08ab11f65..ab2448c5aa 100644<br>
--- a/accel/tcg/translate-all.c<br>
+++ b/accel/tcg/translate-all.c<br>
@@ -944,7 +944,7 @@ static inline size_t size_code_gen_buffer(size_t tb_siz=
e)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* ??? If we relax the requirement that C=
ONFIG_USER_ONLY use the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 static buffer, we could size this=
 on RESERVED_VA, on the text<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 segment size of the executable, o=
r continue to use the default.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tb_size =3D (unsigned long)(ram_size / 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tb_size =3D MAX_CODE_GEN_BUFFER_SIZE;<br>
=C2=A0#endif<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0if (tb_size &lt; MIN_CODE_GEN_BUFFER_SIZE) {<br>
<br></blockquote><div>=C2=A0</div><div><br></div><div>Nice, for me, that br=
ings qemu-system-ppc back up to speed. (applied to ppc-for-5.0)<br></div><d=
iv><br></div><div>Best,</div><div>Howard<br></div></div></div>

--000000000000af1356059f774996--
