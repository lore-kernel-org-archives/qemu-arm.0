Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp589370njc;
        Wed, 19 Mar 2025 16:17:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXUkboiplhMgOvfy3tqmPgyBR8o+PacvakwOUHbC8B+8J0cXf6XQZ/8PuuuQ86GTp/qmKPBfQXzXXR0rQ==@linaro.org
X-Received: by 2002:a05:6a20:9f8c:b0:1f8:e0f5:846d with SMTP id adf61e73a8af0-1fbece41f1dmr9104030637.34.1742426242597;
        Wed, 19 Mar 2025 16:17:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742426242; cv=none;
        d=google.com; s=arc-20240605;
        b=HTFA4jUq9m0uKtitLEFHC0IeTY2ZbxWUGvYa83waw4qG1oCIbQo5mweCJ+I6y4tfGf
         DWYY6mVYH+e+oARnyPS0N2Lpc3Kr6nTZmR/GWd5LUObflvyAQlxALTDxIEfzUD+Jnq6y
         853Z+CrL7lPvJLpiRMeEyfGnhfLAQ8XfK4pORe9v6n6r5zk8+tJJz9J/rCObrI0eWgpz
         2pdF4+GeauhEB49QwFKGv741uZ+h/GDOWF0C0y29l8AjsQBePg0gMHkuQmKIdUQ0LWdN
         YnSVt9h5KZWaWHp/Lgs2IXZi6mE4tuU8y2Qs3DQ2yBgbBt3dHBy8jnavttCtdu4mE6iz
         ojIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ttP94RHuaW+AA9Kr1WQ092r9FjI6PwOL8z/bAPk2OEs=;
        fh=PljLIvrbQJC2+ri++5hhxeFNIJZcputgiUuJsFCeqxE=;
        b=UhKCIB3R2yOcJup/L1UBfJzUFJtoC9PoB4Z6GA5rAP6oOXC8fSXisQdzohMmTPlwx8
         58ICMF1YqI+m0ZLb0LkzmgSl+JUgn0pNbCoRsHuwNhgXSXSXcc8k1HIrjco+X+o7agNd
         +zBpRGlm/3M/mao7WsGBecxqxi13uXnRFwA3TCx91r5M/470u799FV7+t2ZuU7AhS3aP
         hRL21Y9Lvepn9N0CVJbSp3My6sfrpJQb1FzdGWcBrkO3wFNYjZ4dy9Cn37KWk+vEBr+o
         92uULYUX6HKU6Z6Rf9wTSjYv+csKR0uyPoRqlFOBZRLss59Hg5S5OQxoXNRrNnzxy6Xz
         NWeg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tldwo64K;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73712ad91dbsor7169093b3a.1.2025.03.19.16.17.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 19 Mar 2025 16:17:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tldwo64K;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742426242; x=1743031042; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ttP94RHuaW+AA9Kr1WQ092r9FjI6PwOL8z/bAPk2OEs=;
        b=tldwo64KaZ7mN09x+9M4jPcPEwd2zF50Syo3/DGF+scTh+ecM7Xq/UWZvflsa6T8s6
         0M90G+jtVzZk3F2Y4NffS7IuYxL2XEU3B0dqLEgHg0fZP6YlBd3rCD6YykySobHWhoEO
         0SXlh0etsQT/p3QYeZ90ZmhbPXyFyyGy1I2PaDEFYTEXh0zg+rq+0aA/Z9QLzfVMAdKF
         aH5ZOLkaSzejkBy2i3pwuWIYaL4zFxDNAhaLQhAtKrq8IqFwH2vwabOvxtMIi87rBDkR
         oPxK4rCdTMsXpAUzmrMgwrM1BXYInk+YakEH6LRaShGnj+wLESfz9BZq30nY5rTF+P/U
         spgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742426242; x=1743031042;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ttP94RHuaW+AA9Kr1WQ092r9FjI6PwOL8z/bAPk2OEs=;
        b=uwyXW+L1xYVmV2IhYVde4ylNMw8Xv23sS9KnXGbxcu0Bi90AxnKFAhvsIikgJ9bjbi
         2NrOyIVfk3qCKVixxrWYSQ7+akucbTVyQRSSCI6baPDq5v+nf0tPxVN8N9Smy64479sa
         sjZBwuA/VV1JHQNGF2AE+/Dx+PVVj+vHfBCl64NsCz/yR8YDGdo42Dkuthp99CO3Hyq4
         7Bnd/HSyr/PwOR/TuE4xl87exlQdf97M35pcbCYlBREQa90bc1QKcg21MRXzrdFVvy4H
         wN+8iAigfwuUOE1BirVONx0nJkBtVL+0Q9hP/h1CQdAH2SAS271KHQaca250GSGgkYrA
         Afjw==
X-Forwarded-Encrypted: i=1; AJvYcCVdnQFKAO07Ne+FjR5wYz2kZSV06hZAjEANkej2GOMt+pi1vCHeWiSfKL1Pvbhnb9CrvgV0+AknwHdsMg==@linaro.org
X-Gm-Message-State: AOJu0YzjBitHIqVSx7Oknmc/tlTjJxfFwgXLfHewM+cYevMxIERgnmoi
	frz0F5T+yRGDVeRVotTNhOwmoIhufrQSf1J2SzZuyhkFWTxQtNTc4V8FGj1HT/AtzJ+W5/YkmsQ
	mSU0=
X-Gm-Gg: ASbGncs9JrKQnHk9pxzo8mnlObXq8oK7uVXoLx0YNB/DMTo+st6TS2yspEOHwwUwb24
	/p2e9/VRRcqEa+y1ouV+JHAXQZy+nXoYzg+CATzZvnMOoI8EPDELBd5PnC/nsXrYn2zf/HErPJB
	cziqIi3A8v8H31od41rXwbkDehbYCEpImgxniFUNY0yIaZMEnCAKilWNvbfD2A9LnInf2eI8ZBZ
	REuUew6uCUZ6u6k46cQgtYe3K/PxZmVwgqQRhckqN3oGnnWmO6hu3FHmD1jcDZCsVVy7EFAJS0w
	3ICSnAaO7aJF83f7KZsLg+DfJBNDxCOJ6iKCMOopQ1gzGoVUfOiWp9at+A==
X-Google-Smtp-Source: AGHT+IEtBsTb1UciPJqi6Yn3xnP4BzsUVR1YgdarGKsS/r3jPqAR67hjwo2vl8jyIQenMvjoz3v6cg==
X-Received: by 2002:a05:6a21:99a0:b0:1f3:3804:9740 with SMTP id adf61e73a8af0-1fbeb999249mr6978385637.15.1742426242185;
        Wed, 19 Mar 2025 16:17:22 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9e0fd8sm11540538a12.26.2025.03.19.16.17.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 16:17:21 -0700 (PDT)
Message-ID: <8ddf1e1e-7570-475c-aae1-fa715f983131@linaro.org>
Date: Wed, 19 Mar 2025 16:17:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/13] target/arm/cpu: flags2 is always uint64_t
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
 <20250318045125.759259-9-pierrick.bouvier@linaro.org>
 <9556c183-c103-403c-b400-0942d42785d7@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <9556c183-c103-403c-b400-0942d42785d7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 52aDwr+x4au3

On 3/18/25 15:40, Richard Henderson wrote:
> On 3/17/25 21:51, Pierrick Bouvier wrote:
>> Do not rely on target dependent type, but use a fixed type instead.
>> Since the original type is unsigned, it should be safe to extend its
>> size without any side effect.
>>
>> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
>> ---
>>    target/arm/cpu.h        | 2 +-
>>    target/arm/tcg/hflags.c | 4 ++--
>>    2 files changed, 3 insertions(+), 3 deletions(-)
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> We can also remove the comment lower down about cs_base being
> based on target_ulong, since that was changed some time ago:
> 
> exec/translation-block.h:    uint64_t cs_base;
> 
>

Sure.

I updated the comment to this:

   * We collect these two parts in CPUARMTBFlags where they are named
   * flags and flags2 respectively.
   *
- * The flags that are shared between all execution modes, TBFLAG_ANY,
- * are stored in flags.  The flags that are specific to a given mode
- * are stores in flags2.  Since cs_base is sized on the configured
- * address size, flags2 always has 64-bits for A64, and a minimum of
- * 32-bits for A32 and M32.
+ * The flags that are shared between all execution modes, TBFLAG_ANY, 
are stored
+ * in flags. The flags that are specific to a given mode are stored in 
flags2.
+ * flags2 always has 64-bits, even though only 32-bits are used for A32 
and M32.
   *
   * The bits for 32-bit A-profile and M-profile partially overlap:
   *


> 
> r~
