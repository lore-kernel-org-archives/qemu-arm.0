Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE533CCD199
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 14:15:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAqdU-0004Vj-BY; Mon, 20 Oct 2025 10:13:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAqdK-0004Ri-7c
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 10:13:10 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAqdG-0007Q8-90
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 10:13:09 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-46e6ba26c50so28907975e9.2
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 07:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760969581; x=1761574381; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mq36k2OKJTdNR8NDxUHBOvEy7wAbkaQBwP+UJ97nQZM=;
 b=VvnxKyLX6IIMbalovH+6I8qh5NdU9TOWUDIZPMZMKJmtbVzRpByGtdCheOYQ9EuTP/
 kuT7ggygRcKGCkWgf1djjGpJoVxrugnAQ0yOLUblsNGyE8e/8ieg+2g0GGe7iazAcvRX
 FAkvWts5iR2xyclFe/N7mRyWmMr9lHyQH1/OfXCRtF6UZezO8YaUC2VYtmgw9NcQtXo4
 emUnN7EbpZKZ5eKDfyotPqYj2rvNqxmpTnyFubcAT27Q5ph3nnvOaMYxm/4YxRMC2jEb
 QXhEHf4Ci+0ANFtBRUNGli/RDGjkIf/prZG3LGwL7PUDwNlOzJlkyJoEztrDzvtVARm5
 HAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760969581; x=1761574381;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mq36k2OKJTdNR8NDxUHBOvEy7wAbkaQBwP+UJ97nQZM=;
 b=LM2oSSP4GN44O//ugWdGpdvTfStqJwCc4s+u15b5Mc0SjIjzLg5RuuHQYV6vu/iWNQ
 Q4SjNy5SO8OGogJUNtkdwcebbYOUGAD3cXz+cklMHgL8uKLRQpo+RoV7F3rt478/6Hsb
 9XBF3iY+pcJ5rSyPIvmcqCQgxT2RfqYEoR0NIPpFzOkIRjefAyLkmQvmVccZwPdcOCKl
 fbarqL9c9CDQPzjtWpUEhhbcCsButXRYpzWdawIT9Lm7F0mHofzX2/3HhA4R2OY22vmT
 pOuDJw5960WU6Y67TQHPeAUIWrDkXLkC7opcQUPixoBpJqcNyue58AzlFu3HNMz4cnQL
 UMNg==
X-Gm-Message-State: AOJu0YzIAlxW4zJ6FxSI9MuJdwmdQKN+R8yWobQfLkkzpPEaEJFiL0O6
 3m6ybJyfLzkEDwHWCH18dXk0z5Fr7WCoq7gklCAro/0Wxg9CxU2Zjd/nzaQ17PSMI+w=
X-Gm-Gg: ASbGncviL+dXlKWH84t+/tQakDFOivatEHzV5CvUlUyYXIpdPWF621o3C1JrYzx03Sf
 AMB0pfE9d41OjAAX36EueHjk/wjGI4piE2mpvppGJ2ufS+qnrJTb1aAoeM0+/fO25aTGqbP49RG
 49mwtlTbA5u3mZH5HnCwDbjJB3aGnq0DEh4nIbGRgiyIkx53XP+h78nv7HbDCrfLfv0IZ8TOWAR
 EEh9u2ZQ/MRhf0UI7RgPBe9cSgHbW7fXYbvk9rB8RJAKvjZpYQ3yKWS3WzOC8s9c6h7lBcMLEUj
 8bMcXCzsOjjaaj1tLuLSo7N2q9TwUSaHDV+4kX8we5QnABo6OsL1DPmWEvU1j6VG895HKtfIEa7
 +jrKo+JDARBGnQy+7iQMosS6HUiPKUW7/2TwjPBu/0UJmgF+14q+ej9sSkiQEJmSrHQFQjSmbag
 UB+apm+xHrW/7+CBOikUFAPgDTiqttQbSQ65x3wlzsVQYbyjm4qv6K4w==
X-Google-Smtp-Source: AGHT+IHYhRYxzAnGRc0moYXIolHOyCLQpVgm4w/eYoNtGlS/Cwa9WhswN6WQQiHwCtVUwqjikjkbnQ==
X-Received: by 2002:a05:600c:3b8d:b0:471:60c:1501 with SMTP id
 5b1f17b1804b1-47117918c0cmr112412095e9.28.1760969581217; 
 Mon, 20 Oct 2025 07:13:01 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4715257d8b2sm174622865e9.3.2025.10.20.07.13.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 07:13:00 -0700 (PDT)
Message-ID: <02925c62-1a8b-4511-9fa1-ae092feb08b8@linaro.org>
Date: Mon, 20 Oct 2025 16:12:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/37] target/arm: Split out flush_if_asid_change
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20251014200718.422022-1-richard.henderson@linaro.org>
 <20251014200718.422022-24-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251014200718.422022-24-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

On 14/10/25 22:07, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/helper.c | 33 +++++++++++++++++++--------------
>   1 file changed, 19 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


