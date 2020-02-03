Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4144656lfp;
        Mon, 3 Feb 2020 08:28:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqwsMt8lr3GGCHo2vJugMcvzR0ncM3XzgQx02qVR6b/r++97r6WFlxmSLPuGuzce6EW/btGC
X-Received: by 2002:ac8:4a02:: with SMTP id x2mr24615294qtq.388.1580747335562;
        Mon, 03 Feb 2020 08:28:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580747335; cv=none;
        d=google.com; s=arc-20160816;
        b=fPw4xWZ9F/rR++jJbn9g3iJ+QgX9ZHWn7+rLvvin+8C0kLVV37emkbrUUp/wdC0b0a
         7RdS2KGNWtSCd9Hjv/Wbbw3QS2rAxrXSxSW8zk1RlvLILYpBh5JDe3kxA73dARnQ6r2e
         v8TAF6bFYd9q8FJPbGi3SEYiARRTcID6GHC63kX9JRxeLsF9cqMtUTuFtL9KcVnb789A
         fGX25yQi57WooT01BnXHYRbT8h/8PC+OJopduHmhuMGzI2n06n9IPHFzdSshLmi91ZSf
         RLfDu+PScHPJA1swsCt+bJceVtqobpV7ElYox/+/542R7Bw8Dx8hEARLQ4sKuGhqw7gx
         dHDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=7dJXNaeM/sqgl8NiGZlY/jcuuoz17ROhcoGWI14l0Mk=;
        b=aQ4pyQk2hq17A2HURwpgbM1ccMLGvKCQKaN/p81fxBQS8kozto1ScC1o5NbNREwE9U
         4mS+fWps5xqhlFcKXXKsYPXD+hkYmnwf6nyuo0lENJLPt1FTKxJQLROYbWxvc6ZxSPwa
         7kuQTbOLYPy8HKJcccUNFC+nRock0YZ+b3K0yOj4sckkqLFz1BSHgtU2cWVhxDeW/1hn
         MqxZWqCX9bPOwaEiKbunMJksthiF5QhZM8ogHeqt+nuUunV0dFN4YDrMuv2WBNVG2j5U
         HmOppTVClwP+8xvjji53tjW7OxFbhf2camWZ4M5ScGUrkes/eUr/WilIb4KTN9stiuAD
         yXZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="TqV8Lco/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g21si11322280qtp.41.2020.02.03.08.28.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 08:28:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="TqV8Lco/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iyeak-0007jG-VC
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 11:28:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47629)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iyeZx-00072o-Ev
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 11:28:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iyeZv-0005zp-Nz
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 11:28:05 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:48039
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iyeZv-0005ub-K8
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 11:28:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580747281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7dJXNaeM/sqgl8NiGZlY/jcuuoz17ROhcoGWI14l0Mk=;
 b=TqV8Lco/Dhzx/4BimBTM2jebl7sVqcLaqcfuPxzwm31b91GCHl9llYytGcvwhHG8SKGX2s
 ae6JrQFbcOeTAy3TiYSG7M+Z+6A/ojrV6/DfbQnBUuOF1pCuTGke/9MQdT4l8y+Yj6ynSz
 P7HQMTLjzASWH7UZUtRAxTLCn0u2m8w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-Ij1DSq-IOw-1mwEYw_pL2Q-1; Mon, 03 Feb 2020 11:27:59 -0500
Received: by mail-wr1-f69.google.com with SMTP id p8so1673603wrw.5
 for <qemu-arm@nongnu.org>; Mon, 03 Feb 2020 08:27:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dayF1ugLzQY3wM/H3VSX6J0sehC4Ht2b8PcXS8EjYIA=;
 b=kYctRnNNs1yz34NvziIhONykBSfKbd38B1wrOxZThvCDZIXRmePveLpdhMKjHB/oUC
 96IFD6Y6el27rbDMdkrNtbsjf5TYVByyWejB8ndHPCQZrARsmHJRN7o3x0gRkDC3nMcy
 np5N6GdDN33ev6jb+JYgtPFluUQE0cYVyIdim7eNfCjGIn5q4Uxc9hCg+ktr75S2gSVj
 XZ8ioOlfkWTs1pmOntAFYVbFsRCL3QioyXtHjd8Fijx0KdSYMMsa0X+cx6OfpY+Z/mKb
 mrBgPTWnnlt5W9x/0KUCtb6RqO0+ub7YPXGZDAnWTFgdfmVwBj35Tt6BvM+/8UKtfdm2
 9QPQ==
X-Gm-Message-State: APjAAAU9ewIn5p+c9SYwYEHo/H4gL5CCgwY2I+dpIiasqbwmI/QLpffb
 ckjJUu1QAZSzuF3weINJjeSH5y+wW2E8PjRMD5mLiBurnFmGN0S9XcxIkojDN0Q64b/tE9t/ekK
 M1Q28pvCK0n+j
X-Received: by 2002:a7b:cae9:: with SMTP id t9mr29578324wml.186.1580747277974; 
 Mon, 03 Feb 2020 08:27:57 -0800 (PST)
X-Received: by 2002:a7b:cae9:: with SMTP id t9mr29578312wml.186.1580747277777; 
 Mon, 03 Feb 2020 08:27:57 -0800 (PST)
Received: from [192.168.1.35] (162.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.162])
 by smtp.gmail.com with ESMTPSA id v14sm26509162wrm.28.2020.02.03.08.27.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2020 08:27:57 -0800 (PST)
Subject: Re: [PATCH v2 1/2] bcm2835_dma: Fix the ylen loop in TD mode
To: Rene Stange <rsta2@o2online.de>
References: <11456775.FKKu9GnblS@desktop2>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <22289975-5cd7-47e3-6942-cc95dac80572@redhat.com>
Date: Mon, 3 Feb 2020 17:27:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <11456775.FKKu9GnblS@desktop2>
Content-Language: en-US
X-MC-Unique: Ij1DSq-IOw-1mwEYw_pL2Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
X-TUID: dh2abFwPM+Ry

On 2/3/20 4:40 PM, Rene Stange wrote:
> In TD (two dimensions) DMA mode ylen has to be increased by one after
> reading it from the TXFR_LEN register, because a value of zero has to
> result in one run through of the ylen loop. This has been tested on a
> real Raspberry Pi 3 Model B+. In the previous implementation the ylen
> loop was not passed at all for a value of zero.
>=20
> Signed-off-by: Rene Stange <rsta2@o2online.de>
> ---
>   hw/dma/bcm2835_dma.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/dma/bcm2835_dma.c b/hw/dma/bcm2835_dma.c
> index 1e458d7fba..667d951a6f 100644
> --- a/hw/dma/bcm2835_dma.c
> +++ b/hw/dma/bcm2835_dma.c
> @@ -70,14 +70,14 @@ static void bcm2835_dma_update(BCM2835DMAState *s, un=
signed c)
>           ch->stride =3D ldl_le_phys(&s->dma_as, ch->conblk_ad + 16);
>           ch->nextconbk =3D ldl_le_phys(&s->dma_as, ch->conblk_ad + 20);
>  =20
> +        ylen =3D 1;
>           if (ch->ti & BCM2708_DMA_TDMODE) {
>               /* 2D transfer mode */
> -            ylen =3D (ch->txfr_len >> 16) & 0x3fff;
> +            ylen +=3D (ch->txfr_len >> 16) & 0x3fff;
>               xlen =3D ch->txfr_len & 0xffff;
>               dst_stride =3D ch->stride >> 16;
>               src_stride =3D ch->stride & 0xffff;
>           } else {
> -            ylen =3D 1;
>               xlen =3D ch->txfr_len;
>               dst_stride =3D 0;
>               src_stride =3D 0;
>=20

Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

