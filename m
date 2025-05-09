Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp966816njb;
        Fri, 9 May 2025 02:22:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUP2I8SsXHDkEBOAmabX9zwH12NvHT9E7Oaq9xfWrr428tHt64JLORhawk0gOz+HkSJ0JkLyIPp5S2Hrw==@linaro.org
X-Google-Smtp-Source: AGHT+IGTpAH4bL4PtYxkUhh8KhJMJOIRF7DW0quiZpOX6cLbQ2yc0wPjHiFCjzaBQYROlBb8hmJD
X-Received: by 2002:a05:620a:2585:b0:7c5:5f58:9158 with SMTP id af79cd13be357-7cd010d5178mr354768185a.9.1746782573433;
        Fri, 09 May 2025 02:22:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746782573; cv=none;
        d=google.com; s=arc-20240605;
        b=BzKPkR+IV9NDCgxUk529w+s0amEuDnlfHnDnHHW+XukHhvMk1K7lAs8+lW5a5LAifs
         zh6tyk0Tt3EBjpRulzf7IbicG3j6w9MsoY8Hh5UtB5SfbPgaE+fCkAHBXA/XnHKlgDeK
         et9IJFSK6nlh7wg2xXCt/vN3XadLuLQC2pjE9r2Vfo0q/DaYa7J/yzL+8wFCOpikZpep
         noISMZ+iF2C4uW+RtGgcP4ALwGlnm4od/P2lfzUB8iZxUCGNlDaaUs8pbkXFGcBY6unj
         b5tLOMZSQn6Tlf+s4HItXc2Wz96S1vEs+OrFakzBwgx8gnjBqoPLuoaQMdVcTzOfQ0MC
         KsGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=+HwsHo6EKchfO87lKOx1JljtGFy76PUzeSO+2uqxiew=;
        fh=XwZ+SlKA2ObuTzjRd0BDrVQXnQFFQXDytsanjW2699w=;
        b=JYe20SqBthrBNrMlJIDCD6t75Tt8S2XPQ1zmyWs29dbPN7JLMB33NU5h+bmrtTseVr
         Dy9YCL0tDpW+2PoABXZugrcKFGqXt/H1ihmHrQQL5Rie440ykWTdM8Tz3sJT6Ufmq4SH
         H6dFkaK2RhwMtelybNdhx61CHEK6Wr12RWRv3D3SPBm4DuQE/XwwAmK8rHIkz5PDmsNB
         NNw3s9lcq/oVFbBzIBACH7b9RVrhSnUTc+/dkefTxbwTQ/Yovlq9S0c8LFDXIMI6VJuY
         /2uEfB9Yn9Jvy2A0SYKHFNdgXtQ6lNwr+/ZOUuXnZAz4BPI6kNTUFwfEjUT3P/NbImVK
         XOrg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="Te3u//fQ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00f524bcsi178052785a.24.2025.05.09.02.22.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 May 2025 02:22:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="Te3u//fQ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uDJwK-0002a5-9P; Fri, 09 May 2025 05:22:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1uDJwA-0002ZI-KR; Fri, 09 May 2025 05:22:36 -0400
Received: from mgamail.intel.com ([198.175.65.14])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1uDJw6-0002hC-KX; Fri, 09 May 2025 05:22:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746782550; x=1778318550;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=pK0MRCpboYH5wkNukEQTQmvUhKc3QXbmX6Rg6q2PgnY=;
 b=Te3u//fQrKspDELOu9Mnd7cQd4XYWdGlhDuGpF91RjWB3BcL/nfRwjXo
 ybTi+J3vV0bEZSkR9GdA5sWHU1SRF0HJ7uZ4esBhTnPROICtpVxvHcGIi
 PaNiygTBfTd9s9eaC6z/ihYmVUBt1uI5GXScA1He6Yt+YMyvSGE7lVt3w
 GmJOTmYWApLNfBj/cyUuLEG3hdjopNrLAcGFeoggSFImdS49L2nUO3GHF
 BPTmYa0kj3HZ4/L4A9H8Og2o1T/aZy4fZpC9XgN2fbgqxmPNulMaO9U+1
 u/Ze3LOlw3Q+zfKbBPC3OdNYhKuDihbgNMxmENmx63FHX08UbNJ7dHAxb A==;
X-CSE-ConnectionGUID: NaE0fGcGTamI2vekix/x+w==
X-CSE-MsgGUID: N61ww4RPRNKeSv18Ag+6Cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="52412013"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="52412013"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 02:22:26 -0700
X-CSE-ConnectionGUID: oujKs89KQHyOonwfNYOIAw==
X-CSE-MsgGUID: S11cSzFJSrWGygNDjVH6hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="137498001"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.39])
 by orviesa008.jf.intel.com with ESMTP; 09 May 2025 02:22:20 -0700
Date: Fri, 9 May 2025 17:43:21 +0800
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
Subject: Re: [PATCH v4 25/27] hw/virtio/virtio-pci: Remove
 VirtIOPCIProxy::ignore_backend_features field
Message-ID: <aB3OOSI/NGUARoMZ@intel.com>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-26-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250508133550.81391-26-philmd@linaro.org>
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
X-TUID: IHVwENn5ClHl

On Thu, May 08, 2025 at 03:35:48PM +0200, Philippe Mathieu-Daudé wrote:
> Date: Thu,  8 May 2025 15:35:48 +0200
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH v4 25/27] hw/virtio/virtio-pci: Remove
>  VirtIOPCIProxy::ignore_backend_features field
> X-Mailer: git-send-email 2.47.1
> 
> The VirtIOPCIProxy::ignore_backend_features boolean was only set
> in the hw_compat_2_7[] array, via the 'x-ignore-backend-features=on'
> property. We removed all machines using that array, lets remove
> that property, simplify by only using the default version.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> ---
>  include/hw/virtio/virtio-pci.h | 1 -
>  hw/virtio/virtio-pci.c         | 5 +----
>  2 files changed, 1 insertion(+), 5 deletions(-)

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>

