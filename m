Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp1659658lfa;
        Fri, 4 Jun 2021 19:24:04 -0700 (PDT)
X-Received: by 2002:a63:ce4f:: with SMTP id r15mr7757526pgi.387.1622859844052;
        Fri, 04 Jun 2021 19:24:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622859844; cv=none;
        d=google.com; s=arc-20160816;
        b=Vck7tPQ3mQVTaaJJOpTcwXa+HLwDw8F8zUS+j9fb+WFxTnY/WuWn2foTFnYm0C6hQR
         e3A1fnuFsz+3Q6V3w2NlkEwKOqWPJUWTYEc9FbFVHkbW1Lne+RHMOsP1jP8moSjUi4sO
         m9dFVI55hJRj9qCI4mRVC+sOb6qZT30h9vZrfurj84juxCHxC+wEJMTduirzmrQuJHtX
         MAzq6MmhXhAvaUlmSv4etU/7FGcxkCWbjBPlGfwA4LPEoD6Fky4HjFAUEShpFeSg0sCY
         y/17u996q2YauvMZEaHOmQIDiS/3iv5mV0gwqIL34opV6nSjEho6UgsM0mdnGgEhiWdg
         49Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=uHzehet9FZ7hyFejEsNlTZUCqi5M3GUKFzafGj1bo+A=;
        b=ttaHg8tiXhhkC9C8fobw3i6MSr656AQwCoL1BaK3GTQITOwnjFQHoau1s30KEUS7Kj
         VGkgPC6hXNSZkrM6fM3sbSyJnLgR+1bu50u2KiIfD1xGZbGP5+FweXzulVqqHpJlJ/Hq
         nPrKCkckYUf5KJtVinirI+FIL5t+Yz4B154QlgZO+1Di+ws4fItmCPnKJHXKmmAKjEhI
         7Eji7S9H2o+odiXOXw9pb7aYgTX6J/t6Rmn2wavc3eyfKADjskCNVxA7U17A/CSa5B5U
         rJ2MRk7btVcEt72IuHz3EuQc4ljJ9qDj8diZ4iSjm/ky/p5FelCcbimwen9KE57HfbfY
         NJBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PxXpwRlc;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id nm23sor2556718pjb.21.2021.06.04.19.24.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jun 2021 19:24:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PxXpwRlc;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uHzehet9FZ7hyFejEsNlTZUCqi5M3GUKFzafGj1bo+A=;
        b=PxXpwRlc5QSTpOgesSE9XBwwjftm6FOuWqq8sPmVrrdJyao2dOkL97WfmXwVtLUzYW
         19sT73j0wgeOaM+yMaF4XnUOdZCPxczUly50X1Ye3dOYLeDf9UpDPvsfyZwCidtoe1XR
         KVcaYuI/Sd3CRlYIsOqH+v2Dj3wWIEowVWhR78gsSeDy+u/Yztsr51jDs1HCkNhK1q5j
         bCavG+Ud21ux8JEt0f8SMtMgLOEkkBsa/Gr1KGl0/corHcM2RY1cse+M/hEhrAnXLi9F
         seNfJrhUEmMrrJuOzzJLJ+tIaQugB65Df/F9Wx4Uv7uM4ohMnwwMnNh5NauwSCd4SIHg
         ol1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uHzehet9FZ7hyFejEsNlTZUCqi5M3GUKFzafGj1bo+A=;
        b=DmuK37bW6bQrcNicWMfMfnB1jOzJxn7cpLwzrsMBFmAw/7bFx7DEjp1yddAmKu/sv/
         WTDG46BNNol/cB9u2qQLq9k1aPZVoRONLwPqlfWcblL9vVisWCrF8wUWJMDFYoeM7ytH
         GFY5BGdYCptG0qUgqctGJBcNLe1Epmv5KGWiLPaMOw69/AwSiPb/G9tzMasnG41qD+Ut
         Riyr8XcOvW+S1RmGl9V9OYy7a6J/qTK846rvBOOl4Vd+3IltJcf1it388plJJPUu23lP
         RQxeZ38bhXY1dcYwv+M3NU6GSAwcdg0BWpXS9Q1x9gX691y1NHsOWtJWf3GxQ9YgkVAY
         q1qQ==
X-Gm-Message-State: AOAM531qntzRsD4mvSXeFv6piFFmbtsupsJHO+48reMh/8WBssah+2CZ
	jyXHCH9XJ5Opsp4jxAf/s78HI5U/
X-Google-Smtp-Source: ABdhPJx31fIi2v8xSJHxjqWb45GayauFes473eDsam8kSsUbEAYzgm/QZyIQ7UEICDDwZqfbmpXXAg==
X-Received: by 2002:a17:90b:3142:: with SMTP id ip2mr2183153pjb.63.1622859843638;
        Fri, 04 Jun 2021 19:24:03 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id z6sm2896078pfr.99.2021.06.04.19.24.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 19:24:03 -0700 (PDT)
Subject: Re: [PATCH v16 53/99] target/arm: replace CONFIG_TCG with tcg_enabled
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-54-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6e14759c-3d39-7f19-a14e-dbe44e2af67a@linaro.org>
Date: Fri, 4 Jun 2021 19:24:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-54-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 02QxtqsQ8HcC

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> for "all" builds (tcg + kvm), we want to avoid doing
> the psci and semihosting checks if tcg is built-in, but not enabled.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/cpu-sysemu.c | 30 +++++++++++++++---------------
>   1 file changed, 15 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
