Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1453648wrd;
        Thu, 23 Aug 2018 11:05:41 -0700 (PDT)
X-Google-Smtp-Source: ANB0Vda6toaOSd6MXjXPiWPF34a1urUGlDLj0NTuZ8uX2VlASCQU5qoFre3UYo88DtDshl92i/LP
X-Received: by 2002:ac8:2488:: with SMTP id s8-v6mr5613514qts.87.1535047541622;
        Thu, 23 Aug 2018 11:05:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535047541; cv=none;
        d=google.com; s=arc-20160816;
        b=gqtgXa8rARZhsQSemt/fpejVLYFIBpNrODeMQEmPVNPDniqXbeP6Cg+4irQWt6HTJL
         PPwctqCNTD7paROUIeaZOevDLHeubdOhqBT94zBFk6QbNzEJkqkw72211vexmBU8FH5c
         KiuxlR+eW2+wgkwyUnwkPMtwfQ81fwDz3ud7FPEd4zaC96n7QNmsWys9l4WrxeIIMSbo
         bZtKAZk8CJxDB5oC2BY95+bu8cnS8ViHsi+jG9HuwEZD6U8o4oaBt1JP1Hk+X/Dgc0p6
         ZP3/zXgT99IfobIYrl5CTIrsk+FH4+/CbHcu1bEpbp0PXhLsfObhy1ai5lbRDhZUXCVX
         w1Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=oJ0hyIh6k4sU0pd1ei3oD3bukKdu2awcXg82JQWgTw8=;
        b=xSAfJvhjPsEvQcj/JXe0D9Ywru3zHl2Z7ALEpymhvYjyBV+/VAN6hrZZ5uCfsFNq/J
         vb9dcpYlNnBOWGFXpL6k2Jma9shK5AKshg2NSEVtaBe6LqaSIpFd68DHfDkZXtSxxBch
         S8AK/oqfeK4UCvL9/XYOoWo747rLtDnGee8Lh4AoTIU4PCQByQcESS/7lJ37UotPjbUW
         6oJiBR8kiSMsyvrzJHG0YvKtbPY6RoVFrGj36psTH9D7y1IjlFYn8TfxxMpdZGSv0SNr
         ZCWCM6K6vsN7Yd6O68IDns/6UnwuIt9jn5Qx6gJeet3AMbz2VZyumaabjB2NGc1aXIHl
         F4Vw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cF0LphFN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o2-v6si4768585qvq.257.2018.08.23.11.05.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Aug 2018 11:05:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cF0LphFN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38251 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fstzJ-0000Qd-55
	for alex.bennee@linaro.org; Thu, 23 Aug 2018 14:05:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56154)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fstaU-0007ma-Jn
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 13:40:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fstaP-0001w5-BG
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 13:40:02 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:40418)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fstaO-0001un-T5
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 13:39:57 -0400
Received: by mail-pf1-x444.google.com with SMTP id s13-v6so2994989pfi.7
	for <qemu-arm@nongnu.org>; Thu, 23 Aug 2018 10:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=oJ0hyIh6k4sU0pd1ei3oD3bukKdu2awcXg82JQWgTw8=;
	b=cF0LphFNq9SWhDRawGjZBIze+FRwL3tZXCecJ6AnuWwyxl3EdiYb/GHC06RzApnPeJ
	w6zs+DyTrEg0oq2sLuSfiP0l9Zz6dgDBB7KQnjo0927P6pQ7FcFd6+yoBtSrjWHA0opi
	PZoSRCQz+k5ZNoF/K0WOIfh/Z5ydhsUFChmv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=oJ0hyIh6k4sU0pd1ei3oD3bukKdu2awcXg82JQWgTw8=;
	b=SmmdgNp/behH2ll/k15sBNhpaOLwK/6yT2MTl1pmegDGxD9fT3chWrkbvtP0NwJxZz
	JPd4GggJhMHooTwKjFRKGXua64W8cor6+bsXe0+EsEBabmwgmxgS9fKILFxbolIl06gE
	5abh5dx1kCIimL1Cl5lzoLsY/K7Kd1PE1slxiGAAAjuYAeyBeuWWY/udsbJBR/1LGex/
	iZrzSva6LniUPP+wHXFQv9RpNyarKIOYPB4Nvy0MniJ7rguUlaFlCvByM8pL/U4PhqHH
	bC0t3IiuEEDkx/+Z9B2+Ywjx3E9poH+zaD1nzu1xwItR+2NLAh7CGHM2T3lcM5PQqBDm
	sqDg==
X-Gm-Message-State: AOUpUlHkIhXZ6gmXF/L9mksDTTR4Zb72LhmbMP/bAkrnZtXsTzLSJq5z
	8H/Mn5ktjEhXMqmuaW9frr7l+g==
X-Received: by 2002:a65:6143:: with SMTP id
	o3-v6mr27713441pgv.52.1535045995913; 
	Thu, 23 Aug 2018 10:39:55 -0700 (PDT)
Received: from cloudburst.twiddle.net ([50.225.49.40])
	by smtp.gmail.com with ESMTPSA id
	s85-v6sm7906843pfa.116.2018.08.23.10.39.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 10:39:54 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180820141116.9118-1-peter.maydell@linaro.org>
	<20180820141116.9118-22-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <fa98dccc-7dbe-f57b-7c9f-eab2d452ff28@linaro.org>
Date: Thu, 23 Aug 2018 10:39:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180820141116.9118-22-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 21/22] hw/arm/mps2-tz:
 Instantiate SPI controllers
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
X-TUID: tKHMcGfbQxiV

On 08/20/2018 07:11 AM, Peter Maydell wrote:
> The SPI controllers in the MPS2 AN505 board are PL022s.
> We have a model of the PL022, so create these devices.
> 
> We don't currently model the LCD controller that sits behind
> one of the PL022s; the others are intended to control devices
> that sit on the FPGA's general purpose SPI connector or
> "shield" expansion connectors.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/mps2-tz.c | 38 ++++++++++++++++++++++++++++++++------
>  1 file changed, 32 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

