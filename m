Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2221910lfc;
        Sun, 15 Mar 2020 15:33:43 -0700 (PDT)
X-Received: by 2002:a17:902:8c94:: with SMTP id t20mr23538068plo.170.1584311623695;
        Sun, 15 Mar 2020 15:33:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584311623; cv=none;
        d=google.com; s=arc-20160816;
        b=UrF0EBDRWkYP2iy4w7LERaQ+QlpiDHqzmOJ/D0Vuhm3cloteBOVNR8zIv9nbUzBsqu
         zIFQcy5KFwp6SVpveP5Bo8Wc7NwmonKsK8nRN1i3OeBXKe6NykxVZdwsGwpyuCMszuwA
         ZbQe8crSWOhGMbOdd9k5/dle/+iVHoZrX96M/ni9JZBWVOSvvWfIGBneO3VddI4IJKLN
         fZSacQx9+uqbIaM3Pz4pJup18HKWb7yzxdTZpxv/zOQhzevjVmORT3iREOYHxjF5SfU0
         2VaYF19IW6m5DKG1HPV9VK2mOkssnxLDir5FgzwDB6ROb2XH4IJ0SaXsGImiaEi0T6AY
         Angw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=C8xrtjZPdhkGh9RyuMEXja32sZxVcrJKH8SOoPBFV+I=;
        b=ubm+hBG5fF/iudgyjZitcgpw8d44KsGbWAeuC3L8QjrUplc281v4FrF9HumTYq+FDG
         COKv3qY125kJqvQnH4k2hr5UD5K8lMyIizMC4Qh6I9tEZW/kgQzGL4xDsQQKvoHTESww
         IC7kWgm8xOJ1VrdLUDy+PNVBMFr0uXcyPSLClLTk6SP/sw0Gax0uPDKbWbOwoO+VmM7D
         Mmwn/bLOEhHvA82HWmIri6gZumxtNlAxWGSZyDdKa20wZ5qpeaG2XxY/mQwp6nmTN/Gm
         ddAFOe+0tPFOAAcp7YjB2J+3NFGc5Z4Nmpk6EH75ZmtBpCqYMQSPzw8TgStjiI5SIqe3
         Azmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S7p11nb7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id i74sor12891176pfe.45.2020.03.15.15.33.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 15 Mar 2020 15:33:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S7p11nb7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=C8xrtjZPdhkGh9RyuMEXja32sZxVcrJKH8SOoPBFV+I=;
        b=S7p11nb7RkRO3B2CKas/xZBbykefVMuGQavF9k2EpUSryb4hk0D7aR0ykRSR/ya3Vc
         g3Jkp0sQuy3AlvNbiZ4DkN7PWuuQBoQAjKFHxJ9yEwzGUKqy2wLs/UPcoguqYEbHOUaD
         +YIYh00mfewuYg5l+YaNFqbisx9f4IXkLx52Yarnoiy9wLpnCpXyEHXuIc+winQlkk3g
         WcVXW6hSSm2XswORQWkwFn/5o7DvNSmncCExThyvk0iJo8q90FABr2I4K6oL2Rrl1PGk
         7e+B57NEQLXRmvq0O8ifOWBaXPmvVJctdB8Q5nv3S2XdrmRiMUjOipbwzfLC0HgM7lSE
         uGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=C8xrtjZPdhkGh9RyuMEXja32sZxVcrJKH8SOoPBFV+I=;
        b=mMF5gDpzQ/dvgAh1JdTYM6pCVEqUiE8ONhwunOyI4WiRe4x3Wmdr01anUlj7tHQikY
         0ZeTEsOBLI2z5TpvhoveAWvvaRjzdWaxmBfE1xP3xKBSJ3HHc5kh99KCOiG7jXoRN8YR
         F+u7YIn/KLbm/p5jmMNMmEmj3wk5BlGUCFtxo6LSBk9rNAsQABL7LhPPNJ5r51tI5eEx
         74yeOLir7x1uyqeXfH/DpthBxDwERFlPaFKFA3F1/UeUYP+69BNruc9nIVmsEEYxJTW3
         B9RVdzuPMsfIgCu2HUb/fv3GlYF17eKXJwQ/ZGyKjwYwzzdoacF/LI1RczFZQPNFkcV7
         4xJw==
X-Gm-Message-State: ANhLgQ3b0l127d7L2NjbY6TjPimdW44duoqsnwiEl9Dy8iL9s+FSh5ON
	smhm2dRxVuZIix9KkedxIubB+l24
X-Google-Smtp-Source: ADFU+vv4ID1TV72I/f91ubBzIpArlK8S71wQ1JT6Z3mqMXjq0lOpmdWDq1J+3g+wmfbKprdmTM4tqQ==
X-Received: by 2002:a62:e20a:: with SMTP id a10mr23092322pfi.270.1584311623231;
        Sun, 15 Mar 2020 15:33:43 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id 11sm13757742pfv.43.2020.03.15.15.33.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2020 15:33:42 -0700 (PDT)
Subject: Re: [PATCH 01/14] Makefile: Only build virtiofsd if system-mode is
 enabled
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Paolo Bonzini
 <pbonzini@redhat.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Henderson <rth@twiddle.net>
References: <20200313183652.10258-1-philmd@redhat.com>
 <20200313183652.10258-2-philmd@redhat.com>
 <8f73d608-d28e-b896-b1f0-f95d599502f0@vivier.eu>
 <d9b29b2b-58ff-512c-c426-0ffe7bcad295@linaro.org>
 <29d183c5-6dc5-39a0-e8be-fa2e7f37d331@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c9c4a379-4710-b2c4-54ae-e33b02de5c64@linaro.org>
Date: Sun, 15 Mar 2020 15:33:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <29d183c5-6dc5-39a0-e8be-fa2e7f37d331@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: t/Nzs6lww7xA

On 3/15/20 3:16 PM, Philippe Mathieu-Daudé wrote:
> On 3/15/20 8:40 PM, Richard Henderson wrote:
>> On 3/13/20 3:28 PM, Laurent Vivier wrote:
>>>>   ifeq ($(CONFIG_LINUX)$(CONFIG_SECCOMP)$(CONFIG_LIBCAP_NG),yyy)
>>>> -HELPERS-y += virtiofsd$(EXESUF)
>>>> -vhost-user-json-y += tools/virtiofsd/50-qemu-virtiofsd.json
>>>> +HELPERS-$(CONFIG_SOFTMMU) += virtiofsd$(EXESUF)
>>>> +vhost-user-json-$(CONFIG_SOFTMMU) += tools/virtiofsd/50-qemu-virtiofsd.json
>> ...
>>>
>>> Why don't you do that instead?
>>>
>>>    ifeq
>>> ($(CONFIG_LINUX)$(CONFIG_SECCOMP)$(CONFIG_LIBCAP_NG)$(CONFIG_SOFTMMU),yyyy)
> 
> This was my first option but checkpatch complained because it is 80 chars long...
> 
> I also tried:
> 
> ifeq \
> ($(CONFIG_LINUX)$(CONFIG_SECCOMP)$(CONFIG_LIBCAP_NG)$(CONFIG_SOFTMMU),yyyy)
> 
> which is uglier and still too long.
> 
> Following qemu-bridge-helper syntax I also tried:
> 
> ifeq ($(CONFIG_SECCOMP)$(CONFIG_LIBCAP_NG),yy)
> HELPERS-$(call land,$(CONFIG_SOFTMMU),$(CONFIG_LINUX)) += virtiofsd$(EXESUF)
> 
> which is also too long ¯\_(ツ)_/¯
> 
> If you accept checkpatch complain I can use the form you prefer :)

Hmph.  Of the choices, I prefer the 80+ char line.


r~
