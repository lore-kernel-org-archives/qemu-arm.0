Received: by 2002:a17:907:c9e:b0:a27:13b6:eed5 with SMTP id gi30csp1246705ejc;
        Wed, 27 Dec 2023 16:45:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENlRR21KMP2LgQ36Gi+xVpz2g+485s/a82lCXo8YwxD+FymeqO7tVPhK2wKOqT28mXYK/3
X-Received: by 2002:ad4:43cb:0:b0:67f:db91:3cd6 with SMTP id o11-20020ad443cb000000b0067fdb913cd6mr9260285qvs.109.1703724357385;
        Wed, 27 Dec 2023 16:45:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703724357; cv=none;
        d=google.com; s=arc-20160816;
        b=Rlhk5a1FpshA+G1R9UEbS6nY8Sp2u9I9XTbu23NtT97da9EBCQLxOV43iHBZcHNjSk
         iTG+3xIGr1liSTXyKx+M8iVrxlKt5Va/L+Vl93FjObde04jOU1O7OAZJVPIWBPRK0Af8
         /ahmzXlK5yldUEZax1oVdnN4nmyo+gIdinutJnszsjmHm4luCrN1XiczPCzmshZACtmh
         Qal6NBNPwYBcihiklIYCgDD+zYkys5gwEne2E0d2fKUiBuy+RfGsyoInGceY6aB9ORIP
         fwt3m9hpy3DNMXdGoUQ+qzsPOds01sRVmPfPwlN7qhCVNzKAmSG62EPPwictddNCJspB
         Gkyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=23Kb47gbskIVGHKopsn9npv8GdyP4mq+Lv1g1CusqYE=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=l7WYzWwsr14JNOmAnbzW0sXJghsHyl9l0jMK8L2HRzgRwgbCMbMCUOA804tD4Gh+sB
         tv4DlNjEl1fb6sVLGoQhyCeYbAOCN3bBnObUTBZsAlfVuaYCVLAL2Nlgiy4njaQt0fMC
         yBfi67YaQvBKtF7/T3VMq20ZIQwU8b+WVycWUUMMh+67kj7ncFg+ZpC9JDot5mCfY2Iz
         t8XQu3fpIAR+ltaQFjHghSUBY1zEaDe1jyO2ZoZgdib8fNJmV2cxI+nLf5vRSl4sgzeD
         CjuEcch+dPvjXiuknw3whE3VAQHsRSEWrGG4QYJYweyCW1ViPKboLDOt7lDsrYKnofW6
         HxZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BGdPZ2f+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t15-20020a05620a450f00b0077dc688e20asi16696452qkp.259.2023.12.27.16.45.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Dec 2023 16:45:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BGdPZ2f+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rIeWh-0006eK-Ez; Wed, 27 Dec 2023 19:45:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIeWa-0006ds-SK
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 19:45:25 -0500
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIeWZ-0006F8-BZ
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 19:45:24 -0500
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6dc026661efso763393a34.2
 for <qemu-arm@nongnu.org>; Wed, 27 Dec 2023 16:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703724322; x=1704329122; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=23Kb47gbskIVGHKopsn9npv8GdyP4mq+Lv1g1CusqYE=;
 b=BGdPZ2f+kjfFIuenVM0IGzT3piuun1FdrAiYd/LpCY5lswLvbgnvkQmS2rL+00dB56
 qb5Ks1C23Uz5JQzpO7Fr9LOBrQQut3lSL+Ob7B5mqHRt/wkOFj5pyF62zUvWZ0HOUH1T
 ODC/w+Q/O8uurubq/QDJs2QG8u4jiZ3Rgc12pNzWvRSzJz7Aomh8tUcje57Yf67YqGug
 otzL+iI6EUNkLzuOP+uNYyYg1QPADAiklca3ds4jezBlRAb9HAZ9YlK7ZlW3sle+QZHq
 Ywrhid3MbV13LeJW2F6rZztDX46wfobzvjUVmL+HTneKvRZw5jApeye+KdEDBuRLJgcn
 Ob6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703724322; x=1704329122;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=23Kb47gbskIVGHKopsn9npv8GdyP4mq+Lv1g1CusqYE=;
 b=FvyvvqLIS5F9flZFw8ThwqqgHtylgQSMOCDzQpODgnn2cc2cVCwyt/t50lcqtGqxli
 +gK77IVbCflUQQb3C9MT882GG5Q3p/R0n89dLKKOWWgbK9wKbc5he7SamraC/9AnlhV9
 dX9pjwj4jH46mhnSfQ6GCYJhRdNg004rlMTxs2nMLSeMqfvMQpvkX+NavbqMC+aTUh/P
 /Eblq+KLP8p1JoCIXhjfFGPj77Hxt8prZtfwIOoaTPr3zlk45j1ZYfwwmdrVFMt1Z+Mo
 3EkP5I1aYci3FTEa7649icti2x0XS0MSzXh6v4Vso/ES7cpwRMss+0B7CEsaguYDoEeE
 dRBQ==
X-Gm-Message-State: AOJu0YzITJVqdPhPEDOAwxAgH0eTY7+cNSIHsW5GrcQv85hb4WWwY6SX
 t6UTRGm9mv+XRCmpZpIJRV/YK3dxRXL1Dw==
X-Received: by 2002:a9d:6c99:0:b0:6dc:143d:4a2d with SMTP id
 c25-20020a9d6c99000000b006dc143d4a2dmr304631otr.16.1703724322140; 
 Wed, 27 Dec 2023 16:45:22 -0800 (PST)
Received: from ?IPV6:2001:8003:c020:6900:12c1:9684:874a:fb3a?
 ([2001:8003:c020:6900:12c1:9684:874a:fb3a])
 by smtp.gmail.com with ESMTPSA id
 r18-20020a63e512000000b005b9288d51f0sm12044956pgh.48.2023.12.27.16.45.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Dec 2023 16:45:21 -0800 (PST)
Message-ID: <6d586de7-90ee-4a41-bed9-51c3603a1673@linaro.org>
Date: Thu, 28 Dec 2023 11:45:16 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 30/35] target/arm: Mark up VNCR offsets (offsets
 0x168..0x1f8)
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
 <20231218113305.2511480-31-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231218113305.2511480-31-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 2rXUm6C2KCJ0

On 12/18/23 22:33, Peter Maydell wrote:
> Mark up the cpreginfo structs to indicate offsets for system
> registers from VNCR_EL2, as defined in table D8-66 in rule R_CSRPQ in
> the Arm ARM.  This commit covers offsets 0x168 to 0x1f8.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
