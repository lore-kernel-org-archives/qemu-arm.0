Received: by 2002:a0c:e741:0:0:0:0:0 with SMTP id g1csp678874qvn;
        Thu, 4 Nov 2021 10:43:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkhPprVwkZlcUIeIqK/Qcshb6K07s1Bgzo8BiB4OqoCUxuEbXZT9H04cbxjvzx0AxrQ8ij
X-Received: by 2002:a05:6830:1543:: with SMTP id l3mr3902079otp.285.1636047835049;
        Thu, 04 Nov 2021 10:43:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1636047835; cv=none;
        d=google.com; s=arc-20160816;
        b=mZ47d0ndhImwg9D9A6G0fhpDV2Ij97eJ6Lp2BFzviCLQGiXIBhSPeo6tmiLgT0jlS4
         wiQNnsKc3AKj8iU1+Boj62VEBoga5h/PrO/Zl4a7moKwReah0oDwz0AyBZKiUMVHcHF4
         geHwQh7mdr6u9qzd4TQwso5Tm5hvpR84e5b0Q/muNFN+lCOSH89/zg8Dd46oGcbh/qdx
         ctH/pwKpy+8KNfbMxdoxLEadyXgyK7e5TJayWRhg0bXEKfyPVmESx9ETZfYxf34QVq0t
         JRS8dg79bOvmFuhq/PLaaVlI46SYFym7JL4knR3QHYt0R0Qbe9g5EhaYIOI8T8BwBZH7
         qhLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=L++LmwRwGZBcsNENaV/8Fgm8RrQyRvi3omcP9luCXdg=;
        b=gQfqq4/uc8HS9TTUoMGb/2xV18BMNN9YqR2AvGfNOreFnrTxnd2Um88KInonQNFw+W
         JLMCnwBZ9pQk3a4cY5Bn2IKsabRk+PWNUxLjzItI8ypo6h7GwDO6MhnmjPQq4ZkJmg/r
         eagyXQ5WAZTsF0gFDpq9N1nBpQ/0T7V+164vr9PcI02VBPhuQlaz4U8AJdeuxOPSFbYZ
         Ag8iYCBWab6hRPTxrF3Nkye4VvHvv2V/giUrnkrhnq8/kme1ynpng5UvIYVn49f4mpVl
         ojkObPNnEqyueAuGfRr+DpI8n7hlR39m08CXhYwsJoizxU5QcEE6OVDREdu1qhmdQ2Fv
         6DOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="CLK/T5Vq";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q21si2066777oij.222.2021.11.04.10.43.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Nov 2021 10:43:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="CLK/T5Vq";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1migmI-0006Ja-0D
	for alex.bennee@linaro.org; Thu, 04 Nov 2021 13:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1migix-0003KS-N5
 for qemu-arm@nongnu.org; Thu, 04 Nov 2021 13:40:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1migiv-00050C-F8
 for qemu-arm@nongnu.org; Thu, 04 Nov 2021 13:40:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636047624;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L++LmwRwGZBcsNENaV/8Fgm8RrQyRvi3omcP9luCXdg=;
 b=CLK/T5VqgON478vT4iIMSQ7NJ5hpuw9wuyJIYHnsZvWkC+QfW8wpJlQ5AB1F48pBzmVmua
 aPckK+IvNwDk1RSzE7tBsPtIXsXWE6WP8b/kMk+rilVzHfR5jgCjhf44TKT647vkS4shJe
 FbS+sYAZe5TtEvck4e9fowi+7ZrWXfU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-crL_VBjFNaWFMC2-gJYdMg-1; Thu, 04 Nov 2021 13:40:15 -0400
X-MC-Unique: crL_VBjFNaWFMC2-gJYdMg-1
Received: by mail-wr1-f69.google.com with SMTP id
 v17-20020adfedd1000000b0017c5e737b02so1263861wro.18
 for <qemu-arm@nongnu.org>; Thu, 04 Nov 2021 10:40:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=L++LmwRwGZBcsNENaV/8Fgm8RrQyRvi3omcP9luCXdg=;
 b=JXrQy/iE1joV0RPrYCi8nP4Pm6A2MzCSCj4T/a+4yEkbE9qlM0FcaWtU2w3zhw4H8H
 d5yAnjxHsGUoz2IGZtFScv3WN42Osf+dUngfjoRyRxGnaeRAQ/z83aG9CUQ+uhUXsd0D
 QKt7UO/03CR1lJ703E4c4R3jY7m4zOZwjHj7ZdVezgr8xWMgYM88XB8Z99Usk5IqJ9B8
 Law5mqFNrBiRQCDFHDwNMxTJ64Vf5+K+SU2L8K1iJSOlM9HngPFVWXH8P0TTQKk1AeaS
 AePecqC0jMFhYXr+GaGh7TjjE2vmtaJBcOq9UBqwiIduC5WEkKn4ztMn5m3H3IqnwAKH
 KfRg==
X-Gm-Message-State: AOAM533JAdyP2uG8p1prUGQZ9bNPQCw8edxtOzZBZfybVyw9ZVdz5H9d
 xhtRGppnvfTqaDmxGjYBjxJuDjbdA1F8Hsgb3mvb35qgfx5iiKv8MsD5o7SOW7D+ZSZwsdVqRYN
 PhoBOfDwYzgzk
X-Received: by 2002:a5d:5846:: with SMTP id i6mr32719836wrf.19.1636047614796; 
 Thu, 04 Nov 2021 10:40:14 -0700 (PDT)
X-Received: by 2002:a5d:5846:: with SMTP id i6mr32719823wrf.19.1636047614658; 
 Thu, 04 Nov 2021 10:40:14 -0700 (PDT)
Received: from [192.168.1.104] (rm-19-28-6.service.infuturo.it. [151.19.28.6])
 by smtp.gmail.com with ESMTPSA id
 t8sm4692903wmn.44.2021.11.04.10.40.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Nov 2021 10:40:14 -0700 (PDT)
Subject: Re: [PATCH v5] tests: qtest: Add virtio-iommu test
To: Thomas Huth <thuth@redhat.com>, eric.auger.pro@gmail.com,
 pbonzini@redhat.com, lvivier@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, jean-philippe@linaro.org
References: <20211101184858.15223-1-eric.auger@redhat.com>
 <ab71888b-fd72-4b08-0d36-4add85ba6278@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <0f03ae53-ba78-1f87-9b85-eedb5714f8b4@redhat.com>
Date: Thu, 4 Nov 2021 18:40:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <ab71888b-fd72-4b08-0d36-4add85ba6278@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.093, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P/q6rC8NmlRD

Hi Thomas,
On 11/2/21 2:34 PM, Thomas Huth wrote:
> On 01/11/2021 19.48, Eric Auger wrote:
>> Add the framework to test the virtio-iommu-pci device
>> and tests exercising the attach/detach, map/unmap API.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Tested-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>> Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>
>> ---
>>
>> v4 -> v5:
>> - remove printf and move a comment
>> - Added Jean-Philippe's T-b and R-b
>> ---
>>   tests/qtest/libqos/meson.build    |   1 +
>>   tests/qtest/libqos/virtio-iommu.c | 126 ++++++++++++
>>   tests/qtest/libqos/virtio-iommu.h |  40 ++++
>>   tests/qtest/meson.build           |   1 +
>>   tests/qtest/virtio-iommu-test.c   | 326 ++++++++++++++++++++++++++++++
>>   5 files changed, 494 insertions(+)
>>   create mode 100644 tests/qtest/libqos/virtio-iommu.c
>>   create mode 100644 tests/qtest/libqos/virtio-iommu.h
>>   create mode 100644 tests/qtest/virtio-iommu-test.c
>
> There's another failure on Travis-CI:
>
>  https://app.travis-ci.com/github/huth/qemu/jobs/546268575#L7240
>
>  ERROR:../tests/qtest/virtio-iommu-test.c:38:pci_config:
>  assertion failed (domain_range_end == 32): (536870912 == 32)
>
> 536870912 is 0x20000000, so this is likely an endianess issue?
Hum It seems so. Thank you for reporting the issue. I think the
get_config() cb implementation in the virtio-iommu device is wrong and
needs to be fixed.
I will send a fix along with the test.

Thanks!

Eric
>
>  Thomas
>

