Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4654440ejb;
        Mon, 6 Feb 2023 14:52:15 -0800 (PST)
X-Google-Smtp-Source: AK7set9Z2ZtaMApb3WoV0J83dAZeQVea12aymDQ4agGz0oxItjdi4vv9i8BkE/5JTrLZ0kZaiSJB
X-Received: by 2002:a05:600c:3423:b0:3e0:185:e916 with SMTP id y35-20020a05600c342300b003e00185e916mr1206722wmp.13.1675723935237;
        Mon, 06 Feb 2023 14:52:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675723935; cv=none;
        d=google.com; s=arc-20160816;
        b=xbE9eX2fbJDlaURRApbt8ZpIGR/9fd9Wkli9PFclhhWuPcnpwK0qrt7lU4nuxuViKJ
         xYxHz+XMIAlsPeLH46/C3mZgNFm3gYYwcMDDO6nuoz5OJCkc6wzPHfUnxQm3cS6bgMKH
         9uh933KsIJX5F9YX+0ZdDhZGn84bMcwUB4wLFlTx0clMlxzJK8ykq5WyZj6sV7BiQG2c
         heTUpMjMFGSiVYoQ4pfX7xputV1DaDsaoFKaIXzYDigzg51FnizMzb0kcGZy9razec0/
         xypozzwyDQ2yRmk1tmS5/o0u+knZZh3Z4QnVWwGxnsVVJM/pWupd9sRKcKZ7uPau4L37
         zUDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=GJrjy2s0yjMOXAWetmdDetDS3qzVo1eja11Qp8PyQaE=;
        b=tuZ8h1Ici6LDjY077MsPNjWU1zcXxR8r5AV7afIEZeD8a4cJ0BnLkKYIjB3PuOLLVE
         fP30cbsjA4nZIwxS/uv8BmuzhSnPrD+GQb6VzxidVu37k9t411l9Z7PBaCw4q8hndCkP
         PzpPCjhai4kVsl0omvzhH6wGeYtI//2JB2RPNwH/e43qJS2V7zV87IEd2sP+6Y2OCI3a
         fNtM5H/qPatF4oACxzjEvptRnVMFWBJMb1FQekInIbo48IKQh+bxe4PC/sLpFfmCgkG2
         qNGMbdloK4aD3Bgtlz+CHZNPRnhngV39IG1da4Or765P3KQtJEstYKeWdNya7AALDxHu
         Q1rQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MaRxdj7y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c64-20020a1c3543000000b003db046fc8a7si14314914wma.112.2023.02.06.14.52.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 14:52:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MaRxdj7y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPAL6-0004UE-U6; Mon, 06 Feb 2023 17:51:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPAL5-0004Th-Ig
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 17:51:55 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPAL4-0007Ef-51
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 17:51:55 -0500
Received: by mail-pl1-x62f.google.com with SMTP id r8so13815247pls.2
 for <qemu-arm@nongnu.org>; Mon, 06 Feb 2023 14:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GJrjy2s0yjMOXAWetmdDetDS3qzVo1eja11Qp8PyQaE=;
 b=MaRxdj7yFGOHIFIcId4CgBrj26voF8s2e296IBxMaBMl3UJcs8c+IEb9DvTubv2ab2
 DEywGmGEy9vZA0GdXeS3CmQd/deF6Vzo5pAAXaWo5NkoXGrNl9dMVb6r2WZpHesMKKar
 IkmcvQl14Y3Vd+gBLa8BLRx2DSWNg6ZxNf8uL+1ccRZEmPxWdOHJKHkIRQIVZ6cBrgYW
 NTHW82WLucg3lwajRtkaxVmbB+J5owAwHa2zqHBnhrJfCSxnwEcBToJ2yXL/LNJOpk5p
 dY54SoOrfNDsUZWcRB3ywhvC/cLvKb3WL3YE4QW306TB3natZ+nchNjAXUneBBIb8VQu
 FAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GJrjy2s0yjMOXAWetmdDetDS3qzVo1eja11Qp8PyQaE=;
 b=rXpiRctnnqKc+XbmRrCjyLtAHiSbofS8tZkI37PWaBy3G37twyjVBJmVK7QoAKYFro
 AOGOJpnGRtlIur8kVzHY1V5rVHaUGReBEmWh8ZplO6KdEXJTBR7ED1ZmrfmUfZt8s7ko
 KB1XWJulPIjGWgONvcf1t8eMrkVVNH6OUONiMfLGtiEjgxwmNB9eVqW9mNmobxIMvHEU
 z1sAlyyjX9bMyaMpwX9tLUwGvMut1bPlwjZFcANnJj4BARM4Y3ifjnCfVllyu/OjX0Nu
 MxO0m7YYUG2yqPyTE0cUN8sD8ddXFxOdsJgvW5L4OU2MumdKczC4jfDEkNr7TiVLlZaJ
 EnwQ==
X-Gm-Message-State: AO0yUKWrSei1o7hsA2i2Fn44VAM1recnKckWVQRTj8mJ38SN2hztYnjZ
 UNSMyNrJKHGPCHVtYMbcvqxHIQ==
X-Received: by 2002:a17:902:c40f:b0:196:e8e:cd28 with SMTP id
 k15-20020a170902c40f00b001960e8ecd28mr716377plk.15.1675723911912; 
 Mon, 06 Feb 2023 14:51:51 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 i13-20020a170902eb4d00b00186b7443082sm7429048pli.195.2023.02.06.14.51.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 14:51:51 -0800 (PST)
Message-ID: <1a98301c-2d5e-591f-76d4-4f4c4a0b25ba@linaro.org>
Date: Mon, 6 Feb 2023 12:51:45 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 01/16] hw/arm/smmuv3: Add missing fields for IDR0
To: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-2-smostafa@google.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230205094411.793816-2-smostafa@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
X-TUID: zhGZR2yrJozX

On 2/4/23 23:43, Mostafa Saleh wrote:
> In preparation for adding stage-2 support.
> Add IDR0 fields related to stage-2.
> 
> VMID16: 16-bit VMID supported.
> S2P: Stage-2 translation supported.
> 
> They are described in 6.3.1 SMMU_IDR0.
> 
> No functional change intended.
> 
> Signed-off-by: Mostafa Saleh<smostafa@google.com>
> ---
>   hw/arm/smmuv3-internal.h | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
