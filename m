Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp3148236wrw;
        Thu, 8 Nov 2018 01:14:33 -0800 (PST)
X-Google-Smtp-Source: AJdET5fkQb4cSB3Fw1W6PhdFKr06EKXI3XcUCdnWRCE/ny2ETflErSkNV+tBVMmtwoSus+4C0n3r
X-Received: by 2002:aed:3a82:: with SMTP id o2-v6mr3599855qte.240.1541668473448;
        Thu, 08 Nov 2018 01:14:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541668473; cv=none;
        d=google.com; s=arc-20160816;
        b=tYZURxXo/DIO1ysXnC1hwMwGe7ZXMHksxz3D7E52h2FSSKZ0cg0drtsBsP6RGhqs1N
         cqgiXaV8QzI5R/kGOwarUPXUHWBTa/Ry2xPIMcfyvYEgSwsmzUQEFS4Q8gd4aSo7LjJ2
         cQrdjV+dj7d8WnR9YP1gCjhykOkumzgaP7qrqVOCzkuqZqvbI8TkSVjz4jRmYl8mL0gT
         cOnmT/yyyYtEoYcw+NooP1Zs6pgL2I2uriWgUOnMqpI46Pxw9LmpxGO6nUhreNjOCviM
         X4VSYiMrcQHJf98FBuLe2gGb/m50RPtddteVJN3uQU1KCzjmhDNOqyZDSfp4W748PHQW
         1yRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=p0Wce4woTZpXZcotjZigioygOvVXeM1CrzCH8rr6/b0=;
        b=cbw35eBuK01E8+NRa3ZI6FV6zzbZFxhPy6xhs8e4TnWzoeYESbR9u4+VuiyLC1nfi5
         S1lNXIFiS4lLhq4fMNSpPGbVABaUJiyycphhpKQHeheTEa19rtdKQLQevcy7xdwIA230
         LQifnO6EHdQlCxc3lV3isJjeKnFa7hy5eVeZCBNfdUrebYaHJ+qjMSXe8bKOR/mD2sow
         kiHsMAMvbOTYxquWAJSKXnCyglI34bODT4sgK33M3QMFkZTJfFQrFwi6SJEQNdaTLeC4
         +P7Nmup/Tk1vDduFnPu8dfHAh7irEeg14xJ5X0igmDtfRiqICLEFQvgB1PkPB8qeAdVa
         jISA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n84si2595700qki.238.2018.11.08.01.14.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Nov 2018 01:14:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55272 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKgOX-0003k2-17
	for alex.bennee@linaro.org; Thu, 08 Nov 2018 04:14:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50244)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gKgOM-0003iY-6m
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 04:14:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gKgOC-0001GA-6s
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 04:14:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45800)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1gKgOB-0001Dq-Al; Thu, 08 Nov 2018 04:14:11 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0EBD78046C;
	Thu,  8 Nov 2018 09:14:10 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 633105D73F;
	Thu,  8 Nov 2018 09:14:06 +0000 (UTC)
Date: Thu, 8 Nov 2018 10:14:03 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peng Hao <peng.hao2@zte.com.cn>
Message-ID: <20181108091403.tqablmur67foxmnn@kamzik.brq.redhat.com>
References: <1540663650-106694-1-git-send-email-peng.hao2@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1540663650-106694-1-git-send-email-peng.hao2@zte.com.cn>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 08 Nov 2018 09:14:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH V5 0/5] add pvpanic mmio support
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7DHNjbQMm1JL

On Sun, Oct 28, 2018 at 02:07:25AM +0800, Peng Hao wrote:
> The first patches are simple cleanups:
> - patch 1 move the pvpanic device with the 'ocmmon objects' so we compile
>   it once for the x86/arm/aarch64 archs,
> - patch 2 simply renames ISA fields/definitions to generic ones.
> 
> Then instead of add/use the MMIO pvpanic device in the virt machine in an
> unique patch, I split it in two distinct patches:
> - patch 3 uses Peng Hao's work, but add the MMIO interface to the existing
>   device (no logical change).
> - patch 4 is Peng Hao's work in the virt machine (no logical change).
> - patch 5 add pvpanic device in acpi table in virt machine
> v2 from Peng Hao is:
> https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg03433.html
> 
> v3 --> v4
>   patch 1,2 no modification.
>   patch 3, add TYPE_PANIC_MMIO for distinguishing different bus device,
>            virt + isa_pvpanic will abnormally terminate virtual machine. 
>   patch 4, "pvpanic,mmio" --> "qemu,pvpanic-mmio".
>   patch 5, newly added.
> 
> v4 --> v5
>   patch 1,2 no modification.
>   patch 3 delete PvpanicCommonState structure.
>   patch 4 VIRT_PVPANIC_MMIO --> VIRT_PVPANIC
>           correct VIRT_PVPANIC's overlap start address
>   patch 5 no modification.

This cover letter is missing a pointer to the Linux kernel patches that
enable the pvpanic driver to use the MMIO interface. If that hasn't been
done yet, then how has this series been tested?

Thanks,
drew
