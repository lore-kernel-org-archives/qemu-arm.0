Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp235357njb;
        Thu, 17 Oct 2024 07:45:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWWbHXN4RXrVqTmX/5Bp56FmO5EjNaLfeOlMVGpmqnNdRQulGkNQYIlh31ZpNfE7/6/ILo+8bLSLNQLRg==@linaro.org
X-Google-Smtp-Source: AGHT+IFJ1drNvT7p/0BfeVD3Aqen1Atk7F26MQHRWrwqAMcXgkx/eKiLP1yKxIeOgttrxJaxmCUo
X-Received: by 2002:a05:6214:5505:b0:6cc:2ba7:7f7b with SMTP id 6a1803df08f44-6cc2ba78074mr126237466d6.28.1729176319413;
        Thu, 17 Oct 2024 07:45:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729176319; cv=none;
        d=google.com; s=arc-20240605;
        b=Lx3cpZPolSBQyX6wwzw5gBHle0/uR7NcinqtGQ7H6fBb/no5uctFsn95R2bDs4EqSu
         +4UrdSIomt+Gly7e6L3jPfPRrmCvQSH8UjBsaqJ9AKZ3ZbKrjA7gPN6S0+9lH53pCksD
         xpWkIVM8BI+VTVZwjZJImclF3ssVx1+DkiH+7n3NSueFiDMzMtzQrBswjFkxuJe66oHH
         w7hrGU6qfBFOkXSiWOfL/xVp2MDk4wDLTuVd/fzHo1Wu2QsIzTEQxYa+xBocUVHNMK3N
         myFotbJlVPI5S5Riu8anPBgsluZPhWWg49CMykJQKj/VBy7AbcGKBxQEnhvX+l2HgZD1
         3wDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=20vmMJCzQAIIPrkwmJx4fkp8fRa1Pl7dLC1NT62G1Bs=;
        fh=f9tIe26ThpbZZTwzKKlhPPShIqShrLK9u28PlxXR3ak=;
        b=BW/PDVcQVxRsWMDzCllxIb1vKnDr2Y2+FfPtT4gTd3cHpFNG0882yDVkp+abMrEvzo
         uPR6Kj2tJXjk+Tw69Zpcfj4yGznyDbDVypsa5gQfX2OUlFhiW4X+LEjFyOyQZoAJ907I
         BwhKTF2Q7HEa7AmTQU2qNIOC4uqzXcEXpOyC5wVZz09uy7RrxEKdZc8asaop2a9D+Ffi
         LWYhhQ46oQy+9oBqbYBxsTS3ybqeQvZVvjVVst+MgnIGiUuRf22jDjni0oJybnKYA67u
         ueZ5i9b8ftst5Z4jEEbq4//Y0+O3JSgwSM2aT1a1DceVR+YPsofuT1c3bcOt7VvHPeGJ
         vChw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=mVGmdxYi;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.13 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.13])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cc22a2d077si63647396d6.310.2024.10.17.07.45.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2024 07:45:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.13 as permitted sender) client-ip=192.198.163.13;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=mVGmdxYi;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.13 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729176319; x=1760712319;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zV481lRGbVV63j3CCjzbuapW1g8a4oHW28WTjDZBWng=;
  b=mVGmdxYiJvhkbCvhBc+pdcFKkdLd6OapZR1Tq0bZt8b95p5XaKHBd/ix
   ZwwUBS1APys3+hLRjY5QcgH43vF18DilIQ+0+6SynYVtDlP/TRUm99XTc
   tnoAtsN+u3Fkyp5wPAQJAlbbfybUBxayZcRTg/86RtgiNBSdlKIFSY0OO
   rfa8PaIauw2axLP+9OlGL+WHY9fFrffdknmmyYkV2bR8qxRXtw9lnUt74
   hHk0wg2fqH+gQ/ERIgFcCAUi9FrasA9qqPlWQLiZ2vlcw0RnBP9gDhiNc
   J/imqxc8/B+vFnDMoLeW7r1fWANeb5xdN5n68nrZWo+5fz6Dx/N6KtDCH
   Q==;
X-CSE-ConnectionGUID: p/BJ31n7RN2xDAGG0PvdJg==
X-CSE-MsgGUID: vtoGpm27Q1O7bsX2zL7DKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="31531313"
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; 
   d="scan'208";a="31531313"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 07:45:17 -0700
X-CSE-ConnectionGUID: S7JYt02wSee58G72esSEdQ==
X-CSE-MsgGUID: rTmYgiaESOSOiAQtFw6EsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; 
   d="scan'208";a="78708432"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by orviesa006.jf.intel.com with ESMTP; 17 Oct 2024 07:45:11 -0700
Date: Thu, 17 Oct 2024 23:01:26 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Philippe =?us-ascii?B?PT9JU08tODg1OS0xP1E/TWE/PSA9P0lTTy04ODU5LTE/UT90?=
	=?us-ascii?Q?hieu-Daud=3DE9=3F=3D?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	"Michael S.Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Alex =?us-ascii?B?PT9JU08tODg1OS0xP1E/QmVubj1FOWU/PQ==?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Alireza Sanaee <alireza.sanaee@huawei.com>, qemu-devel@nongnu.org,
	kvm@vger.kernel.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [PATCH v3 0/7] Introduce SMP Cache Topology
Message-ID: <ZxEmxkwQythD6ILI@intel.com>
References: <20241012104429.1048908-1-zhao1.liu@intel.com>
 <20241017141402.0000135b@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017141402.0000135b@Huawei.com>
X-TUID: j8CmBYfTuV8L

(Cc and gentlely ping QOM & QAPI maintainers :) )

> > Meanwhile, ARM side has also worked a lot on the smp-cache based on
> > this series [2], so I think we are very close to the final merge, to
> > catch up with this cycle. :)
> 
> This would finally solve a long standing missing control for our
> virtualization usecases (TCG and MPAM stuff is an added bonus),
> so I'm very keen in this making 9.2 (and maybe even the ARM part
> of things happen to move fast enough). Ali is out this week,
> but should be back sometime next week. Looks like rebase of his
> ARM patches on this should be simple!
> 
> I think this set mostly needs a QAPI review (perhaps from Markus?)

Michael mentioned this series also need QOM maintainer's review. So I
pinged maintainers at the beginning of this reply.

> > 
> > This series is based on the commit 7e3b6d8063f2 ("Merge tag 'crypto-
> > fixes-pull-request' of https://gitlab.com/berrange/qemu into staging").
> > 
> > Background
> > ==========
> > 
> > The x86 and ARM (RISCV) need to allow user to configure cache properties
> *laughs*. I definitely going to start emailing ARM folk with
> ARM (RISCV)  
> :)  

:) I remembered you discussing cache topology with Sia (from RISCV).

Thanks,
Zhao

