Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2646329njj;
        Mon, 5 May 2025 11:41:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWTZM5aCP1XrjJ29V3z4RpXCh5V4Yw0OE2qf/hZ882v1lwqyo/1LsbX0TIyecRPgUaKt11og8rrM/pQjw==@linaro.org
X-Received: by 2002:a17:902:f60d:b0:223:619e:71da with SMTP id d9443c01a7336-22e1eaf11fdmr132424575ad.49.1746470516023;
        Mon, 05 May 2025 11:41:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746470516; cv=none;
        d=google.com; s=arc-20240605;
        b=dSwkReGSC0idGJRArs1UkTBKASlZ5bT/ZrU05kMr9/WJ7WJBJwvOTeHwJxIULV3jy+
         brIt/tzV3CRA6xYh/pvKXM1MKF+ewJAHcIpiOBWAFjTH9XhkNMXBTEBNELOxyGKfebWR
         iZlnx0DJ8RbEzX77gZiMHpTKNHqNFtjIZ5/HCnJUQ2MGQA8dIl/V3gKDskCk+/8bZ0Mp
         vVRPERZ9/R7s4CiusKCOmeAVCStVcHWctiYION1Zme9KOSCLU0/p7+oR3dhduXtrIuRU
         j9RO9PVrYF5wcGncvVP7FRfsk6DG4VcCkSUIks31I0eVJNhNJb9Zx1ijApPe20mpJeyT
         cwSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Hz3YfAN/v/roHV/d/6p4A5MsxD0Hnsa3hZReJcliBIk=;
        fh=Z8aZLbOVXlthKsmSEbB+9YUMkO1zkRjeVUlEhZ/Sa04=;
        b=VUxP5G6krtmdjW/inQW9S5yyQH0sQZAjAiOkR6FtEjjI5ITKKOsqbS6ikui+cOaR4a
         ifnKCDGNteyZ0efD8xZjDog0eQmnTiRP4R6cdaLj3mg1pDse91INrQDIbLQKzJPjRuQk
         UMZZYZhfcBkHEWMT2WUxqsutXD8KYVr1BkNJv+kJTv5+9KZz1NX0Cm4gHu7HhKCY+Esn
         w91O/0oqLXq6eLG1uZjC76d/mvKh+yaOBHCoKS1AuUFcb6nJ+eO97lYHYsAlDwGiOrLo
         H5rxifPI+MASjktuoEC6LfGdhgKTw9Y6Vd2blw1m3k9mhEprJKwFpM21uO1jORhert/j
         rGrA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NQ4orlrN;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb06a04sor76428175ad.2.2025.05.05.11.41.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 11:41:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NQ4orlrN;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746470515; x=1747075315; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hz3YfAN/v/roHV/d/6p4A5MsxD0Hnsa3hZReJcliBIk=;
        b=NQ4orlrNzkHqJqw4WFfO6CpZQKsqF02BBQbe2iz/sqM4XWb6iuLlNWWIqwfXWSU03z
         aRGYLLBzjjHCC5G5raI+XgJMERn5v4/Xw6Zp4D8Aa2j7ebj1e6TKcZ1TwkvaLWFk5JNf
         UHJmByiyAuUTeyyNdb/xAcN+QRiyibegiAYUMwW5Pb6RJLyRTsjmF9Fk/idi8g7SaPaA
         CloKT4ByLxUVSpZitl97TpLK9QpkZOXhZ7w2Mx7Zoy0obj5CC6ig5xPfLLikIrGpOLhH
         AMUXQ3CeFrb8dak6j5Hi3witsoCpnpzuZMkH/Eet1PItCsCSyDIlZ7PYyxhjHy+hOEQQ
         El9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746470515; x=1747075315;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hz3YfAN/v/roHV/d/6p4A5MsxD0Hnsa3hZReJcliBIk=;
        b=Y8SHCcMucVEQXfFMhY9Sy0g75Z8IrvxJutahbgnaZE+m45uG+2PtMRjjiXQZSvNCKj
         089ZckQM5aglk72Xk9eKVXKJeL6j1oAUlfHD6ZyAI+yseMNZGpTpflICs2s6pwTMDWVv
         +tjpRQz7qjN4Ne5CiLPWmcVUOcyNwnomGvp38IRHFXw7bQHPIog1OvfrVMKQMeUMSHf6
         jzlf1FQzpkSdVeg2iCbaVW9VGbA09225uWRK0iK2tZM7HfjHmy5Lel4MLiH4RLG2Nfk1
         VUlwofUi9J3yl+Runv6bdGDEMl6iNTQEKuLbGgRSjl0GTHAU5h3qE8nxogwpKQ2Isfo8
         5bVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtaoBtUtEGGm5wA095Cwt0Hf0rPehCYWJNpfl8oUomRqKmza8sWlQ5RQkUbXZQOi0O2NHVLJcNl63HOQ==@linaro.org
X-Gm-Message-State: AOJu0YxB6rY4h2qqzIGRiFYWP6O/aT9Mcn3RcUX0vZks0agrOn5mrUKf
	vEBe4hLgPuJdSQIFnmDWMWLv+rXdV20PInno4QbZ+ZCE8CH9fwVg42XCVWQ8+xOJeA==
X-Gm-Gg: ASbGnctZwjzyDcNgMZTaYLOACqXsQOibOXDmw8g4CZwrmfiaE+Q+76LKOuU2kiydk/6
	flEkU3CEISslX2kabYzIB5x/JRlMNEsQ1SIgvbfWgcxMn5Dw0tDIpe6khirBgonp0L3/uWO2+Wl
	hNvg9zzZSeCpFo4LgCWGvtdDPbbEQqQ+NdiUiOn/XyCQNiCV4Lez+n1JOdh2aOuTZ/fhP7ceTN3
	LBnmHw6X/eHzQ8kUDdtUCi9k95wXaDP8RT2uvssnk2TlZ3X0y6g92VEDbtBJ8FIJnUFDsJ6jxKK
	1/GufPEdNcaMNAUGJ4i5xZTXOSRFm1HX9+Pi7pIYUgrAHHXgiYBU9g4s3J+0zGyYh++bI2jLA27
	oxK/LUuCpZ6sNMgrLZw==
X-Google-Smtp-Source: AGHT+IGp9Lyl8EaufIN5bAJEVq5LU8JhfWf77OkXZf4gRl0aZ+kGddzDwCFSLhDMEOK/vgzcuYc6kA==
X-Received: by 2002:a17:902:dacf:b0:224:24d5:f20a with SMTP id d9443c01a7336-22e1eaeecf4mr154391995ad.48.1746470515597;
        Mon, 05 May 2025 11:41:55 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7405905cf4asm7415678b3a.135.2025.05.05.11.41.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 11:41:55 -0700 (PDT)
Message-ID: <cc6d8613-e0de-4b70-acc1-22bb30549ff8@linaro.org>
Date: Mon, 5 May 2025 11:41:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 42/48] target/arm/tcg/hflags: compile file twice
 (system, user)
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
 <20250505015223.3895275-43-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250505015223.3895275-43-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: csVy+f6AFQ6p

On 5/4/25 18:52, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/tcg/hflags.c    | 4 +++-
>   target/arm/tcg/meson.build | 3 ++-
>   2 files changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
