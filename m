Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp3135780njc;
        Tue, 19 Nov 2024 01:12:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU3MslMx6JnnjT5LsVys/i9cC3fzPBoTFgNLDK053uYRylSeHHOdGdfU9Kf3A7JhtwuYwbLMPgAadf+mQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFDLsLgPjgkRBleWCLf67RhBUWHbhuP3qYp1Ndcy+mXNHwEYZ6rtl6oX3c6hK70Ure7+DFF
X-Received: by 2002:a05:622a:1442:b0:45f:20b:c1c8 with SMTP id d75a77b69052e-46363debd00mr223919401cf.9.1732007562131;
        Tue, 19 Nov 2024 01:12:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732007562; cv=none;
        d=google.com; s=arc-20240605;
        b=Ga/NgYrLGgxuBenmZuB8B+0Km7Dtd8JAzEl+koQvSSO7Cstn80cH6KvMU4jLMX6pj+
         8D5bhWh1fhEZBcRZUfqh7quUmETOz9NkI694SqQhL398MWI3GlQ7YtsRJ9KBZWFxeEeD
         DhgvJ1Mv0BxyrTVAt2Zz8iirVNYmOCTOchBqOhKhm5F0lrv8TApCh3ze/1syxe3SLmxy
         IKWcJV5Mda0W57+mzzylbWUxhTxJqOiKGfNgfG/ZkEXXQqEjh3dbXu6MLgUgQ0ZxkcsN
         m+kgPgiLaPPpQcLWSnXhSXLAHRiqlv83wvNvBqCfr/LMmZc26srxD+BCRAYZ7CB31Mdg
         wfdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=axxdCSVMVXPIgO9acZUtuxAKuCPl+sQtmavnQTTcXaQ=;
        fh=30BWWxFEPRBRkwSS+WV8DjZjVENAIGl+6U45p3ia4cg=;
        b=E4QU0bHX/4cVvPeBHmLyreJ7J+7x5SIdHjkZBHyS7QIta70qEloewqre+WZNWMwvaY
         u5+FqERaAiDom7RxyJd9Wcoz/EbZRO6J4SWYMLYHGmKzofcTDrJcxRGpmB6ru61/do8C
         oNgBBWf3LX0Ge2zQp2kytiOcl+L/CxkBxrK+iS8IyuuXvz9RLyMvyg3eEBoXgzi2cEgG
         NaYezUF/kwT1h+HnqTQgAkwOrJcbLf0on9lh+eUfE/8N7IxBgraP9WEAwiq7y7xVq35O
         85fHEs931jXAVjjPeP6N1l3PkXeZyRtBPexaa+lVJeV0k5S0saAUkKoh9EMVyzIRpnVU
         gg/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SBxF71gE;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-46392c472fesi19336871cf.471.2024.11.19.01.12.41
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 01:12:42 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SBxF71gE;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732007561;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=axxdCSVMVXPIgO9acZUtuxAKuCPl+sQtmavnQTTcXaQ=;
	b=SBxF71gEwv3j5f+fIH5E0GCZnx2YK06TMBVHQ8aHgEpYqHAH7NJG9WBmAu6AXLC4FfuxAD
	shIACCkx+yJYSk8Xwt9FWlYOmH3ggk9dCIINgd/AuNMlr0ZDzvTmQxsZT9MkcrAvq8iu49
	WEqyolFMyQiQQG0aQb1ECqWolq6bCzI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-32-37ONWuuyO_aEgJF3o4xcqg-1; Tue,
 19 Nov 2024 04:12:38 -0500
X-MC-Unique: 37ONWuuyO_aEgJF3o4xcqg-1
X-Mimecast-MFC-AGG-ID: 37ONWuuyO_aEgJF3o4xcqg
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E39DB19560B8;
	Tue, 19 Nov 2024 09:12:35 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.110])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 21DE11956054;
	Tue, 19 Nov 2024 09:12:27 +0000 (UTC)
Date: Tue, 19 Nov 2024 09:12:24 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org,
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
Message-ID: <ZzxWeG-UKT0odfL8@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20241118172357.475281-1-pierrick.bouvier@linaro.org>
 <20241118172357.475281-3-pierrick.bouvier@linaro.org>
 <ce090d62-89a8-4f1a-a864-add24704dd11@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ce090d62-89a8-4f1a-a864-add24704dd11@linaro.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: zeEGiuRELETi

On Tue, Nov 19, 2024 at 09:41:40AM +0100, Marcin Juszkiewicz wrote:
> W dniu 18.11.2024 o 18:23, Pierrick Bouvier pisze:
> > Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> > ---
> >   docs/devel/submitting-a-patch.rst | 14 ++++++++++++++
> >   1 file changed, 14 insertions(+)
> > 
> > diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
> > index 349c32ee3a9..953682f20cb 100644
> > --- a/docs/devel/submitting-a-patch.rst
> > +++ b/docs/devel/submitting-a-patch.rst
> > @@ -237,6 +237,20 @@ attachments can be used as a last resort on a first-time submission.
> >   .. _if_you_cannot_send_patch_emails:
> > +Use git-publish
> > +~~~~~~~~~~~~~~~
> > +
> > +If you already configured git send-email, you can simply use `git-publish
> > +<https://github.com/stefanha/git-publish>`__ to send series.
> > +
> > +::
> > +
> > +    $ git checkout master -b my-feature
> > +    $ # work on new commits, add your 'Signed-off-by' lines to each
> > +    $ git publish
> > +    $ ... more work, rebase on master, ...
> > +    $ git publish # will send a v2
> 
> You recommend 'b4 shazam' in 3/7 patch so why not here? Both 'b4' and
> 'git-publish' seem to do same stuff - handle patch series and send them
> upstream.

git-publish is what we already recommended to people both elsewhere in
this file, and more prominently in the README.rst file, so maintaining
that practice is correct.

> b4 allows to keep To/Cc emails inside of cover letter which makes it easy to
> not miss anyone needed.

git-publish automatically CC's people by correlating the files touched in
the commits against our MAINTAINERS file, so it "does the right thing"
in the majority of cases. We recommend it because it makes it much harder
for novice users to mess up patch series submission.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
