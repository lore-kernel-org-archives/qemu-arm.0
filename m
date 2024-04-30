Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp2820316ejb;
        Tue, 30 Apr 2024 02:55:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXpEZhipqe4aH7e67wxC76ChG+No5LThAFvEL9grLQ2f42wy6+w5PRkvPiPFIRnsCD9sJBGbFnv/ff4lRrwnYXS8/rOzLDg
X-Google-Smtp-Source: AGHT+IHs26GXFagn8m4o5KTcV5M2XcE5iSx5HiuWjYxHw6Xis+ytqaJRDDRz+h2WJ01ymocuXk6I
X-Received: by 2002:a05:620a:1727:b0:790:f7e2:9eaa with SMTP id az39-20020a05620a172700b00790f7e29eaamr5610672qkb.40.1714470946248;
        Tue, 30 Apr 2024 02:55:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714470946; cv=none;
        d=google.com; s=arc-20160816;
        b=Z2yyDHAIYQWpVP+PkYVDLYXMJzpIP5IxKrBhdKPBWJyf7ORYKxRqwczY49v2rFJk9B
         HF2aOeT0XiBfoBEoaf+7N6urXBoikHWzRUPD0HzK30ESQ9NrisUbOwiwCZSgPe8y2hm1
         muaI8jJqYTffg0ZsyzO0EHA70J8nAU2xwYric8nH/MOphjiEg7+3vksLOM5hxX2o5A61
         NJGp+KPpGAO4TJ7BV7n28iuIRhxRMEnCd0kfbyKAVXt3YbrYjKNgZWiCyXjpH3iqcD1N
         aV5iMYaPka9Fza/qdByUtFWasxD36PpNqmpZJXkJoTXbqgje0+EHb7kTTKqnWL2v4zDQ
         Q1fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=0W/IXaYxqHRtZC4KnnJtCdf+TXWLaEz5NbLVH4JP+kE=;
        fh=kZPypYlo8KnTPo+YK6MuaW3fuUhwrYMOQYaAiRshy4I=;
        b=x9aoGxVFLtVZjnkEt3c9moiK2tHW3fs1xCXV3puW+1Etug44c6Gqej3a8H0Tc7N/nN
         TY6eYqvvWcDlRi/9WEwBiPLdQxD+Ee7r1dv8NZaoUwHLhgGb/vESuFBP3nmd2uw14HZR
         2qsoRz95kCDfg6qlVZj7C3JjyIrVJInWEfidyaCkThFR67tYdhPhT4qQFVwLz9ucMCA0
         y6uqVTn/G5jqAfACIWSyH/AxdzgMTYPK7KRVeGDWxgIZO85kaerSyE80jDrkN65rFJGE
         sYmZPJT9prBEqjqYmIhTqSatFVCgdjZR/0LF1r/YIwp79k2xXf+p+Ae6gPH9QxszklSH
         XL5g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fwE81C0f;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id e5-20020a05620a208500b0078ee4539615si28071169qka.90.2024.04.30.02.55.46
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 02:55:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fwE81C0f;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714470945;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=0W/IXaYxqHRtZC4KnnJtCdf+TXWLaEz5NbLVH4JP+kE=;
	b=fwE81C0fAwPfhL782+EUvwd6nCtGQk6lhwfusSphez3YPjPa2c7PywgzKP6UAp/TOq3wTQ
	9x4MZ2KkEkt340NMoGzfiqNfmfYSqgGGDtH7KP5HSXmpNzgRx0zcIR+2ijOLYcyCLHOvZe
	XGnUacU/5oJYiNFMOihcqUiorugKb5U=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-455-sLhIWVSVMVyl_LnQM-YW1w-1; Tue,
 30 Apr 2024 05:55:42 -0400
X-MC-Unique: sLhIWVSVMVyl_LnQM-YW1w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9EB363806738;
	Tue, 30 Apr 2024 09:55:41 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.59])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F119151BF;
	Tue, 30 Apr 2024 09:55:39 +0000 (UTC)
Date: Tue, 30 Apr 2024 10:55:38 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	devel@lists.libvirt.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Peter Xu <peterx@redhat.com>, Fabiano Rosas <farosas@suse.de>
Subject: Re: [PATCH] docs/about: Automatically deprecate versioned machine
 types older than 6 years
Message-ID: <ZjDAGuONZ_Zem3fL@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240430064529.411699-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240430064529.411699-1-thuth@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-TUID: i/BqGXl9KloJ

On Tue, Apr 30, 2024 at 08:45:29AM +0200, Thomas Huth wrote:
> Old machine types often have bugs or work-arounds that affect our
> possibilities to move forward with the QEMU code base (see for example
> https://gitlab.com/qemu-project/qemu/-/issues/2213 for a bug that likely
> cannot be fixed without breaking live migration with old machine types,
> or https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg04516.html or
> commit ea985d235b86). So instead of going through the process of manually
> deprecating old machine types again and again, let's rather add an entry
> that can stay, which declares that machine types older than 6 years are
> considered as deprecated automatically. Six years should be sufficient to
> support the release cycles of most Linux distributions.

Reading this again, I think we're mixing two concepts here.

With this 6 year cut off, we're declaring the actual *removal* date,
not the deprecation date.

A deprecation is something that happens prior to removal normally,
to give people a warning of /future/ removal, as a suggestion
that they stop using it.

If we never set the 'deprecation_reason' on a machine type, then
unless someone reads this doc, they'll never realize they are on
a deprecated machine.

When it comes to machine types, I see deprecation as a way to tell
people they should not deploy a /new/ VM on a machine type, only
use it for back compat (incoming migration / restore from saved
image) with existing deployed VMs.

If we delete a machine on the 6 year anniversary, then users
don't want to be deploying /new/ VMs using that on the
5 year anniversary as it only gives a 1 year upgrade window.

So how long far back do we consider it reasonable for a user
to deploy a /new/ VM on an old machine type ? 1 year, 2 years,
3 years ?


How about picking the half way point ?  3 years ?

ie, set deprecation_reason for any machine that is 3 years
old, but declare that our deprecation cycle lasts for
3 years, instead of the normal 1 year, when applied to
machine types.

This would give a strong hint that users should get off the
old machine type, several years before its finally deleted.

> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/about/deprecated.rst | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 6d595de3b6..fe69e2d44c 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -220,6 +220,17 @@ is a chance the code will bitrot without anyone noticing.
>  System emulator machines
>  ------------------------
>  
> +Versioned machine types older than 6 years
> +''''''''''''''''''''''''''''''''''''''''''
> +
> +Starting with the release of QEMU 10.0, versioned machine types older than
> +6 years will automatically be considered as deprecated and might be due to
> +removal without furthor notice. For example, this affects machine types like
> +pc-i440fx-X.Y, pc-q35-X.Y, pseries-X.Y, s390-ccw-virtio-X.Y or virt-X.Y where
> +X is the major number and Y is the minor number of the old QEMU version.
> +If you are still using machine types from QEMU versions older than 6 years,
> +please update your setting to use a newer versioned machine type instead.
> +
>  Arm ``virt`` machine ``dtb-kaslr-seed`` property (since 7.1)
>  ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>  
> -- 
> 2.44.0
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
