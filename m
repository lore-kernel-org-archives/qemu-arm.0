Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp3132432njc;
        Tue, 19 Nov 2024 01:05:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX9yqcYmmyBmE58Mzz+RD9S7nGaaeieQ1fdCbpFS/c+RvOf2W8D2/0RyP+hI09YEvAqa+mHl97BMFl3NQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHIfzHTAu66HlMKT9CW/tFHyAXJPWyHD/kouMCOw6+xE0z5vuW/nR42o+VC9FyvT2SD7vd8
X-Received: by 2002:a05:622a:1f8b:b0:463:59fc:db8a with SMTP id d75a77b69052e-46363eb5e1cmr241222051cf.53.1732007116430;
        Tue, 19 Nov 2024 01:05:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732007116; cv=none;
        d=google.com; s=arc-20240605;
        b=HRIGDpmWyDiVs7Yz3BhqtpOqG/iQKLT8244pBdfla+0Hu6w+9Mjq3Lcc57ktGlNY+G
         lLtYwGYYohFwA9z/wjPORZqOamkSklqEDKDnPulwfAu5s/joS6KmeRj1bdUf9zoDbw5k
         wWyL7pPWf0oPanJ3IN9+Ta6x61VTMIFU5C8KF5yct7alZkxg9wC00swzKugtxqeRpMkJ
         eJAMQSi4DE1pP/ORkvdhnc+68U/ZjU0xsFoQbiOf1OffwJI1szCR5ZXSrj6HfMzTMqnS
         v/ZVvm+AD+Wt+1wfifTHFE/wJScRp4RCKHZ1hrgPiW4V9AMbtCLOZWUiKgFt1dfKjnTD
         RnBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=mooMlD0pIlqcZLKDjgL039YzMY3ZU9oDqNhg4YVBfH8=;
        fh=WJz52vBu+3z+gNkVlP3Z86wMXoTAqIijq+liUzcSZqA=;
        b=XY+O6CZjffsWm5V2p9E5n5nQW9KpjJPRDHRcB9DtStHRGAgui+Dbo9/wf/qb2uVhYb
         vPtipynvOp09jDkkUEohLvWrAC1/vjdgHlss2r8rkvkyCuzvyFQvZnaPvUrXe/J6A09g
         O9V7+rVHMCP1HJrlxB8/aLBsYv30u8BW5ChnWxRu+Q3WMqpRoBkiE9YBbdVfB9lOIKJu
         FmcYvob6HUZmZOg8hhg4qHD4PJr1aK+DnFfQNqebv+2i9Qv1Lly36SiN1/Zo2bmK/MCl
         FYwKuWAFy7LJmXdh8DVSXszpCzHJEg1hj+9I9n/5cpAdpOjY9G9e6IOaHCFWLM5vexqI
         DyTw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PIJPJfks;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-46392c4559fsi19112331cf.473.2024.11.19.01.05.16
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 01:05:16 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PIJPJfks;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732007116;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=mooMlD0pIlqcZLKDjgL039YzMY3ZU9oDqNhg4YVBfH8=;
	b=PIJPJfks1/gcOXvB6MeMt9LgWq+Ml6qFlt3976k2F8wlSkvnSD2XMYlhoZT+BKJEs0c2fE
	Jg7SlGUsxaIIxXciAzRzBsgUX2yPk4bATVLiDJQ1Z/xbGK+HdFDRgS3VyBUFWD6tgcdSX2
	AI/643KbSGBfp9UvcI2yFH2Ldmr0NTc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-663-DTlWtZE8P4CLlW1lEvm9Tw-1; Tue,
 19 Nov 2024 04:05:12 -0500
X-MC-Unique: DTlWtZE8P4CLlW1lEvm9Tw-1
X-Mimecast-MFC-AGG-ID: DTlWtZE8P4CLlW1lEvm9Tw
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B470C1955F43;
	Tue, 19 Nov 2024 09:05:03 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.110])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7243F1956086;
	Tue, 19 Nov 2024 09:04:56 +0000 (UTC)
Date: Tue, 19 Nov 2024 09:04:53 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Andrew Melnychenko <andrew@daynix.com>,
	Jason Wang <jasowang@redhat.com>, Thomas Huth <thuth@redhat.com>,
	alex.bennee@linaro.org,
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
Message-ID: <ZzxUeTxHBHKlEhwN@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20241118172357.475281-1-pierrick.bouvier@linaro.org>
 <20241118172357.475281-3-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241118172357.475281-3-pierrick.bouvier@linaro.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: au3gpzZFBkwK

On Mon, Nov 18, 2024 at 09:23:52AM -0800, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>  docs/devel/submitting-a-patch.rst | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
> index 349c32ee3a9..953682f20cb 100644
> --- a/docs/devel/submitting-a-patch.rst
> +++ b/docs/devel/submitting-a-patch.rst
> @@ -237,6 +237,20 @@ attachments can be used as a last resort on a first-time submission.
>  
>  .. _if_you_cannot_send_patch_emails:

This needs to remain associated with the heading that is *after*
your new block of text, while here you need to add a new anchor

   .. _use_git_publish:

>  
> +Use git-publish
> +~~~~~~~~~~~~~~~
> +
> +If you already configured git send-email, you can simply use `git-publish
> +<https://github.com/stefanha/git-publish>`__ to send series.
> +
> +::
> +
> +    $ git checkout master -b my-feature
> +    $ # work on new commits, add your 'Signed-off-by' lines to each
> +    $ git publish
> +    $ ... more work, rebase on master, ...
> +    $ git publish # will send a v2

Also add a note

 "Each time you post a series, git-publish will create a local tag
  with the format ``<branchname>-v<version>`` to record the patch
  series."

> +
>  If you cannot send patch emails
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  
> -- 
> 2.39.5
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
