Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp2248287njb;
        Mon, 10 Feb 2025 14:13:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUOjAS0GTGXxIW4A+t9XvjBGzKg5GpcflJkakjXgKUXcmXB3eT5Yr278xZiAANMZB8Zqe9JVNF8ZTYWTQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGh/dOyOjhbR9PzcpJJzcdTJKxLgdgjdBgmx5gsaQOiR+FdihzfLUvyviN3xjvJy+1vakgS
X-Received: by 2002:a05:620a:2602:b0:7c0:34cd:8d45 with SMTP id af79cd13be357-7c047bc7246mr2526160685a.31.1739225593101;
        Mon, 10 Feb 2025 14:13:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739225593; cv=none;
        d=google.com; s=arc-20240605;
        b=ZKFzGzic74x2gVfThTU55mz1VUeGDXHqbAUZ4zoN/7IDgv54VXGAmFdvwt+khr1Yue
         aoaaOzhm9KxPhbPwdV+Ag+BMNh79EhrYtjTfvuWJJ8lw3yCmttpRrdbbR4pFyc9Qbk8Y
         xISH74BCoj4bL53VYH93nM3dDeKKo8A59s8lvzIrISXNHoQGB80JqcwnHzpQ6MHCUNzD
         BmSCKPZF7zYVRVGEu7fBt5KFmPv/91yw0JaBrM3gVBmybW/Q2piHm+J5gKvGZuqq0seN
         lVjV7bB0rVt2ZXTXWGumf5TmeEHpjhUWGRxrBM0uRiRn+Hxs9qTGnWRfme09UyP2rJDY
         gg+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=lOiFZFeY6nZRExwaSvE4UHNx9D5/MdTLbKqhY7OxuBY=;
        fh=bhHeqon2h8Pzz9uXXNfrJBlTb1GNMkecKS2GN2HqaYs=;
        b=Yf2fIhFNyGr1M07Qy5sivX+qD1hMq/Ih6nzK//MerOdGLjfx9LDctyCffWIAtSpYON
         K+8/ipuqNs7g+Dh4kIbXAaLvtbUHDWXdKPOv/3GQeiYXGpwblZSENRJGS0zzuZo1WR0A
         Os5Ysc8+uYrDw+uupPdIsBs2v4aw4xtCtkijo8GpkBezTJP7rm5OC7MACaRjiQkaGzRv
         mWgWl3bY4ym0DOqXxzH4jPWu9k1BLJmpkFlt0u7U1Zwzrc1+Bki6CZsZEb0ZZlWQ3T1S
         EtQa8cfNKMnKGQRUev/9h3CWXQS2cQScYjI+24to9sOKEAJwfxRQNe7RcvlymzvZ+21/
         uvHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dTWBcvCS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47153bbfec5si102782101cf.506.2025.02.10.14.13.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 14:13:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dTWBcvCS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thc0x-00022Z-B9; Mon, 10 Feb 2025 17:12:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1thc0u-0001v1-0l
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 17:12:24 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1thc0r-0001Gz-4g
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 17:12:23 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-2fa3e20952fso5545883a91.1
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2025 14:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739225539; x=1739830339; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lOiFZFeY6nZRExwaSvE4UHNx9D5/MdTLbKqhY7OxuBY=;
 b=dTWBcvCSsSv4U5o4vgpzEyq2LUV1kxExoERdLKEZDpjk5x0LkNrm55VhCE2ymt0r8x
 3MeJ3lT2XPBzXxLxeqFHXrEmlgiiAzvpGxp0M0JugyAgKuUedkFc07BK4QHZJshuIDhi
 BlZKCupUWzBKlCFbWu53S8u/MpZFBmfgWMq+jiVk/nIS+M+m6hJ3j7Hfy2kx+/ZOU1Eo
 96GEYJCHjISrV6Kt42R1Hep+J2SAGykbWztpu12v+ZXZCm9ewhw9i/y/tu+BpGa+UcvR
 vON4uQQLBNRRgnGbRyAejPVF/1aMJctW8zq50K2gxBIfNDclKuaqYF5WgvOIN/qQHD0O
 NlPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739225539; x=1739830339;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lOiFZFeY6nZRExwaSvE4UHNx9D5/MdTLbKqhY7OxuBY=;
 b=MvjkgyANiskR/q8js3k0Q2kyNFo+m4ZVukFA3ADf3PEhi+dHccU3niVxRwqlGfL0VE
 QtbaWEyK0pHEFowa/4A77AtKEsFqGq8/NfmugocHLZFzXzqYGWcyeeIKWe0i/VAGLiYf
 Bh12ds67KoiMHhvZHOOIW1DTQMaAS5qLpslzTfFAY+HS1zRzHIRxA5uFsW18JXcsKnjK
 68rBcuNl1lNbJck+rBXPEeu88xyMFksaZbNKU1Q8A3NmsH9i2dUUuAt623o2ksm1qeBx
 pzmbLc1Mjma9vdFTjWTv3NyCPRZvvOYwJIgwlkSV4lFXPIFKgwHeU0w+5hW6ZBB2lnlm
 clpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDU0lEooLE9pPneELe4IWhjqseNw5nmilPYfAd/s83oGVMyIgD9aA1ezFsfJmISWtiFnem+SuAzA==@nongnu.org
X-Gm-Message-State: AOJu0Yz3atqXXaCqYua5IXMl+Lh71xUw+U58gFveudKzx/41y0W/YI59
 F07r4H9jG7M2CZUyFxQjBJOLwJqjFmtvC82tOkP3RtuHCHMfzTkzgRdpl23FPn0=
X-Gm-Gg: ASbGncvK29VpGiNewkkE/kco2OylP0Yjp46WuPUpRfgiik6+R4uWISLj9uWH9B37aOZ
 us+B6jjpkp9sqlIcLpnWUgnvxw1y/UnegGmofrT+pr77m8Kl73SbyYY/lM2MJ/gUi27qHyhs/kp
 NSFrca8YStA4VPzxwyApNw4O+PjbCZ9bwdkeRjpfAd9LhvS2UivDW/wSYN7dfqUUBejfkjUSTk6
 vvcvLNW9q/IsIuj2XU3u4E+QF46dYyj7X6tloll+LyNbgaBH2hqKtiJG6Y1iEmZmz6YucSySFDt
 as1RVsCOLDq2fdib6XM8STwuilY+haOoEPHMTmx4RS3ZK2SKrianAtM=
X-Received: by 2002:a17:90b:1806:b0:2f4:432d:250d with SMTP id
 98e67ed59e1d1-2fa2427064fmr21631778a91.21.1739225539556; 
 Mon, 10 Feb 2025 14:12:19 -0800 (PST)
Received: from [192.168.0.4] (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fa099f4fc7sm9236939a91.3.2025.02.10.14.12.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 14:12:19 -0800 (PST)
Message-ID: <5c97a343-16ac-4cae-a58b-052f59ad2c1c@linaro.org>
Date: Mon, 10 Feb 2025 14:12:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/10] target/ppc: Set disassemble_info::endian value
 in disas_set_info()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Thomas Huth
 <thuth@redhat.com>, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org
References: <20250210212931.62401-1-philmd@linaro.org>
 <20250210212931.62401-7-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250210212931.62401-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
X-TUID: dP1cTPXxaC0O

On 2/10/25 13:29, Philippe Mathieu-Daudé wrote:
> Have the CPUClass::disas_set_info() callback always set\
> the disassemble_info::endian field.
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/ppc/cpu_init.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 25e835d65e7..e816d30114b 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -7398,6 +7398,8 @@ static void ppc_disas_set_info(CPUState *cs, disassemble_info *info)
>   
>       if ((env->hflags >> MSR_LE) & 1) {
>           info->endian = BFD_ENDIAN_LITTLE;
> +    } else {
> +        info->endian = BFD_ENDIAN_BIG;
>       }
>       info->mach = env->bfd_mach;
>       if (!env->bfd_mach) {

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
