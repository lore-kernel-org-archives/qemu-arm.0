Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp1973317ejt;
        Tue, 28 Nov 2023 07:34:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0dI8cGg2zn13+fi9PiWn3q6m0lzmxszMiqPPSaHd76CKHS6LpSTHusm+XwmvIy3Il4JYM
X-Received: by 2002:a05:620a:110f:b0:77d:c900:7e5e with SMTP id o15-20020a05620a110f00b0077dc9007e5emr175667qkk.76.1701185687224;
        Tue, 28 Nov 2023 07:34:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701185687; cv=none;
        d=google.com; s=arc-20160816;
        b=tmH7Yb3j9xc6npWmUudwzBMe/gq6vuWL00A3mG24i1tThUn3ujv64lIxlksFgM4IvE
         ZMOL2prUGZ7jHE0/q91Lc+Qqb9D5+tonmd47ip/2Zp1dk4p7i5U317ZyZ9crXXht21Zf
         Kk+iTqc7/CEvt9sPeuSySF2STf+Ou3IGUczZMYVB2RXLN/BABxf/UClnDcqNH6Prrs2/
         +oIQy/FobqPfchQUqrZr14iRAVGYUom03X7WVagiFtgCDZk1ZJ2PZNMYTYdDMedyRw4F
         4WIC08EBhQ0YRMjnoOyUNQMBAICDC3i8FYx1XdfvRH0BSeWCenq/SQZBRjX+7djmnKTM
         r0iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=D9lOQjODNv02P43/kZH/wGQ3w31tJS9+8fDtN67uTGI=;
        fh=wV6b0TL7corVRWTR29RPx4Qkj2+2+kgqvIqkMoPpvnQ=;
        b=liUxqHaCNeN1uyukznNvWjL6b8sEU/lSJW3xdjScwsP5L415EewFIm0FehWlISPUIc
         ZuqvE5HT7JoqaEBW1QH48YCz1Hq2/4y5M8MvFdaMDdPm+0x5KCpXSgrqqYrQ0IyGvcZg
         yw1ndNo8d/tolk+N+8sj2aaLqsI3HWrZrPm4QkPfLSEwPpvq19brlhsF3M6ipy364A4M
         rmQElp5RJLS1zSko4Gm+LhmTc1BbD2nrSPm5FyLQLvhp1pDES1Oouys0aN1ZD7jvGvQk
         2Z4bROoVrVWjMQCKqkxUHOnezMRUIrFyHP2vPDQvDtNrCPBqGCyixv7SlJ9lR8BidIhp
         O2bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PyOEPxYn;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id g15-20020a05620a40cf00b0077dc3ad1272si826230qko.299.2023.11.28.07.34.47
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 07:34:47 -0800 (PST)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PyOEPxYn;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701185686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D9lOQjODNv02P43/kZH/wGQ3w31tJS9+8fDtN67uTGI=;
	b=PyOEPxYnnLmqzSt/9tGWpQWeZbZaijgME5eUxUjzcV1La8u7aUGeav94aw1fYxN7nPXd6V
	JywmE+4xEvvWLaoPs6550t43n/2vbi7wLYIfghMMQ2IV+NK8EcE4bM+djpzhPNwLZiZnEy
	+0Onv9V9HTZ5HoDVtQFhVDSZVeaQJW4=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-248-3__ApU8ZM82rAztPV-zUlg-1; Tue, 28 Nov 2023 10:34:43 -0500
X-MC-Unique: 3__ApU8ZM82rAztPV-zUlg-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-509901ca83eso6037541e87.0
        for <alex.bennee@linaro.org>; Tue, 28 Nov 2023 07:34:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701185682; x=1701790482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D9lOQjODNv02P43/kZH/wGQ3w31tJS9+8fDtN67uTGI=;
        b=buEVbY87WXSblxm2+Qw9F4m4RhnpUDaa7mDXefhM7gqvf9hHpMnrayB0dqx5jIY852
         zue6Aby3uKizQ/f9cHmj9bMBxIciksnyHYk3rB5ZaTYcVYtOA4gPw8RsAiO2iMQKk/6K
         860q94fj6eW5Ve0AmVcGGtXrK8RyzsxS7cQDHVZvzVY56Nnrw0JPg6zSx1q1ufYM+B/b
         6w/t3BDSst0IgQqYmA3+XbuQkRt3pyf9Ubi7dC3bhyrr+ZzkUJTXZ15g8JpFXpOoLtmI
         LU4CmlnbLOADJfnodAARgPjUzCXkniBoG/85yEzQCoUJK1NS6CDmLUJI6bc7wdMqQv6Y
         Pi8w==
X-Gm-Message-State: AOJu0YycC/UeYyt1w9LBimDMycUUtPStT9w7Vk8oihXgRKtCiuvvOAcN
	o1LMaqoasEdOESLYl6Nc/MUZXM9znK1fI0YDyiN4VRTb+bgIYhBG09YQvuicbE931U0SeVcIFAt
	lDbcHNvhK/JsinUBE
X-Received: by 2002:ac2:4acb:0:b0:50b:ac31:28e5 with SMTP id m11-20020ac24acb000000b0050bac3128e5mr5758131lfp.65.1701185682045;
        Tue, 28 Nov 2023 07:34:42 -0800 (PST)
X-Received: by 2002:ac2:4acb:0:b0:50b:ac31:28e5 with SMTP id m11-20020ac24acb000000b0050bac3128e5mr5758085lfp.65.1701185681511;
        Tue, 28 Nov 2023 07:34:41 -0800 (PST)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id d11-20020a056402000b00b0054851cd28d2sm6365832edu.79.2023.11.28.07.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 07:34:41 -0800 (PST)
Date: Tue, 28 Nov 2023 16:34:38 +0100
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
Subject: Re: [PATCH 02/22] hw/intc/apic: Pass CPU using QOM link property
Message-ID: <20231128163438.3d257bdd@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230918160257.30127-3-philmd@linaro.org>
References: <20230918160257.30127-1-philmd@linaro.org>
	<20230918160257.30127-3-philmd@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: UigzB0crSKXK

On Mon, 18 Sep 2023 18:02:35 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> QOM objects shouldn't access each other internals fields
> except using the QOM API.
>=20
> Declare the 'cpu' and 'base-addr' properties, set them
> using object_property_set_link() and qdev_prop_set_uint32()
> respectively.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/intc/apic_common.c    |  2 ++
>  target/i386/cpu-sysemu.c | 11 ++++++-----
>  2 files changed, 8 insertions(+), 5 deletions(-)
>=20
> diff --git a/hw/intc/apic_common.c b/hw/intc/apic_common.c
> index 68ad30e2f5..e28f7402ab 100644
> --- a/hw/intc/apic_common.c
> +++ b/hw/intc/apic_common.c
> @@ -394,6 +394,8 @@ static Property apic_properties_common[] =3D {
>                      true),
>      DEFINE_PROP_BOOL("legacy-instance-id", APICCommonState, legacy_insta=
nce_id,
>                       false),
> +    DEFINE_PROP_LINK("cpu", APICCommonState, cpu, TYPE_X86_CPU, X86CPU *=
),
> +    DEFINE_PROP_UINT32("base-addr", APICCommonState, apicbase, 0),
>      DEFINE_PROP_END_OF_LIST(),
>  };
> =20
> diff --git a/target/i386/cpu-sysemu.c b/target/i386/cpu-sysemu.c
> index 6a164d3769..6edfb7e2af 100644
> --- a/target/i386/cpu-sysemu.c
> +++ b/target/i386/cpu-sysemu.c
> @@ -269,7 +269,6 @@ APICCommonClass *apic_get_class(Error **errp)
> =20
>  void x86_cpu_apic_create(X86CPU *cpu, Error **errp)
>  {
> -    APICCommonState *apic;
>      APICCommonClass *apic_class =3D apic_get_class(errp);
> =20
>      assert(apic_class);
> @@ -279,11 +278,13 @@ void x86_cpu_apic_create(X86CPU *cpu, Error **errp)
>                                OBJECT(cpu->apic_state));
>      object_unref(OBJECT(cpu->apic_state));
> =20
> +    if (!object_property_set_link(OBJECT(cpu->apic_state), "cpu",
> +                                  OBJECT(cpu), errp)) {
> +        return;
> +    }
>      qdev_prop_set_uint32(cpu->apic_state, "id", cpu->apic_id);
> -    /* TODO: convert to link<> */
> -    apic =3D APIC_COMMON(cpu->apic_state);
> -    apic->cpu =3D cpu;
> -    apic->apicbase =3D APIC_DEFAULT_ADDRESS | MSR_IA32_APICBASE_ENABLE;
> +    qdev_prop_set_uint32(cpu->apic_state, "base-addr",
> +                         APIC_DEFAULT_ADDRESS | MSR_IA32_APICBASE_ENABLE=
);
>  }
> =20
>  void x86_cpu_apic_realize(X86CPU *cpu, Error **errp)
