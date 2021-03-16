Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4661093lfg;
        Tue, 16 Mar 2021 08:11:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmfPQVjYU5j0DVab5VarK6lVB6ZIueIiwAvFaOhDvE8pLFx4h+6a4GssHPtRNJcA0N0Kui
X-Received: by 2002:a17:906:3f87:: with SMTP id b7mr30059172ejj.139.1615907497124;
        Tue, 16 Mar 2021 08:11:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615907497; cv=none;
        d=google.com; s=arc-20160816;
        b=0hOtt5OGiSuMzMLXnQ0uMg0iZ3Hdh/Q54YuzVMTzTM6x0Slc9RPFEamGsJyl1Q/VR0
         ERhB/cr0uioFz41WSOi0L9A6gCGm/LlQzGImL0iWy6G6rqJkaGWohLB4fMi0TySBGHAp
         vd1WA4MBjBAc14xkmbRsLPCKjUQEdK1fJkXaIc5U5p1mKnVUyWVGseE5RfTGFT4f0uk6
         D/8SB1Ty4Kp5rCr4VqcBOC8Qqj4TumRwxi33tq9CB40egE79jBnViUQAg7CFtMSVrh+3
         H0lvTA1ZW/yrMbD+yLKVadjnpq+1fVhELLKtwz+pH9tOXbbkyePCR9L0Y0wbEfG2XhVp
         InzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ohjRda2QTMvI+jY72KIMfoONp39ZRUpUXUK7QaFzMuw=;
        b=U4gUCVHBV6YivWslz3JtAkCWUiJyH7e1hbsMJADbwqCeeDMXMcAmw6Lh7aNqOZaBuX
         3hEZ1KaYJ98nEw0sQSpLPEC5nLf6CKAQnlgnTuLEeP33Tu1i9xJbFPjbtzUeHA2Eyx7G
         1T+D+Ug/A9LEU4gHVtdn0tWBnVAYAJbGE5i2eaO7qLkF4clH5vKw4X7S/ymByTVgt/qo
         1OPBf4PQ5h5FkLBnVq9GVeSHMQ42iCOhRSzoL1UO/pFuCq1DJxbkXj2Hfy9KAnLOEbn/
         EfAG2rHib3wWyDM85k/Prxhoe2cvPs3q2BS8jSVtgP0T2KTgNukvy937+AW3zZZOYZmY
         MfuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r73BaoY4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g8si13748293ejx.558.2021.03.16.08.11.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Mar 2021 08:11:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r73BaoY4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMBM8-0002sy-6S
	for alex.bennee@linaro.org; Tue, 16 Mar 2021 11:11:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMBKd-0001oQ-Py
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:10:03 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:33538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMBKc-0004Um-15
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:10:03 -0400
Received: by mail-qt1-x835.google.com with SMTP id 94so11857178qtc.0
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 08:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ohjRda2QTMvI+jY72KIMfoONp39ZRUpUXUK7QaFzMuw=;
 b=r73BaoY4FUy//7dMC3Z/fBRRPHY4nE0loE2A2Umrf9JJi3q71izPNKC+fsWFOj6VBE
 bqctDSUSsZPmbAN64jgLKqYesbJAACD1wNZJLfq7vWvFJx/6q4tabenG+NB34lewfhfs
 S6219LnqaPrVgrT5CrSVzoobmz8pwifQR/zecS3XduBST0r2K6uyvvWZbCQsgAa9dw4a
 WVg7q+dM8i3L7g2GUJkEqDLg4u48BmMVyxmk5mdRTQQeFP1xj6MTD/FD/2EnrGZ657Zb
 rap2o0tg5LivaXPLj+BBOc8NCKdmWXaFfByZ21ER5GVlb3Q5YvaJxdo0HdhE5L7Q3MJg
 vNjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ohjRda2QTMvI+jY72KIMfoONp39ZRUpUXUK7QaFzMuw=;
 b=ZPuA3/2iLeC7Pt8DcYHF/wH5r9goaVYVtAhYh8F31LmOyunNcGNuIyoRy0Y0CH01AU
 wsxp8SwMfZ8raTHAvy8hn0g6JZyuDsBs91d04h/i5OQYQRqp5p7xbYMYVPQmgAXIAXny
 k5fBMRCVtguT2q2KvKxzwTyM2WYqM/G7g30GuOh5e2BjYdBt+5MI2V7ixy4J8iSIhyvT
 lgirjZetT8eIq12MAVByc9yx3zfKMpAq2Z8j4uN23J96y8i+lDHwNgTnWNy9LD/0XXYD
 8ZYwjibFFJnA9ozXzOwV2FRrBeddkD8TeNHNcJscj0MEx6JHgrg8oaqGhx51EIyX3Lo3
 8QMg==
X-Gm-Message-State: AOAM532Nc13gSrza9jrwYQb6ivqGTR7ekykqwlwGzw05hebXXHKgDaUY
 9CRRvFo2Fv2P3K+XHCroWoflwiSOn56Ez+aR
X-Received: by 2002:ac8:568d:: with SMTP id h13mr122511qta.139.1615907400990; 
 Tue, 16 Mar 2021 08:10:00 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id s6sm13549465qtn.15.2021.03.16.08.10.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 08:10:00 -0700 (PDT)
Subject: Re: [PATCH v3 1/3] target/arm: Add support for FEAT_TLBIRANGE
To: Rebecca Cran <rebecca@nuviainc.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20210310002917.8876-1-rebecca@nuviainc.com>
 <20210310002917.8876-2-rebecca@nuviainc.com>
 <3930c2d8-8972-0acf-7a48-71803072a559@linaro.org>
 <970813ec-f190-6faa-e1d6-763ba3a6ed60@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b57d6395-8487-6b1e-f202-856ae13614af@linaro.org>
Date: Tue, 16 Mar 2021 09:09:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <970813ec-f190-6faa-e1d6-763ba3a6ed60@nuviainc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x835.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Lzn7MrCD56o4

On 3/16/21 12:20 AM, Rebecca Cran wrote:
> On 3/10/21 12:24 PM, Richard Henderson wrote:
>> On 3/9/21 6:29 PM, Rebecca Cran wrote:
> 
>>> +    uint64_t addr = (value & 0xFFFFFFFFFUL) << TARGET_PAGE_BITS;
>>
>> The manual does not explicitly say, but I'm certain that this should be a 
>> signed address, when regime_has_2_ranges().  Otherwise it would be impossible 
>> to flush a range of kernel addresses.
> 
> I see other functions have
> 
> uint64_t pageaddr = sextract(value...);
> 
> Would that be sufficient here too, or do we need to check regime_has_2_ranges()?

We need to check the regime.

r~

