Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4535562ejc;
        Mon, 27 Feb 2023 03:50:20 -0800 (PST)
X-Google-Smtp-Source: AK7set95JIAEeJucd/712oL6HXXDUVCWcyn2GlJ5gYu+f2LIRq5RzkYg+Hk9CwVxRAv2P9tqjQoI
X-Received: by 2002:a05:622a:1356:b0:3b8:4951:57b7 with SMTP id w22-20020a05622a135600b003b8495157b7mr44985099qtk.20.1677498619922;
        Mon, 27 Feb 2023 03:50:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677498619; cv=none;
        d=google.com; s=arc-20160816;
        b=j1ATg4XvbC4FVohYksEh0XvgVGh2fCFvgFcPBLsbstkIaqZGXcCeXtAJomFU9J07jV
         hdIQ9ZeTtdBt6BIEf683S1BkK9RZvOPBOzdri4Ds3Adu9n/JSyttqSLewa2rLLzrQ30i
         +/AZ6H/x85e+EAEa5RuytnSwkYjW83V0UEykpIPl8GKGN1jS33Xf9LTAPgSfwSKR7V/7
         cHV530NFBD8L5nDUA+DUYkpGyfBPKCOdT0HSJEa4iUhOsJSoGoK6GiLZHKhmYtFiupxe
         /NU4Ewzle0SSLYg3Zyv80auFXfaXdzMXtzywohAyBqo4hltF7UQkwB5S5wvF4OBlmXWa
         bvkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=dygdNjOBh/f7cSHZKBYj9epAgNeJlw1ARAk1Xkm8Jpw=;
        b=ikrcZ65GsKzysbjrJjKymJcnNLdkp0L+4PN+HrKjJJ+6swiFRQNyXVWJNoZBTb1a9g
         hVf124kvpK6mEZpGbfq9NxhaPWszkSmUQBzgW2K8gux+s6GqmSRHGlmYeYGo/OJXXxKF
         8mmPo1HeDDAqAx/6BuHxAcNTIEcuAcIC4ykFBTkcgJ7/uWc+l1K4HU1Itwm9p0Y85Dbw
         y7lD4BuaimBEnAA9TMQRYN1gr/ZfXObJh0t/Gm4uj9rDoAiEMEi6Ot/EYQL8xQpcmNo/
         usFQx41xOeE4qBSGm7YFtPc4IMo3oddQ0spqaCskPaNPYvdOUGzM4qvKXPrPCjVx97I1
         XjjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BJvDBHl5;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id a17-20020a05622a02d100b003b9b4d9091asi6270328qtx.531.2023.02.27.03.50.19
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 03:50:19 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BJvDBHl5;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677498619;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=dygdNjOBh/f7cSHZKBYj9epAgNeJlw1ARAk1Xkm8Jpw=;
	b=BJvDBHl5jl4W0s+HI0NSbot4kwCEUIHj6X4i/7CrDZEkEiXrFHBkTgEBJIVy1iPqeN0AL5
	ajygKRH1pIeI8A86M1VYCzV5zjQ7p5ZBZ6nEYAC10zZCve7ee54vk8Tb0EIGwaGrQ6OW2x
	T1vLRf6fToDMPuUHG1jSc0ltbNmZZzI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611--S0vocKJPE6OuEDYgPwYzA-1; Mon, 27 Feb 2023 06:50:16 -0500
X-MC-Unique: -S0vocKJPE6OuEDYgPwYzA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A983185CBE0;
	Mon, 27 Feb 2023 11:50:15 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47033140EBF4;
	Mon, 27 Feb 2023 11:50:09 +0000 (UTC)
Date: Mon, 27 Feb 2023 11:50:07 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
	libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Reinoud Zandijk <reinoud@netbsd.org>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Message-ID: <Y/yY72L9wyjuv3Yz@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230227111050.54083-2-thuth@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-TUID: 3/s+P4GpUpoD

On Mon, Feb 27, 2023 at 12:10:49PM +0100, Thomas Huth wrote:
> Hardly anybody still uses 32-bit x86 hosts today, so we should
> start deprecating them to finally have less test efforts.
> With regards to 32-bit KVM support in the x86 Linux kernel,
> the developers confirmed that they do not need a recent
> qemu-system-i386 binary here:
> 
>  https://lore.kernel.org/kvm/Y%2ffkTs5ajFy0hP1U@google.com/
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/about/deprecated.rst | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 15084f7bea..98517f5187 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -196,6 +196,19 @@ CI coverage support may bitrot away before the deprecation process
>  completes. The little endian variants of MIPS (both 32 and 64 bit) are
>  still a supported host architecture.
>  
> +32-bit x86 hosts and ``qemu-system-i386`` (since 8.0)
> +'''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +Testing 32-bit x86 host OS support takes a lot of precious time during the
> +QEMU contiguous integration tests, and considering that most OS vendors
> +stopped shipping 32-bit variants of their x86 OS distributions and most
> +x86 hardware from the past >10 years is capable of 64-bit, keeping the
> +32-bit support alive is an inadequate burden for the QEMU project. Thus
> +QEMU will soon drop the support for 32-bit x86 host systems and the
> +``qemu-system-i386`` binary. Use ``qemu-system-x86_64`` (which is a proper
> +superset of ``qemu-system-i386``) on a 64-bit host machine instead.

I feel like we should have separate deprecation entries for the
i686 host support, and for qemu-system-i386 emulator binary, as
although they're related they are independant features with
differing impact. eg removing qemu-system-i386 affects all
host architectures, not merely 32-bit x86 host, so I think we
can explain the impact more clearly if we separate them.

How about something like....


32-bit x86 hosts
''''''''''''''''

Support for 32-bit x86 host deployments is increasingly uncommon in
mainstream Linux distributions given the widespread availability of
64-bit x86 hardware. The QEMU project no longer considers 32-bit
x86 support to be an effective use of its limited resources, and
thus intends to discontinue it.

Current users of QEMU on 32-bit x86 hosts should either continue
using existing releases of QEMU, with the caveat that they will
no longer get security fixes, or migrate to a 64-bit platform
which remains capable of running 32-bit guests if needed.

``qemu-system-i386`` binary removal
'''''''''''''''''''''''''''''''''''

The ``qemu-system-x86_64`` binary can be used to run 32-bit guests
by selecting a 32-bit CPU model, including KVM support on x86_64
hosts. Once support for the 32-bit x86 host platform is discontinued,
the ``qemu-system-i386`` binary will be redundant. Current users are
recommended to reconfigure their systems to use the ``qemu-system-x86_64``
binary.



Same point for the next patch about 32-bit arm vs qemu-system-arm
binary.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
