Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp2056548ejb;
        Tue, 6 Feb 2024 12:34:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW9LBAW/vFpHL98NFkvHNInE85E376ZuEC7I6yZjqrqsr/R4Ov8JIwkBzMnxTO1tNpC0QcI+HgEHW2OePKhUitNHsgybAOH
X-Google-Smtp-Source: AGHT+IGUZIHa2Le0kUBvlrvY9CGCvjbD+IxxVY0cPTk4Q7IV4P00ApXq7tk7CMysTkYAT5O53HDL
X-Received: by 2002:a05:622a:341:b0:42c:2fa1:1b0d with SMTP id r1-20020a05622a034100b0042c2fa11b0dmr8566087qtw.13.1707251699686;
        Tue, 06 Feb 2024 12:34:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707251699; cv=none;
        d=google.com; s=arc-20160816;
        b=wJMpnRciuZIrSq/E2c9cTlyZtCRvUQ4ld6l3iqXUQWr0bG8B5arLmZVMYtgDpg2n52
         wlzfPsWj0ynyyKtEc+I3ryLikdejeYAY/KE41r1ixjLwikB745Bf5VuZDMYgxBVjnOKw
         yoegwHbDKnrcWktbC3r9Hqn4pwgTsEUYnsOBL5jf1yrFQqDNL2DYUncKv9/MTXlgwY6u
         wNwHD3bhP/p2Xr9irbSMEBTBaz9GvEu5oPiwGID3qpXFNE91f1V3r74U7SxKm1YWhMbs
         kIB1dcMfXY1hgJu4HAU/EOYEQRsdLUaPhNUgDa6MzMmuNRlyrN2CCnG36wFvepFzZt6i
         hIJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=CEt5J+6LdVSAOxfzeXKE68Kf+C7F2HF5Hao2SVqblEY=;
        fh=k8KDxRlM4sflI+WAFabVfHOVchc9M5Bw9XpSc2edbGU=;
        b=RmYqmW+o6jYMoTLJwEzGYYobery5lckl5N/Yi5sSDovHVjmcg3TAcCPE1Xkk95AsD9
         LHI7aC/JwdRO0ndeS/6CBLXklFFYE0B7GAKGfqceFB2EPVbg5I6IImtRyVUK0V41+UM8
         O4mVK5jpjQzjgEdQH/yBqCv7G4b7py9Pi2iij3xcwiFHTQGtoM2eD16gzmk2dqUkn+it
         VGEBXMN92o9T+C7Y09t8WuR2LqvxMDL4DPXAtod5V/P63YCoWYlRd3RmahFTNjQPyvCp
         eqtUFDQN5xzEAxQtst732Q5rOIwKd7Kp7rlZAQ3fUbzO9VS2FlyDh6DuSFtdVHILeWVe
         rRHg==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VNmmyxGx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCX0silbIhzd3neEPEli7NzZYZZHq636EiAdDHOBSZADXmqBExMB+/3jdTHJBHH/1hSrBWbEl7cDr0/omCtTG1MGFRp76yhr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n3-20020a05622a11c300b0042c3306518esi2827193qtk.261.2024.02.06.12.34.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 12:34:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VNmmyxGx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXS9S-0000Rz-5p; Tue, 06 Feb 2024 15:34:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rXS9Q-0000Qz-64
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 15:34:40 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rXS9O-0007k0-Nn
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 15:34:39 -0500
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1d99c5f6bfeso7817025ad.1
 for <qemu-arm@nongnu.org>; Tue, 06 Feb 2024 12:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707251677; x=1707856477; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CEt5J+6LdVSAOxfzeXKE68Kf+C7F2HF5Hao2SVqblEY=;
 b=VNmmyxGxm4SJUjNGv2jCGC0rFnTXqqNuPBefavhRdaz+EXFVnSk+Nkmj41ZKxdvXlA
 P38m2bCcCF8EqfEpF60LjZswpt4DSTHFj7Ia8teLCRejSz35FH0LDZKmU5Iqr3RpLJ50
 fWykQkTgVqe0jKThCrluNCEAIdIZ412G+KPsf0tMa9Ph5TUsV1Be925xzNqtMdzQ8fES
 y9l7nJvPiY5je1XiNiKYvde7BrCXm5/JRt8oeFNg+n+LPDOln49+pov5rE/h57KH5bsD
 LifmmvAtPhXn+z99if30W5dhCKHqkccRdBaAHxmICKhtao0Hx9p4Q6HlvRg9+4sXeq2R
 GkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707251677; x=1707856477;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CEt5J+6LdVSAOxfzeXKE68Kf+C7F2HF5Hao2SVqblEY=;
 b=WbQayK9lkjhpsYJhcpryFes3yWPnSkQeOPmn6CTHLeB8yHFTp4hvtXRNRw4CJsM7Yd
 xIPrOiT8lyDKjNaDc0nMgf2jDiPSYuviQW+lADu7s+DA+sVynB1qoXdqIQFmy1Cf8TKR
 h+QBYczhuBYMLWkIkXCZifvklyqC3rsujdt8IEYc/0BL8zzzGpfd6Wv4cChIfD5tmRPP
 cGSyHhpeizXz1pC2GkWaulS1qKiP/tZEvxP9eReVm0ubgv1pcZGS1kWqkfVnK+WIn3F8
 FbWUqgYSH7r7nStzV+YFhGTB5cpZculvhiP13pQpvn+9b/Be/ryhl+3GUMZy/C5WGWKY
 MebA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMH3HuUwd76ITSbv2JsHapqw81Jb4HgNjrQioDEh5HCfVwKPRmoiLrV2n0beO0OYB8N49z7kkC8GtFwSXx/FH6PsO0
X-Gm-Message-State: AOJu0YwToOKdWaRPA3n6tnAPdBP7Qk2LqWOYNxVbIbsA8/GpvovN95/Y
 8uU+ppJIsHcP7DPRTXQYigdNRttbba7MeOQLpCjHX6/pOwJX8j0AvKk4/pfKropJgn/VdS7gfGQ
 RWSs=
X-Received: by 2002:a17:902:d546:b0:1d9:e181:51b0 with SMTP id
 z6-20020a170902d54600b001d9e18151b0mr3139225plf.23.1707251676904; 
 Tue, 06 Feb 2024 12:34:36 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCU6Hmf4JzgodANkiQ+nRr44uH98gYpw4wNEoyDOCJcb/GfiiJXzMJ7vvHVhZafvGbxsFxTRm5/eYkL7VkuJKb5y0ZB7DvqIsEx1XGOx6xPqGiGTyTtTd7JjhgY=
Received: from [192.168.0.100] ([43.252.112.200])
 by smtp.gmail.com with ESMTPSA id
 kx15-20020a170902f94f00b001d8f82c61cdsm2297697plb.231.2024.02.06.12.34.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 12:34:36 -0800 (PST)
Message-ID: <768c7884-1a59-461c-a810-4f8a89d4bfda@linaro.org>
Date: Wed, 7 Feb 2024 06:34:32 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/13] target/arm: Use new CBAR encoding for all v8 CPUs, 
 not all aarch64 CPUs
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240206132931.38376-1-peter.maydell@linaro.org>
 <20240206132931.38376-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240206132931.38376-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
X-TUID: zuikDCbGoe21

On 2/6/24 23:29, Peter Maydell wrote:
> We support two different encodings for the AArch32 IMPDEF
> CBAR register -- older cores like the Cortex A9, A7, A15
> have this at 4, c15, c0, 0; newer cores like the
> Cortex A35, A53, A57 and A72 have it at 1 c15 c0 0.
> 
> When we implemented this we picked which encoding to
> use based on whether the CPU set ARM_FEATURE_AARCH64.
> However this isn't right for three cases:
>   * the qemu-system-arm 'max' CPU, which is supposed to be
>     a variant on a Cortex-A57; it ought to use the same
>     encoding the A57 does and which the AArch64 'max'
>     exposes to AArch32 guest code
>   * the Cortex-R52, which is AArch32-only but has the CBAR
>     at the newer encoding (and where we incorrectly are
>     not yet setting ARM_FEATURE_CBAR_RO anyway)
>   * any possible future support for other v8 AArch32
>     only CPUs, or for supporting "boot the CPU into
>     AArch32 mode" on our existing cores like the A57 etc
> 
> Make the decision of the encoding be based on whether
> the CPU implements the ARM_FEATURE_V8 flag instead.
> 
> This changes the behaviour only for the qemu-system-arm
> '-cpu max'. We don't expect anybody to be relying on the
> old behaviour because:
>   * it's not what the real hardware Cortex-A57 does
>     (and that's what our ID register claims we are)

Not even that, because max resets MIDR.

Anyway,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
