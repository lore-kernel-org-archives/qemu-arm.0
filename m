Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp26328ejb;
        Thu, 23 Mar 2023 10:42:06 -0700 (PDT)
X-Received: by 2002:a17:90a:19e:b0:23d:48a9:3408 with SMTP id 30-20020a17090a019e00b0023d48a93408mr8688177pjc.41.1679593326001;
        Thu, 23 Mar 2023 10:42:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679593325; cv=none;
        d=google.com; s=arc-20160816;
        b=l51+ZbhJpQ99PVq9rwejJdM5tbxrRslpY5OONxjTyfO+UBtaUaH2wzkGNb2zFoj9wU
         D9qoxnD+L6ScwA+wxk+RzyNtAoAbt3XRX+QbKlh5xj86wGENZov1upTaHEOUJ94lCkYp
         tBXtdd/eX4VDXciyAg+Rn/COZvZldIFMaJFGZizQps4i71n3LVJfnj6ZwAy88D7jGjA+
         QIFypi6iVXA/yWHiHYA6d/xr7On0wcHVW5VdJ0ALplgbiI9lAo7BeWe3NhdOQyQoUS+5
         y23IWpdsnsGsqannJVrmR/MzrbxQdg917igyhWSWa7TBuUQ3W2EsHfRZNNLG4CHlODa/
         oEiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=zhoQTThOaI/PO8pHwSoHARWdDXTCFsRGRzfdVEtVE5I=;
        b=bJRw2hr5SHE+epepTfIj27VyTCEThA8jGqaYGC32fBMlalvVjO6RwU8OhTo9SU0cEP
         inD3+2YhUpQXum0svFDKwkpZ3uvD1YAOqm5x1FYtiV1BBIf3hTU5k7yAdcOVq6VB2+jq
         C2dnq5MDHictwl+DyfEg8cx8KTASsRn2S7uzQY7cTasUfBSmt2aVMT+hOghsV7YjAiYC
         RwGf7CVkgUSvG+QhQNodvp0YJyeWG5Fhq4kcvCOD7R/xetJESyx5NQwq2+bXqfGJPk5Y
         sJ50084pwPvvnGxM9nMfQvzuxhoquSkpCQKW/JvDDm6x0praKpRlZHLZAL99XJV90/EZ
         Zk3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="a/JrLaRo";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t6-20020a17090ad14600b0023406b2fb45sor1047105pjw.38.2023.03.23.10.42.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 Mar 2023 10:42:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="a/JrLaRo";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679593325;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zhoQTThOaI/PO8pHwSoHARWdDXTCFsRGRzfdVEtVE5I=;
        b=a/JrLaRoTnBQLfuZmOFz5dNA+4VTS44LcCLYJEVR7pMKNLsub4qP7VrbAwCJMi2DFp
         qQKLnF6z9c8D1pWm7os0+6GsUWzGjWZsQDdiL/taWjeAcK3ApjfgT6kokFpa2q8GJDma
         U/hI6dsbjFUkbPatgm6pNqHaUTpiAqNGvZg5xj5cR9VOOk3XuyQD0PMFhFxzBLwOWV5L
         /8tuaDJwJ0FWLD7Vj8ZSabTqFwuf5Y8RyVuPN0Vxc1jrliuN3OMwHfFQLmjVYgKw9afX
         iUTJZUFKbIecI+nWgAF3HpHuoP/FAJkUtNurge2lbtAgD5hDZKYD/nF/2hIPJR8AZzNh
         AhYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679593325;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zhoQTThOaI/PO8pHwSoHARWdDXTCFsRGRzfdVEtVE5I=;
        b=nkJAN8xjrUdzVCbA68XlMZJSBMgtCefPjkiZ4KCP/boJAhvt7VzbwcWQZTOjD4bVWx
         YgJz+6ReEapKJ4pYHE5AvE4QhTXVhQGUeXZkRjvenYdaOZteHPI+MHp07W7+8aTU/hK3
         HxNu4iwh7UxzpmW+rj5zvCLCiLOL6yBtlxaD+H9FOVgWvMafKcrHOrs0JOvPfmP/diRT
         7Be4g95NYRQbgkc+IZf1KVfCHf1hCwXLJqHgrkgcD5r3VLSbQ5aH8jrSy/pFEHdIQlF6
         EWV5a2fy5FoMjXUn8oYi/7EVwjxzCcIljHnMtulaC/U+reWxo7+rcvhfpRyNFcln5Fi3
         hR3A==
X-Gm-Message-State: AO0yUKXJOXVumbbN3DHcI7Nx2T+ijHeF+bl2WA9KX86LNz3xUJfeSF1Q
	Wwqa2Db4FqsL76U6o37QGi5e9pOL
X-Google-Smtp-Source: AK7set+MWTs7X5s3z/WRE6shlpoHVoplZZMETxmW2n/FXCN0ERDJXcYgNVC2a/zuNhlkWmX0aD54pA==
X-Received: by 2002:a17:90b:4b06:b0:23f:635e:51e5 with SMTP id lx6-20020a17090b4b0600b0023f635e51e5mr8571180pjb.36.1679593325507;
        Thu, 23 Mar 2023 10:42:05 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:1544:6601:226e:47e1:b8cd:a957? ([2602:ae:1544:6601:226e:47e1:b8cd:a957])
        by smtp.gmail.com with ESMTPSA id 12-20020a170902c24c00b0019e5fc3c7e6sm12598333plg.101.2023.03.23.10.42.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 10:42:05 -0700 (PDT)
Message-ID: <9475a6fd-421b-0396-1703-040cfff1a942@linaro.org>
Date: Thu, 23 Mar 2023 10:42:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/8] target/arm: v8.3 PAC ID_AA64ISAR[12]
 feature-detection
Content-Language: en-US
To: Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230322202541.1404058-1-aaron@os.amperecomputing.com>
 <20230322202541.1404058-3-aaron@os.amperecomputing.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230322202541.1404058-3-aaron@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 4SQ2G/o3NSpG

On 3/22/23 13:25, Aaron Lindsay wrote:
> +static inline int isar_feature_pauth_get_features(const ARMISARegisters *id)
> +{
> +    if (isar_feature_aa64_pauth_arch_qarma5(id)) {
> +        return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, APA);
> +    } else if (isar_feature_aa64_pauth_arch_qarma3(id)) {
> +        return FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, APA3);
> +    } else {
> +        return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, API);
> +    }
> +}

Only one of these fields is allowed to be non-zero, so we can avoid the tests and simply 
OR them all together.  With a comment to that effect, of course.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
