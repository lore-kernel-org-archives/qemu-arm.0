Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp1162317njm;
        Wed, 30 Apr 2025 11:51:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUeNOecgjmhmTajSQ9NGlN/EhL8BZV5U/WaAuZsOOPMSoKDYcTbFTlYC4oRksw21EPZnmzSxAvaYLj26A==@linaro.org
X-Received: by 2002:a17:903:1b23:b0:220:eade:d77e with SMTP id d9443c01a7336-22df358f9a1mr74400535ad.40.1746039081294;
        Wed, 30 Apr 2025 11:51:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746039081; cv=none;
        d=google.com; s=arc-20240605;
        b=D3jnFwGY+E8TCKaX5Xg9Y7pF5dirR0GqqnayurK8Eb/6U8Bg7WVBaThUSBoBuh+hbM
         tXXMuq1BxR16UHV6l/KjSOsOKnIPnHyvBKXFnDR6wrn6tbPttmRB4wN33HgNVbmtys1O
         8ma8ApgM110G2mCAvcHy8ZPVkav315JTr6Wf68VA41c/8Pg3lSLqf986i/deaVlo4Xjg
         zx29NXkIFHuqGAj+AsvovC7W7OfwzZkn/V1kKBUE+97edSh9p5dtholz/xEA7EFW9gR9
         4L+LRzY5wdp6vyUvyrY2e8Uebs8R1a3Y1B93RETEj+QV8Ke6eheDB1odv4fQtBI8kkvm
         P0ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=hxOJ9FBHYIfa8vp94TfzK7vL4Nw0T38BsxJdpM9mzsA=;
        fh=Vbg/jhWlMJmO/lDre9Vb5Y38CfnIobOCN/Jw2WkbsrQ=;
        b=Omf5NkpiwVP8JivMfXfSsTQEFPDDLYZ7PsEEn2oJImmT2kEPebdLPiS1i4ZfHSGVcF
         tnuqY4ZnXdTn0+a04r68DDE2y//Aaxh49WyHDXFAFbVMHynbCF3RfsUwYYnRrIuMug83
         mBQwQQqtsmKMe+NG8gJFsj69PyZFIR0s2eMRyfJ/m2Tu0qA8GyW314kleY28YHzYmCMI
         iHKrfxTvoIWOUWKhSjmKZN9vLvzYvCrAo2UWFfDARIfooEMyMrIjZyXpacE/uXONorIQ
         L8z6+ygQ44q9hqhrPruJmLYKmthUJst/MfvOaCgPUg3Ky1Ycsy4DHp7h1knmJHnnH34G
         nbLg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SsU5m1Q1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db4da3e70sor84515625ad.2.2025.04.30.11.51.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 11:51:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SsU5m1Q1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746039081; x=1746643881; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hxOJ9FBHYIfa8vp94TfzK7vL4Nw0T38BsxJdpM9mzsA=;
        b=SsU5m1Q1c1h6rMd+2vpOS302MFDgb4p2GKJz+tWVNHqC7URLlisjRIfeY+6uklDDVt
         urV/kgPdhFYfMhhj0FDOWyTq0uuVD8ARb9HjxS2Wt39kZzKinuIkPa8DedmbSdN0k7uo
         lQy47qSQP4PoLzySEBjIQfwkUGMsK7t8IhjqdRvM78uD65FJ4p6SoLgkZKMx/cg7J1cK
         29wPEQWRypl6SZlAcF8jBv7BgEy1ZgC7DWqqFe8YuOLjC1RjE5QNo54VqjxdqOp1pUY8
         cR0ABnZvjK0JiLS3U0cfql3hC+1egNHYURVuzOnlSedy+xtujkgtTAGLc/SNNjGpVXu8
         euhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746039081; x=1746643881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hxOJ9FBHYIfa8vp94TfzK7vL4Nw0T38BsxJdpM9mzsA=;
        b=Ae6WPc0ejQNnevWwgHOJwgaiZeeUwZoq63HKUrQF0vWjCK5rn/4YkewTCJtzd0YXvl
         8ygHWCtqrK/pguAQWv7SzTs7OX0Qbo6On9WaPvs94TVZvWJqGBGmMwO+QyqN7UttSiA+
         PT7FiFR+EyVDmxPdWVSXA1yS4gtn0Haz/tSw9DcvpfndmEfl2MTkXm3Zar+g09eUqDD9
         QmSowUcm7v3SO3M5BuDJNd/ovQg4Wa5ivkEcnZ3lBLTHzvJTwup3THlj4aFNz4fSGCVf
         moANEEpRUADhuVflKQkLNTWoRFnkWQoFHrYSH3HEailc8OYObNaVkoUfAbpZH53a/0Gl
         NN8A==
X-Forwarded-Encrypted: i=1; AJvYcCXUwroMqr+gb9Kqt5cwKVwdHMz/xje0MDJ4YDDhtf62w+zJg4MUTJ27mu2aXhTqwlcI4d4t/QkKNoBisw==@linaro.org
X-Gm-Message-State: AOJu0YyzgxSt4ix6ZE6d5dnNR/6noiEWvBFbAGKDSh3duvNPns5NbaL9
	DhNziuWDINXuzc5FJTPaX9+EpccXceqARiw/cjFFPMaJyenH8OPw8rcZZPHzDJXkAQ==
X-Gm-Gg: ASbGncvxSCeQeXJS0+Gbkrqx8ceGI7egg5Xch9OmzfQ/skcv10vCyefe6bQ/iynXR7b
	aIX9q7eoG9BlEkVvaNlFHfJoB7/CyHw821HluUNcv1e8+er3KwxcW7CrQf6EKjJrGHQuHslyEK/
	BUvcp4HH6LtghKEbxIKy7AdWRXSpCBiGMacRzxLcsV12YdWF8Re4om5T6oaSvNGjirgeaCtnbRS
	ucaN8kyW5JAL/ZqTWjZZDxtuFy3xA8qAbw/Y7Dl2r+Udu5zuzNbT7DNTMx04plKDMZs0f06vVVI
	TDtISFo47tLE31FlNqOpinJpCw9tyHGJkonlODhU3ZOmQne78mnhXfUd79fQUch6veMpxmWsS5D
	Hh9tJL1Q+S4GKKX8TEA==
X-Google-Smtp-Source: AGHT+IEzWhuZd+fIFVzMg6dFdi+Ij1B5/pyHqYfzImCAOcoYiW7nODxF971GqI2yyzrn7iFeWN/CkQ==
X-Received: by 2002:a17:903:1a6f:b0:223:517c:bfa1 with SMTP id d9443c01a7336-22df3590ef6mr73173675ad.38.1746039080897;
        Wed, 30 Apr 2025 11:51:20 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db52214fdsm125468425ad.251.2025.04.30.11.51.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 11:51:20 -0700 (PDT)
Message-ID: <344ca5a0-acaf-4934-841c-481aafb03052@linaro.org>
Date: Wed, 30 Apr 2025 11:51:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] target/arm/cpu32-stubs.c: compile file twice
 (user, system)
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 alex.bennee@linaro.org, anjo@rev.ng
References: <20250430145838.1790471-1-pierrick.bouvier@linaro.org>
 <20250430145838.1790471-13-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250430145838.1790471-13-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: t5GKfoDsegDg

On 4/30/25 07:58, Pierrick Bouvier wrote:
> It could be squashed with commit introducing it, but I would prefer to
> introduce target/arm/cpu.c first.
> 
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   target/arm/meson.build | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
