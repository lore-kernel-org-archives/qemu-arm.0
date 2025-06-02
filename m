Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp2866860njh;
        Mon, 2 Jun 2025 09:21:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWh+csf768q0ZkMlmcIN8AdUMrhp6snNFiXkq/PJrKiZ53RV3e4eh87sZoqCgtQD7x3IUNSZTMgyEKPag==@linaro.org
X-Google-Smtp-Source: AGHT+IGsq/V11J+Mr0DPekKtQJfZ8IEbqW0vFxyTs3s6GxrDhxzsBYLkq7hpPgL1oFlFKpj8wpBu
X-Received: by 2002:a05:6102:41a3:b0:4e6:c2e8:6f9c with SMTP id ada2fe7eead31-4e701b0993bmr6203274137.9.1748881264337;
        Mon, 02 Jun 2025 09:21:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748881264; cv=none;
        d=google.com; s=arc-20240605;
        b=fXMvUOMwjB5j2PaCUCTyptizlTZqRK8kd+BHvvgpzGnsO5hSbweefiWEiZbND9INNd
         +zm6w5hjgbkC9snZ2QOZ0+h98OiudxlRXKGwsbXGlSiJn8twGYa/Lmwyu2yBLfuNaR7t
         i1ZgAsbJ3Mu3WTDNlxU/aRVGl9ZLtoHrahWyqmZmBIkBRQdyhHIgBUNs6UJ0qFf1R/X/
         HaSzzaYhRZm/IWfcPeBeiwQ5RJNSAtoNYk4zj4MKXC1Ji2mOqLqDnhe/rC6DvRFt/Nom
         Nnd9Fc3v977RouIKIPp5l4Cez12dZgN2fDi1IHMJpLCVFsJh40rLzmVlg+l7N+LYII5d
         8abA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=UND6LBgYzKh5UJoTdUouoreyW1Exj+atQyioQIzdY4E=;
        fh=WaZaou2eXFeBqQdygDRPS2ZzqirgoNGSLoxpj2PEYO4=;
        b=OojRzZzmIkkblGFliQxdOGIn2B2mSYUOHsB0MGBZRjhLmP8eg1ZjyGfGAdD70mNDjq
         E9RDPa5a9ak2gB3o1dQgYC28zodkmWsLvQnqUzybbLXNKDNWjXQIFITeVz3Bs+dbzkFC
         8FztmusU6tWCs7cu5ZYyNaMdzSzvfIykU/PUsN2F+S9Cjt+jBbyE4uImKSUq5gkKhKJA
         KeW2TBMeiqPjfxnxn2nnTRXyA8H4/EJCKxFJZxCLoDiR9qmkZLoOmSivhuDHa6/MPuJp
         HUuz+3PMZ8i1a1lN9vCCO8+Iki+k01vVfkxcipLwbxD+bD49U1XnpLU/3QteFokoUVcX
         RrMw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XvQRrZp8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4e64ea2ba88si3067291137.362.2025.06.02.09.21.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Jun 2025 09:21:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XvQRrZp8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uM7tj-0004HI-Td; Mon, 02 Jun 2025 12:20:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uM7ti-0004Gk-CB
 for qemu-arm@nongnu.org; Mon, 02 Jun 2025 12:20:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uM7tf-00083H-DI
 for qemu-arm@nongnu.org; Mon, 02 Jun 2025 12:20:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748881220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=UND6LBgYzKh5UJoTdUouoreyW1Exj+atQyioQIzdY4E=;
 b=XvQRrZp8KRGAceVsnIFIDr02jDJue+L6Ly8lgJtktjoC5iwWGEA5uWQfXIMFYfF14Ib0Y3
 fzMd79pfvp3ivT/kl6p2M+NzicKWC6mEnWLNQeQoVJ2OkTkNTUJAp78GyTtRGi22eVUk6s
 irVmzg99D+FZwuTyLNntdjHZ99g29EA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-uBsCvYEkMamS5BA4x0Zz_g-1; Mon, 02 Jun 2025 12:20:19 -0400
X-MC-Unique: uBsCvYEkMamS5BA4x0Zz_g-1
X-Mimecast-MFC-AGG-ID: uBsCvYEkMamS5BA4x0Zz_g_1748881218
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a50049f8eeso824014f8f.3
 for <qemu-arm@nongnu.org>; Mon, 02 Jun 2025 09:20:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748881218; x=1749486018;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UND6LBgYzKh5UJoTdUouoreyW1Exj+atQyioQIzdY4E=;
 b=LaJGhRq4whvZiEUipus/dMlOdTCeKWNvv8xp0bozx9OU00iKlIwafmWY2HAnoe/KZh
 7GGpX77EChmRawTjrQPNV4VEpO/02hSUcMAvM95BhN1SeY5SxeXX6IOofrFv/CCh3iZU
 nLCWF0TVa/8nSi+VL7GrNWrv06uIVEyK7JAqIvKfNtH6vE84SNb9+wQzECF7axjtF6Py
 QAhuOzQbun6ijCDmsKD6+ezaBMyXULluswKYNKpiV4LqmHwVnbJOoChGMNwRi5sp0fNZ
 AvGYf8h9FeZasVqUF4kl7LrxTzvKkgUoVJ3jvBFHi0FRMguTmgVciKjwJXrj+ylf+2aX
 1Z9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4Z3bfpcZuAjQVrbTYM65InTH8497j8uz15aKKGg/E0nj4QdMFgBtkyQhZfxViEoWmZO+mDgtNRg==@nongnu.org
X-Gm-Message-State: AOJu0YzrBXOeJGyPgE3aqtbdTWlMTH1kUldiXZtFAqFVR1MQlcZnd4MK
 is4dgSv2BYSiWaE4ydgpwsLgoWXvcbJk5uw1CYbqtYYMYeKs5FM8VUUobYz3hxFDQ6msK0ZxQDH
 RGKlz7fv4X8BqmSYQZ/Wwj8b7nQGhFEHv9nXlt0sbvRQsAtl+vRFlrKyoE95XD+L+
X-Gm-Gg: ASbGnctB//SQFOXNVjTIV9itTCI0g05AA4fTNiNeM7+kgB/tra3Ys3puXTsaYmSe7TD
 4pyId+ts4dfmRsQLVDg45Rg1r9Q47HHziy8qaZxGCCxUhM4pXTfZJ5+BCqoksaE+y8VpNZYaWX0
 gB0mbqRDKJfHvoOIfO+JGV3a5VUH+ux6XXlmVkbC0n/s8wvqnf5YTStLIRcBxVf/HAJoJX493cm
 bqQhU1adCMEM4CPRD4azNEpsTVxDMLjJNFO55EacFrPW8h9gb8eTH/cxE4bdBHIPPZNjT4dDE8K
 Eit527yvL9QROHjWdd/xT7vamdX6umD/A6w1fZBnAt8kxo2RN3lQ
X-Received: by 2002:a05:6000:18a5:b0:3a4:f70d:dec3 with SMTP id
 ffacd0b85a97d-3a4f89bec05mr9189326f8f.16.1748881218095; 
 Mon, 02 Jun 2025 09:20:18 -0700 (PDT)
X-Received: by 2002:a05:6000:18a5:b0:3a4:f70d:dec3 with SMTP id
 ffacd0b85a97d-3a4f89bec05mr9189300f8f.16.1748881217672; 
 Mon, 02 Jun 2025 09:20:17 -0700 (PDT)
Received: from [192.168.0.7] (ltea-047-064-112-237.pools.arcor-ip.net.
 [47.64.112.237]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4efe6c525sm15331568f8f.23.2025.06.02.09.20.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 09:20:17 -0700 (PDT)
Message-ID: <1a5e1073-f624-4429-a7ca-6a5500fe036d@redhat.com>
Date: Mon, 2 Jun 2025 18:20:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Is anybody still using the "highbank" or "midway" QEMU machines?
To: Peter Maydell <peter.maydell@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <7aae8238-f7f4-4f3a-9a7e-e9afc99d1d0c@redhat.com>
 <1301bf7e-0e52-43c0-9910-55ea34647a34@roeck-us.net>
 <CAFEAcA_0Hu8+G50sy0FJ2rX-=cNymLddDdrS2nN5ZY-doKiT8w@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <CAFEAcA_0Hu8+G50sy0FJ2rX-=cNymLddDdrS2nN5ZY-doKiT8w@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PolNhH4YoVhQ72N1bfU8yLfxrTV2elI8rxxW0C7t2dc_1748881218
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.015,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: mNizmzQ2vEde

On 02/06/2025 17.31, Peter Maydell wrote:
> On Mon, 2 Jun 2025 at 15:24, Guenter Roeck <linux@roeck-us.net> wrote:
>> On 5/30/25 07:23, Thomas Huth wrote:
>>> I was trying to create a functional test for the "highbank" and
>>> "midway" arm machines of QEMU, and only succeeded after lots of
>>> trial and error to boot something on the "highbank" machine.
>>> Peter mentioned on IRC that he also does not test these machines
>>> by default, so we started wondering whether anybody is still
>>> using these machines? If not, we should maybe start the
>>> deprecation process for those instead?
> 
>> I don't try to boot midway anymore. Commit log shows:
>>
>>       midway only works with an antique version of qemu. Stop testing it.
>>
>> That was back in 2021. The log shows that it needs qemu v3.0.
> 
> Might have been fixed by QEMU commit 61b82973e in 2022, which says
> # This change fixes in passing booting on the 'midway' board model,
> # which has been completely broken since we added support for Hyp
> # mode to the Cortex-A15 CPU

FWIW, I can now boot the midway machine at least to a shell prompt with the 
latest version of QEMU: Grab the "Trusty Midway" images that are linked from 
https://wiki.ubuntu.com/ARM/Server/Install/Calxeda ... unfortunately, there 
is no dtb available, but you can use dtc to compile 
arch/arm/boot/dts/calxeda/ecx-2000.dts from the Linux kernel sources into a 
dtb file that seems to work. Then run QEMU like this:

qemu-system-arm -M midway -nographic -kernel vmlinuz \
  -initrd initrd.gz -m 2047 -dtb ecx-2000.dtb \
  -append "console=ttyAMA0 init=/bin/sh"

>> I only test highbank manually (not in automated tests). I have this in my code:
>>
>>       # highbank boots with updated (local version of) qemu,
>>       # but generates warnings to the console due to ignored SMC calls.
>>
>> I have not run the manual test for ages, so I have no idea if it still works.
>> It also looks like I removed the local changes. Those were needed to enable basic
>> SMC support for highbank; maybe similar code is now upstream.
> 
>> Ok for me to remove both. Not worth the trouble.
> 
> Cool. I don't think these machine types provide anything to
> users that is particularly interesting (if you just want
> "boot an A15 or A9 Linux" then the virt board will do fine,
> and the original "test system software for this hardware"
> use case is long dead). So I'm in favour of deprecating
> these (and eventually dropping them).
> 
> There's not actually a lot of highbank/midway specific code
> here (no complex SoC modelling, lots of stock Arm peripheral
> devices, so just 400 lines in hw/arm/highbank.c, plus another
> 450 in hw/net/xgmac.c for the ethernet controller), but
> if nobody's using it then there's no point keeping it around.

I think I could also try to create a functional test with above images, but 
if nobody is really using these machines, deprecation likely makes more 
sense, indeed ... do you want me to create one of those two patches?

  Thomas

