Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp796561wrs;
        Wed, 21 Aug 2019 06:26:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzsW/Z2zJLcvP+nMgbq+WpFpcPWJ8nXPyFWrZYfmv4TjCUUUsY/vu45QiRzALVFRYIL1kUP
X-Received: by 2002:ac8:6bd0:: with SMTP id b16mr31165311qtt.178.1566394006228;
        Wed, 21 Aug 2019 06:26:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566394006; cv=none;
        d=google.com; s=arc-20160816;
        b=NrHyYWSbYmj9/Exhv7vX+4YGRsHQUyNjB6eUOtDKgWaa+74g6Rw3qHCJvz0oiCSKrZ
         5On6URYoiJVqyGPOqcot9JnFWBi8NJc3+yG6atk1imzMpIRcAbbQYgW9zUgTPteyeZLR
         wLfUXfgSPBVprKxKtT5NLSw6qRZ0VsqhqC1gzzZMjZFS1UeLEskdYoTcYq0TQzcLjFbA
         oJ/6DcXp5KdDiJFvrGP97TohVUPeMw/v9oyuczn7HrWghfMpYU6BaKNQm6rwVCFeFo0+
         bhd3GyzpB5gLX0YietGvR4bmsdPGVENrh4EPDxud4Z8bJKA82MSU8tyu4BfhCts2LAik
         odLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=D0pF6UG0Rcn4AQLmuiW/4rFWNQAm4ng4PETR/XuXhrs=;
        b=m7j5pGcxPEKQJH+U3qmXX/ZTNuaJy3EU5Z8WUMPkP+7raH5pFtOCOjTqaa5cPONbQd
         Uxpj3HtzAL9Uc/nTdXL/20bzOKUVDcX/Aqc+SyMB7uudRuoJ1SasOmq46bwtCDYj0tnn
         XWocQEFRwpOPEB3ysPa8tkdLadBNNm4DxfFYeEqba4vYRh8D+PJ9BAfmzpyXbOVXKnvZ
         hkUfpvIOBTCpYe8Lz8OmoALBiegnpuIXM9ekIdeh+4mmMVKYZhRG38MMawR0HdNB1kfj
         yK420SFWIct7AENBbrmiVKMwgeDL+Ewa344rkCSwQDRF6hSHx8FO3ylGJ8I/9lXQeu0Z
         wclA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 67si12747201qki.250.2019.08.21.06.26.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Aug 2019 06:26:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i0QdR-0000GE-Jx
	for alex.bennee@linaro.org; Wed, 21 Aug 2019 09:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45329)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i0QaZ-0003lP-5c
 for qemu-arm@nongnu.org; Wed, 21 Aug 2019 09:23:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i0QaY-0000ig-18
 for qemu-arm@nongnu.org; Wed, 21 Aug 2019 09:23:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38488)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1i0QaX-0000iO-QV
 for qemu-arm@nongnu.org; Wed, 21 Aug 2019 09:23:45 -0400
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DB0D2C04959F
 for <qemu-arm@nongnu.org>; Wed, 21 Aug 2019 13:23:44 +0000 (UTC)
Received: by mail-wm1-f70.google.com with SMTP id g2so844814wmk.5
 for <qemu-arm@nongnu.org>; Wed, 21 Aug 2019 06:23:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vem4joSo6UR4KhAT7SKjnG8yccKTpq+jyZZ5CDqA2gs=;
 b=p1K3pBLzqAS/A+aLuxiQE0BSLRsPOJo9YBqN2B2dLY5Qbjt+ang7yMfSiAtH1LcN6k
 nxRMj348QxyKpCn0CDw1dZvUWMl6hYCUUzCaTuWFR6/jIZ3+4PD9uU3xAPVJXC/hUiRC
 fu89ghyv8iWTj3kvwy/T0xcvovcTb0WR8Yv9olqew5qtEXNh8Dt2gO3FAhdqg9DUpwCo
 o9uKuYCtvL7jbU0RvbAUv2c0O26zeSlRPy5BY0VmGIE9TYh8AhqgmbMCnd2q4AQy8qEL
 7a6WU+UOVBNvTWeYEwFRtYnGhb1UKNUvJGDy4ozNyRgEweqfVbCMsJ8sYnFsukrstsh7
 q+qA==
X-Gm-Message-State: APjAAAVFv0+KMyXavP5DCCLyQVLRFSz5XiY6dmLDR/dmJFKfG6osOGgg
 YItDaSjCoaQMPRG9im8VxIOaaI65ZNMB0Qq/juor3C3fhpqxONNbEpnW4PgOJK8cAHhO5W2gwoM
 Pm80b9RadlCAe
X-Received: by 2002:a1c:a008:: with SMTP id j8mr6211142wme.57.1566393823419;
 Wed, 21 Aug 2019 06:23:43 -0700 (PDT)
X-Received: by 2002:a1c:a008:: with SMTP id j8mr6211128wme.57.1566393823198;
 Wed, 21 Aug 2019 06:23:43 -0700 (PDT)
Received: from [192.168.1.39] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id e15sm14282248wrj.74.2019.08.21.06.23.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Aug 2019 06:23:42 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-38-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <b1993f41-d193-b858-efe0-372df3b65b0d@redhat.com>
Date: Wed, 21 Aug 2019 15:23:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190819213755.26175-38-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 37/68] target/arm: Convert
 PLI, PLD, PLDW
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o6A4FFa6Rqrl

On 8/19/19 11:37 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c       | 37 +++++++++++++++++++-----------------
>  target/arm/a32-uncond.decode | 10 ++++++++++
>  2 files changed, 30 insertions(+), 17 deletions(-)
>=20
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 46e88d1d17..a30a9bb4e0 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -10136,6 +10136,26 @@ static bool trans_SETEND(DisasContext *s, arg_=
SETEND *a)
>      return true;
>  }
> =20
> +/*
> + * Preload instructions
> + * All are nops, contingent on the appropriate arch level.
> + */
> +
> +static bool trans_PLD(DisasContext *s, arg_PLD *a)
> +{
> +    return ENABLE_ARCH_5TE;

Excellent :)

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> +}
> +
> +static bool trans_PLDW(DisasContext *s, arg_PLD *a)
> +{
> +    return arm_dc_feature(s, ARM_FEATURE_V7MP);
> +}
> +
> +static bool trans_PLI(DisasContext *s, arg_PLD *a)
> +{
> +    return ENABLE_ARCH_7;
> +}
> +
>  /*
>   * Legacy decoder.
>   */
> @@ -10196,23 +10216,6 @@ static void disas_arm_insn(DisasContext *s, un=
signed int insn)
>              }
>              return;
>          }
> -        if (((insn & 0x0f30f000) =3D=3D 0x0510f000) ||
> -            ((insn & 0x0f30f010) =3D=3D 0x0710f000)) {
> -            if ((insn & (1 << 22)) =3D=3D 0) {
> -                /* PLDW; v7MP */
> -                if (!arm_dc_feature(s, ARM_FEATURE_V7MP)) {
> -                    goto illegal_op;
> -                }
> -            }
> -            /* Otherwise PLD; v5TE+ */
> -            ARCH(5TE);
> -            return;
> -        }
> -        if (((insn & 0x0f70f000) =3D=3D 0x0450f000) ||
> -            ((insn & 0x0f70f010) =3D=3D 0x0650f000)) {
> -            ARCH(7);
> -            return; /* PLI; V7 */
> -        }
>          if (((insn & 0x0f700000) =3D=3D 0x04100000) ||
>              ((insn & 0x0f700010) =3D=3D 0x06100000)) {
>              if (!arm_dc_feature(s, ARM_FEATURE_V7MP)) {
> diff --git a/target/arm/a32-uncond.decode b/target/arm/a32-uncond.decod=
e
> index d5ed48f0fd..aed381cb8e 100644
> --- a/target/arm/a32-uncond.decode
> +++ b/target/arm/a32-uncond.decode
> @@ -54,3 +54,13 @@ SB               1111 0101 0111 1111 1111 0000 0111 =
0000
> =20
>  # Set Endianness
>  SETEND           1111 0001 0000 0001 0000 00 E:1 0 0000 0000  &setend
> +
> +# Preload instructions
> +
> +PLD              1111 0101 -101 ---- 1111 ---- ---- ----    # (imm, li=
t) 5te
> +PLDW             1111 0101 -001 ---- 1111 ---- ---- ----    # (imm, li=
t) 7mp
> +PLI              1111 0100 -101 ---- 1111 ---- ---- ----    # (imm, li=
t) 7
> +
> +PLD              1111 0111 -101 ---- 1111 ----- -- 0 ----   # (registe=
r) 5te
> +PLDW             1111 0111 -001 ---- 1111 ----- -- 0 ----   # (registe=
r) 7mp
> +PLI              1111 0110 -101 ---- 1111 ----- -- 0 ----   # (registe=
r) 7
>=20
