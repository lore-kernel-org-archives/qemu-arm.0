Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp873852wrt;
        Fri, 25 Jan 2019 16:01:55 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6ruEZCZPsLHVfkvlX0kluvV45H3c+Th4RBUuqWBwq5NHSyDxqKrZDOz/9+xlemNFBH6PgJ
X-Received: by 2002:a1c:cf0d:: with SMTP id f13mr8362846wmg.70.1548460915548;
        Fri, 25 Jan 2019 16:01:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548460915; cv=none;
        d=google.com; s=arc-20160816;
        b=PE/NGrqiE5IOMHh0Xbtfool6O5/umFI80oH2ITRJh8hjta4tR3jabPJhSiMqU1yJhX
         Dv100Xsp9LP5oFTvKsC0ar/v02p51lzDczZ4qMPgnPHjY5GHmpudY1CfaOm6O2q+ey83
         s4+z8DXCz39P5St4ehAbEw4qyUWH+FIUlFKFjatP50k6DlKhAXeOPsxJqEA+ly06f4lY
         DywIwI9+G+4iKUFP9eXT+p6Lp54gTDjQ28IvQeg1eLoYchkbODJ8ZedLT/ctEPoGjl5G
         lV+yHNnc/Nrl1LBqfFVed7LK6hvabESJb6rdRyDeK5p0T9hUErOcSkC/iOmGVjy27csi
         aIzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=dJbSxkMJ61+hPRTsXtv4mfXsRW/wZkem5nc9R1RMBTc=;
        b=LxSO5wZQyTCoCz0P8YFiLdHU75ioywQ0NNJ6gQ/vVS4H40bl5/mU0rL3cuadox027p
         ZXJT/9bKeu6vS7QNyiHqTwRm+4rDjTButgvC/lnlWhMtEjjykeV6hPIhw0fOzTtj/fjG
         ucKo+ewRPqt+03jvtvvLb5g4JVlwgAtVFeiuz3dNEuZvPY6MmUJsJbQE4JeQLqA50BDV
         zrbaaXw7cLQoQVJMuPvmt4mSYyLrtzsEPck+8rSJtKzRFSmApkBhKkVVpcJ+cCkT6U7u
         AeYim6qafR0/Wsx53AXqekVIpYl+8Lwk6k61S+S7qpdzvaQREGSkKMX0mbOw/46fOaD9
         z/LA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BM9uJLj6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r205si30408570wma.18.2019.01.25.16.01.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Jan 2019 16:01:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BM9uJLj6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:52710 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gnBQ2-0004xP-MT
	for alex.bennee@linaro.org; Fri, 25 Jan 2019 19:01:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58829)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gnBPt-0004xF-S6
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 19:01:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gnBPs-0001n1-Mu
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 19:01:45 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:41528)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gnBPr-0001fh-Re
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 19:01:44 -0500
Received: by mail-pf1-x444.google.com with SMTP id b7so5448492pfi.8
	for <qemu-arm@nongnu.org>; Fri, 25 Jan 2019 16:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=dJbSxkMJ61+hPRTsXtv4mfXsRW/wZkem5nc9R1RMBTc=;
	b=BM9uJLj6ZIgtDbYj6IXsrUZzBitHDH7SHIca0nFtttJnHZMeJtS1xEEWcqytZJD6C8
	FPUUCSZiwEMzwPjbJ5xj6b3BpricEuZkaOTx++2z2BGZHvnc6N3VryLHrrFulYqrDc5t
	i2NaEkBYFYqKox4eX+Qdin3KHHMjsU9upvp4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=dJbSxkMJ61+hPRTsXtv4mfXsRW/wZkem5nc9R1RMBTc=;
	b=ls6g4AOHRG0zHcIqGjN7YzsR2orQSSRf3NLZZV8OwD7CQFx0L/huJlGXMOOmnatD6V
	mTIwyxmfH8qxC0KzFF+WKW32AG+o8dGpoGyH7/Ai5bTiOa5/JqoOMNqHwbBNxRLSyqgZ
	tW2TxQBMSbyWOA+xIUJZj74B1WcqdDQxl68h6Wve0WTc2PPo1Y3JsqUQdh/sWregwbuJ
	3p4sl+kO5+ZMKHrL+ipAk//JN7JiZKK6SzgUTuWEXNrphgb8VhCsSmbA8rRREFCwkwye
	vPX8saLfeHGIwirASa3hOHs8fCy6t3O0WL/zJcc4Yjh80LniIhDKRYJBvIVSGC1USRKX
	gQSA==
X-Gm-Message-State: AJcUukfna51PjXMU9v2wH6oImGJjPu9Mfaf4RfnXDUo7bSfXbhbcrAVn
	HPSBXJXxX4HxxF8ZhmaHHNySQg==
X-Received: by 2002:a62:de06:: with SMTP id h6mr13355417pfg.158.1548460896275; 
	Fri, 25 Jan 2019 16:01:36 -0800 (PST)
Received: from cloudburst.twiddle.net (97-126-115-157.tukw.qwest.net.
	[97.126.115.157]) by smtp.gmail.com with ESMTPSA id
	n73sm36478517pfj.148.2019.01.25.16.01.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 16:01:35 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190121185118.18550-1-peter.maydell@linaro.org>
	<20190121185118.18550-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <a16fa8de-cf25-54c0-f394-1624017d18df@linaro.org>
Date: Fri, 25 Jan 2019 16:01:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190121185118.18550-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 07/23] hw/arm/iotkit: Rename
 files to hw/arm/armsse.[ch]
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
X-TUID: 8GME6XruL7Sw

On 1/21/19 10:51 AM, Peter Maydell wrote:
> Rename the files that used to be iotkit.[ch] to
> armsse.[ch] to reflect the fact they new cover
> multiple Arm subsystems for embedded.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/Makefile.objs                  | 2 +-
>  include/hw/arm/{iotkit.h => armsse.h} | 4 ++--
>  hw/arm/{iotkit.c => armsse.c}         | 2 +-
>  hw/arm/mps2-tz.c                      | 2 +-
>  MAINTAINERS                           | 4 ++--
>  default-configs/arm-softmmu.mak       | 2 +-
>  6 files changed, 8 insertions(+), 8 deletions(-)
>  rename include/hw/arm/{iotkit.h => armsse.h} (99%)
>  rename hw/arm/{iotkit.c => armsse.c} (99%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


