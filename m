Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp1292612ejb;
        Mon, 20 May 2024 01:04:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWYOdNbNgfFnm06PZqnj4mBVHy/h0FVi3p0ZPVO6vjCYGhwSZywoGAS8VX6CLxIAP7nZD4F8GbGNH1oU8iJAZKCW3VWqmf8
X-Received: by 2002:a17:902:ccc8:b0:1f2:fb86:5cc5 with SMTP id d9443c01a7336-1f2fb86639emr35753915ad.10.1716192261813;
        Mon, 20 May 2024 01:04:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716192261; cv=none;
        d=google.com; s=arc-20160816;
        b=OLbEKpAsuJjqZ7QxfKaBeTjbzbhr5ZYPeI2fwr2hIuyM9y49ptlj+krWiFhAKebk36
         Zpb4JxdKX1xaxw3Z7D9VdCls3tSpSECZyMig+qTROLoYGwP90ebmMFYpG01iQehO2c1R
         GxInale2YcIjoe+kFGIrfYIeCNQp/rTP9IFYqPMFdY4rPOt9yniVn6bHuHlUpgV5mo4Z
         OeHHxmWDpmeWDPIBjV7xI8yzHN1XhWWtO9vDjWfqMoAjhFaQdKgrLHR0XcnASXYV06fW
         5eA7Yvg7ZbAf36EPjL0PppslIh1lY21qf6yvITICZARk2PFkorCCXr1iES0xQOJRhkPQ
         kXXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:dkim-signature;
        bh=2HLSOlbk8MkRDlwV+ug+nW4TY34NAp2SioguHodiQJo=;
        fh=ubL+kviqY5Y7f0tIlCWWD2Ewmk2zFxGqG97ikcuk55I=;
        b=D2wob4H6hb+fY5Dn13lwiw1c5dHx557TOV4pz8R6Dg4t0o2LdaTvpMTzLvFYjRvu2v
         F7yDq6D5gB73DNktJtGG/6S+IQ4iSGg5+kKEbHH+CogDzaSFQRe3b3X2Ylg7fMq+tbOi
         1Xb4cq4V+2pFHe9F5n/NRJrUryrT4TkOX99M7AVY20YtOFu5rEX+OvUb+glSUEmr7p1e
         TZAuQYPXAo75jg1OAmI7Ae3v71Sx5f7x/AqXNMl5FPOjbN4qB+FHkmj43AZDlUAXE16D
         K8+7A5gnSGWgkwkjj/c8b2Rv7dtSXNrBSxTKADthdtjKXwJVtD5DYlKC3fWnzB0m994/
         trsg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=lv7FklXk;
       spf=pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=npiggin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <npiggin@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-1ef0bc020c6sor139258315ad.9.2024.05.20.01.04.21
        (Google Transport Security);
        Mon, 20 May 2024 01:04:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=lv7FklXk;
       spf=pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=npiggin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716192261; x=1716797061; darn=linaro.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HLSOlbk8MkRDlwV+ug+nW4TY34NAp2SioguHodiQJo=;
        b=lv7FklXk224TYxyfg5f3084aDRK2uria9lyehGPeJcTsRKVEWzRwXsQEjk8NtF75Q5
         FUszkpmn7TC18yJSBF2HOFLJLZ6wA9uW27aI1k/xCnHCMIy081G/fa0TLwWbLzWge7HG
         tX2INQPVMIcGxbOdDGQfAvJFeF6D6pYeHLCDFcC4dnXYLk4NsKxSO5ftZads8OLURwo6
         BV4gXbyoyR6kUyZp3Zt+U6dFn58s+g/X/TynAeA1GhWDu7lMMakqEAg6JkugEI+RLZqb
         i2epfms2+22kITxdNXHXVYrD78UOaEIlMzAh+vw1n1fIgpHVU+sIPKd38AMpEGMdLq6q
         SNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716192261; x=1716797061;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2HLSOlbk8MkRDlwV+ug+nW4TY34NAp2SioguHodiQJo=;
        b=ldrzU+CJO6p3Td18qFu5ZzBGsq8I1LXX4/OGVxs/MkDEGn/pm7jioGF6MozJHfo5Cr
         hziY0dyjbZtaV+q1jWS+x8a6wZL0mAZNFB4aCpNdwc+LU98SZ7IHPvSRA9/R9zDZvYlo
         lGb6VilyQxvQk3wNHJBsjXcEy3UK16o9oAi7Yo3VBIleIRWs7CJvmoE1347AqaW10nPb
         qGCN040Bun6zz3Wy4oEhuxSoNPC633BeaWhik2yXl2LeyfONbixtIU1kJUWmWRSsTKGY
         TM+qSuPaw80cj5Prg8AqsV4KhD2LVGXIkbApZkzOUhYRUUBONKm+prUf7ZFmvfAC+/Mh
         CqlA==
X-Forwarded-Encrypted: i=1; AJvYcCXJFcbQgM/stM8UuCvEVYAvNrajaT4HUCfs1qxto3CogJKfABqMgrueUTZWWjGnnJlOxLK4XG/HIZ3fCDudrKzW4nioSLchx8xWOztdapKYosPSCLgdTsaNsN4wa921ObWqoPb9muXx1wABCM8k0zPU/3lpU5D2hCM1ZPWvhEfiG6cSOGkog4Zt/eNg3ke1pFf9U2h38gy2vPEl3yOMFYDLOjdIf+0dBLgEayU=
X-Gm-Message-State: AOJu0YyuIkPNzIVZnBC7PKKpsP2flK1+E5Smq5yBzhucnT+gLo/d9yNY
	aG2z0ysobOyY+kzOgwXsDO6UYd0XOG5VEGsVpHtzpBT5QFuJhgGl
X-Google-Smtp-Source: AGHT+IHCcnxMQZJJT6z9Ihx57EeT4LXDGcMlaXuZFNRkJMcpCkXKIAH6Wm1D74NRgWhfucnNiURczg==
X-Received: by 2002:a17:902:daca:b0:1f2:fb02:3dfd with SMTP id d9443c01a7336-1f2fb02401bmr37797175ad.11.1716192261169;
        Mon, 20 May 2024 01:04:21 -0700 (PDT)
Return-Path: <npiggin@gmail.com>
Received: from localhost ([1.146.114.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bad9da4sm197233065ad.107.2024.05.20.01.04.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 May 2024 01:04:20 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 May 2024 18:04:03 +1000
Message-Id: <D1EBDKJQ19G2.7K7FS8Z9BA5D@gmail.com>
Subject: Re: [PATCH V9 1/8] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Salil Mehta" <salil.mehta@huawei.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
Cc: <maz@kernel.org>, <jean-philippe@linaro.org>,
 <jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
 <peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
 <imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
 <philmd@linaro.org>, <eric.auger@redhat.com>, <oliver.upton@linux.dev>,
 <pbonzini@redhat.com>, <mst@redhat.com>, <will@kernel.org>,
 <gshan@redhat.com>, <rafael@kernel.org>, <alex.bennee@linaro.org>,
 <linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
 <ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
 <karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
 <salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
 <wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
 <jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
 <harshpb@linux.ibm.com>, <linuxarm@huawei.com>, "Jonathan Cameron"
 <Jonathan.Cameron@huawei.com>, "Shaoqin Huang" <shahuang@redhat.com>
X-Mailer: aerc 0.17.0
References: <20240519210620.228342-1-salil.mehta@huawei.com>
 <20240519210620.228342-2-salil.mehta@huawei.com>
In-Reply-To: <20240519210620.228342-2-salil.mehta@huawei.com>
X-TUID: GyI3BU4BumxW

On Mon May 20, 2024 at 7:06 AM AEST, Salil Mehta wrote:
> KVM vCPU creation is done once during the vCPU realization when Qemu vCPU=
 thread
> is spawned. This is common to all the architectures as of now.
>
> Hot-unplug of vCPU results in destruction of the vCPU object in QOM but t=
he
> corresponding KVM vCPU object in the Host KVM is not destroyed as KVM doe=
sn't
> support vCPU removal. Therefore, its representative KVM vCPU object/conte=
xt in
> Qemu is parked.
>
> Refactor architecture common logic so that some APIs could be reused by v=
CPU
> Hotplug code of some architectures likes ARM, Loongson etc. Update new/ol=
d APIs
> with trace events instead of DPRINTF. No functional change is intended he=
re.

This is a nice cleanup and helps with ppc hotplug as well.

Has there been any architecture code posted yet?

Just a few minor thing:

>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Tested-by: Xianglai Li <lixianglai@loongson.cn>
> Tested-by: Miguel Luis <miguel.luis@oracle.com>
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> Reviewed-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> ---
>  accel/kvm/kvm-all.c    | 64 ++++++++++++++++++++++++++++++++----------
>  accel/kvm/kvm-cpus.h   | 14 +++++++++
>  accel/kvm/trace-events |  5 +++-
>  3 files changed, 67 insertions(+), 16 deletions(-)
>
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index c0be9f5eed..9cd7d69bde 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -128,6 +128,7 @@ static QemuMutex kml_slots_lock;
>  #define kvm_slots_unlock()  qemu_mutex_unlock(&kml_slots_lock)
> =20
>  static void kvm_slot_init_dirty_bitmap(KVMSlot *mem);
> +static int kvm_get_vcpu(KVMState *s, unsigned long vcpu_id);
> =20
>  static inline void kvm_resample_fd_remove(int gsi)
>  {
> @@ -340,14 +341,53 @@ err:
>      return ret;
>  }
> =20
> +void kvm_park_vcpu(CPUState *cpu)
> +{
> +    struct KVMParkedVcpu *vcpu;
> +
> +    trace_kvm_park_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
> +
> +    vcpu =3D g_malloc0(sizeof(*vcpu));
> +    vcpu->vcpu_id =3D kvm_arch_vcpu_id(cpu);
> +    vcpu->kvm_fd =3D cpu->kvm_fd;
> +    QLIST_INSERT_HEAD(&kvm_state->kvm_parked_vcpus, vcpu, node);
> +}

Could you move kvm_get_vcpu up here so it's next to kvm_park_vcpu, and
then you don't need to forward declare it. Call it kvm_unpark_vcpu() for
symmetry with park.

Thanks,
Nick
