Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1651491wru;
        Thu, 9 Aug 2018 01:58:02 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwGHF2z3cDhxVuyltXMdLywX7XJI49dSRWjgUbAnoCFlRxWSCHW7NwngobTOyt5EDTkITDG
X-Received: by 2002:aed:3dd3:: with SMTP id j19-v6mr1037909qtf.159.1533805082761;
        Thu, 09 Aug 2018 01:58:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533805082; cv=none;
        d=google.com; s=arc-20160816;
        b=w0/KPqtFy+wvCXtxchrX9KnqzyJyW5w3MBsvYLRIdKVplfzOKw6ltjfFz/7lSuLe2g
         rA6QwVkkpXurqOTGlm7rYBJcb1dvjGddUVks6y1PZPGE/rVUydtYMLD1V7iETKAfU06E
         Ve5JDfQ7QnurQJsVirV8liOTA6SMH2cmfSWF5PM02mXj66jhUOxQyHAbHdXro45u6bcp
         HvS5BIvJ1uzLZo6AvqgbAxq0m2TbbxutmB/aRi6Ydx45gRUm68nusoFxDDmijYnfLQuQ
         ina4wHgsbPjeVj4fbb04JRxNeEkhxTwBFaLb3nylyqN0QjromgHkhUiTAJBbN8bzQM2M
         HGXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=dqX8VONb2ryczEJ45uSpvLcyDV2L+xS+OfWWkQWBquk=;
        b=pxYnCa0Q+5PMClpMp8bLHKX5rHUBwimcLNssfPcIfH5jksTYrz6M2G4FrKyYPHjzT/
         ZcBdbBuOBrqHl5IwjQF4L3i/lo3aeCvV0RYVjK/Ix1V4rTYji7MMeRzICFE+uMadVFT0
         pnYqxubnZi/cwYFBbFOvKD99l1ilje/4LsRvi53xXr+lEaN0fy9i4t9vTgIGivQLPOdN
         a+xBwOpweqJa97tnbXLMhRJ5hRafErpzMH8owdGUFE1FPVBkt8oKI3qqS3ngCbxdi2yU
         Gtnwxsb6bLDWRWGMZGp5ehaayYpKpq2KM9UH3XeaiA2xfgqM0XxGu0i6ib4qP1Ojb3E/
         GSPw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k66-v6si5555819qkb.65.2018.08.09.01.58.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Aug 2018 01:58:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48752 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fngle-0001vF-CO
	for alex.bennee@linaro.org; Thu, 09 Aug 2018 04:58:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40155)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fnglX-0001v4-1Z
	for qemu-arm@nongnu.org; Thu, 09 Aug 2018 04:57:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fnglT-0002W6-5d
	for qemu-arm@nongnu.org; Thu, 09 Aug 2018 04:57:55 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56040 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1fnglS-0002Vi-V2; Thu, 09 Aug 2018 04:57:51 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 25DF1402333A;
	Thu,  9 Aug 2018 08:57:50 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 50EB42026D68;
	Thu,  9 Aug 2018 08:57:48 +0000 (UTC)
Date: Thu, 9 Aug 2018 10:57:46 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20180809105746.78156191@redhat.com>
In-Reply-To: <ff206af7-91fb-1ed7-9f92-c24980044254@redhat.com>
References: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
	<1530602398-16127-9-git-send-email-eric.auger@redhat.com>
	<20180718160413.5c4dc514@redhat.com>
	<ff206af7-91fb-1ed7-9f92-c24980044254@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Thu, 09 Aug 2018 08:57:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Thu, 09 Aug 2018 08:57:50 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [RFC v3 08/15] hw/arm/boot: introduce
 fdt_add_memory_node helper
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
	dgilbert@redhat.com, agraf@suse.de, qemu-arm@nongnu.org,
	david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c0A9URub1mQw

On Wed, 8 Aug 2018 11:44:14 +0200
Auger Eric <eric.auger@redhat.com> wrote:

> Hi Igor,
> 
> On 07/18/2018 04:04 PM, Igor Mammedov wrote:
> > On Tue,  3 Jul 2018 09:19:51 +0200
> > Eric Auger <eric.auger@redhat.com> wrote:
> >   
> >> From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> >>
> >> We introduce an helper to create a memory node.
> >>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> >>
> >> ---
> >>
> >> v1 -> v2:
> >> - nop of existing /memory nodes was already handled
> >> ---
> >>  hw/arm/boot.c | 54 ++++++++++++++++++++++++++++++++++--------------------
> >>  1 file changed, 34 insertions(+), 20 deletions(-)
> >>
> >> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> >> index e09201c..5243a25 100644
> >> --- a/hw/arm/boot.c
> >> +++ b/hw/arm/boot.c
> >> @@ -413,6 +413,36 @@ static void set_kernel_args_old(const struct arm_boot_info *info,
> >>      }
> >>  }
> >>  
> >> +static int fdt_add_memory_node(void *fdt, uint32_t acells, hwaddr mem_base,
> >> +                               uint32_t scells, hwaddr mem_len,
> >> +                               int numa_node_id)
> >> +{
> >> +    char *nodename = NULL;
> >> +    int ret;
> >> +
> >> +    nodename = g_strdup_printf("/memory@%" PRIx64, mem_base);
> >> +    qemu_fdt_add_subnode(fdt, nodename);
> >> +    qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
> >> +    ret = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg", acells, mem_base,
> >> +                                       scells, mem_len);
> >> +    if (ret < 0) {
> >> +        fprintf(stderr, "couldn't set %s/reg\n", nodename);
> >> +        goto out;
> >> +    }
> >> +    if (numa_node_id < 0) {
> >> +        goto out;
> >> +    }
> >> +
> >> +    ret = qemu_fdt_setprop_cell(fdt, nodename, "numa-node-id", numa_node_id);
> >> +    if (ret < 0) {
> >> +        fprintf(stderr, "couldn't set %s/numa-node-id\n", nodename);
> >> +    }
> >> +
> >> +out:
> >> +    g_free(nodename);
> >> +    return ret;
> >> +}
> >> +  
> > 
> > not related question from hotplug POV,
> > is entry size fixed?  
> Sorry I don't get what entry you are referring to?
> > can we estimate exact size for #slots number of dimms and reserve it in advance
> > in FDT 'rom'?  
> Not sure I get your drift either.
> 
> patch "[RFC v3 09/15] hw/arm/boot: Expose the PC-DIMM nodes in the DT"
> builds the DT nodes for each node, by enumerating the MemoryDeviceInfoList.

In case of hotplug we don not care about adding DTB node at runtime
(guest won't see it anyways). However if we reboot machine it's reasonable
to regenerate DTB on reboot so guest would see previously hotplugged DIMMs.
Problem is that DTB is stored in fixed size 'rom' that's copied into guest's
RAM, so we should reserve a space for possible slots in advance or switch
to another mechanism to provide DTB to guest. (it could be a memory region
mapped outside of RAM)

[...]
