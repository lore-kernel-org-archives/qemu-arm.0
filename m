Received: by 2002:a0c:fe87:0:0:0:0:0 with SMTP id d7csp2048180qvs;
        Mon, 22 Jun 2020 05:24:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSXQjuQ9Q+Cf0SgfSg9A3emTG7diDmoLrHOyTyizM9SEfDYx/5aEqA2S5rAXoBYrdkGFcQ
X-Received: by 2002:a25:941:: with SMTP id u1mr28848167ybm.274.1592828679930;
        Mon, 22 Jun 2020 05:24:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592828679; cv=none;
        d=google.com; s=arc-20160816;
        b=HtB52nPeSlzyL4Xtl61PTlnnoof2P3UPNBXmEK/4rFtuHlCLfWD17OvlItk7xsUpQ8
         DKT4YIHU0AetV+CzE9jlQSd1LHfWAnR6ny35HxvyDNS3k55Y5Cn0ZVJ0LmUZhF4T9mw6
         8BP4p8Sd45MRSSRLug3G10GWU6c5F1co5Hpovb2DDeUxvDPFKqfzixFOVYf0xHcrLe66
         QtweUzuiKN1KPjguzJXXQxHH1g53Nsa4hw63KwdCRbv7J3Cgf7ZwvyE8OamoEZ8Er3Ld
         2QdySZ3YBmSU/2k/xFMY0SKVgKdJTSbaPZ81vhWjC2xgURzxoYGbWviDKSxKIFHqC/qt
         p/iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=XctQSOer6J/cqWiZAOXKuu2iqgH7bUnuIb05z5YrR0o=;
        b=PLGZVVK3vRq63NWiI28C8g6ijxPcOH5blLafcqSZHGnPzx7FtJinPQ4/mwtu9fxBjH
         vb565orG4z1W5ce6POYnj0tQTANLzNxDKf/RO2wco+qfI15LzmTAjhDr4sq1LYqtS92h
         U36wV9DirYBrB9li/D8BBFTBZbdOS3R7vusA9ZliCtFHi7nlSM0pM4EcG6cWS0XQPGoT
         5MlUmFU7fBl46i4Tx+iU/GiCs6/3yr81PDjZqkMKF6OJnZ/WEKEnHSYZIOT9ofYJu2NL
         lxQYe5sjwp3B8ioY8sznCE0lEEleHu+++j+Pzd/CWBzVVT17yV+cqhxvDy0tY3JrlZyL
         P52Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Om8bYzjy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o127si15067161ybc.387.2020.06.22.05.24.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jun 2020 05:24:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Om8bYzjy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnLV9-0000lA-Es
	for alex.bennee@linaro.org; Mon, 22 Jun 2020 08:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jnLUw-0000gX-R0
 for qemu-arm@nongnu.org; Mon, 22 Jun 2020 08:24:26 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:46460
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jnLUu-0000XL-6f
 for qemu-arm@nongnu.org; Mon, 22 Jun 2020 08:24:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592828663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XctQSOer6J/cqWiZAOXKuu2iqgH7bUnuIb05z5YrR0o=;
 b=Om8bYzjyhosYCqmzuhs1uYrV5JRFV9mO1+sIIjRDSftaRMuD0hozX92d9L9yUoxEfNnvrB
 Rw9YnpHE/avgrQEyn1UAs7Z1n9bAwBXB5fZLBGhsg6Buf7XPhEf3KWzzQZTuwQh/HGY2LA
 Z3NFviC9TLRORo6Sp0QyhnR2JlgkMpk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-_xfPtL5NM1muFTT6vcjh6g-1; Mon, 22 Jun 2020 08:24:16 -0400
X-MC-Unique: _xfPtL5NM1muFTT6vcjh6g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8219F107ACCD;
 Mon, 22 Jun 2020 12:24:14 +0000 (UTC)
Received: from [10.36.114.197] (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 485727C1FE;
 Mon, 22 Jun 2020 12:24:06 +0000 (UTC)
Subject: Re: [PATCH v4 1/5] acpi: Convert build_tpm2() to build_append* API
To: Igor Mammedov <imammedo@redhat.com>
References: <20200611135917.18300-1-eric.auger@redhat.com>
 <20200611135917.18300-2-eric.auger@redhat.com>
 <20200616143327.2ee38a48@redhat.com>
 <3c3b466a-c965-e3f6-9bd6-74fce9c424c8@linux.ibm.com>
 <ed1b453d-2568-2134-3e86-c268e82a90f8@redhat.com>
 <ded58c6b-dcea-67ef-4f3c-b8af9f149ae8@redhat.com>
 <44663542-8352-2398-a297-3e1fe7f4bfd5@redhat.com>
 <ce60f439-fd2a-a72b-f004-44a01f4c5bdf@linux.ibm.com>
 <20200622113915.1dce2989@redhat.com>
 <d9d263ba-fc1e-d3af-857b-4d77c190bb73@redhat.com>
 <20200622141412.0e5640f8@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <c90fb01b-cfdf-4538-e256-b5c117da82df@redhat.com>
Date: Mon, 22 Jun 2020 14:24:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200622141412.0e5640f8@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 02:57:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, mst@redhat.com,
 Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, marcandre.lureau@redhat.com,
 eric.auger.pro@gmail.com, philmd@redhat.com, ardb@kernel.org,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j5ohWSQAxJG2

Hi Igor,

On 6/22/20 2:14 PM, Igor Mammedov wrote:
> On Mon, 22 Jun 2020 11:47:26 +0200
> Auger Eric <eric.auger@redhat.com> wrote:
> 
>> Hi Igor,
>>
>> On 6/22/20 11:39 AM, Igor Mammedov wrote:
>>> On Fri, 19 Jun 2020 07:19:51 -0400
>>> Stefan Berger <stefanb@linux.ibm.com> wrote:
>>>   
>>>> On 6/19/20 5:43 AM, Auger Eric wrote:  
>>>>> Hi Laszlo,
>>>>>
>>>>> On 6/19/20 11:38 AM, Laszlo Ersek wrote:    
>>>>>> On 06/18/20 09:50, Auger Eric wrote:    
>>>>>>> Hi Stefan, Igor,
>>>>>>>
>>>>>>> On 6/16/20 4:11 PM, Stefan Berger wrote:    
>>>>>>>> On 6/16/20 8:33 AM, Igor Mammedov wrote:    
>>>>>>>>> nevertheless looks like faithfull conversion,
>>>>>>>>> btw why you didn't drop Acpi20TPM2 structure definition?
>>>>>>>>>    
>>>>>>>> If we get rid of the table we should keep a reference to this document,
>>>>>>>> table 7: "TCG ACPI Specification; Family 1.2 and 2.0; Level 00 Revision
>>>>>>>> 00.37, December 19, 2014"
>>>>>>>>
>>>>>>>> https://trustedcomputinggroup.org/wp-content/uploads/TCG_ACPIGeneralSpecification_1-10_0-37-Published.pdf
>>>>>>>>
>>>>>>>>
>>>>>>>>    
>>>>>>> Further looking at this spec, the log_area_minimum_length and
>>>>>>> log_area_start_address only are described in
>>>>>>> - Table 2 (TCG Hardware InterfaceDescription Table Format for TPM 1.2
>>>>>>> Clients)
>>>>>>> - Table 4 (TCG Hardware Interface Description Table Format for TPM 1.2
>>>>>>> Servers)
>>>>>>> but not in Table 7, ie. not for TPM 2.0.
>>>>>>>
>>>>>>> Are they really needed for TPM2 or what do I miss?    
>>>>>> (side comment:
>>>>>>
>>>>>> LASA and LAML are optional with TPM-2.0. From the discussion at
>>>>>> <https://bugzilla.tianocore.org/show_bug.cgi?id=978>.    
>>>>
>>>>
>>>> They are needed for (x86) BIOS, such as SeaBIOS, not for UEFI, though. I 
>>>> do not know about ARM.
>>>>
>>>>  
>>>>> Thank you for the pointer and info. I failed to find this info in the
>>>>> spec. Given the risk of confusion, I would personally keep struct
>>>>> Acpi20TPM2 and maybe add a comment. Stefan?    
>>>>
>>>> Either way is fine with me for as long as we know where to find the 
>>>> layout of the structure.  
>>> I'd remove Acpi20TPM2 as it hardly documents anything, and add a comment
>>> pointing to the concrete spec that has these fields.
>>>
>>> TCGTCG ACPI SpecificationFamily “1.2” and “2.0”Version 1.2,Revision 8  
>>
>> [PATCH v6 0/3] vTPM/aarch64 ACPI support was posted.
>>
>> As documented in the cover letter (history log), the presence of the
>> LAML and LASA fields in the TPM2 table is not clearly documented in the
>> spec (at least I failed to find it). It is for TPM 1.2. On the other
>> hand, Stefan said it is mandated for some x86 BIOS to work. Given this
>> weirdness I think keeping the  Acpi20TPM2 struct is not too bad. See v6 ...
> 
> Laszlo pointed to spec version where LAML/LASA in TPM2 are documented,
> so I'd just use that as a spec this code is based on.

OK I missed that, indeed in the version the 2 fields are documented.
https://trustedcomputinggroup.org/wp-content/uploads/TCG_ACPIGeneralSpecification_v1.20_r8.pdf

in table 7:TCG Hardware Interface Description Table Format for TPM 2.0

I will use that ref and remove the Acpi20TPM2 struct then.

Thanks

Eric

> 
> PS:
> Acpi20TPM2 struct doesn't document anything, it's just another way to do
> the same thing as build_appen_* calls do. Having it just adds to confusion. 
> 
>>
>> Thanks
>>
>> Eric
>>>   
>>>>
>>>>    Stefan
>>>>  
>>>>>
>>>>> Thanks
>>>>>
>>>>> Eric    
>>>>>> )
>>>>>>
>>>>>> Thanks
>>>>>> Laszlo
>>>>>>    
>>>>  
>>>
>>>   
> 

