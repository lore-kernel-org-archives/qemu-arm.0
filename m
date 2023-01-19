Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp453723ejc;
        Thu, 19 Jan 2023 08:21:31 -0800 (PST)
X-Google-Smtp-Source: AMrXdXupsVrue2XGqL54bWQASBkT1IdkMe2/lUOdolqyBQOl8imXNVMmCDSCIfN9eN02gr1bnytC
X-Received: by 2002:a81:f112:0:b0:4d7:8624:6c6b with SMTP id h18-20020a81f112000000b004d786246c6bmr8789349ywm.5.1674145291178;
        Thu, 19 Jan 2023 08:21:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674145291; cv=none;
        d=google.com; s=arc-20160816;
        b=PAIikrdtO5LRRAJdMyb653/3nj3F7Z5z5Bg6XaQbJJgqyOec+LLSMxjVLh/OwodzMd
         o0zDsM+Mx0COmfA9IvC38JYAMhVeNTjevrT5jYywNDqhwEA/dNw5q8yQTTIPfRy6kQ9K
         P2nETfWJqcipPZNzIbf/1rbWtvGT+qeSDwDJy6jvcPKWHCCUCKMSdoHj5WFge4K1VcjC
         xwM2+AGofDN5ztXUERAAOsoclg9WGRNJ4e5V3UdzGV9SUXfG143v/RKyhHJsGu8NYG43
         t8CkbmQ0zmnn1npnqWs0goIYBzzGGqTuSpTCRDmOA9M65+nltoiWrTHVdjZ0BGLt5Bkh
         Rr5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=9ZXYzA6wBI+c4e59ClvxpxHDlqC/SdFCNH11BP6R9RY=;
        b=LhI+Kk3wjoO55+Uq5d1et8nChY4+exi+nrq+XnfMWR6GO602mz8gjdL7Q1gkH0IIpj
         6ZW40cO/UozWLKcUiBQspbelJuqpLBibZkfpJv+D6AqMbXw+OHDK2oo8YPNztimF6Aqt
         eGIfHm2Pr0i9Av+64KKe2fwQUx0A8wMKZXKizxLkjp1XhvhnWl+o9L0Zb6bZi79wDsMg
         wfaek/mIucuCYnlyTrGuFRvL7zrA9t0P+3GpHUT05fT22VLk5k0z03Mloq99gV1ZL0+Y
         MlXlgVgl7DrFqI8muTnKxbFYY8skRUicnPyh1DQSHEtM5M11KuwvYgZ+Xapq93zdNcXK
         HCHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ar07l+qX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j17-20020a05620a411100b00706973a8276si6094831qko.567.2023.01.19.08.21.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 08:21:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ar07l+qX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIXf9-0000Xq-Qf; Thu, 19 Jan 2023 11:21:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIXf8-0000Ww-J7
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 11:21:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIXf6-0003aW-RM
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 11:21:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674145271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ZXYzA6wBI+c4e59ClvxpxHDlqC/SdFCNH11BP6R9RY=;
 b=Ar07l+qXjbrRXPKkFIpwpbtdQPBIm0bXpmnRewCL5d7oONlyw3jJY86UxyvzRQKVTQnLtP
 MgTmfTWi/6mPzpnJkK3U8+95uBkrYxWi0DCNeA/Er/ZOVAuGrZ8+CLLKbYGyOirzKJpGPe
 qJ5eOru8D0Q3iPbTOPsUzToo2BEoR80=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-465-TNuZgIKBPvqZEEhng1s76g-1; Thu, 19 Jan 2023 11:21:10 -0500
X-MC-Unique: TNuZgIKBPvqZEEhng1s76g-1
Received: by mail-qv1-f72.google.com with SMTP id
 k15-20020a0cd68f000000b00535261af1b1so1202639qvi.13
 for <qemu-arm@nongnu.org>; Thu, 19 Jan 2023 08:21:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9ZXYzA6wBI+c4e59ClvxpxHDlqC/SdFCNH11BP6R9RY=;
 b=gJmbfDwxayefKk+V5upkkOpeJkvE7rOiuTo0+WGfmCLm8TBAqmsQBSwJt0b5DmHkdj
 V25fFUZWcstI2dFs+MW5ag/Ip/8kiQbEI8Rf7JGRq6r2CPVLY9nUUfl/jaHK7N2SU9+h
 VGaLxcc8a+lR18K8ahpdVUeRqtbByUDB9wmFd9vgkBwLBmycMHsMRVGaiXxrXWwFhaIR
 QI7gnRawYuTmp+TJR8+FfffILWl2zR+1wjDKQoqYXFgLzsm/oSYtzwJZMzOC3jtHHcSz
 7vU2W/hZiNRvLg6unqKKzg0pRuJlxKHa4o+P4kKvk2KuQHWjizikMgkXF41LS87CYQam
 qlpg==
X-Gm-Message-State: AFqh2krTmgns8WtK8YZHFla2XLgPlcqxUVVvLjm18ou2SqHi9aEnFMRZ
 f1Wqu81/enH7mpCQIFndup99fvWBC8tECZpp2b0X68/5mTajl0o7G4SHVggMKyEsBLq9THpXPfM
 DytnqaajfGe3M
X-Received: by 2002:ac8:4f16:0:b0:3b6:2bbd:1785 with SMTP id
 b22-20020ac84f16000000b003b62bbd1785mr16794842qte.45.1674145270259; 
 Thu, 19 Jan 2023 08:21:10 -0800 (PST)
X-Received: by 2002:ac8:4f16:0:b0:3b6:2bbd:1785 with SMTP id
 b22-20020ac84f16000000b003b62bbd1785mr16794822qte.45.1674145270048; 
 Thu, 19 Jan 2023 08:21:10 -0800 (PST)
Received: from [192.168.8.105] (tmo-099-5.customers.d1-online.com.
 [80.187.99.5]) by smtp.gmail.com with ESMTPSA id
 v1-20020a05620a0f0100b006faf76e7c9asm24615927qkl.115.2023.01.19.08.21.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 08:21:09 -0800 (PST)
Message-ID: <baecc481-627b-2f36-4b5f-828a2a0097ee@redhat.com>
Date: Thu, 19 Jan 2023 17:21:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH 6/8] tests/qtest/libqtest: Allow checking for HVF
 accelerator
From: Thomas Huth <thuth@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Fabiano Rosas <farosas@suse.de>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org
References: <20230119100537.5114-1-philmd@linaro.org>
 <20230119100537.5114-7-philmd@linaro.org>
 <fc7802c3-afd7-2cd0-438e-7b75f4789879@redhat.com>
In-Reply-To: <fc7802c3-afd7-2cd0-438e-7b75f4789879@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-TUID: vaFQyGqaIut1

On 19/01/2023 12.24, Thomas Huth wrote:
> On 19/01/2023 11.05, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> RFC: CONFIG_HVF is poisoned.
>>
>> We could pass host config definitions to qtest using:
>>
>>    diff --git a/meson.build b/meson.build
>>    @@ -2547,6 +2547,7 @@ foreach target : target_dirs
>>
>>       accel_kconfig = []
>>       foreach sym: accelerators
>>    +    config_host_data.set(sym + '_QTEST', '')
>>         if sym == 'CONFIG_TCG' or target in accelerator_targets.get(sym, [])
>>           config_target += { sym: 'y' }
>>           config_all += { sym: 'y' }
>>
>> Then test for CONFIG_HVF_QTEST ...
> 
> I don't think that would really work well. The qtests are build once for all 
> targets, and HVF is only available in the target that matches the host 
> architecture. It's poisoned on purpose.
> 
> The TCG accelerator is special, since we have it in either none or in all 
> targets, that's why we can use CONFIG_TCG there.
> 
> The kvm part is also rather a hack... we should maybe rather additionally 
> use the "query-kvm" QAPI command to check whether it is really available...?

Scratch that ... I forgot that you already have to run with "-accel kvm" to 
see whether the accelerator is working with "query-kvm" ... so that would 
not work here for probing whether "-accel kvm" should be used or not ;-)

  Thomas

