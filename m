Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4AFF8FA94
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Apr 2026 15:42:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFDE6-000583-23; Tue, 21 Apr 2026 11:41:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wFDE0-00052Z-NI
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 11:41:22 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wFDDy-00072d-Sa
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 11:41:20 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-43d74086e5bso4375183f8f.0
 for <qemu-arm@nongnu.org>; Tue, 21 Apr 2026 08:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776786077; x=1777390877; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D8YBWYv0DFXIr0XTu8G3DVI3AR8QfEErkRS6WVcLjcI=;
 b=BUcizE2k1yM03qfyrRoTSFyKMkjq1q/4Yz//rZR9JaEjMpTBTlIOuquZsWgpaHQG4F
 yIPnU2impCcwzuwG22x6ZCW228EFzwhOmPT7quRZh9O/x0zJssrqdNBQRNyOXx3sHb80
 YAcIsAQHgZDAD5+03KmB7Zjms8E+Mnl9w+KjJ2gb6UQU9u7Z6p06qjvFmUrhnwJP+Lqo
 fQZphGKKefq62O+BmJbJAHfJmNURGv6mChY+ChWTWYyw7Cp3QMaNOnbFPRf7vavZcxKd
 e0NaD4JvOFsIgyJK6a1XOrPZRb+iehXuooGmV/oejHy1nk05Hak+8tVA6WaHweEh5xY9
 t8wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776786077; x=1777390877;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D8YBWYv0DFXIr0XTu8G3DVI3AR8QfEErkRS6WVcLjcI=;
 b=OUh+XkZTd28EyvlDdt8ELBuZ0BcG6xtTyZvdDYBtGSHTA9KZc7ZhtHHmvYbv8tFlOW
 AIIItSLZIiarV6Ya2rqhqLmqmbe/Fn5D5ErulK6xVZRf83HRYqf6E54LT7cCc3Xm2IEl
 BDDbqLJTHE2m83lp1rW22uTnLwqLy3GEn1ySiWIFhYCYTdSMVh3ZSyqt89lN0mtFXQdM
 GyFEU3Yc3XrFGB277fuzK2GUbH7b+DDPr+HBZZUdKuZX0uDMswSheo+nCTHK+fXPMrHz
 G+ImxlQWgc2c1Lk4Pif8BvRrD4JzjnC79DxMBBSCqy8hopzyA1EMLRRdObgGL46/d9GK
 MMsA==
X-Gm-Message-State: AOJu0Yz61B2N8kmZ69ZWCNllYM7IHlgMQD1gjzmc3zTg7Jz0CtrllOwS
 nEyQkvanf62E5D0KLTTQzkkl1eJujlnxTBzZUuAtCUNVcTl4qeJATXi//XSYKX37vr4=
X-Gm-Gg: AeBDietjkLSh7+ry7nR7Ye9Mrj6A+nXGuXZW5zreZx7Zv9p/kK+AD5TsYtoekiRnQxp
 2VRBjG6f1yxaqf05fDYRzlKFuzBQVLFf4/+XK8Rz/bq6CHur9FZo/uY6rRHj7DpIeqXxVUsS2oL
 gJEEHuSJ85Xdv0ind9uGCzFHpdiu6lhogrvLxffTqihAgKXGHHSfXvik5KYaQL8yMA+T79+kvA1
 ktZHE6dxVK3Ad9m9tHv+HMf8Y83W7ThhWTRTKBb/xjFtFmxxCWKi6TYn4iYe2GXZPcA2XCZTn0q
 uA7NWswbGNOM1Eyh4MEWIFbhDYtLM1Bg4CZRFd3yufndc7QofjNhQ+LK1zA/8HhYsouK8T2Igvt
 N8m0LMxO77uBNmTmq3DxY5nktroaqs27KxHX4Ikgi+wbWQM/4djfhTR1iCd8pt038l0DuQBjf/q
 P9xJy7pR3HcYwE9xoVgxbHisyNGoO1eJpEP82wXA0OrBUyEL3/u2wSa3URFjWkGULxl2Sx
X-Received: by 2002:a05:6000:24c7:b0:43c:fe0e:5bb9 with SMTP id
 ffacd0b85a97d-43fe3dd4ca7mr29540450f8f.12.1776786077157; 
 Tue, 21 Apr 2026 08:41:17 -0700 (PDT)
Received: from [10.193.39.66] (140.170.88.92.rev.sfr.net. [92.88.170.140])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4cc2cacsm38236458f8f.13.2026.04.21.08.41.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 08:41:16 -0700 (PDT)
Message-ID: <78acd7b1-dddd-4f64-9442-5a144fc19a9e@linaro.org>
Date: Tue, 21 Apr 2026 17:41:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/37] target/arm: Move vectors_overlap to vec_internal.h
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20260421051346.41106-1-richard.henderson@linaro.org>
 <20260421051346.41106-23-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260421051346.41106-23-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

On 21/4/26 07:13, Richard Henderson wrote:
> We will shortly need this outside of sme_helper.c.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/vec_internal.h | 8 ++++++++
>   target/arm/tcg/sme_helper.c   | 6 ------
>   2 files changed, 8 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

