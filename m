Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1987523njj;
        Sun, 4 May 2025 09:10:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXod80OqxOFOd32M7ifMs28RJCg4wqbVmtOtSEe024nJd2aw8knaPaNEmE30iBcRW5T1E5QyLkdWir/Gw==@linaro.org
X-Received: by 2002:a05:6a00:1d8f:b0:736:6ac4:d204 with SMTP id d2e1a72fcca58-7406f0d9ea2mr5412490b3a.11.1746375042990;
        Sun, 04 May 2025 09:10:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746375042; cv=none;
        d=google.com; s=arc-20240605;
        b=ALaVdr6WIZ20gpKutJYx4C7C3F52lC2CZA5zPV1SPYptDFXe6st34WmvR0DfFPgAUv
         P8tyBW7Gu36un7Hpv8cpZ6btGALVUj6xda/2P6SlYCjKnXgrFzFIopnUZC8VqRQGT5At
         6VJElzQ483ojLknp949g0hB15cXfpF6zC1MnTa6lIH+VdRz2By9tX40XNjmeLvCGHBEt
         haRNpvaSxEjtj2yf/PnLHFN+g+KCaa9dSiOL+PurQRuYO4V0RgoP/qCh1k8U8nlmdTc0
         9+fx/UgStZQ0XowEAITe+vMwvCU+xThrP+L1wUjPk3lmu+WFHr5CsSgNYg9axs/cZKJ3
         scrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=+FZX6BzeDziVYSdULWMnyjCncL0tE+7MUysxymXwBwQ=;
        fh=8FM/2cDOJ2FHDtE12t2s5J5xQb53xGDnlzm3YT9OAMI=;
        b=Zeeku9q278c4U4vqI+TxQQQeNqYB3pJpx04rI+i1MZnsnw+zHlnDgvHTrkB7BKfRO+
         m9jtfvqYhCqln0fR0ukCbZ38yNhcOeixO1ULK1NEZaB0wPyc1c90g2yC3ajkJhN4uYuZ
         n6JIwE8E7LJ5S6QT4MaZlnVfrmBztYK++LrnOjqixcah3hv455NhvRBwMBAMx3HhOWfn
         3KdAs1SaA0WeGJGR0k/zuxnsRpIPRK4HtUJnBTgSw2s2Os9nbceR36tgED8MRTsAb3aK
         C9Km/UzT7XV3gFUMe9MbEh2Z6+PbtRH6N6nQhkQDNTuLL521AGmgN46mllNMtZ6CpDWP
         04Zg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B6reJ0MF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404f9e2c60sor3402791b3a.7.2025.05.04.09.10.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 09:10:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B6reJ0MF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746375042; x=1746979842; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+FZX6BzeDziVYSdULWMnyjCncL0tE+7MUysxymXwBwQ=;
        b=B6reJ0MFMjQtglxSiSQh/foUnO9X8Xa/vGkheg9dd2GSUR5So5aGN3apJr0z8KeSzZ
         FbYa92MXApkKmJ1tQ3I3Fx6tpWT/JtoU9ew5k1Y1Vf6yAFahSUhsm08DeXC3dRAmb747
         TdQqDLhi1ehJpTyxeHfT8c9+1wUgfYV8qkYz0fb7RK7GVv2e/qu8Cf8dRfk4Bg1/ZV2v
         jWEwpkxXi3ekxYq+IuatzBqpJlgAW2P97KtDNVSohXDMZagr3R5wm19GPLuCTbF88L84
         6nm5RJM54x+/ChqxMOk/NamcmrSqUOfT3lEkFvTbmJ5rq57nQTZdutha5/tzWJqm/0Ln
         IeUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746375042; x=1746979842;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+FZX6BzeDziVYSdULWMnyjCncL0tE+7MUysxymXwBwQ=;
        b=iSHHk1k4TdVhVd15asUe8lYCEaCMiHW205QkiUd/EakDTOWPFpE0nhv0lqL9mHzDM8
         WerZ2ea2Ukf7KH/SdGHKQVHO03916oQ16a3tEj/cQp3eXVIA2rSWeJ3nzU/UjB5V+4KX
         vIrHMU/FipUhmJCWrcUyi2t1oAshGIH0zce5SLL5CzELO38+OmofXCl12k87jRi3h7h0
         Tydv72YzlerwvFppk2q5Te9FfqmLh2hGYhvOq6hNeDYo3l8e3ijMdYeGmbz0mHnukNSp
         /PaSBYgzTGbPJ+Qp55kV999jTR8wuTXbudOKwvLVlk2iwpa5tdPXHnpIjx4PcQar3rHa
         d4nA==
X-Forwarded-Encrypted: i=1; AJvYcCU9XAMhuNlEQ2jSZcybCUh0B2vWLuOArYxScREaEjhYclQ+U0eXJA6ur2eHNNd+z/Q7nFa1mKXPtQqC+A==@linaro.org
X-Gm-Message-State: AOJu0Yx3Su2ledKsvVgM47KEtIW3Ql88ayYP3Rsn2Pdmv04UJa2pHgf1
	N5SuC5OmK7ThDw+xXKKTpM51LB9LIHAFZlWfHUHu5xRS+FWaTCeqXb+GdKZER2L1PA==
X-Gm-Gg: ASbGncv3/8bbKPt8nf1vVlpdU+mw4fmfl8KwBLwcAleDOL4zIJc7HEOv5Hqus+uVNfm
	mI+JOc0hrdEpf03wsUXYu2aalp4ymPWPnuG640+tsOGAEI0OMJSCnuZlcqOYrixnvPfDvWeerfC
	0jothdId0AQfFFKhkpPUjZGJHXmrO6aELK8O1rGDBdJlVa3RPv8xrefAUJpqGimwkgaFZIF1hGa
	Y8jk4f05cjsCM+3vsjrPcKLB2z8nMQIJGETCU0iNVpBauuVyeBsE74wzNLXCTEe//s/tub5M09x
	EdGjrN74l3L7pwygtbUTPYMiGHK1oEx2mL3pPnSyUjZBHkORbwe1exvlwVMjdiOiFMuNEzJ42wb
	8r+MEgFA=
X-Google-Smtp-Source: AGHT+IF4DmVjYxU5OMHreWY3DuhJ0ArIP4/yXiQNLAIHsXqebkehUJ5U+ALGFOWSzRbbxKy+kOzWxQ==
X-Received: by 2002:a05:6a00:331b:b0:736:5f75:4a44 with SMTP id d2e1a72fcca58-7406f1a38ffmr5483346b3a.22.1746375042534;
        Sun, 04 May 2025 09:10:42 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590a463fsm5223665b3a.173.2025.05.04.09.10.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 09:10:42 -0700 (PDT)
Message-ID: <ceab3632-61d3-4c34-a381-7c460d91dee4@linaro.org>
Date: Sun, 4 May 2025 09:10:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/40] tcg: add vaddr type for helpers
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, anjo@rev.ng,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 alex.bennee@linaro.org
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
 <20250504052914.3525365-15-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250504052914.3525365-15-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: PIQP4fNeEmJe

On 5/3/25 22:28, Pierrick Bouvier wrote:
> diff --git a/include/exec/helper-head.h.inc b/include/exec/helper-head.h.inc
> index bce5db06ef3..b15256ce14d 100644
> --- a/include/exec/helper-head.h.inc
> +++ b/include/exec/helper-head.h.inc
> @@ -21,6 +21,7 @@
>   #define dh_alias_f32 i32
>   #define dh_alias_f64 i64
>   #define dh_alias_ptr ptr
> +#define dh_alias_vaddr vaddr

Use __SIZEOF_POINTER__ to make vaddr alias to i32 or i64.

> +TCGv_vaddr tcg_constant_vaddr(vaddr val)
> +{
> +    TCGType type = __SIZEOF_POINTER__ == 8 ? TCG_TYPE_I64 : TCG_TYPE_I32;
> +    return temp_tcgv_vaddr(tcg_constant_internal(type, val));
> +}

TCG_TYPE_PTR will work here.


r~
