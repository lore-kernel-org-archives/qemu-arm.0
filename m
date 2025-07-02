Received: by 2002:a05:622a:6187:b0:4a7:49b6:ba6e with SMTP id hh7csp3525209qtb;
        Tue, 1 Jul 2025 22:49:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXLVe0PX9EDKCaRsUN7mEtlBPXxmbxRKbhuQ+HCLx3PzEVVIvVoo1bd4LTjNGI+BxBzbfTBKKYnhdExAg==@linaro.org
X-Google-Smtp-Source: AGHT+IENCh2MmTiprpIiXgeSphz1x17f9PTpDCC9gE1tqgd6EiVa4ArUDJ1mg4xPeL5JFSdwu5jD
X-Received: by 2002:a05:620a:8083:b0:7d3:9288:5c1a with SMTP id af79cd13be357-7d5c47a33b0mr219479485a.46.1751435347290;
        Tue, 01 Jul 2025 22:49:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751435347; cv=none;
        d=google.com; s=arc-20240605;
        b=cUlC9+bWgPU0glKKtvsYe/mKpS3uTTBp/dydOgFsKq8beTA0NnSQ1i3ZAaLvrMmalM
         iRqsJ4Nrz6NSW2CuJe8jEf24Gi3CxKUMslWMYTBmYa9L+QyUIja3FD+f6ymfQOnoBPPf
         fxgWp3T6Aj+aWJ04yUcrvNX2tWOAvr61+yvjWy3LZ0FBkx97eNJebUB3gQs+H2J95jbT
         +uNnPVI2CVoXLKLxjOPIQ80o+NiOa0CMJg+EIRzW/T8fTsc3Bh0V9ffh9PgbT81ZGERl
         bCAlcfoXA0YfSQcCDlBlDDEAUZjP+jde1VVWnBD2M10Hk4rVyVz8j0JqfCxOR5/72CfT
         j/1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=AKOQOAoWQdH1TS/BLCXdMaAetKgHj/MPhclHIDqyeWk=;
        fh=KHFeMVjF5Z+hrkZD99uPDr3e+PT2tVevUYMAdBOdvwo=;
        b=cytChmikUca7DLG9z+km212FB29ZdgMJmaNHkZasUHbQyFElRCUULbIFCFmuSGjhT/
         iP+g+zdnms8TQ40zcbz0m/aiQLUAqwL/tzQ+SI87AutdLa/ff3/7myUuOQwcdY8RvDqF
         FeAYUuaRGGVEOctM0dUTK+2IIkMvui/5Yg5TVjG3t5YR7mW04XVNXRZ7p2ga7evHzG7B
         dO7vNm0SIYN+h/+rGkQBVzZC4+WE/UEi3EqPZymhssslF4IYd2FiYFNMQsmoN9y42sKR
         YJ8p/+FnxfVZFU7OuuJgSZV56n5gL+rJcuJIGitHP2hYPR4168+DngGSj79a3866WRjR
         ocRg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=HVdzG3nC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc1e6097si125065841cf.222.2025.07.01.22.49.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Jul 2025 22:49:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=HVdzG3nC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uWqKa-00061r-PU; Wed, 02 Jul 2025 01:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1uWqKZ-000611-5e; Wed, 02 Jul 2025 01:48:27 -0400
Received: from mgamail.intel.com ([198.175.65.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1uWqKX-0001cG-Io; Wed, 02 Jul 2025 01:48:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751435306; x=1782971306;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AKOQOAoWQdH1TS/BLCXdMaAetKgHj/MPhclHIDqyeWk=;
 b=HVdzG3nC2LT1IgEUFsEvPeigeQ49thJf47eXzrkaYMWSDP7O/lFxd3VU
 fnoCp96YZ6nUdi0C9bpKw/al0qn1zSuuv/m9Qf+NEOrGmsu/rf8whpi5Y
 og+JhySaXGSMdLwHDhSZlGQHnN/gbYZIfhIOTF39aqT/1H+5jtew9SmDK
 KPRELvYIKVi0oixDf35h5oi+FVVh2hj4KLSy5kpa9zSx+ajEo0gFeLnWb
 OvKu3xCfu7tsaKeKRWwYaf4ee5BJKSRxEm/CrwIk8dfPtXZ2BOf4atLln
 WOfhJWylc9ZGB9MHHzUw+/ufWOEqIBcbY/7qHLLQCzDtqeJ8vLjz+of69 Q==;
X-CSE-ConnectionGUID: xUFawBYTQF6s0JpdAA0RWA==
X-CSE-MsgGUID: rECHi1iUSXSzd30cKg4oUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53582627"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="53582627"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 22:48:20 -0700
X-CSE-ConnectionGUID: TjtHiyY2RjabOyLquemIDA==
X-CSE-MsgGUID: hp5PjctrTbubZdNMhvrkOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="158353692"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.39])
 by orviesa003.jf.intel.com with ESMTP; 01 Jul 2025 22:48:16 -0700
Date: Wed, 2 Jul 2025 14:09:40 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Shaoqin Huang <shahuang@redhat.com>
Cc: Eric Auger <eauger@redhat.com>, qemu-arm@nongnu.org,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v6 2/2] hw/i386: Add the ramfb romfile compatibility
Message-ID: <aGTNJAfn8bAnxQzU@intel.com>
References: <20250701030549.2153331-1-shahuang@redhat.com>
 <20250701030549.2153331-3-shahuang@redhat.com>
 <9bbaa0bb-cf32-48f2-aff6-6484285496f0@redhat.com>
 <6347e3a2-23f5-43a3-8b74-503148f3bacf@redhat.com>
 <e7f5a70d-a052-4d37-9cec-5c9595559de7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7f5a70d-a052-4d37-9cec-5c9595559de7@redhat.com>
Received-SPF: pass client-ip=198.175.65.21; envelope-from=zhao1.liu@intel.com;
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
X-TUID: FcMxIzC5+Gkk

> One more question, now the qemu doesn't have the hw_compat_10_1, should I
> first add another patch to add it just like the commit:
> 0a7c438a42 hw: add compat machines for 10.0

Hi Shaoqin, I think you can add compat option in hw_compat_10_0. Then
the compat property will be applied for v10.0 and before. And you can
find v10.1 won't be affected by compat option you set.

You can test this with "-machine pc-q35-10.0" or older, with "-machine pc-q35"
or "-machine pc-q35-10.1".

> I think it should have the hw_compat_10_1 first, then I can add the property
> into it.

This hw_compat_10_1 will be added when v10.1 is realeased.

Thanks,
Zhao

