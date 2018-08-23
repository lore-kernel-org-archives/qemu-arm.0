Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1242073wrd;
        Thu, 23 Aug 2018 07:31:13 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPyPYmxDcwI3U9WbvUu/N12Vvoq9uzgc9Yf44b2ROsF9h2eshrdgnxkPx1izSkFYABWmnAwT
X-Received: by 2002:aed:3282:: with SMTP id z2-v6mr19463452qtd.112.1535034673784;
        Thu, 23 Aug 2018 07:31:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535034673; cv=none;
        d=google.com; s=arc-20160816;
        b=U6rEQn50eNxLTeJxhrF7XYShB72iZnFubB8tdV8IYu6Muml5UEk8v6noFEZV9baOoE
         YP9ZxFcd8JBKEZBqUPiIIrfUiH+MkuOIutkJd9B9jROLpxGcUveN8v7CspU/0Pn2frea
         DqqSPboYT894hK35D1g1BBnEuwGwru+5xKyDzAD56ygCSXfiK7vNfztHWYq1ObWp+MQG
         64xjU7fxMea00tCP+YXMNtcxypZCOMCaPR6gvy5q8xTN5ck9Q8SDdyKso2rpxRhFgc7F
         oQuFvTHQE/nr7he1EycufW8A4DZnxjrRpe27+OvCNoOk/241yZazvRscyI8JbfYKt3k2
         oW2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=SCl0X0iRdIoA/uCQ+RzZtGC0/EPV17HLOUloYFcg20w=;
        b=eVXc7lq8lD93984KU4HUMSLXio8liTBXIqg7T75z7vMIcHZ0DzDNKSdJD+8vyW+nhr
         /JpVW3M00FHz/mak4DUI/0c/yzYoQ2oNQ0vsqzzfm+5XFCHPLQgqZwp3t+I8XcrxvhHN
         Z45umAFcyck0jc2GUKL+A1sAJWnOAw1uDFdJEn+NpXOwLZQ4cq96M0Prh3aA0V0mb7zw
         J6BglGiJBZKRBNldcp5VQW7aZh+hfjp/2+DFvZoWZmOXg+dDQADdnflj8qjIgcaqB9hz
         djOOuwVrrtSGRZD0op4DXp40WVSbbmXRJwPK8Vn7Jw63WAHV6zYBoFm8CW643sl50M8G
         rBqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VXXxW3qc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 205-v6si4603240qkd.241.2018.08.23.07.31.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Aug 2018 07:31:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VXXxW3qc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36859 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fsqdl-0000QC-97
	for alex.bennee@linaro.org; Thu, 23 Aug 2018 10:31:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57310)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fsqJD-0004GG-1b
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 10:10:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fsqJA-0007u6-CC
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 10:09:58 -0400
Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244]:46477)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fsqJA-0007to-3N
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 10:09:56 -0400
Received: by mail-pl0-x244.google.com with SMTP id a4-v6so2449434plm.13
	for <qemu-arm@nongnu.org>; Thu, 23 Aug 2018 07:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=SCl0X0iRdIoA/uCQ+RzZtGC0/EPV17HLOUloYFcg20w=;
	b=VXXxW3qcPfWsM55leqJ7Xy/D+QUmBiSwBBaWhu6vvz+h9qFM9+R1VEvUfjNM0SRcJF
	9IUSAFITw80CtyUI9Z/Gli0NW+oYrLvQ0M9Pnw8aT6gWq7+QTsPvQTxv8n5sISeMn60X
	C5Ejc0Fnp3sPG2Zgd/KBzWY5QG0anjK8TMD+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=SCl0X0iRdIoA/uCQ+RzZtGC0/EPV17HLOUloYFcg20w=;
	b=K0J3KHB+i2TgRy24Rqiawpdge2bH5jIwID0b8yAbTAQYspgKzRf/wrVV40iTs+fPuV
	xolIcUvoq3AORB5zVwwsMwO2IA0IGBDvpj8WBwCMYx96A2muUtHYJ34PLpswjvr9u5Hb
	WbLoGuRXSVRkdK9ofAEeeqSeIEEhNRAe3sxDK9tOY99FNPx/TqlWF4/y3zg69Y+moH9m
	CZb35lnhMqXIlNEEUHDyxxQtkt1kwpYmO7GwEgZ0XFgcwS8L7Oz8c2WjYH17ngFIQbyT
	rHBkJfxHp06NNcPvXWok9mxC5zTQb4uFb2MBI2evne53QHoptyYjQKs3fc2DT7jq/fTP
	tIOA==
X-Gm-Message-State: AOUpUlEgk88p6OuXIs1nqXP1aEJCjnHRW8RfkCRFVQxy8J+YR3VL+sCH
	v0oB0Zr9AvYZhdwU6l0LC3V86A==
X-Received: by 2002:a17:902:b58b:: with SMTP id
	a11-v6mr58297248pls.34.1535033395225; 
	Thu, 23 Aug 2018 07:09:55 -0700 (PDT)
Received: from cloudburst.twiddle.net ([50.225.49.40])
	by smtp.gmail.com with ESMTPSA id
	h4-v6sm10802395pfe.49.2018.08.23.07.09.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 07:09:54 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180820141116.9118-1-peter.maydell@linaro.org>
	<20180820141116.9118-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <13e5b093-88b4-3c7d-9353-eb29f54db259@linaro.org>
Date: Thu, 23 Aug 2018 07:09:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180820141116.9118-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 04/22] hw/arm/iotkit: Wire up
 the dualtimer
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UANvIrr0F1qC

On 08/20/2018 07:10 AM, Peter Maydell wrote:
> Now we have a model of the CMSDK dual timer, we can wire it
> up in the IoTKit.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/iotkit.h | 3 ++-
>  hw/arm/iotkit.c         | 8 +++++---
>  2 files changed, 7 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

