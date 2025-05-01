Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp319235njj;
        Thu, 1 May 2025 09:24:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWGIEA7AsAFmz23ezpysOPf2o0FRyIXRBgp8fkldfo2zb1kmw2Njxsf8hc6fZVoh5Xf5xq4cpUUtdSePg==@linaro.org
X-Received: by 2002:a05:6a21:9010:b0:1f5:7eb5:72c7 with SMTP id adf61e73a8af0-20bd8252503mr5068421637.29.1746116667557;
        Thu, 01 May 2025 09:24:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746116667; cv=none;
        d=google.com; s=arc-20240605;
        b=iqYMKy0EU3DUPDKX00g318UTB0i0XpASzxMLwFfMMLkehElwqtJrO4Qib8ax85OsrN
         Xs0pGDzIzo8wIptmPzfQr6YSpIGufb4yYOjaVlixEAVP6wjjQmqiBnnYrBpI9Q4nLqCv
         HOOCgM7yF7GOuH3uN5RZuoIt4zN2l6cbvSgtfd29dIO5bTROT5ZwQt79DTNzUh5o9PjP
         +jG26xBCfe9rCqPXcwnC8wHxcFPVoTALbN9C+Rm8FzGStdvFqG3jK5gVuy+jLtdLMI9m
         dSvY3TUkhMrTbjsxYxViQpo8OVKk8zR5YUqPVowofgZ26gEhR5gfIOMc6eq4eSvJ5EqL
         j47w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=oTb37Xh3764UHx4GkunEtiY4YocHVNCV/2Hme8te8Ks=;
        fh=+weYeqhh9w3oon3aSnlm0Qb31Qt86Ca+vG6Q8Mbw9/8=;
        b=Ixz7Q1m9sZUbCTxcR26H0YZ/fc8GgTlzz0E3+Wa6tHW0KYfIhvQ/Y17Bw0EWxRxLQE
         j0hdOhJS3vOw6tqdSbOKsY/pfxiYm2P/sUXylRWt2kFJn9PzirA6dQV2CB6jTqwWf6Ua
         pRfZNS/A/ik1GK1mnBOexgkvsGvwxczdBQVvxSIgC0gJugGsimgeGY9cmG91IOF6hGrw
         sHkK73lz6UDlnhH8uBKdWqYqBQU2erVZI4EmtUKc7ZZ6YprMsKX92c0ZZ3XE6NeIXe34
         aMuSkmdZv6ZA2WS5FQ5qgnA0JoHpfcxgpPIwPqMPdn0ShQ+5jxVYyO4CisocDkPYP38k
         YCkA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HkBSjc0R;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404eeb1942sor650965b3a.2.2025.05.01.09.24.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 May 2025 09:24:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HkBSjc0R;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746116667; x=1746721467; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oTb37Xh3764UHx4GkunEtiY4YocHVNCV/2Hme8te8Ks=;
        b=HkBSjc0RMjqbY/ym2fteB/hzXf+WtC+8pJCPfpTjMNigEOg6o8Fn+y5UiIpFrJDNm0
         BH/DrmGjRcmVn2G4PJr0vCCiZBYDMlIB+ToHd/wMfzahfqiQkii5ZWCgTK38aleCYff7
         V/2QiW6ErqQqlcSidcBau+hWqW4UQ52//0eVETfTToD3wAcgWsBG2jEK80kepHdQC5Bo
         ruuLQBOfVmBCCAG034TSPFYFoFLjNWQWCwlZHPpOFR8JIAAnylGxrSy+Aj/gJ1bpZsYV
         wxTa5xS8nb50liWw4Z1i4ybrdTbqY7VRek4jhtx8b9YpFLPojqm2e8nG1FAiRsUk/MYc
         gusg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746116667; x=1746721467;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oTb37Xh3764UHx4GkunEtiY4YocHVNCV/2Hme8te8Ks=;
        b=h5LwAW0OuN+zGjaam46WY/NiKaIKSnA1tRy49o+L4DBnHpzKKRHYsCzAzPak/tO8n9
         oWRMlVxDj2Zq5zSjFzwwIBRJnHR2b0EaSIJJ9Qqckv4nOnbp4fSV+3STKARB3TbNktHc
         WxmyLULtOx0KpeHx7vPVDtBfAjFzepeRZ2jYBumLyw/rzAJ7U8t/Z8AjhoFqo8BwyfD5
         hqTuCasFpCd/4byiKSofpiqFtjSsfutdB3iny6dPhiCzSuSLMDs6wB6meA0FUHGHyVlz
         HR/HW0HjDmEBzqLnxYDM+arGMnD/EeTcVw2tOQYCV2CYYfK/uzzFwtnOq3fh3uANU72D
         3QdA==
X-Forwarded-Encrypted: i=1; AJvYcCXy7EnZha5q7GdLlg660M5b2m3wGRIeLyKeRqvGYq4hKkOyZ+c4IL9vjenZJYWGluZ5QsM3vMbtxcuhuw==@linaro.org
X-Gm-Message-State: AOJu0Yytwa/IKUSVbtXU5YJlfR/VajXIShUuisGgOZBtmONEXyprTclI
	CxqlTf7Hq0ctW1KGZ/zb4XJBIKB+eNfJoJcSU7YxU4usPPavUK1ElRVIEYGxOyzacQ==
X-Gm-Gg: ASbGncuCTpKZpozCcZY+IPZ8JwhZdY79kp9xh1LAru2+KuhW+uaeV/+sQvCwWTrTaCM
	zyzJ4PnHmoyYDplF9igVGsNly1fTsGMJexqUKb6sBsD8emC+e35vbMZ7STLLzqiK/X+QNwlpU3L
	c/dw6muDYZ4b/mmeai6PjV5WOcoC6Tise+5rO21zPUp1lKBHgH8a2DeN7uwD60L4ivgIRO5o04D
	P6Vs0mUeLDPrQBsG/Xsn6l6NCRr4cwZ1QP1s1IrKTAM336kMpnfy+vzqHOhNQ43YZ4xBJjCPccQ
	ThIlP7k0oc92IoBHSEN7CuF8kQ2/wqMUFRBQ/MJwbymlD0S1oaO1NKCP50m9XZ80g2EMQeI+Jvk
	dDlaqViNrTRaCTo1HeQ==
X-Google-Smtp-Source: AGHT+IGKLGdqve4sfuTYMdlogniJ7+2V8YZQgAut8VVxQxe9cMTSQ+UfFqgvPdx3ptKN8imUOXcEEg==
X-Received: by 2002:a05:6a00:1784:b0:736:7270:4d18 with SMTP id d2e1a72fcca58-740491db38emr4206130b3a.14.1746116667105;
        Thu, 01 May 2025 09:24:27 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1f9d66d8aesm794850a12.70.2025.05.01.09.24.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 09:24:26 -0700 (PDT)
Message-ID: <9512e14b-9d5c-420f-aef2-30ee28c8f701@linaro.org>
Date: Thu, 1 May 2025 09:24:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 31/33] target/arm/ptw: compile file once (system)
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-32-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250501062344.2526061-32-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: zfXSnEW/0qIM

On 4/30/25 23:23, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   target/arm/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
