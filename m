Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp2674432lfg;
        Mon, 3 May 2021 07:08:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzesrirB7YmlnpS1nQYKUz3WdWUn2UciIxemkZ9K2S5uUekQTGVYEWN+ns7xhJEgf++/cCb
X-Received: by 2002:a05:6602:3415:: with SMTP id n21mr14818342ioz.120.1620050879811;
        Mon, 03 May 2021 07:07:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620050879; cv=none;
        d=google.com; s=arc-20160816;
        b=lydUsUR6nLPnLZSmQQ5PN2OprbOFK7OOLmzZ6roaYppMJDOe5mMjoICh6zTIGZMvIL
         DVSrZ9/5FZx1SrVl9qXjWrTMXE1OdZDXceQ8Q8qowu+ol3UyMOPok+ySP3jgKNJ/LdO3
         WOmMcIhI8LNmozpAeMURMr5V2dgVAAUyrkoYYhi2Mtff+v96HHlWwI3PptqEIng/9sLe
         iYM4yVEmb2MMtftRxEatJXD4wUDmnFXlgGcdoRrPYHFheR9R0riJprg6dl9n4ZFL+VcR
         er7gcCbOHGdFLNOwgjLvcz+mpNTgVRNMJM20AkZjps4AzVvxG2zp4vwtIBFvq8AWWhgT
         2jLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:in-reply-to:user-agent
         :date:message-id:from:references:to:subject:dkim-signature;
        bh=Ub82Zb+3cNGTmoNKsbzlVfaHCGXa/5g9YCQb43mnMl0=;
        b=LcoIy/BA5j+9UDaBr93icWz6ZhFieLTZjRvCk5W0bEeIBuLDqIhjeC+r1B6rUEh0fl
         YLsjPRxxTLTalIqOUbMhHcV65FEhUpqqYtH/Wo1l7BtlnVUItoa9lOznAVXDObOorfSs
         QxHBCK1HbwWdWP5/q7C5vWwuoGKnRP0QfxqTO46XgpytD9JOBq1beJJZB8frEBqUmj81
         im43gZUpb6iY+eG5ylXpeVhoom1TW+by2JgGHyoJT+NFkhZRuhQ02WyVuQ2YqtY7YOe/
         kfCL9Z3nEIVON3HSXT58OZ59eerqzdjqZR9CF18URDxxJzVI88JQTiXREeDZlO1Grpji
         Pcmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ibm.com header.s=pp1 header.b=SM4i+xEX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j2si15979603iow.4.2021.05.03.07.07.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 May 2021 07:07:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ibm.com header.s=pp1 header.b=SM4i+xEX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:41980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ldZEt-0004y1-0o
	for alex.bennee@linaro.org; Mon, 03 May 2021 10:07:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1ldZCx-0003vQ-EA; Mon, 03 May 2021 10:05:59 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:54036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1ldZCp-0005jQ-Fn; Mon, 03 May 2021 10:05:59 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 143E4cZ1010692; Mon, 3 May 2021 10:05:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Ub82Zb+3cNGTmoNKsbzlVfaHCGXa/5g9YCQb43mnMl0=;
 b=SM4i+xEXBBCmeeUJl4dGq/OTydqA4GWa5UTgrPqq7HakY2P4SGdW/+F/bE8uDznW90j9
 3lGRgkR0zoYJQzA8mXHgBe9bu1VhulCJMaKvqDoI8+MG8Tj46aggF8NHjy7wYheyw0xI
 XwIGgqBH9bHlbbuAdCBE74BNENgWjDqB3k6cOXsWkjYoqxZSNghIGkWMaY/EuuD419pk
 BkxAYtVb9+XiYNxYhcaVf7Vx8p2AAJTPFnJUlwW1f2BMmkSM9RRPHp7kS95ijkDwixvG
 L82ngaoptvkLUVj92NV1h5si1nIzpyfkz16rR5FSzvmFksQDAOAupSmngNK9yAE33IRA Dw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38aj1s12j9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 10:05:33 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 143E4k8R011488;
 Mon, 3 May 2021 10:05:33 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38aj1s12ha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 10:05:33 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 143E3LVA020317;
 Mon, 3 May 2021 14:05:30 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 388xm8rrcb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 14:05:30 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 143E5RIO22675926
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 May 2021 14:05:27 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 72037AE059;
 Mon,  3 May 2021 14:05:27 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C43BAE058;
 Mon,  3 May 2021 14:05:22 +0000 (GMT)
Received: from [9.102.24.175] (unknown [9.102.24.175])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  3 May 2021 14:05:22 +0000 (GMT)
Subject: Re: [PATCH v4 0/3] nvdimm: Enable sync-dax property for nvdimm
To: Dan Williams <dan.j.williams@intel.com>
References: <161966810162.652.13723419108625443430.stgit@17be908f7c1c>
 <CAPcyv4gwkyDBG7EZOth-kcZR8Fb+RgGXY=Y9vbuHXAz3PAnLVw@mail.gmail.com>
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Message-ID: <bca3512d-5437-e8e6-68ae-0c9b887115f9@linux.ibm.com>
Date: Mon, 3 May 2021 19:35:21 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <CAPcyv4gwkyDBG7EZOth-kcZR8Fb+RgGXY=Y9vbuHXAz3PAnLVw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TDjsG8pL4Yzek7UVYO-MoCo6_XkVPZeK
X-Proofpoint-ORIG-GUID: d6OOTyIyZHWDsza4bb-2GnoBTlwiTCgT
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-03_10:2021-05-03,
 2021-05-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2105030096
Received-SPF: pass client-ip=148.163.156.1; envelope-from=sbhat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Qemu Developers <qemu-devel@nongnu.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, bharata@linux.vnet.ibm.com,
 Haozhong Zhang <haozhong.zhang@intel.com>,
 Eduardo Habkost <ehabkost@redhat.com>, richard.henderson@linaro.org,
 Greg Kurz <groug@kaod.org>, kvm-ppc@vger.kernel.org, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 kwangwoo.lee@sk.com, David Gibson <david@gibson.dropbear.id.au>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 shameerali.kolothum.thodi@huawei.com, shivaprasadbhat@gmail.com,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +7sdwdDzxrk3


On 5/1/21 12:44 AM, Dan Williams wrote:
> Some corrections to terminology confusion below...
>
>
> On Wed, Apr 28, 2021 at 8:49 PM Shivaprasad G Bhat <sbhat@linux.ibm.com> wrote:
>> The nvdimm devices are expected to ensure write persistence during power
>> failure kind of scenarios.
> No, QEMU is not expected to make that guarantee. QEMU is free to lie
> to the guest about the persistence guarantees of the guest PMEM
> ranges. It's more accurate to say that QEMU nvdimm devices can emulate
> persistent memory and optionally pass through host power-fail
> persistence guarantees to the guest. The power-fail persistence domain
> can be one of "cpu_cache", or "memory_controller" if the persistent
> memory region is "synchronous". If the persistent range is not
> synchronous, it really isn't "persistent memory"; it's memory mapped
> storage that needs I/O commands to flush.

Since this is virtual nvdimm(v-nvdimm) backed by a file, and the data is 
completely

in the host pagecache, and we need a way to ensure that host pagecaches

are flushed to the backend. This analogous to the WPQ flush being offloaded

to the hypervisor.


Ref: https://github.com/dgibson/qemu/blob/main/docs/nvdimm.txt


>
>> The libpmem has architecture specific instructions like dcbf on POWER
> Which "libpmem" is this? PMDK is a reference library not a PMEM
> interface... maybe I'm missing what libpmem has to do with QEMU?


I was referrering to semantics of flushing pmem cache lines as in

PMDK/libpmem.


>
>> to flush the cache data to backend nvdimm device during normal writes
>> followed by explicit flushes if the backend devices are not synchronous
>> DAX capable.
>>
>> Qemu - virtual nvdimm devices are memory mapped. The dcbf in the guest
>> and the subsequent flush doesn't traslate to actual flush to the backend
> s/traslate/translate/
>
>> file on the host in case of file backed v-nvdimms. This is addressed by
>> virtio-pmem in case of x86_64 by making explicit flushes translating to
>> fsync at qemu.
> Note that virtio-pmem was a proposal for a specific optimization of
> allowing guests to share page cache. The virtio-pmem approach is not
> to be confused with actual persistent memory.
>
>> On SPAPR, the issue is addressed by adding a new hcall to
>> request for an explicit flush from the guest ndctl driver when the backend
> What is an "ndctl" driver? ndctl is userspace tooling, do you mean the
> guest pmem driver?


oops, wrong terminologies. I was referring to guest libnvdimm and

papr_scm kernel modules.


>
>> nvdimm cannot ensure write persistence with dcbf alone. So, the approach
>> here is to convey when the hcall flush is required in a device tree
>> property. The guest makes the hcall when the property is found, instead
>> of relying on dcbf.
>>
>> A new device property sync-dax is added to the nvdimm device. When the
>> sync-dax is 'writeback'(default for PPC), device property
>> "hcall-flush-required" is set, and the guest makes hcall H_SCM_FLUSH
>> requesting for an explicit flush.
> I'm not sure "sync-dax" is a suitable name for the property of the
> guest persistent memory.


sync-dax property translates ND_REGION_ASYNC flag being set/unset

for the pmem region also if the nvdimm_flush callback is provided in the

papr_scm or not. As everything boils down to synchronous nature

of the device, I chose sync-dax for the name.


>   There is no requirement that the
> memory-backend file for a guest be a dax-capable file. It's also
> implementation specific what hypercall needs to be invoked for a given
> occurrence of "sync-dax". What does that map to on non-PPC platforms
> for example?


The backend file can be dax-capable, to be hinted using "sync-dax=direct".

When the backend is not dax-capable, the "sync-dax=writeback" to used,

so that the guest makes the hcall. On all non-PPC archs, with the

"sync-dax=writeback" qemu errors out stating the lack of support.


>   It seems to me that an "nvdimm" device presents the
> synchronous usage model and a whole other device type implements an
> async-hypercall setup that the guest happens to service with its
> nvdimm stack, but it's not an "nvdimm" anymore at that point.


In case the file backing the v-nvdimm is not dax-capable, we need flush

semantics on the guest to be mapped to pagecache flush on the host side.


>
>> sync-dax is "unsafe" on all other platforms(x86, ARM) and old pseries machines
>> prior to 5.2 on PPC. sync-dax="writeback" on ARM and x86_64 is prevented
>> now as the flush semantics are unimplemented.
> "sync-dax" has no meaning on its own, I think this needs an explicit
> mechanism to convey both the "not-sync" property *and* the callback
> method, it shouldn't be inferred by arch type.


Yes. On all platforms the "sync-dax=unsafe" meaning - with host power

failure the host pagecache is lost and subsequently data written by the

guest will also be gone. This is the default for non-PPC.


On PPC, the default is "sync-dax=writeback" - so the ND_REGION_ASYNC

is set for the region and the guest makes hcalls to issue fsync on the host.


Are you suggesting me to keep it "unsafe" as default for all architectures

including PPC and a user can set it to "writeback" if desired.


>
>> When the backend file is actually synchronous DAX capable and no explicit
>> flushes are required, the sync-dax mode 'direct' is to be used.
>>
>> The below demonstration shows the map_sync behavior with sync-dax writeback &
>> direct.
>> (https://github.com/avocado-framework-tests/avocado-misc-tests/blob/master/memory/ndctl.py.data/map_sync.c)
>>
>> The pmem0 is from nvdimm with With sync-dax=direct, and pmem1 is from
>> nvdimm with syn-dax=writeback, mounted as
>> /dev/pmem0 on /mnt1 type xfs (rw,relatime,attr2,dax=always,inode64,logbufs=8,logbsize=32k,noquota)
>> /dev/pmem1 on /mnt2 type xfs (rw,relatime,attr2,dax=always,inode64,logbufs=8,logbsize=32k,noquota)
>>
>> [root@atest-guest ~]# ./mapsync /mnt1/newfile ----> When sync-dax=unsafe/direct
>> [root@atest-guest ~]# ./mapsync /mnt2/newfile ----> when sync-dax=writeback
>> Failed to mmap  with Operation not supported
>>
>> The first patch does the header file cleanup necessary for the
>> subsequent ones. Second patch implements the hcall, adds the necessary
>> vmstate properties to spapr machine structure for carrying the hcall
>> status during save-restore. The nature of the hcall being asynchronus,
>> the patch uses aio utilities to offload the flush. The third patch adds
>> the 'sync-dax' device property and enables the device tree property
>> for the guest to utilise the hcall.
>>
>> The kernel changes to exploit this hcall is at
>> https://github.com/linuxppc/linux/commit/75b7c05ebf9026.patch
>>
>> ---
>> v3 - https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg07916.html
>> Changes from v3:
>>        - Fixed the forward declaration coding guideline violations in 1st patch.
>>        - Removed the code waiting for the flushes to complete during migration,
>>          instead restart the flush worker on destination qemu in post load.
>>        - Got rid of the randomization of the flush tokens, using simple
>>          counter.
>>        - Got rid of the redundant flush state lock, relying on the BQL now.
>>        - Handling the memory-backend-ram usage
>>        - Changed the sync-dax symantics from on/off to 'unsafe','writeback' and 'direct'.
>>          Added prevention code using 'writeback' on arm and x86_64.
>>        - Fixed all the miscellaneous comments.
>>
>> v2 - https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg07031.html
>> Changes from v2:
>>        - Using the thread pool based approach as suggested
>>        - Moved the async hcall handling code to spapr_nvdimm.c along
>>          with some simplifications
>>        - Added vmstate to preserve the hcall status during save-restore
>>          along with pre_save handler code to complete all ongoning flushes.
>>        - Added hw_compat magic for sync-dax 'on' on previous machines.
>>        - Miscellanious minor fixes.
>>
>> v1 - https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg06330.html
>> Changes from v1
>>        - Fixed a missed-out unlock
>>        - using QLIST_FOREACH instead of QLIST_FOREACH_SAFE while generating token
>>
>> Shivaprasad G Bhat (3):
>>        spapr: nvdimm: Forward declare and move the definitions
>>        spapr: nvdimm: Implement H_SCM_FLUSH hcall
>>        nvdimm: Enable sync-dax device property for nvdimm
>>
>>
>>   hw/arm/virt.c                 |   28 ++++
>>   hw/i386/pc.c                  |   28 ++++
>>   hw/mem/nvdimm.c               |   52 +++++++
>>   hw/ppc/spapr.c                |   16 ++
>>   hw/ppc/spapr_nvdimm.c         |  285 +++++++++++++++++++++++++++++++++++++++++
>>   include/hw/mem/nvdimm.h       |   11 ++
>>   include/hw/ppc/spapr.h        |   11 +-
>>   include/hw/ppc/spapr_nvdimm.h |   27 ++--
>>   qapi/common.json              |   20 +++
>>   9 files changed, 455 insertions(+), 23 deletions(-)
>>
>> --
>> Signature
>> _______________________________________________
>> Linux-nvdimm mailing list -- linux-nvdimm@lists.01.org
>> To unsubscribe send an email to linux-nvdimm-leave@lists.01.org
> _______________________________________________
> Linux-nvdimm mailing list -- linux-nvdimm@lists.01.org
> To unsubscribe send an email to linux-nvdimm-leave@lists.01.org
