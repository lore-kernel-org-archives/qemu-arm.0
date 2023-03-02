Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp34165ejc;
        Thu, 2 Mar 2023 10:05:21 -0800 (PST)
X-Google-Smtp-Source: AK7set/9S5fSwm96siSVSGADGVS5UlqIJsEcR/VYwZdD/REuCHzvtZfZR0CYqNPNeiK4wt10qyL1
X-Received: by 2002:a05:7500:d8d:b0:fb:1406:cfd8 with SMTP id kn13-20020a0575000d8d00b000fb1406cfd8mr342884gab.25.1677780321040;
        Thu, 02 Mar 2023 10:05:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677780321; cv=none;
        d=google.com; s=arc-20160816;
        b=tqs0FjEPlNl2PA4zTc/VATvuKq/UikZEmihwx09HhrKGo3UkR68UwXc68cz5K3oNbJ
         FclL7ykuN8dTs5Axx/xN3toR9e5rDQ8xBdaua05/+h31xsRe5UDnMzabA5pu5eEFRlyv
         kqOJPDbcX1Ji9uoSMm08obnsss2z33K/Vh/poVEVnAra1CSqLNQpEE9Q5H8jVulFzEvJ
         Yi6+qLytmN7gjAkPl++JbtZx3u5OJqmWVOVS6EzM+5+SHqXj7Ua9A3p9rq9yQTVUS3gP
         fIn8mfcnHQXHC/rgRzfkEkZNkRPO3Z4XqpYujJxdeEfukLJ+HPtEnMmbwn1ETIinJCoq
         gsUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=qk1L8nuZFv/j90fcvdYsTtDGs9Int4rt+yuUv0I7X5s=;
        b=gGhlQMiCW3/ptX7Mx6VWo6mQsuKxqu83BX0Q6be/e50LsT3+0jLUNS6cVrYGhFq9xi
         O3eq8Ar3KidkyGzVolvyzp+Siq9/hr9ooDHJVO4SV5b9gKec4icbJ/jgcncuh2PjDm8l
         UuYZzUJNXarFhvRlkpCimb5MrfR936rykfIRwaGjwTI4EfE/h2cCTOYgh/aGHdeyIj9q
         f4OtY2NElbQfoM8DLcV1OWo4ge1k8vw9esDr30X4+7dJTF4nttlxa+jt6kgZXZ0BZbIw
         uaKxmUd3diTKVfT+j2+cTKTth+6EQzYV7crmuIOqFNLIXr3DT0iLx8mbY/4dKNv1FRMI
         Al5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GKgxlhgQ;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id r25-20020a67c319000000b00414052c157fsi5245554vsj.799.2023.03.02.10.05.20
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 10:05:21 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GKgxlhgQ;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677780320;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qk1L8nuZFv/j90fcvdYsTtDGs9Int4rt+yuUv0I7X5s=;
	b=GKgxlhgQaj3YCVUtrMIX+2rFCednD/Jx+AwI3Rm0wPnmffMqmf4lzejQTiMoehwu3dKY9s
	5LnSI6gIFiuwibCcm3GrS3BnKBlTnK+LE/YODO9zu5gnwbHThXXj8EMB+XsmdnrP0EMP8n
	YdomjHgTgKlRuyG8wJgBPKvlX+DdqNM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-AIj7fARBOjSNf1O77iVNPw-1; Thu, 02 Mar 2023 13:05:19 -0500
X-MC-Unique: AIj7fARBOjSNf1O77iVNPw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5315802D2F;
	Thu,  2 Mar 2023 18:05:18 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C865492C14;
	Thu,  2 Mar 2023 18:05:16 +0000 (UTC)
Date: Thu, 2 Mar 2023 18:05:13 +0000
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
Subject: Re: [PATCH v2 1/6] docs/about/deprecated: Deprecate the
 qemu-system-i386 binary
Message-ID: <ZADlWR/jmGsaPGh0@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230302163106.465559-1-thuth@redhat.com>
 <20230302163106.465559-2-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302163106.465559-2-thuth@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-TUID: 6tC2cLmzrFRe

On Thu, Mar 02, 2023 at 05:31:01PM +0100, Thomas Huth wrote:
> Hardly anybody really requires the i386 binary anymore, since the
> qemu-system-x86_64 binary is a proper superset. So let's deprecate
> the 32-bit variant now, so that we can finally stop wasting our time
> and CI minutes with this.

The first sentence isn't quite true wrt to KVM. Change slightly to:

Aside from not supporting KVM on 32-bit hosts, the qemu-system-x86_64
binary is a proper superset of the qemu-system-i386 binary. With the
32-bit host support being deprecated, it is now also possible to
deprecate the qemu-system-i386 binary.

> With regards to 32-bit KVM support in the x86 Linux kernel,
> the developers confirmed that they do not need a recent
> qemu-system-i386 binary here:
> 
>  https://lore.kernel.org/kvm/Y%2ffkTs5ajFy0hP1U@google.com/
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/about/deprecated.rst | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
