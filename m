Received: by 10.25.221.202 with SMTP id w71csp1189687lfi;
        Thu, 3 Aug 2017 14:36:41 -0700 (PDT)
X-Received: by 10.55.47.135 with SMTP id v129mr307564qkh.13.1501796201329;
        Thu, 03 Aug 2017 14:36:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501796201; cv=none;
        d=google.com; s=arc-20160816;
        b=ju0MBnONmZyIxkRAsrQ4ZnvGhJMap6SbdjZT5JAv4sdXrvBJTksX6p5IM+0VEyc+wT
         095T3fqrNp/mJTWFwFS/oe8qclw1/p2xe0Us0NE8PSreHdsKKC8qsLhjBjTeAtxq/dd5
         3QpMlh2Yx+VogZpNOKKiJ24kBgdGMJatq7kcS3y+JwWxVq2uC9/2hi4ac2Uv+s6E5XWJ
         uS9qMfAd1uhaewGhlFgm0hhD7FpzZeK5f2uJRWO1TcF7xX6eo8pPFPj1H03GsohHLy4V
         L2mN/6yXzUy7hy/nn/o9wyWkYbp37g0Kp+YWFTYPGn/qPMr//mFZxx/YgpZWS6rgpcBe
         zLtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=58wZKequcRDYGwhsqvtcSqk9ztt9hILGoDNIrAWgoyw=;
        b=K5RuBofaX9Bsnb60iAo0AXLbNH77AOaBruge+mcBrZpelGSZXKoKTXXr3IhIPDFQIx
         AbnsKNo9h660yMjoVz3sgZdU8wCs57cTmqcy4EZstzLWN20S2Z3gzM1PsuQlc9UYWHnG
         nGZstudFaSdIOn4xDAZq8Wii53FAYdKp5OY2JDfBh8v+A+Kt2k5MmjxbI7rk8C/Lt2MQ
         41go/5N9nGNthPN1U9SHMoabVLUmcfkE8oRX1tpMrctgyJmw8t/XdBfDHcxvVAvZxHGB
         Cnb/xYIUccwNFbpIPCZEOIGSq5L5N6glFLcqjwJGlGcRQMTzzH245zRN+pU9uCfyCksN
         jCXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=ZzrwPK3N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y65si26991943qtd.2.2017.08.03.14.36.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Aug 2017 14:36:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=ZzrwPK3N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54345 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddNnK-0007Li-MI
	for alex.bennee@linaro.org; Thu, 03 Aug 2017 17:36:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42153)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ddNn9-0007Jl-U6
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 17:36:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ddNn8-0000P9-Pj
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 17:36:27 -0400
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:33400)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1ddNn4-0000HH-0F; Thu, 03 Aug 2017 17:36:22 -0400
Received: by mail-pg0-x244.google.com with SMTP id u185so2570874pgb.0;
	Thu, 03 Aug 2017 14:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=58wZKequcRDYGwhsqvtcSqk9ztt9hILGoDNIrAWgoyw=;
	b=ZzrwPK3NCAXxfhMQ/Lp3/gc+wdVNn3FFZpk3XgkeHzbfIZms0ll9cziUQKkHpykgK2
	a959J6X1AZPBz5Yz2h1UCOJwj2IHpy+3ZN+VCZg4Qkusixs0uoi8UNu+hlqEFQqTokCO
	+gLR+SREjmA6nlG6grZ7Ra2a9Yk+5Oxuzgx57bXk4wMuE3FfzceNivCrBjwCCofqVjXQ
	q9oQxn9o1+1b2D7FdNO0SJW6DkrS9+kBiu8yaDtAiZSzWPB8fj/Z6E83gujDdfW4TtU0
	v8wepDfgOHBnebQthU9mdCWDgSU4udjfayvD6mITEtcpkgNNtKmOglhyN9DNOkf0nCzV
	H3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=58wZKequcRDYGwhsqvtcSqk9ztt9hILGoDNIrAWgoyw=;
	b=VYgiDd5If1oZ6O35UWnDTwMHQ46gZL5K6gBaHGes8IHhZDF5FBrbpjUDimTUtWXbY0
	1X0rFyCdM1i9sFKNsmvVuE3LwEl/uEMtqMrumMniyUNTWBLv8Pqli7OP1aGypskQty+T
	1VRGWzNRnekdJOkXH1eNcJI7Zxq0dQdeAXVYg9vkBo35ZegXYnfgBkX0HHcmFTtql88g
	DzWSInPFtbx3kRGziJIp3N+Nrlr9tJ01CamXI2rixERTm+PKw/942NpJk7W3veMjldbA
	DmRXWHzniwHcwoBr04NRP7c5ArR/pB0WUPdwzTNRUSpypZEF1YQav1dmsaBhAhDxWGv4
	keVw==
X-Gm-Message-State: AIVw112BzHWO2WcqLclvIeWgzWSW0GX4e0Iub/Cm2JW/y02Dv+XgqbNb
	3O9O8EgqSnVHKg==
X-Received: by 10.99.36.7 with SMTP id k7mr141254pgk.325.1501796181173;
	Thu, 03 Aug 2017 14:36:21 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236]) by smtp.googlemail.com with ESMTPSA id
	g1sm2962986pfk.92.2017.08.03.14.36.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Aug 2017 14:36:20 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
	<1501692241-23310-8-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <d94cdb49-a23f-af7e-25b9-4bd67e33db26@twiddle.net>
Date: Thu, 3 Aug 2017 14:36:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1501692241-23310-8-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 07/15] target/arm: Fix outdated
 comment about exception exit
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
X-TUID: nLenWK4K8SPo

On 08/02/2017 09:43 AM, Peter Maydell wrote:
> When we switched our handling of exception exit to detect
> the magic addresses at translate time rather than via
> a do_unassigned_access hook, we forgot to update a
> comment; correct the omission.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

