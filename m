Received: by 10.223.159.82 with SMTP id f18csp951629wrg;
        Tue, 21 Nov 2017 09:31:46 -0800 (PST)
X-Google-Smtp-Source: AGs4zMb4XKqzrGTT64ZYn9nhVbmdYYtk7YZFi6wBm9K1m6LbClBUkHappWWQe7hluqjtwMfDaVzQ
X-Received: by 10.13.243.2 with SMTP id c2mr12012563ywf.59.1511285506480;
        Tue, 21 Nov 2017 09:31:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511285506; cv=none;
        d=google.com; s=arc-20160816;
        b=vEMtmaaXf0/dfFGsW9mwC2vA/SELlKwXDz65Drgo6q4aqtHWHX1ssb1nl+PrmlOb+N
         F6y6uJskToncQVQ//5sQxgC9uBwTqdQxBgcmNoR7KCZ5enlEGDat1+CD1NqUv4lZCzTA
         a9is4grzjUbmMt/gtiR+9cNlRlGnqp4V60v1ZbsHVQIx/S+7dmENDAqhzfkE56weYSIm
         Y2Tmuai5jEMMj7/+iMQVbTMU6r+0zc45zozw7c9cEOt+vMx9RogosRMKQjs65RgMthXj
         heDMhsCwh4q1PSHQgk4Fpy/sXdtBeoiwA+piArwzAxM1/3m0dROXJV+E2997KR1td4Gi
         rE7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=prCizgG71pwfspmj36pppvgYlYsWelI3MScxaujqTHs=;
        b=nHI3n01mQMFZiIJoRcg5gXGt8KTC5PDIb0FuDJrZS+F1xJpTmtxYvM2Q+Lme/T2tTK
         cv8DXxZrNB+oo0TJ1KCkJSNxVM6m55MiDr5OhyAa5iIKo1x37kDwlw+/6sTWcviKeP4F
         4HfLqRxCG3qsRBJ21NITQMKUwnjI7HWRop1KGW63Uu1p1pd/vbQmeBm3XnRqivq3R0CV
         cCrAZgyoWkA31z/sRHNk4ilW3TMrxHetWOlSMSSTIUPk6USIPbuw1JPY/HbsTcjKKWj2
         7Wjaafmuwv5UHFrnmxgKog8wdlv6a8+egLzaaBJGwQrPjnM16LrxSgUHxBql2ozKnPmd
         IlHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AT6ExNFR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z187si2811848ybf.159.2017.11.21.09.31.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Nov 2017 09:31:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AT6ExNFR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35703 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eHCOf-0004OG-S5
	for alex.bennee@linaro.org; Tue, 21 Nov 2017 12:31:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35202)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eHCOZ-0004MC-KB
	for qemu-arm@nongnu.org; Tue, 21 Nov 2017 12:31:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eHCOY-00014k-Oh
	for qemu-arm@nongnu.org; Tue, 21 Nov 2017 12:31:39 -0500
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:38718)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eHCOY-00014K-Kh
	for qemu-arm@nongnu.org; Tue, 21 Nov 2017 12:31:38 -0500
Received: by mail-ot0-x241.google.com with SMTP id b49so11199232otj.5
	for <qemu-arm@nongnu.org>; Tue, 21 Nov 2017 09:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=prCizgG71pwfspmj36pppvgYlYsWelI3MScxaujqTHs=;
	b=AT6ExNFR2oofa1x7WPEsWBfz+7Wri76fHQErb4BmxkYW7vG5uJInBeb9xrVL+NQq+k
	ceMPpANy7+7EnBMVqU37ddYWh1SGC5zhURwfQOXMzRE+XDSGb99OGQSYN+ktqs4KF16i
	uOIzXtPvYv7JNqK9yBtzCdUP70EbGqojMCuiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=prCizgG71pwfspmj36pppvgYlYsWelI3MScxaujqTHs=;
	b=eoOdNU24YweVcwPm8DX0p4J5cnybXjHIBu1Diin2Rc6h1njw4ikwr3Ivos8zWKgM5S
	AVmdE8FWez2vor8rUpeTXjhiPK/o4BPRvMBVliPQFNmue2xsCll1RQK2LujnGevXQHW/
	RTb2GIzipYXYeJI9QoZTcb36MzCYQ8iV3QpmHQqu5ml06/O90VL3Nvx/2ehNpn8kUNun
	VgLerfD11lfzBhWKhVy/4vc0eCH0+k3EgzU61V7Cngu4JyV9jVUA+1nxzkrnzr4230Vb
	gVUP+lF+jRyRJ4Cnd2KbGErArXumhBBqHLlA+9RCK6lovrkviWXzetyj1jswGTH6zKQ6
	tHIQ==
X-Gm-Message-State: AJaThX6QRj70kWRmiTRIH3MgTiosBpcoXB+YH6uoNlHd7l4y39aKmyCm
	D2hCFR+yAuH1sI0IZ7PXBuHCoaszTxmNEvc3ARWVhg==
X-Received: by 10.157.37.173 with SMTP id q42mr10975387ota.116.1511285497899; 
	Tue, 21 Nov 2017 09:31:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Tue, 21 Nov 2017 09:31:17 -0800 (PST)
In-Reply-To: <20171106154813.19936-5-andrew.smirnov@gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
	<20171106154813.19936-5-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Nov 2017 17:31:17 +0000
Message-ID: <CAFEAcA9EhzPxayCGDOiM_6U9YSS6HK1gCgBroR=C1LM=H=FpQw@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-arm] [PATCH v3 04/30] imx_fec: Use ENET_FTRL to determine
 truncation length
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7cARVSPsguU+

On 6 November 2017 at 15:47, Andrey Smirnov <andrew.smirnov@gmail.com> wrot=
e:
> Frame truncation length, TRUNC_FL, is determined by the contents of
> ENET_FTRL register, so convert the code to use it instead of a
> hardcoded constant.
>
> To avoid the case where TRUNC_FL is greater that ENET_MAX_FRAME_SIZE,
> increase the value of the latter to its theoretical maximum of 16K.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  hw/net/imx_fec.c         | 4 ++--
>  include/hw/net/imx_fec.h | 3 ++-
>  2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> index eb034ffd0c..dda0816fb3 100644
> --- a/hw/net/imx_fec.c
> +++ b/hw/net/imx_fec.c
> @@ -1052,8 +1052,8 @@ static ssize_t imx_enet_receive(NetClientState *nc,=
 const uint8_t *buf,
>      crc_ptr =3D (uint8_t *) &crc;
>
>      /* Huge frames are truncted.  */
> -    if (size > ENET_MAX_FRAME_SIZE) {
> -        size =3D ENET_MAX_FRAME_SIZE;
> +    if (size > s->regs[ENET_FTRL]) {
> +        size =3D s->regs[ENET_FTRL];
>          flags |=3D ENET_BD_TR | ENET_BD_LG;
>      }
>
> diff --git a/include/hw/net/imx_fec.h b/include/hw/net/imx_fec.h
> index 4bc8f03ec2..0fcc4f0c71 100644
> --- a/include/hw/net/imx_fec.h
> +++ b/include/hw/net/imx_fec.h
> @@ -86,7 +86,6 @@
>  #define ENET_TCCR3             393
>  #define ENET_MAX               400
>
> -#define ENET_MAX_FRAME_SIZE    2032
>
>  /* EIR and EIMR */
>  #define ENET_INT_HB            (1 << 31)
> @@ -155,6 +154,8 @@
>  #define ENET_RCR_NLC           (1 << 30)
>  #define ENET_RCR_GRS           (1 << 31)
>
> +#define ENET_MAX_FRAME_SIZE    (1 << ENET_RCR_MAX_FL_LENGTH)

This means we now have functions with 16K local array
variables on the stack, which seems like a bad idea.

thanks
-- PMM
