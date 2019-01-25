Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp867861wrt;
        Fri, 25 Jan 2019 15:53:20 -0800 (PST)
X-Google-Smtp-Source: ALg8bN50zMGeG52noHrHNKU8+sg+XC99zEgPv75JalK+Z3HS2eU5aNg1O6EfCigZfUsQrM3oY0Bl
X-Received: by 2002:adf:b3c3:: with SMTP id x3mr13326648wrd.294.1548460400565;
        Fri, 25 Jan 2019 15:53:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548460400; cv=none;
        d=google.com; s=arc-20160816;
        b=ay26/RjiIh4kAHkd/FiK9FI0nSfHrqdHcpf6pvipNugGBafoHDy0zsS/uj8VautQdP
         45RIYoEJDXpKJ8lKmUxb+GbrN66M3YTEQ/dbLzdWChws+/apUc1+3fVZSq9tX3rLbzI6
         OIqJhqD1LRcenKzQB9BCKfgnkEYM6UXr5aGlRUB2AaNbTHEYvAsZP+fIypyNbMP6nOVP
         JPBNyM2tMO692gxYcpUcYXeGpKqGkx9dEGtk2JGPtw/ED2b1ZP/BY9FYiOA+J0FPwVTT
         fynmEjOw9yJu8gwsQ4kdPkhDYOTF2HR1+91hgF0MLsbj+bWckUtu9trRd2z3phIxnbM9
         nV7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=5EDzkyLmLqVynrCH0Db0Ep3Gt3NN1HrAYM/JqV/+ynA=;
        b=U1zYFzI00WsQnS9fZ0qqd1uLYASYoDcQwHSZqTh7iHPq7b/VrHAY1YC5C4LL/qjEjm
         R5R+yKYFMMTuIXla3gAtteftRiOOKr5D9c9kC70oN9VPOBBn5KpLzcXbYGS4ilSfTeoS
         SmD14yMK82DTJ6Indo0h/CL3OKWbeDOCxNuQAlPoDfgc2aqLYb4BN6GLMTwEa4mJBShb
         Ya8jjTY8NeiLCzvydTyXU4J/kiGW/IptRFVaKEogC7tsc7vk4yPg6iLS1nqBoxyYgGfZ
         zMRe2KTBWtISqEEk3viqNgi8A+c6y0l+9UYOxLA9Vpu2c6SS+vZ969hbhoi5zXLFaEXQ
         U/Eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c01Tx+vR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t6si75151063wrw.74.2019.01.25.15.53.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Jan 2019 15:53:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c01Tx+vR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:52611 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gnBHj-0002LM-Jn
	for alex.bennee@linaro.org; Fri, 25 Jan 2019 18:53:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48043)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gnBHW-0002JR-41
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 18:53:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gnBHU-0003r7-64
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 18:53:05 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:37666)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gnBHT-0003je-KE
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 18:53:03 -0500
Received: by mail-pf1-x442.google.com with SMTP id y126so5449112pfb.4
	for <qemu-arm@nongnu.org>; Fri, 25 Jan 2019 15:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=5EDzkyLmLqVynrCH0Db0Ep3Gt3NN1HrAYM/JqV/+ynA=;
	b=c01Tx+vRz1OYZbInILerqtt8sgSEQ7dXnQgKrTFgLHCNS7M6BHpsbSoe72kF1NcfR3
	Wo9yNcVq1bKtTwXpKdxglq0sGMcdwC/+6wRHfNoNT++lNz3j2UYFXMnjFKDZgrv4AwdX
	uqJYMOt1Fu8jxpKQODhxsnZbJhSn0Pc3JFAg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=5EDzkyLmLqVynrCH0Db0Ep3Gt3NN1HrAYM/JqV/+ynA=;
	b=QGpPl5XCfIaWAhLp7xgNsnhVeio3kRjkHL3D3w6cd0CV2CiwPY9HmDOyC4tU/wPdWy
	IOqBXKJAzf23PeRFiuDdJ0YpkkjuuOflLz6DVr6XE4Hl8oSgVHps+FhcSUH3GPlKJRCW
	Coq7+87pRk/QSCCjCGtdBFtwS6y+3FQIf+edHkINgp/W/rrVifR5DKUGZyolco5pZ0UG
	n6dIU5ud8tdgLvPdQq4URDu5loSx+NVe2Ej347RgRuyhc+M7zekD/HycCZQ64MF5b8Bs
	HYnaiy749+v+rrm3fg3v2DxO7nosYT5U37HIscMN06qaD7KOABEm/7fQvejQd2tgBM5P
	wEqQ==
X-Gm-Message-State: AJcUukdnqJ1TvGGi4Xt1yHTk3lzOhLFVVpBKwiq0bSes1C3Jvp4dFtYS
	wIRYxVa8pTGgT/NRzxxEtPPzSg==
X-Received: by 2002:a62:d148:: with SMTP id t8mr13279555pfl.52.1548460376870; 
	Fri, 25 Jan 2019 15:52:56 -0800 (PST)
Received: from cloudburst.twiddle.net (97-126-115-157.tukw.qwest.net.
	[97.126.115.157]) by smtp.gmail.com with ESMTPSA id
	o66sm42595893pgo.75.2019.01.25.15.52.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 15:52:55 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190121185118.18550-1-peter.maydell@linaro.org>
	<20190121185118.18550-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <0edb1c50-cb9e-5f0b-2f85-2a3e610a052b@linaro.org>
Date: Fri, 25 Jan 2019 15:52:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190121185118.18550-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 06/23] hw/arm/iotkit: Rename
 'iotkit' local variables and functions
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
X-TUID: EZ0mcgLA56dU

On 1/21/19 10:51 AM, Peter Maydell wrote:
> Rename various internal uses of 'iotkit' in hw/arm/iotkit.c to
> 'armsse', for consistency. The remaining occurences are:
>  * related to the devices TYPE_IOTKIT_SYSCTL, TYPE_IOTKIT_SYSINFO,
>    etc, which this refactor is not touching
>  * references that apply specifically to the IoTKit (like
>    the lack of a private CPU region)
>  * the vmstate, which keeps its old "iotkit" name for
>    migration compatibility reasons
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/iotkit.c | 68 ++++++++++++++++++++++++-------------------------
>  1 file changed, 34 insertions(+), 34 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


