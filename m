Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp878156wrt;
        Fri, 25 Jan 2019 16:07:02 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4nOEoE5Ty1qVpH5GXCxY8lqQRTEkviumgC/Lab1+B4fuWqnQiq6s+otbYn68io0uJZ+m1t
X-Received: by 2002:a1c:9a0d:: with SMTP id c13mr8838621wme.41.1548461222788;
        Fri, 25 Jan 2019 16:07:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548461222; cv=none;
        d=google.com; s=arc-20160816;
        b=0gWBwUDkOPjQniuoKFiMrg2x510REA0NWAaggixUuk7RtAk0wvA4iV8BU2a2VtLUWa
         eCpdmtnGwIYWaurKaO2gpoeRTMFRezpFNCH44+Z8rXHt6ftzq0CRs0p4cEV6+i/xNf97
         CfBzJbYcob3vPSR8ipUOU8G8n+XTQouWl59VJx9jAUtYSSEBr2uRtwP86X3IEFdUv9or
         fyMd7wtNrP0ntdjASW8uZMJRgdlklZDEkMr1KO98yyPRhhcPS0mPd0aOMp1UehjBCD0k
         Arx9icdYE1Z6Z93HBKVY3GBQRo09Ncj9hSNwJ4ObwdyTw+JwZ8vYZnGDV2yyy1oY0gzz
         aeSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=YAGi3v/z7RlDvPxpkeqqvIuNV4XcQaIDF5s25Nwj3nk=;
        b=XSog/aeMjKKwhQs7jbVmptJAp0QidVST2A2bOuDRuysbVhT8u6ARXQ/ETXcMK5tOzq
         OgLnqoqjWYddqWcf1DlFUEx/xWS1KnpYTBXxki9jHl+sTTQLKGdIDt8vCpxLrx0QAREO
         FXiBLekoXvzEKlJLMEjge6qTuDxID95mbIT/b7kv7rFxteABKvlp1UVrZtNOWl/hOX3Z
         JnP7CX6ymLLRjfeZqf/NGO9jBliJS9z7h7Ej83v+jh0Xqy9Lta8gO5u0N+3QTwLJu/8J
         rZ/4dfrBTIalWxB7HQKs0UwERhuktxQPmd8CPbWxRjhazvgOxjgo9ZM/Ilyr228oTybr
         aoAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=POq7MG2U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q14si40204604wmj.196.2019.01.25.16.07.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Jan 2019 16:07:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=POq7MG2U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:52764 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gnBUz-0006kY-TE
	for alex.bennee@linaro.org; Fri, 25 Jan 2019 19:07:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35942)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gnBUs-0006kN-Kx
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 19:06:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gnBUm-00058h-TE
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 19:06:52 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:36058)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gnBUl-00054i-J1
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 19:06:48 -0500
Received: by mail-pg1-x52d.google.com with SMTP id n2so4850619pgm.3
	for <qemu-arm@nongnu.org>; Fri, 25 Jan 2019 16:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=YAGi3v/z7RlDvPxpkeqqvIuNV4XcQaIDF5s25Nwj3nk=;
	b=POq7MG2UOI99Mx1LzlNXrzyca1qq3nX62LSWBneIuXvOvxf26hbFjh5qIQEv/ontCC
	yL4hMf/HCUGRUQP28EFStmNPHKZLnttUoZjlOjKDIekw/frkolQYgL3KlLbxHsBFSqmE
	AskkK0vzRSMKjBsEOJd4JbgxR8kANrBAn+aU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=YAGi3v/z7RlDvPxpkeqqvIuNV4XcQaIDF5s25Nwj3nk=;
	b=LNRmz14KPHEoFRraKuDI3E50tTbruLL/vnCND8HM79kR0DvGdn2hQqw82hdtlp/3Vk
	IPqF9fEZdG2hL/sCNaxJRPO0DzIoQ45D4pYKXiYzYDqI+qmLFxqjrYwyhyA8jcwL9pcY
	BdIUg9nKY/bGXZlI1b2TI3JE9zSylU4Q49WKHieWXSfnIO/kLfRpjkmZfksSdpa8agIp
	B1N47kXwR8YEcWVFK40YHx1duGcDpUrV+BWOfEnWpuU5AkGGvahX1qer8Xk4qyT4WLJR
	dwlIUIVJsY2QqErfFR4T71zx9HksYnOeuXp9/j0TeBV22ALqXXxhjWvNCcZgnJuCm5fd
	AxuA==
X-Gm-Message-State: AJcUukdEp0I+W5zfXabgtK57d2+F9aNW1vaxdM2ZQ2xhWYAXrntoty9Z
	r5nCT4krohkr0EMukPbUeauP6g==
X-Received: by 2002:a62:2082:: with SMTP id m2mr12690295pfj.163.1548461205795; 
	Fri, 25 Jan 2019 16:06:45 -0800 (PST)
Received: from cloudburst.twiddle.net (97-126-115-157.tukw.qwest.net.
	[97.126.115.157]) by smtp.gmail.com with ESMTPSA id
	p2sm32629945pfb.28.2019.01.25.16.06.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 16:06:45 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190121185118.18550-1-peter.maydell@linaro.org>
	<20190121185118.18550-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <f0cd3160-ec07-dd74-5975-8a84f855cef6@linaro.org>
Date: Fri, 25 Jan 2019 16:06:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190121185118.18550-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::52d
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 09/23] hw/arm/armsse: Make
 number of SRAM banks parameterised
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Tx6wmFw38hP4

On 1/21/19 10:51 AM, Peter Maydell wrote:
> The SSE-200 has four banks of SRAM, each with its own
> Memory Protection Controller, where the IoTKit has only one.
> Make the number of SRAM banks a field in ARMSSEInfo.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/armsse.h |  9 +++--
>  hw/arm/armsse.c         | 78 ++++++++++++++++++++++++++---------------
>  2 files changed, 56 insertions(+), 31 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
