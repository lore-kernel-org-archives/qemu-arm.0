Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1913385njc;
        Mon, 22 Jul 2024 06:25:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVPhFQgaRoy0EAqA09Y5lciEPrtebFxct0pfqvHkCeKL7/ZDursrj3k3JnFtn9cEfijMxc0l6T8lwCLtzdkRpxC5jJZDRe2
X-Google-Smtp-Source: AGHT+IFjE13+xRo9rG5+1AOsd8EjvM/77zzHqquH1UhY8STIhOcytNuXeZMdq4yOo/wYyWCkKMN3
X-Received: by 2002:a05:622a:288:b0:444:f6d2:be89 with SMTP id d75a77b69052e-44f96a19de9mr183555581cf.5.1721654755201;
        Mon, 22 Jul 2024 06:25:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721654755; cv=none;
        d=google.com; s=arc-20160816;
        b=PS/ec8yx9P6yIREZfiuHp2uJheWLUB5GHfIQi8W8526P0myjryxSgCeJ74lRjvzqbx
         AHGMB1hLislY886+kv/KOEBguJoVF6Hhfpuj1Ln33zFheKRP/sfCf+z15RU/QZD5SqeO
         AAm/wRsQuBo8T5jqfUZ1HqZiF3IUg6QVMCHfmbz9+DOhQmaMEs19M6px+6Jez0zOJe7h
         zNglmt7NiTfjodbPADaLIWE/OM+Ys5gp49PoGqU9qvrv5RjoLlKzf4COktcSfhgS2w/M
         bflO6cfvkjndPfMWjcq7XOAZf87hAUwYtlrzgqip5MBzEy5zXqKg9hRhKWE1zIaTyYAZ
         CvVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:dkim-signature;
        bh=04tgYp28H6fbQsDrXzcIGR3NEN71W7VaA3H2XpdKMHI=;
        fh=YtMdrrrL4AdjARoXd5Fxw8LjXJzXSJRO9dQYlO5BjO8=;
        b=M2oK0FwPQorfqonrv84aHeWFRbWCJ9Zfcx5UaAqDCUtvWX/Uq8WPpCfQKScARPDDP2
         WVjpap+KSCIKtrtSSSVHyOrtWhZiGI/338zVMeoIQGxdgt9Tq2Zk0apjxUBIy5TTXlXv
         TMh1nsuode9YmZ+xTz1ASRm09ZS28NzFioovGdm9Upb5yxM82ms7udWI068eETtFwDCv
         S/iD74UO9/MjD/vyTRr7+IhiKna5yZA9H+XaF5v/389ns83GH3ynAE9R/higEYFURSGz
         rkNRnDKAVLS7DC912ISsaJN4EJnoBLWMkco2SN+KEUDVLf7BZ1WufT642HGoV+8mGk9b
         IKBQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="JG925O7/";
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-44f9cf12c13si77102021cf.742.2024.07.22.06.25.55
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 06:25:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="JG925O7/";
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721654754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=04tgYp28H6fbQsDrXzcIGR3NEN71W7VaA3H2XpdKMHI=;
	b=JG925O7/GEa/7g3WHLtgjqw5G4kBArDvWcdV+RLxKYoeHFFuqergHxPCjlNWjTJ9wop7os
	aiDdDduBVHMXtHUrADB95vKlxOzNlrKAvF8ywOpUBKU2EtmC7uNX8zBD6++2U7AQTBNn0/
	MG7EiNb/29r7jRHTb3Ydp4kuJG93A+w=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-157-t16BuqhTMX6bzZ0XjL_oaw-1; Mon,
 22 Jul 2024 09:25:47 -0400
X-MC-Unique: t16BuqhTMX6bzZ0XjL_oaw-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B2CE71978CF2;
	Mon, 22 Jul 2024 13:25:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.65])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 649091932AA9;
	Mon, 22 Jul 2024 13:24:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 60CC721E669B; Mon, 22 Jul 2024 15:24:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Daniel P . =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Eduardo
 Habkost
 <eduardo@habkost.net>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Yanan Wang
 <wangyanan55@huawei.com>,  "Michael S . Tsirkin" <mst@redhat.com>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Eric Blake <eblake@redhat.com>,  Marcelo
 Tosatti <mtosatti@redhat.com>,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
  Peter Maydell <peter.maydell@linaro.org>,  Jonathan Cameron
 <Jonathan.Cameron@huawei.com>,  Sia Jee Heng
 <jeeheng.sia@starfivetech.com>,  qemu-devel@nongnu.org,
  kvm@vger.kernel.org,  qemu-riscv@nongnu.org,  qemu-arm@nongnu.org,
  Zhenyu Wang <zhenyu.z.wang@intel.com>,  Dapeng Mi
 <dapeng1.mi@linux.intel.com>,  Yongwei Ma <yongwei.ma@intel.com>
Subject: Re: [PATCH 1/8] hw/core: Make CPU topology enumeration arch-agnostic
In-Reply-To: <20240704031603.1744546-2-zhao1.liu@intel.com> (Zhao Liu's
	message of "Thu, 4 Jul 2024 11:15:56 +0800")
References: <20240704031603.1744546-1-zhao1.liu@intel.com>
	<20240704031603.1744546-2-zhao1.liu@intel.com>
Date: Mon, 22 Jul 2024 15:24:24 +0200
Message-ID: <875xsx4l13.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: VQH10UMZ+QA8

One little thing...

Zhao Liu <zhao1.liu@intel.com> writes:

> Cache topology needs to be defined based on CPU topology levels. Thus,
> define CPU topology enumeration in qapi/machine.json to make it generic
> for all architectures.
>
> To match the general topology naming style, rename CPU_TOPO_LEVEL_SMT
> and CPU_TOPO_LEVEL_PACKAGE to CPU_TOPO_LEVEL_THREAD and
> CPU_TOPO_LEVEL_SOCKET.
>
> Also, enumerate additional topology levels for non-i386 arches, and add
> a CPU_TOPO_LEVEL_DEFAULT to help future smp-cache object de-compatibilize
> arch-specific cache topology settings.
>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>

[...]

> diff --git a/qapi/machine-common.json b/qapi/machine-common.json
> index fa6bd71d1280..82413c668bdb 100644
> --- a/qapi/machine-common.json
> +++ b/qapi/machine-common.json
> @@ -5,7 +5,7 @@
>  # See the COPYING file in the top-level directory.
>  
>  ##
> -# = Machines S390 data types
> +# = Common machine types
>  ##
>  
>  ##
> @@ -19,3 +19,48 @@
>  { 'enum': 'CpuS390Entitlement',
>    'prefix': 'S390_CPU_ENTITLEMENT',
>    'data': [ 'auto', 'low', 'medium', 'high' ] }
> +
> +##
> +# @CpuTopologyLevel:
> +#
> +# An enumeration of CPU topology levels.
> +#
> +# @invalid: Invalid topology level.
> +#
> +# @thread: thread level, which would also be called SMT level or
> +#     logical processor level.  The @threads option in
> +#     SMPConfiguration is used to configure the topology of this
> +#     level.
> +#
> +# @core: core level.  The @cores option in SMPConfiguration is used
> +#     to configure the topology of this level.
> +#
> +# @module: module level.  The @modules option in SMPConfiguration is
> +#     used to configure the topology of this level.
> +#
> +# @cluster: cluster level.  The @clusters option in SMPConfiguration
> +#     is used to configure the topology of this level.
> +#
> +# @die: die level.  The @dies option in SMPConfiguration is used to
> +#     configure the topology of this level.
> +#
> +# @socket: socket level, which would also be called package level.
> +#     The @sockets option in SMPConfiguration is used to configure
> +#     the topology of this level.
> +#
> +# @book: book level.  The @books option in SMPConfiguration is used
> +#     to configure the topology of this level.
> +#
> +# @drawer: drawer level.  The @drawers option in SMPConfiguration is
> +#     used to configure the topology of this level.
> +#
> +# @default: default level.  Some architectures will have default
> +#     topology settings (e.g., cache topology), and this special
> +#     level means following the architecture-specific settings.
> +#
> +# Since: 9.1
> +##
> +{ 'enum': 'CpuTopologyLevel',
> +  'prefix': 'CPU_TOPO_LEVEL',

Why set a 'prefix'?

> +  'data': [ 'invalid', 'thread', 'core', 'module', 'cluster',
> +            'die', 'socket', 'book', 'drawer', 'default' ] }

[...]
