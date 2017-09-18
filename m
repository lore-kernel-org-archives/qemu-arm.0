Received: by 10.223.172.38 with SMTP id v35csp3252519wrc;
        Sun, 17 Sep 2017 18:10:22 -0700 (PDT)
X-Received: by 10.55.18.137 with SMTP id 9mr18115081qks.208.1505697022881;
        Sun, 17 Sep 2017 18:10:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505697022; cv=none;
        d=google.com; s=arc-20160816;
        b=hgse2L7oJFFPSJwikUR4BEp5VazTIwc1PIlTdFhEIeQvEbIo7wSrqhgaFWTjmi943R
         lQIglVXDs5NmgiE/i3RTsK5lEMD7tKTmMH+bnlNMVVf4t7Z6Qu59gJy4W5TYi4aQVP2d
         XZ8qtVhiq+7bpKoRvL/ty1EfGabVXzdP7XYD4OxdjUvTOhyQljaKlYDpX3PZqTBx0BBH
         7rAaS2SH8DiSOtbNnvfMwBm4uD16gCb5fx9/0aDX96N8iTSGFJiJEFrmZcy9iZrtUmgZ
         eeajy0Oh5KPXKekAeZeXg8Z0MifdsLFX5mFb+Xaw6llK+ddtjDhQhquOtjYV4YF13tGx
         KgJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=aqz0O2IOoW873SRlOCV7J8egSZB0oRLu/tL9d3DMMMw=;
        b=j/cjTMlGqaOaFWd5vAy+FU0+gST24R3v2Lab1BqLJOHjCgb/iBnRPGy59/iWq0mLW9
         LBqeEAUun9qZC7yWu6ZZp6UpqoSMqG4S6JqfgoxPda1TL1kuJocf6rMJ2iXkmHEJ+P9r
         jgGXOovQjX9/rcSaKCy+2MD4sgFL8I4ndZpviURhMnmAK16fDxDlFw1nHeQCJ8L8cqJ9
         z9o/xqmPwmBVOert9vY87/fsKUgHBfpNNn/Exd5IgwtRxUxPM7jfnzyDTxVlB7YZF1w6
         KMzMvJkwVggwHOePdk9Deu7OD/KqJOrB2ubfEyzRdOJ0MYCrT59bOGR9gRoIOE9TfPci
         gmEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tMaK2UWG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o4si5946942qte.343.2017.09.17.18.10.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Sep 2017 18:10:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tMaK2UWG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34183 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dtkZo-0004Zd-Jo
	for alex.bennee@linaro.org; Sun, 17 Sep 2017 21:10:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34074)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dtkZb-0004T8-6z
	for qemu-arm@nongnu.org; Sun, 17 Sep 2017 21:10:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dtkZW-0002Sf-MP
	for qemu-arm@nongnu.org; Sun, 17 Sep 2017 21:10:07 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:35157)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dtkZW-0002SX-Hu; Sun, 17 Sep 2017 21:10:02 -0400
Received: by mail-qk0-x242.google.com with SMTP id o77so4659133qke.2;
	Sun, 17 Sep 2017 18:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=aqz0O2IOoW873SRlOCV7J8egSZB0oRLu/tL9d3DMMMw=;
	b=tMaK2UWGfucxDiVbCOu4V3H0ozMGGshOgb09G+UsFJEIFWTKTDs5QT25TPNxYLWcCf
	A+X7U2wZJ20Vf77J3LmofCojhqhd75RThlp+O2oI+Pg9Q6T08594UcwGIPgJC8itC5vl
	CcZmo5jyNbpwUtLpNy0QcTkAB9L9kDeVpb65uuOhnHDq5DW/Yvwy7XTMc3iwkmIyAMjT
	Cp3LE+LFs3ASaF3GqxUN/GIjDHx01fJWRVL6HRCOlpo4odmFpwNJKqJXzS5wyzgPTlX2
	b/DwjeLfnOQnoIL1gqJKSgmDf1mVOtLHAY2xlHfUjTvzUfMd+TD/Nlp+v/rhm0uIjLl9
	fUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=aqz0O2IOoW873SRlOCV7J8egSZB0oRLu/tL9d3DMMMw=;
	b=ZkwdfjPtUPvSGRQBoTh1RE8Ls7Mhtd5nReZD1P2J2e5Kc4Tt4B3aN5ksNmgvjYJpX/
	/7WeLI+bQfg82IVsdbjAd5Ml0qbfIOVLQ+UTr76st+B57yLfy/aGEFKr0ebqMOKuuv/l
	XQNw6luWeF6jOlp6gtVF3LrnC4TktfWY3rcDWHtaMUYiAz9onpZcX680A4lFZYs59Y1g
	+LaFs93peOPgHm5aUasaV239R/9CZMiH7BtmZUXsQRG2IpscNFICihCbwTKInSsrkRO0
	KuFzolm7ZCjXSnA6o2WVRFciSL3QfUImf87M6GNZsDxTIHGBN7Bzxo4mOnRKicjBb3Am
	LxtQ==
X-Gm-Message-State: AHPjjUjYN0veCca8mJCUzBHZe5WFpDuWMWxTU9v8/pWc6/Oms/Vm1JJX
	QWJ+067DMn+8gA==
X-Google-Smtp-Source: AOwi7QCMpxB3iN0KUZElBZmwq38q04111vjwk2cwC3nqlXcV+XrVRe4+6ZS+8cwVYfTCB13D1LRgnw==
X-Received: by 10.55.209.155 with SMTP id o27mr18750590qkl.145.1505697002152; 
	Sun, 17 Sep 2017 18:10:02 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id d64sm4274725qkf.3.2017.09.17.18.09.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Sep 2017 18:10:01 -0700 (PDT)
To: Subbaraya Sundeep <sundeep.lkml@gmail.com>
References: <1505494753-10837-1-git-send-email-sundeep.lkml@gmail.com>
	<1505494753-10837-6-git-send-email-sundeep.lkml@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a264795d-5114-45fc-285c-0a7cc4fbaaad@amsat.org>
Date: Sun, 17 Sep 2017 22:09:58 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505494753-10837-6-git-send-email-sundeep.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-arm] [Qemu devel v9 PATCH 5/5] msf2: Add Emcraft's
 Smartfusion2 SOM kit
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	alistair23@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bD8VNanrjjhT

On 09/15/2017 01:59 PM, Subbaraya Sundeep wrote:
> Emulated Emcraft's Smartfusion2 System On Module starter
> kit.
> 
> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
