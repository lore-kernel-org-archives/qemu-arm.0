Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp1624303njb;
        Thu, 9 Jan 2025 07:48:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXSlutRoSbqd6ViVHeDuSndGARPhbZdfxRSOTmma+jCQJs/91BHBY6CdCYo2DYqkVpqjkKix/xZG9DN4A==@linaro.org
X-Google-Smtp-Source: AGHT+IHxqgfzK6QNeWOnIhzUJAXVExQsj8Ev3cvkfsl8ZdoRpCIYK4o9Z9cvn/jhy4ojjddljL7J
X-Received: by 2002:a05:622a:1312:b0:461:18f2:49be with SMTP id d75a77b69052e-46c70ffe65fmr93776961cf.21.1736437704519;
        Thu, 09 Jan 2025 07:48:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736437704; cv=none;
        d=google.com; s=arc-20240605;
        b=CgOyYuGaBDFT/uoMs8VWxDNK1S7krvHI1hfwXYfnK4ulHxdtywOxDh+P77fCGeSJqS
         9w3IVg6dP88qvoV46hiQywjZR4p6GRSVewtgWPEOkGTOa0zjhpN2kRdhopmy5DHYsPJy
         G1KFXzzP1eIbKKUBThYghPhz3z/Ut9fsDfBmuXrRK/NOoVdb1GRxQRoiNOANtH2gIUsK
         FyiQsu+dZkKNY1JHnigrcm+qqt3pUmfmZp4G/NqISxzIcTT52ZwcukmL6pcvn2Jr2pSh
         NgM3eaR/vwkVYyI9YQuJJcwSVuiSP00KSpJKnESd6/r+PVdMzWGx9R+XUxMcrrthAVXW
         MZFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=7kjNvJJQkbN5Q5AJuP+1Gj7V9kBG+81sEXOSaFwVI+0=;
        fh=McjHrf00GAJoTrIski1d/oA1oa1Nrr7HyjEqa9dBCmU=;
        b=CqNz2j5JGBu3L+1NwfBroaXRHa19FdcpItv7Ox1z80wrmCN8EnLxRTIbHKUx4Xa0jS
         h1yBL7RZ4tQY32Wvn0AiOZ59bjBN4GbOzBe5e+BXs2jMaMrdSXl/R3q9hD+xTa6CvQIc
         h2v829JYxXtG0zX4f4WW7Uor8/lM5SmRjnLykDgZ0im4CauPwRF10sWbFXoQ5P/DATiR
         1OK0WR2vWp1KST6BioMIA/sTRzOJbrKk1Lypfob4E4zAmTbGLN6orH+G3GFR53sXaARV
         18ULbHy3mJTwtGnfVEB5qR19DUf7ySd4dnZIC/PfRO5EHfDyf2hq5lBNxbxQy/fm+t5v
         wsdg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XgX4YQYV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46a3e6aab7fsi542717341cf.190.2025.01.09.07.48.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jan 2025 07:48:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XgX4YQYV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tVulN-00053z-04; Thu, 09 Jan 2025 10:48:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tVulL-00053J-7x
 for qemu-arm@nongnu.org; Thu, 09 Jan 2025 10:47:59 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tVulJ-0001Xr-M7
 for qemu-arm@nongnu.org; Thu, 09 Jan 2025 10:47:58 -0500
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-21661be2c2dso16699835ad.1
 for <qemu-arm@nongnu.org>; Thu, 09 Jan 2025 07:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736437676; x=1737042476; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7kjNvJJQkbN5Q5AJuP+1Gj7V9kBG+81sEXOSaFwVI+0=;
 b=XgX4YQYV+xAR5n6gvZ/y+8MlWdc5HYZo4FwxLOWVlDNwJMaNz8XpwrK6ql4kbGEkSI
 Z5lVzmNFke7qxe6fFe1G/O21jv1eEehFZx1rSmOiZwkMDckilNc2ijF0mzVbIKP+NfKm
 j58AZ3+VbzcBiYbpnHTQtUQLRdUJf6Y6iAOADtKXKrMbiFvIhNCiNtxNw3Sdz7qVb5MA
 XOZwiPWv0QPqx+tDvuFj8PD2PtHWaDHclrq4zn5Ipnx+9op0zYX33i82hcjvYGgh1Lyu
 xC6hnMJe6emfgudGweXmi4PZ+BHKtpRXv8ssmy7epGdjmxwyxmfr5QmxjBvrdHE/lecB
 arCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736437676; x=1737042476;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7kjNvJJQkbN5Q5AJuP+1Gj7V9kBG+81sEXOSaFwVI+0=;
 b=UDN+2JcLkaHVsOYWFfZw7iyA822PufKp1LOY96HosgXUAZaprmUhbYRfbw6OQPSQaB
 mCLOYCH9nNpfg6fcd5DCixbk5tfdbZhCktd9nJsupXVCvPusFfDL+5P73pQeYTjer5h6
 vB9jD769ZuFG2J/iNNOItIWDcpt/KeG39qLeMgPCk07uhQzHleRYRJurnzRklXRZFlP6
 uym/MZbj+tOF9cLC72epAJRi9Lphm+CoSYK1aXL30BnmHuDrVlzSoHWkGOJw0FoeDoFO
 xCg62VDlNHI3rHV3xvMF8doUVKU3Y6lyVuBS0VZAnIs9pE6vsLNNTBK0GyWTwgI+b9W5
 FZpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWG3/TiLHpTM1AovIbLsh0RucdajJqJiybIMxzxIcyLv5NhTeZVtYjdowpN0Dnf0PELSoOF3HqxXg==@nongnu.org
X-Gm-Message-State: AOJu0Yy2xlNp53eQGbcKTJF38CNzguA1cFx3OJMHQEd5R3ZnK8PAclkr
 gQW2iUZJTlbBmblVllWsEkIWsQPLd08LTuH0XSR5r3kp9WZBX/kc/HGLENAGH38=
X-Gm-Gg: ASbGncuSP0i7ipZkGHx8kKzkf3RaK3L5gZn9CEHpTP+C2jNcGVws65wCpdQiggUB1TU
 1EZu400sHqNq/q9x8L/UIyihJig9VARaAArKTc2Z7uSTJ1aX++KwFBhtilDmS9VZDowYb6zaZsC
 W5kXs8CrL3UwbOAXFzaInE7cpPGi0iXDUIqQ4UHjFnSQefY2xuEnSxVk7oTsa8jqAKwHd6H4IzE
 cuZTGsr0yP/SyESmlg1gJhJ2IxE5TRU8KzeN5hWtpTmvLv9AeXQ697DfWxpTVgTJVrblMVhWVFx
 oEXiXpri6bGH9N8cRBClHkviQXc9tdM=
X-Received: by 2002:a05:6a00:884:b0:725:8c0f:6fa3 with SMTP id
 d2e1a72fcca58-72d21feaa9emr11034433b3a.22.1736437676190; 
 Thu, 09 Jan 2025 07:47:56 -0800 (PST)
Received: from [192.168.132.227] (76-14-228-138.or.wavecable.com.
 [76.14.228.138]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72aad8fd2fdsm37345449b3a.156.2025.01.09.07.47.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 07:47:55 -0800 (PST)
Message-ID: <04d9fec4-3ac0-498b-a958-51aa41370690@linaro.org>
Date: Thu, 9 Jan 2025 07:47:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] target/cpus: Remove pointless re-assignment of
 CPUState::exception_index
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Stafford Horne <shorne@gmail.com>, Zhao Liu <zhao1.liu@intel.com>,
 qemu-ppc@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, Song Gao <gaosong@loongson.cn>,
 Bernhard Beschow <shentey@gmail.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20241230153929.87137-1-philmd@linaro.org>
 <20241230153929.87137-3-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241230153929.87137-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GrpO0ocAd+gp

On 12/30/24 07:39, Philippe Mathieu-Daudé wrote:
> TheCPUState::exception_index field is always re-initialized
> by the parent CPU ResetHold() handler in cpu_common_reset_hold(),
> no need to have targets manually initializing it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/hppa/cpu.c      | 1 -
>   target/loongarch/cpu.c | 1 -
>   target/openrisc/cpu.c  | 1 -
>   3 files changed, 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
