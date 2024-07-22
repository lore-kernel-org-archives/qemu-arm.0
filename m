Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1920381njc;
        Mon, 22 Jul 2024 06:38:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV96+M708KBOYSKbPHevrr06iu74YjWU43sQ9cJCRsMzB4W7n+eDpT1y15n43AKe7ltREot3Frt5rNoLTdaRj5tojYPXD/V
X-Google-Smtp-Source: AGHT+IH1ebBiU9IBCRBHwVQIYllWrENk5JDDVG2ab6DQ+gtOThPg8kDFmBw7PZhVjBfFcNpvSmhR
X-Received: by 2002:a05:690c:4706:b0:64b:a57:8441 with SMTP id 00721157ae682-66ad8fb99cbmr70824917b3.19.1721655492560;
        Mon, 22 Jul 2024 06:38:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721655492; cv=none;
        d=google.com; s=arc-20160816;
        b=yaLAR4wD3zrRm+FErFhuIPHGo2TeRw+QfcJx8tlHL77tog491pZ866UIrgKdmL13On
         uZ0bhJ0PcMUGwVT+2XzHo22hbWwjjYAPAVliB1do/RwSnnpDfLW5gsXHsdZF4MV5Af2q
         4dmJwKdYaGsQZsc5ENURUZx0L03GsBCWKs9y3BGGZ0KCYCTD5noNyiKk6F/h0uPtdcWU
         R4bP3tHBO3AFZ8S3cDqqq4Js/99R8DVaVdEB3If+OxzTmk9pHiN9mqrGi5KWSqPo420Z
         +0d7sik2YnJV8kGCrw96GiWUax0faaYL3SsYEwDhcJwPFrswX0ZHchTfFCbZ+XAV8kGD
         XmbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:dkim-signature;
        bh=9EiBCLqkK09Y1BVxrLWcGqAzYTQfgigTA0WYXbrnHsM=;
        fh=YtMdrrrL4AdjARoXd5Fxw8LjXJzXSJRO9dQYlO5BjO8=;
        b=hjuGsCUqn1IcAtZlhZ1TyUKGAnM+ZzCO/5qQfSYLrCjO+gMKN0/hQmApNKdYFfdbA4
         wI5gGxPSgQFO0lUBsxZrzVZ8z0YtCO9rS0FTQO3TE/5GnrDBjMgbL5lI6n7fnfirZuRV
         BogRL0iAMp2fozjQ4CdGbuQmvo1o/YwP+lszA8fkv6jWgl9/jR37ypCdG3IYDG2SGa23
         +oyaoyEITwbMSK8ecpcyEiXZOfowfWedE2i62nl8ImIdZc//jXUU0t8e3OrfgiYTSAes
         dU8ME0sIhs4ceCl6M8CVllOpgN2MeR/GvLMcahIbqBCzYHUn00hpcsuDaZnVo6TFciHW
         +J/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="bMk9Um/S";
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7a1990935aasi793850185a.652.2024.07.22.06.38.12
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 06:38:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="bMk9Um/S";
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721655492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9EiBCLqkK09Y1BVxrLWcGqAzYTQfgigTA0WYXbrnHsM=;
	b=bMk9Um/S4ylAO6LhuVaEaSRWbYkIsTH9ozr1l8qZelJ3uxPHZnWmBXwq4f5Np4Y4idxoRN
	mzgbVljuB3DZyIPHR1vYqQ1qWTAseTuPnRVG2NZoRgmS7O9zcWLMPQ2fQ2eyHjGth2H51w
	xvHg5V0MDwrbPCyUJZjDWkO6ff0hPqI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-217-YUk80kGdPXGEVKtTCjXqAQ-1; Mon,
 22 Jul 2024 09:38:06 -0400
X-MC-Unique: YUk80kGdPXGEVKtTCjXqAQ-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5BF23196E0A0;
	Mon, 22 Jul 2024 13:37:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.65])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D52391944AA4;
	Mon, 22 Jul 2024 13:37:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id AB0FB21E669B; Mon, 22 Jul 2024 15:37:43 +0200 (CEST)
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
Subject: Re: [PATCH 8/8] qemu-options: Add the description of smp-cache object
In-Reply-To: <20240704031603.1744546-9-zhao1.liu@intel.com> (Zhao Liu's
	message of "Thu, 4 Jul 2024 11:16:03 +0800")
References: <20240704031603.1744546-1-zhao1.liu@intel.com>
	<20240704031603.1744546-9-zhao1.liu@intel.com>
Date: Mon, 22 Jul 2024 15:37:43 +0200
Message-ID: <87r0bl35ug.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: JrKIubcKUBXe

Zhao Liu <zhao1.liu@intel.com> writes:

> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>

This patch is just documentation.  The code got added in some previous
patch.  Would it make sense to squash this patch into that previous
patch?

> ---
> Changes since RFC v2:
>  * Rewrote the document of smp-cache object.
>
> Changes since RFC v1:
>  * Use "*_cache=topo_level" as -smp example as the original "level"
>    term for a cache has a totally different meaning. (Jonathan)
> ---
>  qemu-options.hx | 58 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 8ca7f34ef0c8..4b84f4508a6e 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -159,6 +159,15 @@ SRST
>          ::
>  
>              -machine cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=128G,cxl-fmw.0.interleave-granularity=512
> +
> +    ``smp-cache='id'``
> +        Allows to configure cache property (now only the cache topology level).
> +
> +        For example:
> +        ::
> +
> +            -object '{"qom-type":"smp-cache","id":"cache","caches":[{"name":"l1d","topo":"core"},{"name":"l1i","topo":"core"},{"name":"l2","topo":"module"},{"name":"l3","topo":"die"}]}'
> +            -machine smp-cache=cache
>  ERST
>  
>  DEF("M", HAS_ARG, QEMU_OPTION_M,
> @@ -5871,6 +5880,55 @@ SRST
>          ::
>  
>              (qemu) qom-set /objects/iothread1 poll-max-ns 100000
> +
> +    ``-object '{"qom-type":"smp-cache","id":id,"caches":[{"name":cache_name,"topo":cache_topo}]}'``
> +        Create an smp-cache object that configures machine's cache
> +        property. Currently, cache property only include cache topology
> +        level.
> +
> +        This option must be written in JSON format to support JSON list.

Why?

> +
> +        The ``caches`` parameter accepts a list of cache property in JSON
> +        format.
> +
> +        A list element requires the cache name to be specified in the
> +        ``name`` parameter (currently ``l1d``, ``l1i``, ``l2`` and ``l3``
> +        are supported). ``topo`` parameter accepts CPU topology levels
> +        including ``thread``, ``core``, ``module``, ``cluster``, ``die``,
> +        ``socket``, ``book``, ``drawer`` and ``default``. The ``topo``
> +        parameter indicates CPUs winthin the same CPU topology container
> +        are sharing the same cache.
> +
> +        Some machines may have their own cache topology model, and this
> +        object may override the machine-specific cache topology setting
> +        by specifying smp-cache object in the -machine. When specifying
> +        the cache topology level of ``default``, it will honor the default
> +        machine-specific cache topology setting. For other topology levels,
> +        they will override the default setting.
> +
> +        An example list of caches to configure the cache model (l1d cache
> +        per core, l1i cache per core, l2 cache per module and l3 cache per
> +        socket) supported by PC machine might look like:
> +
> +        ::
> +
> +              {
> +                "caches": [
> +                   { "name": "l1d", "topo": "core" },
> +                   { "name": "l1i", "topo": "core" },
> +                   { "name": "l2", "topo": "module" },
> +                   { "name": "l3", "topo": "socket" },
> +                ]
> +              }
> +
> +        An example smp-cache object would look like:()
> +
> +        .. parsed-literal::
> +
> +             # |qemu_system| \\
> +                 ... \\
> +                 -object '{"qom-type":"smp-cache","id":id,"caches":[{"name":cache_name,"topo":cache_topo}]}' \\
> +                 ...
>  ERST
