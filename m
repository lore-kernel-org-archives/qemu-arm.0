Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp2799413ejs;
        Tue, 4 Jun 2024 01:55:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUSVlMHivq60l56CvSlJoRQkqv1fvoEig5GMBGf6KUu57De0bjm/nKqtOaGTUd/ZUrzGWuhOuIEo+VyugXrwrA4zOaGBiOp
X-Google-Smtp-Source: AGHT+IHuKFpAQVosvJ6PDWd1lwbBFCM+diceOo3K4Cns1GqxUGs7d2KK4IVS6r+GNy2loEm+2cov
X-Received: by 2002:a05:620a:2197:b0:792:93cb:7649 with SMTP id af79cd13be357-794f5ed422bmr1246183285a.68.1717491301516;
        Tue, 04 Jun 2024 01:55:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717491301; cv=none;
        d=google.com; s=arc-20160816;
        b=szD2mUF9fr1Y+bdM0ALFNif4i4JGfyO+TjQjMqfLOZViojFvcRLMuR/7paUvAllI45
         YCFhAkTxwunAuoMcYxmaPvAbUzfVr8YYtpObqjB1cS7+iKMWVlCSPb54fB1a5HnNpVa/
         KMiwbZcrKbHMXAvTtuxctEuwOB0tUmRr4H1ea++o5qct7D+6H5JMe+TcCGdjt4iKwjnB
         5jAxo6/e29t2a/TfdEcc5pFvjfTuBS1nSospossvLRDELTURAz1lgUkm6q05FmbdFC60
         Ev5MVyUuJIeXdNXn6ZtceFdHEYjS5H1qmlhBWIJn7quKECOVDu7QuJzMnLtbjLfwiWu4
         5uEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:dkim-signature;
        bh=7Kh6eB6FJO7y29jcT+D89kAQxKrmCwTX41ilLKqtUEQ=;
        fh=YtMdrrrL4AdjARoXd5Fxw8LjXJzXSJRO9dQYlO5BjO8=;
        b=neiqVwYSEnzUWhptIyGCXaydpiNXSUkHDla9ELsPVfyp8zcMN1jl9f8wN7tWFRFcB6
         DMsmub40c9lQ08kkCTtRa0ZD14IYuOHltfAWo6MBD0IJix8snngxtot1vkCpWlPwwddn
         H6KdxFCMgbszF+RloGxefKEElD5QjQUYSLmA7vKQmyiys1qfw+2XMMT4yWdWPTJkYcg/
         kRsvV3dPPlKLLP0eSm5HhBDiKhHeUL7Dgp4GcdQ8bS67XAmI5sve1uGGft2G0rX5M5p+
         TXG4b8ha04rEG7/0yIWsuH0KYL9phzcKi0JJKTBLThB9ND3yA5B/ivvtXUYol4kNFh8b
         k7Fw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Bk9apW5G;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-794f3062d31si1029352385a.372.2024.06.04.01.55.01
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 01:55:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Bk9apW5G;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717491301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7Kh6eB6FJO7y29jcT+D89kAQxKrmCwTX41ilLKqtUEQ=;
	b=Bk9apW5G2izQhvvvt0camw0zjPdrYI55YIx+z/a/wed6f6iJC392UydsZofrm8Oij/pRkA
	DsHWEmElQDF49JggySVTHHHbeHqMf2xTV8f8SoIxmD6KR7PQmvueFu9Ha9gKC5tB3xcDki
	1m4PeVSwNkK8tfoH7ttiO27Nr2eaMdU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-m6nBrRR1Plq-R6WoAWdtFA-1; Tue, 04 Jun 2024 04:54:54 -0400
X-MC-Unique: m6nBrRR1Plq-R6WoAWdtFA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5831D8025EF;
	Tue,  4 Jun 2024 08:54:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.93])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5656E3C23;
	Tue,  4 Jun 2024 08:54:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 6349221E6757; Tue,  4 Jun 2024 10:54:51 +0200 (CEST)
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
Subject: Re: [RFC v2 3/7] hw/core: Add cache topology options in -smp
In-Reply-To: <20240530101539.768484-4-zhao1.liu@intel.com> (Zhao Liu's message
	of "Thu, 30 May 2024 18:15:35 +0800")
References: <20240530101539.768484-1-zhao1.liu@intel.com>
	<20240530101539.768484-4-zhao1.liu@intel.com>
Date: Tue, 04 Jun 2024 10:54:51 +0200
Message-ID: <87sext9jfo.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-TUID: bJO30zPWW2jO

Zhao Liu <zhao1.liu@intel.com> writes:

> Add "l1d-cache", "l1i-cache". "l2-cache", and "l3-cache" options in
> -smp to define the cache topology for SMP system.
>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>

[...]

> diff --git a/qapi/machine.json b/qapi/machine.json
> index 7ac5a05bb9c9..8fa5af69b1bf 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1746,6 +1746,23 @@
>  #
>  # @threads: number of threads per core
>  #
> +# @l1d-cache: topology hierarchy of L1 data cache. It accepts the CPU
> +#     topology enumeration as the parameter, i.e., CPUs in the same
> +#     topology container share the same L1 data cache. (since 9.1)
> +#
> +# @l1i-cache: topology hierarchy of L1 instruction cache. It accepts
> +#     the CPU topology enumeration as the parameter, i.e., CPUs in the
> +#     same topology container share the same L1 instruction cache.
> +#     (since 9.1)
> +#
> +# @l2-cache: topology hierarchy of L2 unified cache. It accepts the CPU
> +#     topology enumeration as the parameter, i.e., CPUs in the same
> +#     topology container share the same L2 unified cache. (since 9.1)
> +#
> +# @l3-cache: topology hierarchy of L3 unified cache. It accepts the CPU
> +#     topology enumeration as the parameter, i.e., CPUs in the same
> +#     topology container share the same L3 unified cache. (since 9.1)
> +#
>  # Since: 6.1
>  ##

The new members are all optional.  What does "absent" mean?  No such
cache?  Some default topology?

Is this sufficiently general?  Do all machines of interest have a split
level 1 cache, a level 2 cache, and a level 3 cache?

Is the CPU topology level the only cache property we'll want to
configure here?  If the answer isn't "yes", then we should perhaps wrap
it in an object, so we can easily add more members later.

Two spaces between sentences for consistency, please.

>  { 'struct': 'SMPConfiguration', 'data': {
> @@ -1758,7 +1775,11 @@
>       '*modules': 'int',
>       '*cores': 'int',
>       '*threads': 'int',
> -     '*maxcpus': 'int' } }
> +     '*maxcpus': 'int',
> +     '*l1d-cache': 'CPUTopoLevel',
> +     '*l1i-cache': 'CPUTopoLevel',
> +     '*l2-cache': 'CPUTopoLevel',
> +     '*l3-cache': 'CPUTopoLevel' } }
>  
>  ##
>  # @x-query-irq:
> diff --git a/system/vl.c b/system/vl.c

[...]
