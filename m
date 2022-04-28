Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1643971lfu;
        Thu, 28 Apr 2022 04:09:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrKMuf6qpaCoBu3yt3S4HP4x9ZNzKgfkMNzaHeWqBKSVyAICPcW8tarcSrwdXMo6/VCjwq
X-Received: by 2002:a05:622a:406:b0:2f3:4f4e:a75 with SMTP id n6-20020a05622a040600b002f34f4e0a75mr22493019qtx.495.1651144172062;
        Thu, 28 Apr 2022 04:09:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651144172; cv=none;
        d=google.com; s=arc-20160816;
        b=n4bLHfhJfbgVqfb40zRD6+hMM8e24+NUGlT7UqcUWq3T5EQBCaVulrgtg2CZoEdDQO
         2zgaEA0Mv0AUtWJWrSHg5Jx6fBgYjWQ9T3uORueAklRZWnti2RvA3V+5g9oTSTr88o8k
         t+KJ51l50zpQwxJFrgDD8gF1XVbcaJa3cLRa+pQ0/STZuPWHISrqG8TL63ErreQs1OUy
         QoQ1tdXXwkAh8qfHXbTCo622meZdzRv62VnH1rI5qtY8YlcZp7vhK4uPOU/h0MDYG597
         HoCJAs95ueRAEQAbd+IZYx7/8j1ZXbpcSObKpYQiEfNVWZ3YeRDDB+BcMoTnrZsv7oOM
         dtxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yWPuXtzKR8NrbQsAseRUGHCCQ/+FLftvfMJUvkYkCO4=;
        b=JIG/T9ZrrhzX0YI1t7qsCvBtIUjY3VhkzRxtPZ5LRQrwve7z3Q60a9uyQIByEasxMz
         mLLA41XVmSwdW9Qn3v8QNG+AtTWH0zgBZcT5Fyik1bkJf8PnQAkMNcpCksyWuGkB5EUc
         4vhje76ynCHwvx5TRp3YL3ziZ77vBllxh8yqfLF00QWfWNP7tdZQrBtWy3bEIRC+fBT9
         FbFW1TAQAoV8i3qEBnd1Y+fTu+vfKH8heI3Q3AuSs7+ICGOwYLEMXJuye7YifJ6j3ypf
         Ates1xwftJFk5N4Wilcfitl+5OJh/lqsADzBVcKxGk+GlDyjTNPZzqVMnlW2en1R3AwD
         OvpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WSD10rOI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j20-20020ac85f94000000b002f337000726si1533763qta.609.2022.04.28.04.09.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 04:09:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WSD10rOI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk21b-0003FY-E8
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 07:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1PO-00013A-OY
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:30:03 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:39818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1PN-0007TB-53
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:30:02 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2f83983782fso47663747b3.6
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 03:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yWPuXtzKR8NrbQsAseRUGHCCQ/+FLftvfMJUvkYkCO4=;
 b=WSD10rOIjJ9ux6W6y7HO/BUubP27V9qvzf+HOsRwPlwHg55bHHtEES027kSNZRIr96
 fz/IQo/Hjmnrt4EymFGhipdR2IhV98U8GWzkW3v+lCqynIyvd0rYWT4hlJS1K/OZqWLe
 r1ZpmMYEE9L+KqlfiYgzrhFFO/BCD4vY2wYRv6dPRBaY8iCFJOejVotD9bkO7Rj1MjWU
 yygenMUKXlMCBWnB/xxMrKjzq7dwzrjWkjVVOkg4vbvq2p36W2rmJt7eDZRO2Mi41ruR
 t3Q6ZUrX0SlYvZQatTHVWj3NDCT5c8jE4hPVru7RgdyoH23XmRSlNTajPPITW3rfszaG
 7uJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yWPuXtzKR8NrbQsAseRUGHCCQ/+FLftvfMJUvkYkCO4=;
 b=4QI2PlkcLR98rZegOkb4bgQdNerQFulZy1uRtkuxugG2nILbFTGZ3l0DTp/ntxZrcQ
 3B9tdIMAm1uc1a/IE+M8lgmdiwROg115Ur6dmodIcIoMafi/ZXwmfUoHHCITCAYbf2F4
 A5eRKCJ9DA9MobLKT6LbrVrk3Ws5HVWAH1Irnpj6a52AT49fa8CP7z1JCcZW5uRB9ghP
 lv60uBxBXzrXjTJTxwxnxWzJ+JylPU523AmGcc1DahMYfSgMORUg5rfnDj7d+SZBUDzF
 RPXmF6eZk8E2doXCpOtXwqNkyo2OH+1NLG93U7DbtKVh/DLt/idLoPvKwjvuj+VG6iMC
 2xUw==
X-Gm-Message-State: AOAM530HgN3Q77smwdFNIb9etpdjmlOvzWwmNHp3kJXUaicGazZ29kCG
 8rIWp8n5hzEhRBcLOvId+MfVR1LdnXua+euyH/eAMQ==
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr32178150ywf.347.1651141800104; Thu, 28
 Apr 2022 03:30:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-29-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-29-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:29:48 +0100
Message-ID: <CAFEAcA-HuGb327xRRNp9bxOKH1KHthM4J7V48Mt=jAdHEFajfQ@mail.gmail.com>
Subject: Re: [PATCH 28/47] target/arm: Use tcg_constant for op_s_{rri, rxi}_rot
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nfqac5gWEmkd

On Tue, 26 Apr 2022 at 17:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
