Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp2665359wrm;
        Thu, 10 Oct 2019 10:33:07 -0700 (PDT)
X-Received: by 2002:a81:4d44:: with SMTP id a65mr8368631ywb.24.1570728787309;
        Thu, 10 Oct 2019 10:33:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570728787; cv=none;
        d=google.com; s=arc-20160816;
        b=uRk5E7GYEEEkl9sUeMELvHWMXCGLsKujSXuI/adFyG4L3zdgl/SoVaTD33x22veyqk
         NPVBJbgUi189OkTRRMgQLttFEH/nia/2eAJZIGuPtQiNunCpqecXwmrRyMk8gMgcnt0F
         Aky3Vbm+rtJa40YtP9IIkDz5+5F6gMn82B+xreHGtzVIfocFpezAZwjLjo+jXl/jiMwW
         4vSuoY2FjnjYND1N1ebBYvd9Nrdlm94ypLJkJGi2XmyVFwNtsjnXKiYEOBvzlrCkHA9Q
         qZQTuanHPhuBKqCKnB7FEl641b351bmosOCC3dNaO4TET6+CGkn6nJRt/nTJSV5ZJoVa
         OacQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=gcW3IYs5nfyJdOZj8TvbqqqMdLvirZp+fSU6XHQ36Mc=;
        b=KUFFQr3oTR2I9JzT7vtBCCe7vb+ZOPoE8OdSdNiOtVIZ5IvE5PbL5y1LbEsFdM51v0
         ihCbOzpT6VKZzXoTSTgy2dMVhvtEd0s9yHWeKuONTe5xD/q4pSzo8uRNpaKP9x4Z2U5c
         2y146hYXN0xF4JXk8kfcNpiuC+OJfwKRIuRohSa0Um/jDWpLkOA04Zm8DnHwEEwP+rl9
         doW17sM1ehzR+FdZfHsm/bA7K3vJzZmiSBIkoox8/FSibf/bXNi7cqaMwDm64WbeT4CP
         qiv5waejZKT9qgWQQetUdzmFOWezBVSLdX7TX6GAd0H57m29LQEEUJwRKJCVQKKn0obn
         LHpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lm7lldzV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a12sor3562118ybk.174.2019.10.10.10.33.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 10 Oct 2019 10:33:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lm7lldzV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gcW3IYs5nfyJdOZj8TvbqqqMdLvirZp+fSU6XHQ36Mc=;
        b=lm7lldzVqgE434ug4IKW6hpD71Zp1cVFKHP5XZYo4Vn7D/w0fvmjCg0Dz9fOBELX1E
         RaQYVfKEUh+c1JcD+6bATtqsZhgfDzR7f8AfRgRZmNJeqtg47Yj1/+gwG4NpD1EwxEas
         gy7OGndYdla1+Lr+7r39yUiFkhMFhGE8O4I/4zn2/KbD6pCedU1R8/JoPKJKjf/bKUMu
         Z6rWO9UrEfVFPFlsCjxVHuPgHGvK26+3xcPtASxzioNyJ8TRoh8XIr8GeANFtsA+SHtI
         IwpERCQpthY7Htq6oVxHE9iLQ/5uvodOYNGK+m0DrhyG4q1XI/R1Mvqe6D/AayMq2O99
         DEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gcW3IYs5nfyJdOZj8TvbqqqMdLvirZp+fSU6XHQ36Mc=;
        b=AezFHSizyAZD/xg1q5Kglv/C1Q+6Rbc2FNy1qeLOiBJA0fn8SRAEyKhjx4MQ4ywiDW
         a4q8kBELVz5iPTL3bcD7zC/bEMqe6AUg2J6RjoNP8ys4WQDJg53EOFLIvQt6i4ofCT3g
         Npx/ms1dIRCtgJf1dzu0ekYVstX7Kgk8EI+wvyi8Vgn5vtExonXgpBSJeqnTe5tQKhXS
         OPsfNd2iNXbiq+jguGhAFu/dmuEDOOZuGgNvNAf4dZcSrV6V7TetNRg3D+PnHc10K9ks
         X/spoIjHE6UMiG1zM4+thrb40MI91BX6NyDrW2qDn7ZA1Sr1GlNj5G/fIpe1qwn728/u
         ysLg==
X-Gm-Message-State: APjAAAWPl0wA7c3+Yc4oNCZzytCV2VpQo7/O44cYM7If4W3nuTkGvMHK
	4x9We0RVlBI9t4NqSDnMVt1/gOg5
X-Google-Smtp-Source: APXvYqx0V9RfI1qkmPr8Jnoj3MepiHPZnhY0bh/qnsvv3yarYgxqrzRRNSggl3N/sZhxSUqBJrnA8g==
X-Received: by 2002:a25:204:: with SMTP id 4mr7084230ybc.242.1570728786739;
        Thu, 10 Oct 2019 10:33:06 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.44] (67.216.151.25.pool.hargray.net. [67.216.151.25])
        by smtp.gmail.com with ESMTPSA id w123sm1688740yww.22.2019.10.10.10.33.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Oct 2019 10:33:05 -0700 (PDT)
Subject: Re: [PATCH v2] target/arm/arch_dump: Add SVE notes
To: Andrew Jones <drjones@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 alex.bennee@linaro.org, Dave.Martin@arm.com, eric.auger@redhat.com
References: <20191004120313.5347-1-drjones@redhat.com>
 <f23153f2-35be-f74d-ad7b-d9c324cba1cf@linaro.org>
 <20191010061600.pwhos4huazbsv6kn@kamzik.brq.redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <6451070f-9488-cc8f-2f4b-a7577e11f447@linaro.org>
Date: Thu, 10 Oct 2019 13:33:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191010061600.pwhos4huazbsv6kn@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 9aK24MmnRAFz

On 10/10/19 2:16 AM, Andrew Jones wrote:
>> It might be best to avoid the ifdef altogether:
>>
>>     for (i = 0; i < 32; ++i) {
>>         uint64_t *d = (uint64_t *)&buf[sve_zreg_offset(vq, i)];
>>         for (j = 0; j < vq * 2; ++j) {
>>             d[j] = cpu_to_le64(env->vfp.zregs[i].d[j]);
>>         }
>>     }
>>
>> The compiler may well transform the inner loop to memcpy for little-endian
>> host, but even if it doesn't core dumping is hardly performance sensitive.
> 
> True. I even had something like the above at first, but then
> overcomplicated it with the #ifdef-ing.

Ah, I wonder if you changed things around with the ifdefs due to the pregs.
There's no trivial solution for those.  It'd be nice to share the bswapping
subroutine that you add in the SVE KVM patch set, and size the temporary array
using ARM_MAX_VQ.


r~
