Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp494637njc;
        Thu, 14 Nov 2024 11:14:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVYAUO7YxYcCBfnI6R/tD/PpW3X0G6K8b+1a2hYNFfwrDbHGIirNO6nr62cigQpHCXvgIVkdRk/kncPrg==@linaro.org
X-Received: by 2002:a17:902:cf12:b0:20c:9983:27be with SMTP id d9443c01a7336-211c501cc4emr31688185ad.27.1731611692635;
        Thu, 14 Nov 2024 11:14:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731611692; cv=none;
        d=google.com; s=arc-20240605;
        b=h6nGfLEsQ9bKVThNYEo2QzGScdvgV3//K+Rf6sjgIuiCj6HFNRN9uXLx1fUjPcfvYr
         XOssMXyUSRaKdPcJ42hwMwPbUz0DKg0QFMppijpgYZ8EUWMFZlBF3iMnyj8U2x0o1pdu
         WwWt7zMRwKPGT3UH/5+RDs4r1M6n2uT7lRvgS5PSzCZ7Sb9rtf2SxtKJKUMp1AzD7JOg
         VtxoKq86Bax6LJB5ImKIibbNv0/oJaMSy9nAhyhJjXvcTMf/7BDzoS+jVr+eoDNvtkFu
         A5m2DWRraAxrT5nSXoTYVOilpeg7zY2PUp1AFWmFTkp0b9YeRG4yv2aw8xq36CEC8alF
         KMuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=9vGHoJxvkCObt0tZ4/jN0rAQH2YUIsNBMsZzPqHJVzs=;
        fh=hZVRUId0pD/uhqXUXMBF44wBu1NDz7QxF7f1fAaRo3Q=;
        b=QYEjm7J3uraJL6V4DfLrivTIdSa6Hmx3LWeL3hDRSq1XqE4mtAd4QAtT1ZYhz0VlaP
         zLOoPHQUV0MaozXx8AP96xxM9mF4GN80gILd4z/d0kWZl1/qiuBOLEJ6MjH2SQosDq5f
         uJKmSf7bS3NE5PHTTtnf0DNFgBxXh5Nkr/2X3VjoBulJCRt9sDl6BZTKVcMWo8v8a/nI
         WXFxzMBbIATT1fEKb1cpN8o7qi1oswT8pmJyHLP1iq+wYD9wXg6ZZ9tSVYr+1omTmSGU
         AvdUV7dpEKRzskiO7AGudmoksU7sc/U/SS58JLDP6HutqBt7aWFPrJmmByd58pH7t+nx
         W3hg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zBmP/kF+";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-211c7c3043csor13075515ad.2.2024.11.14.11.14.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Nov 2024 11:14:52 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zBmP/kF+";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731611692; x=1732216492; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9vGHoJxvkCObt0tZ4/jN0rAQH2YUIsNBMsZzPqHJVzs=;
        b=zBmP/kF+ucyH6nNWwk4s57PaYhweU/d6Rudecse3FnX/exrMiBba1wdmhM9CSEgxbj
         jD0kqjky+jlyXD8g8+c4zt/t0EbrEeD9mO2uoAMs1b07z4252kNesWBMppixQoPeMF64
         z1SK8NsGoO6SSylcmVHklfXjBrOuTFz567+/KXl0ST0Vlvy8yXlBb0SgN+NyZKSToEbX
         0MC4CYDB7c5odGvLNOp5orgqN5FIdLvlSo4CDfKwYiaLHipj+/wE5bgobUZkvMll+Cym
         hu9fPAnY9AXZRDrJv1uPtXia54xVbG7Haf3D0S30floGQcrc1eh4l6XMRSepi+JOPyZY
         9c+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731611692; x=1732216492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9vGHoJxvkCObt0tZ4/jN0rAQH2YUIsNBMsZzPqHJVzs=;
        b=vN25VhyPqHLV7IXG9FtX2h9yvfXdWivVmkHZ47SlNIdC20qt6o5hLFcEhs5Gr0BthX
         NyqgkBKB7n8TkmCZ/N2Fr9RTF0S2b4b57z8Jtl/zSY1SaFuKcYBJm7SE8bPk/g4zAAF6
         fOcwiXcBorETtWT3DWPbj/lG512b341pVHor8Pok3snSk6TQIZhN/e2k9Kl5Pzl0dO6Z
         uRq1c6VJV6YBIv2ULH33HzBRlQX2bKYhMrUrUMVxTjB4KAGuxzI6WYCjy4EDwvkVk/9q
         U8Jtl18FxL+7xKFOcj7rdip2ZUyxbwhjKh8qagcYpz1PTzkuNnp2ITrtgTB5wX7yNARo
         AX1A==
X-Forwarded-Encrypted: i=1; AJvYcCWsOtXwW2s5b3U6uep2OZHcGnthcBLwO4b32WZzGHs1AU41q6q5gyR04YcNE929cuDr7Ji00bQEtLV98A==@linaro.org
X-Gm-Message-State: AOJu0YwJ30i7PYBIBQnmde+LFv7f42vhjDryXhXly0qeMSRxh3vgVuTN
	/IaywvKnc0LO0l4hlGJM+BiCk40hTbxqBX8pjl4kYVWrrPueRgFFnDraMzO8sIBlZFcLanKNTOW
	cuVw=
X-Google-Smtp-Source: AGHT+IFie00W4vpcKb9KUmD+UtkV/8+ta6XWru8xUyBPA5Mw5K+uYZVUc1eRZo7kvxYHEdEUmgjvzw==
X-Received: by 2002:a17:902:e74c:b0:20f:5443:9ec1 with SMTP id d9443c01a7336-211c5049a48mr46775265ad.33.1731611692112;
        Thu, 14 Nov 2024 11:14:52 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] ([71.212.136.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211c7d01699sm14005425ad.188.2024.11.14.11.14.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 11:14:51 -0800 (PST)
Message-ID: <fd69acb0-4ec0-4b31-89e3-7f5498f4f7f5@linaro.org>
Date: Thu, 14 Nov 2024 11:14:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/24] exec: Introduce 'user/guest-host.h' header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Anton Johansson <anjo@rev.ng>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, Pierrick Bouvier
 <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-s390x@nongnu.org
References: <20241114011310.3615-1-philmd@linaro.org>
 <20241114011310.3615-12-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241114011310.3615-12-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: MzsjAQEOdopm

On 11/13/24 17:12, Philippe Mathieu-Daudé wrote:
> Extract all declarations related to 'guest from/to host'
> address translation to a new "user/guest-host.h" header.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/exec/cpu-all.h    | 34 +--------------
>   include/exec/cpu_ldst.h   | 47 +--------------------
>   include/user/guest-host.h | 87 +++++++++++++++++++++++++++++++++++++++
>   3 files changed, 89 insertions(+), 79 deletions(-)
>   create mode 100644 include/user/guest-host.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
