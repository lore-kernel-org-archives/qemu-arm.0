Received: by 10.28.71.27 with SMTP id u27csp1398058wma;
        Fri, 9 Feb 2018 13:09:16 -0800 (PST)
X-Google-Smtp-Source: AH8x2263QVoX3LrQ4+FRjf3B2oBGTLXe7Mu95W0iPBXP7JrX8WGCJfcc6i5jC8Zb+N8KUUkYab86
X-Received: by 10.129.82.215 with SMTP id g206mr2010073ywb.487.1518210556265;
        Fri, 09 Feb 2018 13:09:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518210556; cv=none;
        d=google.com; s=arc-20160816;
        b=UEqpo5ILMZUhE06uJmc4FHu301Fe3Twgh2x8yNZDreYzamWULyVE8fbxKEq8c3AK8R
         mG2ykq7AKIpxphqLVqz3HHyUYSyNXXc5tJEF4XSXI3u3NwDYUwY71/cXACvLhToSDCyP
         aK3v+SpFGsIqRte+q1YCAw+G5g7DfIHKyjYxAd1eHP7vFqFEPp181q7M+6WBRZA1tkSG
         GszB+l1rz2kN10N+0fsOQKDdyvpWgNgWmXUotaEkIliwZr9Nnyvz/fabyarIfrgXmWeM
         ncVe4iekOvcV1r84sTCF03Ey4pohTPXCDEGwu06daawOAgzxW8x1lhF6XR7XrIUwE64v
         FeTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=lQ5lKuVOWTdDv1g5RVo7JCzk8Rm8cfjcwYLyRD5uf84=;
        b=Ba08LN0s2mBr8mIC6NcqQ0t7XSlqHewvCP3zPLM53DcwIOjA8UrXWb1SZXavyBW07V
         M/40BpWy2+BV3rFQD1HkSbbiiS+IkIpq5qQuPkPEvwwKuIdTn5WZOfdvWZNsPREchEyk
         +GedhcNW8B4e0vG9C/uTJEAUa8pvhRsR3Tk0N/pWns4oG5evT3oYcOxfye3lZ3vDA/13
         CkJxbDMpqHR3sTXa1sF7wADnXDaXiozVkDAtuVLH6GoobaP8hik7BDXPCgByWffljWxD
         J6IR5o6CBWzSUjUQLl8bHlaFoswP1/DSWvbMLDWcoPnHOei/IS+DGvmc2m5L1GsWS5E6
         XOaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RusjMzrh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a17si553916ybh.96.2018.02.09.13.09.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 13:09:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RusjMzrh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42271 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekFv1-0003cR-N5
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 16:09:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45180)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekFup-0003bE-0S
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 16:09:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekFul-0004jl-RE
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 16:09:02 -0500
Received: from mail-pg0-x22d.google.com ([2607:f8b0:400e:c05::22d]:36936)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ekFul-0004jT-Jj
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 16:08:59 -0500
Received: by mail-pg0-x22d.google.com with SMTP id o1so4417160pgn.4
	for <qemu-arm@nongnu.org>; Fri, 09 Feb 2018 13:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=lQ5lKuVOWTdDv1g5RVo7JCzk8Rm8cfjcwYLyRD5uf84=;
	b=RusjMzrhTAKixCbCBDYvdVvgZOU54RI6OLYN5JADqMuOSw+Puzm8zF0QyquN78uf4T
	AVIvJ5QM5gT7KOsRks541pPDCO6ipf66rZB0oq9SitAC/CTqR84i+mrfTokJwZDkiSO4
	/ali0FX3KC9ejk/kMAjzp9TB9Pf7M+EGcU86o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=lQ5lKuVOWTdDv1g5RVo7JCzk8Rm8cfjcwYLyRD5uf84=;
	b=XGTgAPQu7+i0u+ooz69+FlC3+1AcrE4sgxn8VyFy5mOiffz4k6SwjRJcNnWvAC9bo6
	dg/+aJoQvuQJ6FnKZLpbkJoQdLJsURTRnFgMljLXkHZadaj7phjOvpSX1Z9hLvvFx/kH
	umKG3uHTY4c+JWfNZQZueJH/UzXMfvIRC++MUakpvFy9+8vedd1gPGtmXAb7QMJiMtkq
	UsgtoitjWizpY1CDoaPwNpEvN8UbMUTEz6FQWu1h+9/DVCNLWWTEu009qPHx7Hjdaecx
	imNwM9RYF9wSb7ZGD4eYYeZ79E+kmUs4rvJfniJIGePW6A8XzyT5Sq+5TTYy/Hwl/9V+
	hROw==
X-Gm-Message-State: APf1xPAG8Q+j9koys/8Uu/4/ep2o7Oqh3l6aE3SZHN+O4B61yfWxqSD7
	hdIBsLt2Kf2Q8ano0YTNEichDA==
X-Received: by 10.99.110.10 with SMTP id j10mr3336802pgc.72.1518210538444;
	Fri, 09 Feb 2018 13:08:58 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net.
	[174.21.6.47]) by smtp.gmail.com with ESMTPSA id
	p189sm3890029pfg.186.2018.02.09.13.08.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Feb 2018 13:08:57 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180209165810.6668-1-peter.maydell@linaro.org>
	<20180209165810.6668-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <754213bf-131e-546e-a0ac-edf4c77b2e3a@linaro.org>
Date: Fri, 9 Feb 2018 13:08:55 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180209165810.6668-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22d
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 07/11] target/arm: Implement
 writing to CONTROL_NS for v8M
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
X-TUID: TP8KUyok4KHZ

On 02/09/2018 08:58 AM, Peter Maydell wrote:
> In commit 50f11062d4c896 we added support for MSR/MRS access
> to the NS banked special registers, but we forgot to implement
> the support for writing to CONTROL_NS. Correct the omission.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

