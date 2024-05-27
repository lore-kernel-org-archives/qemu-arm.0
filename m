Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp3057458ejb;
        Mon, 27 May 2024 02:29:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXf2gTgpDJX1POfG5N76rq4gLKUrk0ptLrmL96iJHWkjWO0qgkSi1OitRRxRr9t8PeWnI91ChXWjMXyqEnQFd7mdFhr1DI3
X-Google-Smtp-Source: AGHT+IE4sqVqO7e0RzKqFO0jVKlufoESFLMMhRTYQ0XHfTHAz7pnO53z8kJVWLstxT4t3Nk7+Cp2
X-Received: by 2002:a81:b60c:0:b0:627:e43f:7dd4 with SMTP id 00721157ae682-62a08f12487mr90262767b3.45.1716802142023;
        Mon, 27 May 2024 02:29:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716802142; cv=none;
        d=google.com; s=arc-20160816;
        b=VS/WHNkg20l8Q0KzsXiZQLAKt19Dd177s+pRjTGhj6b6xgvUjCcWGCfoVqWjNnFQAd
         BunX7+dw17LOOK/8940O2YYC4ggt1m8IhIRIKp+yLSXg1++PJVRRhpB+dXRBGIlXs0ak
         XVCJGSs4/KuYraDuZG2TNBVLcDwK41cQ9PbPRvZA2tzuBY/GBZfhfz7dna7WslcS6aaE
         /81lxincrwG0uMDbjQSV6hoFxqIFzn+86Z+zaGlgI+6rJovj/9zXgi5cFeri7b5iVzN5
         vfYqBDfqZI87Jf/YuNUbuEy3UswvowZugR+xWsOUtZR0A9wROsa9WIgZzG57TVUHnw1C
         RS7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=bjmSA0ceZNruDSICAo9LXegyqfWu5ZH4aKcdf8Bdaqg=;
        fh=iBAmZe/en/R4K7PajEqAgEcm+VgGtueR1PeNe/rBSos=;
        b=dCRS9K+Q2aCRunPLO5c5Y8g4MyqMTICE/qX0UAxWguh0HABkzSafHIVfxU4otiKnzt
         olDZt1dCitBlclssFIJy4QwE3N7OERqlmIqitGbwgj8luiMWGxodsSfUs51agwF3/CR6
         Ar4LiXFEX/L3UJpYOTpIOdp2U/yy5XQX8yFZUzuG+vL5JoC4GmdLmuB9RNOKdoUJVc/A
         tljCLHNJCU/02y3QI692217/qORq2KTL6Uy9nHTgYrKV7ZnW1Aum9OepWluTU2VEwlJK
         RMWNghYE6aOIGz0hHiZIpn0T4d2VQyHqhHxUgQUrP3pE30DRBByg5ylYJSrvRfGPWr2v
         9JJg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nFRG0HHo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ad7094ac5esi41841906d6.488.2024.05.27.02.29.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 May 2024 02:29:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nFRG0HHo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBWew-0004vR-Dd; Mon, 27 May 2024 05:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sBWep-0004tU-GA
 for qemu-arm@nongnu.org; Mon, 27 May 2024 05:28:45 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sBWen-0003hi-RT
 for qemu-arm@nongnu.org; Mon, 27 May 2024 05:28:43 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4210aa0154eso13581985e9.0
 for <qemu-arm@nongnu.org>; Mon, 27 May 2024 02:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716802119; x=1717406919; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bjmSA0ceZNruDSICAo9LXegyqfWu5ZH4aKcdf8Bdaqg=;
 b=nFRG0HHoadmi26PBQUavVvdwURx+JdAPE9BXnTbwMN6OLGt08Ydpp/9yL84rfpugGu
 lI1PLaH/4F5zJ9xqse6jXRa2Z4mW5+/E7rLgJFkgzEztw6rKTAC3Rg8L6dg+coLZRC5s
 Dj4j4vKh7C1wvPSLQy/PDRJ2tID7QtiOQT+dUEFQX6Y6EJq9DvRNgAFZb7VsosQOezqA
 XjyHPAwaHd+my+Dbjn2lYFa8aC/imCGs4qp4xS96ySTH52sYdr6orgRq70RW9m6ZmWuK
 0yZ/MkkwV+zwAmvoDfjDR8BExFJtP46nRPs0PS18daGeBZEv6pcFVzeAlBxrEVjSv1L3
 zbjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716802119; x=1717406919;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bjmSA0ceZNruDSICAo9LXegyqfWu5ZH4aKcdf8Bdaqg=;
 b=O6/tcdxquCZpo/YIHePwVIY7WkLJpYYhOGWnWBY3d5hBMfEhZVQQ9+ZXxpWBaEQ5I7
 feqMIBEUV9su/WVhCheEPSv2P9hN52t0V+/qf7HGHD+Dg1gvxBGacSRzOZAHgy/G7SYu
 6ytol8rASPumkGivWn3qT+2Gn0qB2/kUg6HqibnYDTPe9DaUiR5+wlxnz31iD+gbEHwu
 IBbzeEIhPZLecw11lWiWKDt52v2NZ8SsdVWtEsAPVRG4iS+P8ABmhNd2Al88pXdz2z7Z
 3K8fa9YSHLsezpKaL+npCD7RwCMDCNcHyb32oTiQAu429TtTia/E42rY/W8pBjfNyMhp
 vw+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU706sTLNl8WpWc/GeYJFXIUzJgawtqg2LEbG2SwOQ1rMTiXKyWLuOKsy4KRApIEQvrWQTydak8sX+D8uSXQcyEVux4
X-Gm-Message-State: AOJu0YxzXMTJ9b+ypxVFcVIMDypAR6Ip0QMetw8vZ4GG6aE+umv3Qiwe
 tqc4KJouOWqHQZ/VwpokPJBliKjCH+dwDr7h+bXu8jpnaIuAyhL4gBNwUoh5UPw=
X-Received: by 2002:a7b:c44a:0:b0:41a:8055:8b89 with SMTP id
 5b1f17b1804b1-421089d50a0mr103087655e9.6.1716802118996; 
 Mon, 27 May 2024 02:28:38 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.152.134])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4210897bbd2sm104205175e9.21.2024.05.27.02.28.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 02:28:38 -0700 (PDT)
Message-ID: <4a6f1923-b1f5-4e5e-898f-73f4222c2c78@linaro.org>
Date: Mon, 27 May 2024 11:28:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/system/target-arm: Re-alphabetize board list
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240520141421.1895138-1-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240520141421.1895138-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: lSojIGhL9KQ1

On 20/5/24 16:14, Peter Maydell wrote:
> The board list in target-arm.rst is supposed to be in alphabetical
> order by the title text of each file (which is not the same as
> alphabetical order by filename).  A few items had got out of order;
> correct them.
> 
> The entry for
> "Facebook Yosemite v3.5 Platform and CraterLake Server (fby35)"
> remains out-of-order, because this is not its own file
> but is currently part of the aspeed.rst file.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   docs/system/target-arm.rst | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

