Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp3277763ejb;
        Sat, 9 Dec 2023 20:11:36 -0800 (PST)
X-Received: by 2002:a05:6e02:168c:b0:35d:a2e2:c95d with SMTP id f12-20020a056e02168c00b0035da2e2c95dmr3998222ila.35.1702181496318;
        Sat, 09 Dec 2023 20:11:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702181496; cv=none;
        d=google.com; s=arc-20160816;
        b=FHHtUVj3MCPqi9U5r7O7Ms2dRsxDWobx/Qv5LK447Uln3/lM5kNPCACdnyGKbEKowF
         d6RTq5WvcXr4oRJYyw+JWkOHnLiukhtdqCeXfHU8UngzPhKr3RqMaq48r3/K7KxAXOdn
         gM0KFjgLrH9dx9A5n25TH9eu//1XDxVi/Yl7ukk3A1Y0IWslYEfVL/UWPy1qXbfM56mt
         +JOCia5ZjpQxqObMr1+UTA7TO3qK47KVjvMQdrhehi/pMzN+AXLidwU3ObOFODE8wTCt
         wnICqsVXBCkyQrrKOCIxgm8d9op8IkMPSvsPpuLjL/XCChFWeGS+sgEcrj9cB44RgWYP
         HEZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=NHiKyIW8CW8KPATS7dT57c/viP6HxCdGRmtk+8noqOo=;
        fh=h0FH2NZtUIRULmF8RFHIlQJahtVx77osG4TXTV+YIXY=;
        b=Gsc9t9dW+24in3aRNwltMxLPvbMIdDrOP07Gzkq7QslAaXSzNuHeIErF2p6Mew9zfM
         VADn4xfxEhfT8SAhUZeV3ruCZerdbsNTIeBx/NsEiOKCrMBtxmu8ENadlh4BUg1B1Byr
         jTqCO/sijF0Iik3bhkCQvw8iNNysqTPx4lleBxqoKiLDW3xOj67MGrDDUWl9QQGRY3xG
         vm0Lij2wk/SZYEZFYtb0EOBhLgi2tJWVkU5I80UIl6XXy38Upw4xR+b/++E4lnK99jaN
         4gwQiXh/KzfyKx73XXemEo8jeIM6vrBcy9aB27ZUnIGQiWbO/aNYdwJVDL+qar2eBZvA
         AZgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=P6LpR9b2;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u18-20020a056e02081200b0035cecf6553bsor1465025ilm.6.2023.12.09.20.11.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 09 Dec 2023 20:11:36 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=P6LpR9b2;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1702181496; x=1702786296; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NHiKyIW8CW8KPATS7dT57c/viP6HxCdGRmtk+8noqOo=;
        b=P6LpR9b26eehktO9CSehYhlnJ/e1/01hYC0OYuiE8sQPUV0neeWfUfPPwYBZo8qTVW
         jpeCrn3YY7gcCvUOpFSG37IrpY4x+z0qXPrJjfjrU50jr5ayJ2fB5B+J4PzRHlaZEUtX
         JWQXiCAR9modahODfrvDqbmFZB2V/GPfG/oX49lno4Ou6pybBQH28B3ydDliqR2L2jk/
         nFrmiZc9MQ2YFV7uJ5eiyH85aJoqiPT7uVF9kjVKTn1RmBm4lbcl2vahX9/Om6mc6VzG
         TZOYz6FnkzS2OE4pEip4s/2udPnKSgJ5+cdc7+KZ40Indtayxstz5obcWYMdmA0zB0lD
         qhqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702181496; x=1702786296;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NHiKyIW8CW8KPATS7dT57c/viP6HxCdGRmtk+8noqOo=;
        b=eduO6Hd9Af9hBsDxYMAwc4uA5MFRNvbjqYwqDaovq/tLQ2CeHI8Vbw7N9eXi/4Iqht
         SQ7yLu7vySShLwwjhH0AvrOTaoNS0kyj85iZkRWw2q7itrJdlIRO7v6p4oBjBzpVXqNZ
         4bLsoWLI1ddoH4CWEgZ44FZARNZvImj8kbHVoInd+taQtUNOcUUjYV8VqDG4LMJP+5Rj
         V4tc6IVFvP0MZJxr5xkR0wcA+BW5rkRB/ed86AEPFFWJ6vY/qvtTllcwb2SyK3cJDZaQ
         HnBfJyzjcUEhVx5AJ8+o1B9ZefnJZ/1RV0lHu6iV8CjiZDnoPqbrjCBp5pbVVI5yb9u2
         salQ==
X-Gm-Message-State: AOJu0YwJaa7YCaFa2PI/XQWSjhAs+DHWnTs5nohgjbXZlK5+tQ/5PbUn
	a2lYR8AWO+FxVCQDBfV7Pf3Tlg==
X-Google-Smtp-Source: AGHT+IFYCMkj99QK+5QRZnG+Mwna4RVhNEAb4Bwjmkcesu1zs/Hyw4q9Djvk4LdrPsOGzmBTk8IIDg==
X-Received: by 2002:a05:6e02:198d:b0:35e:6bbf:4e5a with SMTP id g13-20020a056e02198d00b0035e6bbf4e5amr3032157ilf.44.1702181495955;
        Sat, 09 Dec 2023 20:11:35 -0800 (PST)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [157.82.205.15] ([157.82.205.15])
        by smtp.gmail.com with ESMTPSA id u3-20020a631403000000b005c6aa4d4a0dsm3949945pgl.45.2023.12.09.20.11.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Dec 2023 20:11:35 -0800 (PST)
Message-ID: <8717f71f-5350-45ef-9712-89c1240bc77c@daynix.com>
Date: Sun, 10 Dec 2023 13:11:31 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] tests/avocado: mips: add hint for fetchasset plugin
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Paul Durrant <paul@xen.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>
References: <20231208190911.102879-1-crosa@redhat.com>
 <20231208190911.102879-3-crosa@redhat.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20231208190911.102879-3-crosa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 0tKwQrP6xNbI

On 2023/12/09 4:09, Cleber Rosa wrote:
> Avocado's fetchasset plugin runs before the actual Avocado job (and
> any test).  It analyses the test's code looking for occurrences of
> "self.fetch_asset()" in the either the actual test or setUp() method.
> It's not able to fully analyze all code, though.
> 
> The way these tests are written, make the fetchasset plugin blind to
> the assets.  This adds redundant code, true, but one that doesn't hurt
> the test and aids the fetchasset plugin to download or verify the
> existence of these assets in advance.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>

Why not delete fetch_asset() in do_test_mips_malta32el_nanomips()?
