Received: by 10.223.134.117 with SMTP id 50csp10207258wrw;
        Mon, 1 Jan 2018 15:06:45 -0800 (PST)
X-Google-Smtp-Source: ACJfBourbvIeBKQGZf+Jo1nDhZxUUqHxMKND1jQ0ObXU4yMD9gk6NoI9md+7ZFxddrNYviNTbMnD
X-Received: by 10.37.228.68 with SMTP id b65mr6291307ybh.456.1514848005710;
        Mon, 01 Jan 2018 15:06:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514848005; cv=none;
        d=google.com; s=arc-20160816;
        b=kJlPTxYUtASyupEc3HbDXEICqY5K1mpaU33f5VqWIcZSigUZGywSwsNj8ENSIhYo5g
         8ICRPfyrO6Qdy+MKru6E0seL5OjboIxnj++PWNDmWI1B7qjPGUL2yj+BW6QdpjWiekq0
         iMZQ21L6mERLIhCAnrczNC15LBoDhBGK9zMZtLKTuftJh9kb6I+VBBKYFWuOZmLbLjNo
         Q2ZixujKjNj5Yx/uOZJOOEeN64vOIQd+B06qJxltbhyCfEI1Y14vROXokHoDNLZkloce
         FvOu5RYqITwHzmnZbkKKwusVx63pDYk1GYo5WfAOzv2WbNa2EmCp/EHt2fpRiTnZ17Hq
         45/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=35Af7kv1wk4MNVch3KCS32kaHtOCFbyXQxL0voEC06Q=;
        b=IF6iExCcTZ5aAiXu1n2ZPXQ2UktfI0tOeY6UqnoAgVcqZTpSYhdwMqLeLYiACLs6+H
         +IG8gOjs3LB+pQkURkTB62FEGN7N8kz6xv248ScI11hE9/0eJ4V2kwczG5ySjZEmq6+T
         aYKgw+QImdtlo4w44A0jPA5szmQCKf12M/UohupO2YctGPoJO0TZ+M4BvedASGcsGLDu
         KRBbwnnE6REfb4rKgCCLf5dhWEmGv3I3VaKbgYZUnAtQwFjaVk5vdGNXcvuNWj6iu5Ez
         P2iHFIQc0NUU8ZBnhzZLcCiGEbOeAwKs6SBU87o7USHjcof+IeYpQnPMUJimpLx5Jx69
         f1bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=V/MDRVjn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h71si3677914ybg.753.2018.01.01.15.06.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Jan 2018 15:06:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=V/MDRVjn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47200 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eW9AL-0003vQ-3x
	for alex.bennee@linaro.org; Mon, 01 Jan 2018 18:06:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59840)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eW9A9-0003tg-69
	for qemu-arm@nongnu.org; Mon, 01 Jan 2018 18:06:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eW9A4-0007QQ-Lb
	for qemu-arm@nongnu.org; Mon, 01 Jan 2018 18:06:33 -0500
Received: from mail-ua0-x242.google.com ([2607:f8b0:400c:c08::242]:38438)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eW9A4-0007PQ-GC
	for qemu-arm@nongnu.org; Mon, 01 Jan 2018 18:06:28 -0500
Received: by mail-ua0-x242.google.com with SMTP id 34so14852633uav.5
	for <qemu-arm@nongnu.org>; Mon, 01 Jan 2018 15:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=35Af7kv1wk4MNVch3KCS32kaHtOCFbyXQxL0voEC06Q=;
	b=V/MDRVjnQSPo4nwaDUIVKl6AYuwkozAXSAUzqcYSVgTc4dnmpwe/Hfu+/kFNVlMmas
	blxzIsOy5zW1xNrvoEYZyYianptuTJgvFN1pEpZw6BXeaRDr/gu7du4i9wXuXsHWqs5N
	XNK6Prx+TRjwzcnIBmw4hgfreY3oxOyKcbfgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=35Af7kv1wk4MNVch3KCS32kaHtOCFbyXQxL0voEC06Q=;
	b=OwyR3HtUxHGRR7/WaGYLQ7eai3Y1sRPEsabsld7WZFonCpzi6FclIO5Ad4TvU/FT7h
	2tdYM6p14kvrISxZ5EKDZCWOrb8W61JxF8cjfQOxLFx4IhPRrfPVEXmnDhlWvC7pRruA
	VI7G2TCCqNp+Ppm90hgJZOGmsYbiNawhYH3h2RGXNRj/vPHu890IJ8+2AK/t9RwmC9y9
	cFabzqLYoKJFO/TjkZMBq/t7Q4Jqwuh2LwNy+Bgoo1ZSFZS9JUF8QGW036yqCi29EaUj
	S7u/BB7KdkJlU3iAasASlR6ARci+9FzzHRr5XilEaYq9bEQKq1Jv1SWGS0Tie0CKTihv
	l6UQ==
X-Gm-Message-State: AKGB3mLQp21+Qv8jMuAaiMtOlgFi3bfnW9/y05El0hc23gIIzyQhA0y5
	4HTztlqP181sY7jHPyuwp+zZwg==
X-Received: by 10.176.68.71 with SMTP id m65mr23829963uam.25.1514847987366;
	Mon, 01 Jan 2018 15:06:27 -0800 (PST)
Received: from cloudburst.twiddle.net ([172.56.42.37])
	by smtp.gmail.com with ESMTPSA id
	y11sm1294339uah.36.2018.01.01.15.06.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Jan 2018 15:06:26 -0800 (PST)
To: Michael Weiser <michael.weiser@gmx.de>, qemu-arm@nongnu.org
References: <20171230225622.97409-1-michael.weiser@gmx.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <19080078-e96a-cc33-bb02-97f9b726d080@linaro.org>
Date: Mon, 1 Jan 2018 15:06:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20171230225622.97409-1-michael.weiser@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c08::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] target/arm: Fix stlxp for
 aarch64_be
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k0B0BnPe9poT

On 12/30/2017 02:56 PM, Michael Weiser wrote:
> ldxp loads two consecutive doublewords from memory regardless of CPU
> endianness. On store, stlxp currently assumes to work with a 128bit
> value and consequently switches order in big-endian mode. With this
> change it packs the doublewords in reverse order in anticipation of the
> 128bit big-endian store operation interposing them so they end up in
> memory in the right order. This makes it work for both MTTCG and !MTTCG.
> It effectively implements the ARM ARM STLXP operation pseudo-code:
> 
> data = if BigEndian() then el1:el2 else el2:el1;
> 
> With this change an aarch64_be Linux 4.14.4 kernel succeeds to boot up
> in system emulation mode.
> 
> Signed-off-by: Michael Weiser <michael.weiser@gmx.de>
> ---
>  target/arm/helper-a64.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> v2:
> - make it work for MTTCG as well by catering to the 128bit expectation

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> +     * 128bit store but two doulbewords stored consecutively */
                               ^^ typo


r~
