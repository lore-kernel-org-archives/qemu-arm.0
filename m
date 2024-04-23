Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp4885325ejd;
        Tue, 23 Apr 2024 02:49:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVB0TgkHBOqdHi3nBGHXHY7KSxXb3gjHllhVmuUrZ6ABIvUk3gJWDjcBobkT9XFrZRUXSXj6j8dcf9Bj9YtSpz6JBEFBGkW
X-Google-Smtp-Source: AGHT+IGZ2v4Y1C/dad+uN7bU1bdtPEca+GU27IqDrBqq9eCstn8+W5hi8S6kfjENuSBys2qIoUON
X-Received: by 2002:a0c:8bd9:0:b0:69b:3c90:400f with SMTP id a25-20020a0c8bd9000000b0069b3c90400fmr12559847qvc.32.1713865749593;
        Tue, 23 Apr 2024 02:49:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713865749; cv=none;
        d=google.com; s=arc-20160816;
        b=Au3bi4w23eIM/uzp1GqRRH90/qXHdqt8pDKgy3ABVC7J6kAgUlCoTSCDBqaWq20dIr
         rg6GdZdvhAkSSz7/Go7LgZpl4NNpX178aGMztYIYpDj+n9gFZibciOJnXxt+87sM1GqX
         9K3YaCdjv5pAIiU9nB4JkGRR2lLJJWGOu8ncIOpFc7IqQ2hL44DdgGN+YIRvA65n53mg
         c0Gem9s52ZLq/uX98Pnre8MzyaK9epHL23Dq36tCXNsQQHohpNYjlXfF3gcxtlj17fHD
         f4OGEsylD904xDlPyDwYdON1NMOYJ9WefeUEjHORE8nQ2RujnIey+MFmXBxhxgwnVLS/
         dPoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=7TR0DYSlqpy3tXMA4xysJX+ccLoaqSBSZAeBe11VhzA=;
        fh=BJcCiaa/1hl9DL83kRXXrqvkZvX3eR2nqFnSs1L1Vt8=;
        b=e7/UtnjrCTC8GGLiLuiLaWpF+0bftdJw9EtqQDdzdgDNj9Y23M+DU69+Hbvf1iDYjH
         NCEgwGghbCmTU6/+xpJ6Hu8OHa2+yF5FjJkU668sbXdxUVKmWKhC2bJWjptsSpwoFLDs
         Vc49bTpYuf8AkOAhSJ3AHJY4qmKDSeGz9cydVvxEE0doPTsBbsXKyNs9KpbTWPfwJu5X
         nfmlNrMqdsqno9FZOLmOmOGteUJbNpt+OMHd5jOeO2wS7d0Q0nCQK5BsEPcFfH0cljQI
         eu1kC5LjORtXj197X7yAOkTzWlcwPpPMKBMGxXkLXyf1E6iJ2EZm/Kp4dqEi5AoSMQ3T
         LWHg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PtzgDbml;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id if14-20020a0562141c4e00b0069945d8f21fsi12497210qvb.77.2024.04.23.02.49.09
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 02:49:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PtzgDbml;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713865749;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7TR0DYSlqpy3tXMA4xysJX+ccLoaqSBSZAeBe11VhzA=;
	b=PtzgDbmlIKjHesKqIpv+DuaCGh4v2n/j4OPm/6o7TC4uTn4i4f23pcXLmGz78dI56ePlKv
	/bayNC7ERZVp92L2ZOqxTEK7WUfbj8uD6IEex76NBEupCCwkhQKKagyJ+0JstJqLUuzGQH
	oI/WUCDMXaDoOjUfTPZHQ7hktu9Sms4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-Ecel4J5TM3uUrxTG37FnXw-1; Tue, 23 Apr 2024 05:49:05 -0400
X-MC-Unique: Ecel4J5TM3uUrxTG37FnXw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3626C80591B;
	Tue, 23 Apr 2024 09:49:05 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.127])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 50D01492BC7;
	Tue, 23 Apr 2024 09:49:03 +0000 (UTC)
Date: Tue, 23 Apr 2024 10:49:00 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
	philmd@linaro.org, pbonzini@redhat.com, alex.bennee@linaro.org,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v2 02/22] target/arm: Add confidential guest support
Message-ID: <ZieEDDhjZYoBUUW4@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240419155709.318866-2-jean-philippe@linaro.org>
 <20240419155709.318866-4-jean-philippe@linaro.org>
 <ZiKa6MQaujEMlC23@redhat.com>
 <20240423094456.GA4454@myrica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240423094456.GA4454@myrica>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-TUID: mLpjH65R4eDH

On Tue, Apr 23, 2024 at 10:44:56AM +0100, Jean-Philippe Brucker wrote:
> On Fri, Apr 19, 2024 at 05:25:12PM +0100, Daniel P. Berrangé wrote:
> > On Fri, Apr 19, 2024 at 04:56:50PM +0100, Jean-Philippe Brucker wrote:
> > > Add a new RmeGuest object, inheriting from ConfidentialGuestSupport, to
> > > support the Arm Realm Management Extension (RME). It is instantiated by
> > > passing on the command-line:
> > > 
> > >   -M virt,confidential-guest-support=<id>
> > >   -object guest-rme,id=<id>[,options...]
> 
> Hm, the commit message is wrong, it should say "rme-guest".
> 
> > How about either "arm-rme" or merely 'rme' as the object name 
> 
> I don't feel strongly about the name, but picked this one to be consistent
> with existing confidential-guest-support objects: sev-guest, pef-guest,
> s390-pv-guest, and upcoming tdx-guest [1]

Lets stick with 'rme-guest' then.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
