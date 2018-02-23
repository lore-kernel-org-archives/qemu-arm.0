Received: by 10.28.71.27 with SMTP id u27csp787317wma;
        Fri, 23 Feb 2018 08:27:43 -0800 (PST)
X-Google-Smtp-Source: AH8x226KVex5LgSuLJhXgDujQgj7PttvtCUyUWETyIWCSQbDAiTsuLSOZbWZMz9PCRDnv8Ag6x1Y
X-Received: by 10.129.92.69 with SMTP id q66mr1440156ywb.409.1519403263668;
        Fri, 23 Feb 2018 08:27:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519403263; cv=none;
        d=google.com; s=arc-20160816;
        b=Ux/5vwc6ZwszSNE2k55OGpcj7EirgJNNtANtZ+AzcKGHZmRPHFw8t2cq0JoFfZ79DX
         nhM57EThEOCcEW+6meOj6P8UHYrUO4C/v7kGKTCO5a8yD7QpYRjuh1Zp6akopZM4g+WE
         +4szTExucllBsoCkNchYLYOFiePphxOeMOQyWs6yaPY1U+J02rh3yUPSeYsnGjjL51/I
         VYLem6K+CN4smPE5O6EEuM9zJQW4LbIT0aTyMDohGOqUGU/aNd3/KaUkBBtZGeGoLqdZ
         29POyZ2EXwCzcYWKIpbfNyqQogRXibBiu7SEQdgjf+/q58e0pJzn2BcXXEz4ybLpPx6Q
         jNEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=2938H2vFsD5VADaE2c0KKFgbFguRTMGcGS9a3upFQh0=;
        b=O6kW5t/wEmXzzqjHk4HVF0HmS5VK5y+LqARQOfyS5xfvzeB43b1HB/L+/9A4U1JXnI
         2fj8LU70vUjA4dvWjMeg5oZihIPL3Bc3yGUxpXm+McSM/R6jxU6mlxulKdhCTq/K1vMq
         i+AZDwa+WF0wntXJdESAL8wEVkYUK+ign33FWOjT7M4VSOX9f+sgFdrEV88ZaMxn1hKI
         hm1oN+nU0xCWVA7SXV76CtXDBUzvIp1uSaoIFw3jRIVP/83QBLWBVt3uRI9K1wW6NsW3
         ViwVisq8feoBUmcuqKYs50eSNKmll/mstQTPIJnTz7WSevNvU/NdjqXRq1GW8VwkfxSt
         AUgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e4aLCTkl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v189-v6si465880ybe.43.2018.02.23.08.27.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 08:27:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e4aLCTkl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45618 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epGCE-0006T2-VT
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 11:27:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49609)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epFey-0001ex-Qs
	for qemu-devel@nongnu.org; Fri, 23 Feb 2018 10:53:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epFey-0006T9-2b
	for qemu-devel@nongnu.org; Fri, 23 Feb 2018 10:53:20 -0500
Received: from mail-pl0-x22e.google.com ([2607:f8b0:400e:c01::22e]:44969)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1epFex-0006Sf-T7
	for qemu-devel@nongnu.org; Fri, 23 Feb 2018 10:53:20 -0500
Received: by mail-pl0-x22e.google.com with SMTP id w21so5105140plp.11
	for <qemu-devel@nongnu.org>; Fri, 23 Feb 2018 07:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2938H2vFsD5VADaE2c0KKFgbFguRTMGcGS9a3upFQh0=;
	b=e4aLCTklRpLQhKzRpWQEPb0LDpSvGT42D02Nlmwh9T8vOy/9q4Ppj5LsDVDF/T5PSv
	D99S0/IKiH3h1Vk5v/wz2yFJH4z4dVy4BorTNlo/7SRtaHmYUEqWFZZsz4OC7IsDtL1k
	v30ERLYSigu56ACX5AKiyxr49zpL7TXYFYXOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2938H2vFsD5VADaE2c0KKFgbFguRTMGcGS9a3upFQh0=;
	b=ehD13Mfs1N673cjiEVQuuu+tNucMM/01k7Mc/2niRMn+ekeg1khcotTHz02Xm6cd3C
	8lU39Q/5FOPaGG9sxIb7pesc1fEydqtm7Flt4E+12+6EZaMEdp7HvbZlIX2ozZidtNGo
	GdVBw6Rz4eG24XiXJJZxy7D6cEXnhfbAgTU846FIK+V/DfXzMSPQbNRcn8quazuG6eNx
	o5Kaw25QzufXGaVe06yCD0MoBLwQO6JA8tcNrKyhDKnLOd+ed0qwtTIy/UdtNw0n8A5J
	WvWXl75NmaNCmGyajf62r/9w/c2ksCi+oLl8+/K0DvrnpSko82qcQDHSkDIjStwJPVJI
	J7EA==
X-Gm-Message-State: APf1xPCt0Av1XvwVzGfAoxCgilfijx3g4CVoe88ZBQWN10TCyT2v9en8
	wCS2X/H9G3asnfH4WiLoRYrV2ypmrAlUlIBHj9y5Vg==
X-Received: by 2002:a17:902:bc41:: with SMTP id
	t1-v6mr2166234plz.436.1519401198626; 
	Fri, 23 Feb 2018 07:53:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 07:52:58 -0800 (PST)
In-Reply-To: <20180217182323.25885-35-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-35-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 15:52:58 +0000
Message-ID: <CAFEAcA8MSeNMuUNdG2HkLkd-08QYCeFSWNcxtd67pGRrN00_ng@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::22e
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v2 34/67] target/arm: Implement
 SVE vector splice (predicated)
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FWaB0slKxjbw

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  2 ++
>  target/arm/sve_helper.c    | 37 +++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 10 ++++++++++
>  target/arm/sve.decode      |  3 +++
>  4 files changed, 52 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
