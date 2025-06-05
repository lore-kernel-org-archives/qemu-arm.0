Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp4492461njh;
        Wed, 4 Jun 2025 19:36:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW0WrDVf7AqixrtuS0tq1mVQY2oEqMSFDyoUX1TyMhvqVIw72nBOCQObgpPlE0AZf0W8rLZYZRzQDJpJw==@linaro.org
X-Google-Smtp-Source: AGHT+IFfE3KbP8wtFh0PGbGeLkH0DOWrgZOW6JoZ4F+KLq9ivSdOTr6p029sbgq7F1M/FmdHe1LP
X-Received: by 2002:a05:6214:a10:b0:6fb:3c9:2d65 with SMTP id 6a1803df08f44-6fb03c9321dmr2774486d6.2.1749090976034;
        Wed, 04 Jun 2025 19:36:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749090976; cv=none;
        d=google.com; s=arc-20240605;
        b=bpb7G+DKla30iWCqDGONiVQ6gjinTvVz+bcGQDtPw3XbdNO8fv7LqjQgYq5rVVORJ8
         kYsNHApxYoXETUkjVUrUz2nhJc9oZ7PPxf2yp9DRCPob2gOIl/HERwgX682WobhBwOi0
         6YE9Bhf0hBKD0kgbHfr2cWHVVtltZ3qvB0dUnta40gTFAbjx6Ok0eoncjEE5JW4b7b9V
         v24xBme8Nj1tTB9oxNEIZ9uwB4z6G1wDq63mVyGztN9bBHcehRi3JXv3ZULRSkKNZaOr
         l+KKHM7T05OzW5OVTwD7qTknrNTB8/Ctnjvh50qqitk+pmdftSbfkTKieo9jCiZga8OP
         ft3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=EBC+N6dEH6cT5Fa6oWKe/1vnsNcoKLAGwdbtl/+9jMc=;
        fh=g7xlmi+fPqD9LIoys2SZi6h5XTVR16PfYSuFcHAcero=;
        b=Jk9k0ewCNLfIQXacjevuaHjs0f8UcG8H5rmr4eBJtVJE5noWlWLy+aCXkWT6Vnyfkz
         iT+B4B4316tcIEe9gKcEtDjtWcAkQpsHPrsPTe2UMNTHX3NnWci8xMZVFNYGKcDmJEUz
         TEh4izdbFt2Kl4NRtO2M0uyDUDW149OXUC2+wK9k56BkZGTCopv73zoA/Mr3hBWHUfkm
         wecH1r+N9RgM/88YN0lIoNFOImdqA+tQNzxibK8uoYKTA4eDujqC7ePut/RygPBcvO8c
         u9qhbCNw3JpHk0QsEe+RGbRbvvuJsjJyaAeARdQVK/A8CjBcrKbtRgf8SG81wT2EAFj1
         7v4A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KMub8ozm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fac6e90245si158471176d6.303.2025.06.04.19.36.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Jun 2025 19:36:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KMub8ozm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uN0SE-0000ph-Mj; Wed, 04 Jun 2025 22:35:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1uN0SC-0000ov-Ip
 for qemu-arm@nongnu.org; Wed, 04 Jun 2025 22:35:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1uN0SA-0003M3-Ea
 for qemu-arm@nongnu.org; Wed, 04 Jun 2025 22:35:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749090936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EBC+N6dEH6cT5Fa6oWKe/1vnsNcoKLAGwdbtl/+9jMc=;
 b=KMub8ozmg01vkVlwKuyK11J+B8z9dJpIXed8N5RNNA9fcBQOEdCZYpX34fGd2BPSSi7dL+
 fRMtRgDjBHyTGRZbyKeT9GFV8tsGc8Xu65cqRbsPmHxaRLfZ5jiPo7nxIKE6PC6/IpK9Ad
 8nQW+iyYjJtVQo1zwoL6rc6nIkv1xec=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-jiOVxwVPO7WCEOjHtRhKmg-1; Wed, 04 Jun 2025 22:35:35 -0400
X-MC-Unique: jiOVxwVPO7WCEOjHtRhKmg-1
X-Mimecast-MFC-AGG-ID: jiOVxwVPO7WCEOjHtRhKmg_1749090934
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c955be751aso86833285a.2
 for <qemu-arm@nongnu.org>; Wed, 04 Jun 2025 19:35:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749090934; x=1749695734;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EBC+N6dEH6cT5Fa6oWKe/1vnsNcoKLAGwdbtl/+9jMc=;
 b=OhrbnliG46WW0lqR5BWOsHCVHn7eNOkVfUKDQdtH+Wu7YJztqRijaVWMOxwFy47rBS
 ZW1CmP1lsadzzdHqTUIbrrtqhGIuZej4tbCf4igKX1lQvEhG6z+H53idD8vym3zANcsm
 nf6VwsMSNGaPzOBkno5aO8mSG8kTkFzNuKKlSB/mjGVYxm20jEShwpf8fScqf7PxY9fo
 pXMKKC/GzbZZA0t4MjsGoTgluL6v33PRpNYlLrDNp/Ju4u30raBQ6pAy05CM0dpPgkRq
 28vcwasQ5jnG6wchxu63jx46kj7Icc6/+aYx2ahA3tyH5kGlVTdihNPgcwzOhV2EsjP6
 A2JA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUsX4fE4K2c1v0nMhq1Ja2phCelO8JNtfwsZ74sHBu815DIcQtj1fXUoNiqimJhT28zzHImu+Mkw==@nongnu.org
X-Gm-Message-State: AOJu0YyrBqhDaWfhZB7vEUydJrUFz94QOZl9xXKTvvb9zePWC6d3hsr5
 QH7MsyBgdOa+EcbT1AsdP7jd6p6CvCBlmqI2ulCdzg64OIjftukC4TXjIYASZXs84JCa+WFIwea
 h9KaJdetdii5EXWuekjtxiPRjMOkBYqKgeMmhxtHap9DAdcGUoUhEJQ==
X-Gm-Gg: ASbGncvXGIdljzDkky6awvP8hS/eNk+VlP5yHlmA9y2HSmaREcrWMpKTlAdTDxqC4uO
 jHGriIqDUdIZisIwnrP89eO296fUnk5s9WwIs8U70ihP2aYmelVUhMBuJUt80yBOF8M2UCEd1oz
 bZwaz/nc1m+QoMxgHMyw47SbHuQRvZvZVaRlO+Zf5A93w1A4lS5bkeRG0yJmwUOc29xoD4tGs5d
 2WKvLKzIoBk8PhzkvSGgv5Toa0sfiXxFzXzPwj9ZlLYs9SqcprQQx7Dwijwf9xsc1W+meD90OaV
 jSUsOOOzoibr
X-Received: by 2002:a05:620a:394c:b0:7d0:9e4a:e42f with SMTP id
 af79cd13be357-7d21a8cd3b8mr786388785a.43.1749090934489; 
 Wed, 04 Jun 2025 19:35:34 -0700 (PDT)
X-Received: by 2002:a05:620a:394c:b0:7d0:9e4a:e42f with SMTP id
 af79cd13be357-7d21a8cd3b8mr786386885a.43.1749090934191; 
 Wed, 04 Jun 2025 19:35:34 -0700 (PDT)
Received: from [192.168.40.164] ([70.105.235.240])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7d09a1a7579sm1157074585a.106.2025.06.04.19.35.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jun 2025 19:35:33 -0700 (PDT)
Message-ID: <ce8a82c0-e8d9-447f-89ae-45fcafdd92e5@redhat.com>
Date: Wed, 4 Jun 2025 22:34:57 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] hw/arm/virt: Add support for user creatable SMMUv3
 device
To: Nathan Chen <nathanc@nvidia.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: eric.auger@redhat.com, peter.maydell@linaro.org, jgg@nvidia.com,
 nicolinc@nvidia.com, berrange@redhat.com, mochs@nvidia.com,
 smostafa@google.com, linuxarm@huawei.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250602154110.48392-1-shameerali.kolothum.thodi@huawei.com>
 <74d9f7a2-dbf4-48d5-bda8-847d1fc73e38@nvidia.com>
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <74d9f7a2-dbf4-48d5-bda8-847d1fc73e38@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nujJHvQSVzqvvPFv8iwNUNG_ehwMEc3LChsZvCOPwt0_1749090934
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ddutile@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.128,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SEXhTcBq3Z7D



On 6/4/25 10:02 PM, Nathan Chen wrote:
> On 6/2/2025 8:41 AM, Shameer Kolothum wrote:
>> This patch series introduces support for a user-creatable SMMUv3 device
>> (-device arm-smmuv3) in QEMU.
> 
> Tested-by: Nathan Chen <nathanc@nvidia.com>
> 
> I am able to create 16 SMMUv3 devices in a qemu VM with emulated devices properly associated with the guest SMMUs in guest sysfs - verified with some guest SMMUs having two or three emulated NICs assigned to them while other guest SMMUs have a minimum of one assigned.
> 
> Thanks,
> Nathan
> 
Nathan,
Great test!
Can you share the xml &/or qemu cmdline, to demonstrate this broad capability?
Also would be a good reference when (we know it isn't 'if') a new/different config
that wasn't tested shows a bug, and we'll have more info to work with.
Thanks,
  Don

