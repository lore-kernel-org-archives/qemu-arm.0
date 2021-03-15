Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3542225lfg;
        Mon, 15 Mar 2021 05:17:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3TadlHzvRpU3e0xduBEPVf3Hm10U901EZ2kP3rftWONPNKAsEKeX5HNL8rxNjhJCo0zmL
X-Received: by 2002:a92:d981:: with SMTP id r1mr11065232iln.98.1615810645026;
        Mon, 15 Mar 2021 05:17:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615810645; cv=none;
        d=google.com; s=arc-20160816;
        b=TNQxso8Xv4qfNnPOWL/R2bnvVgrJYpfNa/aPtsclDpohKosfbYEzA2ycB0+r80ec1W
         PHH4MnrUBtbSOyjZZmBbMjo2vfylXZbKuy6fDTrfY2vc3z5adtpVTF87cG+E2ZbETtnk
         /tNLwLYDa/gvs2b1bZeGKE1uSFb985HTYel7q14UVAjp68XuPD72lCmmh64dOWuV+MyY
         RJiupki3dMXN/bvW3iVZgofHrWoZoHtBbb7zJrImtn4c/TF929Du6kpZMfSonn/266IJ
         2DM8VQhc/t+DF6fzdJvQfc8qeUWPAqIGe58qbtzRtybOiT30qML352S7nlIb9iN/0BD/
         Lb3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:from:references:to:subject:dkim-signature;
        bh=pMIzIREFwPGUgwGpmkAZQqLD+/prQVdTXrKYpiofRYU=;
        b=ltqeoMHbUqfx9LgyB8HbIbbDmwEL7XefUPw40FRGt/PrXbgiWnzW4OyWQ6JnsvCmJ3
         p1FwPAkirLu67hGR3pXI7EBvAmM4/Fy+1Y43BSjlNsFpqSegFCM28UkaOqOA7RvxhuN4
         dc8C/CWYey4lRUh/uI00Ci1FZg6CRSbXvvzyJvuMClH+ZmxJbgwswmXaDmBnYbgpaaNN
         CyuFBwXhkuadHTzFMkrCMkAaINlndgjKBmEyzZ9k0WBGRIe4M+vRUOK80hlOlvNMaauw
         d08gKndUzWwK42Yhu6EgbY1YdFi3UzNaic7u3wmaxK0xEmSJAGheKTlAMeh1H93QxVlq
         xTjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Iam28hMN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z8si11155904ilq.142.2021.03.15.05.17.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Mar 2021 05:17:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Iam28hMN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lLmA0-0004tb-Bm
	for alex.bennee@linaro.org; Mon, 15 Mar 2021 08:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lLm8w-0004rp-OY
 for qemu-arm@nongnu.org; Mon, 15 Mar 2021 08:16:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lLm8u-0005Zi-3Q
 for qemu-arm@nongnu.org; Mon, 15 Mar 2021 08:16:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615810572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pMIzIREFwPGUgwGpmkAZQqLD+/prQVdTXrKYpiofRYU=;
 b=Iam28hMNkJD3TyqhjOcvdw/ht8Hx5r4Y6e3ZzMksm4X1mKF9oDvjbh85VepRmfj43y5KVv
 zis8Z9hM97+NqW/SmESi6DhDniqVO/guPgyxTmYLhypAmJ7K8SSAmShO1DySNewdhUFFa7
 cV+HbDh13sd75TxxDeJ9waIdkCpiCXw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-ZyCv3f_dO16CqQW6galkSw-1; Mon, 15 Mar 2021 08:16:10 -0400
X-MC-Unique: ZyCv3f_dO16CqQW6galkSw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B362C100541F;
 Mon, 15 Mar 2021 12:16:08 +0000 (UTC)
Received: from [10.36.112.200] (ovpn-112-200.ams2.redhat.com [10.36.112.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB4C719701;
 Mon, 15 Mar 2021 12:16:02 +0000 (UTC)
Subject: Re: [PATCH v3 4/4] acpi: Set proper maximum size for "etc/acpi/rsdp"
 blob
To: Igor Mammedov <imammedo@redhat.com>
References: <20210304105554.121674-1-david@redhat.com>
 <20210304105554.121674-5-david@redhat.com>
 <20210315125403.68ef8925@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <23d57ebe-32aa-b535-e0cd-c3af6232bca8@redhat.com>
Date: Mon, 15 Mar 2021 13:16:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210315125403.68ef8925@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@xilinx.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GgtPfO2Vfq7Y

On 15.03.21 12:54, Igor Mammedov wrote:
> On Thu,  4 Mar 2021 11:55:54 +0100
> David Hildenbrand <david@redhat.com> wrote:
> 
>> Let's also set a maximum size for "etc/acpi/rsdp", so the maximum
>> size doesn't get implicitly set based on the initial table size. In my
>> experiments, the table size was in the range of 22 bytes, so a single
>> page (== what we used until now) seems to be good enough.
>>
>> Now that we have defined maximum sizes for all currently used table types,
>> let's assert that we catch usage with new tables that need a proper maximum
>> size definition.
>>
>> Also assert that our initial size does not exceed the maximum size; while
>> qemu_ram_alloc_internal() properly asserts that the initial RAMBlock size
>> is <= its maximum size, the result might differ when the host page size
>> is bigger than 4k.
>>
>> Suggested-by: Laszlo Ersek <lersek@redhat.com>
>> Cc: Alistair Francis <alistair.francis@xilinx.com>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> Cc: Igor Mammedov <imammedo@redhat.com>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
>> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: Richard Henderson <richard.henderson@linaro.org>
>> Cc: Laszlo Ersek <lersek@redhat.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   hw/acpi/utils.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/acpi/utils.c b/hw/acpi/utils.c
>> index f2d69a6d92..0c486ea29f 100644
>> --- a/hw/acpi/utils.c
>> +++ b/hw/acpi/utils.c
>> @@ -29,14 +29,19 @@
>>   MemoryRegion *acpi_add_rom_blob(FWCfgCallback update, void *opaque,
>>                                   GArray *blob, const char *name)
>>   {
>> -    uint64_t max_size = 0;
>> +    uint64_t max_size;
> [...]
>> +    } else {
>> +        g_assert_not_reached();
>>       }
>> +    g_assert(acpi_data_len(blob) <= max_size);
> 
> though it's correct,
> but theoretically compiler might get unhappy about uninitialized max_size here
> 
> though if it compiles fine with our current CI it should be good enough

I think the compiler will respect g_assert_not_reached() as intended and 
suppress warnings.

For example, see block/qed.c:qed_aio_write_data() where be don't have a 
return statement on g_assert_not_reached() exit paths.

-- 
Thanks,

David / dhildenb

