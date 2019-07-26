Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11929099wrv;
        Fri, 26 Jul 2019 06:40:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxy+JgD0PDIUTgVSxjBcx4kfB7jLeqw0MUI7e0QZTBlt+/SIIVZTOjao1aCNmMLiiAkHvBI
X-Received: by 2002:a17:906:b243:: with SMTP id ce3mr71750135ejb.176.1564148435768;
        Fri, 26 Jul 2019 06:40:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564148435; cv=none;
        d=google.com; s=arc-20160816;
        b=ikufa4T9+apfBaBFLqFoPSe42Y/3taX9C+grVIvitQ9+MES94D5HqRZLVG2HUn9m8p
         kuh5zzSyQp6ITOevOcXBcaxzvHJIufr/kJIEj3OggkiAG6S4xRrW0DsLuN95a6s7pPym
         tO/q6/632TU2UB8nw96nL+45rS4TrgMarTRfQ14pYBj0dgBtIwNPY/qXeAL6uw78LR36
         EkVENLFBz2xb8GmDGgx+flOworjcuxE6cIpwUNvU2zTovVTXG50lbh/vseXtrvNPC8jX
         N7iIh1tF0miWbjoTumNLquR2vinVpl3VQU3p3dYLRu6g/EEf0opVI+BFR7nXZmdLZ5FK
         gnEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=Ts3Mb/QRq2ILN8vtchm/lhkfGiLpQyRe8+PoTIb9dQ0=;
        b=iauwB00wzicEX4PbbpuncsKJXn/GVK0xKQ0yNzhuvv4+K0+4+xJVN1epeRTo4ib1I8
         u3nkiLgvLNRv7S2VQxUEwA1lcT4D/J6ihSGK1SE7RGz6jX5b5Tr4xkfBUbA+mKjO+uf2
         jMzVImkhR06vk7ZH2OHyE9bNled0A5YX1jPNh4hjg/Ox2vNFr2FrqPwMRocKqOBErbp2
         HMYW6uEoZUXgf2fYUUPWpYs1mwzwy0z5tBda733cv0uS8wSowFVKmaF96P/7fnKdoZzd
         npkDvmeQAP7waYiVUuFfad8rz7FE+liGFMcD5zN9SKPEPmwGe5EJJok1gfIWgZHGbd+T
         qEGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="a85Vf/nI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id mj10si14024675ejb.281.2019.07.26.06.40.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jul 2019 06:40:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="a85Vf/nI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hr0SY-00053K-Jl
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 09:40:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39207)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hr0SV-00052K-02
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 09:40:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hr0ST-0003Jb-MH
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 09:40:30 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:42655)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hr0ST-0003HN-Eh
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 09:40:29 -0400
Received: by mail-pg1-x544.google.com with SMTP id t132so24806408pgb.9
 for <qemu-arm@nongnu.org>; Fri, 26 Jul 2019 06:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ts3Mb/QRq2ILN8vtchm/lhkfGiLpQyRe8+PoTIb9dQ0=;
 b=a85Vf/nIUsI9sXXDJNG3tcL3bgG3JVY0pJXC1FEc1bRC+MULydSnILIbWvab2csDqO
 eKIDl3vf4E/nD5RaE8ga8DbSkfAxdDi9LpXjnMZDG/5jIHh9aygNhZcFyWRevR7JkLmB
 ZeYvwp0kbBX0htrw2xMKkFv4lJLmVWDXFDV6WaTUmYDntVTwCXfN47XlnmO62S0KOoV9
 K6Zh64/MYMtYwrDTcfBhN00l1dPCPNhu1l/x+uAl4h2GA8tn0qA2Hz7lNaibH3Yi518Y
 Z+bJjTc8BN2oLZduFcA6agwztsCKMX14br+u1f1ipzxM56aOdc1cvQBqeui/PPE7SYrW
 YkEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ts3Mb/QRq2ILN8vtchm/lhkfGiLpQyRe8+PoTIb9dQ0=;
 b=onejLm7yMMhljzIL/KVYYMVVDj+kDYrLE0USundixpA/soYohcRaDPCDBk75mbdOP9
 GEKcNifqLt9QDWyo+wXUx0kHPQFsMtB8fA2wQDJJur70WAtgFOYdiTILTg0rEJW6+AJg
 CWpqvL8qMxx0I5sxhKjm8yiTPV/Z4U/U3LXdJu/j0/KKvonvC2fCeZJY//nD3pqLrzyR
 V39GN8dpZOhouZbFHg2rP38cbuQi3pHcEIl6tg4kFmkj5W9ztQDK7CWKzf3Tstb1oeL/
 ssszT5xoJUr6q/X4QmJ8JCjGkThKtxLZmL8KeMdJp60+D6Kd/LUlCU6ae/8cXejB17zU
 gpIg==
X-Gm-Message-State: APjAAAU+ZiMLDK04N2CrTS/max1ek8/p/6pM4KAnwm64IwWxid1BP1u/
 vZYavI9HuplIVqcln/CDr54Tnw==
X-Received: by 2002:a17:90a:9f0b:: with SMTP id
 n11mr59462892pjp.98.1564148428313; 
 Fri, 26 Jul 2019 06:40:28 -0700 (PDT)
Received: from [192.168.1.11] (97-126-117-207.tukw.qwest.net. [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id j5sm64474991pfi.104.2019.07.26.06.40.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 06:40:27 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <3106a3c959c4498fad13a5799c89ba7b@tpw09926dag18e.domain1.systemhost.net>
 <1564123462960.14205@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <164823e2-ae60-e729-84e0-6765b7175cc2@linaro.org>
Date: Fri, 26 Jul 2019 06:40:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564123462960.14205@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 03/15] target/mips: Access
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
X-TUID: UL3/7n+QYV1c

On 7/25/19 11:44 PM, tony.nguyen@bt.com wrote:
>          memory_region_dispatch_read(env->itc_tag, index, &env->CP0_TagLo,
> -                                    8, MEMTXATTRS_UNSPECIFIED);
> +                                    SIZE_MEMOP(8), MEMTXATTRS_UNSPECIFIED);

As an example of why I'm not especially keen on the temporary incorrect
implementation of size_memop, you'll need a second pass through these files to
replace this with the proper MO_64.

That said,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
