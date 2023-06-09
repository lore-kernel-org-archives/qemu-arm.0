Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp564355ejb;
        Fri, 9 Jun 2023 11:18:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7TOgaEmWNrCW1z5GuZjKBTb4n00kMho1DUKl09zEilhni+Dhk+9MAlylmrJMAIOfExUQZj
X-Received: by 2002:a05:620a:40d1:b0:75e:ba98:ff38 with SMTP id g17-20020a05620a40d100b0075eba98ff38mr2723747qko.21.1686334713904;
        Fri, 09 Jun 2023 11:18:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686334713; cv=none;
        d=google.com; s=arc-20160816;
        b=bZXvapyLSBCeRRRW92q3rJg/mUHbuAyOI+TluKFQ/n6Q+/RgVXeMpz4ikZHcJ+REOj
         D4BA+QDdhdk1wARq2BVhA2x8ej0etpZ1rTpTlZaLd6RQG0Clv2OzipfEOM3W5nWnUEwQ
         u5mLxFLIw2eYYIqivocNlpIcI7ia/oaESnOECmyvMfQ3WrmKAFeRfhpV4NmDLn/AVgct
         TZcLdhqh1QVcKwqlg6Teql+G/XXd25BaV7gmvb9BA8XWbxBjne+ydPewfasbl9iF/wbs
         ccaC2eDT3dxVB3FOya6uwySMa9lyiWLxUDJQ/AwhiBNh3PpO5TFXlkSvApdZNH0FoNCH
         a0sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=G8wZ4asomBDhR0d4eGk9eBfi5gd7aSScwLvh7FyqeE8=;
        b=yVefr46+XhlB4uJey/tnlZzeHol+jB8nHn7rgXCKIhHoAYlE5r0rxLY8tzcxq8g9tp
         NZjcLCW6moVMKJ+gb3J+aTVHt9HesZyGxJyJRNf9SZYBNkytPZhGRaU72kZFwMfTGqEU
         o2DNTO7CP49ecWHJ58zrdGTrFVJ3O2GFGEBhywj4HNb0tc6RFjFXJHsorgEq3LdvnQHF
         i6YvHxQpQ44Y29K2pOv36RVslRCLd3WDPjfw21Q5+XAoa+eNOMK/zGtG2Wl+L3SW+PMH
         bluDNOjQHg0UuE9GeYTNuf3NLjSjVIqa8rpn+o6UORKvIr/u853jI09GoLTIn7KyosxI
         hS9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y4X89W2O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v24-20020a05620a123800b0075cc231b393si2423665qkj.613.2023.06.09.11.18.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Jun 2023 11:18:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y4X89W2O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7ggZ-0001tN-6U; Fri, 09 Jun 2023 14:18:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7ggX-0001sy-Ja
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 14:18:05 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7ggW-00021S-2x
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 14:18:05 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1b00ffb4186so8266335ad.0
 for <qemu-arm@nongnu.org>; Fri, 09 Jun 2023 11:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686334682; x=1688926682;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G8wZ4asomBDhR0d4eGk9eBfi5gd7aSScwLvh7FyqeE8=;
 b=Y4X89W2ONUA9zTIYfie/wUIJ0NlIj9H+2kqMaQBzCqmTYf2mqlma0EQijvRW9VzwVQ
 Ml/rawvXzL+Ru0wxlqSTaVezgRvigb13rWWZnanfttLariQT1gK8ZbaZTOXgIVjWm6rB
 BtJE5XMO8BoIpkbF1LJg591pzaWcXxJEfr+S45wqKx2F4ROB4n8M8HO2CwCycfWzKqXc
 Uc48DYziG8tQGSxB6w6KH6iCJP6+PGToMx2YCGhglYYL+aIHHt6Zy57RJ1aGWLT0iBtP
 pNP47v5D7a6NjAjYh/3p6ru43bqcPeubEeVd49XAOcR0yTNPzZZyW3F1E1rsXkOfxKs+
 l7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686334682; x=1688926682;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G8wZ4asomBDhR0d4eGk9eBfi5gd7aSScwLvh7FyqeE8=;
 b=UpHqA0sDzGTNUyAK53DY/YE/8q5H3uby2IdP7e1YMbY9bJTx7fbP/iCV/0jGFlw4ke
 Yr+qOi5QDkc8GkMF0DXmpYRGZCDAcvsYEAwLIvP2aaPErEidmYl9MVhhMojnjiYZJCij
 8xTWU/JDBu0WPAUgdjLIWY7hbhEUQQLuxWAEEGDIO8/b7ahoVGxSGGnwr+YT96WjL9my
 h39+ioWyKLCvZclPqO3rLVMcFH5GJZJzM7IaoLmkzjVYCfzLuUe+aM1Wga7unw58fn19
 psnlZOYkpPl7kRMK9ej+w/eSL1FokelYRWd+TF871DKe99HU9D5/6JSnW6Vu05PzUXBB
 xm9g==
X-Gm-Message-State: AC+VfDzS59nKweRs23aHDZAcJbMFUEopgyfaVH093bHiL2b8tUYTXpLt
 BAnB+C82GUqB8rCgBbqfsyoCgg==
X-Received: by 2002:a17:902:da83:b0:1ae:4562:14f1 with SMTP id
 j3-20020a170902da8300b001ae456214f1mr1905635plx.9.1686334682331; 
 Fri, 09 Jun 2023 11:18:02 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:20be:c4cb:f609:8cca?
 ([2602:ae:1598:4c01:20be:c4cb:f609:8cca])
 by smtp.gmail.com with ESMTPSA id
 ja17-20020a170902efd100b001b03b1bcf6bsm3548369plb.252.2023.06.09.11.18.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jun 2023 11:18:01 -0700 (PDT)
Message-ID: <3c45c2a4-3697-a71e-9c77-3522f60af074@linaro.org>
Date: Fri, 9 Jun 2023 11:18:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 06/22] target/arm/tcg: Fix iwmmxt-related code style
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20230609104717.95555-1-philmd@linaro.org>
 <20230609104717.95555-7-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230609104717.95555-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
X-TUID: LggzErYl2hs2

On 6/9/23 03:47, Philippe Mathieu-Daudé wrote:
> In order to be able to move the iwmmxt-related code,
> fix its style to avoid:
> 
>    ERROR: braces {} are necessary for all arms of this statement
>    ERROR: space prohibited before that '++' (ctx:WxB)
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/tcg/translate.c | 227 +++++++++++++++++++++++--------------
>   1 file changed, 141 insertions(+), 86 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
