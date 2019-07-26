Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11935291wrv;
        Fri, 26 Jul 2019 06:47:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyhrc/PsgeQXDY1PAnJRsQVBol1oQ+LX2LfO7TQqSRuLHIorodOp871vSYV+gCYfKv5gShb
X-Received: by 2002:a50:9116:: with SMTP id e22mr83257200eda.161.1564148829656;
        Fri, 26 Jul 2019 06:47:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564148829; cv=none;
        d=google.com; s=arc-20160816;
        b=PFx1d9DpETipcJpzcwRIhis56s152QvSkH8EsSXlgISuAgQ1TMYjcznl/rIQQeHRCK
         KaGezxbDJSjT3MuMgtMRzLzQy4VLJMf+nRMTSjxNqNzZxFZoyrX/SwRmX/LACKWDzYhn
         NCI6TxY5AnWw2ikEk5XQ6waRoAXsyP/gtaGZyRUdql0Wvh6FwtB8fWKGb7u/AFtKE2zi
         4MQTF37nRXlEmOg1N9t+mPIpcVWVmKuA8wXwbaHc7QWhzwVPvjdY7Y+RIGc+NPt5IjZh
         iS+yGI6UleZys6SSwyXTghhCxGOnWiqO6rFIZF1C/4CDh8w0afYg5uC2WXrgcSWiRylD
         TLqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=0Wl2fd8LNoOtVLHHwm3Cw6JvAU+/r1OMbSAET3sQlpg=;
        b=jJGXmKG1R1EPWrEdIMGfKWhvrJGI8FbMPPS1tBGwGF6gUwBgwsUQED5FJwcvAup9Ac
         9o3kXifBkqFyCX56pfGN7qLdvT1nWKh1HDZx7xCHxsXrjmtJtA699c6eXS04CdYkNWqN
         sletY50j+aO9PBavee8gn8MJodE5/3zNnRu3xWoMsXLDA1LxJQZH3qw19YOKIB9B+gga
         eKW79iaQrJjO0cwfTfsGLU859TZ4781fKA1z8lReDP20kMV209kcZpg7zoVzsWPX/833
         jTH+CyEURkTVjvGH9uCwALSwUrtr9olCk+IIzDmfPNi+IIAXZFOWra3anrNSUrb8mD/t
         zkag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JGsCJKMY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n38si13034759edd.125.2019.07.26.06.47.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jul 2019 06:47:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JGsCJKMY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hr0Yu-0006Sy-BJ
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 09:47:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46793)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hr0Yq-0006SI-9s
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 09:47:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hr0Yp-00025u-9M
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 09:47:04 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:43684)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hr0Yo-00024Y-Ua
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 09:47:03 -0400
Received: by mail-pl1-x642.google.com with SMTP id 4so17809511pld.10
 for <qemu-arm@nongnu.org>; Fri, 26 Jul 2019 06:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0Wl2fd8LNoOtVLHHwm3Cw6JvAU+/r1OMbSAET3sQlpg=;
 b=JGsCJKMYLFoMirpfC2sTloOeN3k0TG4QTGL7ol0QHNYkF0DEEMtu/fC0upIceTKK6m
 eEfeHwwZwb9BH8YMqz0vvOQth57xKRuDVTdk6cR/EvwrK+Ni2FgfnliUPF/RA5ZhX02q
 mH/GcbLO9EzjqXun+rHwkKw0+Tz746owORQNl8py3QKfbh5nLKJems7uopiLNf1L5ku6
 pc6MnY2Q5qTsW5p/jRdZDeAkConPGel5aC6+RxEDVsrnVX6T7G/AuQShw3URh3fRGtQ7
 lf6YaRb6dQzB2iC5zx7hIaqG9vUj98dDkrU2zCHPmy2RPhMG9YilisATodsUydOyLZAW
 kUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0Wl2fd8LNoOtVLHHwm3Cw6JvAU+/r1OMbSAET3sQlpg=;
 b=OTFAzA39JgrDajLQWwAIEPDw5GexSDPgd/8YBRq+E1/pihCTMAMOS7EaLkUgND6w5S
 bArnUirz/HVXCenFowXEKFyDAw35vBbwDF16o4SkHZCGXGCPpmORj26FsrBLYe0apPfr
 yGZp14WmdZZfJl+uOjEhWYkz+R6XZ/7I1YGs6ymzvC1v8ta+1+S7FLAsZSLixxc5VhAa
 PkMoS+22wrrNuoB4DPosNVGAlPu9LY0gNsoWr84ffnd1GR+MCJd83+Ncu4AHuCDop83w
 d3bcdOrtCwOkebJz3nDNc/lObaYbtPmOS3mK/hwO3G6O4ddP2tFU8msgV+2rko5SR6PR
 4Gmg==
X-Gm-Message-State: APjAAAVhEH381WEGq8ig5KwqYE/TUkZXKIAoFXG0Rx4X5sxyLHiT2ecs
 fFb2I+0zVEHPbKEgwcI6vGih2g==
X-Received: by 2002:a17:902:8a8a:: with SMTP id
 p10mr98334346plo.88.1564148821743; 
 Fri, 26 Jul 2019 06:47:01 -0700 (PDT)
Received: from [192.168.1.11] (97-126-117-207.tukw.qwest.net. [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id x26sm68868804pfq.69.2019.07.26.06.47.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 06:47:01 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <3106a3c959c4498fad13a5799c89ba7b@tpw09926dag18e.domain1.systemhost.net>
 <1564123592639.10426@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <1016f328-46bb-f2fd-c7de-964945199b9c@linaro.org>
Date: Fri, 26 Jul 2019 06:46:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564123592639.10426@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 08/15] exec: Access
 MemoryRegion with MemOp
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, walling@linux.ibm.com, sagark@eecs.berkeley.edu,
 mst@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 Alistair.Francis@wdc.com, alex.williamson@redhat.com, arikalo@wavecomp.com,
 david@redhat.com, pasic@linux.ibm.com, borntraeger@de.ibm.com, rth@twiddle.net,
 atar4qemu@gmail.com, ehabkost@redhat.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, stefanha@redhat.com, shorne@gmail.com,
 david@gibson.dropbear.id.au, qemu-riscv@nongnu.org,
 kbastian@mail.uni-paderborn.de, cohuck@redhat.com, laurent@vivier.eu,
 qemu-ppc@nongnu.org, amarkovic@wavecomp.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +uhPFNfus0Xj

On 7/25/19 11:46 PM, tony.nguyen@bt.com wrote:
> No-op SIZE_MEMOP macro allows us to later easily convert
> memory_region_dispatch_{read|write} paramter "unsigned size" into a
> size+sign+endianness encoded "MemOp op".
> 
> Being a no-op macro, this patch does not introduce any logical change.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  exec.c            |  6 ++++--
>  memory_ldst.inc.c | 18 +++++++++---------
>  2 files changed, 13 insertions(+), 11 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


>          /* I/O case */
> -        r = memory_region_dispatch_read(mr, addr1, &val, 4, attrs);
> +        r = memory_region_dispatch_read(mr, addr1, &val, SIZE_MEMOP(4), attrs);

MO_32, eventually, as well as

> -        r = memory_region_dispatch_read(mr, addr1, &val, 8, attrs);
> +        r = memory_region_dispatch_read(mr, addr1, &val, SIZE_MEMOP(8), attrs);

MO_64

> -        r = memory_region_dispatch_read(mr, addr1, &val, 1, attrs);
> +        r = memory_region_dispatch_read(mr, addr1, &val, SIZE_MEMOP(1), attrs);

MO_8

> -        r = memory_region_dispatch_read(mr, addr1, &val, 2, attrs);
> +        r = memory_region_dispatch_read(mr, addr1, &val, SIZE_MEMOP(2), attrs);

MO_16, and so on.


r~
