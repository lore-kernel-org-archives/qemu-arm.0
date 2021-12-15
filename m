Received: by 2002:a19:8c50:0:0:0:0:0 with SMTP id i16csp75756lfj;
        Wed, 15 Dec 2021 10:52:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxigJUlCvQ9SOPBXgezc77JiEDWhnA1K1KdI1EnTceaeQpSZhNJdJhibetUecHomTRKb6t2
X-Received: by 2002:a25:b599:: with SMTP id q25mr7466931ybj.618.1639594352376;
        Wed, 15 Dec 2021 10:52:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639594352; cv=none;
        d=google.com; s=arc-20160816;
        b=KyPaDHpJ7qZk72m9PxKaBdnZWuHCP2k9bmUy1Nt15oCDOt7jEjT5uJNcI2k13QY0W9
         FTR7fgLhF1Ii1rPHK2ILYAEcuJl5JhhPoiFBl3aYy9LBnNhyFxSLTlEd3ujQ32PFZZ+X
         y71097u6Fmxl/oBeE88wl2ioCbXexO3m3IlP/MpipW4rrelhAT05IzeExllEGTnd/ADa
         K5lNACwCGenoQu/eLCe9CKWRoua58XTCF0PzNJGkZmCVsENl3ZWptW19hI47uYUfvH6K
         yYZhPOB1nnFX8c0ZiUbFj6to3xoJ05A8xCl55+M9ezUJVFKvBnrWSwO3DJqY+8121a+z
         xSgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=aBk5xCr9fbCBCffCAuyfaBOmPKNPJg+oUOEHDvF+gnk=;
        b=G3XpVJaNsSDq57RthhFf2RWj7C9QdjSLustYDQZFn8k6hPKL4p+VMF0LxlepO2qLjg
         uOLQFF9Hum07NMfgbIaIqFQTIexhq/yoByeUbAKHVCxPXZZxpF16yZwoJdTsqrEw6r9/
         dGSExmKDD5SVPf6eYTUVMNlxuiHmb5Osf9Cp+9QzP+pL0fRr40SUj/WBj8MhAuzH5zQg
         A+DujVCW81SDovgRObQ1H5m7qRepEA+L30hFoSKYWX4I+57lCSrgp5/dK4P2RUPSttDQ
         9qYisMKKWLClkl+RJU00HDrrJmXEFCyJuQLb0MKa5KPgWHZGJO8OxYEVoDmfuOA+oZ5J
         ebkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="SOB/fTrQ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s193si2793807ybs.801.2021.12.15.10.52.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Dec 2021 10:52:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="SOB/fTrQ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mxZOB-0007ng-Ll
	for alex.bennee@linaro.org; Wed, 15 Dec 2021 13:52:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxXo6-0000LP-Fj
 for qemu-arm@nongnu.org; Wed, 15 Dec 2021 12:11:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxXo2-0006DV-H8
 for qemu-arm@nongnu.org; Wed, 15 Dec 2021 12:11:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639588265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aBk5xCr9fbCBCffCAuyfaBOmPKNPJg+oUOEHDvF+gnk=;
 b=SOB/fTrQhUvve/mtcmSqojFFlKTc+9L7XdWKvWQK/bXG7lc3yQ5ybjL8nPl4agZgCD2UPP
 HPy0Ceul77QGL852XjHY17MUtFL6WMKx5owpMNNS9aw0QA63WYGgAG9ss2dx4RHEjA1Yev
 VNV5vQPM4svlCeeynjTb2WUO1gPWo3I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-M6aqQ8GpM-6aTmYWLfUdaQ-1; Wed, 15 Dec 2021 12:11:04 -0500
X-MC-Unique: M6aqQ8GpM-6aTmYWLfUdaQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 r129-20020a1c4487000000b00333629ed22dso14923622wma.6
 for <qemu-arm@nongnu.org>; Wed, 15 Dec 2021 09:11:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aBk5xCr9fbCBCffCAuyfaBOmPKNPJg+oUOEHDvF+gnk=;
 b=F7Wd+ZPizZiBc7c3wVsZwBiQgkZtqP23W2ndtpAH4ptRLO3YulrqMg1EdL35gp8G8I
 JcGO3fKylJtpc33Nk1aJTFoIQdepogdPSxLhm87K6OLiT/RKDGoTDAWQhFKoAoqVGsbI
 J5mu144ZlU7JCcbspxgkuslIFX1X1LH9Iff07slYTgb0O6b/lgUp2ZS3R7pcFK1p3WqN
 XdEsOkgbEOY0oM/1OVJ67rD6O0RxRLSRdCqTNjL6Eq9RR9cc3YJuCwf5v4+dVrz1MAgJ
 ldt7ptZrwdI4m/XvUC3jKUqeDGhjOYwQ1gT1A6mLAJh2orbDQlbCjUvUUCE5nRSvc7pr
 fZRQ==
X-Gm-Message-State: AOAM5320blibD7o0pFhU6tRXv8ddx3jjQ6g4VYreUEvgtk3AsCd+4lxr
 dQ4co6uxuEvf6Z4UBOe5bKRq1e0Q0ycG5MHXi3IAAEIKbFZX1IYy6pTSKS2i4sKP3/62Id4dMvU
 IZS+RwqG5xwuY
X-Received: by 2002:a05:600c:4c96:: with SMTP id
 g22mr886286wmp.46.1639588263131; 
 Wed, 15 Dec 2021 09:11:03 -0800 (PST)
X-Received: by 2002:a05:600c:4c96:: with SMTP id
 g22mr886248wmp.46.1639588262892; 
 Wed, 15 Dec 2021 09:11:02 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id o9sm2430667wrs.4.2021.12.15.09.11.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 09:11:02 -0800 (PST)
Message-ID: <f2ea84f5-156c-7dfe-7aa0-e7848ebe1859@redhat.com>
Date: Wed, 15 Dec 2021 18:11:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC PATCH v2 3/5] exec/memattrs: Introduce MemTxAttrs::bus_perm
 field
To: Stefan Hajnoczi <stefanha@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
References: <20210823164157.751807-1-philmd@redhat.com>
 <20210823164157.751807-4-philmd@redhat.com>
 <YSTvSlU5fk8JuY0u@stefanha-x1.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <YSTvSlU5fk8JuY0u@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZWOtcnkglFuh

On 8/24/21 15:08, Stefan Hajnoczi wrote:
> On Mon, Aug 23, 2021 at 06:41:55PM +0200, Philippe Mathieu-Daudé wrote:
>> Add the 'direct_access' bit to the memory attributes to restrict
>> bus master access to ROM/RAM.
>> Have read/write accessors return MEMTX_BUS_ERROR if an access is
>> restricted and the region is not ROM/RAM ('direct').
>> Add corresponding trace events.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  include/exec/memattrs.h | 21 +++++++++++++++++++++
>>  1 file changed, 21 insertions(+)
>>
>> diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
>> index 95f2d20d55b..7a94ee75a88 100644
>> --- a/include/exec/memattrs.h
>> +++ b/include/exec/memattrs.h
>> @@ -14,6 +14,13 @@
>>  #ifndef MEMATTRS_H
>>  #define MEMATTRS_H
>>  
>> +/* Permission to restrict bus memory accesses. See MemTxAttrs::bus_perm */
>> +enum {
>> +    MEMTXPERM_UNSPECIFIED   = 0,
>> +    MEMTXPERM_UNRESTRICTED  = 1,
>> +    MEMTXPERM_RAM_DEVICE    = 2,
>> +};
>> +
>>  /* Every memory transaction has associated with it a set of
>>   * attributes. Some of these are generic (such as the ID of
>>   * the bus master); some are specific to a particular kind of
>> @@ -35,6 +42,19 @@ typedef struct MemTxAttrs {
>>      unsigned int secure:1;
>>      /* Memory access is usermode (unprivileged) */
>>      unsigned int user:1;
>> +    /*
>> +     * Bus memory access permission.
>> +     *
>> +     * Some devices (such DMA) might be restricted to only access
>> +     * some type of device, such RAM devices. By default memory
>> +     * accesses are unspecified (MEMTXPERM_UNSPECIFIED), but could be
>> +     * unrestricted (MEMTXPERM_UNRESTRICTED, similar to an allow list)
>> +     * or restricted to a type of devices (similar to a deny list).
>> +     * Currently only RAM devices can be restricted (MEMTXPERM_RAM_DEVICE).
> 
> I don't understand these 3 categories.
> 
> MEMTXPERM_UNSPECIFIED means any MemoryRegion can be accessed?

MEMTXPERM_UNSPECIFIED means no change in the current behavior.
IOW we haven't reviewed the device, and don't know whether it has
to be restricted or not.

> What does MEMTXPERM_UNRESTRICTED mean? How does this differ from
> MEMTXPERM_UNSPECIFIED?

We set MEMTXPERM_UNRESTRICTED when we reviewed a device and are sure
it can be accessed any region (even being re-entrant on itself).
I understand it like connected via a dual-port on the bus, and
allowing read *and* write accesses at the same time... So the device
is allowed to access itself, i.e. it can re-program itself in loop
and so on. IIUC this is a requested feature for this API.

> What exactly does MEMTXPERM_RAM_DEVICE mean? Maybe that only
> MemoryRegions where memory_region_is_ram() is true can be accessed?

No, it means, while we don't know which bus owner will access the
device, the device itself can only access RAMd regions on the bus.

I added MEMTXPERM_RAM_DEVICE as the first example, thinking it is
the more generic use case. But maybe it is too generic and unuseful,
and we need a real bus permission matrix?

