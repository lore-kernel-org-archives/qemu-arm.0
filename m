Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4143258lfp;
        Mon, 3 Feb 2020 08:27:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqy/9Ii3p/vI9IYwtfSvXlY70qr1ytdKpzVEVrnsPafTgIb9zbpqBzuh0XJpfCoAgpWiNri4
X-Received: by 2002:ac8:140c:: with SMTP id k12mr24249870qtj.117.1580747246241;
        Mon, 03 Feb 2020 08:27:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580747246; cv=none;
        d=google.com; s=arc-20160816;
        b=VY8ha4bkiaEP3bTiDsbKm9KWM7m7VzKucSL+vYOUoNYKlKO+IKj8gFngSePumXuxP9
         3ufSC+6fNgRHKxUyuTrXxzgue4a4q0KabqRiVEhWNX4s0k6dWGVEN6mkg2qkEvwHB5dV
         mdYnu9D75APl8ZIVClx/ZxOSZi7Zk7FVi2cVQ7XZ4MSrBFtBjRlWZmmvHICqy2uxrjMj
         fjF+nsnN1immeQaTQ7M8e3jsf7XwbATlb2S/d1pqdhDmh9u5PFYKbeEOteBKqbuMW2oY
         FnGqnqkRcgJXHq6LAphWuRKII/Kmeg6Jwy+SEeIm51aku9vfJL/g1VF+0RimQqHzjAwv
         2STg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=QeCBVp1KPvqehrC6OiB2uJKqww75jQAealCEUARBU5U=;
        b=zII6Yuvwp9tbPV4f4j6ECouuYHPAipmoABx2L2TQ1GmzF5IaGxc/enrMfjYSA2bcLY
         +rAXhU0WW0/OQYjXc9mMgvGniKniYdnZDWkHKMjzEkwFCSyRb8gSarB4hb9MZmWow1cx
         M6OKms2N+ihaebOUD7IzQP//DLva7DX2aVsreKeDdRQcJFlv6j+wtzCdoIi+Ty08/Llv
         yE0o6DRc8rxiOJadUVT3xfW4RPeO4a3Ljh5EthA6HbvLGWibqr6ZiXj0ZL9K6y06Jz/q
         vhfxEn0Qv7usWIr/wLVuhPGaXZXFGfhCGrdT9ZVgC6vFHjtJH21JL8EXiHHfVIkShipY
         qWUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=C9sqhQlQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i9si12340499qka.16.2020.02.03.08.27.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 08:27:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=C9sqhQlQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iyeZJ-0006GH-LX
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 11:27:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47186)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iyeZ9-0006Fe-SU
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 11:27:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iyeZ8-0003J1-8e
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 11:27:15 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:33099
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iyeZ8-0003Fz-5D
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 11:27:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580747233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QeCBVp1KPvqehrC6OiB2uJKqww75jQAealCEUARBU5U=;
 b=C9sqhQlQqjQQgVSiM7nPiVngObV2a2WpWwtqiBzoF0Qe+aE139mwd5z1UkPrrtg05OMX0j
 8mnhu7VsvAWiszpNPtnnEpfzz2rg/voj1phbsZXJRT108+/2bZx6w8c4Q7HN0rZgC3Qwnb
 3M+qk7rRqZsAdUDzytn7dxgN/yM/N2I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271--uOCqfGpN3moXZfgn_grGA-1; Mon, 03 Feb 2020 11:27:11 -0500
Received: by mail-wm1-f71.google.com with SMTP id t17so5027397wmi.7
 for <qemu-arm@nongnu.org>; Mon, 03 Feb 2020 08:27:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V9ZnIYefrPXQs+RPAOIp4pYvstrzQL+oKuT6OoiNitI=;
 b=du8BAtm6Y5dX354IAo3gmOQeeBu1UQ91CLiOLQ05Gxaq70cdbq07IbUcfqC2V9LFkq
 z32VzwHnWwFdEj4FvomgD5L7cqZHy9JPEzEtVUUYvBZretkeLK6+yuZms36dscaQhUHT
 nZIf7V8/YKsyHGYjfr00CuqmKxOZjxRewQFr3k2YUYH9dA0biV9Jol3P3VGuN/lGcMUB
 wq3iXUo/hdq0DL4IWTv2lyel6kfywjHY+iMlj5ng2S4BIlXtLqccGlmlL+Jwrd4GujG5
 haX2uF0VPfkQE+NBP4ETx8IZh2cvgU7Iqvhst7u4AXfrkjWV+uNz3IQmpzBFCE/kKGCo
 fIig==
X-Gm-Message-State: APjAAAWvuI1QK8IA7W6RIG+L9ipv2Qe0BJotwLhsEa0SiJqx8bWLNPWM
 P2g+UWqCKw34QWfxza3ck8ttWifOOBIwEzN+UMmORArlTJNK8RJm+xFV/BIxBQlstHXva95QHGM
 fbb2VC2qa6jZO
X-Received: by 2002:a5d:6a83:: with SMTP id s3mr15471378wru.99.1580747229979; 
 Mon, 03 Feb 2020 08:27:09 -0800 (PST)
X-Received: by 2002:a5d:6a83:: with SMTP id s3mr15471366wru.99.1580747229803; 
 Mon, 03 Feb 2020 08:27:09 -0800 (PST)
Received: from [192.168.1.35] (162.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.162])
 by smtp.gmail.com with ESMTPSA id a62sm24771220wmh.33.2020.02.03.08.27.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2020 08:27:09 -0800 (PST)
Subject: Re: [PATCH v2 2/2] bcm2835_dma: Re-initialize xlen in TD mode
To: Rene Stange <rsta2@o2online.de>
References: <5397138.k0qeMALlIp@desktop2>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <80ae5ce3-c58d-800c-4748-ea4842a6ff84@redhat.com>
Date: Mon, 3 Feb 2020 17:27:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <5397138.k0qeMALlIp@desktop2>
Content-Language: en-US
X-MC-Unique: -uOCqfGpN3moXZfgn_grGA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Andrew Baumann <andrew.baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4CWhql8Be6ZX

On 2/3/20 4:40 PM, Rene Stange wrote:
> TD (two dimensions) DMA mode did not work, because the xlen variable
> has not been re-initialized before each additional ylen run through
> in bcm2835_dma_update(), which has been fixed.

"which has been fixed" confused me, because this current patch is fixing=20
it. Using present tense makes it easier to understand for non-native=20
English speakers IMHO:

   TD (two dimensions) DMA mode does not work, because the xlen
   variable is not re-initialized before each additional ylen
   run through in bcm2835_dma_update(). Fix it.

If you agree, maybe Peter (the maintainer who will take your patch) can=20
make the change for you.

Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

>=20
> Signed-off-by: Rene Stange <rsta2@o2online.de>
> ---
>   hw/dma/bcm2835_dma.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/dma/bcm2835_dma.c b/hw/dma/bcm2835_dma.c
> index 667d951a6f..ccff5ed55b 100644
> --- a/hw/dma/bcm2835_dma.c
> +++ b/hw/dma/bcm2835_dma.c
> @@ -54,7 +54,7 @@
>   static void bcm2835_dma_update(BCM2835DMAState *s, unsigned c)
>   {
>       BCM2835DMAChan *ch =3D &s->chan[c];
> -    uint32_t data, xlen, ylen;
> +    uint32_t data, xlen, xlen_td, ylen;
>       int16_t dst_stride, src_stride;
>  =20
>       if (!(s->enable & (1 << c))) {
> @@ -82,6 +82,7 @@ static void bcm2835_dma_update(BCM2835DMAState *s, unsi=
gned c)
>               dst_stride =3D 0;
>               src_stride =3D 0;
>           }
> +        xlen_td =3D xlen;
>  =20
>           while (ylen !=3D 0) {
>               /* Normal transfer mode */
> @@ -117,6 +118,7 @@ static void bcm2835_dma_update(BCM2835DMAState *s, un=
signed c)
>               if (--ylen !=3D 0) {
>                   ch->source_ad +=3D src_stride;
>                   ch->dest_ad +=3D dst_stride;
> +                xlen =3D xlen_td;
>               }
>           }
>           ch->cs |=3D BCM2708_DMA_END;
>=20

