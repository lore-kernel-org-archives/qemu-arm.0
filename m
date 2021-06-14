Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2352986lff;
        Mon, 14 Jun 2021 15:02:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwS31FxX/7f4dmDpjFuSh5BpGtyi3FnYh07nGuwVtvfhBcFUhyRbnytMmrumU3vPDtKTPao
X-Received: by 2002:a17:906:a854:: with SMTP id dx20mr17668683ejb.128.1623708177692;
        Mon, 14 Jun 2021 15:02:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623708177; cv=none;
        d=google.com; s=arc-20160816;
        b=li/sbGT1209Vml6e2bL4XTkcCCPzq978cXpINtElnvKn+ujZ9Abx1UFT5GwcDoB5eD
         7fGotMzdcy585qWCG98AWNadsh16bZhBYT7e7PzWTp9v2vjDW99HAR5WdjQPKxkBZYpt
         BHAF17Zn8boYSoBvkZGTDOPbNTXV1pjJbbE8DZKjkYZHzTkmNYFNoEB3RtOMBdwA0Ihe
         lZRqKav7WhU3eGNnChDSkwlctvsqnR6L+aId3rgdrlwUcw8CtnHWN6jDLn1jOI7rTusQ
         4QjZ9O5VGDgsjcFCeW4VTIjbVILjX+w8J2qst0SGdGolTxxzIL76MV/ELYP+tFuXykvJ
         bl+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=1/pch32vfdrFlPimCt7hZX6nadfLwUg49GRuHop949o=;
        b=wsN4kggZTRJ5bt9tB5E3g90qhofF/Y3IJxvFHqbUbtuCeAqckrQXTDm9b74FzHf9Gz
         una3CmHvVtazVAs7Y5odylrxVrmfuscvsy+KrCvAmFWimnIQrWQEDIxJTJ072AvIzA2K
         wGJEWP6Dx4G3XMzktHxn5bSd1YoJrbGUi01SEWbp0WLYqXUU/pIohALdtSiWPwv+/dSF
         F+Yk/YWp/MuA9AXhAFOt2UbWuMXWDvzYwLhku06vgdujy13UILRMAnGETDu7VCKjQuxe
         hRD4LpL0UwSXNgHdg2d76lU6fAVL23s1UEX8XZe54blX7J/0U0fsgRsNpciQERgOiqHd
         gQYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GXZfjze0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cq27si11664383edb.222.2021.06.14.15.02.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 15:02:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GXZfjze0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsufY-0003ay-RG
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 18:02:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsudq-000217-8i
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 18:01:10 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:38501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsudk-0007G4-Ve
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 18:01:10 -0400
Received: by mail-pl1-x631.google.com with SMTP id 69so7370912plc.5
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 15:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=1/pch32vfdrFlPimCt7hZX6nadfLwUg49GRuHop949o=;
 b=GXZfjze0vKIV+WMRVTzNuwzfyOcFwiruOhwyesF+zKTEbHSpnGWEzf0+Qg+1HrWlqN
 NLmGU9Nl9GKQoVs8RHAubY8CVzRP1FiGJD1Xe2CaDRtnEJU55ZCyeYFFT93CfQFZNsIu
 d4RIFh3YnLGy1ljbCiAZLx+t+02BQLe1Dnyx3/yY1S5hwPNMPIIOQLRlqVCMkAU0iylR
 zRr56WX+Tc+rAFhM5mF7Ma6voPFWLHS7EnFg3tZOJbFJiSF/VR9yKq7L7nXlJfe1K21L
 f0p/isoS2Fl2zFcLGfuqxbXkBKYL5/qulb1NcnANxqKBMmvMhnPtQpYFYH895C4U9zJK
 3/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1/pch32vfdrFlPimCt7hZX6nadfLwUg49GRuHop949o=;
 b=EvPkCQwG550piWO+Sw7YTi5nbbEL4MVgGEuLFU9jtfcJL2taIwXIZ300i4+srhsVmy
 fvDRopXJIbWqrs4LA/Bz1kgJYwryPrpzRBzZoTWyiX+YHNf0h17LHYFw2Sg8VuwC4FhT
 vPjJN6x92/ewxDsL7/io2k0p1hIF1aXA+rwkec4Z+6f06Fr8nkMk1MQxpmla580AltQC
 shx9ODu/iEaobjrvZpVJYWK/uFeERdj3jVziO/EcALZ2z1xESgXoGNPDbk/3ON8y9DJK
 FnR0WeCK1Iq3p74LU9IMeQA1+Hy1csxoc6IvUMV/dcCgNUE36oyO6xfs++o6JIMqzkRg
 vsEQ==
X-Gm-Message-State: AOAM531PNekNHlwbEnVPe06m2k5Md79uZjwCPFezQErU9NaYZ9p3xDAO
 iRMJQ15j57YkVIkyr/TrJ3zcTTZr177WJQ==
X-Received: by 2002:a17:902:748c:b029:119:653b:a837 with SMTP id
 h12-20020a170902748cb0290119653ba837mr1131110pll.68.1623708063199; 
 Mon, 14 Jun 2021 15:01:03 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 18sm394256pje.22.2021.06.14.15.01.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 15:01:02 -0700 (PDT)
Subject: Re: [PATCH v2 55/57] target/arm: Implement MVE VHCADD
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210614151007.4545-1-peter.maydell@linaro.org>
 <20210614151007.4545-56-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <216672af-0f40-46f1-7322-1274a169b475@linaro.org>
Date: Mon, 14 Jun 2021 15:01:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614151007.4545-56-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-TUID: lsWaWZ4J6pUe

On 6/14/21 8:10 AM, Peter Maydell wrote:
> Implement the MVE VHCADD insn, which is similar to VCADD
> but performs a halving step. This one overlaps with VADC.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    | 8 ++++++++
>   target/arm/mve.decode      | 8 ++++++--
>   target/arm/mve_helper.c    | 2 ++
>   target/arm/translate-mve.c | 4 +++-
>   4 files changed, 19 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
