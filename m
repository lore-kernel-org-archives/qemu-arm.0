Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp5551910wrx;
        Thu, 21 Feb 2019 01:28:37 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbYCWDCXq9UB41aRXk5yP0e2RrhcrwIB85kd41GF0Lv8s8Bqlyck2i6FI+g9L93GQ3sKkjR
X-Received: by 2002:a25:73d3:: with SMTP id o202mr279949ybc.310.1550741316978;
        Thu, 21 Feb 2019 01:28:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550741316; cv=none;
        d=google.com; s=arc-20160816;
        b=IJ1seX9bXfkCy1GMKRnSEaVBt8Z3aV12lItUn6WlF6UJ34ttjKxyaaxQZElJTssCDw
         pDsS4mmdap5xVO4rcLLmdDvFXcbD4TTREweyHBVV6DO1j/EMyx2/+ySWzMeXIDu1mIev
         lYEfTFkneswYwUrBKOlk/yd+K2Q3U4+ObhQBxLXHqEkD/4hajJtB9gdA0qCu+QFoqBOB
         OSKF6dBRQvOBCrYsc2tO4U6NzEHPAacdp03QldoFClGaf8cX0mc5UElpMsmZIxtQ4026
         NMUVYnJr21ohlJtK19auBJ7ZgmX/yq3g1LVNAvTICOq/YtchwI4qsAmEtBXyTKeiN7ZD
         PI+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=blw63M9V/EkB8Fp+Mbsat3F+YCIbNDrbbwF/6ie1Zfw=;
        b=njGHK54u06G/WT4/TyuvbSKLpKHhPMibJv6LWCyPytXTLVmDiw0nVkIFX7N2QjYBUl
         Z7OQH/8NQApHafgIWzR5fr8sIQWbPAwCCRUh2lDWv+B+3O6E2hmYmW4il7IfvHziZFwW
         z8pzJpA0c8hOD/2t0+0U5Dc3zSzglNgAVAtM5R4v+1VJfTMl3q0ZgNrHemBxjLj7s9k2
         4iiZWpnsYai7qTz01r6z3sHEgEkRxYy+RX1S3JhHngKo8xPrmjlL6IGtvoutLf/1xZSt
         21vUWnAtdOAyJx3Z/+A9x/DYO6am5zhcn7ZwjVixfpOK38bHifBA004ycJe1hzfsBTRR
         FV1g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x76si7163604ybg.490.2019.02.21.01.28.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Feb 2019 01:28:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:56989 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gwkei-0006bE-9c
	for alex.bennee@linaro.org; Thu, 21 Feb 2019 04:28:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38128)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gwkeP-0006Yw-SD
	for qemu-arm@nongnu.org; Thu, 21 Feb 2019 04:28:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gwkeL-0006f5-W4
	for qemu-arm@nongnu.org; Thu, 21 Feb 2019 04:28:15 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54568)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gwkeI-000667-4o; Thu, 21 Feb 2019 04:28:12 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 050BFE6A81;
	Thu, 21 Feb 2019 09:27:20 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8317360BFE;
	Thu, 21 Feb 2019 09:27:13 +0000 (UTC)
Date: Thu, 21 Feb 2019 10:27:11 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20190221102711.4ad80d72@redhat.com>
In-Reply-To: <8f8abcb6-6665-dc89-b836-6e9d131f6f44@redhat.com>
References: <20190205173306.20483-1-eric.auger@redhat.com>
	<20190205173306.20483-13-eric.auger@redhat.com>
	<20190218095838.048819c5@Igors-MacBook-Pro.local>
	<8f8abcb6-6665-dc89-b836-6e9d131f6f44@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 21 Feb 2019 09:27:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 12/18] hw/arm/boot: Expose
 the PC-DIMM nodes in the DT
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
	dgilbert@redhat.com, qemu-arm@nongnu.org,
	david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: POhAIgW0+gUI

On Wed, 20 Feb 2019 16:30:13 +0100
Auger Eric <eric.auger@redhat.com> wrote:

> Hi Igor,
> 
> On 2/18/19 9:58 AM, Igor Mammedov wrote:
> > On Tue,  5 Feb 2019 18:33:00 +0100
> > Eric Auger <eric.auger@redhat.com> wrote:
> >   
> >> From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> >>
> >> This patch add memory nodes corresponding to PC-DIMM regions.  
> > s/add/adds/ or s/This patch add/Add/
> >   
> >>
> >> NV_DIMM and ACPI_NVDIMM configs are not yet set for ARM so we
> >> don't need to care about NV-DIMM at this stage.
> >>
> >> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >>
> >> ---
> >> v3 -> v4:
> >> - git rid of @base and @len in fdt_add_hotpluggable_memory_nodes
> >>
> >> v1 -> v2:
> >> - added qapi_free_MemoryDeviceInfoList and simplify the loop
> >> ---
> >>  hw/arm/boot.c | 35 +++++++++++++++++++++++++++++++++++
> >>  1 file changed, 35 insertions(+)
> >>
> >> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> >> index 2ef367e15b..2a70e8aa82 100644
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
> >> @@ -526,6 +527,34 @@ static void fdt_add_psci_node(void *fdt)
> >>      qemu_fdt_setprop_cell(fdt, "/psci", "migrate", migrate_fn);
> >>  }
> >>  
> >> +static int fdt_add_hotpluggable_memory_nodes(void *fdt,
> >> +                                             uint32_t acells, uint32_t scells) {
> >> +    MemoryDeviceInfoList *info, *info_list = qmp_memory_device_list();
> >> +    MemoryDeviceInfo *mi;
> >> +    PCDIMMDeviceInfo *di;
> >> +    bool is_nvdimm;
> >> +    int ret = 0;
> >> +
> >> +    for (info = info_list; info != NULL; info = info->next) {
> >> +        mi = info->value;
> >> +        is_nvdimm = (mi->type == MEMORY_DEVICE_INFO_KIND_NVDIMM);
> >> +        di = !is_nvdimm ? mi->u.dimm.data : mi->u.nvdimm.data;
> >> +
> >> +        if (is_nvdimm) {
> >> +            ret = -ENOENT; /* NV-DIMM not yet supported */
> >> +        } else {
> >> +            ret = fdt_add_memory_node(fdt, acells, di->addr,
> >> +                                      scells, di->size, di->node);
> >> +        }
> >> +        if (ret < 0) {
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
> >> @@ -621,6 +650,12 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
> >>          }
> >>      }
> >>  
> >> +    rc = fdt_add_hotpluggable_memory_nodes(fdt, acells, scells);
> >> +    if (rc < 0) {
> >> +            fprintf(stderr, "couldn't add hotpluggable memory nodes\n");  
> > error message is rather vague, user using nvdimms + pc-dimms on CLI won't have
> > a clue that the former is not supported.
> > Suggest pass in error_fatal as argument and report more specific error from
> > fdt_add_hotpluggable_memory_nodes()
> > 
> > does this run on reboot?  
> 
> Yes after a QMP system_reset I can see the DIMMS on guest in /proc/meminfo
it siims that dimms come from ACPI and not DTB.

My worry was that arm_load_dtb() always end up with exit(1) on failure but it seems
that it's not called on reboot so it should be fine.

> 
> Thanks
> 
> Eric
> >   
> >> +            goto fail;
> >> +    }
> >> +
> >>      rc = fdt_path_offset(fdt, "/chosen");
> >>      if (rc < 0) {
> >>          qemu_fdt_add_subnode(fdt, "/chosen");  
> >   

