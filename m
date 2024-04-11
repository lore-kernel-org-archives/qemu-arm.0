Received: by 2002:a17:906:4a51:b0:a52:fc6:5c40 with SMTP id a17csp148313ejv;
        Thu, 11 Apr 2024 12:47:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWHJxcHAe4KHOioc/UIfCLWbSdIclEveKxspn6LiN62l4a8HG4PzwU5dUEHXZwobWxrgQcq0DHbQZzoUeEl8umjkFqtKmeI
X-Google-Smtp-Source: AGHT+IEjyVOXvHJJx+Pweyn+qouVx0XJ6Z/GpiCnobp/F8eqClDLpNLLljvtfcoEo/PofHemRMt+
X-Received: by 2002:a05:620a:384c:b0:78d:635a:5799 with SMTP id po12-20020a05620a384c00b0078d635a5799mr624802qkn.30.1712864842158;
        Thu, 11 Apr 2024 12:47:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712864842; cv=none;
        d=google.com; s=arc-20160816;
        b=P+BFgmWmMk56BAwudWEi1DlWijVaPohTWyfag/opfMmkekBXH8rYL9mwdhc58TBywx
         jzDZC4QfTnECWKbGSTrKrtouqKnECrV1QrhKJ/1UMjTEbxqKvHRcPsSWrCB/uYME5paY
         kFxOhA66D8YwRxOCL07dyat8gkclFDbJv32VtQt8gjSI7Z924MQB4aG9L589zNMPsEHM
         2mZWuZ9TksYuwIyRhhm98N4M0X4g/YEaoGyxN0ujICfmrLqYEVlzsSHOoKubZll5nwMH
         l2vZYqBG3i+pbHgyd3KsrYtkOsdHOWEGvHaxNvU5mBpciUs/Ync3haBve2e42CGEDd/G
         e/KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=S46kT4t7NiJqb2sOUbszK1wdb9x9qW18XR0HsqAIj4o=;
        fh=b9QUSrTvOVkF8bF91SAsMVDAfpcdgDUwMDUlXbuE/xI=;
        b=U3Gp4HyP7JQrslUsK52kaM/dGD/aemAWhsAXedLj2TJsX4+S3CgaK6Szs/RhwnBls2
         bPUjR1CkSkIdPAJAdWC1kdolTpgvDJj9urofTBprPLTXANJSxt4vZdp90B/+6Wsf+QiP
         /i9b0K8tkDX/jtVVydWFSUuWNBOKY2TQn2RC/biOz4T717nIlEBdgjJ8A1X4EA8nEV7y
         3q00P8zDUtkw7+U67TH9bsb8BHYLHimrZgl9vYgmyzRk7QS6E47h0wvT6jhBm94p6GSX
         PHXqPhFoqv7lNyaVAP3w0jD45L27Y0GrUYI2/9mBlBmaIbRzXy7l1p9NLI6OrYU2YgQs
         DNRQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="F/UB+gOI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id wi22-20020a05620a571600b0078d614bd39dsi2137539qkn.529.2024.04.11.12.47.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 12:47:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="F/UB+gOI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rv0O8-0007b1-LQ; Thu, 11 Apr 2024 15:47:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rv0O6-0007Z6-1D
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 15:47:10 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rv0O4-0003Qt-Di
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 15:47:09 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-6ed2dc03df6so217764b3a.1
 for <qemu-arm@nongnu.org>; Thu, 11 Apr 2024 12:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712864824; x=1713469624; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S46kT4t7NiJqb2sOUbszK1wdb9x9qW18XR0HsqAIj4o=;
 b=F/UB+gOIMkLw22wS4df0mfgkJzoym/LuIujmipBkk71x7MWkPo9j4xE6xYeYsspE15
 AKca0leEsOUVolyDPfDaufRM3OZySyrhbONz2Xg5pfeH1kMuFHgSPZcHnNOezNv3/VAc
 SXcESV8aSsgT9QPmrvh5dy+OGlob0pYdh9fSPRuDPI4IyLvC2tD7Lg9E15PnwT4m4tIh
 lrGtm5gP/i1klCd1DwHHdsAOMiZ1UIYQPFFFuF6p1Q7zcZ6f1aI8tSCIObIo262oMD+R
 Q6loHi+E9V52l+SzbHJaq3I47QufKeOztQOMvpgdlFhDMyBuEgTrFX56mMoeqxtEtFGt
 ck/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712864824; x=1713469624;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S46kT4t7NiJqb2sOUbszK1wdb9x9qW18XR0HsqAIj4o=;
 b=nPKY2PXqzP8H29oz2R9uQk43OFS442FuICAo4UB8X7QMS1nz5cry4yGo9qt+Ed7q+k
 a7QHrNW5xn4dc8WYHde/cKHAGf9xn3tPPj6lftiVnksdcEpUT22Sy5ge7YfE6Xge/aAo
 LQfJuy9WREH6vdnGXOHGsLkZqsms55uPJz72GWRmhJ/JCQ2FcqtHiZ/C0kKZ7iM1Jshf
 kdKuK6i4mS2ZffQ1C4CpZbZkandk4qzxO2qQS+TNJgsQZN7taW3bbU2ACiWHpBYWvXnk
 6LeEdo4TlkfEpv08C+nYlXLEYDTfbfPQwksdmKcg7eYpcIGPRwe6yjWgrH1vDZMC+9HF
 Tvtg==
X-Gm-Message-State: AOJu0YzPiBEt+OsiVVPBwol/HdUnm3nsQIeGsptsEPxqa3u9owrXL70c
 /w4Btl2oxs7SzECo2+x8WFlqBw4U3AXVxP3sElHCALqrbYxIopNIppOfJSKABSs=
X-Received: by 2002:a05:6a21:606:b0:1a3:af3e:1c87 with SMTP id
 ll6-20020a056a21060600b001a3af3e1c87mr965926pzb.11.1712864824576; 
 Thu, 11 Apr 2024 12:47:04 -0700 (PDT)
Received: from [192.168.0.4] (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 q2-20020a056a00084200b006ead124ff9fsm1543636pfk.136.2024.04.11.12.47.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Apr 2024 12:47:04 -0700 (PDT)
Message-ID: <694e45fd-e2bf-4fd9-8dba-13490225afc4@linaro.org>
Date: Thu, 11 Apr 2024 12:47:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/13] hw/ppc/spapr: Replace sprintf() by snprintf()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>
References: <20240411101550.99392-1-philmd@linaro.org>
 <20240411101550.99392-4-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240411101550.99392-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: AvMy72xuH0ED

On 4/11/24 03:15, Philippe Mathieu-Daudé wrote:
> sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
> resulting in painful developper experience.
> 
> Replace sprintf() by snprintf() in order to avoid:
> 
>    hw/ppc/spapr.c:385:5: warning: 'sprintf' is deprecated:
>      This function is provided for compatibility reasons only.
>      Due to security concerns inherent in the design of sprintf(3),
>      it is highly recommended that you use snprintf(3) instead.
>      [-Wdeprecated-declarations]
>        sprintf(mem_name, "memory@%" HWADDR_PRIx, start);
>        ^
>    1 warning generated.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/ppc/spapr.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
