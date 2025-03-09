Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp566383njc;
        Sun, 9 Mar 2025 05:20:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU1Mm5/pXptSEBzBBcDYR0jWDWKTHjFuC/InJggwwx9Q3FZKpsnOZw3MBcwBtA5YSTH/dTDviAiZnWPkA==@linaro.org
X-Google-Smtp-Source: AGHT+IG0A6o3NrgALIj8Aa37JzhflAVBifkV37nMGD1UwhwqY9du4GWBP0G9SrV8FXadhEBrlrmJ
X-Received: by 2002:a05:620a:6609:b0:7c3:c695:156 with SMTP id af79cd13be357-7c4e24dadf8mr1368098385a.16.1741522854212;
        Sun, 09 Mar 2025 05:20:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741522854; cv=none;
        d=google.com; s=arc-20240605;
        b=YUdMn87DASANwgntnZiYQ1u8svfLgddQrqGtJdFGgyjZNCtjKFRtme+LahEbE/Nn4E
         XuIIaQz0WYmVVwEksP8VP53XwCkv5Q68mabGgetbelX7gQ3721h+6zj+JoSeWFaF3J8L
         GJ6ZPJ9hT0svxO7Q9OSLrW+9aeiKJ2ucxiT5nLaTE9qKkKVdSmyz+8kyWLB9HVtTP0h9
         PhG+zso4KLcaRFANHcsMDhnITngmYAHvNx+kYBfxcUd8FOd52QFvUpWUkpuJgQSfxEzf
         QS6mDzuDIB8dPAQo1b+92GCpEP1/qk/niA9LZ9hbi4GWMTfmAvlMrZOVY7mdhrxf0puB
         Waww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=SXFui0VdoFr2d0dHdNdBY+8sQ9ZQjKd4FQUjY4Twe6o=;
        fh=q9bSGZEvBYrd50TeOY5Kw7ExtAZYXbzibtRmHDYkSkA=;
        b=gQ7YIvjLgYxiq7b0U1x+Q1KKblbsWC3UBySnd+7DWk2NLZvfI1EI7mviN2CBWQ/TvX
         1lWbT//R66zTKS+0CnZwQ4uTt826hW0eOfumhRfEzFvM+itVw/M1sUZsiuPVg5bu00uu
         s9yVWgnQGM9vQo4ohrURAblYvRaKTVnnae/8ACckPoMPDGcgNOfh42v0+fh++DoopqnM
         pcHdrVT38oc5Y/Gt9XTiixtjdd3l7K9aUJaDyuUG7T6qye7bV5hcGdRYznln5ILTiVRJ
         Knn4Vc26gBcDp28Ucb0MBUJ1AiN7in5BCaOR5sAdlUhntcZq81EMlK+u2dlK/pNgxD0/
         BVrA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UElvwB0y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c540800133si276749585a.230.2025.03.09.05.20.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 05:20:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UElvwB0y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trFdj-000805-5n; Sun, 09 Mar 2025 08:20:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trFdU-0007sY-7i
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 08:20:07 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trFdQ-00021E-2F
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 08:20:02 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43948f77f1aso19139855e9.0
 for <qemu-arm@nongnu.org>; Sun, 09 Mar 2025 05:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741522797; x=1742127597; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SXFui0VdoFr2d0dHdNdBY+8sQ9ZQjKd4FQUjY4Twe6o=;
 b=UElvwB0yimBTCv0mZxF4s+KX1pHxtrOZqRMre9G+MCbwBDzeUyDSNPaFvniboZDGcA
 5iDo/da/C7MRPGGcFFl9RjQIS/7g4TcxGORvLFRQTAb2SFb933uPcpM4TnoJNbpZ+14s
 eSDoQ/S5l6llt0uBFbCvPSdUb9R036NXoAClWsjxvtoeDUoDLcuLyE6t5gsipk9iMW93
 fmnR2TmV81YnzjWT1w5vNZiXsQh8RmblCoO7/fqKWIcLz3B9mcP+YZGLrurBQS16cN/5
 0xiqAqSJCEsJyPC420vyFuFWSUI4NxAsIr3a8GibfU7q384CQY0lVp/Pu4GVouxEwgzc
 YNeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741522797; x=1742127597;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SXFui0VdoFr2d0dHdNdBY+8sQ9ZQjKd4FQUjY4Twe6o=;
 b=f9id1uPRvibNhrWzTybiMGTNmXuj0nWAOXnKi87UfBDMijfWvhAs1JIFDS4MranW2I
 EUX7UlAoYlGu5ATWF9+3V25jZdlpUvqQPRn0majdM2m7+Pm08uo+SRNyezq3mnS+BLmo
 REATsKeNG+kvLTKZQIoU5W8k26v6flR65fp3bW0eaUzdmtT+jSyaI/TYJYByQ7Z5Ibtg
 CHwODG0rozaFqHKZUIOAvTHaT17ivkbCasAkYurNfXtTcbHknXFuWbGmLGNyIoAsJsQD
 bGt/U60pZ7s19LpD5p1yGJPWcF/oe+KJ51xBU4FpWpXd566JkJvNfkzcixrcIxH3jQ4e
 cFFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVq/X316Nsr5H51Flt3dfvgm3xmpb8HGd/hXy3XVZU30ibTKptu4bCEnq9/ZXchBeQyUD+iqa1lNg==@nongnu.org
X-Gm-Message-State: AOJu0YzW55fpf4Wst8H92crTTWHdZRAHC0+y2YcMtYg7JxUvFZ1mMQtt
 pr826ezMg1CkMWxroxY/wLTZnLTZ1jcN/BUO3IK2Oy7VG3YQhkL3JwGs3O6A9UocVFetQcQ7lDb
 Ge3Q=
X-Gm-Gg: ASbGncvsyhcvk/25ctIO7lD0twTOsz9GvOsBTeZj0UKrNAARQzbfAzio28wbRQc9yCU
 s7/GefiNDnk1QZ2BtJZ/whxHYyXBLDUfGJXwDfyvZFUVUBPlVD5ruFF/5dJDjbKc4v/ADRHIrH0
 ArlJduhaqoIpCSCGkIXttH20APTYWRWz5IZTFPym8nySBLG9HFmCP6r2OZuaJZ5OvtYQRTfQ1SW
 sHutpvs3V3tm5ZlO3akESST+INk4rFGwRSmJszO6wZxE24ayphznL0Z59XKPQRmU1OqLDsqIMxX
 Jxc+OEhhHnYZ8bIONZqKBcPN9KV/N33CuliCf4YsWScW3mdOBiXKFnr/VPRZQ28AcJZBG3WOwfP
 bKFwiMn6e+hoS
X-Received: by 2002:a5d:64c3:0:b0:391:31c8:ba58 with SMTP id
 ffacd0b85a97d-39132d16dd6mr7161785f8f.10.1741522797338; 
 Sun, 09 Mar 2025 05:19:57 -0700 (PDT)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c01cd62sm11513220f8f.46.2025.03.09.05.19.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Mar 2025 05:19:56 -0700 (PDT)
Message-ID: <f59df0e2-d6bf-4950-aaf6-02333183501b@linaro.org>
Date: Sun, 9 Mar 2025 13:19:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/14] hw/sd/sdhci: Make quirks a class property
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Guenter Roeck <linux@roeck-us.net>, qemu-block@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, qemu-arm@nongnu.org
References: <20250308213640.13138-1-philmd@linaro.org>
 <20250308213640.13138-5-philmd@linaro.org>
 <11b37245-5dee-122b-cdfb-dfc820a38661@eik.bme.hu>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <11b37245-5dee-122b-cdfb-dfc820a38661@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
X-TUID: mpWLoAY2eakq

On 9/3/25 12:43, BALATON Zoltan wrote:
> On Sat, 8 Mar 2025, Philippe Mathieu-Daudé wrote:
>> All TYPE_IMX_USDHC instances use the quirk:
>> move it to the class layer.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> include/hw/sd/sdhci.h |  3 ++-
>> hw/sd/sdhci.c         | 15 +++++++++++++--
>> 2 files changed, 15 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
>> index c4b20db3877..0616ce3aa59 100644
>> --- a/include/hw/sd/sdhci.h
>> +++ b/include/hw/sd/sdhci.h
>> @@ -95,7 +95,6 @@ struct SDHCIState {
>>
>>     /* Configurable properties */
>>     bool pending_insert_quirk; /* Quirk for Raspberry Pi card insert 
>> int */
>> -    uint32_t quirks;
>>     uint8_t endianness;
>>     uint8_t sd_spec_version;
>>     uint8_t uhs_mode;
>> @@ -112,6 +111,8 @@ typedef struct SDHCIClass {
>>         PCIDeviceClass pci_parent_class;
>>         SysBusDeviceClass sbd_parent_class;
>>     };
>> +
>> +    uint32_t quirks;
>> } SDHCIClass;
>>
>> /*
>> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
>> index 4917a9b3632..2b7eb11a14a 100644
>> --- a/hw/sd/sdhci.c
>> +++ b/hw/sd/sdhci.c
>> @@ -345,6 +345,8 @@ static void sdhci_send_command(SDHCIState *s)
>>     rlen = sdbus_do_command(&s->sdbus, &request, response);
>>
>>     if (s->cmdreg & SDHC_CMD_RESPONSE) {
>> +        SDHCIClass *sc = SYSBUS_SDHCI_GET_CLASS(s);
> 
> I don't like this because it introduces a class look up which may be 
> costly in a function that could be called frequently. Maybe you could 
> just drop this patch and leave the quirk handling as it is. Changing it 
> does not seem to improve the model much.

I thought about it and was expecting a such comment.

Initializing a class field in the instance_init is an anti-pattern,
so I'll keep a cached quirks in SDHCIState.

> Regards,
> BALATON Zoltan

