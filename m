Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1861980njc;
        Mon, 22 Jul 2024 04:56:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWNCJCnJVQ6HL/yp3svwCnOJM5FRUNgpcH2rc1wpfPn4aUP9lHA+RqOIgxZEO6nxbr1nP2Op9XocQNdh1cKigj5rAM1SgZt
X-Google-Smtp-Source: AGHT+IERM2CqyKwqrbmZ3oiRZNWetP3LexLY5dqXPJ5s7eRVgp7idDWO/jsqQryvYPT4L/fOmJhg
X-Received: by 2002:a05:6214:1bc5:b0:6b2:cf9e:866 with SMTP id 6a1803df08f44-6b9610403d6mr120080466d6.4.1721649381034;
        Mon, 22 Jul 2024 04:56:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721649381; cv=none;
        d=google.com; s=arc-20160816;
        b=amXgc76Wm/QUYLPCxlzCytVt3RHwmQM/9/8oT4B45cLC1aO5MB5tVYHFlQd8/sTTLO
         tdmUPZRIhzeMzY/z396Dw9DiC3hY1+wcilIBsDts7ucD2Rt4rPWspDdgy3hxiscQbdTB
         kuiW7E7FbAj9K6q7nWNBFGS+mJspGvFWFlpm9uEptdJAwLNfDfpwEmxPrmqxv58MYYWE
         W6mt/Cjw4cPOUxs78Fuzxul4Cod62DrvyXsRwZLdUoue7bA4VvkdRqZKzlJe+kRG5DBg
         CH0uGz/U+t0tPU9LwdEWRxLBI2pm2ci5iCTIL4YA73wvTpThOlExQgGOlAdDlDre1d6O
         67nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:dkim-signature;
        bh=lYDl5sIhPvDgTfoHlN8PA/tdUOLQIuS/j96hYp8nn7w=;
        fh=YtMdrrrL4AdjARoXd5Fxw8LjXJzXSJRO9dQYlO5BjO8=;
        b=VT95SMhSAxw08gPWQGDpVtK0DRsdoohhe+2zHDvyDLTLmPw5pC+NeH05GYm6q+mMzA
         huah5GiwzPq1NACNaPBQ8p2c1OtRvqYb0nTMaMbbyTknKK7z7RJIyc8wUxFrqVXl2jWM
         BXsfTqJpicxvN942JrxcnEUfZU2576UnDQrvych45lxAO3iIX5+G9F3Dh+TFcePbXhii
         ZmNsqUabOL2yu/4TU/nzXJjOtOpxXCzFDK8IoKjrvC4D2lkCHbQGxS1hGGp56so817TY
         vyEAUY/+wdLmEX+3G+fwlgC1qPfePyk8xq2SpyBsqh4aDa64UTXQK2O4dzrtH3RmQBln
         0MuQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IEs0ZNWs;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-44f9cdbb70dsi76338061cf.275.2024.07.22.04.56.20
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 04:56:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IEs0ZNWs;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721649380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lYDl5sIhPvDgTfoHlN8PA/tdUOLQIuS/j96hYp8nn7w=;
	b=IEs0ZNWsKkYEvbQrs13trMP0GXI/UU4xcoqlhmP0qjymRIABnStqzsK6VYf5mh0j/bR7UG
	gYAT25EONdUBXo/py1w7DbcEiMJCRB42zWJaHJinx5elsOgbivE4cQ4yxj7Vz7Z5yKcy+d
	dymXsH0lZ9uoeG79kuyKmeMlKzII8aM=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-665-aZ5uOBE9M22_s-WhrSY-7w-1; Mon,
 22 Jul 2024 07:56:15 -0400
X-MC-Unique: aZ5uOBE9M22_s-WhrSY-7w-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1ECAE1944B29;
	Mon, 22 Jul 2024 11:56:12 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.65])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 669573000188;
	Mon, 22 Jul 2024 11:56:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 67E0E21E668F; Mon, 22 Jul 2024 13:56:08 +0200 (CEST)
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
Date: Mon, 22 Jul 2024 13:56:08 +0200
Message-ID: <87wmld4p47.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-TUID: VF0ZMmLsCanr

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

QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>

> ---
> Changes since RFC v2:
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

At some point, we may have to rethink the split between machine.json,
machine-target.json, and machine-common.json.  Not this patch's problem.
