Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp727660ejb;
        Fri, 31 Mar 2023 08:44:33 -0700 (PDT)
X-Google-Smtp-Source: AKy350YR+lAYrMqHI50b3q0cdntFs7W7i3i3TJU73Pk5YMkRTEwtQH1z0ZK05GUVnSdeWv1SX5wH
X-Received: by 2002:ac8:5f96:0:b0:3bf:c5ce:127a with SMTP id j22-20020ac85f96000000b003bfc5ce127amr41376164qta.4.1680277473292;
        Fri, 31 Mar 2023 08:44:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680277473; cv=none;
        d=google.com; s=arc-20160816;
        b=twwzv2Yryvmm5V8EJbRm4qbgky8ZJJOmZ264pluvxq/U22xWBwgvrzYqQyiFLIbwSW
         CEYIMyYxuKE6yvSsNPdeZrcH0ZaAK8BuCBtSCvx8inywabJJ2Hshyv2Bl4HgNkL55XpE
         y5EnW3enQMThBfPKx2P8kIq/R7DUyC0m1Ze3iueH5a8Moc0130RDhEhCF1XUoxMoA2d/
         lzvU7ki9sNtr/2as2bg1glQ7nUzLQBmJ0X5J92cwCnw99ceLryxOwM3hcmbPCJ5Kpn4X
         //5/hlRiWqi9J3BQKVpVmDGtYZR/XJgW3K+s+is8+6T31awM4iBsRpWxBOcLHkqfue0Z
         W3rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=5XzuonBlNE8e7gvQH6qpIySG6MwpShbQueNx6mNUAAE=;
        b=FQ1RV2zrCphAokPbIgB7OcxEahnej1YdeZuoXNaCKnc0pI7rXiNxKKAVU+LlarJoVf
         Rfh80o8IxR7IqtRoxuDK32EzqrZCTcGK9TJEM7oNfD9J/xNB/RMXkx3pjKWsZL34ub6p
         MJSotkzz73MBb5fWVAMUZxqRJhK1Dgi0vjvqwdZvdeLHuuCup6n5BNI+JkOZCwuyyygk
         ybjD//yAxviGE4kWtcfDB0yHN5hbeGlWm1nbA4kHDngBx1x+XpVkQC1ykfScQlp0T5Cn
         +1q2hgbws1mHjjlvMDHqZI/PWA5GWNXA5GP0qptm13YmhngpPkLEcn/KiLiPTrCm0Yl2
         Utnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LquvyJd3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v13-20020a05622a130d00b003e4e89e39a6si1705820qtk.2.2023.03.31.08.44.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Mar 2023 08:44:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LquvyJd3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1piGvL-0006Qu-QR; Fri, 31 Mar 2023 11:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piGv8-0006O3-7H
 for qemu-arm@nongnu.org; Fri, 31 Mar 2023 11:44:06 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piGv5-0003Vd-Pj
 for qemu-arm@nongnu.org; Fri, 31 Mar 2023 11:44:05 -0400
Received: by mail-pl1-x62f.google.com with SMTP id n14so5736943plc.8
 for <qemu-arm@nongnu.org>; Fri, 31 Mar 2023 08:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680277441;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5XzuonBlNE8e7gvQH6qpIySG6MwpShbQueNx6mNUAAE=;
 b=LquvyJd357l3Uu9Xgmpm6esqojfkaACyuh5IItddde4UONRP2CPHZH0Fxqq3mVbckX
 CXs9UD6u63EfmGPML2lEUe55cdOBwD73CWbx8LzXxTg433tlFsPbG7eR0A5I5sWMaD+8
 s3wejwytn5VGyQvbZpmMoVVG0WliU4HoBmEKa+0YMv1G6I/JAmoc99Lez8FjNFUUHbPC
 RCuNV2rU75vhjJ9M0b13o9G2OgRl/ajd1+i9LSU54UJ4Yk3pqICVtcyRzCzDZyt/7FK3
 3hOFAdZacQv7F5P0JcC8CKH3yJ01wdvu/MM5PdTgbz6OZTzwWU2lpo3dXDXVqrf+BYVk
 xoEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680277441;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5XzuonBlNE8e7gvQH6qpIySG6MwpShbQueNx6mNUAAE=;
 b=OdvK6QbS5geXkFuC7OK1121Ilt4HS+Aehx6saRZcWyLZJC5OOn6q2cENsyw0fWKmjp
 x8UthhG36bBInC347BfVdOuwhoEZ9UcdoA1Z+8vU9H3H/Qnz0WUs+GGi6D2xHHDpL3Nr
 eQHPeqGmQA7x11kaBGyLTMO/YhpyLOSGHbY/8jNw7RxPbfYdRuaWVq+GNzQ2I3Yaohzx
 ZCvZsbc6DKU2RjU10ozJjXjzfK9EeiZs9tikoR8HdFbVOeOyz91VuQzwpOTGdSiO0UCy
 MRybstyg2jXFG3RodDzz0PlFQ9UGNnIf7rigbFbbd+mcjIivuz2B3nKsipW9ETFrANt4
 M6Xg==
X-Gm-Message-State: AO0yUKUbq2ulnbK1/liBvNLpQBY6Z00BUue2DR3decmp+aj6R7xsFkln
 H9tZ/IG1lluTfouxjnLTdf6qoQ==
X-Received: by 2002:a05:6a20:78a2:b0:d9:4019:1dd2 with SMTP id
 d34-20020a056a2078a200b000d940191dd2mr21298404pzg.24.1680277441410; 
 Fri, 31 Mar 2023 08:44:01 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:b714:1fce:85fa:2fc7?
 ([2602:ae:1541:f901:b714:1fce:85fa:2fc7])
 by smtp.gmail.com with ESMTPSA id
 k14-20020a6568ce000000b00502f20aa4desm1763624pgt.70.2023.03.31.08.44.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 08:44:00 -0700 (PDT)
Message-ID: <e7d7951e-4941-2bc7-aa6a-7c7d10fc1f70@linaro.org>
Date: Fri, 31 Mar 2023 08:43:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/3] target/arm: Pass ARMMMUFaultInfo to
 merge_syn_data_abort()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230331145045.2584941-1-peter.maydell@linaro.org>
 <20230331145045.2584941-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230331145045.2584941-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: ivOiB/oRmS6k

On 3/31/23 07:50, Peter Maydell wrote:
> We already pass merge_syn_data_abort() two fields from the
> ARMMMUFaultInfo struct, and we're about to want to use a third field.
> Refactor to just pass a pointer to the fault info.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/tlb_helper.c | 15 +++++++--------
>   1 file changed, 7 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
