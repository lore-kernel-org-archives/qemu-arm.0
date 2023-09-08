Received: by 2002:a17:906:bfc6:b0:9a1:fa4e:495e with SMTP id us6csp678167ejb;
        Fri, 8 Sep 2023 13:45:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuoS1uXVIESO9PDbfA1xnFJQmzJDPiW314FxFLk7em95slwg+LWpMSc2Xa240Wo6Ti6UH6
X-Received: by 2002:ac8:7e82:0:b0:403:b9c4:b5de with SMTP id w2-20020ac87e82000000b00403b9c4b5demr3904721qtj.21.1694205946300;
        Fri, 08 Sep 2023 13:45:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694205946; cv=none;
        d=google.com; s=arc-20160816;
        b=pDyZ68HphJS8AzmKbj8PZb4FFyDiAsK6jh55Xi1UwqDYmvbDmw3l9wYaJDF5Bq3r8w
         4AZEv8Z5ViKZMv6ytyXPn1jvlnN8jC7CIlJuwxWO4acLBe+Fqt1dthTk2OvEMQpQMDMs
         GH+mymnDy4qo8InCQc4a0yiTx+UiM+o5FzXBy2e4DLt42vygiLMqU9VpSp/yNY1r6l6G
         8DdCHXkCgn/waiKYrXa78XnFzosBNtzzcs0S8IuzDDBxfzzuLMKYE8w28fcfwjNzp4ro
         V/sQDzU5F1wOFDyk0wJXNgTx5fQplhUJeNJk0nHOZD9pZdMMqh7nqpeIPFcI2rD6UhRs
         WEJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Nit6PVV2MFQq/HTG06CnL5wGGirI//SCGqDSbpqVXKQ=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=erUQn4VH8s4+9GLZxoZXkqHuUZgsHYd5LULaRkrPbne4fPA6ktqs3rg3DyriBnlhe6
         vG7p042hLkyIbbm1YUbtqraaOhpgTdryXDNXl/iPtlXYPGMyneydvgqUWfEvVuMw9+CU
         7gzlclbqmW6K5HFCSkg4BZQJajsr31lKESFAId7f2vOhx/9gRWpo+lHySEfGUatCLNRe
         nJlCAYK0RSLbIF63I3mokjH+A2tmMVoktAnc7QIfReWay1AtsiHYroBTn2ugnYXuJ/Rk
         MZLtA7L/UOa4lHesnBYAOz3E6cArdkMkj8znYCSMUWw4/tYfdSqymFl531rxwV3GIbOO
         qiCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mfIq6BHU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i12-20020ac85c0c000000b004109a217882si1678461qti.625.2023.09.08.13.45.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Sep 2023 13:45:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mfIq6BHU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qeiLw-0002wV-17; Fri, 08 Sep 2023 16:45:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qeiLv-0002wE-D3
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 16:45:19 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qeiLt-00054e-7N
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 16:45:19 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1bdbf10333bso20601785ad.1
 for <qemu-arm@nongnu.org>; Fri, 08 Sep 2023 13:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694205915; x=1694810715; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Nit6PVV2MFQq/HTG06CnL5wGGirI//SCGqDSbpqVXKQ=;
 b=mfIq6BHUc5KzcDfYxAHGI1WCBgjQvVRHK9zWKgBpcPNFGz+mi196etRxsNxzYJ9hE4
 roXVOFb0CkHkeMOurOajz9PGfjzB9kL0gLqXqa3oL/GOWJDg3M4NtUGM9uZ3SbXa2HJy
 b9AqFFaRW0e5h40JxgEhO9Tis+Xch97Z5kZvIHDIq/rzOrLvrNbGy/gu+5tUtEt3AM4L
 uU6Vd3AFaTf8aN4mvldABVcVrHzgI0GPqbgLMlT+wPbgFnSDxDRRVf9ekPa0aSNK/L3a
 4WbabiXPMxqqGiVyBKxjgN3N3Heqngy7rWvrHXo/Mw1/Yoong5Fz+PcPp/8DbbaDvpaM
 dQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694205915; x=1694810715;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Nit6PVV2MFQq/HTG06CnL5wGGirI//SCGqDSbpqVXKQ=;
 b=kJmnFex8cQ4QLWxcLmGCCfLvIgdIiDmmycUoymS9zSY9yDb4G31WuFkm/duBfmcI50
 Ef/FwNV81YzJS7pe/VA+pOxhbMF7oNle3dpByXG2Z1rkcdOsyK+QuQJ4sANkBVqmYEJB
 2Do2wOgcHN/4G/MEPiCKIwltMv3afMnnV3TtnhCOT+F51mEbaNkGeKbpI89uPz/ULooJ
 a4V5/HvFsuawKF7P4PjVV2RaaGaEaIS/fK7INymdAidxgaAA11Zm7ixiyIk4Kvy9+cri
 a2B0uiwsrI8/r344efBGH4OlvVjvt3k090gxQWg/A53ZWetf9mekeMKAt2szIuIaRMF7
 xBog==
X-Gm-Message-State: AOJu0YzhvIV9tIazp9pcMF0/qIhRmJ4zfeO733muUGx5QeqmDxyNrVnK
 jB6RHYhYGhHscv+HkV0ZlOt0Fw==
X-Received: by 2002:a17:902:8ec2:b0:1c3:90c7:b99d with SMTP id
 x2-20020a1709028ec200b001c390c7b99dmr1307352plo.41.1694205915222; 
 Fri, 08 Sep 2023 13:45:15 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 y12-20020a1709027c8c00b001ba066c589dsm1972437pll.137.2023.09.08.13.45.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Sep 2023 13:45:14 -0700 (PDT)
Message-ID: <0ad4178e-3a94-0944-62be-8f98f03b6136@linaro.org>
Date: Fri, 8 Sep 2023 13:45:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 05/14] target/arm: Pass unpriv bool to
 get_a64_user_mem_index()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230907160340.260094-1-peter.maydell@linaro.org>
 <20230907160340.260094-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230907160340.260094-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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
X-TUID: x0T/N6orquQr

On 9/7/23 09:03, Peter Maydell wrote:
> In every place that we call the get_a64_user_mem_index() function
> we do it like this:
>   memidx = a->unpriv ? get_a64_user_mem_index(s) : get_mem_index(s);
> Refactor so the caller passes in the bool that says whether they
> want the 'unpriv' or 'normal' mem_index rather than having to
> do the ?: themselves.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> I'm about to add another use of this function which would
> otherwise also end up doing this same ?: expression...
> ---
>   target/arm/tcg/translate-a64.c | 20 ++++++++++++++------
>   1 file changed, 14 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
