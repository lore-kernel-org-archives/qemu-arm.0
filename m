Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp2043508lfb;
        Sat, 4 Sep 2021 01:56:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzh05FdBo59F7lkbBMaxjFuBOQ12j4SolSFCrdwFx/9mG8/CT8dwRN0N3YawygbnIWz+BL
X-Received: by 2002:a05:6902:1504:: with SMTP id q4mr4310364ybu.515.1630745774776;
        Sat, 04 Sep 2021 01:56:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630745774; cv=none;
        d=google.com; s=arc-20160816;
        b=Wxy7ilElV4anhhTz2pGsE/hD73rNi6ZKaCit7eML5rj/ixnlvlF/79UeAITSKKGuHZ
         w+8I//kclEYZD9MVIyWXa55vjJTIgukIqs1Y3RVV+RrqA3o9h3jcgwxGNWFRovLSH5hm
         gPb50Ci8ApKrjHfzuXTqab2Gd8Cmn6RYXLvNDz0udgv0hKACsP0zPOj5CGWhYILRvXTl
         K5wGM69MhCcSfE97cvST093O/a2y7uUknPXC9oHnwJ0R5eeEXe60AdcYPKcn7Rxer9AZ
         Jibvz5BVQ8JMX2k1TownQ0bRo+1aGyVxkPiwQyWJLqE/NXAfwLDxD3//4m6PViUC4Rs4
         dz/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=AdIA4RwjFsb6MkXA6eO1lncdEigTXj1+bGmr5lUKsYs=;
        b=gwB2IxpO3+ROS2i+bbo03s7bvcyLFkqXCq5jXpynqThwfkAUOLuCFgL8dHvTfvx1eJ
         k53XpqJ9a4CYEcnucVeeFCSlx6XKGLa9+38rGb0VcKMbl+RwKG1BhEEVMTkiyA8Z3FnF
         5XaqVL+OjgwBRE8MzobNjrcV4G57k/pMJx6vBH3twC9WB9U/q680Gg4MNsiYfP+YEOh6
         YST/VOrK96RmCFLQFbuRoLXzgtduoTTzZw/6Omew8LUkX0M6R7uxnLjldFVtTwF59HtS
         xYEAG7Su5wPseEFQ6MSHO/DphEOyHm/YPkHtkkkKorO8ES9OcPJDMRw8YUtlZHRK60YR
         RjxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zLRocgVc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j141si1987750ybg.57.2021.09.04.01.56.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Sep 2021 01:56:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zLRocgVc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mMRTC-0003Pl-5g
	for alex.bennee@linaro.org; Sat, 04 Sep 2021 04:56:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMRRB-0000kh-6h
 for qemu-arm@nongnu.org; Sat, 04 Sep 2021 04:54:09 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:53913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMRR9-0000os-OK
 for qemu-arm@nongnu.org; Sat, 04 Sep 2021 04:54:08 -0400
Received: by mail-wm1-x329.google.com with SMTP id i3so805817wmq.3
 for <qemu-arm@nongnu.org>; Sat, 04 Sep 2021 01:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AdIA4RwjFsb6MkXA6eO1lncdEigTXj1+bGmr5lUKsYs=;
 b=zLRocgVcMnswhqyG3kOGEtDGn4DwvGdcr/GucL/2bGyulmwAKBZGC640eIFNHSru5x
 +hF4dM36IT+vnZYIAN6JDPVsYAaJS0dlzoGjRsZIIPaReMkaV3f3ZP27zpPKgYvp1ucL
 9iFMRy3hFYDvts+Ya9RGeJErQmyMi7NF4Lbt7dwxMUa0l0W/L5JxAQ1XzZxziCY7on8x
 WZ3af37ilAYkfYftVjL6lLDsKlJe0yUrXgxvCKCNspDtO9IissMQ5M3+aJrabzLDJ+ey
 n/cxVGH/9ovz9i46lWQqJR0AbpXa7b3h2phEo18AV+g+bK0x8sCU0cTMkJkKiSum1SyP
 42Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AdIA4RwjFsb6MkXA6eO1lncdEigTXj1+bGmr5lUKsYs=;
 b=JFOK5tgHMWl9eALYyr2g9+8ECMUbny270pVnu2IEDcyIpep/hFxCEYW0ymEkYR1khj
 +IRS4kNWS88ab3njDBFDRCPAqMSmEV+FldiYEHHAE56ImVcGjUXa1Iz/UzVADNI7Zycn
 QiHGQZ+5BkP8u90wVxmPgzUvEG6p5K8pWn6bFLbAsDpLDLwDl1+4GP2vvNVEuKmGrsQD
 xYfT8SN5a+oSu4Obzdd7QZ3Tc6GVBdN53O0rZ/UjvcfoHMrAbRyWyDeui33w/ylPJWc5
 9ApdksrvGWzOx741rpMyQVhbj2sixswEXbBgt50ySR1KE1S2q3XpZPU4PSIOi4fZXR0W
 qPnQ==
X-Gm-Message-State: AOAM533ZEnUAUkGHEkNOrmWqeK+NjscDwhOgxsRRCJ45KZrDDw+Jbljo
 b5RlRDVNqBUT1xOKJa+J3katbw==
X-Received: by 2002:a1c:a9ce:: with SMTP id s197mr2395485wme.173.1630745646254; 
 Sat, 04 Sep 2021 01:54:06 -0700 (PDT)
Received: from [192.168.8.107] (246.red-2-142-218.dynamicip.rima-tde.net.
 [2.142.218.246])
 by smtp.gmail.com with ESMTPSA id d5sm1604770wra.38.2021.09.04.01.54.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Sep 2021 01:54:05 -0700 (PDT)
Subject: Re: [PATCH 4/4] hw/arm/mps2.c: Mark internal-only I2C buses as 'full'
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210903151435.22379-1-peter.maydell@linaro.org>
 <20210903151435.22379-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <58dd4b39-e856-6638-49d3-3a762db4b028@linaro.org>
Date: Sat, 4 Sep 2021 10:54:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903151435.22379-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fc5bThT9s4T/

On 9/3/21 5:14 PM, Peter Maydell wrote:
> The various MPS2 boards implemented in mps2.c have multiple I2C
> buses: a bus dedicated to the audio configuration, one for the LCD
> touchscreen controller, and two which are connected to the external
> Shield expansion connector.  Mark the buses which are used only for
> board-internal devices as 'full' so that if the user creates i2c
> devices on the commandline without specifying a bus name then they
> will be connected to the I2C controller used for the Shield
> connector, where guest software will expect them.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
