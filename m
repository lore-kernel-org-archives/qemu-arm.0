Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1123721wrm;
        Wed, 9 Oct 2019 09:10:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwHpMqmwfsBnlmSENTWfI+6oZ94HX5HRRh0Ne0SMoFCJcGUzkcunTCttBJf/G2FydPlVE3V
X-Received: by 2002:ac8:1207:: with SMTP id x7mr4507973qti.255.1570637408602;
        Wed, 09 Oct 2019 09:10:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570637408; cv=none;
        d=google.com; s=arc-20160816;
        b=Ma7ynz5I3UMT8zD5Edk4hpkmKkjQhCV3kPsegfgI29TLSF4xPP0Sx+GDSU4tFRoqaO
         i1q6jTB8uESgE981lt0FiRNcJyfoI6JeR1XzuDMpujDVgo0oP5F3PkSOiXeAiYtOrVAT
         ExHVzIat0RP2FMwzG8MT2REFBldz5eisadAbVLtSz3NXL796M7bsAW4CNLDrbO1aMVeb
         EWQCZ1ye0qCWNMcZm5iASw/swGilTEpgbgnxe/Lt6tCHrzpCkST6gBD0F7iFyJHoVKYg
         cH4sGfziu64i0TS/ePY5igCFa1IQSuGryu4101IOBErF4/XqUHF3aXrJG0ePUHy54L0/
         cueA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=vx31jXZ/tj4LV0ilcA62gi46ZF9JCRg+IALX3wC4EsY=;
        b=wSbcOD8DAnMRM6CxyqWEfSVlwDkSjjzTUg//T961qlgNXrkRz1ZPjZ2psU6+7A1mWQ
         e61OiGnSmW4BJB04dXf9Pchvd+8DeidSa+5roiiXvzklLLSuQ19awsyvg2WQ6kJdZ5R8
         s33CcEj1UlYsT1f5438CVS33sYdC+p2IN8zRBlhU7jayl+Mh0gOhXqd8u/mnBEHkv5EW
         Xzr/qI0GdhU6wCFn7fXn7ZBInZHWR1ML8s27P/TtkrRwjSuDFUzTYpmEb4OVqG+MReVa
         rHeFi2/60bCZFzqcF08jDFgEJffNhsPEhTDFALjVWDjGhdtK0fXcYjgdCpSsr4VqvvGJ
         JTBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ntvmX040;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e12si2354129qvh.4.2019.10.09.09.10.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 09:10:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ntvmX040;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIEXP-00013e-Um
	for alex.bennee@linaro.org; Wed, 09 Oct 2019 12:10:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45794)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iI1tl-0001nN-2J
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 22:40:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iI18m-0008Rq-4y
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 21:51:49 -0400
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:41280)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iI18l-0008Rb-T0
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 21:51:48 -0400
Received: by mail-yb1-xb42.google.com with SMTP id 206so205509ybc.8
 for <qemu-arm@nongnu.org>; Tue, 08 Oct 2019 18:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vx31jXZ/tj4LV0ilcA62gi46ZF9JCRg+IALX3wC4EsY=;
 b=ntvmX040gC2y8fflXBCDRhu0vZdVLN4yh3Z7WKGzlGvLijdcNzKImDH2zftXSVRG9q
 BVkNIAc+qqJEZu6yxUcjeLp90AAl7glPrUzcPBlVjEEssEG6uBQwu6S03q9MEU110/+b
 4dg/irc18ZJxEiXeBLpC3XXwJFXfb24U8XCW4sJDWfkoIFCEeFPAZ7Oy2qOTdvE3MNDx
 RPzh7lqQyDAG4gRJbDm0YaZ2/GHTacm5Z7RzrTyFhAvl6rE7szx/FB/v4iw5khZWQwO0
 n4Qo5+/cEIxPR7P3nWcZf0F41DGReGtVMEaBZ1WLg2HS3qlhHGFwHVg8avHuH7+j/ydN
 mHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vx31jXZ/tj4LV0ilcA62gi46ZF9JCRg+IALX3wC4EsY=;
 b=W9wiIgmF83ffaZjpCsTDdCAKsb5czGa+tZchp7en/lB6fdA4sZRn63B0hl70Yg4TWq
 u+01f3Ibh924PVpheLCaY+MfMekOSbPuol6Hj+q5uS2oSSfi7lSVrql2qgZQoHrIv+FR
 67WTHaQEg/lbOTxGN/cOOiv4dMf9F/uTSws0vN/m/KNvKXAs8BqtVyosxe7nMeL8f5UA
 cZKJpatmgTWdu9PRjOMk8BxdPN38I7527UDLLWQ4FZRXA/gyzHXZfRvVjOQzEHS4NfQa
 rw5SwsUEdwS4pRF5xYW2cU53C4xXyX2Df1M7opAZLbfLTv7KEObFjE8qJPA6yNVHfmKg
 Lwfg==
X-Gm-Message-State: APjAAAVz1GH5Gq20+oOuxB1F8ioYoJnXhpmQUaN39fQkIfV+xufKIzYX
 UUYTnOihzE/naOuvHeYAthdrZw==
X-Received: by 2002:a5b:582:: with SMTP id l2mr512454ybp.72.1570585907100;
 Tue, 08 Oct 2019 18:51:47 -0700 (PDT)
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
 by smtp.gmail.com with ESMTPSA id l40sm213827ywk.79.2019.10.08.18.51.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Oct 2019 18:51:46 -0700 (PDT)
Subject: Re: [PATCH v2 08/21] hw/timer/cmsdk-apb-dualtimer.c: Switch to
 transaction-based ptimer API
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20191008171740.9679-1-peter.maydell@linaro.org>
 <20191008171740.9679-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <9505434b-99f4-9b9f-d0c4-20fcb0255b02@linaro.org>
Date: Tue, 8 Oct 2019 21:51:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008171740.9679-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b42
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PksUsTznxPc6

On 10/8/19 1:17 PM, Peter Maydell wrote:
> Switch the cmsdk-apb-dualtimer code away from bottom-half based
> ptimers to the new transaction-based ptimer API.  This just requires
> adding begin/commit calls around the various places that modify the
> ptimer state, and using the new ptimer_init() function to create the
> timer.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/timer/cmsdk-apb-dualtimer.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
