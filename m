Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp1792178njb;
        Sat, 6 Jul 2024 07:41:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUkbdduMb55wSuE2AN7x4GIfZ+C5Chx4msTTxdjcn8+1oRGSJHH6Sa+tr9NUG0ulFsX2cud2pZshFUsPblpeZUycyR9VZF7
X-Google-Smtp-Source: AGHT+IEU1KPt53Fwyk67HfXBRAwyoHrgelndyjaq+Bvntw3qDqBPUHIU2kQxj9vkq7Hd5451ATF/
X-Received: by 2002:a05:6214:2a4c:b0:6b5:33e:b40e with SMTP id 6a1803df08f44-6b5ed262f01mr78864076d6.54.1720276869670;
        Sat, 06 Jul 2024 07:41:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720276869; cv=none;
        d=google.com; s=arc-20160816;
        b=odJCYDNvGvIH932+aj1f2KiRetlUNRuV0R6G+m560ufIj/C1xqQ88wOgSf4FtTMVup
         FekDERNnh01jXCmukmh6IpeokQWfK5k6G1ojNgJ30JgYx6djmGTdlO9ynsGLK6HeNJJj
         BSrJbrVyYDg1X5Oq2v8tN2xTM6O/DHdL34gqoyiTr5dD6R+nZX+gUBAd9MOdLF4pZM/T
         aFx/chpj8+TWqRx+bRCeBDY0odncYkuuGJZet1CA+ZnsAPPeerfrcuvZQyCIQmBWoaVZ
         3mEfmH+13SOblDMNJNEoulcLCptldsqWOFHk21t5raQWG/GzSD6VcuuQyE1aWTcOLNpU
         84aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=gCKQWQ5N/O7xFn9vt40NyrtyS75JScU93rfdKb9KEdM=;
        fh=wcSQe0nA4Fd8SBhNd66f71V0lbT9ztlc7J4gDgtt5jU=;
        b=t1sAfesbolxhZ44U5oBwdvsMc3uU0+qR7JjBK42LAgl3q+kzRCrhPviOVI1MLg2ZJH
         aGLbYBDU7wT67LiZjA2wV7wfirzpTP0GR+inVomJ+DV4O7sIk90ZJRLOC+Tod+Fa4TuH
         9VzjIDwPi3kdtoYJlfu5qEMb1+nEcp+kku55irlQlKn/Hj6y8551iBI+ZSH7UtMG0ebB
         jY7q+aNo7IMRSccJ6BIBW26ys9XUNXIabGCoBQhwXsp/o0TGWdCJyTp9b74Z/1gzFt8i
         Br7onq1cLx9HcmX7FME9Ww8NFw+LeiNDHL6E789WyPOwWd9e/Oy8JNgHVyy+MmVfNjg9
         0w2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fRLyVkzd;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b609f12755si634526d6.89.2024.07.06.07.41.09
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 07:41:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fRLyVkzd;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720276869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gCKQWQ5N/O7xFn9vt40NyrtyS75JScU93rfdKb9KEdM=;
	b=fRLyVkzdH+1oy23K45H2D56RcvRDBWdE8ovhk2bfkJnlVSmD7i33dYoUyvEUbUXPXu7jc/
	3zM/79b+5Nab/XmnWlwnSLk4QW0oTRQOLNQYNJQnu5HfSMS6bkTHoqfcUVm2T7GUb22zIt
	y530IWoaihek3PiM9tKLJyLSm0+JWH8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-ce4ZEzG2NECOlVK-nqlYZg-1; Sat, 06 Jul 2024 10:41:08 -0400
X-MC-Unique: ce4ZEzG2NECOlVK-nqlYZg-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-36710f4d5c9so1607042f8f.3
        for <alex.bennee@linaro.org>; Sat, 06 Jul 2024 07:41:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720276867; x=1720881667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gCKQWQ5N/O7xFn9vt40NyrtyS75JScU93rfdKb9KEdM=;
        b=kC5RBEVe3ryYL5OD95f2j2oU8Ma8s2F6Yoa9c1bNrKDg5H9OcJPA8rsQj7+50/hfDY
         AWASdrVyBs6NM6coL2Sw4HvpoHbG5RzB7EfKQ3XQwgZjXOxSUFGl61LnO6KfJS8yvsHo
         gudtpVTD6fO5VdQ+EzthzhgQwFKU0afRGUYuuN9ITBXYRzh0Q4GyFybKgOTWuQ7yJHk8
         cQO/f3WUgWSxHxRVy4bW8+tSGFuoXV/H2uw+wMj/8oFUlAo5cLLAoa04LDpJUTiRh96B
         TfdNkwyg/ELsDV3MRKbfwyc/u+Z5ZfVQFVgm5BPiru60v5PyjPIY/3LYzv0UeWrko5zc
         UQZA==
X-Forwarded-Encrypted: i=1; AJvYcCWNPkQyvGfX1UMZJErooD7+TF4X4p7AqP2QasPh3FzBaD01WRDmErVj70KkivZSEgOjFPRQJIv5wGt6XlYHx1wao+A8yanh
X-Gm-Message-State: AOJu0YyaDvZi8FIcGB1x42t+BIMLo+QwKFNeEthACKdetRv2KGIc9+JZ
	uRDA/k1j8OY17MWHP9mFaHVFff/HfcadkOTFgNKjR6YA7Y3YIZ4QJ4v8DK7FrWffLR8MW6ZQGPc
	2UFDS6+nKG5A5dNQXdWIpKtmXex8mlRuCGtfKSnBFb2qSeDT3OZb8OQ==
X-Received: by 2002:adf:e68b:0:b0:367:4d9d:56a5 with SMTP id ffacd0b85a97d-3679dd63aa0mr5419487f8f.44.1720276866874;
        Sat, 06 Jul 2024 07:41:06 -0700 (PDT)
X-Received: by 2002:adf:e68b:0:b0:367:4d9d:56a5 with SMTP id ffacd0b85a97d-3679dd63aa0mr5419469f8f.44.1720276866450;
        Sat, 06 Jul 2024 07:41:06 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367a18c2810sm5772765f8f.18.2024.07.06.07.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 07:41:05 -0700 (PDT)
Date: Sat, 6 Jul 2024 16:41:03 +0200
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
Subject: Re: [PATCH V13 7/8] gdbstub: Add helper function to unregister GDB
 register space
Message-ID: <20240706164103.16662dd2@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240607115649.214622-8-salil.mehta@huawei.com>
References: <20240607115649.214622-1-salil.mehta@huawei.com>
	<20240607115649.214622-8-salil.mehta@huawei.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: LiiBG3wxmAsU

On Fri, 7 Jun 2024 12:56:48 +0100
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
> ---
>  gdbstub/gdbstub.c      | 13 +++++++++++++
>  hw/core/cpu-common.c   |  1 -
>  include/exec/gdbstub.h |  6 ++++++
>  3 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index b3574997ea..1949b09240 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -617,6 +617,19 @@ void gdb_register_coprocessor(CPUState *cpu,
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
> index 0f0a247f56..e5140b4bc1 100644
> --- a/hw/core/cpu-common.c
> +++ b/hw/core/cpu-common.c
> @@ -274,7 +274,6 @@ static void cpu_common_finalize(Object *obj)
>  {
>      CPUState *cpu = CPU(obj);
>  
> -    g_array_free(cpu->gdb_regs, TRUE);

so free() is gone but new  gdb_unregister_coprocessor_all() ain't called,
are we staring to leak some memory here?

>      qemu_lockcnt_destroy(&cpu->in_ioctl_lock);
>      qemu_mutex_destroy(&cpu->work_mutex);
>  }
> diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
> index eb14b91139..249d4d4bc8 100644
> --- a/include/exec/gdbstub.h
> +++ b/include/exec/gdbstub.h
> @@ -49,6 +49,12 @@ void gdb_register_coprocessor(CPUState *cpu,
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
