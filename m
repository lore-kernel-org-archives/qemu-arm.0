Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp6039007lfc;
        Mon, 15 Feb 2021 16:21:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyl0pMCsoeflbJZuKfG6zXPZoCFh3AgEhNLobChl8vAhDXkWztISyaplo+9NEKgGtsQHaAw
X-Received: by 2002:a25:4902:: with SMTP id w2mr25248370yba.516.1613434862337;
        Mon, 15 Feb 2021 16:21:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613434862; cv=none;
        d=google.com; s=arc-20160816;
        b=QFw91lN0RDU472qE7f3AjDM8fRXZ2/k6LT25AHkyCg5tk+YqAvqQc2JGyKJAz2gN/u
         JxQ9w4UpuFdiXPmxnxOoJs3J1zk1VGVn0Eo6MWeWzx/sQATS+7FmTlY+aV7RT8ibdOXg
         gDQgheNbVSkq+kF6Ap1cj8K6Ys1jE3qzzpsvDenRoPpVk+OQTlNHxG32O1N17EgTwBxh
         ibKeDMYKSI5jRF94Ld3Exv9J9FImK8X6LrqfhiiGBJTOwEJnREdRwplmc8J26lI1fuGz
         gWtgCMNHKtRw2fDgw0g6a09ohfgNVhAQTMOuLkXhtEVtwzEOnpc3fNtuigyXMYr4olAq
         qA2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=5pcAr97YiLV/9IyrI9j1/5CtMoVN2KluZ+rMrwDq4J4=;
        b=Wne8NyCuUUknhJgqVda5fpdNmT5TAGQWSyXwFGKwemBOIAPHY5LMTkUx+DKm0Yj0zx
         zs+V5VuqjbHoc9R4TLnxhe6+Lp6+KuIy/QXvwdPIjX5RnwmfGXyaandHVZis2v3Z7L6b
         jl9eJ9u1sTdKU6bRiVRGOgoIxIzpMyAYhi7P8dZRb6PuAnDABv1xp13UOUmg5dsKGD/D
         Sjub1OjbfU4rXZgNpETgymoAGPI7ufiROm83/jw+uPysbxOxejFjewiTSZ7IDK7HjTeJ
         PfiN1m75gwPmL8cQ+m6Cp4yfGkcz3n9gX0v+hXS06LUcTKhu7a8Zebc/lHTuRMURNfOe
         S+4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=unwm0rIw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x63si20718743ybc.14.2021.02.15.16.21.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Feb 2021 16:21:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=unwm0rIw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lBo6v-0008Vk-NY
	for alex.bennee@linaro.org; Mon, 15 Feb 2021 19:21:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBo6j-0008UZ-Sz
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 19:20:49 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:41845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBo6h-0000YX-Pa
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 19:20:49 -0500
Received: by mail-pl1-x62e.google.com with SMTP id a9so2447651plh.8
 for <qemu-arm@nongnu.org>; Mon, 15 Feb 2021 16:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5pcAr97YiLV/9IyrI9j1/5CtMoVN2KluZ+rMrwDq4J4=;
 b=unwm0rIwBrW5m6ecgs1sMda6mGnGR9xMO8RWDScYd5PZ32nuu1mtEXhLLQ2cTjNevd
 gAbBBz8PAWcByeLqHKgAqwYqbXX1u8fsit9rJvMb1IzpYQ2qi1iYd3XT2XPLULx7saBO
 0O+YwYODBsoKeJYa2cas9qfkvJ/DBj/VoZD6LDWZJj7reLtyv9dRPMqDBps55cMamvtW
 YMIpXUmSfQS4cLqlqMfkZCdma1ZCMvs5Keaw33ISbGkdC/lVxzC91zsr2Igzg6EXvavS
 uy0GYgJvm16rp7ON2b7epcfr3ZKgxujHhNsafQA+e9wtXhX3ea9zRTkTJRX6k1i7ikP8
 vnww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5pcAr97YiLV/9IyrI9j1/5CtMoVN2KluZ+rMrwDq4J4=;
 b=V0HlaGOglLk8ou3LYr3Q8LhsMtPgCFeaCXIuRCXnSnEWneDXVQK0EhSYO8mlkePgQL
 xYNCdGH3jFq6AhjdQtY2iDTEY8cdr47+FHr1kR5TgMVkNjAHiVLtBpdV09NZgNRwyWwO
 JcpwJdWYBBXmAj6EoDimk9vK+CaeAuC8179ByKwqddVHw7WAQQBS0ai919/wmnbEi9B1
 GYO/TjrYCTqWzKx2p7mWC8qua66TB4sUqVWdikhW3oIIpMWnG5RVJfcbUAfQE5xFWQ05
 DalZbj0c5AHViZ+N7DzmdDwLosfRR/omEU/oz74Eiwy4RK1e67+NiaqcOk1ecbcr7aeS
 oxSA==
X-Gm-Message-State: AOAM531bsuLyxly+DJU9rPtYhC8+2kSWzlpO0TQhvPrwd5PoaGucTf0S
 0m+gGWqiQykfLMDlNCkQ/dKcPw==
X-Received: by 2002:a17:90a:4287:: with SMTP id
 p7mr1360032pjg.226.1613434846250; 
 Mon, 15 Feb 2021 16:20:46 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id u17sm20784716pgh.72.2021.02.15.16.20.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 16:20:45 -0800 (PST)
Subject: Re: [PATCH 3/3] target/arm: Set ID_PFR2.SSBS to 1 for "max" 32-bit CPU
To: Rebecca Cran <rebecca@nuviainc.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210215215819.1142-1-rebecca@nuviainc.com>
 <20210215215819.1142-4-rebecca@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ba93d58d-c835-7301-057f-89789a2fc682@linaro.org>
Date: Mon, 15 Feb 2021 16:20:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210215215819.1142-4-rebecca@nuviainc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SZEEPGI9hj2A

On 2/15/21 1:58 PM, Rebecca Cran wrote:
> Enable FEAT_SSBS for the "max" 32-bit CPU.
> 
> Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
> ---
>  target/arm/cpu.c | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

