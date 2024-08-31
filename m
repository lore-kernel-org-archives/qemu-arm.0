Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp546953njf;
        Sat, 31 Aug 2024 04:10:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWpQrJ7fzptdGuvB0Rafgg8iMXhzN3ICf7suza2kV0P5ElOlJdNsjFvZ3zE9aaXWIvwjuNrzEvZgclYPA==@linaro.org
X-Google-Smtp-Source: AGHT+IGkfMGwCAMBujFsU8nchGNIz6WWSlgrWoffTaXko4fiVy64T7+YoUBbtm9ibBVgKdSZSLTg
X-Received: by 2002:a05:6830:64ca:b0:709:4065:63e6 with SMTP id 46e09a7af769-70f710239aemr2830699a34.12.1725102610856;
        Sat, 31 Aug 2024 04:10:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725102610; cv=none;
        d=google.com; s=arc-20160816;
        b=f9CxXFcB2R/nMShiz1m2Z3HlX160RPoeLnnKtYFqW1v9VZPPu5P754dOBPpBU2/gJO
         PAelk1Fb4RFgedEXGghHS+8bx7RPWLOL5TirVezwj6pMsen67sn6hfjAgkyDg41FAKca
         /ykfaDA0G1c3UpiKcq39jyvD8qO1fmMu+WYntp9YVRXPGT7XbA5piDUKhHjfkfZaXVSN
         UcNNTAQRUeX1b8pJRTmJroXxWbnIfyu9pcTnYvGiwKz2+F1Fxc3RLZi/Mzz8xv/zjXj8
         jXcc4cqZfxb9lwHr5qNxqX5YBdo2Y/2UaktDqQhR77E8KPoL64pyN7GyJ+TLnSBV7eUa
         qzIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=8q3z6crbNt0VdiyYT//2hanRf0Rv76UbYS98oxyLcQ8=;
        fh=AWWwUbesVBHmLBdXYbJqxZ0GMODIhiWdiOij3vnUmeM=;
        b=MzFAAUBiRhdYw036nIHVxLAcEQ0CVteG3s/Xhs021G1+V24+UOpfIike+LfkBL/D1c
         qz7054LG6Bc8jB7BBLNoWSHb13fQ2W/HwUjiaC2Nmh93ZETLPBgyEF/AQArnUMEG8eSw
         H/0iHrjyndpaZeAyGfn9n+xyPxQulbE+IXXD84sHtCl/ikAK2xA1IdQfOzqojJyPLLCv
         kfiuVbt8dL9/RtnSD3LZHh4Lawm3XfSV2pI5OsO0UrqYnyeNaPB0A7y7uQzYU9HkePRS
         5ZAk9L2AJl8iKrdRSoBFfU45YjPYNLvzf5JNvJFIBXDsQq8YyH0Tzo6+I5VHgutpvCtR
         T5yg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="fnYv/l4X";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c35b9fe313si2738196d6.33.2024.08.31.04.10.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 31 Aug 2024 04:10:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="fnYv/l4X";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1skLzU-00086k-KO; Sat, 31 Aug 2024 07:10:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1skLzS-00085q-Fc; Sat, 31 Aug 2024 07:09:58 -0400
Received: from mgamail.intel.com ([192.198.163.17])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1skLzQ-0006ho-M7; Sat, 31 Aug 2024 07:09:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725102597; x=1756638597;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GeFmjRo6ovAqbJc/4sXjpF8sL+OE9yB0GSRNK7fT034=;
 b=fnYv/l4XT6kFFgM+XeCsqCiZ5WLySF3S+e/TCAKEUR2nZOHjEs7cVu4b
 mbOoxGfKxj5M2B951z7UtBCG/YfrFiSxeWfzQt+TXe3khnFcftsUEbs5X
 AgBb/yTNGGnGhdZH1JFnuWaMz5M+skgGCWWVuYRVaf9dUnYGc7TklGG6B
 zT64gw+DoE8YqNYrZ9GgAAs6/mUUB1RtdAfzdy/jwG0ky43CJCd3/Cdgh
 yyElL1rNByXxIfw1yu9Mn+5d1wZEON/S5B5ba2C5boDLstwi4KSRVQ6TU
 YbkZcbYtq1KO43LPJQI3FOEOKimsfOO37E4LXJjcVop63PcRWSh3dkyKK Q==;
X-CSE-ConnectionGUID: ySK9ROQGRf+pZTmyci+9Pw==
X-CSE-MsgGUID: fffcSp++SmymVMWJAfaRTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23624051"
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; d="scan'208";a="23624051"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2024 04:09:54 -0700
X-CSE-ConnectionGUID: GbTpwj/KQdmbDxdAcfokXg==
X-CSE-MsgGUID: AgG4nL6BTOK2AA8QNW9Kow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; d="scan'208";a="64191183"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.36])
 by fmviesa009.fm.intel.com with ESMTP; 31 Aug 2024 04:09:49 -0700
Date: Sat, 31 Aug 2024 19:25:47 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Alireza Sanaee <alireza.sanaee@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, zhenyu.z.wang@intel.com,
 dapeng1.mi@linux.intel.com, yongwei.ma@intel.com, armbru@redhat.com,
 farman@linux.ibm.com, peter.maydell@linaro.org, mst@redhat.com,
 anisinha@redhat.com, shannon.zhaosl@gmail.com, imammedo@redhat.com,
 mtosatti@redhat.com, berrange@redhat.com,
 richard.henderson@linaro.org, linuxarm@huwei.com,
 shameerali.kolothum.thodi@huawei.com, Jonathan.Cameron@huawei.com,
 jiangkunkun@huawei.com, Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [RFC PATCH 0/2] Specifying cache topology on ARM
Message-ID: <ZtL9u9kQcx0GtEKq@intel.com>
References: <20240823125446.721-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823125446.721-1-alireza.sanaee@huawei.com>
Received-SPF: pass client-ip=192.198.163.17; envelope-from=zhao1.liu@intel.com;
 helo=mgamail.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: NHZ3BqeqFs5P

Hi Alireza,

Great to see your Arm side implementation!

On Fri, Aug 23, 2024 at 01:54:44PM +0100, Alireza Sanaee wrote:
> Date: Fri, 23 Aug 2024 13:54:44 +0100
> From: Alireza Sanaee <alireza.sanaee@huawei.com>
> Subject: [RFC PATCH 0/2] Specifying cache topology on ARM
> X-Mailer: git-send-email 2.34.1
> 

[snip]

> 
> The following command will represent the system.
> 
> ./qemu-system-aarch64 \
>  -machine virt,**smp-cache=cache0** \
>  -cpu max \
>  -m 2048 \
>  -smp sockets=2,clusters=1,cores=2,threads=2 \
>  -kernel ./Image.gz \
>  -append "console=ttyAMA0 root=/dev/ram rdinit=/init acpi=force" \
>  -initrd rootfs.cpio.gz \
>  -bios ./edk2-aarch64-code.fd \
>  **-object '{"qom-type":"smp-cache","id":"cache0","caches":[{"name":"l1d","topo":"core"},{"name":"l1i","topo":"core"},{"name":"l2","topo":"cluster"},{"name":"l3","topo":"socket"}]}'** \
>  -nographic

I plan to refresh a new version soon, in which the smp-cache array will
be integrated into -machine totally. And I'cc you then.

Regards,
Zhao

