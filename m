Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1785546lfp;
        Thu, 6 Feb 2020 10:36:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqwUHXDe94FghQ+FbdUPIICnHlBadUTrj/guG0owSBC0BLcVcUUX7QEhm+9VytYt3oroa/QK
X-Received: by 2002:ae9:f719:: with SMTP id s25mr3757859qkg.209.1581014199018;
        Thu, 06 Feb 2020 10:36:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581014199; cv=none;
        d=google.com; s=arc-20160816;
        b=zrec9E/x+MC5dzj6+7U3C7GyNAX7QxDibR639Uiaq/oTK+jusUHt17qTXQTdx9aClS
         lrpJbZLUyOugKL9wBjJwS3EiLSedis8Gahbn/sGdgth34p1EVJowiXpPm+vk4pXxy8lv
         jVejyWZ6Btw1a7nenI/vnR6mA8lksrhtvyFM7Y64qU4BGz4lWB/nmbAi6dRZCvJ7e+S0
         tWPRitoqbN5/NGJ6OmTrI/woLTcbFaFF6SX9YdY/x2MIn8V47AVrWsI6RnpenQwJ7L+v
         CfCyuYPt6IcvJnFAgNQiLXW0geak2agu3VNZal44Bu1s+qCAfGVxSEEh1A7q0fv9b3/O
         fe/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=mo9yRQw1REoBA/MyFi8tTI1bRXGJ3OlE8vgJmMfM5a0=;
        b=Sb+wDuH2D4MnyBWKLOnbYA6mTAJ6Ev5ZtDx8D3n2vz0icVcd74mCLNrpHl2upNPzNC
         +VdCQuRCflZUu4rYqdOWNvO4VLh4xOzDwx1PenSc3y0yRXagXIwcfEmHr/X+YWQs5aWS
         IQ4wuKyGWTuVfdGgFPWi1FLgDkbxjm7N34b4WfUYkJn2p4bC1QZNk/41sPBeXc9pBjOu
         s464kLa+aQfeiFFjSjEU7s9/JjLPhBQGU63cQzjGgxyrAVIpqco5w2D5xHhcFzeEUp58
         ONDQOX8UPLGXc2yCCVkOSuX4GaiAn0u6aX51RCBMdDHX0GPyLUs5MH65DG22YnPIYRwE
         Z7tQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EIsoWkAc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p21si36989qkp.178.2020.02.06.10.36.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2020 10:36:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EIsoWkAc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izm10-0005g3-D1
	for alex.bennee@linaro.org; Thu, 06 Feb 2020 13:36:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35139)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1izm0q-0005dG-K9
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 13:36:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1izm0p-0002JZ-IX
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 13:36:28 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50118
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1izm0p-0002IA-9O
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 13:36:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581014182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mo9yRQw1REoBA/MyFi8tTI1bRXGJ3OlE8vgJmMfM5a0=;
 b=EIsoWkAc7aQDaSrwQap/kGNyhiivCZEiuyJCTF93CDGyZ/nhgLQ3ldpzg++Rp/NJqDKeES
 E2lbOV66vV90PJmi76iQ/eLjLU42ogG1VD5+o1ZbQ90BnFBF5RD9dC82jSpMFboeSVHjgs
 b+8FkHL+kc4cOJKdYxPOdfVYMBfcAvY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-FQuhVCrGPt-KNV0UmnFMlg-1; Thu, 06 Feb 2020 13:36:21 -0500
Received: by mail-wr1-f69.google.com with SMTP id o6so3917059wrp.8
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2020 10:36:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d2CB3VjmYgy2Vv4LniaDWxlOYqVJgHczX0WcYY9SVVI=;
 b=BW3WhETbwDwGxRSPJ8EPPy2AhXVWg8N/xFYCBbqm3EIBvEhVGTH2wbwKcUeJj4YBNI
 bYObjzk2cs/F5v2UcttS+ewSMpCuZ5yiF/kWpQ9Gi8h4yVC3YoASQmcuuZ2PK5L8oGBs
 19kmRDhTp1/HOOJY8v6YlFyF/i7TWzhzc3bMQzm1URzlYok5UAEKBGf1ha8ZnGoX031z
 bf30XhuOpPYYawBQ+XllHQ32659ToH2fuUfRKe/FJg/xLJ2lHnG9BdIa+VXtXoZ8nKYN
 JOF+AnqKyyGe02wZgWY9t49tiaX6PSlFv8f+3uPTMJg74Jm7AoeIyTmeRH5UYhIrDKVr
 n/lw==
X-Gm-Message-State: APjAAAXtL9Xid8RQiAj4GQGNmpkGOB+Gg9rCdwSFasniTarQ5mU+EbgB
 VrAGj98nRn7nWJMA1zf3HJyTYs9IFktdOfVITypvkWEbNzigpYBlh9T7t/fF6DLW5YP7m7AwIsJ
 Adx1LCL9s1Aqv
X-Received: by 2002:a5d:6708:: with SMTP id o8mr5403137wru.296.1581014179737; 
 Thu, 06 Feb 2020 10:36:19 -0800 (PST)
X-Received: by 2002:a5d:6708:: with SMTP id o8mr5403104wru.296.1581014179444; 
 Thu, 06 Feb 2020 10:36:19 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id s8sm159400wrt.57.2020.02.06.10.36.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2020 10:36:19 -0800 (PST)
Subject: Re: [PATCH v2 2/4] m25p80: Improve command handling for Jedec commands
To: Guenter Roeck <linux@roeck-us.net>,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>
References: <20200206183219.3756-1-linux@roeck-us.net>
 <20200206183219.3756-2-linux@roeck-us.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a2755daa-6cf9-4858-4b0e-d160efc2fc8a@redhat.com>
Date: Thu, 6 Feb 2020 19:36:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200206183219.3756-2-linux@roeck-us.net>
Content-Language: en-US
X-MC-Unique: FQuhVCrGPt-KNV0UmnFMlg-1
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UDg/6Z4uWS9K

On 2/6/20 7:32 PM, Guenter Roeck wrote:
> When requesting JEDEC data using the JEDEC_READ command, the Linux kernel
> always requests 6 bytes. The current implementation only returns three
> bytes, and interprets the remaining three bytes as new commands.
> While this does not matter most of the time, it is at the very least
> confusing. To avoid the problem, always report up to 6 bytes of JEDEC
> data. Fill remaining data with 0.
>=20
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2: Split patch into two parts; improved decription
>=20
>   hw/block/m25p80.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 5ff8d270c4..53bf63856f 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -1040,8 +1040,11 @@ static void decode_new_cmd(Flash *s, uint32_t valu=
e)
>           for (i =3D 0; i < s->pi->id_len; i++) {
>               s->data[i] =3D s->pi->id[i];
>           }
> +        for (; i < SPI_NOR_MAX_ID_LEN; i++) {
> +            s->data[i] =3D 0;
> +        }
>  =20
> -        s->len =3D s->pi->id_len;
> +        s->len =3D SPI_NOR_MAX_ID_LEN;
>           s->pos =3D 0;
>           s->state =3D STATE_READING_DATA;
>           break;
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

