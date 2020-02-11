Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5426351lfp;
        Tue, 11 Feb 2020 10:55:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqxAUF5RzMusyPse/pZVdnJPMdIfOHwjmDTO2L4JdlzPAOYLRLhvW9LEqTL6GOnq7FC7JO9E
X-Received: by 2002:ae9:e209:: with SMTP id c9mr6220302qkc.363.1581447349294;
        Tue, 11 Feb 2020 10:55:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581447349; cv=none;
        d=google.com; s=arc-20160816;
        b=DDsduAx3lpo/matNlLplJ2JfNcnKu94sGl7YXtjerVaDdnwaejHfNnU4zuYfiglw3n
         n1g7NiPFxsQ/phUa3NaYFtulHqGmd8+PgXY2S0WuvDEUa6DGDpAOqyVc3IdPCt0C9urM
         ujnYKn6Sx3zk8oXZbPyqmffTsAd6HDhLlu1KYHxGEb/q0jjsUrCWmxgdYM3/KkGPPbYX
         5Az7SA+K5gAUx6o6N6mjyV9dJZW3aqOEEYErpewyYsgo5fI7xRc1kp1CD+btfRymt6oK
         ncXntAY1wmkXDqVOgLcVc5KjfLdQosNXQSuC6APSdmrUdzsFN2wuJnEQclqkzRsrHSsc
         9gFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=CrXYayQlBzAnDNIH9v/PykxwmIx73+zl9SeUi1W1THc=;
        b=JAzmAZ84e6nYLc7p5GhzcdVK0lnHN9PUofH1LCsXR+l8J+eYH7MTxovU2F9Syg6D16
         2AzK/gvamTNygIKEQyHEelxyCFAi0Tb9FE+kdrwBm2pipe2cDWnLDQB7fGDj2WqIbrtR
         E5Cooe4sGg8iTQp7LTSOF25MJ9u2oo1i1k+EO9wVjNOD3z4uoz0z+pzhSoJsXuSPWs51
         d+BbF7o+ZZdew6kR/x7ekQ0fBNsWAccWGxxxcaFxD+hghSR19E3OUv0Y/B68/OfxCpu3
         738vJVORLKJ8Kl0Zt9r8n5umbFENRAavFk9XAHSgQlkMbzPmBbc9K9t8IPqvuUAkPNzf
         Siwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kDFKXo6U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x14si2255152qvb.11.2020.02.11.10.55.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 10:55:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kDFKXo6U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1ahI-00044L-PG
	for alex.bennee@linaro.org; Tue, 11 Feb 2020 13:55:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38146)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j1agv-000448-JR
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 13:55:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j1agu-0003TY-Ec
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 13:55:25 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:45364)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j1agu-0003Pi-5t
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 13:55:24 -0500
Received: by mail-pl1-x644.google.com with SMTP id b22so4610776pls.12
 for <qemu-arm@nongnu.org>; Tue, 11 Feb 2020 10:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CrXYayQlBzAnDNIH9v/PykxwmIx73+zl9SeUi1W1THc=;
 b=kDFKXo6U72jz7asislCYB8xyb5faQYupFWSud9ziim9y3tjRoLHHogphq2e9E19/+0
 h13JYPyXTsPjXEzU0wwLfE7zYWWm0WOaf5wxl0TUGLQcBFc9/KIGFBK3PCQbFI7Uf/zk
 1kl8d28zav83P6Sj9u5dGnNbzhZIPVg/kTwYNv/en8054XCX8D0eB+/DeRToYbS1Rw3k
 j/kh9js8tUnIRf1WrqHHMD9iOStF+Rwz6aXpRemvoH4wLYR8Ktdo04LGY0QCXnsvsC32
 jkihaQONYiaMHyrckYu/5cd2caBrHqfR3ZOSCvV8rLcg3pSpbJ8JJOzmyfCXsD1tDyx5
 b31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CrXYayQlBzAnDNIH9v/PykxwmIx73+zl9SeUi1W1THc=;
 b=XJLWfVVE3AzII/MaPWC738ZwyU3SB70nAG1gYzdnr3f0XqAII6LjIRsId86jMJEXn1
 mSttr/sYCYTqSr9sJs+PlIiuppfhzaNJNCwSv5xwlCONHLm7bWRWAex4hLNJ2IqA0ozN
 4IltOolY+PYwDSvO5a+LqisdXSnCdMmttLw/ZNAnlgXraSuxjNoHJnf+Zf6kF3FEgQVO
 +Ld039K1dm5Tro03GicdpcL2NwJEAZSFqnkqUMpcOxvaVpJFTnuoDYlQ+rmOlbZoUpN8
 dpUI2Bgeund2E5bvBWr97KHmDGMOsK2DgFUpVKTd/bFLzOto3gN8n+bSoHu+eWZvyUom
 6UAA==
X-Gm-Message-State: APjAAAWfW6yq09+YW/hE6L/d5tbDxgvmIzoBvPCJtO/d0nb2H8aZPgmq
 F8P4LfaUTETS2isMbslq3ZzJXg==
X-Received: by 2002:a17:90a:bf0c:: with SMTP id
 c12mr4954034pjs.112.1581447318919; 
 Tue, 11 Feb 2020 10:55:18 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 z16sm4996348pff.125.2020.02.11.10.55.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 10:55:18 -0800 (PST)
Subject: Re: [PATCH 13/13] target/arm: Correct handling of PMCR_EL0.LC bit
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200211173726.22541-1-peter.maydell@linaro.org>
 <20200211173726.22541-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <059ac7e7-c4ca-7456-69f7-80c3cb2cbf09@linaro.org>
Date: Tue, 11 Feb 2020 10:55:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200211173726.22541-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GutIUMwVq/eM

On 2/11/20 9:37 AM, Peter Maydell wrote:
> The LC bit in the PMCR_EL0 register is supposed to be:
>  * read/write
>  * RES1 on an AArch64-only implementation
>  * an architecturally UNKNOWN value on reset
> (and use of LC==0 by software is deprecated).
> 
> We were implementing it incorrectly as read-only always zero,
> though we do have all the code needed to test it and behave
> accordingly.
> 
> Instead make it a read-write bit which resets to 1 always, which
> satisfies all the architectural requirements above.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


