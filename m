Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp3963389njb;
        Mon, 19 May 2025 01:36:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUXi3nivxxk7z246zO7k4CEtRk4xyPNEYv9+jpuRR+cIvRyJiP7L3DJNLgt8P7V5ji2Bcp/Lm0g31w50w==@linaro.org
X-Google-Smtp-Source: AGHT+IHRsuuE48xWDjazoQtSAfA2HrL55Pg7d3qPzqbW0aaMNG5p+Dqa/AEBaoUuMBp3hf6pSdi6
X-Received: by 2002:a05:622a:258a:b0:494:a859:5196 with SMTP id d75a77b69052e-494ae58126emr215976151cf.24.1747643760806;
        Mon, 19 May 2025 01:36:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747643760; cv=none;
        d=google.com; s=arc-20240605;
        b=LHHmC3IhHdfpmCT57UYHz4Uf6oZHNThndtoziU3jnqGBIL5RBkh5gs+7wdqwwPMMUu
         daD7n75eekmVoH74KJaitGpPbj7eRHKyYjkEk+4Deje7tbEjaXTNkRk86FvoCfSWDvae
         PkXBUb5xj2mNF0yFP+rfutoxF6OBu+zxQPf5cSHEvzoZFQQc1HtQKJXucOGx0RgDVInM
         uKmaSYAztIKU72oH4xGp8Ehx1lSTLDrizsrbhgNTCOWLT0YDjTfjvzNFMNMmBXsHKY9B
         4Kr1gLNsUz/Ahtwvf4WVDOt4ZSOvReZI9I69/WKOUlSs10FoPkLa+PhjzvX7gJO/2tTU
         nvWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=03l9Qkk9DzUSpVVk1fC7g6MaGYyMQLZxQ/jGjtkzp9E=;
        fh=N2b5RW6Yk8+cSKZPm8UbW/M/HJfKhBgkDyKWTd3E3xc=;
        b=Gdmcclp9KQL4Lk3iKO2mjDakAxF/vDBuG3BNKN15UZdYv/lmG+b0ootEFkLHhEaBrs
         B3aW5Hh2HyoWfxlo+JXaaKmxSh+aWbZ96rnl2zMgz05kfXKh7O+7O4KERu63Uak9QYVY
         +dMmw79IRxzBhQUCZAW1AP08hjOFD2mm+gfXK3WEu0gZ7XKJlQtG5pt+F5Lkt+TxdG7F
         9ftPZ0kdn0h3xuXevvCqlsORMwoeQGXxdfFIgmdBavkMrXbw/nRR+hyJilo79TMZ+bjl
         uGYLFWtEipc7EiohR8v8pSENyP8ysxrE0VSxuNs0GDAiP2kCPGvDvdlt5YwGgFcOycCg
         ocqQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hngdw1hN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-494ae595568si82028851cf.539.2025.05.19.01.36.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 May 2025 01:36:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hngdw1hN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uGvy7-0006CQ-I3; Mon, 19 May 2025 04:35:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uGvxb-0005zS-HC
 for qemu-arm@nongnu.org; Mon, 19 May 2025 04:35:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uGvxS-00045s-Kw
 for qemu-arm@nongnu.org; Mon, 19 May 2025 04:34:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747643688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=03l9Qkk9DzUSpVVk1fC7g6MaGYyMQLZxQ/jGjtkzp9E=;
 b=hngdw1hNtmThm10HQsgby/YnV/UcWfe0a5o/IclXLJJYfbURbrRUsyxeFSRsqpFTRVIc6H
 Vazsi2fPv+fD6Qj45nunZN2itVo6/IKlH9/N7H88WldiDbAZI3Gop/2pfD8IhLYg0XlyN0
 LazdKOWRGV80OAZAzdN/mDv8zNnI4Wo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-UvK3dd7LNDa-1pGBMOnA7g-1; Mon, 19 May 2025 04:34:46 -0400
X-MC-Unique: UvK3dd7LNDa-1pGBMOnA7g-1
X-Mimecast-MFC-AGG-ID: UvK3dd7LNDa-1pGBMOnA7g_1747643685
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a36bbfbd96so414074f8f.0
 for <qemu-arm@nongnu.org>; Mon, 19 May 2025 01:34:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747643685; x=1748248485;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=03l9Qkk9DzUSpVVk1fC7g6MaGYyMQLZxQ/jGjtkzp9E=;
 b=jF0Y+Jrp9ClhdjilmJSVztj1G1+uBXg+4X0EAVrDOqFH9Q7u0J5EekHqbDRRPKvB1Y
 jWVqwH3400iYvZMzncG5yFuBETEcfeUo8NbS1QS/gTEBocUtTcnne/zHP/kiisfyw9a3
 UIoWmMIeXL5tDyu4guQ6/P6LfCPfn6ORoIIS+Nyg86Wc/heChpzC06HRT99t37Obo3rm
 H4zbGnFGOWSfDWQr6/Nrsx1tJXlcLsMoJ7k6qIcEHauqUMQKsonPnE9OVmDFFElI+ecz
 gHEo7bC5V1P3aziMQrjxkUEVZJGB79eCJaDB3CDAXFlMYXRO+OXEVORhwq0LS8M3N9Wr
 CSIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbzBjRIjcd7nKddbynVUh/dvjPi19aOmWvTyl1AYuWMU9L2pQLB6ve9gA/dkJ4SXKZO8yCpcEZOA==@nongnu.org
X-Gm-Message-State: AOJu0YwNT7H/ADin/kUDoCcIXHGA8c3QRoADzNZxqTeAc/4NHJ4J6LnB
 fn76pnyqif5vWhPhbCb1BJX5h2BfHOoyA9dgWYYioPPeBUupbhySrSe5Ovo+YK81ZFKH1ZDDMNA
 rPRBqTht4SqW/rSzRotp6rl+O3FEc3XmhmdECB+lLLY+ca/Vk2PhKoA==
X-Gm-Gg: ASbGncuAW33cl6cdgfwPpFTcB26Q99uGYepX8rcXBh+S/8P+rUQcNnYjHpxP5Ymvynj
 xJKP+xWbx95KRtvDhicu2Z45S8azwfRqQHqomNSQ//iSgWwj1T04TLGMUb60mXHegbuD+cY0wqG
 HvbwRgnbJALypbYGifDwtRcuKVacXmoze07s9HrTy28GA2vxMFj4uxQ1R/nevfNAAQuDJWzFfpz
 MgXj2PjfQ2Ti6wsIkG/P8O5YGdmfhm2TAoSJuZ/dk4Rk7RZFYMHmhyBlxDjyyk6OQxntFHwMmPh
 d40Q7jb6IBRJvZnPUIHThgQo59ouR+kv9QkmhbgV2kFXN7+vkA==
X-Received: by 2002:a05:6000:2dc5:b0:3a3:6958:88dd with SMTP id
 ffacd0b85a97d-3a369588c37mr4366561f8f.23.1747643685239; 
 Mon, 19 May 2025 01:34:45 -0700 (PDT)
X-Received: by 2002:a05:6000:2dc5:b0:3a3:6958:88dd with SMTP id
 ffacd0b85a97d-3a369588c37mr4366546f8f.23.1747643684821; 
 Mon, 19 May 2025 01:34:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:3f78:514a:4f03:fdc0?
 ([2a01:e0a:280:24f0:3f78:514a:4f03:fdc0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442fd51477dsm132131565e9.17.2025.05.19.01.34.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 01:34:44 -0700 (PDT)
Message-ID: <88faa1ec-06ec-4400-b4fe-16fd73ab4437@redhat.com>
Date: Mon, 19 May 2025 10:34:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 45/46] tests/functional/aspeed: Add test case for AST2700 A1
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20250309135130.545764-1-clg@redhat.com>
 <20250309135130.545764-46-clg@redhat.com>
 <81355136-fddb-4134-bc75-5f8baddcefc3@redhat.com>
 <SI2PR06MB5041918337B1F93AEF8AE4F2FC93A@SI2PR06MB5041.apcprd06.prod.outlook.com>
 <ea31ccc8-15c8-4539-9596-f6993b2fa9d9@redhat.com>
 <SI2PR06MB504126D18CF3263D78B596B1FC9CA@SI2PR06MB5041.apcprd06.prod.outlook.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <SI2PR06MB504126D18CF3263D78B596B1FC9CA@SI2PR06MB5041.apcprd06.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: f7a23jRhrY77Osjf4xD9i-SlOJoYQtoB07GwfeiADtY_1747643685
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.13,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: UJeiqVHvNGeb

Hello Jamin

On 5/19/25 03:52, Jamin Lin wrote:
> Hi Cédric
> 
>> Subject: Re: [PULL 45/46] tests/functional/aspeed: Add test case for AST2700
>> A1
>>
>> On 5/16/25 04:59, Jamin Lin wrote:
>>> Hi Cédric
>>>
>>>>
>>>> On a BE host, if I run an ast2700a0-evb machine :
>>>>
>>>>       $ qemu-system-aarch64 -machine ast2700a0-evb  ...
>>>>       ...
>>>>       U-Boot 2023.10-v00.05.06 (Mar 26 2025 - 05:59:26 +0000)
>>>>
>>>>       SOC: AST2700-A0
>>>>       Model: AST2700 EVB
>>>>       DRAM:  8 GiB (effective 0 Bytes)
>>>>
>>>> QEMU hangs.
>>>>
>>>> If the RAM size is defined to 8g
>>>>
>>>>       $ qemu-system-aarch64 -machine ast2700a0-evb -m 8g  ...
>>>>       ...
>>>>       U-Boot 2023.10-v00.05.06 (Mar 26 2025 - 05:59:26 +0000)
>>>>
>>>>       SOC: AST2700-A0
>>>>       Model: AST2700 EVB
>>>>       DRAM:  8 GiB
>>>>       aspeed_dp dp@12c0a000: aspeed_dp_probe(): Failed to access dp.
>>>> version(0)
>>>>       Core:  125 devices, 27 uclasses, devicetree: separate
>>>>
>>>> machine boots.
>>>>
>>>> Whereas, with an ast2700a1-evb machine :
>>>>
>>>>       $ qemu-system-aarch64 -machine ast2700a1-evb  ...
>>>>       ...
>>>>       U-Boot 2023.10-v00.05.06 (Mar 26 2025 - 05:59:26 +0000)
>>>>
>>>>       SOC: AST2700-A1
>>>>       Model: AST2700 EVB
>>>>       DRAM:  1 GiB
>>>>       aspeed_dp dp@12c0a000: aspeed_dp_probe(): Failed to access dp.
>>>> version(0)
>>>>       Core:  125 devices, 27 uclasses, devicetree: separate
>>>>
>>>> machine boots.
>>>>
>>>>       $ qemu-system-aarch64 -machine ast2700a1-evb -m 8g  ...
>>>>       ...
>>>>       U-Boot 2023.10-v00.05.06 (Mar 26 2025 - 05:59:26 +0000)
>>>>
>>>>       SOC: AST2700-A1
>>>>       Model: AST2700 EVB
>>>>       DRAM:  8 GiB
>>>>       aspeed_dp dp@12c0a000: aspeed_dp_probe(): Failed to access dp.
>>>> version(0)
>>>>       Core:  125 devices, 27 uclasses, devicetree: separate
>>>>
>>>> machine boots.
>>>>
>>>>
>>>> I Wonder if you could analyze this issue to check if it is related to
>>>> one of our QEMU model.
>>>>
>>>>
>>>
>>> Sorry, I only have a little-endian host machine (x86_64).
>>> Is it possible to run a big-endian(POWER PC) QEMU host environment on this
>> machine, so that I can then run the AST2700 QEMU target inside it to analyze
>> this issue?
>>
>> You can but unless you have access to a POWER hypervisor, this will be very
>> slow because of the 2 levels of emulations.
>>
>>> If you agree, could you please help me insert the following lines into the
>> function that detects the DRAM size on the AST2700?
>>>
>> https://github.com/qemu/qemu/blob/master/hw/arm/aspeed_ast27x0.c#L332
>>>
>> https://github.com/qemu/qemu/commit/7436db1063bbfecc2e498a7d795613b
>> 333
>>> 12d665
>>> ````
>>> static void aspeed_ram_capacity_write(void *opaque, hwaddr addr, uint64_t
>> data,
>>>                                                   unsigned int
>> size) {
>>>       AspeedSoCState *s = ASPEED_SOC(opaque);
>>>       ram_addr_t ram_size;
>>>       MemTxResult result;
>>>       uint32_t read_back[4] = {0};
>>>       ram_size = object_property_get_uint(OBJECT(&s->sdmc), "ram-size",
>>>                                           &error_abort);
>>>
>>>       assert(ram_size > 0);
>>>       printf("jamin size %d\n", size);
>>>       printf("addr=%" PRIx64 " (addr ram_size)=%" PRIx64 "\n", addr, (addr
>> % ram_size));
>>>       /*
>>>        * Emulate ddr capacity hardware behavior.
>>>        * If writes the data to the address which is beyond the ram size,
>>>        * it would write the data to the "address % ram_size".
>>>        */
>>>       result = address_space_write(&s->dram_as, addr % ram_size,
>>>                                    MEMTXATTRS_UNSPECIFIED,
>> &data, size);
>>>       if (result != MEMTX_OK) {
>>>           qemu_log_mask(LOG_GUEST_ERROR,
>>>                         "%s: DRAM write failed, addr:0x%"
>> HWADDR_PRIx
>>>                         ", data :0x%" PRIx64  "\n",
>>>                         __func__, addr % ram_size, data);
>>>       }
>>>
>>>       address_space_read(&s->dram_as, addr % ram_size,
>>>                          MEMTXATTRS_UNSPECIFIED, read_back,
>>>                          size);
>>>
>>>       for(int i=0; i<4; i++) {
>>>           printf("jamin read_back[%d]=%x\n", i, read_back[i]);
>>>       }
>>> }
>>> ````
>>> Also, could you please provide me with the following log?
>>>
>>> U-Boot 2023.10-v00.05.06 (Mar 26 2025 - 05:59:26 +0000)
>>>
>>> SOC: AST2700-A0
>>> Model: AST2700 EVB
>>> DRAM:  jamin size 4
>>> addr=c0000000 (addr ram_size)=0
>>> jamin read_back[0]=eadbeef4
>>> jamin read_back[1]=0
>>> jamin read_back[2]=0
>>> jamin read_back[3]=0
>>> jamin size 4
>>> addr=40000000 (addr ram_size)=0
>>> jamin read_back[0]=adbeef43
>>> jamin read_back[1]=0
>>> jamin read_back[2]=0
>>> jamin read_back[3]=0
>>> jamin size 4
>>> addr=0 (addr ram_size)=0
>>> jamin read_back[0]=dbeef432
>>> jamin read_back[1]=0
>>> jamin read_back[2]=0
>>> jamin read_back[3]=0
>>> 1 GiB
>>
>>
>>
>> U-Boot 2023.10-v00.05.06 (Mar 26 2025 - 05:59:26 +0000)
>>
>> SOC: AST2700-A0
>> Model: AST2700 EVB
>> DRAM:  aspeed_sdmc_read reg @0x4 data: 0x28 aspeed_sdmc_read reg
>> @0x4 data: 0x28 aspeed_sdmc_write reg @0x4 data: 0x34 jamin size 4
>> addr=c0000000 (addr ram_size)=0
>> jamin read_back[0]=0                    <-- this is wrong
> 
> 
> It seems that the "data" is in the CPU 's native endianness.
> I'm currently looking for a big-endian environment to test the changes I made, and will update you once I have results.
> 
> uint32_t val = cpu_to_le32((uint32_t)data);
> address_space_write(&s->dram_as, addr % ram_size,
>                      MEMTXATTRS_UNSPECIFIED, &val, 4);

FYI, I opened

  https://gitlab.com/qemu-project/qemu/-/issues/2973


Thanks,

C.


> 
>> jamin read_back[1]=0
>> jamin read_back[2]=0
>> jamin read_back[3]=0
>> aspeed_sdmc_read reg @0x4 data: 0x3c
>> aspeed_sdmc_write reg @0x4 data: 0x34
>> aspeed_sdmc_read reg @0xc data: 0x0
>> aspeed_sdmc_write reg @0xc data: 0x1b8
>> aspeed_sdmc_read reg @0x40 data: 0x0
>> jamin size 4
>> addr=1bdea1f70 (addr ram_size)=3dea1f70
>> jamin read_back[0]=0
>> jamin read_back[1]=0
>> jamin read_back[2]=0
>> jamin read_back[3]=0
>> jamin size 4
>> addr=1bdea1f74 (addr ram_size)=3dea1f74
>> jamin read_back[0]=0
>> jamin read_back[1]=0
>> jamin read_back[2]=0
>> jamin read_back[3]=0
>> jamin size 4
>>
>>
>>>
>>> It's quite strange, because you mentioned that the A1 version works, but the
>> A0 version doesn't.
>>> It seems detect the DRAM size failed in this loop,
>>>
>> https://github.com/AspeedTech-BMC/u-boot/blob/aspeed-master-v2023.10/d
>>> rivers/ram/aspeed/sdram_ast2700.c#L1173
>>> struct ddr_capacity ram_size[] = {
>>> 		{0x10000000,	{208, 256}}, // 256MB
>>> 		{0x20000000,	{208, 416}}, // 512MB
>>> 		{0x40000000,	{208, 560}}, // 1GB
>>> 		{0x80000000,	{472, 880}}, // 2GB
>>> 		{0x100000000,	{656, 880}}, // 4GB
>>> 		{0x200000000,	{880, 880}}, // 8GB
>>> 		};
>>> u32 test_pattern = 0xdeadbeef
>>>
>>> for (sz = SDRAM_SIZE_8GB - 1; sz > SDRAM_SIZE_256MB; sz--) {
>>> 		test_pattern = (test_pattern << 4) + sz;
>>> 		writel(test_pattern, (void *)CFG_SYS_SDRAM_BASE +
>>> ram_size[sz].size);
>>>
>>> 		if (readl((void *)CFG_SYS_SDRAM_BASE) != test_pattern)
>>> 			break;
>>> }
>>>
>>> Please help to dump this register.
>>> => md 12c00010
>>> 12c00010: 00000028 00000000 00000000 00000000  (...............
>>
>> I can't do that because the u-boot prompt is never reached. From QEMU:
>>
>> (qemu) x/10x 0x12c00010
>> 0000000012c00010: 0x0000003c 0x00000000 0x00000000 0x00000000
>> 0000000012c00020: 0x00000000 0x00000000 0x00000000 0x00000000
>> 0000000012c00030: 0x000001b8 0x00000000
>>
>> Hope it helps
>>
>> C.
>>
> 

