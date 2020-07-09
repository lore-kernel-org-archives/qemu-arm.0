Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1076691lfm;
        Wed, 8 Jul 2020 22:34:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1RaXzhFtgmYnPCdFD57VFZJK3uZKalKvjzW3BoFrFTMLQDwtgRSZKBv7mz7xKfXC9/TLl
X-Received: by 2002:a25:4dc3:: with SMTP id a186mr49012819ybb.106.1594272870877;
        Wed, 08 Jul 2020 22:34:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594272870; cv=none;
        d=google.com; s=arc-20160816;
        b=f8mRxiTWcPygVWFN/w1C7gSDOqlpRXSpftZF2wPO19fFjWHBsW//pEETMNE5sAkaag
         nG0r0jOhA8eTk2G8t2PEMxBQd9oe1ZB+rW+lphA6KkYXFFeS0BPfP/oRQCQLitKt8iUs
         BroVo4rjCT+W357GP374hSQjXP3EBeCoHsCeYkSYbocFq6op5aLZaWiEH5mXTq0Iz2RE
         CZzguDmyeu0AHTW3jc/DOS3+6XqzvveemdvZmbyIgNajFUvWh/scCqiY5tlP8VbFhEZs
         fvJEq7m0Avnlc+jseXzmcpccWMl4N4CgGBnYmAahftVCc2GBFhqifX30DI32ft3yuNhI
         2KFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=OrR3Z1znEUDds/mQrhxbFHfHFATqlj6dLaDL002fzMk=;
        b=ZZWDHelDdbGxo85zXKpa/uncNH8zgI7QqQsdAn9H9hA9bNDVoh8V3rXSDNp0QZCK/p
         leAZw8B1Rim73J9zGLIB2DxtrZPUpOK0LLuMC6ZLOU3lZBkE50BuWTIzG9oOdmJ+FFiK
         Lcq9uXASulBLhGhYKHLCzYVXzMNDUACMSIirzMudU5Tr93wAmKJSu61b0ZrTID+GY19O
         3pjaGbjjao/oetWps3TGrhlAVQBxfb/EPshiUG/EZ50HOAEbXRilTNUbpta2Z6QzCtlR
         E+ZAPjg5zw1++PTM9aVX17kJzW7gdnyvTi2awATZAAHZc9prdQccoPMyOLxK529wZorv
         5F/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="C6zeb3//";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l126si1706247ybc.480.2020.07.08.22.34.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jul 2020 22:34:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="C6zeb3//";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:36972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtPCY-0002QP-Ab
	for alex.bennee@linaro.org; Thu, 09 Jul 2020 01:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jtPCR-0002QE-JN; Thu, 09 Jul 2020 01:34:23 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:44307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jtPCQ-0002bk-44; Thu, 09 Jul 2020 01:34:23 -0400
Received: by mail-wr1-x444.google.com with SMTP id b6so903566wrs.11;
 Wed, 08 Jul 2020 22:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OrR3Z1znEUDds/mQrhxbFHfHFATqlj6dLaDL002fzMk=;
 b=C6zeb3//BogHt4RIxTgB7dSXflWf8oWig0CjwMeCxiRfUNGmvB76tMrf8WqItGRCuX
 pQzlz47clX5FOqwd8f5AnrCtNPBoT94GdXZxQzVwgWXGRQfhj6h2D72CfPcXafFFFCaz
 /SbpMmo50jI77tMJCsE5/LhOv2M7tysayD2AtQir6hDpR+kKCkkDcAz1IgUarDi4PE4A
 tojugrrod4HAAH2BXQKZ+YG1OhUyMJ6xKAPWyhHY+cKgGj+x0vgAjMnaDxfYO3S2b2wV
 MYb9Fj4l8QswGl660C0OAdhAyIKsb67TuyvIr3xuTm9yEmvATvVK7d50ayCfP8XQxOau
 ExBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OrR3Z1znEUDds/mQrhxbFHfHFATqlj6dLaDL002fzMk=;
 b=jBk9jp7dnayyROuF/zOatc2bjq6mjoIh2wuGbYwBEDpFpWzG8ngcpQggP+O1ZGs34g
 JK6L6SOorGB21A2GbR8dUrxn6jMScPWOBZKGm38zuu53e4Cy4a7duEC/zcCRsY8puKiI
 +A2fZTgCTg7UDtO4Mjcx0/B7L1RrdpCic9uBnJ8MdnLn8h2+JVFOKGVbllxCovQf+2FV
 Lw2tyuz38grrc3ynqGCdGKWU88p1wiUSSGmK+oklsgvc+Cyq47xh4YH132mLa698CelO
 eiQL4+f0xvYNW4yyzO3l9jv+z9wopDDDBl5LjqhiCPckQGXGzGNB+jqRnSYAvopS2rih
 +1wQ==
X-Gm-Message-State: AOAM533hZwCtNSaBMvPLBErUG4Pl6KE0jNwikC1porszzmXQlT2BCsd9
 /wnTNrTlWCBJ7TRUAMc22Jw=
X-Received: by 2002:adf:f889:: with SMTP id u9mr67408394wrp.149.1594272860250; 
 Wed, 08 Jul 2020 22:34:20 -0700 (PDT)
Received: from [192.168.1.36] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id d81sm16653152wmc.0.2020.07.08.22.34.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jul 2020 22:34:19 -0700 (PDT)
Subject: Re: [PATCH v4 05/12] hw/arm: Add NPCM730 and NPCM750 SoC models
To: Havard Skinnemoen <hskinnemoen@google.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200707184730.3047754-1-hskinnemoen@google.com>
 <20200707184730.3047754-6-hskinnemoen@google.com>
 <4b7130f2-032c-3067-b2b6-876a2b17b707@amsat.org>
 <CAFQmdRYi5QFHbcWQH-bWqAsSCidzYMedC8n+mib1DPpJuEy-Rw@mail.gmail.com>
 <CAFQmdRZdUKvmi_eKdtCnR8uP63sRP9X0Z7oxZES56mtSz_=7FA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <af879fd1-dea8-a3f2-d3fb-13be24c0b740@amsat.org>
Date: Thu, 9 Jul 2020 07:34:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFQmdRZdUKvmi_eKdtCnR8uP63sRP9X0Z7oxZES56mtSz_=7FA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: CS20 KFTing <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, QEMU Developers <qemu-devel@nongnu.org>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C9RnvFOZlH87

On 7/9/20 2:06 AM, Havard Skinnemoen wrote:
> On Wed, Jul 8, 2020 at 11:13 AM Havard Skinnemoen
> <hskinnemoen@google.com> wrote:
>> On Wed, Jul 8, 2020 at 10:31 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>> On 7/7/20 8:47 PM, Havard Skinnemoen wrote:
>>>> +typedef struct NPCM7xxClass {
>>>> +    DeviceClass         parent;
>>>
>>> Similar comment that elsewhere on this series, if NPCM7xxClass not used
>>> outside of npcm7xx.c, keep it local.
>>
>> OK, will do.
> 
> Turns out it is used in npcm7xx_boards.c, so it has to stay where it is.

Indeed:

static void npcm7xx_load_kernel(MachineState *machine,
                                NPCM7xxState *soc)
{
    NPCM7xxClass *sc = NPCM7XX_GET_CLASS(soc);

    npcm7xx_binfo.ram_size = machine->ram_size;
    npcm7xx_binfo.nb_cpus = sc->num_cpus;

    arm_load_kernel(&soc->cpu[0], machine, &npcm7xx_binfo);
}

This is fine.

Just thinking loudly, we traditionally add the load_kernel() code
in the machine, because it is often specific to Linux guest, and
the SoC doesn't need to know about the guest OS.

hw/arm/boot.c contains helpers also useful for firmwares.

The SoC has a link to the DRAM so can get its size.
All the arm_boot_info fields are specific to this SoC.
So we could move a lot of code to npcm7xx.c, only declaring:

  void npcm7xx_load_kernel(MachineState *machine,
                           NPCM7xxState *soc);
