Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp2785696ejs;
        Tue, 4 Jun 2024 01:24:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWjaYM6XKVDmCDAqW4tFTz1cHRL2l5iglo4JvbMMWziASjxfCg3UYOAsxKBZx95zJ9E8gPPn2kHO+nPr2gRQTDdcmJa+GJb
X-Google-Smtp-Source: AGHT+IH8tZa4tEH6J57Iv2aC037ngQEbCyihF/gS+2gphUzdu441USy5CdqXNTBJQUd1bkCvspge
X-Received: by 2002:ac8:7c47:0:b0:43a:db76:3884 with SMTP id d75a77b69052e-43ff5515c06mr137971211cf.68.1717489465809;
        Tue, 04 Jun 2024 01:24:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717489465; cv=none;
        d=google.com; s=arc-20160816;
        b=wcUMEs/nadw7qAry8REqOyXEPOkTEPOA/NFESXeTp04i19kAAOoaBjLIBv9/JdCgYk
         Cv/sI7n+VWk6bGXm7HwWRx8xAWRVaEhaZDoCqnYwGXczHiuK0JNd6sP1+ghowUdxbJis
         zhhWjw0AlhjvwO+j+LpMJv8hIaW651RBYrGwsZRs2dDGjx09SHV1lD4U2EF75mkvrFS2
         Ipicih/eZ3NsPne26d9kasNLw0e+O+Rd054Qr7PlXQIzo9Dgg1pkpa25ZKJWxkCfGu2f
         p+IIAUZVW4iwRHDiv7CmAEuUk7NOU8B6/WpOynu1tWDUz86wbzLMqYPdQprITVygvnAX
         3bVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=bZd7eAseS8ab/ZCyFFbkHC8gGpvFwHHYVxd52wG1D58=;
        fh=QsxuhUBNyq2F7/1UitCRN/j+l2ZGR7FJ1BwILMh3mGA=;
        b=qhuEFAXKUulDL6g9atxXZIxeWIVaBUgkUbyVy16hcbn9uH3PazvZe5YeDndoxSk1dx
         wJR+b07V26E9Ok1N87+/6N3wDVIUl7qi7p6LQkquxmiVqYhPVgGumZIOSWmYj8xwrcpv
         qc0ELUDkn71In1TqpwC8QNm8mwBoczTpL8m55+XlNpYLgUZmIHsv0dD5yTGPxnj9qQBt
         tYHdKsX6ruzvl1jl5LfwNdjyv7jqqSgHca4T5sV0lx1v6C/x2hCZIYakde6ptCXSwrOj
         wbPz7XFp5rVwGRk+iCCj6VTSkUhWsn2WJl4Gkiq+kCYW5v3KMLv0DvmbPxzrUPXxf8PX
         eG2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=XceCHVZN;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.11 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.11])
        by mx.google.com with ESMTPS id d75a77b69052e-43ff257e9absi107381591cf.440.2024.06.04.01.24.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jun 2024 01:24:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.11 as permitted sender) client-ip=192.198.163.11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=XceCHVZN;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.11 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717489466; x=1749025466;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=atOfj9kWdFuVI1HtcdHLArsthwrM8mfXmtw15855REQ=;
  b=XceCHVZNpIUmWHijqoi5/HuJ4VuBvsZ8cmMUEBd9YGD5X/ZMtkVIYjXm
   CSyQ37rEa/rfYPifLb7ZIFxkbQZ27C6PciUD0OHuus1mPvEGnGKPFv7bc
   3lNMb9mOh6OOnxBsCM5cr3kYkeOSNoU+tlRjPZhWcZCIy0/U90hxnvQis
   h3tVxZAcMp7IhWswnxF88s8VBg1ZWzdlphWy+3HWUxLMG1AhFjQim360Z
   WRTdCxc7Bal1oHSvOmKv5x5yQ7iHASqpa6ZeHOzTP5VsQTYEgU6sqY4uR
   9ZND3KUaUZK8bNu/+pQ1NcgTlKo7j3qduLldPbdAKoTN1kwO9gP2D7p7C
   A==;
X-CSE-ConnectionGUID: 9sCY1xpBSMWyAcJTM9Sstw==
X-CSE-MsgGUID: cHdZqmyeRFSPi/T62NUE3A==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="24644298"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="24644298"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 01:24:24 -0700
X-CSE-ConnectionGUID: zjJrKqpcS86f3Y2Vz9QwYA==
X-CSE-MsgGUID: jwlQwP8FTJCMn3VANeHNmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="37152758"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by fmviesa008.fm.intel.com with ESMTP; 04 Jun 2024 01:24:19 -0700
Date: Tue, 4 Jun 2024 16:39:44 +0800
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
Message-ID: <Zl7S0IOlLvnua319@intel.com>
References: <20240530101539.768484-1-zhao1.liu@intel.com>
 <20240530101539.768484-2-zhao1.liu@intel.com>
 <87y17mfccp.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y17mfccp.fsf@pond.sub.org>
X-TUID: JfT0Cff82rPl

[snip]

> > +CPUTopoInfo cpu_topo_descriptors[] = {
> > +    [CPU_TOPO_LEVEL_INVALID] = { .name = "invalid", },
> > +    [CPU_TOPO_LEVEL_THREAD]  = { .name = "thread",  },
> > +    [CPU_TOPO_LEVEL_CORE]    = { .name = "core",    },
> > +    [CPU_TOPO_LEVEL_MODULE]  = { .name = "module",  },
> > +    [CPU_TOPO_LEVEL_CLUSTER] = { .name = "cluster", },
> > +    [CPU_TOPO_LEVEL_DIE]     = { .name = "die",     },
> > +    [CPU_TOPO_LEVEL_SOCKET]  = { .name = "socket",  },
> > +    [CPU_TOPO_LEVEL_BOOK]    = { .name = "book",    },
> > +    [CPU_TOPO_LEVEL_DRAWER]  = { .name = "drawer",  },
> > +    [CPU_TOPO_LEVEL__MAX]    = { .name = NULL,      },
> > +};
> 
> This looks redundant with generated
> 
>     const QEnumLookup CPUTopoLevel_lookup = {
>         .array = (const char *const[]) {
>             [CPU_TOPO_LEVEL_INVALID] = "invalid",
>             [CPU_TOPO_LEVEL_THREAD] = "thread",
>             [CPU_TOPO_LEVEL_CORE] = "core",
>             [CPU_TOPO_LEVEL_MODULE] = "module",
>             [CPU_TOPO_LEVEL_CLUSTER] = "cluster",
>             [CPU_TOPO_LEVEL_DIE] = "die",
>             [CPU_TOPO_LEVEL_SOCKET] = "socket",
>             [CPU_TOPO_LEVEL_BOOK] = "book",
>             [CPU_TOPO_LEVEL_DRAWER] = "drawer",
>         },
>         .size = CPU_TOPO_LEVEL__MAX
>     };
> 
> > +
> > +const char *cpu_topo_to_string(CPUTopoLevel topo)
> > +{
> > +    return cpu_topo_descriptors[topo].name;
> > +}
> 
> And this with generated CPUTopoLevel_str().

Thanks! I missed these generated helpers.

[snip]

> > +##
> > +# @CPUTopoLevel:
> > +#
> > +# An enumeration of CPU topology levels.
> > +#
> > +# @invalid: Invalid topology level, used as a placeholder.
> 
> Placeholder for what?

I was trying to express that when no specific topology level is
specified, it will be initialized to this value by default.

Or what about just deleting this placeholder related words and just
saying it's "Invalid topology level"?

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
> As far as I can tell, -smp is sugar for machine property "smp" of QAPI
> type SMPConfiguration.  Should we refer to SMPConfiguration instead of
> -smp?

Yes, SMPConfiguration is better.

Thanks,
Zhao
