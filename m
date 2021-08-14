Received: by 2002:a19:f24a:0:0:0:0:0 with SMTP id d10csp241486lfk;
        Sat, 14 Aug 2021 02:12:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4qyLv9i8TvHbYVBrtiE7DgBwUMGzDZmprx3exwXz4/Ow7sLS0zGh5JhodNPmpx3NHU3Fq
X-Received: by 2002:a6b:7712:: with SMTP id n18mr5150499iom.34.1628932371771;
        Sat, 14 Aug 2021 02:12:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628932371; cv=none;
        d=google.com; s=arc-20160816;
        b=VJbeVl2KBE/umYqWsi/gw92YEYNM7rMRFe5EWNRVpT0cqKUFudNRZJo1PMikak+25j
         qwzJcr3LCgLiuWMxcnIYzP0KdHt9mZQrGu+Z5clS2HLkqqF+iYnO+TZjLn5zl0d9s+I0
         A8zd8ZTlxQcylglK3dcoK2p8jj0UU4XQ4jBxnofabFO6cw/1JTbyYF95MkZnHRQSGJKw
         UBL6xNf00Y0/s5mgGvz8kvLJVWgG3RqjFQh+eieXrbTvyMaz1V2siHTdAcnhjE4lHyYs
         Gn9+GDJ7PYOpfFgmhGdX13TV8I2dn3uvYocLoORqYRMxKevhEY9ILCYefJDf/yXY6mf+
         jnmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:mime-version
         :user-agent:date:message-id:organization:from:references:to:subject
         :dkim-signature;
        bh=kACjGY5LNeg74/Txpbds9APMUnZqwWh2zaBUgXiBQ60=;
        b=UBB358fR2Il1gD7XZLRElG+PbwsyFmdN7gbcjlHvMdgOIbwtfhjVrNprG3f8fepdLH
         9Du2d6RLnkqn6EqqzUw4UD04yrlAtUFroioDUJbV3jTXWDQKQXDTU4nXbghAGuHGpPyO
         icNW5Sr1TfNZWpql982dxY99eemGFPmitiy0Xze2xlT8etM3QYJI8tEw+n1sfDzXGZ/m
         s0rwlo+pSeo854vV6o09zwYK0VD7C2NYkuwP8JJIdB/cpNDecl7EtAXAzNPM2/QC44aU
         9No+9vSaiAo8K6/82ES+MJz5sVGfrNcXcEDMaaB25a5DUKpgsVyHi0xV+nlf6ATa3X11
         xBGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@crans.org header.s=mail header.b=kvXm7MeP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=crans.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y8si4713067ior.35.2021.08.14.02.12.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 14 Aug 2021 02:12:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@crans.org header.s=mail header.b=kvXm7MeP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=crans.org
Received: from localhost ([::1]:49834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mEpil-000517-42
	for alex.bennee@linaro.org; Sat, 14 Aug 2021 05:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1mEpic-0004zl-7d; Sat, 14 Aug 2021 05:12:42 -0400
Received: from redisdead.crans.org ([2a0c:700:2::ff:fe01:2402]:52376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1mEpiZ-0003Oi-5R; Sat, 14 Aug 2021 05:12:42 -0400
Received: from [IPv6:2a02:8428:4db:b001:83b5:a75:e190:e939]
 (2a02-8428-04db-b001-83b5-0a75-e190-e939.rev.sfr.net
 [IPv6:2a02:8428:4db:b001:83b5:a75:e190:e939])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by redisdead.crans.org (Postfix) with ESMTPSA id DD1C3483;
 Sat, 14 Aug 2021 11:12:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crans.org; s=mail;
 t=1628932357; bh=a6ErJ88Y0fY1uManFf2VhZ2xu1t0Uz2rNo4WZXpP2j8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=kvXm7MePg9Zv3uRRFa7088Pa4Pl0YkMTtQdZYsoSWdY18aticpDDd7/h7ZMIpAwRY
 hPMGV+ozEFLVSjYSU32h1meWXsWY75NUD+IhS7YrqJich3xqQxvYUjRtSaJppeAuRu
 TCavVyylY9iprUgz/gkWGEI1N4GIra/GBNoq7jKfaWnEH2pqU+wac5C/p7JrAPlzKU
 DvemAJ8z0T++7SFMeDeHF9wqBQsRRQ7ijhpgoF2VoJTXYc4S3rwuvwCBu/UudDJQYb
 LTH9Ub5uIVCR491Z/F6n+dYugchiRo+qwHfOZoDJYQ5DvSwwwUp3jcyK5HXb51s9h5
 jVzWDzKytZ1dX9bv1R94m9kUMra4+nF4pnYbPQwe7myD3g7Xmya6SViVGtHZNg9rms
 yjUvtwj9AJpliR3ZrTJE2zas5FUA6LNZJa5pMoiMP+Si0qLFwbaNpWSVDdAnixau7U
 DxtcK2nBLbAHtsuJmLmunTuvo0DsAJgun8iPyPfz0pII2/xptbtKv9aCGlLtfExnct
 4kWrbRQ5ltP2cQqgQiB5vHXdaGj6BhyZOR0tZNgkNVIpAOp3WD4wIr5hxkSV6MUTGg
 6aCOiaqR7ocCkEwBI5uA7TbZ1AZjnzORtCNXC8Bf9RrhtgvNPjAjlgTzNoJFf2pvB8
 ezd7fHfLlUsRqQlHsDigvzls=
Subject: Re: [PATCH for-6.2 17/25] hw/arm/stellaris: Wire sysclk up to armv7m
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-18-peter.maydell@linaro.org>
From: Alexandre IOOSS <erdnaxe@crans.org>
Organization: Crans
Message-ID: <4ea7c4ac-e993-a179-947b-08b5871bbab7@crans.org>
Date: Sat, 14 Aug 2021 11:12:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210812093356.1946-18-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="YbOftdVM1aMdrCOt0kZawHPQDOt0FYVFd"
Received-SPF: pass client-ip=2a0c:700:2::ff:fe01:2402;
 envelope-from=erdnaxe@crans.org; helo=redisdead.crans.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Alistair Francis <alistair@alistair23.me>, Luc Michel <luc@lmichel.fr>,
 Joel Stanley <joel@jms.id.au>, Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ymh79IpFpJ2g

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--YbOftdVM1aMdrCOt0kZawHPQDOt0FYVFd
Content-Type: multipart/mixed; boundary="ppFpe1dVvKydLyi8woLEJGBDYvKpUAVVU";
 protected-headers="v1"
From: Alexandre IOOSS <erdnaxe@crans.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Luc Michel <luc@lmichel.fr>, Damien Hedde <damien.hedde@greensocs.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>
Message-ID: <4ea7c4ac-e993-a179-947b-08b5871bbab7@crans.org>
Subject: Re: [PATCH for-6.2 17/25] hw/arm/stellaris: Wire sysclk up to armv7m
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-18-peter.maydell@linaro.org>
In-Reply-To: <20210812093356.1946-18-peter.maydell@linaro.org>

--ppFpe1dVvKydLyi8woLEJGBDYvKpUAVVU
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


On 8/12/21 11:33 AM, Peter Maydell wrote:
> Connect the sysclk to the armv7m object.  This board's SoC does not
> connect up the systick reference clock, so we don't need to connect a
> refclk.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alexandre Iooss <erdnaxe@crans.org>

-- Alexandre


--ppFpe1dVvKydLyi8woLEJGBDYvKpUAVVU--

--YbOftdVM1aMdrCOt0kZawHPQDOt0FYVFd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEELTca0n4rvHeX4bdZbHknjz/NzAIFAmEXiQQFAwAAAAAACgkQbHknjz/NzAI1
XA//X+/MWjZQFeg+1fEDaLUnoSPh9A5LYJTXQX0v1m5GXAW6SxP252jAMQtEeIBdMA+CQ4aneiPr
m1XKDBEFim73wiFKeFeXykywOoElxq2rgjYpzx4VYnJU5nz44djQ+FhjvsVmIqCT6rWtDQig9OLl
NvcUojrt9RIPVaG0cbdoRrI6bO93+ZPCLMfyU1bL0fpDM/Ek8h316G4bYsSKo5zFBW0+uCii5jb2
ZzMSmeJIuvCZv7TKc9MffTyHvAZ/AQrSnPJiND5UvzYE5R3mGqUAcEwmmHEs/X3AUOHtgzg6+lVV
2po59vUGicarMzBjBAbLbEfiaZsFdGtaMG7TYVkpdmzqxPcw94v5t8QNA7qgQMyr4eiccHb3kT4s
FCI0oipbrOL/3CQdLzM81ux0i2xVRBfQezS8RY+fupWFZKbOc2XV0FBl8TFdsZBAGDBQ3TcnMIBU
kHOGmLAGVVKlWwqskuYPmh+IUm2IhaJKmrPN+mIfcjKZqh8RCjnfyN8gpJU9rYJFoiyVXkx19CM+
/R8pbtqn2/Vw4BMG90mPjNJmN6l4XH1waW81N8683sVE8JNxxgCKWb6/PAORzCQ1CMkV8TPL+iKh
+mU4e0b+pVNMjJr+NpUWPJNx756xbebVh92Pt7twuU7oLAQ4XIWGg3DCDb8vqGFq0GNxU97pjiLT
vXI=
=Vq4s
-----END PGP SIGNATURE-----

--YbOftdVM1aMdrCOt0kZawHPQDOt0FYVFd--
