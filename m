Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp2192117ejb;
        Mon, 3 Apr 2023 00:52:57 -0700 (PDT)
X-Google-Smtp-Source: AK7set9Prko6uLjI/mJ1LzvI4s6O3gidHUCvNzaC3XOkLSKPXHMgjYXbHmXTE5LFNGgC8M1EBzui
X-Received: by 2002:a05:622a:24e:b0:3b6:2e9b:cf2b with SMTP id c14-20020a05622a024e00b003b62e9bcf2bmr55511572qtx.14.1680508376748;
        Mon, 03 Apr 2023 00:52:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680508376; cv=none;
        d=google.com; s=arc-20160816;
        b=rGqA9HpRCjQzvypoj54wb8mNmdpjJS9Pmu4k2jAgGCbX7mZ99km9c0d2kqZHD30mgj
         YLEvCrkAeW0lPIHf1WrZu9ln9GuqEwVo5etfrXo3TYkXHR/dJiwuk0xhuVHgwmNc/0z1
         mmmXoA0vqPBSYY9nBSf6QkEBBQP+e62y5PjMoK5nsut/BV/1YSpAQPS3EdDUaodY5Tj7
         lovGfIgxZYQ/1JQ1aOcAM/Dk217rMLMWyCRsyC44YPxTDdihmCXinGTN6S5NDE8quWcd
         csF9QYFoxO2XugFF/F8J2sceB4hjW45gu2uXI/WHgKYor2gnJixc5S9PT5+IiWneS3Tc
         KmaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=ZJbLbg7aoiSF0QYubSkyLZtotm17ylTrOam97ji6Uek=;
        b=a5rf9mCCdrMyqXtRafvzoh+g2qvBqfa07eGcveG49lJOsVUWNsszJn7BGnlJ8zcZUz
         bXVEUWXRLJTD2wWxo3RSbPlkReKHmwYfOO5y5uqRd6gAb7MWrQqyBvK5fHat/NHQ9EjX
         ue9S3jAO5zVMlBr15wYxDhLuzPH+y67zhKGboPVJxtZvR43IYuHOkCznGdGAcwjnJfjt
         pKH4vO4tPvG1byi1lQRyzAJvyewYkv5cvH386irJMkhEQcFSkwMcvZ1vD9YHvDYJsqqi
         KhwGvEm5n316CtwWS+fPRCjS1KzR4zB4/rQ8wWCWZPwGJNGxyBw7RHecnNoSRG+b8yrr
         vpbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vhjA0on+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl8-20020a05620a1a8800b00747a2434dc3si5504502qkb.783.2023.04.03.00.52.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Apr 2023 00:52:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vhjA0on+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pjEzQ-0008JF-V8; Mon, 03 Apr 2023 03:52:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjEzL-0008HH-Vu
 for qemu-arm@nongnu.org; Mon, 03 Apr 2023 03:52:28 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjEzJ-0002WL-Ow
 for qemu-arm@nongnu.org; Mon, 03 Apr 2023 03:52:27 -0400
Received: by mail-wr1-x42c.google.com with SMTP id y14so28307879wrq.4
 for <qemu-arm@nongnu.org>; Mon, 03 Apr 2023 00:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680508344;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZJbLbg7aoiSF0QYubSkyLZtotm17ylTrOam97ji6Uek=;
 b=vhjA0on+6/wQPNDU4ozGGs4K9w3eNcy86iBwjUapY+QPeT0MJKkWqK5ylyGB/YlAMB
 EIzBI3DQLzS9MrE2iQGG4TP/EODOOdr0pxhhPEMfJOqolb8IuqlpBPHwSL1MsvLXQ0jx
 6iVE67iebD4DCcYxK5lglueqJaSoBrYAxaKYyjPRP229mll/o3g+LLjQFT5y4aGt6coN
 rO7dC+Lky9n/OoEKAo/aNbu/934kgUaKC6O8uOYX3BbnSmTcVniN6EhOAMJHSkGGxYBB
 mcAXx0aq2AVJHSOeH2coRj8onWSdk4ujydYzBHrM7ypg48jH4kWQzEy7u3/D2N2a6hIK
 7dgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680508344;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZJbLbg7aoiSF0QYubSkyLZtotm17ylTrOam97ji6Uek=;
 b=2D0TosBqBP6alJ0Q3EdzCO0+v1cnWFQxLeUt6bY0P6O/z9IpfJITItoq1nIJM8CWpR
 ALymf/fqA8w5/jK6TMPBloz/Ysm32f7s4M3SBntqqqGa7AMGvkpQ7T+EA1fQhXQEl40A
 M45NLNcYsYsJedkWjkuN3eCnY77ZVCB1Jtl9ArSHAQAlQOxDyVTApclME+n56b1UfAlD
 S3hOicPR1Aa4jq3AR58QTd4DvCazExGgxki3rm38wHXh0RFXdWsnn7JyS5cd+nH3/DkN
 izaHFISwPZLzERhsmkp+uh6pSuGX16mCy7dOvrw1JqhsTpA/u9VSUQxXb0lIO9BeyBqe
 uipw==
X-Gm-Message-State: AAQBX9f4e6RXeo+tKaCKUL2LuWd/onTTvzMD7OnXu9aHqyMDWoJRZSTH
 HXHpaD32I9e0GnWpwSNgHFNimMOcyAfRSPZaY8kkgQ==
X-Received: by 2002:a5d:5742:0:b0:2cf:e3c7:5975 with SMTP id
 q2-20020a5d5742000000b002cfe3c75975mr13167971wrw.34.1680508343784; 
 Mon, 03 Apr 2023 00:52:23 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k10-20020a056000004a00b002c5691f13eesm8997203wrx.50.2023.04.03.00.52.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 00:52:23 -0700 (PDT)
Message-ID: <23ebf10c-804e-adc6-0d37-fe726b56f210@linaro.org>
Date: Mon, 3 Apr 2023 09:52:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH 1/3] target/arm: Pass ARMMMUFaultInfo to
 merge_syn_data_abort()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230331145045.2584941-1-peter.maydell@linaro.org>
 <20230331145045.2584941-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230331145045.2584941-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.37,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: iAKE5pNh/lmT

On 31/3/23 16:50, Peter Maydell wrote:
> We already pass merge_syn_data_abort() two fields from the
> ARMMMUFaultInfo struct, and we're about to want to use a third field.
> Refactor to just pass a pointer to the fault info.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/tcg/tlb_helper.c | 15 +++++++--------
>   1 file changed, 7 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

