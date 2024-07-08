Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp2969988njb;
        Mon, 8 Jul 2024 16:52:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXCk/+u8EoK4UZGCG83+mRVgzGgoo5aA1uxQsgPk2CEFTmr75W10CDnjcWuaVDxP5DldkG53MXOZKIhZ0TGCyFMC7B5B7fP
X-Received: by 2002:a05:600c:4a23:b0:425:80d5:b8b2 with SMTP id 5b1f17b1804b1-426707d03b6mr5844855e9.16.1720482742678;
        Mon, 08 Jul 2024 16:52:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720482742; cv=none;
        d=google.com; s=arc-20160816;
        b=Pq/PMeXGdT1IRPkhydIiTvlPmEIH6RorAvXxoOgvxLTiC54nUPfEQ0Bv7wkbIR/sIk
         j79MgtVrbDazegVorYquFyGGTn2rRZL4Y+P62bJV3MKWl6p+7fXO28gkZxsAC7OEhFV8
         fgG2o+h+dsusHrX/p3NasZ+ruI5WxTWD+Sni/dCr/LArOfFnJ1SQ48NGyCrf1nWB4Zvx
         pCDpUvDcCCflNODApsNUqxn+H94blCF/LxFOm+mInBdMGJyY1A8Zv9eQOobq9qff3Djw
         3Sn2IDoybWvwWWK8oV148xoZvPsQfln79pGdAA3hmQqBlzWbjj2z5mK9Jvcoy0X1+zcg
         E66w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=uoIxqkkfp6D3byamgWRg4iE8qJKE6OKUgrTUAvLelts=;
        fh=W/PzlKCyMGlwUzLwstbNXiJ9YOFZ6fUrwPVFFVsxjWo=;
        b=hsyApsve7oU7UE3Wc0XTj2gd3eTRmHZew2KR+URVoxJHPEB6Xsj/a/iWtX5t5jtA+w
         7IggjCJVTazWlq/HRSUZv+N2IEOucGXUKJ4LZ2oLDSQqM98+asBcaTjRt3RvX7u2jrKr
         POH4vbDoJTa7T1dtxsxQr9cdOG0hGF+3IkbeoEms/KdDfvi2Rt1weIKJBn13JB2tiLa4
         AFgRciIoyOJ1GvcXkBA5wdlQatR+fJKoLKBcARKz+xiDiMZAx/EQFwVYI5NKC2PRu5wB
         tsnQINMl+RQm1duIYVqyjan6BeZaxEJL04yIWC3kMGgkov4vS2V/s2t9BIbAu65KJgqd
         DCkA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@opnsrc.net header.s=google header.b=VtmWx23K;
       spf=pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) smtp.mailfrom=salil.mehta@opnsrc.net;
       dara=neutral header.i=@linaro.org
Return-Path: <salil.mehta@opnsrc.net>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4266fb58f50sor2593125e9.5.2024.07.08.16.52.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 08 Jul 2024 16:52:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@opnsrc.net header.s=google header.b=VtmWx23K;
       spf=pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) smtp.mailfrom=salil.mehta@opnsrc.net;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=opnsrc.net; s=google; t=1720482742; x=1721087542; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uoIxqkkfp6D3byamgWRg4iE8qJKE6OKUgrTUAvLelts=;
        b=VtmWx23KTYzR+t3nib4UV3KBH7Vi5Mifxyt2ev9FQbPIwM15zu+nUkv2g0zgEXYZYA
         JFbzOOp/P0jwf3ABY7suUYZA5UD0RuNVqE2BDnFCTVl56WcQsfpNHQu7CM6PigGCsYas
         /XTLjerqePyDqBQLhUMpd2ne3jTSSOsPMkzB7XYPFgK/J/FWTQxApUK69AM/F2sbN8gj
         dFc5TL/mEZcZzTf2maHYBEX4psLPiBBs88OwY27fBEvGqYHStE23AvIFbswIyNbmtWS6
         NpyoG/obSUk/j00LsOnLLBiHYK4s80vmPrCZmOvfdxQG8Ua//HdIVBqIp3MeZ9LymOoF
         HBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720482742; x=1721087542;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uoIxqkkfp6D3byamgWRg4iE8qJKE6OKUgrTUAvLelts=;
        b=lDMswbI3jI6AJtd8phFxg0z1jLQo7WXDu3MObBlyFnQb3Wv4CrMD7XsmKn+W0YALtd
         mq/MpAPGxemH+HYb5lugzMKfUJfn2WHalwxR5HBZdGVBb4AyN8xgf/PaEXHryuD0qekk
         4JAnOe6Dh09ADUORV8W04c2ncmaknw/MnGvA0qEnNqgxOclqmfRqTOl1Osnx8dmckpYP
         TwsAvbu9j07hiqyEpfxQwTbvcUYEgKHjl/loClfpQ8ATqpylVy6yAzFKQcR3sfUzn1H7
         kkjTlWaKRUV65xgpwI+klJnAYkjcYhPr/0S48OUrhzd3IIY0/Y5aPahORzosPzZK5E9l
         PkFw==
X-Forwarded-Encrypted: i=1; AJvYcCVrcAruWPe2kFqEvv7m5nkiukthywU8d+wPIr8qof/FLg+HZI7elUHYAZj7ewloLrhvKvb3PsiP3VKusCDsHBEfnTtFmCEb
X-Gm-Message-State: AOJu0YyUqS/RBicY8FzU84KK+jPP69gvFbO0WNx4KwXjVJ0ixUWiqb1Q
	VX2bKlv03Clpsl3z0FKWELq31Wbmmd5NE0Q/0izmByY1m2pve+9Of9Mn4iOzxE8=
X-Google-Smtp-Source: AGHT+IGYIbwQn90fv+TqAb/NGXWj5dhCw5gWd1YxptU1PeRO63aRM7tsMSGtHHZCr2jOYd5F8GO8gw==
X-Received: by 2002:a05:600c:48aa:b0:426:6e95:78d6 with SMTP id 5b1f17b1804b1-426706c62d9mr5557445e9.4.1720482741977;
        Mon, 08 Jul 2024 16:52:21 -0700 (PDT)
Return-Path: <salil.mehta@opnsrc.net>
Received: from [10.11.12.72] ([90.220.10.255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266a38f5a5sm53833465e9.43.2024.07.08.16.52.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 16:52:21 -0700 (PDT)
Message-ID: <f825e5df-ec87-4703-9722-98f1aa7aa33f@opnsrc.net>
Date: Mon, 8 Jul 2024 23:52:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V13 8/8] docs/specs/acpi_hw_reduced_hotplug: Add the CPU
 Hotplug Event Bit
To: Igor Mammedov <imammedo@redhat.com>
Cc: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, maz@kernel.org, jean-philippe@linaro.org,
 jonathan.cameron@huawei.com, lpieralisi@kernel.org,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 andrew.jones@linux.dev, david@redhat.com, philmd@linaro.org,
 eric.auger@redhat.com, oliver.upton@linux.dev, pbonzini@redhat.com,
 mst@redhat.com, will@kernel.org, gshan@redhat.com, rafael@kernel.org,
 alex.bennee@linaro.org, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, zhukeqian1@huawei.com, wangxiongfeng2@huawei.com,
 wangyanan55@huawei.com, jiakernel2@gmail.com, maobibo@loongson.cn,
 lixianglai@loongson.cn, npiggin@gmail.com, harshpb@linux.ibm.com,
 linuxarm@huawei.com, Zhao Liu <zhao1.liu@intel.com>
References: <20240607115649.214622-1-salil.mehta@huawei.com>
 <20240607115649.214622-9-salil.mehta@huawei.com>
 <20240706164519.06c53d77@imammedo.users.ipa.redhat.com>
 <db8c2a7c-cc40-4fed-98fc-171f70e239ea@opnsrc.net>
 <20240708155507.52418191@imammedo.users.ipa.redhat.com>
Content-Language: en-GB
From: Salil Mehta <salil.mehta@opnsrc.net>
In-Reply-To: <20240708155507.52418191@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: qB1oEVgtgh2L


On 08/07/2024 13:55, Igor Mammedov wrote:
> On Mon, 8 Jul 2024 05:32:28 +0000
> Salil Mehta <salil.mehta@opnsrc.net> wrote:
>
>> On 06/07/2024 14:45, Igor Mammedov wrote:
>>> On Fri, 7 Jun 2024 12:56:49 +0100
>>> Salil Mehta <salil.mehta@huawei.com> wrote:
>>>   
>>>> GED interface is used by many hotplug events like memory hotplug, NVDIMM hotplug
>>>> and non-hotplug events like system power down event. Each of these can be
>>>> selected using a bit in the 32 bit GED IO interface. A bit has been reserved for
>>>> the CPU hotplug event.
>>>>
>>>> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
>>>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>>>> Tested-by: Zhao Liu <zhao1.liu@intel.com>
>>> suggest to squash this into the patch that introduces this bit [3/8]
>> I thought, we are introducing a change common to all architectures?
> hw reduced hotplug implies GED, so including doc change
> into the patch that introduces bit in the code is better
> option.
>
> it also easier on the folks that come later and find doc
> and code in the same commit (which is easier to follow
> than looking for different commits in git log).

Ok. I'll squash this into the 3rd patch of this series.

Thanks

>
>>> Best, Salil.
>>>> ---
>>>>    docs/specs/acpi_hw_reduced_hotplug.rst | 3 ++-
>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/docs/specs/acpi_hw_reduced_hotplug.rst b/docs/specs/acpi_hw_reduced_hotplug.rst
>>>> index 0bd3f9399f..3acd6fcd8b 100644
>>>> --- a/docs/specs/acpi_hw_reduced_hotplug.rst
>>>> +++ b/docs/specs/acpi_hw_reduced_hotplug.rst
>>>> @@ -64,7 +64,8 @@ GED IO interface (4 byte access)
>>>>           0: Memory hotplug event
>>>>           1: System power down event
>>>>           2: NVDIMM hotplug event
>>>> -    3-31: Reserved
>>>> +       3: CPU hotplug event
>>>> +    4-31: Reserved
>>>>    
>>>>    **write_access:**
>>>>      
>>> :
>>>   
