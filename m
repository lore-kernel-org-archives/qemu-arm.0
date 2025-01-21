Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp186336njc;
        Tue, 21 Jan 2025 07:57:52 -0800 (PST)
X-Received: by 2002:a17:902:d2cb:b0:215:b74c:d7ad with SMTP id d9443c01a7336-21c356307e6mr274617655ad.36.1737475072473;
        Tue, 21 Jan 2025 07:57:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737475072; cv=none;
        d=google.com; s=arc-20240605;
        b=FSow+Smzyp+BbfD40BdcwpUclEgcgAR2JhxA7B8XdWbRBEe4mBqROvbxsRW5nKxR0f
         4NRp+MH3m17zCjWHS+mY3qNBXDXKYUBPd3arEMeGyDMSSZrIVnQViLKgNHF7QALcVOsv
         S4DKzsu7wpq8+7I8cnZbbssXDokJesIXDRFeoV5zWSH6gIsBuAnlTTCbeTCBO6koGzuq
         090WtgOxWW+tlQEhCFgRWVTjWbjOYNx+8Geht8XGGU3NsD8+gHqIsOxQVewogLiDUJO0
         Qh0kWplDP7+pDbranWqLXIBmqR9JrLdlSaX5o0kQ5gnQzUOowYbgPGfA7pDJmHWo5Lx/
         mPBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=WldscwekoNWxOz+Ci2TkEmSI7wCEr+VrRrK2jDxnITc=;
        fh=Z9TgYPPhehYnX+a9Hr43JWxW1r67Po2B1YCtGvGrEy4=;
        b=DdfmcZDnhWJvHkFY314cNmEL0bs5ZL5xsGEsCemdCWujvgC0r6VzVkfE0VPURF9YfJ
         aFPOgQfVLgwMgCcTbSHWDKCZtL19aRK77nUt0b5uIR64ihYlI5Pge+SaCcT5iOURvvV9
         jaE/uP6NMp+xDOyBlo0WyHmGBw2J1Kwd59NIWhImIr3mQl5nIduc/IeeAM7Y4HSWsNSa
         sXoCF36yxfksHi4Saa008OFRpxhJviwmx2Vjx77f4cuXq7V9kbUEtavINEAQcBYTXN+g
         FxYJCMvtPttcrpab3YhJz8eyQwE/VPLNTaxE+S+1Zys+aQf3++K1R8Vz6FcjMrNuvdqR
         k4Mw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oD7a1sUt;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-21c2cec48a0sor5807285ad.1.2025.01.21.07.57.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 21 Jan 2025 07:57:52 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oD7a1sUt;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737475072; x=1738079872; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WldscwekoNWxOz+Ci2TkEmSI7wCEr+VrRrK2jDxnITc=;
        b=oD7a1sUt9aHXGXns6118A+dNbRD5Soh5qndaXvr0wZBjocfHWarrVgmDYULA/KpS9L
         HdsyzG+ubh0hLzWMrmCf+2twrAn2FbHRDuMIRTv3Crd2VXJlAAw3UMqsTszg7AUWzqxf
         0tZodoSPqMoROZvZw5zmBxf76F3+gKLO3+Imug0BFfwidpckiumXP+IHKr25q6CPH6tV
         lpOxKQPl5wKwDDR62cY+PKcYInnmEAilpyyhLnUtYsRPxhR4zNRb9Q2BJWUfEB77yk9i
         42Lfs7qn9tay2k8xQPhI4Bg7LxHRMks33iRDvxXR5ploKPQdnYuHXT4kvozE6fe5vS2T
         i7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737475072; x=1738079872;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WldscwekoNWxOz+Ci2TkEmSI7wCEr+VrRrK2jDxnITc=;
        b=iYnR8VAArb+EUkVXyv4XrsQCNDXGU5oaIoTUzHwOME4mJpQhbTdP6lnOsbgqoUfKJt
         V3AcxzKbX4+YRPWTtA43rexr93eiAHBRGqqcXGZ5n/sw96W8pp8Fy1pkNYY55mlwkCBg
         v7qWXkK1YXVgAdqKA5lZZL3kSWp3piTaB+PvPJpTac2oCSHIWbpZQm0IY9jvB6Qb2TmN
         uRfyjO2mHD40RSW3+O5iWqE4FxOS2pD8v3xbIBI8z118AS5OOYIE2Ed1kwL0jUbwZxMe
         sBD5TcE94V4ZyCDtjaByc4lZIcaB0Q7TiSfvpC7IKX9z0mBuKn1yup0QqBbUOCHU+Ihj
         drUA==
X-Gm-Message-State: AOJu0YzQOS/+ed1qRdWdDFvrxlkrYq7TIw1Y1rewrObJZ+lgsZUZTSNi
	sMWAcKllAZyjUnwKOXvdSSUFsmIby39Ucg4UATyJMpfOqPmRsoycXsCfryPpjg4LCAY1BUz7OrV
	xWDY=
X-Gm-Gg: ASbGncvNzNHHivphHAK8WGA7O5KqfOodyanIsiptsPjzDep+ukK9mchkU1GXumghE3a
	mezMzj7T8B3YfLZcuiO2MPzXdZ2epAOzqu1aoUpS/13uqM7kh+7cMy49JQ94xofXXIlYqXWSXwJ
	EvN3+X6JtZfa/L+FDlnYR0FIztkKidlGtK5qs1yHX4UcmLeokbNJI7wLVGfJsIe+uYQRscw1JnD
	H3toy7+W9XS3fH0ftyvtK/dnYFYivwtiTcgdhXSV9dLpukeCvWZIlQSyekF7zCyBU7TTONv61Hc
	7caqf59WCFlwxhnyAOnhDpcEJoOdq4Q8RJZC
X-Google-Smtp-Source: AGHT+IFBCJLFK+bOHOjHUs+sjPb0IX4J/S7OhQ4KmrCOhYA9YLJAWVTHdLhDUH2NTN38lrohxe1Q9g==
X-Received: by 2002:a17:902:d2cb:b0:215:b74c:d7ad with SMTP id d9443c01a7336-21c356307e6mr274617235ad.36.1737475072059;
        Tue, 21 Jan 2025 07:57:52 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2ceba9afsm79813075ad.74.2025.01.21.07.57.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 07:57:51 -0800 (PST)
Message-ID: <4b25151e-8c0e-4d36-9bfb-41e144aacd2d@linaro.org>
Date: Tue, 21 Jan 2025 07:57:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] disas: Prefer cached CpuClass over CPU_GET_CLASS()
 macro
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
References: <20250121114056.53949-1-philmd@linaro.org>
 <20250121114056.53949-6-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121114056.53949-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: cNNWvikXeFSD

On 1/21/25 03:40, Philippe Mathieu-Daudé wrote:
> CpuState caches its CPUClass since commit 6fbdff87062
> ("cpu: cache CPUClass in CPUState for hot code paths"),
> use it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   disas/disas-common.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/disas/disas-common.c b/disas/disas-common.c
> index de61f6d8a12..57505823cb7 100644
> --- a/disas/disas-common.c
> +++ b/disas/disas-common.c
> @@ -67,9 +67,8 @@ void disas_initialize_debug_target(CPUDebug *s, CPUState *cpu)
>           s->info.endian =  BFD_ENDIAN_LITTLE;
>       }
>   
> -    CPUClass *cc = CPU_GET_CLASS(cpu);
> -    if (cc->disas_set_info) {
> -        cc->disas_set_info(cpu, &s->info);
> +    if (cpu->cc->disas_set_info) {
> +        cpu->cc->disas_set_info(cpu, &s->info);
>       }
>   }
>   

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
