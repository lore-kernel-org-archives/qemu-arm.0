Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp1155642njm;
        Wed, 30 Apr 2025 11:39:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVYExfWVidCsyeWItlj81kQjMSkv2rwZLaoHCjApqH5AC23/yN20ZBFm9CgGbbhT8VGX7XObjY5pSDPkQ==@linaro.org
X-Received: by 2002:a05:6a21:3292:b0:1f5:8eec:e517 with SMTP id adf61e73a8af0-20ba6a18158mr335048637.9.1746038340386;
        Wed, 30 Apr 2025 11:39:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746038340; cv=none;
        d=google.com; s=arc-20240605;
        b=KDUXWtUMNztuePLga/JNNY9PfqaB29wRS0q+TQ2506lw7tP0tFKa2UPv8vbPtVEE4l
         eXU1Mj+p7y6ocQW+Z1b5GSNEuQG8XgtMTV6z5tk2711mpxkUsmzHl2Y2wKgixA/suLio
         2MtPF3MpWW+sxOZDcIuAbWYu2b6J+bDwMv/tofkWX/uVVyqO3OxYXoMrbiapckNyuL5Y
         94KsjdsRc49UBEBk7kMlyWo+yJun06uUdtJMBZTdmEb+OGL1+jTapcmJkcCvMAyzJeqM
         qi8jzm/Lt6aP+ZGB6+lvjB9CFTq0D0kWyYsUATxPaj2TT3dpJY34t0xucdtjZ+HfoN8k
         Elmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ssyZKtuVLZxJbpaPVunx4vfUejWQFU4kZAk3nTNGRx8=;
        fh=+NpuB8PMfM2lB8q3fKtOlZVBADD2yQhOUBcDpl0fjbY=;
        b=huAXwuPc/TegIfPVJdQwVotY4J+Jo45IZKGp2JjS9+HV205yNL1fQMuyZCPaL9IVUl
         sRSPTFxQ2WkRSkzW9xUGy6xG4KGlN5c9dR9WHbJ71y/x1F/DZeslQgTXI7eIB4J7+hwL
         IJ2aw4XGsEXGjXUfGK/+bBP6dceaCGzqThvFmFKOMSO139HEUKIswM6C9BVEsZ5J1z/J
         X+cjsfF3j3Sk1ptbz6CBcL5xVR4uvy8+Tx6ag5/Ifgj9lwcymRLiu5VkJjRH0S9eIOj4
         j4nh/VegKh3Fb6sUT+RcB9ft1rKlxxMIWYmaTKmLQp9jzY/Zsw7g8RwkYL9PDPAjF3xY
         h2ew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jheas+v0;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73e25a36ec4sor11543875b3a.7.2025.04.30.11.39.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 11:39:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jheas+v0;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746038340; x=1746643140; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ssyZKtuVLZxJbpaPVunx4vfUejWQFU4kZAk3nTNGRx8=;
        b=jheas+v07aCkFwD9Uv1+qt5MJgRRH4Byb1+xNiV8rl5udD2V2prn8JPHBZw7bPN4aD
         cZHmtTulSKMnNYAf6TwdxLdbb3s0gx9dYSAUDSBcilH3mr0nWC7jsq9ZuFgl5uSK47jN
         qFBUqsr4ueLYC2sbMFzDcdY+6ocg8Sg5goORFxebegH2/NDsqtLXoH+PZCQuUdtXsQiF
         rZ3/3yOwTt71wLRrLWz060w5KV1MXVm3brzNvtwbL+1IQM0lQ9KiG1KZvKWg1ksgne7V
         S2BHcv8We3tcl7FOdavi3TGL0UhsjTGAFSviN7GknZHUH4bUi3mCSnB+8p1/Geoy+Vex
         gMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746038340; x=1746643140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ssyZKtuVLZxJbpaPVunx4vfUejWQFU4kZAk3nTNGRx8=;
        b=PSQgtOZEUxwT0sEhPa7Dr6HVzqGybMQ/MDX4L0azrlODq7khwGdyMgZS1e1Bbfxxb1
         IYZ8+KDtYAgsZLSGhuoaWa3wvNry0g8/eg3JyBkNkHgzeHtnbljCWef5hNjDFi7jt1Pi
         vNwAgak6JCj5fVGdLu1Xtg0z9tklmteHctfTqIdpb0jbalbb9Aj9LlAbRrQNuSVVGa+M
         F27ai+j1rw6fsQSriCf1ZmC/Gd+jzRxAzp4hYJtLnlsYgbpXy++WggWxYig/mbgF0eXy
         j2ROaBesYjBNU6AUU5IHL4+dI1XGRyI+U5wDncxCEzjYh5c/LIcMfGFkMGZOCq6SKdBR
         3Uhg==
X-Forwarded-Encrypted: i=1; AJvYcCWMzo3w/SrmiHmNFYnNkNyBOHLE+ea1JVAnVToclTiXvLBdZNvLAILHxHyUbFIkcySLwtCDBdLxrKwMIg==@linaro.org
X-Gm-Message-State: AOJu0YyWrLPnx2OJilMGm1WU2ubyG64BGUMctjgUJWJdnS40yD/a6m6X
	200GUCdplwz6dCBhUP7UnIgOI9WBoydKrRH5f3l6ycfEr7eJXLsPfJEdXpLgM9GcCg==
X-Gm-Gg: ASbGnctGAMqEalH4f6oCbA2NpGYDXg5LolBYbFOiHNzy4sk4vCJrvj4DfNxJNJCp0xj
	8csNy/dnq7SBd1nBFi6TvXdhB2y0L4f5Os0bLsEvB987IxVUN1wZh9Xi3U+HxxXXfNHYguzFwST
	YUIYlNAtCkX5vGokXUVDlhw8BVN/CQagFE3z/m0Ye3P2aXqb1qXutFjooKfdoPUsH88kl8c9QSj
	3okb1BhklYhRakA7qqKfqxDrDkOClVr/xtRe9zb44qWwWagX5OnaSxFNleXlA32UsrI6ar/Oxae
	eBApyqtK60dmCEEKAmogEVfPiBBBIzxYEKewwDWh5MPgBjE2CNQhVVTv0T/NGH+3085mokmMOOg
	yw2wx3AQ=
X-Google-Smtp-Source: AGHT+IEISvgiOjRxT8LIY00XzPE7jPD0IXZ43EjcGOEnfrDXNgOwhIFg66+kzDxJM9mdChYST6lrWw==
X-Received: by 2002:a05:6a00:3a09:b0:736:3e50:bfec with SMTP id d2e1a72fcca58-7404777ecd5mr31151b3a.8.1746038339915;
        Wed, 30 Apr 2025 11:38:59 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740398f9ec9sm2028875b3a.26.2025.04.30.11.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 11:38:59 -0700 (PDT)
Message-ID: <b3a703ee-d8f7-4b58-bd18-ee71de494e13@linaro.org>
Date: Wed, 30 Apr 2025 11:38:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] target/arm: move kvm stubs and remove CONFIG_KVM
 from kvm_arm.h
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 alex.bennee@linaro.org, anjo@rev.ng
References: <20250430145838.1790471-1-pierrick.bouvier@linaro.org>
 <20250430145838.1790471-5-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250430145838.1790471-5-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: CsEkVwakhfnr

On 4/30/25 07:58, Pierrick Bouvier wrote:
> Add a forward decl for struct kvm_vcpu_init to avoid pulling all kvm
> headers.
> 
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   target/arm/kvm_arm.h  | 83 +------------------------------------------
>   target/arm/kvm-stub.c | 77 +++++++++++++++++++++++++++++++++++++++
>   2 files changed, 78 insertions(+), 82 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
