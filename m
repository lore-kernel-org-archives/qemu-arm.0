Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp3603995lfm;
        Mon, 24 May 2021 07:22:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7XPcrnBrw/O9TAfRe3BIqdmB8AusYzCguYGQhMewPEo5OL+i80F1jzPDG/JJrr1FY2dAm
X-Received: by 2002:a1f:bd8e:: with SMTP id n136mr1786666vkf.5.1621866163419;
        Mon, 24 May 2021 07:22:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621866163; cv=none;
        d=google.com; s=arc-20160816;
        b=lRcZbmg1+c504brsMWTIazhq5lktyPDMiqHkn1F+0Jzk5NHm64yGkDC2ThDNdebPEl
         WVXeMt07LmH+/yPUxMtAUSw3mMQ/fvQ3nfPleJ8AD7rtbZ2m31F+E6Z7+Wrs+qUimMoB
         mKdGWbXcBWAKp/FeQsqI9GtpGss6S0AZRFppWHjs35B/4qhIIpM7Dhe6RMc4QhMbJnPq
         1VkAyvdOsx7HWD4kEBq4RXPg+lbAAO/7waQ/hGZthPA6RtXZb92dnTo17n/IIK3piDdc
         S9iczhjAjb3ViAowF7M26ELuQ5XRbuMFV4wZ0+r4n1GzPhuboCzzHWMMkKcJqyXzFjIn
         rTdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=UkZk2aqd6d9EsYJsH01tTywxceXzda9KgFKwD1XuqPM=;
        b=tLPh9nJK9I3mU0Nm2MhcXi6omV1r6YUD72IP2Y3/2+GbMeBFYVMlnwL+fDZc8e24My
         yOu4V6UolaSISiAPto4Tq8Y4zKQjUrCDoZhqSFHSmo8rtP/SFK12NluynalhVcPorPR6
         8N+kmqTMupZMyrZKqrfbjUT4MiO0aokLHGwcu0exCCKMKcFsSni6oNK0TKMyhPZAQI2a
         qb6EDXUDz6uHmdyWnRT9WxWMdAeNnNQlvGRg4sO5H63I//NRWEwV6Z6h+li1WqgzjoUM
         entved/PgjyWDYBIatyepiLsra1xZJTLsZ72JCX851RYID/O6OtWBG37OkCMAg8G6aDc
         /ZVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CyDor0ju;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h14si6144122uap.7.2021.05.24.07.22.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 07:22:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CyDor0ju;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llBTe-00022M-Kw
	for alex.bennee@linaro.org; Mon, 24 May 2021 10:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llBTT-0001uU-K7
 for qemu-arm@nongnu.org; Mon, 24 May 2021 10:22:31 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:40510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llBTQ-0007mk-Ri
 for qemu-arm@nongnu.org; Mon, 24 May 2021 10:22:31 -0400
Received: by mail-pg1-x52b.google.com with SMTP id j12so20205048pgh.7
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 07:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UkZk2aqd6d9EsYJsH01tTywxceXzda9KgFKwD1XuqPM=;
 b=CyDor0juiOO700o9N6/goo7qavVPY/ln0ijG47ZKMZKgSdlUrlNGV03kwaBKplr5Ek
 2Q0WDwR/fMDQhwbxvW9TLGRy0P2wnnVVBf9RQXykM6TFhp9q9GMjVb/VBHiYRfHYcOa9
 AM9xz9po8iezUW49HyrMQsCChPmPjLau0UMvspVWiWE3GsiV8eAU1U6bhGBC9hvIMZmP
 7ZkeCHuicIstDWKKMDS7N7T6yh8+dZZWPAgGpVHmvtyCs6EMV3G5eomOo6s9zvtBxdjQ
 UiYT/erLk3FRnhqePyvcvKhPiDYRsISUdN2BIBEJXvAC879lt8j1rABEMXlXalYxgeNZ
 4X7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UkZk2aqd6d9EsYJsH01tTywxceXzda9KgFKwD1XuqPM=;
 b=oKjYt8Bzdtk+xtxljjTvGaRz10BF5hU8BWVbDGUFh4cwnVmavgijk6b9cuuU6+1o8K
 xsOA4Tx9VDyR5lXwQka/FaVl8SaI2BI969Maln8eyyHpEOJvGv+8KVrZjVQqQBKGuFv4
 EGg0DZl1JQIK2BrsM4qBV1ZmA4DiQskJ/6kAfWsGd+DxaAcQOvpGMZVBqxgIVuW/d5us
 ZlDDbv3klYmexW2dwpmVcK8uTQyJ1ZrTddkaOhDoomIOCvcQZMPjqA5wiBxDK1bKPSiW
 LeyuFNRjWD25mSftGqMVHAm5sxf+mSoHTHISJpym+zaUEy4j0M5bmTpnPpuZtUXBRPYQ
 ibaw==
X-Gm-Message-State: AOAM532xSeOoNUin4j3Ge4zFqfjQRrC7gPAXh+3+1ZPNeZx9z3lOmKPI
 JabSmWJYs1OMYsvWC8wGTVewbQ==
X-Received: by 2002:a63:5158:: with SMTP id r24mr13791687pgl.41.1621866146520; 
 Mon, 24 May 2021 07:22:26 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 m2sm11689958pgu.85.2021.05.24.07.22.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 07:22:26 -0700 (PDT)
Subject: Re: [PATCH 5/6] hw/arm/mps2-tz: Allow board to specify a boot RAM size
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210510190844.17799-1-peter.maydell@linaro.org>
 <20210510190844.17799-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <583ca871-e53a-aac7-ea0f-2a4e7812b03c@linaro.org>
Date: Mon, 24 May 2021 07:22:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210510190844.17799-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Devaraj Ranganna <devaraj.ranganna@linaro.org>,
 Kumar Gala <kumar.gala@linaro.org>, Kevin Townsend <kevin.townsend@linaro.org>,
 Jimmy Brisson <jimmy.brisson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cfjpBE/wHeXb

On 5/10/21 12:08 PM, Peter Maydell wrote:
> Currently we model the ITCM in the AN547's RAMInfo list. This is incorrect
> because this RAM is really a part of the SSE-300. We can't just delete
> it from the RAMInfo list, though, because this would make boot_ram_size()
> assert because it wouldn't be able to find an entry in the list covering
> guest address 0.
> 
> Allow a board to specify a boot RAM size manually if it doesn't have
> any RAM itself at address 0 and is relying on the SSE for that, and
> set the correct value for the AN547. The other boards can continue
> to use the "look it up from the RAMInfo list" logic.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/mps2-tz.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
