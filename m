Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp2413638wrs;
        Thu, 29 Aug 2019 09:48:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzlatnNxjQ8jici3RO6atfOJ89W9KiDLFjf4S1t20XscS2hM63x7vBAZ+zCWlxMM2op+yAf
X-Received: by 2002:a05:6402:168f:: with SMTP id a15mr10817992edv.5.1567097297003;
        Thu, 29 Aug 2019 09:48:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567097296; cv=none;
        d=google.com; s=arc-20160816;
        b=ZypS2PlGxQ1IvtRwJ56cuwiyMoWLfVpOFAlngyQYdnBMBV+fdC00pW8uXT+sEEt/vA
         zul73ZooCc4a3aBViP5FdDBKDOr+4g5+6YFhEPgOIVVy+d6fk6vzzYNm08i0mk8LcFbS
         R4bO2JGRZi/Wzahu4DahHHNxhFJLeJKeT72OGJ1SbVIr2qmRNRoP4DtdxTXCUeBqUVej
         7b6j+8K093hxHv7spjx6n8RqaqDIi2MgvQPXaYpoGKTbKRVNPl6FMR6vrKLCURSixJLc
         7yUtoxv5Yd6sd7VNdInk5eSAfdbqCWmuovQXN0a+yILi55GvYswQ5wQNaBRzuP+ZoyDX
         LRvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=AbGy5OdC+Crgmd2JjpGLgHWDBmcHhiQINT6N6KsZ9J0=;
        b=nQHx/scmddicNFxWw+lSnAL+aQjAddsmfjWE+3H0emQehoey91cwchbYFb61cM7uVX
         3gKrnEFMB1TpSIz0mBfdL1+zJfzYOEpCnHDG1sovpJQ1aytXjw2nr6ph+EEBBHZQiZY/
         xykBhyDYWD1rPXu3gN4OdekAj2TIuyr1U5n772xEaQ7t4elDbjmEDONUvaIaErdCfQUE
         eS/CPhAw/ePsDbdVdOZt64YEsT3zvzED4uLH1iCO6klXHTqlo2OCsmTm0UGWIa9u4jKs
         CwJaZ/HxOOz0kR2MeeWSfAi8yAzrYs7n3h/yaO6LeiW2huJL7icaZQskDw3uoDngODLu
         bFTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e46si1643255edb.177.2019.08.29.09.48.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Aug 2019 09:48:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i3Nap-00060w-TC
	for alex.bennee@linaro.org; Thu, 29 Aug 2019 12:48:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46171)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i3Nae-00060W-Dq
 for qemu-arm@nongnu.org; Thu, 29 Aug 2019 12:48:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i3Nad-0005uq-AC
 for qemu-arm@nongnu.org; Thu, 29 Aug 2019 12:48:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42646)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1i3Nad-0005uI-1w
 for qemu-arm@nongnu.org; Thu, 29 Aug 2019 12:48:03 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1F5F83B738
 for <qemu-arm@nongnu.org>; Thu, 29 Aug 2019 16:48:02 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id o11so2378110wrq.22
 for <qemu-arm@nongnu.org>; Thu, 29 Aug 2019 09:48:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zuL/XyDgUlA/aOanDRF95eRwovOtyEV7KQN+/PkovAU=;
 b=sWnZSScMBwIfr/36k0wv+jI+tKZeHrwt1pm5Pomd3bh+dZZd3Wg5z71H3biQsREnGu
 vmAKScpaMBJfArNgwTnd/oi9mTLB/q0heiSgAdds1tHpz06y4cOkzEB1BgoFp6xyoOwR
 1kT/MlSi/Z1qx90gT+/HJp10VKE60MK9FxDY2nlAIXGqz4v/MxcolRbuO4+hzHErYixV
 hgfD8kABC6q3PkEt2diIe17tDlL9Nd6MannRneeFodda+5IYGaCNJ9vhI8XLbESc+WIZ
 t2VqELd2+5XtA4xlIDgKweish2FSHf7JcXUKjDzzw1jNnko0kHEQBv5cyv2D1rl5ivcN
 zCYw==
X-Gm-Message-State: APjAAAWhqYDN3tR9FzS25/AXt91hjnehY6NDjK1NLKMbe2emzs05MO0A
 NB5TBGZMls6+3rSpBoknSK3IIS6asWF4cCKy2GcfdNEzEfJdYPC1TBy55+P824RgE5mBPC+FMeX
 BfkBKj1yfdqHq
X-Received: by 2002:adf:e8c2:: with SMTP id k2mr9811868wrn.198.1567097280696; 
 Thu, 29 Aug 2019 09:48:00 -0700 (PDT)
X-Received: by 2002:adf:e8c2:: with SMTP id k2mr9811841wrn.198.1567097280538; 
 Thu, 29 Aug 2019 09:48:00 -0700 (PDT)
Received: from [192.168.1.41] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id o17sm3813876wrx.60.2019.08.29.09.47.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2019 09:48:00 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190828190456.30315-1-richard.henderson@linaro.org>
 <20190828190456.30315-57-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <184f0a09-c850-91e1-3af8-904dbf44fc0c@redhat.com>
Date: Thu, 29 Aug 2019 18:47:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190828190456.30315-57-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 56/69] target/arm: Convert
 T16, extract
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
X-TUID: jk9Qkls8oS3B

On 8/28/19 9:04 PM, Richard Henderson wrote:
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> ---
>  target/arm/translate.c | 14 +-------------
>  target/arm/t16.decode  | 10 ++++++++++
>  2 files changed, 11 insertions(+), 13 deletions(-)
>=20
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index b7e2c72f35..d06ec48ab9 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -10743,21 +10743,9 @@ static void disas_thumb_insn(DisasContext *s, =
uint32_t insn)
>          op =3D (insn >> 8) & 0xf;
>          switch (op) {
>          case 0: /* add/sub (sp, immediate), in decodetree */
> +        case 2: /* sign/zero extend, in decodetree */
>              goto illegal_op;
> =20
> -        case 2: /* sign/zero extend.  */
> -            ARCH(6);
> -            rd =3D insn & 7;
> -            rm =3D (insn >> 3) & 7;
> -            tmp =3D load_reg(s, rm);
> -            switch ((insn >> 6) & 3) {
> -            case 0: gen_sxth(tmp); break;
> -            case 1: gen_sxtb(tmp); break;
> -            case 2: gen_uxth(tmp); break;
> -            case 3: gen_uxtb(tmp); break;
> -            }
> -            store_reg(s, rd, tmp);
> -            break;
>          case 4: case 5: case 0xc: case 0xd:
>              /*
>               * 0b1011_x10x_xxxx_xxxx
> diff --git a/target/arm/t16.decode b/target/arm/t16.decode
> index b425b86795..b5b5086e8a 100644
> --- a/target/arm/t16.decode
> +++ b/target/arm/t16.decode
> @@ -23,6 +23,7 @@
>  &s_rrr_shr       !extern s rn rd rm rs shty
>  &s_rri_rot       !extern s rn rd imm rot
>  &s_rrrr          !extern s rd rn rm ra
> +&rrr_rot         !extern rd rn rm rot
>  &ri              !extern rd imm
>  &r               !extern rm
>  &ldst_rr         !extern p w u rn rt rm shimm shtype
> @@ -173,3 +174,12 @@ BX              0100 0111 0 .... 000            @b=
ranchr
>  BLX_r           0100 0111 1 .... 000            @branchr
>  BXNS            0100 0111 0 .... 100            @branchr
>  BLXNS           0100 0111 1 .... 100            @branchr
> +
> +# Extend
> +
> +@extend         .... .... .. rm:3 rd:3          &rrr_rot rn=3D15 rot=3D=
0
> +
> +SXTAH           1011 0010 00 ... ...            @extend
> +SXTAB           1011 0010 01 ... ...            @extend
> +UXTAH           1011 0010 10 ... ...            @extend
> +UXTAB           1011 0010 11 ... ...            @extend
>=20
