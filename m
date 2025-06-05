Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp252126njc;
        Thu, 5 Jun 2025 06:37:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWqG/XWZrIZDFVKOa2XJIOye9LVFu3TU9ekoIXwLviaLucgRWL5hdBvLxnLHGZOpfHE6PbtbjgcNMhu2w==@linaro.org
X-Google-Smtp-Source: AGHT+IEd0hQxZyBb92yID7+GFhhJKr6hQ+wrpXbC4eaNgImClXqvtykerkbidWp9X6NofoRZSKsd
X-Received: by 2002:a05:6102:3c8d:b0:4df:9281:5ec3 with SMTP id ada2fe7eead31-4e758a89dacmr3300507137.2.1749130663184;
        Thu, 05 Jun 2025 06:37:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749130663; cv=none;
        d=google.com; s=arc-20240605;
        b=LyZE3v19hw9uIEg/ANU9pFYWERVPA8hIXVkMnn5ZQ/FiDg6cLcFa4QRt9x4yzvtghk
         3r8QYcP2y/tLwdgUIewHNtcL3wiCu5n6ufy5BzIqKZxJoFk/0W3fkD1minBReA9Ft+7l
         u1Qf+cyK5xU/q6Ocp9JCpnJh5b2zzRgbMa8hAcDIm3iUlrVITPBivLPdAEJ8fHcX8ESq
         TcweEmZG51EfzHv4OYO0PDpLjaCRWeZ4KG70momZ/HM/kBalC/Mw/vzFttFu/WkeVyzs
         uJMjVqTeGJEjLXIuCS/bPYn0E45tokcv15EvrV1NJehtGuTzFm2wRqMgA2sls8hrR+Q5
         nwAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=YkMbG8F1ZWWN514492tm5oBcoT/sUjyEvGkVKmynX+Y=;
        fh=gQMqy/FcPgSOZmc5x7cIp5JX66uYCqJ8rNRxizObvcQ=;
        b=NeAFL2VUk8HGAgACkpG+TCKIfMFfswCLAt5aJwbQCFFaRITOLMw1o/S06Jyn0iNma8
         RBwFmlewxp+EyTZNv2/1GQcTsmtWSAMLWr8AiukQ2xsRQfPt8gwTBBQ8xBTDkosWijeV
         3yCsjyM61ZQ9hxnP8VLlh+HGfLXmZQPBgveP034bn/jhqUvHG4IYomPV34F9PsBZKtMS
         WcGQOj0LNbfUJ4H8DYSvCkQFCcltsr9j/7C9o2YzG51SgvEk/O1xYTP8BtAFVbhbZ1nx
         5ZmvFQsI0UvVBXaqFRjkT/YUf76f9J9mF2x3BkJ0tzkBkFpFZKTVmnb/ySGNob/Ivz/P
         Nm2g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=kobbXKGe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4e64ea2d06csi5231153137.426.2025.06.05.06.37.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jun 2025 06:37:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=kobbXKGe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uNAmV-0001vC-QX; Thu, 05 Jun 2025 09:37:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1uNAmT-0001u6-AM; Thu, 05 Jun 2025 09:37:17 -0400
Received: from mgamail.intel.com ([198.175.65.17])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1uNAmK-0008Ok-An; Thu, 05 Jun 2025 09:37:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749130629; x=1780666629;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=c3AYYTE4jXbTTJMfKgbjtc+QoEFK3LuNYXA8vE/YJ4s=;
 b=kobbXKGecmhETP/ZDe3aWLVghSINdhOIdW3ylng21+74fHu1QpuKg7Uq
 mpbwSZT3cnxvQCe6magBHKg6ZrzpY6aTMYWD5dt9o4m1cKS62io5WA1rs
 Z6fmjUjFL8xADnmr9smQ/Xge5uzzgJ9EQWkmG/LcvP8oYpLucrSO5QQco
 MnnYydwA7ZOiNl5WBfU61G8c8DwrQ8FKz8MoURlcMp2/lZN1yiUcSq6Gz
 Bi6qH5ZAgheoy37TCyyblo9CGCvMYox1HLKmz2TvrcoLLErbs9XVouty8
 Mk/89UPCl31zfoiFQfzl/+SEN+b1MzfIQJcGs8uMWT7mLDV13KpGw9XFZ Q==;
X-CSE-ConnectionGUID: XLoJ0V9QTKK/jIz69iUhlg==
X-CSE-MsgGUID: rY+HR2PzSuqF16eDH5aykQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51246687"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="51246687"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 06:37:05 -0700
X-CSE-ConnectionGUID: 37ZMDUOzR9icCqmlqBuOcg==
X-CSE-MsgGUID: b3v16a65TDSjX9lNECuymQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="182716923"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.39])
 by orviesa001.jf.intel.com with ESMTP; 05 Jun 2025 06:36:59 -0700
Date: Thu, 5 Jun 2025 21:58:13 +0800
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
Subject: Re: [PATCH v12 2/6] arm/virt.c: add cache hierarchy to device tree
Message-ID: <aEGidafjNMYHAgiO@intel.com>
References: <20250604133439.1592-1-alireza.sanaee@huawei.com>
 <20250604133439.1592-3-alireza.sanaee@huawei.com>
 <aEFnFI+wglkmLD5G@intel.com>
 <20250605104048.00000f00.alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605104048.00000f00.alireza.sanaee@huawei.com>
Received-SPF: pass client-ip=198.175.65.17; envelope-from=zhao1.liu@intel.com;
 helo=mgamail.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.132,
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
X-TUID: stuawBblUyyl

> Hi Zhao,
> 
> Thanks for the feedback, I was actually unsure about the structure, and
> was looking to get some feedback here, to see where to put what! I
> will go over the suggestions, and take note. In the meantime, let's see
> if we can get some more review here.

Sure! BTW, it's better to spilt the general code change (not ARM-specific
codes) into a separate patch. Anyway, it's up to you.

Regards,
Zhao

