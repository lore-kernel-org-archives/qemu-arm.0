Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4321509lfg;
        Tue, 2 Mar 2021 01:44:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGh4r1jhfttBtCoiyYrKxzY5iCP5dBrbBtFt1a4Th5xGxAKx2tOA1o0TJMcQYnttaWsHUa
X-Received: by 2002:a25:e010:: with SMTP id x16mr30325984ybg.17.1614678260340;
        Tue, 02 Mar 2021 01:44:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614678260; cv=none;
        d=google.com; s=arc-20160816;
        b=MmhSIuuwO4mOte69nBN4wSUGX4uYd8gyJQT3uRyhbvRATaCY4J2zC/kDvOC8SgXav9
         sMrmFEgodB9t1mq+th2pKkC8vlQGBbQAQ1sOXzj7q/JNmvrj7IgnPjmPWhfMoxuxFNkf
         9n4NzM3q9cxIEXBqp2RMhvHzAqzhPRvE63M+/DqnI/EG3VMp7IYLul3D+/66fu8AXq00
         3I1ftKVQS1qde4JP8KzEalDSihJlE+zFbm+k1+eHPR8buafnt/LDrCbBWTdJl00H1OTJ
         clbWkKMV8FhraR6iqOJXpH8ZcR28+goNd1E/ve97x0WNpPE/jyZD7pHw2n2Zph3QHPFu
         PN0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:subject:organization:from:references:to:dkim-signature;
        bh=5J4TUPfuppElJI3IQaByRHJaXBhkc7sXODOqUnDwDOM=;
        b=rJWE/ZXVW++nXWZLXB8/ga4K/+we7DPWoeq3oDWEtYQzjPQojJrnQSgHbYBebWjePy
         H4Vm+D3VhLjPoPrEWnIDrhiswJvGXMCW/sDSykeQguGrkdB/wYIrZlzfmPEgm8dthkEK
         9uEADJWROHYSMUrHOxPJRx2/lazQJSkTLuUActheeaaN1hGUdn9zmhcmpXmwhyM+ZfKy
         AxwY3/Aw7wgYSllubUUq+Jz2q02djj2Xc+IG8mgD5St8Bs0s1HzZUiaL5dWYyMsufDdf
         YKzXrimEA+OzQDTHT9/CVt9JPMTaViUK8Wjq6WUgxttidoRLgH+ttT73Sr23oRX1OLQ1
         uX5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TFzFJJCW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t9si19702708ybc.336.2021.03.02.01.44.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Mar 2021 01:44:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TFzFJJCW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lH1Zj-0001fv-LP
	for alex.bennee@linaro.org; Tue, 02 Mar 2021 04:44:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lH1Zb-0001f9-2q
 for qemu-arm@nongnu.org; Tue, 02 Mar 2021 04:44:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lH1ZY-0006zT-8Q
 for qemu-arm@nongnu.org; Tue, 02 Mar 2021 04:44:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614678247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5J4TUPfuppElJI3IQaByRHJaXBhkc7sXODOqUnDwDOM=;
 b=TFzFJJCWb98kBU8qWOvibAGXqOC09JpetFxlcr87RkIeDIOr1fRC2ypWd4E1OOH6XTFU+7
 tTU41J0KEaxXYUmtO3K/n+Cqi2tWpD/KyYJl/v2HylLuv46FPtyKe8DbvpveLJ+ZE4w/TN
 r+j2uuVtLIUxxebOq1FCUJ7QVrUaH3s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-P7NpXCIaMIqapczGD6W_8A-1; Tue, 02 Mar 2021 04:44:03 -0500
X-MC-Unique: P7NpXCIaMIqapczGD6W_8A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27391835E20;
 Tue,  2 Mar 2021 09:44:02 +0000 (UTC)
Received: from [10.36.114.189] (ovpn-114-189.ams2.redhat.com [10.36.114.189])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 80DDA1724C;
 Tue,  2 Mar 2021 09:43:56 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>
References: <20210301104833.45580-1-david@redhat.com>
 <20210302100614.42acfe68@MiWiFi-RA69-srv>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Subject: Re: [PATCH v1] acpi: increase maximum size for "etc/table-loader" blob
Message-ID: <cedb0323-ac0a-2eb5-497d-eb66a0dfefb6@redhat.com>
Date: Tue, 2 Mar 2021 10:43:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210302100614.42acfe68@MiWiFi-RA69-srv>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LeAdNXp3uzC4

On 02.03.21 10:06, Igor Mammedov wrote:
> On Mon,  1 Mar 2021 11:48:33 +0100
> David Hildenbrand <david@redhat.com> wrote:
> 
>> The resizeable memory region that is created for the cmd blob has a maximum
>> size of ACPI_BUILD_ALIGN_SIZE - 4k. This used to be sufficient, however,
>> as we try fitting in additional data (e.g., vmgenid, nvdimm, intel-iommu),
>> we require more than 4k and can crash QEMU when trying to resize the
>> resizeable memory region beyond its maximum size:
>>    $ build/qemu-system-x86_64 --enable-kvm \
>>        -machine q35,nvdimm=on \
>>        -smp 1 \
>>        -cpu host \
>>        -m size=2G,slots=8,maxmem=4G \
>>        -object memory-backend-file,id=mem0,mem-path=/tmp/nvdimm,size=256M \
>>        -device nvdimm,label-size=131072,memdev=mem0,id=nvdimm0,slot=1 \
>>        -nodefaults \
>>        -device vmgenid \
>>        -device intel-iommu
> 
> I don't see what's here that would make cmd_blob go above 4k.
> can you try identify what actually fills it up (perhaps we have a hidden bug elsewhere)?

VM initialization:

bios_linker_loader_alloc: allocating memory for 'etc/acpi/tables'
  -> new table size: 128
bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 64 - 9659
  -> new table size: 256
bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
  -> new table size: 384
bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
  -> new table size: 512
bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
  -> new table size: 640
bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 9659 - 9903
  -> new table size: 768
bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 9903 - 10023
  -> new table size: 896
bios_linker_loader_alloc: allocating memory for 'etc/vmgenid_guid'
  -> new table size: 1024
bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/vmgenid_guid'
  -> new table size: 1280
bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10023 - 10225
  -> new table size: 1408
bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10225 - 10281
  -> new table size: 1536
bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10281 - 10505
  -> new table size: 1664
bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10505 - 10577
  -> new table size: 1792
bios_linker_loader_alloc: allocating memory for 'etc/acpi/nvdimm-mem'
  -> new table size: 1920
bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/nvdimm-mem'
  -> new table size: 2048
bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10577 - 11471
  -> new table size: 2176
bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 11471 - 11695
  -> new table size: 2304
bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 11695 - 11735
  -> new table size: 2432
bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
  -> new table size: 2560
bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
  -> new table size: 2688
bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
  -> new table size: 2816
bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
  -> new table size: 2944
bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
  -> new table size: 3072
bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
  -> new table size: 3200
bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
  -> new table size: 3328
bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
  -> new table size: 3456
bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
  -> new table size: 3584
bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 11735 - 11807
  -> new table size: 3712
bios_linker_loader_alloc: allocating memory for 'etc/acpi/rsdp'
  -> new table size: 3840
bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/rsdp' to 'etc/acpi/tables'
  -> new table size: 3968
bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/rsdp' for range 0 - 20
  -> new table size: 4096


When the bios/guest boots up:

bios_linker_loader_alloc: allocating memory for 'etc/acpi/tables'
  -> new table size: 128
bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 64 - 9769
  -> new table size: 256
bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
  -> new table size: 384
bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
  -> new table size: 512
bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
  -> new table size: 640
bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 9769 - 10013
  -> new table size: 768
bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10013 - 10133
  -> new table size: 896
bios_linker_loader_alloc: allocating memory for 'etc/vmgenid_guid'
  -> new table size: 1024
bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/vmgenid_guid'
  -> new table size: 1280
bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10133 - 10335
  -> new table size: 1408
bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10335 - 10391
  -> new table size: 1536
bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10391 - 10615
  -> new table size: 1664
bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10615 - 10675
  -> new table size: 1792
bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10675 - 10747
  -> new table size: 1920
bios_linker_loader_alloc: allocating memory for 'etc/acpi/nvdimm-mem'
  -> new table size: 2048
bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/nvdimm-mem'
  -> new table size: 2176
bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10747 - 11641
  -> new table size: 2304
bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 11641 - 11865
  -> new table size: 2432
bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 11865 - 11905
  -> new table size: 2560
bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
  -> new table size: 2688
bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
  -> new table size: 2816
bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
  -> new table size: 2944
bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
  -> new table size: 3072
bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
  -> new table size: 3200
bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
  -> new table size: 3328
bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
  -> new table size: 3456
bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
  -> new table size: 3584
bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
  -> new table size: 3712
bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
  -> new table size: 3840
bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 11905 - 11981
  -> new table size: 3968
bios_linker_loader_alloc: allocating memory for 'etc/acpi/rsdp'
  -> new table size: 4096
bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/rsdp' to 'etc/acpi/tables'
  -> new table size: 4224
bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/rsdp' for range 0 - 20
  -> new table size: 4352



-- 
Thanks,

David / dhildenb

