Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp317192ejj;
        Thu, 23 Nov 2023 03:30:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZDcE8DKG6sPhp2nEobqjA4kalFJQMm2PnkUUMmn5EQlLadLqApDPASP7+nbp3tktA3AvZ
X-Received: by 2002:ac8:5a8e:0:b0:417:a74f:69b6 with SMTP id c14-20020ac85a8e000000b00417a74f69b6mr5037255qtc.65.1700739045753;
        Thu, 23 Nov 2023 03:30:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700739045; cv=none;
        d=google.com; s=arc-20160816;
        b=ghSil+3mA6UoisEA7B9wUi4mMXKSiJnBTk/lxihiniIwnCrbo540pQnoiPvX0RDO2B
         Ns8YXjoj4j7Rp8GcqDwEA1yioU5GsTxvktQh2PuEU3woRa5oyA0xw855v7D3Bhqml0jg
         kp2xAzpL+5RkwfT0ctu3qyKyHR2lsMW5N6AM5ZPUClUp4hhvOVw1zuPoTUYMchQ0qVxD
         h9h/KJQhYCuD7X8jbRnoZOVJTlnlln1tFcad4CUgsWcMMLjLq0SzBNtc0H4DVtYqhdxy
         chU9u82HeyoGuNPD4XtNTGL0o3jsjHcWS5EkX60WkItYYoaDochi3dY2ipra+Xnm/bbI
         shLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=5hfwJTgfPepSBxIYc4rDaXYlcdCHrwyUDRah3nHoABE=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=HV7lAvj54V3faoh962ugvgRA3L55bTPkuXJW+CuiHKOAKgiYg6JvcgmZlh8IKDngiv
         wzBCfhr+PBY8OhVae+nI6j2OwbeF9/NqJJecXcqnU2M/AhzdB965/FwbjbTXpMlkPzMj
         U6M6ilx48ehk9mu0XUtb/Ncjib1B5UCUTaNki6vUmpKf/877OlGCe/vj5E5CnE0byClh
         QaiO9IsQ1ryuAeFbR4Zj2sLvrDqNLC6KcU18UxHAZQc6Hh3pLA7F7AvZqjdKO33ZVQHh
         uYfP6ooWu6y9SFX6PFj6MLDLmgq/tc9LDKxxme2IdlNKuEaIakFogMRyP0vVPNWvFy9Y
         EaTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sgQRAYE3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n8-20020a05622a040800b0042371956d68si999407qtx.168.2023.11.23.03.30.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Nov 2023 03:30:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sgQRAYE3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r67ul-0006pa-Fs; Thu, 23 Nov 2023 06:30:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r67ug-0006ob-6n
 for qemu-arm@nongnu.org; Thu, 23 Nov 2023 06:30:31 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r67uc-0001ZE-OC
 for qemu-arm@nongnu.org; Thu, 23 Nov 2023 06:30:29 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3316c6e299eso505149f8f.1
 for <qemu-arm@nongnu.org>; Thu, 23 Nov 2023 03:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700739025; x=1701343825; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5hfwJTgfPepSBxIYc4rDaXYlcdCHrwyUDRah3nHoABE=;
 b=sgQRAYE3hkgngt/7Zm9h04arj8I5cgSUBw8omvAT5ccS9LNQzca+2LYRmGWiYfVW43
 7IM6AQgKXkZ1yxT7NzZxTPRlSaZ3GDBrCHgXaGPX/nDgd4OnmTvpyR2jWWczS92XOxdn
 P47Y30btv+rUfaD0DdxUviVY6EBOG2U08oBD6YGv4Q2c+SozKxm9QXfVyZEZy0nyBcED
 /Ioftxd4KfxgOAUmokXVfRotXYb/sR99P+P02S8Z5jTagtrUrUMgt4p0hFVgFMKOc9di
 vZMHsSeBwrU57ByHI0QE8phPEa88z9ocj+tqih1iRh0oNqiL+8+Twvda46kN+ZlMeR8t
 eXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700739025; x=1701343825;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5hfwJTgfPepSBxIYc4rDaXYlcdCHrwyUDRah3nHoABE=;
 b=JQHj00gdsAdEHoyAHR/Sx6wKRp3aW0OkbnZz4bAWIW2Zfo2HETwMk3n58vG4e8nFtZ
 SS14WzBG41AJrY0aFoXQYFdrh6I7g1+4zzLPDr5czTGmAHAVQ/ImWEd4s5iwfIsRBZRe
 zn0MzBaM9N8HEIcUXJ2t5zt4fK0eM8G/iCbeQ+e5F7F9mh9ha3Mv7PXVpBXqjtPGVmX+
 FvFx8EVgNVEWu6/BXk7qL107hwx9JOxqbYUn8UHcImhTaGXPFgkuLGbnmqv/IFBMKodk
 VI1IqTmuhhTwGz1cLcKDzJwqQ/ot6uXmwP9w2cNpYucprMcCOTPzsuWar8PQoQ+rGRqw
 BLzg==
X-Gm-Message-State: AOJu0YztDw3F7ilD0sUKEBeiH55PVB3B6anB/diO/dYUD0n9+mIuTWyh
 o/ugPaON3B91oGQ3erSQSK85ZA==
X-Received: by 2002:a5d:46d2:0:b0:332:e1c4:97c1 with SMTP id
 g18-20020a5d46d2000000b00332e1c497c1mr1065276wrs.39.1700739024925; 
 Thu, 23 Nov 2023 03:30:24 -0800 (PST)
Received: from [192.168.69.100] ([176.176.165.237])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a5d4d0b000000b00332cb23ccbdsm1381619wrt.81.2023.11.23.03.30.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 03:30:24 -0800 (PST)
Message-ID: <255a6d86-4be0-467a-b877-de5b02dd30b8@linaro.org>
Date: Thu, 23 Nov 2023 12:30:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/21] accel/kvm: Make kvm_has_guest_debug static
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20231123044219.896776-1-richard.henderson@linaro.org>
 <20231123044219.896776-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231123044219.896776-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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
X-TUID: Ie7bnuEWBCBk

On 23/11/23 05:41, Richard Henderson wrote:
> This variable is not used or declared outside kvm-all.c.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/kvm/kvm-all.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


