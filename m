Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1849266lfc;
        Fri, 28 Aug 2020 16:05:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwA+eK22ZXl5syvTCab9/1OYStno9pAv8cFARZdQ/WmWupyjuREhES+j5OJ9sH6YDcfjfwU
X-Received: by 2002:a25:42d6:: with SMTP id p205mr5683672yba.284.1598655933431;
        Fri, 28 Aug 2020 16:05:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598655933; cv=none;
        d=google.com; s=arc-20160816;
        b=PygVGDKBKnk58UcK27RKZomnliocvyMnHIkFf1MV5A7OleEnZ4bkmTwue6ZZlE5yzH
         tOQlSiONUEwspgGlmKAoEe4TXy+z0NCEOq6JOS4+6Le7wMDnpat2rIujczZ7d2jEXifU
         GdNxWDFTlLHDjM/wnEexIMBuYiQWhso61l8X78zJUdzVRsS9yI2BFqzianN93Fi+Te5v
         s1iTEFUaQy4ey8TtOqxt9Jg6iuJPYCjykU8/7iFJzhRGX40uVD1f09BmEFOKMWXzYc42
         LvlAglC+c3zu6NIY+B67BXA2u64Ov2LcE3LeXf8Ohv4EUYw6dpgqq5RmVb9nVG9/43dc
         LyvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=65HSA4NvUoLzX9D+wRRBDPsFW095WmkNdu8aJBd8NJI=;
        b=JQQHzik4ZXdzjZtcOOC7GusKDVpXOPEolopwQBIFJB2w7RYoQCdE4Dz8oIYgU7rdfM
         9aEF4pqAYExtvHwTYFCNQZM5EVQw8mDjPjUeLlbxvAV8SsIaDYjIy3mhda+m+6FRREYU
         KcMAB+PJ1Zu8yR1Ti7KAmL8JZzIzi/gx3ykNktg5m0VAptzNBsmgMhVzSyj4ELDWT72V
         qnl96wDdZy67f/QhuZ1wYAsS5w1jiai5mFqraSIr7uUSUhY5B6wbqQ1Pak5t3cz24Svj
         flurDLEOtkTGzGuL1XCRM2sw1468uZqN4C7no10gA2b8Ao3cjDS4sZhflkJIYXkwh6qZ
         HTUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="AjAXh/tb";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x7si637910ybm.314.2020.08.28.16.05.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 16:05:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="AjAXh/tb";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBnR6-0007MD-C7
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 19:05:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBnQu-0007L1-QQ
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 19:05:20 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:46467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBnQs-0004Cz-OG
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 19:05:20 -0400
Received: by mail-pg1-x543.google.com with SMTP id 31so1110803pgy.13
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 16:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=65HSA4NvUoLzX9D+wRRBDPsFW095WmkNdu8aJBd8NJI=;
 b=AjAXh/tbk3c+x2A0A9jbPV7jZvKzBdusT2mJHQY4coHJSwIOt3qG3mYqh8aUAIUTLV
 4kkJDfouA8VeXC5kePjRCasEd4+dcoTE3T8nshJik1YALrpCE0XqNTBI+ffS5TbusGAE
 a7WEe+H/OyvbKHTwr5UfdQwQ2y0t8C1L9f1zKKZ+pBPQas2MHLCdyy/1vdVowwbRslWi
 Em/y2hNf4ErNRJKnNDd540AlR8g4rmwm4Zjoursu/gsDXc0BCRs7w4PlOzRvrX83Xc2r
 CRKNKdqhukR9IoHPKTt2ai/rxdH8qdr8t13EehMOqByLeP9Ed+jn7ntAeymTs57ri8eI
 YEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=65HSA4NvUoLzX9D+wRRBDPsFW095WmkNdu8aJBd8NJI=;
 b=Fp6na+uOYWMoH1ksssdT8urv9py9RpWqh0K/8pXl86EQ7egdKgjHdkrSxEYetYMiTQ
 Qt/11Fhtc58IgmD9zDnsz3A+rYTH4uD//sfdlH9KKotUwRGayYA76nwS+yFgKLuXcqMq
 ZJeI31I7rWgbtGxT3+1ibUUU9x4e+txsF/pRXmc+1f9YKHyo0zWOGjJrPHxRlI0wfC3Y
 aifmOwlAzuOsm2zXyCdO+MKDeeBwZ+oF2MceF6srZZYhUzuzxir9aLYNwrMtc0svxexs
 b7xx5/4Vqrjyw2lA06V/UyKxiC7NN6HpJiXkxVD86JhOAVD33d3GL0D/hxjY51LSTYRa
 aTzA==
X-Gm-Message-State: AOAM531zKABrJlFFKrARtJ2mZiXj7aOWZH1nrqXkePq/gjDQ1fugb9jw
 Lpae+JS7+pf+KBSVjVt+ZE2NJXyofgwRUw==
X-Received: by 2002:a63:500e:: with SMTP id e14mr749584pgb.36.1598655917325;
 Fri, 28 Aug 2020 16:05:17 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id g25sm482297pfk.37.2020.08.28.16.05.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 16:05:16 -0700 (PDT)
Subject: Re: [PATCH v2 35/45] target/arm: Implement fp16 for Neon pairwise fp
 ops
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200828183354.27913-1-peter.maydell@linaro.org>
 <20200828183354.27913-36-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <94dee46b-3ee6-d1dc-c0e6-e5d83acac363@linaro.org>
Date: Fri, 28 Aug 2020 16:05:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200828183354.27913-36-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
X-TUID: HVLh0lE1RQzj

On 8/28/20 11:33 AM, Peter Maydell wrote:
> Convert the Neon pairwise fp ops to use a single gvic-style
> helper to do the full operation instead of one helper call
> for each 32-bit part. This allows us to use the same
> framework to implement the fp16.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.h             |  7 +++++
>  target/arm/vec_helper.c         | 45 +++++++++++++++++++++++++++++++++
>  target/arm/translate-neon.c.inc | 42 ++++++++++++------------------
>  3 files changed, 68 insertions(+), 26 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

