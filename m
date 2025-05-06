Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp3156131njj;
        Tue, 6 May 2025 07:24:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUutav/qtyXQKkgew2n2Wq35kIHSh42l6cn1q+ADY5rNuP6IaBkxrKc+zTwHvbEsXzO/1CGGOyRXrpdgA==@linaro.org
X-Received: by 2002:a17:903:22c7:b0:225:abd2:5e39 with SMTP id d9443c01a7336-22e3633a6abmr41209195ad.30.1746541462866;
        Tue, 06 May 2025 07:24:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746541462; cv=none;
        d=google.com; s=arc-20240605;
        b=TpBjr6c+nvdehzGWo7y05fT/E5sZ7xhyloiCEnpDJpT1P5E4OIrVH9kr+o6NMSBi3a
         Zs0GxHHXPLGRiowr3/1Y7o/AkAdGV99rjJNnTH5itkEnzwnc/VFKdZ/UAMtudRyWzUvV
         JoRlvT4uhmr9P5Oma7ydtVL7Qzr/Az0aq/PQFEADh6DKJhQl2gbANtHTF8K98FDxcn4K
         hwNnFf/PcIfrLYe/t/O5Ow7LnB4pLgoBC2E2q7F5lhXp8TSVAK41O/puEbnlPIlIz4Lr
         hvDrbWeP+XL4VzNsM9FsXjxLF8wYPdunvuqNyrNPHIGuXCZXlKZhntXdA/LAvWrJPsjp
         kUBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Wp48SLQzCDDOEhX90luVeiVR92Yj3/LBSHBEPyNAS4c=;
        fh=HmxOFpretPsBQbfxsRmfvCUehzl1BgXPhbXeNaxn0xE=;
        b=W+QU5JIhBWfIhEBU7mYNxawIycrGMJnyELHGAi48nwq37i+ND/QI+1ffq6uXgBYmds
         wBqw928RCsrRroeBUo5yky9ujIPFtmh7B3ktNIlnTJ2ZButgAUOWl3v9ZSJmkZtwikzL
         Cqw8NUOZMyczWdC1jn28QWFdz0Zm9QjK/RWs36VoQwjgtqA9Lk0Uc3uf5hbRfOcjmvBP
         cMADbFmsGz/cK9sHagUflTMtV9gD2XBuTXYZryBpe4LoeatlVLr1xrVabFI13Ssoh/UK
         wKNhDcDj+Qyy/s32jzOYX1/iIIJLlntFh04gctNbmsPWddRS4ats6NUwP1uJF1pfpjo2
         NjHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mWE6Z2Xa;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e5af75868sor524135ad.0.2025.05.06.07.24.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 06 May 2025 07:24:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mWE6Z2Xa;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746541462; x=1747146262; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wp48SLQzCDDOEhX90luVeiVR92Yj3/LBSHBEPyNAS4c=;
        b=mWE6Z2XaALf03tmCndZjl1NhjY8vvMbkWppPm/Xy3h6fH0BtoVnHAmndLLE+yIV90/
         qE5yPsf9JXoysJFT3UE/hcpWO7Ijcysqsux6O+dl+JRoquLKOkiRwO2X8bWFExLJGh/T
         PSxxTNQic9SbBSg4S/JKNRgndNX8TMFytgFrPkDuxr4xMOeiMZs2/p8PdOHEFsob/oxv
         VAvFudveKCy7zL8iqJZWhRMg+At7ZocroNhVTfOZHCVWla7vjc+VJYIOoMb2mom++Hnz
         Wo/kQUOB7C1Xi/hPLjQColpei8xA0mBewX8rNyqMvSDZKWLF2DnGHpjQZp116ui0C7zy
         6iOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746541462; x=1747146262;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wp48SLQzCDDOEhX90luVeiVR92Yj3/LBSHBEPyNAS4c=;
        b=QG6b62BmVFJiWBHuCnFZIOdNFDyoGBCK7+DBj6VEu0W11sTyME3nHA+eLRB2ZZpkmp
         96txhQstyfVxrd4CoaACj8betXXRDnsxdUfmh+lsYcUQLyko8qdv6zzCnOaCm9KiZpLf
         z/WWqG4HOZH/lhqpE7YjNeU3fGhpOYJBAxOCxvXP0gTdp3er8gKRWdqZl7VtKn91UjLG
         Jke9S/MRGaFUVYFZ6gw59Bo2VlFpECGdldVuyMVK6lbcdaM3QCPkjrBuuKmDSpYN3Few
         QTOooYLFqK+3lQOI6FvuZLL4tdsgnv9PmnWBKt+mvd/n3idY20CS1fvl35jGyUJxnEhA
         roNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsSIGtGVXJ0VLif8LA+575uLWlQPgsdCDrJKVZf4WHrv1xUMVi33+jy+XADlpLs5lVE191mhAKf3IekA==@linaro.org
X-Gm-Message-State: AOJu0Yz1QqYvRninuPsg2Sh107ft1Fx5nE2IhbcSMYooNvqdkKK5wDlE
	UgPim1xbzoxj46C2G5hUMLQlKl/bL+ESM/KQs8A0GPFl57L2uqRnC7Djy18/inhKig==
X-Gm-Gg: ASbGncuVRKi2gSHZN5ZgrNwTHWZrmqs8LfOUj64XO71N5s7y0eckucx9iX9JYN4iADF
	BAfg/Yjgp+h8njNwCQTQAs5TBSgC5JXUNi+UW5CktijT2g+e860U4fCKlBw03JUmB9VCzGyVweM
	xEDg6i/NVQhfLlOZLT3pXuCgyA3J9oYzXawQMkqghTEjplQEoYx4jZjBdBJGxxTqlcohJWCZU+D
	VpdJ51VaMAdSia7ezXLQKM4JLucSLpXokQKohInRbFT1UCcNJZgjnJd238D5jDDm0NmhSVc2EuI
	lGJO0Rv3xMCViLM7tuxlD3z5GSSf1H6qCGU5al43tkglqkMtem3jRktzQ0Gbv5PzG+EFpfbPTdq
	DEk28dEA=
X-Google-Smtp-Source: AGHT+IG+1RetG7RJ3eDdo4fn/r93QL0JzzajDVJf57zZrejNoeQdLPPkA/gRRtthzFbovHmaOzdEAA==
X-Received: by 2002:a17:902:f683:b0:223:f408:c3cf with SMTP id d9443c01a7336-22e36209873mr41616515ad.21.1746541462410;
        Tue, 06 May 2025 07:24:22 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e4537d437sm12590805ad.184.2025.05.06.07.24.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 07:24:22 -0700 (PDT)
Message-ID: <4249c085-8879-4e20-b2a9-5e4c0032c62e@linaro.org>
Date: Tue, 6 May 2025 07:24:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 41/50] target/arm/tcg/vec_internal: use forward
 declaration for CPUARMState
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: anjo@rev.ng, Peter Maydell <peter.maydell@linaro.org>,
 alex.bennee@linaro.org, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
 <20250505232015.130990-42-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250505232015.130990-42-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: Xagw2rjSdWzD

On 5/5/25 16:20, Pierrick Bouvier wrote:
> Needed so this header can be included without requiring cpu.h.
> 
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   target/arm/tcg/vec_internal.h | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
