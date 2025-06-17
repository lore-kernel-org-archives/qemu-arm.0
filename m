Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp2493514njc;
        Tue, 17 Jun 2025 06:02:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX80S8kD9EwPCwnCfmB6/of1xUz679Ye6+yE/dTj81HbNOZM0ldZVO+4cmHpiP9gbZJ0RvyN6CXoTQI8w==@linaro.org
X-Received: by 2002:a05:6a00:4f95:b0:747:accb:773c with SMTP id d2e1a72fcca58-7489cfff3a7mr17795770b3a.13.1750165329692;
        Tue, 17 Jun 2025 06:02:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750165329; cv=none;
        d=google.com; s=arc-20240605;
        b=ODk0UWkJfHr1h7nFlCFO+vwWtzYM4+Bhw/Q07ahIku5T6t2jTmhD5RzdYw1XxkOlIq
         5qXkqWHrBU+WS6bvn7/I2snznvbKZjmKWxmHhmQJEbi7n1s/fBqhY5GjLRyFjnJ52W8y
         fNUMDKQLBaM9xMwnvTAbpQBgEFmQctkkFDabUSqisdF+5Jc8XO9DHVA3qoY2Bto8lLwQ
         9hyCREbFABWVy7XeyRYDPUHTpKyzidEFiB7WuHetU0X/GaG342BLtVw+KAa682WT7Pgk
         Hrpli7oi4IAh5tghNXHx1s+RhAwrxfIDMlXqxZrshNg0WCYBrjKBdLxowp1qWPJ7sGQa
         Mt6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=iDry9tfFvZbE7BA/ZG2VctmEiKG5/hgVcCbfAt73fD0=;
        fh=fw51T38XGHPnbm7Zx1DV0+D8RzGWHnzzS3qD+ecJWnM=;
        b=k5e7G7XmMFC2IX1tpVA9COHGx8iOnRTuT1euC1R3oKuCbN69rpFkch6azObt0zutaB
         TKz2TxUf/kM9bG/34JSS6dKZcsliahjox79S70s+ui3iOycJ22kn6lLHDr23M2chTMhI
         Gf1m1pKaxdcfS/NmL4h/ckB+cgZHKrJzyQK0EcZYodMVea3CMnEkypQPbcRlHUPOGBuc
         UjVSdosQClBgBGl37pvNcMLrDyoWPjcBpYEDC1dd0hjx146pOklx6BvOmrdF94RpSZCX
         EbT4HQ58zJjjXDNPZ+CSeM0JBiRZV9yBI1jGdVZ/MDSvqvBgm13NTcIh/3jNaOg93h1t
         snuw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NcU2WklZ;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-74880963225sor7679329b3a.5.2025.06.17.06.02.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 17 Jun 2025 06:02:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NcU2WklZ;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750165328; x=1750770128; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iDry9tfFvZbE7BA/ZG2VctmEiKG5/hgVcCbfAt73fD0=;
        b=NcU2WklZXTP8C4s6KivCzkC9ic8gdfCNugkhX7hAC8aEgJ0i0Z0pQSUqQFLsvn9ea6
         qS2QAIJ340wrv/WmrzPPFOElotgA6q2rwl00nmtEDq9rXyrYpc1L9ggC/hk5y6W2/dVZ
         hO0lQ9MKw533yBdJxF+GF7RhdrtffRrbMpxfQmLKFarN5LhgnM7TJMvY8aC8R+qhzGpa
         M3e6Tdmrwel/LHLHgsYsc7yWZHXFTt8DPat1rkmspt69Jwlvf2RpeUpzpqsIjy3Cly02
         jWMj772b7zjnsH1d9C1Qlu9QiOhPrkYzYpYcJEqa1i2+ZRhwxtK8bN3XN+tgz1UZ39Ko
         5HNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750165328; x=1750770128;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iDry9tfFvZbE7BA/ZG2VctmEiKG5/hgVcCbfAt73fD0=;
        b=p4raVKWK5IHAadYswZHwECjnvE+yPdo2HX78ul0cVpQcxVWNIJSSYJoF8/kg85CK0z
         81eTn/o5g7tCOzacESl7XL5/2QFTsAtRPjj53LrId7WJFdfFdgIaCWajOktgu47iTaYL
         LqobW5G+I8PkZlaN7f8B7vGuT+fsIcPVm9Kw6RkYddQuavEAeZY4qL7AL6EVDWj4JN5n
         IGosxZILAvEaLzG0WdlpyZvMOWwdM1P/s6G1pIWo2Nck+VUNzs2nLoOm4K03jU6qZ+97
         E4bHskgL9r71zxij3JXA5UDzmIv8WCreDfmUjKi8kkqMbHwroaAnlQbmWo2gJJoacXXy
         58BA==
X-Forwarded-Encrypted: i=1; AJvYcCVbvemDrC27d+FtoSIgC46v9gXdATx8TfCWwiZPhRE/40PszQflMMLq3cRjAXJ8l9metKdWKfYsavIs9w==@linaro.org
X-Gm-Message-State: AOJu0YxWFzlAHD2P0vWa/nX8KC1IF4tvS1QoNjAR4NDgWcCCX/JNh0B+
	9+97Vjh8RyR9QIedIa2C0PvCRcRKdiyF0RXp8PPuV+sqjvS6TAjYtva7CsYZ3vdK8PtpHQ==
X-Gm-Gg: ASbGncu+Uf34e+FvZ+VwA8AkroJGnJc45jXb7PsgtzHGWxf1qJXP2BZ9sAw+ZeebtNP
	7bvoakXPwBVSLZ9CHZXIAiteMXI1pTw8GiGUX74PCfvMcY2NYI0NqFKa0mh1i736P9nlRpBTRho
	11G1o28wtknWRMIEMQuTghhq8Kkw+VQJ6RnSPO5odJKBwzDHPxMFJtaWoEelMwJkwfA/wVwIqki
	MbOFFK/FjD82UnhvwgrR9t9gk2eyX+e4K/y+OcDMorNS2nrxbWtjyqUqYJi1pFded/ChRJkHDr8
	nG5TgkJGCFSRFmTTOkvS42AQh/nk0SKaXEhtjNs3Hq3QF77tfUQRUNSBKd3TDWRd4gUjrqH7Ckc
	jvh9GGG1s
X-Google-Smtp-Source: AGHT+IEECWLcg4ihqU92Kn6lt/pjagA8DA6HvuiYyIMlm3A6pg+NKAIywgS+4TjCW0KifbgQH4L/BA==
X-Received: by 2002:a05:6a00:1255:b0:748:33f3:8da3 with SMTP id d2e1a72fcca58-7489d0335f6mr17300209b3a.19.1750165327753;
        Tue, 17 Jun 2025 06:02:07 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.102] ([186.215.60.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748ded10691sm499372b3a.60.2025.06.17.06.02.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 06:02:07 -0700 (PDT)
Message-ID: <36ac7f90-d946-439f-ab20-123f542291b6@linaro.org>
Date: Tue, 17 Jun 2025 10:01:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v4 0/8] hw/arm: GIC 'its=off' ACPI table fixes
To: eric.auger@redhat.com, qemu-devel@nongnu.org, philmd@linaro.org,
 mst@redhat.com,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, udo@hypervisor.org,
 ajones@ventanamicro.com, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com
References: <20250616131824.425315-1-gustavo.romero@linaro.org>
 <5b0f2250-e521-4172-870c-0384c5ef2382@redhat.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <5b0f2250-e521-4172-870c-0384c5ef2382@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: NDwvzeWcYoFQ

Hi Eric,

Thanks a lot for doing a first pass on this series!

On 6/17/25 06:35, Eric Auger wrote:
> Hi Gustavo,
> 
> On 6/16/25 3:18 PM, Gustavo Romero wrote:
>> Since v2:
>> - Fixed no_tcg_its inverted logic (rth)
>>
>> Since v3:
>> - Fixed remappings in the IORT table when ITS is no present
>> - Rebased on master and resoled conflics, like no more "no_its"
>>    flag in VirtMachineClass
>> - Dropped patch 1/9 because we actually want the instance flags,
>>    not only the class flags, and the instance flags are the ones
>>    to be used often when deciding about the presence/absence of a
>>    machine feature, instead of the negated class flags ("no_*")
>> - Adapted the other patches that depended on 1/9
>> - Dropped patch 4/9 in favor of using the instance flag for
>>    checking if ITS is on or off
>> - Simplified VM options for the new "its=off" test
>>
>> v1: https://lists.gnu.org/archive/html/qemu-devel/2025-03/msg07080.html
>> v2: https://lists.gnu.org/archive/html/qemu-devel/2025-04/msg00495.html (Patches 6/14 -> 14/14 in the series)
>> v3: https://lists.gnu.org/archive/html/qemu-devel/2025-04/msg00567.html
>>
>> Fix ACPI tables for '-M its=off' CLI option and resolve the issue:
>>
>> https://gitlab.com/qemu-project/qemu/-/issues/2886
> 
> One first comment is that this series will collide with Shameer's SMMU
> multi instance series which has been lunder review for quite some time
> (adding him in TO):
> 
> I think it may be more future proof if you could rebase on it - I know
> it is a pain ;-( -. Or if sbdy objects for Shameer's series please raise
> your voice now.
> 
> [PATCH v4 0/7] hw/arm/virt: Add support for user creatable SMMUv3 device <https://lore.kernel.org/all/20250613144449.60156-1-shameerali.kolothum.thodi@huawei.com/#r>
> 
> https://lore.kernel.org/all/20250613144449.60156-1-shameerali.kolothum.thodi@huawei.com/

ayayay, life is never that easy! :)

Thanks for point that out. Sure, I can rebase it on Shameer's series, but also
I'd like to have this ITS fix for 10.1, so I think it's a matter of understanding
if Shameer's series will make the 10.1 release (thanks for asking the reviewers if they
have any current objection so we have an idea if it's close to get accepted
or not)?

Meanwhile, I'm pretty keen on if I'm correctly generating the IORT table pruned from ITS
(patch 7/8 in this series), like, are the remappings for the RC and SMMU nodes correct? That
would make me more comfortable to start working on a rebase.


> Also I understood Shameer intended to write some new bios-tables-test.

I see.


Cheers,
Gustavo
