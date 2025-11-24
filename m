Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2979ECFD313
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Nov 2025 12:45:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vNVwa-0005oB-P9; Mon, 24 Nov 2025 07:45:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNVr9-0003Ty-3d
 for qemu-arm@nongnu.org; Mon, 24 Nov 2025 07:39:49 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNVr6-0007iV-J2
 for qemu-arm@nongnu.org; Mon, 24 Nov 2025 07:39:46 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-477a219dbcaso38805085e9.3
 for <qemu-arm@nongnu.org>; Mon, 24 Nov 2025 04:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763987980; x=1764592780; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OSWi1J2brTEyYQcpIKpdBA6vEgQpg2LxGkNeDLumwnY=;
 b=WCCWSzWsGTkY3o52zqY0XwBCjzl6J1Hgqgflko4Y/sj5mqoPHMpoTt+oDlv2fhnMPN
 jdLZtgjqGBJE9PFbdzIJSMFbqsREulwjYRJdVXV3gaDmxzLHW07UTaRRILaJtSiJ6TS5
 WsBPVuKEX5CW7Y4QM4bvAXAMa55DHJPzGu9sJ9OsbkKsRy0wKQw3HrA2qdoe5ptbq1E9
 syaBsxqAZ5+jnRIDfq0fGbTLAREVkpbKGtTmzGof5d/MFxxr4SjBl9STYlzRlqzngfTW
 mnlzT8va0P0l0z52TdSSfBOzft4GmbpFjVn2zBHT3zx35HZNTlsvfGWO9zrMhrt2FUsx
 jiVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763987980; x=1764592780;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OSWi1J2brTEyYQcpIKpdBA6vEgQpg2LxGkNeDLumwnY=;
 b=XzIUa5swNJDBdyEmg/SWe8v7lZgqzwOC29BkshTVkL+cnYFKOhwsgOwKK6IAneCYJ1
 /JPqf1nD2ZKmrkNtUM3mEoWpTkze8HeT6H0UQQCvokQRyNiXrLo27310QySz0Hvb1z/S
 86xQmHxAI6dr9CjC94B2AADj4qsLdh7jRcdGIv5v/er/7XVIqGbYaqdYG/i/r2OTgpFy
 LpzbrkqNa3+js9XC1rAegVvNU1IYQ9KUCrny50FqYJYcIIwuxVALamRKGQdkbiSJ2lzj
 t7FHJnmdsGuUI5WGVp+n16SEylLuHEJ3N1l4qsvHn4oDbfF1i4/yEV9qT2UByhhIXrzv
 aHqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgz4S9C1DhBcbiSujH96WRw3hd9t6dGip45XFvEcxVIC5wAA8PoFkXJ3me1DltDayMC9nX7dBPtg==@nongnu.org
X-Gm-Message-State: AOJu0Yy9uazE7QU3k2VY69iUPjpPckvq+c4m4glTQRoo9Kjz/M9lNglO
 ZG81z7KHtV0TFx0Fx4h3MrhkZmXPnS/rdsQGnmB8znIas1Qz3fF4H+xiIj8/r3qapVM=
X-Gm-Gg: ASbGncvLjF6BKZhq976Qvz7mn4CpAYEMyP0NocjfgMFQyMaUet7ntNNK//gEXfIsopu
 ju/D7b6Boem2W7c5cYAXDcGC/T8cGFvEd5skOd0euAXtbm+p1O2Iw3JVuXAcApgOaBT9Seux5za
 huFcN5JUOf/fI7+BynDyw8W/+Oy/qX+5U7P646dnMtuX5ueomIx3Ulr6FZPXVM+AbInbaX/qfoY
 d+5JPxNb9SNP23oxgMBYl4JVjA0asUYV89eMKuIQl5igeD86b8C9NQCOumCceLIjxHPmtreTt1Z
 1kCw5tfW2lnCl9Om8BMKONyrjN8rA4Uo45R4RWaDEAe0fZq1JRxtEdA8CczZicemY8BFxt8KbM2
 gUOc3/TXSio+sDIFshySVufwHh3yKGXIWuKxmKR/v2RiV1eOfdRFun6Y674CgXOV9+SH+b14fmW
 DByTLODGCsKQhZ8gfxPA7xUL5J6VXwJmIJcQff3JlrerfWa56enlo6kaT0A9c=
X-Google-Smtp-Source: AGHT+IF+ELbaFmzEaWWc9rVzBL4OB8JjW6zMG+mOAaowmAtaDShx9rKCs/UcI1FN0hAmk/5Pf7qIdw==
X-Received: by 2002:a05:600c:1906:b0:46e:3550:9390 with SMTP id
 5b1f17b1804b1-477c01d47c7mr96493655e9.20.1763987979649; 
 Mon, 24 Nov 2025 04:39:39 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf355933sm200693405e9.2.2025.11.24.04.39.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 04:39:39 -0800 (PST)
Message-ID: <6c7ae362-ed23-4e88-bc43-8be111c83441@linaro.org>
Date: Mon, 24 Nov 2025 13:39:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] Rename UBOOT_MAX_GUNZIP_BYTES to
 UBOOT_MAX_DECOMPRESSED_BYTES
Content-Language: en-US
To: Daan De Meyer <daan.j.demeyer@gmail.com>, qemu-devel@nongnu.org
Cc: Aleksandar Rikalo <arikalo@gmail.com>, Paul Burton
 <paulburton@kernel.org>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20251124123521.1058183-1-daan.j.demeyer@gmail.com>
 <20251124123521.1058183-3-daan.j.demeyer@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251124123521.1058183-3-daan.j.demeyer@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

On 24/11/25 13:35, Daan De Meyer wrote:
> For consistency with LOAD_IMAGE_MAX_DECOMPRESSED_BYTES.
> 
> Signed-off-by: Daan De Meyer <daan.j.demeyer@gmail.com>
> ---
>   hw/core/loader-fit.c | 2 +-
>   hw/core/loader.c     | 2 +-
>   include/hw/loader.h  | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


