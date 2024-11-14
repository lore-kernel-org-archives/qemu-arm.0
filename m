Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp175091njc;
        Thu, 14 Nov 2024 00:33:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUg3jx4oYP7zMBhLLTN3DPp/ORzxu9j/2zcT/hkQpeZugOKbpqXacflxHHMyuVf7xjRPfc0e3SuL2UF9g==@linaro.org
X-Google-Smtp-Source: AGHT+IFgqZ9QZQilNLgQ5rhbmQFQlOBBgwEgsXKCQIBVdRyuwQm1dhHJpnDDoBjTxujdmr5IhUJM
X-Received: by 2002:a05:620a:bc5:b0:7af:ceb8:13db with SMTP id af79cd13be357-7b331f20cdbmr3310076385a.41.1731573219239;
        Thu, 14 Nov 2024 00:33:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731573219; cv=none;
        d=google.com; s=arc-20240605;
        b=YIgDA2LpPzvBIyrNSwksDPxBXZ4syspn1Q1KKejbTemFY5of6NhxXi8ehzDkXup9ml
         jz85QCGtfpISOPRYT6BSV1EOYoohbm7GDkhu5LLf2n0CfQ1Kk0jGWJEyD0h0uztZq6Ml
         4VVizdndwNR972b0kY45S0BLJ9iQgissVOkKg2UYtNkAltg5KI5tFagVduSjqH8RvE30
         WfipMSlseWwRyCmvMYy13BlB0+lG1x/uiXLrFNDsjxAcDHYByzo/yLNrYW8tVC0QsFGm
         pqwCjpyQsz+FId5FiIfbN9ggU10aaH+HJg40j0pFe/v6IOWkqHEmylguyfRfJhSUUggm
         mn5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=z2JUGD1FdISLg8yGUupnvIgAzOhJ6vDUlvcn82eWaA4=;
        fh=Ca9p2atFejJgp19ebOz7xRAqPrl7kYxxafWLkGcYfAc=;
        b=JT8OikxI8l+e6YiosAf2fIvuGxSmy9c3CDwkXkG5cNCKAI9hXLr1+TFzi3RHSVN/DR
         g+/uH/myqRLoI/RIp8evrv1cqUHzbRC62/zbXQmVzEipL4b6w9NgF3KoElXUXUQEuUQc
         1tWQzT60DCKr8XEfjsburffQcqi6z/VjSLAcZetmjK0RT6sIhvnsFza0/GmrX+43uCnr
         p9levVTstngWB+GbQ/aVnymFzNrdKwy2osZfJKjynVpi5dEeVE+8ql7RjzMKhUdzRRj+
         mvkWnVU6DWYJT8byBknLR+bVRN3ffJGKlMiSgPzhipf9lBhbhbeeZ9IA+rCW42lcfDsa
         GV/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FMVBwf2K;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b35cacaa69si67300985a.558.2024.11.14.00.33.39
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 00:33:39 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FMVBwf2K;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731573218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=z2JUGD1FdISLg8yGUupnvIgAzOhJ6vDUlvcn82eWaA4=;
	b=FMVBwf2KZMOu7FFcb+5cbXYgINTLunIxLP2npzn/hhvCloDSozSd0Ws3XVqG5YogTynMyS
	DdyDkct6U8W774bOIqbY67AEV+PJXLVOECzXAvXBhLgMPRd95pnNfxtzl62B9BDeTXX4lT
	dTc/ZYTULhbshMrDze9JM/KINGgJ1XU=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-Uq9EDx0vMSKKakLIA_FpJA-1; Thu, 14 Nov 2024 03:33:37 -0500
X-MC-Unique: Uq9EDx0vMSKKakLIA_FpJA-1
X-Mimecast-MFC-AGG-ID: Uq9EDx0vMSKKakLIA_FpJA
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7b14fc05206so46067585a.2
        for <alex.bennee@linaro.org>; Thu, 14 Nov 2024 00:33:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731573217; x=1732178017;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z2JUGD1FdISLg8yGUupnvIgAzOhJ6vDUlvcn82eWaA4=;
        b=p1epBpQMFBaWb5uj3ys7r2j74nQ3lRnCd3dM4dk8MVAMawafJNkIL8ogkTW9MsQG9n
         tiEOWTZy7jNGIaqE03pCUzqiCFwCs/ZU3aqmJYdigE0ZpAp3Z1NhJk7kcRmvZxGd5+ZL
         6H3YHPZBdPQ0MHxTt4R+ebAKo3HHXstkatrlWsEhDmvRcrRz23IpncNvhDVhk+q8f028
         ziHiQbHspp2R6Hq0XWvdfeL8CTCz1q3PAjLHo675448CUPnWIGRsxWPooP9+0RxU3YQZ
         IZqi3qL3pjPK6vvvmh/A0Y++J8evaOtHnZ7+y1VSB3+tOmEYlJU8a9sNKAqv979oScC3
         MhXA==
X-Forwarded-Encrypted: i=1; AJvYcCUqmLX94HC4CWHIawSq2zpf8gcA5qwydI19wB0Jvm2KTqGA9GCiEi7qO20y9Jruis6dwmb543RiJb+TZQ==@linaro.org
X-Gm-Message-State: AOJu0YyxDLFy9tjWE+MfMIpes90S/uTbIfQylIzbGYi2at7zcioVC6Mh
	7/Qrqa0iQX5k3FRKSP6r1u1lfk5JHwLd/zuqkWX6wtg+UtH1HL2nJj2v8qVA6jumj7O2o8PUDFm
	LNh57DIxPHQ/46J1MpyhUOtrnS1fSqP+sdN/PVKTY2NlSgzMdTWT8ow==
X-Received: by 2002:a05:620a:178b:b0:7a9:b8dd:eb96 with SMTP id af79cd13be357-7b331ebff74mr2703925985a.30.1731573217104;
        Thu, 14 Nov 2024 00:33:37 -0800 (PST)
X-Received: by 2002:a05:620a:178b:b0:7a9:b8dd:eb96 with SMTP id af79cd13be357-7b331ebff74mr2703923885a.30.1731573216816;
        Thu, 14 Nov 2024 00:33:36 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-49-115.web.vodafone.de. [109.42.49.115])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b35ca30ea8sm25994585a.90.2024.11.14.00.33.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 00:33:36 -0800 (PST)
Message-ID: <7bf93a20-a134-4bb7-a572-e74ca357e602@redhat.com>
Date: Thu, 14 Nov 2024 09:33:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/24] exec/cpu-defs: Remove unnecessary headers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, Peter Xu <peterx@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-s390x@nongnu.org
References: <20241114011310.3615-1-philmd@linaro.org>
 <20241114011310.3615-3-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241114011310.3615-3-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tAExL2j5q_gDDhQUoyv94_E5orbXhO4oV4046f74wyE_1731573217
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: qLldnHFIUGbD

On 14/11/2024 02.12, Philippe Mathieu-Daudé wrote:
> "exec/cpu-defs.h" should be kept as minimal as possible;
> besides these includes don't seem necessay. Remove them.

s/necessay/necessary/

> diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
> --- a/include/exec/cpu-defs.h
> +++ b/include/exec/cpu-defs.h
> @@ -23,14 +23,6 @@
>   #error cpu.h included from common code
>   #endif
>   
> -#include "qemu/host-utils.h"
> -#include "qemu/thread.h"
> -#ifndef CONFIG_USER_ONLY
> -#include "exec/hwaddr.h"
> -#endif
> -#include "exec/memattrs.h"
> -#include "hw/core/cpu.h"

Seems to work. Good catch!

Tested-by: Thomas Huth <thuth@redhat.com>
