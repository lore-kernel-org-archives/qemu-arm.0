Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp6795939wrx;
        Fri, 22 Feb 2019 02:40:41 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZ0MwtEbNoiA2WYhArdx5cX/6TO8zu3KwLuihZ4KmUg6SGt8busKyAHZbE1o6fyBsk+N8ui
X-Received: by 2002:a5b:406:: with SMTP id m6mr2615115ybp.367.1550832041022;
        Fri, 22 Feb 2019 02:40:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550832041; cv=none;
        d=google.com; s=arc-20160816;
        b=IES36MejJ3Vl5E8i5dKl2HPhGNxpqSUTEr1ZWMibJLPN4s4M3aP5m2eeGaDs5P8k7Y
         Hm66ajO/LJKWOIpOhlFmXdB/ayGIGUSXr3MCy8T2i/EnXm3Fd4C3QOLDEX2vdxhB9AH3
         jR2PdANcenVn7x46B1AXJnx5nOVCRVMlSpaVkGVY5xFG3brIdF+QLcoJGEbwkW/ZDjqO
         bMGsNgHLfje21OlVuND2HcyXIF1zWTWnqQFlyaIi+M/ZXhH0RrnUO7PZ6KxCp2dE6vNG
         gE43eqVovfcrp1v9oJ+MXvMgrtG84SnQD16F73pB2qGLhOEChosPZwdq21qfQ7/Ay7ni
         E8Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=PdSsk7Dl3Y4BX/uuPKqgQChMwnbKK5W/3N13ctx/0gU=;
        b=cRiAzIpOuEFt2YRA9UgUz7ldQfYBmxpcnG2WQjCSXmwfZYDq8j2YV2kfy25AJ3t0Oa
         dPUdZ1HU9T3oTlG+MJLrBo3JfbGT13oalzIbf/6HzZeNruIX2GTcpksYAVTqVxe56I/n
         79H9j5mPphZe7QR4DJfMDilyEEkOdF5CI+yAUjkxvj40/PSLIOoyAxXkVD91ADdL5D1Z
         iQONWTILctQXWVHw7wDlAgVHq2vEiz/mwdE8vN+L6au5w+fC6b++tM0u1VlyKyPO4MLL
         wOBFw1E8715mrKL2ZaXS7m/0WcOiiEHPqhTOl0sksNQzJdjIJlFNWMCO57PO1Z7GfHY5
         +STg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l137si591019ywb.328.2019.02.22.02.40.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 02:40:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:48384 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gx8G0-0006Nu-IH
	for alex.bennee@linaro.org; Fri, 22 Feb 2019 05:40:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38430)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gx8Ft-0006NX-KC
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 05:40:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gx8Fs-0004As-I3
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 05:40:33 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55644)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gx8Fo-000421-9o; Fri, 22 Feb 2019 05:40:30 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2AE233001D3F;
	Fri, 22 Feb 2019 10:40:23 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BD4C45D706;
	Fri, 22 Feb 2019 10:40:14 +0000 (UTC)
Date: Fri, 22 Feb 2019 11:40:13 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190222114013.5ee11757@redhat.com>
In-Reply-To: <20190220224003.4420-7-eric.auger@redhat.com>
References: <20190220224003.4420-1-eric.auger@redhat.com>
	<20190220224003.4420-7-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Fri, 22 Feb 2019 10:40:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v7 06/17] vl: Set machine ram_size,
 maxram_size and ram_slots earlier
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
X-TUID: lqFJvDHoyNng

On Wed, 20 Feb 2019 23:39:52 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> The machine RAM attributes will need to be analyzed during the
> configure_accelerator() process. especially kvm_type() arm64
> machine callback will use them to know how many IPA/GPA bits are
> needed to model the whole RAM range. So let's assign those machine
> state fields before calling configure_accelerator.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> 
> ---
> v6 -> v7:
> - add Peter's R-b
> 
> v4: new
> ---
>  vl.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/vl.c b/vl.c
> index 502857a176..fd0d51320d 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -4239,6 +4239,9 @@ int main(int argc, char **argv, char **envp)
>      machine_opts = qemu_get_machine_opts();
>      qemu_opt_foreach(machine_opts, machine_set_property, current_machine,
>                       &error_fatal);
> +    current_machine->ram_size = ram_size;
> +    current_machine->maxram_size = maxram_size;
> +    current_machine->ram_slots = ram_slots;
>  
>      configure_accelerator(current_machine, argv[0]);
>  
> @@ -4434,9 +4437,6 @@ int main(int argc, char **argv, char **envp)
>      replay_checkpoint(CHECKPOINT_INIT);
>      qdev_machine_init();
>  
> -    current_machine->ram_size = ram_size;
> -    current_machine->maxram_size = maxram_size;
> -    current_machine->ram_slots = ram_slots;
>      current_machine->boot_order = boot_order;
>  
>      /* parse features once if machine provides default cpu_type */

