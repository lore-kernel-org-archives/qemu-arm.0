Received: by 10.223.150.237 with SMTP id u100csp2377929wrb;
        Sun, 5 Nov 2017 23:31:09 -0800 (PST)
X-Google-Smtp-Source: ABhQp+RSydX5OryQyuWLTeUUnURRd5mjY9c6u7tYkCGjwk75El36bmPEKxNbDh0TEFmcVCdb0bs0
X-Received: by 10.129.87.206 with SMTP id l197mr8946408ywb.370.1509953469635;
        Sun, 05 Nov 2017 23:31:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1509953469; cv=none;
        d=google.com; s=arc-20160816;
        b=UdVzJ8CQfu4C4trUIWQl9DTNIQtU8TMxUisO783WXTpBKWrfh2FG02K03im1XOP5b9
         0dAXubrcXz+b6fPSB2GMIjP+TDfc/p9C5/Qvq1s/930aELC0g9AIPZU7AaK7G1TiGgGG
         l9GEkfYxWhglD6Ng7iGHeHPslvOewqWF3GU3riXf1EchFTEEy7AHIZ5p4FmZH8iA/MeR
         dmS9d4UrwjSszwS2s54NnFy9Teb3BeBdRnaNlVPeoVYh06Mbvt70o21ZC7aQjw97QjFH
         5HTxDXiZYpZwavCflynPZhUrGDwVmZqTjUk7ixUyk1YzhWiJXm0rOyfqmQ+B+LxGI6dK
         RDwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=dDHGIgoZdP341Rg5yr14/Whr/RcmmpPrQML/4z4OPEI=;
        b=G56Ovx60XJdSwFfsJuGq1GZYtFNrq9hA8cz9HHaAOPH+5Lt2g28zsPfHHn2b//UNYe
         3BTbbwHs8i6FfPF/i3d8JwvZr5ZPs2nFt3xUzFVRRO+EIeckn9JrPho8AccSkNoh7bxt
         kItqoidJoCCOCFOv8CxG/r1pQvgHsH3tkGDsvuEQO/u7DqOfEcz/naKd3dzX9pcrDbo2
         lqnH95Uv3BDnK/DrqR4rlfLonmk49HUYf1yMV+BkJ5x5V+VmMKfbuDPiCLtR/dCqIXGp
         bCB105oANmQj3wLNLVuYbZwOPEM1+I5nmLqfutHrm+7V1N/LSrQEk8zAuaD0YSTEd0dp
         VVFw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 13si2537096yws.338.2017.11.05.23.31.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 05 Nov 2017 23:31:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46806 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eBbsD-00008X-2s
	for alex.bennee@linaro.org; Mon, 06 Nov 2017 02:31:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34134)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eBbs3-00008P-Kf
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 02:31:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eBbs0-0002NN-GW
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 02:30:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:20537)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eBbs0-0002MW-AW; Mon, 06 Nov 2017 02:30:56 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 758A87E422;
	Mon,  6 Nov 2017 07:30:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 758A87E422
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain (ovpn-116-72.ams2.redhat.com
	[10.36.116.72])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E35E5D9C7;
	Mon,  6 Nov 2017 07:30:52 +0000 (UTC)
To: Shanker Donthineni <shankerd@codeaurora.org>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1509712671-16299-1-git-send-email-shankerd@codeaurora.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <a381c1f7-b695-8126-982f-610f60a1b992@redhat.com>
Date: Mon, 6 Nov 2017 08:30:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1509712671-16299-1-git-send-email-shankerd@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 06 Nov 2017 07:30:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] hw/intc/arm_gicv3_its: Fix the VM
 termination in vm_change_state_handler()
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
Cc: qemu-arm <qemu-arm@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uwkUQi2kkeQK

Hi Shanker,

On 03/11/2017 13:37, Shanker Donthineni wrote:
> The commit cddafd8f353d ("hw/intc/arm_gicv3_its: Implement state save
> /restore") breaks the backward compatibility with the older kernels
> where vITS save/restore support is not available. The vmstate function
> vm_change_state_handler() should not be registered if the running kernel
> doesn't support ITS save/restore feature. Otherwise VM instance will be
> killed whenever vmstate callback function is invoked.
> 
> Observed a virtual machine shutdown with QEMU-2.10+linux-4.11 when testing
> the reboot command "virsh reboot <domain> --mode acpi" instead of reboot.
> 
> KVM Error: 'KVM_SET_DEVICE_ATTR failed: Group 4 attr 0x00000000000001'
> 
> Signed-off-by: Shanker Donthineni <shankerd@codeaurora.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks for the fix.

Best Regards

Eric
> ---
>  hw/intc/arm_gicv3_its_kvm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
> index 39903d5..9b00ce5 100644
> --- a/hw/intc/arm_gicv3_its_kvm.c
> +++ b/hw/intc/arm_gicv3_its_kvm.c
> @@ -111,13 +111,13 @@ static void kvm_arm_its_realize(DeviceState *dev, Error **errp)
>              error_free(s->migration_blocker);
>              return;
>          }
> +    } else {
> +        qemu_add_vm_change_state_handler(vm_change_state_handler, s);
>      }
>  
>      kvm_msi_use_devid = true;
>      kvm_gsi_direct_mapping = false;
>      kvm_msi_via_irqfd_allowed = kvm_irqfds_enabled();
> -
> -    qemu_add_vm_change_state_handler(vm_change_state_handler, s);
>  }
>  
>  /**
> 
