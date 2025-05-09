Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp964949njb;
        Fri, 9 May 2025 02:18:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXrldC1+VSnAS/r4qEJyWYlxjyemAiMsiTuct83lk/mcWmtL94Ab7B8vwZG+o7IYUEVhtUWUj0nfUeIbQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFqMAwb3uIeXpgzK7ljhHfAHChO4AebPDrkOd1cTsEoRLcS082YMLYXSeuY4wsvsmR0aHam
X-Received: by 2002:a05:6214:258c:b0:6f5:371e:4bff with SMTP id 6a1803df08f44-6f6e4710862mr42505206d6.0.1746782291254;
        Fri, 09 May 2025 02:18:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746782291; cv=none;
        d=google.com; s=arc-20240605;
        b=cbKmEUQ9srm5p0l6rUd1GceWLC4A/n9RbputVQR9Ef+sZaLXhyB0OHQcRR5ap7Tcox
         dxL0CRkOjqbfjeskfjVXnaKymW6iFoQ5u54x4sSX34H3tJBRiEoXEoMh23ZP4m6jhnlY
         JQ21D1sS6wZmy9E8g78tz0SlqzLyMQ2njAlXVAevMhQPHy1zJnl6Jymm4Uc/UctuQYyA
         /vvT+fUrdasnnYfgeVZEJpno4pfGlsEfLJJw5kY0NvQ2v8MIUC3BgBM49IL+a9I2/ZiT
         16+HAKZcGq/LXkzR++9rHcnVbkOil16wiRtY8PaqwPoJ3+ZXQusOq30+FwQArZd68dgY
         hx5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=KMKfvCfIMx9VS+XW9dKOprM7bEtcwSmC/fSVoiAttRQ=;
        fh=XwZ+SlKA2ObuTzjRd0BDrVQXnQFFQXDytsanjW2699w=;
        b=OsPV90J2+OtfiILF4XMb5HnflAE8uNkMLcLX1GY9EDGbQAk4RB1Sf2czBVPneq8HyG
         8L0uSaFhRl6ObOayUEae5pl8ztTNbpq/ljXHdO5VwCn3PoCn/gXB22lbCmTLF4D8KDqM
         Q2Yo9NpYJ/Qwk2mSWdQru2GXvQIQB/L3SlvSx+0GL1XnhlnQRzIfAJ5Wwm0NrTSovtfD
         +cZaRdMBZ5b0dmA58Hvy1vDBq3xzIoVVcS3/u0kePcKvBIMgudkoGlQnkjd5o1jA0+Kr
         Qdf77wHtlH7U9ZA9BDNMQIR8lSW0dkTJEprBl59q9pkhgRYmgcZCcq2U697QCx/0RG1+
         eEyA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="EbOy4/LJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e3a592afsi18947306d6.442.2025.05.09.02.18.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 May 2025 02:18:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="EbOy4/LJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uDJrr-0007yI-Kw; Fri, 09 May 2025 05:18:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1uDJrp-0007vI-U7; Fri, 09 May 2025 05:18:05 -0400
Received: from mgamail.intel.com ([192.198.163.8])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1uDJro-0001ww-0e; Fri, 09 May 2025 05:18:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746782284; x=1778318284;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=h0jLMVr4wHnyYCY84J6GlAtgPWQ/rDP7k9g6E5hEDYQ=;
 b=EbOy4/LJ024PcenYgIMqk7ge4JeAbBc6BwRStAW+wcR0Cc3L7kcVtLKU
 wEZULU05wlalTrLj+PSJupQVoRAt9BjaTaQYBAkHA5mEUL4bHIHAJfHJB
 3v4bfNe5apzyfBOeY85z35PIaUXsjVOJ78np3qYhdQapCx/bkFte3wcTq
 rYjt56R2kNd58CSp+99R4I1xrRPkrThz9kziqT9UgqdNhtM/Ak7+lcSWU
 a0OeKdqEcdYDy6Dqe1i3QHugL3BKt4nxR7McMznZf/mfBAeql0d95YSud
 S7DNahcW3xDckskwRfZ89Sl00UNtA/tKT7tAPL4Q+K02cnLNeH7QdjTLO w==;
X-CSE-ConnectionGUID: TQL3I8hHRbWuAJKl1t1a/g==
X-CSE-MsgGUID: uY15pQZDSrOzsjzzf87qPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="66135975"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="66135975"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 02:18:01 -0700
X-CSE-ConnectionGUID: PtU105OcSpyexIUEeJfEMQ==
X-CSE-MsgGUID: PXGVHxs5RDmF6e6hkLHUeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="167496453"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.39])
 by orviesa002.jf.intel.com with ESMTP; 09 May 2025 02:17:54 -0700
Date: Fri, 9 May 2025 17:38:55 +0800
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
 Huacai Chen <chenhuacai@kernel.org>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>
Subject: Re: [PATCH v4 22/27] hw/core/machine: Remove hw_compat_2_7[] array
Message-ID: <aB3NL4k1baV0k6iu@intel.com>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-23-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250508133550.81391-23-philmd@linaro.org>
Received-SPF: pass client-ip=192.198.163.8; envelope-from=zhao1.liu@intel.com;
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
X-TUID: S7Tkd6DQSNHq

On Thu, May 08, 2025 at 03:35:45PM +0200, Philippe Mathieu-Daudé wrote:
> Date: Thu,  8 May 2025 15:35:45 +0200
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH v4 22/27] hw/core/machine: Remove hw_compat_2_7[] array
> X-Mailer: git-send-email 2.47.1
> 
> The hw_compat_2_7[] array was only used by the pc-q35-2.7 and
> pc-i440fx-2.7 machines, which got removed. Remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> ---
>  include/hw/boards.h | 3 ---
>  hw/core/machine.c   | 9 ---------
>  2 files changed, 12 deletions(-)

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>

