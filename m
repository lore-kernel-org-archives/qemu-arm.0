Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp617668lfg;
        Thu, 18 Mar 2021 11:40:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVLWKWUqLBHlHs3r+KK63N69QI6sOAymzltasiACIY+hPGqUfWvsrZetQLY7lQKSjqnm1+
X-Received: by 2002:a92:c690:: with SMTP id o16mr12823480ilg.256.1616092847067;
        Thu, 18 Mar 2021 11:40:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616092847; cv=none;
        d=google.com; s=arc-20160816;
        b=EBD92Z9v8GUZDmLCHj+cy7rNJzvmcWdR8xW+DjEBdBgqlVqrrcdgoUBG/lgQssMlfj
         iGDnAgv/vfTRY9kSL0/1n2xmR9pximiYgivQ/hCglv44FyvJhocRAQm6KhG3PfQnY7RO
         1ujQ60bhen767QIvESaTTwA08PxGCvXxMHwIvPjIq73SGuXtErB9xEFUUDPJS6Vahyut
         QbDEhVTrxGn9a19gnsHE0Vo+go1z+5SqlquoIb8+FwxihZ0AUEO3Jb/+t/XIxiiuYz1+
         odZEeeGh9pQDNAJNaUVAsbmdOTqe1LVqMMX6/UDtH0hi8AYjhewdq+LL/4Evtq7It/I6
         NwFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ikMOIpgsPwhltCbBs+UCS9IGBk9Ra8KEgldmQ6cd/SE=;
        b=Xymqwpqa9r8aFreSsYxbaxy8Pv69NZPqHE/WN+A9gW31DwFwKlsD06grKvQYFmkh4e
         esH48LG2g3EOS7k5uTQmvYKg0U8tL94PEr52hn8EQp95nalw+qygzWhxZV7n9XKi+YOr
         VGvdPhf6JcnB8QhLFQP7VLBCtivZiNV2jzliBO8WTuBhXCmbooNxc0wdPV34i0k+VE+E
         b6YesmgxOEQNpZ1ypwPKwyb/8KsyPxZIJC8b/D08kk3Ulj+GrvlMEP0agUuNxdXVz9nv
         nFiELYTmQW41r7eYk1YBwlQ3zV5kDf4nchlRpdZ2m09P+1a1M/RoDstbD5mh5wdp22I8
         VZ3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nf4LO98a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m16si70047ilf.93.2021.03.18.11.40.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Mar 2021 11:40:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nf4LO98a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMxZe-0008IQ-98
	for alex.bennee@linaro.org; Thu, 18 Mar 2021 14:40:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMxZ4-0008Gh-Bb
 for qemu-arm@nongnu.org; Thu, 18 Mar 2021 14:40:15 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:41868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMxZ1-0003tg-Q4
 for qemu-arm@nongnu.org; Thu, 18 Mar 2021 14:40:10 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 l23-20020a05683004b7b02901b529d1a2fdso6126925otd.8
 for <qemu-arm@nongnu.org>; Thu, 18 Mar 2021 11:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ikMOIpgsPwhltCbBs+UCS9IGBk9Ra8KEgldmQ6cd/SE=;
 b=nf4LO98am2XF+94vMyHHjbnBKhja5OJsFAPH+d+SsAQQGI4xf5Tn8S48skanPV8g5Y
 7anPM7sqSllRbksGjvjbDBff/sxu4Yg2s0Pc0+R34U1GO1eto0x/CKHEPpsPVENuGRem
 Yl85QBeRrNcGTryEXGJWdAYhj4RZoG7EPu+MC1h0xEzWPn7JOxmCqq+Bps6kjLk28WZ3
 fVqUaaWW2xAqZva3vBdkfr2Lh94lfVlAXDGOM631sUBbmCz/HadgU9ROkRnTCUXy38h6
 qUaicY6cl7QAYS2jlOgPK+5OeGdUoI5+VfN9iw5lrL2FYICUUvQGefbUZS5wGzhGvJPX
 Zu7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ikMOIpgsPwhltCbBs+UCS9IGBk9Ra8KEgldmQ6cd/SE=;
 b=EjHmpgrjK0yt/gPRPnAZVeVo0X9dvAwUABICBc0kVsHcqQU1mbVyQfCCigrbkPKnEJ
 OuA78zGB+0qcktCqiAWnckE2jGwqtwBTzWL3GFpTQWztJdBhfNZqKhmr3ttTzvhnGF3U
 cNJ2KrMXtalpZyrjuScI7JmWlanR0CbCZpYAx5XwVuN1S+zq/Mt61NyrdSxbcfAM/UVy
 kJPPZ34BXIo2p6IViUTocT0R8wWiYTWTIlVcB0em4EvI43y36dsxn24Fs51ryo/+W2ym
 fpRJX50CN0k98LkHpEyUYJsUXkVgWbJQJQv5jhpJ2zlczo/kYBOaJjQd0cLug701PjPP
 p60g==
X-Gm-Message-State: AOAM530M00ktlX776xOptZE8fzl3sNYCB4OnltMZEJZ2dvkwkA7Nz7NI
 jlJKXUg0KNKv/ORXixzlXRq2iw==
X-Received: by 2002:a9d:202c:: with SMTP id n41mr5265520ota.289.1616092806440; 
 Thu, 18 Mar 2021 11:40:06 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id h20sm688373oor.8.2021.03.18.11.40.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 11:40:06 -0700 (PDT)
Subject: Re: [PATCH for-6.0 v2 2/5] memory: Document flatview_for_each_range()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210318174823.18066-1-peter.maydell@linaro.org>
 <20210318174823.18066-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8c17c572-fb18-b6fa-0704-1bfd30aa8dff@linaro.org>
Date: Thu, 18 Mar 2021 12:40:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210318174823.18066-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /I6cAEO9jMq4

On 3/18/21 11:48 AM, Peter Maydell wrote:
> Add a documentation comment describing flatview_for_each_range().
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/exec/memory.h | 26 ++++++++++++++++++++++++--
>   1 file changed, 24 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

