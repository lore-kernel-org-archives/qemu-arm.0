Received: by 2002:a17:906:d8da:b0:98d:c41:35ab with SMTP id re26csp373462ejb;
        Thu, 22 Jun 2023 03:01:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ77tWflkuPhDkVcOG5AuyJcYS5QJPsT0EDac3xDic+jbQHM2BWsVmv8iNt29LOy5zxLsSIj
X-Received: by 2002:a05:622a:18a1:b0:3ff:2e19:dcac with SMTP id v33-20020a05622a18a100b003ff2e19dcacmr8982935qtc.48.1687428095392;
        Thu, 22 Jun 2023 03:01:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687428095; cv=none;
        d=google.com; s=arc-20160816;
        b=nyfrfKXLbVwWGIcNm9htOqODCalbtINHjsNyUc89wll/u4vodz8F+uNDkyt9+njXoN
         9M9PAZxdFRkShJGF0OXwcUrOAYcqVhu1I6HwZRSEg4pIM+WKQNu9zg4aD1mB8Ivt7H16
         87FAZVX9VTlalutefsLO/TbgV9/4YUq8pltKN3oPfO3MQgQ3GffinXPHX8ZxBPyi0nJd
         RanxgZH5t8Uael8Oq2Ke8vIu45+k8x5xFLqNMgAK3e3uGWXsyYBrDkKJfXwmZeqrxSm+
         gYMYzyoMZHdTfdHVLBP3CDc8yZ6htb25h7xf8+wkQeJksWXLt3jn5OhY8OMywQUmJxe7
         NPNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=MbEzjD6IbJq2yYB/LZuLB4SgPhw2OUm+1nDOIzi0++M=;
        b=pewd3sJRl5lQN7IDFwzIi06UVpjIiuIZSUzOftH6CW4cUc6wTT+DubB7zflkmkLkZT
         qnFoSAinQ84NfL0nNYxpBaMfPSYWSK9i8rHE+BnIvuDFRiYZzz2tTwVcuOchOuPDD0MX
         HK3zlTf02Tw5Hoj1o3suZ9tc86L9H4fY0ZFd8nGIiIvgbubqkQ10kVs5s+/qmI547r7T
         ZA2I4DpRjXzQloNDAvFnSPX47hu6aZERzOjcHFBmTEVQKJ4IEXJot45CJHz6UC1B7TyO
         XZlvcpB5Cm7teaxQjj/Yk2PjYQaojy8ywzV5x2uvMWtoxBTCH053G9QQhXCgk2t+lkMb
         Rg/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cE4BJqv1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d11-20020a05622a15cb00b003f1f5e02726si2486356qty.198.2023.06.22.03.01.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Jun 2023 03:01:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cE4BJqv1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qCH85-0007EK-Q9; Thu, 22 Jun 2023 06:01:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qCH84-0007Cs-QC
 for qemu-arm@nongnu.org; Thu, 22 Jun 2023 06:01:28 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qCH82-0002p0-0D
 for qemu-arm@nongnu.org; Thu, 22 Jun 2023 06:01:28 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fa74d06d72so2834885e9.3
 for <qemu-arm@nongnu.org>; Thu, 22 Jun 2023 03:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687428084; x=1690020084;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MbEzjD6IbJq2yYB/LZuLB4SgPhw2OUm+1nDOIzi0++M=;
 b=cE4BJqv1yTZ9Staqu/IZTo5QDN+A84epl0MZIfKVgYeMReKl5UuFP0YBA88KWoUP3/
 4IbJ+Fx9LPlvk79tV7CFM7OiukBphQ4Oi/qLG5eBe1HE/jNKdx2LUXV3Mp9Yw/g7fSfq
 iV/TqopAKDX0snD3nVXsn7rtYDTV7Ea1xP5Y98w8WgXBN4x8rt86NdKeRxWCEHdLGi2B
 QDzeXEDzomnz+UmanEwIhtEKZiou5ZZg9HZ+WNqbk3toWp2wDsyug+4Yu47G4gibPFJn
 NKlh62z6Z+3PGqAgiAbw29oOvKTQd7BZSJdJUQpMItiVKhzcgY0UzgI6zA01NtpbvblL
 tYYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687428084; x=1690020084;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MbEzjD6IbJq2yYB/LZuLB4SgPhw2OUm+1nDOIzi0++M=;
 b=YWbsN12ZeOUJMDjKpcek6vZzxtwKlG0dO95i384jlT6X8GhTR2Tc9EZA7TeiS31e2K
 pyfA6e5Xf16t5pvfp8nRMLJDX/LS+JNAEjwXbil1pYBTwbMouyqbr4n5ruLdhHZBAITU
 UmImx3Y5Z3gU/63zcmzIi9Jhp5LuG4zhNAvNaPoVGb4UEGoACccY3KP4ngWMzxvGFsbN
 BHG7/tnZfnFUUmeTZw/IfPCiTPiCsJqH/KyfBNTUrF+CjTHYSL0NfMAM9EfNFPk0e2kM
 hZYk8MgVqkkngQHAwOtExDYkzFn9/EK5E9XzcDmnAVJaQbk5CD4xp4nd6n6o+jEOxw7N
 QXEA==
X-Gm-Message-State: AC+VfDwyyAkNlLgHg0XsfWr1nHsCi6sEjV37ypR69qsVhI7sOQAEnSV9
 xdLQzUnKJQTQ/OCArf8I+LvxmA==
X-Received: by 2002:a05:600c:202:b0:3fa:7828:df2c with SMTP id
 2-20020a05600c020200b003fa7828df2cmr110126wmi.16.1687428084381; 
 Thu, 22 Jun 2023 03:01:24 -0700 (PDT)
Received: from [192.168.122.175] (127.red-88-28-17.dynamicip.rima-tde.net.
 [88.28.17.127]) by smtp.gmail.com with ESMTPSA id
 d2-20020adfe842000000b0031274a184d5sm6651529wrn.109.2023.06.22.03.01.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jun 2023 03:01:24 -0700 (PDT)
Message-ID: <64b52dc5-b55a-17df-def6-da8af3c291ea@linaro.org>
Date: Thu, 22 Jun 2023 12:01:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 7/9] accel/tcg: Add TLB_CHECK_ALIGNED
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230621121902.1392277-1-richard.henderson@linaro.org>
 <20230621121902.1392277-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230621121902.1392277-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.093,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: +EHyyiWHUe7h

On 21/6/23 14:19, Richard Henderson wrote:
> This creates a per-page method for checking of alignment.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/cpu-all.h |  4 +++-
>   accel/tcg/cputlb.c     | 27 ++++++++++++++++++++++++++-
>   2 files changed, 29 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

