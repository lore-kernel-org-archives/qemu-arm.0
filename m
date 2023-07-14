Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp3840615eje;
        Thu, 13 Jul 2023 23:50:18 -0700 (PDT)
X-Received: by 2002:aca:f002:0:b0:3a3:c743:83dc with SMTP id o2-20020acaf002000000b003a3c74383dcmr3389267oih.59.1689317418588;
        Thu, 13 Jul 2023 23:50:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689317418; cv=none;
        d=google.com; s=arc-20160816;
        b=BuwzLILyMbwaxSKDtVlxT1eqrQLG+VpgZSTUMmppGwbncP8srZLb3h0AJWoOQyqBPf
         qhMkOnIVwd4fV/lhtFLKHsJpVLO+RyKn6x1OvIQBkIqlbrlz4EWTCTSarS/OOJkZ2fuu
         6cOXO8bAwx0uLKw5/8iIPMd4rf6lG4AoW+d9dz51znMrfbsX7zd/mJ05ftzQKSoOqiXA
         75VPO2TUHvqg4VwtFYPNEboHCn4sNJYpkH7YK8dr6sGHhNEOGOoHDsaGdGvMvR3682Y/
         UNtmpSePSVr48V0fO6I4yM7C8AYuPxiDH28L2/AQTEGxIZQl1o7MKmL/9JktvVJ2/i2l
         gVHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=6p5bCRzHerebdEZ2o7zzGXyblGD33pILQJCy0Nsxio0=;
        fh=7xRdbyAJIZ4GsNLuMi8tzUCGyvR1ri+VlSyqfzUHa6k=;
        b=hnMn4DMdIYwvWkGyR/dDDfXeMUuJaDc5yXb/QlI8yZtx/ODYC5h3VF1GkIRv/a+itz
         oCsAXp//wZjqnAMyUVUSWHFvn7Etnnv7X2r/u82yB0muqdsJrNJ/4b+NTIstMK9+LFZo
         cX9LiMNFazixhmGAO4hdbrM6Aroz/akhgCqi2svUmd++FVMw9VwcbJrF2w5CLb14rXM9
         7ZhRCxH5OtMFmkIlTRo0FDFvfPzNK1UKFIaHwHBOUAGrLxXsx7xTZjR8jJHWbMsNM35H
         Rc4c8Z72FyUW4KH3qU225d51rHu9ffaFNP3gWCY7v+xXNR1ONpB306wCodl5a5Rh4++8
         5t+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CKoLRtJz;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bd19-20020a056808221300b003a399968687sor7144289oib.12.2023.07.13.23.50.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 13 Jul 2023 23:50:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CKoLRtJz;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689317418; x=1691909418;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6p5bCRzHerebdEZ2o7zzGXyblGD33pILQJCy0Nsxio0=;
        b=CKoLRtJzhYn5t2FNrCpf77DDKhJA71Df+LvnvW4fAnqNHefws0qduCEpBAwAbb25Jb
         BGKnU1tLXQUuac6TKV1DiPPfStUpz1Dz0fgAx9nqPK348gnq1JMIy6qGxm6ZdcaUohmp
         fq3t9RozzRdvga8bIRv0QcQrbQc9HFz9CyDSUAfcdCA+f9QVxOYN08qsINLhDesr95wE
         UhWCVugDm5SVnJY1tgt+4nKxibU3yenAGuhia4ravvKP6Pb2Xvg6kuj0wLYvr62DhFA4
         pvkwe2GTu2l9ziZ6z8FzrATjXRB6UySPkFM3ma2wkiKRAOxbI6WfIcXuoxP2F0IVsd8l
         hWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689317418; x=1691909418;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6p5bCRzHerebdEZ2o7zzGXyblGD33pILQJCy0Nsxio0=;
        b=a5WdKykDFOOCCOLsPooJb+J1aG5hBbfzXmDpti5zRLh47pjtApCVVFoedP1yF9ai9B
         rN9v1GRgV4Q44X/PPIpHiolI9aQkeojPZRHem+3uTrbkdUYqc7TFqaoyGTuHP5lHCT2s
         65Ar/lcE59DyVg2V02Rx60acJX6+fEdtkIgyXNygi+w3XuhdFRLq2QwG2VQVnponpGJK
         IlJ8JV8/CQb5G5RzyBGliv0TxunRsGMeL/AN/FhGHf2Xzn05oYZlUCqVRKpsI+qp9194
         N8wf3rPsBGyiFvxznPJUrlAKTRCEHAu43L1BT08CLUt/MtMNMhMRjtFiw0/HRRAOP/rZ
         RBSA==
X-Gm-Message-State: ABy/qLamrIGQTAlFyJcua9x7vY90oAm7ouV8f15QI92M5po8g3AUYOdd
	c1ZdwxyC8GS6w81mS5EVdcEBNKfh
X-Google-Smtp-Source: APBJJlGLaR6aP0I7Q3Yyy3t5wE8upZzzhWHwI74W+jdYuQWOCOe4vvIfRvqDX0zUkMeHBfSUnIeSUQ==
X-Received: by 2002:a05:6808:11cf:b0:3a3:fa64:b543 with SMTP id p15-20020a05680811cf00b003a3fa64b543mr4199375oiv.12.1689317418054;
        Thu, 13 Jul 2023 23:50:18 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.149.227] ([172.58.27.104])
        by smtp.gmail.com with ESMTPSA id f28-20020a63755c000000b005501b24b1c9sm6598281pgn.62.2023.07.13.23.50.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 23:50:17 -0700 (PDT)
Message-ID: <4f50754c-ce67-f898-f356-834db14a6e03@linaro.org>
Date: Fri, 14 Jul 2023 07:50:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 03/11] hw/char/pl011: Remove duplicated PL011_INT_[RT]X
 definitions
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Gavin Shan <gshan@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org
References: <20230710175102.32429-1-philmd@linaro.org>
 <20230710175102.32429-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230710175102.32429-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: EHwuepjZVg3c

On 7/10/23 18:50, Philippe Mathieu-Daudé wrote:
> PL011_INT_TX duplicates INT_TX, and PL011_INT_RX INT_RX.
> Follow other register fields definitions from this file,
> keep the shorter form.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> Reviewed-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   hw/char/pl011.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
