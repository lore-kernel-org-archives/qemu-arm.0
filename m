Received: by 2002:a17:907:c9e:b0:a27:13b6:eed5 with SMTP id gi30csp1248907ejc;
        Wed, 27 Dec 2023 16:54:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJDOxP0s/sgZ5lnxIFtfqfQ7pN8iP1mc8U/6ZPLS4yST2Dhqok317Wm0fRw8hj/JgPpsS9
X-Received: by 2002:ac8:58c3:0:b0:427:f2da:9823 with SMTP id u3-20020ac858c3000000b00427f2da9823mr1149171qta.46.1703724872566;
        Wed, 27 Dec 2023 16:54:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703724872; cv=none;
        d=google.com; s=arc-20160816;
        b=Q7mhtKNHUJxVoaW9C+DoSHUdASrxbDpAInYMy2EyW8bwIbx0YcbakFyHVz9lm3jwUu
         RhCmCh5A/w157QmO8X3xIESThX8rVrafNmttBgpXr5jvchh9Oijnn5PVVNEIJ0QcyelT
         LCXbprOCBuK32jSlytBoCCTdMM4YtGplJaSZyAyjtZjlLJ4+2/WtSFlZS7luBF3LA13a
         0yWxeFDNwtl8hl7QsEfX8hvgQzcZIaK2RGlqsnl/s+MKahVze7QZ9/kb8BDeTABJGs7W
         1ubrr16SQY7KmJ8fYtpSU4kanXUHBlldin1h8CadoSL+PBrlvUDTka1lgP5hlN7jfVI3
         m7qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=sJ4m507ajLfx8ejtxdKj/bGKEnN+ZOxzzQuW44I3TzA=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=WcId4MQ0aI3AR1CpEoY1fhAl0FBw4cE+k8l9mCS191Onr1l1b8Lg92jt/2RpOH14fv
         TONod+qvVyr8vHzMfuJiKq3EnHoOesgg7LQ75V5b517QXCbHbgU06eMm4lVAgaa+Xxww
         RJqp8A60EBkH7PbgQvlMXBgfBZ+dk0Vnwh5HYFb9Fd5JRhZXwpKCY7gbae/byylsKRD3
         FqgPHkhdyDQdT3doszVW+RWPQiukRfZS7/4cWBIA6E5SY5ZeXQKz6Hd3VRxHESiys3bu
         ZSb6qnGRa1C9/JTGRW3vpgnld/mN7OXhz4aD1RpIlSUb9P+NEp1eF8jZT88MegZYHm0F
         YmBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z62uBO1z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j22-20020ac85f96000000b004236f705a9bsi15852141qta.118.2023.12.27.16.54.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Dec 2023 16:54:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z62uBO1z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rIef4-0000mf-3w; Wed, 27 Dec 2023 19:54:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIef2-0000mQ-7F
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 19:54:08 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIef0-0000wR-NE
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 19:54:07 -0500
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6d9bf6f24f3so825689b3a.2
 for <qemu-arm@nongnu.org>; Wed, 27 Dec 2023 16:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703724845; x=1704329645; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sJ4m507ajLfx8ejtxdKj/bGKEnN+ZOxzzQuW44I3TzA=;
 b=z62uBO1zx//l2OHHKtvIlSSuKvpHe2Xbhsz20zZONcEI2pBBOTlj42vonSzvn2aDSG
 D+GyUT1cYQ/BGzR7opEwnwyZ9aIzNQkwdK+Kjy+Q1860qeN1N5+GRkupC2teIU9YQlVH
 TFt8bcchlrHIZqEVREia830thAmMmdHgpjhjaoM1Ccfeu7XP/TNihDHzrQemngFPrt5P
 4CuIGUVEBPd2MwWHqrUAinZAGRVOKJgVO6TXq8GSPON2njlYFrExsigSbJbMbVRTbVYJ
 m/bgvmUY3hChx3WZOsNiYEisNb/eSu15/LhV5/PO1T5cHM/19Q1Nl6xT+Feu7A7z77Pk
 ljmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703724845; x=1704329645;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sJ4m507ajLfx8ejtxdKj/bGKEnN+ZOxzzQuW44I3TzA=;
 b=l1tUnSqDzNi1jxWw2YubYBbe1+t4aUTqJeocH0kdtEf9CWGsxsNRJ6EQ1ouHe9+A8o
 he/q0HslOT0PD6Eu+ZQXmb6w8300ANPzMcdQgdSQE4SLvNRckgVQI4JHh5QFVfHKJ5Po
 j3ennaeoclAuWzImrQ+tLYpWyCQKAjmalaAcVrdzM7Z6+Q1byMkrMyYZmSWzv85OuLgv
 EXsinGciIIyKZnGN57Dx7XOZFk5gZqnYJajLZm08JCd7OdfYW9WPkB7Z8dLmTfHbTcn5
 6rEM96ZMxl7ii9VIJWRlZ0PilD1rqBJbm4C6gprwyq9Kz7/zGrz1ZlcmxKhtoL5dQEQn
 foTQ==
X-Gm-Message-State: AOJu0YyVveYpuDB4PV46fqmL93wUSrMqiwJfQ7Rlqf+M78AtqYekBELi
 1kimWatlc3VX9o5SEUqRC9bzW6dwuZjY2g==
X-Received: by 2002:a05:6a20:12c6:b0:196:4a2e:4ca1 with SMTP id
 v6-20020a056a2012c600b001964a2e4ca1mr201171pzg.22.1703724845268; 
 Wed, 27 Dec 2023 16:54:05 -0800 (PST)
Received: from ?IPV6:2001:8003:c020:6900:12c1:9684:874a:fb3a?
 ([2001:8003:c020:6900:12c1:9684:874a:fb3a])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a170902969200b001d4872d9429sm1145847plp.156.2023.12.27.16.54.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Dec 2023 16:54:04 -0800 (PST)
Message-ID: <7ed61f21-7e70-4bdc-8b6e-2e02c65ba180@linaro.org>
Date: Thu, 28 Dec 2023 11:54:01 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 33/35] target/arm: Report HCR_EL2.{NV,NV1,NV2} in cpu dumps
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
 <20231218113305.2511480-34-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231218113305.2511480-34-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: kLRrzJ/2Wcl6

On 12/18/23 22:33, Peter Maydell wrote:
> When interpreting CPU dumps where FEAT_NV and FEAT_NV2 are in use,
> it's helpful to include the values of HCR_EL2.{NV,NV1,NV2} in the CPU
> dump format, as a way of distinguishing when we are in EL1 as part of
> executing guest-EL2 and when we are just in normal EL1.
> 
> Add the bits to the end of the log line that shows PSTATE and similar
> information:
> 
> PSTATE=000003c9 ---- EL2h  BTYPE=0 NV NV2
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/cpu.c | 5 +++++
>   1 file changed, 5 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
