Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp3527411njc;
        Wed, 6 Nov 2024 05:56:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWIHLwViEiGBiu7ctul65XWMTVrJckKmHyjbdr4r70CGcbnkDtf4nQEr92bPzSACrPnz8Vz0Dyx+aZ7Ug==@linaro.org
X-Google-Smtp-Source: AGHT+IEySFuyz353ouVEe1fTa4EES14jWJg29JdJ9TX5rhCOWJ7rtWeUKCu2Zb8EY9eYxgDeMZUj
X-Received: by 2002:a05:620a:1a0d:b0:7b1:492c:ba83 with SMTP id af79cd13be357-7b2fb950a14mr2386507285a.10.1730901403203;
        Wed, 06 Nov 2024 05:56:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730901403; cv=none;
        d=google.com; s=arc-20240605;
        b=Ol7t3TwfAij2DHcM4KRLnCFZxOCMTK65HEBvPfi4txA3smpr1brWA5iOrr/VGNS9SV
         BxcJ46Wpz+pVLKClpe095//4pRQc/bCBulBQZw40cxvbl9Ak6dZC8BvgM1ajfD/jYidF
         HpBVbwriIc1rBVQ0x3Mo1nn7w78zqwcJuFuxZpjDAP+Krlc8F+GZvNPA1R4cNxGCQaXb
         3P8Jo254U13Xm9ZUfze4rSUlXD+4hsKWjx9S4SQ9+y8c+Mf7F2yr+Jhzd9sFytjFqfyd
         lkcErlbTIH7KOOp/JblBxLgZHnT9CuN1OaUmeqzRjj2Z8SBOyDA9lI+6/JMKbediprwH
         i8CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=8m+H83mf8SO8gTgYs8kfBy5ooll6r809LA9G0GWmY8A=;
        fh=WiepQ/DT8uYfaKdAfaCplRWmUHyM40nVXNTkOFO+B24=;
        b=fFJAE550GJM3Ns08qMy24WVg7bdR4gsmhAh6m5GGGs+30Qy86ta2yMFAyKBO73D2CI
         ifJDDRo9FcwaeMHwZBYnFrDExuvDAvXmrAbuCh4UnQfH+iy/g3QLu7Xkfg/FIt+k9khA
         ka2Zcqgpqs5dkYLta97nlNiOBkTcRH+OY8jSJrViSe7BCR/7qIPUo0ZnHHl634EeaoZi
         qRB1T/seL9JNgrOPASfq3w3+BmxlweZTgPF1j7u+I00qe42Sk5xefgp/a9n1KSVAguuO
         7h6w+b0JORrmzhf8NwQT7bSNFic0Vn+nKDO8KXO5UNhgPHFicW/9YAggwbp6roOExSLp
         80Ew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jIUYop1M;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b2f3ab8449si1552951085a.624.2024.11.06.05.56.43
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 05:56:43 -0800 (PST)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jIUYop1M;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730901402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8m+H83mf8SO8gTgYs8kfBy5ooll6r809LA9G0GWmY8A=;
	b=jIUYop1MrtshJ1NRus0sNmx6+pMEJgPR5ZOuJkdOHfX8e7YQnZRJXlgsARPbWMpCuyal7L
	vDE2bZp9jHPNwZ00mcDrBy5djtvPvBNZgm9ErNRe5XqoUsh+Cnb1q4wDpBPHmewW4pAmT8
	luhrH/e52H7fuqLdJb2Gzb93UDpQz0Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-D9DgemkBNbOXdi-ZJujoFA-1; Wed, 06 Nov 2024 08:56:40 -0500
X-MC-Unique: D9DgemkBNbOXdi-ZJujoFA-1
X-Mimecast-MFC-AGG-ID: D9DgemkBNbOXdi-ZJujoFA
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4316e2dde9eso57377885e9.2
        for <alex.bennee@linaro.org>; Wed, 06 Nov 2024 05:56:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730901399; x=1731506199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8m+H83mf8SO8gTgYs8kfBy5ooll6r809LA9G0GWmY8A=;
        b=lmM8tOZnEKTzI3qF3hH9nkMpLHTdONp1lHD81i5HoU2tuhFRUMpMVtApiHStfH2t3R
         gf8csOYrDWUnNLWd4AByFjdQZFM5zVyHYjLakReO7TQw7aTJpYdLKjGP+2IiqgAQauQg
         PrWpPW+KBvjISZHQ8GpMSqFRK+bHAvSoZq5FoXLGeOBLQITrKR1KwXj+lL4yG3N3VhXR
         grshGK9YJ3nJgQxBgYihNeaCMri+0lobz62w4ausBSreeqnww8rUv2ET+oeSg9BpR9DM
         cuB5ae8kqmM0pfU4tJ3vvIeNMrvnEph5UYYXVBvkYykFvKkOQh412VHw25EOlgL/x+Yr
         Of6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWnH/CVsODPu8idqmtk3mM4Ayu1+TdSWxbF36fmmccHUW8iTh5/slQfz4RZkXHgMKnEzI5Z1TKdJ/zrwQ==@linaro.org
X-Gm-Message-State: AOJu0YzHrzLzvhEpG+LgjTkf7oqXNGkfr5tjOJlmQAViHIJq0NoPF5YK
	P7cvgULrDurVomz6fFdq6Gbct55o08ePXWbK/zdU9QlF+3zuEyxOVmJHYXWGdHjFYWxAujsTuDY
	+P1vZ/x1OpTNMRrV+cHs15q1fQJVFSZ7u0vi5wWByVnCkHYwqKzmAOg==
X-Received: by 2002:a05:600c:35cc:b0:42c:bae0:f05f with SMTP id 5b1f17b1804b1-4328324b30dmr214392995e9.13.1730901399523;
        Wed, 06 Nov 2024 05:56:39 -0800 (PST)
X-Received: by 2002:a05:600c:35cc:b0:42c:bae0:f05f with SMTP id 5b1f17b1804b1-4328324b30dmr214392565e9.13.1730901399181;
        Wed, 06 Nov 2024 05:56:39 -0800 (PST)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa6b61c5sm23213075e9.13.2024.11.06.05.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 05:56:38 -0800 (PST)
Date: Wed, 6 Nov 2024 14:56:35 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>,
 <jonathan.cameron@huawei.com>, <peter.maydell@linaro.org>,
 <richard.henderson@linaro.org>, <anisinha@redhat.com>,
 <eduardo@habkost.net>, <marcel.apfelbaum@gmail.com>, <david@redhat.com>,
 <philmd@linaro.org>, <peterx@redhat.com>, <pbonzini@redhat.com>,
 <gshan@redhat.com>, <borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>,
 <linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
 <ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
 <karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
 <salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
 <wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
 <zhao1.liu@intel.com>, <linuxarm@huawei.com>, <gustavo.romero@linaro.org>
Subject: Re: [PATCH 2/3] Fix: Reverse CPUs presence check logic for x86
 backward compatability
Message-ID: <20241106145635.77332d7c@imammedo.users.ipa.redhat.com>
In-Reply-To: <20241106130331.205020-3-salil.mehta@huawei.com>
References: <20241106130331.205020-1-salil.mehta@huawei.com>
	<20241106130331.205020-3-salil.mehta@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Fwj4x7A3FqpSp5suBnw4vzQcZhzYVmchHlAY2VEUhuY_1730901400
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: IYjupLL6pTok

On Wed, 6 Nov 2024 13:03:30 +0000
Salil Mehta <salil.mehta@huawei.com> wrote:

> Checking `is_present` first can break x86 migration from new Qemu
> version to old Qemu. This is because CPRS Bit is not defined in the
> older Qemu register block and will always be 0 resulting in check always
> failing. Reversing the logic to first check `is_enabled` can alleviate
> below problem:
> 
> -                If ((\_SB.PCI0.PRES.CPEN == One))
> -                {
> -                    Local0 = 0x0F
> +                If ((\_SB.PCI0.PRES.CPRS == One))
> +                {
> +                    If ((\_SB.PCI0.PRES.CPEN == One))
> +                    {
> +                        Local0 = 0x0F
> +                    }
> +                    Else
> +                    {
> +                        Local0 = 0x0D
> +                    }
>                  }
> 
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
'Reported-by' maybe, but certainly not suggested.

After more thinking and given presence is system wide that doesn't change
at runtime, I don't see any reason for introducing presence bit as ABI
(and undocumented on top of that).

Instead changing AML code to account for it would be better,
something like this:

diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
index 32654dc274..4a3e591120 100644
--- a/include/hw/acpi/cpu.h
+++ b/include/hw/acpi/cpu.h
@@ -55,6 +55,7 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
 typedef struct CPUHotplugFeatures {
     bool acpi_1_compatible;
     bool has_legacy_cphp;
+    bool always_present_cpus;
     bool fw_unplugs_cpu;
     const char *smi_path;
 } CPUHotplugFeatures;
diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 5cb60ca8bc..2bcce2b31c 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -452,15 +452,16 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
 
         method = aml_method(CPU_STS_METHOD, 1, AML_SERIALIZED);
         {
+            uint8_t default_sta = opts.always_present_cpus?0xd:0;
             Aml *idx = aml_arg(0);
-            Aml *sta = aml_local(0);
+            Aml *sta = aml_local(default_sta);
 
             aml_append(method, aml_acquire(ctrl_lock, 0xFFFF));
             aml_append(method, aml_store(idx, cpu_selector));
             aml_append(method, aml_store(zero, sta));
             ifctx = aml_if(aml_equal(is_enabled, one));
             {
-                aml_append(ifctx, aml_store(aml_int(0xF), sta));
+                aml_append(ifctx, aml_or(aml_int(0xF), sta, sta));
             }
             aml_append(method, ifctx);
             aml_append(method, aml_release(ctrl_lock))

then for ARM set
 CPUHotplugFeatures::always_present_cpus = true
to get present flag always enabled

After that revert _all_ other presence bit related changes
that were just merged.
(I did ask to get rid of that in previous reviews but it
came back again for no good reason).

> Message-ID: <20241106100047.18901c9d@imammedo.users.ipa.redhat.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>  hw/acpi/cpu.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index 23443f09a5..b2f7a2b27e 100644
> --- a/hw/acpi/cpu.c
> +++ b/hw/acpi/cpu.c
> @@ -490,22 +490,22 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>              aml_append(method, aml_acquire(ctrl_lock, 0xFFFF));
>              aml_append(method, aml_store(idx, cpu_selector));
>              aml_append(method, aml_store(zero, sta));
> -            ifctx = aml_if(aml_equal(is_present, one));
> +            ifctx = aml_if(aml_equal(is_enabled, one));
>              {
> -                ifctx2 = aml_if(aml_equal(is_enabled, one));
> -                {
> -                    /* cpu is present and enabled */
> -                    aml_append(ifctx2, aml_store(aml_int(0xF), sta));
> -                }
> -                aml_append(ifctx, ifctx2);
> -                else_ctx = aml_else();
> +                /* cpu is present and enabled */
> +                aml_append(ifctx, aml_store(aml_int(0xF), sta));
> +            }
> +            aml_append(method, ifctx);
> +            else_ctx = aml_else();
> +            {
> +                ifctx2 = aml_if(aml_equal(is_present, one));
>                  {
>                      /* cpu is present but disabled */
> -                    aml_append(else_ctx, aml_store(aml_int(0xD), sta));
> +                    aml_append(ifctx2, aml_store(aml_int(0xD), sta));
>                  }
> -                aml_append(ifctx, else_ctx);
> +                aml_append(else_ctx, ifctx2);
>              }
> -            aml_append(method, ifctx);
> +            aml_append(method, else_ctx);
>              aml_append(method, aml_release(ctrl_lock));
>              aml_append(method, aml_return(sta));
>          }
