Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11932129wrv;
        Fri, 26 Jul 2019 06:43:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw+NpEjFp/UF1kMU8TPbuNzsNEgSe9LttKe9/XyqbeWJCLXEkDI4tyubFoIfnKjLWreJTjd
X-Received: by 2002:a17:906:4e8f:: with SMTP id v15mr71688309eju.47.1564148624580;
        Fri, 26 Jul 2019 06:43:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564148624; cv=none;
        d=google.com; s=arc-20160816;
        b=ph5I4nonpyTtLrhz50tFB5uLR2qBX1gGF980KHptmZGhejwic/Mdc0eAwrdZcn3NGW
         QmdxYQntt06EYLXUBf8sL8GvP+UNr2vwmkzx8UOLrR7fHF8dOGegHGFopgcUneyH70tV
         zJEwqW3KyzRJ1oOeCDvg7c6jfS5fzHV+mfAj9f3WqcekOo0Ov3dspqJTt7uDzb4s3iZA
         06Z1vvMTu2yt6gBfQrpEhT4GLRMUCLMVVNkHLqsolac7LMY4uz1BH5LE88rSngL39vYR
         PBEY2Ouum94FK1toPKaW2qJB9YxbeqFlrRXACbWB4Tjm7WuQCFR1q2mFQLtfKpQPTrE4
         0u2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=+rE+b7U3Gi0cBQ0TBvpFajlfZCgG2WHm1fCLfIQbXfs=;
        b=LF/rM5AnoXzasPlhKB4WPvzZL9QBQl/zrnyUo1VkeTOoTcjhZ6tqz+d57q6roFItoI
         n+bW9dyGnluB1/sEfYIzvXq/OGGwBmrsSnm+L9pfaq3kFygyRgMpa16TzDjeKDYxYhA1
         2kh95se9nIWyXALPivUUmwXcrm8neivSH4hKqq925w97ado6WVTCc8lZK7E9XbJ+GBuA
         Row8ZxWYtmbUuViURpkHBtw8y7LtukEbmILM1OBT/Kiq9UD9HprI59NrlubRgc2XkXTj
         dKP/3S4tcZpmeUbDoSAsSxy2QUvzHNlA74KzUosDk7F6wq4Cu8O0cs2PgsuDABUi0bX4
         OsSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sXpjXxs0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e18si10869296ejd.14.2019.07.26.06.43.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jul 2019 06:43:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sXpjXxs0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hr0Vb-00027Q-6L
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 09:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41161)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hr0VV-0001yn-3g
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 09:43:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hr0VU-0007Ib-57
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 09:43:37 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:44647)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hr0VT-0007Hg-S1
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 09:43:36 -0400
Received: by mail-pf1-x442.google.com with SMTP id t16so24524980pfe.11
 for <qemu-arm@nongnu.org>; Fri, 26 Jul 2019 06:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+rE+b7U3Gi0cBQ0TBvpFajlfZCgG2WHm1fCLfIQbXfs=;
 b=sXpjXxs0Tv6bK6ES5gJQqu0UgIaBRfU9QYcBTHzOdjOHX7AQHuMQ27e3d5P+r0Me2p
 LPbD4ATkPqCVSnmKVPNXrqjrvEgw/x5ONFexJZMiFHmu7X6ADB34uhsWUY9Uy/b0a1IV
 PVZKSDDsokQrzh0qx7LxPwfj+Iatp0zg4Pn8Y10KEeNKtUP6Pi2+53JY6/pVr+AhyvCx
 peLeKUY0xn4krgohSE6YqV8e7Eyhg8J71TELlF2Dsa4tMa5cQbws7is8tiHOA6iczLXy
 DJ8ITwVwVaKPmkt5eBUs/y+8IJCH0CraZjmw4sjqslIZBkTWMeQW/qf7oA+tlGTYcSiC
 ZU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+rE+b7U3Gi0cBQ0TBvpFajlfZCgG2WHm1fCLfIQbXfs=;
 b=kdVvkNewpohScgLWHSGuxWSakrhfKIHRwM2LMb8EQqJgMp8u4feAcc2PzIY3IDvYtn
 ZLVdTisI1c4M4njYlT+zxX9mNLlRdX7zaSgFqrlINb6ADutDhdF0A8EgEkKgf+q8BdGv
 2qv5EBP5vqR/jtXmyw5S0O0C8rM+h0AGqniKtqLn0GFuf4OoOHMfs+GLq42KdkZuzJgP
 ne7jPJWd3o5MjbAShhfJhz+kKtkqGDMkFaDHnuI09YWaaVTfOjb9LkPgcJrQTNgijD62
 C04cqRrm6R+vWzFL71O5ium+7pUS2BbHFoYQeokFQLcQmXG7s4RCtyj7RetGi9GdHUbH
 3mdw==
X-Gm-Message-State: APjAAAUkenmJ9uQVoggsmuibbTjGxx+pX+taC8ddeNIZFaMMG6yvFEJh
 oZYk/uXZ9KWUyADRr2si9I3PHQ==
X-Received: by 2002:a17:90a:21cc:: with SMTP id
 q70mr101134325pjc.56.1564148614922; 
 Fri, 26 Jul 2019 06:43:34 -0700 (PDT)
Received: from [192.168.1.11] (97-126-117-207.tukw.qwest.net. [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id i15sm57408791pfd.160.2019.07.26.06.43.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 06:43:34 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <3106a3c959c4498fad13a5799c89ba7b@tpw09926dag18e.domain1.systemhost.net>
 <1564123545422.59810@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <425e4d5b-984d-3b30-9b0b-a7d35516cf62@linaro.org>
Date: Fri, 26 Jul 2019 06:43:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564123545422.59810@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 06/15] hw/virtio: Access
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
X-TUID: 5pBWRQCb74w/

On 7/25/19 11:45 PM, tony.nguyen@bt.com wrote:
> No-op SIZE_MEMOP macro allows us to later easily convert
> memory_region_dispatch_{read|write} paramter "unsigned size" into a
> size+sign+endianness encoded "MemOp op".
> 
> Being a no-op macro, this patch does not introduce any logical change.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  hw/virtio/virtio-pci.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
