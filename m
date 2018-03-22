Received: by 10.28.71.155 with SMTP id m27csp571110wmi;
        Thu, 22 Mar 2018 09:45:30 -0700 (PDT)
X-Google-Smtp-Source: AG47ELumezq1ntgiR9e/SPToWMtiZmXSDaBHNtvLk3ObVP4O2XcwORmgju/14qxHAu6lxGjy4UlA
X-Received: by 10.55.172.9 with SMTP id e9mr35982064qkm.112.1521737130740;
        Thu, 22 Mar 2018 09:45:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521737130; cv=none;
        d=google.com; s=arc-20160816;
        b=hHdoQkO2STKuwn0xBo3ku1ybqnV5he2zwjs/sZa5D2G66Z8EywtNw1WYASqoMfPuCt
         Ts3W9qWPFLyZirTmTvyA1Hnc845tkmpZxqS5FsOvJitkXdtLVCg/umxJEhv6O0tGIXqc
         ZY0/8NycbBqLSSNlycLyKu+i2fSGIzHTtnRnjmIaOG2Yjo2uqsAsdi5nXZuua8EtgU0B
         jMSRppPTx/Uyv+zpbBdWaXW2rbepjXYtZsFhX70PjDhHKs4N2eqEySYfthiJbsXLyumL
         1RSCzgJE6x2L61v0fBJpPOp3TzOVFwjTy4SCbD6+bH4GRMzCXNEP7/5Pl8f+ROt5rv59
         xVbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:from:references:to
         :arc-authentication-results;
        bh=g7VKUUb8OLvWQs+vAF44MJGbgX1Ws4af95nt64rZ0eE=;
        b=VS5yj+u+SlTQiuKqQqPV4/XFBaa7hJ0FphiygUYsaGtM9vmPnVWoIbeHE8xMkX0Sro
         9UAy2mVCpqshHTdP+KHJIXDL0Q3yEG+ollcixi+anhaufN8a995ye0xuK13wo9PBvtCS
         uPa9uaT4VCP9faJp0ZBatK3CFbCwZ5JGschzaIoHnysomhzZLdTan7g9IQG1l+niLmjl
         Jvpz9lj/eX/CSjmrLi/GcPz4UTEPVRP0ZypLrporBYYy2No1wu2ICXK3EXj5MmjgRkW3
         JemII2dlZN6nxr3UrvbKzaNFMOoeMW73H02y6CVYlc7fRrwhCaaAejN/lsU7uvbR6yL0
         D/ZA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r17si7517475qtb.373.2018.03.22.09.45.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 09:45:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33706 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ez3LG-0004eY-A0
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 12:45:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ez3L6-0004bp-7g
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 12:45:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ez3L2-0002dA-9G
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 12:45:20 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35120 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1ez3L2-0002ci-4e; Thu, 22 Mar 2018 12:45:16 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8257B40704AB;
	Thu, 22 Mar 2018 16:45:15 +0000 (UTC)
Received: from [10.10.121.135] (ovpn-121-135.rdu2.redhat.com [10.10.121.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D74901C704;
	Thu, 22 Mar 2018 16:45:03 +0000 (UTC)
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20180322161226.29796-1-lvivier@redhat.com>
	<20180322161226.29796-5-lvivier@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <5a2e612c-368c-bc36-a852-0ce29bc36ab4@redhat.com>
Date: Thu, 22 Mar 2018 11:45:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180322161226.29796-5-lvivier@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Thu, 22 Mar 2018 16:45:15 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Thu, 22 Mar 2018 16:45:15 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH 4/4] Remove unnecessary variables for
 function return value
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Yongbok Kim <yongbok.kim@mips.com>,
	Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, Alexander Graf <agraf@suse.de>,
	David Gibson <david@gibson.dropbear.id.au>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>,
	"=?UTF-8?Q?Daniel_P._Berrang=c3=a9?=" <berrange@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZB5jTDLk0S+6

On 03/22/2018 11:12 AM, Laurent Vivier wrote:
> Re-run Coccinelle script scripts/coccinelle/return_directly.cocci
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---

> +++ b/hw/arm/exynos4210.c
> @@ -156,12 +156,7 @@ void exynos4210_write_secondary(ARMCPU *cpu,
>   
>   static uint64_t exynos4210_calc_affinity(int cpu)
>   {
> -    uint64_t mp_affinity;
> -
> -    /* Exynos4210 has 0x9 as cluster ID */
> -    mp_affinity = (0x9 << ARM_AFF1_SHIFT) | cpu;
> -
> -    return mp_affinity;
> +    return (0x9 << ARM_AFF1_SHIFT) | cpu;

Unchanged by this rewrite, but since this is converting a signed 32-bit 
int to an unsigned 64-bit value, are we sure that the upper 32 bits are 
always set correctly?  (Using unsigned values earlier in the expression 
would require less head-scratching on whether it is correct).  Any 
changes should be a separate fix by the file's maintainer.


> +++ b/hw/misc/mos6522.c
> @@ -176,12 +176,8 @@ static void mos6522_set_sr_int(MOS6522State *s)
>   
>   static uint64_t mos6522_get_counter_value(MOS6522State *s, MOS6522Timer *ti)
>   {
> -    uint64_t d;
> -
> -    d = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) - ti->load_time,
> +    return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) - ti->load_time,
>                    ti->frequency, NANOSECONDS_PER_SECOND);

Coccinelle missed that indentation is now off here.

> +++ b/hw/ppc/pnv_lpc.c
> @@ -125,25 +125,15 @@ static int pnv_lpc_dt_xscom(PnvXScomInterface *dev, void *fdt, int xscom_offset)
>   static bool opb_read(PnvLpcController *lpc, uint32_t addr, uint8_t *data,
>                        int sz)
>   {
> -    bool success;
> -
> -    /* XXX Handle access size limits and FW read caching here */
> -    success = !address_space_rw(&lpc->opb_as, addr, MEMTXATTRS_UNSPECIFIED,
> +    return !address_space_rw(&lpc->opb_as, addr, MEMTXATTRS_UNSPECIFIED,
>                                   data, sz, false);

and here.

> +++ b/target/xtensa/translate.c
> @@ -1272,11 +1272,8 @@ XtensaOpcodeOps *
>   xtensa_find_opcode_ops(const XtensaOpcodeTranslators *t,
>                          const char *name)
>   {
> -    XtensaOpcodeOps *ops;
> -
> -    ops = bsearch(name, t->opcode, t->num_opcodes,
> +    return bsearch(name, t->opcode, t->num_opcodes,
>                     sizeof(XtensaOpcodeOps), compare_opcode_ops);

and here


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org
