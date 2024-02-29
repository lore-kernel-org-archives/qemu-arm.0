Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp712944eja;
        Thu, 29 Feb 2024 15:11:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU+0BE0f2vKMukEA0QQWqGAh/RfcGYMD2tccvS7WQsTLQqz3I8dOa7rVfn5VlfJfeDmj04KkXRMaBJHF0Zequ0ysXLbNYSj
X-Google-Smtp-Source: AGHT+IHM+sHJ87RlRVbLtCewtp2r0U8BbXkBaSTiMo2xD+J2hPSlYLXFzn9bVAzRHrPg3nrn9Ixa
X-Received: by 2002:a05:6358:e488:b0:176:40d5:2bd5 with SMTP id by8-20020a056358e48800b0017640d52bd5mr4289994rwb.6.1709248290709;
        Thu, 29 Feb 2024 15:11:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709248290; cv=none;
        d=google.com; s=arc-20160816;
        b=Cjugxo7j5kwGU09tiy0M+RfUS3oPu4euHR+nqX0ff+Tpc2Oi+VtZSdifQd3D5uOosl
         1m8TuTW9ZFd/533/aFGU8H89AS8t25F2ywdjmXGfVEfl2xlqpef3GiPnYrn5jF9AmkNb
         +2bUYoI3D9M4xujkHpQKxLn5LBjWJdzGaqc/cExFwBnLVuGmI+H4xbdTWR1grOSrhFxV
         mRnMNpfDKNeY+GYrxwjWowD6BWnDUl3FI0A6JQ5Au97c3kfhPJqNTwk9JCla+9Ftsc1k
         KhKIHzNdk4hmJqegSZZKb9W0AIFAZ1h0/a0UXS7AhqaIdDTvwafQvf9DpXV8zU/WzXUO
         HEaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=jmUQEAZPsptV96SEZMGm2MuJEGaCazLT6BHoaPXUKPk=;
        fh=To4mGP2GU9kbsfA5l7mFDBGendxZFfhe++GKRCOW03g=;
        b=xnbfPFbJwqhjpCQWSe2Ygvn+BBPFEj+OVIPfWg95Y+YI729cNSl+EiNiGe8S0HxDZe
         Wcx7WDPMqnoEwpNIXW85ZoUJMMIiiREyBz0F6Js+U2HTQM0k3wUaga2X+lafBBzbQF8U
         GMh7/NG8Z1/oSYKO8c9+FhiCPe9avxBzCuZVpJ6iUO17XD3/ambYQb8sJ6SFSmYts8nO
         L3lVay5YnSkchglag/ffhsGe0zAJrns9aSFYZoJ2Xq3I5+V2ZRNtFn/9LmHmlGeWgIRt
         w9WljJoSD4l1SXOyfIhXh3h2ojCrbXt9UrAWH+GqmvuI+/3uF/gxHmenNeJx19gJc4Ja
         wORw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hpj+4a4Q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gw11-20020a0562140f0b00b0068f425e583dsi2336712qvb.527.2024.02.29.15.11.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Feb 2024 15:11:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hpj+4a4Q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rfpYN-0000fB-Lp; Thu, 29 Feb 2024 18:11:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rfpY9-0000Wk-Mx
 for qemu-devel@nongnu.org; Thu, 29 Feb 2024 18:10:50 -0500
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rfpY8-00087w-9P
 for qemu-devel@nongnu.org; Thu, 29 Feb 2024 18:10:49 -0500
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-21fb368b468so826517fac.0
 for <qemu-devel@nongnu.org>; Thu, 29 Feb 2024 15:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709248246; x=1709853046; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jmUQEAZPsptV96SEZMGm2MuJEGaCazLT6BHoaPXUKPk=;
 b=Hpj+4a4QLQRj0ny1+Dk5J6ZvSRbod4KSJOkEKFcDbrWvIn07ojE+MngFu4K9d9cYM+
 2bktqqpRap/mdfrba9U2YwWv/hkW6EvS1y8LhmYQHKbP8RtkUFUmxW+DdJj5531sLNqU
 K4bA0Ue0d9zreFDWrlygTgqOMbnfwv3cWNIoxfhY9wWPJFGeQEkaMKQQ8ihQCi3Lyl5D
 rm1C6F0J5lgZqxSdFoMkDhKp9m+DK53gUKJzSA2RTqNqnuuvY6p0ayzFPRMZ6W66CPxu
 5x6BAkFtmh1rqf4wL7lEmJEWHm/DpsV+XGLSaXbGqJkDFYKbMrWCdFg/I9N1CQot42lv
 EldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709248246; x=1709853046;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jmUQEAZPsptV96SEZMGm2MuJEGaCazLT6BHoaPXUKPk=;
 b=OfebK6+KqtLyHYvAKdVJl6tU3CFowOa0I8U98aEQ3Ow0cNisdGHVpHWhCptUP3vy1J
 PPAinloBnxY7EiLHSLL3wDnK1FSt6cTx6Yp0Kcyva8aASLImQFE+dBiG7N6GzpzizrA1
 HCGCC12S0aB6jmd9WqHrdan7s3LVdzt6vl6pYVdlfJB45M6exnqr+1aVGhfe5NIezYLx
 DrGmSJLE6G3Y/CoaPUXpOfBslZsdZtAzHO5sxbrrNn1LWCykia0eLlq6M68g6nG+BXJ0
 E+suDzvk2/zPPL+XpwcdaNztqiZs3cqJhWMwtY418+1hyOUDv6F2nhNoI86zj9h4HVzC
 acUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVz6vNrb6bIkEdkNIzsIiC/dkA4YrnhhVUKlN+V+Vww7OMg2am8NFNyqx09MQbNFz6abHqqjFJOQqBElX+TlVt3Vif8clY=
X-Gm-Message-State: AOJu0YyAumrNvNYS0TxSnVy+BPJRpRs0h+YcA/jzJT/XTRVMOeSO6TKN
 iVj+UNpE9jOr8oLVoXyQTl+NE3JQuLBAAGMsTXVFJBCIvWzaer2VIr1zkCi/yO8=
X-Received: by 2002:a05:6871:a595:b0:219:28af:f8a6 with SMTP id
 wd21-20020a056871a59500b0021928aff8a6mr3492012oab.56.1709248246174; 
 Thu, 29 Feb 2024 15:10:46 -0800 (PST)
Received: from [192.168.6.128] (098-147-055-211.res.spectrum.com.
 [98.147.55.211]) by smtp.gmail.com with ESMTPSA id
 du6-20020a056a002b4600b006e5933a0da9sm1733399pfb.165.2024.02.29.15.10.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 15:10:45 -0800 (PST)
Message-ID: <e67afe0a-4584-41dd-8683-c99aeb7be7b2@linaro.org>
Date: Thu, 29 Feb 2024 13:10:43 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v5 14/22] hw/intc/arm_gicv3_redist: Implement
 GICR_INMIR0
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240229131039.1868904-1-ruanjinjie@huawei.com>
 <20240229131039.1868904-15-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240229131039.1868904-15-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: jCyKWDZs+p0/

On 2/29/24 03:10, Jinjie Ruan via wrote:
> Add GICR_INMIR0 register and support access GICR_INMIR0.
> 
> Signed-off-by: Jinjie Ruan<ruanjinjie@huawei.com>
> ---
> v4:
> - Make the GICR_INMIR0 implementation more clearer.
> ---
>   hw/intc/arm_gicv3_redist.c | 19 +++++++++++++++++++
>   hw/intc/gicv3_internal.h   |  1 +
>   2 files changed, 20 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
