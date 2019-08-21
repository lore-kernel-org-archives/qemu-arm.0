Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp791529wrs;
        Wed, 21 Aug 2019 06:22:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxCYhQ+9pn/azUD5PqN0IxC3dF0g7DysNp9MFbrjtnBpz8g5uoKoSIpxrfKfBIfedJNMshN
X-Received: by 2002:a05:620a:7c8:: with SMTP id 8mr29708395qkb.424.1566393745105;
        Wed, 21 Aug 2019 06:22:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566393745; cv=none;
        d=google.com; s=arc-20160816;
        b=0DK7P7z6t78vjRQisuIPcr4g2yEgJVnZA2UpdvPyTkGkrOJhWCXjKpx51jTpc0dT4C
         T7sh1gV03XLNMBogVooT8D/1u9oi2f3PpvO1CnsqTws/H9iPCqqrNq5cXBqIpEJ8pOc8
         f0YUYeqZLTpQZIA6PXrL0YZGhkgkhYrhva0lQo43l4hEgxEKarAk6WNWA6kgyR0ofBq1
         oZmPPDl7hn5l8JXF61264eThqojQvJmH1IfBngl+OHwyoKBYfywMBAMdQPN6RYZhzipJ
         pREERMpvINRYJj0CiXG2E4m+TURbL9CAaRRhUcZuKlCfC/pEklA835jpObGZej3ZbPuE
         Y4qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=T8Wr8N6JiHTdUeSthI1+hfQYrkYEtnyQMBbaeMLCw9c=;
        b=H4TmOaKXmcBXlbiXxofcnqoFjP3IkgEGjP7K6HjDHqSMBX6C91vmSVTm8Q8KL/a6x/
         HR/LF+mT+ceQfJ+1b0WX3nee2iX+qNndY7fkcpvNSbfcUyDQkl9dUD8taBq8i7k/JufY
         xFG5Z+XUdiSrPC02O+2hMLxK7pEh/ng/NHmkFNhHNuM/zmJYv8OhobD7NO1Bh942gzte
         YeSbhy24MR5VkLTZc1Vp8/VPrRMNyWamBf3NfSWHCJFAzr6g/oXdhYYbbBwcQn80ZFxQ
         qB1dsoyya17P/V8v1i8v/U59RpemmwiljdWNwJSY+ygjSn3gDvRzOGT60N90AmFsY54M
         DhLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f12si13367773qvf.37.2019.08.21.06.22.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Aug 2019 06:22:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i0QZE-0001TI-HO
	for alex.bennee@linaro.org; Wed, 21 Aug 2019 09:22:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44751)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i0QZ4-0001PB-Pa
 for qemu-arm@nongnu.org; Wed, 21 Aug 2019 09:22:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i0QY1-0007v5-UR
 for qemu-arm@nongnu.org; Wed, 21 Aug 2019 09:21:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59198)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1i0QY1-0007uf-NT
 for qemu-arm@nongnu.org; Wed, 21 Aug 2019 09:21:09 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A24317BDAB
 for <qemu-arm@nongnu.org>; Wed, 21 Aug 2019 13:21:08 +0000 (UTC)
Received: by mail-wr1-f70.google.com with SMTP id a2so1222706wrs.8
 for <qemu-arm@nongnu.org>; Wed, 21 Aug 2019 06:21:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dq/RSImmOeTAB1lrwErB9l1eSPY7ym39ti8soKCl3og=;
 b=kCyxuq6IvCUgmNUrZDYfO0HnFk9TYyIF3a9CFPuDrz3uF2WQNAW/3L/hKfHRRzhHrt
 uEu2tW1kk+j6hBNswWblV1usbI6aRux1NnGujXkwwDuTwwJm2ivd2cpiSv3nki3MtNEh
 ZNTZx7mCwl/9cLWTgSsLiEUunOHFzyC8nXRcRY6UxJyZcIhjDqC3bTtSQb9EPJ4cs80B
 eI9Ha25ZBa8NsZHTEuTtPtK2lWjzEZfnuhLezEHkSXwKZmmA2gwdEznrSrChC4xTXP+W
 Gcttdiz7tNX1+Rb/mGr9Uht7XQp979Dr+hhir7I3lwgBGqfqGk+DywOt+EZdz10Pkw9+
 5TXQ==
X-Gm-Message-State: APjAAAVLSSSolu1LdWsbnwIGJEl2rPeTUmWUYfx2H1U9P8mMwbxE1vUY
 rBtbgLATMGW3b7x1hFl6TTpMbsdcoHo5jam7DIQd9MeEmjMY1CW0c1F0azQi84Yxeqya4Mhwojf
 j9HUVUOmlb14T
X-Received: by 2002:adf:e390:: with SMTP id e16mr31394303wrm.153.1566393667122; 
 Wed, 21 Aug 2019 06:21:07 -0700 (PDT)
X-Received: by 2002:adf:e390:: with SMTP id e16mr31394280wrm.153.1566393666877; 
 Wed, 21 Aug 2019 06:21:06 -0700 (PDT)
Received: from [192.168.1.39] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id o16sm28831417wrp.23.2019.08.21.06.21.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Aug 2019 06:21:06 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-33-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <b68125fa-8062-3087-1f2e-76ed331f797e@redhat.com>
Date: Wed, 21 Aug 2019 15:21:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190819213755.26175-33-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 32/68] target/arm: Convert SVC
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
X-TUID: qFt+mWGlEQPj

On 8/19/19 11:37 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> ---
>  target/arm/translate.c | 19 +++++++++++++------
>  target/arm/a32.decode  |  4 ++++
>  2 files changed, 17 insertions(+), 6 deletions(-)
>=20
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 6b7b3df685..b6d8b7be8c 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -9968,6 +9968,18 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX=
_i *a)
>      return true;
>  }
> =20
> +/*
> + * Supervisor call
> + */
> +
> +static bool trans_SVC(DisasContext *s, arg_SVC *a)
> +{
> +    gen_set_pc_im(s, s->base.pc_next);
> +    s->svc_imm =3D a->imm;
> +    s->base.is_jmp =3D DISAS_SWI;
> +    return true;
> +}
> +
>  /*
>   * Legacy decoder.
>   */
> @@ -10235,6 +10247,7 @@ static void disas_arm_insn(DisasContext *s, uns=
igned int insn)
>          case 0x09:
>          case 0xa:
>          case 0xb:
> +        case 0xf:
>              /* All done in decodetree.  Reach here for illegal ops.  *=
/
>              goto illegal_op;
>          case 0xc:
> @@ -10250,12 +10263,6 @@ static void disas_arm_insn(DisasContext *s, un=
signed int insn)
>                  goto illegal_op;
>              }
>              break;
> -        case 0xf:
> -            /* swi */
> -            gen_set_pc_im(s, s->base.pc_next);
> -            s->svc_imm =3D extract32(insn, 0, 24);
> -            s->base.is_jmp =3D DISAS_SWI;
> -            break;
>          default:
>          illegal_op:
>              unallocated_encoding(s);
> diff --git a/target/arm/a32.decode b/target/arm/a32.decode
> index 62c6f8562e..0bd952c069 100644
> --- a/target/arm/a32.decode
> +++ b/target/arm/a32.decode
> @@ -528,3 +528,7 @@ LDM_a32          ---- 100 b:1 i:1 u:1 w:1 1 rn:4 li=
st:16   &ldst_block
> =20
>  B                .... 1010 ........................           @branch
>  BL               .... 1011 ........................           @branch
> +
> +# Supervisor call
> +
> +SVC              ---- 1111 imm:24                             &i
>=20
