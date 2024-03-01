Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp1339426eja;
        Fri, 1 Mar 2024 13:55:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWY7MyR7mMplJkspmFeCzV1m2pSFI3/vc0ymGLJAPU2KOOw0r4D5d+73OPF50HC0M1SIe5sG2OHv1ltRX1L3AP0KttvN/4a
X-Google-Smtp-Source: AGHT+IEmV9N1k5bq8OW+43+bAGnw4QiGlTB3rPJa6uwY5Xcm08x8jXBNGftlG7eh1WLbYtX9jVLl
X-Received: by 2002:a05:622a:1312:b0:42e:c5e6:d350 with SMTP id v18-20020a05622a131200b0042ec5e6d350mr3033081qtk.15.1709330128790;
        Fri, 01 Mar 2024 13:55:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709330128; cv=none;
        d=google.com; s=arc-20160816;
        b=yiutIoAFmeX9T5OLOVQ0h0lL4bfNvyhsvBF9sQVB+XxM32NtUEyBL7rQaa9ruP7Aiy
         yYy6TSbvKRC1LKmfI5BW9JUhcOoRT7k55TPgBfaU49u3mcDYS0XCwDFW/88s3hzeJST3
         +CRzhLL+tf6tfFN1P+rWrKZ/DDLgJ5c9rIGedYOxhe4SZO5KVq7UGiTCGBHpzF/rTMEs
         VYjxx1BkcAx3DScC9NEKhfpsc//P4kDyEaI2TDOBcXYv7XKgL7WCUg3wcZ6frmWnc1WB
         fT/K6fYt1L7Bl2HdMXQSWrO4XVcYzYKD39BcGzdYNfbwO8QM6rjtlL0qzNwK9Obz65ch
         oeBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=vh2C2wal8S6HzUHDQum0TQWsDdWv5X/3qq6hrm2LB1k=;
        fh=iZ8q50Ej8wK8/dKVoTY2ehvTlbmgmm3ktKLC53rulbQ=;
        b=bGidEc8ePgc4Xr0O6ldCLA0POOjtxHD91S3or1pdifWZucZ2WKrl1KwGOsqpDEThuJ
         UyWmfJmoaY9kNiKPCpichKLD3gUQ3mKKJHVFbWQKeEnSpNW4EUTfwuIAe2g7F8S4CJX5
         ircxwqW3iBLtX26jOlj9L8a71fEY1wFa5ZtERunFY7pQ2tZEEWFrxh9cIDTotd0xU6x6
         U/Sb5wjpfv6IaicwxSJTT+v4I/vNxGw8qXW94cIggwfeRwtHS1kTQlFgO+vKtuYfUzDk
         MGAi6ZqJFCCgg5SCZIi97lENhR0zHaN6C8Eejg229tG2zULNKEflD2mhn4mtcR1dXfIo
         ghBA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QVnoWdfw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z16-20020ac875d0000000b0042e4b823f2asi4180608qtq.426.2024.03.01.13.55.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Mar 2024 13:55:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QVnoWdfw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rgAqN-0004tY-B2; Fri, 01 Mar 2024 16:55:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rgAqL-0004mb-FB
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 16:55:01 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rgAqJ-00006n-Ot
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 16:55:01 -0500
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1dcad814986so23283935ad.0
 for <qemu-arm@nongnu.org>; Fri, 01 Mar 2024 13:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709330098; x=1709934898; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vh2C2wal8S6HzUHDQum0TQWsDdWv5X/3qq6hrm2LB1k=;
 b=QVnoWdfwEIstXX6TT8MuDn4q+nXKu/18S/KXTvnYTGpIdHiHJ0lEu08Ez0Esa2pjmk
 eTSnWKpEv6NnBwoEns50echJ/oHdpHZhp8i3m0k8pRaL0Wj4O8cy2Zw4FbRw81/CYe8e
 WhGDbKs7HFucVIWjdkOvZgGIc0b84cnEPTeC/c6fqaMrcZjQ2hA75g60rE8taQHkpF5d
 vKx7Q5PU2nvz/ZUGB+T/y47KQsWHg21jkDfNtfsR4qAUrAJHgeXbZcSiU/e+lXon/Ten
 vM5rva0VxICOZC1dTjrTKMWDNf93onduR4NK1vFkIwX/oMoZ39LDIDAlBZ3ad3JvbTHy
 tIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709330098; x=1709934898;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vh2C2wal8S6HzUHDQum0TQWsDdWv5X/3qq6hrm2LB1k=;
 b=O1Mp/2Cl6oObNtwjL7BRYPQzmlsHbTbiyheKGGc8Sz2JUo0J59ex4MR6CI8j+jNvXJ
 D6wvthf0HNonZo0cdNclnDByLN/mfWBuJG11iGXAHFv4dJb4IjP2uY1bzUktj7+8AzGs
 a6pXbt3blGPxxOPQ7CgERRK/iS+HK7TsD6EImShavFQRaUJXtU3yUXDJqLlNM8hSeu1Z
 9Zs6ozoKYK+p7sbF6AbB4WTC9p+85+2S86RrVrUD8kY9oUN1egRmn69YP4FxTh1lC3Z+
 1aT+EeezfMt5Q17DsE7gvFphG3cG2v23AjYjuxbhcvNI4syDc3QqANQb4extdnztcaFp
 Bc2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1hO5KKVOoBFrtZsnfJes98u2DGnkqA3WTfLXNHWI5ZiNH0Wt1bkgBX4MkC3KVS2L1AzavZm6zM04iJl0/MbRew5zq
X-Gm-Message-State: AOJu0YxCKMdAp9GwnFywZzXpfMSHkZWpqV4ohoJq6bn6VToASpbQdA+1
 p1VmfxUhmTsR+kTBTfZ4lpT/4C39HeGEDuBNHVdQenkKfPFOP3MQbv1bI+/VjJoGgD7/lq/m1jG
 D
X-Received: by 2002:a17:902:ea04:b0:1dc:d642:aaf0 with SMTP id
 s4-20020a170902ea0400b001dcd642aaf0mr3824166plg.6.1709330098182; 
 Fri, 01 Mar 2024 13:54:58 -0800 (PST)
Received: from [192.168.6.128] (098-147-055-211.res.spectrum.com.
 [98.147.55.211]) by smtp.gmail.com with ESMTPSA id
 g7-20020a170902868700b001dca9b21267sm3946503plo.186.2024.03.01.13.54.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Mar 2024 13:54:57 -0800 (PST)
Message-ID: <97dbadc0-a9f0-4c32-abb1-7613380e2a5c@linaro.org>
Date: Fri, 1 Mar 2024 11:54:53 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] target/arm: Implement FEAT_ECV CNTPOFF_EL2 handling
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20240301183219.2424889-1-peter.maydell@linaro.org>
 <20240301183219.2424889-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240301183219.2424889-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: m2prZ3EnHUtc

On 3/1/24 08:32, Peter Maydell wrote:
> +static uint64_t gt_phys_raw_cnt_offset(CPUARMState *env)
> +{
> +    if ((env->cp15.scr_el3 & SCR_ECVEN) &&
> +        FIELD_EX64(env->cp15.cnthctl_el2, CNTHCTL, ECV) &&
> +        arm_is_el2_enabled(env) &&
> +        (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {

arm_hcr_el2_eff checks arm_is_el2_enabled and returns 0 if disabled.

Anyway,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
