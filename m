Received: by 10.223.188.70 with SMTP id a6csp6116910wrh;
        Tue, 29 Aug 2017 08:25:36 -0700 (PDT)
X-Received: by 10.55.207.91 with SMTP id e88mr3156566qkj.38.1504020336146;
        Tue, 29 Aug 2017 08:25:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504020336; cv=none;
        d=google.com; s=arc-20160816;
        b=q7PYO+SS+gSwEtgfwRH5sNwCXXJo7SmmTIHyf8BR/duQdueji+Gc1IYtY2bxsqkDlL
         N84s6d8+Lx2FgCQbJQMEqc3va/SHVqGHoUhPyeor3uBCDfYqmRjFnOGWmnlP5aE3hBLQ
         njV58iN0ft4UBUxkg7UKh0Yj/3lIaAvKdUoZhu5m/qvRbxpYA+MD7tMJxWovrVgV27hS
         4mLqv3mMFIDs7wOhNcp7uAGs8cJeENs+ABJxXFGdrUW8i8TSq0TM/HSRV+Dqid2YfMxf
         gzwlEF8NhXhnwlLxIJkoiR9UYcqblN48P8FRE9tgNqtv3MvSQHCvTM4MBzGQD9pFq3rB
         WQZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=hJQ1Gy2Y8g7IAOVpsDlNACaufiG83gLiFi5RCc2hQ2w=;
        b=meBnsYb3tRO9QXSnPmE+wuvLJAHZ+Of/Wzqrs0KxUhv/mA0Vr5sXJPA5EIRC7L3cJD
         1RD0mFwcpaUfluDf1ulLe4gMRErHe5/usTVByEZH28kn586fIQOP5l3rN4W2MaWFvj3/
         PUeOZS+3P4WhrPFSJzYkSoTAlztZBDWMqOUbNx9hZQu6ru0y+vQvSY8s+bHV0Yg2muGB
         B4pXjDjw7YEGs/e+TmbalD6jMWKXFXdt86vXAZ1nD4Pk0AmGawnuoGeBUKF5eOuPhe1C
         Ppj0tpwl2jJGjMXlEbyjaUVBJO645SR8OQSPZq/PCecddivO9uyxshOImJwjRNHX+fhI
         BbLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CTgyye/f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u144si2958152qka.541.2017.08.29.08.25.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Aug 2017 08:25:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CTgyye/f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45486 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dmiOT-0006Yp-Nu
	for alex.bennee@linaro.org; Tue, 29 Aug 2017 11:25:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45124)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmiOQ-0006Yb-De
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 11:25:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmiON-0000WU-Aw
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 11:25:30 -0400
Received: from mail-pg0-x231.google.com ([2607:f8b0:400e:c05::231]:34371)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dmiON-0000Vy-4F
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 11:25:27 -0400
Received: by mail-pg0-x231.google.com with SMTP id y15so11803509pgc.1
	for <qemu-arm@nongnu.org>; Tue, 29 Aug 2017 08:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=hJQ1Gy2Y8g7IAOVpsDlNACaufiG83gLiFi5RCc2hQ2w=;
	b=CTgyye/f7He9yMJf+oRTKsjt2RIkR2k/oCbgyr9EMrPmJEQJFdSfcspcC6dHyg7GCK
	P4g+wVeblddXKWlFFvbQoaZBoOpf0BuMr2jIwYvbRKgzPfsVv2JVP3t3sSYsg4Ht5p45
	1EG3NaU2pHLXUibAe4miu8CVEuwhCPqcR46K4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=hJQ1Gy2Y8g7IAOVpsDlNACaufiG83gLiFi5RCc2hQ2w=;
	b=El4QcbATGhvIUjiqxsgeJ0K9FBIAmx3DvQriUhC5cRaIW/Z8RUuZNACtgYGHHRaMhc
	3QUDjIyFfthVenDBfvupSUOY93yKEmWbFlR+4sEagesHlKVrsJtdmnzQmhhFuxlt0Vyz
	mfJ64D5EET806mP1sIFFBEH42U4FBnhHALHFuywOY1/AQLznMpG0YEhIGsyn0AvxnanS
	ARS1P999gpgWCQufSk4I2DRWOO+BeyE0cAemJajQT7V3iqsADKf5KIbjC+TxS0WQ138d
	JOFaUEMqG2RKV3hXQ/3fkOad2dg5ld7Eaov8slGIxeKKwUl6nAexL21/PTGsQPpjP4eN
	5j0A==
X-Gm-Message-State: AHYfb5hv13c6q1BoiwIYTLSO/U/zhNZ0X945Ur2OHWCAC0YKmeMPdRHN
	h5ehsflL0ISZ/Erh
X-Received: by 10.99.126.91 with SMTP id o27mr636598pgn.297.1504020326240;
	Tue, 29 Aug 2017 08:25:26 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236]) by smtp.gmail.com with ESMTPSA id
	a13sm5172825pgd.71.2017.08.29.08.25.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Aug 2017 08:25:25 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
	<1503414539-28762-3-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7eefa11e-5daa-1748-0a0f-ab99c8d1cdf0@linaro.org>
Date: Tue, 29 Aug 2017 08:25:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503414539-28762-3-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::231
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 02/20] target/arm: Implement new
 PMSAv8 behaviour
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
X-TUID: GMDST88svSuU

On 08/22/2017 08:08 AM, Peter Maydell wrote:
> Implement the behavioural side of the new PMSAv8 specification.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 111 +++++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 110 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

