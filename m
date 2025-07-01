Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3314946dye;
        Tue, 1 Jul 2025 10:24:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU8WKctf6q5RsBlgTmwdIIvhznAlUNXligE3xrf6Vnadaku6S2DGTPTSk/L+ukWu1LvYzN9CZCwFUj67A==@linaro.org
X-Google-Smtp-Source: AGHT+IHbVJTxDVl0MoMVPBDVse7IphpfPZ2MwPxUinZ1saYWTzPomuOoqRR3q2PZvujvLA6QrMR3
X-Received: by 2002:a05:620a:890a:b0:7d3:b9b6:f1b9 with SMTP id af79cd13be357-7d44395461amr2313920585a.26.1751390696953;
        Tue, 01 Jul 2025 10:24:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751390696; cv=none;
        d=google.com; s=arc-20240605;
        b=V+OTBVZ+OSFj4xkdsf2gTUqlaXvFoYgFXqi271qr4UGwANq2e0ZKGvT2HWd8/3Y1Gw
         MF7D6S7dTVlcerG1Yl1cUDeaJxNltyK+Z6MmUT/OjNGTCOTr+uD7+btp//AoyUQVlik6
         6WnmYk2llOn4ej7WD/nL23+o6ZY9dP2KCDDGSkbMZX52I1mquy0Z07a3CeGoGv6jH8g9
         e+WHCp/0CUPWkaDk5VSB3Rc+X7Ot9TB0eGrvldk03051h72gaT7mx/Ox+rz0kvcIT232
         aKLOmA1vdKzvtQCOtYXs/ZBaH87jUgk+YelenDo3zn8Na/eBI5RCMn0enHZdwV1RfqQI
         kdmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=PfxcjmcCSdo1CxPAI9WSRQhBwa1aIy3/oCqfjVmlP9c=;
        fh=XLY1DuI8hlZ33v8HQOS5kx81U8Jgf5qzt8RVlnOOepg=;
        b=bM4t9Oeqjjsqiv7XjC0QO4quI7HNwT6SlaRTioTjDtfNEAeXG+oMHTlXC5/SFteBu4
         cNcOHyX/WdHp0o54fv9buio7BTxdH+iHmc1Yi+Q62aRRXzL/zk/u2qJgp5Bu48UUvC86
         of30uAnto5p9Xd1Yq6MyecWqrsNdhV92kjbhrgzjdYxYDw+kLF0oocLx3Ghea8SsFF3i
         wVWPbcHjYaa9D+BotGSrFNg8lw2CJ95CGvOFnY9gA+kHBkLAk5OL8cIZCUapXTrfjn2D
         ESW3iS7HxhZEnEeX0Z2d7EiEFjJXaqTtWeetcJWkhTKlDwnFX57iYfUNuC3u52vZwhiT
         4u4w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Uaw11UtB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d4432775fbsi1021172785a.471.2025.07.01.10.24.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Jul 2025 10:24:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Uaw11UtB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWeiZ-0007hW-7b; Tue, 01 Jul 2025 13:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uWeiU-0007h8-Vo
 for qemu-arm@nongnu.org; Tue, 01 Jul 2025 13:24:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uWeiP-0004SE-5G
 for qemu-arm@nongnu.org; Tue, 01 Jul 2025 13:24:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751390653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PfxcjmcCSdo1CxPAI9WSRQhBwa1aIy3/oCqfjVmlP9c=;
 b=Uaw11UtBRV3D7l++aqsjUF/nZzoLA9+DyM9ekM86bRAKxeiSipw/jtBDYnpWTv2A+AKWsr
 UVs/7HLwiN68q4tYTl91sjs1aV24hDN518Uq4MKZVXHK+YqDBWnw6GTVCv4318Bd+sT0ZF
 UhdXZxE5HFq0g1aOhjMw9Vm9lYPw68Q=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-t_mroQkRMeaUem-poCz-yA-1; Tue, 01 Jul 2025 13:24:12 -0400
X-MC-Unique: t_mroQkRMeaUem-poCz-yA-1
X-Mimecast-MFC-AGG-ID: t_mroQkRMeaUem-poCz-yA_1751390651
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3af3c860ed7so619549f8f.1
 for <qemu-arm@nongnu.org>; Tue, 01 Jul 2025 10:24:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751390651; x=1751995451;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PfxcjmcCSdo1CxPAI9WSRQhBwa1aIy3/oCqfjVmlP9c=;
 b=CVKsS6E6K90Y5jxmhnY57s3+6mVQTXqJHLsjtrV9j0Bne0WNuEdk2YoKPeoVf/LeUv
 vCe7VWvii/I08/dWbCceugAL09TN9QrAdlP26tb2GMcx9ZpHcKYSL5wRvU/SC538fZKa
 nBMkr4kwVQesqDmPjCnhgQ2AHBuMlQO9sQj39s2mSM2wNUFSehghfc+gJNmykv8Jm3NP
 72hI/+2L5Drw8LUlO5lbUd7mT1jiARyJ9TG79Pw9SDJ/yl24v0uV0epRiIDM1DOb4Qqr
 QbQPxx7B/38139jB2amuzQb7vPgBBp7TRwoyAiKKgb0WNdSArZ01zoivpBCINLR0nlhU
 GhOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5MaEepM9/86ZsEPfMPF8JZaTlpDMkPdnIvwPVoRhA6/L5F0AHMyt8jnEL7UAdKTDAaIdPXgbQYg==@nongnu.org
X-Gm-Message-State: AOJu0YwuXBqaz89CLoMpSpah/WFzOYLutJ8yGzie+YVlm2aI2ykc9XJc
 cEzofBiYlnwIYyXHXmcrPBjXY0b9++NmVtJmzwEivBySkVaVQBhV1oHNNcu/mWNScWr5skb6WEt
 aNTHOmEu30E1vMsi3K07aL8QeNuWnW24dj91lqyQCvI6wmmI/wT79oQ==
X-Gm-Gg: ASbGncu790a3rGARqK9CTQVwFVhrKP23rGmjR2cNnI6zDeHIEW7gEyha3g1PGK6prfy
 eFdw/FjBNy0aUJ3X3/ZdCs8ugzpk1ouQ1ydW2rd9YWKaAUi9PSMr5sD0zvTZy85iNfLkK9axDPF
 /9PzpY85M5zq6hDoXhH+4Sq+QFOdK9cKjqygUXKCEOsRt3CjzrVqF+pMmMesHwoj9Ruwa/IAk4/
 U8Kxgj6vHnLkg43DtwqArHxgj2l7Vk+FuV4I4O6W3aGeK88gRDoe4ekp5IbnDUHMjXo7ux4IbU0
 oyeVnx3ifGlCe/5gxUA9m/JZSNIh+MSf7p4eeoFm9F1B5t/r2bgRz0o4EuMFaA==
X-Received: by 2002:a05:6000:41eb:b0:3a5:8a68:b839 with SMTP id
 ffacd0b85a97d-3a8ffeb4c25mr16556441f8f.45.1751390651224; 
 Tue, 01 Jul 2025 10:24:11 -0700 (PDT)
X-Received: by 2002:a05:6000:41eb:b0:3a5:8a68:b839 with SMTP id
 ffacd0b85a97d-3a8ffeb4c25mr16556419f8f.45.1751390650756; 
 Tue, 01 Jul 2025 10:24:10 -0700 (PDT)
Received: from [192.168.0.6] (ltea-047-064-114-041.pools.arcor-ip.net.
 [47.64.114.41]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538a390c88sm181242445e9.8.2025.07.01.10.24.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jul 2025 10:24:10 -0700 (PDT)
Message-ID: <ff8a559e-f1d7-45a8-a292-20c9ab697646@redhat.com>
Date: Tue, 1 Jul 2025 19:24:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] MAINTAINERS: fix paths for relocated files
To: Sean Wei <me@sean.taipei>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dave@treblig.org>
References: <20250616.qemu.relocated@sean.taipei>
 <20250616.qemu.relocated.02@sean.taipei>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250616.qemu.relocated.02@sean.taipei>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tI007-sRz6mey6POHafNCdaLPO4rmLYTx7EpKmdoxvA_1751390651
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NDqdNypJdXbl

On 16/06/2025 17.48, Sean Wei wrote:
> Several files were renamed in previous commits, causing their entries
> in MAINTAINERS to reference outdated paths.
> This prevents scripts/get_maintainer.pl from correctly matching
> these files to their maintainers.
> 
> Update the filenames to reflect their current locations so that
> maintainer lookup works properly.
> 
> Related commits
> ---------------
> 
>    c45460decbd (Oct 2023)
>      hw/input/stellaris_input: Rename to stellaris_gamepad
>      Rename  include/hw/input/{gamepad.h => stellaris_gamepad.h}
> 
>    4faf359accb (Nov 2020)
>      docs: Move virtio-net-failover.rst into the system manual
>      Rename  docs/{ => system}/virtio-net-failover.rst
> 
>    89857312f32 (Apr 2024)
>      hw/usb: move stubs out of stubs/
>      Rename  stubs/usb-dev-stub.c => hw/usb/bus-stub.c
> 
>    f2604d8508a (Apr 2024)
>      hw/virtio: move stubs out of stubs/
>      Rename  stubs/virtio-md-pci.c => hw/virtio/virtio-md-stubs.c
> 
>    2c888febdfa (Apr 2024)
>      memory-device: move stubs out of stubs/
>      Rename  stubs/memory_device.c => hw/mem/memory-device-stubs.c
> 
>    d481cec7565 (Oct 2024)
>      migration: Move cpu-throttle.c from system to migration
>      Rename  {system => migration}/cpu-throttle.c
> 
>    864a3fa4392 (Jan 2023)
>      monitor: Rename misc.c to hmp-target.c
>      Rename  monitor/{misc.c => hmp-target.c}
> 
> Signed-off-by: Sean Wei <me@sean.taipei>
> ---
>   MAINTAINERS | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fed8619874..0477e124d1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1002,7 +1002,7 @@ L: qemu-arm@nongnu.org
>   S: Odd Fixes
>   F: hw/*/stellaris*
>   F: hw/display/ssd03*
> -F: include/hw/input/gamepad.h
> +F: include/hw/input/stellaris_gamepad.h
>   F: include/hw/timer/stellaris-gptm.h
>   F: docs/system/arm/stellaris.rst
>   F: tests/functional/test_arm_stellaris.py
> @@ -2163,7 +2163,7 @@ F: hw/net/
>   F: include/hw/net/
>   F: tests/qtest/virtio-net-test.c
>   F: tests/functional/test_info_usernet.py
> -F: docs/virtio-net-failover.rst
> +F: docs/system/virtio-net-failover.rst
>   T: git https://github.com/jasowang/qemu.git net
>   
>   Parallel NOR Flash devices
> @@ -2214,7 +2214,7 @@ F: tests/qtest/sdhci-test.c
>   USB
>   S: Orphan
>   F: hw/usb/*
> -F: stubs/usb-dev-stub.c
> +F: hw/usb/bus-stub.c

I think we could simply drop this line now completely since it is already 
covered by the previous hw/usb/* wildcard line.

>   F: tests/qtest/usb-*-test.c
>   F: docs/system/devices/usb.rst
>   F: include/hw/usb.h
> @@ -2469,7 +2469,7 @@ F: hw/s390x/virtio-ccw-md.h
>   F: hw/s390x/virtio-ccw-md-stubs.c
>   F: hw/virtio/virtio-md-pci.c
>   F: include/hw/virtio/virtio-md-pci.h
> -F: stubs/virtio-md-pci.c
> +F: hw/virtio/virtio-md-stubs.c

Could be merged with the hw/virtio/virtio-md-pci.c line by turning it into:

F: hw/virtio/virtio-md-*.c

>   virtio-mem
>   M: David Hildenbrand <david@redhat.com>
> @@ -3187,7 +3187,7 @@ F: hw/mem/pc-dimm.c
>   F: include/hw/mem/memory-device.h
>   F: include/hw/mem/nvdimm.h
>   F: include/hw/mem/pc-dimm.h
> -F: stubs/memory_device.c
> +F: hw/mem/memory-device-stubs.c

This could be merged with the preceeding "hw/mem/memory-device.c" line, too, 
by turning it into:

F: hw/mem/memory-device*.c

  Thomas

