Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69046D6ACFB
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Dec 2025 13:17:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vWDsQ-000797-S8; Thu, 18 Dec 2025 08:17:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vWDsN-00078i-Qw
 for qemu-arm@nongnu.org; Thu, 18 Dec 2025 08:17:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vWDsM-0001Ns-CB
 for qemu-arm@nongnu.org; Thu, 18 Dec 2025 08:17:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1766063821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QWW2WNczBqp6v+F2xMMSA7a4JLre39QwXVUX+sVOTRg=;
 b=hgtR8RlQeuELeTDu2hhfLjCxYTS4UUqQjNnDhrlDwinMz8Ez07Ib2TLCboqNXuloSET8R6
 hkZJqRNwFehH6eTFlG4QSOKvKi0q9mP9GWtLYNI8tt/G+c3TB4mM4ul6mQdaw+T4IEykVr
 lCIDuaII78Q3vyz9+1B7eA/ryqhQqgA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-tNm747CWOBSCqODJLvIHog-1; Thu, 18 Dec 2025 08:16:59 -0500
X-MC-Unique: tNm747CWOBSCqODJLvIHog-1
X-Mimecast-MFC-AGG-ID: tNm747CWOBSCqODJLvIHog_1766063818
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-430857e8450so445254f8f.0
 for <qemu-arm@nongnu.org>; Thu, 18 Dec 2025 05:16:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766063818; x=1766668618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=D6j7TiY365GJDQffnjJjAGK4FQJdyrblUZ9cP/4dJY4=;
 b=DI0w0K8DpDF3bv/Ur70muSYVbZ8wO4xKHyZG7Db7AzsUdS+asUIVCygZ+YL6uv8z0S
 VOQsAkbUBCrXIkif94GSQsitEkkiEWtzNx/eYI2MkDpRjGggi670Wtwl7SO82yt/Izgt
 OK7itYYNwxrlkbNsj6hQg/uSDcwq4djFlvSGGfWAFy9JYMQ0nVIoIOIKKE012sCqUnSw
 fdRXUvVLl3HhydTjTr2UbmJ+4ujS/Tq6MCVKrIOo5UaTY3jrXkkd8/z34npR+1TVs+vq
 6rTmWM5iGaTIdckJQBNZcbGDYRtdOLorw2CHLAh6LGJ4hBaoXPokfQYI1BZuE2qob4Hi
 1MQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDzXpHtiSTVr+4MwCLCEoGTiFOvdZ6g6+umayF/R+JufpSEBlaSUtwOjQzNS22FTDJgDbbGVeLnQ==@nongnu.org
X-Gm-Message-State: AOJu0YyUe91JPvcHZZPfGyllZ85gUHpXAtfoaB8SbMX0Jo/Z+WWqlRy8
 wZgyWlvyzhnjrw5ua+rfzC/mqbf2fHwHgL9wy7WEyx3yVxTLq9/kSdBuejVcqT2OjidWIYhn0zI
 /+jgGArNFSQOoFTN80sBBKe0YIFi8cZQNDtqNc4oQfV17VoW4BLL2Yw==
X-Gm-Gg: AY/fxX4YcmXXvEhHFeWSQyE79TkU0vqyas/W7WTwZlqK/21SbpS1bbUi+Du7kX/TFD9
 kOP/V4J6GIXw47Hy+5LkzxEuBdVal/fwcVxcLyK2cTrb15Iu3hohlQ1gGSnO+NbHFZpzf1o4ull
 TFxpGPNkZYZiZXKZWHDZVCOL6IetqffmoV4BZ1z+FSpB5dp0XAMT96E+uAD4pRtSXmisQGHVQ0z
 pISeVB5Ukdi8QBoVqYEaz+ZaIjleMgQp/85gJVQ4K1/bnEsUr96Wx7A6dWsLNs1m+qqdEBMTgkR
 3s1evimRDRJqBYIAmBkgR1IQLzDniPGWlHvPI2mSG8k8ntixPYejBGd578Fw1u6xQz6WBA==
X-Received: by 2002:a05:6000:1848:b0:431:cf0:2e8b with SMTP id
 ffacd0b85a97d-432448ac61dmr3316980f8f.29.1766063818312; 
 Thu, 18 Dec 2025 05:16:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzPRYLdA9aqkfme3vftsM2x6w3AnDICmu456zKjmpq+1pcYRrN040I6jJAyyDJQTi4+yLLEw==
X-Received: by 2002:a05:6000:1848:b0:431:cf0:2e8b with SMTP id
 ffacd0b85a97d-432448ac61dmr3316909f8f.29.1766063817795; 
 Thu, 18 Dec 2025 05:16:57 -0800 (PST)
Received: from imammedo ([213.175.37.14]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432449986f1sm5011202f8f.29.2025.12.18.05.16.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 05:16:57 -0800 (PST)
Date: Thu, 18 Dec 2025 14:16:54 +0100
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
Subject: Re: [PATCH v5 17/28] hw/i386/pc: Remove pc_compat_2_6[] array
Message-ID: <20251218141654.5862533b@imammedo>
In-Reply-To: <20251202162835.3227894-18-zhao1.liu@intel.com>
References: <20251202162835.3227894-1-zhao1.liu@intel.com>
 <20251202162835.3227894-18-zhao1.liu@intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: reeGA3E4ohbIZEIMXiiJL6mMb1vu8wt2UtSEPDJbN1M_1766063818
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

On Wed,  3 Dec 2025 00:28:24 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

> From: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>=20
> The pc_compat_2_6[] array was only used by the pc-q35-2.6
> and pc-i440fx-2.6 machines, which got removed. Remove it.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/i386/pc.c         | 8 --------
>  include/hw/i386/pc.h | 3 ---
>  2 files changed, 11 deletions(-)
>=20
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 2e315414aeaf..85d12f8d0389 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -263,14 +263,6 @@ GlobalProperty pc_compat_2_7[] =3D {
>  };
>  const size_t pc_compat_2_7_len =3D G_N_ELEMENTS(pc_compat_2_7);
> =20
> -GlobalProperty pc_compat_2_6[] =3D {
> -    { TYPE_X86_CPU, "cpuid-0xb", "off" },
> -    { "vmxnet3", "romfile", "" },
> -    { TYPE_X86_CPU, "fill-mtrr-mask", "off" },
> -    { "apic-common", "legacy-instance-id", "on", }
> -};
> -const size_t pc_compat_2_6_len =3D G_N_ELEMENTS(pc_compat_2_6);
> -
>  /*
>   * @PC_FW_DATA:
>   * Size of the chunk of memory at the top of RAM for the BIOS ACPI table=
s
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 698e3fb84af0..f8f317aee197 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -295,9 +295,6 @@ extern const size_t pc_compat_2_8_len;
>  extern GlobalProperty pc_compat_2_7[];
>  extern const size_t pc_compat_2_7_len;
> =20
> -extern GlobalProperty pc_compat_2_6[];
> -extern const size_t pc_compat_2_6_len;
> -
>  #define DEFINE_PC_MACHINE(suffix, namestr, initfn, optsfn) \
>      static void pc_machine_##suffix##_class_init(ObjectClass *oc, \
>                                                   const void *data) \


