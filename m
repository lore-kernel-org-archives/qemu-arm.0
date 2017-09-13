Received: by 10.223.172.38 with SMTP id v35csp1208526wrc;
        Wed, 13 Sep 2017 08:57:20 -0700 (PDT)
X-Received: by 10.55.217.198 with SMTP id q67mr24777237qkl.153.1505318240458;
        Wed, 13 Sep 2017 08:57:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505318240; cv=none;
        d=google.com; s=arc-20160816;
        b=Lvxh9mmLehEiDN9qYTgQANQFicdcRqZJunNFsQXhQqTHS8AQs2GMG9UBlh820BYTlL
         +Sfo/kxhvHYzzUNSbZogJYmJsLmWjjOryplgijSXTa43Noehzw9Fc8CMUisWyT4YSHK2
         lLnz6rH9Ff/nciJovtwJKzRt/MrF1+e1xajpo4Jq7bmIwvBqfS/KYkxGV641BRIYKdlO
         iP4TZJxRUjrOmY0cnAp64OdDilQek60aKVPo+IOn2PkUVxxA/MLGkNwpIOHUA1uGznUd
         eUlhQyPD/BlomQlRWGy5TwMa58qVNRaxpOkMDYium7O8GXJKU+K1n0ljOazDy/PIzksp
         30aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=q2CGak+2uN5zTezhwVVB45OCwTmZqwPqhF8ZFJ0vfU8=;
        b=e5/glLGB773NMVpuzsfkYcayq7SZjb5Xqx9RUhm42x3CgHE7A4mlypeE1+gP0uOXcQ
         F+PuLBpEs59XrEYKmOkt1yhJVVltvXtB4QtAk31fFyHduanvCTK8Ibi204XJv3gYZ0gZ
         p43jyUD+TdxiOLxQVzeGRFtXGhAfNN4jOUETeniZCEk325Hn9oBhlxIv/BdPm/4M25/V
         sSfoG547te+RdedmwDC+xyGJIhR0dvdNUf2pJeyPOX76AXC9lkIoY8wenqV6wLJbH+O+
         APVMj0g1xuYPm66ObFOzjpY69M+ug3qb45MwcH4t2RoCtkavyj3buB4MW7Q4yMq2FuRt
         6P5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LY1GdjZD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m62si3551534qkh.303.2017.09.13.08.57.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Sep 2017 08:57:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LY1GdjZD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43180 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dsA2Q-0003gK-7y
	for alex.bennee@linaro.org; Wed, 13 Sep 2017 11:57:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dsA2H-0003er-VV
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 11:57:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dsA2E-0001NQ-TE
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 11:57:10 -0400
Received: from mail-pg0-x22a.google.com ([2607:f8b0:400e:c05::22a]:45755)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dsA2E-0001Mz-MT
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 11:57:06 -0400
Received: by mail-pg0-x22a.google.com with SMTP id 188so1163895pgb.2
	for <qemu-arm@nongnu.org>; Wed, 13 Sep 2017 08:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=q2CGak+2uN5zTezhwVVB45OCwTmZqwPqhF8ZFJ0vfU8=;
	b=LY1GdjZDRlTTDH+Jijs/dfFxtu6XxY/nHevZQVy4PUg+9DajxcLta8Xg4VsjPfkcNH
	wvjaxwW3T+Ex2nBaxKH/KBnXmE7VVqp27DkcgnoXAycKWCfdlNd+mt9RLNZI9bHEXgE1
	Md+OC2alyxM/hrArSkonxNxg1XuYoVROYzdFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=q2CGak+2uN5zTezhwVVB45OCwTmZqwPqhF8ZFJ0vfU8=;
	b=Y8Mt2Cf68/9XQ2qHlaZRFzlsD5iNHQoU87uSIlg86ehr1DRPUbEeFyUSs4txt0T0UP
	5kH+Ji8GBNxIJRPOfOvzyTpdWK553feOV4NiTlbEWkdfL6lcSonlo4RhyOKu5VJWzaAk
	2ith8kY+H7sB+omPOFu7en7EC9rIK+6Nzm5Ea5N5YLc3hGWMJ3vY+ijXI17V9D3jSTx7
	WEccEEFCyYJq7/JrNq1yGMPgJXDejfGtD31gE66Zklb7Q3tcAwF8Gi8XS6l6DiCBtDsL
	1P/zNwgo6h1yctWOC1b0DVKnc7mWPX7mftcq32K8NAFo57GEMcebzCNXmzHXNcEw8R7s
	Rgdg==
X-Gm-Message-State: AHPjjUirFlSb4Gm/iaBi8WQZ+EOuRXSletxw4P1fo9AJWq+UmO9swy78
	QrlEfdnXJi1hhS5P
X-Google-Smtp-Source: ADKCNb6uSNNseLLnBVaw3Ecq6hupYR5Y3LNP2+2Kl/hviA/vHXKRB8TpusGbLaRZxYa5X19+9aV4sw==
X-Received: by 10.84.197.69 with SMTP id m63mr20812347pld.226.1505318225747;
	Wed, 13 Sep 2017 08:57:05 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-103-167.tukw.qwest.net.
	[97.126.103.167]) by smtp.gmail.com with ESMTPSA id
	64sm27672801pge.44.2017.09.13.08.57.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Sep 2017 08:57:04 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1505137930-13255-1-git-send-email-peter.maydell@linaro.org>
	<1505137930-13255-4-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6b345da1-e937-cb0f-ab9f-f2ef4ac01da8@linaro.org>
Date: Wed, 13 Sep 2017 08:57:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505137930-13255-4-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22a
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/7] target/arm: Get PRECISERR
 and IBUSERR the right way round
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
X-TUID: uA8vnLi550OD

On 09/11/2017 06:52 AM, Peter Maydell wrote:
> For a bus fault, the M profile BFSR bit PRECISERR means a bus
> fault on a data access, and IBUSERR means a bus fault on an
> instruction access. We had these the wrong way around; fix this.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

