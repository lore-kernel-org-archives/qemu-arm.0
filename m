Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp716421lfk;
        Fri, 3 Dec 2021 15:07:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1S3Zrp0UuM3DS8oYluTAIsmuT27m8vUrAbg01TXDZmy8dGQXn9RHBKisG/Tz0Vczq9pgC
X-Received: by 2002:a9f:2329:: with SMTP id 38mr25532718uae.124.1638572865986;
        Fri, 03 Dec 2021 15:07:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638572865; cv=none;
        d=google.com; s=arc-20160816;
        b=U1FUu89YQugzsSbSjHgT/4Yb20G2d3PgaZRNvpzq3Clzw//M6FxbSkMtMeh4so/4qo
         JfSsmEYiX0nmCmSTMV75S/hc0haFLlumih2yMxyp4k2aFB4R0e8aeGfNp4b0U2CDxe6P
         Ga5mKX9sOK9JJBD3oTWrUSmrFIDt1/tcmIlQFPfbbRpQ6h21XPljB7FPdZs4teSzLugm
         s3Egy/s7hHi+7NrxlSajWgRth74Nu29y5CUbB6nI2nnzwy8fu0nj6BEkp1mViDKTp1GE
         Jv1wEk4KzFzKp9ai2dTPodrybClfn73dCCs4J/OFv6AF/ssyP3SrEldwJ+3euvE/G/n0
         mUXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=E1PqSQCgSBZSyeFtBCxTlhhTodq9lOn37h2qobTUok8=;
        b=ENmTxf3tu6ESEGWGihibDGZGMexwutB11RFK9Yw6+qmNNR3ZXVH/+n5p6UA/RRXCzn
         djXxT+wIOHGjFEi4ZS11VHPb9LG9Oxj6RD1xTqycimJZTJRGN80O4RPSISqepy01lGqe
         hFZvszv2Ykh60fVLUA1YcXvi7lK2/Hgi+Uf3y8ojSEiF7cOlLWeJbN3O4YBd1FXPHxzt
         f6zbHTQ+rc6PGBH9RET/lZTyLlJ5FqeRwb7oSrW+uIGn8Ar8CyUFCN7eOYwx7oeLLrf4
         sjjKdi3cnk/IGcPCiXeQ6DKC7sjKvmnsfKsd3P4bogGVIhOO2R62cn+ndAJjCz6jjpD7
         nz3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=L0Bm6Dn9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h8si4176862vsj.457.2021.12.03.15.07.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Dec 2021 15:07:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=L0Bm6Dn9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mtHeb-0002AH-Cw
	for alex.bennee@linaro.org; Fri, 03 Dec 2021 18:07:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mtHeK-00029j-FW
 for qemu-arm@nongnu.org; Fri, 03 Dec 2021 18:07:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mtHeH-0007LB-0p
 for qemu-arm@nongnu.org; Fri, 03 Dec 2021 18:07:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638572844;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E1PqSQCgSBZSyeFtBCxTlhhTodq9lOn37h2qobTUok8=;
 b=L0Bm6Dn9lvy7jeVIjouMQl8lD5Ngn2LTsXpdxNFbNS+trI/74BN/+kwhOuZfvh1egSCwJp
 B0c3jrajk6Mn3hGjFM5wyEgvXGKW7niQQ3H1lBcW+QHMsKdWWeH3VSJhmx32rUuqTZVphh
 /TSsFvs9sabCtRH16jlkFOBybulCAAQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-585--W1jDEo8MYuKgVvyTUJU0w-1; Fri, 03 Dec 2021 18:07:21 -0500
X-MC-Unique: -W1jDEo8MYuKgVvyTUJU0w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF3B683DD20;
 Fri,  3 Dec 2021 23:07:19 +0000 (UTC)
Received: from [10.64.54.43] (vpn2-54-43.bne.redhat.com [10.64.54.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 48CF460843;
 Fri,  3 Dec 2021 23:07:00 +0000 (UTC)
Subject: Re: [PATCH v2 0/2] hw/arm/virt: Support for virtio-mem-pci
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
References: <20211203033522.27580-1-gshan@redhat.com>
 <20211203141058.00006079@Huawei.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <e6159135-6bbc-7f2f-2226-e25e29ba3c67@redhat.com>
Date: Sat, 4 Dec 2021 10:06:56 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20211203141058.00006079@Huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.938, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: peter.maydell@linaro.org, drjones@redhat.com, david@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 qemu-arm@nongnu.org, shan.gavin@gmail.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TGt9x557YqS6

Hi Jonathan,

On 12/4/21 1:10 AM, Jonathan Cameron wrote:
> On Fri,  3 Dec 2021 11:35:20 +0800
> Gavin Shan <gshan@redhat.com> wrote:
> 
>> This series supports virtio-mem-pci device, by simply following the
>> implementation on x86. The exception is the block size is 512MB on
>> ARM64 instead of 128MB on x86, compatible with the memory section
>> size in linux guest.
>>
>> The work was done by David Hildenbrand and then Jonathan Cameron. I'm
>> taking the patch and putting more efforts, which is all about testing
>> to me at current stage.
> 
> Thanks for taking this forwards.  What you have here looks good to me, but
> I've not looked at this for a while, so I'll go with whatever David and
> others say :)
> 

[...]

I would translate this as your reviewed-by tag, which will be added to v3.
However, it shouldn't stop you from further reviewing :)

Thanks,
Gavin

