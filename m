Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F9EAD68BE4
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Dec 2025 13:34:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vWE8z-0003Mg-39; Thu, 18 Dec 2025 08:34:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vWE8w-0003Lg-NH
 for qemu-arm@nongnu.org; Thu, 18 Dec 2025 08:34:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vWE8u-0006Wc-Qt
 for qemu-arm@nongnu.org; Thu, 18 Dec 2025 08:34:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1766064846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CbuQyGoQXBkCcidfFl1CrBaGSUB2FgGMEuwlp2utNTI=;
 b=T9sjKmLQ3X1WotklDG0NNzRA8IXH+YoddhhXJ1iXU0+psg2tQqs03koHTN5fSyAzrL0CIt
 Eq60QwJE5g+a1+sfV14hFm520ids/afqLWL3e3uQ1qgYczq55n6DhG47lT8Lq4bNzyzWk6
 BlXp2m5oeF4Uc/CXApFsI/v4IaoThNE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-5HtX7YOhMyKq-entIeuUng-1; Thu, 18 Dec 2025 08:34:04 -0500
X-MC-Unique: 5HtX7YOhMyKq-entIeuUng-1
X-Mimecast-MFC-AGG-ID: 5HtX7YOhMyKq-entIeuUng_1766064844
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-430857e8450so457127f8f.0
 for <qemu-arm@nongnu.org>; Thu, 18 Dec 2025 05:34:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766064843; x=1766669643;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ygbAU5x3T384LKUGynR1xkO6dKCGM4SShqXTIGHAd/Y=;
 b=P1oaCwJWAvf3RfZz0qBEFuSjq61KQRWAMFReKYoN8UVRtYZISbRHYKqtIzEXN6D/tm
 UxRPMP5SAP6+drevydvtv2KLqgrh6Z+iFX5oN3YBkr/tHYJE1JLoE2I6BFdj3AeHFELG
 5pJNUbP2DrwdFfykrmzIL7KVtuw4nBU6x+ZxuzsFgXFByZ0BR+Kkg9rYsAYx0ytnLgCL
 TTQEikVcg18aVywTWdX3soNfGU2NJydA5txtL/3j1cmdP5+OAX440TRuULt3sq/VSud3
 z751f4wHBbzt/2XHVvCCn/HxMaKY/HoDO1WnXUAktKTpEQT23q3+AgYjWyynPJlHz7l3
 U8jQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGZ8m9YiCbzxtYV9POyvT40TbNYOYxnRMfFOYaxGpyP6ipK4YDFYph9gRNm7aNREso4hU141jLnw==@nongnu.org
X-Gm-Message-State: AOJu0YyZzqQkwdJc+rvjkul02VFhF7V37jN2l2ShF12vBwRJJzx1NmOT
 NVCDIJY9afzut/9rLVS3qd1XVDi5slMzI+Dh6wmYFxCUZn7Mvm0CPyNiZ4L2UIlTmIq4AYfJcf/
 oJnudREs6irg+sFBGp8Es3pt1qzmMJvH8/015le7VL2hMkvSyKTRbAg==
X-Gm-Gg: AY/fxX7M//l7eAc/Ki1D68Byenr9dQHxBHE0dp4kvW/ySWTr2wWxtHH+/hmdjNbxicf
 zXkf0JgQWJVaQueMhQGTGX9WtxntjKM3ZYTCAnY3/Y0044jbtF8WAdyYgvhFpC8OcLVdK12JJd6
 /XHrjjYzGcMRB01fV4NHEoqUEcpn0Ud7Qmu0E+LeC+joODAHc3ty2WsC08Gs4ooLXZUg0fIgJub
 Id5+0jZXZdL8BPT75MziNoX/qOFLDkmVjazcIXWcstVe2wyAIvzMHFCaDLNnrLnGqfl3uUK2kST
 yHgqU0MY+J6aDvEkMcqCZIAVR7igVI+ruAiKTul0xBDvgGRFcD1LOZ2Orwwr2t1FiGt1vQ==
X-Received: by 2002:a05:6000:230d:b0:429:b963:cdd5 with SMTP id
 ffacd0b85a97d-43244795a5amr3553261f8f.5.1766064843465; 
 Thu, 18 Dec 2025 05:34:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIIhtQ63uV7WOn8IreQo+ZbPmGD3G2VFSLJtwjjUHetMozKfXuRebRZihn0OnYhKPteoqFwQ==
X-Received: by 2002:a05:6000:230d:b0:429:b963:cdd5 with SMTP id
 ffacd0b85a97d-43244795a5amr3553201f8f.5.1766064842951; 
 Thu, 18 Dec 2025 05:34:02 -0800 (PST)
Received: from imammedo ([213.175.46.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43244998c8asm5239848f8f.30.2025.12.18.05.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 05:34:02 -0800 (PST)
Date: Thu, 18 Dec 2025 14:33:59 +0100
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
Subject: Re: [PATCH v5 19/28] hw/core/machine: Remove hw_compat_2_6[] array
Message-ID: <20251218143359.2b3ee268@imammedo>
In-Reply-To: <20251202162835.3227894-20-zhao1.liu@intel.com>
References: <20251202162835.3227894-1-zhao1.liu@intel.com>
 <20251202162835.3227894-20-zhao1.liu@intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qjWXaTD1MU5WXP-rfeBIIlqd0ovvRW9THKu9Namrc8o_1766064844
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

On Wed,  3 Dec 2025 00:28:26 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

> From: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>=20
> The hw_compat_2_6[] array was only used by the pc-q35-2.6 and
> pc-i440fx-2.6 machines, which got removed. Remove it.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/core/machine.c   | 8 --------
>  include/hw/boards.h | 3 ---
>  2 files changed, 11 deletions(-)
>=20
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 27372bb01ef4..0b10adb5d538 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -290,14 +290,6 @@ GlobalProperty hw_compat_2_7[] =3D {
>  };
>  const size_t hw_compat_2_7_len =3D G_N_ELEMENTS(hw_compat_2_7);
> =20
> -GlobalProperty hw_compat_2_6[] =3D {
> -    { "virtio-mmio", "format_transport_address", "off" },
> -    /* Optional because not all virtio-pci devices support legacy mode *=
/
> -    { "virtio-pci", "disable-modern", "on",  .optional =3D true },
> -    { "virtio-pci", "disable-legacy", "off", .optional =3D true },
> -};
> -const size_t hw_compat_2_6_len =3D G_N_ELEMENTS(hw_compat_2_6);
> -
>  MachineState *current_machine;
> =20
>  static char *machine_get_kernel(Object *obj, Error **errp)
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index a48ed4f86a35..5ddadbfd8a83 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -882,7 +882,4 @@ extern const size_t hw_compat_2_8_len;
>  extern GlobalProperty hw_compat_2_7[];
>  extern const size_t hw_compat_2_7_len;
> =20
> -extern GlobalProperty hw_compat_2_6[];
> -extern const size_t hw_compat_2_6_len;
> -
>  #endif


