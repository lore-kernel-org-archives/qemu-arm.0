Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp1172568njm;
        Wed, 30 Apr 2025 12:06:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUOvtbADYnoVNH4V6vjoslznPG2Sk+oXrJOYJ8z5YeCK0Y7HSzzoi2dhxXqmwL91B40ZDKl7SYGonrFqg==@linaro.org
X-Received: by 2002:a17:902:ef50:b0:224:3c6:7865 with SMTP id d9443c01a7336-22df34a9d87mr66428275ad.3.1746040006530;
        Wed, 30 Apr 2025 12:06:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746040006; cv=none;
        d=google.com; s=arc-20240605;
        b=lVZOyu1Zzf3nGW1NwAyEJDZX1sTL/CR8yjC/pR9GuwRYty1Lm/TQPj/vZhTAZXCxOD
         hpcgK9jAXKyYXM9hCQhCs1zk7DjYb2rrbhchoqSRjvFUseND+8U73Qbjp7f2/VMmPGlV
         cDaBUnPTyopJ9HvPt+pq7hWEU6FiK1FRoyD18Lz5x1422ODZ5rLeXTDS0sCF/iBvnFYL
         x95svq6CpOAac8bp5kXwFQQo4OmJ3b+0n6ILb3M3qbeqhl9qAedMYia8B5vMIiWGXs0H
         0/6D6t47RcVQAQdC2GhWGqFvVUGsHeHhcRw1qunj3Y81JAtD923G9Aov6xNr9lrZ+wmv
         nYMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=9n3Gc+fzJYrA8p18MsMkLFMsPX3ZwWCDB/5xmmls/q4=;
        fh=wchYAXLXrazF0QLR1c9jTqpY7CG3IcLKAZvVaZ4/W5o=;
        b=NNK5vZhNaVIDAzSkaAmpGkxbDhx22OxKeaRYRawCe0o27lCgSK83klfha4Zjw1C7Mz
         PLN0OUQ9kkzd5CJl1JN36+9sdUtyPXbxN1gwID126yhqTClQvRzBmzKoZ2EuA2vIG45r
         j3EFiOu1vTfbKyNnb8ZJM9BrrG2RvcyzI7tC7VIja1JZN6IlUCPaA9XTZFCDhPd3h94V
         IAdQyzfyLQpl9Hb/AdtvTpDltTpr+2hgSewiKWRp2E4hgrOW3UOVbP+QZU90kfAo9RXE
         Hf4Fec/6Yc2YeiPR8gWpsmIstXmd7VD4s/98j/c1/ykB/ISEMCda/pmiEXjW65SI91vO
         QYDg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pY+DoKfH;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db50f44b8sor97399945ad.11.2025.04.30.12.06.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 12:06:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pY+DoKfH;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746040006; x=1746644806; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9n3Gc+fzJYrA8p18MsMkLFMsPX3ZwWCDB/5xmmls/q4=;
        b=pY+DoKfH/g2Vaz+xIYGmZX66H57ajNJxDQk40vtA9wmszIDc958KMMWu7ynapJ/Kbd
         yZiqBNcbBArFFm3JX0FCmx1Cs2lPNGr2qqrambauaZYR2O/70CEnWBzliikNrrxhioBH
         TgeJgK3pl/5libRw+e/sem/lSJIDnVdAzQdrvSCBRt0ZJc6yE270BkuQgU4gUCkvYgxa
         hhfGMkwBse15iY/vcipoaO0jXmWPhy64YIQSZLqdc9gYx9IfVFec/QSg5z5+jhLsfHBE
         03yE4S8Jlfky9aXwSwJ2n/rr8lrRvyXEfAoGyynTlpZDY79VeeXUhL+yq8FUqCse4329
         8JdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746040006; x=1746644806;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9n3Gc+fzJYrA8p18MsMkLFMsPX3ZwWCDB/5xmmls/q4=;
        b=KBtdUPn2hDjDFxnEtj96+0ZFQxBc720sDspQX3gEd74artmApB7qLfoCQPCYA5v44i
         13oXNg08rj+BGoDmmjPV1sveIlk9VjwfzlfY1mLac+5K3BuQtKZaZ/LCuTaAPPyLJLSD
         KYt6du8tiPUXB3SHR0cGrNu6KmmYrPoX0zeleaXdSJHZH/jnHrh9tszIzgVnmrX2neGR
         8LguprKfqtEW3zzAKI7QA8GOyqxldI0s85Pm8DFg/98+XUiNzhLTK33z1Rcpacl7ql3V
         Le9MMllJwW0FvGPPgr97PxnsUA2kiZAwy+9BXmr8OWHyj4cn3TZeGi014ijuvq1la/jA
         glbg==
X-Forwarded-Encrypted: i=1; AJvYcCWaqr4d8Y/C+jXqn0nZLOLu3AdbcptrtYMc1NkS9WyPVus/rggRNYX018rQ/mxp+YgVKI4dQGPXXyAGkg==@linaro.org
X-Gm-Message-State: AOJu0Yx9Cllnl7FEWjbQe5rk3UHPEVPtCReTW6yeFcRKuvAOZHscm1wZ
	f9c4FKr+ZDTNT33lebxfSyI8ZmlzcLDsnK+4Iyhxmny89ELRr2wpX15Qaz/lYb/m0A==
X-Gm-Gg: ASbGncs39d1Olql+5AtZv9aEdzBA3xc1+NdV4dA+gL3pDAbMOJbySeWasD+hUEEDErC
	FXfuosgDnd0IaYFNtHMRk2dKyD8JqWNB2Ejl4zRNRXn0Xuh6R302KtYN6kvYsz7wu9NNBpFSRQ2
	WkH0+zSyG5fc90kQcYbwAJMwpYLx7RAJVPe0bqnpjhArTdCQTQu8gdI+hfTbrwCsVdxL7Onv9NH
	diKhehewQpxedBGFWuRWlsooQcTYszINhMpWRR5kahmItPHMMQbWG080B/OafHwjbuHvBQVJ1YO
	v7V4W/XmGn1kJEefkmTW9mnReVGBoLAeRX6t7MUl0iJlxUuUVWbi+g==
X-Google-Smtp-Source: AGHT+IEwJ9DmS6F4g37/Yr0JrWeK1e551wHd0iG5IlA+XAM9kxsLyaRa9Hjrx30O81QJwrT30x9ysQ==
X-Received: by 2002:a17:903:2acc:b0:224:10a2:cae1 with SMTP id d9443c01a7336-22df356f9d7mr61399055ad.37.1746040006067;
        Wed, 30 Apr 2025 12:06:46 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f76f4680sm11028282a12.14.2025.04.30.12.06.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 12:06:45 -0700 (PDT)
Message-ID: <037f7d2b-91cf-4798-a6ae-ba3cbeebf2b6@linaro.org>
Date: Wed, 30 Apr 2025 12:06:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/12] target/arm/cpu: remove TARGET_AARCH64 in
 arm_cpu_finalize_features
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 alex.bennee@linaro.org, anjo@rev.ng
References: <20250430145838.1790471-1-pierrick.bouvier@linaro.org>
 <20250430145838.1790471-11-pierrick.bouvier@linaro.org>
 <8520456e-3e44-4028-976a-45d683610a8e@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <8520456e-3e44-4028-976a-45d683610a8e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: DSzr4Hcb23qB

On 4/30/25 11:47 AM, Richard Henderson wrote:
> On 4/30/25 07:58, Pierrick Bouvier wrote:
>> new file mode 100644
>> index 00000000000..fda7ccee4b5
>> --- /dev/null
>> +++ b/target/arm/cpu32-stubs.c
>> @@ -0,0 +1,24 @@
>> +#include "qemu/osdep.h"
>> +#include "target/arm/cpu.h"
> 
> Need license comment.  Otherwise,
>

I'll add it, thanks.

> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> r~
