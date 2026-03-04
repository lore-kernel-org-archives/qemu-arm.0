Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51010EDEBFF
	for <qemu-arm@archiver.kernel.org>; Wed,  4 Mar 2026 02:38:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxc7Q-0005HE-GH; Tue, 03 Mar 2026 21:37:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vxc7P-0005Gy-P1
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 21:37:47 -0500
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vxc7O-0001qn-9i
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 21:37:47 -0500
Received: by mail-vk1-xa2a.google.com with SMTP id
 71dfb90a1353d-56ae58f3fc6so277164e0c.3
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 18:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772591865; x=1773196665; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=29D8BMZi3QBfTzcSh/I9XiMhkXjKjJSVN5akKxcnK2M=;
 b=huIeVh6QdqbZmFlx+lkHhklDcdKjIDdvBRxaIleFibz5QkxVIU75FOW6ytIxPfc7wy
 bdlR704o96Xz59RmgK3/AJ0sObdyDVYt1LDKUdsOoURRX2n5y9Tdu+u5HDm26tr8aa3o
 yQCfI498bt4ZzeDDr7v3adSshh8biW6F1UxEupa+9J7jFzmGXzDhBtjKziBQxyMI1gcH
 N7FvhMs+5vN1B/UbhFHy0pE9KCwMHXqK32THipGJePS6wm2AY6ZqN0l6J9barc7C2KJ5
 Pk2d9CnjMmeXzNfz2Y0XZ/92w8BFO+62tOoqvgJ3IE7mGOL6XyBCdS42BJDSdfS1P0g7
 aXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772591865; x=1773196665;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=29D8BMZi3QBfTzcSh/I9XiMhkXjKjJSVN5akKxcnK2M=;
 b=Zgf/rgmIJRmXvkGGzRj2T5vawXjO+bxEFgCuunHbs4b07UHQEJHFAO9cuIC0aBeZHD
 bW8JVFGKL0dAfy2ayKSwxzjjHKAWqAZZTq/w4yMngsUWzgFqNfIJFfUJksQLM2Yp4Z6E
 zCvNGj/rYhdq/aQBSW8gOQ8Jw5pBlBceizmc2SfS6H0hZSZB7OOg1wOh0XwkGAx0A3so
 pmkipZDq1mDXi1z9aUXv3kobnTftU0GbKn4OAeYMzQ1nJhFeQmyyR2YqRSXIF7zpKp6n
 1SQ7uPNJhgzHeJbHb8Scfv3PUm1X5fu3EIOlZTQkkDDkxbKr5RMhE3Jkaqae7Vzw2WEi
 gbug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvBl6J2gfaEQo48TqL89Hk4gWrnHggJSSQgehU8t7oOA+e8l6FSVmyGnM6fvAZ9AmOhjaVxi7SfA==@nongnu.org
X-Gm-Message-State: AOJu0YyxYp1/t+dbVygzW/yeMbmpr+7NiFda7CkIFe/qSNUg4UNH3q20
 YSSHw2+GFKI/cG2IHYHjhpkPTbPJN3CqXBwQxQTUfvSoNN0uLq0drovtOgdCqu1GKE8=
X-Gm-Gg: ATEYQzxISgVcvedl9lpfcV4mq8jEAM3Ag4IZBvLo+SuQ6cBCmQ/Ea/jEj4jeuvnf7yD
 lXCjfOWXzQdVvD8wFQzBi3xyMepDrt7Km3Xy3kMJUDBdgtuHcM0n8GwhuKiQJ2Gl/mYmkuiimQx
 8hIcLvWRKboKA8gNDcJilA1ijAD5asF38VByd2Lb/9a0M/ASxndZTSwWVi7jcXEX7sDghQkikvU
 kB6Wz+1KzNLyaho3//hDbzWxJSQU0Cc7+WTUlJddncpuypmgPTbtTOHRjJQsr6ea0JFIvg5HkpO
 Jl7Ed7UVu6/rKEfFVY2+LGUSVj1ZAGmh/tKI9lVPKWw3a5l4L6WK5KV6wvHHzmB5YWOWa3JiFF5
 uSwDSd681hNyBAXbU2Lr9lbgPZiWVt3DSwpXlOvNguJ6Bng/jHGavXqbSZ9OcsBuqIKZ09ggsdO
 QklQsxsOT0otdUZtz1o6QvfPNYkUhcQmGw
X-Received: by 2002:a05:6102:160c:b0:5fd:fff8:5c36 with SMTP id
 ada2fe7eead31-5ffab23e51dmr272647137.39.1772591864920; 
 Tue, 03 Mar 2026 18:37:44 -0800 (PST)
Received: from [192.168.0.103] ([191.8.216.93])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5ff1e7aeb8dsm19002412137.2.2026.03.03.18.37.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2026 18:37:44 -0800 (PST)
Message-ID: <e68f1a6b-1f20-4040-a1fe-2631c57b5334@linaro.org>
Date: Tue, 3 Mar 2026 23:37:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 1/8] target/arm/tcg: increase cache level for cpu=max
To: Alireza Sanaee <alireza.sanaee@huawei.com>, mst@redhat.com,
 qemu-devel@nongnu.org
Cc: anisinha@redhat.com, armbru@redhat.com, berrange@redhat.com,
 dapeng1.mi@linux.intel.com, eric.auger@redhat.com, farman@linux.ibm.com,
 imammedo@redhat.com, jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 linuxarm@huawei.com, maobibo@loongson.cn, mtosatti@redhat.com,
 peter.maydell@linaro.org, philmd@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, shannon.zhaosl@gmail.com, zhao1.liu@intel.com
References: <20260220141128.789-1-alireza.sanaee@huawei.com>
 <20260220141128.789-2-alireza.sanaee@huawei.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20260220141128.789-2-alireza.sanaee@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=gustavo.romero@linaro.org; helo=mail-vk1-xa2a.google.com
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

Hi,

On 2/20/26 11:11, Alireza Sanaee wrote:
> This patch addresses cache description in the `aarch64_max_tcg_initfn`
> function for cpu=max. It introduces three levels of caches and modifies
> the cache description registers accordingly.
> 
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> ---
>   target/arm/tcg/cpu64.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
> index fa80e48d2b..6a79ca9d43 100644
> --- a/target/arm/tcg/cpu64.c
> +++ b/target/arm/tcg/cpu64.c
> @@ -1167,6 +1167,16 @@ void aarch64_max_tcg_initfn(Object *obj)
>       uint64_t t;
>       uint32_t u;
>   
> +    SET_IDREG(isar, CLIDR, 0x8200123);
> +    /* 64KB L1 dcache */
> +    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 7);
> +    /* 64KB L1 icache */
> +    cpu->ccsidr[1] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 2);
> +    /* 1MB L2 unified cache */
> +    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 8, 64, 1 * MiB, 7);
> +    /* 2MB L3 unified cache */
> +    cpu->ccsidr[4] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 8, 64, 2 * MiB, 7);
> +
>       /*
>        * Unset ARM_FEATURE_BACKCOMPAT_CNTFRQ, which we would otherwise default
>        * to because we started with aarch64_a57_initfn(). A 'max' CPU might

Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>


Cheers,
Gustavo

