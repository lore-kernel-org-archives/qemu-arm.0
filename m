Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF18CAC5A5
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 10:38:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1jMB-0002yE-Gs; Thu, 25 Sep 2025 06:37:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1jM7-0002sL-LI
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 06:37:45 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1jLt-0005DV-7v
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 06:37:43 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-45ddc7d5731so6516285e9.1
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 03:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758796644; x=1759401444; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FU0QooF1+7RmKDNJ+waHYaNU0BUHYnHkl4jRqcidB0E=;
 b=vH4dLzFdmrvNuMgjfyZF2iGIU0tZeochXKUSl1PVk4ewn4tJ4aB4bgQkG/WRe3z2BY
 Zum9tKIsQWA3XOB4VMB/UiBc0MPCxTeAmLzYCKmHXYNL+WxzWEDxGSY2u7pFrMIjykXY
 oC2xq4d4vkjgkA9ycQ0KoKpI0tGt4zyjvG7bgm87lc5SZJj0p1+/OAoJf3KwJVVuTfUL
 DEEe3FFHlOB5V+KtfLEQNG2BcxNieIadbhX/RcHeo0bGeML4SUHmT1vS0NZdMzJ1K1cN
 AmySiZ1rvEOElaEESuwvRhTVqozeY1bpzxHHgy0r5t9R7SEwBpjryc/xxi5bnyOClsIx
 Iyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758796644; x=1759401444;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FU0QooF1+7RmKDNJ+waHYaNU0BUHYnHkl4jRqcidB0E=;
 b=xBFNQOtz79w7yk3zRMlFGItZ7d6uf4iuQUOGsWpDTQ0RAvOdr4UctTCarLrtalKTy4
 jHdRXVojkikNjPHS6IvMq8DGHcFQurCZXuuuPXG9M5eYUxfmpQ2v7SJqazAaGS8QNTo1
 eVcVAmJPbl8ebVwuHE5sN8xi+S4i7frRjiVdV/OjWQxWoIKa2WE0G8VQhrV1iYizPPbu
 tGjKY5nhnaXBBAORFYGKheLAmIU89yFDBnlZ+gwno+X158vAjldQkMoA6Y1BhIi3j93k
 ZbtOCr9CB1cf4Foz2AQJ8ge5UQn9Q2N0kJihl7F4YfRwffu7iDzcRbG/RCcwlOKwI4FH
 WUwA==
X-Gm-Message-State: AOJu0Yy9HEWpddyxcr7v8B+9liiW4JkN1jZ6/iyL9uvin42m5wCc0clO
 xUmvJ3z2HEj0iSocwSp22gEJl0AH28DSHj7sf2bJSHlB4TYvhIXwpr6FXfSx3eUOoK8=
X-Gm-Gg: ASbGncv6BG///JooctfeIMXlv8ecABJYVgcubK6ZG1NHMYHGe18uBtGUQp6hIunPWw/
 yiBwXIZWHU+Dk7/GBMuBrhCS+SyyyvgRAfWXhEVVyiNhLRO5aiCjCqRywDnoby+FBJcVx5R8JpF
 qawh+3Zr/TjQ9TYZFPpITSwjSUap+QtIo7jA/uYGw1ykudL4Ee7DPJxkSEHUdDYBxn+9V5vUG4W
 f/1gSljUrjkqgpvWsu36TtO/48MW34HE2PJB0XMscq+uvD58kj3gQqrFPPq5r271ReevRkpIt1A
 qHmIOjVn2arycYAKVvTXiBTHHAB9XAhcj8xnpmzUaDUi8ygku69WxemteqpiQr1CbmAPIwR2i86
 gUbfSybaXXxUTfQJnXizg1cDafk3TZU4P557+I0MkZKLKk5Hp4NcgjlS5FJSuA4Cvdm0MO9Jo/o
 W0
X-Google-Smtp-Source: AGHT+IHUHOMfE4mGcXVuNHoUjpGjFSONaFWXHQmaJ0AatJPUlcbVbi/5Yeq93ZFHX9Yof+bo3OJquQ==
X-Received: by 2002:a05:600c:1695:b0:45b:7e86:7378 with SMTP id
 5b1f17b1804b1-46e32a1987cmr17804665e9.34.1758796643984; 
 Thu, 25 Sep 2025 03:37:23 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb72fb1a3sm2485477f8f.10.2025.09.25.03.37.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 03:37:23 -0700 (PDT)
Message-ID: <24a761fb-d3c2-4f53-b371-e7ab162c0aaf@linaro.org>
Date: Thu, 25 Sep 2025 12:37:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/36] target/arm: Replace cpreg_field_is_64bit with
 cpreg_field_type
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20250916142238.664316-1-richard.henderson@linaro.org>
 <20250916142238.664316-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250916142238.664316-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

On 16/9/25 16:22, Richard Henderson wrote:
> Prepare for 128-bit fields by using a better query api.
> 
> Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpregs.h  | 10 ++++++----
>   target/arm/gdbstub.c |  7 +++++--
>   target/arm/helper.c  | 18 +++++++++++++-----
>   3 files changed, 24 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


