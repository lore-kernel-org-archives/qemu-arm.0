Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp1990353ejt;
        Tue, 28 Nov 2023 08:00:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHHfTWxIe9Np8NADeeF+24BXcb+sQarrh/9lJxjJPX11eWmZRzjDp9fITvecmz3iwF9EDVn
X-Received: by 2002:a05:622a:1894:b0:423:8e35:794d with SMTP id v20-20020a05622a189400b004238e35794dmr20313596qtc.26.1701187215968;
        Tue, 28 Nov 2023 08:00:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701187215; cv=none;
        d=google.com; s=arc-20160816;
        b=EfRqVKwN+5c3huYFWyH17hnpe+WaZTiePM0HThr47N58e4419UPgj2R7LMg/X4ynu9
         q1koBDr5wb4NBp2qVLa/NgeTAT80rz0bHH7dKeiDLPOGFYpoDnAIoF/oQhwGmUVyEsmG
         5sxRImdPvB4H76OUfig4oBqWPxaFn+nZpacMGluWZdLR7KktDXZOgKu/ywPGEOnvUaEZ
         /P/kax0P8DAjnx4G9i/v/5rQfrhvCQCmDV78d3IlaB+ePm+EfuBiRpgfIiT+VVSZllyC
         DTXQz8XFDS0xZEWbHfQqIr5vjCJixfkE1Td+tkmo3rmP6ajyo18eBOow7fTyxqgtjFAk
         E8oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=RzhdmniUAulYKiMWHmvNUF6uT6F1wxvW3o6/RqMDVpk=;
        fh=wV6b0TL7corVRWTR29RPx4Qkj2+2+kgqvIqkMoPpvnQ=;
        b=vvKPh9eRdIpXu/J8nylTZjmVkAEti3Uih/C5X6YUW6cQiDnNgpm2PLM8/9sEQMNJAK
         Xbic0jDXh/enuSbJybS97ZydZDfSCcZyuKflKH/r+tVdQwwk8bSqigkQTE34tH7iFAS5
         ngBeNIMLLNEQ+lz5NrjgmlH0h9c4PyZ72gFA3VOVuCwBba84u3vFX1KfWEtd8NkdJtoL
         Kff0eA6pCmy11l+TrLfHj/Q18U0Kt3qljOfeiQoraAHGsCPsQ9jVOaJns5nHoKAAcQrH
         HGyoiNbVikSLaIrUTpuXK4n2fdnYiE5BT9loOhlDsgS7EENSDb/KRIbTNNwqWhk+1pYe
         3rxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AxDoFlZX;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id bx8-20020a05622a090800b00423a11532b6si8300464qtb.492.2023.11.28.08.00.15
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 08:00:15 -0800 (PST)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AxDoFlZX;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701187215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RzhdmniUAulYKiMWHmvNUF6uT6F1wxvW3o6/RqMDVpk=;
	b=AxDoFlZXp+75hbVfphNz/HB0EIC5pyan1JGc9UDmjCriqWEZcujrHykIdIP4pXgf3rz5e+
	Ov0vZ9qj/RJSq7tRo0jXTzTXEjL3Ji7zRPUIZpft6OZQoOS3agChd9vRIIjXkAiheEJ3lG
	3MG2hxA4twj9sz648xqhiMDx+qrMBro=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-272-q4ey9LMqN8eRTbhUF1hXFA-1; Tue, 28 Nov 2023 11:00:13 -0500
X-MC-Unique: q4ey9LMqN8eRTbhUF1hXFA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a018014e8e5so446431866b.2
        for <alex.bennee@linaro.org>; Tue, 28 Nov 2023 08:00:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701187212; x=1701792012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RzhdmniUAulYKiMWHmvNUF6uT6F1wxvW3o6/RqMDVpk=;
        b=Hrfycl0Dd5YfajOA5bPNtS9XMxHrIIk4Ikr8CdOc0uU82m1na/shJ8sXukaU01tJTj
         OH9cwDtbdZO1F8efg2k/hCajuHCjk1W2+iFl3lPp2m1GNxOFhlWz4ig+e6gAYFpMWfUf
         KowCew9j5PTJhk73BnYaZy4+J9Fh+cCbhvf9jf3g21VfMkaEF00tiC8y96DwBToZl9l+
         MBr+jZ5XUuOm90K5hlZjU1A0cmaFN76yVFy+bHLO3/48Tzyju6uLETv65CPBQLHZWdTu
         21qHIqavuusUCdxzpG8XRu4Ia7ZBbz6kJN9deHeTw2556N4PWKpVelRFISHHaMMcwjGQ
         K6Aw==
X-Gm-Message-State: AOJu0YwAgkGApbnxspuoKME9xkQ+TF2YWDDBwDp+5VfnlCJtYJGsRcK/
	ktQYcaxdH97gzJajEMTPLvlIY637LXHRvnIoYhMdyofniCDPYR4/1Zjun4R3fbU+lKtyFfkKtgC
	dofINs3giaF6jkwXH
X-Received: by 2002:a17:906:3f92:b0:9e0:4910:166a with SMTP id b18-20020a1709063f9200b009e04910166amr9384382ejj.32.1701187211646;
        Tue, 28 Nov 2023 08:00:11 -0800 (PST)
X-Received: by 2002:a17:906:3f92:b0:9e0:4910:166a with SMTP id b18-20020a1709063f9200b009e04910166amr9384338ejj.32.1701187211208;
        Tue, 28 Nov 2023 08:00:11 -0800 (PST)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id j10-20020a170906050a00b009fc54390966sm6997635eja.145.2023.11.28.08.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 08:00:10 -0800 (PST)
Date: Tue, 28 Nov 2023 17:00:08 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini
 <pbonzini@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>, David Hildenbrand
 <david@redhat.com>, Peter Xu <peterx@redhat.com>, Anton Johansson
 <anjo@rev.ng>, Peter Maydell <peter.maydell@linaro.org>,
 kvm@vger.kernel.org, Marek Vasut <marex@denx.de>, David Gibson
 <david@gibson.dropbear.id.au>, Brian Cain <bcain@quicinc.com>, Yoshinori
 Sato <ysato@users.sourceforge.jp>, "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>, Claudio Fontana <cfontana@suse.de>, Daniel
 Henrique Barboza <dbarboza@ventanamicro.com>, Artyom Tarasenko
 <atar4qemu@gmail.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-ppc@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Aurelien
 Jarno <aurelien@aurel32.net>, Ilya Leoshkevich <iii@linux.ibm.com>, Daniel
 Henrique Barboza <danielhb413@gmail.com>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater
 <clg@kaod.org>, Alistair Francis <alistair.francis@wdc.com>, Alessandro Di
 Federico <ale@rev.ng>, Song Gao <gaosong@loongson.cn>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Chris Wulff <crwulff@gmail.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Fabiano Rosas <farosas@suse.de>, qemu-s390x@nongnu.org, Yanan Wang
 <wangyanan55@huawei.com>, Luc Michel <luc@lmichel.fr>, Weiwei Li
 <liweiwei@iscas.ac.cn>, Bin Meng <bin.meng@windriver.com>, Stafford Horne
 <shorne@gmail.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, "Daniel P .
 Berrange" <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Bernhard Beschow <shentey@gmail.com>, Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-riscv@nongnu.org, Alex
 =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>, Nicholas Piggin
 <npiggin@gmail.com>, Greg Kurz <groug@kaod.org>, Michael Rolnik
 <mrolnik@gmail.com>, Eduardo Habkost <eduardo@habkost.net>, Markus
 Armbruster <armbru@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [RFC PATCH 04/22] exec/cpu: Never call cpu_reset() before
 cpu_realize()
Message-ID: <20231128170008.57ddb03e@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230918160257.30127-5-philmd@linaro.org>
References: <20230918160257.30127-1-philmd@linaro.org>
	<20230918160257.30127-5-philmd@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: BFM6+A2MblDa

On Mon, 18 Sep 2023 18:02:37 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> QDev instance is expected to be in an unknown state until full
> object realization. Thus we shouldn't call DeviceReset() on an
> unrealized instance. Move the cpu_reset() call from *before*
> the parent realize() handler (effectively cpu_common_realizefn)
> to *after* it.

looking at:
=20
 --cpu_reset()  <- brings cpu to known (after reset|poweron) state
   cpu_common_realizefn()
       if (dev->hotplugged) {                                              =
        =20
           cpu_synchronize_post_init(cpu);                                 =
        =20
           cpu_resume(cpu);                                                =
        =20
       }
 ++cpu_reset()  <-- looks to be too late, we already told hypervisor to run=
 undefined CPU, didn't we?



>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
> RFC:
> I haven't audited all the call sites, but plan to do it,
> amending the result to this patch description. This used
> to be a problem on some targets, but as of today's master
> this series pass make check-{qtest,avocado}.
> ---
>  target/arm/cpu.c       | 2 +-
>  target/avr/cpu.c       | 2 +-
>  target/cris/cpu.c      | 2 +-
>  target/hexagon/cpu.c   | 3 +--
>  target/i386/cpu.c      | 2 +-
>  target/loongarch/cpu.c | 2 +-
>  target/m68k/cpu.c      | 2 +-
>  target/mips/cpu.c      | 2 +-
>  target/nios2/cpu.c     | 2 +-
>  target/openrisc/cpu.c  | 2 +-
>  target/riscv/cpu.c     | 2 +-
>  target/rx/cpu.c        | 2 +-
>  target/s390x/cpu.c     | 2 +-
>  target/sh4/cpu.c       | 2 +-
>  target/tricore/cpu.c   | 2 +-
>  15 files changed, 15 insertions(+), 16 deletions(-)
>=20
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index b9e09a702d..6aca036b85 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2278,9 +2278,9 @@ static void arm_cpu_realizefn(DeviceState *dev, Err=
or **errp)
>      }
> =20
>      qemu_init_vcpu(cs);
> -    cpu_reset(cs);
> =20
>      acc->parent_realize(dev, errp);
> +    cpu_reset(cs);
>  }
> =20
>  static ObjectClass *arm_cpu_class_by_name(const char *cpu_model)
> diff --git a/target/avr/cpu.c b/target/avr/cpu.c
> index 8f741f258c..84d353f30e 100644
> --- a/target/avr/cpu.c
> +++ b/target/avr/cpu.c
> @@ -120,9 +120,9 @@ static void avr_cpu_realizefn(DeviceState *dev, Error=
 **errp)
>          return;
>      }
>      qemu_init_vcpu(cs);
> -    cpu_reset(cs);
> =20
>      mcc->parent_realize(dev, errp);
> +    cpu_reset(cs);
>  }
> =20
>  static void avr_cpu_set_int(void *opaque, int irq, int level)
> diff --git a/target/cris/cpu.c b/target/cris/cpu.c
> index a6a93c2359..079872a5cc 100644
> --- a/target/cris/cpu.c
> +++ b/target/cris/cpu.c
> @@ -152,10 +152,10 @@ static void cris_cpu_realizefn(DeviceState *dev, Er=
ror **errp)
>          return;
>      }
> =20
> -    cpu_reset(cs);
>      qemu_init_vcpu(cs);
> =20
>      ccc->parent_realize(dev, errp);
> +    cpu_reset(cs);
>  }
> =20
>  #ifndef CONFIG_USER_ONLY
> diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
> index f155936289..7edc32701f 100644
> --- a/target/hexagon/cpu.c
> +++ b/target/hexagon/cpu.c
> @@ -346,9 +346,8 @@ static void hexagon_cpu_realize(DeviceState *dev, Err=
or **errp)
>                               "hexagon-hvx.xml", 0);
> =20
>      qemu_init_vcpu(cs);
> -    cpu_reset(cs);
> -
>      mcc->parent_realize(dev, errp);
> +    cpu_reset(cs);
>  }
> =20
>  static void hexagon_cpu_init(Object *obj)
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index a23d4795e0..7faaa6915f 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -7455,9 +7455,9 @@ static void x86_cpu_realizefn(DeviceState *dev, Err=
or **errp)
>          }
>      }
>  #endif /* !CONFIG_USER_ONLY */
> -    cpu_reset(cs);
> =20
>      xcc->parent_realize(dev, &local_err);
> +    cpu_reset(cs);
> =20
>  out:
>      if (local_err !=3D NULL) {
> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> index 65f9320e34..8029e70e76 100644
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -565,10 +565,10 @@ static void loongarch_cpu_realizefn(DeviceState *de=
v, Error **errp)
> =20
>      loongarch_cpu_register_gdb_regs_for_features(cs);
> =20
> -    cpu_reset(cs);
>      qemu_init_vcpu(cs);
> =20
>      lacc->parent_realize(dev, errp);
> +    cpu_reset(cs);
>  }
> =20
>  #ifndef CONFIG_USER_ONLY
> diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
> index 70d58471dc..2bc0a62f0e 100644
> --- a/target/m68k/cpu.c
> +++ b/target/m68k/cpu.c
> @@ -321,10 +321,10 @@ static void m68k_cpu_realizefn(DeviceState *dev, Er=
ror **errp)
> =20
>      m68k_cpu_init_gdb(cpu);
> =20
> -    cpu_reset(cs);
>      qemu_init_vcpu(cs);
> =20
>      mcc->parent_realize(dev, errp);
> +    cpu_reset(cs);
>  }
> =20
>  static void m68k_cpu_initfn(Object *obj)
> diff --git a/target/mips/cpu.c b/target/mips/cpu.c
> index 63da1948fd..8d6f633f72 100644
> --- a/target/mips/cpu.c
> +++ b/target/mips/cpu.c
> @@ -492,10 +492,10 @@ static void mips_cpu_realizefn(DeviceState *dev, Er=
ror **errp)
>      fpu_init(env, env->cpu_model);
>      mvp_init(env);
> =20
> -    cpu_reset(cs);
>      qemu_init_vcpu(cs);
> =20
>      mcc->parent_realize(dev, errp);
> +    cpu_reset(cs);
>  }
> =20
>  static void mips_cpu_initfn(Object *obj)
> diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
> index bc5cbf81c2..876a6dcad2 100644
> --- a/target/nios2/cpu.c
> +++ b/target/nios2/cpu.c
> @@ -217,12 +217,12 @@ static void nios2_cpu_realizefn(DeviceState *dev, E=
rror **errp)
> =20
>      realize_cr_status(cs);
>      qemu_init_vcpu(cs);
> -    cpu_reset(cs);
> =20
>      /* We have reserved storage for cpuid; might as well use it. */
>      cpu->env.ctrl[CR_CPUID] =3D cs->cpu_index;
> =20
>      ncc->parent_realize(dev, errp);
> +    cpu_reset(cs);
>  }
> =20
>  #ifndef CONFIG_USER_ONLY
> diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
> index 61d748cfdc..cd25f1e9d5 100644
> --- a/target/openrisc/cpu.c
> +++ b/target/openrisc/cpu.c
> @@ -142,9 +142,9 @@ static void openrisc_cpu_realizefn(DeviceState *dev, =
Error **errp)
>      }
> =20
>      qemu_init_vcpu(cs);
> -    cpu_reset(cs);
> =20
>      occ->parent_realize(dev, errp);
> +    cpu_reset(cs);
>  }
> =20
>  static void openrisc_cpu_initfn(Object *obj)
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f227c7664e..7566757346 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1532,9 +1532,9 @@ static void riscv_cpu_realize(DeviceState *dev, Err=
or **errp)
>  #endif
> =20
>      qemu_init_vcpu(cs);
> -    cpu_reset(cs);
> =20
>      mcc->parent_realize(dev, errp);
> +    cpu_reset(cs);
>  }
> =20
>  #ifndef CONFIG_USER_ONLY
> diff --git a/target/rx/cpu.c b/target/rx/cpu.c
> index 157e57da0f..c9c8443cbd 100644
> --- a/target/rx/cpu.c
> +++ b/target/rx/cpu.c
> @@ -138,9 +138,9 @@ static void rx_cpu_realize(DeviceState *dev, Error **=
errp)
>      }
> =20
>      qemu_init_vcpu(cs);
> -    cpu_reset(cs);
> =20
>      rcc->parent_realize(dev, errp);
> +    cpu_reset(cs);
>  }
> =20
>  static void rx_cpu_set_irq(void *opaque, int no, int request)
> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
> index df167493c3..0f0b11fd73 100644
> --- a/target/s390x/cpu.c
> +++ b/target/s390x/cpu.c
> @@ -254,6 +254,7 @@ static void s390_cpu_realizefn(DeviceState *dev, Erro=
r **errp)
>      s390_cpu_gdb_init(cs);
>      qemu_init_vcpu(cs);
> =20
> +    scc->parent_realize(dev, &err);
>      /*
>       * KVM requires the initial CPU reset ioctl to be executed on the ta=
rget
>       * CPU thread. CPU hotplug under single-threaded TCG will not work w=
ith
> @@ -266,7 +267,6 @@ static void s390_cpu_realizefn(DeviceState *dev, Erro=
r **errp)
>          cpu_reset(cs);
>      }
> =20
> -    scc->parent_realize(dev, &err);
>  out:
>      error_propagate(errp, err);
>  }
> diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
> index 61769ffdfa..656d71f74a 100644
> --- a/target/sh4/cpu.c
> +++ b/target/sh4/cpu.c
> @@ -228,10 +228,10 @@ static void superh_cpu_realizefn(DeviceState *dev, =
Error **errp)
>          return;
>      }
> =20
> -    cpu_reset(cs);
>      qemu_init_vcpu(cs);
> =20
>      scc->parent_realize(dev, errp);
> +    cpu_reset(cs);
>  }
> =20
>  static void superh_cpu_initfn(Object *obj)
> diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
> index 133a9ac70e..a3610aecca 100644
> --- a/target/tricore/cpu.c
> +++ b/target/tricore/cpu.c
> @@ -118,10 +118,10 @@ static void tricore_cpu_realizefn(DeviceState *dev,=
 Error **errp)
>      if (tricore_has_feature(env, TRICORE_FEATURE_131)) {
>          set_feature(env, TRICORE_FEATURE_13);
>      }
> -    cpu_reset(cs);
>      qemu_init_vcpu(cs);
> =20
>      tcc->parent_realize(dev, errp);
> +    cpu_reset(cs);
>  }
> =20
> =20
