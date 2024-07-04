Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp329976njb;
        Wed, 3 Jul 2024 19:49:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUIACNmF/fiLR8lAvPVkgLwd5SGTpZETEPoESxV94XcF69Debp2r+1MIEEES63FZv53j7Vvn634+9wZ/Owy3llyPlqCY0GM
X-Received: by 2002:a05:6808:5d2:b0:3d6:2b99:2e14 with SMTP id 5614622812f47-3d914c63da3mr373948b6e.21.1720061388033;
        Wed, 03 Jul 2024 19:49:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720061388; cv=none;
        d=google.com; s=arc-20160816;
        b=GW4sHCBAbZT9GlZ/dE/+WSAulEfY0mGobC+2zsP77qViFsPtqGwaP9cyWXOjZZmZu5
         Yk3lNrxiFxSwoTQBACRhTsAYdUidiDR2TIcDrMRGV2zaBBq/p1XoWIUjXmuhq46pdnXl
         FDlmaX8Dz4kIDJDWHh4+enV7us38ZaNxtcR9pJpju9OmVh06uErrW+uVUaEghMFlg8JS
         sLNPONywXdaGAvnY6e4S+bCb6A/kDVsDj/AHPRj54uYcNMsXscBfcD1mjmMxuJF3gh72
         JGPRf1yIop7nNenLdS3EzSOZM6kHhKykXtY5MaECJG9lkYLBb5E45mlmdcQBdHJ0uQ5n
         LyVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:dkim-signature;
        bh=faVAZXn9bsK4fGeINzwAK3yajvwzHgOzvX/M33g9KJE=;
        fh=MN7qvEFmxxOFCGdmTZARN8W7olBTBx8i5MjDl6DZCoo=;
        b=W7HAt1jR8sQGXgB/5IPzAyD+UVdXco+nbfHDcwxa5rW7zgTfnZ31CLYTC7BCTnhx9N
         605qy73a6HJedQzAMKf+tad4VBZp/hCTpXRSgfUe2vsCSe2GopVYMKrjCOc8Gnr/bYkO
         FdofJ1z0Q5x8xJTAz2hUq29i3esbhmvlkEZxKo6y5x8cTMbgsw6eFwyH6G6Mejc+/dM1
         HTRJ/z/cmBROrdRlgDYYFoIufY57hAboKfmTtiqgYm0DlYMnlo4HwCiWKL/SfwAUaTcu
         wWf78QeZN3ImC25JBK6v1UAa6iAq0AJE59JB+2jTzA8GJzwd80f6bwKCFtHaB7H/UP+Y
         rzLg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=OxJKkTop;
       spf=pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=npiggin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <npiggin@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5614622812f47-3d56778ee6fsor7303649b6e.15.2024.07.03.19.49.47
        (Google Transport Security);
        Wed, 03 Jul 2024 19:49:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=OxJKkTop;
       spf=pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=npiggin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720061387; x=1720666187; darn=linaro.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=faVAZXn9bsK4fGeINzwAK3yajvwzHgOzvX/M33g9KJE=;
        b=OxJKkTopnc6XllTadt0p5bK5k0logjxPFa06fo1HPWpcqhp2g2l3PeIyetC+Z9+aRc
         NlqONBx3MPtbsxsAs4U/Nr2So73UsUkqSORQYPUTmove+7AxwMSKrPlpHHaUGfLCif2P
         c23xcjaSf/3PTLrijXhHT1t7boQqPwWN5YlqZCL8TV9qJNSDoillE4rOBfvzi2pbsr07
         1TG7fjhesp4IOSPIi08qthQ1vY8B/2CjozPGUwgMAwvieqA73f9+cZfBMeDt7ZSAeezF
         w7AyZrwevAOUXO3wYi0sWxNcBHnC4I8HAgFLyHxF6TKzZcjn77zBhiGipVJKXjLIpSo0
         9AgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720061387; x=1720666187;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=faVAZXn9bsK4fGeINzwAK3yajvwzHgOzvX/M33g9KJE=;
        b=u7/sU/ZamBplN2vSiUXDLFFcnolAwOKsFN80cKdIZkcp/nNwGhHTtz6y0s+9XgBFBI
         j9mlel6M+R8ePTa0eY4ptV+lF7TEAOEz/jVcksxMKShTafeH4v1vd65u8nKQZ18+UEqu
         Y9o+le9ZBs3Pf3ZH1wKKFhg1gEIWybbVzXifwlqcL0iDMsGAtrgaDULfqqg9Id6fxPWu
         XmUzLPR6y9P1gVH8JTpSoqeNmXOegE/w+AkzvsBa+ejVzzQ2Hdgm86JmBvT4yX1TZmAm
         bVxEWaso9c9Y552ucOVB0HLnrI9mJYtAHWWdgFlOaz9e8Wb2FUuszorjkKniIkYojtPc
         Q7yQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/wce12G6Wdb0C/7Mg7H9JQAk3lM04y1RAu1bUDdwJeEpv+O1nyYwkFLi80KgO2Vlp3zel/4t6MTdOrPbayO2kQNNtIeHtx+0LIhzofmrtmW72VoojJA5IlX2/IoNjL9aNNU6wlzKGqmCEIbPDyv8lL5rnatbtOoNydQimosOnkPm/hhOp/4J/tit8m9qnKi+xdOQy4mep5bK3C+SvdlcPLdiWdDdpWL3yQHU=
X-Gm-Message-State: AOJu0YwF3wFfbrjV+IqxmNY4JbaOt+EjK+Oman9IQfG56AjEZSVid0OX
	Mv0a4se0vweiqcGXN/VEEJuxYtyvzEwfCWGpf9H8GD/PZsPx9fUp
X-Google-Smtp-Source: AGHT+IEUtrGurlX1HtjaYCvPArOnmH69qkJ09MiCg5xXoxVF+wfQjl5oZlGGffxlfav7LhRHYvfhhg==
X-Received: by 2002:a05:6808:907:b0:3d6:30e5:ef06 with SMTP id 5614622812f47-3d914c63b4fmr342690b6e.17.1720061387262;
        Wed, 03 Jul 2024 19:49:47 -0700 (PDT)
Return-Path: <npiggin@gmail.com>
Received: from localhost ([1.146.95.80])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70803fc8b84sm11148870b3a.103.2024.07.03.19.49.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 19:49:46 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Jul 2024 12:49:29 +1000
Message-Id: <D2GEV8KD5L3F.FRD8UH16X3GU@gmail.com>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Salil Mehta" <salil.mehta@huawei.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <mst@redhat.com>
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
Subject: Re: [PATCH RFC V3 13/29] arm/virt: Make ARM vCPU *present* status
 ACPI *persistent*
X-Mailer: aerc 0.17.0
References: <20240613233639.202896-1-salil.mehta@huawei.com>
 <20240613233639.202896-14-salil.mehta@huawei.com>
In-Reply-To: <20240613233639.202896-14-salil.mehta@huawei.com>
X-TUID: BIbKzc57W90a

On Fri Jun 14, 2024 at 9:36 AM AEST, Salil Mehta wrote:
> ARM arch does not allow CPUs presence to be changed [1] after kernel has =
booted.
> Hence, firmware/ACPI/Qemu must ensure persistent view of the vCPUs to the=
 Guest
> kernel even when they are not present in the QoM i.e. are unplugged or ar=
e
> yet-to-be-plugged

Do you need arch-independent state for this? If ARM always requires
it then can it be implemented between arm and acpi interface?

If not, then perhaps could it be done in the patch that introduces
all the other state?

> References:
> [1] Check comment 5 in the bugzilla entry
>    Link: https://bugzilla.tianocore.org/show_bug.cgi?id=3D4481#c5

If I understand correctly (and I don't know ACPI, so it's likely
I don't), that is and update to ACPI spec to say some bit in ACPI
table must remain set regardless of CPU hotplug state.

Reference links are good, I think it would be nice to add a small
summary in the changelog too.

Thanks,
Nick

>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>  cpu-common.c          |  6 ++++++
>  hw/arm/virt.c         |  7 +++++++
>  include/hw/core/cpu.h | 21 +++++++++++++++++++++
>  3 files changed, 34 insertions(+)
>
> diff --git a/cpu-common.c b/cpu-common.c
> index 49d2a50835..e4b4dee99a 100644
> --- a/cpu-common.c
> +++ b/cpu-common.c
> @@ -128,6 +128,12 @@ bool qemu_enabled_cpu(CPUState *cpu)
>      return cpu && !cpu->disabled;
>  }
> =20
> +bool qemu_persistent_cpu(CPUState *cpu)
> +{
> +    /* cpu state can be faked to the guest via acpi */
> +    return cpu && cpu->acpi_persistent;
> +}
> +
>  uint64_t qemu_get_cpu_archid(int cpu_index)
>  {
>      MachineState *ms =3D MACHINE(qdev_get_machine());
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 5f98162587..9d33f30a6a 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -3016,6 +3016,13 @@ static void virt_cpu_pre_plug(HotplugHandler *hotp=
lug_dev, DeviceState *dev,
>          return;
>      }
>      virt_cpu_set_properties(OBJECT(cs), cpu_slot, errp);
> +
> +    /*
> +     * To give persistent presence view of vCPUs to the guest, ACPI migh=
t need
> +     * to fake the presence of the vCPUs to the guest but keep them disa=
bled.
> +     * This shall be used during the init of ACPI Hotplug state and hot-=
unplug
> +     */
> +     cs->acpi_persistent =3D true;
>  }
> =20
>  static void virt_cpu_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 62e68611c0..e13e542177 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -540,6 +540,14 @@ struct CPUState {
>       * every CPUState is enabled across all architectures.
>       */
>      bool disabled;
> +    /*
> +     * On certain architectures, to provide a persistent view of the 'pr=
esence'
> +     * of vCPUs to the guest, ACPI might need to fake the 'presence' of =
the
> +     * vCPUs but keep them ACPI-disabled for the guest. This is achieved=
 by
> +     * returning `_STA.PRES=3DTrue` and `_STA.Ena=3DFalse` for the unplu=
gged vCPUs
> +     * in QEMU QoM.
> +     */
> +    bool acpi_persistent;
> =20
>      /* TODO Move common fields from CPUArchState here. */
>      int cpu_index;
> @@ -959,6 +967,19 @@ bool qemu_present_cpu(CPUState *cpu);
>   */
>  bool qemu_enabled_cpu(CPUState *cpu);
> =20
> +/**
> + * qemu_persistent_cpu:
> + * @cpu: The vCPU to check
> + *
> + * Checks if the vCPU state should always be reflected as *present* via =
ACPI
> + * to the Guest. By default, this is False on all architectures and has =
to be
> + * explicity set during initialization.
> + *
> + * Returns: True if it is ACPI 'persistent' CPU
> + *
> + */
> +bool qemu_persistent_cpu(CPUState *cpu);
> +
>  /**
>   * qemu_get_cpu_archid:
>   * @cpu_index: possible vCPU for which arch-id needs to be retreived
