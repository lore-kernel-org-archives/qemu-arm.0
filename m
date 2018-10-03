Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp43833wrt;
        Wed, 3 Oct 2018 13:22:40 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63R6ksiuq7G0H3IHLdELUsmjzzKiqsGln9SbdREtXK8mkrimhYtHPBbo/cpsR1PYsuh4awv
X-Received: by 2002:aed:2259:: with SMTP id o25-v6mr2732810qtc.13.1538598160325;
        Wed, 03 Oct 2018 13:22:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538598160; cv=none;
        d=google.com; s=arc-20160816;
        b=u80xli30Y/xc/LYaM1h0KIrjXl2nq6nYr1xr7WKqA1in4Ka8BdSxuBxtfwiThx+TWG
         xL063NOlsQE5JsP7WyU/f0m0+JxNZgsuHMHX9dxHZI5qxwapTUTY2EzTBQhqjMHHQLlM
         5HzFMyVTeuKpr8q/s0cKdge/sxpaihYwRVzKuNETsjR7kVmixCScYiLNJ/LqUNcRnQNi
         clTSwoJQ3zr2tE7tTPYm/etjO4G3ud2fm/7VIrsNBULi3UraT0QmGXExeFKPxMObYu3d
         hRjR6OTM6DYD9wLAlKZIVxVf3lx3MPnkpxGQLypUlIM6/FDeWyXl5q6l3QaLwAQ0LPTc
         dcmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=htx1PFHt4IBHD91Mcl6MRoLcPpORAw+qPtWMhVuRl+Q=;
        b=mdnT0FdjG+HAPn45I2K+zXnFoDv0OU4+7XBCT/fgbtvUvPzhFJG56RrOcZ5R5xnpez
         cX0iaNrgmelvpK6WICRz5oeuDvaaVnrK+1LAUXWUQiPzQynVPx3p/UpwfF7lmVwBIZZd
         HMUEG0AlwzWplgi/fOdpMgxd9/vH6mdx4JjcdV5Vpa4HEaR/vv3wWllIcTn00GQO/hYR
         PTSUB0GPqJgj1Z12cghx1thgByDy/9EWu+jWTNvdfbhW2/VYja0e7juyU0KHqPxTjIAQ
         Q8YygpxjeSWHs4MS1pdMRygHd4QKD+DjmX4Jql+eUG79y2vOeGq3gEjUP7/tKUAH9CGh
         vX/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kVG3JI7Z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 3-v6si1505284qth.374.2018.10.03.13.22.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Oct 2018 13:22:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kVG3JI7Z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52998 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7nfL-0007hT-Sm
	for alex.bennee@linaro.org; Wed, 03 Oct 2018 16:22:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49301)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1g7neJ-0007Pg-Lg
	for qemu-devel@nongnu.org; Wed, 03 Oct 2018 16:21:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1g7neI-0007h8-Pg
	for qemu-devel@nongnu.org; Wed, 03 Oct 2018 16:21:35 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:46697)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1g7neI-0007ew-Ft
	for qemu-devel@nongnu.org; Wed, 03 Oct 2018 16:21:34 -0400
Received: by mail-oi1-x242.google.com with SMTP id k64-v6so5620000oia.13
	for <qemu-devel@nongnu.org>; Wed, 03 Oct 2018 13:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=htx1PFHt4IBHD91Mcl6MRoLcPpORAw+qPtWMhVuRl+Q=;
	b=kVG3JI7ZScB9fD+e2VOBsG7T28XBBbaUZJGnWMUwk4oiXZRBuuo4P6nsV/KlhTcNJX
	CA0Is/ZbiZaff56hYQoN/JOrJpoRH9MHOIdXqqCfJLukbZP/N+BkhlN7mdfQmZO6239F
	cd2xaW+z3KwMUuHFqd/9D39wnPVX+2nH+jH4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=htx1PFHt4IBHD91Mcl6MRoLcPpORAw+qPtWMhVuRl+Q=;
	b=VhG/GCJHF6welKmtBepmE2Eed+v08Uirt0lNpdydg8wQGzEJ356KRuZH+iP5Z+yLdd
	ku6EJ0NtOf2n/CxzvqGtVmzcfkPwWgNY8CC2gclBSu1m1yg22/qD3T6b8xtAHJjg90e/
	uk6jOQSBUFjwyzyDOjTnzefMjRjknPWDMKdkbO9+Atu2ppyiJnFhE9is9im4/yoolTbz
	P6JwmRsDyKvfAD5k4J6Fuo14A8J4Jo1+4kuUB7JxKNk17jTVw56OwMhbI+97AxHUl9ND
	Pqaq/1/5Q9HpwQ/ZDY6VVqTfNzUUQImwOMu7aEADB0/1EfPVq/G7VzzEGW+EK4fFq2Qi
	VdaQ==
X-Gm-Message-State: ABuFfog15GlCXSEaqChvNE8kp9kwrzi7gOfMsNa1AavEiUoPFWLkZ3Yd
	k4icCXFl/dEknkncswpxxxk/wA==
X-Received: by 2002:aca:d946:: with SMTP id
	q67-v6mr1624902oig.212.1538598091381; 
	Wed, 03 Oct 2018 13:21:31 -0700 (PDT)
Received: from cloudburst.twiddle.net ([187.217.227.243])
	by smtp.gmail.com with ESMTPSA id
	y63-v6sm828647oia.39.2018.10.03.13.21.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 13:21:30 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181002163556.10279-1-peter.maydell@linaro.org>
	<20181002163556.10279-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <2b521540-984b-7931-8e71-600e504f7d78@linaro.org>
Date: Wed, 3 Oct 2018 15:21:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181002163556.10279-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-devel] [PATCH 12/13] target/arm: Add v8M stack checks for
 VLDM/VSTM
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
X-TUID: 3fw6IL7ooCRh

On 10/2/18 11:35 AM, Peter Maydell wrote:
> Add the v8M stack checks for the VLDM/VSTM
> (aka VPUSH/VPOP) instructions. This code is currently
> unreachable because we haven't yet implemented M profile
> floating point support, but since the change is simple,
> we add it now because otherwise we're likely to forget to
> do it later.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


