Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB05FF886F
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Apr 2026 05:55:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHbPW-0001zi-41; Tue, 28 Apr 2026 01:55:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHbOu-0001mf-W4
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 01:54:35 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHbOo-0002Te-Gs
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 01:54:23 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-44261378651so1786953f8f.0
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 22:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777355660; x=1777960460; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nKrDl6EwiypM/dOl0CHmtmF2zt8DEt9ZkYJcJ+XyIDo=;
 b=kqgTdGUc+m1XIFsFJ9v1BLTMhQOUwVxckUd8Iegfsf0HtJv3Rx1NEnIjpnWHiaI24p
 z3Z+GtOLNwEWBYB4loXI00NggUsvsdpoegb8JrESOrXV2aS6+Oa/7Z4La6akP4rGZSln
 bAeDz/T3XqOPCLzwKGMSJmzzM+fcYZM3hcuc2r7db/uVVu1zyWzNejTXbp0l9zGLFjvc
 1eaL5R4xqqg3Vj7PIwaDtsNmaYH/arI4wWd/r9zV/kXeqyro4HkNkHVfF7SiDYTBtS3A
 bEAwZkqauu3uzqbeKxn1PM6+pdN8Whpc3pQvwzOMd3Ed/EWCoZSVKmshcliJjS0Bp5ZL
 GR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777355660; x=1777960460;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nKrDl6EwiypM/dOl0CHmtmF2zt8DEt9ZkYJcJ+XyIDo=;
 b=jtivdRBr88tVBGEWU4OUaqb/KMoRp+ybswjEBCfuwiWtlgF4zb4+WQIOaiqeHXbsED
 /jb1o2nzt4vKRjjoBHp4On9anolgo3RCZy6GaK1JClqrWeLvEDqp62LZYwkgyUyoe5dt
 uigJ13g/EGkqqW8vno0+u8jDAnWlSHqw9ZAKr1mLZuuCXFdac+lp0Kf6SsifDcxnKf9C
 W8hEE6RLI0csHWWasNwRMiGuQORHAQJIF+eEJVOf0mj264wEoc0AD5vSx1d9XXD2aBhf
 dUTqWaW9/Kd0X2WZvyLNYZjpSFHdJml/u4K1GxNCtBYyQQc7Yq7QfxdClNmaJu40R90n
 UtBQ==
X-Gm-Message-State: AOJu0Yz15oGuDPZl3PWH1xd7ByfEKnI8AaR1gVY38PaJut4g78Lvyig/
 eF5SKLMrjaQ1BP3EhQA9qGq8Pa/hJhJwLA3fmmnebnsUWbcQDPEpNP2tGGjgiijiFZE=
X-Gm-Gg: AeBDies0tLcKYf6d2cBUiZgfJEkM5ZmDLY7wLtpTbN8fODcL22GTemxGCU44VpoioxR
 SUoZCwMWO7UyLIkCnlvktNGpmoRhAyfxTe9GEPsnYNXqdwUmIXI1fQ3OEoVOfSuK+uBU1qNy33n
 ZQ8oHwgTQP9jogJXd5OMnHAx4UPrMi9JkWigty388u9+yFtl9QGSSpJXOHwEDruTb4Lb9PLNOKG
 nEVdqq/jpemcwd+KHbQdpbJACZOLMEWquCGIYS3PREaZTmIV8Ahn48ktWrsudM63bAHDP3XHdJB
 oB7F+wD/JWu5qiXWqRq5bUP8XZ9+xm7VmIgwjySzDnXgQmCusGXfuDcs4o8s2hJBenBZHWKfbnT
 0M/eLahBnqBin3/r8TXWPjnImsa9Cr9pgy4RScnQ+cekp+QYfTblbaA4BIyTu7MN8L828y3IB+s
 vY8J1kbvhZKLQqtBVUtJOMCei/Y21ARFytPn1hMxsbdgzu95p1EvAlW25sfvj/xzKdGQobt4RsL
 Eih7fdzp8e5d/4=
X-Received: by 2002:a05:6000:1361:b0:43b:4461:7adc with SMTP id
 ffacd0b85a97d-44651c25b8fmr1911417f8f.20.1777355660334; 
 Mon, 27 Apr 2026 22:54:20 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4463d02f6a1sm3627306f8f.13.2026.04.27.22.54.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 22:54:19 -0700 (PDT)
Message-ID: <384d80a9-0121-4913-b8e4-79c3d386d74c@linaro.org>
Date: Tue, 28 Apr 2026 07:54:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/84] fpu: Drop parts_float_to_sint
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-20-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260426134002.865628-20-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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
> Use parts{64,128}_float_to_sint at each call site.
> Note that there was a duplicate macro redefinition.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c | 49 ++++++++++++++++++-------------------------------
>   1 file changed, 18 insertions(+), 31 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

