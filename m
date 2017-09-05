Received: by 10.223.172.38 with SMTP id v35csp1966229wrc;
        Tue, 5 Sep 2017 15:52:42 -0700 (PDT)
X-Received: by 10.200.10.1 with SMTP id b1mr1014827qti.118.1504651962813;
        Tue, 05 Sep 2017 15:52:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504651962; cv=none;
        d=google.com; s=arc-20160816;
        b=EqYVBZpNcR2y1Qw2T4M6cX27kROlPuamyUY5HtNC2yXXM8KqRKfgcs3/qq/PnemBnl
         WdKdCKGTYXhBb5nxNtqagjl5ZWXldjsbBEQddjweV8SN45L7aC4SLixPVLjXF1obDeuO
         gTqRrfvOQiDWLeyU+es6+b36/PKfaCrflyRxifpdHRBW9kSqlcOJI1PaVNfFQk4KxfVy
         dDyKJXCkiN2ZkTuChpGz6BapvlBX86H/OrTCmatO2rMNMF9Q2oB/HKN1h/mG8bQJAES+
         ZB56gnVXa2gcNahVzXG6Yei3wJGujBTqKSh1PUOxD/rCIg3Bf+ZpmY9BpquqsksgbM0p
         OHYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=po7ruVQCbjzGRThrMbrm7veX4xtufIqLB6l0HAxe9Nk=;
        b=oO/riTyzULxg38SfjZMMpXovEpdsR8vYKYauxRPtfPGoJwnWN94jDBZho6ZsVdkq+i
         lpRXx3NMDHuc7JpQVLzQCHJEAiifrgkT/mfVqYCrTQlJ+fzx1+7lf2YaDdyTWK+qp+EW
         xrAJ1MvZChPiUgXc6vi3dZHBKlY7svmQ/kiqzA2vobbq3vXlMiGh5CBLBpsHtVxAHLKz
         z0uvj5gv19xeJALvCl/TC5hhUjaUt6pokYoyXuiBoz0hx1TgjWQiUFQWGY4l6eYHzXho
         aNS/xOWlChL66QI+Cg/1c65JU5OlX7kOh+g2OYGK1Yfral7QRdTNNGKJFfwWiqTRVLrR
         acjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YNz4wueF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m38si1479112qtc.151.2017.09.05.15.52.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 15:52:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YNz4wueF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33443 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpMi0-0001Vd-Pp
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 18:52:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpMgz-0000yc-Po
	for qemu-devel@nongnu.org; Tue, 05 Sep 2017 18:51:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpMgv-0003lB-BL
	for qemu-devel@nongnu.org; Tue, 05 Sep 2017 18:51:37 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:34745)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpMgv-0003kI-6l; Tue, 05 Sep 2017 18:51:33 -0400
Received: by mail-qk0-x242.google.com with SMTP id d70so2982150qkc.1;
	Tue, 05 Sep 2017 15:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=po7ruVQCbjzGRThrMbrm7veX4xtufIqLB6l0HAxe9Nk=;
	b=YNz4wueFp9ADkkUPXZfE4W2vkafB55onLk4xjPW2CJXGUUFmpdOOnret4cI6V2wD1H
	nOhtWIPklGqKU3k++f0f2E7Q/HxmOotViQlKShPH04EqX5O7okfo9QQDxm7i9neyIioW
	fE+FThpN0LMJsqjDxAKaJMWYKRbUcOhzsAcqR6FVzZbuMxOZezVJpGXDECsjmVARSbCY
	JCQgz4lBIZgxOOCU4D907bP39H6dP+D5fxmqO8hJgf6Klh5yI7b18vQf+Xks5Cj+2F7y
	R4xLBg5TujLU1jPxj1SgDjuIB16Lb4uBCuOtp24SfdCk8vZEP3GJ3eK5nIBEJMOILuKt
	JECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=po7ruVQCbjzGRThrMbrm7veX4xtufIqLB6l0HAxe9Nk=;
	b=NI7IcpRahO5CWvAxkcFnpQLHY93Tt9vpUglp9IT0gtvSywBkXZtzjCrdPqCUxHN6Ml
	7JcrIACGpu+c6zFHtImlQcC5UHBQ23n/QTA8x2084D6OIyiIvWTXQT5lmAfGIH/YuCsY
	6mBiq0p3HBzAaS1ScuzmkSBl/8JBPZC3fYIXk55n/XeRVFMgtdYlzIimM27xHA0KN1Jw
	QJA8X+6WBXggNeO2+/sHoIErZqP+Sqi0C2JkL4tc7Jwi1d2h/8DvrhiIMSr1gn99MRJq
	bv2D773Rthj6kbc+p5PhZhpLOPVaQuqLjGOkl9a0H1ABuDBmqYV82luffPIr9R4fVExE
	ct3w==
X-Gm-Message-State: AHPjjUjrwuHRyIKUVR2ZJ0pMVntfeFvac/fJJZz5QEZlm3Z+z73/SAVx
	FGJOkI6BxqDkQw==
X-Google-Smtp-Source: AOwi7QDEtfBSUlkLsqZBoh/Tb9PG0rEE24ADL6eKflMKj+Nv/NfnpdHyKGgLRtZOUUGoDUf8FYbrBQ==
X-Received: by 10.55.15.41 with SMTP id z41mr874470qkg.134.1504651892581;
	Tue, 05 Sep 2017 15:51:32 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	x92sm1157184qte.20.2017.09.05.15.51.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Sep 2017 15:51:31 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
	<1503414539-28762-20-git-send-email-peter.maydell@linaro.org>
	<eb01a522-9cd5-070b-018a-8f0087d3a843@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <543fa529-6b85-0157-71b6-b8bdd58e03dd@amsat.org>
Date: Tue, 5 Sep 2017 19:51:29 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <eb01a522-9cd5-070b-018a-8f0087d3a843@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 19/20] target/arm: Move
 regime_is_secure() to target/arm/internals.h
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
Cc: Richard Henderson <richard.henderson@linaro.org>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QRtQLyybbr4V

On 08/29/2017 01:12 PM, Richard Henderson wrote:
> On 08/22/2017 08:08 AM, Peter Maydell wrote:
>> Move the regime_is_secure() utility function to internals.h;
>> we are going to want to call it from translate.c.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>   target/arm/internals.h | 26 ++++++++++++++++++++++++++
>>   target/arm/helper.c    | 26 --------------------------
>>   2 files changed, 26 insertions(+), 26 deletions(-)
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
