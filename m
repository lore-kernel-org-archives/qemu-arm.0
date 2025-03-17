Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2335092njb;
        Mon, 17 Mar 2025 08:41:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVFJIrp6QtVszUV3doxMq/hqzU4CNACCeFGA/1jJ896/Y6r0q6j0XglcCzHczAcTi+7/u3cIlxYpdy33A==@linaro.org
X-Google-Smtp-Source: AGHT+IF1e+eH3g2C9gcZKuPw/0RH10kS7ehQniyR/OqgTuAgSOzIvESXdnHW/52z1xuNiP8dcgsF
X-Received: by 2002:a05:6102:3583:b0:4c1:9e13:8283 with SMTP id ada2fe7eead31-4c383239a11mr7642099137.25.1742226084685;
        Mon, 17 Mar 2025 08:41:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742226084; cv=none;
        d=google.com; s=arc-20240605;
        b=UX4jexAnjpuP68SMsMq1X9lbraBjKyGDflG8zmlcJy+CCNXbORvmc1+KYjpH9IP7RT
         2pPlVgD4D2L+r27a8zdhY8zt4CgTdJCQhgXbYVV56qdgWWzBZlpJ4s4FtAS8O/nf7nQe
         JCI57RTF6BkP23p618aEmLWYBYJKsoFB6uW6O+jvO8X9A8SoCFf/Bep9KVODkmD59nF9
         kXRBwoKrExAzjLq+Zu3pynKgqlj1+NK0IIDE8pr3SqswFLLO8By2tjA0EUnG/JVr2xML
         UM/Jg27g7hfGxPXwjep1DwyB5aDzM6kRU5mmKkdTu8xo8+AOoern+T9ggPxTbi6Fwfn9
         tMbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=7U6GKad7d5wHAblMe/tmj5AtpY2LZZcCgj/vdBJVDVA=;
        fh=XweadQ5XkbIAu16Zy3TjpFhSx8kzWn/f5PLIAoFsDoM=;
        b=F4fPsBHI2ZeyvSikw0iD3XZJXIz0QXg7km4vgferhlq6EUboCQ/DfsYWbX4XomZrx4
         KSyzSXzQK6QpePOxnQjP0ath8qY68ZcdtqLC2Aha9kY8IbvLA1KZlFjMI+cGtm5sFmVN
         IkRUCp285FFewJ0LZbCnSDU/ze9BEHywWzVXohfQN/r+yLyQrcRdoILjojg48jzaLfz4
         iIM8z6dc4GoG83/mtckgY6DSZyhT+mnj7LAXziRl8K5UnK2OmB7g/LeORem0SeG05Eh9
         8ufoRNo7OvAhQTt9VU1wRm4RwQZTwfz2C0Vm51GFPzAY4qebOQ6uKGUw+LAwNr4qTX8t
         fBhg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JB1+akPW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4c374a7fb0bsi2491980137.345.2025.03.17.08.41.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Mar 2025 08:41:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JB1+akPW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuCaL-00035n-OI; Mon, 17 Mar 2025 11:41:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tuCaJ-00033o-Ev
 for qemu-arm@nongnu.org; Mon, 17 Mar 2025 11:40:59 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tuCaH-0006NK-8u
 for qemu-arm@nongnu.org; Mon, 17 Mar 2025 11:40:59 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43d04ea9d9aso10112745e9.3
 for <qemu-arm@nongnu.org>; Mon, 17 Mar 2025 08:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742226055; x=1742830855; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7U6GKad7d5wHAblMe/tmj5AtpY2LZZcCgj/vdBJVDVA=;
 b=JB1+akPWyRYKKr4Sn95+b2I1OdeBZ9CI/XrLlhujiPHt7L/uFrLznxT40RXgn2abNL
 AppPGELNfeuH9D9pljHlFwTKFnqjAG+xu1BTkUQNIyHGRXv+jMhK1dg76xBRqXz9Ss7o
 +PkpzjRHx5Wjc8sx7/a+wJ3twPwJytaWb3nus+SxpjYu+qa+kOhdVvXt8DSQlV5acXmP
 IcRWzS9j38HHFa2t+SBHQSNhYV4gdNThlHZs5GM5RtdhBALg4XWnw9QcLhFMrDeV2Dn8
 1P5U6X8D4LXSw6GIl0xoIVZazJF3TJCivs2f8Q6kjhQDuXSRq7Ox0JuzoRRsiVAyLlK0
 B0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742226055; x=1742830855;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7U6GKad7d5wHAblMe/tmj5AtpY2LZZcCgj/vdBJVDVA=;
 b=suFrX7GsmksoUnv54zYwvGGg50sjl2rTS+aavnT+8jduWxPQur/SVoAcOBVsWUMdiN
 lhvHsTCWC7kh/jenNJtg50VtgBvm2VJbJGkhcM8uIs6TsQd6PrhY5RbQur6vV9GWTRXI
 fBp1Xbh5b/UmdpuLvvLcYdYSPPY4D3y0ptvhJpfrW7umFL3zZeIQ+9twwTygqXsTEO9w
 WKThPQBTIuttdWR/ZOR4peQphPn7LfNeRB+SyMNXB0YYo8UNLfHB2v0er41iESvuo1xG
 I8evw5GBn/a2yp+zEBOFii7Rk5RVcWS9dQ/MSFtzqNPeRn2rjK9r0VHlH8FfEK+vrO+f
 yb2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqAWL1A45/QiPTpXPp99Y2AaWaanaz7njs/MAq5mFs3OvDYF1Hitx5OfnkiH6EqiAIPiIKBLItYA==@nongnu.org
X-Gm-Message-State: AOJu0YzkoaQmVeJ2xrUxD7a68HLy1qptMUgycaN5AM29a1o1nUOW2kvL
 tYoZ6euMG8QS/9om2St51WF/vPH5BLDBC1C0a2P4vefyEnS5BvxTveeTe/8ez1gjRFav3Wg3RMN
 y
X-Gm-Gg: ASbGncu9lLzVi4yWBR1m+jouS3SkkiAL46QIuGl6HoTQTbLq6kdFd4EbV1WzVHsGnEO
 XYc0Gh3qrfF2/1nleeO5rBQtUlqJz2LMZsWx5BP3yq3diJPKTDJlfiAFdgVQm5F7+PJyeEi2a6r
 VsWAhOoZBnDu3txL0BZbICBeI1KntSe/jI/kHfnnbEWXsNeh8nRBuhvUL0xBWKrlNWqJsrd25tS
 /P1jIpT12lRB26/3ccc9N3IlIZZ67OLe7Z3XrcW7yIA1T03rjq4kfHTo2JyjkYQ77ay+RG6Sn3B
 3+fuJaKw3ghyso/2KdRjLhUmB6kg5vkXer5L/BNf4ddPUUVrL64s/BF58ypn8ufflTmYftiMI9e
 NHAuZQwXT0Q==
X-Received: by 2002:a05:600c:56c5:b0:43c:fffc:7886 with SMTP id
 5b1f17b1804b1-43d1ef4b074mr112131375e9.8.1742226055531; 
 Mon, 17 Mar 2025 08:40:55 -0700 (PDT)
Received: from [192.168.1.74] (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8e43244sm15653788f8f.60.2025.03.17.08.40.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 08:40:55 -0700 (PDT)
Message-ID: <1b3b4ca7-5522-4e43-b165-2f6aa53ee4a2@linaro.org>
Date: Mon, 17 Mar 2025 16:40:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-10.1 6/9] target/arm: Present AArch64 gdbstub based on
 ARM_FEATURE_AARCH64
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250317142819.900029-1-peter.maydell@linaro.org>
 <20250317142819.900029-7-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250317142819.900029-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: mdzw3Kv+drYR

On 17/3/25 15:28, Peter Maydell wrote:
> Currently we provide an AArch64 gdbstub for CPUs which are
> TYPE_AARCH64_CPU, and an AArch32 gdbstub for those which are only
> TYPE_ARM_CPU.  This mostly does the right thing, except in the
> corner case of KVM with -cpu host,aarch64=off.  That produces a CPU
> which is TYPE_AARCH64_CPU but which has ARM_FEATURE_AARCH64 removed
> and which to the guest is in AArch32 mode.
> 
> Now we have moved all the handling of AArch64-vs-AArch32 gdbstub
> behaviour into TYPE_ARM_CPU we can change the condition we use for
> whether to select the AArch64 gdbstub to look at ARM_FEATURE_AARCH64.
> This will mean that we now correctly provide an AArch32 gdbstub for
> aarch64=off CPUs.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/internals.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

