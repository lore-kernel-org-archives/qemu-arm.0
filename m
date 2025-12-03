Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72B1D1266D
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Dec 2025 06:12:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vQg5q-0008NE-Vx; Wed, 03 Dec 2025 01:12:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vQg5Z-0007Zy-R4
 for qemu-arm@nongnu.org; Wed, 03 Dec 2025 01:11:47 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vQg5X-0001Di-53
 for qemu-arm@nongnu.org; Wed, 03 Dec 2025 01:11:45 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4779cc419b2so65114405e9.3
 for <qemu-arm@nongnu.org>; Tue, 02 Dec 2025 22:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764742299; x=1765347099; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dlyYuqrBIco0T5Nx+vrsokniVf0Y0mIPJ5rNnrQW6jE=;
 b=Kl1nOj93hprFj63rSc84NgUwjljsddCn8UqBoxVWd78j92Imr4TrvGkHZsrEGfvUvn
 +Nbpja5SSc9Hd4ePlDIBOSqpo4EnDh84+D6EeBZLaMqffmK74YXJwr89D4VVxmlaAkLQ
 qIiNwke7qTJSuhODEidgl/JGsaOjXa96BpKSq4+G/0d9djLKOElW6Z13qIi1/1j+xCBj
 I/lZirc/Rm1c3T7al0NWjOAZ1nX8hXOoB6I0E0SMKT+ZOoyD1Ed7p7yMEk/HsVjwmrvW
 fL0kdg2DbFcAs0m8ycN6cB1j8L74sv7Jzutc2oznsZIqFMeP6ZkHCULy05fRFFK+uJOI
 PxyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764742299; x=1765347099;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dlyYuqrBIco0T5Nx+vrsokniVf0Y0mIPJ5rNnrQW6jE=;
 b=ZdBhJNZCB+ieqH47A3LVskJdduR4l8Fz7iAnHut6IN9ON2x++LFRTUw1EP8AmL23/n
 Po1GOIvS5E3rKAaI9EBREbTrAT4C6W7klBmhAHJDJf+gCNrsFG2z/u2t1vcDCIVBIFLR
 VIdMmcU5PDVZ7D/ixXTrCbnjJsWEMsj0U8ioQrAdXjhBDagckqdF9nluFl4JJU2Ez+J9
 3C583/G86q1Q5LEgbDLaac74pfk/ZdQThLoexY/VLhw0dP0xShXFwfRHmg0nfNLXhKqX
 gqTfjeEggWtO8jQ4qwNxKNXfGKaRR0QP9/WjZtM3uNPnNpd6YsAEZQj03j2IzxiCELWr
 mWcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWCLMU+/3k/klU7OtF0JYURaV6N5hsvvVFH0kHjX9hZyimvsCKU8NPvSkGqKL5HTkpfzOpYf/TJA==@nongnu.org
X-Gm-Message-State: AOJu0YwFx1DLGYGRg2OeN8aJZJg10DlcXI9JsC25fXOKWstMxnPK6lTA
 G7q7RN3PIGGOph/n41UiRicHGA6YW6BnDgrsmhRcRxC+zQV0D+spT52aqLlLAHgEwvk=
X-Gm-Gg: ASbGncth34NMuSWAlT4SIObxckf34PU7AYQSHhy3TN0jmVwUJR+Qdnxh9q+/bVIAKok
 yNEpdg2cbUdey+bTbqBZS7Piuobq3683Wp/4lmkf6eW1K8GUA/g2QBSLLIhWpEzp45yNnqaMnNf
 tnv2rKBuoiozOITYl9ktyQw5NMtDk8U3ogR3xuQdKfCM+ldmb8CYqM8YcmD7+UGuWhqR8KP6+/5
 iw5ZLNmBOpolB7w1WzOS/zZHaZdQWdPvdODTdKkHLN2zTVOSJ14vrTYXtLteI6zq2ELVV5iWK16
 GdDkN0Fzv+sXURIhzWrYdvrYjKS+zCsCpThZP+6znnyOppyeJGo7XLXRipqRTjG/x3G+E6bekz7
 58bQMzQAwCO4twL29c1uNYLyQVHPCAIkCNuOxT+sTNwctC+Ek38RWi7M7r9WAd2Bav4CfdXUgbG
 Op2LPQzqdTeLaXkoDnc2SDSIoCXq+qGN6JTy0+9JK7YHZTw/6a5t3lATJnHU1BUroG
X-Google-Smtp-Source: AGHT+IHvIQmfDwnTD8drf7tdAaJELXEvl7wBw+FoUcPNb0LeOYFoiFRBKneLkS5TxZ8trSwEw5E/YQ==
X-Received: by 2002:a05:6000:1ac9:b0:42b:2fc8:186 with SMTP id
 ffacd0b85a97d-42f731bc03amr722215f8f.46.1764742299461; 
 Tue, 02 Dec 2025 22:11:39 -0800 (PST)
Received: from [192.168.69.213] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1caa86d0sm35622115f8f.39.2025.12.02.22.11.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Dec 2025 22:11:38 -0800 (PST)
Message-ID: <3991ece0-b49a-4c09-9309-ed0c50ce2a24@linaro.org>
Date: Wed, 3 Dec 2025 07:11:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/28] hw/i386: Assume fw_cfg DMA is always enabled
Content-Language: en-US
To: Zhao Liu <zhao1.liu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, devel@lists.libvirt.org, kvm@vger.kernel.org,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Sergio Lopez <slp@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
 <lvivier@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yi Liu <yi.l.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Amit Shah <amit@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>,
 Yanan Wang <wangyanan55@huawei.com>, Helge Deller <deller@gmx.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?Q?Cl=C3=A9ment_Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Peter Krempa <pkrempa@redhat.com>,
 Jiri Denemark <jdenemar@redhat.com>
References: <20251202162835.3227894-1-zhao1.liu@intel.com>
 <20251202162835.3227894-16-zhao1.liu@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251202162835.3227894-16-zhao1.liu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 2/12/25 17:28, Zhao Liu wrote:
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Now all calls of x86 machines to fw_cfg_init_io_dma() pass DMA
> arguments, so the FWCfgState (FWCfgIoState) created by x86 machines
> enables DMA by default.
> 
> Although other callers of fw_cfg_init_io_dma() besides x86 also pass
> DMA arguments to create DMA-enabled FwCfgIoState, the "dma_enabled"
> property of FwCfgIoState cannot yet be removed, because Sun4u and Sun4v
> still create DMA-disabled FwCfgIoState (bypass fw_cfg_init_io_dma()) in
> sun4uv_init() (hw/sparc64/sun4u.c).
> 
> Maybe reusing fw_cfg_init_io_dma() for them would be a better choice, or
> adding fw_cfg_init_io_nodma(). However, before that, first simplify the
> handling of FwCfgState in x86.

I answered these concerns here:
https://lore.kernel.org/qemu-devel/20251203060942.57851-1-philmd@linaro.org/

> Considering that FwCfgIoState in x86 enables DMA by default, remove the
> handling for DMA-disabled cases and replace DMA checks with assertions
> to ensure that the default DMA-enabled setting is not broken.
> 
> Then 'linuxboot.bin' isn't used anymore, and it will be removed in the
> next commit.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
> Changes since v4:
>   * Keep "dma_enabled" property in fw_cfg_io_properties[].
>   * Replace DMA checks with assertions for x86 machines.
> ---
>   hw/i386/fw_cfg.c     | 16 ++++++++--------
>   hw/i386/x86-common.c |  6 ++----
>   2 files changed, 10 insertions(+), 12 deletions(-)


