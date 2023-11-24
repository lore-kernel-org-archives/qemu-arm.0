Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp1098679ejj;
        Fri, 24 Nov 2023 03:49:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEppulMCymOq00zd2WDQ2xtH3iYUB44GyAr5/ax6nKp1AG6G34IBfCOpekZkgYS+J+tE90I
X-Received: by 2002:a0c:f841:0:b0:66d:5a3a:c5e6 with SMTP id g1-20020a0cf841000000b0066d5a3ac5e6mr3309169qvo.18.1700826578085;
        Fri, 24 Nov 2023 03:49:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700826578; cv=none;
        d=google.com; s=arc-20160816;
        b=RUrhDbNFjstftXIILqSf5DDFxgF3T/h4kY5k6Bt3x6dBvU1fEc7smQAI/AGiBSY29+
         qLIVxEWe4yJz7FoL/7byEXSDJF4c9n62VZObiOTbmNSGqVlDPBt9/saj33UaVwYaJ9oy
         P8b4M4vA/SZJ+5Ri/nlq33WXOlGrDafW8kRyu0SYYRGdRaiB57hh+IvOA77EDLiVc2Hd
         vfdLZYP4Ydx5/f2QJ2bZCLLrzmRiIinHI0hbQq52HP02+A5OuXnj2vbBcutE4Tbgqou9
         nevUXfhF9aIgMd7d3dFsHGEFeypmtB/qEJeVCFjmmbO+OfWXbh2ux3Lg20SLwr9mTPUZ
         IL9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=kDycAxorQx/JETYMjMOu7ZhPf8tONa+u8Eo+8N3REvM=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=YIuGwhh9ZT9ucdyxNWhfdjtlmMlzpp6KihgwnG3bcOe7n0dHE1KpiQ4W29HpIIsKug
         RSKacGbPQ/vq58aHPo+sTng9r1pFMil6f6k9e50hX3CzBUWFm2PqKINIk+TcgYGT+fPv
         yL9mPTquOamcr4/mfAQPngDYeiIDDXw7F3pK7e/SURF6FgyVNZd8KZd/Okxdch+u2ERV
         98OGon8yaSbHy3gIijVf4yq7yu3Z5ntLNoCQMA17qQFpDlAP1SsHO8ZxyY8qF7IX1FNb
         78PqN3iJss6iqM3i+vDPsA6HdgEutX0onUfpBmD8hjcTmyiY4ooErRm4SQx4qhGfVEQ0
         4aCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wf6qP4tS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l11-20020ad4444b000000b0067a0581c07asi3164463qvt.479.2023.11.24.03.49.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Nov 2023 03:49:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wf6qP4tS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r6UgO-0001sc-Vn; Fri, 24 Nov 2023 06:49:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r6UgL-0001rh-Jm
 for qemu-arm@nongnu.org; Fri, 24 Nov 2023 06:49:13 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r6UgK-00036x-3P
 for qemu-arm@nongnu.org; Fri, 24 Nov 2023 06:49:13 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-32dff08bbdbso1206922f8f.2
 for <qemu-arm@nongnu.org>; Fri, 24 Nov 2023 03:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700826549; x=1701431349; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kDycAxorQx/JETYMjMOu7ZhPf8tONa+u8Eo+8N3REvM=;
 b=Wf6qP4tS9A1rPXdDcS83qOOYv/6/pjzaGUpEeR/VKD78kSBdTBm95EYajjX+KY7edZ
 44yHYhpfbYfamaEc/s3/S/HWjZuQQT91CQcgeylOAuyzH1YMa6dCjMc7zBfCZDDS2sxG
 /7r9TZUCo9Ups/TnLcviVG678wpKeFAX0pQn9dHsMMajlzaBGUTWEgsu82dfDiroOqLX
 4xiC96YDau1u9AwqnSBIkbuiqqwAO+dWc0YN0iF7iEG8PUD8f+5Z9CpCUt+XUP9CmLrZ
 HLuOr6OEJ6eWoNsiR7UyWqk7xYxTWP3gEKvcBiA/c9SD2B7lL3vL38K1BC8fq6sKVW4J
 TsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700826549; x=1701431349;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kDycAxorQx/JETYMjMOu7ZhPf8tONa+u8Eo+8N3REvM=;
 b=hGybhMGvBh1Xieu0J36++9v1/C20FFp+GzZbGAl0n0Bjbp5vjjAlDPW7ZEKl50nm/E
 MmcoEzHDQaJPtopOrRkOnrz71ylpL3lY0FakzaK4E1Xet4dpXlWeFwQ5Og7lHpmgY14I
 6E2sr0Ct5ULZhSyQH53Vjb0bIsCCn0rO0sCEXmeDOHCYCbHslc2097UWdHX4IkXISZIr
 yez/z5YmGIyE9p3pF+8IZcQO5Zo0tVkYPJ67k9XvPPmLpqK7vnoi6i/pc/Fmg+O1nphk
 A7Ai52xzSRdxPmJGybRYBRS+a68yDXLITgWxloXRTYqYgPExtthB1YBiRvFElk4gFknn
 JGSQ==
X-Gm-Message-State: AOJu0YwF61xmyuKhTEjNtKGE5pfQ07o2hRRBO5vdWpxOugfidPT207fu
 ykGHbkM4b1IcRbSrT4fJJVVhsQ==
X-Received: by 2002:adf:fd8f:0:b0:331:6ae6:d25f with SMTP id
 d15-20020adffd8f000000b003316ae6d25fmr2106156wrr.26.1700826548704; 
 Fri, 24 Nov 2023 03:49:08 -0800 (PST)
Received: from [192.168.69.100] ([176.187.218.17])
 by smtp.gmail.com with ESMTPSA id
 x9-20020adfdd89000000b00332dc82f70esm4096537wrl.102.2023.11.24.03.49.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Nov 2023 03:49:08 -0800 (PST)
Message-ID: <d08beba6-1e2e-404e-9fbe-65b6a941e9f9@linaro.org>
Date: Fri, 24 Nov 2023 12:49:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/21] target/arm/kvm: Init cap_has_inject_serror_esr in
 kvm_arch_init
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20231123044219.896776-1-richard.henderson@linaro.org>
 <20231123044219.896776-19-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231123044219.896776-19-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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
X-TUID: BHXHOBamZI+8

On 23/11/23 05:42, Richard Henderson wrote:
> There is no need to do this in kvm_arch_init_vcpu per vcpu.
> Inline kvm_arm_init_serror_injection rather than keep separate.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/kvm_arm.h |  8 --------
>   target/arm/kvm.c     | 13 ++++---------
>   2 files changed, 4 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

