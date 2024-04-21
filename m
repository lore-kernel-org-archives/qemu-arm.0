Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp3728088ejd;
        Sun, 21 Apr 2024 10:02:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW2V00WDyOpHu1DKhwep8EMYgWISc9RlDl1aQN0qoyNhY7sVYaYAUeIbviKVjGFm0AS5LE+jUP1Om/lIeuqWL7U2p1lpr0U
X-Received: by 2002:a17:903:292:b0:1e3:f923:e257 with SMTP id j18-20020a170903029200b001e3f923e257mr8852094plr.49.1713718977362;
        Sun, 21 Apr 2024 10:02:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713718977; cv=none;
        d=google.com; s=arc-20160816;
        b=fqZAWGYDjm5V2/reBn/f01F4N6AD+qkcLsSh1q85nBeAPYtH1eaY3BXhkvJARzwLDf
         z4J3v/VgDOdksRi20fcmqfrHCq5JA3eg0B9IMNGXtEnQw497VACt8c9PcUu0tR22LPUX
         eCgExsprtdWrkYExdXfpixC20iWW4jcFXfeOGL4UkfGZYb/GBJ4e8hTdgkIDj0XaIg0g
         JB+2OY6aK8/JE9cPKEtpBAOE2MH4EbKfAb37gLsZkIjx64h0mQ7aqvxYIf70l348meBi
         CbBcHhKXCT9ngvFV+rxPTW8oNHv7TrkIymkYS6zMaPJ0ZdNzWqdKpXse21/Adj+Jm8eM
         7qdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Is9+G+sXsgs9tbaaTE0MWItPvvvb9tGCsHcscT8xhMM=;
        fh=CbOttTZiPUSWtdRlfxuNDE/BqlJF3qR6/0+wnzR6Grw=;
        b=L8BYAd33tZYNi75mVnxhbUZmHO+9p0E2dr8J1Ti1TxqeJNuwgFFcK8ATjFNA7OlpBR
         APTouOYSK0R3In1rsoL5oTywgdFZiAEPzj/VZkP7Ckfc0xQpnT++8oDMjuTyuXMMgpeb
         6AdrH/vq/5DnuQEWqqo4NwTAXxXY1pqSgG9k9PVJh+UKybwMv1U2hLhs9PuvakR6FUol
         Qld9MOtSjXsqi+3hvfVuBnHtvARIEkJDlRzXChiZ9Q4NFxdtWRBcmGpzmFqAgrMkJjVH
         Rd+28iiueb/3dtV9vJKhyhSfAJLnufhw0zTsSP/lxuVEoY/o8XjYs/rgcaXLORxFQEZH
         FXpg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cGv4h9e3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id im9-20020a170902bb0900b001e88ae48705sor6372403plb.3.2024.04.21.10.02.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 21 Apr 2024 10:02:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cGv4h9e3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713718977; x=1714323777; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Is9+G+sXsgs9tbaaTE0MWItPvvvb9tGCsHcscT8xhMM=;
        b=cGv4h9e3bS8DVPQvFIV4NYF/S/h74ZESe1SZ9TfyfAkGxKKXtQDlsJC0KH6efPfIcL
         jClMFxesdkGy5Qe1DUHA3Y3CIyOoDRIb3JPzL0B/9jsiPTZCKJVukdxkA5SV44nYFkk3
         rEwHccsW3PZcEFO/X90x28XnCF62UJ5QzIomJGMRRaZiT6I7Jim7w8YSdzCNDYgbOeKe
         c0YaaXJYCyRlrm+j63XX1gL6DUpur4FzPoxXszw5dDQyR6wa3Vmqz/gKp/EnJP+l056N
         Bm1Ch6r858mFR08qVBcPNrU7JdweuSwfxRHBhHOjSRO49LN73eps3WT44/zkBc7EZyR0
         eJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713718977; x=1714323777;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Is9+G+sXsgs9tbaaTE0MWItPvvvb9tGCsHcscT8xhMM=;
        b=mam/KUC4MMulBlHhbq8ZRq0Oi4MfKo4WIniZ9EcSxZBg5013bV2478i8YlZyG1lXaB
         xnM9oMWaPMkMRumv+Q1B7FO35txz/9g5CSUbK8mR888AehGzKiGrf+XO7hKHDrtAMuXL
         fKx1r58D3OaSjjpjCKTWSFVmJzGqNPag6quFG489Tckni694k60H4ejvLJHC71JOEUfF
         hZJV1Rdyd+Gu+pQVbaRJ1hn8UwtP1oV+Jc8kSon8hMieiLow8s5XgIMat74k7FAosRGl
         05TLwhedQ3j9pySdCdYOfvWYZEs9nD6w9LVD85txRTuBu+VQmyY7MUZTLShvkpuIn2Kw
         fUYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxoCQUwLBZfLp4wMj6EE3L98q0ag5gIB/ka6go0qaQu9wr4QkAUb4exjd2nkykoxGX9XbGFObn1zFqyU4qv42BWl1TANHP
X-Gm-Message-State: AOJu0YzpKswuvk+3ncazJsfiNrchwoHnrBU+nabIygLzqHUd24GcQiut
	uG0GS/yeufHJmZTo1/zHfp0OjkqOhLj9c7YcCnUt+l/VeGpC4iIguRm4bh3FxI5eRg==
X-Google-Smtp-Source: AGHT+IGqGa75UZ+kxBJqZgsES9Nskp+wQBMR1roE2ivdGfjaOP+QEXk2DeP/eOAK1nwdmPgeA4hHkw==
X-Received: by 2002:a17:902:c94c:b0:1e8:2c8d:b793 with SMTP id i12-20020a170902c94c00b001e82c8db793mr9482567pla.41.1713718976845;
        Sun, 21 Apr 2024 10:02:56 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.91.227] ([156.19.246.23])
        by smtp.gmail.com with ESMTPSA id q12-20020a170902a3cc00b001dd707d5fe6sm6651002plb.158.2024.04.21.10.02.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Apr 2024 10:02:56 -0700 (PDT)
Message-ID: <00a3d489-f51c-4a4b-a5a4-f0cc7cfd3fb2@linaro.org>
Date: Sun, 21 Apr 2024 10:02:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/24] exec: Remove unnecessary inclusions of
 'hw/core/cpu.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Anton Johansson <anjo@rev.ng>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20240418192525.97451-1-philmd@linaro.org>
 <20240418192525.97451-25-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240418192525.97451-25-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: PSJ1B/yFGcPk

On 4/18/24 12:25, Philippe Mathieu-Daudé wrote:
> When "hw/core/cpu.h" is not required, remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/exec/cpu-all.h    | 1 -
>   include/exec/cpu-defs.h   | 1 -
>   include/hw/boards.h       | 1 -
>   include/hw/ppc/openpic.h  | 1 -
>   include/sysemu/hw_accel.h | 1 -
>   5 files changed, 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
