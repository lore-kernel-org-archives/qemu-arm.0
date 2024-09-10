Received: by 2002:a05:7022:6591:b0:89:eff1:5568 with SMTP id bd17csp1391381dlb;
        Tue, 10 Sep 2024 11:23:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVD8yYZnV085otsCoALn+e5XTgkyKD99VdIX5dJMSu20FBUH/dj9w+eYiYj7/FLDd3WToZuVhHssGWn8w==@linaro.org
X-Google-Smtp-Source: AGHT+IHzQZYBxjZ3CXwUQBaMY9VrFkFF+80IbNMKQJ2Qj3/ny2+dC1BfAuSkAecKa6p2Ud3J+RFC
X-Received: by 2002:a05:690c:490b:b0:6b2:7bd8:d7a4 with SMTP id 00721157ae682-6db45163f46mr155541257b3.41.1725992624608;
        Tue, 10 Sep 2024 11:23:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725992624; cv=none;
        d=google.com; s=arc-20240605;
        b=bSW34JOhqC2/PbxEVe6p8gNrJyF1jMmQkQl4PxEHszZHiZ5nbknpiQiGmWejP/t4ty
         bxhj7JCdy/FGR3z6w13Jt4TpAvfSHA8Rd4dKn6dU6Q+J/lsT5ZwRuaToVXMGlD5EhOpR
         rNOjujYaid32j1ji06wpDhHCUA99+O7nRtiUN+1oBbXN8R9qTy8g5NLwoRxJ16vnmMgP
         SbC2VrX83k11lCn8Yb+fws7Xr51+1y8nFUJehXqQF0oPZaJzV/S6newQbRxtRGiygs5/
         k9q7DjVLMBsB4YFbqjAHY3E5ZxBhg2ldOWFKyvll0KZ1AvLFZUIStri07Mr3QDpgAzrN
         I3gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=UhS48drDph1UOjmPA2XZWUSFbGzf9avVWp6dtm6ZeWI=;
        fh=HmlPcLzy0e2yKK3gnanNPghVcnMb1YvsMiHfoGeIBVo=;
        b=OoDXQyWqTV3EgGFOxtiZPlxAlycYqUjy5YSR91HhMDDFPzEguSuJw5bPzJjulOmh3p
         fYl2O1YR16eUHwHRxgM8T+Xo1kYl8N7xI8JsLxJbVYHBNtt5kweiXb0MOwoJX532EEYr
         s6Jlry+HQB0Q7I7mREAve82t8Bm+22L08YmOjFTnP7qSIWRgcrFS1aSh0+YN717vQWDr
         cttv2uDuaUMTkFKCxqJx20jFlcQ5SGzLCHdutGb1HSXvn97mpVUgWz4AwKtfvuA+EJh3
         hyIrHd4bcYcCeBaqhkFzvFDa9atEgcu165YpLZkmIj5zDEKHxGrreqCRP5hlQPQiioCs
         h9jQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Wf/YRi3Z";
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mst@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 00721157ae682-6db96756f84si12169697b3.551.2024.09.10.11.23.44
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 11:23:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Wf/YRi3Z";
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725992624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UhS48drDph1UOjmPA2XZWUSFbGzf9avVWp6dtm6ZeWI=;
	b=Wf/YRi3ZSf1qN423JkQaP514polPwUpCm29968jz9c8SomtiQaiqhkAk7WdyYxnZI4hZlq
	NVu+gtZDQuZ7I0BMOt0uwce88EaLjkrpcII7x9kAVFEmLW02W1l2XX29WjvF3jFe4l7K+6
	buUxBEhXQmREyrowvzt4R4D7YPbcWbM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-_tQLg6NkM02poiOFJF5yKA-1; Tue, 10 Sep 2024 14:23:43 -0400
X-MC-Unique: _tQLg6NkM02poiOFJF5yKA-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-374bb2f100fso2593741f8f.0
        for <alex.bennee@linaro.org>; Tue, 10 Sep 2024 11:23:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725992622; x=1726597422;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UhS48drDph1UOjmPA2XZWUSFbGzf9avVWp6dtm6ZeWI=;
        b=MuksLe9LuF5LezULG5fAaaqYToZyIZ21yFks3lfFXtKgIZ/KzdNAJjC6fwB7RMYdas
         lFcvETGDjyzahLPm9ilqRMctg+5ibPVxMnzMJOFyCSzmcNKUr118HOBbJvGCd+a56Qi7
         k5pzjZR6UTyFD2cydmxqprCtxd/t2HbnsTHhJz/sfNsJATYNDrnozc/aNN+YspMN7CMG
         gTE59mDVX9PvkaxFFWqAn06ddq6P4ktF6yNsDk7KH1qvMKknOxf84OVfMvOFsb9JGn+2
         4ZhgXg41ExmRSlUCigG8aYUVHB4+wkN43R5cr3c7tRo8Z96TTOP7fzuFbatIrcfW0gk8
         yPug==
X-Forwarded-Encrypted: i=1; AJvYcCVx0Yw8XChjc2Qfxw47zdbc+CLWWwKiQhOuRUpdTZ9jNF3Dw/6jib7KDdGBpTOq1ISrmVUVwc/Qk3FtIw==@linaro.org
X-Gm-Message-State: AOJu0YwQVn5Dp1Uc0+67KNgAbTTwUhNeYVmy9/hesRA101bITXQ1U/1v
	x+i8v8IRmjHWXtpTqdld9BGumebed3D76saThArUam1EMaI7BngFRqAoEBtB/1FMiS/JFQRlvZI
	XV62cG5DJZ8LqylNvK2n68DhD5E9LPxssRrgzwJLAV68bmwLI14Rn9g==
X-Received: by 2002:a5d:634c:0:b0:374:c40d:d437 with SMTP id ffacd0b85a97d-378895c9f9fmr9516031f8f.15.1725992621843;
        Tue, 10 Sep 2024 11:23:41 -0700 (PDT)
X-Received: by 2002:a5d:634c:0:b0:374:c40d:d437 with SMTP id ffacd0b85a97d-378895c9f9fmr9516016f8f.15.1725992620457;
        Tue, 10 Sep 2024 11:23:40 -0700 (PDT)
Return-Path: <mst@redhat.com>
Received: from redhat.com ([31.187.78.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956654e8sm9570992f8f.41.2024.09.10.11.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 11:23:39 -0700 (PDT)
Date: Tue, 10 Sep 2024 14:23:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Alireza Sanaee <alireza.sanaee@huawei.com>, qemu-devel@nongnu.org,
	kvm@vger.kernel.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>
Subject: Re: [PATCH v2 0/7] Introduce SMP Cache Topology
Message-ID: <20240910142311-mutt-send-email-mst@kernel.org>
References: <20240908125920.1160236-1-zhao1.liu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20240908125920.1160236-1-zhao1.liu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TUID: zWc7XfJNFHme

On Sun, Sep 08, 2024 at 08:59:13PM +0800, Zhao Liu wrote:
> Hi all,
> 
> Compared with previous Patch v1 [1], I've put the cache properties list
> into -machine, this is to meet current needs and also remain compatible
> with my future topology support (more discussion details, pls refer [2]).
> 
> This series is based on the commit 1581a0bc928d ("Merge tag 'pull-ufs-
> 20240906' of https://gitlab.com/jeuk20.kim/qemu into staging ufs
> queue").


Needs review from QOM maintainers.

> Background
> ==========
> 
> The x86 and ARM (RISCV) need to allow user to configure cache properties
> (current only topology):
>  * For x86, the default cache topology model (of max/host CPU) does not
>    always match the Host's real physical cache topology. Performance can
>    increase when the configured virtual topology is closer to the
>    physical topology than a default topology would be.
>  * For ARM, QEMU can't get the cache topology information from the CPU
>    registers, then user configuration is necessary. Additionally, the
>    cache information is also needed for MPAM emulation (for TCG) to
>    build the right PPTT. (Originally from Jonathan)
> 
> 
> About smp-cache
> ===============
> 
> In this version, smp-cache is implemented as a array integrated in
> -machine. Though -machine currently can't support JSON format, this is
> the one of the directions of future.
> 
> An example is as follows:
> 
> smp_cache=smp-cache.0.cache=l1i,smp-cache.0.topology=core,smp-cache.1.cache=l1d,smp-cache.1.topology=core,smp-cache.2.cache=l2,smp-cache.2.topology=module,smp-cache.3.cache=l3,smp-cache.3.topology=die
> 
> "cache" specifies the cache that the properties will be applied on. This
> field is the combination of cache level and cache type. Now it supports
> "l1d" (L1 data cache), "l1i" (L1 instruction cache), "l2" (L2 unified
> cache) and "l3" (L3 unified cache).
> 
> "topology" field accepts CPU topology levels including "thread", "core",
> "module", "cluster", "die", "socket", "book", "drawer" and a special
> value "default".
> 
> The "default" is introduced to make it easier for libvirt to set a
> default parameter value without having to care about the specific
> machine (because currently there is no proper way for machine to
> expose supported topology levels and caches).
> 
> If "default" is set, then the cache topology will follow the
> architecture's default cache topology model. If other CPU topology level
> is set, the cache will be shared at corresponding CPU topology level.
> 
> 
> Welcome your comment!
> 
> 
> [1]: Patch v1: https://lore.kernel.org/qemu-devel/20240704031603.1744546-1-zhao1.liu@intel.com/
> [2]: API disscussion: https://lore.kernel.org/qemu-devel/8734ndj33j.fsf@pond.sub.org/
> 
> Thanks and Best Regards,
> Zhao
> ---
> Changelog:
> 
> Main changes since Patch v1:
>  * Dropped handwriten smp-cache object and integrated cache properties
>    list into MachineState and used -machine to configure SMP cache
>    properties. (Markus)
>  * Dropped prefix of CpuTopologyLevel enumeration. (Markus)
>  * Rename CPU_TOPO_LEVEL_* to CPU_TOPOLOGY_LEVEL_* to match the QAPI's
>    generated code. (Markus)
>  * Renamed SMPCacheProperty/SMPCacheProperties (QAPI structures) to
>    SmpCacheProperties/SmpCachePropertiesWrapper. (Markus)
>  * Renamed SMPCacheName (QAPI structure) to SmpCacheLevelAndType and
>    dropped prefix. (Markus)
>  * Renamed 'name' field in SmpCacheProperties to 'cache', since the
>    type and level of the cache in SMP system could be able to specify
>    all of these kinds of cache explicitly enough.
>  * Renamed 'topo' field in SmpCacheProperties to 'topology'. (Markus)
>  * Returned error information when user repeats setting cache
>    properties. (Markus)
>  * Renamed SmpCacheLevelAndType to CacheLevelAndType, since this
>    representation is general across SMP or hybrid system.
>  * Dropped machine_check_smp_cache_support() and did the check when
>    -machine parses smp-cache in machine_parse_smp_cache().
> 
> Main changes since RFC v2:
>  * Dropped cpu-topology.h and cpu-topology.c since QAPI has the helper
>    (CpuTopologyLevel_str) to convert enum to string. (Markus)
>  * Fixed text format in machine.json (CpuTopologyLevel naming, 2 spaces
>    between sentences). (Markus)
>  * Added a new level "default" to de-compatibilize some arch-specific
>    topo settings. (Daniel)
>  * Moved CpuTopologyLevel to qapi/machine-common.json, at where the
>    cache enumeration and smp-cache object would be added.
>    - If smp-cache object is defined in qapi/machine.json, storage-daemon
>      will complain about the qmp cmds in qapi/machine.json during
>      compiling.
>  * Referred to Daniel's suggestion to introduce cache JSON list, though
>    as a standalone object since -smp/-machine can't support JSON.
>  * Linked machine's smp_cache to smp-cache object instead of a builtin
>    structure. This is to get around the fact that the keyval format of
>    -machine can't support JSON.
>  * Wrapped the cache topology level access into a helper.
>  * Split as a separate commit to just include compatibility checking and
>    topology checking.
>  * Allow setting "default" topology level even though the cache
>    isn't supported by machine. (Daniel)
>  * Rewrote the document of smp-cache object.
> 
> Main changes since RFC v1:
>  * Split CpuTopology renaimg out of this RFC.
>  * Use QAPI to enumerate CPU topology levels.
>  * Drop string_to_cpu_topo() since QAPI will help to parse the topo
>    levels.
>  * Set has_*_cache field in machine_get_smp(). (JeeHeng)
>  * Use "*_cache=topo_level" as -smp example as the original "level"
>    term for a cache has a totally different meaning. (Jonathan)
> ---
> Zhao Liu (7):
>   hw/core: Make CPU topology enumeration arch-agnostic
>   qapi/qom: Define cache enumeration and properties
>   hw/core: Add smp cache topology for machine
>   hw/core: Check smp cache topology support for machine
>   i386/cpu: Support thread and module level cache topology
>   i386/cpu: Update cache topology with machine's configuration
>   i386/pc: Support cache topology in -machine for PC machine
> 
>  hw/core/machine-smp.c      | 119 +++++++++++++++++++++++
>  hw/core/machine.c          |  44 +++++++++
>  hw/i386/pc.c               |   4 +
>  hw/i386/x86-common.c       |   4 +-
>  include/hw/boards.h        |  13 +++
>  include/hw/i386/topology.h |  22 +----
>  qapi/machine-common.json   |  96 ++++++++++++++++++-
>  qemu-options.hx            |  28 +++++-
>  target/i386/cpu.c          | 191 ++++++++++++++++++++++---------------
>  target/i386/cpu.h          |   4 +-
>  10 files changed, 425 insertions(+), 100 deletions(-)
> 
> -- 
> 2.34.1
