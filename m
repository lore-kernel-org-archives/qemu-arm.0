Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp4837876wrx;
        Wed, 20 Feb 2019 10:13:02 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZrOxn6lhnDvN99hqDwhwZulFkqQykHWFd59Sj0ygqy/EBgRHi5V1Z9naZVQp52vAIRVg3M
X-Received: by 2002:a0d:fe82:: with SMTP id o124mr29130416ywf.372.1550686382089;
        Wed, 20 Feb 2019 10:13:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550686382; cv=none;
        d=google.com; s=arc-20160816;
        b=OXJ4k6N7zQ4ndaVeLTEBs78qW2Ju4OxOZgaI3YXbHFkbAu/g2hxfBEWcjt/PKZKL3f
         gGSdNUm0beMYFOSFfNP7kJhetU3ctOiYGqXgAwW2EzFQWXpXhKux0z2kFLX1EFe7J3uV
         UuxrevNWopjQfa0Kz+RV9nj2GwYFhRv3KwQtAf3BiOWa5cqBR7sA5w/N3uJBS8eLU569
         Szaw9y1YtQtVHAbwIDSnvAAhNCVrIfW5g78sXHazmZ3ACQLVmBf88knOM2lm4Zyn2sg9
         gF2wtKmDfT5qPThzHB481l7WeCnWUKDqnnx+fRMGUbQQs11lWbkp+2AY14h2bDNivIAk
         AXWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=OVudVrsi3RBZBIUCYM0VgWNHIdSLyyUc8N8iPcp9qUA=;
        b=qWkpuUbbA7y7eesabPrB+n1lrU9OR0ea1lePuktrvDDlF9YhVRJ5hPO6sq96luxVCv
         9lwSgrNjq1CwtdI9g2sWNbTt/m94C38RJO0POLWK0bFsv5czlnAs0X3Viadl1OCjbGNA
         6aWoBn7jSJ3R9SZLY3z8ZVWlNmjKSyiFNKn7nFGp8r4QvM34o0AjVZHI6pAbZ0xjDydr
         qeTpiCEq1DPFJvUU+rAYHmFw3YKCtbk49f2Enqwu0wp/EpdKUv2WAs2hKuiAIFvcEcCP
         SOiS+5idjm61dceUQyEZLEslwHB+3AomgrjXxyOFkBbZZQ+kDkRypoDh/XNL1dQrDwl2
         JI5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lC15B+5W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q6si11628548ywq.199.2019.02.20.10.13.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Feb 2019 10:13:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lC15B+5W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:45140 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gwWMf-0000CX-Hr
	for alex.bennee@linaro.org; Wed, 20 Feb 2019 13:13:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56409)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gwWFB-0002ZU-S6
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 13:05:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gwWF9-0005iU-Lp
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 13:05:17 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:43038)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gwWF8-0005he-27
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 13:05:14 -0500
Received: by mail-pf1-x443.google.com with SMTP id q17so12275929pfh.10
	for <qemu-arm@nongnu.org>; Wed, 20 Feb 2019 10:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=OVudVrsi3RBZBIUCYM0VgWNHIdSLyyUc8N8iPcp9qUA=;
	b=lC15B+5Wf5doJDNdqWB7cSdgs7JOizhbqADzH2GWIxp6Ivya7+FN3l2xTWIQ0cbqIY
	zjvU5RjMy2C34hwouMo1OZtFH2WKTnpJt6WJxq6vjfgfUU8p9tSqLi5A5O1h6Pk3FnVX
	rhd1ggRKEj8uFqxmV2A+FuCNA1DpNF7UiLmJ++Og8vmu4Qhz1GfVKJoq7nWraLoe7c8l
	MQd/+N7TO+2BjV1WCXHTA/71d04vRvoc45tavC9xfGu2Ue0fw5NGoc3G0UVvPgC+EL6A
	SFh0EFfUFHlROhER481EvsY10gKxKdwi4yDmnhq7jD7mTUShg4+jEUQgDU/N0R6aBdlL
	yrDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=OVudVrsi3RBZBIUCYM0VgWNHIdSLyyUc8N8iPcp9qUA=;
	b=A3lvKy0A5O/3kERAcuiAgcZF0nGSmIUqu47TYxppvRGjdJv1f0+R51O96r0GAMlG49
	lM8RU56YDeX1RMsE/C+nPlPNGTHlkuThN0ajGvkfhesbW/Su5Nkfv0BAXmQQtwzEysiB
	p6xYP5C2ZWXSiaDMGgK/5anm+YPPuDXVXWuVOUi4bMFRaFDzV1svH7immWdzcnAwtLOD
	KzPwct6g2IBjODLUUACL3P9GkciuQFXS8DTtTh19v4H+RApd3hdxIDj9Bgm4oj79hLmV
	CHGgZKEAJTKzVi57/qzlWPuIZC2uROZz1FbFep4guVXFc+Rt0YGmA464xFzpTOZd7WvJ
	WK+Q==
X-Gm-Message-State: AHQUAuaKSsfRKFy4ZTEgPKZEYkdO0KPR6sBSBxKC7grnpoPneEA7OED4
	Jujkr9N+X/ir9bpUJxR5YnEeYw==
X-Received: by 2002:a65:6259:: with SMTP id q25mr3035347pgv.235.1550685912746; 
	Wed, 20 Feb 2019 10:05:12 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	y72sm31304025pfa.98.2019.02.20.10.05.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Feb 2019 10:05:12 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190219125808.25174-1-peter.maydell@linaro.org>
	<20190219125808.25174-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b7ca763d-e441-c1fb-6b66-b70155258ad2@linaro.org>
Date: Wed, 20 Feb 2019 10:05:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190219125808.25174-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/8] hw/arm/armsse: Wire up the
 MHUs
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
X-TUID: ZbF9rq8yXn5j

On 2/19/19 4:58 AM, Peter Maydell wrote:
> Create and connect the MHUs in the SSE-200.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/armsse.h |  3 ++-
>  hw/arm/armsse.c         | 40 ++++++++++++++++++++++++++++++----------
>  2 files changed, 32 insertions(+), 11 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +        /*
> +         * An SSE-200 with only one CPU should have only one MHU created,
> +         * with the region where the second MHU usually is being RAZ/WI.
> +         * We don't implement that SSE-200 config; if we want to support
> +         * it then this code needs to be enhanced to handle creating the
> +         * RAZ/WI region instead of the second MHU.
> +         */
> +        assert(info->num_cpus > 1);
> +
> +        for (i = 0; i < ARRAY_SIZE(s->mhu); i++) {

Nit: x > 1 is probably better as x == ARRAY_SIZE(s->mhu).


r~
