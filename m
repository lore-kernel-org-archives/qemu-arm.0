Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4203437lfg;
        Mon, 28 Jun 2021 10:40:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0XaRmHwsHryBilxXIFQluQcgLRYdI2XwhTZMiEFFGIYscpJ2vOucoaemUEQMd+oObulSx
X-Received: by 2002:a17:907:9c9:: with SMTP id bx9mr25411561ejc.72.1624902018305;
        Mon, 28 Jun 2021 10:40:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624902018; cv=none;
        d=google.com; s=arc-20160816;
        b=Tict5rJyRWmfj2W5c1r6TRHjesHkqasiwuu14rASqPpYKdOMpd9EX50OmktB7p+ze1
         Nd7d2Ppsds83EO6Q7cmGr8/EMwF400tJCJmjEVzCc7RnMC+oO0+KtzeR/YU/lE1GbUzx
         /K8Jl5ON3/jEIifnhBSjh25fdsQ8Y1wDWAAqWpy9Dq+437NLGCW4cDkarBwtG6gS4uAM
         suR6GSi/NMlaTqID93DuyavzfgsC8TmFRaJiPmMbVuh2ZyyzsPIosL0EaKqloMuXIuh/
         XEfdwl/TiqRBYrIGp/biV9TvUDL/RwHliQMmwIabMJosFJIbd/sMbY+0+3RbCs6nf9cJ
         DPaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=iQCXj19JJpLq0zkZXuw6mb7LWL46DWKXo3whe4d2RQQ=;
        b=rs20mUhEj47RVKKKU7i7W73wyOhv3EKM++WuYqFkUfVYimcA7P26oYoJg64mnQrWAp
         49cVCPxiXxhHr9im/WuQTiRNlDWKWF4hrJwWVT9w/NiFnkFtOxUx0FnC0Ed/+weUiE9W
         uzoJ1OF6UNGPntXtAXAd4/+G/h0wgD9ujcftcdkJU5R52cEuhLdYVyDNPeVhB7nUl+Hu
         flH4Iap1c1n4SBNvJonAdLwIPpGp05s8gkIgxNcPV/Ck1fmCvNF/jDWoHGUG0Shwz2z1
         9RQpn8go2HF3gYHlmkzyJN2sE9iOpqgv/BBh7a0P+IaeqP7y/EM7rZGQHQrGNtcbX0MB
         htog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FjqAy990;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a7si14360066edy.476.2021.06.28.10.40.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Jun 2021 10:40:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FjqAy990;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lxvF3-00015e-DX
	for alex.bennee@linaro.org; Mon, 28 Jun 2021 13:40:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxvD5-0007sV-Md
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 13:38:15 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:38862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxvD2-00013k-8C
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 13:38:15 -0400
Received: by mail-pf1-x42a.google.com with SMTP id c8so14767296pfp.5
 for <qemu-arm@nongnu.org>; Mon, 28 Jun 2021 10:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=iQCXj19JJpLq0zkZXuw6mb7LWL46DWKXo3whe4d2RQQ=;
 b=FjqAy990BK+E+hXuKch7VCmvpgf2lSvULwLbh83hh9w1ckUKiDA3E+EepkFGuC4kpY
 PXLgJ2Jq+tww6inf+4XTiHQEJSmrtIl7w6jVnsQ23pvVSf0j+eX+qzRTSIo1e9loQ4QI
 bJ5bYpCet8EXLBFBhYhrneRFpVWkQeis5hpLc+Ay1RV49MuF96HxWzSwzKCWLcfTs9OX
 yCekZEXhse5XfBHbnOp5689bVxzyRyuK/tmIyVtyGg7xNb5a8QvO3zxTHQEANg7yE8/Z
 TOrB3jCXMYqFFKcr9FIc+ktMs9Y0w1Or4DSG3d0A4hwZgJBzL1VpaG9SkKhtpdiUBEc0
 iK/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iQCXj19JJpLq0zkZXuw6mb7LWL46DWKXo3whe4d2RQQ=;
 b=EfxaTSy2DQFblkcKVyyvGPsX3/byk7dSCmttTDh4r3TAbcL871p/SVDnkAumF0DZWb
 qeVoIKahJTddM9t3f/EqrBPLwlIcHbWkRKS3SJbHiW49h1uqYT4a2VWFRszRsUsLM5UW
 0rj2A77zpmaoJhUMC7bBqrn0816V6a2Vat3WxzYGpi4C5QNV2YJpE/VED13W3qMITVoG
 pOs2oVnA3N81wuyakNCrX48CE3KtkYOjrGpyfqO6Ip7YSVHGEAtC5W2Kx7w2+dls59c9
 Aac8qhrKpeLYawNW4YtOYWA2MXxMjjQrCiNI9wpU9asQ9SbZ4tPKOyY+aNUV4uZcDZte
 4Jog==
X-Gm-Message-State: AOAM532sIxD6rWKGK6vMvsKfTKvA715nwXGKw8TAJt13YE0XcAwPfeFA
 hFCQGk+1hnR4+6kThK1CpvKfgA==
X-Received: by 2002:a62:bd05:0:b029:30a:dc6:88b7 with SMTP id
 a5-20020a62bd050000b029030a0dc688b7mr15465941pff.51.1624901890630; 
 Mon, 28 Jun 2021 10:38:10 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id l6sm15604544pgh.34.2021.06.28.10.38.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 10:38:10 -0700 (PDT)
Subject: Re: [PATCH 17/18] target/arm: Implement MVE shifts by immediate
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210628135835.6690-1-peter.maydell@linaro.org>
 <20210628135835.6690-18-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d1e88871-0c55-8ee4-4f1d-6aa11b6d52dd@linaro.org>
Date: Mon, 28 Jun 2021 10:38:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628135835.6690-18-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +QvOcclnabWY

On 6/28/21 6:58 AM, Peter Maydell wrote:
> +  UQSHL_ri       1110101 0010 1 .... 0 ... 1111 .. 00 1111    @mve_sh_ri
> +  URSHR_ri       1110101 0010 1 .... 0 ... 1111 .. 01 1111    @mve_sh_ri
> +  SRSHR_ri       1110101 0010 1 .... 0 ... 1111 .. 10 1111    @mve_sh_ri
> +  SQSHL_ri       1110101 0010 1 .... 0 ... 1111 .. 11 1111    @mve_sh_ri

Again with the [].

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
