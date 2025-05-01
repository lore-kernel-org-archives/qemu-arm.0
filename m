Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp267413njj;
        Thu, 1 May 2025 08:07:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXGE7KK+VQ3MFJ6l5W8DhiKNerCTNtQl2PtgsVgN8MVz0ibkAvibKn4zW4Xq1bTv6ZDBja8z9pYyWcqUA==@linaro.org
X-Received: by 2002:a17:902:d506:b0:224:584:6f07 with SMTP id d9443c01a7336-22df35892dcmr123140635ad.37.1746112064761;
        Thu, 01 May 2025 08:07:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746112064; cv=none;
        d=google.com; s=arc-20240605;
        b=Td3WEvORT0FrS/BDam6dPI7g0A2Kf0SWXwPHJFRUllBpzjVpCUsh8sA3jyulkBLw5B
         uio+FFaxNLxu0YXOTgsZjTRnPnI/hoPHi08i3sw1zQ0cfgZJpH8Z+3Emq9v9CLmmg+Dm
         +GBi0DDvvSGdMwruA2wISGhzY3yQQaB9P42wDRbN1WIhLKzLtejeBbJb0JjJQQsdcCJ+
         uC+/RWznfUNt+Z/w3LdGnv9DDVFSMJotpa34hf70QFIuDaKJzvSy/J3rN7H49sszGUDO
         +we3FgSGxLPtEJ2M1iymUcJn3mwhy2GoUXxCB56n1+/nvOZnUCYYOavyfQCCPC8NFJZY
         uWSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=J6UsLGEvl5QHsostA8JwRSbyir2SZsB7Lm+iq0MyXUU=;
        fh=VZHiDxkTqU9wjcRPatr9/56bNWom/Qj28wYoZYZzsIc=;
        b=JQwfvpF8fde9pgRgDglo0NxB1i7ewciY2QyESmyQ9zgds/5fHC89ibJ63hcXXWJzYn
         wWQKjmfGapuwfsG1RnpVR54ANcFQvsk5owSXLKfxbL9garZCfhdWcxe0kBa9ScpWcZYl
         AQMvrF9HF9UWmVY4bpmkjEuUK4I7vtkTHOMTCATKpeOh+QMI4jyE7+nwBqzLmJ7qE+wC
         MGW0T1a48Hm+DTZ6W5K/nsgfx/kJiMKl44jJCNzVjxC9DyCpF6AkEm6b2ZkKxVfP/P4U
         jwVwu1M+knNuRobN4hrUVpXXW/+ztt2XVIRlpAa/8k7HL8RyT7Vn+McQIGM8IRAEb3vi
         kzxw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="vI62NE6/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb270c2sor5741645ad.7.2025.05.01.08.07.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 May 2025 08:07:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="vI62NE6/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746112064; x=1746716864; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J6UsLGEvl5QHsostA8JwRSbyir2SZsB7Lm+iq0MyXUU=;
        b=vI62NE6/9IDQh7tfYqqGEILki/grCeshZ7BBF83R+eG0BdLeQdiNmUpXVAiX5puHAR
         1oWZp7WmcePDaehL49T+GyqDk8KUhNUouNVMtocWokKQS/MtIDvazCYrEUsESbGUeEHq
         9+AJVAFaGQyxCUl0jMYe5rcQmS/J0tRByNRENbZYGGGyxWZ+w113gACgT0bgOegzXuIp
         /1CBW8RxmOEMYDnIxcWlwjGuSTK7a3v+HMKZC41owHjzApn740ZxCpwIQ7itTVlTZZFy
         emWn9rhEmbFfnFrouS98RetdpetNafmKHq4rDnPr7ZqsWNNI694+Iw0n1ebK+WrI83M0
         6Npg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746112064; x=1746716864;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J6UsLGEvl5QHsostA8JwRSbyir2SZsB7Lm+iq0MyXUU=;
        b=CligukJAx/ItKHvChVuipO+T37Yk9Z/e7LvYtYhSyzl5J0wOrEbIf2ZSKWBWi+skkG
         PQAZTpiZZ5sSjUvd3hWyOYeQLKybWOTWIveVsdQ5omM2y8AnqAsemkDeheIiUSl1bT15
         Om9BP8fVsy9iEPUkvjAHf38F+sInHAcPorN03K7E1+cDrPOJxd+JKtUt8FhJV9JscRh2
         UfAELgDYMe4LsiW1TZtnR70TTOyC5xzwJrIWCAtdkm9WQKdShhEHNNXp2rPLRUtQ+LTa
         jOtcheAtvZ7xyA55lqxoiFp5VL+/T2736rAYLVAHA+6wakyv53lehAg3oeNmxrXpmzPz
         8oJg==
X-Forwarded-Encrypted: i=1; AJvYcCX6PifHJZlM0UNYN6cmSj+qnG36ojZinyqkMP7J18rIYpJJ/e2unsZ2THuG/T/oXeUQpIIdll7AoU3YPQ==@linaro.org
X-Gm-Message-State: AOJu0Yw2G+YQxylwyanUmukRuZV3jKGtmwIeqOd09YrLh+yiJdehyIy7
	1Fq6QwupREulBN9tGw7drcnFl6aQ1SMWNsgIvDN9yv55tmUIkRsVyEiWnazb8VtNXw==
X-Gm-Gg: ASbGncu0AivDMAYEDm1XgLm/Da/PY4omqIATYUp4m63jMwdKWQM1ZnMvuQoLATKOqFO
	Rti6e0lIHQpWWXBYEorcytyCVAtk0rZz0paYimLxg/yG1nG8R9+WcpbwSZVQmZ+gVLbVviDQmy+
	YdRYIQ3n/gNeUCk/jMEVPEHPXCL7D4CeElDf7mkyuGqukyUtuaDdSSD1NCoJRRyQvNmdA/obkXs
	OtATBrBBeKD8uXnC52fqjsGJcVbCcMpL/yJGA9Pn8yLRxzHMDs9eRI+YpHRQ2F0zNMGxC2JPs12
	huiykgCPND/F5k1W63YaV999FwiX+OVaJ1HrzaiDbaMcNq3E8X67vZCpl0ojymYsAux2C6R0yy0
	I1fEhIoo=
X-Google-Smtp-Source: AGHT+IFhtG/bZFVwWc5cOJbYqNLnqgnJjC/vtZgOZfsbK8XeE1XUv6h51c7+2i0dV2j5oOP+IvlPuw==
X-Received: by 2002:a17:902:f64a:b0:220:ff3f:6cc0 with SMTP id d9443c01a7336-22df3587932mr131329555ad.38.1746112064289;
        Thu, 01 May 2025 08:07:44 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e0bc6da92sm7708035ad.150.2025.05.01.08.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 08:07:43 -0700 (PDT)
Message-ID: <e1afdcf4-a416-4742-bef2-352a9d184ea9@linaro.org>
Date: Thu, 1 May 2025 08:07:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/33] target/arm/debug_helper: remove target_ulong
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-18-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250501062344.2526061-18-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: XkCdoZCabfZa

On 4/30/25 23:23, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/debug_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
> index 357bc2141ae..50ef5618f51 100644
> --- a/target/arm/debug_helper.c
> +++ b/target/arm/debug_helper.c
> @@ -381,7 +381,7 @@ bool arm_debug_check_breakpoint(CPUState *cs)
>   {
>       ARMCPU *cpu = ARM_CPU(cs);
>       CPUARMState *env = &cpu->env;
> -    target_ulong pc;
> +    vaddr pc;
>       int n;
>   
>       /*

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
