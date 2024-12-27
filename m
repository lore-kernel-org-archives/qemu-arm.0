Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp6047641njk;
        Thu, 26 Dec 2024 16:11:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX4RF3EFRh1d6z4JRtR6pFTAnFO9gnCLu2iOrIYV3yJVDS1r7KJ4kFGWKtgCnXzjwHfGIo1arqQwhNmzw==@linaro.org
X-Google-Smtp-Source: AGHT+IH3LnjG+Uz96RueigOOqX6CWQ+VOcC7eAtY79oBRCdj99+fOqTCpR58ihIwTs1TABHRmaI7
X-Received: by 2002:a05:6214:3001:b0:6d8:8742:137c with SMTP id 6a1803df08f44-6dd2334bfb4mr384265266d6.24.1735258271182;
        Thu, 26 Dec 2024 16:11:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735258271; cv=none;
        d=google.com; s=arc-20240605;
        b=RdmFI8Rul7wuH0II/mVsbHXZDXM1WKkagIiyMcJ3N8Q+4u8I6vzJcZoIrTFH2b0bYn
         k3g47uwtJfmD9WAnf3mE0/wnOrTMgNY91M2M7phpmes8IGzTtQAeGNJXQrOs9leFAx52
         xj3+2E8o1dbTSuqpoqHFC/eYVrBWrhLJi2MmoRQmncIuSXN/dhxW8iUUphUpsJYbwYWd
         91x21OzMNYTCazbE1//j6p9a++vNEw27S9NyQQRyNQgZyYRS4W74hQAQ6kowsij73KMd
         EnxIS75545xpr5C4X2oN+BkHaKKtBOjt7a7Ao+TCgaUB2iomQyiOJCuarJukIwBA9sHE
         X+6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Kiav1LOLgUI1s57efjcsKJrgv00INHU1sewLAsIjnvs=;
        fh=z0LmM0gkV5m86rGfKoPMn57CqMIkLivun0SX7diIMh0=;
        b=Yo5rHEclTJZi8iDZnipgSjU7COdR4CHwFsl5Sd/jObFpvPMhGdUWo2Pg3gnyQLajF3
         xvLVPgfD4sCStloPhXc7gdRHyBYXwET4moxPsO+iifhUXSNfP1xrXo5v54WvjzQwrj4V
         wcCFaIjmdlbUx45XNhGB5VoqAcmZ6M/pI5p5R/zZNUR9g2KzZ2DxAMUMcZGUyTFxP5H/
         devzXXMeCp6ZpP5VKL2xqBaIIF+LS5e/k+jMmGUxxAZY0JMZ5yQlxajRFRBI3gXqbYmS
         tYMpQNsSOzN7kpglxeEeF4CqdwBnrvRw97SqVoj0UkE1lJtn0sA2wGKapmz+gszgGQbl
         FK2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=GY5d+tiq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dd18101e1dsi183862776d6.98.2024.12.26.16.11.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Dec 2024 16:11:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=GY5d+tiq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tQxwP-000815-UL; Thu, 26 Dec 2024 19:10:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1tQxwL-00080W-Ki
 for qemu-arm@nongnu.org; Thu, 26 Dec 2024 19:10:53 -0500
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1tQxwG-0005sn-1N
 for qemu-arm@nongnu.org; Thu, 26 Dec 2024 19:10:50 -0500
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-53e44a42512so42108e87.1
 for <qemu-arm@nongnu.org>; Thu, 26 Dec 2024 16:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1735258243; x=1735863043; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Kiav1LOLgUI1s57efjcsKJrgv00INHU1sewLAsIjnvs=;
 b=GY5d+tiqFahgmaJzVYKo/9spmCUEuyJh1RuL8vfEdkr9dFy9/hh+oA0Cb2FTqmVtqE
 5tiwjnghzPBEjcTjz15q5nSuB638xqC/PebkaP2ZbJMkWEDDtq7KEorJSYX6bKNha9EX
 r7OMG/fg8aXhz6aFCwm8DnmVqY8v54n2/htluhvdkyNcmNWGUpeO1uMlXWTJe3vXPWvZ
 9UzGGQM6dx6DcOT11faosHu0AK3GzxDT6cVTQsDvFG1Id/DcD6Rf5iua95PXYPQiZS/q
 CyJrnRn9FCXrsTLTJQa9H8Q5C4joY1tPKC3ZBtCb/GutV0DODNsNDl2GjeOEjvfRLHF9
 kHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735258243; x=1735863043;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kiav1LOLgUI1s57efjcsKJrgv00INHU1sewLAsIjnvs=;
 b=xSkC03PZrpsitzzQBD+WIMiFXv5Ag+Q0NLLsWi1fKM+ME3yay1+hoMP32RG+Wh5H8n
 sXi+NHWINUAHrDIMJrTZIiAlPMb8AAFx67dlCWDxW217m2H/US2JRhmUxFUYw5XftvFl
 p0us3C6v9xpq2Mm+9sKbZsYgaqhLMdCoeet9595MYJde/r8P86+moSPsK7td8g30qPwZ
 oKjvnqY8mzGRlDbMnIP4bHk59gvjBNt7gbQ6EFA3tVtmG/SKgtAVdZbqmUyIdWyHT5F2
 rJk7Hl6Wme4SyLwQT7NFSw2F8Qmd0Vejp4LBK6CQa4OdCJkRSGG1RtPnv/nmoc9CJ8cb
 HgZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9pX3LnzT3iJaIcXH7KAGZ9GpiUdsAcV5263GHFBNF/F2vGqPi5HkMAFtFJ0FUgAfuH8sV9mHoBw==@nongnu.org
X-Gm-Message-State: AOJu0YwTR0T4/kAMB6Dj3mEM7eKoMX9GjbA+nBYc6hNDnGhL6Mu1soy1
 MZ/fQg5sXDMyZE8pnd+xdo48/0pR8VZzudlPIK+/h08vXl8Dsli1495CjcfRIhPgvnt4vLqKf+v
 9zHt34WrQucHkVvNaflkgQvOAuHaSEyfkG1Sr
X-Gm-Gg: ASbGnctILrENwCRo7hi0BsI33BuSfmITlW6uEfUbiiW1365i6RSFZYnnzNlZlKT/qwy
 vCXA/UiHAS1qjlfJWrbDhAOwQ3v8Ujw/hcAyBkrGcsKgUskGhOMqJ22k=
X-Received: by 2002:a05:6512:3d25:b0:53d:f0a2:1fe3 with SMTP id
 2adb3069b0e04-54229455f32mr648484e87.2.1735258243322; Thu, 26 Dec 2024
 16:10:43 -0800 (PST)
MIME-Version: 1.0
References: <20241226130311.1349-1-tsogomonian@astralinux.ru>
 <CAO=notxZWVBShpD_Y-GJZvXSY6v7tURt0yJ+aQFDm7LpdD8ikg@mail.gmail.com>
In-Reply-To: <CAO=notxZWVBShpD_Y-GJZvXSY6v7tURt0yJ+aQFDm7LpdD8ikg@mail.gmail.com>
From: Hao Wu <wuhaotsh@google.com>
Date: Fri, 27 Dec 2024 08:10:31 +0800
X-Gm-Features: AbW1kvZ1aDz9P0EVUU9HCSHM0u7JLrUWnbs8m2dkKERcoIXIodlf3W-OYp3Ns7I
Message-ID: <CAGcCb11XxgJ9Of-XvgHYBmxrz5yCjktZWe6d8jwbV0NOjkHm=Q@mail.gmail.com>
Subject: Re: [PATCH] hw/misc: cast rpm to uint64_t
To: Patrick Leis <venture@google.com>
Cc: Tigran Sogomonian <tsogomonian@astralinux.ru>, kfting@nuvoton.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, sdl.qemu@linuxtesting.org
Content-Type: multipart/alternative; boundary="000000000000305c75062a354b84"
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x133.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: oJCy5u8HM8CY

--000000000000305c75062a354b84
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 27, 2024 at 3:02=E2=80=AFAM Patrick Leis <venture@google.com> w=
rote:

>
>
> On Thu, Dec 26, 2024 at 6:00=E2=80=AFAM Tigran Sogomonian <
> tsogomonian@astralinux.ru> wrote:
>
>> The value of an arithmetic expression
>> 'rpm * NPCM7XX_MFT_PULSE_PER_REVOLUTION' is a subject
>> to overflow because its operands are not cast to
>> a larger data type before performing arithmetic. Thus, need
>> to cast rpm to uint64_t.
>>
>> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>>
>> Signed-off-by: Tigran Sogomonian <tsogomonian@astralinux.ru>
>>
> Reviewed-by: Patrick Leis <venture@google.com>
>
Reviewed-by: Hao Wu <wuhaotsh@google.com>

> ---
>>  hw/misc/npcm7xx_mft.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/misc/npcm7xx_mft.c b/hw/misc/npcm7xx_mft.c
>> index 9fcc69fe5c..e565cac05d 100644
>> --- a/hw/misc/npcm7xx_mft.c
>> +++ b/hw/misc/npcm7xx_mft.c
>> @@ -172,8 +172,9 @@ static NPCM7xxMFTCaptureState npcm7xx_mft_compute_cn=
t(
>>           * RPM =3D revolution/min. The time for one revlution (in ns) i=
s
>>           * MINUTE_TO_NANOSECOND / RPM.
>>           */
>> -        count =3D clock_ns_to_ticks(clock, (60 * NANOSECONDS_PER_SECOND=
) /
>> -            (rpm * NPCM7XX_MFT_PULSE_PER_REVOLUTION));
>> +        count =3D clock_ns_to_ticks(clock,
>> +            (uint64_t)(60 * NANOSECONDS_PER_SECOND) /
>> +            ((uint64_t)rpm * NPCM7XX_MFT_PULSE_PER_REVOLUTION));
>>      }
>>
>>      if (count > NPCM7XX_MFT_MAX_CNT) {
>> --
>> 2.30.2
>>
>>
>>

--000000000000305c75062a354b84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 27,=
 2024 at 3:02=E2=80=AFAM Patrick Leis &lt;<a href=3D"mailto:venture@google.=
com">venture@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 26=
, 2024 at 6:00=E2=80=AFAM Tigran Sogomonian &lt;<a href=3D"mailto:tsogomoni=
an@astralinux.ru" target=3D"_blank">tsogomonian@astralinux.ru</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The value of a=
n arithmetic expression<br>
&#39;rpm * NPCM7XX_MFT_PULSE_PER_REVOLUTION&#39; is a subject<br>
to overflow because its operands are not cast to<br>
a larger data type before performing arithmetic. Thus, need<br>
to cast rpm to uint64_t.<br>
<br>
Found by Linux Verification Center (<a href=3D"http://linuxtesting.org" rel=
=3D"noreferrer" target=3D"_blank">linuxtesting.org</a>) with SVACE.<br>
<br>
Signed-off-by: Tigran Sogomonian &lt;<a href=3D"mailto:tsogomonian@astralin=
ux.ru" target=3D"_blank">tsogomonian@astralinux.ru</a>&gt;<br></blockquote>=
<div>Reviewed-by: Patrick Leis &lt;<a href=3D"mailto:venture@google.com" ta=
rget=3D"_blank">venture@google.com</a>&gt;=C2=A0</div></div></div></blockqu=
ote><div>Reviewed-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com">wuh=
aotsh@google.com</a>&gt;=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
---<br>
=C2=A0hw/misc/npcm7xx_mft.c | 5 +++--<br>
=C2=A01 file changed, 3 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/hw/misc/npcm7xx_mft.c b/hw/misc/npcm7xx_mft.c<br>
index 9fcc69fe5c..e565cac05d 100644<br>
--- a/hw/misc/npcm7xx_mft.c<br>
+++ b/hw/misc/npcm7xx_mft.c<br>
@@ -172,8 +172,9 @@ static NPCM7xxMFTCaptureState npcm7xx_mft_compute_cnt(<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * RPM =3D revolution/min. The time for o=
ne revlution (in ns) is<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * MINUTE_TO_NANOSECOND / RPM.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 count =3D clock_ns_to_ticks(clock, (60 * NANOS=
ECONDS_PER_SECOND) /<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (rpm * NPCM7XX_MFT_PULSE_PER_REV=
OLUTION));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 count =3D clock_ns_to_ticks(clock,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (uint64_t)(60 * NANOSECONDS_PER_=
SECOND) /<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((uint64_t)rpm * NPCM7XX_MFT_PUL=
SE_PER_REVOLUTION));<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (count &gt; NPCM7XX_MFT_MAX_CNT) {<br>
-- <br>
2.30.2<br>
<br>
<br>
</blockquote></div></div>
</blockquote></div></div>

--000000000000305c75062a354b84--
