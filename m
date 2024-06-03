Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp2195240ejs;
        Mon, 3 Jun 2024 05:25:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU6QZbQQSjGKMa0L6EwFVXT3UvW2zq4WxYh+/xmz14M2b/rTndWTd8UyVQYI3rnQ1tnXHhXNfXhGej2Zu4j5tA7uGAjQFE2
X-Google-Smtp-Source: AGHT+IFwnpoeQ1dZ8/FegyzLatXhsL/SK27lG0xtpAwojUZ/xmaTbWAj29Nh2UnFg+g3071l590t
X-Received: by 2002:a05:622a:86:b0:43a:bd5b:9657 with SMTP id d75a77b69052e-43ff35ea62amr144859911cf.1.1717417544224;
        Mon, 03 Jun 2024 05:25:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717417544; cv=none;
        d=google.com; s=arc-20160816;
        b=bumomqyCw2agsiRkWVP1HF/PVzpm9V3piIHuw5J2lB5u0yeW3pwA5fz6vnxmh6s+mT
         tloa2a/J1fwOdD/puHLHRzllwqY/cx3pk33gZmqRZTyhHzrf1x2Q53LP7UMxn+wj41Dl
         n4zS3OQHSr3NR/T0Qgh8ZVk/LqOIt0h3Eo+6X38SDM3N9rTCVgEOWW95VouLXKF8ZsNS
         mZ6Y0aLwTbxu3iQE50TG5E1l/+LwE+dmnz0VNhZNQv28wYvdt5XVgrKZOi4iVaABu60w
         gRXi9MFYHpa1fBgg1XXRqEKvt4gkDJlBfhxmwwNGIKc6lh5ZM/4ZoRnJA5OG8m7ZGF2G
         c09A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:dkim-signature;
        bh=Efb5Ek9FsC2ECwoOU3U6omc2wMgF8Ch8l1dKcamqGD4=;
        fh=ujysKwa6rx4+gtGey8vmbawwkmI8E4Ro1x/g9ayUrWU=;
        b=uQAJRFUDS3074pkaiWU8cOam5I1ADfLvsRbqSR9X3GfxiCU5Kec/LjNzMWSlDfGaZ5
         fUcVfuxTihliLv+nMkZGJjDH4BQuyJy8ru9vNTUAE5Wz9QzS2DYrHXO4oEXODTBdDPgK
         u2YsQFQAj2kHqi7f2MduPrj8yc9Rjl1PMg4kDODq/NgAuPxfaqrWQIS2841NXrh3mezr
         yqgXTFe+Q3iIVh2RQWOUgBNnR9/QRCbOWJN6gVQ6pZAKe1r0hnC7LfcoMZPn1vccLHCN
         m/6zu4U9lOOKWyTi9IxlaJSLuNA2bkH2LnS05iBi/jBtrlRakrRQYA4rAoYoKTj/qHm1
         XZWQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ajMUk+kZ;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-43ff2466956si83510501cf.368.2024.06.03.05.25.43
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 05:25:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ajMUk+kZ;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717417543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Efb5Ek9FsC2ECwoOU3U6omc2wMgF8Ch8l1dKcamqGD4=;
	b=ajMUk+kZEJJwabOWmTajF64rPpaT4EKeqtURD6/ZL834Bey/ncML8koXncU25gWottjKQ9
	6BjYIZjv4wnUwsYgzFTRoIkla95x2g+eiyKxWe6ykNNcr0MzGOyRKqEDb8DsDSiuLLYG4z
	rUZGzWclRnzYuh6yCgB1efMNTXXcWlU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-9n3jOQJNMxmz9d8CAE3qzw-1; Mon, 03 Jun 2024 08:25:38 -0400
X-MC-Unique: 9n3jOQJNMxmz9d8CAE3qzw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64875101A54F;
	Mon,  3 Jun 2024 12:25:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.93])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 18AFD40147E;
	Mon,  3 Jun 2024 12:25:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 3F38D21E66E5; Mon,  3 Jun 2024 14:25:36 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Daniel P . =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Eduardo
 Habkost
 <eduardo@habkost.net>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Yanan Wang
 <wangyanan55@huawei.com>,  "Michael S . Tsirkin" <mst@redhat.com>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Eric Blake <eblake@redhat.com>,  Markus
 Armbruster <armbru@redhat.com>,  Marcelo Tosatti <mtosatti@redhat.com>,
  Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,  Peter Maydell
 <peter.maydell@linaro.org>,  Jonathan Cameron
 <Jonathan.Cameron@huawei.com>,  Sia Jee Heng
 <jeeheng.sia@starfivetech.com>,  qemu-devel@nongnu.org,
  kvm@vger.kernel.org,  qemu-riscv@nongnu.org,  qemu-arm@nongnu.org,
  Zhenyu Wang <zhenyu.z.wang@intel.com>,  Dapeng Mi
 <dapeng1.mi@linux.intel.com>,  Yongwei Ma <yongwei.ma@intel.com>
Subject: Re: [RFC v2 1/7] hw/core: Make CPU topology enumeration arch-agnostic
In-Reply-To: <20240530101539.768484-2-zhao1.liu@intel.com> (Zhao Liu's message
	of "Thu, 30 May 2024 18:15:33 +0800")
References: <20240530101539.768484-1-zhao1.liu@intel.com>
	<20240530101539.768484-2-zhao1.liu@intel.com>
Date: Mon, 03 Jun 2024 14:25:36 +0200
Message-ID: <87plsyfc1r.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-TUID: s2nSrzgkJSNQ

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
> helpers for topology enumeration and string conversion.
>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>

[...]

> diff --git a/qapi/machine.json b/qapi/machine.json
> index bce6e1bbc412..7ac5a05bb9c9 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1667,6 +1667,46 @@
>       '*reboot-timeout': 'int',
>       '*strict': 'bool' } }
>  
> +##
> +# @CPUTopoLevel:

I understand you're moving existing enum CPUTopoLevel into the QAPI
schema.  I think the idiomatic QAPI name would be CpuTopologyLevel.
Would you be willing to rename it, or would that be too much churn?

> +#
> +# An enumeration of CPU topology levels.
> +#
> +# @invalid: Invalid topology level, used as a placeholder.
> +#
> +# @thread: thread level, which would also be called SMT level or logical
> +#     processor level. The @threads option in -smp is used to configure
> +#     the topology of this level.
> +#
> +# @core: core level. The @cores option in -smp is used to configure the
> +#     topology of this level.
> +#
> +# @module: module level. The @modules option in -smp is used to
> +#     configure the topology of this level.
> +#
> +# @cluster: cluster level. The @clusters option in -smp is used to
> +#     configure the topology of this level.
> +#
> +# @die: die level. The @dies option in -smp is used to configure the
> +#     topology of this level.
> +#
> +# @socket: socket level, which would also be called package level. The
> +#     @sockets option in -smp is used to configure the topology of this
> +#     level.
> +#
> +# @book: book level. The @books option in -smp is used to configure the
> +#     topology of this level.
> +#
> +# @drawer: drawer level. The @drawers option in -smp is used to
> +#     configure the topology of this level.

docs/devel/qapi-code-gen.rst section Documentation markup:

    For legibility, wrap text paragraphs so every line is at most 70
    characters long.

    Separate sentences with two spaces.

> +#
> +# Since: 9.1
> +##
> +{ 'enum': 'CPUTopoLevel',
> +  'prefix': 'CPU_TOPO_LEVEL',
> +  'data': [ 'invalid', 'thread', 'core', 'module', 'cluster',
> +            'die', 'socket', 'book', 'drawer' ] }
> +
>  ##
>  # @SMPConfiguration:
>  #

[...]
