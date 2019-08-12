Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp482796wrs;
        Mon, 12 Aug 2019 05:14:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw8eqY1YiYksyFPlpaRUQJ1AP7gi5ZhP6eq8H78Bn5LwLvWXgjWJvZ+npLROByas8oUSfn5
X-Received: by 2002:a37:3d7:: with SMTP id 206mr29720018qkd.252.1565612064375;
        Mon, 12 Aug 2019 05:14:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565612064; cv=none;
        d=google.com; s=arc-20160816;
        b=UG83uIC8gR1V4e8K6zdRWR03odCXGMcscHrhvxORKaQAICHTIwPH/wi+spty58zCT8
         8Be3Y95AFy4uCZ5BPR3uKmMR87zQhnMNQgVpBGRMEC1CV7FRGn25Rdm4TMvg/uAerAZn
         gfy1RfgrYu0cEK+tBjBEfxg83AEQkWoojaR9soArBCKQ5ldOm/3XVyxVewQ1ERDikt1P
         cll/ur/oWyCW8notIfhnOfUQsYNtw3ztQu3V+dA6Xaa9I0omKb8n+929RBHpC2CRqGpA
         GmfKFbaCTRy5rz0GwINtliC+1tTq3ybOJxWU7uDj4zBAjCwhMXmeQ90AYrjiJI1LTmzj
         dwsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=IBLr+u7Omhe4cYbWFp9NEZ+Iwp7fVpbeVHlbGLeo4+Y=;
        b=0Akot4sXTo4b7L4fWE0K8wfes+Vw1xwAOLaLpa3oieeJv02Bdv2SiGaDejD/sj7CGb
         dDOKHMhmXEz0HKxyQWVa+bz1hG+PJNg9RO2RIId1tsWSReMqIp54aF8R0ZvUxkaCHgMu
         aQ7UhU6tMC2SwjcJfXUR97HjUe+K6Mtuw58Irpyig7Moj5vzp3BqwTJcY10C0LrtcstM
         Y9TNpWA7rxFD19lp4x2RlS7XY7FekyYVHAuAPgvYYZuKq/fPC3D8JM6NxtL++nVlLp9W
         aflmk79lomeSlXyl9SkCADEya2Wc62NpgwjLcHsDtBcq9Qrv+CBwetUFHZ4hRx2TgqFo
         VQhA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m46si65517483qtb.87.2019.08.12.05.14.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2019 05:14:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hx9DT-0000Lb-Sw
	for alex.bennee@linaro.org; Mon, 12 Aug 2019 08:14:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40753)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hx9DM-0000GD-07
 for qemu-arm@nongnu.org; Mon, 12 Aug 2019 08:14:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hx9DL-0000zn-24
 for qemu-arm@nongnu.org; Mon, 12 Aug 2019 08:14:15 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50901)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hx9DK-0000zN-Sz
 for qemu-arm@nongnu.org; Mon, 12 Aug 2019 08:14:15 -0400
Received: by mail-wm1-f68.google.com with SMTP id v15so11945812wml.0
 for <qemu-arm@nongnu.org>; Mon, 12 Aug 2019 05:14:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IBLr+u7Omhe4cYbWFp9NEZ+Iwp7fVpbeVHlbGLeo4+Y=;
 b=NeStEl2Q56W/NGQmFmdt1eOh1tsm0XktqYDXDQiRsex7nqDmkeTR0gDca5G1sVw7Hx
 qEiaLjUEzurI0D/GaydIa4qFSwb+l/BPNAU0Phcv2B/XcQ4PdyRGJq0leGYMZYgoje2q
 Qj+7xRgXy0+H4nrPlgjxi364devxA4IyHeUsmogTjvFGFrhLsS6rjCh8jHmznQiz0azx
 GPuHafwHW5BWlvrQGQN+G6R1WRKy6apaGwMo2RMQVtU2CJxJTYQEIqVG8xUR8rsol70p
 zXPdR6rrUM2iK8zE0FKe4hVU96xvNhM78gNgOvwo/CbEAhFNt5WtGfMWJSDhokxX8jKw
 Vfhg==
X-Gm-Message-State: APjAAAXbkw/kpww6yNbQTxfus/cIXbE5lbN/3z/RWiacNGisV7K5jx4o
 J5yqi6W4NibkSLhKVkELFxBt1g==
X-Received: by 2002:a1c:2582:: with SMTP id
 l124mr29082968wml.153.1565612053827; 
 Mon, 12 Aug 2019 05:14:13 -0700 (PDT)
Received: from [192.168.1.37] (225.red-83-53-161.dynamicip.rima-tde.net.
 [83.53.161.225])
 by smtp.gmail.com with ESMTPSA id j16sm60733178wrp.62.2019.08.12.05.14.12
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Aug 2019 05:14:12 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190701123108.12493-1-philmd@redhat.com>
 <20190701123108.12493-4-philmd@redhat.com>
 <CAFEAcA_m3LiLQqL8y6rT=HGeoa7B5XAQH9Wuo=Hg-94PaV3Zsg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <b2a83b98-3e20-4f62-d442-6ab6e26ab60b@redhat.com>
Date: Mon, 12 Aug 2019 14:14:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_m3LiLQqL8y6rT=HGeoa7B5XAQH9Wuo=Hg-94PaV3Zsg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-arm] [PATCH 3/6] hw/arm: Use sysbus_init_child_obj for
 correct reference counting
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nvRjTqKIfLET

On 7/29/19 3:03 PM, Peter Maydell wrote:
> On Mon, 1 Jul 2019 at 13:31, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> As explained in commit aff39be0ed97:
>>
>>   Both functions, object_initialize() and object_property_add_child()
>>   increase the reference counter of the new object, so one of the
>>   references has to be dropped afterwards to get the reference
>>   counting right. Otherwise the child object will not be properly
>>   cleaned up when the parent gets destroyed.
>>   Thus let's use now object_initialize_child() instead to get the
>>   reference counting here right.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  hw/arm/exynos4_boards.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
>> index ac0b0dc2a9..5dd53d2a23 100644
>> --- a/hw/arm/exynos4_boards.c
>> +++ b/hw/arm/exynos4_boards.c
>> @@ -129,8 +129,8 @@ exynos4_boards_init_common(MachineState *machine,
>>      exynos4_boards_init_ram(s, get_system_memory(),
>>                              exynos4_board_ram_size[board_type]);
>>
>> -    object_initialize(&s->soc, sizeof(s->soc), TYPE_EXYNOS4210_SOC);
>> -    qdev_set_parent_bus(DEVICE(&s->soc), sysbus_get_default());
>> +    sysbus_init_child_obj(OBJECT(machine), "soc",
>> +                          &s->soc, sizeof(s->soc), TYPE_EXYNOS4210_SOC);
>>      object_property_set_bool(OBJECT(&s->soc), true, "realized",
>>                               &error_fatal);
> 
> I suspect the code change here is correct but it doesn't seem
> to match the commit message -- the old code is not calling
> object_property_add_child() at all, and the new code does not
> call object_initialize_child()...

OK, will improve, thanks!
