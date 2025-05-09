Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp964736njb;
        Fri, 9 May 2025 02:17:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXkQUZ+2yy/tAEki10jHQbS6JWbZ5+1thRBECGva5qf+7KJjuPapiL67QsRGk/4vjuFscmlogETYconXw==@linaro.org
X-Google-Smtp-Source: AGHT+IHSGUzxLD723kY37no/3WTuDSX6wuUoFca3rR9JEG9Q+PPRSJZAlMQl4vVqvENKkfiyBLIK
X-Received: by 2002:a05:6214:19ed:b0:6f2:b0a7:397e with SMTP id 6a1803df08f44-6f6e481f07dmr33033486d6.43.1746782263430;
        Fri, 09 May 2025 02:17:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746782263; cv=none;
        d=google.com; s=arc-20240605;
        b=lFf9xOuwsZlqgPfdMEyxKvuFwHp5+Jc7TAd9l1LIg6dIpC+f0RRa5Gjcj9FTf3Epdm
         v0r8hyWmkk8L2aFK+J0QI7oNVj9TZlxWYmK1RYEcwjkAGhF0RPUBlYsqXTpu6KLp0NyB
         1G3Tqj7LYfJgbm3qPwqf8jVHUQVNu28FZIQ1m9gOGn8/LpoendJ2+UP1fqSFI36Gx0S1
         +5jfR4lz39ZmV4Hyb2f1TWipTbgI2PkqehKLGk8nrzR1fjU4RBfxqWQm+oaDoEPi69xg
         u2l8NkbfyS55vfNB3g7KRUxHfyTkMis44e9uS1RYRd4W4OD/7sDaHOQGd3T7blSZhKzO
         cXPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=94XU/JY5C1Gpm3lWklUPVCcut5lWBtMhDS2MUuU50Os=;
        fh=y1fwdwYJ+ybi/Gz9eikWWAo4cmx9n1IS5+H12IBZSDg=;
        b=kB6UbTAKP2NspwF3vISx99kq6hk44lL4I6rFb0Yz/kSzDvJ4sZT1Ark5aaKjqCaeBA
         oyU85/Yv5TiWISK9YuHVIytV5r924nZXKwjWPFQedzKcfOjBcMnS/XxwosaBQI6cmjtH
         e33gmUfNy02q2qg9GR28eqaEqR48i+4eWG2H9i7H8YSFeXJGdHVjDasreQ2LMjc5WEVl
         bnlqBfPE8eQievUhEFQNQ8IbEw2lNCDoz+/9bD85iu+G4HpD6Vh2xteBUA0FMZEX34fV
         KmHDswt6kJNBZ4htsWXnktlRNVccfvvWelVGyDfCHfn0r773M1Eqg3vFCsfAxVujyMbE
         wJPw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=fi+qwXuf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e3a43181si19447966d6.253.2025.05.09.02.17.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 May 2025 02:17:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=fi+qwXuf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uDJrQ-0006Zn-3h; Fri, 09 May 2025 05:17:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1uDJrO-0006Sj-C8; Fri, 09 May 2025 05:17:38 -0400
Received: from mgamail.intel.com ([198.175.65.14])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1uDJrM-0001uE-6p; Fri, 09 May 2025 05:17:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746782256; x=1778318256;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5mIvtmlMDAOHavZAXRHaTj/kdL7gzjc2wDPxrUkRr+0=;
 b=fi+qwXufOeswkfMx8v+DEd6cXjMXVIX+IkJPvjiN6fEuXKC6VjgGz0I/
 JWpnCAMoJX5ziPGhfi59pKuwngQ2ifOQ/G/3H+bfKVK8yBh35C2m6adTb
 sZnJ+Kye99mtsSiVkJS4oeF2PPGoIrECxTwoXe/EKh2huvrgSV/IE958t
 BYTySDX5S6jCQsx4ZChtfyCpZ85bhP47X+mmPdoShqOKJaonOVTdHuham
 GU91taOIzaFqfhDuCdV/IIFYRC2uCf+BthySaybdlqj8ZCIIvvPFj6d88
 JtgO8wmqu888r8/xfxCAvFKxK8lxhxt/6PlhcudtdYUEh+zsJZ4w23Sq/ g==;
X-CSE-ConnectionGUID: 9W17QH/NTb6apgPfFlMUXg==
X-CSE-MsgGUID: 4jklvZ56St+zmw3uHUgJkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="52410792"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="52410792"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 02:17:31 -0700
X-CSE-ConnectionGUID: xkxzZMCtSeagvkGP+nrt9g==
X-CSE-MsgGUID: kLRaW1O5TW+pOnGVjsMXEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="137562238"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.39])
 by fmviesa009.fm.intel.com with ESMTP; 09 May 2025 02:17:25 -0700
Date: Fri, 9 May 2025 17:38:26 +0800
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
 Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v4 21/27] hw/audio/pcspk: Remove PCSpkState::migrate field
Message-ID: <aB3NEtdeP7mysAgJ@intel.com>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-22-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250508133550.81391-22-philmd@linaro.org>
Received-SPF: pass client-ip=198.175.65.14; envelope-from=zhao1.liu@intel.com;
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
X-TUID: XkIR+85Nj8e6

On Thu, May 08, 2025 at 03:35:44PM +0200, Philippe Mathieu-Daudé wrote:
> Date: Thu,  8 May 2025 15:35:44 +0200
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH v4 21/27] hw/audio/pcspk: Remove PCSpkState::migrate field
> X-Mailer: git-send-email 2.47.1
> 
> The PCSpkState::migrate boolean was only set in the
> pc_compat_2_7[] array, via the 'migrate=off' property.
> We removed all machines using that array, lets remove
> that property, simplifying vmstate_spk[].
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/audio/pcspk.c | 10 ----------
>  1 file changed, 10 deletions(-)

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>

