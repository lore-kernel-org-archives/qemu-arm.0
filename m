Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp4980848njc;
        Fri, 8 Nov 2024 07:08:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVu+49VSNI8UaQG0nmHwbeMX6rCRTf2ISmPXhtbPAk/KVtR6CM7OCHKnKjo0kMq+a8jwYsrcIAooLxPHw==@linaro.org
X-Google-Smtp-Source: AGHT+IFUwDtRXyOkUBugP9CLEKSI6KO3l9lVmxLVptpohGJ/vRvKvXq4Q9crOjMNUC3oy7X5UCbh
X-Received: by 2002:a05:6000:1445:b0:37d:446a:9e60 with SMTP id ffacd0b85a97d-381f1839803mr2958294f8f.0.1731078487506;
        Fri, 08 Nov 2024 07:08:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731078487; cv=none;
        d=google.com; s=arc-20240605;
        b=ILFE1lriPXJhoGIyyWViORjNZUCGWUe8XhgJ+GknJoFzuLdM+Tlj9LA5MjqQZhYonk
         JDvM8EEsaD0XL16JM7gJQJVRERHNxr71WW6/MdieiuvVFiGSXHhg2P8tRz96aa9h/jlA
         lffzUcZ704FlNsysU31GMeRnjz1+9NySvK/1Vk5D2LJJKYuo6l5OxW+2o9bzaGORQbF8
         uwuGVKIhfcgWYKczmY6tJALLMr74el5cwSa3/vE+7Jipmtjqc8l8fLMqKMVUglXot/Xe
         wq06YMEScScOzEONdoW5PykS8QvEifCpLonDcbATTP6PCR3h38MeWL2PGDyW3W1l8Uwg
         jw5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=MdVJK+skN3puiJ7nU645pMIhqPtlDTNMSBqXn2QS3MU=;
        fh=Cy4iaXPqlKbwfOCXyuMGH9SScq1edzJ6nZbdy+n9ev0=;
        b=YxvBrjl2aq9Gq1ohfQ77zVvunHuiveWKA5yMpznoZRpYq6PIfduRtJb+I6sHoRQ7U6
         7CNdJu3QgnF50xX0eii1+npHfD80mHCxKEWX8BDSR/tfvmIZBIIzDkxT0TM8hslhhUOj
         HG1xRxq0tZ9cJcJmtn3OFc34KesyOqwkB7LJRdNwT++zth8ttaKzFnGFfVb2s08c4Fq0
         FTLahqa3DiT94C1CimFqhhcNQVkCTs60CEzw4PusZsosLlWyc76CYmhqIzn6VR5vqvO2
         dquoB3h3AVc+iQsmEH8uytH75l/YPAAUtyeTlJdITry0td9mV1Dwv+J77XxybPc+5fhS
         K+mQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YHv4c1rt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-381ed975d25si2670894f8f.68.2024.11.08.07.08.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Nov 2024 07:08:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YHv4c1rt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t9QaZ-0002PB-Dn; Fri, 08 Nov 2024 10:07:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t9QaW-0002OV-QM
 for qemu-arm@nongnu.org; Fri, 08 Nov 2024 10:07:53 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t9QaV-0000IY-31
 for qemu-arm@nongnu.org; Fri, 08 Nov 2024 10:07:52 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-37d3e8d923fso1515089f8f.0
 for <qemu-arm@nongnu.org>; Fri, 08 Nov 2024 07:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731078469; x=1731683269; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MdVJK+skN3puiJ7nU645pMIhqPtlDTNMSBqXn2QS3MU=;
 b=YHv4c1rtn9HGmPEibuDcsee7/anE7UGA6Yf+fIrkZfLz03tb4oTT57FNw+tTRDifrg
 hBKlbateVkj1gDOZBDhI8ZSdD+3o+BsmbL29sFCwDX7GruR1oP9Xo5tnslfspNUks6NO
 0DrK5KDgIOQ/U76cEWonhbwJbUXPc6Mojn4H4V9P5E9AuohM05WhkoTwPj66kIEZmrsW
 DEHKUQMpo/aFSawrVQ9ACTeDceCtBAHJJURQ5zNldRGtPvmhDL4/aQvPD1Cykhs6iAt0
 3PMZd/iFRE9/cB4tV2GDoIvDroRex7H7/vwcu0vofe+MTN1N5TZy9XU9AOSjaHXgX9O8
 IbHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731078469; x=1731683269;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MdVJK+skN3puiJ7nU645pMIhqPtlDTNMSBqXn2QS3MU=;
 b=YPEIYLQ/uRTgj9C26ptfIfLvtJSd/r9ZQQK5yOa/XY4dpZ+72Qx/dbKAtSGxpxyrof
 uV4K0lIQxtkK7HmXs26LzAXl+lXCJC7AuTNM5dEL31Zt0tHZvOISwn4IH+IDOMc2rZvB
 OsC2PD2wW/KMAbJOIGeYYe7NpYD6GAXdvQTHZtnrFsh8EtKokWnthR/dC2ysdXj1Y+RK
 iqWj3t1TtTNN9BAd4pqwlblaFz1AIYzqWBuzuaqCV2KscFH10h7UJ6PJcdrpHNOlj3CQ
 3jGOLHThLTgo4eyH7UJCjRtGHMrgt5uIJyjS2OqoxalPzDjgQn675/95TI6ZBD2pqbn5
 fWUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZM5/i22UbKJOTHjecYt3UjOAjuF7fmQF/nKE8bXfy1OnLO0SI0atqsO5J7GziGedvv/004wkc3A==@nongnu.org
X-Gm-Message-State: AOJu0YyWofJTMdoY9tcc1ylAmF+/475H5BlTFynHhtZHCF0sYb75iNwC
 rCNZfHkC2aF4WcWB7rd+/gfL14lqbqrKqiYTV0IrWhSB4z0kFeYSgqe7k/9XXw4=
X-Received: by 2002:a05:6000:796:b0:37d:3a2d:8577 with SMTP id
 ffacd0b85a97d-381f1872fd5mr2908690f8f.33.1731078468995; 
 Fri, 08 Nov 2024 07:07:48 -0800 (PST)
Received: from [172.16.22.241] ([89.101.241.141])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed970e23sm5126426f8f.18.2024.11.08.07.07.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Nov 2024 07:07:48 -0800 (PST)
Message-ID: <5eae8356-ad71-4b6e-b3cc-025ec23a0846@linaro.org>
Date: Fri, 8 Nov 2024 15:07:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/16] hw/ssi/xilinx_spi: Make device endianness
 configurable
To: Richard Henderson <richard.henderson@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jason Wang <jasowang@redhat.com>, devel@lists.libvirt.org,
 qemu-ppc@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20241107012223.94337-1-philmd@linaro.org>
 <20241107012223.94337-9-philmd@linaro.org>
 <4b678b54-0f1b-4b3e-8201-fb22c7cd7cd5@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <4b678b54-0f1b-4b3e-8201-fb22c7cd7cd5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: yT8k2OD91Y6P

On 7/11/24 11:01, Richard Henderson wrote:
> On 11/7/24 01:22, Philippe Mathieu-Daudé wrote:
>> Replace the DEVICE_NATIVE_ENDIAN MemoryRegionOps by a pair
>> of DEVICE_LITTLE_ENDIAN / DEVICE_BIG_ENDIAN.
>> Add the "little-endian" property to select the device
>> endianness, defaulting to little endian.
>> Set the proper endianness on the single machine using the
>> device.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/arm/xlnx-zynqmp.c |  4 ++++
>>   hw/ssi/xilinx_spi.c  | 29 +++++++++++++++++++++--------
>>   2 files changed, 25 insertions(+), 8 deletions(-)
>>
>> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
>> index ab2d50e31b..e735dbdf82 100644
>> --- a/hw/arm/xlnx-zynqmp.c
>> +++ b/hw/arm/xlnx-zynqmp.c
>> @@ -714,6 +714,10 @@ static void xlnx_zynqmp_realize(DeviceState *dev, 
>> Error **errp)
>>       for (i = 0; i < XLNX_ZYNQMP_NUM_SPIS; i++) {
>>           gchar *bus_name;
>> +        if (!object_property_set_bool(OBJECT(&s->spi[i])), 
>> "little-endian",
>> +                                      true, errp)) {
>> +            return;
>> +        }
> 
> How might this ever fail?
> Despite xlnx_zynqmp_realize having an errp argument, I'd be inclined to 
> use error_abort.

Yeah I also noticed that, but this is the pattern this file uses, so
I'd rather clean it up in a separate patch.

> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks!

