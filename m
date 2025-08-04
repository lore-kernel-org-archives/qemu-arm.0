Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B75C87FD1
	for <qemu-arm@archiver.kernel.org>; Mon,  4 Aug 2025 22:59:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uj49n-0008UK-4I; Mon, 04 Aug 2025 18:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uj49b-0008Qr-7z
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 18:59:40 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uj49Z-0000Zc-No
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 18:59:39 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3b79bd3b1f7so2689525f8f.1
 for <qemu-arm@nongnu.org>; Mon, 04 Aug 2025 15:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754348376; x=1754953176; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tyhefBWUd8MUDd7wb4t7wsH4XGm7zfJCS/W1py7B6U4=;
 b=C6IygZ2MuvUMJFRv4kM1WLcZtsxmFUZuCDzB1R0Q2ZdR60cKfsc5N7mKbcq5TALFRs
 01iZCnH5MQSL0dcSogJ4qfAKj/5iKFBZ5r0F3QsTpbLBSTNhNGWiEVe0l2mdAAVlmb73
 W+Uinn+lOFfSW5Kb6S+OI2tHdqsaP5SZVat3+3eVkWcULUE1OuB5H7WgCM1YrmbDEeug
 vnys6O88H+cKdY67DcLEH9qCeTtIHIiBSHJuhrbRVUuYd1yAUEyslEgv6o7FeXkZ+NQ6
 fGshytd85wYwMHsGbSVoH6+0u0ezRaSQYjD55WqQk4dzVZnGK9cd9FsYBbpms85Hi+kV
 Dr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754348376; x=1754953176;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tyhefBWUd8MUDd7wb4t7wsH4XGm7zfJCS/W1py7B6U4=;
 b=MbN9AfbD7gaiV8WG5polYAjJAkJmyN0Zhq5Xl0jsHv4smXupycWv2vbSgXrSqhSUAz
 2IOujMz4Q0KKQXzlS5CfrXQ4o/n2MWQCi+H0XZ0TiUqG6mZqs8l6ugwT2+hWZYcW4fDH
 6QHydT9F+NguBZevOt0VqlNMv9zIKOLDTOx96J0pTEodRh84VTqEkEPL3Xy3CEHUSh9j
 y7TZ08u8yGpVUqNWjG5U4FYo0/8hZY9W7WcQZVzYtWnxQUojmzDFt938Pm97PGfoecv7
 1if6mbGn2FX7WIwYrxVrZ6EUKAR5yEm2irv9/ndedUJgd371kcOAcsTkqFqnTXOXq+Sl
 GX8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlROQkmIKwIa6/SjuHnHgec/c4ZaodLTEGFQkKp589EbDELhSbXzdxIbYeC5x42UpdWc9ShKFw8Q==@nongnu.org
X-Gm-Message-State: AOJu0YzKaulynX33wmoNkWQHkhXVkBnwQ58s7sBwurfKxuAAzHMhaRHC
 ko03Eneyje9xHFm4VTx1x67OIAFYmjRnISrRZhYzjssyh5nIZKdTI3B+eB1J8kGibyU=
X-Gm-Gg: ASbGncthBdL5YtsMK52Ytv5XVg1kNnK5EwHjSxgYh4H7EprwwKHDns/Pu6E8SsN+VkS
 F5rJbHWI9vydG8tQLDqxUQT/a9WcketuS7089wZPdV+bmKd8hq8QnrkqGOb5BhEJpX5mavdQht5
 Wc+jWyLBvF+dzSTFHWTqVIGvSDA2rU0tzRVUtjmUYP4OrGJ4pZj3756o+k/sba+BnU5pfAi8tt6
 95UidvfMy92UIGDoTQAnrbpLWoe53gb9CGHgyBCcXsxCs6yeJiiB0bHfqY20jA6RfaSCOs8N3or
 ojzEEnduEpVM2QAMuxDDICOYS9cVKIycL0LEs9+ZR9fZ9FrqI75Zg7RX+gyTtQGuCyMy5vIDPzT
 02T4ACgHf+AOVFilWoxpdw7/YgtcmelbZbTWTDLQzy4fWKu5Ym3ikmdKl8v5FNPQGXw==
X-Google-Smtp-Source: AGHT+IEs0aER/wtZlHxm1ky5349so7aMNZGFWcDO+xUPJgNsnI2FxtS/F15tsoCf2CrhuW4pM375bw==
X-Received: by 2002:a05:6000:188c:b0:3b7:9bd2:7ae7 with SMTP id
 ffacd0b85a97d-3b8d94ca755mr8158091f8f.57.1754348375654; 
 Mon, 04 Aug 2025 15:59:35 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3ac115sm16947963f8f.12.2025.08.04.15.59.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 15:59:33 -0700 (PDT)
Message-ID: <395a77c2-53c3-436b-b46f-b301dc8e619b@linaro.org>
Date: Tue, 5 Aug 2025 00:59:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/17] hw/arm: virt: cleanly fail on attempt to use the
 platform vGIC together with ITS
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <anisinha@redhat.com>, 
 Phil Dennis-Jordan <phil@philjordan.eu>, Roman Bolshakov
 <rbolshakov@ddn.com>, Igor Mammedov <imammedo@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Mads Ynddal <mads@ynddal.dk>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Zhao Liu <zhao1.liu@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20250804142326.72947-1-mohamed@unpredictable.fr>
 <20250804142326.72947-13-mohamed@unpredictable.fr>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250804142326.72947-13-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

On 4/8/25 16:23, Mohamed Mediouni wrote:
> Windows Hypervisor Platform's vGIC doesn't support ITS.
> Deal with this by reporting to the user and not creating the ITS device.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   hw/arm/virt.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 98a1c74c42..0039f6a12b 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -741,6 +741,16 @@ static void create_its(VirtMachineState *vms)
>           return;
>       }
>   
> +    if (whpx_enabled() && vms->tcg_its) {
> +        /*
> +         * Signal to the user when ITS is neither supported by the host
> +         * nor emulated by the machine.
> +         */
> +        info_report("ITS not supported on WHPX.");
> +        info_report("To support MSIs, use its=off to enable GICv3 + GICv2m.");

So if the users deliberately asks for its=on, we ignore the request and
keep going. Shouldn't we just exit so the user adapts its command line?

> +        return;
> +    }
> +
>       dev = qdev_new(its_class_name());
>   
>       object_property_set_link(OBJECT(dev), "parent-gicv3", OBJECT(vms->gic),


