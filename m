Received: by 10.28.71.27 with SMTP id u27csp1393202wma;
        Fri, 9 Feb 2018 13:04:12 -0800 (PST)
X-Google-Smtp-Source: AH8x226twiopwP0mHpZ8BZDMtyxurqZTsdNu4Js5cwj3lukOp9tJZHWZVVt+qpZoUzNf2ij267m+
X-Received: by 10.129.82.195 with SMTP id g186mr2998342ywb.29.1518210252812;
        Fri, 09 Feb 2018 13:04:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518210252; cv=none;
        d=google.com; s=arc-20160816;
        b=PJwF3xo0KVHmt5+KejxAJPCk89k28hxyUz2v+JcDAYCACHXHSQ9vYsI5pBl4rr9g85
         simJ3q3YFFmFciIl69nfM1oR/K2EYI5YimsneAUWNFraf4UmMavA0YqIdwA8r7yAD5T0
         MXG6uc0pWIGv8AE7k2gOhYGtEDscmuH0Ec1/u4FWKm75y8+VATE2Vp7D9ozt97/xzjym
         Pdk00uRFbBSowrH6peAvb1S7iRgzPU+gDsRi3mHiI701V8FB4RnwlK6As/gRMJUnuVhA
         vXekwLsoxRbn4NCGpwADmn96Ri5jEtGaABIMUbdn+0LF66GSeNlYR8mnHEXLu+kO2q/3
         p3Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=H9jdlIbD8k4Okpg7DbuoHVUbadWmnFkMOqM+AMp4Yow=;
        b=Yghxaj3jjcGy34PZT0ewk5+PgfLzkohtw7pmdaHVv3QokHEoCD5Fo1F4uq+h7bWG6P
         RNK8EgIi/hin2/w36vTLW7uXf07WPvjbVHFRUYaCYaEYWR6QboYMx2jewgltr3jyUDjG
         SuZIqTeNEhJwkt/AeyZZju6s8GaDuydMKPZQACnu6vQW8wJsYkfuywlDUWHV/qjfc6ha
         FIA0uYl2qcMuXKoNnTxD9Sb66gAwOOWSAnzClUpgOsgfkJXqqHat8IaFvQ5S25Yz+rqU
         nllzw9GG+SxQ7dnKPGtCd3DKOBepTU68QwMyDZV0/78IP/Fzcr99BXnKBU8fFD1wm6LV
         6SZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=F3vf0EEq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x83si555811ybb.549.2018.02.09.13.04.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 13:04:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=F3vf0EEq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41837 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekFq8-00017Z-AL
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 16:04:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44424)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekFpv-00015R-3E
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 16:03:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekFpr-0001vH-41
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 16:03:59 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:43918)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ekFpq-0001us-Tm
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 16:03:55 -0500
Received: by mail-pg0-x241.google.com with SMTP id f6so4402146pgs.10
	for <qemu-arm@nongnu.org>; Fri, 09 Feb 2018 13:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=H9jdlIbD8k4Okpg7DbuoHVUbadWmnFkMOqM+AMp4Yow=;
	b=F3vf0EEqgKhbOT0FRtK0DuLHholL7r/A7oFmR+JVK+svMaHeByhOwWmdJi0X5MW4jq
	mmNFuO9aejoSPQT1vamYu9PxR57BUcSMYl7fk2fJGpgjKZzpkc+SQ9OrV+ZvaVCkqr9a
	1sIE2XWqj8MFyZ/EebsqMJ6n5aGaluGOtuA5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=H9jdlIbD8k4Okpg7DbuoHVUbadWmnFkMOqM+AMp4Yow=;
	b=mhtw9e1dDvtmsnt+2yyHiseCqeB5ya2JMOOfLW14cWkqhOLNBXPpk2to185W7EnAWa
	1v9G58BKVb9byeSk7zY33DL0Mr82s5iZfLIzcG4VkNQDebe6SBGzTKlCB4tWhbK62u2d
	hrqOIAKBiCMxTGFlDsNFPjkHQVSGHJ8mAoKqxPO7fnrf3ka1fpfZhN5X3HABAYsbu7yq
	gKWU27KMzW6zLR5HUbyFO8IryM/+AHbCS8w/gtbjF0Y3sC/a9ENig7UtEDXen44VFvCh
	Co1m+J8G338lBNbscfIU1eddlo8+R2vXJOZz/cbIZ+KKS0dt5zrah7dY2FH9rzK382u+
	FbGA==
X-Gm-Message-State: APf1xPC5JsKIAXFrzi45AXmv1+07Mfs1XtVP7nsygIObfNrrzWLaH9By
	QD+4mNZXLuENv5kPHKVFa+rdZg==
X-Received: by 10.98.24.80 with SMTP id 77mr4075161pfy.145.1518210233765;
	Fri, 09 Feb 2018 13:03:53 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net.
	[174.21.6.47]) by smtp.gmail.com with ESMTPSA id
	w12sm7747231pfd.86.2018.02.09.13.03.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Feb 2018 13:03:52 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180209165810.6668-1-peter.maydell@linaro.org>
	<20180209165810.6668-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d1ebb592-a60c-4188-56e5-83ce4b90fab8@linaro.org>
Date: Fri, 9 Feb 2018 13:03:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180209165810.6668-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 06/11] hw/intc/armv7m_nvic:
 Implement SCR
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
X-TUID: NCWtuhdbAinH

On 02/09/2018 08:58 AM, Peter Maydell wrote:
> We were previously making the system control register (SCR)
> just RAZ/WI. Although we don't implement the functionality
> this register controls, we should at least provide the state,
> including the banked state for v8M.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h      |  7 +++++++
>  hw/intc/armv7m_nvic.c | 12 ++++++++----
>  target/arm/machine.c  | 12 ++++++++++++
>  3 files changed, 27 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

