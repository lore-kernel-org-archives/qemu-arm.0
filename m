Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF97C83F17
	for <qemu-arm@archiver.kernel.org>; Thu, 10 Jul 2025 14:02:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZrrJ-0003Bc-57; Thu, 10 Jul 2025 10:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZrku-0005Ug-5A
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 09:56:10 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZrko-0001OU-Ic
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 09:56:07 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a54690d369so1032730f8f.3
 for <qemu-arm@nongnu.org>; Thu, 10 Jul 2025 06:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752155760; x=1752760560; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9ClVCl3vZb7LR0LoO1FkTT9NDw1qhfn1wNaD88rCQgc=;
 b=f2gYf58m+ZQF7mRMlAHteOK5wFbkDym9JColv3HFwvDpVC8gjBmCC39GiCpWA9TpQq
 OSK4vzOY/k+06zkzOpZ/2HU4z0LEzwd1uwEkmm93TVvZ7jlPSI2TSrIsDz2yXJhlAbQi
 ahHV8xJ7QBh6lD2lMLx7oW/tYByLkorn2eNPb2s6iW0j8Kjt9GsPbFngMINUBwexPBvT
 ZP39FXfI5/OwFxb1+qpMJNV04xrijwxmRQLOB2Cte9nNG0f6bdVVEjp6YR1ZwEsp6GRr
 4lJU5HDGWH8Xu93rgxXQ+/cIrN/h+cW+ufmvQ9nTDui+tZ9QPpOBeG28XpcI8yVGzgqR
 plUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752155760; x=1752760560;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9ClVCl3vZb7LR0LoO1FkTT9NDw1qhfn1wNaD88rCQgc=;
 b=CgqjHUJNT1Betjg8/e5tR5P/UuKRusZ/CS+rCA9bFbOVZyag70QiRw0FmBEX+H536A
 O58NzwAceDYzYeE+zFeARXxII5tO5IGvlMokIOpIxEB0ufCXyxEYUBlpmg4hDpT8x9R2
 WYSHqUZEI52vLNTNBYV/JjW4yKS1lMulMl9QtMdZ+2UP2n3GIHuQ4Ypg5/J50OTmRtgZ
 Jti8tNXpeYh/UvYKsFONS73VjIAuLahyQnur53rhNu9Cpm/hDDwfct7XcgvvovTIuwmT
 6DNbSACgHqpcZLhShw/Nscy2kaLDqVVazbWz/N6MqcJXZaTPF/PE5RuxrmJEEw4LJw6M
 IQWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDdxxXjHthEl+O67fRbnQrxdRToQ7vZechTYnCHEwBJfZOBCaoKR/fwVLURRl3s1yTvCdBqiRI0A==@nongnu.org
X-Gm-Message-State: AOJu0YzPZ+LGCF+vpquqTbxvXmCTth0J7BixXqqDFc41RwkR9ODluiyJ
 Vw+zWxrRPN0zpu78hM7fOND+AipGnB4ZGYaa/klFZKC+evXzIMExCHDK/vVyiFpa3WI=
X-Gm-Gg: ASbGncubclIdgvrTQdSbhRm1iLR4KxajkAe7tBmhIQPl0Qrqln0P1Px1s9SXp86gfea
 wi6QtBnJsTG/qrSIWG01R74g4QS3xmwqG1MwBzrGBWIuczuAxTqTRUvKv13wlra+pxH6or9FqW6
 5Hz7gVhcDfY9kwyM1/dNomUir0zeRS+EV40ilwDKWpswA3gIvkB8nDTUoR8p8aj+nYhD6jvSMYM
 RyrzOFhuX7Nk9cL+NjWWLNiK8/XjwBQudRGbDS9f2mLIb7TAb/jgDD1T+W5f5vjvsUvh4AejSNW
 fn1MOauCPJoCGzfz2Vp6JTXHaKswmws9Ht0esu6pQ3NFu9MNK3FMjdxC0Z70dCcR49dfuqI1e9P
 3m9QrNjgqQTvQbyCCVw8QJYan3gEK1l0SW4uldyZDvZpDRcHc
X-Google-Smtp-Source: AGHT+IGSf/cHljGcoezSnhL7SttKHgunq0LO7bZQXfIGxcOUoYzI9ODz3AX7/NGBCLmAhcS7CC/9XA==
X-Received: by 2002:a05:6000:490f:b0:3a3:4baa:3f3d with SMTP id
 ffacd0b85a97d-3b5e866974dmr2506257f8f.6.1752155760068; 
 Thu, 10 Jul 2025 06:56:00 -0700 (PDT)
Received: from [192.168.1.117] (lfbn-mon-1-970-120.w86-227.abo.wanadoo.fr.
 [86.227.5.120]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454d50fb874sm60434555e9.28.2025.07.10.06.55.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jul 2025 06:55:59 -0700 (PDT)
Message-ID: <25f66336-ce6b-4eb7-8e98-a9838c8785e5@linaro.org>
Date: Thu, 10 Jul 2025 15:55:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] linux-headers: Remove the 32-bit arm headers
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20250710120035.169376-1-thuth@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250710120035.169376-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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

On 10/7/25 14:00, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> KVM support for 32-bit arm has been dropped a while ago, so we don't
> need these headers in QEMU anymore.
> 
> Fixes: 82bf7ae84ce ("target/arm: Remove KVM support for 32-bit Arm hosts")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   configure                             |   1 -
>   linux-headers/asm-arm/bitsperlong.h   |   1 -
>   linux-headers/asm-arm/kvm.h           | 312 --------------------
>   linux-headers/asm-arm/mman.h          |   4 -
>   linux-headers/asm-arm/unistd-common.h | 397 --------------------------
>   linux-headers/asm-arm/unistd-eabi.h   |   5 -
>   linux-headers/asm-arm/unistd-oabi.h   |  17 --
>   linux-headers/asm-arm/unistd.h        |  41 ---
>   scripts/update-linux-headers.sh       |   5 -
>   9 files changed, 783 deletions(-)
>   delete mode 100644 linux-headers/asm-arm/bitsperlong.h
>   delete mode 100644 linux-headers/asm-arm/kvm.h
>   delete mode 100644 linux-headers/asm-arm/mman.h
>   delete mode 100644 linux-headers/asm-arm/unistd-common.h
>   delete mode 100644 linux-headers/asm-arm/unistd-eabi.h
>   delete mode 100644 linux-headers/asm-arm/unistd-oabi.h
>   delete mode 100644 linux-headers/asm-arm/unistd.h

Nice.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


