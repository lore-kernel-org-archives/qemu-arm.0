Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1949807ejb;
        Mon, 12 Jun 2023 04:32:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4MZSgL/QMMbKuL4m010JQkhgbOwDfN3/iNHkaFtDLwicY46SKYZWOoMe7VueD6Il4rXhUZ
X-Received: by 2002:ac8:5f0a:0:b0:3f3:932f:193c with SMTP id x10-20020ac85f0a000000b003f3932f193cmr10993661qta.35.1686569535692;
        Mon, 12 Jun 2023 04:32:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686569535; cv=none;
        d=google.com; s=arc-20160816;
        b=n3hoxcsxf3elKNjIuSFbypt0Z2KXM+rpuLxz7LyxEem4uBETKHe01tnrUqOwFehezk
         7BziqNkaFz2fVo9IqNeyTVLbk34gezrRAoNbBmf5BtgsH1/8zkSh7J2a1Ea4nh0YSed2
         tRurPyRXOvkPZuuam7PSEe0UUcwAFs5sMQFZGEFZaLpnUdFz51HcjyY/CuWeIKrrE1zi
         0YAvrC4TWYykLDXJ98JKwDlbUZ19/PPFJ3CMpJOTKhwuq0p3rqSFgild4Xd2HX6ghcYm
         ZfhlVAGj6RO0nBEhl08ZpBYKejllKbTebcoOUXigxei+YH6+IAQA+aHpFeUW7h4dE5G3
         6UOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Hd/sfT9Mdzw8Iv+EmqF3Z9OrbvEFGNDblV3FzAecSso=;
        b=0o3//gkm3SgXJDzQTyujaHtAe9seUis/6hyI2wKnePtXEzmz2hsvvbNQlUzUyi3jnt
         +i9a5nRNOR6Vrnsx20uGQoZaONX//2RSQBLop/IjN5kQoYGW684DJabPDDJUSogcSsbB
         yB+mtOrE/Nnpod1+gzY2ib7dMum5snLuqINxq0Hm75j+EXGstoXJYZofc02L/L9xIj1l
         svin1/DxOApAayqw01whSmKAjnoBFhXMsNSuEztIinGAC8471aLQk3zKfleHrUCxW/H2
         HjTts3pd26AF/UO7GHTjDferR0mCe8B3e8HLDdVaArtArQkpVDud+dNVd7dpCukdXprB
         C0Nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z8Ae9bkD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e22-20020a05622a111600b003f8698c538asi5966631qty.762.2023.06.12.04.32.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Jun 2023 04:32:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z8Ae9bkD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q8fmF-0004KG-HZ; Mon, 12 Jun 2023 07:32:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8fmA-00049o-Jq
 for qemu-devel@nongnu.org; Mon, 12 Jun 2023 07:31:58 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8fm7-0006Z3-4N
 for qemu-devel@nongnu.org; Mon, 12 Jun 2023 07:31:56 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f6d7abe934so29077475e9.2
 for <qemu-devel@nongnu.org>; Mon, 12 Jun 2023 04:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686569514; x=1689161514;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Hd/sfT9Mdzw8Iv+EmqF3Z9OrbvEFGNDblV3FzAecSso=;
 b=Z8Ae9bkDvENDs9gG34ZEumLQMMd/hOsIEdGN3LB1r9FiJDULJ3gG0lVDv5zZjWAURq
 XNTieT3nHWgXdqebUQUiKGRvAynN9ITIpmVoAvMKJLEfsslJIZWBNs486fTznNiW1a22
 B8iz5SuWT0tz9KTUer6OOTfYmdHDdpDNlqaEX4oKYnAt9l4fXkEZdY/6b2micY4Zvyn5
 ys3Ho4D2koVWHPqUWl4d4ZfNtCbehvadlslwAzbCjB2ux9Ibu7ZMttgDQXL885e2vhAw
 HeoP8/88Q7BZkShLiVn5X2jo1opQvW1YaDwAprlXvdTP8s6tpNHASA1X3InU76lqgPv4
 vSRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686569514; x=1689161514;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hd/sfT9Mdzw8Iv+EmqF3Z9OrbvEFGNDblV3FzAecSso=;
 b=RZRXv5ZMeSFncS0inXnt41qcNKXbRuEM2lMHCjy7omdqOpPrwelzEZSygAMc3PYKHD
 KwmObQti9tEnndjx8u8rH8m1Yh8LZnyQw0477TJTfmHebL2X5NyA3JKlhT+PZXiEu8Gn
 yznDPDG/yOuic5eyv8Ikilegghv9BW8hCbiHV6i5hGvLQ0QruKXYoNxA3Tkp4e+/cEU2
 Gu9ezrOU5YzVK2dp4KLMFKzOS3/x858y2OWqRy7RHBwCajGFnEDX3BXPg9liiQK+R64t
 Rk5E1mX/9P/G9rDzJUhzTjwPe9AwHaerMnKitZk02Ej09Y0bbof5yk11Tl8fcRoaebzJ
 h3Ig==
X-Gm-Message-State: AC+VfDzZGAcgRQz6fBWQv08JExhbdWdyArQWWaYWaI5HbJFAaNAl81/i
 RpBi7I1/IPIjInHxFg/TjmWoeCmMi0tIkIFiJUgItg==
X-Received: by 2002:a1c:740d:0:b0:3f7:26f8:4cc0 with SMTP id
 p13-20020a1c740d000000b003f726f84cc0mr5466081wmc.17.1686569513708; 
 Mon, 12 Jun 2023 04:31:53 -0700 (PDT)
Received: from [192.168.112.175] (176.red-88-28-1.dynamicip.rima-tde.net.
 [88.28.1.176]) by smtp.gmail.com with ESMTPSA id
 n26-20020a1c721a000000b003f78fd2cf5esm11126455wmc.40.2023.06.12.04.31.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jun 2023 04:31:53 -0700 (PDT)
Message-ID: <93679995-37da-8cf5-431b-5ce9a7b59294@linaro.org>
Date: Mon, 12 Jun 2023 12:37:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH v2 09/23] target/arm: Convert MSR (reg), MRS, SYS, SYSL to
 decodetree
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230611160032.274823-1-peter.maydell@linaro.org>
 <20230611160032.274823-10-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230611160032.274823-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.096,
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
X-TUID: Vu76Gpu1f1K/

On 11/6/23 18:00, Peter Maydell wrote:
> Convert MSR (reg), MRS, SYS, SYSL to decodetree.  For QEMU these are
> all essentially the same instruction (system register access).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-id: 20230602155223.2040685-7-peter.maydell@linaro.org
> ---
>   target/arm/tcg/a64.decode      |  8 ++++++++
>   target/arm/tcg/translate-a64.c | 32 +++++---------------------------
>   2 files changed, 13 insertions(+), 27 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

