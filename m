Received: by 10.223.161.27 with SMTP id o27csp1978941wro;
        Thu, 2 Nov 2017 04:44:09 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+TxpYZuXoJefVTZTWdRQTgRdpsuW8x8J/gQ1zlyjGQBmKIcgJd9dMussUQNXmTM19rW38QX
X-Received: by 10.37.28.65 with SMTP id c62mr2050007ybc.301.1509623049140;
        Thu, 02 Nov 2017 04:44:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509623049; cv=none;
        d=google.com; s=arc-20160816;
        b=qgVsSOIAEisS2AfxM0boUvdwnNQ0lFgofz2cFswQcuKeRA4mkzhFeIxDs+8jKfT2jK
         Tv2jx57QmRnyA55wK42yJX/W71yJarzzAbV/8zeja5+vmdEeQ6RqUarmVG42I1ogUEz4
         N83eovv8h1lIpTSkpyyk8DwNxlEfokDhlglIHwnGg658w5T+Xr9EKhfDGznXYmVz7+D1
         ac6Wdc8aPqILHItEarAyYgTiWdAM6bthY4M1DTWGv826g9uwod/M9LBSzK37wb7mg5nu
         U4nnT5JwiGDxgvwWpwcxfB9MpYf5asaolrsQo4//Q/Xk/MkLC86dr3PXOudgAcnbJNVu
         0sdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=qPJ5ZNWR69F8MgLeEs4jbus2+i9UAPfc8fmYnoSFjyU=;
        b=nrILZCqJwqnySfPRBldQG4LWzlunxJI3sR/GqoVQNfNe1eJVUhySBoNw7mMUNlb2DM
         P1mOQEM2MmoHGSLUHUFDzd0212cSsw/2D3ophIjuWpNpYit/biTE0Ft4n7HaG34JfhIb
         VsKLbT1wXYM1h8T2Z1LrW4za0sWw/gj1twH2uSmbMLKNiuRDkNSOnJhv0HtmPLBxdJQD
         RjGjgijUMJ1DpTPE4cj2vzsWJbAK8hVukFvb1HXUEk8K6CRFvfcFWK/QFLc9ihAbIa/f
         45rdhyySGrfk8hh/48hysph21dngLKQ8LJGAiBetvRYZfmbvAXVbGYBX4LMhgKMELQon
         8P5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LRY1i0nn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a204si724739yba.429.2017.11.02.04.44.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Nov 2017 04:44:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LRY1i0nn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59760 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eADuq-0001AY-Gy
	for alex.bennee@linaro.org; Thu, 02 Nov 2017 07:44:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48287)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eADud-00018b-46
	for qemu-arm@nongnu.org; Thu, 02 Nov 2017 07:43:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eADuZ-00049m-75
	for qemu-arm@nongnu.org; Thu, 02 Nov 2017 07:43:55 -0400
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:53045)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eADuZ-00048W-17
	for qemu-arm@nongnu.org; Thu, 02 Nov 2017 07:43:51 -0400
Received: by mail-wm0-x242.google.com with SMTP id t139so10759845wmt.1
	for <qemu-arm@nongnu.org>; Thu, 02 Nov 2017 04:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=qPJ5ZNWR69F8MgLeEs4jbus2+i9UAPfc8fmYnoSFjyU=;
	b=LRY1i0nnnSuUE2F199ifC0tiMUb4WEwb77/6AA4M4eadqxUsKaf1oEGCH2dbxsT8+R
	S7rPmvIFeTjVlq978eckizI9l9pN81y5vvc/YtO5gJk1fpBWeeO7HVlCXXxWwnGfbhRc
	+cGqOoG84R7Wcrdxz0gIBCGHYQZE+CSzxMdHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=qPJ5ZNWR69F8MgLeEs4jbus2+i9UAPfc8fmYnoSFjyU=;
	b=tymEBzNrmhFRuZX4obnGiOCoGJDhRy9gVwCIRgsGKIMYtRQHszcExH++kY/tzUPX3m
	eDfVMUxex+SzZX9eS8j2EsJP3tWqr31tbIzBmiQ+hvBqzhOxIHd/LjCBJYE2Ha/H+PaE
	nz/yP6U74esgm05YoTCBI67lXFfMB5tD5oXfbKvsRlmjU+SedHv2HRMM7G+HompSVeoH
	MopV9R6A2ryMA2/W/OaiQ1cRms1N4LGd7bMdE1hfXnmyhWrLHM9V/3zkP6FlszG8X8D/
	yyfV027eq5z2eBJKlfbk3hOauo/x/1VEKXFqUxXNNSAoeu0zGTKDl0bPpbuzoQmOfQOg
	RQmw==
X-Gm-Message-State: AMCzsaX5OEquTccc8rQYyHH3AlK/1Sq2rnpI/4cp+Drzwn3WZtUZFXzz
	bXXeU82TQOHI9iiKdg7EjzkGlA==
X-Received: by 10.80.174.193 with SMTP id f1mr4144050edd.207.1509623029601;
	Thu, 02 Nov 2017 04:43:49 -0700 (PDT)
Received: from cloudburst.twiddle.net (p5DCBCAA6.dip0.t-ipconnect.de.
	[93.203.202.166]) by smtp.gmail.com with ESMTPSA id
	j22sm3263653eda.96.2017.11.02.04.43.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Nov 2017 04:43:48 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1509622400-13351-1-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <aa20fe35-6c76-3194-d633-cae8d2a6116f@linaro.org>
Date: Thu, 2 Nov 2017 12:43:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1509622400-13351-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
Subject: Re: [Qemu-arm] [PATCH v2] translate.c: Fix usermode big-endian
 AArch32 LDREXD and STREXD
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
Cc: christophe.lyon@linaro.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aXC5QGGzzvgH

On 11/02/2017 12:33 PM, Peter Maydell wrote:
> For AArch32 LDREXD and STREXD, architecturally the 32-bit word at the
> lowest address is always Rt and the one at addr+4 is Rt2, even if the
> CPU is big-endian. Our implementation does these with a single
> 64-bit store, so if we're big-endian then we need to put the two
> 32-bit halves together in the opposite order to little-endian,
> so that they end up in the right places. We were trying to do
> this with the gen_aa32_frob64() function, but that is not correct
> for the usermode emulator, because there there is a distinction
> between "load a 64 bit value" (which does a BE 64-bit access
> and doesn't need swapping) and "load two 32 bit values as one
> 64 bit access" (where we still need to do the swapping, like
> system mode BE32).
> 
> Fixes: https://bugs.launchpad.net/qemu/+bug/1725267
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Changes v1->v2:
>  * use correct "s->be_data == MO_BE" check for bigendian
>  * don't mangle the data from the atomic-cmpxchg before
>    comparing against expected value
>  * tcg_temp_free() the TCGv from gen_aa32_addr()
>  * name that TCGv "taddr" rather than "a"...

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
