Received: by 10.25.21.96 with SMTP id l93csp2091892lfi;
        Tue, 21 Jun 2016 11:46:07 -0700 (PDT)
X-Received: by 10.55.214.89 with SMTP id t86mr30713783qki.180.1466534766687;
        Tue, 21 Jun 2016 11:46:06 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l1si2301092qta.123.2016.06.21.11.46.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Jun 2016 11:46:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53662 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFQgY-000782-4Y
	for alex.bennee@linaro.org; Tue, 21 Jun 2016 14:46:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46447)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bFQgS-00075R-Qy
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 14:46:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bFQgP-0005Sv-MQ
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 14:46:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56166)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bFQgP-0005Sl-Gp; Tue, 21 Jun 2016 14:45:57 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D1EAAC04B303;
	Tue, 21 Jun 2016 18:45:56 +0000 (UTC)
Received: from hawk.localdomain (dhcp-1-122.brq.redhat.com [10.34.1.122])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5LIjrWt012341
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 21 Jun 2016 14:45:55 -0400
Date: Tue, 21 Jun 2016 20:45:52 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160621184552.p7trf4zpqnrmwruu@hawk.localdomain>
References: <1466528974-12183-1-git-send-email-peter.maydell@linaro.org>
	<1466528974-12183-7-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1466528974-12183-7-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 21 Jun 2016 18:45:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 6/6] hw/arm/virt: Set
 minimum_page_bits to 12
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s1pLISLJkVFU

On Tue, Jun 21, 2016 at 06:09:34PM +0100, Peter Maydell wrote:
> Since the virt board model will never create a CPU which is
> pre-ARMv7, we know that our minimum page size is 4K and can
> set minimum_page_bits accordingly, for improved performance.
> 
> Note that this is a migration compatibility break.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/virt.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index c5c125e..f9b51aa 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1440,6 +1440,8 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      mc->block_default_type = IF_VIRTIO;
>      mc->no_cdrom = 1;
>      mc->pci_allow_0_address = true;
> +    /* We know we will never create a pre-ARMv7 CPU which needs 1K pages */
> +    mc->minimum_page_bits = 12;
>  }

As this breaks migration, then I guess we also need

@@ -1507,5 +1510,6 @@ static void virt_machine_2_6_options(MachineClass *mc)
 {
     virt_machine_2_7_options(mc);
     SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_6);
+    mc->minimum_page_bits = 10;
 }
 DEFINE_VIRT_MACHINE(2, 6)

>  
>  static const TypeInfo virt_machine_info = {
> -- 
> 1.9.1
> 
> 
