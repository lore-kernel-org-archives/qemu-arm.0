Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1910937wrd;
        Thu, 23 Aug 2018 21:40:24 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZDjQAcBmeYs6PAAEpYL42pLEdfuidtiYCGFJx7Cvm8QU0Dct4uNukxptcqdMGMBQI8JFBU
X-Received: by 2002:ac8:225d:: with SMTP id p29-v6mr32573qtp.57.1535085624444;
        Thu, 23 Aug 2018 21:40:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535085624; cv=none;
        d=google.com; s=arc-20160816;
        b=n8x9tbHKJZtj4sHaX0CTEYRxmhL6PADmLc2M9GAzEkQ16NZnhgvlXIlEW5pRHKkKoU
         gEYSobFxsXX9lnQOVgDkWYaGFuMK8EHu+QxRmiXXiit8nQAMVpiowjbbkH44ufGIbgrL
         N6QVcqIJmzOPpAZjycPDTTnJbylpIC0yl7fE06eAHLz9ihPBMI2m7Pc0O7TmB4Uriznj
         g3gL6Nc95P3vP4i0+xEzknmOhE2wmdP9EOS59/D4PfxwmFYzjTSYNwRPYCvV1BClFoQ3
         oKAdfSTMVLpZes5wH99ZcMZPmQC+oR6UKkYkCjj8UtgQHdO4jhSKGLoHpgKODYnXED76
         l1ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=hUNEn8mbtjoh2u+p2asaQd1v+JBuiEYbjxuHAVwHO2s=;
        b=OfxYdPryvHc8ZsEgUNxKZrMH43oOnjcYcq3OUcbIWry6NJboERcJZPeFeUAf4+KxSZ
         epe6532rz+0tJaD7Ur0faJsMFgl07tybyYBMdlrqtNkAZAwUIFGeuXkkLfiR1QUHEUsn
         vvUZ0VB7FMfHDwGkI9UtR76NxKzuE3nlgT84nft5KOhfxTuRahNmk/3gOn45qhtp7ng7
         EXG6LuMl8lw/4z/JRxy0QJxkKWtcwmEGqfcbe3DVj3p8xC4CqKcblJaPoDbtvgEWnKHk
         KjFiOWaNeGxOk1lP/jDWs7K1pLJWQIZk9o62Msu/xoIizwaQ6CzDsA/uykZUxOnB4wEg
         8TOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jCNO7vM5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j128-v6si5144790qke.154.2018.08.23.21.40.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Aug 2018 21:40:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jCNO7vM5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39839 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ft3tY-0003M4-0B
	for alex.bennee@linaro.org; Fri, 24 Aug 2018 00:40:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46075)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ft3tM-0003K7-Gd
	for qemu-arm@nongnu.org; Fri, 24 Aug 2018 00:40:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ft3tL-0002t6-Nw
	for qemu-arm@nongnu.org; Fri, 24 Aug 2018 00:40:12 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:37727)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ft3tL-0002sH-Fq
	for qemu-arm@nongnu.org; Fri, 24 Aug 2018 00:40:11 -0400
Received: by mail-pf1-x441.google.com with SMTP id h69-v6so3926220pfd.4
	for <qemu-arm@nongnu.org>; Thu, 23 Aug 2018 21:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=hUNEn8mbtjoh2u+p2asaQd1v+JBuiEYbjxuHAVwHO2s=;
	b=jCNO7vM5MKTHdGTecuyBH519lGNoeoXgGTzvHoyd4XR76xnz7n98my4U5l0mWETZrZ
	uRB2RdFAIV5k0zrTJMdF8Qlha2xNCyigBtu6p31wtPKB2lN2XLOCSPGgaskZbxkY9aqQ
	CMcWoprXwB23gw7taQ6mBTK0f7P94BfbTBoBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=hUNEn8mbtjoh2u+p2asaQd1v+JBuiEYbjxuHAVwHO2s=;
	b=CHYUMq1X78HFbT57aVTvhlw9uM759/bv6cH0okzFZF2oyiy8ZKoQCx1QtCqZp50cG/
	UAfxxcxiKtAtWIvJmFcTKXcgQwCocKM9v9Kkewh6YM59ymS/TWUL2XFcW13KFlamWaFw
	KFgsNbe3/SKd7KMpa4TTmno9FmDFgXj+nDokSQl9rrb6HPIDVBV40A0QNeblSS3A8JS+
	dAPaikfmaACZgGEZsUCZq3V9V+QPmxMtRyJrnjenkyjun0OB0wroTj1W4hrSjwS3iFj5
	2WcIZb0Cn1VHwB5R7UM7qPFq6sXnaemZ1uu4Z7eOdoD+mSAcCsiNUsO6MiRRN9W0vIic
	yTOw==
X-Gm-Message-State: APzg51AY/fp4IN8992jXPD/Yn5qp5hSsvvPIiPKbk0rVC3jF1o2SvbQQ
	icpzCPlpSyoqIBjwQJex5DxNaLb3mwo=
X-Received: by 2002:a62:f909:: with SMTP id o9-v6mr27332pfh.141.1535085610591; 
	Thu, 23 Aug 2018 21:40:10 -0700 (PDT)
Received: from cloudburst.twiddle.net
	(50-200-230-211-static.hfc.comcastbusiness.net. [50.200.230.211])
	by smtp.gmail.com with ESMTPSA id
	v19-v6sm19894973pgn.94.2018.08.23.21.40.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 21:40:09 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180814144436.679-1-peter.maydell@linaro.org>
	<20180814144436.679-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <123be298-4a05-773f-dbb3-cd36ed275d12@linaro.org>
Date: Thu, 23 Aug 2018 21:40:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180814144436.679-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 5/8] hw/display/bcm2835_fb:
 Abstract out calculation of pitch, size
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
X-TUID: ITvw4T5Oputn

On 08/14/2018 07:44 AM, Peter Maydell wrote:
> Abstract out the calculation of the pitch and size of the
> framebuffer into functions that operate on the BCM2835FBConfig
> struct -- these are about to get a little more complicated
> when we add support for virtual and physical sizes differing.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/display/bcm2835_fb.h | 22 ++++++++++++++++++++++
>  hw/display/bcm2835_fb.c         |  6 +++---
>  hw/misc/bcm2835_property.c      |  4 ++--
>  3 files changed, 27 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

