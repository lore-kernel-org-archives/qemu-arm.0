Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp734617wrq;
        Fri, 22 Jun 2018 04:49:15 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJXU3n3Zu2o4dcda2Bs30fbm/6lK+dzPpEb32/XNFfni3xfbn42Uybsr6whKf7Yn5sN00nV
X-Received: by 2002:ac8:3456:: with SMTP id v22-v6mr1019600qtb.331.1529668155064;
        Fri, 22 Jun 2018 04:49:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529668155; cv=none;
        d=google.com; s=arc-20160816;
        b=zPDq21vwzeXrZcZx/aVhAJ+x8w+qeWQKpaCdhddFf8uiFIPfHkVHswJBIxLQDHRPf0
         eYr4J6MFOo/ZyfEbABqaZ4CdHvVCwcsNWwyQYGcPeLOBotaQFx4LT39d9kIbF+9q9FK0
         3wqahdmebnlyC3t53NIdiC29D/rVik3sRG/mPZrYfyWgz/MSM/IqRq523praiS2p9eSR
         bHJn1fipb9b/pPFs+BzWsz/XEM0X1d/hxl9ZQhJ9veSwbgU13tOCWX8cdjLuIAKVERRA
         8pEzMwsHdZJwA9RGS9I6YhIqPG/eiQ5GFYpFgE0/lyydLnYLDWwTe/IBCBvDzWejXlFG
         ZPLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=2SAxbJQvKWq5xCTfN2pAp69+oVK2uZvqiNZGF237Wzs=;
        b=snQPKu5zXxbIGa7yZ+petBPzd32sg3rBNhdidzATFXGvNJgspPG4t6zSfor3axBijY
         5aGv3dstMVQXPT99XNjss22jAqJFg8aMuSy8GE7SGZGW063b4rKHvn7/Hfhcc3Emm3YW
         GwrudPPt58cuZJK0qH7OILv4uDnUB7D3Rn8RATA3cXww0Ib1JUkYWHq4BoJGo+xMxu5x
         nA15Bk9LZ/n63di7Lguv8fi1S/LP5yENWVNmJVMHUsWowOIB3UWEOsej9zPxChgGs6qN
         zIe24SMMPjYlnyCoFE5Z9BfBx/lS9WJPwMmi6Abm/mJV4oUQk7VTxuSxlHRsihzjR0bx
         ctnA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 11-v6si5237338qtr.171.2018.06.22.04.49.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 04:49:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32988 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWKZ0-0000tt-JR
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 07:49:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35829)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fWKYn-0000sI-PH
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 07:49:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fWKYk-0001ME-MY
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 07:49:01 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:43522 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fWKYk-0001Lv-Go; Fri, 22 Jun 2018 07:48:58 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8E18E2BCA5;
	Fri, 22 Jun 2018 11:48:57 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A46D2156888;
	Fri, 22 Jun 2018 11:48:55 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1529326004-32239-1-git-send-email-eric.auger@redhat.com>
	<1529326004-32239-4-git-send-email-eric.auger@redhat.com>
	<CAFEAcA9X2ASVtcG0Nw5_Bx-rn2+M5hW7g3+QhZvhASYn9aV+SA@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <418f7043-8f4f-3b04-f771-b9e392c64d00@redhat.com>
Date: Fri, 22 Jun 2018 13:48:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9X2ASVtcG0Nw5_Bx-rn2+M5hW7g3+QhZvhASYn9aV+SA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Fri, 22 Jun 2018 11:48:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Fri, 22 Jun 2018 11:48:57 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 3/3] hw/arm/virt: Silence dtc
 /memory warning
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Eric Auger <eric.auger.pro@gmail.com>, Alexander Graf <agraf@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hzrjPs9OUYoj

Hi Peter,

On 06/22/2018 01:02 PM, Peter Maydell wrote:
> On 18 June 2018 at 13:46, Eric Auger <eric.auger@redhat.com> wrote:
>> When running dtc on the guest /proc/device-tree we get the
>> following warning: Warning (unit_address_vs_reg): Node /memory
>> has a reg or ranges property, but no unit name".
>>
>> Let's fix that by adding the unit address to the node name. We also
>> don't create the /memory node anymore in create_fdt(). We directly
>> create it in load_dtb. /chosen still needs to be created in create_fdt
>> as the uart needs it. In case the user provided his own dtb, we nop
>> all memory nodes and create new one(s).
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  hw/arm/boot.c | 34 ++++++++++++++++++++--------------
>>  hw/arm/virt.c |  7 +------
>>  2 files changed, 21 insertions(+), 20 deletions(-)
>>
>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>> index 1e48166..de80d05 100644
>> --- a/hw/arm/boot.c
>> +++ b/hw/arm/boot.c
>> @@ -490,11 +490,13 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>>                   hwaddr addr_limit, AddressSpace *as)
>>  {
>>      void *fdt = NULL;
>> -    int size, rc;
>> +    int size, rc, n = 0;
>>      uint32_t acells, scells;
>>      char *nodename;
>>      unsigned int i;
>>      hwaddr mem_base, mem_len;
>> +    char **node_path;
>> +    Error *err = NULL;
>>
>>      if (binfo->dtb_filename) {
>>          char *filename;
>> @@ -546,12 +548,22 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>>          goto fail;
>>      }
>>
>> +    /* nop all nodes matching /memory or /memory@unit-address */
>> +    node_path = qemu_fdt_node_unit_path(fdt, "memory", &err);
>> +    if (err) {
>> +        error_report_err(err);
>> +        goto fail;
>> +    }
>> +    while (node_path[n]) {
>> +        qemu_fdt_nop_node(fdt, node_path[n++]);
>> +    }
>> +    g_strfreev(node_path);
> 
> This removes all nodes named "memory" or "memory@*", rather than
> just the ones in the root, right?

correct

 Is that definitely what we want to
> do? The old code only deleted /memory, and the comment implies
> that we only look in the root.
> 
> (I'm wondering if there are DTs that use memory nodes for random
> odd things other than system memory...)

I don't know the exact use case. Removing the exact /memory@40000000
node is simpler and does not require 2/3 I think. So if this is what is
expected I can stick to that node.

To my knowledge nothing prevents from having several memory nodes. This
is what I started to do in my PC-DIMM series. You can have a single
/memory node with several reg properties in it, corresponding to several
banks or you can have several /memory nodes.
> 
>> +
>>      if (nb_numa_nodes > 0) {
>>          /*
>>           * Turn the /memory node created before into a NOP node, then create
>>           * /memory@addr nodes for all numa nodes respectively.
>>           */
>> -        qemu_fdt_nop_node(fdt, "/memory");
> 
> This code change means the comment needs updating too.
definitively :-(

Thanks

Eric

> 
>>          mem_base = binfo->loader_start;
>>          for (i = 0; i < nb_numa_nodes; i++) {
>>              mem_len = numa_info[i].node_mem;
>> @@ -572,24 +584,18 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>>              g_free(nodename);
>>          }
>>      } else {
>> -        Error *err = NULL;
>> +        nodename = g_strdup_printf("/memory@%" PRIx64, binfo->loader_start);
>> +        qemu_fdt_add_subnode(fdt, nodename);
>> +        qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
>>
>> -        rc = fdt_path_offset(fdt, "/memory");
>> -        if (rc < 0) {
>> -            qemu_fdt_add_subnode(fdt, "/memory");
>> -        }
>> -
>> -        if (!qemu_fdt_getprop(fdt, "/memory", "device_type", NULL, &err)) {
>> -            qemu_fdt_setprop_string(fdt, "/memory", "device_type", "memory");
>> -        }
>> -
>> -        rc = qemu_fdt_setprop_sized_cells(fdt, "/memory", "reg",
>> +        rc = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg",
>>                                            acells, binfo->loader_start,
>>                                            scells, binfo->ram_size);
>>          if (rc < 0) {
>> -            fprintf(stderr, "couldn't set /memory/reg\n");
>> +            fprintf(stderr, "couldn't set %s reg\n", nodename);
>>              goto fail;
>>          }
>> +        g_free(nodename);
>>      }
>>
>>      rc = fdt_path_offset(fdt, "/chosen");
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index cd0f350..71c27f1 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -200,13 +200,8 @@ static void create_fdt(VirtMachineState *vms)
>>      qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
>>      qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
>>
>> -    /*
>> -     * /chosen and /memory nodes must exist for load_dtb
>> -     * to fill in necessary properties later
>> -     */
>> +    /* /chosen must exist for load_dtb to fill in necessary properties later */
>>      qemu_fdt_add_subnode(fdt, "/chosen");
>> -    qemu_fdt_add_subnode(fdt, "/memory");
>> -    qemu_fdt_setprop_string(fdt, "/memory", "device_type", "memory");
>>
>>      /* Clock node, for the benefit of the UART. The kernel device tree
>>       * binding documentation claims the PL011 node clock properties are
>> --
>> 2.5.5
> 
> thanks
> -- PMM
> 
