Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6502402ejc;
        Tue, 7 Mar 2023 15:03:06 -0800 (PST)
X-Google-Smtp-Source: AK7set8WMwHOo7VHghLrxcHDd1U00m1Q7zVWftgjBmjHRHM3nLHNZlOEO9WuIH3hznanvBcyFt8+
X-Received: by 2002:a05:6214:1c4a:b0:56e:8d51:1013 with SMTP id if10-20020a0562141c4a00b0056e8d511013mr30016965qvb.37.1678230186287;
        Tue, 07 Mar 2023 15:03:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678230186; cv=none;
        d=google.com; s=arc-20160816;
        b=eDLBFqWSaUTmlhpC9iuMQVVRUnWS9dfYQJg0Ziry34M4rUEGcgVMueZ+Hn4p1miNf1
         tl+gwXEZykmiEvBFeRFrUKBPjqUf6WVdnloXswKE6JeBTP5OE8TDYq4trCzqH2umixYV
         JjVLtjZmkelFBx0b59Os2/CvhZ2aUhoLqhcQjZVaN/4ludqK1gV8Zx3QdlUM+PDjmABm
         tVno8XMbCw4yHZwnPm5OTMvTvoyGgSVPtQaa1O11VYNaPFeVQ6/qkdewuFdMtLH855kM
         HNx8xw7hKwlYagv+6Go2SXz9UpaYppJy0lAEmsaUmjzUJBugV8/6seG0iT3TyIGzcs4k
         HugA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=R9r2fsvFmIpGDVIOxfIVBMufx7j05ZvZz9u9HlTNiDs=;
        b=Z60d2/0eZkAera/X0TSNg1SngDCZqHAja2EOHOl9ml0VUXuUZEG4oxA8Y4Cm788Sy0
         pTaSl6kPEqtfi7PQIVzY58e16D6ByetpTXS0GkblEmVaZ5gxoXxCKyIxltXHpGtMOfYK
         J7dt4Ng2hLWSP3WrAC4feNtrTksgDQ2jO/mWEtDq0jpt3kDoL68v69UuCAKrkOj6jC84
         JmkBDjzrgBCApw1JQ/33lWP3CmoSk/R5AaJ41SF2lOEcY8CsmGgVqO0aAoYAsE3JUP7Z
         mdZhI/hTZxTTKE0gQ6w8vMk/7jTnadlySEa+TIaBY9tEzu7kMVRhoYvXqUqEk9ZPNOvC
         kohA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nGbL93uU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bk10-20020a05620a1a0a00b007207a179ca6si11708291qkb.73.2023.03.07.15.03.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Mar 2023 15:03:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nGbL93uU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZgKQ-0000z3-PD; Tue, 07 Mar 2023 18:02:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZgKK-0000xu-2x
 for qemu-arm@nongnu.org; Tue, 07 Mar 2023 18:02:37 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZgKH-0001or-55
 for qemu-arm@nongnu.org; Tue, 07 Mar 2023 18:02:34 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso148778wmb.0
 for <qemu-arm@nongnu.org>; Tue, 07 Mar 2023 15:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678230151;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R9r2fsvFmIpGDVIOxfIVBMufx7j05ZvZz9u9HlTNiDs=;
 b=nGbL93uUmv7Oh0PAwKkKsgmEDjnsfceudb+xB1zns8gqHFODjLfp3mI/maYtlLeP7J
 TCzTCbymiN+YIUaqao4Kff6DeUGwQbgqe5pjcWv5l0RBTbQJpiVmMU5ylV0ILM3HBpYx
 rHhuH7+K++Pxm89Vf90wBVOpW66yXpORPEGIQF6UZvi+JTpxsD+THEOwAmol758HICa3
 XF+WVnnn11YGU8qNme6DYsO2Z0UZgyowfYNg+rqyQ4Wts0VJRapgIEPL3o9GPpoiA+3+
 MnzIS9jxq1V+flRp7iGkUOl/RxejgEDTtpmboJ9rnJu84zBZALxTEUg0VkI2DfPngwVj
 LiqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678230151;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R9r2fsvFmIpGDVIOxfIVBMufx7j05ZvZz9u9HlTNiDs=;
 b=Heko8hgyXmr9TrEaEzSSGwOTvGq03ibbMAHQFRAvBBFjjHwiWKwbAxz0S6n0Hq9JYo
 Ur4vQ5e5QFwed+SMNTAzR8N+s9YJAtTYD9QAVcMSYUs79Kjj7B+O8ZudiVZ2kVXsbAt6
 +EOTMVz99DDdbaHnMWKXXcULeNrafqedVuHetxOEW8CZLvdCL8RW74rxwDZcGyRT6siu
 rxScEmoIN7jmkv4USx+fhhLIl25h0Ds4t4qN2kNUQPO6rsY/v2rcCpBrHBxjfyEcmqVw
 GOynYM2uLjnZRYBxLTvS0+6yElglVRxmlqm02LpPDXFtDhZzZ2WPxzEomLinBLiBs/k2
 GvaA==
X-Gm-Message-State: AO0yUKWHj2xIP45/pWcncT6XbuMRlSZwGT3JgRh5Waa+7eDrxSmPFXmI
 9vhZB1U6N6ZoJgvkCNaPlw3s9w==
X-Received: by 2002:a05:600c:4f4e:b0:3eb:19e7:b291 with SMTP id
 m14-20020a05600c4f4e00b003eb19e7b291mr14263640wmq.11.1678230151017; 
 Tue, 07 Mar 2023 15:02:31 -0800 (PST)
Received: from [192.168.1.115] (52.red-88-28-28.dynamicip.rima-tde.net.
 [88.28.28.52]) by smtp.gmail.com with ESMTPSA id
 r8-20020a05600c458800b003df5be8987esm18942781wmo.20.2023.03.07.15.02.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 15:02:30 -0800 (PST)
Message-ID: <c2ce74dd-7a7e-f4c6-b5d5-a7d69fcbe225@linaro.org>
Date: Wed, 8 Mar 2023 00:02:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 09/25] target/arm: Avoid tcg_const_ptr in
 disas_simd_zip_trn
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
 <20230307183503.2512684-10-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230307183503.2512684-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: rs8Trc6Bzqyy

On 7/3/23 19:34, Richard Henderson wrote:
> It is easy enough to use mov instead of or-with-zero
> and relying on the optimizer to fold away the or.
> Use an array for the output, rather than separate
> tcg_res{l,h} variables.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: qemu-arm@nongnu.org
> ---
>   target/arm/tcg/translate-a64.c | 41 +++++++++++++++++-----------------
>   1 file changed, 21 insertions(+), 20 deletions(-)


> +    for (i = 0; i <= is_q; ++i) {

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +        write_vec_element(s, tcg_res[i], rd, i, MO_64);
>       }
>       clear_vec_high(s, is_q, rd);
>   }

