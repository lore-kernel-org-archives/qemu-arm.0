Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp1158373njm;
        Wed, 30 Apr 2025 11:43:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVf71PxNaxcfdnAat4GugFfW2afm6+b2ef77MdjlZvQKcfjX8XuZGOZcPy4G+m6QB9QOmjM5B06G/XGqA==@linaro.org
X-Received: by 2002:a17:903:984:b0:215:a56f:1e50 with SMTP id d9443c01a7336-22e034ae3e7mr7122485ad.8.1746038630907;
        Wed, 30 Apr 2025 11:43:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746038630; cv=none;
        d=google.com; s=arc-20240605;
        b=hI9wTjU0b8CON5FKR75M/Zhc6TJ3ivAOkoobrMdc/XXgJtZGBNLoCxbtwvFrPZVMfW
         TyJa7/lBmdwqwWATj7irPVVhyCl/UWPNjdCJnR4im7pFsMouNfE+UYZlqdfl9gsQyZVn
         R02sLW1b3IvvdjzCSx/AXfFmty2QQuD83R7U/E+lIPhd/iWClG6OoWaeX+AHIilNExlQ
         2pdLYyKQi8Nm0RsEK3J7D2F/xhN4kBlBJr6HCKxroNzk7H4oNhUg5pUlPzCoWKVoFiCk
         tTpT+8ZiFSjrfsw1DP5LapxXzrcdXwQSV4lr0pd70PDrfGp8I2DjQo+CAR4ehhWY+bWb
         XFoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=eERu5hpha4PpgkMhmqqhBzBFgIZvmQXsSQLAuCeFsU4=;
        fh=ztBmMAoLa4jn5zmlWoLexNlvSxyPKH57RZabA7gyvdg=;
        b=CjTHcccj7/C2KnGaiDbcwU8B6d5viXQCWjhyCVcnmVAaHF83BN5vkZ71nUOvXRinF7
         t+EdOSr45DDVN8LWLBax7SHRuaUDz0YfqBc+7vjQzz+IALXr0uZmsk0rvm3Kh3ARPTuG
         GEmgO9zOIPvZkgQjreljEaWQ+kXC+RMvYrPhOqjQgQES7p4mdXLn4G1pAskJZK0/QEFJ
         qBol3axtCh4jSMM88tpIubnAa2q9xzdDpjeSu5AL5w8yl6SK4fiIzsp9kUMPq2gqLWbk
         RFjcbylrA6S0fNH5iPJY/CrXGM4Pdsc2u+XAT9ydy9P0LZMpvG8lnB/bMye6Cq3C61Mx
         fjgw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R7+Vkxib;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22df565b3c1sor12374005ad.6.2025.04.30.11.43.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 11:43:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R7+Vkxib;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746038630; x=1746643430; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eERu5hpha4PpgkMhmqqhBzBFgIZvmQXsSQLAuCeFsU4=;
        b=R7+VkxibgFexLfDqlMTLkPWsp6jEbHijghXLw5vGHq3c6rmIewcRlWQB/Crna2RG9y
         GIcOHM7XQCDSCKCW4eulIGd/HUge2Dy44QOa/Kn+8qI2WOxpx/6xpMqAfeCx8t6UrA9B
         p1bMeQK7Sv84Pmd3dXFq2Stq1ninLLQ3sxqYLlsi8qbbAyf/7/AuqleUiYYzXwoThYKB
         vyR4QICPsIySRZQMAnGwGzvO9A2seS72BzirLCq+ZfRxzOtmX+/PE1Eu4CXld5vzMSvC
         pgB3PAXwsFYlYw9Mh434QOhlPwkR+l2J2Q9OQu9Btbk9q8pHUm6LW1y/gU+jhs55jUvk
         /LZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746038630; x=1746643430;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eERu5hpha4PpgkMhmqqhBzBFgIZvmQXsSQLAuCeFsU4=;
        b=Ke1u6xWJMIOefToqbb03Us40fB6atG5ZM2vUDZ3wLBJxHaSUr/AINeIdRXXyAM0DKZ
         YxrLd0Dymug1hy4XWF/nai7tBgTcybTRgSKrXzro4cQ86VXKmP2fJH7turA7WWRlvOv7
         v+tbpZDuh7p1e0B4IN6CmAH/ulpOKSdc/++NlBprxcGvNZypHq5nUjkZXu7Dzi4Dwu0r
         1vpRZK0QV5M/6rlOFMpV1Z5GIZhOhKQBUK/1UiWb3mkSnaAVsTD0gjJgjvW3Xu5j70oI
         e1B1QMta39NnipGn0Yq2mtTWGu01eO25Z/0VUPgtPzIJPaEkYxMUhwm/xNd8fOL/316t
         BB8A==
X-Forwarded-Encrypted: i=1; AJvYcCUizbr0TM0AMHXVRY6FfZ83ZWltDBvhglwP8yxnTFgP7GaA++vLICcqIPfp3+fS4QpnfLaTt+L5oquIDQ==@linaro.org
X-Gm-Message-State: AOJu0Yw4Aw5B1aIcwILMwFUdmP0yoRYKqW3iWS9znt/ptQKqpNjOFq3N
	cbq3H/1assx5IPFu/zM6FWqEH8293j12JHDe0Cd5OXDhCgjGOTl0dhAJMgG2qFlAJgS4WApwh/Z
	HbCo=
X-Gm-Gg: ASbGnctIocxRfPmunco58Wy1lftlnxpfbeKDV1x1pG6v1ZXLKnyuw6HBk6NMbisNvnk
	glaNzJTdT2l74MepxI9xP/ywuurjBGCMlz6E6oUo/eL05bJAnLxf5Nwv0sNKQ+aPj/5EwM80ETq
	Q9W6YjlJOtMa8Rb2fPiV0VvU8Dk7liXo+qGythgkm7ryPK+Q+6e6Tl+VO6bBj69xy09CjdnVH4W
	Txe89R0Ofdj2nhX8mnKs78y1xpZdyofIDIGX4gQ1rZpIw8sgIQthzs5dJR57f4PmEA8K8L4k0A7
	/BWfNJcfn51sKo3wjI+bNNkDEVq2ieD+UAUQeCf1uwlFi9DimrUnOEhLUluREq0JvKzJvk2ycOi
	nCJisir8=
X-Google-Smtp-Source: AGHT+IFcTY0EafwDz49gNChfNmQsOIOBymhD6KYDInJcF69ZZEdaHOS8/3OcR7xmJH99nfyMr6bJUQ==
X-Received: by 2002:a17:902:f541:b0:216:271d:e06c with SMTP id d9443c01a7336-22e03491b39mr6315505ad.4.1746038630387;
        Wed, 30 Apr 2025 11:43:50 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5221c60sm125821895ad.228.2025.04.30.11.43.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 11:43:49 -0700 (PDT)
Message-ID: <db654764-8377-4080-8f68-7fc61e8eaaae@linaro.org>
Date: Wed, 30 Apr 2025 11:43:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/12] accel/hvf: add hvf_enabled() for common code
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 alex.bennee@linaro.org, anjo@rev.ng
References: <20250430145838.1790471-1-pierrick.bouvier@linaro.org>
 <20250430145838.1790471-8-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250430145838.1790471-8-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: sBU0ysTMn1w7

On 4/30/25 07:58, Pierrick Bouvier wrote:
> +++ b/accel/hvf/hvf-stub.c
> @@ -0,0 +1,3 @@
> +#include "qemu/osdep.h"
> +
> +bool hvf_allowed;

Even small files require license lines.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
