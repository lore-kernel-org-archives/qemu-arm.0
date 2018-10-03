Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp35586wrt;
        Wed, 3 Oct 2018 13:13:03 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62Dw7NS8OdU8jxtWRAvDjpLKbSUoPYCYQm/jyYjXRNRcUTkMmKnKuewWdXSzrnS46v5I2PQ
X-Received: by 2002:a0c:9842:: with SMTP id e2-v6mr2725633qvd.185.1538597583415;
        Wed, 03 Oct 2018 13:13:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538597583; cv=none;
        d=google.com; s=arc-20160816;
        b=jd0F0BiYpyn5DS4OhtlFdZ1Fxo6M8qtOzb8CWEbiQh1NY8r7VbxNcVS/3k2eQC2T1X
         yijhYrqAqDELLcXckmzNn4nIel9FTWyeFl3rZBvR4ZoeHVdt0txB0xCg1S6nwOU3VWup
         P/qJw1/PBfyKf90pAzXUGyeEnEB9Jsegnk01ppUNzUlgm/TD7TK0EGfIkXD9rMk+us1x
         wm3YeJIhp4N3Le13Pfmfd7HTujxcD7VhS0PWmiYpXXObS/Mf4S0MbaX2CARQtJlcPjZm
         t+/K1pv1KRi1MS0VhcA7lncVbOVJDdhIyk5BCUxWmdbJGhGr9ZLN9epObgSf73wD0rmb
         D8Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=UXrCqWMnPEbMt6qoMudKqWBToC6+8cjd+DG0vWvSV5o=;
        b=i3o1SCbmQ+xW9Yu//lc7CeEhJaNwBGzTuS9pph3lIUK6x122xPO+aLWS4gXQG2IGZ6
         32MFV+kcPuRycNYxCEis9ISQGgJ/+xXdYhYLwB6NMZfpgjPEDvDOeG9JlfvC/biNv1BP
         xcYYGFQ7yF/vs9fMaDwOJ7iiK2sq28bRsVEGTTE2ytbkjnx8tr0wbp8wWaGd230BjitC
         a4UstVgx8/Wq4yywrSC9Zq6FviJ3+vHztrAtgs3i2wk9peFAto2cC3zdNLTOzRhUwSbw
         zhCZiMmunMlgIr4wczIIlnBDFq3ugOwiXBgmxF/DmtRHTs8m3Rz+W9FhyFdj7BDOluqF
         8k4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DJiWb0Eh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 20-v6si1583883qkn.274.2018.10.03.13.13.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Oct 2018 13:13:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DJiWb0Eh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52843 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7nW2-0001xB-U6
	for alex.bennee@linaro.org; Wed, 03 Oct 2018 16:13:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44712)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1g7nVu-0001x0-Q8
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 16:12:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1g7nVp-0002aF-91
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 16:12:53 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:40676)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1g7nVo-0002ZB-Iq
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 16:12:48 -0400
Received: by mail-ot1-x344.google.com with SMTP id w67so6866414ota.7
	for <qemu-arm@nongnu.org>; Wed, 03 Oct 2018 13:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=UXrCqWMnPEbMt6qoMudKqWBToC6+8cjd+DG0vWvSV5o=;
	b=DJiWb0Ehj4pEoxS4fFvOItQRm1gj+P06vWZ0pV2ogNfNY/934Sw7dG3gvgtc757MUc
	dFaqDt0CY8sj7WTvI5sGDDuOIRzsOiyFG3fPTlO7upnGPSlSOF4dvPCwOnZOmhXGxFqG
	wEin6f2DTZBBOzjuFVhgi4RmQU9kAdKV71gw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=UXrCqWMnPEbMt6qoMudKqWBToC6+8cjd+DG0vWvSV5o=;
	b=edlB5YX5lk9kdsanwF12q/sUL4933zqYtMVuRlcrgvTSqrUgYH7B9Vyh++QaND+nui
	UxpHvSEKBzaVS2k4nNG4YRVUjUjrnAvStU7znwAUu1H5h+BdGk6RB/D/fq/B80hXY6No
	4hz5TOtIggxDO94wDbSMkVEheygTzwLrJa4ZrvKcFBOn/C7gFBP12OZFRF89Xa7v4CQS
	ZAkjDpGbYfZkw9Q2nnUvJpnQ6og0gLe6hz96TCcnizClDOJlneo8i52FNC0payR/bflB
	MpOZQXn5VGArBZAkEN25Pz36Xqr+W//yn1GQTaFZamjGue+yqJRcEkYR7+Zd+o55tKe3
	8G6w==
X-Gm-Message-State: ABuFfoiBfAr/So7EvR8oRBjoZ6wEyqyng/seiV6qCr9GF6ql0u7JKq+d
	n3HbNsygxCaZpiQXZMeMN0yEnJlzAHWv0Q==
X-Received: by 2002:a9d:5225:: with SMTP id e37mr722002oth.336.1538597566983; 
	Wed, 03 Oct 2018 13:12:46 -0700 (PDT)
Received: from cloudburst.twiddle.net ([187.217.227.243])
	by smtp.gmail.com with ESMTPSA id
	j79-v6sm1250844oiy.13.2018.10.03.13.12.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 13:12:45 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181002163556.10279-1-peter.maydell@linaro.org>
	<20181002163556.10279-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <e0893e12-5c6e-8d4f-55ae-bc9b5ada9c2f@linaro.org>
Date: Wed, 3 Oct 2018 15:12:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181002163556.10279-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 06/13] target/arm: Add v8M stack
 checks on exception entry
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
X-TUID: lF6Hmw8KMRsZ

On 10/2/18 11:35 AM, Peter Maydell wrote:
> Add checks for breaches of the v8M stack limit when the
> stack pointer is decremented to push the exception frame
> for exception entry.
> 
> Note that the exception-entry case is unique in that the
> stack pointer is updated to be the limit value if the limit
> is hit (per rule R_ZLZG).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 54 ++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 46 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


