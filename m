Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1037218ejc;
        Fri, 20 Jan 2023 04:24:41 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsWI0oHsKWnBmRUEztEIP8D+Gel5+tDJMNn7pc6IZgUVYhF0I7Y2bbtZQEMxzgKsTM64ysI
X-Received: by 2002:a0d:e747:0:b0:4e0:196:7713 with SMTP id q68-20020a0de747000000b004e001967713mr20117232ywe.5.1674217480900;
        Fri, 20 Jan 2023 04:24:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674217480; cv=none;
        d=google.com; s=arc-20160816;
        b=EVZhq1bFoCbPmVXbBrz76UG/78tvo8d4I8BRJgV2LGxLzP1IO8za+XNmUNju9Q5qav
         9ZY3wjdyaIE9PSDYYYu3icensSOCUbr9sCwtQjMdCNcA+2xU6DIDz6UUNLSWGJoVafDH
         UMEM+UZ5n8KRMbTqJcUHpKpSunGDfMHg6L8IItG+Io41HcLM/IyDxn/Ko90thK29fsvk
         nweePm073bdmvW+j4jlaLjjeQcL7FlVxQOytsRHNjgHrr+8VdBeK2ZBDaBLuohMtTvJd
         gK+4A3jUajEnnE8dk8eCSDERz8U138FSAWimnSFeDdUnWBL8lZQ0Febw9CeBRdfZXtbn
         x22w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=1ZZU8K6IpuHAZeldxts/x6ftKTKYjsoVtHVIG/va/38=;
        b=YhVW0wM03ZF76bfxAYEv4cVklbLIKsHMkNrhSpCcCqjszonpIXJeaQcD3UhYyWlf9X
         F2q8vYlac70oaWnk4D7nZFkQeuJGjGgHvw8NePwFOzjgeH8cVYGy64jQX7zH1CUiVAQy
         1usCfGUf55Xqd6+G8/SU69EQ86FEXtOl6kFwud6I2W62THPFQ+IPoJzGLMOj/2nvH71U
         lJ88z2b78YVlEgl7JDBedfJUc26rST7uf987VNOWoArDyrIW2wVDNYpwMPqGX8AZioGp
         63fpROmdQRHiK70ZVyizuuaOcquCBODk7bLQlcmfrT5ab2TDpOMD2dKIGgoLhRlPUSbx
         6ZJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="cT/EEAsI";
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id c22-20020a814e16000000b004d3748a1022si2294996ywb.487.2023.01.20.04.24.40
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 04:24:40 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="cT/EEAsI";
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674217480;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=1ZZU8K6IpuHAZeldxts/x6ftKTKYjsoVtHVIG/va/38=;
	b=cT/EEAsIwOzZ5tK0q5Q8cJCpvNw7q1DR9nOj8OvA2nIOsrsgxo7eefDsud/qWJNMLK51bK
	2l/qptBVvPWy273Eg6L4UeMAXBBJhSRsZK7n8p0t2ypN9/hb489E8JscK5zQpevLjrrfsY
	3+Htc4aV6B415l0kLewHcMKvznZGHQk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-Jti6ghEcP3C9MrCVmmKULQ-1; Fri, 20 Jan 2023 07:24:39 -0500
X-MC-Unique: Jti6ghEcP3C9MrCVmmKULQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63597885620;
	Fri, 20 Jan 2023 12:24:38 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.72])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01D16492B02;
	Fri, 20 Jan 2023 12:24:34 +0000 (UTC)
Date: Fri, 20 Jan 2023 12:24:31 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>,
	Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: Re: [RFC PATCH v4 03/15] target/arm: Remove default cpu for KVM-only
 builds
Message-ID: <Y8qH/4VHdG1kk/Y4@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-4-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230119135424.5417-4-farosas@suse.de>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-TUID: 5ySCXPI1l+YG

On Thu, Jan 19, 2023 at 10:54:12AM -0300, Fabiano Rosas wrote:
> We'd prefer if the user always had to specify the machine and cpu
> options in the command line instead of relying on defaults.
>
> Since the KVM build already doesn't work with the current default of
> cortex-a15, remove the default altogether for KVM builds.

IMHO not having a working default CPU model is a undesirable
state to be in and user hostile, especially so when it makes
aarch64 be a special case compared to other targets.

Can't we just make 'host' be the default model for KVM, if
the named CPU models don't work ?

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
