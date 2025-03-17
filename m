Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2333801njb;
        Mon, 17 Mar 2025 08:39:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU+Rifp9UwDGAgQscu3qCZwe55w+LZPfo3lzN/ymSPvG4B4ffS0fdrDNPpHt6Ovdymudbl0AEH1PNMD0A==@linaro.org
X-Google-Smtp-Source: AGHT+IE4AJ2rhNuDxLbkWm33UeUvss70iQZfRQKRppb7Ro8EOp5/8w7NU+s2NVSLdNlkb4QRJz0w
X-Received: by 2002:a05:6214:f21:b0:6e8:9444:7ac8 with SMTP id 6a1803df08f44-6eaeaa07a11mr209550436d6.17.1742225965481;
        Mon, 17 Mar 2025 08:39:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742225965; cv=none;
        d=google.com; s=arc-20240605;
        b=ll+AGmw0pvBt3tYxYxm7dkePi06FcrkONxePr8hUTp6QssSXZZ4xralQW55oTGwEms
         aTkKVuNxXwxcFXusEMFZQ2jAKxUINsYkgu0PjyPZ2sbkROc/XyZzwWZJZp6V3uklF9Kk
         iGAdZ1ycliQ0jZ41uSdbC+xOWF4PaqI0JT1Kdv7+ne9clKQARw0Bzd+orWV2DqQHkWo4
         cJs9eV/CjtXNNQ60GfwJS279j/GEwv/tiVakjsX3FmA+c4tUgdzFqDYZ9A2rynZk6lY3
         Xwr/gG/1wIYYPfzQkZJKi/delqbmbQTAUPo2w6SODKBwKAmSKfcFRcZThSMw4vX5dMau
         I4hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=IdjOii3YNltXHh3kuXFKj2sjqR664q2yCvNio08+erM=;
        fh=adzSO+wHv5KR4t3ylv+plzEJWkvd+PzU8PaMO6E5eEs=;
        b=QSO8jv8CQGQ4+fXUtk6p+47pzvleulWH6sBy9PiCqVPt/+k+3Um4ckKtAkibo9vaZ2
         bzdtiMX3G3pbtS8FxF4dyvFibOX6KogJrWbwfoXAbQo5AvHNRiRit/bmkr51pqRItjK1
         jMyFjsj+e2m9TMyjW6eyuRgS/jknpZaGEbtcPWJmu1SvSMDVibtwEBaZVssov/Rba77A
         JG04MTXigVY3d+htRs3CS/V3uv5/yBvMK+hg+XXefWZYY8QIYffDU+Tf2OUNxC2cHtCd
         qU7QHyXeAmt06w0ThA+s6GCZw4mVLcUO49EvJlwJvkDVmD4BV4Y6bKgLs2F7tZKLOlNJ
         jzqQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lXWe2g84;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eade1db252si98379206d6.95.2025.03.17.08.39.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Mar 2025 08:39:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lXWe2g84;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuCYe-00017O-RE; Mon, 17 Mar 2025 11:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tuCY0-0000w1-03
 for qemu-arm@nongnu.org; Mon, 17 Mar 2025 11:38:38 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tuCXy-0005tD-1C
 for qemu-arm@nongnu.org; Mon, 17 Mar 2025 11:38:35 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso17375765e9.2
 for <qemu-arm@nongnu.org>; Mon, 17 Mar 2025 08:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742225911; x=1742830711; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IdjOii3YNltXHh3kuXFKj2sjqR664q2yCvNio08+erM=;
 b=lXWe2g84Wd1s6J+XsTr8FO3UHk2CM3yU2bImnJ1xEfcTODhWy5TFweyLZWilWPyo7/
 CrH4uaKxsoLOXYb8PeFF4zlLyPqlKu/2LU4tdZm31dUtesJH/WgbNoKen7HrVvMJTV1d
 JyJAl0wd3ZihQ4EdSH7IO1SCfzTtOjxf4pqjnRol3UrnAxQnGzusEdbw3jlICcmZiYnz
 HHUfuHO8j2utVki12Azix/7aSlPv8V+W/5H5R2Os/v2eVmNfjN49+jmfTS/2oXjjA+i3
 j6zud6FnE7jFFCzPDWpxQatuwODfyf8uRLSVYDl5Jo6MNDFSCIHYhNhcS2ws1wrf46xQ
 kxKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742225911; x=1742830711;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IdjOii3YNltXHh3kuXFKj2sjqR664q2yCvNio08+erM=;
 b=iYE2w+QCIhvQ0G3CBxaNjOtw2aGpt6MPk6ES4DFMQuTGbR9Q+XdGw8+uvpU/GjOMM5
 OBQNBJcGMtPC7GsfjK4gQOaLHEgsUL5flbdIey9FK1NJgP/lWQbRZMLLaEwfYXzeor2U
 IayiSplRDZymSbbShUtJgBahxuMLp2fqILiMyuLhK0U1PGn3a4T0FVcliISn5AMExDtd
 lOqCpiSuovHhjtF1wdG5VBsc4PBxU5ism8XEhXmaag8YGzD7ltKIqoQY9IdjteUBy6xg
 gZ55FRrU6TrmskY2sbHaxsQTJM3NVePzr7PZGoX6XL3m9UQZIa0hR1TaSB/PQYYZElzp
 FXvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0oUqhvaHGDdc8cp3smhsw7i2/88jkZq+Muw3ccDEpa10AlxUJsIFFuHHsCSNuBx6UrjqQrN6SDg==@nongnu.org
X-Gm-Message-State: AOJu0YzXyu3HoaEZHao3jVdJrmJLYzoFtELVc1CIDMOKtvclyS1n2ESf
 aUlMdNzW6QfKnnGs7t+l1fM3hsAkKUgL1ExthEu/Bp4O5KETA8glh0E2slXfyMRyRSi/9fjWiP4
 /
X-Gm-Gg: ASbGncsXFci+NtmLpuVlNz/+toQBMLAxYd3fiO9CPaKSlS7MgXPemkFKOpKKTRJKDyE
 4+D/XbhfwQ99hs81YbnVvpzcGfUW7Z0QWKRZNRHSoOwD0aoUMvwuu5nfaGeF+zfCDPIyoZLeHic
 Nr0ldMx6/dNatqKBoZVp4kxuuTR8CjQcbE8jWOyFzPeT1SkRBU2pWrxGCLfZGJ/zlRl2B9N1a0d
 klV5tfWi2H6wzsyWdpLRibhmadQFUVoiQKPmHPbY/H88ILLwvA8+CYgpL1qZ8sk0T9kKSzRYVqE
 k7DL8gEZs/07z2iaoNSDJ2W/a0HkJfa+jaid8J7/KYyA/qzujNR8oTUxc7qYjEi9JbWandTgBSi
 NrLleM+O7vA==
X-Received: by 2002:a05:6000:1a87:b0:390:f0ff:2c1c with SMTP id
 ffacd0b85a97d-3971e96b183mr10810405f8f.18.1742225911191; 
 Mon, 17 Mar 2025 08:38:31 -0700 (PDT)
Received: from [192.168.1.74] (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb7eb92csm15695543f8f.91.2025.03.17.08.38.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 08:38:30 -0700 (PDT)
Message-ID: <1986222a-9913-434c-a87c-52561b167450@linaro.org>
Date: Mon, 17 Mar 2025 16:38:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-10.1 8/9] target/arm/kvm: don't check TYPE_AARCH64_CPU
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250317142819.900029-1-peter.maydell@linaro.org>
 <20250317142819.900029-9-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250317142819.900029-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sf8f+/c9jo61

On 17/3/25 15:28, Peter Maydell wrote:
> We want to merge TYPE_AARCH64_CPU with TYPE_ARM_CPU, so enforcing in
> kvm_arch_init_vcpu() that the CPU class is a subclass of
> TYPE_AARCH64_CPU will no longer be possible.
> 
> It's safe to just remove this test, because any purely-AArch32 CPU
> will fail the "kvm_target isn't set" check, because we no longer
> support the old AArch32-host KVM setup and so CPUs like the Cortex-A7
> no longer set cpu->kvm_target. Only the 'host', 'max', and the
> odd special cases 'cortex-a53' and 'cortex-a57' set kvm_target.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/kvm.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

