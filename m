Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2256590nji;
        Mon, 15 Jul 2024 06:40:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUMCvoChEk9IM1RpdPKyiO+nzys9pW8x+rBkK2lwV1b/2KTP0yHmRj/ysTaxKvSKJ/mzkIlCjY+uHCLoOW4GenXnjJdf5d9
X-Google-Smtp-Source: AGHT+IHBCN/OPIF0C5netPgy8WqxQgsumo8kp4EAaXzwHQLT667nxHSBJNWBcTWREBd+crGn+yqe
X-Received: by 2002:a05:6102:cd4:b0:48f:dfb8:4d9e with SMTP id ada2fe7eead31-490321589c2mr24035335137.7.1721050836951;
        Mon, 15 Jul 2024 06:40:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721050836; cv=none;
        d=google.com; s=arc-20160816;
        b=I02xKbhr+i7eLCE/nKeZMAz95jidv+KSkuhFvL6QDkrwRzHKErbJ+HcrO3AGyrGAGe
         5L/zrBOllYROE+Jp1yOfUGi+M08w5HtBsx7FUBc3NYjImBN/G8Giubi4FuYeF0xh4ZQz
         /VrOH1cdMxVyJaX0J1GLyRizwut7/IQSYAdns7+98ew1kP1C8gnoMbv40dbfqbjLtDnN
         U5sbv8ly9GuPWeClgexDrtDVTV3cSBQsoRiIGmfjhjgenFgcGeVtemR7b3Ub/B6m6LxP
         63rX4C+WsKgU+fOcXi2v+OcsqQt/BhKqnIuULsroqMkwRUjg5cKbzdZ/rzzHxvJIv7aM
         ETKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=0CePbDAFK3Cwx4iJFDM/ZEI2OLkyFBDt7VdipzQwDjA=;
        fh=iDz01RCnFCsdspT8AqTt/qRLQYw4ELNOVSb5OWUyb64=;
        b=OT1g+Dyg8BJnOkqp70NNxzfwpDn8ZThTvmTWu4IrRPURDRuwE3pEK27fIYCKcN2IuS
         NyFaYPheHJ9oFnDFOHGsfXsHeBhdownBM0LDzSUrJxuEtCMQoeVFIq+u99s8Q4EkZZEW
         WV5miWq2eTPm8a/dE6GR6Xm+1Sq8MvQ5GEyZTjJcGcgipyusi98KNwzyZGHToMQIeiXF
         j3XshuCcJoXoUAqCsLDe17jwADQ63uukoBv26IrcxEPGZl+JrvrsjCtET+4WbKJdclVc
         80ELBFtHdwWZKqjwvyMkUzOb4VvRXL1Xs1ueCFEVlXdNU4dP/x9rTw6ygBELcnDtoes+
         xq0w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Nt9WxQrA;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ada2fe7eead31-4912b1d2c17si595495137.299.2024.07.15.06.40.36
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 06:40:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Nt9WxQrA;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721050836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0CePbDAFK3Cwx4iJFDM/ZEI2OLkyFBDt7VdipzQwDjA=;
	b=Nt9WxQrAZ5Pz/fzF7w5z0A7ndGEqg1Na3jWXSAVBlChy/r+gNsGWKPGUil6dtp16ITA5r9
	66U6JePe/whfXExR8kqxlg9gCUwDq/XzQcOlO7LbkIAV90sNh8ondlVDNr+f5BT7YIKvrB
	pjyPLBUES+4cJl76MnVF4qfC0lX3U5o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-iPrlIA1rN_mp1wFRyfQISA-1; Mon, 15 Jul 2024 09:40:34 -0400
X-MC-Unique: iPrlIA1rN_mp1wFRyfQISA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-426d316a96cso31082095e9.0
        for <alex.bennee@linaro.org>; Mon, 15 Jul 2024 06:40:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721050833; x=1721655633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0CePbDAFK3Cwx4iJFDM/ZEI2OLkyFBDt7VdipzQwDjA=;
        b=Pk4ZNzTf3NsBxvJDmTcxwjh4mOhlY3tMEUo5KUIZh66f/r09Ptct0s7lqARNgQFIWK
         FP5vobpvJXn6kxMIcJVnKIhAkZJwAvf4eRrFPy25ahzqF/XkaU6qJaD56L0Dduyy8qb7
         /5uNMEhJGmpI9W+3HNangu9JydkWaPk0NOW7Wn5ye0NRf3fzO3EeEhVZDMv+TRdgu4N1
         wZoJPq38EhYKDKYYzt1UF4kWBJvTjDWXEtv//rTNdkfzrcCzAwyRQ5CP2yN7tKnSSJWu
         QzfLuaFwKdjdoJ47/9gPMTcqD9IK/RL7KvOaJcIb1jyUQwdCigEZ7gsOuays5cRqLBXH
         5sOg==
X-Forwarded-Encrypted: i=1; AJvYcCXEcdyNJ+5kt2hovaMPdScKmAw65OCRSNdOGFABu8T0DnUdZfu+B+JQtRbXW9ytn1uDwLs0imo0ywzLhphwRh+lWZx1wSoW
X-Gm-Message-State: AOJu0Yy5ur/M9PSraIKtQqW62uZLE/9C1eef543k0VhIeT9cQorkieez
	qdW8EbQ4Dz4tnfy614Oz5gWvhXf2Tc9ZkybbiNU1ZvUARgWw15UxsGLI/SZsWPfEEZrllLEi3FN
	Xje7PIj3yQxjFe6E8c3NSA+jN8eXukeMVV7Wg9fUEdEDim2quiNuvIQ==
X-Received: by 2002:a05:6000:2c5:b0:367:9c4b:6486 with SMTP id ffacd0b85a97d-367cea965f2mr17195104f8f.32.1721050832947;
        Mon, 15 Jul 2024 06:40:32 -0700 (PDT)
X-Received: by 2002:a05:6000:2c5:b0:367:9c4b:6486 with SMTP id ffacd0b85a97d-367cea965f2mr17195066f8f.32.1721050832552;
        Mon, 15 Jul 2024 06:40:32 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dabf128sm6423597f8f.40.2024.07.15.06.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 06:40:32 -0700 (PDT)
Date: Mon, 15 Jul 2024 15:40:30 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <maz@kernel.org>,
 <jean-philippe@linaro.org>, <jonathan.cameron@huawei.com>,
 <lpieralisi@kernel.org>, <peter.maydell@linaro.org>,
 <richard.henderson@linaro.org>, <andrew.jones@linux.dev>,
 <david@redhat.com>, <philmd@linaro.org>, <eric.auger@redhat.com>,
 <oliver.upton@linux.dev>, <pbonzini@redhat.com>, <mst@redhat.com>,
 <will@kernel.org>, <gshan@redhat.com>, <rafael@kernel.org>,
 <alex.bennee@linaro.org>, <linux@armlinux.org.uk>,
 <darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
 <vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
 <miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>,
 <zhukeqian1@huawei.com>, <wangxiongfeng2@huawei.com>,
 <wangyanan55@huawei.com>, <jiakernel2@gmail.com>, <maobibo@loongson.cn>,
 <lixianglai@loongson.cn>, <npiggin@gmail.com>, <harshpb@linux.ibm.com>,
 <linuxarm@huawei.com>, Shaoqin Huang <shahuang@redhat.com>, Zhao Liu
 <zhao1.liu@intel.com>
Subject: Re: [PATCH V15 7/7] gdbstub: Add helper function to unregister GDB
 register space
Message-ID: <20240715154030.44ebfb7e@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240713182516.1457-8-salil.mehta@huawei.com>
References: <20240713182516.1457-1-salil.mehta@huawei.com>
	<20240713182516.1457-8-salil.mehta@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: RtuMX9n9WfKZ

On Sat, 13 Jul 2024 19:25:16 +0100
Salil Mehta <salil.mehta@huawei.com> wrote:

> Add common function to help unregister the GDB register space. This shall be
> done in context to the CPU unrealization.
> 
> Note: These are common functions exported to arch specific code. For example,
> for ARM this code is being referred in associated arch specific patch-set:
> 
> Link: https://lore.kernel.org/qemu-devel/20230926103654.34424-1-salil.mehta@huawei.com/
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Xianglai Li <lixianglai@loongson.cn>
> Tested-by: Miguel Luis <miguel.luis@oracle.com>
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> Reviewed-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> Tested-by: Zhao Liu <zhao1.liu@intel.com>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  gdbstub/gdbstub.c      | 13 +++++++++++++
>  hw/core/cpu-common.c   |  4 +++-
>  include/exec/gdbstub.h |  6 ++++++
>  3 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index b9ad0a063e..5da17d6530 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -618,6 +618,19 @@ void gdb_register_coprocessor(CPUState *cpu,
>      }
>  }
>  
> +void gdb_unregister_coprocessor_all(CPUState *cpu)
> +{
> +    /*
> +     * Safe to nuke everything. GDBRegisterState::xml is static const char so
> +     * it won't be freed
> +     */
> +    g_array_free(cpu->gdb_regs, true);
> +
> +    cpu->gdb_regs = NULL;
> +    cpu->gdb_num_regs = 0;
> +    cpu->gdb_num_g_regs = 0;
> +}
> +
>  static void gdb_process_breakpoint_remove_all(GDBProcess *p)
>  {
>      CPUState *cpu = gdb_get_first_cpu_in_process(p);
> diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
> index b19e1fdacf..fe5383b4f9 100644
> --- a/hw/core/cpu-common.c
> +++ b/hw/core/cpu-common.c
> @@ -281,7 +281,9 @@ static void cpu_common_finalize(Object *obj)
>          g_free(cpu->plugin_state);
>      }
>  #endif
> -    g_array_free(cpu->gdb_regs, TRUE);
> +    /* If cleanup didn't happen in context to gdb_unregister_coprocessor_all */
> +    if (cpu->gdb_regs)
> +        g_array_free(cpu->gdb_regs, TRUE);
>      qemu_lockcnt_destroy(&cpu->in_ioctl_lock);
>      qemu_mutex_destroy(&cpu->work_mutex);
>      qemu_cond_destroy(cpu->halt_cond);
> diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
> index 1bd2c4ec2a..d73f424f56 100644
> --- a/include/exec/gdbstub.h
> +++ b/include/exec/gdbstub.h
> @@ -40,6 +40,12 @@ void gdb_register_coprocessor(CPUState *cpu,
>                                gdb_get_reg_cb get_reg, gdb_set_reg_cb set_reg,
>                                const GDBFeature *feature, int g_pos);
>  
> +/**
> + * gdb_unregister_coprocessor_all() - unregisters supplemental set of registers
> + * @cpu - the CPU associated with registers
> + */
> +void gdb_unregister_coprocessor_all(CPUState *cpu);
> +
>  /**
>   * gdbserver_start: start the gdb server
>   * @port_or_device: connection spec for gdb
