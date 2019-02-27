Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp12288069wrx;
        Wed, 27 Feb 2019 06:15:45 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZ7jXIVr08bytmjzuxu+s/RLtm2tt20Vb6MfCleDDweJipcG2BhDHwp8bJBE7fCr5i8oDPl
X-Received: by 2002:a81:4f0c:: with SMTP id d12mr1254879ywb.414.1551276945753;
        Wed, 27 Feb 2019 06:15:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551276945; cv=none;
        d=google.com; s=arc-20160816;
        b=xzfpIjUqPNMSkcEt5LGduyugOXWF2bpx0oXLKa+41nyKKz+xHalOtGng79FnbVlipy
         JDE1b75O2lNytLB6qhNFB0mgUe0kumqR2LlJBzQL1VYE38f9d3LJR53DM8pXz+0WOXN6
         3/fv+HlEgbLeDQXkCivH4DkcrhzbWGgt+4tII5CeQgpWj/8+xvSsEno7FITVm0Prl6jd
         ibP5XwaYY1jmVJdQvYcqHR4jtuQmNwwznej2LA2fE3sYMA4BqgEGMUYQfFjp4iD6E2OH
         YnH0f1HP/OSi1SfyO0mYv17xP/j7/1CpwKH6KSTiAW/UlZx4/tuochXJZyjjLQpa+bdg
         WzTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=+qTRdb+tE491oOemeWfysyQyLv0zkZgaCQk+r5K9AlU=;
        b=qRFSJvPclAeQRWPujU4YFBXiGIz5CvbfeEXyB8u/9v32ToYB1EZvJADx6JHFFPZg4I
         SnmA/2tnnPUPYy/36IyvEcrf5WU3cnGsJzLZTKp8gYiErXJOq0CJ/bF7qjOWbicrEHNG
         XFceooQAMd5qmmJs449s17GY3E/ljRBg+7Ug7siC6FYnsrbqc4ppZxjsaJ0eiCf7/bZN
         p307G+TbZMDupXNebbEEV6TQ/GE2vG4cjN+1vetmCBrE3SjwyDsLZsnVu9wRyahweLBh
         JpVjN7m9XqXsMdEScASQYZSbhRLwoEH49KqxnQ2pIDZBUrbQVy1QHRrqGHBCZTA32Ctb
         w6hw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l85si5436233ywc.375.2019.02.27.06.15.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Feb 2019 06:15:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:44615 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gyzzt-0006Zx-5P
	for alex.bennee@linaro.org; Wed, 27 Feb 2019 09:15:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56363)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gyzgz-0007im-Fm
	for qemu-arm@nongnu.org; Wed, 27 Feb 2019 08:56:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gyzgy-0005ZQ-2E
	for qemu-arm@nongnu.org; Wed, 27 Feb 2019 08:56:13 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54574)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gyzgw-0005Wk-1e; Wed, 27 Feb 2019 08:56:11 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BCA6C2F9453;
	Wed, 27 Feb 2019 12:40:45 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 50EF25F9D5;
	Wed, 27 Feb 2019 12:40:36 +0000 (UTC)
Date: Wed, 27 Feb 2019 13:40:35 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20190227134035.5b8a0b98@redhat.com>
In-Reply-To: <2cd3fb96-6f46-18db-cb55-5c4e30fd3bac@redhat.com>
References: <20190226135014.31854-1-eric.auger@redhat.com>
	<20190226135014.31854-13-eric.auger@redhat.com>
	<20190226180841.0c30af3c@Igors-MacBook-Pro.local>
	<2cd3fb96-6f46-18db-cb55-5c4e30fd3bac@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 27 Feb 2019 12:40:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v8 12/18] hw/arm/boot: Expose the PC-DIMM
 nodes in the DT
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, david@redhat.com,
	qemu-devel@nongnu.org, shameerali.kolothum.thodi@huawei.com,
	dgilbert@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
	david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3m3Us/ggM2u8

On Tue, 26 Feb 2019 18:59:49 +0100
Auger Eric <eric.auger@redhat.com> wrote:

> Hi Igor,
> 
> On 2/26/19 6:08 PM, Igor Mammedov wrote:
> > On Tue, 26 Feb 2019 14:50:08 +0100
> > Eric Auger <eric.auger@redhat.com> wrote:
> >   
> >> From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> >>
> >> This patch adds memory nodes corresponding to PC-DIMM regions.
> >>
> >> NVDIMM and ACPI_NVDIMM configs are not yet set for ARM so we
> >> don't need to care about NVDIMM at this stage.
> >>
> >> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >> Reviewed-by: Igor Mammedov <imammedo@redhat.com>  
> > I'm having second thoughts on this one,
> > maybe we should drop this patch or at least not to do this by default.  
> See my reply on your cover letter remark.
Replied there.

> > In the later case it would mean some kind of property that user could use
> > to turn this on which in its own turn adds more clutter to user tunables
> > (which is not desirable). So I'm leaning more towards dropping this patch for now.  
> So what about DT support? Doesn't it make sense to support
> cold-pluggable DIMMS?
It would have a sense if initial memory was also dimms, in that case
for static cases it would be possible to describe numa mapping using
only -device, but we are far from being ale to do it yet.

So right now, I'm not sure if is there are a compelling reasons for
cold-plugged dimms, at startup time initial RAM is sufficient to do the job.
Main goal was to introduce most of infrastructure so that it would be
easier to add hotplug on top. 


> 
> Thanks
> 
> Eric
> >   
> >>
> >> ---
> >> v7 -> v8:
> >> - s/NV_DIMM/NVDIMM
> >> - fix indent
> >> v6 -> v7:
> >> - rework the error messages, use a switch/case
> >> v3 -> v4:
> >> - git rid of @base and @len in fdt_add_hotpluggable_memory_nodes
> >>
> >> v1 -> v2:
> >> - added qapi_free_MemoryDeviceInfoList and simplify the loop
> >> ---
> >>  hw/arm/boot.c | 42 ++++++++++++++++++++++++++++++++++++++++++
> >>  1 file changed, 42 insertions(+)
> >>
> >> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> >> index a830655e1a..4caaf91583 100644
> >> --- a/hw/arm/boot.c
> >> +++ b/hw/arm/boot.c
> >> @@ -19,6 +19,7 @@
> >>  #include "sysemu/numa.h"
> >>  #include "hw/boards.h"
> >>  #include "hw/loader.h"
> >> +#include "hw/mem/memory-device.h"
> >>  #include "elf.h"
> >>  #include "sysemu/device_tree.h"
> >>  #include "qemu/config-file.h"
> >> @@ -522,6 +523,41 @@ static void fdt_add_psci_node(void *fdt)
> >>      qemu_fdt_setprop_cell(fdt, "/psci", "migrate", migrate_fn);
> >>  }
> >>  
> >> +static int fdt_add_hotpluggable_memory_nodes(void *fdt,
> >> +                                             uint32_t acells, uint32_t scells) {
> >> +    MemoryDeviceInfoList *info, *info_list = qmp_memory_device_list();
> >> +    MemoryDeviceInfo *mi;
> >> +    int ret = 0;
> >> +
> >> +    for (info = info_list; info != NULL; info = info->next) {
> >> +        mi = info->value;
> >> +        switch (mi->type) {
> >> +        case MEMORY_DEVICE_INFO_KIND_DIMM:
> >> +        {
> >> +            PCDIMMDeviceInfo *di = mi->u.dimm.data;
> >> +
> >> +            ret = fdt_add_memory_node(fdt, acells, di->addr,
> >> +                                      scells, di->size, di->node);
> >> +            if (ret) {
> >> +                fprintf(stderr,
> >> +                        "couldn't add PCDIMM /memory@%"PRIx64" node\n",
> >> +                        di->addr);
> >> +                goto out;
> >> +            }
> >> +            break;
> >> +        }
> >> +        default:
> >> +            fprintf(stderr, "%s memory nodes are not yet supported\n",
> >> +                    MemoryDeviceInfoKind_str(mi->type));
> >> +            ret = -ENOENT;
> >> +            goto out;
> >> +        }
> >> +    }
> >> +out:
> >> +    qapi_free_MemoryDeviceInfoList(info_list);
> >> +    return ret;
> >> +}
> >> +
> >>  int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
> >>                   hwaddr addr_limit, AddressSpace *as)
> >>  {
> >> @@ -621,6 +657,12 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
> >>          }
> >>      }
> >>  
> >> +    rc = fdt_add_hotpluggable_memory_nodes(fdt, acells, scells);
> >> +    if (rc < 0) {
> >> +        fprintf(stderr, "couldn't add hotpluggable memory nodes\n");
> >> +        goto fail;
> >> +    }
> >> +
> >>      rc = fdt_path_offset(fdt, "/chosen");
> >>      if (rc < 0) {
> >>          qemu_fdt_add_subnode(fdt, "/chosen");  
> >   

