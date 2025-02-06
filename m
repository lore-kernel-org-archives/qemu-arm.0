Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1548423njb;
        Thu, 6 Feb 2025 05:54:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX2yE2fdDO57ZKats185gNTOdK0DkJtuL79waCy9pN2g0ky0+sZ65IoL91TdpkRMmw0Tao8Rn6PiGZP4w==@linaro.org
X-Google-Smtp-Source: AGHT+IHiXbAesFxK+nrYVUywYfmf+/y7Xg3ODULE0lZo0MAAOStNjFKS1m45X7utsHiVanD2ClcX
X-Received: by 2002:a05:620a:2586:b0:7ac:abb0:2317 with SMTP id af79cd13be357-7c03a03e6aamr1048816085a.37.1738850071911;
        Thu, 06 Feb 2025 05:54:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738850071; cv=none;
        d=google.com; s=arc-20240605;
        b=e8hFMhY1SHIi4+ubmbiCgyIpstPT4zeVnbqNfCcrIN4Z1Cyh2fml9keg+mRw9pEsBk
         JOvtBbSUDPpLxOPYH51QJD0ON+pNodqgIz3yofZcU1CWCKwJ29/7RCTz1hVB9TyggWbT
         OW8DVzzshiKwJjShSBAQD9wjC5LvDIywNL3Wj9xOpz8IE2cWTtwOQK4MlPhe8tE3Ww1A
         hK4Pjid1xm/byuzju6gQKvjSWJqoJ+nPWjKlkpwyuJ+cEBZsmTC2hwO//pqRx1Yb4b40
         Bzu/oHD7BLetmo+7pf4sn4CqZEFWYBZshckUeX7ZkjavYWyEMSFoBXQqxJEqhngOdWQS
         2mQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ASzU1/31udRekav0LredBl1zTrkGZo/IyaNINrQ1nRw=;
        fh=hSW95ch7/VSLiXg20330Q/Dw2Sj6yfHrXY9iBDS4BlU=;
        b=dWj4ehwi9gvkBtXsVz5vlgi41iDFdUu/s43H1OmcXsHGQUT4A08LdWax/oHZz8BB5m
         lbUMmv3GZcDruw/4ACgJ9T1bEqU88SARhcFLxD9bAt5wFgGAxeeslVo9jn1plpM7+XJz
         UghGA469OJMGgax04mBM7DS5bigZ+sb4WfTnBL0zHuSrdtu3hxNn3lCJ9PalKxFCRrm8
         U0W2PKDQB2UMabU64rJ05r1TrRqNjieFVGH42l2yuuuyoYdWhZNJFtLiLDyBORdOxWYe
         jKD3st789SfiIsVrZWMqYENcuBYkv3uy0olGy9z82n/nG88FSR6wpQRvvKMPFOKFWm88
         kPmw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ilMMGvOr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041df5c58si118166585a.82.2025.02.06.05.54.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 05:54:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ilMMGvOr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg2KV-0000M0-3t; Thu, 06 Feb 2025 08:54:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tg2KT-0000LX-GF
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 08:54:05 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tg2KQ-0004dR-E8
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 08:54:05 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43622267b2eso9470875e9.0
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 05:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738850041; x=1739454841; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ASzU1/31udRekav0LredBl1zTrkGZo/IyaNINrQ1nRw=;
 b=ilMMGvOrfhyrnbmb4TSSKwO5vy98Xmoit4MlDDE3/lbpNkgQbcclYGstTTrm5j9/bY
 ZJ68pmmCjk9e4ul0lQLiLY5rG+H87aFR0zzyvXrTTqOawh49Sf1w4JV5Q/9Gwxlm+qze
 0/5fjEoLfJLdBPw1RGyuXf6Ay2MzO/M40knmnW2GESekrMcL0vCZ9VbSVboxcQADftFX
 Thx5BZ/0lPjG4ECFxlrIsLbeS288c1hcM4WhWrkG3MekCe7aTHNAohTc/inaqhZwKNzD
 0AoRgnfU2UGSV1nXUm3MckDtn34EloNo/ZCNrqr5X6jOs153nCCE68QYOqiABZNP+KrP
 d6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738850041; x=1739454841;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ASzU1/31udRekav0LredBl1zTrkGZo/IyaNINrQ1nRw=;
 b=ebly5nkZ4d6nwOpJ45iYOcuPAwR8c9RSC+sVk4VS+GGY4Qf0dD6I3HSW1sC0cNFlZa
 ow47a6i52TPl9g0O4BbYCCdUxni1CvF4qzHJUiIm3P64ZQMldlgGnVLgaHvV/gSa3TI+
 BNdP6Hspg+SZsNHYuD/h9y08Vv5UP6VEyKluH44CEAwOaHXCEVbjtXDM4XoUhiXuOIZL
 208xGAhVrc0t0q01fWpd19IgEaFUx/V7EKDo4kgy2eaW853s2FIH8gTg3JsBLcsc6y0Y
 XlDV6M1MRAHu2v4KPQV/ogqgPzMTXI3+yC6AG6Z8Z8LhYm7zVGcB9AlDmlawtJdiCM/j
 M1hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzqaBI5XFMlCaslZY9zg0FbHZJwPkYeVVyReNA5b15hYdrgrP7Vv2ucCcZDBj5FSA5OjmzynVHYQ==@nongnu.org
X-Gm-Message-State: AOJu0YxgIXi14RyWq8fjEQW7F4lXlxAR9YCjK15PvlBVdQDM/MIqlofP
 niVIQvFWF2TLXxlkjrI1ByusSWAceZ+IqsAxaLBQ87SnDaGuPEhUMcJgdcbKEow=
X-Gm-Gg: ASbGncutWI+6stxY14OcghejCfbpFBCzp/6D0M+5Twcl2ZOh3jmJwq88tJxMP7+HgNH
 XqSaq6FtdFB3LRakTflPHzIaJLPTtcLhuHtwq9lHJ0+BEu0wDEjlGw2xN8El9QU3Jdrf4f8urn5
 oz1d8H3F0ixXiDU9oMmcNuzoNEJOqOMYHMOTSStxsLYC4S3xy+XmXj4VuY8d5m3u9LSQ0jV7Cqg
 /TiNoG7WPU/SE6LmsI/9ht9sKUUPa4YflysRw+3LdqdD0eSVaQL+IlDZIA7gTAj0f8QWplSKgOj
 rbWApQMN9zxLi89Jptz1Law51pDRRNOHnVPt4eYMMxlejE0QoUHZq588O5g=
X-Received: by 2002:a05:600c:568d:b0:438:a290:3ce0 with SMTP id
 5b1f17b1804b1-4390ef6aaadmr47753945e9.8.1738850040531; 
 Thu, 06 Feb 2025 05:54:00 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391dfc87desm19748475e9.25.2025.02.06.05.53.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 05:54:00 -0800 (PST)
Message-ID: <4624f149-76d0-4da5-8f13-8c015043c335@linaro.org>
Date: Thu, 6 Feb 2025 14:53:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/16] hw/microblaze: Support various endianness for
 s3adsp1800 machines
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Anton Johansson
 <anjo@rev.ng>, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20250206131052.30207-1-philmd@linaro.org>
 <20250206131052.30207-12-philmd@linaro.org> <Z6S3Mgt1G7fIjeBB@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <Z6S3Mgt1G7fIjeBB@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
X-TUID: di+8fP9ombT1

Hi Daniel,

On 6/2/25 14:20, Daniel P. Berrangé wrote:
> On Thu, Feb 06, 2025 at 02:10:47PM +0100, Philippe Mathieu-Daudé wrote:
>> Introduce an abstract machine parent class which defines
>> the 'little_endian' property. Duplicate the current machine,
>> which endian is tied to the binary endianness, to one big
>> endian and a little endian machine; updating the machine
>> description. Keep the current default machine for each binary.
>>
>> 'petalogix-s3adsp1800' machine is aliased as:
>> - 'petalogix-s3adsp1800-be' on big-endian binary,
>> - 'petalogix-s3adsp1800-le' on little-endian one.
> 
> Does it makes sense to expose these as different machine types ?
> 
> If all the HW is identical in both cases, it feels like the
> endianness could just be a bool property of the machine type,
> rather than a new machine type.

Our test suites expect "qemu-system-foo -M bar" to work out of
the box, we can not have non-default properties.

(This is related to the raspberry pi discussion in
https://lore.kernel.org/qemu-devel/20250204002240.97830-1-philmd@linaro.org/).

My plan is to deprecate 'petalogix-s3adsp1800', so once we
remove it we can merge both qemu-system-microblaze and
qemu-system-microblazeel into a single binary.

If you don't want to add more machines, what should be the
endianness of the 'petalogix-s3adsp1800' machine in a binary
with no particular endianness? Either we add for explicit
endianness (fixing test suites) or we add one machine for
each endianness; I fail to see other options not too
confusing for our users.

This approach is the same I took to merge MIPS*, SH4* and
Xtensa* machines in endianness-agnostic binaries.

Also the same I'm using to merge 32/64-bit targets into the
same binaries.
Assuming we have a qemu-system-x86 binary able to run i386 and
x86_64 machines, what do you expect when starting '-M pc'? How
to not confuse users wanting to run FreeDOS in 32-bit mode?

Again, IMO having '-M pc,mode=32' is simpler, but that breaks
the test suites assumptions than machines can start with no
default values (see QOM introspection tests for example).

> 
>>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/microblaze/petalogix_s3adsp1800_mmu.c | 62 +++++++++++++++++++-----
>>   1 file changed, 51 insertions(+), 11 deletions(-)
>>
>> diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/petalogix_s3adsp1800_mmu.c
>> index 96aed4ed1a3..aea727eb7ee 100644
>> --- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
>> +++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
>> @@ -55,8 +55,17 @@
>>   #define ETHLITE_IRQ         1
>>   #define UARTLITE_IRQ        3
>>   
>> +typedef struct PetalogixS3adsp1800MachineClass {
>> +    MachineClass parent_obj;
>> +
>> +    bool little_endian;
>> +} PetalogixS3adsp1800MachineClass;
>> +
>>   #define TYPE_PETALOGIX_S3ADSP1800_MACHINE \
>> -            MACHINE_TYPE_NAME("petalogix-s3adsp1800")
>> +            MACHINE_TYPE_NAME("petalogix-s3adsp1800-common")
>> +DECLARE_CLASS_CHECKERS(PetalogixS3adsp1800MachineClass,
>> +                       PETALOGIX_S3ADSP1800_MACHINE,
>> +                       TYPE_PETALOGIX_S3ADSP1800_MACHINE)
>>   
>>   static void
>>   petalogix_s3adsp1800_init(MachineState *machine)
>> @@ -71,11 +80,13 @@ petalogix_s3adsp1800_init(MachineState *machine)
>>       MemoryRegion *phys_ram = g_new(MemoryRegion, 1);
>>       qemu_irq irq[32];
>>       MemoryRegion *sysmem = get_system_memory();
>> +    PetalogixS3adsp1800MachineClass *pmc;
>>   
>> +    pmc = PETALOGIX_S3ADSP1800_MACHINE_GET_CLASS(machine);
>>       cpu = MICROBLAZE_CPU(object_new(TYPE_MICROBLAZE_CPU));
>>       object_property_set_str(OBJECT(cpu), "version", "7.10.d", &error_abort);
>>       object_property_set_bool(OBJECT(cpu), "little-endian",
>> -                             !TARGET_BIG_ENDIAN, &error_abort);
>> +                             pmc->little_endian, &error_abort);
>>       qdev_realize(DEVICE(cpu), NULL, &error_abort);
>>   
>>       /* Attach emulated BRAM through the LMB.  */
>> @@ -95,7 +106,7 @@ petalogix_s3adsp1800_init(MachineState *machine)
>>                             64 * KiB, 1, 0x89, 0x18, 0x0000, 0x0, 1);
>>   
>>       dev = qdev_new("xlnx.xps-intc");
>> -    qdev_prop_set_bit(dev, "little-endian", !TARGET_BIG_ENDIAN);
>> +    qdev_prop_set_bit(dev, "little-endian", pmc->little_endian);
>>       qdev_prop_set_uint32(dev, "kind-of-intr",
>>                            1 << ETHLITE_IRQ | 1 << UARTLITE_IRQ);
>>       sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>> @@ -107,7 +118,7 @@ petalogix_s3adsp1800_init(MachineState *machine)
>>       }
>>   
>>       dev = qdev_new(TYPE_XILINX_UARTLITE);
>> -    qdev_prop_set_bit(dev, "little-endian", !TARGET_BIG_ENDIAN);
>> +    qdev_prop_set_bit(dev, "little-endian", pmc->little_endian);
>>       qdev_prop_set_chr(dev, "chardev", serial_hd(0));
>>       sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>>       sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, UARTLITE_BASEADDR);
>> @@ -115,7 +126,7 @@ petalogix_s3adsp1800_init(MachineState *machine)
>>   
>>       /* 2 timers at irq 2 @ 62 Mhz.  */
>>       dev = qdev_new("xlnx.xps-timer");
>> -    qdev_prop_set_bit(dev, "little-endian", !TARGET_BIG_ENDIAN);
>> +    qdev_prop_set_bit(dev, "little-endian", pmc->little_endian);
>>       qdev_prop_set_uint32(dev, "one-timer-only", 0);
>>       qdev_prop_set_uint32(dev, "clock-frequency", 62 * 1000000);
>>       sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>> @@ -123,7 +134,7 @@ petalogix_s3adsp1800_init(MachineState *machine)
>>       sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, irq[TIMER_IRQ]);
>>   
>>       dev = qdev_new("xlnx.xps-ethernetlite");
>> -    qdev_prop_set_bit(dev, "little-endian", !TARGET_BIG_ENDIAN);
>> +    qdev_prop_set_bit(dev, "little-endian", pmc->little_endian);
>>       qemu_configure_nic_device(dev, true, NULL);
>>       qdev_prop_set_uint32(dev, "tx-ping-pong", 0);
>>       qdev_prop_set_uint32(dev, "rx-ping-pong", 0);
>> @@ -133,26 +144,55 @@ petalogix_s3adsp1800_init(MachineState *machine)
>>   
>>       create_unimplemented_device("xps_gpio", GPIO_BASEADDR, 0x10000);
>>   
>> -    microblaze_load_kernel(cpu, !TARGET_BIG_ENDIAN, ddr_base, ram_size,
>> +    microblaze_load_kernel(cpu, pmc->little_endian, ddr_base, ram_size,
>>                              machine->initrd_filename,
>>                              BINARY_DEVICE_TREE_FILE,
>>                              NULL);
>>   }
>>   
>> -static void petalogix_s3adsp1800_machine_class_init(ObjectClass *oc, void *data)
>> +static void petalogix_s3adsp1800_machine_class_init(ObjectClass *oc,
>> +                                                    bool little_endian)
>>   {
>>       MachineClass *mc = MACHINE_CLASS(oc);
>> +    PetalogixS3adsp1800MachineClass *pmc = PETALOGIX_S3ADSP1800_MACHINE_CLASS(oc);
>>   
>> -    mc->desc = "PetaLogix linux refdesign for xilinx Spartan 3ADSP1800";
>>       mc->init = petalogix_s3adsp1800_init;
>> -    mc->is_default = true;
>> +    pmc->little_endian = little_endian;
>> +    mc->desc = little_endian
>> +        ? "PetaLogix linux refdesign for xilinx Spartan 3ADSP1800 (little endian)"
>> +        : "PetaLogix linux refdesign for xilinx Spartan 3ADSP1800 (big endian)";
>> +    if (little_endian == !TARGET_BIG_ENDIAN) {
>> +        mc->is_default = true;
>> +        mc->alias = "petalogix-s3adsp1800";
>> +    }
>> +}
>> +
>> +static void petalogix_s3adsp1800_machine_class_init_be(ObjectClass *oc, void *data)
>> +{
>> +    petalogix_s3adsp1800_machine_class_init(oc, false);
>> +}
>> +
>> +static void petalogix_s3adsp1800_machine_class_init_le(ObjectClass *oc, void *data)
>> +{
>> +    petalogix_s3adsp1800_machine_class_init(oc, true);
>>   }
>>   
>>   static const TypeInfo petalogix_s3adsp1800_machine_types[] = {
>>       {
>>           .name           = TYPE_PETALOGIX_S3ADSP1800_MACHINE,
>>           .parent         = TYPE_MACHINE,
>> -        .class_init     = petalogix_s3adsp1800_machine_class_init,
>> +        .abstract       = true,
>> +        .class_size     = sizeof(PetalogixS3adsp1800MachineClass),
>> +    },
>> +    {
>> +        .name           = MACHINE_TYPE_NAME("petalogix-s3adsp1800-be"),
>> +        .parent         = TYPE_PETALOGIX_S3ADSP1800_MACHINE,
>> +        .class_init     = petalogix_s3adsp1800_machine_class_init_be,
>> +    },
>> +    {
>> +        .name           = MACHINE_TYPE_NAME("petalogix-s3adsp1800-le"),
>> +        .parent         = TYPE_PETALOGIX_S3ADSP1800_MACHINE,
>> +        .class_init     = petalogix_s3adsp1800_machine_class_init_le,
>>       },
>>   };
>>   
>> -- 
>> 2.47.1
>>
>>
> 
> With regards,
> Daniel

