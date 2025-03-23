Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp1556395njc;
        Sun, 23 Mar 2025 12:26:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU5T7Gs2FURQpa2yN7R1Q2ka92L2Ut49/YriLYmpXrbokKk9sG4B5CdkpQyurSfhPqNGSiF/mzDJFjsmg==@linaro.org
X-Received: by 2002:a17:90a:e184:b0:2ff:64c3:3bd9 with SMTP id 98e67ed59e1d1-3030fee960fmr15071532a91.23.1742758015749;
        Sun, 23 Mar 2025 12:26:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742758015; cv=none;
        d=google.com; s=arc-20240605;
        b=HuI+0tdniw6ypiLula+HSeopTiqvXGjMX6kP4hEQhf4gQUHOvJpQcmnimo0WnOg+Fh
         tkPgjfXMve95e7eBZcC1yTfOdZDTGqrDS4rmsx9UCMDpmYXaggPlABqEikAhDykV76kX
         FGlZn7t5ReeogXXjWIARY7iDTL3L1ilTr4+AHP0S4kTaBF64oYBsfArixk4TBik08G9C
         HBab4uwrBXrLy1sNau0y50TFyjrUOxYiyg2F7GK3THeHQr/6zhWZjrvdMrPao76s7rCd
         /ENKDlVeeA8aGaF8u0z9JsJLD6XtxpAoSH72na2TePu8S8tjz+5HX0jsHSTQKTpHhjGY
         5A6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=nf4+rA43Kt9Mv7AOyCCKgBarZrgUwABieRc07zFXEno=;
        fh=VtJU5PLp7Xxn4QC5HHpIUF/EhwT88uoj+AzeGVp3rsw=;
        b=bGsFfLDyMVrsX3iVWGa4cAJuFWi709pv7aDpeG0cBSJwC3eaDrf011GdhrT1eBq8uj
         FyPgZYwRkzsjL80b0Lbj+8USLqI6A4jkN1ylZgmZhW+460/g6L2pEfsM1c6iRl43XlEf
         ER5wdS90ZtwTvkBUulXM3AM7whJu8kkRXX1dMCpGAhqCy4alLamPiknFZsJccjk1cirn
         HPb7LEroCp54MVv0ZHk0rrMQphvi0pITCZroIGtuiGw32oQvapid3DZoYQaEsSewsUBV
         3L+SksUcB521rxDqPnC0ifFaBUtuaoLZBT69FzlnxNwsNQjP1HzJS0hvPBQ4t9ZCkbNI
         c1sQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZWucTPlP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-3030f77fb04sor4603910a91.5.2025.03.23.12.26.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 23 Mar 2025 12:26:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZWucTPlP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742758015; x=1743362815; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nf4+rA43Kt9Mv7AOyCCKgBarZrgUwABieRc07zFXEno=;
        b=ZWucTPlPav5VHIKLL5PIlBp92tUP4s46pa/BZGqkN24Nt/vxGY2FiUvffdAOubP1z9
         TeaDw8QVAdhFs2CsDjUsFePyGNikklzZV+vM6z1zuOGpaV+YMzRPb2RfVDjTbeSFh5iv
         EJTKoIR+uCyNqPI1GNrO2MbsZVLfbo2mENBtix2llN7wnoKk3/c1rV4oy4Mhsyem3vnO
         GfnNI+bQ0GTjW7anHXH/Ss7r6FkXE03Hfpwt2SURBy2SMT74aorT6ugVFfzynyebUCzC
         zNQGmxRe+wHIu6P+aeZf/lG8ep6hiebCZohLB1gCB0cF3Z+UWWkxfdMEbe7hso8CZ8nl
         XQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742758015; x=1743362815;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nf4+rA43Kt9Mv7AOyCCKgBarZrgUwABieRc07zFXEno=;
        b=mberCCMPCQjaA55YnoSCLmmaCtsMqZM/lj2FFBMwwLOJF644UHqtvlgkrioix8Tei3
         4jRhLgNoj0KoTvXpO058rj6FyioMsgCFVovJB88sx+fg1H6/j6YZuv8uf5BA4F5/bOj+
         jd9TvaiY9QSuRSMHlB5Kcp2ZrtiBYT3klftgbbtihNkXUqeH+8gwR9cMArPQ5Jn5KuRa
         RztsFsH2v5sAFZpXt6RlEGiGrK9tpCZT2Ox23MEQ4knepffKE2AyRB4X713UL8Hp/hGZ
         8A9AMhZo/Ep3RihxHV6muCEy/Qx4s9UvajjWFRbHbXHbr9+2Dcly/FhsVmSy/AQiUNaN
         bNBw==
X-Forwarded-Encrypted: i=1; AJvYcCVllBQBR1UjZmWbNhVaDAzFPdyaIZFjFs2UTDgmipFIyq1te/dDJIL+xlBIEuYh1whbS67qF4ejzkZGwQ==@linaro.org
X-Gm-Message-State: AOJu0YwE2BcVND9P46vNqtRayI+MEfbSjC20MRzC9earr97ZGOdrtVCh
	b3szojjwWul7CC8sQwnRa+2re7H9Q1rvDchIp14tbXgVGzn3nY0CzgCIUZ4YiN3xVg==
X-Gm-Gg: ASbGncuuefJx6irqqr3DDIX0FOa46bzQRVIOHxz2Bac3J0fNOzWSAnMxvvVgPnf17YT
	aJoQSsFWVeIMrsfiHLDONkAf656PZxmkBUYFPOxYuxz0C1ul/AimloZI0LrErK3N6ogbNdu2e/m
	8wU6+/coA0WrblnpmWtHzU8McK7zPYh1G1fQXLOJLwNGbum91xvFS2Br9dIrvJWxUVQBiBh/umg
	2VqlbR6pYzwSY1hxTvA6xnlFXC0SrBNRkGTGcryPgcHruVpBRgbmdo7YkQy7vvi/scc6uJ1mRrn
	LRFWchnA82zUsaO40Ye1fmE99kVgMrgtf4C9DeHzTmn8WmP+hzTl2RyhkgnL8MItiqfZN1Bentf
	kMyIAZ0VW
X-Google-Smtp-Source: AGHT+IHRgCNveshKuDJuoCV+0B+dzaT9aXiMJpElP8KJKw7QemBWMjAKApy0XLHS8tcZ5GFOpDaplA==
X-Received: by 2002:a17:90b:4f84:b0:2ee:a583:e616 with SMTP id 98e67ed59e1d1-3030fe7e2b7mr15835517a91.9.1742758015264;
        Sun, 23 Mar 2025 12:26:55 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3030f5d71b5sm6331942a91.18.2025.03.23.12.26.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Mar 2025 12:26:54 -0700 (PDT)
Message-ID: <61f1bc3a-abcd-4cf5-9d56-1132c8fc3ba7@linaro.org>
Date: Sun, 23 Mar 2025 12:26:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/30] exec/cpu-all: remove BSWAP_NEEDED
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-2-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250320223002.2915728-2-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: bDLdOVq//Vtn

On 3/20/25 15:29, Pierrick Bouvier wrote:
> This identifier is poisoned, so it can't be used from common code
> anyway. We replace all occurrences with its definition directly.
> 
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   include/exec/cpu-all.h    | 12 ------------
>   linux-user/syscall_defs.h |  2 +-
>   bsd-user/elfload.c        |  6 +++---
>   hw/ppc/mac_newworld.c     |  4 +---
>   hw/ppc/mac_oldworld.c     |  4 +---
>   hw/sparc/sun4m.c          |  6 +-----
>   hw/sparc64/sun4u.c        |  6 +-----
>   linux-user/elfload.c      |  8 ++++----
>   8 files changed, 12 insertions(+), 36 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
