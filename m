Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2066648njk;
        Sun, 26 Jan 2025 12:00:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV6bW1fQW9RYsJSyZEvoB/KjXhNOZOJFQu0K23iV0hxZAxy78RjtpZj6ulqfl4+rLiJdvk93gMmt6HvXw==@linaro.org
X-Received: by 2002:a17:903:94b:b0:215:b18d:ca with SMTP id d9443c01a7336-21da4a9d41amr169220845ad.18.1737921622785;
        Sun, 26 Jan 2025 12:00:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737921622; cv=none;
        d=google.com; s=arc-20240605;
        b=VTT7SNd+wF9UkfBQf5buaUFNeULK2I2I+E1nxTW+7OPZNanyZltkvpiU7Hl9ckC0ri
         YOz19k649dKl4Fqm2TEhUMENn+Vtq9zAaIyx/CGL4ZNcOImOliagmBVKRWpC5lv9iKfN
         PJu/fRJXE5HkZnLSld2imBXzBVjTcRrGA8yzT1o8eUVGtHuCn6jTaD96/pp/3NWeGh1k
         AL2awIlqDJFEjwFMjG9PHC0op+Wyf2DfARKyyysuXaM5xFg4I31i0/JCIU8WSCf0ZRMX
         Ed9pbJaN24XRURu3p1bxusDGlYYJNQ/Je4ncekzHTJQtRLZCFk3yRrlA5CvmbOnZn4NK
         ejkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=r4XT8sSxnuMIL4fpPA4fND9osMVr0JW6MvSO5af0S0M=;
        fh=vUh6DAUY6s4PFC2K1/zjW6kaf9n3iu0ETx8FdP8jghk=;
        b=hHf8Qmyi1yEmlU6+itmatBm4UcEe6F/XzV37+Vw9ooWzQ8D2EEZbh1npIxy4KP+nK3
         fVNkK3NPz2dox3mBT0bk/tn03EiOID78EXPKeaMYqn45B0YeMWfdr6Une7KH9ds/+EWH
         cprhpdm7h4ij8PbLkDe3m367o2kq3GFLaysNtpgBOcHR1SJ8OFjEz0lfH8CanCZZPLok
         pegaws0Hq1D9Rk9eQOJgx2A+aW6OWUYUJIS9iiJq8eMMJf3mUMpLC5jWRuQoH7SmclYT
         UYLiL1vdWpxgg+YFYKVqHt3sv97BPECysQZtPm5JDF4mYyQ37dd34XQxUoGbKYpcMTFg
         LCEQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SDA3BOME;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-21da3d9e734sor31429005ad.1.2025.01.26.12.00.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 26 Jan 2025 12:00:22 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SDA3BOME;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737921622; x=1738526422; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r4XT8sSxnuMIL4fpPA4fND9osMVr0JW6MvSO5af0S0M=;
        b=SDA3BOMEX06pJ4R45CaexbnmPZL5eZCXCuHBZHShmQdn0BamPacd2O0ZS6EnlYuixr
         xL2R5Mq1yUmk7IPVH2SVmNrux0RI5fmofdmonC6QQ01mNbDJwJ1TOQs96dvmz76MxmxR
         4wLTOP6RvHuW+KVCqInh5eStTKVyuD4g7X51cy9EfLOLU69SYlvYRSPdw79ZA9NPjLEG
         ZUxFbtibJDxSQFZGp7HQbYXMslCj+/qEV/qDf938R7DaAStSt9mjAWDHVKV+K1Vt+qk+
         z+z8tharb6YvDFu3OMSWYRskZZaIBYhWXeuCLGBVsxdN6/OUAu4ZYmNdQrd29X1rKCx8
         05bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737921622; x=1738526422;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r4XT8sSxnuMIL4fpPA4fND9osMVr0JW6MvSO5af0S0M=;
        b=eFO6iXLqXxV15SwvcJzP/5frmkoio3RQuUMlw1obwYJ3xnczkLoW4ZVhDh7isECFmt
         3r4btsQs7pJZF/Ac7xMV7wEnv3kqTJX3pd/TRRxywcLQ0/3iVBv9p7/ysBrjf03PXic4
         +XvgmDKzaA7oc5DHIBkxfJ+2yX9Uewd8PqA0ACVxGWbE+TAPPh8vzMAsx7Ew5xcBhjMI
         FJS+TUH3d7oo3/uYT1uvjvyJTN2/CFRvzpifVaJlo27QTi8tPaxoV0uYLdIvtNTLGjdx
         5TJ/5360iiFG3aDx2Uu+H3iku8A8RjeOnv0VHhxQepTyoS5S8ljgSVVRMRf9fh4X65sm
         xIiQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1SDulsNWSN6GogKxcNaawST3jUVHUJOoQr8VBARxQ/fC+bGitB4k/yfpOjacQiMakH/7h3gkx4AtXNg==@linaro.org
X-Gm-Message-State: AOJu0YzlrZaLOEIPIvaShQuqNlzRuwsT0LSK2gdPEjO8OsAC2G1JoYNL
	LY4HsVCrdnljH1FqZXP9NZzuPMypY5Y3SqXBSSEI0cGZYahuLQHtsDEjtigVZrzyCw==
X-Gm-Gg: ASbGncvAwDgPYkmLT6kqYhq0sWLobVkRfqRhVrMtEkMf5fe7AoXixTBPLUGdfFp+slL
	rWvlAJdl60rcU1raMc+vXGyIRgHyPH/Gvg49hGx1sqKEY4Hqwn67EKeVeqTdb+ispNvroBKSXE7
	JkPeGK8uryUwU6/upx/wGXbKMO+KJWjFBmPYZrlMovft5meLUYPR0TvNEGV5uEupN6EMF/PSxKO
	53dnJ/CjZYvQp5GVNFNUoaLOPTW7vw8DJ19gmxbYf3IrhUxKcDyyDxt1zchcnLKYMKP2gGwJhOE
	pvmwpqNyeynTM9wVoiGbJB7jrlMouScbpdWNQl8ifBE/1GQ=
X-Google-Smtp-Source: AGHT+IFeEZa5nVv+mtwIu6A9hZNGU86wznbWhD1KnBdApuLwR5PvKTBdXCajk9Qtynkb/fqX/bwRng==
X-Received: by 2002:a17:903:124b:b0:215:98e7:9b1 with SMTP id d9443c01a7336-21d993177a2mr227130405ad.5.1737921622320;
        Sun, 26 Jan 2025 12:00:22 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3d9e083sm49207555ad.25.2025.01.26.12.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jan 2025 12:00:21 -0800 (PST)
Message-ID: <bb022c56-2ec9-4e76-9bc6-efe2f7272806@linaro.org>
Date: Sun, 26 Jan 2025 12:00:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/20] accel/kvm: Remove unused 'system/cpus.h' header in
 kvm-cpus.h
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-7-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Knw2B3gZ9jV2

On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
> Missed in commit b86f59c7155 ("accel: replace struct CpusAccel
> with AccelOpsClass") which removed the single CpusAccel use.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   accel/kvm/kvm-cpus.h | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/accel/kvm/kvm-cpus.h b/accel/kvm/kvm-cpus.h
> index b5435286e42..688511151c8 100644
> --- a/accel/kvm/kvm-cpus.h
> +++ b/accel/kvm/kvm-cpus.h
> @@ -10,8 +10,6 @@
>   #ifndef KVM_CPUS_H
>   #define KVM_CPUS_H
>   
> -#include "system/cpus.h"
> -
>   int kvm_init_vcpu(CPUState *cpu, Error **errp);
>   int kvm_cpu_exec(CPUState *cpu);
>   void kvm_destroy_vcpu(CPUState *cpu);

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
