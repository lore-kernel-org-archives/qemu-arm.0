Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp37321ejc;
        Thu, 2 Mar 2023 10:07:56 -0800 (PST)
X-Google-Smtp-Source: AK7set+GPpgiIoZrA419skYweN+nOXxn2+5zCUKDfkZakfKQsJWKg7Io2hK+NkikJ+EtzFVydIzY
X-Received: by 2002:a05:6102:dc8:b0:421:4465:bfc0 with SMTP id e8-20020a0561020dc800b004214465bfc0mr6441365vst.9.1677780476108;
        Thu, 02 Mar 2023 10:07:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677780476; cv=none;
        d=google.com; s=arc-20160816;
        b=J+/6PW8Ap9LVwYsa/+A9rZEkZ0nZsnvAKNHXkA9ZEJMuuQWMGGyizBl2uTU+DgTUu8
         IT4IseWGy25+N7lHYq1ENyTPtppCxzVybaw6Yw3/s7AOtQJbKBT+FqGBlG8sehlWhtkR
         KTGZRNbVkWs2FMrIP5LWwRhtlT6yc0jP6BwtDfyEnPL3JdHdvfqk4sc/FcI7au/Nt7Ye
         gBudzqTD3XqX7UAS6b017Ul5OB/PeU2SbJoCLMyhJy37PEs4hQhd4SJvLzh+aRIw6oXm
         g3omTrR6OKDdKPynOEIOUCHcWRnmNNvod2eH5i6+jK41i68HsLt9Bj2ioGZK1NDENs6J
         Cvmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=DnPTB81/Gt6pY7mNbCORydL/Gzv6g9K34G65htUwk+0=;
        b=1FaJQQbzj2r1+egi3Bo+eOlF74PqelD9UEG7j+W71n85m586dfACKVKeSmRP7COXt2
         ON2JxkyH6sTL1CorWRaOX7lf85KrPb7DkUXBC59GI8krHlvv4SLGyddblm3UNwzp7P/T
         nzH3T/6lyiq2jdHch4qPCO55LvRf+NGPwJ01We3Onlz/SClOS+ZPESibtNJ3nHPzdgWU
         ZCkEdL6ZQ7vjyjT4Z5cYnkqSUP7GSdIj1TiRKajC8U4+DFP4p16LjKuo8De3ZBs3SZ8c
         BeKbs3fQUCZlj1HwWLofxuefkMsIM0dMy3zVh8DG1Aus1HDBc25jBnoIfy+Rga3WOOt4
         xahw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Hy9jBKGE;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id x25-20020a05610223d900b003d0d39100f0si5092914vsr.575.2023.03.02.10.07.55
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 10:07:56 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Hy9jBKGE;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677780475;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DnPTB81/Gt6pY7mNbCORydL/Gzv6g9K34G65htUwk+0=;
	b=Hy9jBKGEdD3QeofFXpSx3Hrsak94/upIrqXHcS1KNZcmgFQLICMEi66e1IzX7pd+UQ8F8v
	yerla3NeBg0nNJ3KGTlFes73tdDo3lZMN1dxoJn41+piaL2fVFd+h3LJcuRXnT6NdZjpzu
	7kQgwFc7CA3ppFF3gXJcM6HoivcveQ8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-ueznbH63Oj-2dfli66aY8w-1; Thu, 02 Mar 2023 13:07:54 -0500
X-MC-Unique: ueznbH63Oj-2dfli66aY8w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ECC3E3C10C66;
	Thu,  2 Mar 2023 18:07:53 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C1F01492B01;
	Thu,  2 Mar 2023 18:07:51 +0000 (UTC)
Date: Thu, 2 Mar 2023 18:07:48 +0000
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
Subject: Re: [PATCH v2 4/6] docs/about/deprecated: Deprecate the
 qemu-system-arm binary
Message-ID: <ZADl9O8Yq+vLVI9A@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230302163106.465559-1-thuth@redhat.com>
 <20230302163106.465559-5-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302163106.465559-5-thuth@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-TUID: 2Ma5MNAJ9WZl

On Thu, Mar 02, 2023 at 05:31:04PM +0100, Thomas Huth wrote:
> qemu-system-aarch64 is a proper superset of qemu-system-arm,
> and the latter was mainly still required for 32-bit KVM support.
> But this 32-bit KVM arm support has been dropped in the Linux
> kernel a couple of years ago already, so we don't really need
> qemu-system-arm anymore, thus deprecated it now.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/about/deprecated.rst | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
