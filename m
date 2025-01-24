Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp952485njk;
        Fri, 24 Jan 2025 09:07:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUSj/D8i9UWpZ4OA6ac2/0Tx0SbSA/HaugpcdMJ4nshBQsZZ4vx1ErC5buZoVcPTFdSvAPhLaLARl4Cmw==@linaro.org
X-Google-Smtp-Source: AGHT+IHEsjzqnhIGM4FJYaZYlZnXMApTs/7x/jHaIu6iJeIpInQxVOZIiTz/CZbVFX3xVIooggT2
X-Received: by 2002:a05:6214:2468:b0:6d8:d5f6:8c75 with SMTP id 6a1803df08f44-6e1b2175989mr374673116d6.12.1737738471407;
        Fri, 24 Jan 2025 09:07:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737738471; cv=none;
        d=google.com; s=arc-20240605;
        b=dlOLp1CstOa1Vcx2d3Ebu7fwHtoMUpmryzIVAkxU8wHLaC8mUhyvhO8OYnXVIIKyO4
         zEJ8g1q/Mn+djwrcf3+9dicjLoce/etqiHdBjNqGv/Z9FbcQhB/lAiKqMPsgr7ICbIAp
         x5TTtUbGq7qs8rsbbT3hBG5I2ueM7760lSxvyR7L3HY2vP98DNySLgsoSIAFpkxcwmvR
         n3XjIfUOLlMbFx82m+WHzBH18CCd3UbAFWAhPCHkOVXOc0KVHvnEybbqWJopM/qEeAy9
         vf35/kC1iK+02Czfpg19uUggXAScrlu/KorAChcFlX2ZVJCG+Z2QXEIezQAzroew6JXO
         y6Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=nl9TlDvSQz7lPsffb2aK9GQdrHWl8xDaTDwcj9+AIJw=;
        fh=iRdBN1YoLJCvVUiTTWybEyEWQ1TrofmoeyQxLE4Z5mQ=;
        b=JbWB2ieovNkyY02UTb4h/DIKnoJnIqeN9znmRGThBRwjiPngQG6yqa4qgVXhwVlzsf
         UPMGl9J5dBEFfx+u3w5gIN6MvS3v+gzYE2Lhjk1yWCaEXHGIA8LHfniYnxW+8bQ3CKW7
         5ZnLAReSDZTKc5DX1aHbQAEff+52treM63CkmmyavHIUJSZddKu1QPXf3dxb9P534Jz3
         01aGyrwPoeUWWV9DuTHclPZGFo9DUZV+x4rrIAo6l8tnhXY/S0Qs/Oj2T2C/nIwaajJm
         K0MSn7tOsCMpfonU/A8gvshJsHYvqkD2TszgxJCRHag8W8JmE7Gc2XaOeaNovu1Rcy77
         w5OA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xYIqaifs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e6686bd2esi29367071cf.27.2025.01.24.09.07.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 09:07:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xYIqaifs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbN8u-0004JB-NS; Fri, 24 Jan 2025 12:06:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbN8s-0004G9-BH
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 12:06:50 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbN8q-0004yp-LX
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 12:06:50 -0500
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-21670dce0a7so48092365ad.1
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 09:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737738407; x=1738343207; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nl9TlDvSQz7lPsffb2aK9GQdrHWl8xDaTDwcj9+AIJw=;
 b=xYIqaifs/nO03prqlMITnfv1RuuL/55eO4td1FGF0zr6kxk8aOzaWQZzoIhAJ/hjMP
 JQwK4djjWEKxkt7iY77he0I7vc1UnmPWYq7X6XvsFnglvXQlJrNhsRFdU69YpW4iNRXL
 oXyUp4gb/+8HA2Gut8+WYXhMTIpD1VYjbB4stFVYGLZbf4uMsGhWdOXftikS05saKaI/
 FXb0sacfoV7qCt1+aJcFvvT9Fqc3LymBkoIun4J1GbfVGiOO5G60RI+ZQzSHUZgNSXOy
 2LQ5/3je+vg6aVwFeVtwfz26yHHP3VaShmHZvxhkWW4rYoxeDKpHY4L+yPIdVEv8hBhx
 3naQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737738407; x=1738343207;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nl9TlDvSQz7lPsffb2aK9GQdrHWl8xDaTDwcj9+AIJw=;
 b=qDoC2oSrD+MbLkDY+q3Ndtea6eo24/z1dcRarx/YKSKVFPWzcWBop1frxOBZSFNzSG
 a0Xj5bCN06eY2+nGCsKQm2vZOtFyXBzMKSSGlSVv2AR17facZLLZgsrGlvt/HhwmVbvJ
 LGJF74O8IbOW8EYXQkTCF7etPvNHbdHKRS308h/xeD5SWKy0dXqdHg2tlXui2Huamz2w
 rjLQoZK4EB1Q1kbQTu2oMtiYpG+8RMCIhq8BdXAZWm4zdJI1NLPyNfEyPpGgS0piGG4N
 snrBcGbI9SVx3ewet0WRULhwOJ8GvU7BKnFIHuoK6iqbRhxGttoR5vNobbIaKMgHazVP
 cU+w==
X-Gm-Message-State: AOJu0YwPq9naQYz/9pEpECpciEHG1nTfkx8eArQwa/VqULRVqdUd5v+Z
 r13lQ/0t08W0lTPVKnCs+my1BS2sdRY523RmXbIEedX9UHsyk8iieAQG/n6EvJ0=
X-Gm-Gg: ASbGncsoTInFpZRQeVQsPUDTtv2shRhFaX0juuna5untgLvPm153NeKcHMEzHeRYsIT
 g7SMaEiAO1DYb6//DFNECousH/2EdfphhzO320xn26R850ThJKEaXCd3mHxm368MPzWv2mNQ89K
 VJiW3JS+l7rmaPejMPWhL5+nMB6pBqKL2YB01r7Xa0npQT1yqOQyQJcrMf7fHSuO3iBNUBHTvjb
 wmtO42sZiwre/65EGT5KB8FoK6FF+D8IAIYRBECaJcKf5s3CIX9bUiHsaqelAQF967Dl6EtvQGM
 zrkHme6fzrQ9+kl+R98GatAg
X-Received: by 2002:a05:6a20:6a04:b0:1e4:80a9:3fb8 with SMTP id
 adf61e73a8af0-1eb214a092emr46315525637.16.1737738407227; 
 Fri, 24 Jan 2025 09:06:47 -0800 (PST)
Received: from [192.168.163.227] ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ac48e475790sm1887522a12.8.2025.01.24.09.06.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 09:06:46 -0800 (PST)
Message-ID: <50d3bcb6-d421-4192-963e-f94fcc25064f@linaro.org>
Date: Fri, 24 Jan 2025 09:06:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/28] target/avr: Move has_work() from CPUClass to
 SysemuCPUOps
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250121142341.17001-1-philmd@linaro.org>
 <20250121142341.17001-11-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121142341.17001-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: tbepv8VJfO0L

On 1/21/25 06:23, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/avr/cpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
