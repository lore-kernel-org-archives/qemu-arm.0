Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp2190564ejs;
        Mon, 3 Jun 2024 05:19:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX+RdRBfC+fJWVHlSMj9bXLQdSKLha8Cy+G5+e8+h0o+kMhD3CeCrLKFT4BOkZVh3woJDJE6TgyTf8zCXVfM5+8uOnRwInh
X-Google-Smtp-Source: AGHT+IFkdP1WPyqz2bAEqwiDPtx4EPR/8taAy4wo+JYN5POGYUCpi94za2+HcHZN2kqzoiCsxo/+
X-Received: by 2002:a05:6122:458d:b0:4d4:1cb7:f57a with SMTP id 71dfb90a1353d-4eb02dae015mr9583226e0c.9.1717417141634;
        Mon, 03 Jun 2024 05:19:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717417141; cv=none;
        d=google.com; s=arc-20160816;
        b=M33p2G42Ib4IlDPVl/Cf9JswM+nO8L5D1JBp77MiCb8HaoyyBai0nF9UbgPto8T4l+
         a+WzMoAN+TCohSvhLhhvvBsPaqncA0qVOdV2CXss0vYnT4dBrLiCTpEuLcQc/m9+0bbv
         ezD5RZLPP/OX2Ugr5dNGi4lRBCjnTldGhaTtt53suuW2o8V87LGKQIDUzzDxiCiiwuyW
         gonpHNdezbCvvkFzr/BRJalyYg3jf/f05TX4sNpMr7Y+axEoCA7qowmjVo+hCsXdsrqQ
         3vOlkZLIYD/pnxJtK9c+KvC2GxeVuo+qbTq9fUxBfyxuiL98rnLgRHwLAQww/y7lFvKu
         DWbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=2LVKqb/lcDhE5tKG2mNLWEhBm6QIry3ro/YwOQeXrDA=;
        fh=pwoR6NCdcacBrrBENMSwP9/RUr4kvado7ph94Z0EufU=;
        b=gn75tJP555zdAyjItZbUokqM9tz3V9UUagtIq+wiDs2WfnmjmNNqWNSZKQmcm8Pn/l
         eDRel456KXrw1LGP9CEwFoK1ua5V8avqlUCfe3RckvcAjmM8qsApu59PCCfSJWRrzdKz
         z6N+v/GhhUIGxwb4mlDhUB/UEUrKRok0i/UcwYahvb6nDZMSt/XHKBtjAFbFBSzAIOqi
         EIII03J1vicO1maLPRjCvI8oLfB5Jkz+hl3K7kPMKyE7XpObkyJdvo27vX7Niu6IMjUw
         W3pV7uhT5zNFO5GiId7mfwlvzjkNZAGcuvTSv/QroeHckmrMArFObUsTdSpPG60TjIGj
         01fg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WHOacald;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-794f2f0574bsi901934385a.75.2024.06.03.05.19.01
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 05:19:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WHOacald;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717417141;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2LVKqb/lcDhE5tKG2mNLWEhBm6QIry3ro/YwOQeXrDA=;
	b=WHOacaldG9i3Bn0cWZbcU+aZ6RQCn1u0jdoea6JVpozfL4w2tGyBfGqezqZrjSxkehEX79
	l5a/BqZmMyvl/PrOAYgj8aaG1+3zLSQzcy5LqYxY/iEX0F8jOR7ZXCmRWRgyurDtjZyhlQ
	7Yw2IgfUC0v+6xieFlKtxjGvcJbMNDU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-642-7sgSFcalPJOF7gtJEgMQ5g-1; Mon,
 03 Jun 2024 08:18:58 -0400
X-MC-Unique: 7sgSFcalPJOF7gtJEgMQ5g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E2633C025A1;
	Mon,  3 Jun 2024 12:18:57 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.80])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9455A1C008BB;
	Mon,  3 Jun 2024 12:18:54 +0000 (UTC)
Date: Mon, 3 Jun 2024 13:18:52 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
	"Dr. David Alan Gilbert" <dave@treblig.org>,
	David Hildenbrand <david@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	qemu-s390x@nongnu.org, devel@lists.libvirt.org,
	Eric Farman <farman@linux.ibm.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Markus Armbruster <armbru@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eric Blake <eblake@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
	Anton Johansson <anjo@rev.ng>, qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [PATCH 0/4] hw/s390x: Alias @dump-skeys -> @dump-s390-skey and
 deprecate
Message-ID: <Zl20rAjHLJlZkwxE@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240530074544.25444-1-philmd@linaro.org>
 <cb4028fc-9596-47f3-9468-f8912dd48aed@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb4028fc-9596-47f3-9468-f8912dd48aed@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-TUID: qe8ZLZ6XAdys

On Fri, May 31, 2024 at 06:47:45AM +0200, Thomas Huth wrote:
> On 30/05/2024 09.45, Philippe Mathieu-Daudé wrote:
> > We are trying to unify all qemu-system-FOO to a single binary.
> > In order to do that we need to remove QAPI target specific code.
> > 
> > @dump-skeys is only available on qemu-system-s390x. This series
> > rename it as @dump-s390-skey, making it available on other
> > binaries. We take care of backward compatibility via deprecation.
> > 
> > Philippe Mathieu-Daudé (4):
> >    hw/s390x: Introduce the @dump-s390-skeys QMP command
> >    hw/s390x: Introduce the 'dump_s390_skeys' HMP command
> >    hw/s390x: Deprecate the HMP 'dump_skeys' command
> >    hw/s390x: Deprecate the QMP @dump-skeys command
> 
> Why do we have to rename the command? Just for the sake of it? I think
> renaming HMP commands is maybe ok, but breaking the API in QMP is something
> you should consider twice.

That was going to be my question too. Seems like its possible to simply
stub out the existing command for other targets.

The renaming is just window dressing.

> 
> And even if we decide to rename ... maybe we should discuss whether it makes
> sense to come up with a generic command instead: As far as I know, ARM also
> has something similar, called MTE. Maybe we also want to dump MTE keys one
> day? So the new command should maybe be called "dump-memory-keys" instead?
> Or should it maybe rather be an option to the existing "dump-guest-memory"
> command instead?

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
