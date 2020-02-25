Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1217843lfg;
        Mon, 24 Feb 2020 21:42:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqz2gvOyoc6N00YItho0Yuoqj1nNMHHbUTXroysYKDfUZPd3Q/aXSM36Uq8rq7OfalKugKSB
X-Received: by 2002:ac8:7159:: with SMTP id h25mr51313228qtp.380.1582609320597;
        Mon, 24 Feb 2020 21:42:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582609320; cv=none;
        d=google.com; s=arc-20160816;
        b=R5m0pvLir9NJKTRD/e+RYXMd60lUVlhuSkgdfR4qAkTowysgG0txHz7CWXHUuWJzbY
         6cfhnmsHX9fzidUiew0KVv3wy+mRx9NE5c9P237QxxtoGn4VlZsbniZU92a5rjXL3bP/
         Kro/RIxIDaWnYNo4XLk5Mjih2AUcbEfeBErfUDGIBx5U3fn6ERFOOnAMb9WsUOUrps6H
         kh4VKRjiybPkyQ81kqIvtu2/q40lyI8pfQHqKDwHwf9agHeh3n+230f4JUi68x0H8hC4
         KYmZva65/rIADVM9hyWLs65mIEvclMhvk6V0V46wVLsmCFLB0s7ygdgH7+SBsN4J3Mh+
         5yQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=vk9ybKTfqFyPt8H/hWiVLqk4DQGRcqNb//UpSaxQcqg=;
        b=FOgZd66FEA7BK+F2tiWDgEsQMH550ah06o/bKvFPeBMh3TVr3oJmuCaXLL+rh9zwqZ
         yGcd4UWV8jvV9KtNZRIPlOCOH6CQ2qgdEYDvolztWu5Cq19TqYAZ8KImOThBoAwPZl+Q
         iVYGSpBEFt2VAMxOuftj5OgDEGE35byxL+BGzDo2PDorfvdbCyyBx0AmXKnq0K2lD7CY
         YuIGRhAdur8VlNi2JIOo4Mi5XZ5+jq25/dtatHDGpO3do4Qa6krJEj0fAyy6C398CP4H
         /0bxs115WmutIwwB3emFJ7nJ4MZeZ8Ne526QMjlr5ruzJGqDNeTNwpC9zoVdNM1XhQNx
         RDSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fnEA60UG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w5si6221241qvl.69.2020.02.24.21.42.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 21:42:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fnEA60UG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6Sym-0007tB-2R
	for alex.bennee@linaro.org; Tue, 25 Feb 2020 00:42:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60442)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1j6Syd-0007sR-14
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 00:41:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1j6Syb-00067V-7L
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 00:41:50 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28924
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1j6Syb-00066s-3R
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 00:41:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582609308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vk9ybKTfqFyPt8H/hWiVLqk4DQGRcqNb//UpSaxQcqg=;
 b=fnEA60UGqEOVF5bPjGznIZ4XtZ1sIT5n82GGs9WKJGWODrPFJ0Pzp6+tOHVOGgbKTW1X7X
 s260eDm8OO7bo6PZ4VVTJThWxt3Yku6XK657EIu9Oo7au8w5Q4KoC+O80hQ7Sx84D5qcbi
 CX0FDL6waqqOlY52HKroFZ9RHSQw6wY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-kyLzb73-OY-lN27p22XJJQ-1; Tue, 25 Feb 2020 00:41:46 -0500
X-MC-Unique: kyLzb73-OY-lN27p22XJJQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FADC18AB2C0;
 Tue, 25 Feb 2020 05:41:44 +0000 (UTC)
Received: from [10.72.13.170] (ovpn-13-170.pek2.redhat.com [10.72.13.170])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9018A5C651;
 Tue, 25 Feb 2020 05:41:39 +0000 (UTC)
Subject: Re: [PATCH] hw/net/imx_fec: write TGSR and TCSR3 in imx_enet_write()
To: Chen Qun <kuhn.chenqun@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20200225025923.19328-1-kuhn.chenqun@huawei.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <9206dda7-0e12-b68e-87ca-1985b61381bc@redhat.com>
Date: Tue, 25 Feb 2020 13:41:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200225025923.19328-1-kuhn.chenqun@huawei.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, peter.chubb@nicta.com.au,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8KRjSaL9igar


On 2020/2/25 =E4=B8=8A=E5=8D=8810:59, Chen Qun wrote:
> The current code causes clang static code analyzer generate warning:
> hw/net/imx_fec.c:858:9: warning: Value stored to 'value' is never read
>          value =3D value & 0x0000000f;
>          ^       ~~~~~~~~~~~~~~~~~~
> hw/net/imx_fec.c:864:9: warning: Value stored to 'value' is never read
>          value =3D value & 0x000000fd;
>          ^       ~~~~~~~~~~~~~~~~~~
>
> According to the definition of the function, the two =E2=80=9Cvalue=E2=80=
=9D assignments
>   should be written to registers.
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
> I'm not sure if this modification is correct, just from the function
>   definition, it is correct.
> ---
>   hw/net/imx_fec.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> index 6a124a154a..92f6215712 100644
> --- a/hw/net/imx_fec.c
> +++ b/hw/net/imx_fec.c
> @@ -855,13 +855,13 @@ static void imx_enet_write(IMXFECState *s, uint32_t=
 index, uint32_t value)
>           break;
>       case ENET_TGSR:
>           /* implement clear timer flag */
> -        value =3D value & 0x0000000f;
> +        s->regs[index] =3D value & 0x0000000f;
>           break;
>       case ENET_TCSR0:
>       case ENET_TCSR1:
>       case ENET_TCSR2:
>       case ENET_TCSR3:
> -        value =3D value & 0x000000fd;
> +        s->regs[index] =3D value & 0x000000fd;
>           break;
>       case ENET_TCCR0:
>       case ENET_TCCR1:


Applied.

Thanks


