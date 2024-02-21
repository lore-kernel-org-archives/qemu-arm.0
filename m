Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1895754ejb;
        Wed, 21 Feb 2024 04:46:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVMIDwvfGZO3rm7nW4JsvJb1AZqae/ETorQ7yoNUJWRDcZeQ5yiWotpKB//5e0XN+m2VCcgim7t3+uSzfrHzYKvvR36TkYd
X-Google-Smtp-Source: AGHT+IFnsKL2C7Z43lneF2/kfc+kNLD3wpdkcq/F+HpjLEig0kfzWKFszmoRWbkz8r5hYBDCXtpe
X-Received: by 2002:a05:6214:c44:b0:68f:6f65:3518 with SMTP id r4-20020a0562140c4400b0068f6f653518mr8239753qvj.62.1708519587548;
        Wed, 21 Feb 2024 04:46:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708519587; cv=none;
        d=google.com; s=arc-20160816;
        b=TzeS8Dqg6NmAUg43BYUpPIyIa21GWDuHP/F3LwD8BfuqveW7ggecty+o3iaLXBQM/o
         Uo4RJ68gaVMa3SpNyM1lCyJ8z/ISA0Id8H93lIaMhtZNMlbcLdHaXTJphZQgAewbRTSH
         e8Ke9cCeswUE303tDRawqPB8Wv7aX/HTRRo/iRj5s4+VvGrZEhOZYMnHoAvX4a7fPo1p
         2Iexf6OQ54jHHws4y2Sf2Pzl1Lo8L3RB3Jbv+ug1WJDtlrubTalSBSixAJQIgGwXNBU0
         j0eBXSfP8l6Vjey7TTbTJzOgLDZcHWyqBCwqJls8HTLcJA4DkUhr+jewSTMit7ca39md
         jmSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:dkim-signature;
        bh=5+iFDGsoywuH5+H7Hd1QIQz6/y36MS3F778kGZSKiq0=;
        fh=10FssWiiIUeKXn5X8KyebG8H44ITOx5Frlt1D/y/HaQ=;
        b=P7ni6fuGsZHBlTY2y+JtbgMhawZ7uRGSYVyyUBDJjcoFNaIev4VxxyXo9o3dJeePen
         Qr8J/jH29XuR0CXhdBJHzrV3MxndwErB2V6veqHKmAIRGp1sq8j3sIj0AykfGtR35Oh6
         rcSVuY+TTcUPV9OQ+WO3jKOY0XWVboWmITNeyKMHM47edpivaOxV2U0dSfWfMNLjJO4t
         +qxehwjNeJCe+sG60KHxyz0Bp8Q+6hV5kBrm9ADB9AERtCp3j6Im19ACpZ0+DyI07ZPV
         WIIyxICLEABEvJR6DflJt1WE1gQzuPgo9IY+JQkAdR9YIFop/7YrvQjP/CCv6ahGinJG
         KCEQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UJhB0Lhb;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id s10-20020a05621412ca00b0068f9e5f0ecfsi1848512qvv.25.2024.02.21.04.46.27
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 04:46:27 -0800 (PST)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UJhB0Lhb;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708519587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5+iFDGsoywuH5+H7Hd1QIQz6/y36MS3F778kGZSKiq0=;
	b=UJhB0Lhbvnh1Rf8Q69AgMTQ1niH72olT1UwUVU0OERx0417bMhowcVHm6by1fZ/J1X3tDu
	YHWQyXSbIWotWCNbw242AKWd/UUp6JrZlxHKM96b2ZcSIj0gBkGxf1Qubyqg99KI3hIvMi
	kFwxkCcrgNxh1z+3a2ERB5slO+3C3oM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-guzpp1vhOniCWJKEZF_cKg-1; Wed, 21 Feb 2024 07:46:23 -0500
X-MC-Unique: guzpp1vhOniCWJKEZF_cKg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3E28845E61;
	Wed, 21 Feb 2024 12:46:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.55])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7533210800;
	Wed, 21 Feb 2024 12:46:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 67A6421E6740; Wed, 21 Feb 2024 13:46:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Zhao Liu <zhao1.liu@linux.intel.com>
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
 <dapeng1.mi@linux.intel.com>,  Yongwei Ma <yongwei.ma@intel.com>,  Zhao
 Liu <zhao1.liu@intel.com>
Subject: Re: [RFC 4/8] hw/core: Add cache topology options in -smp
In-Reply-To: <20240220092504.726064-5-zhao1.liu@linux.intel.com> (Zhao Liu's
	message of "Tue, 20 Feb 2024 17:25:00 +0800")
References: <20240220092504.726064-1-zhao1.liu@linux.intel.com>
	<20240220092504.726064-5-zhao1.liu@linux.intel.com>
Date: Wed, 21 Feb 2024 13:46:21 +0100
Message-ID: <871q9656jm.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-TUID: VBBt5N9CV1aC

Zhao Liu <zhao1.liu@linux.intel.com> writes:

> From: Zhao Liu <zhao1.liu@intel.com>
>
> Add "l1d-cache", "l1i-cache". "l2-cache", and "l3-cache" options in
> -smp to define the cache topology for SMP system.
>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>

[...]

> diff --git a/qapi/machine.json b/qapi/machine.json
> index d0e7f1f615f3..0a923ac38803 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1650,6 +1650,14 @@
>  #
>  # @threads: number of threads per core
>  #
> +# @l1d-cache: topology hierarchy of L1 data cache (since 9.0)
> +#
> +# @l1i-cache: topology hierarchy of L1 instruction cache (since 9.0)
> +#
> +# @l2-cache: topology hierarchy of L2 unified cache (since 9.0)
> +#
> +# @l3-cache: topology hierarchy of L3 unified cache (since 9.0)
> +#

Too terse, just like my review ;-P

>  # Since: 6.1
>  ##
>  { 'struct': 'SMPConfiguration', 'data': {
> @@ -1662,7 +1670,11 @@
>       '*modules': 'int',
>       '*cores': 'int',
>       '*threads': 'int',
> -     '*maxcpus': 'int' } }
> +     '*maxcpus': 'int',
> +     '*l1d-cache': 'str',
> +     '*l1i-cache': 'str',
> +     '*l2-cache': 'str',
> +     '*l3-cache': 'str' } }
>  
>  ##
>  # @x-query-irq:

[...]
