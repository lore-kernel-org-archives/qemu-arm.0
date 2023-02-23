Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1123706ejc;
        Thu, 23 Feb 2023 13:31:16 -0800 (PST)
X-Google-Smtp-Source: AK7set/FU+BJqNeluYg4KpfoyiesBNTaDZcTwd0PY+3hwkx23WhDQa2BhuIK1bP8W24pxtYjhMJQ
X-Received: by 2002:ad4:5ec9:0:b0:56e:af49:7a1d with SMTP id jm9-20020ad45ec9000000b0056eaf497a1dmr22821689qvb.24.1677187876734;
        Thu, 23 Feb 2023 13:31:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677187876; cv=none;
        d=google.com; s=arc-20160816;
        b=lHfOHKxJH8Z3Q9UuxlfIFsYi6fir+qDfqWFjVleErCXawjhe76ZnNKa9QWEipBsDRy
         +MC+Lt3tXHduhxdWJ6CWzzB3Cweokag5NUrm0hz0cujwSgvtIF50c4kJj3BwBkmtZiee
         6/9pR7ymEI419TDaiblnfQmi1ukQ2SjZ1M6LEgctFJVVQX5KvidKVBEsskTNpUW7hnNG
         dBx1/b4GxAZW+ewMu560A2ZttBKT0Qj65nPnDW+T6rtM9tIEKN+WoEWNTfFDJ+G8935x
         5H4OZBVoErKs6OXsxZa2VOzhcrBM11L7pJcAZI3Nz3rcBd8mv4O8FeA9NaE6m1s3l8ox
         uukg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=tBYiiPUjev40tvsCmev2rkWdoPYa6YPHLztrkEW6xEI=;
        b=vSCG7+EkZSOUhTr5Ufh41tIjq0tG3b5BSXPyRL9SY4A9dANx/ciZY/5K1x9yiogUNK
         Yc3u4421tQkqbsLMkQjAZLyroJPy7GTjIqYCmk5rdGAez7nyxMVzGKwgKLoU1/ic3BZO
         mYzAXWDClQlFQYU7QDMlqT3ZruKGSVkmC7nqi3X0SwyTMoDqfr7fRcwL+T6IQhQE+QVu
         u3SLDl5l8BVlEXz41wY2/PaW7yeeRhyUASWfxqwJ8gYOKZGNSoqFOGsWLArkABQaPZWV
         SmJojXHCTUbqRutCFenbOjlJcpla+qHhq5wgeb33wWKCrdbqp8Uo6jf5WqvRTztRLO6b
         e5Cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ejooYr40;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o6-20020a0c8c46000000b0056ef19644f7si5721459qvb.451.2023.02.23.13.31.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 13:31:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ejooYr40;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVJBF-0000hN-2p; Thu, 23 Feb 2023 16:31:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVJB7-0000XW-5Z
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 16:31:05 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVJB2-0002fw-TR
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 16:30:58 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 l2-20020a05600c1d0200b003e1f6dff952so613625wms.1
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 13:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tBYiiPUjev40tvsCmev2rkWdoPYa6YPHLztrkEW6xEI=;
 b=ejooYr40wIzKd01n6ODu4XQbQUxaslV0yAJP9BvULUtkrGQ0TRkzLhutwHiUYHBxt8
 /W+oNQidehznR+iUYPxnXTjJWxIZTX+Qj9QieLgaGELYDHl+rpg3JRKuTALMvP6Uw+0e
 YdQCXNPsg5ey3RLKWt3MpUoDegXg8ga/uY2EdiQC7fOYIM/36oCaQYj5/6McPuAOyKQb
 auNe+4d2dj2AMDOL27s9v/VJ+LlJMXomycQMyDhphj/FY+VaYSk1wbD8TIKmrtKwEHGH
 gIZoijidpp1kvTumsyeWQWdTJ5i0+LaEgwV6Ydlk1yvbGKOp5LnH3UchD7N+5D2v9gSc
 MXLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tBYiiPUjev40tvsCmev2rkWdoPYa6YPHLztrkEW6xEI=;
 b=uCLcqYK4tSAwRAjW5W473yUauecKwzBrBXeVPzvNyRrZJcI1u7IhS2bCh+LzUt5FBA
 AWBIKVOeWW3OYcDkC/y82qhFmwK9EwZ7EwnrXaO4QvI68Qd6bcIqAJsm4y/zscxk77np
 6Z/6hyvPyZyD+ZNCZ9idsf+C4oH09zWpOVRFwvN9QO2D6sbBK6LvccHudaVh0pi2A1l4
 XL2ix4r+thc2uxehR2dbzrETLnRhkvwOrX4foW6tfhHwpcbg+D/YWELog2WmIPcIs1P+
 sa64j2t1ICW08Bc197o7XnzXRi2PnyqrKumYuz0tzgNUJIulnji5+pJ0P5ylikKKW0K1
 fpyg==
X-Gm-Message-State: AO0yUKXiLBVRJyzoMkhenfGBrnSH/oKMhUO52uII3Rjdx/jO1yqTQxXt
 /MPSc3Ocw3pHw4rG7IbsUQdW/B0yHy9Tl5S1
X-Received: by 2002:a05:600c:1c28:b0:3e8:490b:e28b with SMTP id
 j40-20020a05600c1c2800b003e8490be28bmr7235364wms.25.1677187855061; 
 Thu, 23 Feb 2023 13:30:55 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m26-20020a05600c3b1a00b003e21ba8684dsm590487wms.26.2023.02.23.13.30.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 13:30:54 -0800 (PST)
Message-ID: <e9482df4-a801-3e62-7d34-07da89f14918@linaro.org>
Date: Thu, 23 Feb 2023 22:30:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 09/13] exec/memattrs: Remove target_tlb_bit*
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230223204342.1093632-1-richard.henderson@linaro.org>
 <20230223204342.1093632-10-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230223204342.1093632-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: slGPlpSNgvOE

On 23/2/23 21:43, Richard Henderson wrote:
> These fields are no longer used.

(last use removed in commit 937f224559 "target/arm: Use 
probe_access_full for BTI").

> Target specific extensions
> to the page tables should be done with TARGET_PAGE_ENTRY_EXTRA.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/memattrs.h | 10 ----------
>   1 file changed, 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

