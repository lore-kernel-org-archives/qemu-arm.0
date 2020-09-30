Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp5663645lfq;
        Wed, 30 Sep 2020 09:11:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNGhL6p4yKxmg7tiA+n23jJjZisRKftplTYxnN+DpSHIdE9+ZKnhVwYa7K5HeGdElD9qNh
X-Received: by 2002:a25:ef03:: with SMTP id g3mr4010821ybd.340.1601482305866;
        Wed, 30 Sep 2020 09:11:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601482305; cv=none;
        d=google.com; s=arc-20160816;
        b=S84cr71ePdNhhwRkwBn7wCbgPEWwuntQCEMYUaQ6th5ospmeRWOT+fsgIsSzI7Np5W
         z/pfN4rJgqkEMwcoJkgM4tHs1f+ig0JVRQxTdLxHrIsgv4jcyLdqoYPbI8R4cOQlLXj5
         uErQD/5xeTYIDTTFwOm32wblmrDQG+0qauM8amAnsXghoMJKY+9odSVIysz5QsHfVZef
         Q5TAqEMASRe0LUQ1BOT1L0VhZKweZIppHODszYrblAMRzIakYvWOLiMp1ATWMb2PxaHC
         NJQQ4bCfVmg4HxarShDLw7uuo7xdhBqSGIxu5ZqU7njx7HBIkNHhyM3FTU66oz3TMB0r
         zINw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=texujQ5iGf6D5hUqlZOFLb1WfRmE8HMmauyTS/DUFdU=;
        b=o+/DfK1aR2mz07tb7wlyUgiiVBs49W4oGNFkdJlKJx5hCE9FXCx+DNtuopGd2kuGRm
         WBZip8OfB3oXO3skGPqgPX4I/Y86w5nTXxQI9O1cziyPh8PnfhmlmjXxhbtuHKC2aHE1
         cpIOrBsoJa94PhfZQAP8g1tm3OyHWOL+XDkjCklxGvsac0r9xOQ3MCaiz/l+gw11bvIp
         3RZtASVWJ+/Gp92hTAxKkXolPS0wMpolL8/IAyU7LGUDoeapKLMOnPbnNF4fKLbeXNen
         iUr+oPEiaFbjZbv/snwtwUpt8VD4VNLKD8b0wknRelFIjffevbZbH2skTDmFYsltH894
         vj9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IqfMmTtX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m13si2019347ybf.480.2020.09.30.09.11.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Sep 2020 09:11:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IqfMmTtX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kNehl-0003Cp-8o
	for alex.bennee@linaro.org; Wed, 30 Sep 2020 12:11:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kNegP-0002JV-Gi
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 12:10:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kNegM-00037i-A7
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 12:10:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601482214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=texujQ5iGf6D5hUqlZOFLb1WfRmE8HMmauyTS/DUFdU=;
 b=IqfMmTtXnuHxNO05UJzhAH75qnYVUCWFkxfLwtKRieHGfv2aG9HHjIx2+5CTfaAarmYuCr
 Z05Kd4GUZ2nuP84nh7PODPDH9nHJHKlS9B5lDrz/57wpHrN/z2u/LyAf3rSIWulAwX5TD1
 J6G9JOJbbnSIdcDzO6BVIN56UFlz47A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-XLK7iyjrONy46Acm8JIFzA-1; Wed, 30 Sep 2020 12:10:12 -0400
X-MC-Unique: XLK7iyjrONy46Acm8JIFzA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A907810BBEC9;
 Wed, 30 Sep 2020 16:10:09 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-148.ams2.redhat.com [10.36.112.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9089D10016DA;
 Wed, 30 Sep 2020 16:10:08 +0000 (UTC)
Subject: Re: [Qemu-devel] [PULL 04/28] hw/arm: Express dependencies of the
 highbank machines with Kconfig
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20190505135714.11277-1-thuth@redhat.com>
 <20190505135714.11277-5-thuth@redhat.com>
 <f2489790-8fcd-a9c3-4ec3-c8a72240f172@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b56334d8-e165-4aac-2092-2912d442e6a9@redhat.com>
Date: Wed, 30 Sep 2020 18:10:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <f2489790-8fcd-a9c3-4ec3-c8a72240f172@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 00:26:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qkl8LNovLLTb

On 30/09/2020 17.38, Philippe Mathieu-Daudé wrote:
> Hi Thomas,
> 
> On 5/5/19 3:56 PM, Thomas Huth wrote:
>> Add Kconfig dependencies for the highbank machine (and the midway
>> machine).
>> This patch is slightly based on earlier work by Ákos Kovács (i.e.
>> his "hw/arm/Kconfig: Add ARM Kconfig" patch).
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  default-configs/arm-softmmu.mak |  9 +--------
>>  hw/arm/Kconfig                  | 11 +++++++++++
>>  2 files changed, 12 insertions(+), 8 deletions(-)
>>
>> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
>> index 2a11e76cc7..50a4be3cad 100644
>> --- a/default-configs/arm-softmmu.mak
>> +++ b/default-configs/arm-softmmu.mak
>> @@ -8,6 +8,7 @@ CONFIG_PCI_DEVICES=y
>>  CONFIG_PCI_TESTDEV=y
>>  
>>  CONFIG_EXYNOS4=y
>> +CONFIG_HIGHBANK=y
>>  
>>  CONFIG_VGA=y
>>  CONFIG_NAND=y
>> @@ -45,24 +46,17 @@ CONFIG_PLATFORM_BUS=y
>>  CONFIG_VIRTIO_MMIO=y
>>  
>>  CONFIG_ARM11MPCORE=y
>> -CONFIG_A15MPCORE=y
>>  
>>  CONFIG_NETDUINO2=y
>>  
>> -CONFIG_ARM_TIMER=y
>> -CONFIG_PL011=y
>> -CONFIG_PL022=y
>> -CONFIG_PL031=y
>>  CONFIG_PL041=y
>>  CONFIG_PL050=y
>> -CONFIG_PL061=y
>>  CONFIG_PL080=y
>>  CONFIG_PL110=y
>>  CONFIG_PL181=y
>>  CONFIG_PL190=y
>>  CONFIG_PL330=y
>>  CONFIG_CADENCE=y
>> -CONFIG_XGMAC=y
>>  CONFIG_PXA2XX=y
>>  CONFIG_BITBANG_I2C=y
>>  CONFIG_FRAMEBUFFER=y
>> @@ -150,7 +144,6 @@ CONFIG_XILINX_AXI=y
>>  CONFIG_PCI_EXPRESS_DESIGNWARE=y
>>  
>>  CONFIG_STRONGARM=y
>> -CONFIG_HIGHBANK=y
>>  CONFIG_MUSICPAL=y
>>  
>>  # for realview and versatilepb
>> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
>> index acd07b2add..0ba377ac18 100644
>> --- a/hw/arm/Kconfig
>> +++ b/hw/arm/Kconfig
>> @@ -18,6 +18,17 @@ config EXYNOS4
>>  
>>  config HIGHBANK
>>      bool
>> +    select A9MPCORE
>> +    select A15MPCORE
>> +    select AHCI
>> +    select ARM_TIMER # sp804
>> +    select ARM_V7M
> 
> Hmm I missed that... This machine doesn't use a v7M core, right?

I think you're right: The machines seem to use A9 and A15 ... so I guess
this was a copy-n-paste bug ... could you send a patch to clean it up,
please?

 Thomas

