Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp477251ejv;
        Wed, 27 Mar 2024 06:55:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWq2xKlPc3PistLd4fE3fJta7Ga04CJBp9pjjUndqafMlQg3ovLAhBF0DtfxVnpTx5JlfwQPzvq+mHUYQGV3EyzA/9YRkBB
X-Google-Smtp-Source: AGHT+IGmLTLVeeYB5Loqn6raAfnwSIz07ym6dEx6+/QfyRQoc5rhkP3t2JRF3kmiowJ7dVWK1lgt
X-Received: by 2002:a05:6214:e89:b0:696:236b:c158 with SMTP id hf9-20020a0562140e8900b00696236bc158mr5430275qvb.1.1711547699804;
        Wed, 27 Mar 2024 06:54:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711547699; cv=none;
        d=google.com; s=arc-20160816;
        b=kZ1FlTNiRXwGbTOhiCo65Gj1nFDX86GoUapN4P91m2DvTykqd/0Yfe05Ve7CzGkp+K
         bkcQC6kgqBfyltnFgVuNE/31PHpz8TjZ+AuL1P8E/qHYPdiLAbbp+7mYIzED5nnwahOd
         Ku7o4tpQSggN8r1+jni124BBtFcl7njq6s/elozaviERgWTxju9g0HsoaMuZx4UchO58
         AJwX2ZDe+ZSQuLBBeTltc9WDcDb/48gpfWWZY+w9pEaVNHdKppKnF7VoEGjMhv1TSR5H
         RAMputGlck1nZwPmWjn6UuuJAVOUpwBD9T2VEid8ECgG8f/X+OJ9qFJ5qHCFzrJXdUet
         Kwpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=Iqjoc5giyqC6qpXMEnHAOQAIfp5LTbThOabbaNlqsY4=;
        fh=cmeBVc0/X94lMLxNKdjyCBgTBXAt7CFBf2FU7Kv0ncw=;
        b=dRNviVMTM4INusXpFTWyEE7rcDF4kOO32xMuo1Afgm6JNANbdZ3GmBxDo4DpPeD1bm
         XyIGfr3d9UAZZccfxmwil6AD3XflmhWe9CIjrpRGUX8KpFdZgi1sJ0KdgvUHU6mOb4rc
         82XNIyB4RfmcAN3IWUFGZcmIh9+m5hKNcR/96nTDEHM9+REA0kE2UsiAxovsVo5HB+KX
         uHHEhZe+r/FKH3HUQrQAKFSGfpa/jhIb5f/BZfAkbyuvfmtunYetiA7VeZjPq63LHiHT
         fGir4eHJrjpnDxSClPkXIr4RoC5/VCAAz88NtJ62JEKQ4MTuJFP9LAbljYTTuyKIzuCf
         goBw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=WnIg2JhK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kd6-20020a056214400600b00696b0d46e7esi784343qvb.302.2024.03.27.06.54.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Mar 2024 06:54:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=WnIg2JhK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rpTjh-0004Vu-48; Wed, 27 Mar 2024 09:54:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1rpTjg-0004VB-5G; Wed, 27 Mar 2024 09:54:36 -0400
Received: from mgamail.intel.com ([198.175.65.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1rpTjd-0003OR-Ub; Wed, 27 Mar 2024 09:54:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711547674; x=1743083674;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=iTLGYFoNuY8A1vOqe8hPovHfp1x9Dd+JH6t1fYzYsT0=;
 b=WnIg2JhKM0tChHVZp7XfUbOBokboJJb54jmSRIcY9RHHb5yNo8hgyoqY
 vSUxKTeeZf0gdb/WDws1gP9FY6B1/wnWaCRJgT5Puc/HipjMRx+G3Sk45
 dMiub2OOy3XGtnmqkz0SMxahVbqeYM+oYaMDR+IqIyNVEiOYpws1t0o6b
 o6xEMwg7ErKajEvLXRwm78SuG5KZjezZ2I/x+toRQQCax/5ynnNL96aTM
 7UBZ6D55nqZV854nTEqCWogfExFV4fTySQmYeOmeUEAd95LjP85lSlZnN
 PT4uWRkkcFqUYv5wwCLxlk+LnW5JhFbRVsV3xz0gbJzztErz/YDjJi6M8 w==;
X-CSE-ConnectionGUID: idNcBpYcS7KhkFUHcQzlBg==
X-CSE-MsgGUID: WZcMIFEWR3ahYjRZLhkRAQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="18079594"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="18079594"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 06:54:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="16333882"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.36])
 by fmviesa006.fm.intel.com with ESMTP; 27 Mar 2024 06:54:16 -0700
Date: Wed, 27 Mar 2024 22:08:12 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, devel@lists.libvirt.org,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Song Gao <gaosong@loongson.cn>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: Re: [PATCH-for-9.1 v2 10/21] hw/smbios: Remove 'uuid_encoded'
 argument from smbios_set_defaults()
Message-ID: <ZgQoTF3FUOpIZAix@intel.com>
References: <20240327095124.73639-1-philmd@linaro.org>
 <20240327095124.73639-11-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240327095124.73639-11-philmd@linaro.org>
Received-SPF: pass client-ip=198.175.65.12; envelope-from=zhao1.liu@intel.com;
 helo=mgamail.intel.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Tj05rSSUjjsU

On Wed, Mar 27, 2024 at 10:51:12AM +0100, Philippe Mathieu-Daudé wrote:
> Date: Wed, 27 Mar 2024 10:51:12 +0100
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH-for-9.1 v2 10/21] hw/smbios: Remove 'uuid_encoded' argument
>  from smbios_set_defaults()
> X-Mailer: git-send-email 2.41.0
> 
> 'uuid_encoded' is always NULL, remove it.

It's a boolean, so,

s/NULL/true/.


> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  include/hw/firmware/smbios.h | 3 +--
>  hw/arm/virt.c                | 3 +--
>  hw/i386/fw_cfg.c             | 2 +-
>  hw/loongarch/virt.c          | 2 +-
>  hw/riscv/virt.c              | 2 +-
>  hw/smbios/smbios.c           | 6 ++----
>  6 files changed, 7 insertions(+), 11 deletions(-)

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>

