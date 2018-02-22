Received: by 10.28.71.27 with SMTP id u27csp2344288wma;
        Thu, 22 Feb 2018 11:40:09 -0800 (PST)
X-Received: by 2002:a17:902:22f:: with SMTP id 44-v6mr7530151plc.418.1519328409397;
        Thu, 22 Feb 2018 11:40:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519328409; cv=none;
        d=google.com; s=arc-20160816;
        b=jjcV8c+dw0SFU7sUoT8sWVF6kIPUzpI7E4oSbXf8a7h4OhycXxtIBs/53QlPlFewnz
         booOvdKbpLmRtYSAn8HN0awF5l7SzFMNJn35jrl5tbWgTXuOjTvhuknopFr4x2IMbCgb
         0AUuPVXLC6/DeYBoXFPuEJzaHr2t+505RxPm9JbqEtYnC4Vr2a0cq4DaniR9QqLSHS8h
         e97lPJ2Nd35tPoFM9fy0nNiSgA69skHLHZhhzgEcO4Tj8/ukdxAL9i55EtbNwwo5sqNL
         gqM+TbnyHX0CqE2nWYW9kiX2mMdIKPnSWzkgkRwBdlB1xkM30a5fTBGMF/IDMWZWiws/
         LCSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=CNiSgUQcdV+uAnPORHXIuJEY3vE/fHNNAJCkVopDSzE=;
        b=OMap3xJHXgnGVO9Lujb7zn2AkV4sYWBnJS4zz6Kb5PK7Z5O1lW1reDBXpsVpPrgn5i
         dyjLep9c112coFvzQg92K8VglLYZ9Pa3Tjct2jTiS58obV4lIC+VE0s3Q+waT6Y8j+az
         Fg/78MNp3PlAZdRbJkqqinNsA8/ssIqEzGjO1jhu/5J2N9NrZKOCEvOfTG+bmF48sasZ
         A/paCo3jLJ/XW0MstnbSbLXmy1mnCUou65NJdqqksW+Y914KxniLj2rq48Qtm137Rv/g
         LpRPym/FPfaNcDX+pJ35HRiZdI6z5ZIN1y7V4ehaJSepgGjWJHZKxEt9LFis3R20Urvo
         +8ZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bhEXRFZq;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q10sor198866pfc.69.2018.02.22.11.40.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 22 Feb 2018 11:40:09 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bhEXRFZq;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CNiSgUQcdV+uAnPORHXIuJEY3vE/fHNNAJCkVopDSzE=;
        b=bhEXRFZqYlqPE1bwguHDtSKvJieGK359gTEgKkOuBkhxMUySb63tJi9Vym/1kV9ddW
         44Bx0lkef4o980IqhwPlxahcgHFb6dk4J9P1Cf5Y0WLHqsBzuThDYu3dJGtngSJXqEox
         Kma2NOQQR7im5BLDPHAb4nzXyybM+KtMLpw24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CNiSgUQcdV+uAnPORHXIuJEY3vE/fHNNAJCkVopDSzE=;
        b=nOgFX4zCfMtS1Da87dtk3HwrPKIbIy/BJaxPngQfLOTFY8gZhddQCNNB3mxm+oqo0f
         gaFA51svhvHDiienQL/b5DPpDRVHmyulnm7cXrg4Z2QrppmwjsN/qvpu8CsRDc7DutiI
         gqsb95oAwpK6SZ52b0ezK9QXYqPS6wz+UUl/IhwJjYmTggCA/epdrWC+JV64aQc2po8V
         EJNQ16Xw/0BswutSwMk756D9cqmtBUoo2Z9MxKhQAckXIhw4g54tN5GT4EGCtXpKGlHK
         LunXa1CQDeUWaFzcTZtMIP69GUpkaXZXEpOqWCdkdt97EpKYjUf17gvc9LK7WIbiCYMu
         YiPw==
X-Gm-Message-State: APf1xPCnsIDPfMx7Gv65Z9pFwC8Cu49EIo84c0aJzZEvy0ZG2L7lKm4v
	BKk8pBAoaUvJji9DXvgAk5N1YL72AfSkzA==
X-Google-Smtp-Source: AH8x227YahJZ3TB8eRoKVuebukdq+wMENSqC7hTjJ8n9aMlkJ2sz/rQugIkWAEUn20GkSuYA8OlWFw==
X-Received: by 10.98.17.147 with SMTP id 19mr7888348pfr.160.1519328408983;
        Thu, 22 Feb 2018 11:40:08 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net. [97.113.169.147])
        by smtp.gmail.com with ESMTPSA id n1sm976954pge.19.2018.02.22.11.40.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Feb 2018 11:40:08 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 20/32] arm/translate-a64: add FP16 FCMxx
 (zero) to simd_two_reg_misc_fp16
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org
References: <20180208173157.24705-1-alex.bennee@linaro.org>
 <20180208173157.24705-21-alex.bennee@linaro.org>
 <d6f98bba-04ca-80f6-1fad-cfed416f4127@linaro.org> <87h8q99bv9.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <491cdad9-58a1-2f2d-a415-c2b6c1562eab@linaro.org>
Date: Thu, 22 Feb 2018 11:40:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <87h8q99bv9.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: eXCjChZNOECC

On 02/22/2018 09:23 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> On 02/08/2018 09:31 AM, Alex Bennée wrote:
>>> +            maxpasses = hp ? (is_q ? 8 : 4) : (is_q ? 4 : 2);
>>
>>   (8 << is_q) >> size
>>
>> ?
> 
> Hmm I'm not so sure about this. While mine is longer form at least the
> intent is clear. What about:
> 
>     maxpasses = (is_q ? 4 : 2) << hp
> 
> It's still a little magical IMHO though...

Two variables then?

  vector_size = 8 << is_q;
  maxpasses = vector_size >> size;

Why do you want the "hp" variable when you already have "size"?


r~
