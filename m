Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp882389njb;
        Thu, 8 May 2025 22:50:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVgGYWQjlR1SpipbkP1h+AqFhpMiIkWhDaR74Pw6PVMvqSfndUnGCKot6J4o+d/eva2bYe//YguAWhrug==@linaro.org
X-Google-Smtp-Source: AGHT+IFwbSpvCFVkXqZFZLrA7jX9uLXYUnDQL17Xndpm9WbwVcazwM9byfSYlL3e1X8Y6rH+DOo4
X-Received: by 2002:a05:620a:45a5:b0:7c5:42c8:ac82 with SMTP id af79cd13be357-7cd010f755fmr395663685a.23.1746769847623;
        Thu, 08 May 2025 22:50:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746769847; cv=none;
        d=google.com; s=arc-20240605;
        b=GuX0I41iD0auD0wCFBcmFt/EK8RSaQV28OF8VLf5qpn8lY0ix5OfpvLF51PQEJP3iY
         WXj0B3wU9GKNcFrQafp8gCEEyUJO5SwpMnOyr9uzrsymxsF/0DfAje8z5K7HzwpZqT8H
         Sd926K0eXIQS8xM9wmc4iCj+4axBwiQRNRGJ3HuDLx5kspU1KwGWBCsnlGyyU5rbegc4
         i5XRGFxniXs0MtrwuZ1k6a6sTFxIGLk/EPaWePwarNpTt6Wqrsl+8iJ6C41bewfyTYxh
         um5Y4czbTPOfFRws6SIboaqsMINK8fA5dCqz1qUqsKbM32XoMUS8zNSW6vtEeeHw60Yz
         f64g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=e+jWQzBhRZEUe8oXm0C8iZ2ryUBnmmxqJrilXv9PmiM=;
        fh=6ClAviKcS8/VC/C3AANNJKbWqlGVrhfReqMLmQXmnUI=;
        b=fXQQLVVna6xNX2Ly7h2I3/YLl4hOQmKNmrVjAmUTjm9j68+VJdWdHMWTBw2Zi6h4kN
         YxaCjFwg7rUoBcQaxPUFbB/yELRjSl+ZHUOtqJQeECjLsVMGP8YPvhxlu9p1dfoukUVL
         wbo/i8XUFfjcROEmbNl9LLWxDD3nFBoNaF+LleyHhkXsZ7xYfTyITnhzzlY/zHBVVOQ5
         wtS9KMrZOOz3e9kwDgksFwbO0zSOrcP3G2osQAzV93s1l/aFH2QSUCUoSnFbgb1oQi/L
         Wi0wKk5gi6XdFjBtrNg/Bjkj8sx3hIPxV4dTbreaVCWtVVKtY9bHlWopxIaUxn0MNToh
         gjnQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=kaNEX7hx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-49452479ba3si13471411cf.176.2025.05.08.22.50.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 22:50:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=kaNEX7hx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uDGd1-0001l1-71; Fri, 09 May 2025 01:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1uDGcu-0001k3-BL; Fri, 09 May 2025 01:50:28 -0400
Received: from mgamail.intel.com ([198.175.65.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1uDGcs-0001hE-1e; Fri, 09 May 2025 01:50:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746769826; x=1778305826;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Qp3EPRPo70sgN1uj4hzL+wEQ51l0JjZrt2iWIfrv9rg=;
 b=kaNEX7hx8/EQEUWJPdXOdCjhYrxbZtnq0e/joGCN2llW8+A+6bh16aKh
 UtY/oEB18oaxSlPi2wpgEw/iML/3eRJVvV6wvZW0uAqGsifb2c7lAWnl0
 n9BOmIwVmZp4gb4Agt2dA+hTyI6+bNdbwxDl+XW5v8O+wcbmgBSTqKKxt
 QH0TbfP+MR2Il8tvyBk2rkgi1Jq0sshhXtTlht5+qbaoykK9SU1WmlA81
 d60KMBcHoBOGABl3LMePkBnRIPHte0tjVnoAxOG6/5ZmbTm3sXlhgAL7Q
 M0RqSaEUZk7QVYw37lQxBh51AIxtn05ehhXw2/eVOQcOeACMezGSbH2ys Q==;
X-CSE-ConnectionGUID: HtDQ5jssQWS8r3lgjCNO/g==
X-CSE-MsgGUID: 01iG4ga3Qe+ZIvPWRfmZhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="58800370"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="58800370"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 22:50:20 -0700
X-CSE-ConnectionGUID: I+FTBT90SwOiAl9LEgJUUg==
X-CSE-MsgGUID: IySnxT85QRubxpZ9cXnaAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="136525784"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.39])
 by fmviesa007.fm.intel.com with ESMTP; 08 May 2025 22:50:14 -0700
Date: Fri, 9 May 2025 14:11:15 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 kvm@vger.kernel.org, Sergio Lopez <slp@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Yi Liu <yi.l.liu@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Amit Shah <amit@kernel.org>,
 Yanan Wang <wangyanan55@huawei.com>, Helge Deller <deller@gmx.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Ani Sinha <anisinha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?iso-8859-1?Q?Cl=E9ment?= Mathieu--Drif <clement.mathieu--drif@eviden.com>,
 qemu-arm@nongnu.org,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Jason Wang <jasowang@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v4 08/27] hw/i386/pc: Remove multiboot.bin
Message-ID: <aB2cgzGANdpFfEBd@intel.com>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-9-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250508133550.81391-9-philmd@linaro.org>
Received-SPF: pass client-ip=198.175.65.11; envelope-from=zhao1.liu@intel.com;
 helo=mgamail.intel.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.416,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rxivxcI0f51L

On Thu, May 08, 2025 at 03:35:31PM +0200, Philippe Mathieu-Daudé wrote:
> Date: Thu,  8 May 2025 15:35:31 +0200
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH v4 08/27] hw/i386/pc: Remove multiboot.bin
> X-Mailer: git-send-email 2.47.1
> 
> All PC machines now use the multiboot_dma.bin binary,
> we can remove the non-DMA version (multiboot.bin).
> 
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  pc-bios/optionrom/optionrom.h     |   4 -
>  hw/i386/pc.c                      |   1 -
>  pc-bios/meson.build               |   1 -
>  pc-bios/multiboot.bin             | Bin 1024 -> 0 bytes
>  pc-bios/optionrom/Makefile        |   2 +-
>  pc-bios/optionrom/multiboot.S     | 232 -----------------------------
>  pc-bios/optionrom/multiboot_dma.S | 234 +++++++++++++++++++++++++++++-
>  7 files changed, 233 insertions(+), 241 deletions(-)
>  delete mode 100644 pc-bios/multiboot.bin
>  delete mode 100644 pc-bios/optionrom/multiboot.S
> 
> diff --git a/pc-bios/optionrom/optionrom.h b/pc-bios/optionrom/optionrom.h
> index 7bcdf0eeb24..2e6e2493f83 100644
> --- a/pc-bios/optionrom/optionrom.h
> +++ b/pc-bios/optionrom/optionrom.h
> @@ -117,16 +117,12 @@
>   *
>   * Clobbers: %eax, %edx, %es, %ecx, %edi and adresses %esp-20 to %esp
>   */
> -#ifdef USE_FW_CFG_DMA
>  #define read_fw_blob_dma(var)                           \
>          read_fw         var ## _SIZE;                   \
>          mov             %eax, %ecx;                     \
>          read_fw         var ## _ADDR;                   \
>          mov             %eax, %edi ;                    \
>          read_fw_dma     var ## _DATA, %ecx, %edi
> -#else
> -#define read_fw_blob_dma(var) read_fw_blob(var)
> -#endif

It seems read_fw_blob() could be dropped as well and this is not a big
deal. So,

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>

