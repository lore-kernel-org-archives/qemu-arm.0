Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp774734njb;
        Fri, 6 Dec 2024 03:32:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW0Ck5Z+zrZxr2x43gms18CgyT90CbxBiE+ct0GQ+hgB4lJf8R7E5SNDTMWSlMxNnlR4tnnj0FYQCYc+Q==@linaro.org
X-Google-Smtp-Source: AGHT+IEQBxNhcGjBmq4XbG16hZXGgLTBmRXbj/y/wPpcVDlN0DhulmaXsrGYYc5DU2narP+m/rJh
X-Received: by 2002:a05:6359:4588:b0:1ca:9540:33d4 with SMTP id e5c5f4694b2df-1cb171c9db0mr158306155d.23.1733484725616;
        Fri, 06 Dec 2024 03:32:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733484725; cv=none;
        d=google.com; s=arc-20240605;
        b=QUp6ITXMqiuSbe4dwSN70/xqevD/e2hwKxA8hnZVvj/RW0GnkedUdLKlprmws7OfUI
         RiJOc+rT6geAOWPK5BsWTABXkv2zMNXvr6G/YP90Y5xBTpRzIQ3PLQ+tRMulAGjQkaFM
         j/51NWCJY4BY2xQZvU7+6SuMXLYll2qm5j7wT0l6LkCotwF4/WQiqXyUxJGK8l2Yi/oZ
         KUTuAbn3UWs3aovkHmjB+c2cDtrTTbxdbBDSbHESfsysEF8yTadOorhc/bQi/885BOE7
         pjt4q/uVhWAVTPrcNB0g5dHwqd+u1WqJ5HC0waBETe87q6MRU8cE3tga4Xomtbc64m3w
         CQ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=IqC85ippnyJa3upPHjV2P8ua2qM0xUIdKMiOS3w8fZc=;
        fh=iEYMsHw0y4egh8aKTwDMfttNDgarlzRAguTykpz8r/c=;
        b=NwLkV1HaLMRr6+qKGh0xR898ubMQ7gxVHI5xUsbvtvjux7Avidg4n9t85Gb3VHj00s
         rg2Iu4KMZ/UcbEpa3wdEfZd2EDQrBd80EwxYksZ5GJv85meWZ9LsSlmdLdTVKmyOfX27
         0umXISsktqQwuddj+f4n2V0JkXvEFU5m9LR9unD6+TbpmWHdSrEzD7vy/qx/pj6Aih4M
         eoJMyyynICYYmcKUaXX8rAjVrGeY4PQ8gpmVSAc+wBzKteCrFHz9wZclllBS/C/Q6D3l
         DSi0a346+ZxUnf6J63V0UpCRc/YwP+Sxt5JSIAPKlpnFyqEvt1PAdth/tWhIK3dN/Grc
         khiw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eVp2WOQX;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4672983f750si40595461cf.580.2024.12.06.03.32.05
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 03:32:05 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eVp2WOQX;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733484725;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=IqC85ippnyJa3upPHjV2P8ua2qM0xUIdKMiOS3w8fZc=;
	b=eVp2WOQXuWLa7Wsy3/e+vIoYjYFed8h0+23UdnWgvGpsCStnmhfCmjkVmM+E41RQ1BVcPz
	LSCTADM5/qiQ8HdzDrZjNRuqQF8/AQ1fUBob0o59TG0Xkhzwgp4i0U/FEB0ArInZCYvKl6
	PfGKrdtTywxM3bDC3m5rIv61XY/YLHY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-664-CAHmOdCDO3ypqJ-MtgmHrA-1; Fri,
 06 Dec 2024 06:32:02 -0500
X-MC-Unique: CAHmOdCDO3ypqJ-MtgmHrA-1
X-Mimecast-MFC-AGG-ID: CAHmOdCDO3ypqJ-MtgmHrA
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9CCFE195608C;
	Fri,  6 Dec 2024 11:31:59 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.160])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 202421955F3F;
	Fri,  6 Dec 2024 11:31:51 +0000 (UTC)
Date: Fri, 6 Dec 2024 11:31:48 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@suse.de>,
	Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	gustavo.romero@linaro.org, Andrew Melnychenko <andrew@daynix.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	alex.bennee@linaro.org, Konstantin Kostiuk <kkostiuk@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Jason Wang <jasowang@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	manos.pitsidianakis@linaro.org, qemu-block@nongnu.org
Subject: Re: [PATCH v2 2/6] docs/devel: add git-publish for patch submitting
Message-ID: <Z1LgpKB_J4Df4wcE@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20241205222241.3789437-1-pierrick.bouvier@linaro.org>
 <20241205222241.3789437-3-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205222241.3789437-3-pierrick.bouvier@linaro.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: eh7Q6taBAvWU

On Thu, Dec 05, 2024 at 02:22:37PM -0800, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>  docs/devel/submitting-a-patch.rst | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
> index 03b2ac298aa..f8b7fc59544 100644
> --- a/docs/devel/submitting-a-patch.rst
> +++ b/docs/devel/submitting-a-patch.rst
> @@ -235,6 +235,25 @@ to another list.) ``git send-email`` (`step-by-step setup guide
>  works best for delivering the patch without mangling it, but
>  attachments can be used as a last resort on a first-time submission.
>  
> +.. _use_git_publish:
> +
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
> +
> +Each time you post a series, git-publish will create a local tag with the format
> +``<branchname>-v<version>`` to record the patch series.

Lets also mention

  "When sending patch emails, 'git publish' will consult the output
   of 'scripts/get_maintainers.pl' and automatically CC anyone listed
   as maintainers of the affected code. Generally you should accept the
   suggested CC list, but there may sometimes be scenarios where it is
   appropriate to cut it down (eg on certain large tree-wide cleanups),
   or augment it with other interested people"

Second, lets say something about pull requests

  "When a subsystem maintainer is ready to send a pull request, the
   'git publish --pull' command will triggering GPG tag signing,
   publish the branch to the git remote name specified by the
   'remote.pushDefault' config option, and send the email series'

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
