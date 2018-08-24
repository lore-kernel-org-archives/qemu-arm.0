Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1909545wrd;
        Thu, 23 Aug 2018 21:38:00 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZrdqO3P84wnFJvKCv92+P2H5eXdOYNrnCBagXnsAr5mRsk2oDKbNrRzQX8mCmY1UhfKNIO
X-Received: by 2002:a37:3508:: with SMTP id c8-v6mr28489qka.352.1535085480851;
        Thu, 23 Aug 2018 21:38:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535085480; cv=none;
        d=google.com; s=arc-20160816;
        b=aSpoHtcQuuUMF69p5C4ez0tSJWYlEbhmAT71bEBJp82Feo3EUM2Qb1ei1BpF7C3zfO
         nMZehOmosQVDrJ/96SxNjt/iqnUcAJpcDJDkWgM1sPFlsKiSM+h1atqB+/9tGzy7fXbO
         iepNiQJ3jylKfb2muf98fCnZfZAmpkyBZk0cKwL2sFqRyqavyXHvju83RGV03n/6DtsJ
         E95qNH0kLWPPpW1pWWxSG/LpVL7t89ZUP6esGxpg9pugR9SadCx6PPMviq/3Z/en3OVM
         KJtwFOzj6Pu+IoXxpg6ZPWU+qnzLxmhRy4b5tGPFRqElUDzHJ6M/ysZl33ba7aumIaxf
         NeDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=rGKGeZvH6JV0Bvjau+KlUt8/KH3Xfz21flOGAWOd0co=;
        b=l6prz3A87UOnKtnFC5QOJnhJQ03y2N3Ew3VIB4ZwwmMsZx2+ZBxh2uWybFiyObuO0j
         EMmq1lKbItTFIJUgy7dg7AsDlj4BIfVWTdcTs3/kPypzsKhnMBRG6kdnEdUQcH6JnK+U
         TDCn5F8eYSKZJjZE3nw4ES2pkZfyaBOI4MLs3Jdg8ZvbggZR9HvDRocf6Se9Mzc5qFci
         +v0x4zvdYH7D2g/BtvvZVAKxvVgrRl/Rkaa8eqnhX3TsHhEMHMnfvPRl6kUe5l8T7Bat
         UQmtyuEsanNQPovLRBpqnGGIAviQ4TVSwoh2oVLgl3ElRx+iAFLLgB1X+KuSaU4VowK2
         jgkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PvfekIRy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c29-v6si6695063qvh.13.2018.08.23.21.38.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Aug 2018 21:38:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PvfekIRy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39826 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ft3rE-0001o2-Ae
	for alex.bennee@linaro.org; Fri, 24 Aug 2018 00:38:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45578)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ft3qx-0001mF-Kg
	for qemu-arm@nongnu.org; Fri, 24 Aug 2018 00:37:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ft3qw-0000iL-K2
	for qemu-arm@nongnu.org; Fri, 24 Aug 2018 00:37:43 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:46009)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ft3qw-0000hf-CH
	for qemu-arm@nongnu.org; Fri, 24 Aug 2018 00:37:42 -0400
Received: by mail-pl1-x644.google.com with SMTP id j8-v6so545766pll.12
	for <qemu-arm@nongnu.org>; Thu, 23 Aug 2018 21:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=rGKGeZvH6JV0Bvjau+KlUt8/KH3Xfz21flOGAWOd0co=;
	b=PvfekIRySQVCtHGmZtMfYmM50L8VA7eZ8m0dl+jviOzMc3sxyDoayTLn8AGWNuColP
	i8zQXu/dcTMeqbOhSh5xJO4gr8T5roumeI5o1fNxUkfRkn0Xgaqv1ySJ2VO8FiGh1YzI
	+6Hw+Ndg/H7uJAVhcoo41yaqgThoWMf4Q+S0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=rGKGeZvH6JV0Bvjau+KlUt8/KH3Xfz21flOGAWOd0co=;
	b=Zap4QPHcMUWmnIhn1V3DSb33PMeZ1rU7cAUgrO/qHBUaS3lBQffhY+QMoLuI9krUm7
	DHeih3cclMd0mYlq9EXDRztySOhVkOPWUvIa9fX6zjBDrlSYAKOQDW+cBIkjgALj3pg4
	9To1+XgZ+9GX+WUzGsDURzMMohjAtplOJKS3uQvelVs1XsGtp39FzaQP83LwXRCQqitQ
	FmG2GJ0pFXIyPGWgffnXVJRUBxJd0YWTom3VXR/qvz08ARUzSviMvuGGHwQajQcwk32c
	V9c7/84jud807eyQXZm/aiUoL+p1l9yvVS0z8qc7Iuy3PjLkILHpfq7+SV8Ahiw4NkB0
	xiqg==
X-Gm-Message-State: APzg51Cl8ttNEPsjXHVSjpeLCWhYkv6pcPMPiZV36mJURDsXLZEhlqjI
	6wcSeCBMyM66J9/oqqTVkhkvFw==
X-Received: by 2002:a17:902:4403:: with SMTP id
	k3-v6mr13649pld.243.1535085461376; 
	Thu, 23 Aug 2018 21:37:41 -0700 (PDT)
Received: from cloudburst.twiddle.net
	(50-200-230-211-static.hfc.comcastbusiness.net. [50.200.230.211])
	by smtp.gmail.com with ESMTPSA id
	u9-v6sm8572938pfi.104.2018.08.23.21.37.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 21:37:40 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180814144436.679-1-peter.maydell@linaro.org>
	<20180814144436.679-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <02db2056-e67d-f7d2-9766-8bf6d56b0d50@linaro.org>
Date: Thu, 23 Aug 2018 21:37:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180814144436.679-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/8] hw/display/bcm2835_fb: Drop
 unused size and pitch fields
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
X-TUID: lk6cQUSJkwAW

On 08/14/2018 07:44 AM, Peter Maydell wrote:
> The BCM2835FBState struct has a 'pitch' field which is a
> cached copy of xres * (bpp >> 3), and a 'size' field which is
> a cached copy of pitch * yres. However we don't actually do
> anything with these fields; delete them. We retain the
> now-unused slots in the VMState struct for migration
> compatibility.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/display/bcm2835_fb.h |  4 ----
>  hw/display/bcm2835_fb.c         | 19 ++++++++-----------
>  2 files changed, 8 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

