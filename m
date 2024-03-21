Received: by 2002:a17:906:bc5a:b0:a46:bbde:2c08 with SMTP id s26csp614770ejv;
        Thu, 21 Mar 2024 09:15:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWUFxDOR53Yjw3U7oSfDau5HwuRDRDCYBp2gXfMlkGRHaJWgIBhNgsJXXLL35NN5CR7yw8KsI4p6BL5i3h/YuvjBoLQjCSn
X-Google-Smtp-Source: AGHT+IHu1yu+mmo13oRM1RrQg6NJ+dDlBgh7+r1BO3NwMDeBYrZ2icPFssM5PviGrhkUC6VpeCXo
X-Received: by 2002:a5d:690f:0:b0:341:844e:b4a with SMTP id t15-20020a5d690f000000b00341844e0b4amr3154257wru.33.1711037748167;
        Thu, 21 Mar 2024 09:15:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711037748; cv=none;
        d=google.com; s=arc-20160816;
        b=EvpX1B79mEsVarpCGVKmDP6hKQ9QV4I8urVClMIJviJLenti5Vhmk5MZkJ9w4mtPUs
         C6vJLsa3TzMs+RMbKEoq0pU0u6ETsDXMd8k7Sb2oGWACNHsKZn6S1FlfYOHBZSA1W0I5
         mLM+yA6JUTALUYqH5yTC0S6vhQ0XIWI4Hh+VdGkaDyAcFtaYxf4nPXAaig2RDKLfyrzz
         3LTu7DfRQ5Cd2Ed+n1LYDxBkOatGv6xgKHZ9G8rHloLK9dvOsEjtKoEHBMHjYxz1gW1W
         1KZnJtmWK7RiA9ANb4KZ9+zXz461RmfmkrPBJAZK1hUWKZmW95hPQonEiTp+bBVxDmMD
         ZRSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=slRTyQp6db9vavffT9TB7Wr+s2VRVnkD1F4/do+Auko=;
        fh=723kpvcEeWD+1Vb5kM5h02TEMGSNaj52xeQkAMaYfYM=;
        b=jiLeDvx2TNfQhni4vMAkSaF89CLez3WwsOjuf5peTnvpoTIXL6zveX6Y0PhV5g/v5I
         64qlQfF9XD+tkBZQ5PqgOVSbiPIG5yq7oia2meRHmJ0M8of2BQwy7M/25pInypaOaRS8
         Bd5xHNa8TSh4/luxExt2Ab5OPraNutiRcKqmwqDpG0BADrIygANSl4mGMvEeEWh7jeEN
         QA+QH9+unNLglRSifMETfE+Oq+yxmj1hLkr9cwvfmiMar6Z91CWuAnXsJG6wnMPkikny
         x4+2eWDNfRRVtDPyRsPbOWGo9fYY+yoxiXD5RFRA77OKZOdLYeTBkduBtfG+PZx43T5W
         cnkg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Y3VnZJus;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o4-20020a5d4084000000b0033e7a214218si8372911wrp.888.2024.03.21.09.15.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Mar 2024 09:15:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Y3VnZJus;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rnL4p-00089l-4d; Thu, 21 Mar 2024 12:15:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1rnL4m-00089W-B0
 for qemu-arm@nongnu.org; Thu, 21 Mar 2024 12:15:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1rnL4Y-0000KK-T3
 for qemu-arm@nongnu.org; Thu, 21 Mar 2024 12:15:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711037716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=slRTyQp6db9vavffT9TB7Wr+s2VRVnkD1F4/do+Auko=;
 b=Y3VnZJustxn6MKctrPidPIK6JZ/LpyWVvokuPPIibsmlHS+/zCOULvMAymA3Ez0SrmZnoi
 cGbI2Yr+Z/S4S6uB1ng/z2k2EIG2VDnCt3l8b1WrqeWnzkcnI1ZpaSOgJ6E2jMKG0ZclSG
 8VRb6FhPXWxGPpc4Y9vY45CyXddnrbI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-oQzg0fZANiSFTScZWCqE7Q-1; Thu, 21 Mar 2024 12:15:15 -0400
X-MC-Unique: oQzg0fZANiSFTScZWCqE7Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-33eca7270ccso515283f8f.1
 for <qemu-arm@nongnu.org>; Thu, 21 Mar 2024 09:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711037713; x=1711642513;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=slRTyQp6db9vavffT9TB7Wr+s2VRVnkD1F4/do+Auko=;
 b=dnUisn/nhVFO2/vkJwCNBrrAWlgAhnqWFd0YXEBdS8TO1jBS5X3YMgF49ZJrFACl9m
 VqFFUMs4pJWZvcuOhQwKWpwl/ouftBZEqj7Veba5xy7AYkNehBOlIxmuloIBt8TsV56Z
 h2SYN9xKPr4Fg0e2ebpE1vedtrDobQH7LSTGH2QhHUq/nniTOn+Gjb2NiX5ObZ4grP7A
 M/YcGyJkj0f+bo+4C10Ea9dE6d40gCr2pmmS8G8tHAuFZNnMf//uA3h9INGa2Ndyhwxf
 yelU71eJLRSz0s6hZH5HbbB5qdMi7CkdEhct1/3PwHVFK1x3wBfsdp9nHueMJxtJ2Ry5
 5a9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5gKMVlXIpbdQ6EMVYMsBJPdeqRQHLrtKwXOzM2Txe9rtI4IHMAG+kjvhyZpgafS9NnflaWiJpptVL2SZkqiK7Bsbo
X-Gm-Message-State: AOJu0Yxb/NGu+5Er8kmRsrBjVHPf+9eSc3uxnnT7hSeKUJkdj7dD7OdQ
 el3oIONKCJzRHNfbYNRdzXYvS+NHZ2N7qSEJyvKm+gyWS462/4SV7sCiH/5oOqAHLOTjBs6vcr/
 84Iv25GsMWeocUAmX58IJJXSFstnSiyDI456Onv/CjiFxqQSXfQ==
X-Received: by 2002:adf:f4cc:0:b0:33e:2d7b:c5a8 with SMTP id
 h12-20020adff4cc000000b0033e2d7bc5a8mr2711004wrp.17.1711037713123; 
 Thu, 21 Mar 2024 09:15:13 -0700 (PDT)
X-Received: by 2002:adf:f4cc:0:b0:33e:2d7b:c5a8 with SMTP id
 h12-20020adff4cc000000b0033e2d7bc5a8mr2710989wrp.17.1711037712741; 
 Thu, 21 Mar 2024 09:15:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a05600c154a00b004146d7345d2sm185548wmg.46.2024.03.21.09.15.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Mar 2024 09:15:12 -0700 (PDT)
Message-ID: <f4bb2e2f-e145-41e2-ba89-1ae62b87db04@redhat.com>
Date: Thu, 21 Mar 2024 17:15:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misc/pca9554: Fix check of pin range value in property
 accessors
To: Miles Glenn <milesg@linux.vnet.ibm.com>
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20240321160154.901829-1-clg@redhat.com>
 <c383d6f489022a47c6a87a250f4d44938d9ede6b.camel@linux.vnet.ibm.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <c383d6f489022a47c6a87a250f4d44938d9ede6b.camel@linux.vnet.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: YR5hkpuEUMwy

On 3/21/24 17:08, Miles Glenn wrote:
> On Thu, 2024-03-21 at 17:01 +0100, Cédric Le Goater wrote:
>> Coverity detected an "Integer handling" issue with the pin value :
>>
>>    In expression "state >> pin", right shifting "state" by more than 7
>>    bits always yields zero.  The shift amount, "pin", is as much as 8.
>>
>> In practice, this should not happen because the properties "pin8" and
>> above are not created. Nevertheless, fix the range to avoid this
>> warning.
>>
>> Fixes: CID 1534917
>> Fixes: de0c7d543bca ("misc: Add a pca9554 GPIO device model")
>> Cc: Glenn Miles <milesg@linux.vnet.ibm.com>
>> Signed-off-by: Cédric Le Goater <clg@redhat.com>
>> ---
>>   hw/misc/pca9554.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/misc/pca9554.c b/hw/misc/pca9554.c
>> index
>> 778b32e4430a8b618322c26b1b185ed3ead97cc4..5e31696797d9564666ece6fe177
>> 37ee2a9733e96 100644
>> --- a/hw/misc/pca9554.c
>> +++ b/hw/misc/pca9554.c
>> @@ -160,7 +160,7 @@ static void pca9554_get_pin(Object *obj, Visitor
>> *v, const char *name,
>>           error_setg(errp, "%s: error reading %s", __func__, name);
>>           return;
>>       }
>> -    if (pin < 0 || pin > PCA9554_PIN_COUNT) {
>> +    if (pin < 0 || pin >= PCA9554_PIN_COUNT) {
>>           error_setg(errp, "%s invalid pin %s", __func__, name);
>>           return;
>>       }
>> @@ -187,7 +187,7 @@ static void pca9554_set_pin(Object *obj, Visitor
>> *v, const char *name,
>>           error_setg(errp, "%s: error reading %s", __func__, name);
>>           return;
>>       }
>> -    if (pin < 0 || pin > PCA9554_PIN_COUNT) {
>> +    if (pin < 0 || pin >= PCA9554_PIN_COUNT) {
>>           error_setg(errp, "%s invalid pin %s", __func__, name);
>>           return;
>>       }
> 
> Thanks, Cédric!  I guess I should be running coverity myself.

I don't myself. I get reports from :

   https://scan.coverity.com/projects/qemu

Thanks,

C.

