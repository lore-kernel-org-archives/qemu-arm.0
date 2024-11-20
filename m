Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp3835007njc;
        Wed, 20 Nov 2024 02:01:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4x8nQZnKdNepkn3JByTm6vw97jhQECIyfiTC8Hz16WyUVVaBqKWzo+2RwYWOhHeH9Ww0Q
X-Received: by 2002:a05:6214:528b:b0:6d1:7433:3670 with SMTP id 6a1803df08f44-6d4377b459cmr30543256d6.4.1732096911870;
        Wed, 20 Nov 2024 02:01:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732096911; cv=none;
        d=google.com; s=arc-20240605;
        b=aupjPvKKfq859FFwu4us4ATXfSyqn+rpQdVx0PpXhJYzolU1wbT2GAD5m/pQ0dYuHR
         2dIUtmAG7GJdk+Pst4JQnwIWNEi3IQLAQN9yp8BVtq6yCl+j642lHtmdckMMYh9XZ0ti
         gxSkuO1Ft8BNeeztrhP9C/gfBbyS7/ETi7M/de5cZNelBBSKjktitWjBj1MNqKz70aAr
         dh2XBChPxjIt9JeXodWWE8s99gg0blXfaU261f5etwsWf+BwMd+z5+yDrGFq7hbdGh5a
         Ir6shvlbGJQD8pGJ4QTVdRXlbncnRCpBW+Kbvs0blwSpskcY6vYPdVbMxPc8jYyHAn6Q
         2skg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=6/TxBJPOV6Kd1mftXp6mEGUH0p68nMQzYfUm3eK5ilg=;
        fh=D8iOWxBBAJ0X/4sp5GxBvo1u3iuqnSVjIi+pCUw/jxU=;
        b=VdzE5x9ppCsSDyd2I61oElarHCFtZ8lUNh0PZVFiqP79MhlS/z8mXfdcKVzVXj9kgo
         Q3kUYMmtUNbDN33OolwKsPFvlNJJal+xGHqYcFy4bl+leYNGdx2nMTev8HKluSXjkL3A
         HWFGwtqDpGvlWv+9pebVKWC5O6KWGlD2EmZhIy2WLzLExP0OYCwzhT5jJ73g+SXUearS
         NM228Fb5H7oeuMadvtT6hgt1qqPlExqZIgv9ErBaWsHRnEp67Am1uKgJujn38CqZoBzi
         XK1x8tIAvHIugIqprx8F4CrSzjUCgW50A0vWgCp0N2Rgl0Hx3Nexr2kjRwsu37+K/1Av
         djKw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VKcTEkVl;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d4380dcd3esi13744006d6.131.2024.11.20.02.01.51
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 02:01:51 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VKcTEkVl;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732096911;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6/TxBJPOV6Kd1mftXp6mEGUH0p68nMQzYfUm3eK5ilg=;
	b=VKcTEkVlXNSKIOuMelhEEJeiIFsOHFedgiaJaaghw8yy7uazIcNQti3TPpatWEHL6u1bfY
	bhOidgfAICtyANXs4iO3QQksDBQdAejRdOSD26QTBYqvbbTcOK0B238Q03f0e0OJ4qbO+o
	5N7UI96euapAaZ3JnTNj9JahI5W9CTE=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-9-SmzPzOgSNV6mbH4jnlmqKA-1; Wed,
 20 Nov 2024 05:01:42 -0500
X-MC-Unique: SmzPzOgSNV6mbH4jnlmqKA-1
X-Mimecast-MFC-AGG-ID: SmzPzOgSNV6mbH4jnlmqKA
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EA344190344C;
	Wed, 20 Nov 2024 10:01:38 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.50])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A332319560A3;
	Wed, 20 Nov 2024 10:01:30 +0000 (UTC)
Date: Wed, 20 Nov 2024 10:01:27 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	qemu-devel@nongnu.org,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Andrew Melnychenko <andrew@daynix.com>,
	Jason Wang <jasowang@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Fabiano Rosas <farosas@suse.de>, Kevin Wolf <kwolf@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>, qemu-arm@nongnu.org,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	manos.pitsidianakis@linaro.org, qemu-block@nongnu.org,
	Michael Roth <michael.roth@amd.com>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
	gustavo.romero@linaro.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 2/7] docs/devel: add git-publish for patch submitting
Message-ID: <Zz2zdxSdRgl6DpsS@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20241118172357.475281-1-pierrick.bouvier@linaro.org>
 <20241118172357.475281-3-pierrick.bouvier@linaro.org>
 <ce090d62-89a8-4f1a-a864-add24704dd11@linaro.org>
 <b9df48b7-c1a9-4a46-bd78-b7ecb8328b33@linaro.org>
 <875xoinsgw.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <875xoinsgw.fsf@draig.linaro.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: xVLKvSJfw2FX

On Wed, Nov 20, 2024 at 09:51:27AM +0000, Alex Bennée wrote:
> 
> I still send pull requests by hand:
> 
>   git send-email --confirm=never --quiet ${mailto} ${series}.pull/*
> 
> but thats probably because I haven't figured out the steps for git
> publish to do that.

A one-time setup task is to tell it what you preferred git remote is.
I use "gitlab" as the name of my personal gitlab fork of QEMU, so 

  $ git config remote.pushDefault gitlab

With that one-time setup task, sending a pull rquest needs nothing more
than adding  '--pull' to the git-publish cli. It'll trigger signing of
the tag, so be sure you have your gpg key available, and then push both
the branch and signed tag to your git remote, and send emails in its
normal way.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
