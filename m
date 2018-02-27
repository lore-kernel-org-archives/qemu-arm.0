Received: by 10.28.71.27 with SMTP id u27csp5252552wma;
        Tue, 27 Feb 2018 12:52:57 -0800 (PST)
X-Google-Smtp-Source: AG47ELtoMae2YknKNllbgd+CkpnXkJdI2eAq1e/GSvgfkzYOY7tYhGZeKqF7p9x/EOGxLsSKRrC8
X-Received: by 10.129.112.1 with SMTP id l1mr10307085ywc.383.1519764777597;
        Tue, 27 Feb 2018 12:52:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519764777; cv=none;
        d=google.com; s=arc-20160816;
        b=jgWg+Ce1Qk6vJlTlBdnJPSsWIBR0IKQyLO14TPf8h/ZJP/VrHeTYYfc9JPE8Cfhgj9
         MrTs+M7tL1kj2mfPZlSB8PrGW1/VVGh5sqx3tMr4hsw58d/pI6vOS+gZ8qdxuqZYV7PG
         pnTSj3ljXBB+WgeUUKFWGgv7L5piivAxhmzS2XcMChTJSd3vKVHJRzF67Ch/9N/B3esW
         R//5y2kS1MbH3mvgkLYo5w1C4N3+kqBx5U5PXHZYShLr8IpKC8O54oE9dSiPTb7g7Ooc
         Bg/jM5OrUFWP4mkCpoIh2PRd+7Ohdn0kCet05AQJ7nYX8FjW5vj7FnxPHr5x/PrGxp+a
         N+LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=EU8aTlHxfL5IYO6hRq+/CVAI1+eDzivt9tMzfzzZy70=;
        b=P/VR/5m+eIysS3hUYyMLBOrDYjux5H2CsqSqvpJ7J5GLTF4yj0h+s8ktHCC0N6XxQM
         WmOpROPzL642JkqgnUQKe8wihG3ckVs7Ru0V7gXr71/iVqjEDQToZCTAZ3s1fAMBvSFv
         z4OMK8IrmTfBlllTE68gDYP5vwjVb7dwrZb+2Z2V13H3KUlA6B4cgNlv4i9IMZOJq/kn
         vrZBUBltxDpQQh5Ipd6zVdmP6Xd+EqEk/9XlxMMwJDt5e+UJp2JtogXP2ibEYY1+zl2Q
         E7Ak/xWv7GI+qp9Kbv9GnQSV6lWcnvuZAB17nYiwwv2+JbM8ZFLUyJQQ9m/ATGqYUcMW
         OvMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VL1KTCqT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m4-v6si6272ybo.347.2018.02.27.12.52.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 12:52:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VL1KTCqT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40061 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqmF7-0002AA-1Q
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 15:52:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55364)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eqmEe-00028C-PP
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 15:52:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eqmEZ-0007oq-Sw
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 15:52:28 -0500
Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241]:44170)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eqmEZ-0007oY-N7
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 15:52:23 -0500
Received: by mail-pl0-x241.google.com with SMTP id w21-v6so108775plp.11
	for <qemu-devel@nongnu.org>; Tue, 27 Feb 2018 12:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=EU8aTlHxfL5IYO6hRq+/CVAI1+eDzivt9tMzfzzZy70=;
	b=VL1KTCqT9HxCBWJfbpKgNm/U9Rd4KKxb340juoalyGzun3sL8kWp3zSznSWHIXoOpH
	TRekZ8YFrDuvYHepOJ1FI5+us1gbr8+I44UNhV9f8fCq+QcGysMSGfCzok2vPf/ryToD
	wmYYoHOn/utFd5ifenqMWUk/8wwCxbg6s3sXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=EU8aTlHxfL5IYO6hRq+/CVAI1+eDzivt9tMzfzzZy70=;
	b=hNdeTEy+5f3xL6S+dHazG9MifdLoGMWgQ7ueAA+Lw/nZ4u9hKVKch31Gm7/ro/fyfr
	co0WYGzRY5QvRNLJdimiTy8kGVpzQE1CORK7W20TCYe8WZuoTgGuq5x2Kjhp3zrvblhP
	lwmegHTkAaWEkfMNycTeX63DT7uxOB3/4PD8Qvfu5S3ojW/AOj1OlqpKF0pdrYxjZ2PG
	uWDmCfQEAYeIVwFldy2NFXM0e92SkTCSi7GZjezjlN48QzNP6ls8hucYqLNg45+0a71R
	0MenPcyQeELOpWTU6ez7zus5PiRNgkpuUMwkpTr14uNZr3KH971ktsuEr3y3Sx+DLKdQ
	kNZw==
X-Gm-Message-State: APf1xPACb33gVKwifSGv8+7BoKYDeFQaQYLwTRNeNum8D6Hg5c6Q3UPG
	67LGecePRMe63wKHV3B2aTlFfRkdHuU=
X-Received: by 2002:a17:902:461:: with SMTP id
	88-v6mr15390984ple.88.1519764742766; 
	Tue, 27 Feb 2018 12:52:22 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147])
	by smtp.gmail.com with ESMTPSA id a28sm48252pfe.70.2018.02.27.12.52.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Feb 2018 12:52:21 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180220180325.29818-1-peter.maydell@linaro.org>
	<20180220180325.29818-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a71c87d5-2cc1-c2a5-6b26-19d97071ba46@linaro.org>
Date: Tue, 27 Feb 2018 12:52:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180220180325.29818-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::241
Subject: Re: [Qemu-devel] [PATCH 11/19] qdev: Add new
 qdev_init_gpio_in_named_with_opaque()
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jn4ExBxk0+v8

On 02/20/2018 10:03 AM, Peter Maydell wrote:
> The function qdev_init_gpio_in_named() passes the DeviceState pointer
> as the opaque data pointor for the irq handler function.  Usually
> this is what you want, but in some cases it would be helpful to use
> some other data pointer.
> 
> Add a new function qdev_init_gpio_in_named_with_opaque() which allows
> the caller to specify the data pointer they want.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/qdev-core.h | 30 ++++++++++++++++++++++++++++--
>  hw/core/qdev.c         |  8 +++++---
>  2 files changed, 33 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

