Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1192693njf;
        Mon, 2 Sep 2024 11:06:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVibpGhS0/3yihHwTI2w7SwUDU3/87kpmaxBrvgpnbzpw817J1MxwNDHWadPwJI5DjeubayFOdflDf9xA==@linaro.org
X-Google-Smtp-Source: AGHT+IE/nLrvX9f+HHVGzrXhMQU44nSomwY8vOjvSzUXmX9kvUKfXI/lT0hZjZsI3iXie1Xjk0C9
X-Received: by 2002:a05:6214:d0c:b0:6bd:6a90:6472 with SMTP id 6a1803df08f44-6c33f324af8mr227397276d6.1.1725300370768;
        Mon, 02 Sep 2024 11:06:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725300370; cv=none;
        d=google.com; s=arc-20160816;
        b=HphR4rz1Cm4GeqJIXLDeBaWoxyRjrY+tI0TYbP9pQ8VoEZS5f2DEJcWex/TR1Wn06Y
         CY29fdKuPwDUdud9lINcggyTlkkHg1/2J3yyQdtJHdnJ52g/a6+J3Onz9/i2118JZJ5/
         bQ7iOpsdhRaKqqy+IXLFStbqOKh7rV3fMbbBm+uijpknubuGRxdshEYGZvFqOFwA2jKn
         FSMPwynlLmSlxOlrFAyrYk19mOwHj0G700iFfzA8JaxobGqnvuz8CnHxYFbd1y3cLk3N
         DvXY7gfb+VNF74S/Nji+1QBUQe4PjdcnNYHeNZeS7oF4iaMsvcQ7QMAXUy9qwjtssV+E
         f1tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=scdLjxZ6c+nUQQ2pGFqyGIqVXyjsh7wtCGzACeH0hGI=;
        fh=tTAzZB8f74h4IcMKpGe5/rNDTYRFiK/KeeSJhGnXuNs=;
        b=iTCk14TXOdvV87ErziT2nhleQOb+uXyWmXp+f8HCxwtOh4WiaJyRjdx1Hun0K4d3PR
         nVQV4oOWMGbq2HIOaAfMCk4v3s1meRm/DQgxHWQR4BG4cmIQYn8Z538+MnImWiO7cbco
         49lR+fs6Hl9iqvzjGqJhjKSnNiBVUWRaGKNc+GhraIExDF0djlVc81yTvvq3k0xVvLro
         BxuixiatssbYvL7uENYVYo0aqpBZ7e2P8obMpzxigj6l1ZFib38xA3hS/Tbr2pIK0UAp
         hgzULtxq9oeF71OaktnA/uP90mMo5DOtitqGbqrG7aWwSmMWTOK/TbjGQhTRfk59Y80U
         Qg6w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=OHEkTS2G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c35116a7b3si77469326d6.388.2024.09.02.11.06.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Sep 2024 11:06:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=OHEkTS2G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slBQv-000280-2F; Mon, 02 Sep 2024 14:05:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1slBQu-000267-3O; Mon, 02 Sep 2024 14:05:44 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1slBQr-0003FI-Nc; Mon, 02 Sep 2024 14:05:43 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-2d87176316eso2057017a91.0; 
 Mon, 02 Sep 2024 11:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725300339; x=1725905139; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=scdLjxZ6c+nUQQ2pGFqyGIqVXyjsh7wtCGzACeH0hGI=;
 b=OHEkTS2GDmcZ3D+1/ljCq/tGPwPt0dpFxtuTUIXYjwGkBfdNPSokos8HIe+pc8dZ2d
 YIzzPT++9V8C8vdLGyyzPZAhikHzw7BysuGXv0+Z0FEVFZ5lsw5rE4zzK20D6ERjBMeH
 WQnqzeNizJqaClBD4aGJJSEARqkVfJK4i8Z1fc2BDTHEnduXtbLqmSIQphlURlItiaIy
 InjTENjgftJFEokFE+/KqA4P21Y9Z8VvsLbAZIiap9qE14B+xT42EkbWdZG6NA4avLlt
 36b4nSzGW9jkIGxVILG1+vbU0ds/8KkvQ9GDO1K79p0tVfvQeWvRP3zbR+0u+5pwneBY
 FD0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725300339; x=1725905139;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=scdLjxZ6c+nUQQ2pGFqyGIqVXyjsh7wtCGzACeH0hGI=;
 b=CN6wKp9I5Grcf68aH0Pgcgfb7Tf1rhXckzD3Q6MFXlxPAghA4i/iTLjEjcs8EhIjnC
 VkmHzfwOHuLaBD2AQxNidZV/RjP+OqZbnjUawQbg76DgVtDfWqSpm3l0noaaAQ+1zOVj
 7EGJ1qMH3/8+xwujFAxd8UxD1JHJEzhMlbzBbSKHYtBhopIJ2gfzcpNPXtH8AHVZ6AeE
 Aw2/Mck0+vreGsPJVwICTlwLk5Di5d49QFbQfu2g3RpZm4f2iYyP9QY7KiDS35cCaBrR
 p2VudFomFpTB0znyDlPtMpFEFPQgYNY61Um3n0aFOILc/ciBolQBoohv73Sm7tIE00mM
 XIKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXvsbtN+/F/1N2uneBSqFbycX9w+pCieCuuFcvI9ay3xMg/9ZW2GXlsbnom2fI1VKZFbfbT3QUUA==@nongnu.org
X-Gm-Message-State: AOJu0YyZTiqN5Ns2ye48x9kOVJis7PES9W0QraStrHAIX5qqXu8AOqgi
 6YAqlv2pTNdk3Q8BY1j84eqJh+s4WIsa8mD+uktdZK2PjrZRIowKdLncEpLlgHSOQ7MV0Nz36AM
 h1G7cYZFI0QlrSosCM7VclMK7E94=
X-Received: by 2002:a17:90a:9a81:b0:2d8:a744:a81c with SMTP id
 98e67ed59e1d1-2d8a744acbfmr10669418a91.1.1725300338519; Mon, 02 Sep 2024
 11:05:38 -0700 (PDT)
MIME-Version: 1.0
References: <CA+1FSiirzpq4wjcKTLSexiOWtv26sgD37h=wA2qxv8Qh5MW_-w@mail.gmail.com>
 <CAFEAcA81xDEubwm7ZYHZWtp_9nZh_gd9o=SZK3WOOm0-9Ja3rQ@mail.gmail.com>
 <CA+1FSiiuThJXkgXOnzuw7U26kXaNuHBrJkmh2EXbtOcH00rKhA@mail.gmail.com>
 <CAFEAcA-8tWc7i2OqQTWJvup0QztOK7XeuBzUohT9eNoEADFKuQ@mail.gmail.com>
 <CA+1FSii1WErcfeNqUQMYMYxtChLETXh8SJX7BNkLm=VThd4QSQ@mail.gmail.com>
 <CAFEAcA9iLM2ycyembkDyUn7NfQwPgu1yyuncP0vT39D2jb1jOA@mail.gmail.com>
 <CA+1FSighmvfRH0=S9RGQ576HU8_BMbqEe-a07RYsr4fC7X+SoA@mail.gmail.com>
 <CAFEAcA-LSV7s5nb-jr64+aTiDGvkOtu5WYfgErmkjUejE7tVsg@mail.gmail.com>
In-Reply-To: <CAFEAcA-LSV7s5nb-jr64+aTiDGvkOtu5WYfgErmkjUejE7tVsg@mail.gmail.com>
From: Mario Marietto <marietto2008@gmail.com>
Date: Mon, 2 Sep 2024 20:05:01 +0200
Message-ID: <CA+1FSii_t6cnZ7cVNotVoQyVFJz46o5bX4xJkZ8Yzto=CMp8Jw@mail.gmail.com>
Subject: Re: Error : init: partition(s) not found in /sys, waiting for their
 uevent(s): mmcblk0p2, mmcblk0p3 while trying to emulate Android 14 on Ubuntu
 24.04 X64 bit using qemu-system-aarch64.
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-discuss@nongnu.org, qemu-arm <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000cef6c5062126c99c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=marietto2008@gmail.com; helo=mail-pj1-x1032.google.com
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
X-TUID: SISpDAaNMSB1

--000000000000cef6c5062126c99c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You seem to be involved in this old project. You don't seem to be so
unexperienced of qemu and Android :

https://www.cnx-software.com/2014/08/23/how-to-build-and-run-android-l-64-b=
it-arm-in-qemu/

On Mon, Sep 2, 2024 at 7:33=E2=80=AFPM Peter Maydell <peter.maydell@linaro.=
org>
wrote:

> On Mon, 2 Sept 2024 at 18:12, Mario Marietto <marietto2008@gmail.com>
> wrote:
> > Well. At the time the only version of qemu which has been able to
> emulate it has been qemu-system-aarch64 vers. 5.0 dirty.
> >
> > Can someone tell me where I can get the same version ? What's the
> meaning of "dirty" ?
>
> "dirty" means "there were some other not-in-git patches
> on top of 5.0". In other words, it means that the only way
> to get that exact QEMU binary is if you still have the
> source directory that it was built from.
>
> If you're lucky the "extra stuff on top of 5.0" wasn't
> important and plain 5.0 will work. If you're unlucky then
> it was something important...
>
> thanks
> -- PMM
>


--=20
Mario.

--000000000000cef6c5062126c99c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>You seem to be involved in this old project. You don&=
#39;t seem to be so unexperienced of qemu and Android :<br></div><div><br><=
/div><div><a href=3D"https://www.cnx-software.com/2014/08/23/how-to-build-a=
nd-run-android-l-64-bit-arm-in-qemu/" target=3D"_blank">https://www.cnx-sof=
tware.com/2014/08/23/how-to-build-and-run-android-l-64-bit-arm-in-qemu/</a>=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Mon, Sep 2, 2024 at 7:33=E2=80=AFPM Peter Maydell &lt;<a href=3D"m=
ailto:peter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n Mon, 2 Sept 2024 at 18:12, Mario Marietto &lt;<a href=3D"mailto:marietto2=
008@gmail.com" target=3D"_blank">marietto2008@gmail.com</a>&gt; wrote:<br>
&gt; Well. At the time the only version of qemu which has been able to emul=
ate it has been qemu-system-aarch64 vers. 5.0 dirty.<br>
&gt;<br>
&gt; Can someone tell me where I can get the same version ? What&#39;s the =
meaning of &quot;dirty&quot; ?<br>
<br>
&quot;dirty&quot; means &quot;there were some other not-in-git patches<br>
on top of 5.0&quot;. In other words, it means that the only way<br>
to get that exact QEMU binary is if you still have the<br>
source directory that it was built from.<br>
<br>
If you&#39;re lucky the &quot;extra stuff on top of 5.0&quot; wasn&#39;t<br=
>
important and plain 5.0 will work. If you&#39;re unlucky then<br>
it was something important...<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>

--000000000000cef6c5062126c99c--
