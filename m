Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp1160603njm;
        Wed, 30 Apr 2025 11:48:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXZNll2CMUCYRwrXt01Gnz9i62PIL7jRjr7b3HHGHRQsqsyaRnEL9Z6WbhTkmsWyecvv/+jAzQ6lf9lAA==@linaro.org
X-Received: by 2002:a17:903:3c4d:b0:220:d909:1734 with SMTP id d9443c01a7336-22e040bf3f1mr2362485ad.14.1746038880322;
        Wed, 30 Apr 2025 11:48:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746038880; cv=none;
        d=google.com; s=arc-20240605;
        b=bwxxxpUX1/nr/GjGDp92AIrQX94oTYHfCiQuI8AAeLXV4KplBBGEaFYMHZpNHbARui
         8Ss/miFWjRyKfXVlT7IkTbSGbz4pGIAtpg2wU8vKz4+7KnIjjUFeHSOgmjKXTT4cNXph
         OQKHnfFLLFsHf1v9R4RoG+ubPLwKiRr4qVSvuhGeMMZWIO9J4MvnoqSZViGVufc3/d/2
         coVP7MdcOnQHHywUTvRu4KERNr1pyY48fzj+tc2HjLrgpCyn++lSaFdZgst9uAJ8i0bK
         PhFwk9UsMAPW7lpAclygnJeFQW15IBMgAagO0JvlyIABiglcNbyD7quIVLSZCUHEKGGM
         KDbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=6JkT8Xl1TSD2JMlrucYuTh8fIekL0brqGTy6sex4sQU=;
        fh=WuisRR0b6ueQ/IT2YM9+uVhaOWGLftLIrzJ5Fvf2C5c=;
        b=XJ+s1zZBQbZ4sCqVADvfeavCvkDHPG4RGmtUXu4uMSZT8LWXTikgskzxpgzLf5ImbK
         XRooxnnNYh7zU7xTWCLD3RIDXlMu3LMjMuAPL9ZScraZEELU0mY2gYEoJi8TEK+8RgRY
         CHbT4fkbzoKK6GsNqC6YLZVoxmxk208pizKOvGJud6LO0VuE2vNiDbQnTdnms0LqH2jj
         KHmLe19sWrK4RZbj0rnZSdoOfy9BJkpI/swH/FKtw4Db1TnXnHmqrhlnLk4rPwLkgCAe
         yuczHY7yoSek5sjcBVDJQq15ZfVYIAyaFxcPmqVbgc5/2E4SiO0IDSPrZ+dnPvGxWSbf
         QJtA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TSbSzmg2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db511098asor95662275ad.11.2025.04.30.11.48.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 11:48:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TSbSzmg2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746038880; x=1746643680; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6JkT8Xl1TSD2JMlrucYuTh8fIekL0brqGTy6sex4sQU=;
        b=TSbSzmg2z4mbtUKeq/qiJtUeOxlkMPfl6u+V5CvnMPNW6kkWLK+b8BR2wecjUPQyaN
         3y06N/xhO0l3zKPUo3RZdpMLMhWSGfVCF5S6HV4j4f69t3Cl4N5mNJSIFUVgAmPOFD0g
         1N3jdQ8x28HlredG60oXHpZU+/UfsSknHuHyMxwimBTEm7Gn0LkjqjUQXoxHbia3UofI
         ZBYhkD2E4/2osiTkfcmUUbjtXotsKvBAikkl2KC7og09owKFLT373AHRMyqTm35PVS4C
         qHrG79MOOY8DfibsoQGBK3Cyrib40wxY2ny1n93K9G/UsX78ChqzKZURZwfQAEJ/BJhK
         URcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746038880; x=1746643680;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6JkT8Xl1TSD2JMlrucYuTh8fIekL0brqGTy6sex4sQU=;
        b=o2M4aFETd2QAktvxJOZQh3KGd6xmvEvphz8lmMPW2yIO6QVjmJXkwiFkWGEwK8rfFe
         S0NoJaUa6m93cdxHviosMp0YUfP+q3xgg0zybIa+Xx4TVR2a34Wxvs0im78pH2g7EP8Q
         GQtZWTkzdItuG93wBlVoL8mY7cYTDX/mVsUSfvfRFPQX54MHB5uudzQWy8ujQ6g2LNvj
         hKy4WrIHZsr7lVL6gAv+3Ty9mL4WMN96thGmmuSKv+KU3ELbRGB4MrCd40eR/IqpbwN/
         5Xa9x2UFDw3vWUPZosVM5b4GnNzv7U/eNdZdL0jwUGiws1uEF3aiQQ580ohLfcdgfta7
         juEg==
X-Forwarded-Encrypted: i=1; AJvYcCWEm2tP0Vh59jctJiKm8gKz0Ei/V7fE66G+BTJw+LtqwnxinXCI5uN6C2lNXRVGXwKFmXnCGbiFlnqK8w==@linaro.org
X-Gm-Message-State: AOJu0YwQ/V6hrre54z2g6vNEArD9aWoCl7yT8nILD5EEm2buGQRsxfAZ
	7n4B9mn/iXuxnuKWFhpKV1EZDah2Iprli+5RW7+PeGJYfL9IjzvRze5A660gGjH+Xg==
X-Gm-Gg: ASbGncudIdCwzqf9zcrxuTRAQwdSQ3vIp/ahQlOqQfZ+UYgtzXA/yLxQiQ4OBLdwKcO
	sB6T4XK2dRsvqEHaFye4KG2DRgIu90bhc7MYhirCRlumNOISYgggVMq5TA5hRgVlq65d6wNymrl
	w2sPsbMOEnCsv8WAFcDu814cZWSWQ29shduVRtve8MMcxzbwucIsLedpSzl6hdbrItjncvXouDC
	+RLYecL/6EdDWAOu20aTNCZLllosuTm/3iTheAQIye/IrKNNn0kJnpTChfPjKMXVuL0Keyu13Vg
	KjkvsGAiYnr3WMDrT2YUNokxyvGMAlypZt9RDJsW5YI9nLbIVqCeJMWlmh1EHu4w3AgKrzxNeAB
	SFU5TVfc=
X-Google-Smtp-Source: AGHT+IHBg+zhfXus0cSoBM1olqTbRBiyZ7d5GFmOywBPYAuNBzjBpfDak2xp1ElEStVqIw5M9m1Wjw==
X-Received: by 2002:a05:6a21:398f:b0:1f5:97c3:41b9 with SMTP id adf61e73a8af0-20ba6a2019cmr465941637.5.1746038879803;
        Wed, 30 Apr 2025 11:47:59 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15fa80fbb5sm11036284a12.55.2025.04.30.11.47.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 11:47:59 -0700 (PDT)
Message-ID: <8520456e-3e44-4028-976a-45d683610a8e@linaro.org>
Date: Wed, 30 Apr 2025 11:47:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/12] target/arm/cpu: remove TARGET_AARCH64 in
 arm_cpu_finalize_features
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 alex.bennee@linaro.org, anjo@rev.ng
References: <20250430145838.1790471-1-pierrick.bouvier@linaro.org>
 <20250430145838.1790471-11-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250430145838.1790471-11-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: YVFoDh/5QZtC

On 4/30/25 07:58, Pierrick Bouvier wrote:
> new file mode 100644
> index 00000000000..fda7ccee4b5
> --- /dev/null
> +++ b/target/arm/cpu32-stubs.c
> @@ -0,0 +1,24 @@
> +#include "qemu/osdep.h"
> +#include "target/arm/cpu.h"

Need license comment.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
