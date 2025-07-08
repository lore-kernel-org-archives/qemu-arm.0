Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC7CEC8303C
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Jul 2025 21:19:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZFAX-0003Ve-Iy; Tue, 08 Jul 2025 16:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uZDcV-0002Lm-Qs
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:05:02 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uZDcR-0003tf-Pq
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:04:47 -0400
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-408d14c7e92so3508757b6e.3
 for <qemu-arm@nongnu.org>; Tue, 08 Jul 2025 12:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752001481; x=1752606281; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Tta5Mdv0u4HyunTJLNPVqLhMBNwh/iE+JErBOo/o8Yc=;
 b=Q3yBdkFvlRNBgMI0TJ2pfF6Lgpt4slU5ZJZJmhEB0eq/9XETa9FdU6ouQ+GRJnOkSn
 JhOTCNl0CXhdGXCcviM8zWcvjhgoCYBYtV9Alji0sLkQM7t3q/iNCOHMMawW+PQqcul7
 fw2QDv7hMq9SiHimSGiZWuQIzU7SzgaieH6p8a3umoICP72dwFQctkRp9cYU6XemXaJS
 YvRqxeVZ/qhkGdgR78DxlSMoRbk9/U5m/buU/0GJkKmoezw2vrqAXIl+X7AB6HvJk21O
 7S7UwYQ2qlNnAkwfC/w9IVQxNKn0viB9V5D00gDV684G3QidVZUSXJhBVcRV/Su6Qnqh
 O1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752001481; x=1752606281;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tta5Mdv0u4HyunTJLNPVqLhMBNwh/iE+JErBOo/o8Yc=;
 b=H49ITnFb24zbSsv8WMQ/7BnSGIK5c6UniPdxmGWdp3i1gtjXxSuvNn26fhsE/zj3al
 KLYes6ibOzZl1eSoME34TbuHFzxN1cW6TcSA/7tENGyUFOuPyA6wF77ZpoAZdx4ECxk9
 j/Pacm84Qn3i+0wZmRW1HC8xKFv+pfLcg1M+otx8mrHd9rt2hT9GNMzDbrrCcfxE2Ku1
 jUqBVMJ4kGmO5WF/6vHhRV4yZPPATganRFkUTLMwEMdRYOKSBsmLh1I70gU65Z9VjPH2
 JHY/pkc/MBcrYqFU0oFwVsQXHlSnwbtZvsf8cv4ls8hKmabbEUJCfTva09ekXaZHGTHn
 x4ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL4AMc4nwjths922Ixf5E7bibxe7+1T/Gi6Nj8FL8VA4kxsgQeqmT95R+r6wE/XzzJp57U0gQ8Dw==@nongnu.org
X-Gm-Message-State: AOJu0Yw9/sHwJDdCNmaCgoU05Pt2YMJNtDwVRFbStZFYTiySlgwB4Ukf
 35ApAHJXnnNJ6jKcpegHk34ZjmEjE76r0fujkhgQIy/jU343xDC7IR3kPTjF/pW2Jf3ikEccGRT
 BIMiV
X-Gm-Gg: ASbGncu+bbpnfqYGEYad5sLeMb8gh1Wkc9xOMV23DrZ8/HccvVNLI1GmtYavOSYy3F2
 C/4tELkTGu0YuEzkoYpMafOuvmHv2RzDDD/yYPWrMEkE+vajJJRgXt07YuJwUhDeIWvOOy7He3H
 r4yk4ioGBRDjLM/bBG0Ee7kqrzbR9l9ypJ2jlPwF6bg07jw4aeR1GOpluFJJawGbwDjw9Q+rmTx
 5m+6aEhgdbUo8MvifeiYHz5cV7TeazcFO2kvTvuoyjrN3Rb0bTRsuEjbum7nvAJbbyurDerZyEu
 Mtt8mwYl62DD/OHguytupBTq4q/SwhKY8x6SZdHo1tKZzyQvud5NBDA48w1PVkclLvymsImoimy
 SBYtXFeLKnQ==
X-Google-Smtp-Source: AGHT+IGzGrv5wUVsy6z+dn1Bx5Y2gV1AqOR0Neyx1aJCMXa8JqNaYvtMeYEI5OcqDHRG/gCYni+m8g==
X-Received: by 2002:a17:902:f644:b0:234:d399:f948 with SMTP id
 d9443c01a7336-23c875428a0mr219465405ad.33.1751996129198; 
 Tue, 08 Jul 2025 10:35:29 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c8459c6e5sm122901325ad.227.2025.07.08.10.35.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 10:35:28 -0700 (PDT)
Message-ID: <c7af688f-6400-464a-b6ee-f5ae99d827a1@linaro.org>
Date: Tue, 8 Jul 2025 10:35:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v7 7/8] qemu: Declare all load/store helper in
 'qemu/bswap.h'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Fan Ni <fan.ni@samsung.com>,
 Helge Deller <deller@gmx.de>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>,
 Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Nicholas Piggin <npiggin@gmail.com>, =?UTF-8?B?RnLDqWTDqXJpYyBCYXJyYXQ=?=
 <fbarrat@linux.ibm.com>, Bernhard Beschow <shentey@gmail.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Magnus Damm <magnus.damm@gmail.com>, Matthew Rosato
 <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Phil Dennis-Jordan <phil@philjordan.eu>,
 Peter Xu <peterx@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 Eduardo Habkost <eduardo@habkost.net>, Zhao Liu <zhao1.liu@intel.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20250708171949.62500-1-philmd@linaro.org>
 <20250708171949.62500-8-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250708171949.62500-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 7/8/25 10:19 AM, Philippe Mathieu-Daudé wrote:
> Restrict "exec/tswap.h" to the tswap*() methods,
> move the load/store helpers with the other ones
> declared in "qemu/bswap.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/exec/tswap.h                 | 70 --------------------------
>   include/qemu/bswap.h                 | 73 ++++++++++++++++++++++++++++
>   include/system/memory.h              |  1 -
>   include/user/abitypes.h              |  1 -
>   target/ppc/mmu-hash64.h              |  2 -
>   hw/acpi/bios-linker-loader.c         |  2 -
>   hw/arm/allwinner-r40.c               |  1 -
>   hw/arm/boot.c                        |  2 +
>   hw/arm/npcm7xx.c                     |  2 +-
>   hw/block/hd-geometry.c               |  1 -
>   hw/char/riscv_htif.c                 |  1 -
>   hw/cxl/cxl-events.c                  |  2 -
>   hw/display/artist.c                  |  1 +
>   hw/display/ati.c                     |  1 +
>   hw/net/can/ctucan_core.c             |  1 -
>   hw/net/lan9118.c                     |  1 +
>   hw/net/rtl8139.c                     |  1 +
>   hw/net/vmxnet3.c                     |  1 -
>   hw/pci-host/gt64120.c                |  1 +
>   hw/pci-host/pnv_phb3.c               |  1 +
>   hw/pci-host/pnv_phb4.c               |  1 +
>   hw/pci-host/ppce500.c                |  1 -
>   hw/pci-host/sh_pci.c                 |  1 -
>   hw/s390x/s390-pci-inst.c             |  1 +
>   hw/sensor/lsm303dlhc_mag.c           |  1 -
>   hw/smbios/smbios.c                   |  1 +
>   hw/vfio/migration-multifd.c          |  1 -
>   hw/virtio/virtio-pci.c               |  1 +
>   hw/vmapple/virtio-blk.c              |  1 -
>   target/arm/cpu.c                     |  1 -
>   target/i386/tcg/system/excp_helper.c |  1 -
>   target/i386/xsave_helper.c           |  1 -
>   target/riscv/vector_helper.c         |  1 -
>   tests/tcg/plugins/mem.c              |  1 +
>   34 files changed, 87 insertions(+), 93 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


