Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp2421704njd;
        Mon, 31 Mar 2025 15:38:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV6N2urvFA80Sy6AfdEWGUHK2FNCDCWHn+eojzDf0YCZlDd2NPt+jFMvrZi0gSbuOUu5Ax92m4TLQCzSg==@linaro.org
X-Received: by 2002:a05:6808:199f:b0:3f8:30c1:ccc6 with SMTP id 5614622812f47-3ff0f4e442fmr5065634b6e.8.1743460694556;
        Mon, 31 Mar 2025 15:38:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743460694; cv=none;
        d=google.com; s=arc-20240605;
        b=cUatDQGBU01lu1u+rI6k+25gQrXuEMPzrpMrcADbLiVpvbH/eIQmsD+4hJZsI7l0L/
         +NyHGwFp8zY+nsUteNrd6ovN0kL4PNv8lyXANBnAiHFtS73X+ftClsratLVbWW5TMfXm
         zDkiAgCDSoFGqRn2KBdhgiCbhA2tvinT29eCJIbWEfjDBxLNBVPZlRDfhjw67ylzfgU6
         1BDVfhMb7UG/DOCCli1c7zSTXUmjdOvviiwIxCMORXYg8D5IvhmtikMaX6KP/0pTyboY
         jVKG4fratrUtFE8HRzVRtQa19GIVbbhgfahYQS2Zxk+sRt2lyeJvxuxTqfobqBzmKNFO
         slbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=JFmeFNv5b+sarSdFqM1KTgUiqCF+rgnpm9YmSX1XlyA=;
        fh=B13PuCtOcwWU7oRALHj4jRGBfPTV+O86r/NEPjFIgY8=;
        b=PqHKjer61w0F+TYDncojlAI7n8jrgxkNAEs45/Ih8hW2M+yvGyDviv4jNzfOGdc6fp
         Lsm2URwZH5JGBjWxWD6PdC1kfh5VnzpmARd1IoAD7PuzrHgRI3qRzzhS1hMr8OFX+77G
         PAnVVYZyW/gTTlHBZTLwbTJMIYNEvZ/VhGRROgDL+M8sm+HNnoLqQFC3Q0ingHu2Dwbg
         is+Q3+FNV2eCL4yrfqgFQFBFpV8RYK1qW0ZLPtq1hKUBJLebjja3CO1oZWvcQ+LW1Kic
         iVsZHTZmPrUwHNCl4dqcT+gryZO0OWBpvy35ssuJX+u/8YS/0mpLkhT+Dc8+a9d/zKhX
         s5BQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h5+xFRj1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5614622812f47-3ff05184205sor1271846b6e.4.2025.03.31.15.38.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 31 Mar 2025 15:38:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h5+xFRj1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743460694; x=1744065494; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JFmeFNv5b+sarSdFqM1KTgUiqCF+rgnpm9YmSX1XlyA=;
        b=h5+xFRj1GxXWyMoERMbdXm7MCBBEA+7+J8vyl2++rfVbhIOZa5W1W84dCJOSM7U1Z7
         rMIPV9wjps0bjqIckJaY+JCqoAGVhu4vjSlVO9qa5zsUs/csswp0YvE+yYN9ezqedj71
         bH2zNs54Kj/EUrFeBIQ1M8oBtkUjLHBuYKiNOgOVm4uScRg4lktnXIPePK6ltLsfzIMe
         o+LOqSS1PiE6sKQTHckGz2enOtondGOddAccf4In1emjsReBxhiTe56n6t7CP6dQTCL0
         nakyFe35L+30AcNx6DHW012TqGWTDbDx+A9aOUWSzfS9ENKNpRUJJkDEW6lf0fBQlQOk
         9guA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743460694; x=1744065494;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JFmeFNv5b+sarSdFqM1KTgUiqCF+rgnpm9YmSX1XlyA=;
        b=XA5anF/7J0BxqWZDJRUwuYXCb0mAyuX3im3IQC9JPhAAyeCRW0sdtd6jFycIx8Wgbm
         PkQHuPi5A4lHd+LYbY+Wlb3Zkz1gRoSpmtLz5j0Fdok+9rRiG3F0dcYNl9+3KOO8g3f+
         MDb/RCNtKfLrvFPrJH5bfWkmGL8buMcwX4QUoftz+UthFJefaUO8+TKZeByluitR6Osq
         a5J+ghgzgKvf3hCIi/OI7RNboZ9Y82Ni2zC/287bpT6hsT/H97NVnOPeaABbODu4khNp
         N17ef1G5xScQq+7ZdZmJC36S+l4e7jPAU32E+WLZFUtO/laaxDhT2TsIaZM31dkDJgw7
         TV0A==
X-Forwarded-Encrypted: i=1; AJvYcCUjslshR8wogbSbv8fvgCt6kE5j/lo8xX/nQ4XTQXmQdNhH6zrYlLmNwGahUd4KPq5TggF3FgCarpUfRA==@linaro.org
X-Gm-Message-State: AOJu0YwrSVUtpdV1Kdr3cy5wGssofFZskDIjuJggD4DWr/Bstf/W1Hl+
	/7AD9at/sfUXyoZ8BupjUwJkjFu/w8rZIjLLgaSmPv7XT3+/G1xFqAmBXKNRkXKL8A==
X-Gm-Gg: ASbGncu7VJTCm0SaUIsbLIaLafB3/ZeLH4jv1lnNUdXWV+Sk4hxpcbwaoA7rPrGmC/G
	/Zh7f3lPXcVLI2CNWaoh4EDRB9/R0GwS3tf97VxlvU6VK/mNSp2JWElO3OD/k1JAsUS3sMcDHB6
	wT8lGYCyt6GAnRnNBGU+Gi8+a1AJjB5RmQtri8sbjUn7i06VlXOaT14hEcrHWtHSGJaYp0TqFYQ
	yCUFPaYUBrOz08ZaqoXWtk86qC3d+lSxq3BDpxJk4NXzJvcFS385Y0xMImaL05N5sdUvQVf1AtI
	UxzmWy0BvEm+WvMPPViOwREFLN3op81phMCKprw5paRTSEyjP03t2pVMnsZUDnQLt5CwJNk8Ktn
	KnzPtgTj8JO3eaFRZfUGI6A==
X-Google-Smtp-Source: AGHT+IFp4S0sxIEStKUL2jwfRULRLxxT9HOP1p+IccXKEUBs1mtFo8GXdZCPU0pP0z9l1XZXK8r0rg==
X-Received: by 2002:a05:6830:6105:b0:72b:9e3b:82bc with SMTP id 46e09a7af769-72c637a4ccamr6064468a34.11.1743460693940;
        Mon, 31 Mar 2025 15:38:13 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [172.20.102.85] (syn-071-042-197-003.biz.spectrum.com. [71.42.197.3])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72c5828ae93sm1634203a34.63.2025.03.31.15.38.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 15:38:13 -0700 (PDT)
Message-ID: <22353929-7c53-4c96-b751-90cbaff82d7c@linaro.org>
Date: Mon, 31 Mar 2025 17:38:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/29] single-binary: start make hw/arm/ common
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 kvm@vger.kernel.org, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: gQNLXmEAQuWO

On 3/24/25 23:58, Pierrick Bouvier wrote:
> This series focuses on removing compilation units duplication in hw/arm. We
> start with this architecture because it should not be too hard to transform it,
> and should give us some good hints on the difficulties we'll meet later.
> 
> We first start by making changes in global headers to be able to not rely on
> specific target defines. In particular, we completely remove cpu-all.h.
> We then focus on removing those defines from target/arm/cpu.h.
> 
>  From there, we modify build system to create a new hw common library (per base
> architecture, "arm" in this case), instead of compiling the same files for every
> target.
> 
> Finally, we can declare hw/arm/boot.c, and most of the boards as common as a
> first step for this part.
> 
> - Based-on:20250317183417.285700-1-pierrick.bouvier@linaro.org
> ("[PATCH v6 00/18] make system memory API available for common code")
> https://lore.kernel.org/qemu-devel/20250317183417.285700-1-pierrick.bouvier@linaro.org/
> - Based-on:20250318213209.2579218-1-richard.henderson@linaro.org
> ("[PATCH v2 00/42] accel/tcg, codebase: Build once patches")
> https://lore.kernel.org/qemu-devel/20250318213209.2579218-1-richard.henderson@linaro.org
> 
> v2:
> - rebase on top of Richard series
> - add target include in hw_common lib
> - hw_common_lib uses -DCOMPILE_SYSTEM_VS_USER introduced by Richard series
> - remove cpu-all header
> - remove BSWAP_NEEDED define
> - new tlb-flags header
> - Cleanup i386 KVM_HAVE_MCE_INJECTION definition + move KVM_HAVE_MCE_INJECTION
> - remove comment about cs_base in target/arm/cpu.h
> - updated commit message about registers visibility between aarch32/aarch64
> - tried remove ifdefs in target/arm/helper.c but this resulted in more a ugly
>    result. So just comment calls for now, as we'll clean this file later.
> - make most of the boards in hw/arm common
> 
> v3:
> - rebase on top of Richard series and master
> - BSWAP_NEEDED commit was already merged
> - Update description for commits removing kvm related headers

Thanks.  Queued to tcg-next.

r~
