Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1999301ejb;
        Sat, 3 Jun 2023 15:49:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5pvDXqZ+8sJSV3ouP253Bf8pzLU5cQ7cXuJ8UA2L2ap6cWyZp0k31Rrf+iSMkzUfBdQQB7
X-Received: by 2002:ad4:5c85:0:b0:623:42c5:6125 with SMTP id o5-20020ad45c85000000b0062342c56125mr3345709qvh.7.1685832595753;
        Sat, 03 Jun 2023 15:49:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685832595; cv=none;
        d=google.com; s=arc-20160816;
        b=a9KpgFKvl8zHoEH/YP/LBQkd6BSXpMU2Dnk28E1acrAxZ88z9thJVOjCVisxUdOrXw
         WHLB+nufXXar1yo24TD8yf/7ayGy6/6bobGebfPG19TT1JStfaGXybbHNmw85w3DBah9
         Mt6TGZ6Crc1jCDFe411Ck9T9dqPebdIEypyXg7I2d+MAUNWfpl6NKbwlNXYT3aAVNmcu
         OnGPMTPMbxatnxyB74ICrW/zQfENDaf3pwyucBClRr0hvK9OAmPOBr3OhFQGzktQM8nR
         3n+zjV+PrYBT8zPd4yXZ881cyW5By2ONqvsVhhb1mqY39U+zrDsP78FFnAc39o9lgT9o
         VjuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=bOkOy9o8UryfIZrMVql7w/0jjDNbMG6AQHpGqjo/q/U=;
        b=nj0C+5yZZlBm3XfVL7YdFoQWQ2fiSedmuNhezD0URe/9TszWWQixL2HCb3Ol5rccVE
         +uSkh4G67vOfnrdt2KRzChnK7j9rkAsnCKwJxGRFCWSMMXm/E2Faz3DlI3VHpdlO1Lzd
         erI2QbQC3HESuFfKNPQj3e7jBq+pPy68umIfXGflxZiJRV06v4/1oS9RFg6OGyfs0vof
         EKPrBcysgGBngntKIjKoMlT52Z3N4jPPv+8/Mg1DqWT32oeWCgVU9Rcoz3Awxd4914vR
         xj0FJvmemwJUVrubejqeUJYhSrarjPqcDq+uU780oqj96NCR3P2PczjHgc7HiDqkMf2B
         pE8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XGmPqbwB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id if11-20020a0562141c4b00b006236d4d93b6si2975544qvb.164.2023.06.03.15.49.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 03 Jun 2023 15:49:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XGmPqbwB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q5a3v-000568-VN; Sat, 03 Jun 2023 18:49:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5a3u-00055l-TO
 for qemu-devel@nongnu.org; Sat, 03 Jun 2023 18:49:31 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5a3t-0002CJ-9q
 for qemu-devel@nongnu.org; Sat, 03 Jun 2023 18:49:30 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6af93a6166fso3296392a34.3
 for <qemu-devel@nongnu.org>; Sat, 03 Jun 2023 15:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685832568; x=1688424568;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bOkOy9o8UryfIZrMVql7w/0jjDNbMG6AQHpGqjo/q/U=;
 b=XGmPqbwB9PmyhV7QLNwgWYhMneAE2UcfAUtNwS7dkvAp/qexZilgvWR25IisdHwkgy
 OswcCoRsy2d9Cr7J+jQx+0otXpk+2rBgEx+GOorKYhBvv/cFui3/T2KsygdEf9wxrZv0
 fvYL6Sp04WjByZGS7lGiNP8nPI8RxAr7275s7+MVEvEEcyhzm53fuhKmaOU+ULay6ECH
 YQC7YFUdpjNcfkbuQqOgGuLouT6s88KwXhBpDgoXQGFDi+D94GCbQzopZC/jkrrYTOQ9
 5oWlrJBZc5AypwufOyAEqJ60TdnTZa76KJjWEyA85rIo0H7p3aDDgL3n7JXTIkPKWPmd
 EP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685832568; x=1688424568;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bOkOy9o8UryfIZrMVql7w/0jjDNbMG6AQHpGqjo/q/U=;
 b=PLLDd6XONJUd+3cFh6G+4ZD+OYUPoouyStKuq/3rZkeaJ7Ln/E9cX3pIRIOteS1y+D
 k9HyIVH2jRCrVOFSa+r5cOGjxM1fhI0xSPstJ/xqTit6MAvmAFS7dP2zrQFfmhMvnBnT
 +MYqJUMe7s/tr7xAKBSobcoReixWJC5+rr5UuhmbOjysP8xLr13Ne48WNp3GY1AC9Clz
 iee5L1w3gXvleXhsDZLzz4kc1mQuL6a+zmYG3WsCvP2GJO2ukZgxJU8R8DxuHv2qgAlk
 +g7/zj+5UqmRwpV3s8HdIXW5fZOyBOeR+aL4KnHqweeROoHt4GB08gVZeR6XBH28OtS8
 fVnw==
X-Gm-Message-State: AC+VfDyTdjMlkuf9mD4MBRtbqhpq0Nc6Z2zhDk++sjlNeM+4sh5/O2pd
 nRMdbxfE7xuBoJuUQjuBVcjqGQ==
X-Received: by 2002:a05:6358:9103:b0:125:9f49:b1b9 with SMTP id
 q3-20020a056358910300b001259f49b1b9mr14636739rwq.12.1685832567873; 
 Sat, 03 Jun 2023 15:49:27 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:9a37:84b6:b3f0:f301?
 ([2602:ae:1598:4c01:9a37:84b6:b3f0:f301])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a17090adc0700b0025043a8185dsm3300167pjv.23.2023.06.03.15.49.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jun 2023 15:49:27 -0700 (PDT)
Message-ID: <6056c311-6c6f-da18-9d3e-90d1ac16a3ff@linaro.org>
Date: Sat, 3 Jun 2023 15:49:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 10/20] target/arm: Convert load reg (literal) group to
 decodetree
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230602155223.2040685-1-peter.maydell@linaro.org>
 <20230602155223.2040685-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230602155223.2040685-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BOs7+RfjGE/4

On 6/2/23 08:52, Peter Maydell wrote:
> Convert the "Load register (literal)" instruction class to
> decodetree.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/a64.decode      | 13 ++++++
>   target/arm/tcg/translate-a64.c | 73 ++++++++++------------------------
>   2 files changed, 33 insertions(+), 53 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
