Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp356739wrg;
        Fri, 7 Jun 2019 09:03:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwm4bFQ4XkAhpHXWRSS/SWjSFcJ2/2gyO67KSkLhLcezMPUCjzrYMsIp5fB7fCSdEI22dLg
X-Received: by 2002:a05:620a:13b9:: with SMTP id m25mr25383768qki.246.1559923436446;
        Fri, 07 Jun 2019 09:03:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559923436; cv=none;
        d=google.com; s=arc-20160816;
        b=xz/KxFenaWVIshFhZl7rMhxuhLW4Qx2Oig/2IC+5Q519mzXyv76fTYJK9OQoMlg7Wm
         xPMmdYMyYN8P64+8dvi9K8ErZy8IzmTm8hzK7/RVVVFVd1P/KJpMTnFeZKjGtPWedf4s
         Rs2SkcaEv+ijh+bEQIE5DWNn25DYy0KifIeWiQbx+3sK6fkwzhatUcHqO34Fea0u+9+l
         qC+rGlPbzjXJxtn3Okt6NKqP/Kkcb8B0jnlcThK/kl2q9QwIz1nPBzVBEOVhT1lDoCJw
         o9E/ecuxRN3sUtrypA2eDefb9pYdOAAzx8hHs9NdZ59M8sEibf70/xxA3tG1PjBILTsT
         Z1aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=WILb82+ZMb6oXiXXQ/1X3V8uKxg2rHMLbJZJlZqK+TY=;
        b=La/U8y0G8PqNIv93MDCmPa5p97Ca/yzfes7Mz3jsbNEcTEklUQzYB6mnWrB2uRe/wL
         8eqc5puclD3Q/4H779zLVG9UUI1VPwBNPbwuXOp2UZSNSOhURnIMRzJ7UiHDrOKGVvPz
         qHRtp6kHMu5q0aPopCqRchnVSDK05Q2I9EvYWq91HtyxhTn2qQDqVcvQ29OhCcnkZ/zY
         F6mjbKzqp/M0KXNSGM9AgAX7yANoCX029Inp7le5wuYaDsQIemzgNO7WFz3J04JQ8ezT
         L/kxZ5cuwiJ8WPBK7noMCVkk9O/mxtjp9KB1los5g6CYhnc/9SOaPDjwzPWMq5RRZJ2I
         K05g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HMKBUAbp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m13si1446743qkk.222.2019.06.07.09.03.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jun 2019 09:03:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HMKBUAbp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49138 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZHLP-0002qK-Ux
	for alex.bennee@linaro.org; Fri, 07 Jun 2019 12:03:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41334)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZGHf-0006G3-1y
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 10:56:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZGHe-0008QI-5i
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 10:55:58 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:45545)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZGHd-0008OU-Vz
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 10:55:58 -0400
Received: by mail-ot1-x342.google.com with SMTP id n2so2071865otl.12
 for <qemu-devel@nongnu.org>; Fri, 07 Jun 2019 07:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WILb82+ZMb6oXiXXQ/1X3V8uKxg2rHMLbJZJlZqK+TY=;
 b=HMKBUAbp5BE0R1mEYQK0wBOWsUW6zD+gTencUxJm0C+w2Jy4ecsOXflGonuCn9g1qF
 ERePWQ4d0QPNcFmZ0jZs0p+V0PxmXTI2HOLZgtOuApJdj2sCDv/OCD6UeRq9+3JtVDIm
 AfsUPwaoKQO7oLTesfyrE9o/Ot4LTAVsk9j2Tp7wmlGLcgbcxrdU36wcC+qd3yOgAxl3
 xAaAvmS1aoQJlDpKddtxxOnx1c94n/nYUSqb7qnkXIVYB3/W7Ii9zSrZECpAk3r0UaZt
 60BpdKUxpyXeC62LS8l4qSVqjjBtXVhGKgcqMm9w17NHaALK/HsBSllaArV6yDf6dMSx
 tWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WILb82+ZMb6oXiXXQ/1X3V8uKxg2rHMLbJZJlZqK+TY=;
 b=G9uGbv9P+PX4tz9jlWOZhQWsYmPXukDcWZvdzySl3eO88prC2ZGvAypjLjGZdt+gEp
 mU93dK4KzoD3E4PpnvV/jZARB9ojk6QS0sSU99LJ/uQGx5fwdLsv3ECXcJUppnamE0vb
 zfbWfSYpsBosW5UcjK6iuOUEqRdEQJagLmuQfA9EEc+Ud9LwhY/hX+jVCxbM049p2r8u
 g6YrWc6WW7I65Jz5u7ubyR4y2ZhMKQQTWfrdqK+LAXTO0gnkzm5KTB4Di8lKKNqQ3LWk
 IPiEeaq2qjEFyy6U08LJ4e9tZu0xpjmTx/EafhnXAJAoDSocV/XireK0zq3lTkhmxLY+
 YI3Q==
X-Gm-Message-State: APjAAAVF+m52EK06K+9VDMmdHdM0DaAVPsK+P2nqswj9d4knHT66akvi
 6O7L4YL3KDb6mOBU5wx1aboMIqNx0Y4jCw==
X-Received: by 2002:a9d:6b98:: with SMTP id b24mr19207734otq.189.1559919356833; 
 Fri, 07 Jun 2019 07:55:56 -0700 (PDT)
Received: from [192.168.3.43] (200-56-192-86-cable.cybercable.net.mx.
 [200.56.192.86])
 by smtp.gmail.com with ESMTPSA id l31sm851663otc.30.2019.06.07.07.55.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Jun 2019 07:55:56 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <9f3cba01-31fc-3acc-39df-36a38c323931@linaro.org>
Date: Fri, 7 Jun 2019 09:55:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [PATCH 07/42] target/arm: Convert VMINNM,
 VMAXNM to decodetree
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OJBneQi1qOu8

On 6/6/19 12:45 PM, Peter Maydell wrote:
> Convert the VMINNM and VMAXNM instructions to decodetree.
> As with VSEL, we leave the trans_VMINMAXNM() function
> in translate.c for the moment.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c       | 41 ++++++++++++++++++++++++------------
>  target/arm/vfp-uncond.decode |  5 +++++
>  2 files changed, 33 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

