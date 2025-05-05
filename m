Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2671288njj;
        Mon, 5 May 2025 12:29:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVbszy3SiCiou5Y7/m5jkrci2IHtT9S8NfKD3KST2l8D/1vK2jW1h+lCBrwb4uoFifoVNZwELRJCigS6A==@linaro.org
X-Received: by 2002:a17:903:2303:b0:224:255b:c934 with SMTP id d9443c01a7336-22e103aa9e9mr203696755ad.51.1746473350369;
        Mon, 05 May 2025 12:29:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746473350; cv=none;
        d=google.com; s=arc-20240605;
        b=b9OUFV7DxyQggukj6FYWYuTsLmKu92JME5J3fxA+GYJ1TBE1aLga1JrPkVr1V007Sb
         QqKMTDZK9paFFOoMbYxqqv1YzBo9KYKG1XL2/FME1Z/r+jH59RTik/yonvCnxZuLjTfd
         WIqz9FBaJt7uXrUa2bHj1pyXeH+c+/gExJ4VIC6fl0O2U04lNVvV9gzDyvuRKHaAWpcm
         /MTUWSCM4ceSv4BhKu6bjPbH1lOR8hTiLSnC00jq9obuHQ56sRUhwueDwLgcP2/JnSE9
         CAcegXNIONJBHIRuyQOeQPiGchk13MXAadS9PeIrIC6BJEGfngiekICcSVT0C+fBSm4F
         AakA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=yURQyFKz9afRJKAQgVl7CD65mRk3F+jUNJqazHFq1Y0=;
        fh=nxrfhw+plRlEDe9/NzZsc5t2uHR2f9xbG2rWLNiwxEE=;
        b=K/oSmDXrNR352ssjhd1sHvDI9sNNoTyOkxYJ272KAZyEd87/ljNIt7w4XjD5fcEP2P
         MzSDlRUSnhLf028bzUthmSP+RaEaSCVemiPMoOsqv2TUjwcWrpmu1lk99n2xmq+kKygm
         ZM9Jel8q0vDwwh17R8QATSFdDu+1oFASTv22MTH+IhClmC6rmU6ZLwCvpbr45a1LY9/W
         sTpLSwJV1FxfLzJhlMX5R+NKyYhBnZTCEJm2tlukD9PoXU3DKgsh4PAqlYDOx375dx9V
         d3Fl/rTZ7uROhXpNPus2/xkAfmQo9HrrpSMTvLHxXo5yaoNyo5/ghm8G9Ob3oey81n5d
         lbrw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="iq8Ll/Y7";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb1f70esor53598275ad.7.2025.05.05.12.29.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 12:29:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="iq8Ll/Y7";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746473350; x=1747078150; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yURQyFKz9afRJKAQgVl7CD65mRk3F+jUNJqazHFq1Y0=;
        b=iq8Ll/Y7LGJ7UQ/+7YFtdExTFXrhMeH4yHs8ugr9GhhrvYNS45Q/zlnWY+x+Ey9uI9
         PzLhRck1NxZpYJYL1irLNJD5CAn/k2STpRBK0S1dIIT+G/8YZcnNEWh70SE6leZ7JXrE
         Gc8j6U9nlonC6mBT8st2PfbBKiOMS91FPPWjoOOgbr9wPmNirpNg3YQVdj9tihvuFD2Z
         3Q3SYKL5gonx853uEUprv5kfofug3nofS/MN4v0Vdcb0QawNTDjOxYVLESfaU5EoJEYZ
         sTxKPmFtfRPNG4dl26CJ7ygclu3s4iWfwdT6asYVBLTIgDiZnHv/cNlsAYMMpKON4Hd4
         A9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746473350; x=1747078150;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yURQyFKz9afRJKAQgVl7CD65mRk3F+jUNJqazHFq1Y0=;
        b=GB+oy+LfNt7+DoQh97TVxLhwXpPgT6WPKc9oHzjtc7a5mgWmOW9UsSToq8ZV5+MuzT
         MhBXVo22UfiYjpyVn4Se6AtpedXro5Ws4oKFeTpqgEVCt0rTYAY1Y+AofhPPls/yUnI7
         G/a1x+eH2/0RjLkcJlMalBbApsVeEPcgCPUrfXWw8/iGG8txD+1ckun75UrwVvqbSCLK
         oQC9SxBTnAyngU6wdfoDFpM0MgM956a/JonpZsfiATBu5BvOrBlKxYD97RPNvvdtrLSh
         OUt6yA5NNLjIfkqiCh+PLls1NEhHPMeM0+i1SLGYNfZRFB8GZbcLUvJzf1yYbWT0CvaX
         TbOg==
X-Forwarded-Encrypted: i=1; AJvYcCUZx0/NQXd/PLG3kQWHfn3dy02xw5KfZ5eyZuqY2Xv1hZ/gxMbQtRCv70AH8bLgjW6PEBJ+MX72MWg5GQ==@linaro.org
X-Gm-Message-State: AOJu0YxhNK1a7brJnUy/hDIZYmR9/VV+DW2a62oDOQRieIixj8mdmlye
	SDUNYMcdsq5zhVBnWTMcuLhrw8Ra53UsTZ2yaYX6bR3mDtBtI7Rt6J7ktPzp8WUfWg==
X-Gm-Gg: ASbGnctf8XrOOZrs+c6ofRSB013pW3aMa3MWLn7lDzfmwy4jhztPAbD1P3eeNgBidN5
	AjNH8WKh9cEU/2JckAnS45xoNrK2DgClY9UsXxApALNUb6kSa+VsaFd8NtXrdD5co4SBOmPbVkL
	3H8LakpnYiFkuG4IwgFs18m/3u4cNwu16xfWRdl/8AAXrbTBYa/7j6UnLqODBMQv7L/XS3Ln8C/
	I54S1tx1lPsT2xp61HgcBYhXDQJk0ZyXniq0CT6+3ywbDx2WLvy8Y0VE8XCe7za893DC88Vdxn4
	IAG5846PpkcdYMlslVsLOkqgrWfgMCPMbo6ns3urlrRpQgq5VX+ReA==
X-Google-Smtp-Source: AGHT+IHXcnbWalst4/hE1ZfwwMw+XiyM0HwfWbIZImJe9tYnLocKvZ2N+wRJlZ8k0NpagIhi7EIV1w==
X-Received: by 2002:a17:902:d4c7:b0:223:5c77:7ef1 with SMTP id d9443c01a7336-22e102f33afmr235209025ad.21.1746473349941;
        Mon, 05 May 2025 12:29:09 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151ebc54sm59439335ad.98.2025.05.05.12.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 12:29:09 -0700 (PDT)
Message-ID: <afbc803d-204d-4a99-b7ed-18101e6ff909@linaro.org>
Date: Mon, 5 May 2025 12:29:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 46/48] target/arm/tcg/tlb-insns: compile file twice
 (system, user)
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
 <20250505015223.3895275-47-pierrick.bouvier@linaro.org>
 <b381f802-9eb9-40ee-a7de-f3b5c49abfff@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <b381f802-9eb9-40ee-a7de-f3b5c49abfff@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 4A2ZWutD1yJe

On 5/5/25 11:49 AM, Richard Henderson wrote:
> On 5/4/25 18:52, Pierrick Bouvier wrote:
>> aarch64 specific code is guarded by cpu_isar_feature(aa64*), so it's
>> safe to expose it.
>>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>    target/arm/tcg/tlb-insns.c | 7 -------
>>    target/arm/tcg/meson.build | 3 ++-
>>    2 files changed, 2 insertions(+), 8 deletions(-)
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> In an ideal world, this would only be included within the system build, since all tlb
> flushing insns are privileged.  However, it would appear helper.c needs more cleanup
> before that could happen.
>

I added the ifndef CONFIG_USER_ONLY around define_tlb_insn_regs(cpu) in 
helper.c, which allows to build this tlb-insns only for system.

> 
> r~
