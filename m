Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp485330lfe;
        Mon, 16 Mar 2020 12:51:44 -0700 (PDT)
X-Received: by 2002:a17:90a:a417:: with SMTP id y23mr1172476pjp.184.1584388303872;
        Mon, 16 Mar 2020 12:51:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584388303; cv=none;
        d=google.com; s=arc-20160816;
        b=x9IMlFqAMCwiOEB/AIBceFh0e8nnT6Pg9YB1km2B3ji9IL8PsYuX5KkqeJ7qkTKeZL
         UKwY3OSpSj7bnrkBEPbmJoxTj6lElnP7SX26jJ7oce9zOxrRhpLDt5i/wzJZCICkkV6P
         iIsNgF03Q9UcTAYLnvafyfN/a2YsAPOyFfTG/Y/2GZ4qDNC6JbPHaHKXl/8N/3u7dy8C
         B8Ue/McRJNmazsBdFREajq+vpYF2siWKmuF3GP19c2MUpfQRH9pZ4NjR67L5OCO2h1/w
         Sw8GiHfNjNQiqFqusBJep8X0qLVafOcDm0Z2nVZvwD6zdKG7dlr/Umih39+np+rCs7qa
         0Lyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject
         :dkim-signature;
        bh=dDpacGNq/K7yM6PKdJ9BQLRdTUbRwvHtCgHhyhlKoTg=;
        b=PcJOrN9ZybJyaxQ+USYJ5dP46uTAUmYkBMxIP7wi6WN/SIp0BoSy13mEg1P7suABZK
         jrOdfgt9Bu6QeA7KQpYnC5i562tSQTJCNxNcgc55SuM7DIu9LzEqza3RG9IHAtrkXT0J
         R3HWHFZVDU4oNrz6z3A/gJNhQczo/baiglGpehRdF7EtViLYUio+RVaNJgGTJ68pCnAf
         lSK2iIzyYJdin4WmutAL/Av27/6esATxZrfWKOYYRdK6C9qP43We/5HGJ3aDZdGzf4AN
         hmDlgZuAMYLULWvDuqZipDJk09I9nS+igAeYjgyi13FjZhNf272VcWWBPcQSwhEURsLi
         NgdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AQjrgjZK;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id d16sor877901pll.40.2020.03.16.12.51.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Mar 2020 12:51:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AQjrgjZK;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dDpacGNq/K7yM6PKdJ9BQLRdTUbRwvHtCgHhyhlKoTg=;
        b=AQjrgjZKqVW/SyhQvefTLDqlDuksBjLCZbzgROzXz0n3JVr1JybTnPwHORasM0VeEe
         bq5kFWQxiy7uwsxIt9CDyb3Cq43Ew/R6BEHUV0xOQBY9NyeA/6TKyhKL3I1y7QL9NC/p
         +zamfgWV7c/8s1b/1OzmI0cF5UKQKr6YcirpPVQhPDhEeojdSOBgn3uW4ItALdn4s/E4
         ZXPaw1lxlqJzmAQEmMbkOXThEbnBjtDyx4ciihBUo5D5u9HB4IMzyJOrGm85up3rapRK
         Glg//oOapd89gfUzTPU/7lWeB/O0ZGRy9j+vPrgmOkmGVZ8GS3kzUg/Yq6N4pLhhS8G3
         BWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dDpacGNq/K7yM6PKdJ9BQLRdTUbRwvHtCgHhyhlKoTg=;
        b=UXOZ1STqfwcDuc790miJHCq2tUI0H34DJmdBmZsO5VURrb5vaMGCSGymbpmmoXOsVC
         S5FNqvjF6a5DWX7wgC5DcrTsYnYi68/9nUIbgYEaHRi7OEI6o2wYzASRqUvrcGrjAlhi
         QsPfj0i3oVCkEgVosDBRndU8lzM1Oc4k01f70vLRJ8hboh64uSJ2OiMwzLIvaRpWeg7x
         M4LoppFXrAkQIF2yD2Yh9oTwYdub5EZfB+/fq/NN/UT1AY1WPoDz4lwCL3n6+PI7EWEo
         d5jL6kLtaug8l90VrhGO0dCSPfpgK6Y1FAVJQNJ8gANznrqBBcQh+oiDIcioKDo4dOC0
         dhXw==
X-Gm-Message-State: ANhLgQ0VEyxjOUlxjhsDWTqWi+flxCe1Crq3iKEIl6M8MKxaZeklVXt2
	fLQeeXxYS8oUn52zY6sI+DTG0jPGWrQeLQ==
X-Google-Smtp-Source: ADFU+vvjl9rPaCPg+vR6UzDGMf3+UPc19rwSelQmwlrtWB0EVNu6h7E4JtH8civEN52sD0o5SxTzKA==
X-Received: by 2002:a17:902:a9c5:: with SMTP id b5mr789269plr.126.1584388303264;
        Mon, 16 Mar 2020 12:51:43 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id j19sm671763pfe.102.2020.03.16.12.51.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2020 12:51:42 -0700 (PDT)
Subject: Re: [PATCH v3 10/19] target/arm: Restrict ARMv4 cpus to TCG accel
From: Richard Henderson <richard.henderson@linaro.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200316160634.3386-1-philmd@redhat.com>
 <20200316160634.3386-11-philmd@redhat.com>
 <b5c047f3-ab3e-825d-35c8-b24c8efc616e@linaro.org>
Message-ID: <bd65d0e1-c94a-6823-cd5b-41aeef8df260@linaro.org>
Date: Mon, 16 Mar 2020 12:51:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <b5c047f3-ab3e-825d-35c8-b24c8efc616e@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: wmnUEik20RKl

On 3/16/20 12:50 PM, Richard Henderson wrote:
> I much prefer ARRAY_SIZE() to sentinels.
> I know the existing code make much use of them,
> but we don't need to replicate that here.

... but otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
