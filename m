Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp88007lfp;
        Wed, 5 Feb 2020 05:10:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqxGflEMgClhvVtXSQn/Xy+9rHTQYoLmQAuxo8ZO/E+ti5AcjmuOo/MHg3YjoGy8wsIXcRuo
X-Received: by 2002:ac8:4814:: with SMTP id g20mr33797552qtq.179.1580908237352;
        Wed, 05 Feb 2020 05:10:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580908237; cv=none;
        d=google.com; s=arc-20160816;
        b=Mq38V9VNJJbMhZLeZa37UnRxHcODhDHmoYwI+334m+Xrwb2yGUkNWMLlk3/Zu57gVE
         0z2Au6+dg6Uf8BJtypUrPvpCbu7uFkr8LeUiOmqEl1UAthn6Lc24cJGSU4IKPzAmDYPu
         /SQzhbh5uVqKDnpHTizizX95UUvRK7vyE6GMfqEHh2gqz3XZEghy4l6Ase+1ZFvqyGl0
         3sZkSSRyQGAJ9gCFXUKmS9PwHa+f2mgSG1nRAOBC6OeGLskvABkdv2WKutNrc0EuTBJr
         WboYj22jlbpttSN8bNv5L9A+GEvsOVvJp9p3KMCwcyHmcx1se44kgErPU1ZOHT+ufteS
         Wffw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=JdVsCmfWYLq3X9BXHiwnkxB/k4srKjQEvuOIb3gBTJE=;
        b=tZSeN1YMLV77f7wbc6y83K1Ud+gbYrFiNys/LGZp82k4OzpvJDtTibk3CFa+ojpzmq
         ZigiXz0TzIOXireXqgna7JO2dUVRHR40tgXvrLZTxZ26SpyBX1lK6RTL98I0wUbaWPxR
         TfTpVOQAWRCYFiObgqNVJy1qhEfhl5qYBgLxTdJx2qGS+zbSGdKbVKJXZdgOMYIkFlP6
         fIm+CX1a4DkLCfunM52evnINIXx3JhMj2w1Pz5Kv2oRqM/rlSBTdGXu8PnBxaKwntR1U
         yPaxWZeY/Qq23u9Sg53mTajMJVY9tW3afWzkOgnKVjDARap57O8xyIO9ysjNH04biJZQ
         TG+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CO5QHaAv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m29si15242096qkm.49.2020.02.05.05.10.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 05:10:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CO5QHaAv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izKRw-0004JD-QH
	for alex.bennee@linaro.org; Wed, 05 Feb 2020 08:10:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55652)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1izKRm-0004FI-6y
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 08:10:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1izKRl-0002Sj-4H
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 08:10:26 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:58785
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1izKRk-0002R2-SD
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 08:10:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580908224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JdVsCmfWYLq3X9BXHiwnkxB/k4srKjQEvuOIb3gBTJE=;
 b=CO5QHaAvnrbOEY23QAN7PA8TUZfo0Sl9rQfpi6FW6enYQle2Qdu6ql3p7FjreXWgYbFaip
 OFRqKHYuNImjtEI8V9DK1lCHBfYouN01y9FC6gvsZYi64rIJ32XwNQHs4iGs8DSyuHtPy0
 Szi/g4Kkp6/BZzgnEmSzK705Tbuz2UY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-UCwR0rsnN9apMhc3k-1RTw-1; Wed, 05 Feb 2020 08:10:20 -0500
Received: by mail-wm1-f70.google.com with SMTP id o24so985550wmh.0
 for <qemu-arm@nongnu.org>; Wed, 05 Feb 2020 05:10:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=svyYRmjP0AjXWveCuPG76++AZlWwHFiM6YQLm1BvpMg=;
 b=c7A10EpHug0ji7GBBIzVPac3nBn4Dg5B9tlhzk0Wh4q3cjLaDh2+HzA4SmuJQF2JqN
 XM2XL4ZItb51Rdtj9sHx1IfxAy+SFaiBjt/5tkgl+99cmMHNqFoVnZ1O3pQIkl9Gb2Jr
 UBnjQRXMxtjes3lA8VBDh7q1DYOcOQ5JFD8kh0zerT9lWdX68UCPHNgLeO/9I8kCj3t8
 s/4UaNzMV03/qlY/UyvuRsABRZiASwf3QjmP45cZvujyw75W/NAAS9M81yi8z/82+hB8
 0guLR0OKxWb9SrV47XsdBxGCxf6Dv7NP1ZmH9UcLMHpeCe8aCKi1LXdZd2ChW0/lt4cZ
 Wjrg==
X-Gm-Message-State: APjAAAU4WYHkCrTT+CkLayKpnm//XAcgIiSMn+ObI7FkIEPb4lgC8fTM
 VY8NP6dv1e0drdIwg7pTSqqr9BOh47IXy1Dl4+463uuQu/hpSvHe2pgqxN/aU37n/MHyYm2oP/Y
 RkRC+POVRTjCX
X-Received: by 2002:a1c:4d07:: with SMTP id o7mr5903037wmh.174.1580908219618; 
 Wed, 05 Feb 2020 05:10:19 -0800 (PST)
X-Received: by 2002:a1c:4d07:: with SMTP id o7mr5903002wmh.174.1580908219312; 
 Wed, 05 Feb 2020 05:10:19 -0800 (PST)
Received: from [192.168.1.35] (162.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.162])
 by smtp.gmail.com with ESMTPSA id e17sm7909165wma.12.2020.02.05.05.10.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2020 05:10:18 -0800 (PST)
Subject: Re: [PATCH 3/3] stellaris: delay timer_new to avoid memleaks
To: pannengyuan@huawei.com, peter.maydell@linaro.org
References: <20200205070659.22488-1-pannengyuan@huawei.com>
 <20200205070659.22488-4-pannengyuan@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <71c5dc35-d2f2-6a7e-dde3-408fc24bb425@redhat.com>
Date: Wed, 5 Feb 2020 14:10:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200205070659.22488-4-pannengyuan@huawei.com>
Content-Language: en-US
X-MC-Unique: UCwR0rsnN9apMhc3k-1RTw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, zhang.zhanghailiang@huawei.com,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CsBhjzYe6YaQ

On 2/5/20 8:06 AM, pannengyuan@huawei.com wrote:
> From: Pan Nengyuan <pannengyuan@huawei.com>
>=20
> There is a memory leak when we call 'device_list_properties' with typenam=
e =3D stellaris-gptm. It's easy to reproduce as follow:
>=20
>    virsh qemu-monitor-command vm1 --pretty '{"execute": "device-list-prop=
erties", "arguments": {"typename": "stellaris-gptm"}}'
>=20
> This patch delay timer_new in realize to fix it.
>=20
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
> Cc: qemu-arm@nongnu.org
> ---
>   hw/arm/stellaris.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
> index bb025e0bd0..221a78674e 100644
> --- a/hw/arm/stellaris.c
> +++ b/hw/arm/stellaris.c
> @@ -347,11 +347,15 @@ static void stellaris_gptm_init(Object *obj)
>       sysbus_init_mmio(sbd, &s->iomem);
>  =20
>       s->opaque[0] =3D s->opaque[1] =3D s;
> +}
> +
> +static void stellaris_gptm_realize(DeviceState *dev, Error **errp)
> +{
> +    gptm_state *s =3D STELLARIS_GPTM(dev);
>       s->timer[0] =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, gptm_tick, &s->opa=
que[0]);
>       s->timer[1] =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, gptm_tick, &s->opa=
que[1]);
>   }
>  =20
> -
>   /* System controller.  */
>  =20
>   typedef struct {
> @@ -1536,6 +1540,7 @@ static void stellaris_gptm_class_init(ObjectClass *=
klass, void *data)
>       DeviceClass *dc =3D DEVICE_CLASS(klass);
>  =20
>       dc->vmsd =3D &vmstate_stellaris_gptm;
> +    dc->realize =3D stellaris_gptm_realize;
>   }
>  =20
>   static const TypeInfo stellaris_gptm_info =3D {
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

