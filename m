Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C560CD6D22D
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Dec 2025 14:34:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vWF4d-0001sz-F6; Thu, 18 Dec 2025 09:33:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vWF4a-0001s9-SR
 for qemu-arm@nongnu.org; Thu, 18 Dec 2025 09:33:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vWF4Z-0002o8-3J
 for qemu-arm@nongnu.org; Thu, 18 Dec 2025 09:33:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1766068419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o2jclgT+hyK8+FgcLN0D0cFPi3FqzWtgZmEYfXHS49I=;
 b=cYTMOz9qVpWwpGjhtWjaL9x+jvIj0trzxEATGZpsObwihs33xXCosExg6CAeA9w0aR6BjB
 E8rsZ2vUwmYwoVcI6O4Sd8SEQXHGgihPLVdIa/7xtQlq2b39qToMJJfymG9bKUM39haeEU
 DeMr62gDMzSfwiBoGHyZ2n6Rv556Ep0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-42-Apc08YJqNR2kBnxHJgGGyw-1; Thu, 18 Dec 2025 09:33:38 -0500
X-MC-Unique: Apc08YJqNR2kBnxHJgGGyw-1
X-Mimecast-MFC-AGG-ID: Apc08YJqNR2kBnxHJgGGyw_1766068417
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4775f51ce36so5063175e9.1
 for <qemu-arm@nongnu.org>; Thu, 18 Dec 2025 06:33:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766068417; x=1766673217;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=o2jclgT+hyK8+FgcLN0D0cFPi3FqzWtgZmEYfXHS49I=;
 b=QPue6Q/d3gv+/pHIlUYVZXsc80bTWYviX9BD/pPe3sec+Nr9ssm3AUAxQcGrYUW/Ae
 8+IHYAu+m9riSL2A7uZbiuKebYbvf84V1lb6qEnYFgw/iuXRsTgfSEJksxfy2+4JPra3
 bYxkgZlews0UbeLlwR47oHstiSXRKI1y4c9ajeOwzjH4zDEPjHJrIzz/1ZBqHrywMzBw
 LIk/wq3+WRy6wtpwNupW+gLX82tp8JAseakN0JNQGFzUGOZFPF4JPb1xgxX+3jjRLghT
 tGWlWoTj8259tY8Ow59+vmEUtOMWvB1fOOq7Rt8zhKD/DJlUuOE9HnBcIPbw3jKcg914
 TlPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsy1gjG21EdD3Q/s7Bj+gWaf9WPDWouQ4+xi9QWl71pQMf69aLktHI2YjBJ1bLuc9/5U1DK+QGJw==@nongnu.org
X-Gm-Message-State: AOJu0Ywb1xMgZmCOFLjBJkBCdLIPRJP4mPUo6MOY0YdtTrRF1X0VQ4Tq
 dKMC8g3XV5WJaq6Nlxa2KW3wKFKb7UJFhgYUB6QLNJFx9QJ1kB7/L8WyqmPTv3+C1R75DcY80UR
 OryYiDvDD/eTU5jJ/Jadu96pHOIjmCNHUOL+RdOKjTL5yKqfSTpvO0Q==
X-Gm-Gg: AY/fxX5/A8ZBg0YHOxlrGRxBGEFv0QmV/NkIRtisDfKUIUKPdB6BjrP4GtfLbXLBoUz
 uA+BboQW+YHoQYv8FFMt3ORjyo+iy1uyxZl4oQPkiB5ld1vaYBsBGfoXUVKdOhgbhN/mnX1diNm
 I84ehyjwIlZDO9PLEP8h6sNPXNxFadh7u7so4IWz9TPS9XKKLWS/z6e9NAmwzPCkPOtcaX+1KqE
 IhqNkphxYlwhq/7BJ0/UPnpgztZ4jhnqVwafD9Et6MnYucdCl5tRyjw0Nmo4CZ2zDbyv2BPIy4t
 9dxQS3D0kKg6l8lBTvxMWLwUdPvW+KLu1Q3ijGdy5bcV3Fq09ncepXOHChDjDWS0JVLXnA==
X-Received: by 2002:a05:600c:444b:b0:477:9b4a:a82 with SMTP id
 5b1f17b1804b1-47a8f91561cmr213459855e9.35.1766068417007; 
 Thu, 18 Dec 2025 06:33:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHkM8I8rGTbj5vVhu+IFR0KTxVCJf2Bqm0R9jiEdZksNnyLIDlDTrsToVkrXGVL7udw2ORQQ==
X-Received: by 2002:a05:600c:444b:b0:477:9b4a:a82 with SMTP id
 5b1f17b1804b1-47a8f91561cmr213459505e9.35.1766068416567; 
 Thu, 18 Dec 2025 06:33:36 -0800 (PST)
Received: from imammedo ([213.175.37.14]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be3a0fb5bsm15679935e9.1.2025.12.18.06.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 06:33:36 -0800 (PST)
Date: Thu, 18 Dec 2025 15:33:33 +0100
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
Subject: Re: [PATCH v5 16/28] hw/i386: Remove linuxboot.bin
Message-ID: <20251218153333.6cb6e080@imammedo>
In-Reply-To: <aUOxBg3bVii1HAOx@intel.com>
References: <20251202162835.3227894-1-zhao1.liu@intel.com>
 <20251202162835.3227894-17-zhao1.liu@intel.com>
 <20251217155530.3353e904@imammedo> <aUOxBg3bVii1HAOx@intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NrlFNd9E6mX-KGHSAFfRJgAoFgGX4S1pwiEnXXFGn5o_1766068417
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
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 18 Dec 2025 15:45:10 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

> On Wed, Dec 17, 2025 at 03:55:30PM +0100, Igor Mammedov wrote:
> > Date: Wed, 17 Dec 2025 15:55:30 +0100
> > From: Igor Mammedov <imammedo@redhat.com>
> > Subject: Re: [PATCH v5 16/28] hw/i386: Remove linuxboot.bin
> > X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
> >=20
> > On Wed,  3 Dec 2025 00:28:23 +0800
> > Zhao Liu <zhao1.liu@intel.com> wrote:
> >  =20
> > > From: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > >=20
> > > All machines now use the linuxboot_dma.bin binary, so it's safe to
> > > remove the non-DMA version (linuxboot.bin). =20
> >=20
> > after applying this patch:
> >=20
> > git grep linuxboot.bin
> >=20
> >     option_rom[nb_option_roms].bootindex =3D 0;                        =
           =20
> >     option_rom[nb_option_roms].name =3D "linuxboot.bin";               =
           =20
> >     if (fw_cfg_dma_enabled(fw_cfg)) {                                  =
         =20
> >         option_rom[nb_option_roms].name =3D "linuxboot_dma.bin";       =
           =20
> >     }       =20
> >=20
> > perhaps it should be fixed in previous patch =20
>=20
> Thanks, I find this change was included in the previous patch (patch 15).

Yep, sorry for confusion. /I forgot to apply #15, hence it led to a stray l=
inuxboot.bin/

>=20
> And I have a GitLab branch and hopefully it could help apply and review:
>=20
> https://gitlab.com/zhao.liu/qemu/-/commits/remove-2.6-and-2.7-pc-v5-11-26=
-2025
>=20
> Regards,
> Zhao
>=20


