Received: by 10.28.71.27 with SMTP id u27csp5201254wma;
        Tue, 27 Feb 2018 11:53:55 -0800 (PST)
X-Google-Smtp-Source: AG47ELs79Q7z/MAOSUlXeHnvgGC9P5T1iRGEJxlfulJF8rinFHXB//fVz1T+kkcGl9hODPVCcDdU
X-Received: by 10.129.95.193 with SMTP id t184mr4437821ywb.362.1519761235091;
        Tue, 27 Feb 2018 11:53:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519761235; cv=none;
        d=google.com; s=arc-20160816;
        b=wvSw7xtTpObM3b0Bki90aRjpSXT+xWIAJtnKK8ecJs1ViHNhg3JKGvFsmNDXEscC45
         1jf4MZjUJIIWX5H6QdZv4Y5/CBv3e01qGgaTim5G9UtrBnXrxDht8yUns4KgrpF1+8Fo
         /Uyfd8R6HJquwy4TUzxisaAwgGOqw5eqHUpcjjPVFv4dunGzvVfQETRwHLIxEipOpflj
         b7gvMf7J2oJNbmifATTGiKoffx6/6Dj3HAdYRXI06g7Uw0TfE3csa2CapX9PE3dfnFBK
         Ions6vJG36/bInrA3sZwcjtePWjpwFNFB5a9+9tgU0LlJvZ9P3ww7Gr7iwWWbDOrnmEz
         8UAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=jkxIYFTbEZEXLyOvnT/sl+O7Xq6z3PXd8/usUmKyZU0=;
        b=zPa6u3JbvM6seIrMr9xhSBPWlSRQNrMGjtsdoIa+rG6JQmYrvy77nByCsB1uIRIdBt
         LHHZQNnOQXZ9W+1iupwO/5r5eBTU8OUKwDsPZ6ZQ0cWtFT4lqTSmlsqrfnmbPYYkCuDW
         SLeNDay3UiCbV4dIAvDk45R9Q5rY9MsFli3Wcz2rTQMUin30QMrkI5hOPGWEbTSqggYx
         YArLhYhLuKCzRZSNxJhfBjoGaIGtYbo8Ebd5GoHFV52HUeQQ6Vjunc5g0Y2PeM4d0eJ0
         7WSjQ2kymDEb9tdDCImT/rznnD0Pvv/H7FXNMDlHkl7UOdtXRmEQk+1u7uOLeOn7Z5J5
         0b1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cFT3zKuy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q12-v6si2070000ybf.64.2018.02.27.11.53.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 11:53:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cFT3zKuy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39786 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqlJy-0006zX-Hu
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 14:53:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38983)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eqlJo-0006yV-8T
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 14:53:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eqlJj-000720-Bz
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 14:53:44 -0500
Received: from mail-pf0-x22b.google.com ([2607:f8b0:400e:c00::22b]:34894)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eqlJj-00071h-3z
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 14:53:39 -0500
Received: by mail-pf0-x22b.google.com with SMTP id y186so13071pfb.2
	for <qemu-arm@nongnu.org>; Tue, 27 Feb 2018 11:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=jkxIYFTbEZEXLyOvnT/sl+O7Xq6z3PXd8/usUmKyZU0=;
	b=cFT3zKuyFuuLsjb+JTO9tabDJ16vTJKcIXl4+piMjLuJjYUrzAfLfSjV2PPujSZe3/
	sGU9fSI204w+cpUmJPG3PDoSVjOibV0FTwnmUhik2yPNplwRfUKa7u1iocDyULob1rk1
	HkeOZRclTyejXeuQ3p4RDkFZOvpAQat/5ZXqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=jkxIYFTbEZEXLyOvnT/sl+O7Xq6z3PXd8/usUmKyZU0=;
	b=cnQBbqjFyEEgYUo1IA91hfEupE+BPeYgnwc3H12sQPBelyU0lcwmSaibJ4W0drJMz7
	ODaunk9tcFziPCxrV8A0oldWcklujYUTIQq/2FTpoXYvmQv8zTCwJmI+0v+QZRqxBWgM
	xz3Kk2Yd0suMdAFx5FwhhEYmspIL10DHdkCEuvGrEdjLarXjs/ua4QsdVR3FMPYg6JA6
	RbLMT+gU7PY5SGzWO3X2WSxV2MyJCsiZV9arDH7b5aZhEYidKC66TiUVEXuYGhK7YCdQ
	q4Xbutij0W1uwUPFb1uzt6ZVDZzYNhoqjP2XBhXXPUadbKEPck41zuY50av+4ocYMI14
	pNlw==
X-Gm-Message-State: APf1xPCwjkRsXDT+G0BVmAzXVJb5RIbTHkomDJ25PHfNLY/5Xt+ITw68
	kKbfYUajJkbahdFoBayPyI0d2w==
X-Received: by 10.99.96.77 with SMTP id u74mr12344321pgb.453.1519761218056;
	Tue, 27 Feb 2018 11:53:38 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147]) by smtp.gmail.com with ESMTPSA id
	z127sm24182501pfb.130.2018.02.27.11.53.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Feb 2018 11:53:37 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180220180325.29818-1-peter.maydell@linaro.org>
	<20180220180325.29818-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e7da74d2-ee08-a000-2914-4760a371f96b@linaro.org>
Date: Tue, 27 Feb 2018 11:53:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180220180325.29818-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::22b
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 05/19] armv7m: Forward idau
 property to CPU object
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
X-TUID: MycjJiw+iQam

On 02/20/2018 10:03 AM, Peter Maydell wrote:
> Create an "idau" property on the armv7m container object which
> we can forward to the CPU object. Annoyingly, we can't use
> object_property_add_alias() because the CPU object we want to
> forward to doesn't exist until the armv7m container is realized.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/armv7m.h | 3 +++
>  hw/arm/armv7m.c         | 7 +++++++
>  2 files changed, 10 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

