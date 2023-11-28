Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp2022548ejt;
        Tue, 28 Nov 2023 08:42:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENKDHrlu7VvVsfL9gCDrcXnCsBAeQAvZ2HPTpZj8FFwhbqF5hNLjtqZ3YsUeoOasCOYbkW
X-Received: by 2002:ac8:698f:0:b0:423:e02e:2249 with SMTP id o15-20020ac8698f000000b00423e02e2249mr1421345qtq.26.1701189742499;
        Tue, 28 Nov 2023 08:42:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701189742; cv=none;
        d=google.com; s=arc-20160816;
        b=z84w+qsvkoljf9nRdvUsvN4BRaiGUxyjqamFtepW/tUgv1rsGTNl9af0jvx2L+Dzf5
         NpKEdL8gGdOOxdHb1WuoMvpAmBT/tMh7nI15nOkRg2MjkFEHqBbAZszn4u4h0CwxvjCO
         yQUJhF2r7fkzW+CQveHB2coZ3xS01BXkGtx771FQ+fLsBYnG5cQ3kCEbju0PafB4msbr
         nehCZ7MX+LpfG8NlvF34vb9JfrFsVRB2hIiKH4Pwr/yTQjOkKAUo/+MvMNvOO+XjHdBq
         URo9MeiETJ8uhMjDcrdGIhGjTAMbDxgLXE6rL2lFASvfR5mYhl0z8g6fWvwgOLBLTIBW
         sNdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=XYzWN6N52VkWv+bl9tnSg8e+Cw0sVqiE4LaeFAa1jRM=;
        fh=wV6b0TL7corVRWTR29RPx4Qkj2+2+kgqvIqkMoPpvnQ=;
        b=QGSPG4oe2rpZioi0yRj86Sfy0VT2agU7UgvQrYopOhml6jplisYA0ZCtb/TKaVcImj
         av3/MPtbcuRR1tY3SQZAl+NKbNLSK4GuhBv7N+0aDZFhPiKLwk4Z+fkYuO9fdY1ojUwj
         hUpt+UGalbguKREnFoW0XYmGiJ7DLVLG/mzTTggizt1BwFOyW3NH6WZAMNqIwfWHD30M
         ouRZc0avVB5xicqa41PX3oCOt0UuV8lRW8d0ofvjOJEyZFvVRW7cl+39yX0Y9NnxOYd7
         ZMprFuz4NqiWkj7Fe5xqM9BhYwSDRW4NXlIKCgI/7VbPmWmra8KMUzklJ/GlPpJgXwrY
         93PA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D+lX5dan;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id s8-20020ac85cc8000000b00403b1d1599asi12064402qta.2.2023.11.28.08.42.22
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 08:42:22 -0800 (PST)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D+lX5dan;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701189742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XYzWN6N52VkWv+bl9tnSg8e+Cw0sVqiE4LaeFAa1jRM=;
	b=D+lX5dangZ5CdGUJKFv7g2jHZbOVbSWS+OU9Rh0XhUl0V67La8BCCTeF7r/4L/b5unkHpP
	ZMQogQvCjU7MzHUOg3ppWMSjv6G9xp0+WN9PmkvSojtUm++CKhTlg2cpFCTAEQSbYT24SH
	nrvgchMlMOcZk6oCXo+C6QoG6C2FONA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-42-813ZsvpyOh25NsstRxl4BQ-1; Tue, 28 Nov 2023 11:42:20 -0500
X-MC-Unique: 813ZsvpyOh25NsstRxl4BQ-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-54aa99b8e4dso4264779a12.3
        for <alex.bennee@linaro.org>; Tue, 28 Nov 2023 08:42:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701189739; x=1701794539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XYzWN6N52VkWv+bl9tnSg8e+Cw0sVqiE4LaeFAa1jRM=;
        b=qAck1K/YzYoHOmkPP5kcvMHqjC6LMESnC3+MV6nFJgya9+gpVGVcGW+q9pFNs1bi2l
         D4tQyPiK6Jxwp8+TcyUun1G1rIOgke3ocjgNavRfMl8b2Rvh2FvlY2tdENkXKniX41rp
         aNVuROhN5GUnWxILLqNDJtFpTxjRHqc6cN8BB+53l2TOmR6Pgsoo3mp3krD70XY1GG0T
         TZ/q4T6lsPk2ooMO7yEN/IbazX6yAshLnNuZ2hBvlUZ6lVI2eqsSfNpa0Y2uqjY8p/go
         4SmXsGg/fVLNeACxyZOtAEUV94WVHIqttl2ShsoW3D8y07QlgxysM66h/defjzFwzpJH
         fhWg==
X-Gm-Message-State: AOJu0YxSgPK+7snFzlpnNF/BXXUAaF0gkOKtQC+R/j1iLXo9nLwyYlJY
	VYjvRpNTm124XmqydeYUT00mMPercVlAAgqljrJBJBVSTclYTCkQId+e0Hr2JrPEDXlcYJFjPmL
	gRjj5tJrIBh4VUpmV
X-Received: by 2002:aa7:d658:0:b0:54b:1ca8:8522 with SMTP id v24-20020aa7d658000000b0054b1ca88522mr9152211edr.0.1701189739702;
        Tue, 28 Nov 2023 08:42:19 -0800 (PST)
X-Received: by 2002:aa7:d658:0:b0:54b:1ca8:8522 with SMTP id v24-20020aa7d658000000b0054b1ca88522mr9152146edr.0.1701189739373;
        Tue, 28 Nov 2023 08:42:19 -0800 (PST)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id cn6-20020a0564020ca600b0054b2a9dc69csm3931520edb.40.2023.11.28.08.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 08:42:18 -0800 (PST)
Date: Tue, 28 Nov 2023 17:42:15 +0100
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
Subject: Re: [PATCH 06/22] exec/cpu: Call cpu_remove_sync() once in
 cpu_common_unrealize()
Message-ID: <20231128174215.32d2a350@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230918160257.30127-7-philmd@linaro.org>
References: <20230918160257.30127-1-philmd@linaro.org>
	<20230918160257.30127-7-philmd@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: QQ3YrmLPEP2X

On Mon, 18 Sep 2023 18:02:39 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> While create_vcpu_thread() creates a vCPU thread, its counterpart
> is cpu_remove_sync(), which join and destroy the thread.
>=20
> create_vcpu_thread() is called in qemu_init_vcpu(), itself called
> in cpu_common_realizefn(). Since we don't have qemu_deinit_vcpu()
> helper (we probably don't need any), simply destroy the thread in
> cpu_common_unrealizefn().
>=20
> Note: only the PPC and X86 targets were calling cpu_remove_sync(),
> meaning all other targets were leaking the thread when the vCPU
> was unrealized (mostly when vCPU are hot-unplugged).
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/core/cpu-common.c  | 3 +++
>  target/i386/cpu.c     | 1 -
>  target/ppc/cpu_init.c | 2 --
>  3 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
> index a3b8de7054..e5841c59df 100644
> --- a/hw/core/cpu-common.c
> +++ b/hw/core/cpu-common.c
> @@ -221,6 +221,9 @@ static void cpu_common_unrealizefn(DeviceState *dev)
> =20
>      /* NOTE: latest generic point before the cpu is fully unrealized */
>      cpu_exec_unrealizefn(cpu);
> +
> +    /* Destroy vCPU thread */
> +    cpu_remove_sync(cpu);
>  }
> =20
>  static void cpu_common_initfn(Object *obj)
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index cb41d30aab..d79797d963 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -7470,7 +7470,6 @@ static void x86_cpu_unrealizefn(DeviceState *dev)
>      X86CPUClass *xcc =3D X86_CPU_GET_CLASS(dev);
> =20
>  #ifndef CONFIG_USER_ONLY
> -    cpu_remove_sync(CPU(dev));
>      qemu_unregister_reset(x86_cpu_machine_reset_cb, dev);
>  #endif

missing  followup context:
    ...
    xcc->parent_unrealize(dev);=20

Before the patch, vcpu thread is stopped and onnly then
clean up happens.

After the patch we have cleanup while vcpu thread is still running.

Even if it doesn't explode, such ordering still seems to be wrong.

> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index e2c06c1f32..24d4e8fa7e 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -6853,8 +6853,6 @@ static void ppc_cpu_unrealize(DeviceState *dev)
> =20
>      pcc->parent_unrealize(dev);
> =20
> -    cpu_remove_sync(CPU(cpu));

bug in current code?

> -
>      destroy_ppc_opcodes(cpu);
>  }
> =20
