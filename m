Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp542444njc;
        Thu, 19 Jun 2025 15:41:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCViCm6I3BNNQTh6/9E3BtBqTy8bPyR4alnRQrtIFORqCozMDyMCLLL4aaIJ3KNWOW6vU/z3BOYWT5xLIA==@linaro.org
X-Received: by 2002:a05:600c:871b:b0:453:ec2:c7b2 with SMTP id 5b1f17b1804b1-45365e3dfc0mr910815e9.7.1750372894057;
        Thu, 19 Jun 2025 15:41:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750372894; cv=none;
        d=google.com; s=arc-20240605;
        b=CwisLRh67p66qBVrNF2A0YAaXKVl+6xo342L3dt5i8WJrwGN68590Eel/xepbE7qRc
         +ycG00WqkqECK2TdBmFvbSuXAqAz4kv7qZpFGzj8EdduZRIV3tIWrRZhZHgRnpG3KsSw
         b7CqViX4rG+gHX5wqF8axo+APIg0QONZkDJuRBUSjfVr/cfOz+ogy2WIdcIyAUi/QC9T
         sH+ApfNnyFk6CLOmCSA5YyWVJSlN+Ax3YKC2lVoO5mTGvPfE2EJimpjT/V3P+uWAC0N0
         jz0ZuUxJhlbieew2X1PI5K59KgWaQu8TWUwr2S6SGezh9FKLhWEI+UtotC+JXMPWO13S
         CO2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=JYqfIDOo4Y81fOUls78kxCDhUADzm0w1A4KbE+kV/I0=;
        fh=SkhirKlly5fIyQvS0d0tnMnii9XMZ20C0vDLNu3gv1E=;
        b=Nf0RQlw7UepAePHT4xbZWRneC2tB+SMRf14b8WCz39RQe9NU4ffkLlE+RvaISBcb2w
         dvvllFmDb4w200ALFyt/wiZzgt1JkJaGvd7Id2jgocethWnRWoqpZTaOGZYn8MN4iMih
         f6iLEoeQ0VkaanHAyZU3+Ns2t3LUu1mW3O76dNfAsw7QU3mYZFOLBnrMXL8o4BXItGNT
         niaUwandm0YM5VQOWaUQV3UIUPNZv+HzIPS91VdlUP3P5F/NzO1i6NteAD7j9XF7DrIu
         8ClWLTA/lSVvmKwttptHfPoPaarfZVOfPHQGkwMK7K5qKe3j9Lr6xE/5Q0G376UE7ILN
         +XFg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="m/xt4wdq";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4536471a13esor1112635e9.5.2025.06.19.15.41.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jun 2025 15:41:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="m/xt4wdq";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750372893; x=1750977693; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JYqfIDOo4Y81fOUls78kxCDhUADzm0w1A4KbE+kV/I0=;
        b=m/xt4wdqXlKmH8ad2gFSYX+PtS0tlixYqCdJRe8Sj+/sqg0+dXZ3nfSSKYFIBIaCh7
         hKkU46l1T/E4Fn5aLjPprslHii73IrLLQglmvdICoAkGy39j70KhAqieuDJ7r7yfpqQB
         j68jyehuJ7P4DBgFPb2wMydXuDLUFYFxTW8GgLeHD/jNIwPKfWZBKk+mkM54V7LU+aPs
         EKYHKoV8Vu9MQ8CW4i/zF4pyY3e8S9KrRmrG8/rvXNC2QEXOPySgjMa2c8SsR8WJyH36
         onNTb6dtn2tG8Co8GDZekP2IX9GjrMxJVtrHrxyx1YYy0eAXcp/NUn6Pc6PGC23KLZL6
         qpvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750372893; x=1750977693;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JYqfIDOo4Y81fOUls78kxCDhUADzm0w1A4KbE+kV/I0=;
        b=qgTEWBtK7MsyidosDpY1Ke/zwNMMMvZ37lriSAR/lTvjzf27AY5YtOzEbk6ZUT62Vf
         eDMd3S4LIueaPGr4FFXHM83pMvE/nZUnXoEpWnbClO+xeVNYNA6u/DzSMacExtattT0S
         4fbvLLMb09Co9SD1EbS9fpTTFe62n0LrA6M8fY4DWOLCp//2tzriKbn+No8+/WLH67vZ
         mCfIVAiiD05la0Q1olGqGn6ZtiTuUF6b/M07P9aPEIqYnbl09HJm9Z4ytCrwpEiRRKBA
         dmIHjOaIjcAekDd49fkDHTnd8O0Jn4UlTsojqyKstpw7XaHoKfLTnK7jlT1wK9KJ5mrX
         c6qw==
X-Forwarded-Encrypted: i=1; AJvYcCWxpg+4N1dhiFSG6VJMlDAKFhG0+Y48a9aPY4MC28X1gMJT3HnqVNDWRBrunyq0/j7KmrbwZeBOBlo0sg==@linaro.org
X-Gm-Message-State: AOJu0YxRUpU1hy9Ooi4jZcYQs4XEJow6U/9wgZu5ulWkcltAzFapBl9x
	S5tY1nxSFukHzpAQymtVhjrTHc87NgP4ZX78g/gbjuWcUrqtGmHCNCh2hClPAGErFuer7A==
X-Gm-Gg: ASbGncsTjEDQZ+VajEUbMKD1DFtLhP4jJ31H5ylBg/k8DaigmhynRZ7vBU3fo9M18hj
	aPjZFqfm5Pnrk8MMy86hck76afmhcJNjHGLig40mKtR9uL+d3ZHq1kzIspcrHY9IF0f5nGWjnZa
	ucBcrEjvQ7dOJvKwXnd3ls5MLa2loEq/jhH/uZn9XV9r4zG1QWFW/6qsGyAwgfxXt56McrXDRHv
	52TKfbnWcuk7Qu5nRuoXEvVsIxVAGBCpeHrAM/ekDjPMcuVXuLy0dTLzTo+JCaB6pwxM0zOleLT
	WGkz9kFd9MtkOe0dcX6H/kwFoDmU3LNhMPouewzRJc5Aws7c6EO/0Sc4OatgbDxHHEyJnCthpDb
	FAGb9zxkgfeR89OCVtq2Iu/nqIreQjaHczkq2122r
X-Google-Smtp-Source: AGHT+IFOG69Fu52xgibwQRh423sguVXqU81Wbdf1PctRsPGbOo+7PRS9kZaDB3bYWW+JSGHhTFHzFA==
X-Received: by 2002:a05:600c:4f81:b0:453:84a:e8d6 with SMTP id 5b1f17b1804b1-45365e42db3mr877825e9.1.1750372893345;
        Thu, 19 Jun 2025 15:41:33 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.167] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535eac8c16sm40202245e9.19.2025.06.19.15.41.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 15:41:32 -0700 (PDT)
Message-ID: <47990a06-6867-4f5c-9c52-2770d2bba472@linaro.org>
Date: Fri, 20 Jun 2025 00:41:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/20] accel/hvf: Trace VM memory mapping
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
 Julian Armistead <julian.armistead@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>
References: <20250619131319.47301-1-philmd@linaro.org>
 <20250619131319.47301-8-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250619131319.47301-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: CGAyOqQXLMQV

On 19/6/25 15:13, Philippe Mathieu-Daudé wrote:
> Trace memory mapped / unmapped in the guest.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   meson.build               | 1 +
>   accel/hvf/trace.h         | 2 ++
>   accel/hvf/hvf-accel-ops.c | 6 ++++++
>   accel/hvf/trace-events    | 7 +++++++
>   4 files changed, 16 insertions(+)
>   create mode 100644 accel/hvf/trace.h
>   create mode 100644 accel/hvf/trace-events
> 
> diff --git a/meson.build b/meson.build
> index 34729c2a3dd..5004678a26b 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -3633,6 +3633,7 @@ if have_block
>   endif
>   if have_system
>     trace_events_subdirs += [
> +    'accel/hvf',
>       'accel/kvm',
>       'audio',
>       'backends',
> diff --git a/accel/hvf/trace.h b/accel/hvf/trace.h
> new file mode 100644
> index 00000000000..83a1883343a
> --- /dev/null
> +++ b/accel/hvf/trace.h
> @@ -0,0 +1,2 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#include "trace/trace-accel_hvf.h"
> diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
> index d60446b85b8..b38977207d2 100644
> --- a/accel/hvf/hvf-accel-ops.c
> +++ b/accel/hvf/hvf-accel-ops.c
> @@ -59,6 +59,7 @@
>   #include "system/hvf_int.h"
>   #include "system/runstate.h"
>   #include "qemu/guest-random.h"
> +#include "trace.h"
>   
>   HVFState *hvf_state;
>   
> @@ -97,6 +98,7 @@ static int do_hvf_set_memory(hvf_slot *slot, hv_memory_flags_t flags)
>       if (macslot->present) {
>           if (macslot->size != slot->size) {
>               macslot->present = 0;
> +            trace_hvf_vm_unmap(macslot->gpa_start, macslot->size);
>               ret = hv_vm_unmap(macslot->gpa_start, macslot->size);
>               assert_hvf_ok(ret);
>           }
> @@ -109,6 +111,10 @@ static int do_hvf_set_memory(hvf_slot *slot, hv_memory_flags_t flags)
>       macslot->present = 1;
>       macslot->gpa_start = slot->start;
>       macslot->size = slot->size;
> +    trace_hvf_vm_map(slot->start, slot->size, slot->mem, flags,
> +                     flags & HV_MEMORY_READ ?  'R' : '-',
> +                     flags & HV_MEMORY_WRITE ? 'W' : '-',
> +                     flags & HV_MEMORY_EXEC ?  'E' : '-');
>       ret = hv_vm_map(slot->mem, slot->start, slot->size, flags);
>       assert_hvf_ok(ret);
>       return 0;
> diff --git a/accel/hvf/trace-events b/accel/hvf/trace-events
> new file mode 100644
> index 00000000000..3c11f69f305
> --- /dev/null
> +++ b/accel/hvf/trace-events
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +#
> +# See docs/devel/tracing.rst for syntax documentation.
> +
> +# hvf-accel-ops.c
> +hvf_vm_map(uint64_t paddr, uint64_t size, void *vaddr, uint8_t flags, const char r, const char w, const char e) "paddr:0x%016llx size:0x%08llx vaddr:%p flags:0x%02x/%c%c%c"
> +hvf_vm_unmap(uint64_t paddr, uint64_t size) "paddr:0x%016llx size:0x%08llx"

For some reason this is still cross-built as 32-bit (although HVF isn't
supported there, see commit 7f800d34aa9c from 2021). Anyway, please read
instead (and thanks Pierrick):

hvf_vm_map(uint64_t paddr, uint64_t size, void *vaddr, uint8_t flags, 
const char r, const char w, const char e) "paddr:0x%016"PRIx64" 
size:0x%08"PRIx64" vaddr:%p flags:0x%02x/%c%c%c"
hvf_vm_unmap(uint64_t paddr, uint64_t size) "paddr:0x%016"PRIx64" 
size:0x%08"PRIx64
