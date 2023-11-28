Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp1901834ejt;
        Tue, 28 Nov 2023 06:03:36 -0800 (PST)
X-Received: by 2002:a05:6830:719c:b0:6d8:1a5a:c8c1 with SMTP id el28-20020a056830719c00b006d81a5ac8c1mr6003990otb.10.1701180216044;
        Tue, 28 Nov 2023 06:03:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701180216; cv=none;
        d=google.com; s=arc-20160816;
        b=r2OjzzA+ht4r6cOHCxxj6v9jV4dsdy8vptJ98X4yytcTnLh1oEc9KuZq7mKWZ6z41g
         JCDqpfxjBe0t8SLJfzqsoBnYyZQXR2Et60pofE4ZKpBLzr/Bzxa5EtJVYE2da3U9qPOh
         zM61+vYOX1MM1E+9thWgRRz9OfDOmp16bxXqpCszLO0t3vGKgIGoRZhayLPqo6Pif/x6
         bOjOUXcACGAWbJMpE/ApMFq/QjEbMLk9kGKcvu7Oh5OtPqdumq94xY8Tj4d7fshlzWoa
         BEV0FEtFUF6zibtZ1ZW0JADE2JmkzX4K/nJR2VttoGYxX0e3dbHfGoAXUV0fMgVKSGw+
         UOFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=RAKgJw6UMC42KF6dxleVMJZB/VCBDYG7XXv4s7ycYDI=;
        fh=j47SlpSDusZ2mmWrSbVW2DB7/ZZUDU/502C3FK4P+uA=;
        b=eCvjdW9pOWZ7QB8KIdpstPvXt3kWk7cAgZSbKrdqkPV//vVhOCl8Z2pFvU66FGd4g5
         44rbBnKGOwDWmvvNRogXFhve6ayJGP+Ublgbixw1yBvWJW++JtvWOD5cq6Eqj7ulewh9
         AZN3HeS7QkRxNr6Nk99UBWUiQ5xJsWXF3trZLmavuYqEmh75ktpi344TkI52Xmt+hgkK
         LZaeMMm3OZVIL2tFIEcHy6ICHuvNGEC2lq0v9nrmEHe8FmMKZqaN1Q3GapBSnSDXnipl
         SrVRIwxKISTl9w+eIwaId2bveq6BSB/fK5/+L0uzR1QzR72NzgWa5Tp5BmtP3ZLIfKr4
         qYQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AVcdHZ2Q;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ba31-20020a056830461f00b006ce4bf4b26dsor3196248otb.10.2023.11.28.06.03.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Nov 2023 06:03:36 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AVcdHZ2Q;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701180215; x=1701785015; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RAKgJw6UMC42KF6dxleVMJZB/VCBDYG7XXv4s7ycYDI=;
        b=AVcdHZ2Q86bYwCFPP5xBFwVKPtu6UM9c4mI3Xf36+tfJY3yTFiwehPdAtJCzmggtAU
         bh/QdMGPsgRqkc3LihCCFH/ZovjPd1jRaXmc+m/979VK96zz89k+TdDFA6Q6zb2HfjNM
         2OfLeLLRrEOjxhsEtkYVoPrj9aiLVj9tAn5i3yggM2PV9KkRAkfnN7804f8696xxLVhZ
         U8E7x8QPbx9ztc3uA6YStr/ZEXIOBsW60kFSsbxz7ovKSFrXKAoTXcnOhrN5iJVzQXer
         NvpsxHXji7/KYg0EniPPR+yk1WfTlOttwIL/Wnv2gloA5qey4BcZdhcieGuFlAS5mAL4
         Qi9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701180215; x=1701785015;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RAKgJw6UMC42KF6dxleVMJZB/VCBDYG7XXv4s7ycYDI=;
        b=NBZ77HjoQl5NqEv1A61ZAAJrHKAF4c69vpU063PbrM/w+UnyafnDjbP/Nebos8fCmk
         zDEKHiXKcnYfpNf8EmtOlJenLY87jYE95LrnrqXnYM4NK6OvEr5jP5kRWeQ2/euYfJQk
         W1sL8TIW/kI99V6Y/odF7Dm7sM/PvF4Z+M9lISdhBXxUYPg3gu+AVbYBAKFeH8PeqJo3
         qySbDQJ3VGHyh+Yddsaefdnpob+k7KorixisflsXrvYmZpw45ldN3A57D8XYH75TtUxD
         JIyiEKdxdYTQjgGjzECNzZM5OpjzwFuqfQhmycWw1gqwU3FWKZV/S0hBB7bIcwpJyplm
         aw+Q==
X-Gm-Message-State: AOJu0YykxbwWH15umw9RXXwNOj9xIdEG5pC0EaH348QWd/FQYB+14TI2
	r0cBovRSbjD+KNMFkK5W8pTi5MAE
X-Google-Smtp-Source: AGHT+IEQoAKmEKLWKEvb7FD5meJQC4R5kWjcZM7Vrjvm03F2PyVt4uQqAw67wf2Z7rJIdGVwayut+g==
X-Received: by 2002:a05:6870:d3cd:b0:1e9:7912:3bd9 with SMTP id l13-20020a056870d3cd00b001e979123bd9mr8775761oag.9.1701180215233;
        Tue, 28 Nov 2023 06:03:35 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [172.20.7.39] ([187.217.227.247])
        by smtp.gmail.com with ESMTPSA id ny13-20020a056871750d00b001fa1350df8esm2068309oac.2.2023.11.28.06.03.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 06:03:34 -0800 (PST)
Message-ID: <6d956240-6072-4dbe-b537-a0415cbe952f@linaro.org>
Date: Tue, 28 Nov 2023 08:03:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 06/11] hw/arm/bcm2836: Simplify use of
 'reset-cbar' property
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20231122183048.17150-1-philmd@linaro.org>
 <20231122183048.17150-7-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231122183048.17150-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: WSY9uKbfAl88

On 11/22/23 12:30, Philippe Mathieu-Daudé wrote:
> bcm2836_realize() is called by
> 
>   - bcm2836_class_init() which sets:
> 
>      bc->cpu_type = ARM_CPU_TYPE_NAME("cortex-a7")
> 
>   - bcm2837_class_init() which sets:
> 
>      bc->cpu_type = ARM_CPU_TYPE_NAME("cortex-a53")
> 
> Both Cortex-A7 / A53 have the ARM_FEATURE_CBAR set. If it isn't,
> then this is a programming error: use &error_abort.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
