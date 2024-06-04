Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp2797754ejs;
        Tue, 4 Jun 2024 01:50:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVhQELKxgxo6DkCdEeSLv28vMDqEdPRmiEhzXle20aPVvP7d9vUOnn5eQzwOJUABtCE3jdgWOvx9SgQDu4nqdnkTda3XsZx
X-Google-Smtp-Source: AGHT+IGdOkN3aEFtzp7adp6640geyd2YWa/DiBcvTQ00678TJQG1o96BSYgcvGgHqhUWs2/SxAlI
X-Received: by 2002:a05:6214:3da1:b0:6af:6799:912c with SMTP id 6a1803df08f44-6af679992d6mr65595996d6.54.1717491057462;
        Tue, 04 Jun 2024 01:50:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717491057; cv=none;
        d=google.com; s=arc-20160816;
        b=aHupbL+qAaYMRJZT34oVrr4vIsKIPOZUQOhdJvQzuh78AOJHqegCv01olrgPNW0Tkp
         Ni5tk3O46OSoCkqmWwSGuOYG+MtwB+CHPd+bxPSqvk+X2rNknv9jQr7RiTxy5ikzs3lz
         zP7w8sH2pV7KJJMY2rlVoMop97oe7SmcQ5IJKWkcxK8FNqVgmIaCGTmR5yJWatmIw7ij
         TaMkmfd5sUHFRpFxwHEsAG1g1qOJwkUkRbubyT0F0WSRo30PC4pvl8r1kcdICDqIdVdX
         tmWH//sOKmxUEIVoekF0TIKAEKQuzXtODTCg7+1TxsSbRCQVRu/YMDpZ1CaQuquxgJEK
         P79w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=VxIt6Sft9dQ0ty1tNQs4BMDskvUKCakwfNMMbGIQoCc=;
        fh=QsxuhUBNyq2F7/1UitCRN/j+l2ZGR7FJ1BwILMh3mGA=;
        b=dj9ET3dp6w/cZ3ht7sEHMeukmbqRo8D9bIM9qUnQZir0hV5UtXELlVPT4YXltRgEdf
         oWTgq1QmHpX18y4DWG77clW35ebjmiKFYChsuVX8G0wWaCN2VKC5VYtycemjd0xbW5g5
         PaP9pB7Pz4glfVYRZYU2dHSysASEKKK4IGYpEndXjm0HXPdGvG+RAxC8xJYzLF7huWuD
         Lzh9zBja7tOJ9fqsLsSmeWNjM2eMPmokk39SR6spDR/MCpauBgvzFU00sgdHb3CsjumL
         xw/6K7OIqKCMZIPMXbsFTbvT2DULxLx7m4xTW7CJqdt9ffWaaeW/tUB8pJjKJZRRTFvY
         ugdQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=TFKBl6fH;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.9 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.9])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ae4b417d4esi105532976d6.421.2024.06.04.01.50.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jun 2024 01:50:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.9 as permitted sender) client-ip=192.198.163.9;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=TFKBl6fH;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.9 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717491057; x=1749027057;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ap8E/rEAx1h96bUEuIBQzglwJ4IPaipb0Em35hfeCMI=;
  b=TFKBl6fHuiHGY8NU6D92MSXgrZxSAppr4OapOwEIL8QhaPdhl+A/JUh7
   rV71JNYvYwWPKxSES917Fc4eK2xQCTmicuKcAGeXRgPpQiivl/vgP3NR7
   03dYfccXkKB7JILeJG/LFvgou2YoNOClHBhZcvZvZIEWAB9g4qO4iw69l
   I+mb4pZ1ACvoWxhRlZgygRqUHEzW0yKKaQmTlNGyAR1hqwdEXsjbTvCJ3
   q4gAskGHJtxx/wj2o13G32pCS/a528GYFZ7GeSFGUZ82+qyJlxskhTymt
   yFGHOoonutkcKz2v2gpfkd4IFF10I1f9ornHLlk7JiXH0HKeYAmnNqnrl
   g==;
X-CSE-ConnectionGUID: CtRT1BwUTzK/ptWh4Tf12g==
X-CSE-MsgGUID: mSv6BkxkQoielc4RIFeoug==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="24686289"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="24686289"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 01:50:55 -0700
X-CSE-ConnectionGUID: xgrFahFxRWmNqr5Axiqaqw==
X-CSE-MsgGUID: 4ZpV1M0jS6m9NzOxuga+5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="68338779"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by fmviesa001.fm.intel.com with ESMTP; 04 Jun 2024 01:50:50 -0700
Date: Tue, 4 Jun 2024 17:06:16 +0800
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
Message-ID: <Zl7ZCK0SxAFVZckX@intel.com>
References: <20240530101539.768484-1-zhao1.liu@intel.com>
 <20240530101539.768484-2-zhao1.liu@intel.com>
 <87plsyfc1r.fsf@pond.sub.org>
 <Zl7RbLrYUN0cg+t4@intel.com>
 <87zfs19jrj.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zfs19jrj.fsf@pond.sub.org>
X-TUID: BYy+/Y198p3T

On Tue, Jun 04, 2024 at 10:47:44AM +0200, Markus Armbruster wrote:
> Date: Tue, 04 Jun 2024 10:47:44 +0200
> From: Markus Armbruster <armbru@redhat.com>
> Subject: Re: [RFC v2 1/7] hw/core: Make CPU topology enumeration
>  arch-agnostic
> 
> Zhao Liu <zhao1.liu@intel.com> writes:
> 
> > Hi Markus,
> >
> > On Mon, Jun 03, 2024 at 02:25:36PM +0200, Markus Armbruster wrote:
> >> Date: Mon, 03 Jun 2024 14:25:36 +0200
> >> From: Markus Armbruster <armbru@redhat.com>
> >> Subject: Re: [RFC v2 1/7] hw/core: Make CPU topology enumeration
> >>  arch-agnostic
> >> 
> >> Zhao Liu <zhao1.liu@intel.com> writes:
> >> 
> >> > Cache topology needs to be defined based on CPU topology levels. Thus,
> >> > define CPU topology enumeration in qapi/machine.json to make it generic
> >> > for all architectures.
> >> >
> >> > To match the general topology naming style, rename CPU_TOPO_LEVEL_SMT
> >> > and CPU_TOPO_LEVEL_PACKAGE to CPU_TOPO_LEVEL_THREAD and
> >> > CPU_TOPO_LEVEL_SOCKET.
> >> >
> >> > Also, enumerate additional topology levels for non-i386 arches, and add
> >> > helpers for topology enumeration and string conversion.
> >> >
> >> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> >> 
> >> [...]
> >> 
> >> > diff --git a/qapi/machine.json b/qapi/machine.json
> >> > index bce6e1bbc412..7ac5a05bb9c9 100644
> >> > --- a/qapi/machine.json
> >> > +++ b/qapi/machine.json
> >> > @@ -1667,6 +1667,46 @@
> >> >       '*reboot-timeout': 'int',
> >> >       '*strict': 'bool' } }
> >> >  
> >> > +##
> >> > +# @CPUTopoLevel:
> >> 
> >> I understand you're moving existing enum CPUTopoLevel into the QAPI
> >> schema.  I think the idiomatic QAPI name would be CpuTopologyLevel.
> >> Would you be willing to rename it, or would that be too much churn?
> >
> > Sure, I'll rename it as you suggested.
> >
> >> > +#
> >> > +# An enumeration of CPU topology levels.
> >> > +#
> >> > +# @invalid: Invalid topology level, used as a placeholder.
> >> > +#
> >> > +# @thread: thread level, which would also be called SMT level or logical
> >> > +#     processor level. The @threads option in -smp is used to configure
> >> > +#     the topology of this level.
> >> > +#
> >> > +# @core: core level. The @cores option in -smp is used to configure the
> >> > +#     topology of this level.
> >> > +#
> >> > +# @module: module level. The @modules option in -smp is used to
> >> > +#     configure the topology of this level.
> >> > +#
> >> > +# @cluster: cluster level. The @clusters option in -smp is used to
> >> > +#     configure the topology of this level.
> >> > +#
> >> > +# @die: die level. The @dies option in -smp is used to configure the
> >> > +#     topology of this level.
> >> > +#
> >> > +# @socket: socket level, which would also be called package level. The
> >> > +#     @sockets option in -smp is used to configure the topology of this
> >> > +#     level.
> >> > +#
> >> > +# @book: book level. The @books option in -smp is used to configure the
> >> > +#     topology of this level.
> >> > +#
> >> > +# @drawer: drawer level. The @drawers option in -smp is used to
> >> > +#     configure the topology of this level.
> >> 
> >> docs/devel/qapi-code-gen.rst section Documentation markup:
> >> 
> >>     For legibility, wrap text paragraphs so every line is at most 70
> >>     characters long.
> >> 
> >>     Separate sentences with two spaces.
> >
> > Thank you for pointing this.
> >
> > About separating sentences, is this what I should be doing?
> >
> > # @drawer: drawer level. The @drawers option in -smp is used to
> > #  configure the topology of this level.
> 
> Like this:
> 
> ##
> # @CPUTopoLevel:
> #
> # An enumeration of CPU topology levels.
> #
> # @invalid: Invalid topology level.
> #
> # @thread: thread level, which would also be called SMT level or
> #     logical processor level.  The @threads option in -smp is used to
> #     configure the topology of this level.
> #
> # @core: core level.  The @cores option in -smp is used to configure
> #     the topology of this level.
> #
> # @module: module level.  The @modules option in -smp is used to
> #     configure the topology of this level.
> #
> # @cluster: cluster level.  The @clusters option in -smp is used to
> #     configure the topology of this level.
> #
> # @die: die level.  The @dies option in -smp is used to configure the
> #     topology of this level.
> #
> # @socket: socket level, which would also be called package level.
> #     The @sockets option in -smp is used to configure the topology of
> #     this level.
> #
> # @book: book level.  The @books option in -smp is used to configure
> #     the topology of this level.
> #
> # @drawer: drawer level.  The @drawers option in -smp is used to
> #     configure the topology of this level.
> #
> # Since: 9.1
> ##
>

I see, thanks very much for your patience.
