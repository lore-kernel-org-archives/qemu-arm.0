Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp428814wrt;
        Tue, 25 Sep 2018 02:12:52 -0700 (PDT)
X-Google-Smtp-Source: ACcGV621Xx+ZQJC1VUOzWd1jdsz1FdVOvqfNLLqj13OyXK9jD71750trFPLZsGvVPFXwdP0tXS/7
X-Received: by 2002:a0c:abca:: with SMTP id k10-v6mr63923qvb.140.1537866772580;
        Tue, 25 Sep 2018 02:12:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537866772; cv=none;
        d=google.com; s=arc-20160816;
        b=L8z60qXoRVoKMYaYaDJimp+iwZWnSpmoH1N29MabZPng4Om3+6ilC4NrQBVhgMZ+6i
         xp8TCobx1vTyfzJTu4vlE+W21qpfY0PT694yf6MhQGNxKImmM9VEONRj+9qTBYS/Oe3u
         8ScLh2DKoxJipyTBh04TTRSBChnMW+ryImVeBn8xpzSWcua1rRmIoTXkYXj326cNkmrj
         FwyFv/zWumi7i+ihE8uO9qlUFacvjTTn9q+/3ht7vWBS0ruDymA7UIjyQc+i4EXRUPzi
         XCp/O2K80lP5wTvV5G0h0kdy6Il9yGcds5/Pk5WCDsikxdJyDGBX9nJ9ZsdPayG05Uxu
         ERTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=DvhTacDJFEl6sC7ctAJXh/h2lilcl9KCE6DWkAAfVbc=;
        b=jYl53nNkM0CIvrMKzY10+NsVwAhF9ravCdf+HVaxuddPJEU50ssHlGMY/0FOjbVUL8
         vdb90P7zjMgJzwESiX40pgKJIFWqzx2+x79nab3QQOsydCkydETxj/xIzkmlraMNgJ5A
         moMHLlC4uKZGI3wfAFCJgXRzNRCncjZBtULD0GrLzrgkNB3ImH5m8e3KT9E3gICxe/dL
         U8LtkUuyclxjBx8BQfMu6Eb+lMjgKfsF/bUMyB2lC8ghSwkAZbBS9VtbEM5J6JO73zB7
         ZDKvi4qRL6jbeUTQZBuRZGw3ViVekKg+J5X7R432eqs4l5eGcZ3Id0LYGzUTI0YG2uTM
         3XGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fqSU3VR5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v2-v6si722341qkb.323.2018.09.25.02.12.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Sep 2018 02:12:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fqSU3VR5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51769 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4jOl-00038H-UG
	for alex.bennee@linaro.org; Tue, 25 Sep 2018 05:12:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50907)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4jOY-00037T-6y
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 05:12:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4jFC-0008It-04
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 05:03:03 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:34009)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g4jFB-0008Ie-Rz
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 05:02:57 -0400
Received: by mail-ot1-x341.google.com with SMTP id i12-v6so23657011otl.1
	for <qemu-arm@nongnu.org>; Tue, 25 Sep 2018 02:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=DvhTacDJFEl6sC7ctAJXh/h2lilcl9KCE6DWkAAfVbc=;
	b=fqSU3VR5KAc0RdZIbfJpBymLTi07vjHu3lYkn+ncYLi60YSEk155KSrqWtWMU9Bu1X
	zT1mUg2uXXGwz1oVyP7LesULe9aFos40CSfGQHJXk9LEKX7Q+npoWdVFmuHbIXTFKwkv
	CD92dGj/4LJ3kVekHa2YCF2BdFJn2ELUfst/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=DvhTacDJFEl6sC7ctAJXh/h2lilcl9KCE6DWkAAfVbc=;
	b=iejGLBXv1YaUYC4sHvJcb1hPnqT5m4KYHDuFrb4V0K/Akc6rym86iTeY3qaAX6JK5X
	HHB3zO9A7pW4Vlx+MQNqjHwPrP/Clg4HSJTU5bRzq/+lkCixm4v0G41KD9H3sUi8WCEa
	BwvuZAh42F0fAzc+6xkXDbi3Qx4I8W/lFo/s7T8AHLcQ9WniASj+tqpl4WzMgsFSPRM2
	avPtk8v+Isie7LacM1RerS2JX5X7osnZmDHA2OjcISfHQ8bXazpEJd/xkzFVdUuikJdl
	Eh16nJ68bAV+P5h4FidxRujjeOd5M3ZNUaImilDa+zYTKiYZG4PSZWVWO//z7f/6jVQf
	AKQg==
X-Gm-Message-State: ABuFfohVyObDLhxrKC0GjKpyuH/MhtguMZebjOJ/ecwnXYtnOX2rsQkO
	b51twVSP5LitMm26ug5qVvZPRAwgumPxcSR4G9krOw==
X-Received: by 2002:a9d:2e21:: with SMTP id q30-v6mr46967otb.98.1537866176854; 
	Tue, 25 Sep 2018 02:02:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Tue, 25 Sep 2018 02:02:36
	-0700 (PDT)
In-Reply-To: <20180914063506.20815-2-clg@kaod.org>
References: <20180914063506.20815-1-clg@kaod.org>
	<20180914063506.20815-2-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Sep 2018 10:02:36 +0100
Message-ID: <CAFEAcA8uGPPy0mr+iHiByS+HTwOKfUbSpuM6UjOG1+-uNYk0Ww@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH 1/3] aspeed/i2c: interrupts should be cleared
 by software only
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rDrVDC64yV1g

On 14 September 2018 at 07:35, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> and the bus interrupt should be lowered when all interrupts have been
> cleared. Also, the model does not implement correctly the RX_DONE bit
> behavior which should be cleared to allow more data to be received.
> Yet to be fixed.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/i2c/aspeed_i2c.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
> index c762c7366ad9..de6b08378675 100644
> --- a/hw/i2c/aspeed_i2c.c
> +++ b/hw/i2c/aspeed_i2c.c
> @@ -52,6 +52,13 @@
>  #define I2CD_AC_TIMING_REG2     0x08       /* Clock and AC Timing Contro=
l #1 */
>  #define I2CD_INTR_CTRL_REG      0x0c       /* I2CD Interrupt Control */
>  #define I2CD_INTR_STS_REG       0x10       /* I2CD Interrupt Status */
> +
> +#define   I2CD_INTR_SLAVE_ADDR_MATCH       (0x1 << 31) /* 0: addr1 1: ad=
dr2 */
> +#define   I2CD_INTR_SLAVE_ADDR_RX_PENDING  (0x1 << 30)
> +/* bits[19-16] Reserved */
> +
> +/* All bits below are cleared by writing 1 */
> +#define   I2CD_INTR_SLAVE_INACTIVE_TIMEOUT (0x1 << 15)
>  #define   I2CD_INTR_SDA_DL_TIMEOUT         (0x1 << 14)
>  #define   I2CD_INTR_BUS_RECOVER_DONE       (0x1 << 13)
>  #define   I2CD_INTR_SMBUS_ALERT            (0x1 << 12) /* Bus [0-3] only=
 */
> @@ -59,11 +66,16 @@
>  #define   I2CD_INTR_SMBUS_DEV_ALERT_ADDR   (0x1 << 10) /* Removed */
>  #define   I2CD_INTR_SMBUS_DEF_ADDR         (0x1 << 9)  /* Removed */
>  #define   I2CD_INTR_GCALL_ADDR             (0x1 << 8)  /* Removed */
> -#define   I2CD_INTR_SLAVE_MATCH            (0x1 << 7)  /* use RX_DONE */
> +#define   I2CD_INTR_SLAVE_ADDR_RX_MATCH    (0x1 << 7)  /* use RX_DONE */
>  #define   I2CD_INTR_SCL_TIMEOUT            (0x1 << 6)
>  #define   I2CD_INTR_ABNORMAL               (0x1 << 5)
>  #define   I2CD_INTR_NORMAL_STOP            (0x1 << 4)
>  #define   I2CD_INTR_ARBIT_LOSS             (0x1 << 3)
> +
> +/*
> + * TODO: handle correctly I2CD_INTR_RX_DONE which needs to be cleared
> + * to allow next data to be received.
> + */
>  #define   I2CD_INTR_RX_DONE                (0x1 << 2)

Is this TODO something different from the behaviour involving
this RX_DONE bit which is fixed in patch 3 in this set ?

thanks
-- PMM
