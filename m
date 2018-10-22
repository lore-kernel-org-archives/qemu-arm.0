Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3046467wrt;
        Mon, 22 Oct 2018 06:42:21 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62Uhs+6/hIh2BDQdE81TH3XG0fRUItPA52CcBzsry57zg0buwajMKHp8eShcxy9RSI1l0Gq
X-Received: by 2002:a37:38c:: with SMTP id 134-v6mr42156717qkd.194.1540215741569;
        Mon, 22 Oct 2018 06:42:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540215741; cv=none;
        d=google.com; s=arc-20160816;
        b=loEMWswksqw/76htwaU6axXh0J8DWqiCz0seWP5HuBd9wFqP8LJ9gw0OUD5UN4EEYt
         NDo9hOEajo5J+keGRyqMmFtsbWOvAGWEgpYmz0M9qRh4XHinOgaF6tkhVRFk/z6hT+bZ
         9YjUhUWoI/OkNiTT/SbHpCJ5yz2p0YbFdrHVvXldu6GWbhmVM9c5GPyYx77OIPU+v7+w
         iOiZaSHTBVkH2Ya2Q6TSZQ9Poz04o+yd8i1nV/N5HFXdFw9Ovybkcdf1eUQTRB8szaHk
         F7kSFa57zeZ/GuGdGl5bJZ2tALxXLZL3+GcIXmkQoKaXtcHY0wII4AhAThAFEEM98pXZ
         a6uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=9fMszDnHSRyaXgbqQvuP/q0eCOgLz1Wy7Soq79y1zbo=;
        b=uehBiUZbgMJGiQ0ri4iwUW7iGjYIVErWg2vjYTJ3f9T3uubxj8FyUNzPQkICTRhyfY
         bXmsi9eaKFBq+Pqp9n0W7aNjcZsFz5suPIQxK6T2D/vvQfPt3T9T774MIoWoqb1Z+bCS
         TgJdL6PywFmMpMERRw1jj98079RqM10RBcznmWZhrj6hWUg6eo1KC/ZHgAnolBltiZOa
         xJ0+i/PLg7hVvtznSYf9+YlMv7R/Ug07rB8BA4ktSijbmfdX+pBDbCWYXyOogu9+837Z
         P4kK7qZ7KGGWUnZhkU1SRkGLlRJiQfSS0yNcl7ZKKxz3NEXO+Z2WV05bESL1XpJvmkaf
         ozQA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s186-v6si2447222qkc.118.2018.10.22.06.42.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Oct 2018 06:42:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35181 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gEaTN-0000nw-3E
	for alex.bennee@linaro.org; Mon, 22 Oct 2018 09:42:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33059)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gEaRv-0000Ih-7U
	for qemu-devel@nongnu.org; Mon, 22 Oct 2018 09:40:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gEaRq-0002s5-C9
	for qemu-devel@nongnu.org; Mon, 22 Oct 2018 09:40:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49944)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gEaRj-0002eS-B2; Mon, 22 Oct 2018 09:40:39 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 694C181DEB;
	Mon, 22 Oct 2018 13:40:38 +0000 (UTC)
Received: from igors-macbook-pro.local (ovpn-112-71.ams2.redhat.com
	[10.36.112.71])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A5DD25D6A9;
	Mon, 22 Oct 2018 13:40:29 +0000 (UTC)
Date: Mon, 22 Oct 2018 14:40:26 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20181022144026.3171d287@igors-macbook-pro.local>
In-Reply-To: <20181018143042.29588-13-eric.auger@redhat.com>
References: <20181018143042.29588-1-eric.auger@redhat.com>
	<20181018143042.29588-13-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 22 Oct 2018 13:40:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC v4 12/16] hw/arm/virt-acpi-build: Add PC-DIMM
 in SRAT
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, david@redhat.com,
	Suzuki.Poulose@arm.com, qemu-devel@nongnu.org,
	shameerali.kolothum.thodi@huawei.com, dgilbert@redhat.com,
	qemu-arm@nongnu.org, kwangwoo.lee@sk.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AD6JNariA8JV

On Thu, 18 Oct 2018 16:30:38 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> 
> Generate Memory Affinity Structures for PC-DIMM ranges.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> v3 -> v4:
> - do not use vms->bootinfo.device_memory_start/device_memory_size anymore
> 
> v1 -> v2:
> - build_srat_hotpluggable_memory movedc to aml-build
> ---
>  hw/arm/virt-acpi-build.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 5785fb697c..8818bbf5ec 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -545,6 +545,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      int i, srat_start;
>      uint64_t mem_base;
>      MachineClass *mc = MACHINE_GET_CLASS(vms);
> +    MachineState *ms = MACHINE(vms);
>      const CPUArchIdList *cpu_list = mc->possible_cpu_arch_ids(MACHINE(vms));
>  
>      srat_start = table_data->len;
> @@ -570,6 +571,9 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          }
>      }
>  
> +    build_srat_hotpluggable_memory(table_data, ms->device_memory->base,
> +                                   ms->device_memory->mr.size, 0);
on x86, we use the last node here to make windows happy. I'd use the same value here.

> +
>      build_header(linker, table_data, (void *)(table_data->data + srat_start),
>                   "SRAT", table_data->len - srat_start, 3, NULL, NULL);
>  }

