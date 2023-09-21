Received: by 2002:a17:906:5293:b0:9ae:5796:d6c1 with SMTP id c19csp387161ejm;
        Thu, 21 Sep 2023 00:12:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHguNOb7HF9JzbqciXvCb1DuV1Xgk7QuHl0GbrhJbj3yGSaZdXC1RmzWbvpkG/z5SDKPrTq
X-Received: by 2002:ac8:5c11:0:b0:410:8afa:8787 with SMTP id i17-20020ac85c11000000b004108afa8787mr5025854qti.22.1695280341055;
        Thu, 21 Sep 2023 00:12:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695280341; cv=none;
        d=google.com; s=arc-20160816;
        b=dNA+1JVAmHPBZhpypw3gIJ6T5COVAmX298wiSC/RkQOYIvUcRZ0sdk8Jmq9+62Q1Kk
         UtGchcyYlk7/gKcFDC2FsHpcEiKVTNWiLWsbnAekrBDBIlk37uYlNfEsFaIfvdY3l5Nj
         CUIYFAiAW88fgocGXxCHza3Hy0m9Rv2VCdBz9Q/niRqh2VlSFfE2yiT1aI5f87kqKDN9
         c9mM8gPbtkJmBQAw3AB3cJMm/ctuLY8x1h/kDzMBJIZSNoeYYv2RoYQqnvYNxf2pXm3u
         lDy7XdF5o07BZ6xF2idNxvfX+kbaP3Q9Ba021FFTu3UQqrrNN/DsgWv93ci/hriNP2/S
         DYWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=YEOfyYBMEjXEsSB5+ijTzjaH2UDhyoRDH9AI+T7kK6M=;
        fh=AeEbYRKZYO9kPF6/mmeffzKtIm7KU3WDJTeXu4lZmDA=;
        b=y2tWwGv5eZ1bVN3mEmr1gVkY5nKL6AMAoglRCmJhaDppdm8ffxp4/39cv3zuQBMAfS
         8zVtxvljIp9JTC1/W5vKDu5L/qvvCZECSSJxcoxKxAiyszRLlJaeMqZ4zssWQFfOKMw5
         fQZriVBs+S0l+o5wReAYuO7bEdUYZo90RBk1I8E/2nb5DPyV7eWZ0dpWxNAPvJ4RRvg5
         f78wNCeRCE5TsITCFg50c+n3t7h/ecTdiQ7LeZC7wJ/56nH1RxCZO8/JMVKItnFT/vdl
         66QXf9vyzFC+aqkMZUcBqzx0Ucliln7tilE3SVkuKXw7oSVS2rNe+ZR+XNXyTf1dFEI0
         OjIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=msqie3g4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e6-20020a05622a110600b0040fc66157easi534683qty.383.2023.09.21.00.12.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Sep 2023 00:12:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=msqie3g4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qjDqo-0003pl-1m; Thu, 21 Sep 2023 03:11:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1qjDqm-0003oy-1i; Thu, 21 Sep 2023 03:11:48 -0400
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1qjDqk-0001Qd-AH; Thu, 21 Sep 2023 03:11:47 -0400
Received: from [192.168.68.112]
 (ppp14-2-88-115.adl-apt-pir-bras31.tpg.internode.on.net [14.2.88.115])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 585F320034;
 Thu, 21 Sep 2023 15:11:42 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1695280303;
 bh=YEOfyYBMEjXEsSB5+ijTzjaH2UDhyoRDH9AI+T7kK6M=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=msqie3g4wS3arYEbDG/rS4za+LctZfSTsUec879NwNX4MFdcQdZObj6NT4781QFoP
 Df6MXJkbIM5RJr1+wK+VzTUh+qBHTXs+1cgu47C50lRNkN4J3T6W3G0W6zdY/15Pud
 AVEdK4uTsbCd5yWQab+CENuWtSnnSvws6tjunDPzNqL3W5z+GZO9yTKn7v0/ifTxEq
 QFnykFznh4old/RqfvEukrQ8WQ8LzUfdGdIMdG6sTBRvwZQHs0gOIw9QtF/XlviVtB
 Anyg57GAT1O0T5w58ESAFn3a47an10iQVM0v/6Cb3QXnzMDOSbH8WChnHyXKVtowPZ
 A4DtRXCIM6c0Q==
Message-ID: <8c281addd173112061e9de7a3916c01493d138a0.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6 1/3] hw/i2c: add smbus pec utility function
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Klaus Jensen <its@irrelevant.dk>, Corey Minyard <cminyard@mvista.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,  Keith Busch
 <kbusch@kernel.org>
Cc: Lior Weintraub <liorw@pliops.com>, Jeremy Kerr
 <jk@codeconstruct.com.au>,  Matt Johnston <matt@codeconstruct.com.au>,
 Peter Delevoryas <peter@pjd.dev>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>
Date: Thu, 21 Sep 2023 16:41:41 +0930
In-Reply-To: <20230914-nmi-i2c-v6-1-11bbb4f74d18@samsung.com>
References: <20230914-nmi-i2c-v6-0-11bbb4f74d18@samsung.com>
 <20230914-nmi-i2c-v6-1-11bbb4f74d18@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Received-SPF: pass client-ip=203.29.241.158;
 envelope-from=andrew@codeconstruct.com.au; helo=codeconstruct.com.au
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: e5cV51KmMZ8I

On Thu, 2023-09-14 at 11:53 +0200, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> Add i2c_smbus_pec() to calculate the SMBus Packet Error Code for a
> message.
>=20
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

It at least looks a lot like the linux implementation :)

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

> ---
>  hw/i2c/smbus_master.c         | 26 ++++++++++++++++++++++++++
>  include/hw/i2c/smbus_master.h |  2 ++
>  2 files changed, 28 insertions(+)
>=20
> diff --git a/hw/i2c/smbus_master.c b/hw/i2c/smbus_master.c
> index 6a53c34e70b7..01a8e4700222 100644
> --- a/hw/i2c/smbus_master.c
> +++ b/hw/i2c/smbus_master.c
> @@ -15,6 +15,32 @@
>  #include "hw/i2c/i2c.h"
>  #include "hw/i2c/smbus_master.h"
> =20
> +static uint8_t crc8(uint16_t data)
> +{
> +    int i;
> +
> +    for (i =3D 0; i < 8; i++) {
> +        if (data & 0x8000) {
> +            data ^=3D 0x1070U << 3;
> +        }
> +
> +        data <<=3D 1;
> +    }
> +
> +    return (uint8_t)(data >> 8);
> +}
> +
> +uint8_t i2c_smbus_pec(uint8_t crc, uint8_t *buf, size_t len)
> +{
> +    int i;
> +
> +    for (i =3D 0; i < len; i++) {
> +        crc =3D crc8((crc ^ buf[i]) << 8);
> +    }
> +
> +    return crc;
> +}
> +
>  /* Master device commands.  */
>  int smbus_quick_command(I2CBus *bus, uint8_t addr, int read)
>  {
> diff --git a/include/hw/i2c/smbus_master.h b/include/hw/i2c/smbus_master.=
h
> index bb13bc423c22..d90f81767d86 100644
> --- a/include/hw/i2c/smbus_master.h
> +++ b/include/hw/i2c/smbus_master.h
> @@ -27,6 +27,8 @@
> =20
>  #include "hw/i2c/i2c.h"
> =20
> +uint8_t i2c_smbus_pec(uint8_t crc, uint8_t *buf, size_t len);
> +
>  /* Master device commands.  */
>  int smbus_quick_command(I2CBus *bus, uint8_t addr, int read);
>  int smbus_receive_byte(I2CBus *bus, uint8_t addr);
>=20

