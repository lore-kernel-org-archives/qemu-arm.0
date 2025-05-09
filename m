Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp900036njb;
        Thu, 8 May 2025 23:33:31 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWh1Mf1T7OnmFQleLyUImWz+d0F6H0KeDCjHvhfn/gA+E7Xbu9+WRWeUxNRAUwkPya6wd8l3yZQnYn4EA==@linaro.org
X-Google-Smtp-Source: AGHT+IGSKeblybzS+Jalhp+wb+MKJbN8itQcmU5ZZF4Xi45n1V8OB4LqQr9NzwtzN2+WzOTteqmJ
X-Received: by 2002:a17:902:dacd:b0:22c:35c5:e30e with SMTP id d9443c01a7336-22fc8b519c5mr26551735ad.13.1746772411366;
        Thu, 08 May 2025 23:33:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1746772411; cv=pass;
        d=google.com; s=arc-20240605;
        b=SIbkQFgTZ3pOndNGF5Qjf0hoiBsVLAlsUaedyaQaHeJHPgs5+hS3JQ4MS8Wrg7pfwJ
         BJU2tDiT6rqjgWvIfK4DkXr3olNOhpdSYo91qmoFvFKLPW+ihdfQkvayePn0Ed0EdGyR
         t8bSVb8Yg5iHMyMyJbis2HJMqiKIg1vheAdHq+HqlvnGv6jWxeeuNM4Jn38kxpdOyYjt
         NEhRN5x8X362F1elGpifVTx0+Bz2Nc8F+AmlfXd61b+BF+lVCv4ul6H/yKWgxjf8h6qv
         0bj/V6iKQioTfsZHZNexUIqFqD3SUETPtC4BnUZMyGdRagpo1cJXLMibEh8ny0ue0YXo
         quMQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=ADpTXBh5qdizZD3hnd6ZvXxsc1w2NGqQTHQ39Rjq2RQ=;
        fh=y1fwdwYJ+ybi/Gz9eikWWAo4cmx9n1IS5+H12IBZSDg=;
        b=ULKm4awLsz4HgW4pJEl+aZZXZpgciq85R4nCQTsUoK3QUVEFJ0laqO4XTz2PVcIKkK
         Wef7c0tagH0zcw89Azo0laqKkSDxpzGsMNDL67gvAz+ya77PBbuyehFGzYwQEmU73YP2
         g6JCFeWmClQwAF5C8UIsdCXL7fZb2TC7j0lp086SG28k2OwjiouHYCZRGZNlJo1HOdBC
         bk79W9E0JivHrnDKWHNIJ5LHTbGJzGZac2KpW/L22V0o30TSjX8LdTpBwYmwANNJLFi4
         UPPXr4uY/mBdGOs0V5qbcKSrXSLkLHc+R2KJCTKNrcUt5Gnjd58qbj1ijgGQl0e4SQDJ
         huaA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=WqoFXCSq;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-46017-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-46017-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <kvm+bounces-46017-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id d9443c01a7336-22fc6ef8b3fsi18185235ad.260.2025.05.08.23.33.31
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 23:33:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-46017-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=WqoFXCSq;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-46017-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-46017-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E71069E1293
	for <alex.bennee@linaro.org>; Fri,  9 May 2025 06:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E02F267B9D;
	Fri,  9 May 2025 06:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WqoFXCSq"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22062746C
	for <kvm@vger.kernel.org>; Fri,  9 May 2025 06:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746772407; cv=none; b=HWflE/aHxkWm/W+/l6hju8pt6m344vqy3frIvsmoNW3I15BKyGJNccmb/D0GdWEWQVaSAHQ9aIdeIqZlPNC/DPt852WpxGS5+oGMTbLFuNL0ecauIaehPQN0WC5dWDBM7Uro9UIFduQ6rJhBHmTKU9PFflzlFTwq+v28mlmuJfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746772407; c=relaxed/simple;
	bh=R1gcVSIvQr5sUp5zACYDQsq4f07xBU94VZrqHLDhwtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EfzN3T62CvZx2FNbERq8qYsX8hZHlJa5Nb5XPMMtK8fMZ/bAhw77nQ239tqHK2ETqAENKREbrHYuGh7aIEFnwOBTIY6G6P/0JYZhe4lHp3bB3Mgb+EDibsYT37ULcSUlvgr5XYpQ/LwMqQg7dyRWlueyMUOuXWL9eFeOloNWnAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WqoFXCSq; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746772406; x=1778308406;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=R1gcVSIvQr5sUp5zACYDQsq4f07xBU94VZrqHLDhwtk=;
  b=WqoFXCSqvsEtiLw+QCaM0n0AZjJiyYiK5uIHiUPclQT8ZqLTg1ZFUjDl
   1xu1gFKrHMICfMR7eOA5eKskcaPeit/SEjeLUzQfiTjlaUgikpKK9KxDT
   43ZcQd7HFGou4YvBix7MyrC7fjbEiv3gYm1mAcMrTifN4XpD/a8icWrt5
   P6fkdZCPAmmPnnafkTU+4lxJsY3S7mTpvSU3G9zmhLYSrb1kwmCq1H9WH
   U71nBjorWtVv3MQsyrRh9re46J4EGCB/WhNSx8oZiEzK7lbgV7No4zSRz
   3IMEstt1x7peSX/JuUvoJf3DDd98wjVoI32nYQHMkv5QnXGM8nDq7GfCC
   w==;
X-CSE-ConnectionGUID: GLatVTgQTfqylTXgdLlh6Q==
X-CSE-MsgGUID: qlcylW9cTmSoNkvdQxV5Xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48742661"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="48742661"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 23:33:25 -0700
X-CSE-ConnectionGUID: Dbe343hJTt+bNJaSA/Cydg==
X-CSE-MsgGUID: Vn+ww6s4Qp6STvW5gChxyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="141480667"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.39])
  by orviesa004.jf.intel.com with ESMTP; 08 May 2025 23:33:18 -0700
Date: Fri, 9 May 2025 14:54:19 +0800
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
	Palmer Dabbelt <palmer@dabbelt.com>,
	Ani Sinha <anisinha@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	=?iso-8859-1?Q?Cl=E9ment?= Mathieu--Drif <clement.mathieu--drif@eviden.com>,
	qemu-arm@nongnu.org,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.caveayland@nutanix.com>,
	Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v4 11/27] hw/i386/pc: Remove pc_compat_2_6[] array
Message-ID: <aB2mmzX0xn8y7T+S@intel.com>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-12-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250508133550.81391-12-philmd@linaro.org>
X-TUID: SiPghYVUieeB

On Thu, May 08, 2025 at 03:35:34PM +0200, Philippe Mathieu-Daudé wrote:
> Date: Thu,  8 May 2025 15:35:34 +0200
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH v4 11/27] hw/i386/pc: Remove pc_compat_2_6[] array
> X-Mailer: git-send-email 2.47.1
> 
> The pc_compat_2_6[] array was only used by the pc-q35-2.6
> and pc-i440fx-2.6 machines, which got removed. Remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>  include/hw/i386/pc.h | 3 ---
>  hw/i386/pc.c         | 8 --------
>  2 files changed, 11 deletions(-)

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>

