Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp2783119ejs;
        Tue, 4 Jun 2024 01:18:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXytPFWI8VRZZ0tS6T7jnRKfwtcSXe4ulkiCSYc8eAV+cADKpqba+YK2iCCJ6F1ZGWxHNaR18AUmKMEbx2KbNIxuVRzZD7G
X-Google-Smtp-Source: AGHT+IGkADKx00ETLrf6bnTd09OO+beMhECmC67pmhOK1p9laBSON5DidMPj8xWhWkxGMGRhATHc
X-Received: by 2002:a25:ad03:0:b0:df4:a607:2429 with SMTP id 3f1490d57ef6-dfa73d90ac6mr12001413276.45.1717489112478;
        Tue, 04 Jun 2024 01:18:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717489112; cv=none;
        d=google.com; s=arc-20160816;
        b=VI7ER0W7RSi3QD6OF1IugqIP2RYDVRoBXgOMcRzomakXHKT/JJ3AQkRJX3jzjKSJtu
         G7kGdsur7+4sahgYjQSk6Jus1wolg+TKgNvm/oFrt3JZo0aro/YqWkd2tD+oP7nhuPJk
         OH0ibrw7QddjqY3osbrkxxKFGmSHuA3AWSv81auuHFH+9B8RN3TFCkDn/fKeGOAqpXhP
         gOBhs++JyoCof0Rq/7eZjDnU/DZk7nuqmfCc7wXxVDtE7wVx9FppI15P8zliRiUZwac0
         rv9xqT/R9tX3m+E+wlw3EkwocyrfAmnslK8G+SPGH3JVhiR54K9baI4AwTipvuN5HDuM
         71UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=DEodz0BFgKoplV2+TEF/wXfFDsm/bl7/hqFkkgMB6+g=;
        fh=QsxuhUBNyq2F7/1UitCRN/j+l2ZGR7FJ1BwILMh3mGA=;
        b=RX1b8Nnv2LkyCKvbOPQGvXtfUK1L1+rDlfsL4UqUTAEZnkUi072ilhpAx09TLX1ExA
         HwsflEWD7NxHPY+8Bqtz6Cvfy6fm1avslnlmTAMF6kozhbvD1raac8/+MoqmG+R9dgZY
         k8fMBVf9WS2cqgQJeIJ0FQW7N4Pzh7bjtnzMPDQJgsOb9MCTYT9SyWHJgia6pFIwAeNJ
         ypJGgwFxGfKBfGHqI6uW9objJsE8FUqW+gTWxFlgNWzkmjYtWUzIf1/5GUmdr5K3bnUj
         Z5zQ0TkpWVNze2oF0TyoZmDmlqeOvup/DEX1zwKVDMCzu7wz2/MRysrg8YcPZ2rCW1m3
         4Kig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=HFnffBSJ;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.10])
        by mx.google.com with ESMTPS id d75a77b69052e-43ff23d91d0si107351691cf.166.2024.06.04.01.18.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jun 2024 01:18:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) client-ip=198.175.65.10;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=HFnffBSJ;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717489112; x=1749025112;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T6qZEH63FFuFYtelDyLGAv9Vpeeu3+M490fJp4SljgU=;
  b=HFnffBSJn/WVVcopIT48e05M1LS76agE4yIojVQ3ASWL6Jxqg1iWM86O
   MizWJzAslxFAW2IVl08d5/ngytf9tltf2eF/A9IAEXPs0Yd1rV0/rmXbQ
   552VxE4j+nr8bKzv9YdO9WIk2Xz2ImBRde2lXtBgqUqPjxOjwJ3IxumRj
   mmpUJChLGzDwhdV5XRbQJ+UPxjh2TqQoWE8H3yQZmY3rWMtIHUoH0W0MM
   JnnvQPaYsqU7sgAyAbX4OQC8D8JWt2va22SBeFY9TqKe4VPiHLElroLIj
   VfWC6k6E8ZdaQjeMorqkcGpaTIvvaaf8JZXmuSxYCq5lTLHBPI3CAaGam
   g==;
X-CSE-ConnectionGUID: dR09qljyRbmD5qMU9V9JhQ==
X-CSE-MsgGUID: hVWqS+7US8+g3nym6bsnbQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="31518824"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="31518824"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 01:18:27 -0700
X-CSE-ConnectionGUID: ZLkK9vr3Qi6T22a7gQdEpw==
X-CSE-MsgGUID: WIUIwbV2QBChE1vi6Mj3Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="37027956"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by fmviesa007.fm.intel.com with ESMTP; 04 Jun 2024 01:18:22 -0700
Date: Tue, 4 Jun 2024 16:33:48 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>, qemu-devel@nongnu.org,
	kvm@vger.kernel.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>
Subject: Re: [RFC v2 1/7] hw/core: Make CPU topology enumeration arch-agnostic
Message-ID: <Zl7RbLrYUN0cg+t4@intel.com>
References: <20240530101539.768484-1-zhao1.liu@intel.com>
 <20240530101539.768484-2-zhao1.liu@intel.com>
 <87plsyfc1r.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87plsyfc1r.fsf@pond.sub.org>
X-TUID: QtmS0j92vtDm

Hi Markus,

On Mon, Jun 03, 2024 at 02:25:36PM +0200, Markus Armbruster wrote:
> Date: Mon, 03 Jun 2024 14:25:36 +0200
> From: Markus Armbruster <armbru@redhat.com>
> Subject: Re: [RFC v2 1/7] hw/core: Make CPU topology enumeration
>  arch-agnostic
> 
> Zhao Liu <zhao1.liu@intel.com> writes:
> 
> > Cache topology needs to be defined based on CPU topology levels. Thus,
> > define CPU topology enumeration in qapi/machine.json to make it generic
> > for all architectures.
> >
> > To match the general topology naming style, rename CPU_TOPO_LEVEL_SMT
> > and CPU_TOPO_LEVEL_PACKAGE to CPU_TOPO_LEVEL_THREAD and
> > CPU_TOPO_LEVEL_SOCKET.
> >
> > Also, enumerate additional topology levels for non-i386 arches, and add
> > helpers for topology enumeration and string conversion.
> >
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> 
> [...]
> 
> > diff --git a/qapi/machine.json b/qapi/machine.json
> > index bce6e1bbc412..7ac5a05bb9c9 100644
> > --- a/qapi/machine.json
> > +++ b/qapi/machine.json
> > @@ -1667,6 +1667,46 @@
> >       '*reboot-timeout': 'int',
> >       '*strict': 'bool' } }
> >  
> > +##
> > +# @CPUTopoLevel:
> 
> I understand you're moving existing enum CPUTopoLevel into the QAPI
> schema.  I think the idiomatic QAPI name would be CpuTopologyLevel.
> Would you be willing to rename it, or would that be too much churn?

Sure, I'll rename it as you suggested.

> > +#
> > +# An enumeration of CPU topology levels.
> > +#
> > +# @invalid: Invalid topology level, used as a placeholder.
> > +#
> > +# @thread: thread level, which would also be called SMT level or logical
> > +#     processor level. The @threads option in -smp is used to configure
> > +#     the topology of this level.
> > +#
> > +# @core: core level. The @cores option in -smp is used to configure the
> > +#     topology of this level.
> > +#
> > +# @module: module level. The @modules option in -smp is used to
> > +#     configure the topology of this level.
> > +#
> > +# @cluster: cluster level. The @clusters option in -smp is used to
> > +#     configure the topology of this level.
> > +#
> > +# @die: die level. The @dies option in -smp is used to configure the
> > +#     topology of this level.
> > +#
> > +# @socket: socket level, which would also be called package level. The
> > +#     @sockets option in -smp is used to configure the topology of this
> > +#     level.
> > +#
> > +# @book: book level. The @books option in -smp is used to configure the
> > +#     topology of this level.
> > +#
> > +# @drawer: drawer level. The @drawers option in -smp is used to
> > +#     configure the topology of this level.
> 
> docs/devel/qapi-code-gen.rst section Documentation markup:
> 
>     For legibility, wrap text paragraphs so every line is at most 70
>     characters long.
> 
>     Separate sentences with two spaces.

Thank you for pointing this.

About separating sentences, is this what I should be doing?

# @drawer: drawer level. The @drawers option in -smp is used to
#  configure the topology of this level.


Thanks,
Zhao
