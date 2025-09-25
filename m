Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F00CAC5A7
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 11:43:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1kNw-0005Ym-Hb; Thu, 25 Sep 2025 07:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1kNm-0005Pa-J0
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 07:43:31 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1kNe-0001dT-Th
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 07:43:30 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-46e34052bb7so6401145e9.2
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 04:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758800592; x=1759405392; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QDAiVucDnTwiiHSxzVHmrYEGy/lbcg0azc/QRJqtC/I=;
 b=CKWEbo3saEYKuaOR8C8cVDfr+atBl+i9ZDlVdPw8GoSzG1vv5LAORTHIBbv+kUBF56
 9TT54hIr9sPCODp+FxXcZ0EWY9iuRI9yn6LW+NXqwyXf/wDjLCXKAlUDkFCXDkNX3tCl
 qq5wHBgtDByJOxkOQT+9cpPtlRGRENuMOzTl5EmzYgLETwaqp6M5ZMx/0P5lQ3asb2DO
 RXEL16ZcwYzMqwY/X9UDTQJelld5Nzj0UZdL4KXIikO3sxH5BT2sSNJSAFvh7c1Mc1wA
 KRDgXUltypiVjZgg2+djzUzKpc4lUaiS8sKdZY0b816rNgzLl6APXYtugm5kMjVrBgFg
 76Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758800592; x=1759405392;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QDAiVucDnTwiiHSxzVHmrYEGy/lbcg0azc/QRJqtC/I=;
 b=qrviQZReWpLnAGrdCELSVhxxqDOTRe4hNjkrDOoJNU1enEnIUAFuzxKGaUw1/+PtmG
 eDc7r6DBWhOPI+3DCse5sNjRS12LOeFJGv3mOqGBNPF0+SRoOURxeiMX9Bp72dyjcf2y
 2qNWRhEC8ai5qoi7KSO6lQB26E4RVBdyRMmyPsBIZyuoVE/5XzO4JLy/RsNjcDz1glf3
 6WRVU4m856EZOA48iXGnpeO8+lecDvDQY06NIM7I/QC7s0u8OE3T8i8FedLe/+42E4g+
 G5iyiGotpU8Qu+zS7nU3zHCzpTQLmqCccUQuu+oQ89IwKTyy1+B+ZqUF8T27bWwmd2AT
 4sWA==
X-Gm-Message-State: AOJu0Yw5ktMHpM5mv2msONMMETiBM9bVF8GQhAbvL9kgyU3toI/TMcrT
 pkTFZ6xY7X5nsuBsp1y48n6WObk+PWQ8l1S758Ol+A5hQBXbIAFUl3W2Ro5drxWO70A=
X-Gm-Gg: ASbGnculf5Pr1s/KLJy4badcSz7o2XM1qfVq3B4HZd9OvD4mfVmk+h0zf7K7mXJPKKi
 STVjFljtROvsiConUfgJRdVCv4KLbAQ3zKmy5o4DCNWCMgWs+7WK18b+tBqrSY3+XtoANTnd5BI
 9vW94Ysq1ADUVmd+WArEz1Lc0CnyRPJK5F6yQG2maQrnL308qzlGkiDwKIZlQSRCyXWjnwtagqj
 gPoqnquvmpVdD6FY+TBCzhh16t1/QjzCY+1ebEDwC4aMdwXizKmMM7J8jy2k/LBnGOFZGwQmIuQ
 CYBjlSl3ipqdF1vhqL/VymgCFmbX1w06u1xc/rZ4pEt40VhFbu1izRc9Rx/j5L+Pu2sRZROw3UZ
 xGKdgrK7nBM4efckIxc9HVYk9WIqHizY5VCYLqA6ii6WwqZSuiXIq54BkBhnFGKXUQFU7w0KEHw
 lW
X-Google-Smtp-Source: AGHT+IFaue5fvSvcPsIEl7AO3PTpHy742pLhtYXvvg1srHIoH8iPWLHMlqmnQJfOYgI1fbhgJwfHcg==
X-Received: by 2002:a05:600c:c163:b0:45d:cf5f:cff8 with SMTP id
 5b1f17b1804b1-46e329b9b49mr35907885e9.11.1758800591973; 
 Thu, 25 Sep 2025 04:43:11 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2ab6a514sm73285275e9.22.2025.09.25.04.43.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 04:43:11 -0700 (PDT)
Message-ID: <c204a427-8f08-4f5d-8eeb-ba23ce4d8ef1@linaro.org>
Date: Thu, 25 Sep 2025 13:43:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 29/36] target/arm: Move writeback of CP_ANY fields
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20250916142238.664316-1-richard.henderson@linaro.org>
 <20250916142238.664316-30-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250916142238.664316-30-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 16/9/25 16:22, Richard Henderson wrote:
> Move the writeback of cp, crm, opc1, opc2 to define_one_arm_cp_reg,
> which means we don't have to pass all those parameters down
> to subroutines.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/helper.c | 52 ++++++++++++++++++++++-----------------------
>   1 file changed, 26 insertions(+), 26 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

