Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp2045757njc;
        Mon, 14 Apr 2025 07:36:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXx3T8wMPTPo6QKY6mkhiO7oy7+xaHspy5MsPiWUindt6mSTCJibQ9pmb/XFbhOHH8flV7Zjk3VXt4jMg==@linaro.org
X-Google-Smtp-Source: AGHT+IF+/uWToJWWii4JPqVrGill8HZKZQY/E+I5ymH2gGFKqh3lsyzMt9epk7x4KscoZicSPtzC
X-Received: by 2002:a05:690c:6310:b0:6fe:b109:6965 with SMTP id 00721157ae682-70559a8f30dmr217250917b3.35.1744641396537;
        Mon, 14 Apr 2025 07:36:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744641396; cv=none;
        d=google.com; s=arc-20240605;
        b=IlnWhSiyZ7Qf5IwZJZqr8kLbYilD9u75AKQPTvgl+vi/yhX91YCYH1LKM5e7mWhWYp
         Xwuy6LXQ9H3AtoUSi1nD0OnZ2UqAninpP4/6H8EFXx95Vp5LrsLjxD7NZec01kFT10Ep
         cgoOkXgtLPgQxE1PnGlPuLvunU745MA/mutVKJeiLy9nC1O2DMn7MqpgosccvtonAWA4
         nQu2Y6/dt65IsUlBKFG5z+nTpk3dncxNXCk+mxdka1g6Rg5naAUMGtKAFIK4AzjmzmBe
         FUPFGbsD/pBrOp3iFavh4VOPVibKKXPMSW1fi3LBK3/tzNgYDdg0UUGyQMf0C2QiMnII
         gnfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=zg08fNjXVoMwYvnQ0vztfOdghIRZTyLdRdQUa/JMJCQ=;
        fh=MJFnI4LUV7qqum6zv07U/iIiWue0PH3DIM0Fjdz7bh0=;
        b=X8rnAo/lxcVDdGLau8+fq9m3K018VNEedM1OVokQGDNkp/L9pGXsPV81ok+RgZbcQx
         eMOYV4EhkKCuZ84iaME+NFesG6uP6MORViubtTzQQKGrYADuo27i+Bbv9FD202M2n4K3
         Raht5pooTBMmTIxLvrMJWPyNV2sQmbsm7XCVo66I0r8CLW773kPi8xL7/5d3u1iGzXxd
         xLkxEc37FHhw+VHhHvgN+ONJWVXx+lq+3m/gfO3VrwYAYwFZfWArKNjC24hOeh4WcLXC
         yQnXZJTVSaFvZNPt28Idigq+Z0pCCzsydxjA3sFppxwjIhoVCJJWLTPvaIZ9i4XOkPHf
         N62g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=IaUV5xmh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4c9c98c621bsi4145952137.445.2025.04.14.07.36.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Apr 2025 07:36:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=IaUV5xmh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u4KvD-0001vt-9f; Mon, 14 Apr 2025 10:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1u4Kv7-0001uy-JU; Mon, 14 Apr 2025 10:36:22 -0400
Received: from mgamail.intel.com ([192.198.163.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1u4Kv5-0007aL-Op; Mon, 14 Apr 2025 10:36:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744641379; x=1776177379;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qDMlE6ICB9WiXBHTdSBJAYrKPXH3JP5YOQcLaibjGf4=;
 b=IaUV5xmhCkIdug6e4vcPl3NmCR0KHvebBEtrFkgBm9c3eVPqlsg6eBPO
 OHoFosAD02fX7uYGNBlTVeXQRlf5zHWARbokiPmTy0UtFpUb5BJVLO84t
 SxAxULcJpw86rM4pe633S0qLSh7gLkiudDgnubGidS//mcv/DWJRyiwpz
 u/p6NJrQqL4VIIIktz6UJ/6fS+2pTaTTfzA6EXAMpwOiMyscKkEFamu6I
 1gVBdDcw8G7RbkCdMSfz/qAKRc+8G6aTSEdQdGRuhtKkH5iyz8TcT5OV2
 DosZ9YNCj8CIaTWovYNBRoF8Kfy6Hi21Ve9DCZq6S/OE9A9U7w4UmmJa0 g==;
X-CSE-ConnectionGUID: TLxMZcGwSymeoaELW71n5g==
X-CSE-MsgGUID: kHyXmcx4S+KXJWaAEWk2vA==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="56773475"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="56773475"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 07:35:57 -0700
X-CSE-ConnectionGUID: aqMngmM9TdG5GUrhCUmzFQ==
X-CSE-MsgGUID: u6iAdRo2T7Kc/2LXWnMfYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="153023844"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.39])
 by fmviesa002.fm.intel.com with ESMTP; 14 Apr 2025 07:35:53 -0700
Date: Mon, 14 Apr 2025 22:56:44 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
Subject: Re: [PATCH] hw: add compat machines for 10.1
Message-ID: <Z/0iLGx66AD6UIK/@intel.com>
References: <20250414094543.221241-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414094543.221241-1-cohuck@redhat.com>
Received-SPF: pass client-ip=192.198.163.11; envelope-from=zhao1.liu@intel.com;
 helo=mgamail.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: nvELruBdfZh5

On Mon, Apr 14, 2025 at 11:45:43AM +0200, Cornelia Huck wrote:
> Date: Mon, 14 Apr 2025 11:45:43 +0200
> From: Cornelia Huck <cohuck@redhat.com>
> Subject: [PATCH] hw: add compat machines for 10.1
> 
> Add 10.1 machine types for arm/i440fx/m68k/q35/s390x/spapr.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  hw/arm/virt.c              |  9 ++++++++-
>  hw/core/machine.c          |  3 +++
>  hw/i386/pc.c               |  3 +++
>  hw/i386/pc_piix.c          | 13 +++++++++++--
>  hw/i386/pc_q35.c           | 13 +++++++++++--
>  hw/m68k/virt.c             |  9 ++++++++-
>  hw/ppc/spapr.c             | 15 +++++++++++++--
>  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>  include/hw/boards.h        |  3 +++
>  include/hw/i386/pc.h       |  3 +++
>  10 files changed, 76 insertions(+), 9 deletions(-)

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>

