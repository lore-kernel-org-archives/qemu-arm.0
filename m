Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp701220njk;
        Wed, 17 Jul 2024 03:01:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXvDH3unYXpqqD8MkxAwlGCvi4EbR4N9vt1HCmiKfqNVGA/0FJYdKBgDudLKtbkp75jApls0LE8S2VgBRS4VOw1PB2ivlPS
X-Google-Smtp-Source: AGHT+IF57Gb72R195jet9Trtgn1HK6OejelWFcXvKJQPTDl35huDZUztZ0Fexl+WYDYK1ZIaPNDx
X-Received: by 2002:ac8:5a4d:0:b0:446:58eb:5ca8 with SMTP id d75a77b69052e-44f864a47cfmr13023881cf.27.1721210496842;
        Wed, 17 Jul 2024 03:01:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721210496; cv=none;
        d=google.com; s=arc-20160816;
        b=RjIgqm8i4Qe0jiylS/SVnGJm4QcrbkgVHDtrfsA/ujAhJfSNoqYvSic7cZLs4XsR9R
         OXzRxoyzmI7LS9PoDNR/Kwb3eh6MdZ/A2wz+ZNNNtX236BLLPaYHH0ANNV6E3KnXVnTi
         TB2L3eChuc9u7iPA8CWs42RdHFdV6WoWMWxZoNpexAPN2rC71hPHPVmpYMqPGrvCp3qE
         vkDIDfRLtLbAQuKmYvrWqC1VkbYVnmzLdnR0k91/m78jzMRquAB8zQ2Vd/dBePYitLsr
         iVq0IgMZvKi69MutoG5fii3SYJ1DxEf9FBattqZoSb41DLa+D5lSJP0Xueb9WpsIEYic
         hKWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=0D+xL7ZXgIiMqYUQST32m6wm2ferX/Fpi4YTaFNEpKM=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=DDM8gVR6PCQxCdjdsNPJm5Vtodg91Rzh+OD5IuwABlQeqBD/bKRzwFTihw59uG2QyN
         ZBdGxLEg4Ke+0Dg1KWHX8j8+LwKWXf1cgzXg1kPo9YGKl4uFdxwLQZ1TnXxI+1G/niHd
         KpgT0eGaFG4bTfI7Gdhbri71KGdZly6pUzYNjtZkcu50KbAjkQ1yIiFbwaARHYj+7ywF
         dmudNpC7pjB3imnQX+psEh4ilh1v5PQ4FHthJmGU9O/LzhV/KR0jzYIdPrxuGEGzP0a3
         uQ+nLeIBnSCmyHwi9nsjnsgt5VtsfVwCq469LsCZ9I1+Tv5+++tBFq50GGWytzQ4a7y8
         WSuQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uKKAsIWT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f5b77f7e4si95889941cf.151.2024.07.17.03.01.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jul 2024 03:01:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uKKAsIWT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sU1TS-0006MC-Eu; Wed, 17 Jul 2024 06:01:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sU1TR-0006L4-EU
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 06:01:25 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sU1TE-0000MO-P8
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 06:01:25 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4266ea6a488so53132475e9.1
 for <qemu-arm@nongnu.org>; Wed, 17 Jul 2024 03:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721210458; x=1721815258; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0D+xL7ZXgIiMqYUQST32m6wm2ferX/Fpi4YTaFNEpKM=;
 b=uKKAsIWT1Yqjp4TQRUvTYtTj7zplD7SX5jIpeDVi2d9hod2Q1YgiJPw92mKIhXax86
 7fWyjS47M/X6YeEhaBZsjbkEvxCbKZTXumE420xI3VpmLK7JGirmEzIc70baniwqQKFo
 szh+YjpwrJrBVrNZfbh7xX04xj1RgEr27B5URg8J45h4s2l5/eexkMPdsy6MUdKgovxo
 9SiTJvMhuNYli9xCdBcQ2wSLqvkSy8PQCEMfoA8JPF9qBxTp4E2yAjuVH6IiBhKQzNa6
 xUPLtb+ia1QwQM7QLkpvVkkt7GC9YubBqF7yeS0MtSu8rlZozBIUxS6FyAA8Z5P6nczp
 x5Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721210458; x=1721815258;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0D+xL7ZXgIiMqYUQST32m6wm2ferX/Fpi4YTaFNEpKM=;
 b=fUxkKreWqkMSbygWSbJpIjq2MY7G5oDwbUX6xDNG+3Mk7MyPwTNJR4M8R9GsN5TZ+8
 itXNKyR0LxedCMEVKUXPmpyfGJQMmgvKlZNzy7Xu1uIv9q8AhIgYwWaAdb9KcrrI8it6
 KvH3cSxoKsXMT8BtYVXahdDMi0fKFMeL9NF/JvDOUuTs5UitU/PyfUNLVZRjfg3/24LD
 t0a60CH6WZtPlkUSb9UWqw4tkma/WopjwAEm+qWhYnm2qFRSw4CxR4/Sj8bCUE6kECWE
 7X/v/IYRnJ/cdZgjSGGRsSa5RNXBanN4D/po2xWT0OBsH1udW6oQWhZyswu6uuFxlpKI
 oGjA==
X-Gm-Message-State: AOJu0YyN9Gbvo6aGZsWyNUELe11c/N5+5y/GO9n6vYzwm7lo/c3M4FMi
 rV0mmXBGxCNjYdaGOtoUw+usuvJVYCmDUjhCRa8nUX5ElQC3+5W9WgOlos1AgLcetDeG5binzv+
 oCOCfOQ==
X-Received: by 2002:a05:600c:1912:b0:426:6f87:65fc with SMTP id
 5b1f17b1804b1-427c2cc848emr10442635e9.17.1721210458732; 
 Wed, 17 Jul 2024 03:00:58 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.208.21])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427ba20aaf8sm48491555e9.0.2024.07.17.03.00.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jul 2024 03:00:58 -0700 (PDT)
Message-ID: <d86b4c48-dcb0-4651-92c4-8117f9f50543@linaro.org>
Date: Wed, 17 Jul 2024 12:00:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/17] target/arm: Fix whitespace near gen_srshr64_i64
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20240717060903.205098-1-richard.henderson@linaro.org>
 <20240717060903.205098-12-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240717060903.205098-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: XkXtL6W7kBmA

On 17/7/24 08:08, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/gengvec.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

