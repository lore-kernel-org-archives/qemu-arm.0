Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp5927879njk;
        Thu, 26 Dec 2024 11:03:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWtTKqNEHWCdNi5LGkaI4x/zSD3urr+VRoydvpVHXLNW2C88nScAQ6/g5vNHF+O2mJ/5R5G2q2G6+WcOw==@linaro.org
X-Google-Smtp-Source: AGHT+IEpImccF1HXKK/mvVv6027/y8ZLaZECAgC7yxwPRVk4fzVTfqqxQ+rv/PPvbP7a6CoNPyjk
X-Received: by 2002:a05:620a:2983:b0:7b6:e0a1:5f3d with SMTP id af79cd13be357-7b9aa934650mr4096671685a.11.1735239783290;
        Thu, 26 Dec 2024 11:03:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735239783; cv=none;
        d=google.com; s=arc-20240605;
        b=bvUezGeiXtI5hsji6eL1HH2/lxihYFML6baOPIOf9FswFG1eS1eqBjL81BvDyti0jt
         DMv/QuhQP4A621yh4mLalnFtsviKcQUFZaGS0Y3drggVMPNtD0voKV+RI+OcUtIEQssQ
         0Qb3uXbEHfhCIzXtyPrQM/14O5t0526t4pV+jeFpn8PQBrmIC7+nWwKWzRFvkKu/Orcy
         m55Nrjh1MmaAMd99cXpaKZkZhLihypxzghYMmYuxOr47q/EiTztTN2WCGwHOEB+Hu7Ru
         wnUXL0Vu979GjqeVLc1xlBJAwrMdYo/kifA1VuDZKXCkwncaU3mwiP47ZZM1qz8nOKPp
         kanQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=la1qgSAVIjm9h3c5YQido1PtgFtK4vhvefcXK0KLw/w=;
        fh=uxJkStTL5R7ROenq8vCvk9CDI/IV81ORSIRmHL0qJvM=;
        b=HHZtJc2R8mKONIAsX3WrQMxhYlWMBoM0Zf1gjWqyQXY4S9jNlmPgRseWxFT1QpnmJe
         UKtGpR5u+iSSMmdZM16RtZrQ+pKXinNwSNCdm6EoJz+1soJw07dYRkcl6aGzXSZK/SSc
         MBdIgN2X2kslPKTRU9Qavm+5agox2GnLJoTmw9oMlec+larP9FLc24FvS5WEi56tmlj5
         O1lbSALfuVcMo8AAxlfWhFEB5h6E53fmm/Xm0WkVUFzrFyO8aa6+jsenLIQOSh4Ag45F
         A1Bt8tPhAewEb3I32So7mWEqjJXWfb5dSaMxPiqh8cc5jm4oc9D/8aGTT5U31AP1lCgX
         7JDA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=oYLAE3LQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b9ac4791c5si1877441685a.308.2024.12.26.11.03.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Dec 2024 11:03:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=oYLAE3LQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tQt7v-0000zn-8F; Thu, 26 Dec 2024 14:02:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1tQt7n-0000yt-0m
 for qemu-arm@nongnu.org; Thu, 26 Dec 2024 14:02:26 -0500
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1tQt7k-0004fH-LL
 for qemu-arm@nongnu.org; Thu, 26 Dec 2024 14:02:22 -0500
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-7b6f7d7e128so661942085a.1
 for <qemu-arm@nongnu.org>; Thu, 26 Dec 2024 11:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1735239728; x=1735844528; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=la1qgSAVIjm9h3c5YQido1PtgFtK4vhvefcXK0KLw/w=;
 b=oYLAE3LQjS60vP05wVZl2z1Rotu3L6ayxIVBtcNhL/BaGYV16AwzRmbU+bH3KvHHaC
 7vtgPTbWQaQ5B9kuw5nIH+Ll2V+cbHM820NGjzwUs5XE1+9giEl77B8sgRhlk3KbdeMu
 KoCfXSMaaymScJsiioT5tlGs3FD39kHGLWv7PP/O/LHRNPn7+NvqLiFonj9d7+kTmRzo
 a82rc2lwzG/7LEhdU9TfPGYTN3h/v/qxDDk27WF7Qlea91YvWG1D7mWt5oXgTnduM11k
 +Q98UrOIwV8mzmiDrGvxom+FszAYOdSnxThr8mU5Ab9gyWdg5JOeIuQcNQp95KFFucxH
 1HMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735239728; x=1735844528;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=la1qgSAVIjm9h3c5YQido1PtgFtK4vhvefcXK0KLw/w=;
 b=LNrNilN0HbQ/2D5b0B5vjQpT0ofytifAZmEwIrCB4XAeJ85hNoHphd/EEXRn64wplD
 nLRA4CCXMxUfJehCGsPcSVK7rjKO6o0Y9NncNk7aXfiprACzu7h7vMuiowVm/lkFc1gj
 3MTnTRDN+PRSYNb94pV+Z2AGAYFGdX4QSZSKnZK98SUxj2m/VwKMaVWl5IzABHUSOZ3h
 PVnLtwV4ODDkUgwQTtWZ4yFxpH43IHIQWDK1lGEbGtcWMirxNG0+Oa0uMInn8kvZqHbQ
 gNUXpVAtyRW09KayZQks+YQE70mpqPdEHEQbaZV0zOhzwZ4tV0vjQljUpm9JlAHONKnF
 T3/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJ7EPMVM8if2RXXOE5z53Du8mqqH0RuPKg9sSMY0Y3SKxAWfEB31rBVpyqqc46pZcHsQLR410DJg==@nongnu.org
X-Gm-Message-State: AOJu0YypHRWQw/kLSw4HcPhcpAEotjUKAKqv5RwmigZSsUxr6sGzJutG
 KlLmSZ1UlZfUUMo/exjibwUCiW6aloGeUYzuPiz3/zb64jsg0O12epvpC/xMk7u8VIFElCZXBYk
 /ib6Tr4HR7MDjKev4uqFqY/MAsp2PYcCgmyYk
X-Gm-Gg: ASbGnctji33H3yz5rNtO72Y3zjeZvXxaLM37rv1fwSihAxUKLApMsrOu8eyuuPFOdsp
 5Bu3ykONSR9MFLzJEM7wXb1QwRIOSE7yhWJXUe80/VdnlcgdJMq6kM1bvld9opcNWIiY3qVkN
X-Received: by 2002:a05:620a:4627:b0:7b8:5511:f72d with SMTP id
 af79cd13be357-7b9aa99f11cmr4663750485a.17.1735239727665; Thu, 26 Dec 2024
 11:02:07 -0800 (PST)
MIME-Version: 1.0
References: <20241226130311.1349-1-tsogomonian@astralinux.ru>
In-Reply-To: <20241226130311.1349-1-tsogomonian@astralinux.ru>
From: Patrick Leis <venture@google.com>
Date: Thu, 26 Dec 2024 11:01:56 -0800
X-Gm-Features: AbW1kvama_qiu019Z8q4-T5n1AybpVJZnOaKpIPbOUjSc40ESKCjWjz8aRstC8o
Message-ID: <CAO=notxZWVBShpD_Y-GJZvXSY6v7tURt0yJ+aQFDm7LpdD8ikg@mail.gmail.com>
Subject: Re: [PATCH] hw/misc: cast rpm to uint64_t
To: Tigran Sogomonian <tsogomonian@astralinux.ru>
Cc: kfting@nuvoton.com, wuhaotsh@google.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, sdl.qemu@linuxtesting.org
Content-Type: multipart/alternative; boundary="00000000000092008e062a30fb7b"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=venture@google.com; helo=mail-qk1-x72d.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: R/jh29AKuSeq

--00000000000092008e062a30fb7b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 26, 2024 at 6:00=E2=80=AFAM Tigran Sogomonian <tsogomonian@astr=
alinux.ru>
wrote:

> The value of an arithmetic expression
> 'rpm * NPCM7XX_MFT_PULSE_PER_REVOLUTION' is a subject
> to overflow because its operands are not cast to
> a larger data type before performing arithmetic. Thus, need
> to cast rpm to uint64_t.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Signed-off-by: Tigran Sogomonian <tsogomonian@astralinux.ru>
>
Reviewed-by: Patrick Leis <venture@google.com>

> ---
>  hw/misc/npcm7xx_mft.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/hw/misc/npcm7xx_mft.c b/hw/misc/npcm7xx_mft.c
> index 9fcc69fe5c..e565cac05d 100644
> --- a/hw/misc/npcm7xx_mft.c
> +++ b/hw/misc/npcm7xx_mft.c
> @@ -172,8 +172,9 @@ static NPCM7xxMFTCaptureState npcm7xx_mft_compute_cnt=
(
>           * RPM =3D revolution/min. The time for one revlution (in ns) is
>           * MINUTE_TO_NANOSECOND / RPM.
>           */
> -        count =3D clock_ns_to_ticks(clock, (60 * NANOSECONDS_PER_SECOND)=
 /
> -            (rpm * NPCM7XX_MFT_PULSE_PER_REVOLUTION));
> +        count =3D clock_ns_to_ticks(clock,
> +            (uint64_t)(60 * NANOSECONDS_PER_SECOND) /
> +            ((uint64_t)rpm * NPCM7XX_MFT_PULSE_PER_REVOLUTION));
>      }
>
>      if (count > NPCM7XX_MFT_MAX_CNT) {
> --
> 2.30.2
>
>
>

--00000000000092008e062a30fb7b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 26,=
 2024 at 6:00=E2=80=AFAM Tigran Sogomonian &lt;<a href=3D"mailto:tsogomonia=
n@astralinux.ru">tsogomonian@astralinux.ru</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">The value of an arithmetic expres=
sion<br>
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
<div>Reviewed-by: Patrick Leis &lt;<a href=3D"mailto:venture@google.com">ve=
nture@google.com</a>&gt;=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
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

--00000000000092008e062a30fb7b--
