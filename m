Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1434AD3C907
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Dec 2025 14:02:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vTKlO-000521-V6; Wed, 10 Dec 2025 09:01:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vTKkv-0004yY-1v
 for qemu-arm@nongnu.org; Wed, 10 Dec 2025 09:01:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vTKks-0006iG-Ka
 for qemu-arm@nongnu.org; Wed, 10 Dec 2025 09:01:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765375281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j6O14IgCI996JZsx0l90XqR/9ZXCFZHWkgAIKqs9gec=;
 b=dG94Epc5k+gEfm+/zdd9V//k6WKuhEAH+VOHZRHWNSQmQzraGM4Ey26T27SJtMmWevLoyt
 6fsYJG+mvhtGItsj5M12QMG7uDV9KVCsktiiOV9kLaPyk40H0I6ZBLXizypFQP6mHZTJ5L
 +tWY9GlBMiVjyX3pOTCqIS2wgx00jg4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-zcyux6MmNHq8Y-JJ1cOd9A-1; Wed, 10 Dec 2025 09:01:19 -0500
X-MC-Unique: zcyux6MmNHq8Y-JJ1cOd9A-1
X-Mimecast-MFC-AGG-ID: zcyux6MmNHq8Y-JJ1cOd9A_1765375278
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4779b432aecso42793855e9.0
 for <qemu-arm@nongnu.org>; Wed, 10 Dec 2025 06:01:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765375278; x=1765980078;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=j6O14IgCI996JZsx0l90XqR/9ZXCFZHWkgAIKqs9gec=;
 b=tJrPxzHbNJZVMLGwEbySQtg82SJjB9a1aYNuJ4NEevdbeCawFizwvWg8gpZKEgrcVz
 NzLOP2PuXEitpGk+pqdMYHTHnZIFDRAtSjOJieO7KZCu2J6PJeiN7n5zO2TMJu1ZdrD2
 iHfmNj/jhgNeLSaJ+cnhRvW2VLe5iO/oeZ6zBFVe45Vr6vVwooS++fNd0CcPEOP0kvSw
 V52QpJSSkrqJNM9vDAkSfSXQyN/BhMQG4Kzetu8cfo3XBAhkEyOIPQFS9JIgYDik9R6g
 +8fwlK3yn+J/Dj/gLfyQwnbo6ueYYfc0UZ8DlvIvbUwkw295C1LyjxXoDMy+z07l0oi8
 uBDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrNOIwmLqP8goY1OI35hWnqyeNQgr2uLewncvZJdlO4r0G9Fg3Ey80uyV4uhqDcxkR5S4r6zOWWg==@nongnu.org
X-Gm-Message-State: AOJu0Yz/WnzMeNGTG+hyWYnbwE65N0w0UbbL80SZ68kjQVyA8XrMUl8I
 6QoVMQW/iYVg202mHCp7hBPQ09Oqs5gUsTGoEOWcrvcOivVqgYiMLR6eufVU5IObSNCqKhrz+Uq
 BB6xSIzSpsjgqOziy06G8J3Up6EjEDP/+myQlDYT0AvoaxbWgz8r2FQ==
X-Gm-Gg: ASbGncvBLk1Q8pQgQu7JwfyT5yWNxyZErLQF/VZYmVX8XG2uY/nN7eMr5766u4/QuHO
 XyZ965IOKLBbrg8GZNhzGbQy0Gy/xx6NGARUUepiKkFXhiHn/83+W7RYP5xkrsOhcK6Qswu0sFW
 GvQoyKArpJUlNKTrObd7GSVU18qchbz3J36OkToB3UhrGK/snVVtHYaaxMPMwEb53NkGtvbe3tX
 vqjQCxMka4gMx+DABjar0cVmz68x4MfqJCnXExNFJa0rm7tDj+gjkDYpXpi/7lyNYAazmtfoMii
 JdRX7rcjRn4Fl911kPRbLO1Dos4feDS0gWD+bmA3hRJ7JUSjBE83TOIqRMmhPbMmmkjfTg==
X-Received: by 2002:a05:600c:3113:b0:477:7768:8da4 with SMTP id
 5b1f17b1804b1-47a856249c2mr13338535e9.7.1765375278088; 
 Wed, 10 Dec 2025 06:01:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFj/M79GqEHYM3DvJC6z3KKGc/jcvumRsPxQHknr/rdPhfB8kOLZa6+TISA54HNeWcCceufRw==
X-Received: by 2002:a05:600c:3113:b0:477:7768:8da4 with SMTP id
 5b1f17b1804b1-47a856249c2mr13337925e9.7.1765375277520; 
 Wed, 10 Dec 2025 06:01:17 -0800 (PST)
Received: from imammedo ([213.175.37.14]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a7d9bec74sm44288345e9.8.2025.12.10.06.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Dec 2025 06:01:16 -0800 (PST)
Date: Wed, 10 Dec 2025 15:01:15 +0100
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
Subject: Re: [PATCH v5 01/28] hw/i386/pc: Remove deprecated pc-q35-2.6 and
 pc-i440fx-2.6 machines
Message-ID: <20251210150115.5f9dc169@imammedo>
In-Reply-To: <20251202162835.3227894-2-zhao1.liu@intel.com>
References: <20251202162835.3227894-1-zhao1.liu@intel.com>
 <20251202162835.3227894-2-zhao1.liu@intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ikEFEqYAM3vHvZUuxNCpcDmrXaUzxJls6ZkSMeUoimY_1765375278
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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

On Wed,  3 Dec 2025 00:28:08 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

> From: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>=20
> These machines has been supported for a period of more than 6 years.
> According to our versioned machine support policy (see commit
> ce80c4fa6ff "docs: document special exception for machine type
> deprecation & removal") they can now be removed.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/i386/pc_piix.c | 14 --------------
>  hw/i386/pc_q35.c  | 14 --------------
>  2 files changed, 28 deletions(-)
>=20
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 7b3611e973cd..4628d491d5b5 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -733,20 +733,6 @@ static void pc_i440fx_machine_2_7_options(MachineCla=
ss *m)
> =20
>  DEFINE_I440FX_MACHINE(2, 7);
> =20
> -static void pc_i440fx_machine_2_6_options(MachineClass *m)
> -{
> -    X86MachineClass *x86mc =3D X86_MACHINE_CLASS(m);
> -    PCMachineClass *pcmc =3D PC_MACHINE_CLASS(m);
> -
> -    pc_i440fx_machine_2_7_options(m);
> -    pcmc->legacy_cpu_hotplug =3D true;
> -    x86mc->fwcfg_dma_enabled =3D false;
> -    compat_props_add(m->compat_props, hw_compat_2_6, hw_compat_2_6_len);
> -    compat_props_add(m->compat_props, pc_compat_2_6, pc_compat_2_6_len);
> -}
> -
> -DEFINE_I440FX_MACHINE(2, 6);
> -
>  #ifdef CONFIG_XEN
>  static void xenfv_machine_4_2_options(MachineClass *m)
>  {
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 6015e639d7bc..0ae19eb9f1e4 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -681,17 +681,3 @@ static void pc_q35_machine_2_7_options(MachineClass =
*m)
>  }
> =20
>  DEFINE_Q35_MACHINE(2, 7);
> -
> -static void pc_q35_machine_2_6_options(MachineClass *m)
> -{
> -    X86MachineClass *x86mc =3D X86_MACHINE_CLASS(m);
> -    PCMachineClass *pcmc =3D PC_MACHINE_CLASS(m);
> -
> -    pc_q35_machine_2_7_options(m);
> -    pcmc->legacy_cpu_hotplug =3D true;
> -    x86mc->fwcfg_dma_enabled =3D false;
> -    compat_props_add(m->compat_props, hw_compat_2_6, hw_compat_2_6_len);
> -    compat_props_add(m->compat_props, pc_compat_2_6, pc_compat_2_6_len);
> -}
> -
> -DEFINE_Q35_MACHINE(2, 6);


