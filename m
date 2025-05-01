Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp283408njj;
        Thu, 1 May 2025 08:30:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXdS38G9yTcXhcg24zOblSj1e7eD4AYurqeEvIA74FQ7T2JcvL8mqvZFDweIcf0P+rNzTgQkpPZFJxQbQ==@linaro.org
X-Received: by 2002:a17:903:2283:b0:224:191d:8a87 with SMTP id d9443c01a7336-22e0842bd68mr38398635ad.26.1746113456248;
        Thu, 01 May 2025 08:30:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746113456; cv=none;
        d=google.com; s=arc-20240605;
        b=LAER7nXBOUV8jIMETQOcCjgH0uVW9ln8Q5E16DVI8B1b92cTVMxxSx/UnDMWCNVE98
         cEqJeaikoqIlZqQjQPPPY+lg8Vpypm1G7Vh4KaABPixSaqN1Ltdn/af/LS9mTeK8SfSl
         ly3pZFMU0tbP6b3rgoFZKrZKWnka0k5CNlF7CmBOWc7Z2cA3WuRGpzpLhRKCErMwpd+2
         d25TJFpKucuDP3WNjABVtNRzqJxhl+fwhCfq18Jg78YX1/wT8R97PqOAE0Cn8vDMniiX
         uTM2ToP8il21J1KhKWmKIJY68EzNWGVn3g4o+l3H9ScldytXBA23a2Q76LtTQg2Y37/h
         batg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=oTb37Xh3764UHx4GkunEtiY4YocHVNCV/2Hme8te8Ks=;
        fh=umh6n6d5XNDQXk3jKeQTrCTPEsut/fyWiGrPKUA+Rgw=;
        b=GdJvojEkiGWW4YJ3NSc9saBuxVvHjtfcmwJZDO7Wul2NiFVEqiWWVz1w+ZfZfw/55N
         CJMe4DZNut3PLl6F5jaUcuc9nKGW9jVgr2+GA1sLS51F+HSVFyhiBT8w5ernrw/WmFPR
         n7fRWOmWCP132nO5iAKggkYDAUa9sZEPF8RSQwII1418Ns5/WH7um4QGEmNc8HsOZMDX
         ePiBECpmvIQR/w0QcCX+12QFOwMHJ1kyUSWOgiFvuQXFBTJiMb37gD4Tg+kKfXeDcs7P
         meWOgP1nhm8wl+uWDzSJNmV2GlOV8ss6NDR7Z+B3UOMvO8SIksjbkXk7XbV64U53UwQt
         l3og==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GC8eMWXz;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb28e5asor6143725ad.8.2025.05.01.08.30.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 May 2025 08:30:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GC8eMWXz;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746113455; x=1746718255; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oTb37Xh3764UHx4GkunEtiY4YocHVNCV/2Hme8te8Ks=;
        b=GC8eMWXzOsZ2mwBQG29zd8dMMtZ8oDt04/SJeM5lxW9sJbIF8HWJv8q2siBHs62EnR
         EN8yi1Gdr3lJOmiXk5DfBYaFqURORwGTs4F4a89Ll+/mdT7f5hQpt7JoV1xOkg0BtkSj
         2PTzu7WgrHIiHBv345Txe4k7Sqo2/ylOQO59Db9FjXN95WfXHHZKodWB261h8QL9c3Re
         Vxt9n64dZcDPDEeSBH2Gz/8PV1LBM0wkHP3udfgQgT/GBVyrY9aqEWTNr47sojXHhtD4
         FloSx40bXPAVcApQsYRpCp8KUYTctz+V+RbaZZ3sn1qyfjPz1HvOK9jKJfRUIM8cnPyY
         XeaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746113455; x=1746718255;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oTb37Xh3764UHx4GkunEtiY4YocHVNCV/2Hme8te8Ks=;
        b=ubq3FhPZ9pUdZFo1MiN/w+IfYS09hEgiKbqEoO503eKXo2fCVwIA5anJm/XgLd8o18
         9DsIYCGjmuDwS2OvMLYhoo+G9RGj6gj+yq9/6i3F+pofcKhbkMyUENVuBmCApD1PFamE
         nSjN1iVyjz7pbEqAFq8zoVHtCkrkAHMGbOJrpww/vAogi3EOIcc06XTFlohHn/3v4tyW
         JVeEK/CpRM8ArRrfYqN8raicwjA67EMKvtqEGQnuKEWAG6sPX/A9jw0eqOkAUCW10mw1
         WTENMJMwxDO71P66JRFLjLOlSL7ro16hiRXYs7JaASVRNRH5J/D/FcG9079NYtBiK9CM
         wPWw==
X-Forwarded-Encrypted: i=1; AJvYcCUEt+wtouQSNUrxHrCyBUUQcfdx8Ld7F1lHprmxhGDOCfqGbz27Ium++GSwFqq4JDovGmbgwNcFp/ueag==@linaro.org
X-Gm-Message-State: AOJu0Yy3mA+1j3f2tPtZjdw3DUqiWVcFh/dji9q8pyTTnTwiMqbk/QbG
	w+N3v2DQkdhcJ1QBARvGZeLNN52viLuYVHX0iBxDuMoihK0hyPDzKRSTpUm6GXCJSA==
X-Gm-Gg: ASbGncu8wMvxCespBEAPEksuDOUFcYxfqgQVh5fCkr27tOs/XaehQZCcx52NvERAMLi
	H8tnp5ABjKiJrLY4TpeWwvI160HuzweO1rdOJsm522crhJMXXRI3p7tlbMl3wya/5okjASmDP50
	vJLLxF7tFwRK65dkLepzhhYiomCqfo3P6oi/6gwYeZJ3MCDpvi/KnD70JwjfXS0HZ9pNKMY6DqP
	2OPAR73TNc6OOI7TnZUaigSWK2HIshRXwk+gQCQ339inO8S6RmjE4aj3kw4dxaV2eVNv0pVoOFr
	p9dWPkEkL+9N58RF43oxxiPDYFAuseGhyZ5YOMzz7veOHMpblfJt4qP7TUwCT6h0CXBPQNkZFUD
	+ESe/pgM=
X-Google-Smtp-Source: AGHT+IGzeJ0uKlST6RHLeyXfLwxl9azhIspU6tXs0Mg6AOMGNGmywhrNGTAzy4CllvHWvHp61PdBtQ==
X-Received: by 2002:a17:902:f548:b0:21f:4649:fd49 with SMTP id d9443c01a7336-22e0863efbfmr42799735ad.49.1746113455692;
        Thu, 01 May 2025 08:30:55 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1f9d4b2622sm750511a12.17.2025.05.01.08.30.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 08:30:55 -0700 (PDT)
Message-ID: <d21a3e99-14c2-4eb2-b331-bd39b8374ec6@linaro.org>
Date: Thu, 1 May 2025 08:30:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 28/33] target/arm/cortex-regs: compile file once
 (system)
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-29-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250501062344.2526061-29-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: NrV/oJsFFAe3

On 4/30/25 23:23, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   target/arm/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
