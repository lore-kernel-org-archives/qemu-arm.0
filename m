Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1417825njb;
        Thu, 6 Feb 2025 01:27:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXfqxEx/cNkGE6tHZjGLa0hCAczgRcNJuf4E4yT9i7sHqsPxMNa95iZ+PfhA4ebuBBk0GH02gAPxdQ/fg==@linaro.org
X-Google-Smtp-Source: AGHT+IG5/4Qc91s+iHbd0LCenOlpMLciwRuolv0XSoiuPMNz/5VQaedmKInjpBGIUAQR3yJ6kpQd
X-Received: by 2002:a05:620a:3f42:b0:7a9:9f44:3f8 with SMTP id af79cd13be357-7c04023c8b0mr319599985a.5.1738834049143;
        Thu, 06 Feb 2025 01:27:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738834049; cv=none;
        d=google.com; s=arc-20240605;
        b=AN8jBpQ+wGlhNbvt6YQdJMhrngKsuB7r6xi2XyXNq64gVFyL7ksuf1zm4MHO5LTLKJ
         v2l5VZKKtxwHAO0LwA7cFVJBVCmhjbtnMKbhPGPIOQ11syWoUqPMF+f3O/fjFloMxslH
         vAuCbkEuAoVYyzxUVszIAtCDigjDYQPAYyl43NCUdsme1Z6vYQn/TORjn/tr9TtxzY0d
         eupUahR+z9IAmoh657EhR6Sdy9N48eyZgvJ0YNThWr5yrS2WzeQrcfUfflTgnkF5T5an
         r1DfB5EjH0kRA0RqUlOIplzRy8qjAbF1LLC0XZ+vVUQ6OEC73tPGcP2I50059620KN6L
         CNRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=cNep7Wfr1D0nH06IxVT8g1BocdGSdHc6ANCazY79bd8=;
        fh=c8fHOSfepZpraM5kd61iQblNo+/0YhVDJmbS6Tbl5o8=;
        b=Hnr0DOg4JvYtTckaQGxXnPIN5x+pJSLIyKR2nPNQmhCiBlzgkT/Ms0NXZ3KOPaEVxL
         iJKDeHgXVA2RRKfZYq7v4U5c/51K2Uh2f8GhJEY7KpziLraVzn/VDPGhnby3Z4tWiZ+0
         XMLnqZfvEGpZKosFv8fuOorH0OKvNFfJTUilH06VcK7ThU5WfPsj3uKNFPR+5mkISLsr
         FJh1wWI6SGpRnGksgSVJDljrcm7kyc7Z2dEnkHnRvvI76yxwln8qZ0Zmy8J5d+5gpyMB
         jeil+cQYfEfbkWlXKa+KUP5k6YVh1uhstWJddIYsDTyNYB36Cd9zh9NYa0bFlZ1Eg5PP
         VAxA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=llcDd5rd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041e95a4bsi81051685a.198.2025.02.06.01.27.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 01:27:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=llcDd5rd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfyAN-0007HB-1v; Thu, 06 Feb 2025 04:27:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfyAK-0007GX-PO
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 04:27:20 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfyAI-0004LC-6E
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 04:27:20 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43625c4a50dso4014515e9.0
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 01:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738834036; x=1739438836; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cNep7Wfr1D0nH06IxVT8g1BocdGSdHc6ANCazY79bd8=;
 b=llcDd5rdEmLGEOMR9mE01JoRqNTgh9+QfXC8xfWSXeVXXRJgBQ3qg5dW4T9suiWgT7
 nXEJGMJJ4wqJWwt/o2Lo55mFnsP7SS+EM8SJoT41C5Hndaylm55cOpVXu5+E3edgc+20
 +xO+gzyDP8FUhgq67pQ6oYXFM+786DeUhk/2iluZwbXeP5tqM6zjRhObpjrAQAEwQc3h
 GxSP177OftK8s/9mxxFTaDsTPCmu6j/et54j/M+eRo1jehRBJIvGJWtvwi/7blpgqbA0
 AJSP26/00c3GvGHoRO2jrWN5WA93Ns8yAlLgl2UGY91K2hsy49cyNsImWRMWVYSJHFNQ
 /qtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738834036; x=1739438836;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cNep7Wfr1D0nH06IxVT8g1BocdGSdHc6ANCazY79bd8=;
 b=FjxY0XV3F2IdpfZUJ44Pm9Yv95BudVd8FiLNitjMEB1AIyTu6aQwrccNoGIaUJhlIL
 yuxwJycIrHX0AQzbLLE5OEpv7wTKpu8Z7KAIbkoncEnyPXHQOlVr+3SbLo3sWAzg3jN5
 EYzitWE5iKDjkLnlG9N1HGyHSIrns2SA7yUi+LV0Vx65GrU7NZSLx3Lsq05zmvlNZWCn
 mu2cvTZpQY+aW5Qt7bW/8bvfAJb5T5gOjVjW2v26uJEP2MQ18QFY/hyRDZUvVBEXBXX0
 zYqj0TcuQ0K5VJLT0MnlWmah55pB1jyertHuVlKMLSJZmowLFVZPu4jd9ypq+651XDfk
 R5uQ==
X-Gm-Message-State: AOJu0YwaQ5D8/Tpfzsf7O/qRct4W1E7zB9AczAbzOEaiUibgQrEByMUM
 4ix8OhSFYgdC0k34PpPp8PgISdqwx9Bkt4Is3F2ijR13epTm4NlPuo377MkQ210=
X-Gm-Gg: ASbGncsaVVJdu9P5Z6j43ac48qPBiopAHEZ1dBGAWh1eNKEWUuUYteP9ZjBP7BrFV/S
 6W5rQnW5IIPS0RRLn/0SrVgU8GVppz54SfG8rh6Nhi8tpXp5kX5/6IGFPA0LKTN63fIekpChbAk
 /yD59Y2apnue0BYIWnoyVVsyMoyPwE16isxC3GW5KjYKZjQCeYB8oxbhPGumb+Yv1Rr+yp6i4y1
 JBDiKTmV6bbJIeXg0Q4n7TjxNlt36xJnlwDAkpsp/ALBnve5PgUc+DeDwZK7oJBuT7jfKSYl7rT
 3qjSJx/UttyzJj8vQTtXvAD744DzOiTQ6mk0I76aGSnST9XzEZEHpOeFDkc=
X-Received: by 2002:a05:600c:5112:b0:434:f1e9:afb3 with SMTP id
 5b1f17b1804b1-4390d43127bmr49398105e9.3.1738834036500; 
 Thu, 06 Feb 2025 01:27:16 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390daf3c70sm48511565e9.26.2025.02.06.01.27.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 01:27:16 -0800 (PST)
Message-ID: <965daf37-813b-4fd0-9575-a55fbfaa28c7@linaro.org>
Date: Thu, 6 Feb 2025 10:27:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/17] hw/arm: Add NPCM845 Evaluation board
To: Hao Wu <wuhaotsh@google.com>, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com,
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com,
 titusr@google.com, chli30@nuvoton.corp-partner.google.com
References: <20250206013105.3228344-1-wuhaotsh@google.com>
 <20250206013105.3228344-17-wuhaotsh@google.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250206013105.3228344-17-wuhaotsh@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: nfGzUXS6Rlgq

On 6/2/25 02:31, Hao Wu wrote:
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>   hw/arm/meson.build       |   2 +-
>   hw/arm/npcm8xx_boards.c  | 253 +++++++++++++++++++++++++++++++++++++++
>   include/hw/arm/npcm8xx.h |  20 ++++
>   3 files changed, 274 insertions(+), 1 deletion(-)
>   create mode 100644 hw/arm/npcm8xx_boards.c


> diff --git a/include/hw/arm/npcm8xx.h b/include/hw/arm/npcm8xx.h
> index 1f7e3d8116..f465d1eeb5 100644
> --- a/include/hw/arm/npcm8xx.h
> +++ b/include/hw/arm/npcm8xx.h
> @@ -52,6 +52,26 @@
>   
>   #define NPCM8XX_NR_PWM_MODULES 3
>   
> +typedef struct NPCM8xxMachine {
> +    MachineState        parent;

Please use docs/devel/style.rst recommendations:

'parent_obj'

<new line>

> +    /*
> +     * PWM fan splitter. each splitter connects to one PWM output and
> +     * multiple MFT inputs.
> +     */
> +    SplitIRQ            fan_splitter[NPCM8XX_NR_PWM_MODULES *
> +                                     NPCM7XX_PWM_PER_MODULE];
> +} NPCM8xxMachine;
> +
> +
> +typedef struct NPCM8xxMachineClass {
> +    MachineClass        parent;

'parent_class'

> +
> +    const char          *soc_type;
> +} NPCM8xxMachineClass;
> +
> +#define TYPE_NPCM8XX_MACHINE MACHINE_TYPE_NAME("npcm8xx")
> +OBJECT_DECLARE_TYPE(NPCM8xxMachine, NPCM8xxMachineClass, NPCM8XX_MACHINE)
> +
>   typedef struct NPCM8xxState {
>       DeviceState         parent;
>   

