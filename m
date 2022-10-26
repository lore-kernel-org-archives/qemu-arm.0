Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp215074ejn;
        Tue, 25 Oct 2022 20:57:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4zEJZ4KV+HtjRRcfrfooYvBEMiKRo1hVimbKA4X6tpOXXg4k1zL54QjrD0uBT6GEvptaFF
X-Received: by 2002:a05:6214:194c:b0:4bb:6d2f:3e7c with SMTP id q12-20020a056214194c00b004bb6d2f3e7cmr12267383qvk.4.1666756664523;
        Tue, 25 Oct 2022 20:57:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666756664; cv=none;
        d=google.com; s=arc-20160816;
        b=aK8MjzmVzeKhSZzaBTChdBjX5Tf5OSedM1K8j/bfb4C+9ezKR/78FL6AGgZAg4qW06
         44iH7VvnyRvXB9Yq5UENAjRnFdt8i067fVHcOHh/VRzW+jcvsf8uEeTYR6Er2wfl6iEF
         Q129DlpmGrQX1w705haQsXyaKkJzBUp+2XkAsEeo9oCv2p4jNcda1mRFqVDiH3dwW98q
         dWWvB2gCWc1LBmbqVg29bKY0H10m92qoP5MwS8X3Y81LxcFOHiPur4BMsIwsq9Loouou
         HSGjNod3QOIj7nqMyGg+IscH6xyPdNXFZC88ZyJ4ff6D8MWgDWiQyw6Fcq08FsymNgoy
         BQKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=s2mVMBk7srcNM8m2wQJQPyHivulHN1bjJut06BuueMQ=;
        b=mKFs/tOULpuCWYR/yJ6JdCld5WON85/V9FEw+AVphCEEahDxd0rnaZPPyLu50oEvvX
         CxYmKtqCpEjyrfKed3GCCL/HedgOaI/cwdXh+rEM+C1cBY06oGLmG98soklHORF3Q9Uq
         uQ/vQgfh6zzmU/MdhWjdXDK2BesiaxQ25htgmEbrMHqtzip9Mej3t6unVwvZGDijy681
         qZPDTyoPoDpOelRbtDzB4vingsFy7fqGmYt7j/fQLIgpv+LkfNtnqUhpx6xR05x9HTN4
         r7I67tAztfeZUCL/AISm3bYoW812bUY/Chs1GPlgEzREZmuivK9slSHcFtV3IT0XNYNG
         306A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fkP8Vjup;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l17-20020a056214029100b004bb812cbf27si2524330qvv.64.2022.10.25.20.57.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Oct 2022 20:57:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fkP8Vjup;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1onXWd-0003kq-0K; Tue, 25 Oct 2022 23:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1onXWW-0003hs-MI
 for qemu-arm@nongnu.org; Tue, 25 Oct 2022 23:56:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1onXWT-0007Zw-TQ
 for qemu-arm@nongnu.org; Tue, 25 Oct 2022 23:56:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666756568;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s2mVMBk7srcNM8m2wQJQPyHivulHN1bjJut06BuueMQ=;
 b=fkP8VjupIyiEnhAGNYNu5mxdjpdcX+wZ6sVl9gvEBA9IoxmPNDhl6aXbcoIGK8etUgo+dM
 qw7NLitZprI6hfuCbgV48qNPtrPmLMIpPaPVsntKTL8GWceuQSlAknrnD5+I6WbwkjIv7j
 d7IoeRR2KITJGwvFybgwsz8MXr0tyGE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-208-usl257YKM9istEkh0NJB6A-1; Tue, 25 Oct 2022 23:56:04 -0400
X-MC-Unique: usl257YKM9istEkh0NJB6A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 132E71C04B7D;
 Wed, 26 Oct 2022 03:56:04 +0000 (UTC)
Received: from [10.64.54.151] (vpn2-54-151.bne.redhat.com [10.64.54.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA3474A9254;
 Wed, 26 Oct 2022 03:55:58 +0000 (UTC)
Subject: Re: [PATCH v6 7/7] hw/arm/virt: Add properties to disable high memory
 regions
To: Cornelia Huck <cohuck@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org, peter.maydell@linaro.org,
 shan.gavin@gmail.com
References: <20221024035416.34068-1-gshan@redhat.com>
 <20221024035416.34068-8-gshan@redhat.com> <874jvsfa1q.fsf@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <9472b6fc-00dd-bf92-ed23-0f5a9328c45f@redhat.com>
Date: Wed, 26 Oct 2022 11:55:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <874jvsfa1q.fsf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: Gavin Shan <gshan@redhat.com>
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mb9L1+Uw5Iuq

Hi Connie,

On 10/25/22 6:54 PM, Cornelia Huck wrote:
> On Mon, Oct 24 2022, Gavin Shan <gshan@redhat.com> wrote:
> 
>> These 3 high memory regions are usually enabled by default, but
> 
> s/These 3/The/ ?
> 

Ok.

>> they may be not used. For example, VIRT_HIGH_GIC_REDIST2 isn't
>> needed by GICv2. This leads to waste in the PA space.
> 
> When building the command line, do we have enough information on when
> the regions provide something useful, and when they just waste space?
> 

I think the help messages are already indicative. For example, the help
messages for 'highmem-redist2' indicate the region is only needed by
GICv3 or GICv4. 'highmem-ecam' and 'highmem-mmio' are needed by PCI ECAM
and MMIO and the key words 'high' indicates they're the corresponding
second window.

#./qemu-system-aarch64 -M virt,?
highmem-ecam=<bool>    - Set on/off to enable/disable high memory region for PCI ECAM
highmem-mmio=<bool>    - Set on/off to enable/disable high memory region for PCI MMIO
highmem-redists=<bool> - Set on/off to enable/disable high memory region for GICv3 or GICv4 redistributor

>>
>> Add properties to allow users selectively disable them if needed:
>> "highmem-redists", "highmem-ecam", "highmem-mmio".
>>
>> Suggested-by: Marc Zyngier <maz@kernel.org>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   docs/system/arm/virt.rst | 12 ++++++++
>>   hw/arm/virt.c            | 64 ++++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 76 insertions(+)
>>
>> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
>> index 4454706392..a1668a969d 100644
>> --- a/docs/system/arm/virt.rst
>> +++ b/docs/system/arm/virt.rst
>> @@ -98,6 +98,18 @@ compact-highmem
>>     Set ``on``/``off`` to enable/disable the compact layout for high memory regions.
>>     The default is ``on`` for machine types later than ``virt-7.2``.
>>   
>> +highmem-redists
>> +  Set ``on``/``off`` to enable/disable the high memry region for GICv3/4
> 
> s/memry/memory/
> 

Ok, copy-and-paste error. Will be fixed.

>> +  redistributor. The default is ``on``.
> 
> Do we need to add a note about what effects setting this to "off" may
> have, e.g. "Setting this to ``off`` may limit the maximum number of
> cpus." or so? And/or "Setting this to ``off`` when using GICv2 will save
> some space."?
> 

We may not mention GICv2 since GICv3/v4 are already mentioned. It's a
good idea to mention that the maximum number of CPUs is reduced when
it's turned off. I will have something like below in next respin if
you agree.

highmem-redists
   Set ``on``/``off`` to enable/disable the high memroy region for GICv3 or
   GICv4 redistributor. The default is ``on``. Setting this to ``off`` will
   limit the maximum number of CPUs when GICv3 or GICv4 is used.

Since 'vms->highmem_redists' is changeable, the 'virt_max_cpus' in
machvirt_init() needs to be recalculated based on that. The code change
will be included into next respin. Besides, the follow-up error message
will be improved to something like below.

   error_report("Number of SMP CPUs requested (%d) exceeds max CPUs "
                "supported by machine 'mach-virt' (%d). The high memory "
                "region for GICv3 or GICv4 redistributor has been %s",
                max_cpus, virt_max_cpus,
                vms->highmem_redists ? "enabled" : "disabled");

>> +
>> +highmem-ecam
>> +  Set ``on``/``off`` to enable/disable the high memry region for PCI ECAM.
> 
> s/memry/memory/
> 

Ok, copy-and-paste error. Will be fixed.

>> +  The default is ``on`` for machine types later than ``virt-3.0``.
>> +
>> +highmem-mmio
>> +  Set ``on``/``off`` to enable/disable the high memry region for PCI MMIO.
> 
> s/memry/memory/
> 

Ok. copy-and-paste error. Will be fixed.

>> +  The default is ``on``.
>> +
>>   gic-version
>>     Specify the version of the Generic Interrupt Controller (GIC) to provide.
>>     Valid values are:
> 

Thanks,
Gavin

