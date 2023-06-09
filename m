Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp561572ejb;
        Fri, 9 Jun 2023 11:13:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7C0Lg6mZbT8B1GAHvOJ2UP/A161N1/55eS1IrkoTITuD4Oh1m8YlVaHfEtg5Yrli+sLe5L
X-Received: by 2002:a05:620a:608e:b0:75e:b9b8:ab57 with SMTP id dx14-20020a05620a608e00b0075eb9b8ab57mr2226960qkb.70.1686334400698;
        Fri, 09 Jun 2023 11:13:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686334400; cv=none;
        d=google.com; s=arc-20160816;
        b=xXeNMJBXz1vcw1WF0C7ckAD5gH1LU46ib5NJnPVlscckAV7yvqrusKc5iXCxXY8ntF
         l4Usw+eXFw5quxKr9oW3rRAy6SJZXHMrMUFJvL+Hty4/ZSCFDegII+aLHVu/ENTM09zW
         IRAvxGn5yzK4IZbT0zOud4gbYHn9IaRwP1zBwLHS3XfIJppoJjrNwGkW52Vu54MiEnWR
         k/sBSpmgVZGhekadwVgcJWbAooZD8ZYypAF5AWcbWjanm1uiLi+hugcpj6zMYf92smTc
         6RafJbX9OjqcioCnwx1hNNoZGnGRSWI94j9/NuqiZdNwHLrwNHcOaNeAO8LudGgyknda
         U2jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=HX56R+b2BUJ4yqTWmIzO0Zy9fKdPv+qHkThSDlaNP4Y=;
        b=HGGTFaf7TOJDtlUFqORqm8g5cVXLxlfbAZq8sHdncFHRNFjPHLjnKFgqXI3xpGOIhJ
         RWSSqP6Fr4u6/g8nD1NjW9ROyZGC00XfOUYNwffB6UGBQ+NZ9jhJqGq+oToYmbaYsKMe
         ParLGB/3LluyogaunWcZx9S6rZEleyd4yUfVusJnNG0rWDKWDjf31Z6zG5McbX4Rz6o+
         sWA8I8YyUZvuBiCt6eZTBnm1n7gcNGkK4GutzHWWZxjv4IL+ovfwEElv9v2VA7wCGEdQ
         Ru6AitPdGrM0thKz2IRdVEf4yipyLeoSmCcm5C+PL+6pW74bbB3tuCfxX/O8eiMQBO8M
         /UbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A2b2Y66u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id os7-20020a05620a810700b0075ebc11c85fsi2566891qkn.543.2023.06.09.11.13.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Jun 2023 11:13:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A2b2Y66u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7gbr-0008FE-9t; Fri, 09 Jun 2023 14:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7gbn-0008Ek-N3
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 14:13:11 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7gbl-0000qZ-US
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 14:13:11 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-650352b89f6so1662548b3a.0
 for <qemu-arm@nongnu.org>; Fri, 09 Jun 2023 11:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686334388; x=1688926388;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HX56R+b2BUJ4yqTWmIzO0Zy9fKdPv+qHkThSDlaNP4Y=;
 b=A2b2Y66uD1057ntc7Wbu2xoUZBIclrd1dIP0k1T8eWRd3NSStHHoSBqosOlOnLZEW/
 oI1J2aAdk/Uvej1fsERNA1Uf3rQTImqTxChGGf0JBZ0CFEReIjyzZig/sSPoU76+cReY
 bCPMpiAS7f9R4aLYmtPg7BGBFetYv8zh21KxCq1ldlOUjaxpTuyLFBwQuRmcmOk9Ah31
 tU3XZxtAm2deEK2ArAMMDMbd5W1JN0iA3cMG3E6+GpAlYwF74kL2qvDUjMdTLPYLVQ5a
 e9cDuFpMyhDwpxwS01H6yt8/axSQgSgxhCRAWONNHrUv28C1wv8zczEuldsxNmORtBni
 s31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686334388; x=1688926388;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HX56R+b2BUJ4yqTWmIzO0Zy9fKdPv+qHkThSDlaNP4Y=;
 b=TGQ1+vfZWDsBnSQWnCek2F3L2NWKzd9hbXKnrs96VeLpuwnc74bKkipj8c8TvoR9Yp
 arAycCxlq8C0gepIgPoHQCYNH8uXO7zDmFT8gXitL30Xoj17emzt+U234k3NZszxcY+U
 ACGtpdM4Mr8oRI+AwemgNa4CQ/FxdEoLh6we17rgjLyKxn5MaDe+eTyHN7fRQ2Dw1bmb
 pvW1nXvM92jwEVgt8XQLqXTFXT8YksQHD/y5q3Ubk/E2GCHW+od933BCsbiahaaHyY5e
 pWZdSEtoRGFhsNI7Ov9DVL2HXZEMbQ6B3wGCV7/SNYUKrKMHSTkLJAvAkuPVIF52JZKF
 2wvw==
X-Gm-Message-State: AC+VfDyjXLhxm5ILc4CMftI/NaFiOyrolk0kDSfsTu9Peuxf4vQ0pLa0
 J0jPVye48nnjblnI/0jhUJhbYg==
X-Received: by 2002:a05:6a21:328d:b0:10b:2214:7ab0 with SMTP id
 yt13-20020a056a21328d00b0010b22147ab0mr1966717pzb.21.1686334388350; 
 Fri, 09 Jun 2023 11:13:08 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:20be:c4cb:f609:8cca?
 ([2602:ae:1598:4c01:20be:c4cb:f609:8cca])
 by smtp.gmail.com with ESMTPSA id
 p18-20020aa78612000000b006414b2c9efasm2951166pfn.123.2023.06.09.11.13.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jun 2023 11:13:07 -0700 (PDT)
Message-ID: <c2b0eaf3-94f0-8b23-0eff-435b79060e97@linaro.org>
Date: Fri, 9 Jun 2023 11:13:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 02/22] accel/tcg/cpu-exec: Use generic
 'helper-proto-common.h' header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20230609104717.95555-1-philmd@linaro.org>
 <20230609104717.95555-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230609104717.95555-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: cR9unEr8fPfm

On 6/9/23 03:46, Philippe Mathieu-Daudé wrote:
> We only need lookup_tb_ptr() typedef.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   accel/tcg/cpu-exec.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

prototype, not typedef.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
