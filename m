Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2652467njj;
        Mon, 5 May 2025 11:55:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW3Vp19lvSfnOHMaLqIjHFclEV0or4ZSsk2G26nxQUjmvcZG63ZL0I/IvZGvyim5tv1JrdjR/MDweRMrw==@linaro.org
X-Received: by 2002:a17:903:166e:b0:21f:74ec:1ff0 with SMTP id d9443c01a7336-22e32eee9d1mr7637235ad.32.1746471301767;
        Mon, 05 May 2025 11:55:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746471301; cv=none;
        d=google.com; s=arc-20240605;
        b=goasivgmA4/Rekdg15d5Knf53/iUEC3K828EPJ80zzulW6rtuZ952creOsByyhkIqe
         g+pN9m0cEWpOhwX0QWryXbrzV8sBfGr2lZ4NSFNkPMXyg5WGPbJSKXPaFGi6K8K2uSAC
         sd0rjuXc4vlA+GC7eeAOXy5lYiVJlBNN3JDT3rqARgPQ+jbTENriyIbY3/5Z8bweXxjP
         jUJTtlqjxicwcknCEfu7w6cMhWRkSU9o8eftzxyxqe7iWY/HDfAMc/vFxWxT6CF6dx1u
         paa+d0aaMd/C9y4smh6lEPfIYl5m+BipqBzWYdfOGzgHkFpEnLijUd16Id3XoXBClvVT
         za5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=2tArViPRB1GJjy/q5BtW0DqhJ4z03XY+HqCT81/fRSs=;
        fh=H3Tl+nfJRSwn5kQUC/phIEd7xpjhyGVHbZEHm27w64Q=;
        b=Wj4Pjj8s0s0BoHqebvHomwaeGm2KXeVLRHXOtYWBxvlbD6TmIirn+XokZIvf2+/xX9
         SrAz2M4QnwjXe2mQxEeqYXEH6aXJ5N15ysOwD4GcyoQYb3n9q/WDMNSC73PakWBpLmbP
         On2TI48XqcpDEu5AbuZptXlv3Fghg7jFw1Ek0JqdMG5T75w/2/EkMEFw+iYJQ2OOoect
         794zbRGZdqcfMbxdcLPsd3gJgffENT/+WODcZlqUjAPK0007t6dsuEAyvvK70m71vdvg
         PoVwsqVEP3fsm76PVsfCc9o19IVy3a29vMn09djXKHF+9H2rtrMDtJgr4B/fbgbDNR/x
         7r1w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="O4N/4w3j";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0ba9f78asor71926265ad.0.2025.05.05.11.55.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 11:55:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="O4N/4w3j";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746471301; x=1747076101; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2tArViPRB1GJjy/q5BtW0DqhJ4z03XY+HqCT81/fRSs=;
        b=O4N/4w3j3Bc1En1Y9RW5G8hjzevzLCi/nnHzEWUjuixd04lcZ1xvHlfHQBD/gWdraB
         h/P0irl/0BLVSklLadteSOoYoaXW1wYIySqsCcjtia5Gd6fLZZe4DsTMRcKCJAC1j5fw
         yaSQu8vBYpBi7wGA1mZTNuVF7lwbMUHSKbcgG/AvvoE6y8dUQdkBCbJCgvXJYa49Kwix
         tJAis+MTACfx356sqKJQKqISGKO6fYCSggjnNy6oh6/SagwsDW9L62RZ1NOeF5897fmT
         xUsp6y+ZMc80t1E9V35oJpd74+shexs8VCl4KXXqD3OE9OLKNC7HizqG0DW9Rtgtek/l
         +k1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746471301; x=1747076101;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2tArViPRB1GJjy/q5BtW0DqhJ4z03XY+HqCT81/fRSs=;
        b=cYtDr5YeIgHiOn5CPW2AKsb319XNts+fLJkvozD16miKCdECo0bFpu2HK2n9HAl0aZ
         yI+ITpKe2/ahc/oGT21aTx2yp0LoyUiuaxO1Yk98zgWQkaV7h6R/Jcb/WNCnmY5ms4/F
         yMalJ1NHXvIlwGxdFGPfVLE4GO+h4xt4hSbx4+YWFBYGga1Ho9D6/8nhTgNHsvvOYF9E
         VyfjWv9E7v6eLpjR+0NC/kKi8FWoBl5zYU/f/gj8Ijgq4Ck2ddY+jwkAPvbtLXBy/bgR
         eqGaPl65F2v6cIRyjVkvdNM8eR1hlz3OgyF39ighCeo803VIU3OXG+Vf1GO/Ze4nHQ/L
         f8Zg==
X-Forwarded-Encrypted: i=1; AJvYcCX4aIftqys+F966/OuIS8a43Ks6iHIPDDpYUGGsiSTQlUQWv76yW5rrPpVbAEljPd5iofzYhpEnrzIKqw==@linaro.org
X-Gm-Message-State: AOJu0YzM55v3ZXEnRuEPpjKpMPjWQ7d0IWtTlP+sTQhWTF8WqcX6R8gH
	w5rgzP6lDBqiJeBXXhLw7J0XCIYaVq0YNHEuKfEV9ABq3xoEvbJobqXdo9X/lzLJWA==
X-Gm-Gg: ASbGncsiJhfUX26PB5SFTQCyoP6NX+t3nNu3Ki8I9DINfDKMGMQnLxaWrBd1ob2qQBX
	uIBXHoYUuydojqDKUY6E17XZk2YMlUIGrqgGnit1Y/IjLESWEQ00wMGNdyqZn6S4byLx23ErzFS
	DdzAO41bl68XNOfKKZOiTTivZ1iaJRvscIyCHQc9hG5k3GKsRZru6/wtqYkGtC8cp1uDSLL2sze
	YcDXSeDLQRSqi3JGvP+AOtN6+2VAQOUwZsQOiZvl3Na5LziGYE45hNJjwAIeMCvdhAMn9jXfdPx
	zujMMoGY0zBpM48/ddvu5mqjO9vaHgmeZthBdMl9LjkvQgFwhbLFpPPndV+FnAKwN12E7XX453I
	2NL+buJo=
X-Google-Smtp-Source: AGHT+IG4lDQTWqhb76vcNURL+Gt2usSacxFfYEmKrIk9koaQo2PtFh9GptOwkZFky9BYmlZUsaJOCQ==
X-Received: by 2002:a17:902:f64c:b0:21f:f3d:d533 with SMTP id d9443c01a7336-22e328a0c59mr7282395ad.2.1746471301306;
        Mon, 05 May 2025 11:55:01 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522911bsm58473495ad.191.2025.05.05.11.55.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 11:55:00 -0700 (PDT)
Message-ID: <e8eee40f-3785-4816-b96a-af022b3031b1@linaro.org>
Date: Mon, 5 May 2025 11:54:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 47/48] target/arm/tcg/arith_helper: compile file twice
 (system, user)
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
 <20250505015223.3895275-48-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250505015223.3895275-48-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: RXg2oxcaYG9y

On 5/4/25 18:52, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/tcg/arith_helper.c | 4 +++-
>   target/arm/tcg/meson.build    | 3 ++-
>   2 files changed, 5 insertions(+), 2 deletions(-)

This one doesn't use CPUARMState, so we can probably drop the cpu.h include, and thus 
always build once.

r~
