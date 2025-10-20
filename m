Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6EF8CCD1A2
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 23:41:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAzUo-0008IY-1D; Mon, 20 Oct 2025 19:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vAzUW-00087Y-9m
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 19:40:43 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vAzUU-0001nw-8I
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 19:40:39 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-781010ff051so3681082b3a.0
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 16:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761003637; x=1761608437; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9Rvy7rYwhVlUsIjly7OGcRyp4ieLY37bcl2e/d8Auqg=;
 b=iwOw/RZtrvvOBcuj6OZ95RRF5z3vuus0PTChRjZdImby60qCCZkH1f9eLOfaE+aL6T
 bJNpCwFreN0nbOPgErRdOyBMQWj7JtUusa95o32I9EZhE65NB93pcBJ7834YEmuUIsUJ
 C7+LoqY92hebFClmPd3WSq9shibYUJvrfNRtLkq6CE5GV9sa7ereHL/6UK4e4yaInzgf
 D7dRmaag7rhwy+aspspNtOUiAwS62RVmuckhCvsy3v7EgjGRu4rZSJrRIBbzftJ+ukFz
 c5nGqhlW+Yi3NCsmqDw9nvga/iG+vzt1eWphXQszTDzDuu3YDGRsVeQYskpoNj5dosU8
 8brQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761003637; x=1761608437;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9Rvy7rYwhVlUsIjly7OGcRyp4ieLY37bcl2e/d8Auqg=;
 b=eKAXavzvWhOQoHAtAYbj3t836mP7sHnLwlGDnqL40C7Vx7+RHsyXsOlufgWm2QbPUv
 l4vepd8ZwXoBiwgKIywimaUnY923wNkGPj7XkS0lgYqErqj8d4zlqdGPfx6kqJp+sX8b
 LV9OW3a9JM2+WRn/cfGzLEg6VnNGCj7oCYD5mgysanjMEKu+jhtJ/vQ5gNA1Ou0LTj/g
 pzEI9MAMIM0jkjGwPyP1vXfXsrD4CFUmrrDWUph1omNJR9VcH6CrYSnqWhoP+ksJQjak
 v2KXutz/ZYVTqRzHx5J80cK2etc30ES1bPxtX+4Ss5AM8v3Xs7CkaWfL3TMO9tazucjb
 l3MQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/B2KECEOHmkBNtCQDjm2nh4il17NtFg3Xt1s3F4782nt1p5PV8FnlHlgk1XYnJTYK6DDw4kBzjw==@nongnu.org
X-Gm-Message-State: AOJu0YyHrOVuifKEab5yR2cWbJmUgUK/37sBTkI2tvgFQfNfTTzRmE8c
 GunHUNxk/P2wPvlI8rOVMI3YpKCqwV6fI/0mndId+7pYrWlbc+8xoC6qshruYV3IabE=
X-Gm-Gg: ASbGnctVE2Z7yLbC/IckkbOCHPo2A42gy+q7aXVqjmjo+gDJfSaxKFbt84rW9bPPVL5
 wxD2B+VVaVcFECBdkW86AtHLR7losS2+FRU/3WcTeJYjijS+25elaOBZyEd/WXZdcbUctyC2/Y5
 yTRRecS7PrOGL16aEuOT734mVe5HiAibCP1raJFbIHCYLrX+eHVIQ8eBLomtZsF675mN23ya4I/
 GIsAluK27KATHzAoWhivcwmDmCGouFV5DiZel4lrbIoNmllOsBNvM5aSPPf8SWDDf6gCSYUNwU/
 tgWGYuaQP+Ejj33zAp8agnfuuwi5LTbJdacQ1+VKtmKibMQbdhdjdx7Sultowmh37fs3sCMygb3
 b/q5S3mlXmSgdkQEOYE9p6vO5qe6fXichDv82aR/KXr005VsWRjrqgHYhOlHq6+BIo/bMO9NGtA
 MhftBgvg8uGs7KSQ==
X-Google-Smtp-Source: AGHT+IE8JVW8DTYrqgAqA2IBpSNyo6s2yRrLFuxeVwfIAke5qyiFt1Y4GP64kt2+5bs3b9+wmvM+Pw==
X-Received: by 2002:a05:6a20:914b:b0:2b7:e136:1f30 with SMTP id
 adf61e73a8af0-334a864370emr20508406637.55.1761003636778; 
 Mon, 20 Oct 2025 16:40:36 -0700 (PDT)
Received: from [192.168.1.111] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b6a766745dasm8722540a12.14.2025.10.20.16.40.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 16:40:36 -0700 (PDT)
Message-ID: <b1fd7ccb-e41d-4db5-aab4-454530244022@linaro.org>
Date: Mon, 20 Oct 2025 16:40:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 27/30] hw/arm/virt-acpi-build: Build only once
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>, Luc Michel <luc.michel@amd.com>,
 Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20251020220941.65269-1-philmd@linaro.org>
 <20251020222010.68708-3-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251020222010.68708-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 2025-10-20 15:20, Philippe Mathieu-Daudé wrote:
> Previous commits removed the target-specificities,
> we can now move virt-acpi-build.c to arm_common_ss[].
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


