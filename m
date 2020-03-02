Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2708198lfg;
        Mon, 2 Mar 2020 09:55:16 -0800 (PST)
X-Google-Smtp-Source: ADFU+vu9Jmcjk0qXUkvfPQn3SbfbUyNEgOiOo+KmWl/EiOAE82ajDfQ6KBTZ42V/PqjnMVehVqNF
X-Received: by 2002:aed:304e:: with SMTP id 72mr822783qte.113.1583171716822;
        Mon, 02 Mar 2020 09:55:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583171716; cv=none;
        d=google.com; s=arc-20160816;
        b=nUqg2FlWQTvfhyVt5CHIzqF5wT7yyJVQo6wojG01r0/dqVaSBp2qoDf5XKZXP0QrAV
         3uxij+MubEMnXo2AhnSw++bnmalwee3CC53PTH84K1blnIJkPNMdFhhdR85FLfJgBSAF
         AN+107zRE/q71h144YlyTaPoxFdLhNWmfsBGvSzcUcIPFoGM3EVgNFamvbUuOyZrKwfd
         YswHM/jMhB0WgWzYsFrxumjv/Ge57yezliLFx9EtwMx7ejRZTg2JlT2HJHa2mTeawqk8
         Sl7kINfYoHc3dTXjcMsF2isJBJ7/JrlKeHqh281e48qDB+jRT0VVFf8AJzkAhrAdegrG
         bQRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=qV/n+9E+KvPiSQBkYJToe7Cqz4DZjwM9HXO4lcmyJCA=;
        b=Gw+DwB99fnU9otZv13GGgJdl4cH/GGEjCCrd0kl1R9Tx9gx2Cwac9UKWHw0qRVcm7l
         a9zETImB0xpfIVsIu7xj3ZayPaSCIniMubd6uiBiR15yqk/SptHDQN+LuMNeovom0GoN
         SIY4WGJXjUUuLE+vX9Qn65o4gvLLfK8va2MBlkQrRckNxZ5w9P9FeTbzzgjafMZqsl/x
         Ziu05Sjgkw+e+p+rfaOn2LAPpx2Ju1ZJ7TKE0NGI9ThNiq2i39C1RW16PxuruUeCC2+r
         z75+35DSq4oYXf25x9dv32xjHkJHX9HaieZ4C5vZzKJJWDZAH7ATgOCPjr9zAB4wq5Aw
         QYOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ey6DjKiW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e16si6220773qkn.133.2020.03.02.09.55.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 09:55:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ey6DjKiW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8pHg-00055Q-6A
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 12:55:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38227)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j8pHX-000558-IL
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 12:55:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j8pHW-0005lp-8d
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 12:55:07 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:29283
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j8pHW-0005lg-5h
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 12:55:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583171705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qV/n+9E+KvPiSQBkYJToe7Cqz4DZjwM9HXO4lcmyJCA=;
 b=ey6DjKiW2UzjsILKwGpY7+E/KRZK0Hl8Qjv2IdH86WPCCJQQzbOLGKWycQ0ruZPF7OzlrS
 Rwi/9lk60EF3xPFJJ3qOLMNXBwsO1ZpIXD5aV+ZlkBHHYnnySmFNhL0H/pmqRsE1chCa2U
 2T7xDAwwq3ssuSb3ML92fI0IjfKADhY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-Sp4At40WPey2Vf5J1J0MaA-1; Mon, 02 Mar 2020 12:55:02 -0500
X-MC-Unique: Sp4At40WPey2Vf5J1J0MaA-1
Received: by mail-wr1-f70.google.com with SMTP id w6so30097wrm.16
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2020 09:55:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qV/n+9E+KvPiSQBkYJToe7Cqz4DZjwM9HXO4lcmyJCA=;
 b=D5Z3+AofPEDIFa2X/JjYcS0Wz8qo6wEEZNee4tmjIDKrxmlGIKuAsvZCpM8NHhenYN
 tUHa9HNLDpVTLMzdK5bMqcF0Z/ImcJx/Auxqxsf3IGPjOk2+nZIAvx3bFCZKUCpdINRA
 xHfXsXVYnIfGjc5Z0aaPwin2EIsEZVIniKKiuuAfqbVmTAo2XYl0k7VDAjqLWqQnZOB7
 DjontQDuMxNWjMwfW/lVSajwtAnEX2YDR/YaJvaBmRqwh3vW7wrgv6UGSp51Jb1vGgl5
 UK9JAVNnoIvu4Kv+pGaz2bsWf3rxMD93XI1sC0bBESMT/ffj0b+fe750BY2c1Aw/6MER
 ZXnQ==
X-Gm-Message-State: ANhLgQ2mnpM0LiAqjc9MPg0ePteXJKLNqe9yiZSEjWPBS2OMuZnZfMdh
 uMAbcdZDh7AJay8WKFb/zkQ9Q+njEh9pwSEKUJjARx4jmMMw3HmBBo8k3NCj0nPcHQwm6frv7aT
 +zGI2VY/x/ujS
X-Received: by 2002:adf:a50b:: with SMTP id i11mr833081wrb.60.1583171698561;
 Mon, 02 Mar 2020 09:54:58 -0800 (PST)
X-Received: by 2002:adf:a50b:: with SMTP id i11mr833063wrb.60.1583171698324;
 Mon, 02 Mar 2020 09:54:58 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:3f7b:4b69:b9c:cdc0?
 ([2a01:e35:2fb0:49e0:3f7b:4b69:b9c:cdc0])
 by smtp.gmail.com with ESMTPSA id e22sm168991wme.45.2020.03.02.09.54.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2020 09:54:57 -0800 (PST)
Subject: Re: [PATCH v1 1/4] hw/arm/cubieboard: use ARM Cortex-A8 as the
 default CPU in machine definition
To: Peter Maydell <peter.maydell@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>
References: <20200227220149.6845-1-nieklinnenbank@gmail.com>
 <20200227220149.6845-2-nieklinnenbank@gmail.com>
 <CAFEAcA_xB_dMfcALk6sirmRJyJ0rw7_JPK6aqBoZMxh=wH+d-g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3ad40e56-6afc-6dc2-7e73-41dadb2b7c6b@redhat.com>
Date: Mon, 2 Mar 2020 18:54:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_xB_dMfcALk6sirmRJyJ0rw7_JPK6aqBoZMxh=wH+d-g@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +A1vIfr7NpWB

On 3/2/20 4:32 PM, Peter Maydell wrote:
> On Thu, 27 Feb 2020 at 22:01, Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
>>
>> The Cubieboard is a singleboard computer with an Allwinner A10 System-on-Chip [1].
>> As documented in the Allwinner A10 User Manual V1.5 [2], the SoC has an ARM
>> Cortex-A8 processor. Currently the Cubieboard machine definition specifies the
>> ARM Cortex-A9 in its description and as the default CPU.
>>
>> This patch corrects the Cubieboard machine definition to use the ARM Cortex-A8.
>>
>>   [1] http://docs.cubieboard.org/products/start#cubieboard1
>>   [2] https://linux-sunxi.org/File:Allwinner_A10_User_manual_V1.5.pdf
>>
>> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
>> ---
>>   hw/arm/cubieboard.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
>> index 089f9a30c1..0195925c73 100644
>> --- a/hw/arm/cubieboard.c
>> +++ b/hw/arm/cubieboard.c
>> @@ -68,8 +68,8 @@ static void cubieboard_init(MachineState *machine)
>>
>>   static void cubieboard_machine_init(MachineClass *mc)
>>   {
>> -    mc->desc = "cubietech cubieboard (Cortex-A9)";
>> -    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a9");
>> +    mc->desc = "cubietech cubieboard (Cortex-A8)";
>> +    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a8");
>>       mc->init = cubieboard_init;
>>       mc->block_default_type = IF_IDE;
>>       mc->units_per_default_bus = 1;
> 
> This is worth fixing, but I'm pretty sure it doesn't have
> any user-visible effects, because the CPU is created by
> hw/arm/allwinner-a10.c:aw_a10_init(), which always uses
> cortex-a8 regardless of what the user specified on the command
> line or what the mc->default_cpu_type is.

It is worth fixing if we continue the MachineClass code cleanup Igor 
wants (moving the ram size / cpu type checks in the machine common code).

> 
> Fixes: 8a863c8120994981a099
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> if you tweak the commit message to mention that it
> wasn't a user-visible bug (but I'll do that myself if there
> isn't anything else in the series that means it needs a respin).
> 
> thanks
> -- PMM
> 

