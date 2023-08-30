Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp4348373ejc;
        Wed, 30 Aug 2023 06:05:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMa1ZXIcQzqeKK9vGk4WmXZ0l3A0XPfrnEQsDfv7PRF/fVxPcgb5cJMuUe/aTGqYvLFDjw
X-Received: by 2002:a0c:ab48:0:b0:64f:6199:a8e with SMTP id i8-20020a0cab48000000b0064f61990a8emr1838577qvb.23.1693400700287;
        Wed, 30 Aug 2023 06:05:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693400700; cv=none;
        d=google.com; s=arc-20160816;
        b=DfvlmcPl/+M3T8iNU0vrUBmr5XTmurhD/FNlwJhJHBq0qp4Jf5ALSguzyvhDvVPEqf
         wxNIgChFOvWN9ksJYeODpTRQEx1voo+PN04BcpOK/IoelYiOWdWbaw9sClSB5v1cNrhD
         NCcQtDXq0UsM5CNN8DoPCKpPKmKhFLwEZbkBfEekAAHB/cvpfwjTAKjQV76vasfJ81cw
         tmBld0I/wC8zh0XP0y0BtzpgucCg8e31yBsY8sOkbTFUTU2gey0FdzlDSzjBeyDpDtzy
         f9xInzfQE5CHCkhiSMaXdh+EcQ3mSfbMmttB3nT4C1BzZhPNZKSe5UWrE/jI9EAN6h7z
         kryg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=/0mClzfKeuh3Zvg+ECMIpkMuB1BM/3PUcJ9EufskIjI=;
        fh=7yy96vKsaDsvcJ6a94ZD+eukO8Ada+9E4Kgz2MHHiWE=;
        b=xOmvb3FSH45/hKBsGthRbPuWT652WLTdUWrlQMSuXtRHmoTObA+eHW469fAS8X3BeT
         kXtLUuMoqFfD2yMkSic4SOgrgk0bqP8JQX0kcKLGQlG8ajIpKLXNDfVLWYL8x+i+N9Fj
         68ik+yzcHbCPRpkGag8MmD/EujAWa2s01lHfKe+sCgvadaFpfNAc1bLmnFOFK8N7fz4L
         9w++dTdXTHZHYCkzhffx5u3evqvXSUOqElIFNsr0O+Uu6xM8qjRaCljVJQx8n4bW2srI
         GOg2ksR3elEpK8I8vJu7sNw7wtdFSzvmsbJQz1n7qyTKiCuU7nv6NSu3/fcBrp2HGJ2W
         hc0A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qt7-20020a05620a8a0700b0076cf3531349si7213400qkn.760.2023.08.30.06.05.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Aug 2023 06:05:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbKsL-0005kv-LU; Wed, 30 Aug 2023 09:04:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1qbKsG-0005hC-AD; Wed, 30 Aug 2023 09:04:45 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1qbKs9-0007Qj-EC; Wed, 30 Aug 2023 09:04:43 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RbPWg5GjTz6K6V0;
 Wed, 30 Aug 2023 20:59:27 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 30 Aug
 2023 14:04:15 +0100
Date: Wed, 30 Aug 2023 14:04:14 +0100
To: Klaus Jensen <its@irrelevant.dk>
CC: Corey Minyard <cminyard@mvista.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Lior Weintraub <liorw@pliops.com>, Jeremy
 Kerr <jk@codeconstruct.com.au>, Matt Johnston <matt@codeconstruct.com.au>,
 Peter Delevoryas <peter@pjd.dev>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <qemu-block@nongnu.org>, "Klaus Jensen"
 <k.jensen@samsung.com>
Subject: Re: [PATCH v4 1/3] hw/i2c: add smbus pec utility function
Message-ID: <20230830140414.0000428b@Huawei.com>
In-Reply-To: <20230823-nmi-i2c-v4-1-2b0f86e5be25@samsung.com>
References: <20230823-nmi-i2c-v4-0-2b0f86e5be25@samsung.com>
 <20230823-nmi-i2c-v4-1-2b0f86e5be25@samsung.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: m8LIMxAHchtz

On Wed, 23 Aug 2023 11:21:58 +0200
Klaus Jensen <its@irrelevant.dk> wrote:

> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Add i2c_smbus_pec() to calculate the SMBus Packet Error Code for a
> message.
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  hw/i2c/smbus_master.c         | 26 ++++++++++++++++++++++++++
>  include/hw/i2c/smbus_master.h |  2 ++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/hw/i2c/smbus_master.c b/hw/i2c/smbus_master.c
> index 6a53c34e70b7..01a8e4700222 100644
> --- a/hw/i2c/smbus_master.c
> +++ b/hw/i2c/smbus_master.c
> @@ -15,6 +15,32 @@
>  #include "hw/i2c/i2c.h"
>  #include "hw/i2c/smbus_master.h"
>  
> +static uint8_t crc8(uint16_t data)
> +{
> +    int i;
> +
> +    for (i = 0; i < 8; i++) {
> +        if (data & 0x8000) {
> +            data ^= 0x1070U << 3;
> +        }
> +
> +        data <<= 1;
> +    }
> +
> +    return (uint8_t)(data >> 8);
> +}
> +
> +uint8_t i2c_smbus_pec(uint8_t crc, uint8_t *buf, size_t len)
> +{
> +    int i;
> +
> +    for (i = 0; i < len; i++) {
> +        crc = crc8((crc ^ buf[i]) << 8);
> +    }
> +
> +    return crc;
> +}
> +
>  /* Master device commands.  */
>  int smbus_quick_command(I2CBus *bus, uint8_t addr, int read)
>  {
> diff --git a/include/hw/i2c/smbus_master.h b/include/hw/i2c/smbus_master.h
> index bb13bc423c22..d90f81767d86 100644
> --- a/include/hw/i2c/smbus_master.h
> +++ b/include/hw/i2c/smbus_master.h
> @@ -27,6 +27,8 @@
>  
>  #include "hw/i2c/i2c.h"
>  
> +uint8_t i2c_smbus_pec(uint8_t crc, uint8_t *buf, size_t len);
> +
>  /* Master device commands.  */
>  int smbus_quick_command(I2CBus *bus, uint8_t addr, int read);
>  int smbus_receive_byte(I2CBus *bus, uint8_t addr);
> 

