Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp862599ejc;
        Thu, 23 Feb 2023 08:06:02 -0800 (PST)
X-Google-Smtp-Source: AK7set+XCcAXKv0EiI0VUVUCDs8rZabvqnb8Io404h/9u3wxJDDJ3qAFgumm1kXP85i1sXxwZ+t/
X-Received: by 2002:a5d:544d:0:b0:2c7:19c1:5557 with SMTP id w13-20020a5d544d000000b002c719c15557mr86236wrv.64.1677168362156;
        Thu, 23 Feb 2023 08:06:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677168362; cv=none;
        d=google.com; s=arc-20160816;
        b=G0Lp5lcYbiNOJniFfRFrnPBvW9t+i6OuFxvAJapI8vmpUmKXnzeGhz18tOj+0PxCW5
         N4L+Vy/Gtc38WGhckuVmk2zg5+sZNvfmAWUNf8yW8mpq7AC3yl1P7yd6gwjOHiJG8GzE
         hjJHq2fG3pZc5qlKnjrhana9ZKoU3leJUGGvXiRmBUo5DF52kgpu7tt3NRxEyTpBy2qh
         lGuiHEgZT5nrq0MLEekXLRvqN9GmS+U3F9SEq9MiAd8mQp6R5bRGiwQN8VVntFbVBrA8
         KU9DhfkPpm6eK7CtjoAu0RU670sNy3jsaGaRTm5aqB4yjPKz/xPUcAnffzxry0Fs0pgw
         D5kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=hsFXdpy3bTS8cQtgTUf21vjRr8/o0taLuUU1NoIpCT0=;
        b=pGy0FOYASf/mj+i3LFA+Iq4SJalbRza09Al9r32vNed8rRMPXrvbeVWR3aj4ZraI+E
         oU3vl/J6RDHAhkz2qoi1KqqJOX1nici5AEjYQjtbCQLJwsIg5kHoRm+reut511XLKpYA
         ikgXi1idtb9qBXoPSZgcS/EOhsRVGMbOfcCA4aClaiVtUN7BqD49E+RHGQAj7KcDkX7w
         BX4l3kEx0NP6zpSfPS6kZht4rQkuulYXADjZiOqArlZYxLQqP0BqR1pTUFY5BMH3YWuq
         uEmWI2FDkLcUlGIBVonI4gRZ11AqnwNouOo0MUiJZ6vezulmry8FVkAJj/jbISYo0yQw
         SueA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GPnWv9zT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7-20020a5d5347000000b002c5477f3ed2si10406190wrv.1049.2023.02.23.08.06.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 08:06:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GPnWv9zT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVE6S-0005ud-LB; Thu, 23 Feb 2023 11:05:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVE5q-0005hY-KW
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 11:05:15 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVE5o-0006an-Ib
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 11:05:14 -0500
Received: by mail-pl1-x62c.google.com with SMTP id z2so13616531plf.12
 for <qemu-arm@nongnu.org>; Thu, 23 Feb 2023 08:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hsFXdpy3bTS8cQtgTUf21vjRr8/o0taLuUU1NoIpCT0=;
 b=GPnWv9zTJ36kMV1QoXo4SeIY7CqwfLb0jusm5yq6iFeOW4HA0IO+eCTohlc8Xvpebb
 6Vd0GDVDLw2NifvGj7YlfvDHecycHeAHY4w1COtH4dcqqyksFC6ynmwdjAKQyOhhQ9c3
 ZtlUJQ+MZYNIXPinrZ0kkuKIxXEmGsLYD6EmI6s5nRLEJKAPLErj96XdpCAHn3U9KFJs
 /nBKq6w7YoGD6dGtY/7u7mCqtVNpW899mffPZu2v/imbEqjP18SOL+kS0eG1Qf5y81TW
 4a1WbPpWZ5JXd+qDoEDvEtyXgmHKevbE0Acd5Bbm8xUDs7ESMtMrI4Tx+XQBtfng/T4P
 lk2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hsFXdpy3bTS8cQtgTUf21vjRr8/o0taLuUU1NoIpCT0=;
 b=i8KCvujrvkSwTJIMwv21r8EpYtekxPvkPCRBAM4cfPZKEFhbMzx399KsK6SOpk0emz
 CnQprQ/zM9GbGeLpI9yTdUpLLwSyuNBWdDNYpHNjxpdRJbajzDJBHAFcF6AZOLc9JYVG
 /tBP23AHj9CDWdTIrIRWLKYmVAYegWBIX0pZG50Bzi8yNoR/55/ea6Pg2VRzSN0c+AT6
 1FMF8QOJx8MOjZdU+XYYT5foXq4UrgkuurxQjr5UoLz9QOI5u0rf1UGaXLFsdoNSHuPx
 S5sqUSI0b2WZtQI8Y4a17cVG6u3wN6cCJ2nJPZZY/pcyPtfGCgMLwI1wKLVfhqRR4cNk
 wkqA==
X-Gm-Message-State: AO0yUKVU2mTIN6lDvDXBs0Xq0auqqgYy6uBVyxHDQSP/+TSAMX8Ru0MR
 NK8LauCsuIEvu2VsYkBWC3XbT/aZOT1Hsf+BRCZ9AQ==
X-Received: by 2002:a17:90b:4d04:b0:237:50b6:984c with SMTP id
 mw4-20020a17090b4d0400b0023750b6984cmr1244165pjb.137.1677168311025; Thu, 23
 Feb 2023 08:05:11 -0800 (PST)
MIME-Version: 1.0
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-12-richard.henderson@linaro.org>
In-Reply-To: <20230216030854.1212208-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 16:04:59 +0000
Message-ID: <CAFEAcA_dE=HGWnnGYs1UZKeqVk41sUZ0eNBYkUezVGDPCm2jFA@mail.gmail.com>
Subject: Re: [PATCH v1 11/19] target/arm: Hoist finalize_memop out of
 do_fp_{ld, st}
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: DcVwsKpZlIu5

On Thu, 16 Feb 2023 at 03:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We are going to need the complete memop beforehand,
> so let's not compute it twice.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 42 +++++++++++++++++---------------------
>  1 file changed, 19 insertions(+), 23 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
