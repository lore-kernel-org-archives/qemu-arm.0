Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1276474njm;
        Mon, 1 Jul 2024 03:40:13 -0700 (PDT)
X-Received: by 2002:a05:6a20:3ca5:b0:1be:ccb7:7b0d with SMTP id adf61e73a8af0-1bef5f8c592mr4150731637.0.1719830413432;
        Mon, 01 Jul 2024 03:40:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719830413; cv=none;
        d=google.com; s=arc-20160816;
        b=at5V/MQeQKU85tClJSgsYhxypAiURhsOKP2gmbCfKvjsK08eduR8scJgfZw+IvDyNe
         earvlWL2Xp+Hi1c4sKj+Ou3O96i0z3+53zuk9iUUAWyCiqf/wGsEVsMtEf+Y9fW7wyAd
         geHOJNczdaR1cyacX6et8D4Oz/l+LWXcn17pAT/26tabE472sNgWJIP5KNbZSxTwXJl/
         HNaS1GPt6C71DToaAq7PUmlO4HyMHIJ/viHv8HZ38A1633eEp5aCDYp+lPjJ5f1V2oDx
         ADjxHM4Y4hRIgfBubfwqdVd2V9SEucja4HvDyZu4dy9+uEqmODIp+XoHwQ7OCw9fyD64
         duMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=y91pxqGUc6xp63OWzpq0VcCFBeit31sjYVA/z30/KAw=;
        fh=Tyw1973vZmRiuAtcuMDrGhetPWwMaayQt+ofBvug83k=;
        b=LvFladNBeMOeYDgrmcw4Tl+q5f/kW5s2wAOMLq8YvxTjxMzjV/VA2F22F7ELFuI/j4
         xscutpTVlglLcsySF2G0S+ZI3kEP8vgHRVXJKVGV6CP7U/k3DfvsoWFbwqIwHMx8ME9r
         3Mc4TsNXfU2iN/vbdzgZ4hz3DxrNVq6+kblO895hwTIl9erUMPFOIx6kq8/wRBQE25wy
         niJy9NDDoleW2ofMBFRoAikxGCAOhg5YAl30W0wUiiLoBAqmYapq7lt95UeBHm1ljTDs
         DAzSZRdiZo/GdqHJ9wqAL8jfGUS/YKU8BuCLCT36+Lh5ETzHj/SPRI6m8AzvYFmSFP/8
         Wjuw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=X5YMqoTa;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-1faac8d6ad2sor40504795ad.4.2024.07.01.03.40.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 01 Jul 2024 03:40:13 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=X5YMqoTa;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1719830413; x=1720435213; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y91pxqGUc6xp63OWzpq0VcCFBeit31sjYVA/z30/KAw=;
        b=X5YMqoTavnRcyUebZ+XBx2XJZz6Xh3E4k5CzBPW4gSxFEx1LjWSS7iD3jXyaHlpKQb
         lczkDjJRDKIe53dizDeoZXheyZsjiDryK7LiID6B258Frb0mx4i8jaiM5JNyzEaeEksx
         JLTgTLkFzBuOvVjITtx2UHtLtb1/EVUZ6B4MZS5qNxGGbhdHzssQrjBfu325fbwZCaGm
         Qz8indIi4rR0yL6iyc9pwemGq+x9hX2EMLEnbD4WzxAPf0lKABcbMR4hcEly+025ooRo
         wOhJZjW5vYWA5M+U64EDa773wS2yLxYDJFP8hYUN9GFIEDwltNnGCJh1jHXw0FK1UJnr
         Atsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719830413; x=1720435213;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y91pxqGUc6xp63OWzpq0VcCFBeit31sjYVA/z30/KAw=;
        b=VHzR9gTKrepIJOpLXoZMmNEEJRAWx/gZgM06rdknXEAZQQvT7LUOnV4viukLIzGASm
         9GcstfOZgxOLjvFI9Lg5dEBeIPVEvp4JurXOAxxLuEBDfJZpkZ6Ge5od2YxJ+fXM7wyk
         sdAp6TilcmxXKmw5pzNS/EKjNDmEKD2qSAs2tonM8HBU1dHFzrBup78oeSWpcyt1LtbH
         AYMa0nWqbb6DVDl2EFvhbaBaiaMLGOsA/tIQ3kaHkA7YC6xzbGOGCGpMRMdcNOhYy0t+
         rH5a5t3QGbQuvunPYZ4EdbciU6TV3uYGyQdJToHpHNCdthlRl5G/yrlDr4RiT+kgSJ48
         dzOg==
X-Gm-Message-State: AOJu0YypX9pv7yIlAV6bUI8hTXYxuwLfEdL8Tkg7c1/ZmGXjdW2H9+ed
	d1bJshr9qNOQ0joZPbo47sNOZTas1fSDqf7aNs0wZy7689u6FqbvGbpwiyg1VH0=
X-Google-Smtp-Source: AGHT+IG9T0Emu7n6i6m9DzQOj5Uhc/PAjZxKm/dQjtkGAfFjIY6RAfYSrq8gmxN8MVmuXEJCY2GH9Q==
X-Received: by 2002:a05:6a21:339d:b0:1bd:221d:e57 with SMTP id adf61e73a8af0-1bef60f9a42mr4293401637.15.1719830412979;
        Mon, 01 Jul 2024 03:40:12 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [157.82.204.135] ([157.82.204.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91ce17ccfsm6455172a91.10.2024.07.01.03.40.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 03:40:12 -0700 (PDT)
Message-ID: <8b3657e2-5d2b-46ac-beba-fd0d5cf2a05a@daynix.com>
Date: Mon, 1 Jul 2024 19:40:09 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/14] test/tcg: Clang build fixes for arm/aarch64
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, qemu-arm@nongnu.org
References: <20240630190050.160642-1-richard.henderson@linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20240630190050.160642-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: NNbXUgxJtqMg

On 2024/07/01 4:00, Richard Henderson wrote:
> Supercedes: 20240629-tcg-v3-0-fa57918bdf09@daynix.com
> ("[PATCH v3 0/7] tests/tcg/aarch64: Fix inline assemblies for clang")
> 
> On top of Akihiko's patches for aarch64, additional changes are
> required for arm, both as a host and as a guest.

For the whole series:
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
