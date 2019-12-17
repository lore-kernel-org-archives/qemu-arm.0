Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6353379lff;
        Tue, 17 Dec 2019 09:56:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqycUhwuZn97xIBvM3E3tthKx4pVko6IPIz01mgWiFjWxf3L6EO/47Lo2114zNSBe0QyPNyD
X-Received: by 2002:a37:b946:: with SMTP id j67mr4932226qkf.35.1576605397944;
        Tue, 17 Dec 2019 09:56:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576605397; cv=none;
        d=google.com; s=arc-20160816;
        b=tZx6ysLYLyNVh4N0f/rpbOPCd4Yai6KDDySCoAW5Uh3ryYN7heJLBz+xZusOIRq0mA
         +Bf4iUp0TuxPS/Kd539H5oFpU9glf/rAGC9yl/JZ+Ls8yLr8+0I0CsVygaogzYkGmFYe
         FZLiRt4huic2+zPkVwQ9Zl4jU316ZmAAJv1Wl6unvFYrixS+sZxE9qR5dVbWuUXMaqgY
         p08QHPsgSY5oVUfEs+P34GWC6kvU8CbppvGAv26fADccTjd8aHC5s1FSO2FvOjfbofrB
         jg0m2CSel94GzhFQ4rDFx61Qp0nxFkSlwcSefg7+HyTFazAX0vTxJTJM+meHt4soaLxS
         fS8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=XonMyJTSYe6axvH2XhPYMlGqglKHeb2J0yyugOm/J1I=;
        b=jpQwqr8lSRiSbKXlAdG0oC8qHTUY3sARqoB84afbli90BJpoUqPSK/EBwAOHJPX9ba
         dWXKOALRarKxq37POKm7mjvJ7AbBe0KvE7T+LjZOSKyKJ/hdG9mC65WyykNw36CZEf1q
         NXp/Seeh14O9AmeuWlcwqXBK2FRS63bDYwToqRlhzRuiybNupXcHd1MKkZivMoopGyGA
         0jMrx1g3FFKFDrqATE1YITDI++/ssRg6DtIRZOESehDo0eDJd3qGPKgDdTmrtFxDUUEa
         Fa5a/ezM3f4AdaEm5buLIp6upL9AuDj4KTVi4r6zdBzNg+0O7NgvD85jOqkagIjroDP7
         XwdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=O4SzZkVm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l16si11100574qtp.30.2019.12.17.09.56.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Dec 2019 09:56:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=O4SzZkVm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ihH5J-000075-83
	for alex.bennee@linaro.org; Tue, 17 Dec 2019 12:56:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60389)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1ihH4h-00081M-Lt
 for qemu-arm@nongnu.org; Tue, 17 Dec 2019 12:56:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1ihH4g-0002M7-LK
 for qemu-arm@nongnu.org; Tue, 17 Dec 2019 12:55:59 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55064
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1ihH4g-0002Kg-Ho
 for qemu-arm@nongnu.org; Tue, 17 Dec 2019 12:55:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576605358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=XonMyJTSYe6axvH2XhPYMlGqglKHeb2J0yyugOm/J1I=;
 b=O4SzZkVmql/lrAJpMhwCg5BOrTS2lLfLPrywJLlxdg8I3Sgx11KLut5Bs+6a05+ic1/e06
 h+9znL6gpD0ftqu2HWVRKK690/6Z6+KhT1ITJsHuAR+q4KdQW008x9kaNA4lxwdHhcqjYU
 Fqz28bANkqyMUqpAeqiacRLONo7AwvU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-94uUp8tSNAyWNMdnECtJXQ-1; Tue, 17 Dec 2019 12:55:54 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88ED1107ACCA;
 Tue, 17 Dec 2019 17:55:53 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-149.ams2.redhat.com [10.36.116.149])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 881E960BE0;
 Tue, 17 Dec 2019 17:55:49 +0000 (UTC)
Subject: Re: [PATCH 3/6] hw/net/imx_fec: Rewrite fall through comments
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20191217173425.5082-1-philmd@redhat.com>
 <20191217173425.5082-4-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <2fc74b64-0a0b-c437-e925-4c16d3907da7@redhat.com>
Date: Tue, 17 Dec 2019 18:55:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191217173425.5082-4-philmd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 94uUp8tSNAyWNMdnECtJXQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hQYWUIlIxkhj

On 17/12/2019 18.34, Philippe Mathieu-Daud=C3=A9 wrote:
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
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Cc: Peter Chubb <peter.chubb@nicta.com.au>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: qemu-arm@nongnu.org
> ---
>  hw/net/imx_fec.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> index bd99236864..30cc07753d 100644
> --- a/hw/net/imx_fec.c
> +++ b/hw/net/imx_fec.c
> @@ -901,15 +901,17 @@ static void imx_eth_write(void *opaque, hwaddr offs=
et, uint64_t value,
>              s->regs[index] =3D 0;
>          }
>          break;
> -    case ENET_TDAR1:    /* FALLTHROUGH */
> -    case ENET_TDAR2:    /* FALLTHROUGH */
> +        /* fall through */

Wrong location. And I think you don't need any comment here at all, GCC
should stay silent without it?

> +    case ENET_TDAR1:
> +    case ENET_TDAR2:
>          if (unlikely(single_tx_ring)) {
>              qemu_log_mask(LOG_GUEST_ERROR,
>                            "[%s]%s: trying to access TDAR2 or TDAR1\n",
>                            TYPE_IMX_FEC, __func__);
>              return;
>          }
> -    case ENET_TDAR:     /* FALLTHROUGH */
> +        /* fall through */

I'd suggest to simply remove it, too.

> +    case ENET_TDAR:
>          if (s->regs[ENET_ECR] & ENET_ECR_ETHEREN) {
>              s->regs[index] =3D ENET_TDAR_TDAR;
>              imx_eth_do_tx(s, index);
>=20

 Thomas

