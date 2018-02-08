Received: by 10.28.71.27 with SMTP id u27csp2566716wma;
        Thu, 8 Feb 2018 13:30:28 -0800 (PST)
X-Received: by 10.36.74.78 with SMTP id k75mr763449itb.103.1518125428703;
        Thu, 08 Feb 2018 13:30:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518125428; cv=none;
        d=google.com; s=arc-20160816;
        b=ybUuHkq8HTYVhT5LHqZQL75UtOMj9JtThC+ld1dO6E/fGm72a5dqUZNdx5hBWdoODE
         6nxo1zXEYI3phINLePS2nnYanqW43Oz+beSKRphUbNIbl1RAMULavZn36zQtRmZZgoEy
         MlYsBELUC2XCALBBiF9KmrshF6Jlejr/GWeFFtDKyAuZAgZLQow8vb2O4I3OBtIY7dHe
         a2Vrw9QUxTErIR85H5C3g4zMDrUp8Jcb4dMZRXw/pj5rWE4CMqWA7RiRze0vklIJj6Qi
         CUM4P/tIIe+Pw5h3F45fPj/S3EXNDJIbcrzfNVXyoASU/nFGXIEi9XI9tFVsk1JTYH6I
         LAeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=yf392J1C+S3f70om3DbbhvsfWkFSGFkP5QSE7PtlUSw=;
        b=Qy0oPlm2/O0T9S23N7wvTkyiGHL/OWt4YawXvUfYhm400YoJIMWZQ7YemOFWhjiCuE
         CCquHWTBvflDBr4mv+R1XHcktvXQW/uBDSGp5ZOUY5D3wNWTWlRSCAIJaExSez7qWjw/
         GMHTvfcMa84PpYAk6nTcS/h4kEaOLJEzO11HGYp6XG9DQj/Yvbhi6t3X9IhcGLJDGTX/
         yWFwAp3vemr1lYGv1SIuuILD2NJNrbCcY83eLT/oxVESEOTi63D4Kx2vVg18eu1dKDEi
         Rlvu2aP13VX96mM4rdZTg7bFUaHhpqIkwaDDDoLI7hl7PplSe5+GlLeqmxbyqc0O/hTu
         Gueg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f1lnaMNh;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g141sor463784ioe.96.2018.02.08.13.30.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 Feb 2018 13:30:28 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f1lnaMNh;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yf392J1C+S3f70om3DbbhvsfWkFSGFkP5QSE7PtlUSw=;
        b=f1lnaMNhR6QVuKVk2yUeRUZPpcE9wv2oyUoHu18CI1VtECFAziiO3PlYKwDIMcYzL6
         aYkvZhFyyHTjH5ooMT/VKKAve42BfTH38hpWqPe5wruxuz4RwQVMaQb4vWEyp0MyliWm
         gUcS8th6hSmtKe63EGxscZTWwDkoK3ft7zCTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yf392J1C+S3f70om3DbbhvsfWkFSGFkP5QSE7PtlUSw=;
        b=nJ35h3f18/a1Ia8x9rKdYq9Nk9/rsCnZoYTX/6QKdCWNwW+WQOXo+aeAg+NOnKKMmZ
         ShRMJ5Sfy+0Sm+nwOYVDZVuTXd9hjWLR20BMFWQVA9HQFGhcUwqtBmiKR7OyXqzQ5o9o
         +ANupiTVS6QlzukfbphwxsvtqxzymOIlZtx9kdpk+GICJEomBUhrxvweOuAtSK7hPlQB
         SfJPrpCOdkrqPCY7m1P+ecytbHvmtBbyRb7mK7vNDG7WT4T89fj/HDOTVyyYQ6ffmYAm
         lUFOpIwx12RiA52ow6KZQGPB3jf2JfNgCDu5odicLmnYOX8EaA22QEIH+DqIO6kWUzN1
         WrAA==
X-Gm-Message-State: APf1xPBaMJx8JR+bIA+KuIvAykgYa7+Jdq6ciZHb1yq80XYVsiC7yg28
	jdLocBKqdhKOPu4gXEWjWhhiiF255/eVNQ==
X-Google-Smtp-Source: AH8x226lu4tDMLE71bMhg57WS9k8mtU/a2Lj48VmCgwPlqw05zBIbjxDWpvcwmPdyrL/JZZSM/ZrIA==
X-Received: by 10.107.53.221 with SMTP id k90mr622244ioo.6.1518125428153;
        Thu, 08 Feb 2018 13:30:28 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net. [174.21.6.47])
        by smtp.gmail.com with ESMTPSA id 191sm676044itx.16.2018.02.08.13.30.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Feb 2018 13:30:27 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 14/32] arm/translate-a64: add FP16
 pairwise ops simd_three_reg_same_fp16
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20180208173157.24705-1-alex.bennee@linaro.org>
 <20180208173157.24705-15-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9687356b-e2f1-0e94-e6a0-b216ea57244c@linaro.org>
Date: Thu, 8 Feb 2018 13:30:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180208173157.24705-15-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: MceKdJIOcIzE

On 02/08/2018 09:31 AM, Alex Bennée wrote:
> This includes FMAXNMP, FADDP, FMAXP, FMINNMP, FMINP.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>   - checkpatch fixes
> ---
>  target/arm/translate-a64.c | 208 +++++++++++++++++++++++++++++----------------
>  1 file changed, 133 insertions(+), 75 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
