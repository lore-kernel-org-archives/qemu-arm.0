Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp616517ocs;
        Wed, 28 Sep 2022 15:48:32 -0700 (PDT)
X-Received: by 2002:a05:600c:4f56:b0:3b4:b6b0:42d4 with SMTP id m22-20020a05600c4f5600b003b4b6b042d4mr164872wmq.143.1664405312307;
        Wed, 28 Sep 2022 15:48:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664405312; cv=none;
        d=google.com; s=arc-20160816;
        b=xKFTnSNUHnfSyn+nfnGn0Gbw1M2HWMMGxzcOu1rMFDtoy+fWlGXOr6rnEONLClTLVS
         pRLv5ksl1b4QVe8urMqP71SJPqgELW6ZAEjhvpUvudyIx8oIdvV+4auQ5D6GfPffeqdi
         eZipxLE6hdQ3nHbJmhEhuqucBG0voKdYZqtNY2hi96cKCFuzo50VbGHPGIVATzDcgSVu
         1m7EwWunlDva/E9dXBPN0h8Vyzujf0/iUB1NdcbNGXwJlGP11su8q2CytZLTgEDKMbmX
         g1d3BEYPg/7BQ5iDtXI9dgGxSJwrjAbZjdheyNZjGHQYpQtfTievQ2sgPluGza+8kFUH
         6cEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nAtblsn9z2xZoGIv9o4JfIP+OBNOBYObsJtyQaLJuUo=;
        b=kmPOI3njMlGgUep4zYBSfejYp0c4qEF9NigEglvhse99D7dUf0+gnAuTR/JL4j3eNO
         MgTlRoHtH5sTkjXouwXFpHZ4uIC+Y6JSwXb4gxrdaNTeEPTIW/TYw9m5S3KT/h+gyDbr
         Oe4/SDYya4XNVjCOKANqgrVWZryFNIEtZbZYBQR45h9Gi8d9l6AIOpkd8kIrvEsO9Ms1
         MfGXr7ThulgeinS3SW1F4rpNgoEmMUNGzACI8QiHsmnvhg5k93lB8KAJ11m31rHX/eNR
         OK0CEZAWjR0SlSF/rB5pAqgcmHJO+N884JvBLkVeDrRHuuYfQS1itepk+0E/IhEuVCZy
         5GOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=nTZWlqB2;
       spf=pass (google.com: domain of joel.stan@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=joel.stan@gmail.com
Return-Path: <joel.stan@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3-20020a056000156300b0022511050e2fsor3592238wrz.27.2022.09.28.15.48.31
        (Google Transport Security);
        Wed, 28 Sep 2022 15:48:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of joel.stan@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=nTZWlqB2;
       spf=pass (google.com: domain of joel.stan@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=joel.stan@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=nAtblsn9z2xZoGIv9o4JfIP+OBNOBYObsJtyQaLJuUo=;
        b=nTZWlqB2WSqYio1rkgCjMOJeUHjYl/jbXu/Ne0MQrPDsV/zpZ4dGNcIO9f3WY8RCPg
         WfhSquzvJbIxION8YIsLdC90IPMXnmrvodvu2LJYbdAPianxw6q1LyReJjg6qtDlA1X2
         zoBqjVt4McsnIu9ILGBK4J51zGj08hJfVprKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=nAtblsn9z2xZoGIv9o4JfIP+OBNOBYObsJtyQaLJuUo=;
        b=fp2ZA2aBl4C0p5IPUHZyiRxf8J1K+Q1M/SW2HOvEAJcuCSife1aLgg2wCwdILA6pAp
         yKTE86JT4lXrJReg8zH+arTxA8RfYvL6gKfzb9m1iqwPjiAEpPxHXb9oXtpFahTdacti
         sWVOiuXz0/IozDpqsPGD3UZWNz/CUXN2MqErcsCPVQHxBRQta1xSTqekN3D6TyKSVfHN
         0mUQevpftCq0ILVe46TpY1bGsOGIT2/+5dORTvifXWJpUbHak6Vid91VLQ+UjgZYskI3
         kcCpdcLLIxCX4tQdorWXtydFjg9Vw0vSsaXvFYmfByVCT5OCAjEQmd0cli+6IiAmT88p
         Tw2Q==
X-Gm-Message-State: ACrzQf3uTtWfu1k4bBWFcVD+XYIFvHVr+7HwOIqoWwGsmqQtgLKcY1DQ
	xxLa7XSUcElscowKhMrAr/B/bOhPlwqfOyw0G7etFWLH
X-Google-Smtp-Source: AMsMyM4HtFNnu7/L4rvIKkz47sxV71JgLQqj7UDyFJ4fe7lmyldMQZNKqQ2lOErh1otX0NQIf63uWaRUp6hdJGs271I=
X-Received: by 2002:a5d:4044:0:b0:22c:c332:9655 with SMTP id
 w4-20020a5d4044000000b0022cc3329655mr60624wrp.315.1664405311088; Wed, 28 Sep
 2022 15:48:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220923084803.498337-1-clg@kaod.org> <20220923084803.498337-2-clg@kaod.org>
In-Reply-To: <20220923084803.498337-2-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 28 Sep 2022 22:48:19 +0000
Message-ID: <CACPK8Xe67FVgbnzyuj99AhDbsrFZfUqdsxZheL8zaybZzHiM3w@mail.gmail.com>
Subject: Re: [PATCH 1/6] tests/avocado/machine_aspeed.py: Fix typos on buildroot
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	Peter Maydell <peter.maydell@linaro.org>, Richard Henderson <richard.henderson@linaro.org>, 
	Andrew Jeffery <andrew@aj.id.au>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: MSt67eYzNWqJ

On Fri, 23 Sept 2022 at 08:48, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Replace 'buidroot' and 'builroot' by 'buildroot'.
>
> Fixes: f7bc7da0724f ("test/avocado/machine_aspeed.py: Add tests using bui=
ldroot images")
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
