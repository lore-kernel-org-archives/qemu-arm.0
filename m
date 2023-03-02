Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp34887ejc;
        Thu, 2 Mar 2023 10:05:58 -0800 (PST)
X-Google-Smtp-Source: AK7set/yhR/sBXB1Lh45UIW1H5KEdLJySrtCItMnwIr4+TtKtj2QHMv7tjixlueU3QErPCGNpHqO
X-Received: by 2002:ad4:5de8:0:b0:56e:f4e0:a4ec with SMTP id jn8-20020ad45de8000000b0056ef4e0a4ecmr18597833qvb.46.1677780358031;
        Thu, 02 Mar 2023 10:05:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677780358; cv=none;
        d=google.com; s=arc-20160816;
        b=JTAkzb792Kek+0zdV3MqsAvlCfs3LLfqqw4P260hg5Xhqe9nFvoJF2cBRdaxEJGLvt
         xOibdxdvJd6BCNL0tRVox7E50fA8AwDb/bWfmercEO+8tyt3S0VkCzGKerrzq5Xoch7X
         miOTxahGKZP+jXW0NGdfcZPfRAN2atDrYdfhwQNuxf9uxNvlcZM5h/m737xMHWQ3Say7
         LtlIv+Bf9+IIsCgNVH5sVZJsgD4LIpzDHg5Y92aJp3kd1bwAqvqZc343bLKYF2woQwpS
         YL0KBneuNP9xdhytcDXXfQkLtxc5ZyAlEYRqYKCf3z3Jli7XhBh7sQfNMO8FmKYX+JUW
         QxkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=Uq28CY84X2a6rgRGcIFR8HUgJVL3s2wDxCarfoJ7rwk=;
        b=H92h8X/fne2N7PeYQ4EhlhVslUkdAuobBpDJhsmVK/WoWxc5erDgN3YpC66fyhBV1z
         qQYMUfJ5b/K/zgz+kS163dgbzwqafYWe6T+TOE/nZ7VFjJNkWK5nWZA2XUtTOOCk/Oj3
         6qqJLQCi5ItDk3LG7mOGG3tEJH6/l7gnTHj0yF3j5dNPTJ5Bd0PKnqWMYi4H/n4BLfIo
         m5aCb0XdmX1wkLz3kEMKOrJxpgM0rIKP6bC9e+b2UoE5or7ZeUsOAvY9M+cnBIOwQ/cQ
         M1rbve3TNXztKta1sLIZR+Jn8F71hERWZC9tHDRN3fF0EVn5HmiUoQCimMNyJquB7m2B
         bZZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TRzWdhgV;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id n4-20020a05620a294400b0071d599e9448si139365qkp.272.2023.03.02.10.05.57
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 10:05:58 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TRzWdhgV;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677780357;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uq28CY84X2a6rgRGcIFR8HUgJVL3s2wDxCarfoJ7rwk=;
	b=TRzWdhgVeEB97PJf5rHoKQDwn0Sfnd/oAno9/jk+GMwnyVIlgW8TnjZ4fSuuoWbBje2wnB
	fBKvhfh637oPsX8QdyjKG2W+gwSiDh9rx9Fzlw5oXstvo7TkbbBFBJW3m7K5Ln+6LHh4j1
	JqSjoH6piLYkSljPwfmiUG4fW9XSYa0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-cgKAbBlxMrmaZJ1R6OIDbw-1; Thu, 02 Mar 2023 13:05:54 -0500
X-MC-Unique: cgKAbBlxMrmaZJ1R6OIDbw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7D1F3C10C70;
	Thu,  2 Mar 2023 18:05:53 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DD6C2026D4B;
	Thu,  2 Mar 2023 18:05:51 +0000 (UTC)
Date: Thu, 2 Mar 2023 18:05:48 +0000
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
	Reinoud Zandijk <reinoud@netbsd.org>
Subject: Re: [PATCH v2 2/6] docs/about/deprecated: Deprecate 32-bit x86 hosts
Message-ID: <ZADlfILU11Akp5MT@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230302163106.465559-1-thuth@redhat.com>
 <20230302163106.465559-3-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302163106.465559-3-thuth@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-TUID: d8eHdOcnyPbK

On Thu, Mar 02, 2023 at 05:31:02PM +0100, Thomas Huth wrote:
> Hardly anybody still uses 32-bit x86 hosts today, so we should start
> deprecating them to stop wasting our time and CI minutes here.
> For example, there are also still some unresolved problems with these:
> When emulating 64-bit binaries in user mode, TCG does not honor atomicity
> for 64-bit accesses, which is "perhaps worse than not working at all"
> (quoting Richard). Let's simply make it clear that people should use
> 64-bit x86 hosts nowadays and we do not intend to fix/maintain the old
> 32-bit stuff.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/about/deprecated.rst | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 11700adac9..a30aa8dfdf 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -208,6 +208,18 @@ CI coverage support may bitrot away before the deprecation process
>  completes. The little endian variants of MIPS (both 32 and 64 bit) are
>  still a supported host architecture.
>  
> +32-bit x86 hosts (since 8.0)
> +''''''''''''''''''''''''''''
> +
> +Support for 32-bit x86 host deployments is increasingly uncommon in
> +mainstream OS distributions given the widespread availability of 64-bit
> +x86 hardware. The QEMU project no longer considers 32-bit x86 support
> +to be an effective use of its limited resources, and thus intends to
> +discontinue it. Since all recent x86 hardware from the past >10 years
> +is capable of the 64-bit x86 extensions, a corresponding 64-bit OS
> +should be used instead.
> +
> +
>  QEMU API (QAPI) events
>  ----------------------
>  
> -- 
> 2.31.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
