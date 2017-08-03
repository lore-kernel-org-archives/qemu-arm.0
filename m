Received: by 10.25.221.202 with SMTP id w71csp1123345lfi;
        Thu, 3 Aug 2017 13:33:50 -0700 (PDT)
X-Received: by 10.55.21.193 with SMTP id 62mr162982qkv.42.1501792430248;
        Thu, 03 Aug 2017 13:33:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501792430; cv=none;
        d=google.com; s=arc-20160816;
        b=O+QnpUIsD8kkNwDz9ve3xcAvjB9fO7a1JVb5JlPMw7oQPJubWcrpxW1mYk8wtcgBxk
         TQd6yyA0M3swJ6vi8FAlrRTid5E59A0utORW9J2QzLf/kJzccBaXD+u1iWUo9gCFJO2C
         RWCP47EZAHNEfELxOW1DAW7roTBlxveWNkYQGomS1JBd7cI0/dYYy3XzjWF57NKYJyJ2
         8h0ktQttrGs4ZZPh3kCfdAkn0us1qu4A2X6RLpYXIeUAR8lLi+iqMuSPe6HGzVE+rbkn
         5GzJs5DywmwY4/9DtqbxVBmHtDYqD/n+3QkYk00xztrTIPEvdXt5bzibEq3F1CEbyIjN
         90cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=YK2v5DR00+ngRt3QY+j0TS+6s14qIbF8z9TqIIpH7nI=;
        b=wZP74XYkD8hs84vWvhgizFSSv4XuYWXUhz6OkVXzFuNfMpxHCYkr7IGxjroNIwzUFX
         rKM9QymwjRXbg4L51zxg4Xqnuhixb2mBXl+X7W95ZJXf3tlgEMLQ3v9aYmuaHimuKhQQ
         p2E+5U08T1LgEHLnCNcIWJHbQ6GGtDrPoJcpfkyGJP+MhRvgX75taELsioQjKKpooppQ
         wmkl5qFX8jRuXagSSKzxpfyGtgW+aE+ttulNojTYYWMxhhmE2Mkj5kRlw5mCTK/ubUsW
         kXGRjfNWY4377MigVxOOly3dBxI9wJH26sDt63tbNLrmxsBZ99xLzJtVDg2GHuSPRUrK
         p/Mw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=GlyXjNht;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t29si32724965qta.166.2017.08.03.13.33.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Aug 2017 13:33:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=GlyXjNht;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49481 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddMoV-00027c-Dw
	for alex.bennee@linaro.org; Thu, 03 Aug 2017 16:33:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46315)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ddMoN-00026w-Dp
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 16:33:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ddMoM-0002fm-Hx
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 16:33:39 -0400
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:36755)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1ddMoH-0002Zi-QJ; Thu, 03 Aug 2017 16:33:34 -0400
Received: by mail-pg0-x243.google.com with SMTP id y129so2441734pgy.3;
	Thu, 03 Aug 2017 13:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=YK2v5DR00+ngRt3QY+j0TS+6s14qIbF8z9TqIIpH7nI=;
	b=GlyXjNhtx/ka3W/BdB3PpRsZx7bWmS0adVH8Vdt/f/OAVOJbsgPo3LDHSGdj1djC9y
	w+Vj1BMqBbUmA14goZTsr/dK/oYNJUdxg1bFqISMUdEeYGPy7vNEAHGZcZoc11CG+Wwk
	KCViUTrp0bPkc9Lqq4GA6JTyhE5/3PStU4k9XL3gk/uDSKNH6r4jeN7f4OA6eHICux7y
	AWxsComSAIhwoYGvhd6Da2JXqQ0rGPUGSqGVJYLXM1JYQXwsr5DDrfEb+286Ypze81dn
	KowCCyPHzq9BqPAEV7qDIZpIBm3zWF7o4TfV22GjDtnF9yxSWovQm4jn2Wu/kpUXiMgc
	KQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=YK2v5DR00+ngRt3QY+j0TS+6s14qIbF8z9TqIIpH7nI=;
	b=uiDV8hCur/EB1LQmKoqqN+MbQrj9/8aEeAJSDAygmgnA3U5Dma8xI9f91UsrAM/LCp
	MCb/46rX/gYEGOuEw8tPi8NQFKUOL+kO2m+8xikR1pOrocljGVFM/7kebaJMlG649J+3
	MF9g3YFNrh9Nd9ZBURcjktyKxayIULYamt6SsoeBoCz0275LCGlcs2P4zGk8uxoNDtyX
	1+Mxp757kmN7qT4la+aLq0FPB26XsaaESPXkv7eJLLYqtnDIMkSnXhSqTgbyrziG50JZ
	ovCcSioMpXT4bJbATOc6xyLQ9bThVSUFxhj0L+A68ZG2rTGq6VkNZ+7IMYyiYzEQPvB5
	osYw==
X-Gm-Message-State: AIVw112ZIZiwGok3NvO0C68B6a82T1+YfPBj+BQt0Acb4LF8lZ59/mAn
	cCOuUgQg0p/Zh8z5HUQ=
X-Received: by 10.99.127.90 with SMTP id p26mr23953pgn.377.1501792412711;
	Thu, 03 Aug 2017 13:33:32 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236]) by smtp.googlemail.com with ESMTPSA id
	t3sm61351326pfb.147.2017.08.03.13.33.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Aug 2017 13:33:32 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
	<1501692241-23310-4-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <f58e5b02-8023-0737-3b79-507040751ce2@twiddle.net>
Date: Thu, 3 Aug 2017 13:33:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1501692241-23310-4-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 03/15] target/arm: Consolidate
 PMSA handling in get_phys_addr()
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
X-TUID: XCNUzqVJVoC4

On 08/02/2017 09:43 AM, Peter Maydell wrote:
> Currently get_phys_addr() has PMSAv7 handling before the
> "is translation disabled?" check, and then PMSAv5 after it.
> Tidy this up by making the PMSAv5 code handle the "MPU disabled"
> case itself, so that we have all the PMSA code in one place.
> This will make adding the PMSAv8 code slightly cleaner, and
> also means that pre-v7 PMSA cores benefit from the MPU lookup
> logging that the PMSAv7 codepath had.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 38 ++++++++++++++++++++++----------------
>  1 file changed, 22 insertions(+), 16 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
