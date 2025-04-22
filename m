Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2635779njd;
        Tue, 22 Apr 2025 14:10:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVgm1cXd4dmXwMZ6LcDmiPiSYfHh7uz4DSPmRV6Xp8EANjYN1rmW5jt1KMxvxxR4yG0jEFZfcRwbO3gDw==@linaro.org
X-Google-Smtp-Source: AGHT+IGuCu9hquMXbqF4CV7EGBlZe7QiFxeuKESGMqOA+LR0nvQcRmHOWcxVzKnHVs2c00enwuaN
X-Received: by 2002:a05:6214:f67:b0:6ed:14cd:d179 with SMTP id 6a1803df08f44-6f2c44ed56cmr300127316d6.3.1745356212427;
        Tue, 22 Apr 2025 14:10:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745356212; cv=none;
        d=google.com; s=arc-20240605;
        b=X3I2QW9ZwraZDj/HBUBQC++uYRlx2lMyhac2V0xRbxHRYa5MxjvrULqmM4NPvGF+uq
         k6w7jfMzKNHrHT5+OKqIwhSMdo5miY9dBtShCgR5qCpMOde1q12+f85WCOEmj9pwB3uL
         REYglaffMJDTU5pG1rNhwqfafQpxp1WwcInvWrRQIz0RUzR78G7h/K8fEysRugKUltWW
         39LWCGzxySmBi5kNd6EN3xF8IhKmIBphpsIxWpqi/nLV3TTIwfsQocMCgaGLqecpb5PA
         sBGJTYs8HB2i4eSr0fWEZk80b3KM6n4PlBsZqDU26oAxJcg154WMHp6iSwwS17hqYBgy
         +naA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Hk9RDMhi7WYw+3x5hMC3ThCnGXyUY9r4sBfUbQExpbw=;
        fh=IQRqTtgiAmj6HQDXymAFJiTF9oztMErITc/T6MUfgnc=;
        b=iqDxi/Dk73jSqHcuAlJ6z8n1a3shwUo6x3RvRCON2582J9X43cLNfk6SqL6N1jAZf8
         TYJLoykbvefmMI2Q8WvONPmvX5d6znzMe+9guqDNHBr9GlWWo/odqTfCAK4KFhzceNB6
         Trs0Gz4nxtJpP8tsuq9Zfjr/9o/eFAsSJs7njUGuWZxT0dYk2CRiQLwcP0868YFOGAlN
         LLBwCksHF28In2QqTItPz6zJVgHM0wt5VKn+aKqyAY35JBCgBob8dM1RuV5wqRvRK6TG
         SekpGP//rhNdWf1hhgQNJilSBkZ5GjvUEhu7+vKP2ZD6QUZcPwk4qJEuslY4eXo1KoIb
         YOrw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=oA2xBvuk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f2c2aff33fsi119322156d6.28.2025.04.22.14.10.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Apr 2025 14:10:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=oA2xBvuk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u7KsI-0008Ux-Kc; Tue, 22 Apr 2025 17:09:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1u7KsD-0008T7-Lt
 for qemu-arm@nongnu.org; Tue, 22 Apr 2025 17:09:48 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1u7Ks9-00005F-Fb
 for qemu-arm@nongnu.org; Tue, 22 Apr 2025 17:09:45 -0400
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-54e655818b0so2990e87.0
 for <qemu-arm@nongnu.org>; Tue, 22 Apr 2025 14:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1745356179; x=1745960979; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Hk9RDMhi7WYw+3x5hMC3ThCnGXyUY9r4sBfUbQExpbw=;
 b=oA2xBvuklA59epJsbvaZXNc8iI6acUbNEw+xaWMBevX08AVhKvLsXczHW+NRQ8lXVc
 F2klG+SpLio9gxeoVcSWUBVdCLTUd6dD+5HUUNlbde35e5T0mQlhWBlYm9ozfG2CS9Va
 RG5MrDJ0tBLuCOg/KSGKCz8rkcKMPoSkBiixeMqcA+lZ2ZefMVYo+UJzsc1q3WiusqHq
 QYzvwuVTyYdvIpLhMK5nmUPIc7HMm+uWoWPclzao50KVpn14lQA7yTwKCzFKOEwGGZb4
 VFyjz2DAFVZD5Vv/Hiv1Y5EPTbSStAz7/iEin4YOTAf+Ig+xavpzLWm9aXIG1+HHnFpe
 lS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745356179; x=1745960979;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hk9RDMhi7WYw+3x5hMC3ThCnGXyUY9r4sBfUbQExpbw=;
 b=XSytz8+9awCICZVdWPhjKw/rluLvKjkc9RNT81tTQDjZ7qTR7b4im9UDQdeyxVUoI5
 cOry3tfWnCj5WjIhYIbplfROnkFs+QQ0TXDVDsU60HrsowMPtGN1IQgxFsaYhHAtTCuq
 JyouRlj07sfKRqA7Ua7NSen4XAWhG3hD17VMSie850FMM3n5cfbVJDZGAWwbOxiJqrrC
 ANZ96pIicOCOSFfL3eBfFA4oykiT6A62FlxpgOLkmWvPysrKwZVvVTyAYX0eOdqXXPTD
 Ud0LtCLA05vGprjxGncfZWAmL9CCTbNJV6tKMKATiFeZYA9LRs1PjDm2zoOAKV6Koz7M
 1flA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXF05ac2GortMccn0khSbMfo69KjoI38Kd+e9GNQxJDaw5MrxH9S37PsdcCwEmfSIDwfkeHEfHj+Q==@nongnu.org
X-Gm-Message-State: AOJu0YzhzflhVW6idafjeDervvC+znsUWKf1LYBGCfeDYTUfspGSTTEo
 0Kn5/bqgXJs+wqqTN/I/96FKGASYfcUdI/lX1jVAl/Q3EBNZcXrTu1/SYslqLBtxEwRbVDMR3L7
 rZRtoNBZKcY+HtP1C3eq58d3f119HPkmtP/9C
X-Gm-Gg: ASbGncvLuhv9QqONuztXbwe7w3q5jAfarRaBsafNUUvS+9mE9f/X0INhXcr1Xn+8JPn
 pwPZ72UZDU6fbcHXHJC9vWEr/QOi/EfppyBE+bW4x+2aqw3dPhbPcIr3h1FhiGzmId0NYjroVie
 EV1RMLXTJognwWELTPwy3XYpzlQ9W/tYnbLdg9dF9qWMYlJvO21Vto
X-Received: by 2002:ac2:4ec4:0:b0:542:6b39:1d57 with SMTP id
 2adb3069b0e04-54e772a46e6mr21514e87.3.1745356178623; Tue, 22 Apr 2025
 14:09:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250414020629.1867106-1-timlee660101@gmail.com>
 <834ad4b1-9dac-4559-b4da-bec6e6d4a945@linaro.org>
In-Reply-To: <834ad4b1-9dac-4559-b4da-bec6e6d4a945@linaro.org>
From: Hao Wu <wuhaotsh@google.com>
Date: Tue, 22 Apr 2025 14:09:25 -0700
X-Gm-Features: ATxdqUEfXo-cZovlZiBuDdh5i0Jfr1_8_Znn7gkgdghHI27YKLuk_wFQaWpKlfs
Message-ID: <CAGcCb107LRZR4=cso9VzN_54mpc2GJGsuM3q9k+1Z18X_rf_kA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: Attach PSPI module to NPCM8XX SoC
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Tim Lee <timlee660101@gmail.com>, peter.maydell@linaro.org,
 kfting@nuvoton.com, 
 chli30@nuvoton.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000008f6fb0633646757"
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -180
X-Spam_score: -18.1
X-Spam_bar: ------------------
X-Spam_report: (-18.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.499,
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
X-TUID: rR9V8DQ+JMUL

--00000000000008f6fb0633646757
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 3:43=E2=80=AFAM Philippe Mathieu-Daud=C3=A9 <philmd=
@linaro.org>
wrote:

> On 14/4/25 04:06, Tim Lee wrote:
> > Nuvoton's PSPI is a general purpose SPI module which enables
> > connections to SPI-based peripheral devices. Attach it to the NPCM8XX.
> >
> > Tested:
> > NPCM8XX PSPI driver probed successfully from dmesg log.
> >
> > Signed-off-by: Tim Lee <timlee660101@gmail.com>
> > ---
> >   hw/arm/npcm8xx.c         | 11 ++++++++++-
> >   include/hw/arm/npcm8xx.h |  2 ++
> >   2 files changed, 12 insertions(+), 1 deletion(-)
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
Reviewed-by: Hao Wu < wuhaotsh@google.com>

--00000000000008f6fb0633646757
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 14,=
 2025 at 3:43=E2=80=AFAM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:=
philmd@linaro.org">philmd@linaro.org</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On 14/4/25 04:06, Tim Lee wrote:<br>
&gt; Nuvoton&#39;s PSPI is a general purpose SPI module which enables<br>
&gt; connections to SPI-based peripheral devices. Attach it to the NPCM8XX.=
<br>
&gt; <br>
&gt; Tested:<br>
&gt; NPCM8XX PSPI driver probed successfully from dmesg log.<br>
&gt; <br>
&gt; Signed-off-by: Tim Lee &lt;<a href=3D"mailto:timlee660101@gmail.com" t=
arget=3D"_blank">timlee660101@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/arm/npcm8xx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 +++=
+++++++-<br>
&gt;=C2=A0 =C2=A0include/hw/arm/npcm8xx.h |=C2=A0 2 ++<br>
&gt;=C2=A0 =C2=A02 files changed, 12 insertions(+), 1 deletion(-)<br>
<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linar=
o.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br></blockquote><div>Rev=
iewed-by: Hao Wu &lt; <a href=3D"mailto:wuhaotsh@google.com">wuhaotsh@googl=
e.com</a>&gt;=C2=A0</div></div></div>

--00000000000008f6fb0633646757--
