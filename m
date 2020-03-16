Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp510341lfe;
        Mon, 16 Mar 2020 13:16:35 -0700 (PDT)
X-Received: by 2002:a17:90a:62cb:: with SMTP id k11mr1365426pjs.20.1584389795424;
        Mon, 16 Mar 2020 13:16:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584389795; cv=none;
        d=google.com; s=arc-20160816;
        b=hWZtlkRVC00eXpZI1J04B+Tv0xkmYxGJvXm2zQxRQHPlp7r3NOLt31dzX13BrcGeyU
         xmr6LBSASya9THJBtJiSmg+f7pty8sqgfyYeKIdEg2obdgFo4xvHKmDPvf6KeyssLPGM
         jBNuVqCMBtvHr+cRhgIU/BN6IaLX9ZZ9ezFxH8y5hnWH/LJMfl0cKSXA05KmRmhZIklj
         Pr2/eZdVocVnflENfHkbUr2T5cbNyeHcmKoW1IRSM08Mv6zRkyboNWIPJkbR9E3VG6uy
         DJBaMfcmvXtgBtjmhCdDMnI7ZVTJw+zWAObaDJmdFl9pBnR0abQKDa8w2RjObagKDt7W
         9qPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=FhITnVcXOIhnDs6uomlU7NICQahFSW5Nno5Xh6Sq2S4=;
        b=PR8K3uMQoY8WuLJRhB7jbWmEjwgaO6h7QR0sk1C8QLgEz9it7A8DxebNupyAbU5rPH
         trhT8Tute4mZCSFG6/SvTB+qwIkjIhlWR47R/88YiLsWYlvhYDtwOFyaGHLxVu3MPxpY
         jTXDXjjUGc/tW1Yf1dqc7OMZ7tlM6bCT87lDy4vJXWk3sStpXXvU3Z/brIoUR+o9O514
         cifI7sEsDGVGTjl2uEhVuNF9rez2DUuVRzWpS6stdDy5a0fdwqY+9vv86XMMomq22ArG
         32WMRcwQtqJuU2Z49DSB8YrHvoK8RQ8LG34F40NYRRKGn8ABlevk4ZyEoRH3o8QJV+Y+
         chVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FoJB4AMP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id j4sor945194pjn.18.2020.03.16.13.16.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Mar 2020 13:16:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FoJB4AMP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FhITnVcXOIhnDs6uomlU7NICQahFSW5Nno5Xh6Sq2S4=;
        b=FoJB4AMPXLMvqJ/PwEVqdjzE4axxigJIAJXVIgptDfwHvaprZTEE5YOdc/y1goBOvu
         4ZZaQY5MzFzgkwfBhc4G6K7luBCzEvSeoGcAaYETYA7PnJtCwMVh8x/6uMPN5r/rJgGe
         YvRU50ybHtZ0mOlJF+eVXe7HpEaZrykr6uypERcyCu8bFl/CtCsdL0lE+IqAYOw0mHse
         AftV/lzKuiYcwTV9dV9xl96SMyhsFYDe2VXitZfHl2W6PrAaSmtQp92OiscOzfWMIIXG
         1Ek0faM4ssdTahTxkQcazBtwMjZurKMef+/NGaY6EsxiQaKqFpYLIQQbwlUIk/7+peV1
         mfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FhITnVcXOIhnDs6uomlU7NICQahFSW5Nno5Xh6Sq2S4=;
        b=b+MUV09I9oAsRvAr8HZJb09wXxp61USxHyxlfKteLUXYGHAs31FyO7WWFlEO98sRvi
         HKtPlHMIk4gV4fQ2fRv8czj+K/jSxePiK59ZCmNRo/vMLfxsIuevNWrb435b4jzIR+YC
         Dxfatkpw6h2b0QKNNTMTemMeKq6l3QQp33P869XZYtYq3l9HqNDQ4ijRCP32kYBvbdKQ
         n8sKCc4mxKBeomJ+zeJS4ZZ+oa3rmuSTWqqTrZKXe1U1utd1sV2z0aoZkcdELro+Nv7v
         kN3zeCzxyPvX7KS29ItXe5Zs6w+csX9DqKLzhQ1OXGgwxy6PlwERdUQRxgxBxWKbFqCk
         gU0g==
X-Gm-Message-State: ANhLgQ3rMS7Fm52MWV6PKr+la1dKv7aV5CP/u9G0UhPZqUI1phFThjml
	uAV5T67of53h7nHLb/oJBVrt9db2
X-Google-Smtp-Source: ADFU+vvXz6vFHeF1yKbPbpgcnf+53vX8VlT/JrnRIIROKRDHpkh55asOanh1rtAanRMRpWVarvC1uw==
X-Received: by 2002:a17:90b:d8d:: with SMTP id bg13mr1312350pjb.29.1584389794888;
        Mon, 16 Mar 2020 13:16:34 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id 67sm677082pfe.168.2020.03.16.13.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2020 13:16:34 -0700 (PDT)
Subject: Re: [PATCH v3 01/19] target/arm: Rename KVM set_feature() as
 kvm_set_feature()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200316160634.3386-1-philmd@redhat.com>
 <20200316160634.3386-2-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cb3178f1-5a0c-b11c-a012-c41beeb66cd2@linaro.org>
Date: Mon, 16 Mar 2020 13:16:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200316160634.3386-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: W1nPgzNkyVKT

On 3/16/20 9:06 AM, Philippe Mathieu-Daudé wrote:
> +++ b/target/arm/kvm32.c
> @@ -22,7 +22,7 @@
>  #include "internals.h"
>  #include "qemu/log.h"
>  
> -static inline void set_feature(uint64_t *features, int feature)
> +static inline void kvm_set_feature(uint64_t *features, int feature)

Why, what's wrong with the existing name?
Plus, with patch 2, you can just remove these.


r~
