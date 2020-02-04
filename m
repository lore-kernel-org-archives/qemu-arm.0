Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5288347lfp;
        Tue, 4 Feb 2020 04:14:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqwhR3fcuFXzaXjEAfGDcPj2uS8/Y9fiUucyxwNy745tO1VyyetWnx6MSblso03duQteaJj2
X-Received: by 2002:ae9:e115:: with SMTP id g21mr27417539qkm.187.1580818454748;
        Tue, 04 Feb 2020 04:14:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580818454; cv=none;
        d=google.com; s=arc-20160816;
        b=XCh37H8+mzgQQdRM6rA6h7wJyC5SZdwg2AAWqSPtGTOnT/p44m3OtuiNQ2Dj7XbHa3
         5NeCOTXafOwN2A9C8g1XG5ujqZ5CuDid3AQThWouuiWGjd262XEnwShgfWBoxWO5MB5O
         8jFRc0sZxdMls34Em4joMJkK4bMUKGxeh/HRFyoIBrdNjsd/nPzWy06IXsCeNIg/7nYl
         Q6R2XitNEA6Exu4jJX8aGE0R3OSC0jrkXRbbxlElL5uI2JyCq65tGvbdR7L/7kzHrZOr
         CHffYfpgK2FxnD8hnKZxduIir6RWgRGcYBVvByYwlhrMZ0pV6R21kN/pd/HUmMFbfvsC
         7KSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=bM2AUf6/agC3QuflAW1mxA/f4pWC9GxZmeEuTCCI+5c=;
        b=YbCZIYhEcYMMAAhW/5SjSITZS9gonwCna/PStHKOcEuQP9CJLchxkj0vrQKr5VpY6i
         7fXW3kHE+DYQ9sE4Rcp1IMB9oovmZ4XmoBib9OSo4ehlhI5Pf9fGSIqODrExgwdFiQKW
         ER0xioQtnpQFI0BrawuXK7Dnvmgr+hX71IW2pGTobOI+xppuIc5HNpi0jZOsRO//vAgE
         gISGHFEDr40R070ZnO8vDGBbsuNoVrGu2VWpuWlrVqzgkdahnl2SUk+NO+JFvy1dkN5K
         Wvw6REI4YGvm8lGQcEs2+qmUm9HESrBbrtjcbWpBQqj4Vn/URwlwDaQTkPLyMXRJOBzA
         EMfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VCNH8Lpc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c139si14715085qke.78.2020.02.04.04.14.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2020 04:14:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VCNH8Lpc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iyx5q-0007uh-6k
	for alex.bennee@linaro.org; Tue, 04 Feb 2020 07:14:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54700)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iyx5Z-0007qA-52
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 07:13:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iyx5Y-0006j9-3B
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 07:13:57 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:34285
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iyx5X-0006iV-VH
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 07:13:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580818435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bM2AUf6/agC3QuflAW1mxA/f4pWC9GxZmeEuTCCI+5c=;
 b=VCNH8LpchFiKSnnaSYnzeRi2Sohr9wGPvN7Edp3gAcCLnBB/Ik/oxeq5Rvjay+m9LhvyIO
 goG+rgJ3D9iFombhMN+El7t4sDRMwhBqU701ztuUsV7eea6IJNUhC7I7OKA0eAcvryCFCD
 gRVljeIJ30o7j/STkmH1ZZ/pQb7HNYo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-USuRvtdDNhmE3-eQvzeIYA-1; Tue, 04 Feb 2020 07:13:53 -0500
Received: by mail-wr1-f69.google.com with SMTP id t3so9999790wrm.23
 for <qemu-arm@nongnu.org>; Tue, 04 Feb 2020 04:13:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QIF3Yi9//ahh9LDSvFZ7uu6Is+Gug4m3kf8x2yrnYno=;
 b=chCuV6s1YrK9uufPVKu6jGTYTzW+5XP1z7cirjCtFicTd1qrks0Q3UPKXxoH4jXrcA
 MzMHN2cJ91G9nuqytF2j+9bodhgqPQJmGwo05HLynLp+PINUbR72pMvkQU4ZK+ZTCCcu
 TjWJmPDXuhOQmJLUHjlGk/kB6lTcAnmzuHuvhJ5vEJ3/JD+Eb39h7mnNvFW3yIP/RWhp
 8xhzavvwwzDB6o5XKy2Cp6/oPRba6aFwvD3ZtlJyPa8Ph8Qc41PQKNmzPIS4uSRoGNaR
 +tyQxm6VwGtXfIJAFSRPd9sOJA8y/L9MZUwq2rvL1yZ6uigGBVXC2JKUN1JHMlfJIZxk
 xNhQ==
X-Gm-Message-State: APjAAAVHW0r7Ja14aW4bJ3bwCmd6psD+S7J0PHYHOZGWVYAZrIfhV39B
 oKmasYLnFZ0Ue7fMrFAj6L41y2IQ+VCbzdfgUTNf73Ognmeh4ztGbBLYpNswv3/HdEMuWSZutrn
 Rf7TQ5zQUsE9F
X-Received: by 2002:adf:ecd0:: with SMTP id s16mr21559928wro.325.1580818432506; 
 Tue, 04 Feb 2020 04:13:52 -0800 (PST)
X-Received: by 2002:adf:ecd0:: with SMTP id s16mr21559906wro.325.1580818432283; 
 Tue, 04 Feb 2020 04:13:52 -0800 (PST)
Received: from [192.168.1.35] (162.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.162])
 by smtp.gmail.com with ESMTPSA id b16sm3494953wmj.39.2020.02.04.04.13.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2020 04:13:51 -0800 (PST)
Subject: Re: [PATCH 2/3] m25p80: Improve command handling for Jedec and
 unsupported commands
To: Guenter Roeck <linux@roeck-us.net>,
 Alistair Francis <alistair@alistair23.me>
References: <20200203180904.2727-1-linux@roeck-us.net>
 <20200203180904.2727-2-linux@roeck-us.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <eb5762ed-4b3c-a00d-dc56-8ec2315fe331@redhat.com>
Date: Tue, 4 Feb 2020 13:13:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200203180904.2727-2-linux@roeck-us.net>
Content-Language: en-US
X-MC-Unique: USuRvtdDNhmE3-eQvzeIYA-1
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mJmuW5SJ6+fe

Hi Guenter,

On 2/3/20 7:09 PM, Guenter Roeck wrote:
> Always report 6 bytes of JEDEC data. Fill remaining data with 0.
>=20
> For unsupported commands, keep sending a value of 0 until the chip
> is deselected.

Two changes, I'd rather see 2 patches. If you happen to respin they are=20
welcome. As the split is trivial maybe a block maintainer is OK to do=20
it. Regardless the outcome:
Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

>=20
> Both changes avoid attempts to decode random commands. Up to now this
> happened if the reported Jedec data was shorter than 6 bytes but the
> host read 6 bytes, and with all unsupported commands.
>=20
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>   hw/block/m25p80.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 63e050d7d3..aca75edcc1 100644
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
> @@ -1158,6 +1161,11 @@ static void decode_new_cmd(Flash *s, uint32_t valu=
e)
>           s->quad_enable =3D false;
>           break;
>       default:
> +        s->pos =3D 0;
> +        s->len =3D 1;
> +        s->state =3D STATE_READING_DATA;
> +        s->data_read_loop =3D true;
> +        s->data[0] =3D 0;
>           qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Unknown cmd %x\n", valu=
e);
>           break;
>       }
>=20

