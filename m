Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp341593njb;
        Wed, 3 Jul 2024 20:27:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU4VmykRUJRbHIEwoeEX5uJWCRjG4KXKENj2HBDjKttxFBRDu+tH97+NCjiPBEISZCR3g5GmVPg3PvmiUCiVh5gUgtilC5B
X-Received: by 2002:a05:6808:1a2a:b0:3d2:212e:71a0 with SMTP id 5614622812f47-3d914c47231mr532301b6e.6.1720063678768;
        Wed, 03 Jul 2024 20:27:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720063678; cv=none;
        d=google.com; s=arc-20160816;
        b=A3AAzV64+lTrcW7+Jwda4tpr912MdMI1z+ktoKhCdg+7QX/9wDJAxwG2GXWG5CQv0z
         vk31p5FeME0IsH9FjCWF1mQZKL1+WNfRs4y73/yIFVuACPwgoLjT84XiDZUtC6Clgy9f
         bDr5lyAD2rx1I4SlurVunj6RKhGB05Hxi+QV3GlCzzHqhod2ozo1QaWe+BOCIoW29kdp
         SLcDiNElhrI7nMkAY+NdtRHNw10RvHAoSJieVd5/+UO0Do0e/05bV7DaSt/Nn0aVN7It
         5uFmRP0ZtrbOoqwIVXy6ifQ43kTGCMthDlBqHh+Vtq6mDzzKo5BKFWCEE1pDrrqOgogs
         Qjhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:dkim-signature;
        bh=I2+C7IcpdJ79NejgUr+JInPmtNhkeAMJDu7Mdn8JKaM=;
        fh=DNt5yCtGCyrMw14xPfCW1G8HNBJjfhomSsQZ2wuwKYA=;
        b=gb9PaiMFBAuu3cOQWIxx8kbdalkyP+vwKn40ptxNOMeW0t/Zq4zQRJgFNDn2bgHyrZ
         X6Z2MFAcUFaa2IsI6wAjD5dgtZDP+lsjO4OUib4QNCJvRs0K6QG1V8z7eq32f8cae2tr
         yMpkfvtS1qDlworCbdt6LBcZzuRsqO0YLi3zjRYyS3hWPGhUt8JC4+4YACtILmRDGYPe
         M7+VmSkm96ywn45NU13eR8dCMfVwsQzgUSmB+hOsz3ofSjS+Ey0qpqv1bZQWbM5g/xGQ
         SUjbJa8T8HorT3C+EranxpARSi2uSYcXrnhaRad6twAfBREFApplUB5cyeANLjHnBqaW
         5Qeg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=gB2g20NE;
       spf=pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=npiggin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <npiggin@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5614622812f47-3d567747969sor7622801b6e.10.2024.07.03.20.27.58
        (Google Transport Security);
        Wed, 03 Jul 2024 20:27:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=gB2g20NE;
       spf=pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=npiggin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720063678; x=1720668478; darn=linaro.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I2+C7IcpdJ79NejgUr+JInPmtNhkeAMJDu7Mdn8JKaM=;
        b=gB2g20NEGI5FEzKLOlHH8maczMWYd+YVy196O/P1M/+HhDwXrbxvKWktS/+LmZAQ9T
         rmjb9ATomWM5ZfTdQVfXi70SXNpm8HxRbmAS82hY7fG6aYOqSrRKT+wRyrGfaRfOqXIR
         qAfeKOXXEUvf88SKNBtb1RTKWFtE4ibb5XPoTgSe4u4GoLh3ObSM/cBEt7wWuM34jUJR
         7sLY2aPapmZuWZknWuuCj4/vHa3XqqHovogIANKguEGngZ53NiAsDz2+C7cK3MqFa6+/
         s8OJGwqr+jZQAQ0JfMzgjNaKyXk0xMs6km+0ZmiaQLIDDeLyyeXfws7GzyCwIJ2f2Dp+
         SpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720063678; x=1720668478;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I2+C7IcpdJ79NejgUr+JInPmtNhkeAMJDu7Mdn8JKaM=;
        b=fey5Tt4GPANxhMDS5Xlh6yVZpLqVfyavK3ChIgpBCALrs1kwKKhfEluDxPQW71yZw2
         J0I0isSNLmmT1p7e2LwMxCXJpOyDjC1VQApzpI8FnXNEP7MHjf5D5kBRq9mkF54qf6/O
         +PuxJf7UTGlbqraLSjGBxxcYLek/OpYQkbCQOefEgy5++Bix0Tr4dZZC6migN9F7zPeD
         MSiCKHkIjFXQjrhrwVUOEWalnQB6RSzmnRKLVN1nBptQs//ZO5B2QhB5Ye5SGZMZAzNP
         aHMpSCeZTCr0IeF9H/qPnDN2pDWN811Y1Lp4rb1vRRRnH9nm+QwHsze2PxiggpuyFCPP
         Wyow==
X-Forwarded-Encrypted: i=1; AJvYcCUCZ6sa4Revf35lnaWneTr6rdkrlPa6cVqwgGbTTicHopp2b49yHNToOk8zGHYxw5ppgtBfZPW6t+uXOKv+NnYvYL+0Fhs1ZV8+0MHyJF7i4vTEl32Qd/ERD+sMCuaEnGeElzzqmOGWhvD6UliKw46akFz//w9seQXuyGCjGIGIOhV4L4qiyVYejT5/s8gnnmx1XF93/dJuYsSkkq0camUa3zIZFgNAPz+KPT0=
X-Gm-Message-State: AOJu0YyVRhM2DwVKLjtWfEEh7lvz7+gmTF5/wlBamMlUOggfW+kqKs/M
	fI3Gwma+Y8O332GX8W04R8V8MmNotw+BsczBaRQKBBl+xC3Ik3cC
X-Google-Smtp-Source: AGHT+IEGlyu+NRmWlDH2wxZTHGG5TKQgpUk22AjSOy/xooV0LTDVe9GwBnQgvrQGuX2NtCNJ9vrOQQ==
X-Received: by 2002:a05:6808:284:b0:3d6:59a0:fccc with SMTP id 5614622812f47-3d914c5e895mr545338b6e.24.1720063678156;
        Wed, 03 Jul 2024 20:27:58 -0700 (PDT)
Return-Path: <npiggin@gmail.com>
Received: from localhost ([1.146.95.80])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7080246c662sm11204052b3a.61.2024.07.03.20.27.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 20:27:57 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Jul 2024 13:27:39 +1000
Message-Id: <D2GFOGQC3HYO.2LKOV306JIU98@gmail.com>
Cc: <maz@kernel.org>, <jean-philippe@linaro.org>,
 <jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
 <peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
 <imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
 <philmd@linaro.org>, <eric.auger@redhat.com>, <will@kernel.org>,
 <ardb@kernel.org>, <oliver.upton@linux.dev>, <pbonzini@redhat.com>,
 <gshan@redhat.com>, <rafael@kernel.org>, <borntraeger@linux.ibm.com>,
 <alex.bennee@linaro.org>, <harshpb@linux.ibm.com>, <linux@armlinux.org.uk>,
 <darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
 <vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
 <miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>,
 <zhukeqian1@huawei.com>, <wangxiongfeng2@huawei.com>,
 <wangyanan55@huawei.com>, <jiakernel2@gmail.com>, <maobibo@loongson.cn>,
 <lixianglai@loongson.cn>, <shahuang@redhat.com>, <zhao1.liu@intel.com>,
 <linuxarm@huawei.com>
Subject: Re: [PATCH RFC V3 25/29] target/arm/kvm: Write CPU state back to
 KVM on reset
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Salil Mehta" <salil.mehta@huawei.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <mst@redhat.com>
X-Mailer: aerc 0.17.0
References: <20240613233639.202896-1-salil.mehta@huawei.com>
 <20240613233639.202896-26-salil.mehta@huawei.com>
In-Reply-To: <20240613233639.202896-26-salil.mehta@huawei.com>
X-TUID: l3LVVKEwb1TO

On Fri Jun 14, 2024 at 9:36 AM AEST, Salil Mehta wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
>
> When a KVM vCPU is reset following a PSCI CPU_ON call, its power state
> is not synchronized with KVM at the moment. Because the vCPU is not
> marked dirty, we miss the call to kvm_arch_put_registers() that writes
> to KVM's MP_STATE. Force mp_state synchronization.

Hmm. Is this a bug fix for upstream? arm does respond to CPU_ON calls
by the look, but maybe it's not doing KVM parking until your series?
Maybe just a slight change to say "When KVM parking is implemented for
ARM..." if so.

>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>  target/arm/kvm.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 1121771c4a..7acd83ce64 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -980,6 +980,7 @@ void kvm_arm_cpu_post_load(ARMCPU *cpu)
>  void kvm_arm_reset_vcpu(ARMCPU *cpu)
>  {
>      int ret;
> +    CPUState *cs =3D CPU(cpu);
> =20
>      /* Re-init VCPU so that all registers are set to
>       * their respective reset values.
> @@ -1001,6 +1002,12 @@ void kvm_arm_reset_vcpu(ARMCPU *cpu)
>       * for the same reason we do so in kvm_arch_get_registers().
>       */
>      write_list_to_cpustate(cpu);
> +
> +    /*
> +     * Ensure we call kvm_arch_put_registers(). The vCPU isn't marked di=
rty if
> +     * it was parked in KVM and is now booting from a PSCI CPU_ON call.
> +     */
> +    cs->vcpu_dirty =3D true;
>  }
> =20
>  void kvm_arm_create_host_vcpu(ARMCPU *cpu)

Also above my pay grade, but arm_set_cpu_on_async_work() which seems
to be what calls the CPU reset you refer to does a bunch of CPU register
and state setting including the power state setting that you mention.
Would the vcpu_dirty be better to go there?

Thanks,
Nick
