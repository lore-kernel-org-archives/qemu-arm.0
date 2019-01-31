Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp7407023wrt;
        Thu, 31 Jan 2019 14:45:00 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZo5iyTl6XckmHE/z9oQ2ceB/vsi/bYDHGdwQOHzM0T3EuiUD9mh9d+ntHHARU4Qnose668
X-Received: by 2002:a25:4682:: with SMTP id t124mr3725041yba.249.1548974700244;
        Thu, 31 Jan 2019 14:45:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548974700; cv=none;
        d=google.com; s=arc-20160816;
        b=S9EN+PdL0RB7+oAMmIT7B0y7jq9m05CXK3bhNaTKCb+juZpzovzOFRq6mZQ/FM7Eec
         u5d970GAy0REa5q9GiOIw5ztIy4dU9mHJatksoB0ohd9cEzbdKSx+WefJ6dlrXrEMVJE
         xIHwhfWR7pVpaAi6LYG8NYSCUvSBYHu69f0cfnggU05rrQoj0zefIDD7jJOTouCioZ7K
         /N+3XX5oVM8f+Qu6jg/5nRTcq22djkhEwK62T7yHozoOyjl2vqVOhL1rjKl6edD+37ZE
         Mj1wIfl0hzvSNMUbesy94shuocE9rvz8XL+97LEM/UZh8KlVrj7OPM3mHRZRSrdQ8wx6
         1iZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=2UpzrbTH5HZHdgf9ZTOZ6J6D4SY0deh6V4yWeU9Foxw=;
        b=JQIp6tGLuLDdiOdQkp4bQuro/UQ3C5yhJq6KFZyC01cBaExVfIHfiahYPoLzDdP6Ql
         0K0iSR7K131NmOYihXFFg/kyKEtOdQQKCm6D6kSFIL2NjnScTv7vYxuDETBabUQRNrLR
         Lwh8JkjKb61bD4zO88c1/qhHUWXscihQGdLDNAKzzqHZ0xE6VbNfNzJdlTLyT/x6IpRa
         3qy0TQC3mb0cb1GVAXcu/QaqAoboM7eMGuXGLWSCMxm+Ngl2j4aNWUgAohWQy7/f9SQr
         vnePFQZdjpcxBu0wIFmrKMVan3t3DGSCCnfTMlonDNbBQZcemq8I+m18Rjkh70PjITNi
         t9Gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="YTLNiu/W";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b69si3401335ywb.201.2019.01.31.14.45.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Jan 2019 14:45:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="YTLNiu/W";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:33977 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gpL4t-00048r-O8
	for alex.bennee@linaro.org; Thu, 31 Jan 2019 17:44:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59198)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gpL4j-00048L-Um
	for qemu-arm@nongnu.org; Thu, 31 Jan 2019 17:44:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gpL4g-0000Kh-14
	for qemu-arm@nongnu.org; Thu, 31 Jan 2019 17:44:49 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:33546)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gpL4c-0000Hw-Fv
	for qemu-arm@nongnu.org; Thu, 31 Jan 2019 17:44:45 -0500
Received: by mail-pg1-x544.google.com with SMTP id z11so2004049pgu.0
	for <qemu-arm@nongnu.org>; Thu, 31 Jan 2019 14:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=2UpzrbTH5HZHdgf9ZTOZ6J6D4SY0deh6V4yWeU9Foxw=;
	b=YTLNiu/Wm+Juz73W+lzJBXln/ChvVv0gS5uenrLx5G9aUEzKzsgE4g+1i0p/OPYlOn
	quFGtyde1pblfXXj+KCtRGPXyDPYpIfEehdzjuskY/TLOQH7olRZwiiMQeCXLk0CGa8u
	r45RZjE9KpkfU0GwQBJxlkI3+0uLidOTK3gAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=2UpzrbTH5HZHdgf9ZTOZ6J6D4SY0deh6V4yWeU9Foxw=;
	b=pWfiMYzmbRNIs/boZuz4hcAoe9E0JUBKJciWvDAVUvUn4FwTvCwhynlEOYx5FFvaw+
	xjTkYQZBoTFJUXZ4pD3PJKbbeas30jRuklRVsLSn2k56GKYnLhNPFbRBfSJH5B5VzlEH
	SlTY+X7ucSOvzFLX9BEHI0c1OPyL3f7lPiUBHf4yhatydnCQ6RjLZu1TQhoHHOLYCJ+m
	6K+wES+JjUwxhOL6W/2WH9rtkXC76IwzRxXQJowYuppb5n1/vyQQqVwIPdPwnltk6AUN
	RAsapvFs5MqYeD0myy9UkokO+0mPhZx/lspNEUIWqdzDk75UO7HkSONOAB0lQs03p9GJ
	pDmA==
X-Gm-Message-State: AJcUukcRHOZrXfMDG5ao0zh0P+ftWB+5wwtrfTLYIkNbHKXrgijsSwxm
	WreZRJSRf1FsBgfTwhAPMcnryw==
X-Received: by 2002:a63:d10:: with SMTP id c16mr33435546pgl.382.1548974677820; 
	Thu, 31 Jan 2019 14:44:37 -0800 (PST)
Received: from cloudburst.twiddle.net (97-126-115-157.tukw.qwest.net.
	[97.126.115.157]) by smtp.gmail.com with ESMTPSA id
	u69sm16751797pfj.116.2019.01.31.14.44.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Jan 2019 14:44:37 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190131112240.8395-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <3ef2114c-fd8e-daf9-61e3-a2f4962d66c8@linaro.org>
Date: Thu, 31 Jan 2019 14:44:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190131112240.8395-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/5] hw/arm/boot: Support DTB
 autoload for firmware-only boots
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
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>, patches@linaro.org,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +FJBrdWumlSB

On 1/31/19 3:22 AM, Peter Maydell wrote:
> Peter Maydell (5):
>   hw/arm/boot: Fix block comment style in arm_load_kernel()
>   hw/arm/boot: Factor out "direct kernel boot" code into its own
>     function
>   hw/arm/boot: Factor out "set up firmware boot" code
>   hw/arm/boot: Clarify why arm_setup_firmware_boot() doesn't set
>     env->boot_info
>   hw/arm/boot: Support DTB autoload for firmware-only boots
> 
>  hw/arm/boot.c | 166 +++++++++++++++++++++++++++++---------------------
>  1 file changed, 96 insertions(+), 70 deletions(-)

Nice cleanup.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
