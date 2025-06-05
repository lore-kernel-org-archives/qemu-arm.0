Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp80100njc;
        Thu, 5 Jun 2025 01:08:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX6zKbPSf7yMNceS3O9RURXBSQ0InkIXQnDQXQz7ZTIXfjEyn3Rvo9bQ9NliS58FCPB2ISYUB1sLzT9RQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHG/HU1Mik/X8CVwivY8ATCwDTjGutsVTY51hC/fQuC9a01hPZQCNp6Hr6x6MFHzoyqqPJL
X-Received: by 2002:ad4:4eae:0:b0:6fa:c81a:620c with SMTP id 6a1803df08f44-6faf6fd5a81mr85044656d6.9.1749110934689;
        Thu, 05 Jun 2025 01:08:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749110934; cv=none;
        d=google.com; s=arc-20240605;
        b=Oj+6H1YUzI9mvtmWuVNjZTAHQ94R1xLnXHGOQWJZjWaBPn8TJvIGY8zk6ZKtVGsvy2
         TiyIQl81ow22oYCmr68Ejv8lvsZ3g9q/ECebZOsTvBc21jM37i2mivNlSU4Ptq8nXlJ7
         yxdMueKw+09b5FK431x5HWiUm0CjR1V1UJx4IQk0wvk0Ip0v/g/I3bCYb9HHv3iCTXY0
         rzsPzMFfmwcPhJQZrg4MS6o6mlnpBVmg5BCkc9eDxAJ//VgfhftpSdRYa9A5a84JxNBT
         FA++qTiQM7dceQ5HQ8QF0g66OW3g8ZRodMomxkhAGl9XdZ4xDV3CGYdB+OS/I1M8dnty
         iNJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=kjGnQL8zqkCwp95IIE1rpcTP7/oVgc/V7oIyJZ5yC70=;
        fh=gQMqy/FcPgSOZmc5x7cIp5JX66uYCqJ8rNRxizObvcQ=;
        b=aJne7sUxz8bUhNYolOxY59N5fLyoQ5v3aJpSONhtrHVQctxwovNNP4XA7PDhD9Pddf
         XDwohNqinNpybnJEJxPzVBkRBwDPmp1viw+ss6CsPFs6UiCxJszoKwcp6GUpDABySaKW
         vimZG0ITc4RwKD8VS0JNnHp/zxCU80eQrqfMKFgLdnWFKGjkN5Dxdui8L1zQvV1BSKF1
         2dhlGD5jF2jGldrtSjarkyhk3OC3eoLx+8gFgI63+3o4oJv7lRrXCvLnAAKE3GhIQ4FZ
         4Mfa0lhY28kB0FMgkGtcUCZ7RnJ93LVzAEh9R2RlGp22gzipzdqxR8mWAfEdyv3KHWop
         n1Cg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=mRMzkOLS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d09ec3df49si1602936485a.263.2025.06.05.01.08.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jun 2025 01:08:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=mRMzkOLS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uN5eA-0002XE-8T; Thu, 05 Jun 2025 04:08:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1uN5e8-0002Wh-Bo; Thu, 05 Jun 2025 04:08:20 -0400
Received: from mgamail.intel.com ([198.175.65.16])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1uN5e6-0006zi-4J; Thu, 05 Jun 2025 04:08:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749110898; x=1780646898;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/H6fOiGes8RNvPIoYQeQ+oamLmBDlB+hwhF0MUKvjX4=;
 b=mRMzkOLSoyDrfp0iLjxwUYHRYV9V6H04vyeT6nGsVxjdD+ZZFTlYz7+S
 crv+rVwK/z9QU+RoO8Z1d7TBpuUTsF1SDqBtyU0r9wsv0wUxy66AL77d6
 4x1U9CFf8reI+M8LdMyhTgcJbZ7naacRp0k5L088seg8U7o7QL+WjqtBH
 bzNvhvDeXSiMqPd5c6b7OoQE0atzxyqonWGECCPpty8Yr5zARqTNltAaD
 oOEOYzXaRVgm2OAp/CbdlaYDoacTq/r0J8OH/5vd/jx0PGVfxWKPImpAF
 4MSszbyvIREVra7D3uZXOJLArXmnvr3oxHArL8gFtTKUJXNXSNNA+4KQX w==;
X-CSE-ConnectionGUID: cUllEyr2Qy2019+vmMnXVg==
X-CSE-MsgGUID: rYI+/iyETfqqAwc7lvUgEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51285653"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="51285653"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 01:08:15 -0700
X-CSE-ConnectionGUID: QfbEB4KgQgO/ZyscvWGifA==
X-CSE-MsgGUID: /LIkIDbzRGONqBX++A+BlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="145940217"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.39])
 by fmviesa010.fm.intel.com with ESMTP; 05 Jun 2025 01:08:09 -0700
Date: Thu, 5 Jun 2025 16:29:22 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Alireza Sanaee <alireza.sanaee@huawei.com>
Cc: mst@redhat.com, anisinha@redhat.com, armbru@redhat.com,
 berrange@redhat.com, dapeng1.mi@linux.intel.com,
 eric.auger@redhat.com, farman@linux.ibm.com,
 gustavo.romero@linaro.org, imammedo@redhat.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 linuxarm@huawei.com, mtosatti@redhat.com, peter.maydell@linaro.org,
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 richard.henderson@linaro.org, shameerali.kolothum.thodi@huawei.com,
 shannon.zhaosl@gmail.com, yangyicong@hisilicon.com, maobibo@loongson.cn
Subject: Re: [PATCH v12 3/6] bios-tables-test: prepare to change ARM ACPI
 virt PPTT
Message-ID: <aEFVYrrRXPQQJI3x@intel.com>
References: <20250604133439.1592-1-alireza.sanaee@huawei.com>
 <20250604133439.1592-4-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604133439.1592-4-alireza.sanaee@huawei.com>
Received-SPF: pass client-ip=198.175.65.16; envelope-from=zhao1.liu@intel.com;
 helo=mgamail.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.128,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: e5Fksp3KbCop

On Wed, Jun 04, 2025 at 02:34:36PM +0100, Alireza Sanaee wrote:
> Date: Wed, 4 Jun 2025 14:34:36 +0100
> From: Alireza Sanaee <alireza.sanaee@huawei.com>
> Subject: [PATCH v12 3/6] bios-tables-test: prepare to change ARM ACPI virt
>  PPTT
> X-Mailer: git-send-email 2.34.1
> 
> Prepare to update `build_pptt` function to add cache description
> functionalities, thus add binaries in this patch.
> 
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>

