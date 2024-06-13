Received: by 2002:a17:906:641:b0:a6f:1bf6:7fc1 with SMTP id t1csp178090ejb;
        Thu, 13 Jun 2024 01:54:40 -0700 (PDT)
X-Received: by 2002:a17:906:7f92:b0:a6f:1d24:90e8 with SMTP id a640c23a62f3a-a6f47cc141dmr262167966b.44.1718268879878;
        Thu, 13 Jun 2024 01:54:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718268879; cv=none;
        d=google.com; s=arc-20160816;
        b=nzoqgYT40S1+w8PwEGEmDXCKqb7UxzYXGbwV0ago0HRRE1+y5+8K3MWeU0n8S3vPTN
         ddjrsJezv2+JPvEDQawEIHy1eZ3KvmnolaM8WNqbqpY8orpWwcFD/YNcSPbka3fV0z8e
         M+WS5gG+VxL9N6gF/J6RLHM2Natrgj6xLyJMGygt1tRoQpvLjFjOcrhwm3Dd6LCCzE1p
         hxU60ED+VK7h4+d9RJ++9ImJfsTd/aOieisfVTFOQphbW2xymlD4Lhfpbqbs2lIQ5tjy
         513o38kntNW4Pr7FoSEXpkTGiZcIaNUngajxB0+sqc3Ro5Fj8dV9Bcf9wyAnUkXXcjd3
         iL8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=OSosgpSQsH3wF5+acrPONfzVPkjEd+Wi3xrEgOavQvA=;
        fh=FJIkP/+3Ckk1PbB2KCIe+48kzCVs2amv55NIo4A+Jj0=;
        b=oL8hTMlnXwsXkZuhi19jai5Fu3UfVzLdWYLFUqrM1tTKOXGASWd8cKHyTKcbNZcacC
         9zoXIoJm4Fb3I5ZCn1zit3iFHOM3HpO/RFdG4oHnWGBc0t678Zrpb5M5sRm2eSPZUYgJ
         UbVFg7xpYLxlJoruyW/rcBCAzlmFvjK4P6OW7z9TEd1LCDy2/+WbpoAxGvTHBuMnuljt
         mbZhRVtg4YQ3jF7MuagcbIRpjl4szHLS/tnzbJ0OzpLkUknfyJrOUngWjUxswPcHih9o
         ZFShCD60WkdtMnBhsFMrffbu0Bzni2fVrJemqHkp23sTfuo6vDrAF+sUwrjObkgJSgh7
         8XcA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UEIyGO+U;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a6f56f7db02sor25312166b.9.2024.06.13.01.54.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 13 Jun 2024 01:54:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UEIyGO+U;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718268879; x=1718873679; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OSosgpSQsH3wF5+acrPONfzVPkjEd+Wi3xrEgOavQvA=;
        b=UEIyGO+UsK1vLsisWAl4kcwUWGDnkht0IeNyKcc+IbmfyulI2wBb6HmD5kjS5Y23Q1
         hmemOJP7Now2lesi2yp95DmtZ0OHbndY1lSHQxP2pYDXE+VkhV7Zvi4IRt4u+OivuH++
         HFMc0vjVObQ0GoQykMlbAf5p6XBtrjM3yrsgveblY2a7w+AUHjQba8o7stl8XxjAxEDh
         nFqH/7IhFyULDs3GAnwsP77tCURum4GpatE24Ap1WPIFyiOiesmySFZdM3YgfNnfl/Hs
         KzwvSsdCjkA8P8fyUlwKLAWqorTD8f1nu4eqln0o5x/ec9QdnCSa31WHvRF9bKq6Bwgp
         C/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718268879; x=1718873679;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OSosgpSQsH3wF5+acrPONfzVPkjEd+Wi3xrEgOavQvA=;
        b=fxC74DzuLvl+4dlUOpVDI4+zU6voTx2cHRNzexe9hEGlNAD+qJQvmNzK4SXM7R1Zaa
         kR9q+Mp8HETYRiMk+gi1l9j/pSzWB/yNboZkrVCu2kmPyVTVVHr5x3c7KhopBY0LC1r5
         zmy5RPtBP9JTXEGe0k2ueXknRwleLEkSZihN14OLdjP/ZO8V9JtIMznBWifBjwxX6v7z
         QXv8DntnV5DXPV4ZteoxysG4ra5PK/BT4/cLbWht3sRFwX3xnu60U+PrT0K09+JQXuOU
         Zj3okkyN3psdz2bdCpTTkcVMxXSkcZFNny7VtJ4L7XTuEqPuM6aY2jO7oeWjCrLUKUqb
         K5WA==
X-Gm-Message-State: AOJu0YxxCDboyAEE4BC6KmY9/oe+MSrvNuZsSozfr2yg13XubB6M+XZH
	MINt4OlvfuYu9Uom1CPZmIr9OHmQ9FiRXeitkc7A4JBsbIP/ZMmt4tVsIhQx0qJsoCQPDOegKKy
	PFfI=
X-Google-Smtp-Source: AGHT+IFSKrJ8w4FyvGIuF2YLGd5N2judWSHl/BPRtdMcekWFGCtPgkKSJ0KoLlp2so+7sZANrQJZ3g==
X-Received: by 2002:a17:906:6bc1:b0:a6f:3155:bb89 with SMTP id a640c23a62f3a-a6f47d5f3c8mr229050366b.70.1718268878803;
        Thu, 13 Jun 2024 01:54:38 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.148.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56da40a0sm50331866b.10.2024.06.13.01.54.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 01:54:38 -0700 (PDT)
Message-ID: <31ba8570-9009-4530-934d-3b73b07520d0@linaro.org>
Date: Thu, 13 Jun 2024 10:54:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] contrib/plugins: add ips plugin example for cost
 modeling
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Ilya Leoshkevich
 <iii@linux.ibm.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Mark Burton <mburton@qti.qualcomm.com>, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Laurent Vivier <lvivier@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-arm@nongnu.org,
 Alexander Graf <agraf@csgraf.de>, Nicholas Piggin <npiggin@gmail.com>,
 Marco Liebel <mliebel@qti.qualcomm.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, qemu-ppc@nongnu.org,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Cameron Esfahani <dirty@apple.com>,
 Jamie Iles <quic_jiles@quicinc.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20240612153508.1532940-1-alex.bennee@linaro.org>
 <20240612153508.1532940-10-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240612153508.1532940-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Lt0rMUYfooqm

On 12/6/24 17:35, Alex Bennée wrote:
> From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> 
> This plugin uses the new time control interface to make decisions
> about the state of time during the emulation. The algorithm is
> currently very simple. The user specifies an ips rate which applies

... IPS rate (Instructions Per Second) which ...

> per core. If the core runs ahead of its allocated execution time the
> plugin sleeps for a bit to let real time catch up. Either way time is
> updated for the emulation as a function of total executed instructions
> with some adjustments for cores that idle.
> 
> Examples
> --------
> 
> Slow down execution of /bin/true:
> $ num_insn=$(./build/qemu-x86_64 -plugin ./build/tests/plugin/libinsn.so -d plugin /bin/true |& grep total | sed -e 's/.*: //')
> $ time ./build/qemu-x86_64 -plugin ./build/contrib/plugins/libips.so,ips=$(($num_insn/4)) /bin/true
> real 4.000s
> 
> Boot a Linux kernel simulating a 250MHz cpu:
> $ /build/qemu-system-x86_64 -kernel /boot/vmlinuz-6.1.0-21-amd64 -append "console=ttyS0" -plugin ./build/contrib/plugins/libips.so,ips=$((250*1000*1000)) -smp 1 -m 512
> check time until kernel panic on serial0
> 
> Tested in system mode by booting a full debian system, and using:
> $ sysbench cpu run
> Performance decrease linearly with the given number of ips.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Message-Id: <20240530220610.1245424-7-pierrick.bouvier@linaro.org>
> ---
>   contrib/plugins/ips.c    | 164 +++++++++++++++++++++++++++++++++++++++
>   contrib/plugins/Makefile |   1 +
>   2 files changed, 165 insertions(+)
>   create mode 100644 contrib/plugins/ips.c
> 
> diff --git a/contrib/plugins/ips.c b/contrib/plugins/ips.c
> new file mode 100644
> index 0000000000..db77729264
> --- /dev/null
> +++ b/contrib/plugins/ips.c
> @@ -0,0 +1,164 @@
> +/*
> + * ips rate limiting plugin.

The plugin names are really to packed to my taste (each time I look for
one I have to open most source files to figure out the correct one); so
please ease my life by using a more descriptive header at least:

      Instructions Per Second (IPS) rate limiting plugin.

Thanks.

> + * This plugin can be used to restrict the execution of a system to a
> + * particular number of Instructions Per Second (ips). This controls
> + * time as seen by the guest so while wall-clock time may be longer
> + * from the guests point of view time will pass at the normal rate.
> + *
> + * This uses the new plugin API which allows the plugin to control
> + * system time.
> + *
> + * Copyright (c) 2023 Linaro Ltd
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
