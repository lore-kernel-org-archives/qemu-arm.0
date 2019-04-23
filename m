Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3939646wrx;
        Tue, 23 Apr 2019 14:34:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxOC4CLpJiYr+qdLD1Qcip1MLhOE4wzI7V45OQkJiLy5OhazJ5u6h0J4wPe5sRH13GBdjDD
X-Received: by 2002:a1c:b189:: with SMTP id a131mr3826838wmf.107.1556055260638;
        Tue, 23 Apr 2019 14:34:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556055260; cv=none;
        d=google.com; s=arc-20160816;
        b=ItWMoxP/LdqJKh2OLjTpyicPx44BJ6TV/lYQpncuLaH/50Jm2MVQtw37TTJgsywJ53
         gqSqliWEr35Vs1wc/TLB3d0hMTDFWS6c1C/SmyIT+4B82kZaA5sLkqLU16wjaFqyz0DF
         T+R13NXV2890whHzY2ufdsa/RBFU6rq1rddP/N53qbywAHTHa+S1xxx+lDp9XTPpybxa
         JFat3JSqgLSEuS7aL2IvJiFFIv4Dheqp7tUNIJ/sHgsHymWjvEouFjaQ6GXNin+YyLnz
         TfOLboXxcQugFPRf9tu55wbrIqZelfNOBBbYYKJC59hoKO28cplTd6iAw5fnO5E84UnG
         SwvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=VX94Em9/JxFBkaq9XXZQsOYSdZa/PqJ0ofPP+jlzHtI=;
        b=h5VS8TTeDzokUIgSmsdsBzeE0yfQoCaX0XNf0wAUKcXebPUSWTt4BdYtoYBhGG+aRG
         dcq3nDOhQAydDWpkbtWDB/Tchd7PVQwYyXSb8JfVucOC8RyBNA/8GnzQGp854CRN4YhS
         Qas++Mn3RVS1FIJ7WNT7GOALhA1uXxaJPLTPj9vLtNeDI5hb4n4v2AllTRLhZ21iHpKQ
         5K34IiiOSw4un06Yhd2ysW6eTvuD0g9SHoOPL+oVPGwEha+MzdGFtHvqX2nCw8SM0yYN
         jX0jvk6m0MQBjvKbqDTMZwWn/K4BZbEiwMUB89PowWDOgW+X1K2Mu4jSbpnHEJaNkJ/o
         hIyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RpQmfOyR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i206si11651846wmi.133.2019.04.23.14.34.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Apr 2019 14:34:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RpQmfOyR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:59796 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJ33T-0001iU-Oz
	for alex.bennee@linaro.org; Tue, 23 Apr 2019 17:34:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54782)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJ33J-0001iC-AP
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 17:34:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJ33I-00014A-74
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 17:34:09 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:37078)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hJ33G-0000tR-4T
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 17:34:08 -0400
Received: by mail-pl1-x642.google.com with SMTP id w23so8162045ply.4
	for <qemu-arm@nongnu.org>; Tue, 23 Apr 2019 14:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=VX94Em9/JxFBkaq9XXZQsOYSdZa/PqJ0ofPP+jlzHtI=;
	b=RpQmfOyR2qpbUEpwd48Ga3cwTP0L2E3HzDpVQgfLIi3ocCZJpScG6wdoslFnDQM65O
	LMO5NSVqRIw7pfy3IQVebJ1AtXVBwuogMRea3OYBh7netYHkVCtJO2Bfx/qaSWj4ACBg
	AXqM7O77/WUAAPaQbUziMNPjJ9+zdjpjVK+DazD7G9wlUTuuMo5X1B+kLKGJa8nTm1hQ
	HjKS1ND5TGJNhzdOz4kBk9c69MwkDzWuD33kiEn7+ajbMF7mLy4vcGsSFTNXvo3E29+p
	CD1xJYxTO+b4k2nR9QhBSNVq7uD/9RZ0s2z9hNhRoeXY9ug9bmaEhTc5t3zW3jtV80T+
	YNSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=VX94Em9/JxFBkaq9XXZQsOYSdZa/PqJ0ofPP+jlzHtI=;
	b=p4gHmAvsIunUneSIv7A2j8mkwJ1p3mVCH8F64bRBHs+K7kBwanron5ipKD71ZssRUb
	0DXPk3wpSRzzGqbfDn8fVzkVbJAR1pucbJ0rUEdWp2DQkeSHsWDypc62nHXecwzacWcM
	5BE76/nnoznnuIX8Cwx9vPax1OPGXvBLd3vgp8Xgyzz86rQAUkgyEV2RGRF3tpyv12P3
	P0sx2tcxipnxoc5YOiT2Uy6LYxWiMvYb8W5jqoWGXWFIt/9ya6LKFCOvoCDwNp4soAXA
	1FsuG50JsybOqA10Y1RtVhtwoY08/awE6oOTVWkDTLqIW3ZAWc9sTrsZPm1Vjc1j1TrW
	E5NQ==
X-Gm-Message-State: APjAAAWgQ8jzojsCJLWY6jVuuKsCkEu5J21xhHkeS39bark6RSh1eYLN
	gq0vrM0EjXdCDetuJagcl+149w==
X-Received: by 2002:a17:902:9693:: with SMTP id
	n19mr20079521plp.92.1556055233041; 
	Tue, 23 Apr 2019 14:33:53 -0700 (PDT)
Received: from [192.168.1.11] (97-113-179-147.tukw.qwest.net. [97.113.179.147])
	by smtp.gmail.com with ESMTPSA id
	o89sm28442078pfi.178.2019.04.23.14.33.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 14:33:52 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190416125744.27770-1-peter.maydell@linaro.org>
	<20190416125744.27770-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <5729634a-fc95-a6bb-cb97-3daa3daeba37@linaro.org>
Date: Tue, 23 Apr 2019 14:33:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190416125744.27770-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 08/26] target/arm: Handle SFPA
 and FPCA bits in reads and writes of CONTROL
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YYz2J6aPk1kC

On 4/16/19 5:57 AM, Peter Maydell wrote:
> The M-profile CONTROL register has two bits -- SFPA and FPCA --
> which relate to floating-point support, and should be RES0 otherwise.
> Handle them correctly in the MSR/MRS register access code.
> Neither is banked between security states, so they are stored
> in v7m.control[M_REG_S] regardless of current security state.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 57 ++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 49 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

