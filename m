Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4353585lfg;
        Tue, 2 Mar 2021 02:38:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/3gIORtxUCcJPa68vtsdyHXur2EqiUD5tUKpvqAeh6WyNi3o8ZmqP93wICDBpTrMZ2A4V
X-Received: by 2002:a25:9c02:: with SMTP id c2mr28210053ybo.402.1614681487122;
        Tue, 02 Mar 2021 02:38:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614681487; cv=none;
        d=google.com; s=arc-20160816;
        b=xWFFbYXpIghSKqg4mRU7sftZ2O1sB5rv+Vdjejvvbwo3BmAyGuJbrNV+vAbary2Bq1
         C2ONLLC+pJRa+G648e5IVYniGf0JHafMvcgB/nLFeivXPtznWnBqGFnW6CjKLEgejzUW
         3eEATJNNyeg24AMm8AlcHWePX18yw8dt4SkdpDZIFyruw8D8ADCgqZ2lzu6ZQXaf14cq
         kvd9Wz+5C8uDk2g560ffikdoYurLrhZtFhBu1YUtZOS9XBBjmJYrE1txKBua/4aqZFwo
         eKotFTSxfwm5bDFLrekTEZBv9VEKS7vL820aiRB7eCcw+IYIw53Yct4jR7VWH9DAF0W3
         XhQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:subject:organization:from:references:to:dkim-signature;
        bh=CTHHQWRcJV4w16AxX8TZ+6xlFcNj5gOYseRVR28vbBk=;
        b=uYUxUkTO1lCGABtVRKELo0fD0rUaxYAi8HLBwF8w6d1lajUxn+slTLypCnn1ysUv0R
         QVTGpGxtnkH1JLwvqVc75dSMP3AgKgYKp/cTMtU/8mrNe6TAhmNZSDeUATiOsYMdocJs
         Ax59JhnQH8hzfQPDt0tYnjLy0GlAdHBXbvbR9nZZ+B0mommmA0tfxWl2b+iznhvsUQ9f
         qlzTkEQ23RGzwrkkt3e6NH3kuZUXcz5cASfqElWQYAthY/0zFWNBdVDoNlyYJRZFN3ng
         Gd4LJsaqpuIDcwS0SZm5mJVcGvlQ/swurE9vrQpayKiDhP1EB7RCaRitGkKOT8qzIcQn
         NmVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Uol3Ztot;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b12si18376425ybq.143.2021.03.02.02.38.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Mar 2021 02:38:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Uol3Ztot;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lH2Pm-0007Jy-F0
	for alex.bennee@linaro.org; Tue, 02 Mar 2021 05:38:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lH2KI-0000J2-NC
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 05:32:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lH2KF-0002az-5M
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 05:32:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614681142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CTHHQWRcJV4w16AxX8TZ+6xlFcNj5gOYseRVR28vbBk=;
 b=Uol3ZtotrS3DHqzBjIOkEmo+6mBRpfmox8Vh/z9WNvJTcOd2dQ/B2yanMR6jjld/rQd/Y+
 39C4uHJJpTPAZjeboIUGxJTxzbwAZ0rMzzxFIJzJ+dpjGYfxkBdWTKOreNHqkE/m0AotTa
 ye7ogTTxyOMX+SkABSAzAGd0ux+bTPM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-KFL9JgxpPu2wq6aathPSAQ-1; Tue, 02 Mar 2021 05:32:20 -0500
X-MC-Unique: KFL9JgxpPu2wq6aathPSAQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41DF218B9EDF;
 Tue,  2 Mar 2021 10:32:19 +0000 (UTC)
Received: from [10.36.114.189] (ovpn-114-189.ams2.redhat.com [10.36.114.189])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4331AE144;
 Tue,  2 Mar 2021 10:32:10 +0000 (UTC)
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20210301104833.45580-1-david@redhat.com>
 <20210302100614.42acfe68@MiWiFi-RA69-srv>
 <cedb0323-ac0a-2eb5-497d-eb66a0dfefb6@redhat.com>
 <20210302045453-mutt-send-email-mst@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Subject: Re: [PATCH v1] acpi: increase maximum size for "etc/table-loader" blob
Message-ID: <86c59853-b605-2037-5f27-5ad85fdff08c@redhat.com>
Date: Tue, 2 Mar 2021 11:32:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210302045453-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@xilinx.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YSVnD0zr3heu

On 02.03.21 11:07, Michael S. Tsirkin wrote:
> On Tue, Mar 02, 2021 at 10:43:55AM +0100, David Hildenbrand wrote:
>> On 02.03.21 10:06, Igor Mammedov wrote:
>>> On Mon,  1 Mar 2021 11:48:33 +0100
>>> David Hildenbrand <david@redhat.com> wrote:
>>>
>>>> The resizeable memory region that is created for the cmd blob has a maximum
>>>> size of ACPI_BUILD_ALIGN_SIZE - 4k. This used to be sufficient, however,
>>>> as we try fitting in additional data (e.g., vmgenid, nvdimm, intel-iommu),
>>>> we require more than 4k and can crash QEMU when trying to resize the
>>>> resizeable memory region beyond its maximum size:
>>>>     $ build/qemu-system-x86_64 --enable-kvm \
>>>>         -machine q35,nvdimm=on \
>>>>         -smp 1 \
>>>>         -cpu host \
>>>>         -m size=2G,slots=8,maxmem=4G \
>>>>         -object memory-backend-file,id=mem0,mem-path=/tmp/nvdimm,size=256M \
>>>>         -device nvdimm,label-size=131072,memdev=mem0,id=nvdimm0,slot=1 \
>>>>         -nodefaults \
>>>>         -device vmgenid \
>>>>         -device intel-iommu
>>>
>>> I don't see what's here that would make cmd_blob go above 4k.
>>> can you try identify what actually fills it up (perhaps we have a hidden bug elsewhere)?
>>
>> VM initialization:
>>
>> bios_linker_loader_alloc: allocating memory for 'etc/acpi/tables'
>>   -> new table size: 128
>> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 64 - 9659
>>   -> new table size: 256
>> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>>   -> new table size: 384
>> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>>   -> new table size: 512
>> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>>   -> new table size: 640
>> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 9659 - 9903
>>   -> new table size: 768
>> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 9903 - 10023
>>   -> new table size: 896
>> bios_linker_loader_alloc: allocating memory for 'etc/vmgenid_guid'
>>   -> new table size: 1024
>> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/vmgenid_guid'
>>   -> new table size: 1280
>> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10023 - 10225
>>   -> new table size: 1408
>> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10225 - 10281
>>   -> new table size: 1536
>> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10281 - 10505
>>   -> new table size: 1664
>> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10505 - 10577
>>   -> new table size: 1792
>> bios_linker_loader_alloc: allocating memory for 'etc/acpi/nvdimm-mem'
>>   -> new table size: 1920
>> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/nvdimm-mem'
>>   -> new table size: 2048
>> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10577 - 11471
>>   -> new table size: 2176
>> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 11471 - 11695
>>   -> new table size: 2304
>> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 11695 - 11735
>>   -> new table size: 2432
>> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>>   -> new table size: 2560
>> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>>   -> new table size: 2688
>> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>>   -> new table size: 2816
>> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>>   -> new table size: 2944
>> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>>   -> new table size: 3072
>> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>>   -> new table size: 3200
>> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>>   -> new table size: 3328
>> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>>   -> new table size: 3456
>> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>>   -> new table size: 3584
>> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 11735 - 11807
>>   -> new table size: 3712
>> bios_linker_loader_alloc: allocating memory for 'etc/acpi/rsdp'
>>   -> new table size: 3840
>> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/rsdp' to 'etc/acpi/tables'
>>   -> new table size: 3968
>> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/rsdp' for range 0 - 20
>>   -> new table size: 4096
>>
>>
>> When the bios/guest boots up:
>>
>> bios_linker_loader_alloc: allocating memory for 'etc/acpi/tables'
>>   -> new table size: 128
>> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 64 - 9769
>>   -> new table size: 256
>> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>>   -> new table size: 384
>> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>>   -> new table size: 512
>> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>>   -> new table size: 640
>> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 9769 - 10013
>>   -> new table size: 768
>> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10013 - 10133
>>   -> new table size: 896
>> bios_linker_loader_alloc: allocating memory for 'etc/vmgenid_guid'
>>   -> new table size: 1024
>> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/vmgenid_guid'
>>   -> new table size: 1280
>> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10133 - 10335
>>   -> new table size: 1408
>> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10335 - 10391
>>   -> new table size: 1536
>> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10391 - 10615
>>   -> new table size: 1664
>> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10615 - 10675
>>   -> new table size: 1792
>> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10675 - 10747
>>   -> new table size: 1920
>> bios_linker_loader_alloc: allocating memory for 'etc/acpi/nvdimm-mem'
>>   -> new table size: 2048
>> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/nvdimm-mem'
>>   -> new table size: 2176
>> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10747 - 11641
>>   -> new table size: 2304
>> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 11641 - 11865
>>   -> new table size: 2432
>> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 11865 - 11905
>>   -> new table size: 2560
>> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>>   -> new table size: 2688
>> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>>   -> new table size: 2816
>> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>>   -> new table size: 2944
>> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>>   -> new table size: 3072
>> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>>   -> new table size: 3200
>> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>>   -> new table size: 3328
>> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>>   -> new table size: 3456
>> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>>   -> new table size: 3584
>> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>>   -> new table size: 3712
>> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>>   -> new table size: 3840
>> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 11905 - 11981
>>   -> new table size: 3968
>> bios_linker_loader_alloc: allocating memory for 'etc/acpi/rsdp'
>>   -> new table size: 4096
>> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/rsdp' to 'etc/acpi/tables'
>>   -> new table size: 4224
>> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/rsdp' for range 0 - 20
>>   -> new table size: 4352
> 
> yea it's because each command has space for 2 file names, so it's size
> is 128 bytes. So just 32 commands is 4k.
> 
> Question is what is the extra table and why isn't it there before boot?
> 
> -> bios_linker_loader_alloc: allocating memory for 'etc/acpi/rsdp'
> +> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>   >  -> new table size: 3840
> -> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/rsdp' to 'etc/acpi/tables'
> +> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 11905 - 11981
>   >  -> new table size: 3968
> -> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/rsdp' for range 0 - 20
> +> bios_linker_loader_alloc: allocating memory for 'etc/acpi/rsdp'
>   >  -> new table size: 4096
> +> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/rsdp' to 'etc/acpi/tables'
> +>  -> new table size: 4224
> +> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/rsdp' for range 0 - 20
> +>  -> new table size: 4352
> 
> simply put I would expect the command blob size to be the same before
> and after migration.

Seems to be the "MCFG" table. I only see that pop up when the guest boots.

It depends on acpi_get_mcfg(). When the VM is created, it is not mapped 
(mcfg->base == PCIE_BASE_ADDR_UNMAPPED), thus we don't create the table. 
Once the bios configured/mapped it (wild guess), we create the table.

Anyhow, we seem to end up > 4k in the end.

-- 
Thanks,

David / dhildenb

