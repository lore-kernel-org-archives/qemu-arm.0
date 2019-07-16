Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp872619wrv;
        Tue, 16 Jul 2019 04:58:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwJDJaOMy5pIUHgS7gmpyYpG7VsYiPGyLGxz5atH/7SMN6SFy64GBFsrKLFN2+ta0/3sEsO
X-Received: by 2002:a50:9203:: with SMTP id i3mr29382837eda.302.1563278316606;
        Tue, 16 Jul 2019 04:58:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563278316; cv=none;
        d=google.com; s=arc-20160816;
        b=Z4vdn9Y1GQvZYj5CIMV5ZM78iEE/Yo5LOaP052v8puaoHHM2e+mFCM6rwMTOxSfu8E
         YMjVP33rRdyXtEKpCVEsNgaKceiybeEOETK3bckwbSJjLjzhdXAv6Fa00gJtzwHogH+t
         u8YceziTjNfX9KgOM2OwObKXkc87qnABCxkPtizs+e8DVwLQehEww9ceq5fQR86ji4wJ
         9CHc0GlD7Sff7g9kcsxi6K75upZlssa1u6hVe+R0mgkpolpj4Raq4wgIT2uOhAuvYuE6
         xcrGampmvTFm67m0KAKPgUyBE9jVet76R5NvOx/sD9ktS8aoVIzLlsLnR94yIDTHjI4F
         LseQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=/ry4UQX8ArdtliwPmZ0YyCAvrsF1omQdZ2YXaoHafys=;
        b=yfMOsloor3DsirJNjXDxPf4/LiNcea8JU0SpHa4cn6cUjyxa69X9fsuj4nQ8tNCRtX
         MzfUi24/gETD6H23S4xZ5C9fZrYxPNK0/UrweDerSk3NU4eLzScY7y6JMiLCbGJDPwF6
         EzONWPXPagOgcHACARqPqz6euxN48OBGE9cUVC+acCxXO78FQf/pN7VcQJy6enPCvT5f
         ohyKfKnIdWIWuBnHKCxMSYihFpbbjszBkojIaB+LVqpcUQQvqilmy12H/YOI3NzFYk9o
         RhtZ/NwCp05f2OV9iUM6PStZaXG/818AfJErFErbQXarVxukTySD0j8+CDY1C9HrQw0D
         1OiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e14si12620406ede.277.2019.07.16.04.58.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2019 04:58:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hnM6N-0002OV-HS
	for alex.bennee@linaro.org; Tue, 16 Jul 2019 07:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46933)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jasowang@redhat.com>) id 1hnM6K-0002OM-JB
 for qemu-arm@nongnu.org; Tue, 16 Jul 2019 07:58:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1hnM6J-0007vc-KF
 for qemu-arm@nongnu.org; Tue, 16 Jul 2019 07:58:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48290)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>)
 id 1hnM6J-0007v9-EU; Tue, 16 Jul 2019 07:58:31 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 89FF13082135;
 Tue, 16 Jul 2019 11:58:30 +0000 (UTC)
Received: from [10.72.12.91] (ovpn-12-91.pek2.redhat.com [10.72.12.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D82A5E7A5;
 Tue, 16 Jul 2019 11:58:23 +0000 (UTC)
To: Ramon Fried <rfried.dev@gmail.com>, qemu-devel@nongnu.org
References: <20190716105951.25446-1-rfried.dev@gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <f6b7308b-f642-a691-eb97-1d74360aebac@redhat.com>
Date: Tue, 16 Jul 2019 19:58:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190716105951.25446-1-rfried.dev@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Tue, 16 Jul 2019 11:58:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2] net: cadence_gem: clear RX control
 descriptor
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
Cc: alistair@alistair23.me,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "open list:Xilinx Zynq" <qemu-arm@nongnu.org>, peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WYtCO82v422j


On 2019/7/16 =E4=B8=8B=E5=8D=886:59, Ramon Fried wrote:
> The RX ring descriptors control field is used for setting
> SOF and EOF (start of frame and end of frame).
> The SOF and EOF weren't cleared from the previous descriptors,
> causing inconsistencies in ring buffer.
> Fix that by clearing the control field of every descriptors we're
> processing.
>
> Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
> ---
> v2:
>    * change function name to rx_desc_clear_control as proposed by
>      Jason Wang
>    * Move the function call above the comment, as proposed by
>      Philippe Mathieu-Daud=C3=A9
>
>   hw/net/cadence_gem.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index ecee22525c..cca3ce7f56 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -406,6 +406,11 @@ static inline void rx_desc_set_sof(uint32_t *desc)
>       desc[1] |=3D DESC_1_RX_SOF;
>   }
>  =20
> +static inline void rx_desc_clear_control(uint32_t *desc)
> +{
> +    desc[1]  =3D 0;
> +}
> +
>   static inline void rx_desc_set_eof(uint32_t *desc)
>   {
>       desc[1] |=3D DESC_1_RX_EOF;
> @@ -993,6 +998,8 @@ static ssize_t gem_receive(NetClientState *nc, cons=
t uint8_t *buf, size_t size)
>           rxbuf_ptr +=3D MIN(bytes_to_copy, rxbufsize);
>           bytes_to_copy -=3D MIN(bytes_to_copy, rxbufsize);
>  =20
> +        rx_desc_clear_control(s->rx_desc[q]);
> +
>           /* Update the descriptor.  */
>           if (first_desc) {
>               rx_desc_set_sof(s->rx_desc[q]);


Applied.

Thanks

