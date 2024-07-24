Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp3051496njc;
        Wed, 24 Jul 2024 05:32:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWRHGqwLH+TB1UYlYbrcFPp9P0chh2WWTXzDK3ctV3SGJ7fAgrusRQwm6WLW1rEue2vALZUo/eNGgCGfsImeg8wZLotaVUV
X-Google-Smtp-Source: AGHT+IFoOycbgXwdg8hf+5cA7jzCb63pG7XFvVKEh2VWJCFyzLY6BlOXbgVMOrMt6lokrOP2Entn
X-Received: by 2002:a05:6902:c08:b0:e08:80ca:c3dd with SMTP id 3f1490d57ef6-e0b0e664e60mr2805594276.49.1721824369080;
        Wed, 24 Jul 2024 05:32:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721824369; cv=none;
        d=google.com; s=arc-20160816;
        b=SQegcyQwtE8Bx5XdiQ0JkPTmlZ7WBB21OV8o/3ESWAxkOc8ABXF2wIsx+fTa3P0FLg
         84KapRSigEvuMIy1CV9vt5VtFB8AIVaFP9zO4BdvZXJVZ5bdd+BVVB2Yzb2DGaiuaz6c
         q5YfMFZLKHE0e/I3NukmzAPlBg8JjLDoonjUEpT5YOq7lV/cQj2XeqQ5+udyVHhBVnJK
         Sq4cls+/HKgiUQsWCm61CL7e1azfZrnkK/Oi3P5s8S20wW5MIGD66Rk7A780t3b7I7W6
         ZT+JMtGYu5mUMS5FvDjmT8tFb0nVsS6EG7jFxS/fBw9rx+R4nr2Xc/dwujgJ7P6yIwkS
         7szw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=pPAMhbit1B/V9vaKOQX1Yb2zF6e6S3tju5TN0jGrNiU=;
        fh=5YFPQIrakCYiTcuIb79Kp5KFQm8HA/3roVGPMQaS888=;
        b=KUMXmhLTruGnQqOPY9kQYXcG+WVbqc/AVUamavoaWK9SaSup4kICt0AY/9QHGiV59w
         b/S3fE9mhrIqGK8BCbn6b4mZgjLIJszfLOJMOPejNwTEsI9ntwQaCzB3a+daFMQswxnZ
         2A+IjFd1X9ptxn2houVXKrtYTEJpkheTtHdtvPqj8pc3C0BdgDYcbrZjS2KUhUXvloVT
         IPB7PcsKBidOFI/72DPoa+mKQhsHUh9J5EPvmga+aS1rpuNJUjxIQf9u4z+P5NuvfKwd
         mSBAhRZey+OG6kjeugZYwm26y2V0jXtZcj3O+6gzXghvJWRb6EsEvrxgZjyY88mOAeQc
         nyyQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dPO4hYH5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b7ac9b8e8fsi125287846d6.340.2024.07.24.05.32.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jul 2024 05:32:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dPO4hYH5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sWbAJ-0006Il-3X; Wed, 24 Jul 2024 08:32:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sWbA6-0005Xw-Gk
 for qemu-arm@nongnu.org; Wed, 24 Jul 2024 08:32:06 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sWbA4-0002sH-Cm
 for qemu-arm@nongnu.org; Wed, 24 Jul 2024 08:32:05 -0400
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2eefeab807dso77621791fa.3
 for <qemu-arm@nongnu.org>; Wed, 24 Jul 2024 05:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721824322; x=1722429122; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pPAMhbit1B/V9vaKOQX1Yb2zF6e6S3tju5TN0jGrNiU=;
 b=dPO4hYH5OaPWCJQ+OZ5NLmogO5ahVpcukytEjwB4lhyghjerKR2yuJN2CJRnQSwtFM
 IxYCqVjuUCWF6NaGkqb/9IveAErlfbLCWpiO5rLcpN3/yKiPmkLT+PsLfpKjdSGvFfiB
 nuZz5UfWQMSsxTOXOlSK12DGrUmAZHVQN/9UhDJiox7hjkpWT6mLmFfJbecYZmzAl1GA
 AvMV/SSEmUrVYUd5A3JR3nX5TEoGIieU6s3KbqbUv6JbSf59RVZr9L3odhZob/XdZ1Ti
 OiK14addCd7NW0N363VY8BdXVEOsE+zDjYkdeAbgsgZxyGtqi9HcuCz4PVomj0AuXUV/
 A20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721824322; x=1722429122;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pPAMhbit1B/V9vaKOQX1Yb2zF6e6S3tju5TN0jGrNiU=;
 b=XHyotfHPS7PlGhPNX+9eFvJHLH7Lat9uzxPkhokhPfwAAoxvcAwtKDPGrh04Cls4VC
 E9hfeaClxTw3xGQ6VklxmjFdETy2WmSszbzaN0F1s1QzzGZUuxwYEhmaTn77g4c8IS/D
 2yVM6k0Ts/5vzwOsrV6Kt7ZX9VAJ30hgRgQk6GIXyakasJSB+xCnlhlUiT3JQ2dYR245
 dA422coiD1IuKCG9lllGJpWwuc0vaAvBIeK4vRtTvKbOCLSViWj8Xy8s89RUmqM0Ga/G
 Py6l7qFaOOANKF0tDwHzFwTsdUi7Eaa94aQCIKM+uTwMfsP5gopSkYlC8qaj3MDkekCD
 4RqA==
X-Gm-Message-State: AOJu0Yzllko45+svpjqt3Tyi1/x4uSPfRZ4GSQ0bpEYLYhbt5Dw3+tAg
 kb1hOCU1tEFEDq5o8NAcO79oRKINCY+CM+8rhziP9A3G6Tku7eBJt65w7FEuvmLAkHZjUQ4FhQ8
 nzCdznagXqW8QJsWsZs93e0K3gHHu53larkIe6w==
X-Received: by 2002:a05:651c:11d1:b0:2ef:2b36:933f with SMTP id
 38308e7fff4ca-2f0324ec08dmr12495901fa.14.1721824321907; Wed, 24 Jul 2024
 05:32:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240723131029.1159908-1-peter.maydell@linaro.org>
 <20240723131029.1159908-3-peter.maydell@linaro.org>
 <a8291990-e161-4a43-a1c9-69040f1f6f93@linaro.org>
In-Reply-To: <a8291990-e161-4a43-a1c9-69040f1f6f93@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 24 Jul 2024 13:31:50 +0100
Message-ID: <CAFEAcA8GPPy4P330P8kgbCxf=S+f8WGmB6tnAHN5bXxxyN9U=A@mail.gmail.com>
Subject: Re: [PATCH 2/4] hw/misc/bcm2835_property: Avoid overflow in OTP
 access properties
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: xKR+JhIxR20g

On Wed, 24 Jul 2024 at 08:06, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Hi Peter,
>
> On 23/7/24 15:10, Peter Maydell wrote:
> > Coverity points out that in our handling of the property
> > RPI_FWREQ_SET_CUSTOMER_OTP we have a potential overflow.  This
> > happens because we read start_num and number from the guest as
> > unsigned 32 bit integers, but then the variable 'n' we use as a loop
> > counter as we iterate from start_num to start_num + number is only an
> > "int".  That means that if the guest passes us a very large start_num
> > we will interpret it as negative.  This will result in an assertion
> > failure inside bcm2835_otp_set_row(), which checks that we didn't
> > pass it an invalid row number.
> >
> > A similar issue applies to all the properties for accessing OTP rows
> > where we are iterating through with a start and length read from the
> > guest.
> >
> > Use uint32_t for the loop counter to avoid this problem. Because in
> > all cases 'n' is only used as a loop counter, we can do this as
> > part of the for(), restricting its scope to exactly where we need it.
> >
> > Resolves: Coverity CID 1549401
> > Cc: qemu-stable@nongnu.org
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
> > ---
> >   hw/misc/bcm2835_property.c | 9 ++++-----
> >   1 file changed, 4 insertions(+), 5 deletions(-)
> >
> > diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
> > index e28fdca9846..7eb623b4e90 100644
> > --- a/hw/misc/bcm2835_property.c
> > +++ b/hw/misc/bcm2835_property.c
> > @@ -30,7 +30,6 @@ static void bcm2835_property_mbox_push(BCM2835Propert=
yState *s, uint32_t value)
> >       uint32_t tot_len;
> >       size_t resplen;
> >       uint32_t tmp;
> > -    int n;
> >       uint32_t start_num, number, otp_row;
> >
> >       /*
> > @@ -337,7 +336,7 @@ static void bcm2835_property_mbox_push(BCM2835Prope=
rtyState *s, uint32_t value)
> >
> >               resplen =3D 8 + 4 * number;
> >
> > -            for (n =3D start_num; n < start_num + number &&
> > +            for (uint32_t n =3D start_num; n < start_num + number &&
> >                    n < BCM2835_OTP_CUSTOMER_OTP_LEN; n++) {
>
> I find not making the counter size explicit and use 'unsigned'
> simpler, since using 32-bit in particular doesn't bring much here.
> Is there a reason I'm missing?

I just wanted to match the types between n and start_num and
number (where the latter two should be uint32_t because we load
them from the guest as 32-bit values). Otherwise we're relying
on "unsigned" being at least 32 bit -- it is, but if we need
it to be 32 bit then why not use the type that is guaranteed
and says specifically that it's 32 bits ?

thanks
-- PMM
