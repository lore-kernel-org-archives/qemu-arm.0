Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6A8FF8868
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 16:31:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHOrT-0001hr-LZ; Mon, 27 Apr 2026 12:31:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHOqf-0001PQ-FU
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 12:30:34 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHOqd-000603-0e
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 12:30:17 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-43fe608cb92so7116502f8f.2
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 09:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777307413; x=1777912213; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xt0ca2GI1SHOL/nBZOUB5slIOp0Mz7XRw1zMH9TIfFc=;
 b=SGPSdv5pcPTL6BIuewEO66LVoKuhcRQs86MB137ekG1WqS87BtZCbL8uqCzD8rmvOY
 qWhNFakrho444SB9SaqJZzD4dwLclDYC9TX24NuFYgBLnMmEpcy2GJLryrbBAls33FOR
 RqSHF3f/PDLP7vPQZbGuf1IHw7kmX/kOL3TlGUSslaQAbCi7x3rvtJ4QB8xUBssR2zBi
 9+RWj+u5Mhu/EFtyTDT3iP/B9evjUNVUZ8njRCNiNn30lHsT1XCqfkKAsV8bMYb8vAWO
 lFzvecdaq2Oc4wogRJOyYN3DG5sjRoXH1FxZzrZQ8JfKIloE6gGRT4Fsfyujsk2mmjJT
 fxPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777307413; x=1777912213;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xt0ca2GI1SHOL/nBZOUB5slIOp0Mz7XRw1zMH9TIfFc=;
 b=JvFDAeYKZiwZA4trDv6JzN54YnteXooZjmxov9LJw4IKCv/dm6+3j1TraETXJj8vDv
 cwxGxiMcYet47kU0b4Nn2DIVByYIRABJ41M4ijh4xTthyQVm3Rk8LXKriu1p8r7fUZJY
 EDUTEJpZ1F7H9YQJM99kiL6Jxsvh4j2kNQ1U3CQqXTtYC+ORepxprdrLdqvS1IGTGvIc
 3N6oF0ca/wWNEraYTlL5IrOiAtbwn0NH7knnhVK2dUCwLgQa/k2hl/Iz1aYaVXgTYNvy
 AjjlkJLfZ+zMXa6cLYOuhNjeMX5/Dvll5qLOILPdOJsz4WRt9vCWcsP0Vyg96+Ekle81
 zw9w==
X-Gm-Message-State: AOJu0Yww7oEm508SGACC0E4u+fv5hkL27HU/iaHw++RxTU+HeN026QVJ
 5XzPj+JJI94Be+pcpS1/Qm09Ml+i0ogu7S7Az4kkfoo0rYYWjEZSH1WVHuWOLw7ewY4=
X-Gm-Gg: AeBDieuhYd2kmiriGPHzunhyCSfHXLrApi4L8sxT4l822956WhFFbTQU3NliY/jmSzP
 x05MDRRSvi/bP/B+dAsxh/qDBpG83kwUKceaq44ppJ18I87QZRPokb/S2H7HOxfwqmnbL5ukKxT
 U2wH2V2p3xI3UhqVEghI7E6Kpxi4u2Dv/AFrQP9sXhQgwH8TVTdyw1fMAEikfOKu5c/sL0iGx0U
 31KX2Kd8QsX5sNJt+t/ohVB8VQe/UUb7vCQ9131d7HICIiiFiX++GzhawOCgNeFwMEp2rGY+zEq
 1sYfGGMkyEYla5puSRQilYw0090p0tb+gCM8gqmE1YqP8GxD2+z30JbKFYMeLpXgbkTub6XLFMu
 smttibTDYw1l4+vdSbnqT68NVo01q69tovGbc/Z40qgHxT9PL+VfPeWi4H5Vk997WlwqVXilxqD
 j4qIhQQ/kWswIOSZY5f+bgdCeXkbcph5M6jfsJd4Jac1oQ/FPu0gLd461nL0h2bh3TP7gN5jXP9
 Idv
X-Received: by 2002:a05:6000:24c8:b0:43d:70b3:7edf with SMTP id
 ffacd0b85a97d-43fe3dc5386mr68497966f8f.12.1777307413210; 
 Mon, 27 Apr 2026 09:30:13 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4412150a071sm45010172f8f.21.2026.04.27.09.30.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 09:30:12 -0700 (PDT)
Message-ID: <81402f05-a443-465d-85b4-2ab269462256@linaro.org>
Date: Mon, 27 Apr 2026 18:30:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/84] fpu: Drop parts_pick_nan_muladd
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260426134002.865628-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

On 26/4/26 15:38, Richard Henderson wrote:
> Use partsN() at the only call site.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c           | 12 ------------
>   fpu/softfloat-parts.c.inc |  2 +-
>   2 files changed, 1 insertion(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

