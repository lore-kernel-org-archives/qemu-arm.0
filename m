Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp1108839ejj;
        Fri, 24 Nov 2023 04:04:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHOs6sUHz9ltjMeHYTxs21wfV0AebvI8ubOcX4OtKtlDLN9bCZZkOQN7vcqImzX2T5TAlyV
X-Received: by 2002:a05:620a:4591:b0:77d:6a13:55c2 with SMTP id bp17-20020a05620a459100b0077d6a1355c2mr9295687qkb.30.1700827461421;
        Fri, 24 Nov 2023 04:04:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700827461; cv=none;
        d=google.com; s=arc-20160816;
        b=ywePViE15Ep9smIKBdE+Ui/nw6ydFLH42xF4TcxcdksNKnbMtFPK9H+FefCSaQweFA
         KBNcTETMqTZyoBvDtBuQJybH2ZKJGzGpNfbsggjhY1rMhz5ex1q90QG+I5om6tvFZrLH
         oxYqgjECEeiISvvxxW6k87N0vhczi1nyMk2qlaxcPRRMyo9bGXJlTzKZxlwdtf9ARZym
         jU7nMnKPI7L5W2zoGCAgprGdjA3mUi1IXsvkscKzQJWr1BjIQpVb9sUt9gtnhvrTyMjL
         8nbU86jTVTkv78pGKzYdVxOja7sIfWq2SZmelPN+krlsx417H9ffb+/rjmwBW2mU1KAp
         W3ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=sFW62EhvoODGu3lSPlKzogEp/vyX8mP5DwDiM4p07qA=;
        fh=vmNK3yMVrORQMySZoJD6mtVJEKbrRsmEdAGMfBLPLmg=;
        b=LWm6t+wpXS7Tysl78iPFRmo8NnS9oUJ2cKwE8Qu7Ea6ihRh/Z5/5NTTF0HJzEes2cf
         RgmpK/bgLlGUZjBDG9opUNlYvAo95Xp6ruW2FCTH0aQlglfRTZ6E2e41p2L3F06gApiP
         wxwt1hADMqfDL92TSmMfiRRRs0dsG6R7kxCx3zn5g6IFNOy9L27nptHR5yAhGbScaQ33
         /e7hKFg7UMjg4U/shqO5LO7W/W6RUKNSeQ0ZlI7akZj9wVR45c7VjvT63gccmCBPiYcz
         2+XvmD1hTNM569ki7s8WThEufNgF1Hp29lGR5iIBFpxqoVdxUPKagzDbW6bXLhUoXwX1
         mDsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eP5dHrNQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x6-20020ab03806000000b0078f11fb588csi655980uav.145.2023.11.24.04.04.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Nov 2023 04:04:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eP5dHrNQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r6UuX-0006B9-BC; Fri, 24 Nov 2023 07:03:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r6UuV-0006Ao-V9
 for qemu-arm@nongnu.org; Fri, 24 Nov 2023 07:03:52 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r6UuU-0007pt-21
 for qemu-arm@nongnu.org; Fri, 24 Nov 2023 07:03:51 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40b36e31b57so12439075e9.3
 for <qemu-arm@nongnu.org>; Fri, 24 Nov 2023 04:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700827428; x=1701432228; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sFW62EhvoODGu3lSPlKzogEp/vyX8mP5DwDiM4p07qA=;
 b=eP5dHrNQkaumSnDQBOS1ZNd+dKJKHSgkLaKym43THp06L6k3QNDzs547+3yePqic0B
 myD7ou4KOgowc1Imd7RDDoTtgvyTVtHWUTIld+emjwdGWXhb6+IE4cAmDo1lMxU/xnKw
 kpk+QsWNymFx/GwAk9nEUj1VpHn16lVssRKwvkIH8cDVr/RQFu8rNKuZdYN7nT6qyskS
 8SqJWpc74B6kpGTo27oJOPRGZdl5cf79/2TpV4/9zAfaUbmu9b04oj3SFk0V/3FWlS5/
 jN5vFBjplNkyg+HK4rdQVbTeg4a8do5I8r9ve32d6Zae105JspFoknr4tcImv5MbInL5
 L2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700827428; x=1701432228;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sFW62EhvoODGu3lSPlKzogEp/vyX8mP5DwDiM4p07qA=;
 b=TVejZOq8H55p3dtVA686d3Zoa2+Njbwv3hSLDtr30Bw7KeDF1iXHmaZc+Hp0qytqiW
 O2yt3hXryKAu5iC0dEdVD7uHGE9Bu+bav2h/6DYgEK6cH9d1Mr47xAIZ3QoHjiF/mFoI
 FgkAa/pHk2HCYe0dW4AffIA6XBBGssUohvRtzg+9JXGzVi9SS2JZHtaXCuCWPdquKtQn
 ze+XDwVVmuetXKUaC+y1hSFdRVoiCIV1GZ9ibqrdU4x85B3lZTe7ZuDaFRPOHbJQ+NUs
 b1CYFq28veCr4xTjIM1lgMl9ExsFhkXgs1S9+YKXz3oLnkqIPdtMJ4amDHr/dckQZ1sD
 HeXQ==
X-Gm-Message-State: AOJu0YxLng9kENklcESn3yPVj/4jMSIoX/T2XPJxQG9D/zdyNs9k7Tkx
 o3j0UcDZTnfY7qy08A+VxCECdg==
X-Received: by 2002:a05:600c:3110:b0:404:7670:90b8 with SMTP id
 g16-20020a05600c311000b00404767090b8mr2199236wmo.27.1700827428198; 
 Fri, 24 Nov 2023 04:03:48 -0800 (PST)
Received: from [192.168.69.100] ([176.187.218.17])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a5d4d0b000000b00332cb23ccbdsm4093327wrt.81.2023.11.24.04.03.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Nov 2023 04:03:47 -0800 (PST)
Message-ID: <0201c36a-ff7d-42e8-a735-0fba547dcf2a@linaro.org>
Date: Fri, 24 Nov 2023 13:03:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/21] target/arm: kvm64: remove a redundant
 KVM_CAP_SET_GUEST_DEBUG probe
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Chao Du <duchao@eswincomputing.com>
References: <20231123044219.896776-1-richard.henderson@linaro.org>
 <20231123044219.896776-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231123044219.896776-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: v8iGvKbhHfDz

On 23/11/23 05:42, Richard Henderson wrote:
> From: Chao Du <duchao@eswincomputing.com>
> 
> The KVM_CAP_SET_GUEST_DEBUG is probed during kvm_init().
> gdbserver will fail to start if the CAP is not supported.
> So no need to make another probe here, like other targets.
> 
> Signed-off-by: Chao Du <duchao@eswincomputing.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20231025070726.22689-1-duchao@eswincomputing.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/kvm64.c | 28 +++++++---------------------
>   1 file changed, 7 insertions(+), 21 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

