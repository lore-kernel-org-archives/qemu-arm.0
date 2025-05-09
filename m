Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp964474njb;
        Fri, 9 May 2025 02:17:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUEpZWW6qm/EVSr6iFaQdAzTRTeYohNipI3zwe44vl6Abkjz3JB5sLHD6eDO8fDL1Hcb5QXSKB0JJaBZg==@linaro.org
X-Google-Smtp-Source: AGHT+IG5BresowZ6FmXU3uzGYQNaQkWLo9+BJpv5PzAC2T799zLMnZ1ofnif0pab2PUFmo2ikOt/
X-Received: by 2002:a05:622a:14f:b0:476:71d2:61e0 with SMTP id d75a77b69052e-494527853a6mr38649351cf.23.1746782227230;
        Fri, 09 May 2025 02:17:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746782227; cv=none;
        d=google.com; s=arc-20240605;
        b=DZH8pXutV1eiKs3+d4TLMqz58nuZKOuuyIsDzApmvVqSJvu4toZ70COpV17M7RccYx
         qIJPzmEzooNF20KZa3i16jVTFKPvtrCl/gmF/obBA+lnS7mkp12yocvKfAlfwQNcFgDE
         du2a9iIV/Eue1goKVchCK5D5o2+nWzRd0+a7fC7DZC2EeJCbjNXax+J8LEsplLYA42dS
         tPQeqDiYBXVpMG64iwypCMF+08OROe1cr0bZdAGZF55SSUOf8qWMTu9nysT2TtY/BJb0
         AEyfEqzP0ifSgJ+9FQkoT4sEwiSUDsRGzeTEMTcGNj3GKi+SWIGcY4ksqXAoD4VXQ9mA
         sL2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=zGBjOCSdxgQBpeZN4MIjAF5RkeuY0TMw2ToDs+qh5zg=;
        fh=JxHmcrA01BA5QK0KCw1k/zuTtIunTfHN6Hx8q/ntgXs=;
        b=YSkCJzvCKsVDRG1Kq3hxoXHGGSwWLK5q3rfnhIi6KZTAeEkRozPasu+BNcnUUp1irU
         pXkOZOYfC7AzLGdzyPnhTMV4U/jDBqIbw5lmQEe9Lccjd5k85o9eG4qm1X74ByM23v1S
         dBavVSxbc3sMlyGBGGAcPnl/UjdlouRlObZMZfwpHuYjrB5M4Fd9sUKaQcdNKqecln8A
         BcCQgROpz/wA1gn8uS5dsIurghiY1MyhcvgzlZvJd7/He+VgYanltjhDxpSHlES5WNnO
         8qiv2BOsqLhCd+uYhvwnsE80YLB8p86N6L2GzLRiqxfg4eB7ZWQbPwZnrrzONzae/H2J
         GTcQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=QRIwLGQh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-494524599b0si16433801cf.123.2025.05.09.02.17.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 May 2025 02:17:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=QRIwLGQh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uDJqq-00062H-1R; Fri, 09 May 2025 05:17:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1uDJqo-00061o-L3; Fri, 09 May 2025 05:17:02 -0400
Received: from mgamail.intel.com ([198.175.65.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1uDJqm-0001rv-99; Fri, 09 May 2025 05:17:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746782220; x=1778318220;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=fWuJszRoYNIae1SRNi4ekLG9TgewBETWDbuBAJi2yAI=;
 b=QRIwLGQhuyqQZUlLqLc3YCt8tWM0E4S2+1RqCe6aFxSPVna6ZJK7SECt
 2mR7ghNC8ek1gTy5DQpHpDY+iXFpiR8fr4lxviillhJkQgT7Ha0hZzz6V
 1j+LbEVt1qq4vwy7iKK7o/zaruyRru+DvY00foHf55ZkmEQP7MRc39Aa3
 cPUsiUiW2XPS1de1/sQReIgH2DFN4HGnHSgMTfiZ2n2L+3wS0xWHPoKZz
 nK+PNtH6QvXH66EkYU6opk8EiLiVj7YwLrkkdPwXcsdMNZTcRh079na/2
 Rnm08A0prWOMTaZMfzpxWqmlLSDKOhN7SAQo1BMjb0kEnOMel9L07ySAX Q==;
X-CSE-ConnectionGUID: 0OnRid9DRN6i9wSEdnJ6Gg==
X-CSE-MsgGUID: hWQZd9NPR1+ZGExLqDqAhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59600001"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="59600001"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 02:16:56 -0700
X-CSE-ConnectionGUID: WP0RCFLKT46ejuRYK87bag==
X-CSE-MsgGUID: zI96hvJRQfaATwVfgYUpog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="167641269"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.39])
 by fmviesa001.fm.intel.com with ESMTP; 09 May 2025 02:16:49 -0700
Date: Fri, 9 May 2025 17:37:51 +0800
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
 Huacai Chen <chenhuacai@kernel.org>, Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v4 19/27] target/i386/cpu: Remove
 CPUX86State::full_cpuid_auto_level field
Message-ID: <aB3M7/RlxxDFg5al@intel.com>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-20-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250508133550.81391-20-philmd@linaro.org>
Received-SPF: pass client-ip=198.175.65.13; envelope-from=zhao1.liu@intel.com;
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
X-TUID: D2J+iLcQgA1v

On Thu, May 08, 2025 at 03:35:42PM +0200, Philippe Mathieu-Daudé wrote:
> Date: Thu,  8 May 2025 15:35:42 +0200
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH v4 19/27] target/i386/cpu: Remove
>  CPUX86State::full_cpuid_auto_level field
> X-Mailer: git-send-email 2.47.1
> 
> The CPUX86State::full_cpuid_auto_level boolean was only
> disabled for the pc-q35-2.7 and pc-i440fx-2.7 machines,
> which got removed. Being now always %true, we can remove
> it and simplify x86_cpu_expand_features().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  target/i386/cpu.h |   3 --
>  target/i386/cpu.c | 106 ++++++++++++++++++++++------------------------
>  2 files changed, 51 insertions(+), 58 deletions(-)

This property is a fix, so,

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>

