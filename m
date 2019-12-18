Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1238022lff;
        Wed, 18 Dec 2019 11:37:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqw682Pk8dPGFjQwnEWHL0b8BjS173jSIPV338h9MpQw2hhQGdy9Kge9pM/k0FLSrTn5qBbo
X-Received: by 2002:a05:620a:94f:: with SMTP id w15mr4294085qkw.380.1576697878534;
        Wed, 18 Dec 2019 11:37:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576697878; cv=none;
        d=google.com; s=arc-20160816;
        b=CJTm8JeqsNJEuX7LoKwtfCUq5IJT0f8MM9T7KgxFA02fLICoiDTI/kXw9YnJYAjCxW
         U1dVMPZrBm+wQSXiCfDeqRQh+6DhAfF1GKQuT/vfBU0m3cH+asPgzy93VYZy3Z2CD8Gz
         dGDcttsyI0KtHSjhI5NgiNGf21yiY4wY1KA6oCKSzGUNHQvuzQbFxRhxuZo3dlhCfYx+
         Z5++mNs4RE4Sn1qDbw+/kSjG1cKcfvLsuT0DQyFY17nBVthJ5QWzi6JpvOAHHo/cS+Nd
         ORtVjALZ9i7PvFrkKOXoim2PnSC/JB6EOCvHNLbH8nq/bAzK/YXHwmRIybt5EvljlO1d
         gHSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=Ufj30p/+ltGQ9PCrVDcnbldrAbtNGXyHnws+Mf5/X9w=;
        b=cIWjk67E7ZFdxGvLvVqRZJ4SzEAFiEsq+PdOo4gisgVw3Zvmg9fmycHwWEIMKd/P+f
         CZXUVI53az1Up4tdT8VY3Qn20d2LvBL5tan7A9fVAOsB4Em5uo9fQ1NUfUsWXoCMHqx1
         cglGLNdypl4/7rp1MU8HXrqb/KRoqMnatQgn24F+xQ8yl0FNoZU8hFom5u3pn6CeyFqL
         p0kLv1EPnVkX5iU2YESk/iGCTEoyRrQzdDpsiYSgickPrJ8LJFskN6s5KCxcqhob6S3p
         tlwan1ggYnjnGTEwE8BC6r1+xKuHeeY5jEhT42Jbpy9ArkYtbp4ZU0zVop/5268NqDW+
         nf+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HVuTIsCJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h6si1827111qtc.246.2019.12.18.11.37.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Dec 2019 11:37:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HVuTIsCJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ihf8v-0003PH-LZ
	for alex.bennee@linaro.org; Wed, 18 Dec 2019 14:37:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43415)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1ihf7c-00021q-DT
 for qemu-arm@nongnu.org; Wed, 18 Dec 2019 14:36:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1ihf7b-0006g6-88
 for qemu-arm@nongnu.org; Wed, 18 Dec 2019 14:36:36 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56484
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1ihf7a-0006cL-Vu
 for qemu-arm@nongnu.org; Wed, 18 Dec 2019 14:36:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576697794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=Ufj30p/+ltGQ9PCrVDcnbldrAbtNGXyHnws+Mf5/X9w=;
 b=HVuTIsCJreQ26CVPOh/EJyBd2VNQOVTJEI6hVHER8DiY96D7knifYtqAtG8RugVbXbahac
 duKsds5aA/cVvShlni6aShRVe1l/f4W4Qs9HJUAx88K4yC4qwyvx+5nbB7h3PoAB5/aDaK
 E/oFrz29zxtB5V3km94ZoIS0l24i+M4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-z8cuo0vYOviCYyfeKs03mw-1; Wed, 18 Dec 2019 14:36:29 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FFD2102C84D;
 Wed, 18 Dec 2019 19:36:27 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-120.ams2.redhat.com [10.36.116.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D5A219C58;
 Wed, 18 Dec 2019 19:36:21 +0000 (UTC)
Subject: Re: [PATCH v2 4/6] hw/net/imx_fec: Rewrite fall through comments
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20191218192526.13845-1-philmd@redhat.com>
 <20191218192526.13845-5-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <4586faa9-31ed-d90c-730c-f6c32657dceb@redhat.com>
Date: Wed, 18 Dec 2019 20:36:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191218192526.13845-5-philmd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: z8cuo0vYOviCYyfeKs03mw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Aleksandar Markovic <amarkovic@wavecomp.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HriPXSKOPLhl

On 18/12/2019 20.25, Philippe Mathieu-Daud=C3=A9 wrote:
> GCC9 is confused by this comment when building with CFLAG
> -Wimplicit-fallthrough=3D2:
>=20
>   hw/net/imx_fec.c: In function =E2=80=98imx_eth_write=E2=80=99:
>   hw/net/imx_fec.c:906:12: error: this statement may fall through [-Werro=
r=3Dimplicit-fallthrough=3D]
>     906 |         if (unlikely(single_tx_ring)) {
>         |            ^
>   hw/net/imx_fec.c:912:5: note: here
>     912 |     case ENET_TDAR:     /* FALLTHROUGH */
>         |     ^~~~
>   cc1: all warnings being treated as errors
>=20
> Rewrite the comments in the correct place,  using 'fall through'
> which is recognized by GCC and static analyzers.
>=20
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Cc: Peter Chubb <peter.chubb@nicta.com.au>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: qemu-arm@nongnu.org
> ---
>  hw/net/imx_fec.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> index bd99236864..c01ce4f078 100644
> --- a/hw/net/imx_fec.c
> +++ b/hw/net/imx_fec.c
> @@ -909,7 +909,8 @@ static void imx_eth_write(void *opaque, hwaddr offset=
, uint64_t value,
>                            TYPE_IMX_FEC, __func__);
>              return;
>          }
> -    case ENET_TDAR:     /* FALLTHROUGH */
> +        /* fall through */
> +    case ENET_TDAR:
>          if (s->regs[ENET_ECR] & ENET_ECR_ETHEREN) {
>              s->regs[index] =3D ENET_TDAR_TDAR;
>              imx_eth_do_tx(s, index);
>=20

Reviewed-by: Thomas Huth <thuth@redhat.com>

