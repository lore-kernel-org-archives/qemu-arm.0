Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1049749lfm;
        Fri, 19 Jun 2020 16:49:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvL0jWK0AahPXD2IDjYIH7fNbiw6iHILuPSBFlfni9c5+uilpfzURA+9J0USl5wBjTSbRt
X-Received: by 2002:a25:6403:: with SMTP id y3mr10400536ybb.229.1592610563641;
        Fri, 19 Jun 2020 16:49:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592610563; cv=none;
        d=google.com; s=arc-20160816;
        b=E6zLK0H+4uq5MehGWQbLhmAROQpA+zw0qgKE46qt6N710ZSgQxPE123aucfEZgANU2
         +yWhkRMtObMnsxOCdrWQJii1/i7rCt0fyHgh9Ql8QVaqEj2itWHpQPXXrM7Plf4ogTvV
         TFzPIjIyuHVV+0LIp38ptvoz/oTMLURfbcW/ci5YayL1iGVRJUJWfAY5fVlFwbiThBMW
         MleRQBr1QKf2givRaSlFYjp+Q0invtJMqxGJF9cHOXfc9Clp97VIGTE+EJORMO1jcYF6
         6AoEyIG2PPTO++p82xsAU9tmGo6qH4eDPmPXXQD0I5nitNchu606W236MfCOGW4p+pJn
         Va+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ZrUb4mVZ7oNyan2Iv1NaJOSPYluolnMx4WvDAxpWFss=;
        b=RPPbQT9xxO1AFLOmcQ/oAKdKeSZAIYQMgCCyUCqyIP+WMHfqMyWCxn6WE/HSFArTuk
         U8Hl1YctTis7vWYTFZUgqVEl55yLKsZ3fPcyHhxpuX4LdiiozwRBBTkuPO1v4xQKUH8y
         Qebxws3hd7NEgs7Ln1hYrn6L1d5Y52uVyNzRrq7Qq/OjZx1Z6BzTNwZUpo1uPRP40ucJ
         Nc0uZOUKhtZkC+lh203Q/RapqstvJOBq5UNJbQzWnpa9nTpZHu5yCKX7reoIGBkHrZ57
         e6o0J3XdzMoCuAAaotjuhnk1Lk+lBt5U+0e0fG6b6BcYgCZEDirNZg01hkPUPRNM8IRu
         00RQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eJyVgnkL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n131si6349857ybg.50.2020.06.19.16.49.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 16:49:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eJyVgnkL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmQl7-0004B6-UE
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 19:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmQky-00048V-3k
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 19:49:12 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:55872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmQkw-0003A8-Gi
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 19:49:11 -0400
Received: by mail-pj1-x1041.google.com with SMTP id ne5so4749304pjb.5
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2020 16:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ZrUb4mVZ7oNyan2Iv1NaJOSPYluolnMx4WvDAxpWFss=;
 b=eJyVgnkLPsz2+Y7WPmqySAQs0Lsw3Pl2yH1lTJMNl69neBxn+At9DMb9w9Iu34fSka
 WpK7Y4KzJr9rRmk4+G/HKSBVRo0R9h+eGE5uG4WOM1/nLx92QNS6WRwK+xttA+6u1RVl
 Nu9oFmYbvmLMvA2+BkQf3ikqxBTKMqZIKV/YNuLZIUNq6A5t7TDt/F4W5q0oiLwv4x/G
 gsJ0vuT3Tu43vWsOgs6qYzEXNKteIK4vDeX43Acod1tgq7nU/w71BWtY2wyXWXpRxN6/
 3mZqq5BhYI+qczb6RzfZ+FuNTwOr6xcqMvydll9pBVgekWh8DIQCEt8xeoHZKGeFR0KH
 3xhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZrUb4mVZ7oNyan2Iv1NaJOSPYluolnMx4WvDAxpWFss=;
 b=LEszTnxvGdXdPOz0ZPKBya/SviNTRO87jPuKG5fDwOW2TXzPtxHtVAJ01I9pwtPiug
 XjctqjBKe5j2LhvStPOlq6IRW088NYOIiFq8f6GXtl7FnnbXuHxJZXocFRCOYwPSkKj+
 gJPZ9A141rKWLhcQIT5UkKkeb2hntZ3yCJdSF4KHBV7hE5/KfXkXBBdVn3D3pchSUzFq
 8kw3oPs+0CZgUig5atszaqfBltFzGgjgbxAV8cL2kR7gBRPl3jad1wJTua2KqNjd6Mvw
 m8sHumZft/nYN2SgZwplzCaysKcY0aL1Laleeub3HI0JaWHdFNYfIhe0fJL0CmtRy2HG
 x7OA==
X-Gm-Message-State: AOAM53218YhXgH7UjGZBQ1Hm3Ro+LLiVjTZYN8J7ujDMvNncDQMgPPZ+
 8X5r1MwXVXnCn5TISSSa0lBz9Q==
X-Received: by 2002:a17:90b:ed5:: with SMTP id
 gz21mr5719564pjb.214.1592610549157; 
 Fri, 19 Jun 2020 16:49:09 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id z1sm5799139pgk.89.2020.06.19.16.49.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2020 16:49:08 -0700 (PDT)
Subject: Re: [PATCH 17/21] target/arm: Convert Neon 2-reg-misc VRINT insns to
 decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200616170844.13318-1-peter.maydell@linaro.org>
 <20200616170844.13318-18-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9021c24e-052c-3138-7dae-f45ceb5b147e@linaro.org>
Date: Fri, 19 Jun 2020 16:49:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616170844.13318-18-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-TUID: 9MRfSHrjFyws

On 6/16/20 10:08 AM, Peter Maydell wrote:
> Convert the Neon 2-reg-misc VRINT insns to decodetree.
> Giving these insns their own do_vrint() function allows us
> to change the rounding mode just once at the start and end
> rather than doing it for every element in the vector.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-dp.decode       |  8 +++++
>  target/arm/translate-neon.inc.c | 61 +++++++++++++++++++++++++++++++++
>  target/arm/translate.c          | 31 +++--------------
>  3 files changed, 74 insertions(+), 26 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

