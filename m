Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp752749wrp;
        Wed, 2 Oct 2019 04:18:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzNvbEsglUTGmiS67W5YWiJ1vawJAO4XX0gclyhLBZi0tTZ/5st/q+b9SESn8SXN60aiOfe
X-Received: by 2002:a37:65c7:: with SMTP id z190mr3049859qkb.483.1570015104318;
        Wed, 02 Oct 2019 04:18:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570015104; cv=none;
        d=google.com; s=arc-20160816;
        b=IWAGpHmw81r6DLuLpZCFyXdf3m/s53ZAlGdeBpxJVfemK0MtnR1Uu8Jt54FppDWI/W
         XDM3JwBGBwhXJwkpWLO7ngHtS7/fqLk5TdOQF+/oSWXEV6x+Q+7szVVi0hJqMtM5ZuC4
         u+HS2ZwwDOxqzv87oSGV+8f4YZLa0OBw0f6W67N7RntdFwz1rWmEHrCtDmvVlkZoAEJ+
         DOibkwzg3u0VBig6OcR/PNuaqnmJWpJl6xsunIOa5b48Lx3dRYLVG8CWerZR3NYwmSxt
         h5E2a3QRy6lOEilzC7Na7JeWTnAIQhhFvrr2xrsf5ypxEPzwPsr0IjIdn+T5hZ0eBWQU
         bihg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=BmYTIcKLsjSP0VeDjPsSNIvplrmTqdntAb0QToAyFZY=;
        b=1BK5DtVav3F3esVxTIwy1bUR3UU1fxoMLF799+1t4zLdJ/HmMjIUQg0DmQiwXK+kAT
         Exgj5tHHQTJy7msFFb3YVwGpKaytx2VKWh+mzqRFVKRcbTagMlXtE1fjfkw2wPxhq2Ru
         G+ZhZzx+qfWJpOSx6Y/NKeX7WZYAiGXtEEF7eHOdV/8j3azEIfrbBVyB2Wcwa125Ludi
         8gFPRdev1TrfJ6UDfw8UQTCE9/pGn/nyyinKmVnmp41zneeBNkVhXJiUuZZJsJQihoch
         oSnkxCvIzeFqvku3bjVPZZazG5ZpzkcNNGsDXFxrWEv0JDnebK9XJiXtx02EwnKHXxLT
         Wz1A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y10si16877958qtk.369.2019.10.02.04.18.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Oct 2019 04:18:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iFceF-0006f8-PK
	for alex.bennee@linaro.org; Wed, 02 Oct 2019 07:18:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35345)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iFcdE-0006B9-HB
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 07:17:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iFcdC-0007o2-R3
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 07:17:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45928)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iFcd9-0007kL-OF
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 07:17:16 -0400
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B4950C0546FB
 for <qemu-devel@nongnu.org>; Wed,  2 Oct 2019 11:17:13 +0000 (UTC)
Received: by mail-wm1-f69.google.com with SMTP id c188so1943607wmd.9
 for <qemu-devel@nongnu.org>; Wed, 02 Oct 2019 04:17:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BmYTIcKLsjSP0VeDjPsSNIvplrmTqdntAb0QToAyFZY=;
 b=d7BKZNat7PCAWN8yR5BwIFlhuY7JU5C8rqFanbfg8qdio9ZPOAExWBeLGzL6N8eqr1
 j8BuPPGniHop5QsfmjqLadyasb2fCBOQKx1cc5DDaCjy0ecmIzUpyqvpjaBLL7+PWSLC
 vaTWO+b9C6y/MEDBPoHP4XbGFY+eP2/0SnwS8SS5aUvq5z+FmMzKzFEgDcqXD5nfEL66
 eVIySX1tPsNcKIJm4I5kmgp1cAyAtmFsZgXVKcrucy3L2/e3NlJZxnW+vVcNeG5e8Gzh
 CkPoYGAvt1O9v5qo0N2Ra8j/9f9wWG60Ik26TPsJbgRXRDgScDXiW9tnZcZLRC8Igp2u
 M0SA==
X-Gm-Message-State: APjAAAVEIsFWTRT2g9tbQteeBYwz6oqyCd2q/my9KwLa7F4otYrscaCa
 ht5GNVd8fKORjhTKSqW/1Xw/lwNNCFG7i9r6KDvdobGZDR62PlcO2m+EGrPizYVlbv+cMKdV4g5
 Q4xAtOJFJrNBBVK4=
X-Received: by 2002:a5d:5552:: with SMTP id g18mr2196625wrw.386.1570015032520; 
 Wed, 02 Oct 2019 04:17:12 -0700 (PDT)
X-Received: by 2002:a5d:5552:: with SMTP id g18mr2196602wrw.386.1570015032326; 
 Wed, 02 Oct 2019 04:17:12 -0700 (PDT)
Received: from [10.201.33.15] ([195.166.127.210])
 by smtp.gmail.com with ESMTPSA id o19sm19350854wro.50.2019.10.02.04.17.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2019 04:17:11 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH 18/19] hw/timer: Declare device little or big
 endian
To: Tony Nguyen <tony.nguyen@bt.com>, qemu-devel@nongnu.org
References: <cover.1566829168.git.tony.nguyen@bt.com>
 <9fde52f9085bd7ad607bf2372931178e4a01fabd.1566829168.git.tony.nguyen@bt.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8c66b0cd-f4ee-0b5f-fd1c-e843cae09e48@redhat.com>
Date: Wed, 2 Oct 2019 13:17:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <9fde52f9085bd7ad607bf2372931178e4a01fabd.1566829168.git.tony.nguyen@bt.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Fabien Chouteau <chouteau@adacore.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 Joel Stanley <joel@jms.id.au>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hfIb1WFHnOEa

On 8/26/19 4:21 PM, Tony Nguyen wrote:
> For each device declared with DEVICE_NATIVE_ENDIAN, find the set of
> targets from the set of target/hw/*/device.o.
> 
> If the set of targets are all little or all big endian, re-declare
> as DEVICE_LITTLE_ENDIAN or DEVICE_BIG_ENDIAN respectively.
> 
> Then, on inspection:
> - if not used, re-declare as DEVICE_HOST_ENDIAN.
> - if max/min size=1, re-declare as DEVICE_HOST_ENDIAN.
> - if just a bit bucket, re-declare as DEVICE_HOST_ENDIAN
> - if PCI, re-declare as DEVICE_LITTLE_ENDIAN.
> - if for {ARM|unicore32} only, re-declare as DEVICE_LITTLE_ENDIAN.
> - if for SPARC only, re-declare as DEVICE_BIG_ENDIAN.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>   hw/timer/a9gtimer.c         | 4 ++--
>   hw/timer/arm_mptimer.c      | 4 ++--
>   hw/timer/arm_timer.c        | 4 ++--
>   hw/timer/armv7m_systick.c   | 2 +-
>   hw/timer/aspeed_rtc.c       | 2 +-
>   hw/timer/cadence_ttc.c      | 2 +-
>   hw/timer/grlib_gptimer.c    | 2 +-
>   hw/timer/hpet.c             | 2 +-
>   hw/timer/imx_epit.c         | 2 +-
>   hw/timer/imx_gpt.c          | 2 +-
>   hw/timer/lm32_timer.c       | 2 +-
>   hw/timer/milkymist-sysctl.c | 2 +-
>   hw/timer/mss-timer.c        | 2 +-
>   hw/timer/pl031.c            | 2 +-
>   hw/timer/puv3_ost.c         | 2 +-
>   hw/timer/slavio_timer.c     | 2 +-
>   hw/timer/stm32f2xx_timer.c  | 2 +-
>   hw/timer/sun4v-rtc.c        | 2 +-

This patch affects various areas, maybe it is worth splitting in at 
least big/little changes? Or 3: ARM first, then big/little.

[...]
