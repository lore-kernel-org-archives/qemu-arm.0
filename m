Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp2528088lfg;
        Mon, 3 May 2021 03:05:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzW7xbQIEFgH1FTI8pRZsTLivDX6b/fc+ywNrzSPpR0A4+xgghf7B5WgE5tOdBP77xRO8Rt
X-Received: by 2002:a05:6122:41d:: with SMTP id e29mr13986351vkd.21.1620036359712;
        Mon, 03 May 2021 03:05:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620036359; cv=none;
        d=google.com; s=arc-20160816;
        b=zt/KzEAUiysvJyx7/EIG8x7C1lSYHyRipO80LaK8BDltCkIh8jfU0UgduNxiwxFc9h
         ZvXw8jf6cEKHne4xOZvxXfRKYW6y4VjIrskEQkxmqkO1T/qiPr2gSCYt5Q4uuj/d7yKa
         NTWeIRfvkDjDX4M6oOqigRSEbPzamVrg7owfl+heNAp0IWqUwUrJWqkf7AIRtrxa9a0+
         vmA2fnjnblxMJGVQ0Ptvk8lai7H8fPs2ihgljrx7G1sqDW1bXvt6pBGY2kmjn/KZOHc0
         upThv1B9ckbWVVtBjkyBXXV3+BSeeW+yHTDuiYr8q1PdDJArYX2kUNHyI06Gp7EDK2R7
         sVFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=8k9vToCesXhyHAeWvykcxOSdY3xA/zuYk+EEFv26BxQ=;
        b=DRuGCbiBG12D4U+mHH8jHLxNUDNjjzFUCOMZtagNfyshTn0O/dfgmsPqu1bwVnUsQQ
         a4y5En5GAoxC47kNT3PKaYSq3TArqGCRPZYsngAjnvAjMXZEP0R8OOgvNFSFXj+f/Tsw
         HRoxJ6CknCSmjsDtgDSqXnVje9fy9tJ56ov1W9tpNxj7FmxhO7CPjZzbPlEcdQDlXmbg
         rLFJBJ+1HxDHCN+oz9SO5J6goHzrKjfuFjR/V1U+PolfAnv+d+fOb1DvYfq/iJa/8aW1
         XVzf+c7P7qfCrdtXJLMpHxJ9p3qEUkfxCs9kenU8g/g5qsdiHecLgI2FcqueZ74yJm8u
         QJ5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=m2uf8XGs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d26si4607129vkn.44.2021.05.03.03.05.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 May 2021 03:05:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=m2uf8XGs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:36742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ldVSf-0007Kq-78
	for alex.bennee@linaro.org; Mon, 03 May 2021 06:05:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldVSI-0007IK-QM; Mon, 03 May 2021 06:05:36 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:35740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldVSG-0003KG-1a; Mon, 03 May 2021 06:05:33 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 j3-20020a05600c4843b02901484662c4ebso3771641wmo.0; 
 Mon, 03 May 2021 03:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8k9vToCesXhyHAeWvykcxOSdY3xA/zuYk+EEFv26BxQ=;
 b=m2uf8XGsslX4GhFx1JWQUjqFfuIoHThFCK+5K7kYRPfw/vW3RLsPoXDAx9iraTuB/e
 wDkVFiQTcvrc2TIQPOx9baOO4lmpBNObbOXq2tQ8zipVeQZOFgmHnQIQBTQNWXAeGJOy
 pGMtv1vxVkY+4hJG3miaGJDuUMU2rGUAWhkhEgifwu5aH0NCvC6pnG1xnxauxkp7C4x0
 0xdmqUXv5vRNV6yDbK9Ks5PIScjKQmGeuHBybcXKeBioP64+JyG5sGdjIMiwtdCN/Gnu
 aPsR+PhgdvPusKRR6YNaBBPkSsyfAYsXdDCnrRUVdUPe1r3ABxcnK8kxsVGgXDKqc3pZ
 Fwsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8k9vToCesXhyHAeWvykcxOSdY3xA/zuYk+EEFv26BxQ=;
 b=VPR54drFrh9AOUVeXSClDa94hIV3DTOV12gPF+4NQw4XgJ4f3jbWZg64ARznXhMJQM
 1otRIFwyMJtO3JpYIk/qEZSCPAApjnJZQ2al8gaOlMttkvb1BP8aBTuuWdQw+/Mgtvyl
 9GGOqoka501oBmQonHyNTsZW1tHIi/IP9K6JtmrsNarkd7dtKgmuZkfobhtWJ8xHLDh+
 oQ90JcnMrmovD0IaHGGjMP6OcO7WAJO42/Bf+ZE7VCjwo7U+ut6o4QSEGgSCrCW0eA4m
 Pbae7VtamqZ3g9Z2VFYWUFk4z/HUypYZ8u0KB+7evmBAuIx7HgMgyf26ypdO080FwwCx
 1K2Q==
X-Gm-Message-State: AOAM533zhZHhJ9zkTiRIipwN6gHN38FDRbb5iJf0sTWMy88p228yLlE0
 OfrSDr4WnsIuAJ6brd2NxHo=
X-Received: by 2002:a1c:2785:: with SMTP id n127mr20833316wmn.52.1620036329573; 
 Mon, 03 May 2021 03:05:29 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id c5sm11374384wrs.73.2021.05.03.03.05.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 03:05:28 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] hw/pci-host/raven: Manually reset the OR_IRQ device
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210502203121.630944-1-f4bug@amsat.org>
 <20210502203121.630944-3-f4bug@amsat.org>
 <CAFEAcA_V6bM-UtEmF1a7_7Jad88aZ2J-dGpSs=cs+smvYEaV3g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1bd05e3e-ef79-fb9f-14b5-06a8dc432c5d@amsat.org>
Date: Mon, 3 May 2021 12:05:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_V6bM-UtEmF1a7_7Jad88aZ2J-dGpSs=cs+smvYEaV3g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Greg Kurz <groug@kaod.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a2wDacK2noNT

On 5/2/21 10:45 PM, Peter Maydell wrote:
> On Sun, 2 May 2021 at 21:31, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> The OR_IRQ device is bus-less, thus isn't reset automatically.
>> Add the raven_pcihost_reset() handler to manually reset the OR IRQ.
>>
>> Fixes: f40b83a4e31 ("40p: use OR gate to wire up raven PCI interrupts")
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/pci-host/prep.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
>> index 0a9162fba97..7481bbf99d4 100644
>> --- a/hw/pci-host/prep.c
>> +++ b/hw/pci-host/prep.c
>> @@ -230,6 +230,15 @@ static void raven_change_gpio(void *opaque, int n, int level)
>>      s->contiguous_map = level;
>>  }
>>
>> +static void raven_pcihost_reset_enter(Object *obj, ResetType type)
>> +{
>> +    PREPPCIState *s = RAVEN_PCI_HOST_BRIDGE(obj);
>> +
>> +    if (!s->is_legacy_prep) {
>> +        device_cold_reset(DEVICE(&s->or_irq));
>> +    }
>> +}
>> +
>>  static void raven_pcihost_realizefn(DeviceState *d, Error **errp)
>>  {
>>      SysBusDevice *dev = SYS_BUS_DEVICE(d);
>> @@ -419,11 +428,13 @@ static Property raven_pcihost_properties[] = {
>>  static void raven_pcihost_class_init(ObjectClass *klass, void *data)
>>  {
>>      DeviceClass *dc = DEVICE_CLASS(klass);
>> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
>>
>>      set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>>      dc->realize = raven_pcihost_realizefn;
>>      device_class_set_props(dc, raven_pcihost_properties);
>>      dc->fw_name = "pci";
>> +    rc->phases.enter = raven_pcihost_reset_enter;
>>  }
> 
> Why does this device have an OR gate rather than having its
> map_irq function say "all PCI IRQs go to interrupt 0" ?
> (The PCI core code provides you the "OR" functionality for
> free, because it has to do that anyway for when multiple PCI
> cards share a PCI IRQ -- see pci_change_irq_level() and
> pci_bus_change_irq_level().
> 
> Supplementary question: why does the legacy_prep setup create 4
> outbound sysbus IRQs when the map_irq function can only ever
> return 0 or 1 ?

I'll let the maintainers have a look (I'm just trying to pay the
technical debts so we can remove legacy/deprecated API and move
forward).

Thanks for the careful analysis,

Phil.
