Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp5680604lfa;
        Wed, 9 Jun 2021 12:30:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrfnafoUc2NRv8qAEHlJsV+w0ToEHHCLZURjcAp6tFLiHSWWmwzYV5nYqrgFnbGXErxacW
X-Received: by 2002:aca:c60c:: with SMTP id w12mr797967oif.59.1623267026412;
        Wed, 09 Jun 2021 12:30:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623267026; cv=none;
        d=google.com; s=arc-20160816;
        b=hv4DGtPlUgH70P7XyfJocIw45k5ubQXiAdeo1t5f4YyhfJxGSo8Eg5TAQXHvrOetUG
         VNDSLgDV80v43asyrC79QoDgQHFjRETwuxyHGhdv3DvNm6KzwEd7ya+sbSMSNgehYxvh
         OM3WBd6jIwtaRyUESEkzHsyTaH0gMXnl/voWMRURpmkvv1BFIkByWUqTZ46A/M5HefYa
         ysxElOVD/89qdciY3871VJlMR/Co1zmvXouVlwylhdcwE2/GEYz8JQv6UfMMeA6QoNQ/
         MN2vIQ/UBd6hIRzZ+xgJYD9Ufv5g/Xs44dqqtK3mHLikR2fj8LBPzKEMJcpQJb/5x1Z3
         9dYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=yP4DVEcItaeDrrHGxmyJMLboKhuhWbkjnVOyHY5sdI4=;
        b=WyuWisQxe83K807ikM9WYeGUPJiefTcY9Fj3u3jxTUnDE/HuTmmnxlAcAZxKSpor74
         WrWvZN0zsTBHX1EfZdJNpBBn7IEQg+EIHIxEoFGCCDV/Umvs703YzT5SnTx8pqrcx1/w
         sLt+8FR8+9jy9hWtmiCDvfr8hGNzWfzy7pBmtnnhcmCPeDsgbiOErkcvKPXrxsF8COTj
         9JfqbK4OOzdo4c54Mhm+shuF43a45QKnNHZNgll3aRJmZejaNJEI+8fndrZCdm3AzuIJ
         CUtccAu3ljiAp8f7Rofmz3YHmPDgji4JocHM84ZAYCNt5JVL9UMvcekAqLwxhpatzc5t
         lLUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ePlA9xCV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v3si951967oth.164.2021.06.09.12.30.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Jun 2021 12:30:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ePlA9xCV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lr3uD-0002ty-N6
	for alex.bennee@linaro.org; Wed, 09 Jun 2021 15:30:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr3tp-0002sq-7i
 for qemu-arm@nongnu.org; Wed, 09 Jun 2021 15:30:01 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:44872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr3tm-0004YI-Jc
 for qemu-arm@nongnu.org; Wed, 09 Jun 2021 15:30:00 -0400
Received: by mail-pf1-x42d.google.com with SMTP id u18so19263794pfk.11
 for <qemu-arm@nongnu.org>; Wed, 09 Jun 2021 12:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=yP4DVEcItaeDrrHGxmyJMLboKhuhWbkjnVOyHY5sdI4=;
 b=ePlA9xCVZESSMFotnvGr77J818TjIQ8l50oABFjgdv8X0jWXmFMA0cgTyo34hvpyXK
 4HOemf5joZYyTeG3M8pKlTH4Jwp1FFfLbU6pmR3oTQo4084P2dILwIsCGaYrHk9wSXmX
 r1X/yJTcWycwi0WepcWHj9UwvZh40JFo+5rEgBYGxnfrHtpJUbcRmHokelbsRcXK+WoN
 DYOBKvEfUkIyj33PViKBjpBsY6vMLlEK7rugfX6DpcwooSdDbPZPy0S08trl5KYQkGBG
 Z72XfP4ab/b7Le4Mf3owtuezpvlOabvXFpVkaj4kTNFhrnNjww+JyfqqJCdtXDXxgJp5
 tlpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yP4DVEcItaeDrrHGxmyJMLboKhuhWbkjnVOyHY5sdI4=;
 b=p7lp/UY005nOwUMboxcq3dH4nH7wY3eeqNqVH58flnr3vw+ur0ujQ6ATXM7K8001SE
 rBQpk/1IdgCcA8JiK2tSPYluOME18fadQlWAB+uxocY4x9ULADiNiBL3+qkL6ZEdWDqu
 LUeP1k/m4RLoWvfLwEach15Gw7u8TCFpZ2GRlkywshEHJ/NBfZNmIrx9xFx6+Ilu9O+G
 DuqLG0B2n4kI2y4E84Ny7Xm5VZKM6rgBipaE9o+dyEqnPuE4MaqSjAMm+iVqyi9hq59u
 LFTjU6e++Ob+rohntAbX4brlqKHB/jCZRXl6c8Z5XfettjZlddCNdW2mat+h8nH0o4lg
 UiGQ==
X-Gm-Message-State: AOAM530g4Sgy7Z5IGhlPPmzQv+dXHMJ/5X7mAMfS+m4KVsU6AcCOgKme
 rx9F1gaMJM0vkkiz0LMH+VIefnDoIC376A==
X-Received: by 2002:aa7:808c:0:b029:2ee:2ceb:6bdc with SMTP id
 v12-20020aa7808c0000b02902ee2ceb6bdcmr1374103pff.42.1623266996939; 
 Wed, 09 Jun 2021 12:29:56 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 z28sm322868pfr.76.2021.06.09.12.29.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 12:29:56 -0700 (PDT)
Subject: Re: [PATCH 44/55] target/arm: Implement MVE VQRSHL
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-45-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1c62424c-070c-78af-a956-234b62593138@linaro.org>
Date: Wed, 9 Jun 2021 12:29:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-45-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GUNrPixRAWNi

On 6/7/21 9:58 AM, Peter Maydell wrote:
> Implement the MV VQRSHL (vector) insn.  Again, the code to perform
> the actual shifts is borrowed from neon_helper.c.

Again, there are helpers in vec_internal.h now.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
