Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp370002ejd;
        Tue, 16 Apr 2024 06:27:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVr6yeNJnEHWyme7BC0VBcFVvf4NYRWWYnVFxNq/uib0L/GYXcCKzi4ecKHMfrG53CM15KfPkEo5XVAYeHaqKIHG8qnX0g+
X-Received: by 2002:a5d:598c:0:b0:346:88ee:2a2d with SMTP id n12-20020a5d598c000000b0034688ee2a2dmr10182308wri.5.1713274063090;
        Tue, 16 Apr 2024 06:27:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713274063; cv=none;
        d=google.com; s=arc-20160816;
        b=YEPypM5UwbDy3L6toKXuyIDODt/XNTDJQj38T/3/MekSyjl7e+o5w0/oQ2qgFPSdQo
         Yxr8V1pT1MNeJXYm8NHnfP8R0QChaubt1Opn+IjH+ChraAQXybnyFWGfzv7RhaDQMFTe
         d+cXWJka693ExbEwtHq57WwUpONUXr4BXSsuPcrN3J4pBKgELlS0tStKaSkVTLf4f1zt
         OlOXifXNlxWDpKf/y1KBZlN7CFfs1f85DfxH27zJJmtE6q0elCOBnLnX/EcvqvpR1zg2
         iE066saEOUlFf/jm66451Ja7iEhctGFKS3ExJbJV2bRUCF13ZjHVCS1rBAxx5KrIatkW
         XTBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=71c8OjkgCUu4ZSWRvMisJgjPpiIGyKO/sFHZngoHC0M=;
        fh=hQN5DDx6S9M8vGv/+8CJo+MAJYqW/PaQQxoAMHvtAgM=;
        b=u+OD8iZ/55LtyeWnn7DUcyaKlomaa0PKL+qZ91gkNrd0cN0/GitL9RPC3VPLOVngrI
         SZpCAQo0UkMM/WZG3ZGF23vWLOFTV0ivYnrIIoiGBDTGS3zRRrv2wPr+syXiP7k8KD0U
         2nb87/79HL+HJfcpqyTXeC2QuS0JpGKHZdxj3682dgCOgLCcXtM9NBVluCB5qFThfuUB
         bLajmkp85ylROfStxjobAtu1ZUOsAxg+V5PHRgpLE23j59HSeYqXc8MXGlhU+xsw42O1
         RLq6CmWk0GF+lvEu5cilBbjKVFg+zVoaEDvCjHzzHb+0Tl9Ji2oGAZCgAWoU2RBN/Tx2
         F9oQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NYMces68;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f8-20020adff588000000b00345513e9209sor3052790wro.1.2024.04.16.06.27.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Apr 2024 06:27:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NYMces68;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713274063; x=1713878863; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=71c8OjkgCUu4ZSWRvMisJgjPpiIGyKO/sFHZngoHC0M=;
        b=NYMces68VrHqgC6pxeZUBrwzFHymqXYYRFWOjsBT+ZdEE7PZnfq6DWfINfBnjUUC71
         pHFFCrN6As4IDYZUQD3IuZmiL2dYWPkNAehVCIaXa0Z6QBL4CpxRQvOyibrJ3evQ1ICD
         u07Lc2we+LoT83Qeeipa1a5x7WA8JhLnMmp3RFmOVpgW+lA5T1OpbYWNl4MlxBQtJQNM
         O/4HzNrNdQiNJfnvRuv68b543qSjLtZdNSVWdtsiWryTXm8hBBpro9dcRxdCi09yIZJ2
         mKvPTk64Ll5Itk2lDu5U/B6w2l74NuAPcNMrX6WK7QmGDQ6S5ws8lIiYOGGDQqZU70Sx
         y0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713274063; x=1713878863;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=71c8OjkgCUu4ZSWRvMisJgjPpiIGyKO/sFHZngoHC0M=;
        b=Wg3a4NcYkEdt+gU8h1ZC6UA4o6K47UxfDzNz7Vu8zrqR2eP3SbRfvqanXEkQxqZmUT
         KgUlqCJ5eGg4mPnJ1S7x80A1QYe8ek+BbYXZ5tzghNXxuOfmsq9ClHXkcdv2Za11eP7t
         xJ0U6fePD3QApXWztTYXtM8xmkGJEziN9gjVEIrrfEj/g5gXx7+y7daTLpB6q93eMWF6
         5P9+2rMKceQVu3Ogab6AdjshZMPBAhf8RM1lYdKzBVAC+nMTuRcj2VcSuQL3JldRaM01
         NEdvKmDN58Rt07REksfJdYCYPGvcAcIFfmoVWWu25I9QP3gax/Tintk3yrrbg///0aP6
         p7yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGmz1A1eZ0zrAF3rZ5M6i3J2EIwIEvu8qqsMSav5UtJY+Z1SKIGT/IiUAzP6J33QG0XliYzFt3/CkEZBXt5FJ98r2I3XmW
X-Gm-Message-State: AOJu0YxklLKf4zf3xIM+M0kfoC/DOLYDUU0tl6Z3AkuwcQwB5dSHKMnd
	SE/VBekYFZTsbgqGRlB4i/zciNhomGErhpPwCd7nUhw7Zz8cmrdf7MVFHvB6p/a+9w==
X-Google-Smtp-Source: AGHT+IEx3JNEgoaShj8aRfTLRoMrCLD5yzuDa6ZnO0ahe98z9ikYfkr64szIP7s+ZO6HghdpssVqQQ==
X-Received: by 2002:a05:6000:d82:b0:33e:69a8:fe85 with SMTP id dv2-20020a0560000d8200b0033e69a8fe85mr8337230wrb.37.1713274062709;
        Tue, 16 Apr 2024 06:27:42 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.155.61])
        by smtp.gmail.com with ESMTPSA id l8-20020a5d4808000000b0034599eca6c9sm14793467wrq.41.2024.04.16.06.27.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Apr 2024 06:27:42 -0700 (PDT)
Message-ID: <a9aa4a44-df6c-4f3f-8f64-f901ab2d89e4@linaro.org>
Date: Tue, 16 Apr 2024 15:27:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.1 v2 0/3] exec: Rename NEED_CPU_H ->
 COMPILING_PER_TARGET
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20240322161439.6448-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240322161439.6448-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 3Zx+ZFlEynyg

On 22/3/24 17:14, Philippe Mathieu-Daudé wrote:

> 'NEED_CPU_H' guard target-specific code.
> Clarify by renaming as COMPILING_PER_TARGET.
> 
> Philippe Mathieu-Daudé (3):
>    gdbstub: Simplify #ifdef'ry in helpers.h
>    hw/core: Remove check on NEED_CPU_H in tcg-cpu-ops.h
>    exec: Rename NEED_CPU_H -> COMPILING_PER_TARGET

Series queued via hw-misc tree, thanks.
