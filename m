Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B41D65C47
	for <qemu-arm@archiver.kernel.org>; Wed, 17 Dec 2025 14:01:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vVs5R-0007KR-0r; Wed, 17 Dec 2025 09:01:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vVs56-00078B-Si
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 09:00:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vVs54-0006NI-8g
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 09:00:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765980039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HbthGM/G+GWpXtODayU7RTgZ2Jepun9Dt1c05gz+DX8=;
 b=IQ3dfcyjYo//iu2a9Mhp4eXt1n5JLyc5VgkDt6tiuczlREk3YuRyEtid45UjvJmqDaQ+nO
 60BdunaUuzdW8BEhX1ayZdjAAb+j3KpuiQQBNUkACNSeM8Nm+i5YU3KursE/Tzbc9209up
 02+oI44Yl3jBqOC8qeyNIVR5EBwqiOQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-110--S3jT7TyP8aqigzuexSjPw-1; Wed, 17 Dec 2025 09:00:36 -0500
X-MC-Unique: -S3jT7TyP8aqigzuexSjPw-1
X-Mimecast-MFC-AGG-ID: -S3jT7TyP8aqigzuexSjPw_1765980035
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-477563e531cso39210095e9.1
 for <qemu-arm@nongnu.org>; Wed, 17 Dec 2025 06:00:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765980035; x=1766584835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HbthGM/G+GWpXtODayU7RTgZ2Jepun9Dt1c05gz+DX8=;
 b=IhAHiKkUVouzwdHAGaPTexzGbg+UmjnuQyAhcg0u6KtIM/ukf+kF+1r2Jn73TEeCnP
 MErc0nJkpvanCmq/dKe8ZnV+EchH4Y3PGGWPqiUthxJEuWXg2zk+ckZ+FYDtVd7w5+5t
 bTD6ZIOhT+yVwZlWN+eqfuzfw5hEBqPgKV6EPizdxgFzEIbNuF+z/zcY4z/6FUdbCqAM
 aV8PR+ya/V6G+2IZI+U94/ERQqiXAXfeByMoxfGjhOXpN3lxfQ9lrz8jAY898nm+Huum
 ylBozXj187fvj1zthLaOhm1gvyuookBnfUoFYkZI2o7tLCXN9lX/T+bWgjstffdGTsdc
 BbMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6yg7UWq8+RDsmDsKMDAP4ZQMHS/7biduVkmryVpIkLbm1UQGJ4Dv2LbAny90mRtOLUKSY8IEyWQ==@nongnu.org
X-Gm-Message-State: AOJu0YxbEsmnIaQ0a+AsCY72Lu+DR9SNe0GlVfBr3cukgb1XH7Q8h4eQ
 eriI1gfdHu8xjAzZn9nSG8YC6T6dv/vshfWTZpolxWPzCTydwbt+2WqQ9roHaQWVxjXeRALVm4N
 RhZPibMdl4Fk595BVblsqPRQVJHk/uFsSwK2flgnv/DNt60Zv+U0Fjw==
X-Gm-Gg: AY/fxX7UNnZxME9qIGa2rhlxRyTmAGIPOMvDMQcTgK5bVXjZbWjCYWBNV9MGMWDcaOB
 9caEJIMj8tGJBgXm/OI36bbYhS4dH13CTBVSEOedIoOEE7iRYRE6mBIUalsmgAYtNwq5hIffAdv
 0khBgF263cOiuUJx1wB7D99pKFX31zaRx1SxEWI4ry2awT/tHCaCT6i29fgVixa3P2/PMxlB+Ly
 n4udt1e/PFxTWNMI/v7ksitEUTf8qwnQA2neVsPbmfaFiez6MmwS3HFx0YIXcltrHNomOoGQn5T
 WtvxXDbQbofIrOCaCOxOUe6WZeqZFZ3RkYH8GXp03TJ4R/KhYG85yueUxuYn8ESIQU+QRA==
X-Received: by 2002:a05:600c:870b:b0:477:214f:bd95 with SMTP id
 5b1f17b1804b1-47a970ee01fmr121266745e9.23.1765980035317; 
 Wed, 17 Dec 2025 06:00:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHF3Fr/Zcas6umUDcUr9uZT23jIj6/PQ2ws/ggCzapTqhVg7JQ7VBdYoNAD+a6a+0T+RRnEZw==
X-Received: by 2002:a05:600c:870b:b0:477:214f:bd95 with SMTP id
 5b1f17b1804b1-47a970ee01fmr121266215e9.23.1765980034769; 
 Wed, 17 Dec 2025 06:00:34 -0800 (PST)
Received: from imammedo ([213.175.46.86]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47bd932a3e5sm30087275e9.0.2025.12.17.06.00.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Dec 2025 06:00:34 -0800 (PST)
Date: Wed, 17 Dec 2025 15:00:29 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Thomas
 Huth <thuth@redhat.com>, qemu-devel@nongnu.org, devel@lists.libvirt.org,
 kvm@vger.kernel.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Richard
 Henderson <richard.henderson@linaro.org>, Sergio Lopez <slp@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Laurent Vivier <lvivier@redhat.com>, Jiaxun
 Yang <jiaxun.yang@flygoat.com>, Yi Liu <yi.l.liu@intel.com>, Eduardo
 Habkost <eduardo@habkost.net>, Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, Weiwei Li <liwei1518@gmail.com>, Amit Shah
 <amit@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, Yanan Wang
 <wangyanan55@huawei.com>, Helge Deller <deller@gmx.de>, Palmer Dabbelt
 <palmer@dabbelt.com>, "Daniel P . =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>, Ani Sinha <anisinha@redhat.com>, Fabiano Rosas
 <farosas@suse.de>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?B?Q2zDqW1lbnQ=?= Mathieu--Drif <clement.mathieu--drif@eviden.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>, Huacai
 Chen <chenhuacai@kernel.org>, Jason Wang <jasowang@redhat.com>, Mark
 Cave-Ayland <mark.caveayland@nutanix.com>, BALATON Zoltan
 <balaton@eik.bme.hu>, Peter Krempa <pkrempa@redhat.com>, Jiri Denemark
 <jdenemar@redhat.com>
Subject: Re: [PATCH v5 06/28] docs/specs/acpi_cpu_hotplug: Remove legacy cpu
 hotplug descriptions
Message-ID: <20251217150029.3a3bc19d@imammedo>
In-Reply-To: <20251202162835.3227894-7-zhao1.liu@intel.com>
References: <20251202162835.3227894-1-zhao1.liu@intel.com>
 <20251202162835.3227894-7-zhao1.liu@intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3lGchqRE8_-n1nxLfGWjbEDWQxTmj2IaL3KjozjcdZc_1765980035
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed,  3 Dec 2025 00:28:13 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

> Legacy cpu hotplug has been removed totally and machines start with
> modern cpu hotplug interface directly.
> 
> Therefore, update the documentation to describe current QEMU cpu hotplug
> logic.
> 
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
> Changes since v4:
>  * New patch.
> ---
>  docs/specs/acpi_cpu_hotplug.rst | 28 +++-------------------------
>  1 file changed, 3 insertions(+), 25 deletions(-)
> 
> diff --git a/docs/specs/acpi_cpu_hotplug.rst b/docs/specs/acpi_cpu_hotplug.rst
> index 351057c96761..f49678100044 100644
> --- a/docs/specs/acpi_cpu_hotplug.rst
> +++ b/docs/specs/acpi_cpu_hotplug.rst
> @@ -8,22 +8,6 @@ ACPI BIOS GPE.2 handler is dedicated for notifying OS about CPU hot-add
>  and hot-remove events.
>  
>  
> -Legacy ACPI CPU hotplug interface registers
> --------------------------------------------
> -
> -CPU present bitmap for:
> -
> -- ICH9-LPC (IO port 0x0cd8-0xcf7, 1-byte access)
> -- PIIX-PM  (IO port 0xaf00-0xaf1f, 1-byte access)
> -- One bit per CPU. Bit position reflects corresponding CPU APIC ID. Read-only.
> -- The first DWORD in bitmap is used in write mode to switch from legacy
> -  to modern CPU hotplug interface, write 0 into it to do switch.
> -
> -QEMU sets corresponding CPU bit on hot-add event and issues SCI
> -with GPE.2 event set. CPU present map is read by ACPI BIOS GPE.2 handler
> -to notify OS about CPU hot-add events. CPU hot-remove isn't supported.
> -
> -
>  Modern ACPI CPU hotplug interface registers
>  -------------------------------------------
>  
> @@ -189,20 +173,14 @@ Typical usecases
>  (x86) Detecting and enabling modern CPU hotplug interface
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>  
> -QEMU starts with legacy CPU hotplug interface enabled. Detecting and
> -switching to modern interface is based on the 2 legacy CPU hotplug features:
> -
> -#. Writes into CPU bitmap are ignored.
> -#. CPU bitmap always has bit #0 set, corresponding to boot CPU.
> -
> -Use following steps to detect and enable modern CPU hotplug interface:
> +QEMU starts with modern CPU hotplug interface enabled. Use following steps to
> +detect modern CPU hotplug interface:
>  
> -#. Store 0x0 to the 'CPU selector' register, attempting to switch to modern mode
>  #. Store 0x0 to the 'CPU selector' register, to ensure valid selector value
>  #. Store 0x0 to the 'Command field' register
>  #. Read the 'Command data 2' register.
>     If read value is 0x0, the modern interface is enabled.
> -   Otherwise legacy or no CPU hotplug interface available
> +   Otherwise no CPU hotplug interface available
>  
>  Get a cpu with pending event
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^


