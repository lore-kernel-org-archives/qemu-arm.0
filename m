Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp542350njc;
        Fri, 21 Mar 2025 12:27:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXyhz44YPt1TZ7ulyckgGHQbWjoKolf/vO9OnSrNco3gZcUP5k8aaWYP5dQOuq2xvOV2kgxkM9JYYUlxw==@linaro.org
X-Received: by 2002:a17:903:46c5:b0:224:a74:28d2 with SMTP id d9443c01a7336-22780d8aad0mr75810175ad.26.1742585257587;
        Fri, 21 Mar 2025 12:27:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742585257; cv=none;
        d=google.com; s=arc-20240605;
        b=Thwdbjyy0vmzuFAv1LgFlb/bWkncokg58UjZCFAGKHyxOsYi9/olJuEPGvFWX2Owa4
         jLnQx15N6nKmtNaoWUqikjdmRWmRnxZxIkZxjM26/JnTN2glkTSBFKC/ng3/JqnC7G0A
         35Fnkh4NZhmJ2tHy9Prhwd7C1xBcZKdkwT8YiC7rpVJgSq8CnjgfCzoBn+Gz8kjNvB/R
         eQhmYdruArfxBIUOrIIX3pE5JtaADdazeaSnXRa9JxsnBevFWNQEj1J/CoGJIhCNjgGv
         peGuptdscYzVvw6gX93O3mrLtb9BxPSbSTi4sDnBbB9QKlZPDLZXzg2eWo4PZHm6fjpP
         lntA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=+BD4Q0d2ARlbHpJDDpX2hvCogsjsARu368abJg8rMPA=;
        fh=V/AA0OoiNdEUycDRt/JM0Hug4o/b47H5UzJZAWW4DXQ=;
        b=DEutQIvgK8eoc3CV5SFqhsQWy2Tv/pFJU9j+mprj4a8NpLoVRGFG0NzwMwiRjKINZT
         Ca5GRfYncdf/fxMRodUlDcpuObFfSu8uux/BhKw3C+IGHPz9NU5ZGWjEwKDPtzI/X7Yd
         edMwajymLc1c/FJze7jBVEMwOITO5pRxcozMUkPqjSUl98vOSVd2S3HjbMGOStRvRO87
         jDoSOtED45h1wNWcuBDq9h0ahSIoASeW83qO3g7d60rfTEAn44Gq4Bffjlm7aqRZgyZ7
         hTajqcuf07pk7ZvjYdQOLKuI48IQXD1A3dBHxVZYKFf+lNwYP5kA53vj3I45af7Y7tYA
         GEmg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NAD1Yx46;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780f3b419sor16785615ad.1.2025.03.21.12.27.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 21 Mar 2025 12:27:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NAD1Yx46;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742585257; x=1743190057; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+BD4Q0d2ARlbHpJDDpX2hvCogsjsARu368abJg8rMPA=;
        b=NAD1Yx462eX2HOkKy4xDHOrek/az7Q69xxhy5/Uy2crMMsTYvUJqb/t6KteMoLCpa+
         ACT4DiX2ND2A/i9AWOFgX220anf5/QdcLZ19CSAwKF7gfCIwOBeTqRuoaIYjlqkD/Hja
         EGElNvodPNI8JGabGRqTA3h/mM19msEfHX54yMhOZVVw6w0YmC3UTT4ra7frwlAPimMV
         BJi80s3jjzLwIhftkO6ty7Tl3GQ7WHtdTdn8JbCLJoZlAJfeF/qW9paaVdJAfAavvDv/
         FcATfpi2WgSvP3jEYbmTMyrD6kTi+N1ehu67ZeyXdNdqCElAnrqj9WDwvOPvdkPVmjar
         JiWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742585257; x=1743190057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+BD4Q0d2ARlbHpJDDpX2hvCogsjsARu368abJg8rMPA=;
        b=SQtpYplEEbxw+j3C9OoiI4dx4y61XrCq68zo3UT/mi4qG/59yOKK7hGDU3pwkoQcop
         flGy9fpd5ROvx2vvxvTciwAt/R9VOISmD+2gBEcsfirp9qc4Q/HWujhW9FyGuPXNsAmt
         dbGvv0PFvm+qqZkQ5DovTCSjFB6e8+wt7zpbyEeefZzAR2dbvS8MmqyjVbdp/e15v8qj
         jPjjxp/MxXFT49rA1+12WrDyRV1xDeiX1jpzZj+mHTruQzt3jo3Q8TD7RQ7qTfibVvnD
         hODdpCRPoC47fu6COaVatweoXzqCko4CX8I+WKwLaXygGrhvL+3lvZ1CPhMKj05dqSfQ
         CAgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZKuqmvqZ8Dw4DrpOc4iZuwYijLYltu0wMEvmr4a0sC3kwoLjiZ6eEBKrmpUwmLehq2VPX6w66Qdwt2w==@linaro.org
X-Gm-Message-State: AOJu0Yza/mtUaFrVxDmTL0zXs4J01P84DsOkuDREJZRfnCiaMM+PsWOb
	KeH8hSEh0E2zhZcBXdzc1vYVfexJTLmzc7omL14BCNXFnYhq34SZnZhUDhMyobhyJw==
X-Gm-Gg: ASbGnctDbgWrQX1Zi/YVS9YgdeS+DNMmdUqvTiJwlTw0wvWCi8Q7wjKgAzYv3rzlPUC
	DpWqr/KncGGoaKhAPbPa+oSnho0ucfywTa8zCwzmsygW5uRy2Bk/t2hJxOMzx7/YU5PmOBpFcnj
	XKcI+/OL8pGpIdcNDvOiZCMJPGTPZrnaMHU5Fsd7PbDlg7X6bdPZM0GJ1EF6hShOt+jaEEYjHqi
	2jVvav8L7XSJBOLh9I5Vu4u4j5lfDdEC6ZPXqceIHjA8DfUckk/YTcaoFU/aDh0VABvXJcUnBST
	B5l39SaStOO64VRUbHWN8OCNOJY4U9YCHv1iahu2MOUsBedzDN2U1/Ia8iDurzCAApfu+pxq+xz
	0Srw+mn1r
X-Google-Smtp-Source: AGHT+IGdwHtiK8kjlifCbPq40icJnn3e6WLjtJ4qO1xsRZRyjHJoCQKmv47WszcOxwOHmSQmmthTsA==
X-Received: by 2002:a17:902:e88e:b0:223:3bf6:7e64 with SMTP id d9443c01a7336-22780d8a93dmr69838655ad.24.1742585257089;
        Fri, 21 Mar 2025 12:27:37 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f3974dsm21319225ad.7.2025.03.21.12.27.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 12:27:36 -0700 (PDT)
Message-ID: <a67d17bb-e0dc-4767-8a43-8f057db70c71@linaro.org>
Date: Fri, 21 Mar 2025 12:27:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/30] exec/target_page: runtime defintion for
 TARGET_PAGE_BITS_MIN
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-18-pierrick.bouvier@linaro.org>
 <2e667bb0-7357-4caf-ab60-4e57aabdceeb@linaro.org>
 <e738b8b8-e06f-48d0-845e-f263adb3dee5@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <e738b8b8-e06f-48d0-845e-f263adb3dee5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 44wRYQqGLm3o

On 3/21/25 11:09, Pierrick Bouvier wrote:
>> Mmm, ok I guess.  Yesterday I would have suggested merging this with page-vary.h, but
>> today I'm actively working on making TARGET_PAGE_BITS_MIN a global constant.
>>
> 
> When you mention this, do you mean "constant accross all architectures", or a global 
> (const) variable vs having a function call?
The first -- constant across all architectures.


r~
