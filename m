Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp5050859lfc;
        Mon, 8 Jun 2020 05:55:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWVWzLj5XufuscpEJK6wxYM5O/A/oI7gSbJ/MZ2gypfGP0PDU+ocNfXsHCzXYD5w/xe9q9
X-Received: by 2002:a25:4944:: with SMTP id w65mr38969462yba.365.1591620932908;
        Mon, 08 Jun 2020 05:55:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591620932; cv=none;
        d=google.com; s=arc-20160816;
        b=Pj16EgbdnyZe+GFV9jnGnPv/o6JuK0nHqj43d6UWP8izkNnaIlV2GazgzLttJyvcY/
         Jn7k+C1qzFmX7gkjFjhzerzvHw0Z1wdIVVp3LxkKGKPQgxe48VlM9bc4kfNACXHacCM8
         bsLXAd1pHt5IHsjH32GMPiaC7NtRetch9Fd1sI3cLul0ZM5oR1jtdd3xagnxvZ6LsdYh
         pSs9/xe2hMNyYGLaf8GNzUGYrX73ETm6RWWswV5sIMBdFdPteIccT7ef4m1dJxHWnKso
         7j4lNBe0YI7LoTCJo4USUw9ou9M/9+xmBeTfBcHAlYexfpZ8JP5i4bb+71jecvJnpYxg
         uXgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=y8FZiQIg0Vbw2mwm4f2z++ZH4lwvvJ+VLpDggeECuYc=;
        b=AAmV0EwyyDEt9/2lz8My2AAyEU2voeZr4LzCv/isfgzjxV39x7uM1u4TTovhxlWIip
         pwXca+p2hSdkiotmqzjlp3FnjWGkNUL7okHtU3qzkWysbVXY0rICCitsfHBAVp9R3Ouw
         GyMTCDOUFbsDPaJ/GGmWojpx3Cc2DmgmqSCWoJ8SUis3FAJyLUBLcAILPZ6mSB5bfukb
         xiVk57t0Spvg5pgaflcG2cdzSOp5gW8Veiqc8bgzLUW4VNCgSCCRyslveeB4FReOBaF6
         kZN4OqRIhjrHqU9+Sk4veLKKYphzoN0DfeJVSyeB+Wi4KPz5bh5KQ/UHkAE6LqLp7xX/
         G43g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ht4aIPZH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c11si13833294ybb.279.2020.06.08.05.55.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 05:55:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ht4aIPZH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiHJM-0005OO-4P
	for alex.bennee@linaro.org; Mon, 08 Jun 2020 08:55:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jiHJ8-0005My-Gq
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 08:55:18 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:27200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jiHJ6-0007UH-TO
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 08:55:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591620915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y8FZiQIg0Vbw2mwm4f2z++ZH4lwvvJ+VLpDggeECuYc=;
 b=Ht4aIPZHTDNY+GCAdes0YE3OdXHvM/zyuBKv7roZi5rbaq3+5Q5b6PZOKT2NV90kAWWQf/
 ZLQXmUCUxkbellQuIs+2GgOsNmG8wUslim06MYZp0RLl0VA4ckSq9bmZJSxquAVKCIXz9N
 ymqT7DAK9xOtneF1n6Z93crqY/kisys=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-W4Eo0drcNKCmDaSiXXOwzw-1; Mon, 08 Jun 2020 08:55:13 -0400
X-MC-Unique: W4Eo0drcNKCmDaSiXXOwzw-1
Received: by mail-wr1-f70.google.com with SMTP id t5so7102093wro.20
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2020 05:55:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=y8FZiQIg0Vbw2mwm4f2z++ZH4lwvvJ+VLpDggeECuYc=;
 b=RQlYq8ExW9K4QALvXLi7wLFRw7TSsl7LRHBE9EhwjRUKVCfwZ8erebftdRqRgvq3v6
 4wC4wql9q7F9aE1oCWJcjPOKZ1E8WE5Z22fZJ7jJAyNM2q5cYFV18CE0SKDdrwdiGsU8
 UHjwJfJfFeA2smZgRR7g7EB/d4s+YY3aspHA1Yt+TmypO81G49+Kxp3G3spep4jYH7BH
 p1+6sRvPYaCBsHgqMkbOHxpyrdprq+gNU/tdwb2xatck6zN3uIlVtGhPzdC8BA4tExL5
 ZQ1KgSsLsf+ZiYUJb/grpNTnEpiWv0U1LcpCX1qsXd/jUJ/vckv4dy3jH6ZgFYXnpFvu
 wRlg==
X-Gm-Message-State: AOAM533wHYCocpmKqSKfMWYfYX0BAejPUFNDwUW1MAzU/qqRQh6dyV06
 87fIrYnonkTNjRqFKenI6d2K5rHNt18EaFnfvaNyuohmpS6S+9myixWAWNlVea76eIRyJBWPN1m
 2zEADpYOwsz6e
X-Received: by 2002:adf:dcd2:: with SMTP id x18mr23120284wrm.258.1591620911521; 
 Mon, 08 Jun 2020 05:55:11 -0700 (PDT)
X-Received: by 2002:adf:dcd2:: with SMTP id x18mr23120256wrm.258.1591620911236; 
 Mon, 08 Jun 2020 05:55:11 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 n23sm22052953wmc.21.2020.06.08.05.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 05:55:10 -0700 (PDT)
Date: Mon, 8 Jun 2020 08:55:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v4] numa: forbid '-numa node,mem' for 5.1 and newer
 machine types
Message-ID: <20200608085442-mutt-send-email-mst@kernel.org>
References: <20200608120344.728549-1-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200608120344.728549-1-imammedo@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mst@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 01:20:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001,
 URIBL_SBL=1.623, URIBL_SBL_A=0.1 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, libvir-list@redhat.com,
 Michal Privoznik <mprivozn@redhat.com>, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, marcel.apfelbaum@gmail.com,
 pbonzini@redhat.com, david@gibson.dropbear.id.au, eblake@redhat.com,
 rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G1NDdzgNbxLM

On Mon, Jun 08, 2020 at 08:03:44AM -0400, Igor Mammedov wrote:
> Deprecation period is run out and it's a time to flip the switch
> introduced by cd5ff8333a.  Disable legacy option for new machine
> types (since 5.1) and amend documentation.
> 
> '-numa node,memdev' shall be used instead of disabled option
> with new machine types.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>


numa things so I'm guessing Eduardo's tree?

> ---
> v1:
>  - rebased on top of current master
>  - move compat mode from 4.2 to 5.0
> v2:
>  - move deprection text to recently removed section
> v3:
>  - increase title line length for (deprecated.rst)
>      '``-numa node,mem=``\ *size* (removed in 5.1)'
> v4:
>  - use error_append_hint() for suggesting valid CLI
> 
> CC: peter.maydell@linaro.org
> CC: ehabkost@redhat.com
> CC: marcel.apfelbaum@gmail.com
> CC: mst@redhat.com
> CC: pbonzini@redhat.com
> CC: rth@twiddle.net
> CC: david@gibson.dropbear.id.au
> CC: libvir-list@redhat.com
> CC: qemu-arm@nongnu.org
> CC: qemu-ppc@nongnu.org
> CC: eblake@redhat.com
> CC: groug@kaod.org
> ---
>  docs/system/deprecated.rst | 37 ++++++++++++++++++++-----------------
>  hw/arm/virt.c              |  2 +-
>  hw/core/numa.c             |  7 +++++++
>  hw/i386/pc.c               |  1 -
>  hw/i386/pc_piix.c          |  1 +
>  hw/i386/pc_q35.c           |  1 +
>  hw/ppc/spapr.c             |  2 +-
>  qemu-options.hx            |  9 +++++----
>  8 files changed, 36 insertions(+), 24 deletions(-)
> 
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index 544ece0a45..e74a5717c8 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -101,23 +101,6 @@ error in the future.
>  The ``-realtime mlock=on|off`` argument has been replaced by the
>  ``-overcommit mem-lock=on|off`` argument.
>  
> -``-numa node,mem=``\ *size* (since 4.1)
> -'''''''''''''''''''''''''''''''''''''''
> -
> -The parameter ``mem`` of ``-numa node`` is used to assign a part of
> -guest RAM to a NUMA node. But when using it, it's impossible to manage specified
> -RAM chunk on the host side (like bind it to a host node, setting bind policy, ...),
> -so guest end-ups with the fake NUMA configuration with suboptiomal performance.
> -However since 2014 there is an alternative way to assign RAM to a NUMA node
> -using parameter ``memdev``, which does the same as ``mem`` and adds
> -means to actualy manage node RAM on the host side. Use parameter ``memdev``
> -with *memory-backend-ram* backend as an replacement for parameter ``mem``
> -to achieve the same fake NUMA effect or a properly configured
> -*memory-backend-file* backend to actually benefit from NUMA configuration.
> -In future new machine versions will not accept the option but it will still
> -work with old machine types. User can check QAPI schema to see if the legacy
> -option is supported by looking at MachineInfo::numa-mem-supported property.
> -
>  ``-numa`` node (without memory specified) (since 4.1)
>  '''''''''''''''''''''''''''''''''''''''''''''''''''''
>  
> @@ -516,3 +499,23 @@ long starting at 1MiB, the old command::
>  can be rewritten as::
>  
>    qemu-nbd -t --image-opts driver=raw,offset=1M,size=100M,file.driver=qcow2,file.file.driver=file,file.file.filename=file.qcow2
> +
> +Command line options
> +--------------------
> +
> +``-numa node,mem=``\ *size* (removed in 5.1)
> +''''''''''''''''''''''''''''''''''''''''''''
> +
> +The parameter ``mem`` of ``-numa node`` is used to assign a part of
> +guest RAM to a NUMA node. But when using it, it's impossible to manage specified
> +RAM chunk on the host side (like bind it to a host node, setting bind policy, ...),
> +so guest end-ups with the fake NUMA configuration with suboptiomal performance.
> +However since 2014 there is an alternative way to assign RAM to a NUMA node
> +using parameter ``memdev``, which does the same as ``mem`` and adds
> +means to actualy manage node RAM on the host side. Use parameter ``memdev``
> +with *memory-backend-ram* backend as an replacement for parameter ``mem``
> +to achieve the same fake NUMA effect or a properly configured
> +*memory-backend-file* backend to actually benefit from NUMA configuration.
> +In future new machine versions will not accept the option but it will still
> +work with old machine types. User can check QAPI schema to see if the legacy
> +option is supported by looking at MachineInfo::numa-mem-supported property.
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 37462a6f78..063d4703f7 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2262,7 +2262,6 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      hc->pre_plug = virt_machine_device_pre_plug_cb;
>      hc->plug = virt_machine_device_plug_cb;
>      hc->unplug_request = virt_machine_device_unplug_request_cb;
> -    mc->numa_mem_supported = true;
>      mc->nvdimm_supported = true;
>      mc->auto_enable_numa_with_memhp = true;
>      mc->default_ram_id = "mach-virt.ram";
> @@ -2375,6 +2374,7 @@ DEFINE_VIRT_MACHINE_AS_LATEST(5, 1)
>  static void virt_machine_5_0_options(MachineClass *mc)
>  {
>      virt_machine_5_1_options(mc);
> +    mc->numa_mem_supported = true;
>  }
>  DEFINE_VIRT_MACHINE(5, 0)
>  
> diff --git a/hw/core/numa.c b/hw/core/numa.c
> index 316bc50d75..7814e646e4 100644
> --- a/hw/core/numa.c
> +++ b/hw/core/numa.c
> @@ -117,6 +117,13 @@ static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
>      }
>  
>      if (node->has_mem) {
> +        if (!mc->numa_mem_supported) {
> +            error_setg(errp, "Parameter -numa node,mem is not supported by this"
> +                      " machine type");
> +            error_append_hint(errp, "Use -numa node,memdev instead");
> +            return;
> +        }
> +
>          numa_info[nodenr].node_mem = node->mem;
>          if (!qtest_enabled()) {
>              warn_report("Parameter -numa node,mem is deprecated,"
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 2128f3d6fe..a86136069c 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1960,7 +1960,6 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>      hc->unplug = pc_machine_device_unplug_cb;
>      mc->default_cpu_type = TARGET_DEFAULT_CPU_TYPE;
>      mc->nvdimm_supported = true;
> -    mc->numa_mem_supported = true;
>      mc->default_ram_id = "pc.ram";
>  
>      object_class_property_add(oc, PC_MACHINE_DEVMEM_REGION_SIZE, "int",
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index f66e1d73ce..8955436efa 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -438,6 +438,7 @@ static void pc_i440fx_5_0_machine_options(MachineClass *m)
>      pc_i440fx_5_1_machine_options(m);
>      m->alias = NULL;
>      m->is_default = false;
> +    m->numa_mem_supported = true;
>      compat_props_add(m->compat_props, hw_compat_5_0, hw_compat_5_0_len);
>      compat_props_add(m->compat_props, pc_compat_5_0, pc_compat_5_0_len);
>  }
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 4ba8ac8774..af6b32adb7 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -366,6 +366,7 @@ static void pc_q35_5_0_machine_options(MachineClass *m)
>  {
>      pc_q35_5_1_machine_options(m);
>      m->alias = NULL;
> +    m->numa_mem_supported = true;
>      compat_props_add(m->compat_props, hw_compat_5_0, hw_compat_5_0_len);
>      compat_props_add(m->compat_props, pc_compat_5_0, pc_compat_5_0_len);
>  }
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 3b1a5ed865..210d61d1b3 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4511,7 +4511,6 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
>       * in which LMBs are represented and hot-added
>       */
>      mc->numa_mem_align_shift = 28;
> -    mc->numa_mem_supported = true;
>      mc->auto_enable_numa = true;
>  
>      smc->default_caps.caps[SPAPR_CAP_HTM] = SPAPR_CAP_OFF;
> @@ -4599,6 +4598,7 @@ static void spapr_machine_5_0_class_options(MachineClass *mc)
>  {
>      spapr_machine_5_1_class_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_5_0, hw_compat_5_0_len);
> +    mc->numa_mem_supported = true;
>  }
>  
>  DEFINE_SPAPR_MACHINE(5_0, "5.0", false);
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 93bde2bbc8..196f468786 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -239,10 +239,11 @@ SRST
>          -numa node,nodeid=0 -numa node,nodeid=1 \
>          -numa cpu,node-id=0,socket-id=0 -numa cpu,node-id=1,socket-id=1
>  
> -    '\ ``mem``\ ' assigns a given RAM amount to a node. '\ ``memdev``\ '
> -    assigns RAM from a given memory backend device to a node. If
> -    '\ ``mem``\ ' and '\ ``memdev``\ ' are omitted in all nodes, RAM is
> -    split equally between them.
> +    Legacy '\ ``mem``\ ' assigns a given RAM amount to a node (not supported
> +    for 5.1 and newer machine types). '\ ``memdev``\ ' assigns RAM from
> +    a given memory backend device to a node. If '\ ``mem``\ ' and
> +    '\ ``memdev``\ ' are omitted in all nodes, RAM is split equally between them.
> +
>  
>      '\ ``mem``\ ' and '\ ``memdev``\ ' are mutually exclusive.
>      Furthermore, if one node uses '\ ``memdev``\ ', all of them have to
> -- 
> 2.26.2

