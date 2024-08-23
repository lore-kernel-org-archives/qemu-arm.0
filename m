Received: by 2002:a17:505:1116:b0:1be9:327d:8ee3 with SMTP id pu22csp73239njb;
        Thu, 22 Aug 2024 23:42:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUd1jcDb2vYtVK4v7CnWqKyWwsTWz8agY2Ck4HPogCvRVQBAWorthXFMDQdOfZcnbi6LQzVJ/6HU0ZJ8g==@linaro.org
X-Google-Smtp-Source: AGHT+IHXmM4GNClMHN8vL2SuBBC3uESb57tjGfrH3eb+V6rOne+T3Ud11rtFEnDwsncJswrO4jdB
X-Received: by 2002:a05:622a:5590:b0:447:ef38:a8cb with SMTP id d75a77b69052e-455097c2e9amr20289671cf.39.1724395344218;
        Thu, 22 Aug 2024 23:42:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724395344; cv=none;
        d=google.com; s=arc-20160816;
        b=EYCfbRh+1wxVCPAtvfBF+OsvCe7wyRRKEe/fRkJ7Cm+KKaB6SrcvhgQ+d/QXCcEc/I
         VpCsh34gwIwg1z02Ez8dfvScgJ0HxmA0GJUjkkuaXOT1rAB6KFyX3BPrJJRcDR7O2VNn
         x2DerIb+H8wdhJXqLjKMTxblEvonUkjMTwkvUioJgWbyIr5I16bzilr6BG5U7na6vcVF
         XLWoiTOwBD9kx09Yd5aDJJO1dFw+hoyCa1g9yvtc5bBAsxwHJmJRzA74IuS8GX1ITgmu
         YjfzIK8acemdQcDp9MfSMHy4up8f4bg0CaQke9IMpWJ5VNP7qGF6I2Arz29ZIutgczQo
         PEfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ab1lZ6ALzabLfsNKA10O1rqTDvAbnO5lJaNDTwXEERk=;
        fh=s239ftKSbga0mHDp4lHUFlpkqNcSJZJ1WNl/umkyRaE=;
        b=QfpvlrJVGrmH8sQlRbup9ibztvycQSji7SoXsSK0jon8IwGjaGROudXIPwlf88GKxU
         v6/B41wLqlnjtI7k0iLfz5Go0ygrWJDaTOR28ZfDE6H9l+GrsSciEA9p8azz1J1jyqwA
         3JLKpDgf2/1IacqEJsn3PJ9cZWIYpqeYM6CoU0pAdZRf2rs6E/hc1nHSdvlBftx59XwB
         tV6eKZSrrvNNiTHCpcB43w/lL9W7kIbOIToqwyHJduWKXhPZqQOhF6aR3axiEZBdFFe5
         zPoQSq7l31Dfs6GOLIQexH5W7DYx9dLGrlXrcKDMlEqIT3FyKXpgKQ2j7no3Xnh8LAn+
         SUfw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vW1S4ifn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-454fe334044si35582421cf.707.2024.08.22.23.42.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Aug 2024 23:42:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vW1S4ifn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1shNzv-0006dK-In; Fri, 23 Aug 2024 02:42:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1shNzt-0006b1-Ql
 for qemu-arm@nongnu.org; Fri, 23 Aug 2024 02:42:09 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1shNzs-0007oN-1A
 for qemu-arm@nongnu.org; Fri, 23 Aug 2024 02:42:09 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-37182eee02dso860235f8f.1
 for <qemu-arm@nongnu.org>; Thu, 22 Aug 2024 23:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724395326; x=1725000126; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ab1lZ6ALzabLfsNKA10O1rqTDvAbnO5lJaNDTwXEERk=;
 b=vW1S4ifnlOYWthTEiBkgU6rrdXFyxSYEnN8cEs5+Fn3o2CDeKN3YdTsybwqdkUiPp9
 OF2/Ejjoe+a/jDXyiQoCEfk0ELUl9dLiVr6o3owMGBtH1PKEXy69TQXsxw5sxJW++r0J
 ZDDFqJUrAbJTeWvWZMyYkHCz/YK+8Hv0y6gelmOgEOefmGOUknTmyMxO1gUIDs0DlvWD
 G4ioVhYOX83yTWgWlDVHPSpCVhoH8ehuQDo2vRqKo9to+oYTN/cYsnqtYjPW8p4Npx17
 hEUtxm4h6VkqvHobcwmSi9oINnM9IbMhxIbdWCoPz70oDT1plkKx6IN8PPv5sONGmAPv
 ct/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724395326; x=1725000126;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ab1lZ6ALzabLfsNKA10O1rqTDvAbnO5lJaNDTwXEERk=;
 b=cn7KqXDsy97ylLMoq6UXH5dIE1AlvHm+kfXBP2BZfduc1NSnw1Lj94+dUf4OiGbMVK
 +v9cqdlNg9oFey2W6sUb3rzkmRAqLehXWTHaH1wpGYg7FeLweO46Ol6HvFhG7wVvcGPJ
 7y88dLr1pzLt47jmA61IOLDsCLbn4UBpoaf7a1b/fCCv64y6OzLFSmjfThaC1+RpSQPV
 fZAXNVIZz39SqYrQs41xTzWZhGfFahtI9hAO2dOxBtLcA7SphpMoUs90JZ1W5PEaaR0U
 8ld68+x6WdcDcrMzN19R/vq5v6n0V6QDAJHle70UaTbL5wt0jyHxVUACUKcHE1s/vyLW
 +1cA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWALAHfaDtSAPshVFhblBxP6VI7qx5MYVuCexbwkoYyFbcvgn+KqmLn4UCAh+NXru/47IxSZqRyPw==@nongnu.org
X-Gm-Message-State: AOJu0YzL7KgvgZmG2Jq/G9XPQx6lfz0KYfpROZvUWJIskFceONAwo6fV
 DCBlRQBflSrXivgXeATrwVlO/51aCzs9FvVYmq0zCcNvJal2Ejxel3dPMC3QL9U=
X-Received: by 2002:a05:6000:196d:b0:36b:b08f:64b3 with SMTP id
 ffacd0b85a97d-373052b5082mr2707047f8f.20.1724395325782; 
 Thu, 22 Aug 2024 23:42:05 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.206.153])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ab87e881csm106351245e9.1.2024.08.22.23.42.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Aug 2024 23:42:05 -0700 (PDT)
Message-ID: <795d0c95-9bbe-43f5-bcd4-edcbe00cddc9@linaro.org>
Date: Fri, 23 Aug 2024 08:42:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.2] hw/arm/sbsa-ref: Don't leak string in
 sbsa_fdt_add_gic_node()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
References: <20240822162323.706382-1-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240822162323.706382-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: +C9JhrxTRbVB

On 22/8/24 18:23, Peter Maydell wrote:
> In sbsa_fdt_add_gic_node() we g_strdup_printf() two nodename
> strings, but only free one.
> 
> Since the string is actually entirely constant and we don't
> make any use of printf's format-string operations, we can
> drop the g_strdup_printf() use entirely.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> A small once-only leak, so this is 9.2 material. Spotted
> with clang leak-sanitizer.
> 
>   hw/arm/sbsa-ref.c | 15 ++++++---------
>   1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index ae37a923015..5cd8cd705be 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -164,23 +164,20 @@ static uint64_t sbsa_ref_cpu_mp_affinity(SBSAMachineState *sms, int idx)
>   
>   static void sbsa_fdt_add_gic_node(SBSAMachineState *sms)
>   {
> -    char *nodename;
> +    const char *intc_nodename = "/intc";
> +    const char *its_nodename = "/intc/its";

Should we use static qualifiers?
