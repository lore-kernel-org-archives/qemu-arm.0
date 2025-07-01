Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2949263dye;
        Mon, 30 Jun 2025 23:36:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVznsvFbSYPvWi31DiE654j0UYraxNHnjs6W7wauzOYtiEUSGGoT6qxU7UOpXj/y7ueVPZnyk/MZ8ym8Q==@linaro.org
X-Google-Smtp-Source: AGHT+IE15xDDoyoqHqwj3UZ90pQHKGLlH8A10xr9f10AcCFQRpPxaNV1m8cpl+wb4UadHEf+y8Sz
X-Received: by 2002:a05:6214:4003:b0:6fa:a5f6:ffce with SMTP id 6a1803df08f44-7010a9c4834mr38890456d6.19.1751351801234;
        Mon, 30 Jun 2025 23:36:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751351801; cv=none;
        d=google.com; s=arc-20240605;
        b=SrqLqncLjpP8K8hoxOJ593k0o0gsF6X6iqRObmOCtWVn3Bu+ltw2ic6y0DLfvN+kca
         kPqIJDsKwvKLdTtYnY+lnkLyYHWcwwcFbf7sq59TTcgv8z9+ZLVvWIeHZGFMLK2YK1Bf
         Ctio9rjnTUNrFBBHmx5APq2Q4gaJyLedr+Ln3HD+2ayUKatsRu5C51YzgsCc23PjxaLE
         37I/BVacfxsZUPFocNgBkV5/0aMW51hJlUKJ8TwnwKgS75z3NjbsmDuUh+M3BTivNGS9
         ZQntT4KUdZh5G5LxqiBCFhgzrFRTDQdbOV7oF+zsUUWed5B/s3g2Mzrhl8NB3Yzm2D6J
         kcfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=HEAXJZgTb2fievGW6M0Ej3NJhxsSWJzOazjMlpWKRlI=;
        fh=olW7zLX7o9Pu8L+5QRn1sHST59wInW3/atJY9g9TtiA=;
        b=DTo0+sds6zI3ve3KPjsmPKQLYdQQjZVn15HWlCfJrTXBc74WMcVYfwa7zbVfJ1mURM
         OerTQHdLSYs5N+FBSoarzDn39V29EUCcVwBwpcR4KXXkSEeF6AwBROjrMaLZhY9jEacX
         ksPueoXDM1ZnpB1M4nDN/OoDt9u0fkmHfu/hlkNi90Gtbwgwnxt8H6sUP/lPr1U92mPc
         0M3I+GYA7+wZda+14r7gykmB6umMf6lp9WJlj2/d1jNqVNqhbIKuYAbc3+8MNsksPujT
         jjllstQjVWSW1DWcU5fagbuVlQkaZ8XVeR9BujZJSVRvXvsav6WIKjx59Am4iowkl8DD
         yeMQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gCUfozB5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd77355a86si121716546d6.211.2025.06.30.23.36.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jun 2025 23:36:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gCUfozB5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWUb8-00035o-ES; Tue, 01 Jul 2025 02:36:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uWUb5-00034u-Qk
 for qemu-arm@nongnu.org; Tue, 01 Jul 2025 02:36:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uWUb1-0002d6-Et
 for qemu-arm@nongnu.org; Tue, 01 Jul 2025 02:36:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751351756;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HEAXJZgTb2fievGW6M0Ej3NJhxsSWJzOazjMlpWKRlI=;
 b=gCUfozB5Cc/EUvpDLU9K24S6IMa/kNoAbh5rLkmDELpOofdvghAhNId4x/62nWTWqurvU1
 j4dXtjMNGBBvQb24nZdoADfqreTO78A+I/IO+LlZXcvumCAiWwbe4gTQW0NwPhrsZjuUZn
 PMMoSoaJE0W5gaix/RMGR9XkTa0Qw0s=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-aavnYfVOPa6EDh41VQlEgQ-1; Tue, 01 Jul 2025 02:35:55 -0400
X-MC-Unique: aavnYfVOPa6EDh41VQlEgQ-1
X-Mimecast-MFC-AGG-ID: aavnYfVOPa6EDh41VQlEgQ_1751351755
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a4e713e05bso1357730f8f.3
 for <qemu-arm@nongnu.org>; Mon, 30 Jun 2025 23:35:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751351754; x=1751956554;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HEAXJZgTb2fievGW6M0Ej3NJhxsSWJzOazjMlpWKRlI=;
 b=oOdZ/1N5lNLUYNDY8W/alMG0tg/Fp624RldGgpdn/fPY0QyECMo6WsvRbt1qMkCPPR
 GkBYqGC6yw4C3ZrXjWiATuc9MmQVjpeUgyT2jmImg4cnaBsdA6GCMrOwXrMQSioy1nrO
 n03N+d06ONd/zDSedd9XC7NTeKfdb4Tstu+NxTMkwlGq1C7lRgjRrc03y9YqLVvyEwGK
 hOOrI6O3qEfF0O3Zokbc9ly5fK2JX4k2hy0X0T6csmEFjOSYQ+xfy46MAfb6KbQqtomU
 ECSA/nTmz/Ww9wHulrXuIqPiUlmBKDLOtwlq0eA1iVHJMPf7qhDhFj2BoK1Znp86atjU
 sazg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvMzrzx+gtv38Nicl8gwR9+zJsABMHyIsYZYq4NS4AB09K1Llubs4XsQQMLu51NE3P+CKMoQPU+w==@nongnu.org
X-Gm-Message-State: AOJu0YwUJJzzQ4HkmEYzc/VDPxa8eMMdmAZwwXuff0jwHPNOTNlu1/7p
 981y3KjYN4Fex7hQzmBVFIeY6jiLzFTWYwMASHnEs7Pwd825JQzueAu/HZg+RKxgTH+sEJmKrfo
 I7FSCTYusMNNlcOuYlWXU6k3L1QTgNXTte3pVM/hFJ4jKYkNiYi5ReQ==
X-Gm-Gg: ASbGnctMoGquShAZmApXN0yu8qc7Y/lC/JIUYUh+/N3va99DUCJIkkjxnJ6g6ADl1Y0
 9Ccjhg1p4G3M+CiPdWc4sysLNifhHkOlrN2TjiwNfrO631BaNk9BjJE8UDAQWguo/Xxn1pJj7G2
 80XrAAPsMDnTwS05AKN3uj0utqrQiG4vo0OxCOb8ycsAmD9lSry7ZyH3p4LE7/mqyZFGkPmDTOI
 N5fub2LbhZQKPFEydsI5ImiTtSHaV5TgV8azcptR4NI8z7dfUOyVXCgHKZ5vXqMP6wkwEBXNhJI
 KRM1BGWVw9jSX9kBaA79eItirINlR55dI0uWzFU9cCmYfKWdDS1i1d4J1IHXRMYnHULS6w==
X-Received: by 2002:a05:6000:4211:b0:3a4:ff01:218a with SMTP id
 ffacd0b85a97d-3a90038ba79mr12310668f8f.50.1751351754536; 
 Mon, 30 Jun 2025 23:35:54 -0700 (PDT)
X-Received: by 2002:a05:6000:4211:b0:3a4:ff01:218a with SMTP id
 ffacd0b85a97d-3a90038ba79mr12310642f8f.50.1751351754086; 
 Mon, 30 Jun 2025 23:35:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ac6ee0d0b9sm6601661f8f.18.2025.06.30.23.35.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 23:35:53 -0700 (PDT)
Message-ID: <e8fa6035-4130-4a68-922a-67028e470bfa@redhat.com>
Date: Tue, 1 Jul 2025 08:35:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/11] qtest/bios-tables-test: Update tables for smmuv3
 tests
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "nicolinc@nvidia.com"
 <nicolinc@nvidia.com>, "ddutile@redhat.com" <ddutile@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "nathanc@nvidia.com" <nathanc@nvidia.com>,
 "mochs@nvidia.com" <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>,
 "gustavo.romero@linaro.org" <gustavo.romero@linaro.org>,
 Linuxarm <linuxarm@huawei.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
References: <20250623094230.76084-1-shameerali.kolothum.thodi@huawei.com>
 <20250623094230.76084-12-shameerali.kolothum.thodi@huawei.com>
 <43abd1f9-0b5d-4824-82a5-dcce5b323749@redhat.com>
 <690db58e248a46dd83c641b9ec4ac616@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <690db58e248a46dd83c641b9ec4ac616@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -mudt2yrQ_x00Jvt2ReF4z8PhZaC77YmZu3rIRTKuIQ_1751351755
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.237, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Uu8jOQBcA0IU



On 6/30/25 9:11 AM, Shameerali Kolothum Thodi wrote:
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: Friday, June 27, 2025 1:36 PM
>> To: Shameerali Kolothum Thodi
>> <shameerali.kolothum.thodi@huawei.com>; qemu-arm@nongnu.org;
>> qemu-devel@nongnu.org
>> Cc: peter.maydell@linaro.org; jgg@nvidia.com; nicolinc@nvidia.com;
>> ddutile@redhat.com; berrange@redhat.com; imammedo@redhat.com;
>> nathanc@nvidia.com; mochs@nvidia.com; smostafa@google.com;
>> gustavo.romero@linaro.org; Linuxarm <linuxarm@huawei.com>; Wangzhou
>> (B) <wangzhou1@hisilicon.com>; jiangkunkun <jiangkunkun@huawei.com>;
>> Jonathan Cameron <jonathan.cameron@huawei.com>;
>> zhangfei.gao@linaro.org
>> Subject: Re: [PATCH v5 11/11] qtest/bios-tables-test: Update tables for
>> smmuv3 tests
>>
>> Hi Shameer,
>>
>> On 6/23/25 11:42 AM, Shameer Kolothum wrote:
>>> For the legacy smmuv3 test case, IORT has a single SMMUV3 node and a
>>> Root Complex node with three ID mappings of which two points to the
>>> SMMUv3 node and the remaining one points to ITS.
>> You don't describe DSDT at all below, just IORT. I don't know whether it is
>> mandated though
> I don't think DSDT is required as the code changes we want to test is
> IORT related only.

OK. Then I would add in the commit msg the DSDT is not impacted by the
way the SMMU is instantiated.

Thanks

Eric
>
>>> ...
>>> [030h 0048   1]                         Type : 00
>>> [031h 0049   2]                       Length : 0018
>>> [033h 0051   1]                     Revision : 01
>>> [034h 0052   4]                   Identifier : 00000000
>>> [038h 0056   4]                Mapping Count : 00000000
>>> [03Ch 0060   4]               Mapping Offset : 00000000
>>>
>>> [040h 0064   4]                     ItsCount : 00000001
>>> [044h 0068   4]                  Identifiers : 00000000
>>>
>>> [048h 0072   1]                         Type : 04
>>> [049h 0073   2]                       Length : 0058
>>> [04Bh 0075   1]                     Revision : 04
>>> [04Ch 0076   4]                   Identifier : 00000001
>>> [050h 0080   4]                Mapping Count : 00000001
>>> [054h 0084   4]               Mapping Offset : 00000044
>>>
>>> [058h 0088   8]                 Base Address : 0000000009050000
>>> [060h 0096   4]        Flags (decoded below) : 00000001
>>>                              COHACC Override : 1
>>>                                HTTU Override : 0
>>>                       Proximity Domain Valid : 0
>>> [064h 0100   4]                     Reserved : 00000000
>>> [068h 0104   8]                VATOS Address : 0000000000000000
>>> [070h 0112   4]                        Model : 00000000
>>> [074h 0116   4]                   Event GSIV : 0000006A
>>> [078h 0120   4]                     PRI GSIV : 0000006B
>>> [07Ch 0124   4]                    GERR GSIV : 0000006D
>>> [080h 0128   4]                    Sync GSIV : 0000006C
>>> [084h 0132   4]             Proximity Domain : 00000000
>>> [088h 0136   4]      Device ID Mapping Index : 00000000
>>>
>>> [08Ch 0140   4]                   Input base : 00000000
>>> [090h 0144   4]                     ID Count : 0000FFFF
>>> [094h 0148   4]                  Output Base : 00000000
>>> [098h 0152   4]             Output Reference : 00000030
>>> [09Ch 0156   4]        Flags (decoded below) : 00000000
>>>                               Single Mapping : 0
>>>
>>> [0A0h 0160   1]                         Type : 02
>>> [0A1h 0161   2]                       Length : 0074
>>> [0A3h 0163   1]                     Revision : 03
>>> [0A4h 0164   4]                   Identifier : 00000002
>>> [0A8h 0168   4]                Mapping Count : 00000004
>>> [0ACh 0172   4]               Mapping Offset : 00000024
>>>
>>> [0B0h 0176   8]            Memory Properties : [IORT Memory Access
>> Properties]
>>> [0B0h 0176   4]              Cache Coherency : 00000001
>>> [0B4h 0180   1]        Hints (decoded below) : 00
>>>                                    Transient : 0
>>>                               Write Allocate : 0
>>>                                Read Allocate : 0
>>>                                     Override : 0
>>> [0B5h 0181   2]                     Reserved : 0000
>>> [0B7h 0183   1] Memory Flags (decoded below) : 03
>>>                                    Coherency : 1
>>>                             Device Attribute : 1
>>> [0B8h 0184   4]                ATS Attribute : 00000000
>>> [0BCh 0188   4]           PCI Segment Number : 00000000
>>> [0C0h 0192   1]            Memory Size Limit : 40
>>> [0C1h 0193   2]           PASID Capabilities : 0000
>>> [0C3h 0195   1]                     Reserved : 00
>>>
>>> [0C4h 0196   4]                   Input base : 00000000
>>> [0C8h 0200   4]                     ID Count : 000001FF
>>> [0CCh 0204   4]                  Output Base : 00000000
>>> [0D0h 0208   4]             Output Reference : 00000048
>>> [0D4h 0212   4]        Flags (decoded below) : 00000000
>>>                               Single Mapping : 0
>>>
>>> [0D8h 0216   4]                   Input base : 00001000
>>> [0DCh 0220   4]                     ID Count : 000000FF
>>> [0E0h 0224   4]                  Output Base : 00001000
>>> [0E4h 0228   4]             Output Reference : 00000048
>>> [0E8h 0232   4]        Flags (decoded below) : 00000000
>>>                               Single Mapping : 0
>>>
>>> [0ECh 0236   4]                   Input base : 00000200
>>> [0F0h 0240   4]                     ID Count : 00000DFF
>>> [0F4h 0244   4]                  Output Base : 00000200
>>> [0F8h 0248   4]             Output Reference : 00000030
>>> [0FCh 0252   4]        Flags (decoded below) : 00000000
>>>                               Single Mapping : 0
>>>
>>> [100h 0256   4]                   Input base : 00001100
>>> [104h 0260   4]                     ID Count : 0000EEFF
>>> [108h 0264   4]                  Output Base : 00001100
>>> [10Ch 0268   4]             Output Reference : 00000030
>>> [110h 0272   4]        Flags (decoded below) : 00000000
>>>                               Single Mapping : 0
>>>
>>> For the smmuv3-dev test case, IORT has two SMMUV3 nodes and a Root
>>> Complex node with ID mappings of which two points to two different
>>> SMMUv3 nodes and remianining ones pointing
>> remaining. Still difficult to parse for me ;-)
> Ok 😊. I will rephrase as suggested in the previous one.
>
> Thanks,
> Shameer

