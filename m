Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp228935njb;
        Thu, 17 Oct 2024 07:34:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX62NsnuQcJVt4MyuwlAuOoKgBQTeGQByxNjgU+F1i1dlA85wsADDmNhSEALpSFNSluSep8gnZ7ddu6hg==@linaro.org
X-Google-Smtp-Source: AGHT+IESpfC25EFNlxE4NhBm5X276mXMLLXM3mW3bGgbo8LhQ8paZJz2deUHkYBysij5oTrmbZuI
X-Received: by 2002:a05:6102:290c:b0:4a5:afbc:48a9 with SMTP id ada2fe7eead31-4a5afbc5051mr10326183137.8.1729175699611;
        Thu, 17 Oct 2024 07:34:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729175699; cv=none;
        d=google.com; s=arc-20240605;
        b=cyLKr3VUu5iz1/1Qk7BIspGiZulCj6IQpB+SVXFGzMYk03iygs5KBvnsRHoE5CoqXh
         0LykoPSfFok+0nseIpjcgb1++NfwjrwgWLYzaQ8F9H+JBlfLtuHBNaXJ5jbwiPENhAUC
         ss48xc+8ec1gK2l93HGz/JW1+9k6gDM+ariKf57T0aaT+a/w6wlBih+VZmvHm37KUeKB
         eGtZxWO7pZeHocUSflyy4aYSI/HxoEp/l5vOTOLkdjcWhZWUETywNJK127vzAt/4eX6W
         rKtFfLvg+4ZXHZQ9hwocSTZ0avGIHuro+NjKWbN9qW5ZKmPhcwJI4tqlnxNKtKRrCWY+
         PfwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=c73ATsbgufP6tkVAROT1dEauWdgDvWO1ITp3m6F4KaM=;
        fh=3/+GyYoJIlSLrBrEpAZyE8aBrexZOiRUHw4kcprFdFI=;
        b=XvuP2x2YQjQaqwovuVY/F7ru6gI+hl6yyoUa6YyC7pZYAZmgyX4ykl5mAtIR3zSFo1
         LgAFWodgO459/bTxf6D7s68bJ7TkazX2lCxCWF5J7iyqeOUdM9RACE5rsuAGDS/IMs/T
         Niqqchyl0wdk0Uod/vy+mrSqlC/q7mKE8DuTPETttaK0nmBkX4sOptEHYUKC7CElw3BS
         kIqlVVg0mTT/x6D6pss9fiQO1+GtqaNcdIES/z3x5GEvrJnkF84P2fG4rkPQksbvXpDH
         K60H2f6BEHeFIjxrcvT+aH0qpaCGjyM9tmkG1P4ugmdSX1Dq2WzDtRFzpTwvULobDCnH
         WURg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=KFd3gTgF;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.17 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4a5ace5cf64si1420589137.728.2024.10.17.07.34.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2024 07:34:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.17 as permitted sender) client-ip=192.198.163.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=KFd3gTgF;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.17 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729175699; x=1760711699;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CVMfqVFPC1FfKWUvGbQ6UhJ7jsGmHq8fERdx02Rk3c8=;
  b=KFd3gTgFUEWxRKAeozsjxB7ADSsPbho3AniUVYPRUMkYHpicyb84SRkh
   gNIKr+pxHGDpausZq1trDYSRij4wEprubSkpeG/3aJxvMLCOMHyYlCWik
   y7UDyhNxdQHv5LRKitDG/VtA3O5AWjT4oByXck9Yk9nMlvPT+LkNKq1v7
   S4NZv8HP0hNH7908yEtK8FsJYQBkoNqUWW2n8aS0Cs78V9NuIY5NsiWRw
   UQMHPPLMe2uN1l+D7WW6aZNmdtMq5uPRqT6Z4BD6pj9dGuPP6TkZjHky0
   VvwuCgVaCVFw7trVEda+JBLZLOPMRAN7o2zb7u0ksqb9OCE+L9PmUfSKG
   Q==;
X-CSE-ConnectionGUID: sUmlXmJuQGiNVMZ/yDEzmA==
X-CSE-MsgGUID: mGqp+TeVSq+oThUeHLSmXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="28546001"
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; 
   d="scan'208";a="28546001"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 07:34:57 -0700
X-CSE-ConnectionGUID: iFCeQvUHQD6EsOtiz6LP5g==
X-CSE-MsgGUID: RrpgABK9Q/aTX6hvU38pWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; 
   d="scan'208";a="83116369"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by fmviesa005.fm.intel.com with ESMTP; 17 Oct 2024 07:34:51 -0700
Date: Thu, 17 Oct 2024 22:51:07 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Markus Armbruster <armbru@redhat.com>
Cc: Daniel P =?utf-8?B?LiBCZXJyYW5n77+9?= <berrange@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Philippe =?utf-8?B?TWF0aGlldS1EYXVk77+9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	"Michael S.Tsirkin " <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Alex =?utf-8?B?QmVubu+/vWU=?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Alireza Sanaee <alireza.sanaee@huawei.com>, qemu-devel@nongnu.org,
	kvm@vger.kernel.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [PATCH v3 1/7] hw/core: Make CPU topology enumeration
 arch-agnostic
Message-ID: <ZxEkW84fcf4pCK0w@intel.com>
References: <20241012104429.1048908-1-zhao1.liu@intel.com>
 <20241012104429.1048908-2-zhao1.liu@intel.com>
 <20241017095227.00006d85@Huawei.com>
 <20241017142013.00006c41@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017142013.00006c41@Huawei.com>
X-TUID: DvEwqj6W4VO7

(Ping Markus)

> > > +
> > > +##
> > > +# @CpuTopologyLevel:
> > > +#
> > > +# An enumeration of CPU topology levels.
> > > +#
> > > +# @invalid: Invalid topology level.  
> > 
> > Really trivial but why a capital I on Invalid here but not the
> > t of thread below?

Oops, thank you! It should be "invalid".

If Markus doesn't veto this version :), I'll standardize the case issues
in this file later. Some cases are uppercase, while others are lowercase.

> > > +#
> > > +# @thread: thread level, which would also be called SMT level or
> > > +#     logical processor level.  The @threads option in
> > > +#     SMPConfiguration is used to configure the topology of this
> > > +#     level.  
> > 
> 
